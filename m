Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5602E1934
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 08:02:38 +0100 (CET)
Received: from localhost ([::1]:38406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kryAQ-0005Wq-0v
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 02:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krxbW-0006Az-2e; Wed, 23 Dec 2020 01:26:34 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:33419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krxbU-00021J-34; Wed, 23 Dec 2020 01:26:33 -0500
Received: by mail-qt1-x82c.google.com with SMTP id c14so10710240qtn.0;
 Tue, 22 Dec 2020 22:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ea300HOW8ofLPhUdOkUc6i+pqGe3xUrkR+h2FXHkW9Y=;
 b=ObNgumNLd+bUAV74TogOAQDr+wP6wP0cQ/3chCX/rBr85CIMBgPwd9bKTTYzJO5RMp
 0glu1+cgLTwCKrJvdqEQOkLOFbEZSi3u+K04bWWakvj+SJ/KEOUvCmsMMkhuQrtB9d3K
 4/ThHgYL10cOhRCqXGRCXInbelxmu43T/sZW0SyemAcpLpw1iUQP0iN/Zn2NhgVIXr+e
 XSJ6qZTkEGgzRvoKin+e1Zmd0dEZrHqIE3hd69/I2Dz4lcoQlVNAzV4qkAadLHGF4A2n
 y3NVmpqZ4S41x224+qLuyYrSHlI0SMWNxtdAxWm9Ltq43YZNi0lW4CJhUA/ymLiEH2sC
 jMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ea300HOW8ofLPhUdOkUc6i+pqGe3xUrkR+h2FXHkW9Y=;
 b=BqfCBUbB18Q0Lo0PH5w/OPVIfkii5lnTamRNDWJtmyxBHSCsj9vs3dtKcxzriBEd3/
 nWpxhhuLJF7MP2zeqnfS6nBA3a+aDuWR3dsZ4zHRq25vBpmOzXqfCG37+vpaSYxLedI8
 aYVFYvpLjF9uNZDngshhcgjLIBAS1Cbya9h/Uf+NgeiNXANYdwT7xJWbvWRfhpNaRxue
 12A55XzBFOY7LmFFs/d896j1w7AlaBJwfaZD6L0XhWU0nspa/ZCvlZlLJbbCggTZ3OpE
 g7ThCBfLI0BDyBRKsRyoxKaYoUuHgXmUtXlCH0gffCLQmb1TMbAnL8PudPTJCSk4Q65s
 k2XQ==
X-Gm-Message-State: AOAM532Sb+WIn3Yy8Kw3w3KQJUiIIlWhE8aVx4p1+VTK9eLsbXq/Z6LH
 vYdLinyHYIBaIelByqHBT/Q=
X-Google-Smtp-Source: ABdhPJwK81CR7eCyMnY6CNaSfSLP2Xv7Z/zqEPlnhEMLtzsldzR0hS7iAJVdWAcm7pbLNazeSbtv2A==
X-Received: by 2002:ac8:5a90:: with SMTP id c16mr24560007qtc.331.1608704790879; 
 Tue, 22 Dec 2020 22:26:30 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id q32sm14518589qtb.0.2020.12.22.22.26.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 22:26:30 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] docs/system: arm: Add sabrelite board description
Date: Wed, 23 Dec 2020 14:26:07 +0800
Message-Id: <1608704767-9317-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This adds the target guide for SABRE Lite board, and documents how
to boot a Linux kernel and U-Boot bootloader.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: add sabrelite target guide

 docs/system/arm/sabrelite.rst | 119 ++++++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst    |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 docs/system/arm/sabrelite.rst

diff --git a/docs/system/arm/sabrelite.rst b/docs/system/arm/sabrelite.rst
new file mode 100644
index 0000000..4c5d101
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
+ * 1 FEC ethernet controller
+ * 3 I2C controllers
+ * 7 GPIO controllers
+ * 4 SDHC storage controllers
+ * 4 USB 2.0 host controllers
+ * 5 ECSPI controllers
+ * 1 SST 25VF016B flash
+
+Please note above list is a complete superset the QEMU SABRE Lite machine can
+support. For a normal use case, a device tree blob that reprents a real world
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
+rootfs on an SD card. This requies some additional command line parameters
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
index bde4b8e..edd013c 100644
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
2.7.4


