Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD42EF55A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:02:52 +0100 (CET)
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuDz-0005Gs-B9
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtov-00055j-Lu
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:57 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtot-0002zo-31
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:57 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d26so9382672wrb.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AMnhlZyrvWZ5ic2poiBccv6AydLf+e+4fw82RlCGQo4=;
 b=wfEmKfrpDcPlngQpnoUCcn17F5dpYiMsxNxmSa8l5QhwlImRSCLAn8WN7b3aUVRMj0
 7kR0jGpiuqKlPDAx/PGP9UOPYKeK/pMr8ue/ZkWzqrfL9q0biUK/Jkz7mNxEBn/2iA+3
 gsY7YTRx8KsZLly+aJF8/k9ZSkEq0BxrZ/gVUwTE6YUbl7ML3aziXSpA8JcTD+wcDeHY
 ZE7WeyEWSu/3l7HfI2j8OEBW/ZLkOGN5IK0Vfhz6xdSe+G0FGN7ZKxZcesOQy1cp1vQC
 ZzD/1TSF0JMc9xpsTbUEkjCtqxdAIR0EwCnFhTHlXZLg6sJY5Rj/mClqXfYXl5EcvZNd
 NlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AMnhlZyrvWZ5ic2poiBccv6AydLf+e+4fw82RlCGQo4=;
 b=hjnUUkXemSwt31lzQDC7GtGq9IU1FyJBSvn7jWNEqxbSFW+zvOXtNSa44cKLrnaS8n
 N8/hiqsKN0xfJNAjbPrPlnO9g4u1P7u/U5V5lbr5JI7JyYdUmccWpzKjPOJe/oawEmwB
 HudrgN7VhLO70DkwbHKrjBjfLsQQ3QM4JdtOCK9BLHZHFk1P9KG53bss968KUu5CZyLh
 GrVdk+AqbOV6/bXg1lff4B953UO2pkWxqcc0Uc6/xHOipESS4aZGiE+t/5cElsAcWQyY
 qiP6SqsRDOCkGWQuj/7Vw++uvioRXEPPqkKUeYRGWUU6UZ1lPjYejMi63NRdFF9mVfGw
 cYCQ==
X-Gm-Message-State: AOAM530PpjSba19jcqTucOjsR9rimNsP665NvyAifWxXXNyJhCB+yVoD
 13ccYvBVyy0p4Xk7heeazbg6eMcUBI6DmA==
X-Google-Smtp-Source: ABdhPJx0JDy+EP5nwUNy08X3YVXhWC1/Bo1209u1Hq4ukk+WRNRlqjpQg3hSpQwBajs9lZh6VLWVAQ==
X-Received: by 2002:a5d:5049:: with SMTP id h9mr4378355wrt.404.1610120212903; 
 Fri, 08 Jan 2021 07:36:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/23] docs/system: arm: Add sabrelite board description
Date: Fri,  8 Jan 2021 15:36:21 +0000
Message-Id: <20210108153621.3868-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Bin Meng <bin.meng@windriver.com>

This adds the target guide for SABRE Lite board, and documents how
to boot a Linux kernel and U-Boot bootloader.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20210106063504.10841-5-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/sabrelite.rst | 119 ++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst    |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 docs/system/arm/sabrelite.rst

