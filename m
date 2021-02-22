Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D993321996
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:59:13 +0100 (CET)
Received: from localhost ([::1]:56484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBk0-0003sa-Br
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lEBZh-0001eE-DP; Mon, 22 Feb 2021 08:48:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lEBZe-0006O6-F2; Mon, 22 Feb 2021 08:48:33 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11MDhccm137145; Mon, 22 Feb 2021 08:47:41 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vdrbr7b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 08:47:40 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11MDjgmL180172;
 Mon, 22 Feb 2021 08:45:51 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vdrbr498-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 08:45:50 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MDW4aF032013;
 Mon, 22 Feb 2021 13:40:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 36tt281pqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 13:40:01 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 11MDdk6L21758302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 13:39:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15804A4060;
 Mon, 22 Feb 2021 13:39:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A46FBA405C;
 Mon, 22 Feb 2021 13:39:58 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 22 Feb 2021 13:39:58 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.42.172])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id ABCE4220077;
 Mon, 22 Feb 2021 14:39:57 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH] docs/system: Extend PPC section
Date: Mon, 22 Feb 2021 14:39:56 +0100
Message-Id: <20210222133956.156001-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_02:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1034 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220125
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, PDS_OTHER_BAD_TLD=1.95,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mark.cave-ayland@ilande.co.uk,
 Greg Kurz <groug@kaod.org>, programmingkidx@gmail.com, qemu-ppc@nongnu.org,
 Joel Stanley <joel@jms.id.au>, lagarcia@br.ibm.com,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This moves the current documentation in files specific to each
platform family. PowerNV machine is updated, the other machines need
to be done.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
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
index 000000000000..cfffbda24da9
--- /dev/null
+++ b/docs/system/ppc/embedded.rst
@@ -0,0 +1,10 @@
+Embedded family boards
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
index 000000000000..04334ba2102c
--- /dev/null
+++ b/docs/system/ppc/powermac.rst
@@ -0,0 +1,34 @@
+PowerMac family boards (``g3beige``, ``mac99``)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
index 000000000000..43c58bc32e76
--- /dev/null
+++ b/docs/system/ppc/powernv.rst
@@ -0,0 +1,193 @@
+PowerNV family boards (``powernv8``, ``powernv9``)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
+Prebuilt images of `skiboot` and `skiboot` are made available on the `Op=
enPOWER <https://openpower.xyz/job/openpower/job/openpower-op-build/>`__ =
site. To boot a POWER9 machine, use the `witherspoon <https://openpower.x=
yz/job/openpower/job/openpower-op-build/label=3Dslave,target=3Dwitherspoo=
n/lastSuccessfulBuild/>`__ images. For POWER8, use
+the `palmetto <https://openpower.xyz/job/openpower/job/openpower-op-buil=
d/label=3Dslave,target=3Dpalmetto/lastSuccessfulBuild/>`__ images.
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
+  $ qemu-system-ppc64 -m 2G -machine powernv9 -smp 2,cores=3D2,threads=3D=
1 \
+  -accel tcg,thread=3Dsingle \
+  -device e1000e,netdev=3Dnet0,mac=3DC0:FF:EE:00:00:02,bus=3Dpcie.0,addr=
=3D0x0 \
+  -netdev user,id=3Dnet0,hostfwd=3D::20022-:22,hostname=3Dpnv \
+  -kernel ./zImage.epapr  \
+  -initrd ./rootfs.cpio.xz \
+  -nographic
+
+and a SATA disk :
+
+.. code-block:: bash
+
+  -device ich9-ahci,id=3Dsata0,bus=3Dpcie.1,addr=3D0x0 \
+  -drive file=3D./ubuntu-ppc64le.qcow2,if=3Dnone,id=3Ddrive0,format=3Dqc=
ow2,cache=3Dnone \
+  -device ide-hd,bus=3Dsata0.0,unit=3D0,drive=3Ddrive0,id=3Dide,bootinde=
x=3D1 \
+
+Complex PCIe configuration
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+Six PHBs are defined per chip (POWER9) but no default PCI layout is
+provided (to be compatible with libvirt). One PCI device can be added
+on any of the available PCIe slots using command line options such as:
+
+.. code-block:: bash
+
+  -device e1000e,netdev=3Dnet0,mac=3DC0:FF:EE:00:00:02,bus=3Dpcie.0,addr=
=3D0x0
+  -netdev bridge,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=3D=
virbr0,id=3Dhostnet0
+
+  -device megasas,id=3Dscsi0,bus=3Dpcie.0,addr=3D0x0
+  -drive file=3D./ubuntu-ppc64le.qcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0,=
format=3Dqcow2,cache=3Dnone
+  -device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3D=
drive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D2
+
+Here is a full example with two different storage controllers on
+different PHBs, each with a disk, the second PHB is empty :
+
+.. code-block:: bash
+
+  $ qemu-system-ppc64 -m 2G -machine powernv9 -smp 2,cores=3D2,threads=3D=
1 -accel tcg,thread=3Dsingle \
+  -kernel ./zImage.epapr -initrd ./rootfs.cpio.xz -bios ./skiboot.lid \
+  \
+  -device megasas,id=3Dscsi0,bus=3Dpcie.0,addr=3D0x0 \
+  -drive file=3D./rhel7-ppc64le.qcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0,f=
ormat=3Dqcow2,cache=3Dnone \
+  -device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3D=
drive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D2 \
+  \
+  -device pcie-pci-bridge,id=3Dbridge1,bus=3Dpcie.1,addr=3D0x0 \
+  \
+  -device ich9-ahci,id=3Dsata0,bus=3Dbridge1,addr=3D0x1 \
+  -drive file=3D./ubuntu-ppc64le.qcow2,if=3Dnone,id=3Ddrive0,format=3Dqc=
ow2,cache=3Dnone \
+  -device ide-hd,bus=3Dsata0.0,unit=3D0,drive=3Ddrive0,id=3Dide,bootinde=
x=3D1 \
+  -device e1000e,netdev=3Dnet0,mac=3DC0:FF:EE:00:00:02,bus=3Dbridge1,add=
r=3D0x2 \
+  -netdev bridge,helper=3D/usr/libexec/qemu-bridge-helper,br=3Dvirbr0,id=
=3Dnet0 \
+  -device nec-usb-xhci,bus=3Dbridge1,addr=3D0x7 \
+  \
+  -serial mon:stdio -nographic
+
+You can also use VIRTIO devices :
+
+.. code-block:: bash
+
+  -drive file=3D./fedora-ppc64le.qcow2,if=3Dnone,snapshot=3Don,id=3Ddriv=
e0 \
+  -device virtio-blk-pci,drive=3Ddrive0,id=3Dblk0,bus=3Dpcie.0 \
+  \
+  -netdev tap,helper=3D/usr/lib/qemu/qemu-bridge-helper,br=3Dvirbr0,id=3D=
netdev0 \
+  -device virtio-net-pci,netdev=3Dnetdev0,id=3Dnet0,bus=3Dpcie.1 \
+  \
+  -fsdev local,id=3Dfsdev0,path=3D$HOME,security_model=3Dpassthrough \
+  -device virtio-9p-pci,fsdev=3Dfsdev0,mount_tag=3Dhost,bus=3Dpcie.2
+
+Multi sockets
+~~~~~~~~~~~~~
+
+The number of sockets is deduced from the number of CPUs and the
+number of cores. ``-smp 2,cores=3D1`` will define a machine with 2
+sockets of 1 core, whereas ``-smp 2,cores=3D2`` will define a machine
+with 1 socket of 2 cores. ``-smp 8,cores=3D2``, 4 sockets of 2 cores.
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
+  -device ipmi-bmc-sim,id=3Dbmc0 -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10
+
+The files `palmetto-SDR.bin <http://www.kaod.org/qemu/powernv/palmetto-S=
DR.bin>`__
+and `palmetto-FRU.bin <http://www.kaod.org/qemu/powernv/palmetto-FRU.bin=
>`__
+define a Sensor Data Record repository and a Field Replaceable Unit
+inventory for a palmetto BMC. They can be used to extend the QEMU BMC
+simulator.
+
+.. code-block:: bash
+
+  -device ipmi-bmc-sim,sdrfile=3D./palmetto-SDR.bin,fruareasize=3D256,fr=
udatafile=3D./palmetto-FRU.bin,id=3Dbmc0 \
+  -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10
+
+The PowerNV machine can also be run with an external IPMI BMC device
+connected to a remote QEMU machine acting as BMC, using these options
+:
+
+.. code-block:: bash
+
+  -chardev socket,id=3Dipmi0,host=3Dlocalhost,port=3D9002,reconnect=3D10=
 \
