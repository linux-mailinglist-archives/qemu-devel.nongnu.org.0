Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831706589C9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 07:56:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAmpU-0003pK-UX; Thu, 29 Dec 2022 01:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1pAmpT-0003p0-9L
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 01:55:51 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1pAmpQ-0002AG-8A
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 01:55:50 -0500
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NjJv76523zkX6F;
 Thu, 29 Dec 2022 14:50:59 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 29 Dec 2022 14:55:32 +0800
To: <mst@redhat.com>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
 <ani@anisinha.ca>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
 <f4bug@amsat.org>, <wangyanan55@huawei.com>, <qemu-devel@nongnu.org>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>
Subject: [PATCH v5 3/6] tests: virt: Update expected ACPI tables for virt test
Date: Thu, 29 Dec 2022 14:55:10 +0800
Message-ID: <20221229065513.55652-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20221229065513.55652-1-yangyicong@huawei.com>
References: <20221229065513.55652-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=yangyicong@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Yicong Yang <yangyicong@hisilicon.com>

Update the ACPI tables according to the acpi aml_build change, also
empty bios-tables-test-allowed-diff.h.

The disassembled differences between actual and expected PPTT:

  /*
   * Intel ACPI Component Architecture
   * AML/ASL+ Disassembler version 20180105 (64-bit version)
   * Copyright (c) 2000 - 2018 Intel Corporation
   *
 - * Disassembly of tests/data/acpi/virt/PPTT, Tue Nov  1 09:29:12 2022
 + * Disassembly of /tmp/aml-DIIGV1, Tue Nov  1 09:29:12 2022
   *
   * ACPI Data Table [PPTT]
   *
   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
   */

  [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
 -[004h 0004   4]                 Table Length : 00000060
 +[004h 0004   4]                 Table Length : 0000004C
  [008h 0008   1]                     Revision : 02
 -[009h 0009   1]                     Checksum : 48
 +[009h 0009   1]                     Checksum : A8
  [00Ah 0010   6]                       Oem ID : "BOCHS "
  [010h 0016   8]                 Oem Table ID : "BXPC    "
  [018h 0024   4]                 Oem Revision : 00000001
  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
  [020h 0032   4]        Asl Compiler Revision : 00000001

  [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [025h 0037   1]                       Length : 14
  [026h 0038   2]                     Reserved : 0000
  [028h 0040   4]        Flags (decoded below) : 00000001
                              Physical package : 1
                       ACPI Processor ID valid : 0
  [02Ch 0044   4]                       Parent : 00000000
  [030h 0048   4]            ACPI Processor ID : 00000000
  [034h 0052   4]      Private Resource Number : 00000000

  [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [039h 0057   1]                       Length : 14
  [03Ah 0058   2]                     Reserved : 0000
 -[03Ch 0060   4]        Flags (decoded below) : 00000000
 +[03Ch 0060   4]        Flags (decoded below) : 0000000A
                              Physical package : 0
 -                     ACPI Processor ID valid : 0
 +                     ACPI Processor ID valid : 1
  [040h 0064   4]                       Parent : 00000024
  [044h 0068   4]            ACPI Processor ID : 00000000
  [048h 0072   4]      Private Resource Number : 00000000

 -[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
 -[04Dh 0077   1]                       Length : 14
 -[04Eh 0078   2]                     Reserved : 0000
 -[050h 0080   4]        Flags (decoded below) : 0000000A
 -                            Physical package : 0
 -                     ACPI Processor ID valid : 1
 -[054h 0084   4]                       Parent : 00000038
 -[058h 0088   4]            ACPI Processor ID : 00000000
 -[05Ch 0092   4]      Private Resource Number : 00000000
 -
 -Raw Table Data: Length 96 (0x60)
 +Raw Table Data: Length 76 (0x4C)

 -  0000: 50 50 54 54 60 00 00 00 02 48 42 4F 43 48 53 20  // PPTT`....HBOCHS
 +  0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
 -  0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 -  0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
 -  0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........
 +  0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
 +  0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........

PPTT.acpihmatvirt is also updated:
  /*
   * Intel ACPI Component Architecture
   * AML/ASL+ Disassembler version 20180105 (64-bit version)
   * Copyright (c) 2000 - 2018 Intel Corporation
   *
 - * Disassembly of tests/data/acpi/virt/PPTT.acpihmatvirt, Wed Dec 28 15:36:06 2022
 + * Disassembly of /tmp/aml-IPKJX1, Wed Dec 28 15:36:06 2022
   *
   * ACPI Data Table [PPTT]
   *
   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
   */

  [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
 -[004h 0004   4]                 Table Length : 000000C4
 +[004h 0004   4]                 Table Length : 0000009C
  [008h 0008   1]                     Revision : 02
 -[009h 0009   1]                     Checksum : 9E
 +[009h 0009   1]                     Checksum : FE
  [00Ah 0010   6]                       Oem ID : "BOCHS "
  [010h 0016   8]                 Oem Table ID : "BXPC    "
  [018h 0024   4]                 Oem Revision : 00000001
  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
  [020h 0032   4]        Asl Compiler Revision : 00000001

  [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [025h 0037   1]                       Length : 14
  [026h 0038   2]                     Reserved : 0000
  [028h 0040   4]        Flags (decoded below) : 00000001
                              Physical package : 1
                       ACPI Processor ID valid : 0
  [02Ch 0044   4]                       Parent : 00000000
  [030h 0048   4]            ACPI Processor ID : 00000000
  [034h 0052   4]      Private Resource Number : 00000000

  [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [039h 0057   1]                       Length : 14
  [03Ah 0058   2]                     Reserved : 0000
 -[03Ch 0060   4]        Flags (decoded below) : 00000000
 +[03Ch 0060   4]        Flags (decoded below) : 0000000A
                              Physical package : 0
 -                     ACPI Processor ID valid : 0
 +                     ACPI Processor ID valid : 1
  [040h 0064   4]                       Parent : 00000024
  [044h 0068   4]            ACPI Processor ID : 00000000
  [048h 0072   4]      Private Resource Number : 00000000

  [04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [04Dh 0077   1]                       Length : 14
  [04Eh 0078   2]                     Reserved : 0000
  [050h 0080   4]        Flags (decoded below) : 0000000A
                              Physical package : 0
                       ACPI Processor ID valid : 1
 -[054h 0084   4]                       Parent : 00000038
 -[058h 0088   4]            ACPI Processor ID : 00000000
 +[054h 0084   4]                       Parent : 00000024
 +[058h 0088   4]            ACPI Processor ID : 00000001
  [05Ch 0092   4]      Private Resource Number : 00000000

  [060h 0096   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [061h 0097   1]                       Length : 14
  [062h 0098   2]                     Reserved : 0000
 -[064h 0100   4]        Flags (decoded below) : 0000000A
 -                            Physical package : 0
 -                     ACPI Processor ID valid : 1
 -[068h 0104   4]                       Parent : 00000038
 +[064h 0100   4]        Flags (decoded below) : 00000001
 +                            Physical package : 1
 +                     ACPI Processor ID valid : 0
 +[068h 0104   4]                       Parent : 00000000
  [06Ch 0108   4]            ACPI Processor ID : 00000001
  [070h 0112   4]      Private Resource Number : 00000000

  [074h 0116   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [075h 0117   1]                       Length : 14
  [076h 0118   2]                     Reserved : 0000
 -[078h 0120   4]        Flags (decoded below) : 00000001
 -                            Physical package : 1
 -                     ACPI Processor ID valid : 0
 -[07Ch 0124   4]                       Parent : 00000000
 -[080h 0128   4]            ACPI Processor ID : 00000001
 +[078h 0120   4]        Flags (decoded below) : 0000000A
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[07Ch 0124   4]                       Parent : 00000060
 +[080h 0128   4]            ACPI Processor ID : 00000002
  [084h 0132   4]      Private Resource Number : 00000000

  [088h 0136   1]                Subtable Type : 00 [Processor Hierarchy Node]
  [089h 0137   1]                       Length : 14
  [08Ah 0138   2]                     Reserved : 0000
 -[08Ch 0140   4]        Flags (decoded below) : 00000000
 -                            Physical package : 0
 -                     ACPI Processor ID valid : 0
 -[090h 0144   4]                       Parent : 00000074
 -[094h 0148   4]            ACPI Processor ID : 00000000
 -[098h 0152   4]      Private Resource Number : 00000000
 -
 -[09Ch 0156   1]                Subtable Type : 00 [Processor Hierarchy Node]
 -[09Dh 0157   1]                       Length : 14
 -[09Eh 0158   2]                     Reserved : 0000
 -[0A0h 0160   4]        Flags (decoded below) : 0000000A
 -                            Physical package : 0
 -                     ACPI Processor ID valid : 1
 -[0A4h 0164   4]                       Parent : 00000088
 -[0A8h 0168   4]            ACPI Processor ID : 00000002
 -[0ACh 0172   4]      Private Resource Number : 00000000
 -
 -[0B0h 0176   1]                Subtable Type : 00 [Processor Hierarchy Node]
 -[0B1h 0177   1]                       Length : 14
 -[0B2h 0178   2]                     Reserved : 0000
 -[0B4h 0180   4]        Flags (decoded below) : 0000000A
 +[08Ch 0140   4]        Flags (decoded below) : 0000000A
                              Physical package : 0
                       ACPI Processor ID valid : 1
 -[0B8h 0184   4]                       Parent : 00000088
 -[0BCh 0188   4]            ACPI Processor ID : 00000003
 -[0C0h 0192   4]      Private Resource Number : 00000000
 +[090h 0144   4]                       Parent : 00000060
 +[094h 0148   4]            ACPI Processor ID : 00000003
 +[098h 0152   4]      Private Resource Number : 00000000

 -Raw Table Data: Length 196 (0xC4)
 +Raw Table Data: Length 156 (0x9C)

 -  0000: 50 50 54 54 C4 00 00 00 02 9E 42 4F 43 48 53 20  // PPTT......BOCHS
 +  0000: 50 50 54 54 9C 00 00 00 02 FE 42 4F 43 48 53 20  // PPTT......BOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
 -  0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 +  0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
    0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
 -  0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........
 -  0060: 00 14 00 00 0A 00 00 00 38 00 00 00 01 00 00 00  // ........8.......
 -  0070: 00 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
 -  0080: 01 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 -  0090: 74 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // t...............
 -  00A0: 0A 00 00 00 88 00 00 00 02 00 00 00 00 00 00 00  // ................
 -  00B0: 00 14 00 00 0A 00 00 00 88 00 00 00 03 00 00 00  // ................
 -  00C0: 00 00 00 00                                      // ....
 +  0050: 0A 00 00 00 24 00 00 00 01 00 00 00 00 00 00 00  // ....$...........
 +  0060: 00 14 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
 +  0070: 00 00 00 00 00 14 00 00 0A 00 00 00 60 00 00 00  // ............`...
 +  0080: 02 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
 +  0090: 60 00 00 00 03 00 00 00 00 00 00 00              // `...........

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 tests/data/acpi/virt/PPTT                   | Bin 96 -> 76 bytes
 tests/data/acpi/virt/PPTT.acpihmatvirt      | Bin 196 -> 156 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 3 files changed, 2 deletions(-)

diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
index f56ea63b369a604877374ad696c396e796ab1c83..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
GIT binary patch
delta 32
fcmYfB;R*-{3GrcIU|?D?k;`ae01J-_kOKn%ZFdCM

delta 53
pcmeZC;0g!`2}xjJU|{l?$YrDgWH5jU5Ca567#O&Klm(arApowi1QY-O

diff --git a/tests/data/acpi/virt/PPTT.acpihmatvirt b/tests/data/acpi/virt/PPTT.acpihmatvirt
index 710dba5e793cf36df94087666db58af5f8d03684..4eef303a5b6168c6bc3795c2e2c53f65b4c4cfd4 100644
GIT binary patch
delta 66
zcmX@YIERrdARr`U4g&)N)4z#aMiT>ACOU{Ps!YsOR^b8)CV(V>7z{)h7+_+|P$2-t
C;0Zeb

delta 75
zcmbQkc!ZHFARr{<2m=EH)4YjXMvM#-ZN(WaCOQfOiBM%$pg2Pbkf+cAQUT(DfCvKv
N7mxypF@yL(0023a3f%wz

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index fc12cd8c5c..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/PPTT",
-"tests/data/acpi/virt/PPTT.acpihmatvirt",
-- 
2.24.0


