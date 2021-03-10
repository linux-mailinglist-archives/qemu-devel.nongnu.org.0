Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF50333456
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:21:08 +0100 (CET)
Received: from localhost ([::1]:44626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqLL-00031U-8B
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAv-0003YD-6c; Tue, 09 Mar 2021 23:10:22 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37053 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAp-0004AE-I7; Tue, 09 Mar 2021 23:10:20 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWd55ZDz9sWl; Wed, 10 Mar 2021 15:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349405;
 bh=eQUX6ay0aol2kTGvcnnrcbxBcIo1BZ2oHa9zhrP+hP0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=flb1dwiJXjSf15kx2YodxbGiGFJFxxB6T0SCNrPHdwu2CcCHHSOrq03Cbc9PUFnz/
 M1OqbD6rZtVDu9aPMLW3GjKzla6A/hwTITNmFWaOXFZ2BAaGhic6DluBsHpHGHOzVV
 AwZYsDGVNyzAeG9BhaFl4QKrFnxM52oK01ZlXqig=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 08/20] docs/system: Extend PPC section
Date: Wed, 10 Mar 2021 15:09:50 +1100
Message-Id: <20210310041002.333813-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_OTHER_BAD_TLD=1.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

This moves the current documentation in files specific to each
platform family. PowerNV machine is updated, the other machines need
to be done.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210222133956.156001-1-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
[dwg: Trivial capitalization fix]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 docs/system/ppc/embedded.rst |  10 ++
 docs/system/ppc/powermac.rst |  34 ++++++
 docs/system/ppc/powernv.rst  | 193 +++++++++++++++++++++++++++++++++++
 docs/system/ppc/prep.rst     |  18 ++++
 docs/system/ppc/pseries.rst  |  12 +++
 docs/system/target-ppc.rst   |  53 +++-------
 6 files changed, 282 insertions(+), 38 deletions(-)
 create mode 100644 docs/system/ppc/embedded.rst
 create mode 100644 docs/system/ppc/powermac.rst
 create mode 100644 docs/system/ppc/powernv.rst
 create mode 100644 docs/system/ppc/prep.rst
 create mode 100644 docs/system/ppc/pseries.rst

