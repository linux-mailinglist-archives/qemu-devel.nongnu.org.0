Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164723DD523
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:05:31 +0200 (CEST)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWhG-00039D-2F
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaW-0000tx-1E
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:32 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaS-0003dX-Lz
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:31 -0400
Received: by mail-wr1-x432.google.com with SMTP id h14so21135637wrx.10
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2q93MWkGScylGxqZKXmfrlqZp6+ohhIWphT95erG1oo=;
 b=SWi6uiUyuTA1+8XcFjIs7hOiRH9WGaZJUOsIuAmWGcQlpXbJljkxDclNGdbkJ6Wju1
 AQvQ0obdzLlM2GHNPtOpUAa1x6ysWSDu67e629MWhmnhoqKY/5wMGFqhNY+DjJAFXdxg
 LXCweJkOarJO4isGL/zRs8qc0UrWrArxFAizq/7e91ORHPT/Dd9pLwWac/3gBjJcUVvK
 yUPr/bRAfK/mrVrxy/dRTZU/Sw42bV/pIkT3J71HSI5Gu2NzVFaAHwpIZOu6d8rkNXqr
 ZNJlieLyxOy4Ehje4jjZwYjA4oGzg3cnfGUcaqjZfUWUGjZQCIhc/5F5TvRbs+D0+HAM
 6XZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2q93MWkGScylGxqZKXmfrlqZp6+ohhIWphT95erG1oo=;
 b=ljXUWLi9iIbpHeEliDomd17OoyGwn5GqUXdYZjk5KtPgU3HV2tgW4SrCSCken/8hYa
 nEa7X/S0PDgpOopUPsvpoAAQ41Y/H0L5Kxtl8SGXMPdsocmtvaFxNqss10rsgReGVQY3
 EZYE00Bvc/bplY7klsN0Nwts2dqoahTEs3NwlJbyNiz/V9x9+rBZm1EpZ0XEVHbd6Mzu
 weHdbFunpSF2OwGdZb9gsy8wCXQyTujig7Z/qAeYAlfcb28PwZ6QX4ATXYhwhA5lPzmI
 aKdxRj4muxm3o2kchXdGh8r8JV91DscI4flcMaGM/oTZFoORqIV+aRlGHVEhk/WO1KXa
 McQw==
X-Gm-Message-State: AOAM532DLBNfLvd3vW0wbSVO6TUbDBigt1kBEnUpI3BYCnV/6ZrRfREr
 7D/CM3bIVS10U5sF42UaKNFO3lZyfI50LA==
X-Google-Smtp-Source: ABdhPJx7KCfI3gUta57uQZtFaxcFWWxOdxOt3i0+fDIzf6hmisl5h6OuneWls3D/pozz0yL4hVqnog==
X-Received: by 2002:adf:c549:: with SMTP id s9mr17318944wrf.344.1627905507306; 
 Mon, 02 Aug 2021 04:58:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] docs: Move bootindex.txt into system section and rstify
Date: Mon,  2 Aug 2021 12:58:09 +0100
Message-Id: <20210802115812.10731-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move bootindex.txt into the system section of the manual and turn it
into rST format.  To make the document make more sense in the context
of the system manual, expand the title and introductory paragraphs to
give more context.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20210727194955.7764-1-peter.maydell@linaro.org
---
 docs/bootindex.txt        | 52 ---------------------------
 docs/system/bootindex.rst | 76 +++++++++++++++++++++++++++++++++++++++
 docs/system/index.rst     |  1 +
 3 files changed, 77 insertions(+), 52 deletions(-)
 delete mode 100644 docs/bootindex.txt
 create mode 100644 docs/system/bootindex.rst

