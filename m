Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CB73DA397
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:59:55 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95di-0005Kr-Rg
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95VI-00045n-D1
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95VF-0001ez-9w
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627563068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXxVVSgUWJ7PPyaosmTYGPkWrxR46Yjtb32FrGm6NTY=;
 b=ePDnwMMBr+olqwxw/hYjVPQHADIilKI7FtlXbY/K9/GrHZq3nxDVcgIcZ9sUl3DOonqyf5
 3/vK4GfnyciNvVTaiB+QCWZKYkDzmBQgcQRgpHvv0gjio4PaFmI/TZEsy1mQol+Rl6QdH6
 uWf6/p+LNK+KoqKsSu7CsgUr4QCGYcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-fh5xfJZSPbau58bJfvhDGA-1; Thu, 29 Jul 2021 08:51:05 -0400
X-MC-Unique: fh5xfJZSPbau58bJfvhDGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE691190A7A1;
 Thu, 29 Jul 2021 12:51:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 376845D6B1;
 Thu, 29 Jul 2021 12:51:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B8EEF180093E; Thu, 29 Jul 2021 14:50:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] docs: Incorporate information in usb-storage.txt into rST
 manual
Date: Thu, 29 Jul 2021 14:50:41 +0200
Message-Id: <20210729125044.3531457-5-kraxel@redhat.com>
In-Reply-To: <20210729125044.3531457-1-kraxel@redhat.com>
References: <20210729125044.3531457-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

We already have a section on USB in the rST manual; fold
the information in docs/usb-storage.txt into it.

We add 'format=raw' to the various -drive options in the code
examples, because QEMU will print warnings these days if you
omit it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210728141457.14825-2-peter.maydell@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/usb-storage.txt        | 59 -------------------------------------
 MAINTAINERS                 |  2 +-
 docs/system/devices/usb.rst | 57 ++++++++++++++++++++++++++++++-----
 3 files changed, 51 insertions(+), 67 deletions(-)
 delete mode 100644 docs/usb-storage.txt

