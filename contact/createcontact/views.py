from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import Contact
from django.http import JsonResponse
from django.contrib.auth.models import User
import datetime
import schedule
import time
from background_task import background


@login_required
def showContact(request):
    contacts = Contact.objects.all()
    for i in contacts:
        if User.objects.filter(id = i.addedbyuserid).exists():
            i.addedbyusername = User.objects.filter(id = i.addedbyuserid)[0].username
        else:
            i.addedbyusername = ''
    return render(request, 'showcontacts.html', {'contacts': contacts})

@background(schedule=10)
def sendMailToAdminUser(fullname, sender_address = '', sender_pass = '', receiver_address = '', sendbyusername = ''):
    print('helo')
    sendEmail(fullname, sender_address = sender_address, sender_pass = sender_pass, receiver_address = receiver_address, sendbyusername = sendbyusername)

@background(schedule=20)
def sendMailToUser(fullname, sender_address = '', sender_pass = '', receiver_address = '', sendbyusername = ''):
    print('helooo')
    sendEmail(fullname, sender_address = sender_address, sender_pass = sender_pass, receiver_address = receiver_address, sendbyusername = sendbyusername)


@login_required
def saveContact(request):
    if request.method == 'POST':
        obj = Contact()
        obj.fullname = request.POST.get('fullname', '').strip()
        obj.mobileno = request.POST.get('mobileno', '').strip()
        obj.emailid = request.POST.get('emailid', '').strip()
        obj.address = request.POST.get('address', '').strip()
        obj.addedbyuserid = request.user.id
        obj.addedon = datetime.datetime.now()
        obj.save()

        adminemailid = ''
        if User.objects.filter(is_superuser=1).exists():
            adminemailid = User.objects.filter(is_superuser=1)[0].email

        
        sendMailToAdminUser(obj.fullname, sender_address = 'gursevaksingh11801@gmail.com', sender_pass = '9988185813', receiver_address = adminemailid, sendbyusername = request.user.username)
        sendMailToUser(obj.fullname, sender_address = 'gursevaksingh11801@gmail.com', sender_pass = '9988185813', receiver_address = request.user.email, sendbyusername = '')
        
        if request.is_ajax():
            return JsonResponse({'saved': True})
        else:
            return redirect("showContact")
    else:
        return render(request, 'savecontact.html')

def sendEmail(fullname, sender_address = '', sender_pass = '', receiver_address = '', sendbyusername = ''):
    import smtplib
    from email.mime.multipart import MIMEMultipart
    from email.mime.text import MIMEText
    if sendbyusername != '':
        mail_content = "Hello, new contact added successfully by "+sendbyusername+". Thank You"
    else:
        mail_content = "Hello, new contact added successfully . Thank You"
    

    #Setup the MIME
    message = MIMEMultipart()
    message['From'] = sender_address
    message['To'] = receiver_address
    message['Subject'] = fullname+' added successfully.'   #The subject line
    #The body and the attachments for the mail
    message.attach(MIMEText(mail_content, 'plain'))
    #Create SMTP session for sending the mail
    session = smtplib.SMTP('smtp.gmail.com', 587) #use gmail with port
    session.starttls() #enable security
    session.login(sender_address, sender_pass) #login with mail_id and password
    text = message.as_string()
    session.sendmail(sender_address, receiver_address, text)
    session.quit()
    print('Mail Sent')