diff --git a/docs/bootindex.txt b/docs/bootindex.txt
deleted file mode 100644
index 6937862ba0d..00000000000
--- a/docs/bootindex.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-= Bootindex property =
-
-Block and net devices have bootindex property. This property is used to
-determine the order in which firmware will consider devices for booting
-the guest OS. If the bootindex property is not set for a device, it gets
-lowest boot priority. There is no particular order in which devices with
-unset bootindex property will be considered for booting, but they will
-still be bootable.
-
-== Example ==
-
-Let's assume we have a QEMU machine with two NICs (virtio, e1000) and two
-disks (IDE, virtio):
-
-qemu -drive file=disk1.img,if=none,id=disk1
-     -device ide-hd,drive=disk1,bootindex=4
-     -drive file=disk2.img,if=none,id=disk2
-     -device virtio-blk-pci,drive=disk2,bootindex=3
-     -netdev type=user,id=net0 -device virtio-net-pci,netdev=net0,bootindex=2
-     -netdev type=user,id=net1 -device e1000,netdev=net1,bootindex=1
-
-Given the command above, firmware should try to boot from the e1000 NIC
-first.  If this fails, it should try the virtio NIC next; if this fails
-too, it should try the virtio disk, and then the IDE disk.
-
-== Limitations ==
-
-1. Some firmware has limitations on which devices can be considered for
-booting.  For instance, the PC BIOS boot specification allows only one
-disk to be bootable.  If boot from disk fails for some reason, the BIOS
-won't retry booting from other disk.  It can still try to boot from
-floppy or net, though.
-
-2. Sometimes, firmware cannot map the device path QEMU wants firmware to
-boot from to a boot method.  It doesn't happen for devices the firmware
-can natively boot from, but if firmware relies on an option ROM for
-booting, and the same option ROM is used for booting from more then one
-device, the firmware may not be able to ask the option ROM to boot from
-a particular device reliably.  For instance with the PC BIOS, if a SCSI HBA
-has three bootable devices target1, target3, target5 connected to it,
-the option ROM will have a boot method for each of them, but it is not
-possible to map from boot method back to a specific target.  This is a
-shortcoming of the PC BIOS boot specification.
-
-== Mixing bootindex and boot order parameters ==
-
-Note that it does not make sense to use the bootindex property together
-with the "-boot order=..." (or "-boot once=...") parameter. The guest
-firmware implementations normally either support the one or the other,
-but not both parameters at the same time. Mixing them will result in
-undefined behavior, and thus the guest firmware will likely not boot
-from the expected devices.
diff --git a/docs/system/bootindex.rst b/docs/system/bootindex.rst
new file mode 100644
index 00000000000..8b057f812f2
--- /dev/null
+++ b/docs/system/bootindex.rst
@@ -0,0 +1,76 @@
+Managing device boot order with bootindex properties
+====================================================
+
+QEMU can tell QEMU-aware guest firmware (like the x86 PC BIOS)
+which order it should look for a bootable OS on which devices.
+A simple way to set this order is to use the ``-boot order=`` option,
+but you can also do this more flexibly, by setting a ``bootindex``
+property on the individual block or net devices you specify
+on the QEMU command line.
+
+The ``bootindex`` properties are used to determine the order in which
+firmware will consider devices for booting the guest OS. If the
+``bootindex`` property is not set for a device, it gets the lowest
+boot priority. There is no particular order in which devices with no
+``bootindex`` property set will be considered for booting, but they
+will still be bootable.
+
+Some guest machine types (for instance the s390x machines) do
+not support ``-boot order=``; on those machines you must always
+use ``bootindex`` properties.
+
+There is no way to set a ``bootindex`` property if you are using
+a short-form option like ``-hda`` or ``-cdrom``, so to use
+``bootindex`` properties you will need to expand out those options
+into long-form ``-drive`` and ``-device`` option pairs.
+
+Example
+-------
+
+Let's assume we have a QEMU machine with two NICs (virtio, e1000) and two
+disks (IDE, virtio):
+
+.. parsed-literal::
+
+  |qemu_system| -drive file=disk1.img,if=none,id=disk1 \\
+                -device ide-hd,drive=disk1,bootindex=4 \\
+                -drive file=disk2.img,if=none,id=disk2 \\
+                -device virtio-blk-pci,drive=disk2,bootindex=3 \\
+                -netdev type=user,id=net0 \\
+                -device virtio-net-pci,netdev=net0,bootindex=2 \\
+                -netdev type=user,id=net1 \\
+                -device e1000,netdev=net1,bootindex=1
+
+Given the command above, firmware should try to boot from the e1000 NIC
+first.  If this fails, it should try the virtio NIC next; if this fails
+too, it should try the virtio disk, and then the IDE disk.
+
+Limitations
+-----------
+
+Some firmware has limitations on which devices can be considered for
+booting.  For instance, the PC BIOS boot specification allows only one
+disk to be bootable.  If boot from disk fails for some reason, the BIOS
+won't retry booting from other disk.  It can still try to boot from
+floppy or net, though.
+
+Sometimes, firmware cannot map the device path QEMU wants firmware to
+boot from to a boot method.  It doesn't happen for devices the firmware
+can natively boot from, but if firmware relies on an option ROM for
+booting, and the same option ROM is used for booting from more then one
+device, the firmware may not be able to ask the option ROM to boot from
+a particular device reliably.  For instance with the PC BIOS, if a SCSI HBA
+has three bootable devices target1, target3, target5 connected to it,
+the option ROM will have a boot method for each of them, but it is not
+possible to map from boot method back to a specific target.  This is a
+shortcoming of the PC BIOS boot specification.
+
+Mixing bootindex and boot order parameters
+------------------------------------------
+
+Note that it does not make sense to use the bootindex property together
+with the ``-boot order=...`` (or ``-boot once=...``) parameter. The guest
+firmware implementations normally either support the one or the other,
+but not both parameters at the same time. Mixing them will result in
+undefined behavior, and thus the guest firmware will likely not boot
+from the expected devices.
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 64a424ae99b..650409d1566 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -26,6 +26,7 @@ or Hypervisor.Framework.
    authz
    gdb
    managed-startup
+   bootindex
    cpu-hotplug
    pr-manager
    targets
-- 
2.20.1


