Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E082BB152
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:22:41 +0100 (CET)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgA7M-0001cf-SE
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kgA3c-0005By-RB
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:18:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kgA3X-00004s-T9
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605892722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=qr00PW4Px2rkD13yZBH01Ib78X6WAQ0RlQESOnuqG9k=;
 b=bCMDJCjJUGie9dmoP/jNBrJSvsk2UI0NFFJk0Dv99VNX7HP/81OLkSf+nSAx/hMaJKLHvB
 65HyNO76habl+kaecGAT2ykyCqjAeOb2S31PuRrvkWIT9QP7b9DURTpFBfulEkMfgfejMH
 xM2zbMklu5jENmgzEsQ0OFnQ2K9MWjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-KarBI3PQPUyQ_Eggox3dzw-1; Fri, 20 Nov 2020 12:18:35 -0500
X-MC-Unique: KarBI3PQPUyQ_Eggox3dzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD465100A647;
 Fri, 20 Nov 2020 17:18:34 +0000 (UTC)
Received: from thuth.com (ovpn-112-135.ams2.redhat.com [10.36.112.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B96695D6D1;
 Fri, 20 Nov 2020 17:18:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/4] docs: Get rid of the weird _005f links in the man page
Date: Fri, 20 Nov 2020 18:18:25 +0100
Message-Id: <20201120171828.488611-2-thuth@redhat.com>
In-Reply-To: <20201120171828.488611-1-thuth@redhat.com>
References: <20201120171828.488611-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The man page does not contain all the chapters from the System Emulation
Users Guide, so some of the links that we've put into the qemu options
descriptions can not be resolved and thus the link names are used in the
man pages instead. These link names currently contain weird "_005f" letters
in the middle and just do not make any sense for the users. To avoid this
situation, replace the link names with more descriptive, natural text.

Message-Id: <20201116145341.91606-1-thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3
Buglink: https://bugs.launchpad.net/qemu/+bug/1453608
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/gdb.rst          |  2 +-
 docs/system/images.rst       |  2 +-
 docs/system/monitor.rst      |  2 +-
 docs/system/mux-chardev.rst  |  2 +-
 docs/system/usb.rst          |  6 +++---
 docs/system/vnc-security.rst |  2 +-
 qemu-options.hx              | 38 +++++++++++++++++++-----------------
 7 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index abda961e2b..72b1e68f4e 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -1,4 +1,4 @@
-.. _gdb_005fusage:
+.. _GDB usage:
 
 GDB usage
 ---------
diff --git a/docs/system/images.rst b/docs/system/images.rst
index ff26bf9587..3d9144e625 100644
--- a/docs/system/images.rst
+++ b/docs/system/images.rst
@@ -1,4 +1,4 @@
-.. _disk_005fimages:
+.. _disk images:
 
 Disk Images
 -----------
diff --git a/docs/system/monitor.rst b/docs/system/monitor.rst
index 0bcd5da216..ff5c434612 100644
--- a/docs/system/monitor.rst
+++ b/docs/system/monitor.rst
@@ -1,4 +1,4 @@
-.. _pcsys_005fmonitor:
+.. _QEMU monitor:
 
 QEMU Monitor
 ------------
diff --git a/docs/system/mux-chardev.rst b/docs/system/mux-chardev.rst
index 413a6b3446..05064068aa 100644
--- a/docs/system/mux-chardev.rst
+++ b/docs/system/mux-chardev.rst
@@ -1,4 +1,4 @@
-.. _mux_005fkeys:
+.. _keys in the character backend multiplexer:
 
 Keys in the character backend multiplexer
 -----------------------------------------
diff --git a/docs/system/usb.rst b/docs/system/usb.rst
index 9a2f1927c4..eeab78dcfb 100644
--- a/docs/system/usb.rst
+++ b/docs/system/usb.rst
@@ -8,7 +8,7 @@ plug virtual USB devices or real host USB devices (only works with
 certain host operating systems). QEMU will automatically create and
 connect virtual USB hubs as necessary to connect multiple USB devices.
 
-.. _usb_005fdevices:
+.. _Connecting USB devices:
 
 Connecting USB devices
 ~~~~~~~~~~~~~~~~~~~~~~
@@ -27,8 +27,8 @@ option or the ``device_add`` monitor command. Available devices are:
    activated.
 
 ``usb-storage,drive=drive_id``
-   Mass storage device backed by drive_id (see
-   :ref:`disk_005fimages`)
+   Mass storage device backed by drive_id (see the :ref:`disk images`
+   chapter in the System Emulation Users Guide)
 
 ``usb-uas``
    USB attached SCSI device, see
diff --git a/docs/system/vnc-security.rst b/docs/system/vnc-security.rst
index b237b07330..558e4faffc 100644
--- a/docs/system/vnc-security.rst
+++ b/docs/system/vnc-security.rst
@@ -1,4 +1,4 @@
-.. _vnc_005fsecurity:
+.. _VNC security:
 
 VNC security
 ------------
diff --git a/qemu-options.hx b/qemu-options.hx
index 2c83390504..104632ea34 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -913,8 +913,8 @@ SRST
 ``-fda file``
   \
 ``-fdb file``
-    Use file as floppy disk 0/1 image (see
-    :ref:`disk_005fimages`).
+    Use file as floppy disk 0/1 image (see the :ref:`disk images` chapter in
+    the System Emulation Users Guide).
 ERST
 
 DEF("hda", HAS_ARG, QEMU_OPTION_hda,
@@ -931,8 +931,8 @@ SRST
 ``-hdc file``
   \ 
 ``-hdd file``
-    Use file as hard disk 0, 1, 2 or 3 image (see
-    :ref:`disk_005fimages`).
+    Use file as hard disk 0, 1, 2 or 3 image (see the :ref:`disk images`
+    chapter in the System Emulation Users Guide).
 ERST
 
 DEF("cdrom", HAS_ARG, QEMU_OPTION_cdrom,
@@ -1189,9 +1189,9 @@ SRST
     In addition, it knows the following options:
 
     ``file=file``
-        This option defines which disk image (see
-        :ref:`disk_005fimages`) to use with this drive. If
-        the filename contains comma, you must double it (for instance,
+        This option defines which disk image (see the :ref:`disk images`
+        chapter in the System Emulation Users Guide) to use with this drive.
+        If the filename contains comma, you must double it (for instance,
         "file=my,,file" to use file "my,file").
 
         Special files such as iSCSI devices can be specified using
@@ -1400,8 +1400,8 @@ SRST
 ``-snapshot``
     Write to temporary files instead of disk image files. In this case,
     the raw disk image you use is not written back. You can however
-    force the write back by pressing C-a s (see
-    :ref:`disk_005fimages`).
+    force the write back by pressing C-a s (see the :ref:`disk images`
+    chapter in the System Emulation Users Guide).
 ERST
 
 DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,
@@ -1687,8 +1687,8 @@ DEF("usbdevice", HAS_ARG, QEMU_OPTION_usbdevice,
 SRST
 ``-usbdevice devname``
     Add the USB device devname. Note that this option is deprecated,
-    please use ``-device usb-...`` instead. See
-    :ref:`usb_005fdevices`.
+    please use ``-device usb-...`` instead. See the chapter about
+    :ref:`Connecting USB devices` in the System Emulation Users Guide.
 
     ``mouse``
         Virtual Mouse. This will override the PS/2 mouse emulation when
@@ -2110,7 +2110,7 @@ SRST
         connections.
 
         The password must be set separately using the ``set_password``
-        command in the :ref:`pcsys_005fmonitor`. The
+        command in the :ref:`QEMU monitor`. The
         syntax to change your password is:
         ``set_password <protocol> <password>`` where <protocol> could be
         either "vnc" or "spice".
@@ -2155,8 +2155,8 @@ SRST
         and 'x509' settings to enable use of SSL and server
         certificates. This ensures a data encryption preventing
         compromise of authentication credentials. See the
-        :ref:`vnc_005fsecurity` section for details on
-        using SASL authentication.
+        :ref:`VNC security` section in the System Emulation Users Guide
+        for details on using SASL authentication.
 
     ``sasl-authz=ID``
         Provides the ID of the QAuthZ authorization object against which
@@ -3082,7 +3082,9 @@ The general form of a character device option is:
         -serial chardev:char1
 
     When you're using a multiplexed character device, some escape
-    sequences are interpreted in the input. See :ref:`mux_005fkeys`.
+    sequences are interpreted in the input. See the chapter about
+    :ref:`keys in the character backend multiplexer` in the
+    System Emulation Users Guide for more details.
 
     Note that some other command line options may implicitly create
     multiplexed character backends; for instance ``-serial mon:stdio``
@@ -3755,8 +3757,8 @@ DEF("gdb", HAS_ARG, QEMU_OPTION_gdb, \
     QEMU_ARCH_ALL)
 SRST
 ``-gdb dev``
-    Accept a gdb connection on device dev (see
-    :ref:`gdb_005fusage`). Note that this option does not pause QEMU
+    Accept a gdb connection on device dev (see the :ref:`GDB usage` chapter
+    in the System Emulation Users Guide). Note that this option does not pause QEMU
     execution -- if you want QEMU to not start the guest until you
     connect with gdb and issue a ``continue`` command, you will need to
     also pass the ``-S`` option to QEMU.
@@ -3781,7 +3783,7 @@ DEF("s", 0, QEMU_OPTION_s, \
 SRST
 ``-s``
     Shorthand for -gdb tcp::1234, i.e. open a gdbserver on TCP port 1234
-    (see :ref:`gdb_005fusage`).
+    (see the :ref:`GDB usage` chapter in the System Emulation Users Guide).
 ERST
 
 DEF("d", HAS_ARG, QEMU_OPTION_d, \
-- 
2.18.4


