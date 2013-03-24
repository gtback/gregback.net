Title: Django Admin Media Files on Apache
Date: 2010-05-02 22:26
Author: Greg Back
Category: Programming
Tags: apache, django, python

I had quite a bit of fun trying to get Apache to serve the admin files
for my Django install. Here are the settings I used to finally get it to
work. Note that the site is in a subdirectory of my domain. I'm not
currently hosting any other media, so that will be another bridge to
cross in the future.

In the Django settings.py file:

    ::python
    ADMIN_MEDIA_PREFIX = '/genweb/admin/media/'

In the Virtual Host file:

    :::apacheconf
    Alias /genweb/admin/media /usr/share/python-support/python-django/django/contrib/admin/media
    <Location "/genweb/admin/media">
        SetHandler none
    </Location>

