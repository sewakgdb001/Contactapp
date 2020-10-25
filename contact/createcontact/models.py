from django.db import models

class Contact(models.Model):
    id = models.AutoField(primary_key=True)
    fullname = models.CharField(max_length=250, blank=True, null=True)
    mobileno = models.CharField(max_length=15, blank=True, null=True)
    emailid = models.CharField(max_length=50, blank=True, null=True)
    address = models.CharField(max_length=500, blank=True, null=True)
    addedbyuserid = models.IntegerField(blank=True, null=True)
    addedon = models.DateTimeField(blank=True, null=True)
    class Meta:
        managed = True
        db_table = 'contact'
