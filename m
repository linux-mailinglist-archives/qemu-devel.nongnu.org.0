Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E39C75F91
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 09:18:52 +0200 (CEST)
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hquV9-0004z9-Fo
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 03:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51362)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sathnaga@linux.vnet.ibm.com>) id 1hquUq-00041p-4e
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:18:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sathnaga@linux.vnet.ibm.com>) id 1hquUo-0007dL-4L
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:18:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52732)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sathnaga@linux.vnet.ibm.com>)
 id 1hquUn-0007V6-Pw
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:18:29 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6Q7HXF5099786
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 03:18:27 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tytga5udn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 03:18:26 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <sathnaga@linux.vnet.ibm.com>;
 Fri, 26 Jul 2019 08:18:24 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 26 Jul 2019 08:18:22 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6Q7IL9645416638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jul 2019 07:18:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCB74A405F;
 Fri, 26 Jul 2019 07:18:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBA23A4067;
 Fri, 26 Jul 2019 07:18:20 +0000 (GMT)
Received: from sathnaga86.in.ibm.com (unknown [9.193.110.61])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jul 2019 07:18:20 +0000 (GMT)
From: sathnaga@linux.vnet.ibm.com
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 12:48:18 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19072607-0008-0000-0000-00000300FFBB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072607-0009-0000-0000-0000226E9684
Message-Id: <20190726071818.32444-1-sathnaga@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907260096
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH 2/2] tests.acceptance.boot_linux_console: Add
 pseries linux boot console test
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
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

Add pseries linux boot console test

