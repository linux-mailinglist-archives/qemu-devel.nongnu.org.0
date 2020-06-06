Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD8E1F03B7
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jun 2020 02:11:52 +0200 (CEST)
Received: from localhost ([::1]:51948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhMRD-0000i3-94
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 20:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vishal.l.verma@intel.com>)
 id 1jhMOw-0005gc-AC
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 20:09:30 -0400
Received: from mga02.intel.com ([134.134.136.20]:45990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vishal.l.verma@intel.com>)
 id 1jhMOv-0006IW-48
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 20:09:30 -0400
IronPort-SDR: yeCAwfBTXvFQ+B5Ifs31+UQaITEW7fMnQvXLYAjwcysdpYPocrc/j1RjHZNmtWqKx1sNOMLZN4
 noGjvR0nPoww==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 17:09:22 -0700
IronPort-SDR: 1YXrsLj0BX3XCIhfJUBRR5NzZyVU3orkGcLs4UQ6EC5kokvfSRPGxSaPLozJSvmE2tHxJXveD5
 s7YBa6ly/66w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,478,1583222400"; d="scan'208";a="294853326"
Received: from vverma7-mobl4.lm.intel.com ([10.254.185.105])
 by fmsmga004.fm.intel.com with ESMTP; 05 Jun 2020 17:09:21 -0700
From: Vishal Verma <vishal.l.verma@intel.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 3/3] tests/acpi: update expected SRAT files
Date: Fri,  5 Jun 2020 18:09:11 -0600
Message-Id: <20200606000911.9896-4-vishal.l.verma@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200606000911.9896-1-vishal.l.verma@intel.com>
References: <20200606000911.9896-1-vishal.l.verma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=vishal.l.verma@intel.com; helo=mga02.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 20:09:20
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jingqi.liu@intel.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update expected SRAT files for the change to account for NVDIMM NUMA
nodes in the SRAT.

AML diffs:

tests/data/acpi/pc/SRAT.dimmpxm:
--- /tmp/asl-3P2IL0.dsl	2020-05-28 15:11:02.326439263 -0600
+++ /tmp/asl-1N4IL0.dsl	2020-05-28 15:11:02.325439280 -0600
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20190509 (64-bit version)
  * Copyright (c) 2000 - 2019 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/SRAT.dimmpxm, Thu May 28 15:11:02 2020
+ * Disassembly of /tmp/aml-4D4IL0, Thu May 28 15:11:02 2020
  *
  * ACPI Data Table [SRAT]
  *
@@ -13,7 +13,7 @@
 [000h 0000   4]                    Signature : "SRAT"    [System Resource Affinity Table]
 [004h 0004   4]                 Table Length : 00000188
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 80
+[009h 0009   1]                     Checksum : 68
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPCSRAT"
 [018h 0024   4]                 Oem Revision : 00000001
@@ -140,15 +140,15 @@
 [138h 0312   1]                Subtable Type : 01 [Memory Affinity]
 [139h 0313   1]                       Length : 28

-[13Ah 0314   4]             Proximity Domain : 00000000
+[13Ah 0314   4]             Proximity Domain : 00000002
 [13Eh 0318   2]                    Reserved1 : 0000
-[140h 0320   8]                 Base Address : 0000000000000000
-[148h 0328   8]               Address Length : 0000000000000000
+[140h 0320   8]                 Base Address : 0000000108000000
+[148h 0328   8]               Address Length : 0000000008000000
 [150h 0336   4]                    Reserved2 : 00000000
-[154h 0340   4]        Flags (decoded below) : 00000000
-                                     Enabled : 0
+[154h 0340   4]        Flags (decoded below) : 00000005
+                                     Enabled : 1
                                Hot Pluggable : 0
-                                Non-Volatile : 0
+                                Non-Volatile : 1
 [158h 0344   8]                    Reserved3 : 0000000000000000

 [160h 0352   1]                Subtable Type : 01 [Memory Affinity]

tests/data/acpi/q35/SRAT.dimmpxm:
--- /tmp/asl-HW2LL0.dsl	2020-05-28 15:11:05.446384514 -0600
+++ /tmp/asl-8MYLL0.dsl	2020-05-28 15:11:05.445384532 -0600
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20190509 (64-bit version)
  * Copyright (c) 2000 - 2019 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/SRAT.dimmpxm, Thu May 28 15:11:05 2020
+ * Disassembly of /tmp/aml-2CYLL0, Thu May 28 15:11:05 2020
  *
  * ACPI Data Table [SRAT]
  *
@@ -13,7 +13,7 @@
 [000h 0000   4]                    Signature : "SRAT"    [System Resource Affinity Table]
 [004h 0004   4]                 Table Length : 00000188
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 80
+[009h 0009   1]                     Checksum : 68
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPCSRAT"
 [018h 0024   4]                 Oem Revision : 00000001
@@ -140,15 +140,15 @@
 [138h 0312   1]                Subtable Type : 01 [Memory Affinity]
 [139h 0313   1]                       Length : 28

-[13Ah 0314   4]             Proximity Domain : 00000000
+[13Ah 0314   4]             Proximity Domain : 00000002
 [13Eh 0318   2]                    Reserved1 : 0000
-[140h 0320   8]                 Base Address : 0000000000000000
-[148h 0328   8]               Address Length : 0000000000000000
+[140h 0320   8]                 Base Address : 0000000108000000
+[148h 0328   8]               Address Length : 0000000008000000
 [150h 0336   4]                    Reserved2 : 00000000
