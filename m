Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB81631028A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 03:06:12 +0100 (CET)
Received: from localhost ([::1]:41890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7qVf-0007X8-Qc
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 21:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1l7qN6-0004SW-P8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 20:57:20 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1l7qN2-0006yj-EL
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 20:57:20 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DWz6771Z6zjGhN;
 Fri,  5 Feb 2021 09:55:59 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Feb 2021
 09:56:55 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <imammedo@redhat.com>
Subject: [PATCH 3/3] acpi: Update _CCA attribute in DSDT.pxb
Date: Fri, 5 Feb 2021 01:56:45 +0000
Message-ID: <1612490205-48788-4-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1612490205-48788-1-git-send-email-wangxingang5@huawei.com>
References: <1612490205-48788-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangxingang5@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Feb 2021 21:04:20 -0500
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

A new _CCA attribute is added.

Update expected DSDT files accordingly, and re-enable their testing.

Full diff of changed files disassembly:

  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of DSDT.pxb, Thu Feb  4 21:07:42 2021
+ * Disassembly of DSDT.pxb, Thu Feb  4 21:06:59 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001E09 (7689)
+ *     Length           0x00001E0F (7695)
  *     Revision         0x02
- *     Checksum         0x30
+ *     Checksum         0xEF
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -642,6 +642,7 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPCDSDT", 0x00000001)
             Name (_BBN, 0x80)  // _BBN: BIOS Bus Number
             Name (_UID, 0x80)  // _UID: Unique ID
             Name (_STR, Unicode ("pxb Device"))  // _STR: Description String
+            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
             Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
             {
                 Package (0x04)

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 tests/data/acpi/virt/DSDT.pxb               | Bin 7689 -> 7695 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/virt/DSDT.pxb
index ce3b67dff277e23f43925b1adcbb55c9d0b4eee3..b060a90dcdd6e067195c0db6a48a7ceab366f6de 100644
GIT binary patch
delta 40
wcmeCQ>9^r>33dtLmt$aHdOwj%nz3u6nj|Nq=VS-YfX)8GB^;ao33BrQ0Nh#&0ssI2

delta 40
vcmeCT>9pZ;33dtLlw)9EGMLCE&DgS0O_Gz*d9nj%z~*S-JdVvQLfkw6!^;Ui

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 90c53925fc..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/DSDT.pxb",
-- 
2.19.1


