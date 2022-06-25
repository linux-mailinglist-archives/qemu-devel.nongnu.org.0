Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334B55ACF9
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 00:40:43 +0200 (CEST)
Received: from localhost ([::1]:47650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5ESH-0002TM-Jp
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 18:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@kangae.exyr.org>)
 id 1o5EQz-0001mn-No
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 18:39:21 -0400
Received: from r0-2.smtpout1.paris1.alwaysdata.com
 ([2a00:b6e0:1:40:1:0:10:6]:56827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@kangae.exyr.org>)
 id 1o5EQu-0000Zu-8N
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 18:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=alwaysdata.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eo152VqnuJKrTzNqPjzhgzUvu3uQKbkVNIYozeDLhGs=; b=ak9dS9S0ZDrfW6nl8J91uo6Jrt
 rKit7Cb7jyhhhTCs0oXSAIqVVZf3KaiZfwU7mS/s646PCvlfumc+H9IkPxmx9Q18Kq0ZprsnVF900
 PlBjFV8+QmYvfCPKJauf5OAvPkUhEn0Gkso1XhGrtzf1BrhTYZUJ2ae3gbr3921KI4A0=;
Received: from [2a01:e34:ecb8:5a0:f192:bd1d:5684:24ee] (helo=kangae.exyr.org)
 by smtpout1.paris1.alwaysdata.com with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <simon@kangae.exyr.org>)
 id 1o5EQj-0006bM-Co; Sun, 26 Jun 2022 00:39:05 +0200
Received: from simon by kangae.exyr.org with local (Exim 4.95)
 (envelope-from <simon@kangae.exyr.org>) id 1o5EQj-005LQ9-1V;
 Sun, 26 Jun 2022 00:39:05 +0200
From: Simon Sapin <simon.sapin@exyr.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Simon Sapin <simon.sapin@exyr.org>
Subject: [PATCH] Add some documentation for "dtb" devices tree blobs
Date: Sun, 26 Jun 2022 00:34:58 +0200
Message-Id: <20220625223458.1273408-1-simon.sapin@exyr.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-alwaysdata-ID: 127187501
Received-SPF: none client-ip=2a00:b6e0:1:40:1:0:10:6;
 envelope-from=simon@kangae.exyr.org; helo=r0-2.smtpout1.paris1.alwaysdata.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Simon Sapin <simon.sapin@exyr.org>
---
 docs/specs/device-trees.rst                | 57 ++++++++++++++++++++++
 docs/specs/index.rst                       |  1 +
 docs/system/arm/virt.rst                   |  5 +-
 docs/system/arm/xlnx-versal-virt.rst       |  3 +-
 docs/system/ppc/ppce500.rst                |  3 +-
 docs/system/riscv/microchip-icicle-kit.rst |  3 +-
 docs/system/riscv/sifive_u.rst             |  3 +-
 docs/system/riscv/virt.rst                 |  3 +-
 qemu-options.hx                            |  5 ++
 9 files changed, 77 insertions(+), 6 deletions(-)
 create mode 100644 docs/specs/device-trees.rst

