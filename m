Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7268F3D7EB4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 21:51:19 +0200 (CEST)
Received: from localhost ([::1]:53496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8T6i-0007ze-Ca
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 15:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8T5W-00079T-1j
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 15:50:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8T5T-0003k7-VY
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 15:50:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id g15so16553685wrd.3
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 12:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNR/QKhyRALfJ6KC37o8U+8AYpJeiYxeiiRqsrWsbuM=;
 b=i0ahNlK1rp6x42mm4htGw8krDtUxAzmW3tjagFyVtmp6cEvoqm9ADG1KEEVwvu03Uu
 sZSHjtAQBBdBtMg1WUaT5irz4n+yzL9hbn6wPUFhxmgnr5N/bwrrgtxMKStxnY+Bri4w
 OHYJD6DAQO//3T+novH/+5p++nj+bfpqBn/4AR1cHmwroislGiTlO2PoC3Xl3+2KJXW2
 E9oc+e78PDrLU5jZumHwPqIaCwO3gqQJcvXWPJj6Am9A5kSsCnLK7W9WyI0zIIue2J7z
 9PDpKsKB8e4MxZ3VSdNa5k0WcEvZ+Hcqq3sLTgOoEJBXYtQYc1c0wjVXjmZ8OjbE/xjw
 wNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNR/QKhyRALfJ6KC37o8U+8AYpJeiYxeiiRqsrWsbuM=;
 b=MxgbVaP1ieEqBvlKf5W4JG4f7ztJK3VigEmcxwfMtUUdYDaKYNbmuqYFu9IbXReUGR
 SNvxDJ5J68d4F4Qgd4KKlRR6L6gwadtE4klJhZmvDwNpWGLwGyfckzL+jed0RfqXiCod
 F+G4M0CgX0bnjgBJq3Rr+Tet5zlkDDgWJ8lNw7PkSgNYF1Eipc4/b/mhSzSuCNTMPlwi
 OKtszOPC6F0noGRcJVUb+dALGrsovS+EXocaXI0PJcTIr1CxJ5uhWHEM6ouCO5BY8dBY
 EnqeJEDoAB3roN3NPgzWKgDP1D94dKHALW8RvtwZKcLRh2l8WvW/BmUDu11FG329gPz5
 WNZg==
X-Gm-Message-State: AOAM530V5L3y0P/12m1PAmA3YnVn7t9Zyp4oiDp0LpXRtAAIFoxR7fzf
 lXeqZr393Z9Vw50NxEujspUsHNFmqpmUdA==
X-Google-Smtp-Source: ABdhPJw5D3BRYcOq8j3GDO345/dfsOI6rbW1uaDQMDhhrgVo7t0CHMG9Min+CWBgZfiHSlclnQ4k9Q==
X-Received: by 2002:adf:e507:: with SMTP id j7mr8372022wrm.113.1627415397899; 
 Tue, 27 Jul 2021 12:49:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n8sm4217404wrx.46.2021.07.27.12.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 12:49:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: Move bootindex.txt into system section and rstify
Date: Tue, 27 Jul 2021 20:49:55 +0100
Message-Id: <20210727194955.7764-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move bootindex.txt into the system section of the manual and turn it
into rST format.  To make the document make more sense in the context
of the system manual, expand the title and introductory paragraphs to
give more context.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


