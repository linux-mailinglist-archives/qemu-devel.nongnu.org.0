Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2FF3D903D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 16:19:15 +0200 (CEST)
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8kOw-0001xz-Fh
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 10:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kKw-0004O3-38
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:15:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:44004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kKt-0007TR-KR
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:15:05 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so1799561wmq.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 07:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlUzvXZUcVgIl02AlwheprRJgr/gy9rUBBkrbVbr+0E=;
 b=ESXvtD8R2ECnxUpUG1fQiqDercKSUIUXnTs255iCmOCXFStAhy/1CephFhAHamqzLk
 48HCvsgZvFPw70+5selfRQ91ODU9uPgG8OeSvCcPEbODygky2nI8vpMO4eS6ECP4dFA9
 FzXaNvo4hs8swo5U2wVM3gbX9bxx7f+O6yNWWcreILFsiCkjjpIjzdTXRpvXaQuyOSoe
 vLYSjIWJM8S+ld6VHQYNRaqdEwJs48UEGDaulve84GURAdEvJ2OAHitgdXlbKfrQxXrF
 IkliXT0US/7oaYWXF1TQDPTLX6YwOk0IVbZUewT3xsDAnEdY9qvMo4lckkok4JB3tSZx
 Reqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SlUzvXZUcVgIl02AlwheprRJgr/gy9rUBBkrbVbr+0E=;
 b=WqmfNI3D9HWWJYpSIx4d4ElSfPXZWPlrpf2v/g9sJ31R65FEOJGlG7Die+EqxB5F74
 QBXMFjWscSmwBgDYZ8TFQxuwMJUysmZ7F0ufCJbQD8ffMHwDDchMH3op462VvP9gry/K
 5Qt808uM9qDz/YpcrBoXxS/kgX/roqXpOBAViDhrV0n9meLBgm2aeMAxUu7f8sVsOYJg
 JyYwqzX1yR0EWgPaWzZyNYvBquGtsSD38Lh6/lanlHBQDru+yMnLp+wK78pHbIj9hFbx
 RV70lksTDWpL6jdiZm4C62AuTMkWXE///+0AtFVORasbe3/iFdNpWDo6MtSEO0TZA6U3
 YiXA==
X-Gm-Message-State: AOAM531J5rnbNvE8oR2tCykHSNxgkqLcxBt8QKxFujA4xTy8gvRt7aDb
 aDGnoMbkPdzLZDscgMRcnwlxu4v60/Kq8Q==
X-Google-Smtp-Source: ABdhPJxNyyvkHWhotzkxZnfE4F0iy+bV7my8sx+f7stGgljF+6uKeASW69REG98oLVGINTsL7d3FSA==
X-Received: by 2002:a05:600c:2251:: with SMTP id
 a17mr2098108wmm.189.1627481701866; 
 Wed, 28 Jul 2021 07:15:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm7598247wrv.20.2021.07.28.07.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:15:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] docs: Incorporate information in usb-storage.txt into rST
 manual
Date: Wed, 28 Jul 2021 15:14:54 +0100
Message-Id: <20210728141457.14825-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728141457.14825-1-peter.maydell@linaro.org>
References: <20210728141457.14825-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a section on USB in the rST manual; fold
the information in docs/usb-storage.txt into it.

We add 'format=raw' to the various -drive options in the code
examples, because QEMU will print warnings these days if you
omit it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/devices/usb.rst | 57 ++++++++++++++++++++++++++++++-----
 docs/usb-storage.txt        | 59 -------------------------------------
 MAINTAINERS                 |  2 +-
 3 files changed, 51 insertions(+), 67 deletions(-)
 delete mode 100644 docs/usb-storage.txt

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index eeab78dcfbe..7da142ecbb9 100644
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
diff --git a/docs/usb-storage.txt b/docs/usb-storage.txt
deleted file mode 100644
index 551af6f88bb..00000000000
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
index ae9c2680134..bb82bebf59e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1840,7 +1840,7 @@ S: Maintained
 F: hw/usb/*
 F: stubs/usb-dev-stub.c
 F: tests/qtest/usb-*-test.c
-F: docs/usb2.txt
+F: docs/system/devices/usb.rst
 F: docs/usb-storage.txt
 F: include/hw/usb.h
 F: include/hw/usb/
-- 
2.20.1