diff --git a/docs/system/arm/sabrelite.rst b/docs/system/arm/sabrelite.rst
new file mode 100644
index 00000000000..71713310e3a
--- /dev/null
+++ b/docs/system/arm/sabrelite.rst
@@ -0,0 +1,119 @@
+Boundary Devices SABRE Lite (``sabrelite``)
+===========================================
+
+Boundary Devices SABRE Lite i.MX6 Development Board is a low-cost development
+platform featuring the powerful Freescale / NXP Semiconductor's i.MX 6 Quad
+Applications Processor.
+
+Supported devices
+-----------------
+
+The SABRE Lite machine supports the following devices:
+
+ * Up to 4 Cortex A9 cores
+ * Generic Interrupt Controller
+ * 1 Clock Controller Module
+ * 1 System Reset Controller
+ * 5 UARTs
+ * 2 EPIC timers
+ * 1 GPT timer
+ * 2 Watchdog timers
+ * 1 FEC Ethernet controller
+ * 3 I2C controllers
+ * 7 GPIO controllers
+ * 4 SDHC storage controllers
+ * 4 USB 2.0 host controllers
+ * 5 ECSPI controllers
+ * 1 SST 25VF016B flash
+
+Please note above list is a complete superset the QEMU SABRE Lite machine can
+support. For a normal use case, a device tree blob that represents a real world
+SABRE Lite board, only exposes a subset of devices to the guest software.
+
+Boot options
+------------
+
+The SABRE Lite machine can start using the standard -kernel functionality
+for loading a Linux kernel, U-Boot bootloader or ELF executable.
+
+Running Linux kernel
+--------------------
+
+Linux mainline v5.10 release is tested at the time of writing. To build a Linux
+mainline kernel that can be booted by the SABRE Lite machine, simply configure
+the kernel using the imx_v6_v7_defconfig configuration:
+
+.. code-block:: bash
+
+  $ export ARCH=arm
+  $ export CROSS_COMPILE=arm-linux-gnueabihf-
+  $ make imx_v6_v7_defconfig
+  $ make
+
+To boot the newly built Linux kernel in QEMU with the SABRE Lite machine, use:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
+      -display none -serial null -serial stdio \
+      -kernel arch/arm/boot/zImage \
+      -dtb arch/arm/boot/dts/imx6q-sabrelite.dtb \
+      -initrd /path/to/rootfs.ext4 \
+      -append "root=/dev/ram"
+
+Running U-Boot
+--------------
+
+U-Boot mainline v2020.10 release is tested at the time of writing. To build a
+U-Boot mainline bootloader that can be booted by the SABRE Lite machine, use
+the mx6qsabrelite_defconfig with similar commands as described above for Linux:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=arm-linux-gnueabihf-
+  $ make mx6qsabrelite_defconfig
+
+Note we need to adjust settings by:
+
+.. code-block:: bash
+
+  $ make menuconfig
+
+then manually select the following configuration in U-Boot:
+
+  Device Tree Control > Provider of DTB for DT Control > Embedded DTB
+
+To start U-Boot using the SABRE Lite machine, provide the u-boot binary to
+the -kernel argument, along with an SD card image with rootfs:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
+      -display none -serial null -serial stdio \
+      -kernel u-boot
+
+The following example shows booting Linux kernel from dhcp, and uses the
+rootfs on an SD card. This requires some additional command line parameters
+for QEMU:
+
+.. code-block:: none
+
+  -nic user,tftp=/path/to/kernel/zImage \
+  -drive file=sdcard.img,id=rootfs -device sd-card,drive=rootfs
+
+The directory for the built-in TFTP server should also contain the device tree
+blob of the SABRE Lite board. The sample SD card image was populated with the
+root file system with one single partition. You may adjust the kernel "root="
+boot parameter accordingly.
+
+After U-Boot boots, type the following commands in the U-Boot command shell to
+boot the Linux kernel:
+
+.. code-block:: none
+
+  => setenv ethaddr 00:11:22:33:44:55
+  => setenv bootfile zImage
+  => dhcp
+  => tftpboot 14000000 imx6q-sabrelite.dtb
+  => setenv bootargs root=/dev/mmcblk3p1
+  => bootz 12000000 - 14000000
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index bde4b8e044e..edd013c7bbd 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -83,6 +83,7 @@ undocumented; you can get a complete list by running
    arm/versatile
    arm/vexpress
    arm/aspeed
+   arm/sabrelite
    arm/digic
    arm/musicpal
    arm/gumstix
-- 
2.20.1


