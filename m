Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5603C998E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:21:12 +0200 (CEST)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vgF-00054I-5k
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc4-0005U6-GV
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:52 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc1-0003aa-8N
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333410; x=1657869410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T7M2Jn/m9oUZiWeXDP9KO8IcaM1DA9eJTUHJ/HQ+0HA=;
 b=iRs98L9jcTEbL9kBhaikXylhaDjmcOr0DWOS3IQfEk76vNcVN4Szav6/
 t07emHXCNu1ykpyd3H8chkHbGjb4vZZT8qxyFXkIQ4IUEJ2cFCtuc0Uyy
 P3mPm9d0xXmSPmpJxWWuiS7UawsPHv+KfJbd04FgC20gABFSvF5AIeKb6
 4i5f+s0xXB/CtSYWBpmoc2nMak/DEZP9MBeX2JQynsxa1JOdcQ0NprsU9
 lD8SHFIZWDKm+KGKie1Am5jSLzrNKRDnn+KHiRFNyafZO0OUXJ+mggddV
 tHhzVHY4Dy8362O2Gg0A3ohw+3qTPBpMNW3An4TEveH55pQC9oU+pl8n/ g==;
IronPort-SDR: wCN8PBJM/mw74dISwIDfGTwtXJ+lFnQMsyWdONs/k2Sb7FxMer8PSufqHrE/cs/8hNneGMvYxJ
 bY/JMxIMDl93Zs6hF1034J+MalP0coMEmM8GG8uaqXTKHCKLwFr+vxIka72x6kl7m/9ECGp72J
 BDugp7RtPIh+oO/x3fVIc1i6DrD43jOhqldEavtOdIGcR5cRI3h/sgvkU0+AbFwl4V+Tc8wQ/P
 C56oLfWYGVRwpK82LvPtF44RapgPe8/4vn0XhqVv2AGFhzuWRFhqzUa8f+pMkXGmD1N7sAW1xI
 TsE=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212302"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:42 +0800
IronPort-SDR: svbN7orJF4HbR39YqBZw5A+A5dNUDOJoqKf41HQxFV+WPTeXn/tZVvoUjPTzqqGrk903HoxMPU
 lVGtiVKIKE/5vD75SbgeUfbabhhJZoYWEy0xLs0ty6MHeA7g3EHanSPz1hbRyB3JPCRcZWeyg5
 jhdqi6iaYGWzVk8G6yF+2HogNqAw7C736h3hc5FNKG98tVX8ZQiwQvRUz0AWQdEkGNwNcRIF7U
 TVpQBfvMYW38X7bTg73xMXPT9NjyDTrpN6VFK+wRjAod0pICWvpZGEfSflSxq8RHOx9NKxcndU
 t36qSKgqt03D15HLnBN6gEp2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:45 -0700
IronPort-SDR: qIVEPipJPogY0mv0/GyFA9mKTKBuId0CFQ1sqtH3V3BrpAjGcv7o30s0pKZDiyLCm51n55Rqlj
 hGas9UjFNiapulRY6dkZsI5r+vD5h1V/i62uXGRWXbkNe7AopAV/+JC2Ma+lNHSnNOGkmOkeuF
 rL13dBhc21zcC9Deu3sqDCLDLnXs9Xeo0gfZKHhMzVd9Cya/fGxNKQs0lPNNIHvC547uCZyH5f
 DPjwSu6OxiFS6X02t3H5v+KrqG1q5KpgRI2NgtO4BDyAu2y1kTwzB/KN0/dvTJlAEUP033K0dd
 0eU=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 04/12] docs/system: riscv: Add documentation for virt machine
Date: Thu, 15 Jul 2021 00:16:32 -0700
Message-Id: <20210715071640.232070-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715071640.232070-1-alistair.francis@wdc.com>
References: <20210715071640.232070-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8230c157d=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