diff --git a/docs/system/ppc/embedded.rst b/docs/system/ppc/embedded.rst
new file mode 100644
index 0000000000..cfffbda24d
--- /dev/null
+++ b/docs/system/ppc/embedded.rst
@@ -0,0 +1,10 @@
+Embedded family boards
+======================
+
+- ``bamboo``               bamboo
+- ``mpc8544ds``            mpc8544ds
+- ``ppce500``              generic paravirt e500 platform
+- ``ref405ep``             ref405ep
+- ``sam460ex``             aCube Sam460ex
+- ``taihu``                taihu
+- ``virtex-ml507``         Xilinx Virtex ML507 reference design
diff --git a/docs/system/ppc/powermac.rst b/docs/system/ppc/powermac.rst
new file mode 100644
index 0000000000..04334ba210
--- /dev/null
+++ b/docs/system/ppc/powermac.rst
@@ -0,0 +1,34 @@
+PowerMac family boards (``g3beige``, ``mac99``)
+==================================================================
+
+Use the executable ``qemu-system-ppc`` to simulate a complete PowerMac
+PowerPC system.
+
+- ``g3beige``              Heathrow based PowerMAC
+- ``mac99``                Mac99 based PowerMAC
+
+Supported devices
+-----------------
+
+QEMU emulates the following PowerMac peripherals:
+
+ *  UniNorth or Grackle PCI Bridge
+ *  PCI VGA compatible card with VESA Bochs Extensions
+ *  2 PMAC IDE interfaces with hard disk and CD-ROM support
+ *  NE2000 PCI adapters
+ *  Non Volatile RAM
+ *  VIA-CUDA with ADB keyboard and mouse.
+
+
+Missing devices
+---------------
+
+ * To be identified
+
+Firmware
+--------
+
+Since version 0.9.1, QEMU uses OpenBIOS https://www.openbios.org/ for
+the g3beige and mac99 PowerMac and the 40p machines. OpenBIOS is a free
+(GPL v2) portable firmware implementation. The goal is to implement a
+100% IEEE 1275-1994 (referred to as Open Firmware) compliant firmware.
diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
new file mode 100644
index 0000000000..43c58bc32e
--- /dev/null
+++ b/docs/system/ppc/powernv.rst
@@ -0,0 +1,193 @@
+PowerNV family boards (``powernv8``, ``powernv9``)
+==================================================================
+
+PowerNV (as Non-Virtualized) is the "baremetal" platform using the
+OPAL firmware. It runs Linux on IBM and OpenPOWER systems and it can
+be used as an hypervisor OS, running KVM guests, or simply as a host
+OS.
+
+The PowerNV QEMU machine tries to emulate a PowerNV system at the
+level of the skiboot firmware, which loads the OS and provides some
+runtime services. Power Systems have a lower firmware (HostBoot) that
+does low level system initialization, like DRAM training. This is
+beyond the scope of what QEMU addresses today.
+
+Supported devices
+-----------------
+
+ * Multi processor support for POWER8, POWER8NVL and POWER9.
+ * XSCOM, serial communication sideband bus to configure chiplets
+ * Simple LPC Controller
+ * Processor Service Interface (PSI) Controller
+ * Interrupt Controller, XICS (POWER8) and XIVE (POWER9)
+ * POWER8 PHB3 PCIe Host bridge and POWER9 PHB4 PCIe Host bridge
+ * Simple OCC is an on-chip microcontroller used for power management
+   tasks
+ * iBT device to handle BMC communication, with the internal BMC
+   simulator provided by QEMU or an external BMC such as an Aspeed
+   QEMU machine.
+ * PNOR containing the different firmware partitions.
+
+Missing devices
+---------------
+
+A lot is missing, among which :
+
+ * POWER10 processor
+ * XIVE2 (POWER10) interrupt controller
+ * I2C controllers (yet to be merged)
+ * NPU/NPU2/NPU3 controllers
+ * EEH support for PCIe Host bridge controllers
+ * NX controller
+ * VAS controller
+ * chipTOD (Time Of Day)
+ * Self Boot Engine (SBE).
+ * FSI bus
+
+Firmware
+--------
+
+The OPAL firmware (OpenPower Abstraction Layer) for OpenPower systems
+includes the runtime services `skiboot` and the bootloader kernel and
+initramfs `skiroot`. Source code can be found on GitHub:
+
+  https://github.com/open-power.
+
+Prebuilt images of `skiboot` and `skiboot` are made available on the `OpenPOWER <https://openpower.xyz/job/openpower/job/openpower-op-build/>`__ site. To boot a POWER9 machine, use the `witherspoon <https://openpower.xyz/job/openpower/job/openpower-op-build/label=slave,target=witherspoon/lastSuccessfulBuild/>`__ images. For POWER8, use
+the `palmetto <https://openpower.xyz/job/openpower/job/openpower-op-build/label=slave,target=palmetto/lastSuccessfulBuild/>`__ images.
+
+QEMU includes a prebuilt image of `skiboot` which is updated when a
+more recent version is required by the models.
+
+Boot options
+------------
+
+Here is a simple setup with one e1000e NIC :
+
+.. code-block:: bash
+
+  $ qemu-system-ppc64 -m 2G -machine powernv9 -smp 2,cores=2,threads=1 \
+  -accel tcg,thread=single \
+  -device e1000e,netdev=net0,mac=C0:FF:EE:00:00:02,bus=pcie.0,addr=0x0 \
+  -netdev user,id=net0,hostfwd=::20022-:22,hostname=pnv \
+  -kernel ./zImage.epapr  \
+  -initrd ./rootfs.cpio.xz \
+  -nographic
+
+and a SATA disk :
+
+.. code-block:: bash
+
+  -device ich9-ahci,id=sata0,bus=pcie.1,addr=0x0 \
+  -drive file=./ubuntu-ppc64le.qcow2,if=none,id=drive0,format=qcow2,cache=none \
+  -device ide-hd,bus=sata0.0,unit=0,drive=drive0,id=ide,bootindex=1 \
+
+Complex PCIe configuration
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+Six PHBs are defined per chip (POWER9) but no default PCI layout is
+provided (to be compatible with libvirt). One PCI device can be added
+on any of the available PCIe slots using command line options such as:
+
+.. code-block:: bash
+
+  -device e1000e,netdev=net0,mac=C0:FF:EE:00:00:02,bus=pcie.0,addr=0x0
+  -netdev bridge,id=net0,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=hostnet0
+
+  -device megasas,id=scsi0,bus=pcie.0,addr=0x0
+  -drive file=./ubuntu-ppc64le.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2,cache=none
+  -device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=2
+
+Here is a full example with two different storage controllers on
+different PHBs, each with a disk, the second PHB is empty :
+
+.. code-block:: bash
+
+  $ qemu-system-ppc64 -m 2G -machine powernv9 -smp 2,cores=2,threads=1 -accel tcg,thread=single \
+  -kernel ./zImage.epapr -initrd ./rootfs.cpio.xz -bios ./skiboot.lid \
+  \
+  -device megasas,id=scsi0,bus=pcie.0,addr=0x0 \
+  -drive file=./rhel7-ppc64le.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2,cache=none \
+  -device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=2 \
+  \
+  -device pcie-pci-bridge,id=bridge1,bus=pcie.1,addr=0x0 \
+  \
+  -device ich9-ahci,id=sata0,bus=bridge1,addr=0x1 \
+  -drive file=./ubuntu-ppc64le.qcow2,if=none,id=drive0,format=qcow2,cache=none \
+  -device ide-hd,bus=sata0.0,unit=0,drive=drive0,id=ide,bootindex=1 \
+  -device e1000e,netdev=net0,mac=C0:FF:EE:00:00:02,bus=bridge1,addr=0x2 \
+  -netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
+  -device nec-usb-xhci,bus=bridge1,addr=0x7 \
+  \
+  -serial mon:stdio -nographic
+
+You can also use VIRTIO devices :
+
+.. code-block:: bash
+
+  -drive file=./fedora-ppc64le.qcow2,if=none,snapshot=on,id=drive0 \
+  -device virtio-blk-pci,drive=drive0,id=blk0,bus=pcie.0 \
+  \
+  -netdev tap,helper=/usr/lib/qemu/qemu-bridge-helper,br=virbr0,id=netdev0 \
+  -device virtio-net-pci,netdev=netdev0,id=net0,bus=pcie.1 \
+  \
+  -fsdev local,id=fsdev0,path=$HOME,security_model=passthrough \
+  -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host,bus=pcie.2
+
+Multi sockets
+~~~~~~~~~~~~~
+
+The number of sockets is deduced from the number of CPUs and the
+number of cores. ``-smp 2,cores=1`` will define a machine with 2
+sockets of 1 core, whereas ``-smp 2,cores=2`` will define a machine
+with 1 socket of 2 cores. ``-smp 8,cores=2``, 4 sockets of 2 cores.
+
+BMC configuration
+~~~~~~~~~~~~~~~~~
+
+OpenPOWER systems negotiate the shutdown and reboot with their
+BMC. The QEMU PowerNV machine embeds an IPMI BMC simulator using the
+iBT interface and should offer the same power features.
+
+If you want to define your own BMC, use ``-nodefaults`` and specify
+one on the command line :
+
+.. code-block:: bash
+
+  -device ipmi-bmc-sim,id=bmc0 -device isa-ipmi-bt,bmc=bmc0,irq=10
+
+The files `palmetto-SDR.bin <http://www.kaod.org/qemu/powernv/palmetto-SDR.bin>`__
+and `palmetto-FRU.bin <http://www.kaod.org/qemu/powernv/palmetto-FRU.bin>`__
+define a Sensor Data Record repository and a Field Replaceable Unit
+inventory for a palmetto BMC. They can be used to extend the QEMU BMC
+simulator.
+
+.. code-block:: bash
+
+  -device ipmi-bmc-sim,sdrfile=./palmetto-SDR.bin,fruareasize=256,frudatafile=./palmetto-FRU.bin,id=bmc0 \
+  -device isa-ipmi-bt,bmc=bmc0,irq=10
+
+The PowerNV machine can also be run with an external IPMI BMC device
+connected to a remote QEMU machine acting as BMC, using these options
+:
+
+.. code-block:: bash
+
+  -chardev socket,id=ipmi0,host=localhost,port=9002,reconnect=10 \
+  -device ipmi-bmc-extern,id=bmc0,chardev=ipmi0 \
+  -device isa-ipmi-bt,bmc=bmc0,irq=10 \
+  -nodefaults
+
+NVRAM
+~~~~~
+
+Use a MTD drive to add a PNOR to the machine, and get a NVRAM :
+
+.. code-block:: bash
+
+  -drive file=./witherspoon.pnor,format=raw,if=mtd
+
+CAVEATS
+-------
+
+ * No support for multiple HW threads (SMT=1). Same as pseries.
+ * CPU can hang when doing intensive I/Os. Use ``-append powersave=off`` in that case.
diff --git a/docs/system/ppc/prep.rst b/docs/system/ppc/prep.rst
new file mode 100644
index 0000000000..bd9eb8eabd
--- /dev/null
+++ b/docs/system/ppc/prep.rst
@@ -0,0 +1,18 @@
+Prep machine (``40p``)
+==================================================================
+
+Use the executable ``qemu-system-ppc`` to simulate a complete 40P (PREP)
+
+Supported devices
+-----------------
+
+QEMU emulates the following 40P (PREP) peripherals:
+
+ *  PCI Bridge
+ *  PCI VGA compatible card with VESA Bochs Extensions
+ *  2 IDE interfaces with hard disk and CD-ROM support
+ *  Floppy disk
+ *  PCnet network adapters
+ *  Serial port
+ *  PREP Non Volatile RAM
+ *  PC compatible keyboard and mouse.
diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
new file mode 100644
index 0000000000..932d4dd17d
--- /dev/null
+++ b/docs/system/ppc/pseries.rst
@@ -0,0 +1,12 @@
+pSeries family boards (``pseries``)
+===================================
+
+Supported devices
+-----------------
+
+Missing devices
+---------------
+
+
+Firmware
+--------
diff --git a/docs/system/target-ppc.rst b/docs/system/target-ppc.rst
index a2f04c533c..67905b8f2a 100644
--- a/docs/system/target-ppc.rst
+++ b/docs/system/target-ppc.rst
@@ -3,45 +3,22 @@
 PowerPC System emulator
 -----------------------
 