$avocado --show=console run -t arch:ppc64le boot_linux_console.py
console: SLOF **********************************************************************
console: QEMU Starting
console:  Build Date = Jul  3 2019 12:26:14
console: FW Version = git-ba1ab360eebe6338
console: Press "s" to enter Open Firmware.
console: C0000
console: C0100
console: C0120
console: C0140
console: C0200
console: C0240
console: C0260
console: C02E0
console: C0300
console: C0320
console: C0340
console: C0360
console: C0370
console: C0380
console: C0371
console: C0372
console: C0373
console: C0374
console: C03F0
console: C0400
console: C0480
console: C04C0
console: C04D0
console: C0500
console: Populating /vdevice methods
console: Populating /vdevice/vty@71000000
console: Populating /vdevice/nvram@71000001
console: Populating /vdevice/l-lan@71000002
console: Populating /vdevice/v-scsi@71000003
console: SCSI: Looking for devices
console: 8200000000000000 CD-ROM   : "QEMU     QEMU CD-ROM      2.5+"
console: C05A0
console: Populating /pci@800000020000000
console: C0600
console: C06C0
console: C0700
console: C0800
console: C0880
console: No NVRAM common partition, re-initializing...
console: C0890
console: C08A0
console: C08A8
console: C08B0
console: Scanning USB
console: C08C0
console: C08D0
console: Using default console: /vdevice/vty@71000000
console: C08E0
console: C08E8
console: Detected RAM kernel at 400000 (1a57b38 bytes)
console: C08FF
console: Welcome to Open Firmware
console: Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
console: This program and the accompanying materials are made available
console: under the terms of the BSD License available at
console: http://www.opensource.org/licenses/bsd-license.php
console: Booting from memory...
console: OF stdout device is: /vdevice/vty@71000000
console: Preparing to boot Linux version 4.15.0-50-generic (buildd@bos02-ppc64el-006) (gcc version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)) #54-Ubuntu SMP Mon May 6 18:55:18 UTC 2019 (Ubuntu 4.15.0-50.54-generic 4.15.18)
console: Detected machine type: 0000000000000101
console: command line: printk.time=0 console=hvc0
console: Max number of cores passed to firmware: u (NR_CPUS = 2048)
console: Calling ibm,client-architecture-support... done
console: memory layout at init:
console: memory_limit : 0000000000000000 (16 MB aligned)
console: alloc_bottom : 0000000001e70000
console: alloc_top    : 0000000020000000
console: alloc_top_hi : 0000000020000000
console: rmo_top      : 0000000020000000
console: ram_top      : 0000000020000000
console: instantiating rtas at 0x000000001daf0000... done
console: prom_hold_cpus: skipped
console: copying OF device tree...
console: Building dt strings...
console: Building dt structure...
console: Device tree strings 0x0000000001e80000 -> 0x0000000001e80a46
console: Device tree struct  0x0000000001e90000 -> 0x0000000001ea0000
console: Quiescing Open Firmware ...
console: Booting Linux via __start() @ 0x0000000000400000 ...
console: [    0.000000] hash-mmu: Page sizes from device-tree:
console: [    0.000000] hash-mmu: base_shift=12: shift=12, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=0
console: [    0.000000] hash-mmu: base_shift=16: shift=16, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=1
console: [    0.000000] Using 1TB segments
console: [    0.000000] hash-mmu: Initializing hash mmu with SLB
console: [    0.000000] Linux version 4.15.0-50-generic (buildd@bos02-ppc64el-006) (gcc version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)) #54-Ubuntu SMP Mon May 6 18:55:18 UTC 2019 (Ubuntu 4.15.0-50.54-generic 4.15.18)
console: [    0.000000] Using pSeries machine description
console: [    0.000000] bootconsole [udbg0] enabled
console: [    0.000000] Partition configured for 1 cpus.
console: [    0.000000] CPU maps initialized for 1 thread per core
console: -> smp_release_cpus()
console: spinning_secondaries = 0
console: <- smp_release_cpus()
console: [    0.000000] -----------------------------------------------------
console: [    0.000000] ppc64_pft_size    = 0x16
console: [    0.000000] phys_mem_size     = 0x20000000
console: [    0.000000] dcache_bsize      = 0x80
console: [    0.000000] icache_bsize      = 0x80
console: [    0.000000] cpu_features      = 0x000000eb8f4d91a7
console: [    0.000000]   possible        = 0x0000fffbfffff1af
console: [    0.000000]   always          = 0x00000000000001a0
console: [    0.000000] cpu_user_features = 0xdc0065c2 0xae000000
console: [    0.000000] mmu_features      = 0x78006001
console: [    0.000000] firmware_features = 0x00000001455a445f
console: [    0.000000] htab_hash_mask    = 0x7fff
console: [    0.000000] -----------------------------------------------------
console: [    0.000000] numa:   NODE_DATA [mem 0x1ffc3c80-0x1ffcffff]
console: [    0.000000] rfi-flush: fallback displacement flush available
console: [    0.000000] rfi-flush: ori type flush available
console: [    0.000000] rfi-flush: mttrig type flush available
console: [    0.000000] count-cache-flush: full software flush sequence enabled.
console: [    0.000000] stf-barrier: hwsync barrier available
console: [    0.000000] PCI host bridge /pci@800000020000000  ranges:
console: [    0.000000]   IO 0x0000200000000000..0x000020000000ffff -> 0x0000000000000000
console: [    0.000000]  MEM 0x0000200080000000..0x00002000ffffffff -> 0x0000000080000000
console: [    0.000000]  MEM 0x0000210000000000..0x000021ffffffffff -> 0x0000210000000000
console: [    0.000000] PPC64 nvram contains 65536 bytes
console: [    0.000000] barrier-nospec: using ORI speculation barrier
console: [    0.000000] Zone ranges:
console: [    0.000000]   DMA      [mem 0x0000000000000000-0x000000001fffffff]
console: [    0.000000]   DMA32    empty
console: [    0.000000]   Normal   empty
console: [    0.000000]   Device   empty
console: [    0.000000] Movable zone start for each node
console: [    0.000000] Early memory node ranges
console: [    0.000000]   node   0: [mem 0x0000000000000000-0x000000001fffffff]
console: [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000001fffffff]
console: [    0.000000] percpu: Embedded 4 pages/cpu @        (ptrval) s171032 r0 d91112 u1048576
console: [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8184
console: [    0.000000] Policy zone: DMA
console: [    0.000000] Kernel command line: printk.time=0 console=hvc0

Signed-off-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
---
 tests/acceptance/boot_linux_console.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 32159503e9..b808245273 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -90,6 +90,26 @@ class BootLinuxConsole(Test):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_ppc64le_pseries(self):
+        """
+        :avocado: tags=arch:ppc64le
+        :avocado: tags=machine:pseries
+        """
+        kernel_url = ('http://ports.ubuntu.com/ubuntu-ports/'
+                      'dists/bionic-updates/main/installer-ppc64el/'
+                      'current/images/netboot/ubuntu-installer/ppc64el/vmlinux')
+        kernel_hash = '2b8f6dae700aaee44a1371e878570bc9d4b77fa3'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        self.vm.set_machine('pseries')
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=hvc0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line, '-enable-kvm')
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
     def test_mips_malta(self):
         """
         :avocado: tags=arch:mips
-- 
2.21.0