diff --git a/docs/usb-storage.txt b/docs/usb-storage.txt
deleted file mode 100644
index 551af6f88bb1..000000000000
--- a/docs/usb-storage.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-
-qemu usb storage emulation
---------------------------
-
-QEMU has three devices for usb storage emulation.
-
-Number one emulates the classic bulk-only transport protocol which is
-used by 99% of the usb sticks on the market today and is called
-"usb-storage".  Usage (hooking up to xhci, other host controllers work
-too):
-
-  qemu ${other_vm_args}                                \
-       -drive if=none,id=stick,file=/path/to/file.img  \
-       -device nec-usb-xhci,id=xhci                    \
-       -device usb-storage,bus=xhci.0,drive=stick
-
-
-Number two is the newer usb attached scsi transport.  This one doesn't
-automagically create a scsi disk, so you have to explicitly attach one
-manually.  Multiple logical units are supported.  Here is an example
-with tree logical units:
-
-  qemu ${other_vm_args}                                                \
-       -drive if=none,id=uas-disk1,file=/path/to/file1.img             \
-       -drive if=none,id=uas-disk2,file=/path/to/file2.img             \
-       -drive if=none,id=uas-cdrom,media=cdrom,file=/path/to/image.iso \
-       -device nec-usb-xhci,id=xhci                                    \
-       -device usb-uas,id=uas,bus=xhci.0                               \
-       -device scsi-hd,bus=uas.0,scsi-id=0,lun=0,drive=uas-disk1       \
-       -device scsi-hd,bus=uas.0,scsi-id=0,lun=1,drive=uas-disk2       \
-       -device scsi-cd,bus=uas.0,scsi-id=0,lun=5,drive=uas-cdrom
-
-
-Number three emulates the classic bulk-only transport protocol too.
-It's called "usb-bot".  It shares most code with "usb-storage", and
-the guest will not be able to see the difference.  The qemu command
-line interface is similar to usb-uas though, i.e. no automatic scsi
-disk creation.  It also features support for up to 16 LUNs.  The LUN
-numbers must be continuous, i.e. for three devices you must use 0+1+2.
-The 0+1+5 numbering from the "usb-uas" example isn't going to work
-with "usb-bot".
-
-Starting with qemu version 2.7 usb-bot and usb-uas devices can be
-hotplugged.  In the hotplug case they are added with "attached =
-false" so the guest will not see the device until the "attached"
-property is explicitly set to true.  That allows to attach one or more
-scsi devices before making the device visible to the guest, i.e. the
-workflow looks like this:
-
-   (1) device-add usb-bot,id=foo
-   (2) device-add scsi-{hd,cd},bus=foo.0,lun=0
-   (2b) optionally add more devices (luns 1 ... 15).
-   (3) scripts/qmp/qom-set foo.attached = true
-
-enjoy,
-  Gerd
-
---
-Gerd Hoffmann <kraxel@redhat.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 42ac45c3e502..b1f8e82befc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1836,7 +1836,7 @@ S: Maintained
 F: hw/usb/*
 F: stubs/usb-dev-stub.c
 F: tests/qtest/usb-*-test.c
-F: docs/usb2.txt
+F: docs/system/devices/usb.rst
 F: docs/usb-storage.txt
 F: include/hw/usb.h
 F: include/hw/usb/
diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index eeab78dcfbee..7da142ecbb9f 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -28,17 +28,46 @@ option or the ``device_add`` monitor command. Available devices are:
 
 ``usb-storage,drive=drive_id``
    Mass storage device backed by drive_id (see the :ref:`disk images`
-   chapter in the System Emulation Users Guide)
+   chapter in the System Emulation Users Guide). This is the classic
+   bulk-only transport protocol used by 99% of USB sticks. This
+   example shows it connected to an XHCI USB controller and with
+   a drive backed by a raw format disk image:
+
+   .. parsed-literal::
+
+       |qemu_system| [...]                                   \\
+        -drive if=none,id=stick,format=raw,file=/path/to/file.img \\
+        -device nec-usb-xhci,id=xhci                              \\
+        -device usb-storage,bus=xhci.0,drive=stick
 
 ``usb-uas``
-   USB attached SCSI device, see
-   `usb-storage.txt <https://git.qemu.org/?p=qemu.git;a=blob_plain;f=docs/usb-storage.txt>`__
-   for details
+   USB attached SCSI device. This does not create a SCSI disk, so
+   you need to explicitly create a ``scsi-hd`` or ``scsi-cd`` device
+   on the command line, as well as using the ``-drive`` option to
+   specify what those disks are backed by. One ``usb-uas`` device can
+   handle multiple logical units (disks). This example creates three
+   logical units: two disks and one cdrom drive:
+
+   .. parsed-literal::
+
+      |qemu_system| [...]                                         \\
+       -drive if=none,id=uas-disk1,format=raw,file=/path/to/file1.img  \\
+       -drive if=none,id=uas-disk2,format=raw,file=/path/to/file2.img  \\
+       -drive if=none,id=uas-cdrom,media=cdrom,format=raw,file=/path/to/image.iso \\
+       -device nec-usb-xhci,id=xhci                                    \\
+       -device usb-uas,id=uas,bus=xhci.0                               \\
+       -device scsi-hd,bus=uas.0,scsi-id=0,lun=0,drive=uas-disk1       \\
+       -device scsi-hd,bus=uas.0,scsi-id=0,lun=1,drive=uas-disk2       \\
+       -device scsi-cd,bus=uas.0,scsi-id=0,lun=5,drive=uas-cdrom
 
 ``usb-bot``
-   Bulk-only transport storage device, see
-   `usb-storage.txt <https://git.qemu.org/?p=qemu.git;a=blob_plain;f=docs/usb-storage.txt>`__
-   for details here, too
+   Bulk-only transport storage device. This presents the guest with the
+   same USB bulk-only transport protocol interface as ``usb-storage``, but
+   the QEMU command line option works like ``usb-uas`` and does not
+   automatically create SCSI disks for you. ``usb-bot`` supports up to
+   16 LUNs. Unlike ``usb-uas``, the LUN numbers must be continuous,
+   i.e. for three devices you must use 0+1+2. The 0+1+5 numbering from the
+   ``usb-uas`` example above won't work with ``usb-bot``.
 
 ``usb-mtp,rootdir=dir``
    Media transfer protocol device, using dir as root of the file tree
@@ -84,6 +113,20 @@ option or the ``device_add`` monitor command. Available devices are:
 ``u2f-{emulated,passthru}``
    Universal Second Factor device
 
+Hotplugging USB storage
+~~~~~~~~~~~~~~~~~~~~~~~
+
+The ``usb-bot`` and ``usb-uas`` devices can be hotplugged.  In the hotplug
+case they are added with ``attached = false`` so the guest will not see
+the device until the ``attached`` property is explicitly set to true.
+That allows you to attach one or more scsi devices before making the
+device visible to the guest. The workflow looks like this:
+
+#. ``device-add usb-bot,id=foo``
+#. ``device-add scsi-{hd,cd},bus=foo.0,lun=0``
+#. optionally add more devices (luns 1 ... 15)
+#. ``scripts/qmp/qom-set foo.attached = true``
+
 .. _host_005fusb_005fdevices:
 
 Using host USB devices on a Linux host
-- 
2.31.1