+  -device ipmi-bmc-extern,id=3Dbmc0,chardev=3Dipmi0 \
+  -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 \
+  -nodefaults
+
+NVRAM
+~~~~~
+
+Use a MTD drive to add a PNOR to the machine, and get a NVRAM :
+
+.. code-block:: bash
+
+  -drive file=3D./witherspoon.pnor,format=3Draw,if=3Dmtd
+
+CAVEATS
+-------
+
+ * No support for multiple HW threads (SMT=3D1). Same as pseries.
+ * CPU can hang when doing intensive I/Os. Use ``-append powersave=3Doff=
`` in that case.
diff --git a/docs/system/ppc/prep.rst b/docs/system/ppc/prep.rst
new file mode 100644
index 000000000000..bd9eb8eabd2f
--- /dev/null
+++ b/docs/system/ppc/prep.rst
@@ -0,0 +1,18 @@
+Prep machine (``40p``)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
index 000000000000..932d4dd17d29
--- /dev/null
+++ b/docs/system/ppc/pseries.rst
@@ -0,0 +1,12 @@
+pSeries family boards (``pseries``)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
index a2f04c533c24..549fb1858b54 100644
--- a/docs/system/target-ppc.rst
+++ b/docs/system/target-ppc.rst
@@ -3,45 +3,22 @@
 PowerPC System emulator
 -----------------------
=20
-Use the executable ``qemu-system-ppc`` to simulate a complete 40P (PREP)
-or PowerMac PowerPC system.
+Board-specific documentation
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
-QEMU emulates the following PowerMac peripherals:
+you can get a complete list by running ``qemu-system-ppc64 --machine
+help``.
=20
--  UniNorth or Grackle PCI Bridge
+..
+   This table of contents should be kept sorted alphabetically
+   by the title text of each file, which isn't the same ordering
+   as an alphabetical sort by filename.
=20
--  PCI VGA compatible card with VESA Bochs Extensions
+.. toctree::
+   :maxdepth: 1
=20
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
--=20
2.26.2