This adds detailed documentation for RISC-V `virt` machine,
including the following information:

  - Supported devices
  - Hardware configuration information
  - Boot options
  - Running Linux kernel
  - Running U-Boot

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210627142816.19789-2-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst   | 138 +++++++++++++++++++++++++++++++++++
 docs/system/target-riscv.rst |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 docs/system/riscv/virt.rst

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
new file mode 100644
index 0000000000..3709f05797
--- /dev/null
+++ b/docs/system/riscv/virt.rst
@@ -0,0 +1,138 @@
+'virt' Generic Virtual Platform (``virt``)
+==========================================
+
+The `virt` board is a platform which does not correspond to any real hardware;
+it is designed for use in virtual machines. It is the recommended board type
+if you simply want to run a guest such as Linux and do not care about
+reproducing the idiosyncrasies and limitations of a particular bit of
+real-world hardware.
+
+Supported devices
+-----------------
+
+The ``virt`` machine supports the following devices:
+
+* Up to 8 generic RV32GC/RV64GC cores, with optional extensions
+* Core Local Interruptor (CLINT)
+* Platform-Level Interrupt Controller (PLIC)
+* CFI parallel NOR flash memory
+* 1 NS16550 compatible UART
+* 1 Google Goldfish RTC
+* 1 SiFive Test device
+* 8 virtio-mmio transport devices
+* 1 generic PCIe host bridge
+* The fw_cfg device that allows a guest to obtain data from QEMU
+
+Note that the default CPU is a generic RV32GC/RV64GC. Optional extensions
+can be enabled via command line parameters, e.g.: ``-cpu rv64,x-h=true``
+enables the hypervisor extension for RV64.
+
+Hardware configuration information
+----------------------------------
+
+The ``virt`` machine automatically generates a device tree blob ("dtb")
+which it passes to the guest, if there is no ``-dtb`` option. This provides
+information about the addresses, interrupt lines and other configuration of
+the various devices in the system. Guest software should discover the devices
+that are present in the generated DTB.
+
+If users want to provide their own DTB, they can use the ``-dtb`` option.
+These DTBs should have the following requirements:
+
+* The number of subnodes of the /cpus node should match QEMU's ``-smp`` option
+* The /memory reg size should match QEMU’s selected ram_size via ``-m``
+* Should contain a node for the CLINT device with a compatible string
+  "riscv,clint0" if using with OpenSBI BIOS images
+
+Boot options
+------------
+
+The ``virt`` machine can start using the standard -kernel functionality
+for loading a Linux kernel, a VxWorks kernel, an S-mode U-Boot bootloader
+with the default OpenSBI firmware image as the -bios. It also supports
+the recommended RISC-V bootflow: U-Boot SPL (M-mode) loads OpenSBI fw_dynamic
+firmware and U-Boot proper (S-mode), using the standard -bios functionality.
+
+Running Linux kernel
+--------------------
+
+Linux mainline v5.12 release is tested at the time of writing. To build a
+Linux mainline kernel that can be booted by the ``virt`` machine in
+64-bit mode, simply configure the kernel using the defconfig configuration:
+
+.. code-block:: bash
+
+  $ export ARCH=riscv
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ make defconfig
+  $ make
+
+To boot the newly built Linux kernel in QEMU with the ``virt`` machine:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M virt -smp 4 -m 2G \
+      -display none -serial stdio \
+      -kernel arch/riscv/boot/Image \
+      -initrd /path/to/rootfs.cpio \
+      -append "root=/dev/ram"
+
+To build a Linux mainline kernel that can be booted by the ``virt`` machine
+in 32-bit mode, use the rv32_defconfig configuration. A patch is required to
+fix the 32-bit boot issue for Linux kernel v5.12.
+
+.. code-block:: bash
+
+  $ export ARCH=riscv
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ curl https://patchwork.kernel.org/project/linux-riscv/patch/20210627135117.28641-1-bmeng.cn@gmail.com/mbox/ > riscv.patch
+  $ git am riscv.patch
+  $ make rv32_defconfig
+  $ make
+
+Replace ``qemu-system-riscv64`` with ``qemu-system-riscv32`` in the command
+line above to boot the 32-bit Linux kernel. A rootfs image containing 32-bit
+applications shall be used in order for kernel to boot to user space.
+
+Running U-Boot
+--------------
+
+U-Boot mainline v2021.04 release is tested at the time of writing. To build an
+S-mode U-Boot bootloader that can be booted by the ``virt`` machine, use
+the qemu-riscv64_smode_defconfig with similar commands as described above for Linux:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ make qemu-riscv64_smode_defconfig
+
+Boot the 64-bit U-Boot S-mode image directly:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M virt -smp 4 -m 2G \
+      -display none -serial stdio \
+      -kernel /path/to/u-boot.bin
+
+To test booting U-Boot SPL which in M-mode, which in turn loads a FIT image
+that bundles OpenSBI fw_dynamic firmware and U-Boot proper (S-mode) together,
+build the U-Boot images using riscv64_spl_defconfig:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ export OPENSBI=/path/to/opensbi-riscv64-generic-fw_dynamic.bin
+  $ make qemu-riscv64_spl_defconfig
+
+The minimal QEMU commands to run U-Boot SPL are:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M virt -smp 4 -m 2G \
+      -display none -serial stdio \
+      -bios /path/to/u-boot-spl \
+      -device loader,file=/path/to/u-boot.itb,addr=0x80200000
+
+To test 32-bit U-Boot images, switch to use qemu-riscv32_smode_defconfig and
+riscv32_spl_defconfig builds, and replace ``qemu-system-riscv64`` with
+``qemu-system-riscv32`` in the command lines above to boot the 32-bit U-Boot.
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index a5cc06b726..89a866e4f4 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -69,6 +69,7 @@ undocumented; you can get a complete list by running
    riscv/microchip-icicle-kit
    riscv/shakti-c
    riscv/sifive_u
+   riscv/virt
 
 RISC-V CPU firmware
 -------------------
-- 
2.31.1