-Use the executable ``qemu-system-ppc`` to simulate a complete 40P (PREP)
-or PowerMac PowerPC system.
+Board-specific documentation
+============================
 
-QEMU emulates the following PowerMac peripherals:
+You can get a complete list by running ``qemu-system-ppc64 --machine
+help``.
 
--  UniNorth or Grackle PCI Bridge
+..
+   This table of contents should be kept sorted alphabetically
+   by the title text of each file, which isn't the same ordering
+   as an alphabetical sort by filename.
 
--  PCI VGA compatible card with VESA Bochs Extensions
+.. toctree::
+   :maxdepth: 1
 
--  2 PMAC IDE interfaces with hard disk and CD-ROM support
-
--  NE2000 PCI adapters
-
--  Non Volatile RAM
-
--  VIA-CUDA with ADB keyboard and mouse.
-
-QEMU emulates the following 40P (PREP) peripherals:
-
--  PCI Bridge
-
--  PCI VGA compatible card with VESA Bochs Extensions
-
--  2 IDE interfaces with hard disk and CD-ROM support
-
--  Floppy disk
-
--  PCnet network adapters
-
--  Serial port
-
--  PREP Non Volatile RAM
-
--  PC compatible keyboard and mouse.
-
-Since version 0.9.1, QEMU uses OpenBIOS https://www.openbios.org/ for
-the g3beige and mac99 PowerMac and the 40p machines. OpenBIOS is a free
-(GPL v2) portable firmware implementation. The goal is to implement a
-100% IEEE 1275-1994 (referred to as Open Firmware) compliant firmware.
-
-More information is available at
-http://perso.magic.fr/l_indien/qemu-ppc/.
+   ppc/embedded
+   ppc/powermac
+   ppc/powernv
+   ppc/prep
+   ppc/pseries
-- 
2.29.2


