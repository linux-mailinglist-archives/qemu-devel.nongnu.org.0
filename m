Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A763A3C6699
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 01:00:35 +0200 (CEST)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34ug-0000ij-O4
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 19:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oK-0005GL-Q6
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:01 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oH-0006qj-Oz
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130438; x=1657666438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T7M2Jn/m9oUZiWeXDP9KO8IcaM1DA9eJTUHJ/HQ+0HA=;
 b=Hhoe/EdwKJHfg2XvGUtOHZEZLh1DtzD3JfFczzVIvL4q7fAzKSCNUHQK
 k6htv9un6qBcRTmbLM0QO5gyPxyXBPXscYhl50WouengUFFGZcnYZPTdT
 g4e9XAxRJSJDN4uXhdYHq6VKvng3EMQPO+qiLyJTmQbHVmeFZ+JsOP7JE
 CMa87tp2v1bNJtnSMIgbnmcMeOZ1bDMAYEyWRJngXlV1rYUo6/P7KLoIv
 haGr9Lf9VuyJGxHSXLonEFjG9Va4lrA+3F7S8+Iy7y6eFTID3UpTLwZrX
 POwTCByzPIkmrF8dINZ+5hiSsHUv2b67kqdPGpJLfZ/X+6/qTtJQOqjUj A==;
IronPort-SDR: suT0OlMEt0jkP871IxvB54tsbqJvjedsKBr8P5psWGN1r05q9ioIRtFok13Bouqfb87TyEkxRe
 IZTXmN67Rf/gTbgAD996XbvMlngR8qadaArzSuDTKkLJvFE/eTK0x4JZkSy04KeLakAu0W5CdF
 UkW5oG4mCc7swy8BnnvRwrll22PNJAReKeox9zZlHblcvuUId2SzuCWkqj42+0OoB6IZrHVne2
 jA4udQtx6ekZcaHGD6Y/XBZ3aieJPSGsDI3vTVRb8bOGSaGfd/VoyK+J3sn/paj0SsbEOQnpY5
 vjQ=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174973303"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:53 +0800
IronPort-SDR: iTtr10ax27FqYfZ82DLD1AXaIi+7Wmlg63V6vQ5RFfARLjnpnXPZ4AyonIYKdU9fj3MibNNFm6
 CLgG7MsUwuPDD7b/+HF5aMWQcOflZZGEbrSlyIDD3pfgZTp4wcvCX937Mf/KabDfcZcFHNEDKM
 ULVVCDPk47GJC+bEGN2PyCRklYIBn8+uP0PqxtyOAoiEt4lkWl5VHWzuFXllyl7F07Fjz4mQNZ
 DPI+zUwE/QcFUH6BoANQ86pFzLW+12zPMyuhWmOKvf75HqHctdvF46CHtou4UtH1g7dfxIcUQY
 ABMwCW4MyXXEsZD4R2Sxu1Wy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:31:58 -0700
IronPort-SDR: 3t2V9wwwDh40l8gvE1YA0A6LkDcycEARZlUEYov3UuoVGNMQO56M93lWI6vJAuoDQrvxDTSQGz
 X0x9SSlvmYFfINVaPfql9jgQdcJlnPr2TbY3YG5Mt2LbMjzzww9vYhmwj5mblY3XQGYc26dlHA
 EvMfl+3L4qo5US+k6kTRFwT2kzsMrtXDOt8ZcVxSLPcprsqLNYzhYO/vT4SkMtwoek9m47xVxe
 L2lBJR3CmqONdpkw0Pi9J7UxZgH0bPQgiwpMrcGTqHoWLxmHXaA/MQSt8dBlee6jjyRNX11dQC
 FEc=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 04/11] docs/system: riscv: Add documentation for virt machine
Date: Mon, 12 Jul 2021 15:53:41 -0700
Message-Id: <20210712225348.213819-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
References: <20210712225348.213819-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
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