-[154h 0340   4]        Flags (decoded below) : 00000000
-                                     Enabled : 0
+[154h 0340   4]        Flags (decoded below) : 00000005
+                                     Enabled : 1
                                Hot Pluggable : 0
-                                Non-Volatile : 0
+                                Non-Volatile : 1
 [158h 0344   8]                    Reserved3 : 0000000000000000

 [160h 0352   1]                Subtable Type : 01 [Memory Affinity]

tests/data/acpi/virt/SRAT.memhp:
--- /tmp/asl-E32WL0.dsl	2020-05-28 15:19:56.976095582 -0600
+++ /tmp/asl-Y69WL0.dsl	2020-05-28 15:19:56.974095617 -0600
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20190509 (64-bit version)
  * Copyright (c) 2000 - 2019 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/SRAT.memhp, Thu May 28 15:19:56 2020
+ * Disassembly of /tmp/aml-2CCXL0, Thu May 28 15:19:56 2020
  *
  * ACPI Data Table [SRAT]
  *
@@ -11,9 +11,9 @@
  */

 [000h 0000   4]                    Signature : "SRAT"    [System Resource Affinity Table]
-[004h 0004   4]                 Table Length : 000000BA
+[004h 0004   4]                 Table Length : 000000E2
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 43
+[009h 0009   1]                     Checksum : 5C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPCSRAT"
 [018h 0024   4]                 Oem Revision : 00000001
@@ -65,18 +65,32 @@

 [094h 0148   4]             Proximity Domain : 00000001
 [098h 0152   2]                    Reserved1 : 0000
-[09Ah 0154   8]                 Base Address : 0000000080000000
-[0A2h 0162   8]               Address Length : 00000000F0000000
+[09Ah 0154   8]                 Base Address : 0000000088000000
+[0A2h 0162   8]               Address Length : 0000000008000000
 [0AAh 0170   4]                    Reserved2 : 00000000
-[0AEh 0174   4]        Flags (decoded below) : 00000003
+[0AEh 0174   4]        Flags (decoded below) : 00000005
+                                     Enabled : 1
+                               Hot Pluggable : 0
+                                Non-Volatile : 1
+[0B2h 0178   8]                    Reserved3 : 0000000000000000
+
+[0BAh 0186   1]                Subtable Type : 01 [Memory Affinity]
+[0BBh 0187   1]                       Length : 28
+
+[0BCh 0188   4]             Proximity Domain : 00000001
+[0C0h 0192   2]                    Reserved1 : 0000
+[0C2h 0194   8]                 Base Address : 0000000080000000
+[0CAh 0202   8]               Address Length : 00000000F0000000
+[0D2h 0210   4]                    Reserved2 : 00000000
+[0D6h 0214   4]        Flags (decoded below) : 00000003
                                      Enabled : 1
                                Hot Pluggable : 1
                                 Non-Volatile : 0
-[0B2h 0178   8]                    Reserved3 : 0000000000000000
+[0DAh 0218   8]                    Reserved3 : 0000000000000000

Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
---
 tests/data/acpi/pc/SRAT.dimmpxm             | Bin 392 -> 392 bytes
 tests/data/acpi/q35/SRAT.dimmpxm            | Bin 392 -> 392 bytes
 tests/data/acpi/virt/SRAT.memhp             | Bin 186 -> 226 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 4 files changed, 3 deletions(-)

diff --git a/tests/data/acpi/pc/SRAT.dimmpxm b/tests/data/acpi/pc/SRAT.dimmpxm
index f5c0267ea24bb404b6b4e687390140378fbdc3f1..5a13c61b9041c6045c29643bf93a111fb1c0c76a 100644
GIT binary patch
delta 51
scmeBR?qKE$4ss0XU}Rum%-G0fz$nec00kUCF%aN@Pz(&LlS3Je0lmQmhyVZp

delta 51
icmeBR?qKE$4ss0XU}RumY}m+Uz$ndt8%z#mGzI{_tp$hx

diff --git a/tests/data/acpi/q35/SRAT.dimmpxm b/tests/data/acpi/q35/SRAT.dimmpxm
index f5c0267ea24bb404b6b4e687390140378fbdc3f1..5a13c61b9041c6045c29643bf93a111fb1c0c76a 100644
GIT binary patch
delta 51
scmeBR?qKE$4ss0XU}Rum%-G0fz$nec00kUCF%aN@Pz(&LlS3Je0lmQmhyVZp

delta 51
icmeBR?qKE$4ss0XU}RumY}m+Uz$ndt8%z#mGzI{_tp$hx

diff --git a/tests/data/acpi/virt/SRAT.memhp b/tests/data/acpi/virt/SRAT.memhp
index 1b57db2072e7f7e2085c4a427aa31c7383851b71..9a35adb40c6f7cd822e5af37abba8aad033617cb 100644
GIT binary patch
delta 43
rcmdnR_=u4!ILI;N5d#AQbIe4p$wD1K76@=aC<X@BiSc3+=gI;A(y0ha

delta 21
dcmaFFxQmf1ILI+%7Xt$Wv-3o*$rF#t0suzv27~|r

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index e8f2766a63..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/SRAT.dimmpxm",
-"tests/data/acpi/q35/SRAT.dimmpxm",
-"tests/data/acpi/virt/SRAT.memhp",
-- 
2.26.2


