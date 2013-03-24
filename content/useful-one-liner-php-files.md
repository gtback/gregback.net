Title: Useful One-Line PHP files
Date: 2010-05-14 17:37
Author: Greg Back
Category: Programming
Tags: php

Here are a couple useful PHP commands that you can run on your server to
get useful information.

This one gives basic information about the PHP installation, which can
be used for troubleshooting or just verifying that PHP is running.

    :::php
    <?php phpinfo(); ?>

This one tells you the name of the web server user, which can be used to
verify file permissions on particular files or directories.

    :::php
    <?php echo `whoami`; ?>

Hope this is useful!