diff --git docs/specs/device-trees.rst docs/specs/device-trees.rst
new file mode 100644
index 0000000000..8160342124
--- /dev/null
+++ docs/specs/device-trees.rst
@@ -0,0 +1,57 @@
+============
+Device Trees
+============
+
+On some targets, guests can find out what devices are emulated and how to access them
+through a *Device Tree Blob* (dtb), also called *Flattened Device Tree* (fdt).
+The dtb can be passed by the user through the ``-dtb file`` command-line options,
+or automatically generated by QEMU.
+
+Host: dumping the dtb
+=====================
+
+The (possibly generated) dtb can be written to a file with
+the ``dumpdtb`` property of the ``machine`` command-line option.
+Then `dtc <Device Tree Compiler_>`_ can convert it to Device Tree Source text "dts" format
+For example::
+
+    qemu-system-riscv32 -machine virt,dumpdtb=rv32-virt.dtb
+    dtc -q rv32-virt.dtb -o rv32-virt.dts
+    head -n 7 rv32-virt.dts
+
+::
+
+    qemu-system-riscv32: info: dtb dumped to rv32-virt.dtb. Exiting.
+    /dts-v1/;
+
+    / {
+        #address-cells = <0x02>;
+        #size-cells = <0x02>;
+        compatible = "riscv-virtio";
+        model = "riscv-virtio,qemu";
+
+Guest: finding the dtb
+======================
+
+On startup, the dtb is memory-mapped and its address is passed to the guest
+in a target-specific way:
+
+* Arm: :ref:`arm-baremetal`
+* **TODO**: document other targets
+
+Resources
+=========
+
+* `Devicetree Specification <https://www.devicetree.org/specifications/>`_.
+
+* Embedded Linux Wiki:
+
+  - `Device Tree: What It Is <https://elinux.org/Device_Tree_What_It_Is>`_
+  - `Device Tree Usage <https://elinux.org/Device_Tree_Usage>`_
+
+* `Device Tree Compiler <https://git.kernel.org/pub/scm/utils/dtc/dtc.git>`_:
+
+  - ``dtc`` CLI tool (package name might be ``device-tree-compiler``)
+  - ``libfdt`` C library
+
+* ``fdt`` `Rust library <https://crates.io/crates/fdt>`_
diff --git docs/specs/index.rst docs/specs/index.rst
index a58d9311cb..3bd69305e2 100644
--- docs/specs/index.rst
+++ docs/specs/index.rst
@@ -8,6 +8,7 @@ guest hardware that is specific to QEMU.
 .. toctree::
    :maxdepth: 2
 
+   device-trees
    ppc-xive
    ppc-spapr-xive
    ppc-spapr-numa
diff --git docs/system/arm/virt.rst docs/system/arm/virt.rst
index 3d1058a80c..04a90df613 100644
--- docs/system/arm/virt.rst
+++ docs/system/arm/virt.rst
@@ -153,10 +153,13 @@ need::
   CONFIG_DRM=y
   CONFIG_DRM_VIRTIO_GPU=y
 
+.. _arm-baremetal:
+
 Hardware configuration information for bare-metal programming
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
-The ``virt`` board automatically generates a device tree blob ("dtb")
+The ``virt`` board automatically generates a
+:doc:`device tree blob ("dtb") </specs/device-trees>`
 which it passes to the guest. This provides information about the
 addresses, interrupt lines and other configuration of the various devices
 in the system. Guest code can rely on and hard-code the following
diff --git docs/system/arm/xlnx-versal-virt.rst docs/system/arm/xlnx-versal-virt.rst
index 92ad10d2da..3387c74bfa 100644
--- docs/system/arm/xlnx-versal-virt.rst
+++ docs/system/arm/xlnx-versal-virt.rst
@@ -53,7 +53,8 @@ to use the ``-kernel`` command line option.
 
 Users can load firmware or boot-loaders with the ``-device loader`` options.
 
-When loading an OS, QEMU generates a DTB and selects an appropriate address
+When loading an OS, QEMU generates a :doc:`DTB </specs/device-trees>`
+and selects an appropriate address
 where it gets loaded. This DTB will be passed to the kernel in register x0.
 
 If there's no ``-kernel`` option, we generate a DTB and place it at 0x1000
diff --git docs/system/ppc/ppce500.rst docs/system/ppc/ppce500.rst
index 9beef39171..24fd91a084 100644
--- docs/system/ppc/ppce500.rst
+++ docs/system/ppc/ppce500.rst
@@ -24,7 +24,8 @@ The ``ppce500`` machine supports the following devices:
 Hardware configuration information
 ----------------------------------
 
-The ``ppce500`` machine automatically generates a device tree blob ("dtb")
+The ``ppce500`` machine automatically generates a
+:doc:`device tree blob ("dtb") </specs/device-trees>`
 which it passes to the guest, if there is no ``-dtb`` option. This provides
 information about the addresses, interrupt lines and other configuration of
 the various devices in the system.
diff --git docs/system/riscv/microchip-icicle-kit.rst docs/system/riscv/microchip-icicle-kit.rst
index 40798b1aae..a6c8b46263 100644
--- docs/system/riscv/microchip-icicle-kit.rst
+++ docs/system/riscv/microchip-icicle-kit.rst
@@ -37,7 +37,8 @@ can be loaded from U-Boot. It also supports direct kernel booting via the
 boot is used, the OpenSBI fw_dynamic BIOS image is used to boot a payload
 like U-Boot or OS kernel directly.
 
-The user provided DTB should have the following requirements:
+The user provided :doc:`DTB </specs/device-trees>`
+should have the following requirements:
 
 * The /cpus node should contain at least one subnode for E51 and the number
   of subnodes should match QEMU's ``-smp`` option
diff --git docs/system/riscv/sifive_u.rst docs/system/riscv/sifive_u.rst
index 7b166567f9..fd70ee8278 100644
--- docs/system/riscv/sifive_u.rst
+++ docs/system/riscv/sifive_u.rst
@@ -36,7 +36,8 @@ testing of 32-bit guest software.
 Hardware configuration information
 ----------------------------------
 
-The ``sifive_u`` machine automatically generates a device tree blob ("dtb")
+The ``sifive_u`` machine automatically generates a 
+:doc:`device tree blob ("dtb") </specs/device-trees>`
 which it passes to the guest, if there is no ``-dtb`` option. This provides
 information about the addresses, interrupt lines and other configuration of
 the various devices in the system. Guest software should discover the devices
diff --git docs/system/riscv/virt.rst docs/system/riscv/virt.rst
index f8ecec95f3..81ea53eb20 100644
--- docs/system/riscv/virt.rst
+++ docs/system/riscv/virt.rst
@@ -30,7 +30,8 @@ declaring.
 Hardware configuration information
 ----------------------------------
 
-The ``virt`` machine automatically generates a device tree blob ("dtb")
+The ``virt`` machine automatically generates a
+:doc:`device tree blob ("dtb") </specs/device-trees>`
 which it passes to the guest, if there is no ``-dtb`` option. This provides
 information about the addresses, interrupt lines and other configuration of
 the various devices in the system. Guest software should discover the devices
diff --git qemu-options.hx qemu-options.hx
index 377d22fbd8..eea75ddb37 100644
--- qemu-options.hx
+++ qemu-options.hx
@@ -38,6 +38,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                hmat=on|off controls ACPI HMAT support (default=off)\n"
     "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n"
     "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n",
+    "                dumpdtb=file dump current device tree blob to a file and quit\n"
     QEMU_ARCH_ALL)
 SRST
 ``-machine [type=]name[,prop=value[,...]]``
@@ -157,6 +158,10 @@ SRST
         ::
 
             -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512k
+    
+    ``dumpdtb=file``
+        Dump the current :doc:`Device Tree Blob </specs/device-trees>` 
+        to the give file name, then exit.
 ERST
 
 DEF("M", HAS_ARG, QEMU_OPTION_M,
-- 
2.36.1


