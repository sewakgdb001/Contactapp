# Generated by Django 2.0.7 on 2020-10-25 16:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('createcontact', '0006_auto_20201025_0701'),
    ]

    operations = [
        migrations.AddField(
            model_name='contact',
            name='addedbyuserid',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='contact',
            name='addedon',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]