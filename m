Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8DE6144ED
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 08:13:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oplQy-00055o-My; Tue, 01 Nov 2022 03:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1oplQw-000548-60
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 03:11:38 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1oplQt-0001sM-5f
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 03:11:37 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N1h5D4pZTzHv5G;
 Tue,  1 Nov 2022 15:11:12 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 15:11:29 +0800
To: <mst@redhat.com>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
 <ani@anisinha.ca>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
 <f4bug@amsat.org>, <wangyanan55@huawei.com>, <qemu-devel@nongnu.org>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>
Subject: [PATCH v4 3/6] tests: virt: Update expected ACPI tables for virt test
Date: Tue, 1 Nov 2022 15:10:45 +0800
Message-ID: <20221101071048.29553-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20221101071048.29553-1-yangyicong@huawei.com>
References: <20221101071048.29553-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=yangyicong@huawei.com; helo=szxga02-in.huawei.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 tests/data/acpi/virt/PPTT                   | Bin 96 -> 76 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
index f56ea63b369a604877374ad696c396e796ab1c83..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
GIT binary patch
delta 32
fcmYfB;R*-{3GrcIU|?D?k;`ae01J-_kOKn%ZFdCM

delta 53
pcmeZC;0g!`2}xjJU|{l?$YrDgWH5jU5Ca567#O&Klm(arApowi1QY-O

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index cb143a55a6..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/PPTT",
-- 
2.24.0


