Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1FD354E67
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:19:54 +0200 (CEST)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTgwD-00083D-In
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTgsD-0004aU-DK; Tue, 06 Apr 2021 04:15:45 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTgs9-000427-Ok; Tue, 06 Apr 2021 04:15:45 -0400
Received: by mail-ed1-x535.google.com with SMTP id w23so4190326edx.7;
 Tue, 06 Apr 2021 01:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=S19Qc+S//PbgbdgB/QlzSWC1BrQPbmy03pZJgY/lqAw=;
 b=D+nh9PfE75mO5+3urfAsN4FuUqSS9elI0K58vVpKXsv7MyOedElLAkuEtRWZ4gaLa7
 AW7htMWbN4KWufVSl22QJ/iaPEaeSyjkK5Zrw0WsQSrd2qOYtNSeTVxAwDql12lGnney
 3tXX7ojBJwbC9+63A/DRx4frPeEtKNkljavTmYxKbJI5eXyKWwWUKehZHchjoikOGT94
 UtrX1QE9s8DNpGbV0uo/+8A961uLthkSanS2bNJJzIH7hNP9qGP+IUEC4uhiX0HXbfXl
 wdtDmrkdSct30eU+jlZcDwSegeqsROXmmHGbMtw1zj4WN0L4nZmhheWhBejzvipInKwF
 /N0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S19Qc+S//PbgbdgB/QlzSWC1BrQPbmy03pZJgY/lqAw=;
 b=XqQl1EGIFbVcdXO0b5hkPTYt6flUTbZTNJ7WYcZNzgtgM6ulnYmlzm1/pTOhEfvSEO
 437o3JTt/jW9rcVVbC+O2GfpZ7M21oTtAjzESVXAaE9vt44COqwL+2OjWR9ja4mtkxoO
 9NFltuK4udMSWKv5mWb6t8/cQJImz2joFQLa2Un+jscR8AuLC3++gP2wLTDJpnk6XzKd
 HkHZQVwGj8MXCB3iW5ITSY5OryVRtbQCsYeRLiSCIDL83JqYDnWbYaYGVgNCvMtOAoxs
 MQWkn0zW4t1yvg97KqMUWZUCn6cEcBsW3nCFW8jXppK9mFIuPN1YsqcZQR8hDGZCYP0D
 e2gA==
X-Gm-Message-State: AOAM532EcuL4NWJSAg6dsdpcoJiSSQHk/q4Xl2xwgxdqal7phk8ydgsk
 NW7X8Q+607QdlM59jZuTQBYrIAbPC4s=
X-Google-Smtp-Source: ABdhPJzL7x4KPa83CxmqwjwD8ZsLyL+/2Y0uajw7g/AApSVPMqAn2+plmfg0a8QQa0uSvvwFMQMBTQ==
X-Received: by 2002:a05:6402:1004:: with SMTP id
 c4mr36809021edu.364.1617696940069; 
 Tue, 06 Apr 2021 01:15:40 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id h23sm2455213ejd.103.2021.04.06.01.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:15:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [for-6.0 PATCH 3/3] docs/system: ppc: Add documentation for ppce500
 machine
Date: Tue,  6 Apr 2021 16:15:13 +0800
Message-Id: <20210406081513.1013372-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406081513.1013372-1-bmeng.cn@gmail.com>
References: <20210406081513.1013372-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x535.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds detailed documentation for PowerPC `ppce500` machine,
including the following information:

- Supported devices
- Hardware configuration information
- Boot options
- Running Linux kernel
- Running U-Boot

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

 docs/system/ppc/ppce500.rst | 156 ++++++++++++++++++++++++++++++++++++
 docs/system/target-ppc.rst  |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 docs/system/ppc/ppce500.rst

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
new file mode 100644
index 0000000000..7a815c1881
--- /dev/null
+++ b/docs/system/ppc/ppce500.rst
@@ -0,0 +1,156 @@
+ppce500 generic platform (``ppce500``)
+======================================
+
+QEMU for PPC supports a special ``ppce500`` machine designed for emulation and
+virtualization purposes.
+
+Supported devices
+-----------------
+
+The ``ppce500`` machine supports the following devices:
+
+* PowerPC e500 series core (e500v2/e500mc/e5500/e6500)
+* Configuration, Control, and Status Register (CCSR)
+* Multicore Programmable Interrupt Controller (MPIC) with MSI support
+* 1 16550A UART device
+* 1 Freescale MPC8xxx I2C controller
+* 1 Pericom pt7c4338 RTC via I2C
+* 1 Freescale MPC8xxx GPIO controller
+* Power-off functionality via one GPIO pin
+* 1 Freescale MPC8xxx PCI host controller
+* VirtIO devices via PCI bus
+
+Hardware configuration information
+----------------------------------
+
+The ``ppce500`` machine automatically generates a device tree blob ("dtb")
+which it passes to the guest, if there is no ``-dtb`` option. This provides
+information about the addresses, interrupt lines and other configuration of
+the various devices in the system.
+
+If users want to provide their own DTB, they can use the ``-dtb`` option.
+These DTBs should have the following requirements:
+
+* The number of subnodes under /cpus node should match QEMU's ``-smp`` option
+* The /memory reg size should match QEMU’s selected ram_size via ``-m``
+
+Both ``qemu-system-ppc`` and ``qemu-system-ppc64`` provide emulation for the
+following 32-bit PowerPC CPUs:
+
+* e500v2
+* e500mc
+
+Additionally ``qemu-system-ppc64`` provides support for the following 64-bit
+PowerPC CPUs:
+
+* e5500
+* e6500
+
+The CPU type can be specified via the ``-cpu`` command line. If not specified,
+it creates a machine with e500v2 core. The following example shows an e6500
+based machine creation:
+
+.. code-block:: bash
+
+  $ qemu-system-ppc64 -nographic -M ppce500 -cpu e6500
+
+Boot options
+------------
+
+The ``ppce500`` machine can start using the standard -kernel functionality
+for loading a payload like an OS kernel (e.g.: Linux), or U-Boot firmware.
+
+When -bios is omitted, the default pc-bios/u-boot.e500 firmware image is used
+as the BIOS. QEMU follows below truth table to select which payload to execute:
+
+===== ========== =======
+-bios    -kernel payload
+===== ========== =======
+    N          N  u-boot
+    N          Y  kernel
+    Y don't care  u-boot
+===== ========== =======
+
+When both -bios and -kernel are present, QEMU loads U-Boot and U-Boot in turns
+automatically loads the kernel image specified by the -kernel parameter via
+U-Boot's built-in "bootm" command, hence a legacy uImage format is required in
+such senario.
+
+Running Linux kernel
+--------------------
+
+Linux mainline v5.11 release is tested at the time of writing. To build a
+Linux mainline kernel that can be booted by the ``ppce500`` machine in
+64-bit mode, simply configure the kernel using the defconfig configuration:
+
+.. code-block:: bash
+
+  $ export ARCH=powerpc
+  $ export CROSS_COMPILE=powerpc-linux-
+  $ make corenet64_smp_defconfig
+  $ make menuconfig
+
+then manually select the following configuration:
+
+  Platform support > Freescale Book-E Machine Type > QEMU generic e500 platform
+
+To boot the newly built Linux kernel in QEMU with the ``ppce500`` machine:
+
+.. code-block:: bash
+
+  $ qemu-system-ppc64 -M ppce500 -cpu e5500 -smp 4 -m 2G \
+      -display none -serial stdio \
+      -kernel vmlinux \
+      -initrd /path/to/rootfs.cpio \
+      -append "root=/dev/ram"
+
+To build a Linux mainline kernel that can be booted by the ``ppce500`` machine
+in 32-bit mode, use the same 64-bit configuration steps except the defconfig
+file should use corenet32_smp_defconfig.
+
+To boot the 32-bit Linux kernel:
+
+.. code-block:: bash
+
+  $ qemu-system-ppc{64|32} -M ppce500 -cpu e500mc -smp 4 -m 2G \
+      -display none -serial stdio \
+      -kernel vmlinux \
+      -initrd /path/to/rootfs.cpio \
+      -append "root=/dev/ram"
+
+Running U-Boot
+--------------
+
+U-Boot mainline v2021.04 release is tested at the time of writing. To build a
+U-Boot mainline bootloader that can be booted by the ``ppce500`` machine, use
+the qemu-ppce500_defconfig with similar commands as described above for Linux:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=powerpc-linux-
+  $ make qemu-ppce500_defconfig
+
+You will get u-boot file in the build tree.
+
+When U-Boot boots, you will notice the following if using with ``-cpu e6500``:
+
+.. code-block:: none
+
+  CPU:   Unknown, Version: 0.0, (0x00000000)
+  Core:  e6500, Version: 2.0, (0x80400020)
+
+This is because we only specified a core name to QEMU and it does not have a
+meaningful SVR value which represents an actual SoC that integrates such core.
+You can specify a real world SoC device that QEMU has built-in support but all
+these SoCs are e500v2 based MPC85xx series, hence you cannot test anything
+built for P4080 (e500mc), P5020 (e5500) and T2080 (e6500).
+
+By default a VirtIO standard PCI networking device is connected as an ethernet
+interface at PCI address 0.1.0, but we can switch that to an e1000 NIC by:
+
+.. code-block:: bash
+
+  $ qemu-system-ppc -M ppce500 -smp 4 -m 2G \
+                    -display none -serial stdio \
+                    -bios u-boot \
+                    -nic tap,ifname=tap0,script=no,downscript=no,model=e1000
diff --git a/docs/system/target-ppc.rst b/docs/system/target-ppc.rst
index 67905b8f2a..4f6eb93b17 100644
--- a/docs/system/target-ppc.rst
+++ b/docs/system/target-ppc.rst
@@ -20,5 +20,6 @@ help``.
    ppc/embedded
    ppc/powermac
    ppc/powernv
+   ppc/ppce500
    ppc/prep
    ppc/pseries
-- 
2.25.1


