Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEEB2D3926
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 04:14:22 +0100 (CET)
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmpvp-00064z-7c
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 22:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpuC-0004Yx-6D; Tue, 08 Dec 2020 22:12:40 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpu7-0008N6-JJ; Tue, 08 Dec 2020 22:12:39 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CrMXd4QFDzhpcN;
 Wed,  9 Dec 2020 11:12:01 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Dec 2020
 11:12:18 +0800
From: zhouyang <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>
Subject: [PATCH v2 4/5] contrib: space required after that ','
Date: Wed, 9 Dec 2020 11:04:46 +0800
Message-ID: <20201209030447.2135652-5-zhouyang789@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201209030447.2135652-1-zhouyang789@huawei.com>
References: <20201209030447.2135652-1-zhouyang789@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhouyang789@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the issue below:
ERROR: space required after that ','

Signed-off-by: zhouyang <zhouyang789@huawei.com>
---
 contrib/plugins/howvec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 2f892da17d..9d6fa33297 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -68,7 +68,7 @@ static InsnClassExecCount aarch64_insn_classes[] = {
     { "Reserved",            "res",    0x1e000000, 0x00000000, COUNT_CLASS},
     /* Data Processing Immediate */
     { "  PCrel addr",        "pcrel",  0x1f000000, 0x10000000, COUNT_CLASS},
-    { "  Add/Sub (imm,tags)","asit",   0x1f800000, 0x11800000, COUNT_CLASS},
+    { "  Add/Sub (imm,tags)", "asit",   0x1f800000, 0x11800000, COUNT_CLASS},
     { "  Add/Sub (imm)",     "asi",    0x1f000000, 0x11000000, COUNT_CLASS},
     { "  Logical (imm)",     "logi",   0x1f800000, 0x12000000, COUNT_CLASS},
     { "  Move Wide (imm)",   "movwi",  0x1f800000, 0x12800000, COUNT_CLASS},
@@ -91,17 +91,17 @@ static InsnClassExecCount aarch64_insn_classes[] = {
     { "Branches",            "branch", 0x1c000000, 0x14000000, COUNT_CLASS},
     /* Loads and Stores */
     { "  AdvSimd ldstmult",  "advlsm", 0xbfbf0000, 0x0c000000, COUNT_CLASS},
-    { "  AdvSimd ldstmult++","advlsmp",0xbfb00000, 0x0c800000, COUNT_CLASS},
+    { "  AdvSimd ldstmult++", "advlsmp", 0xbfb00000, 0x0c800000, COUNT_CLASS},
     { "  AdvSimd ldst",      "advlss", 0xbf9f0000, 0x0d000000, COUNT_CLASS},
-    { "  AdvSimd ldst++",    "advlssp",0xbf800000, 0x0d800000, COUNT_CLASS},
+    { "  AdvSimd ldst++",    "advlssp", 0xbf800000, 0x0d800000, COUNT_CLASS},
     { "  ldst excl",         "ldstx",  0x3f000000, 0x08000000, COUNT_CLASS},
     { "    Prefetch",        "prfm",   0xff000000, 0xd8000000, COUNT_CLASS},
     { "  Load Reg (lit)",    "ldlit",  0x1b000000, 0x18000000, COUNT_CLASS},
-    { "  ldst noalloc pair", "ldstnap",0x3b800000, 0x28000000, COUNT_CLASS},
+    { "  ldst noalloc pair", "ldstnap", 0x3b800000, 0x28000000, COUNT_CLASS},
     { "  ldst pair",         "ldstp",  0x38000000, 0x28000000, COUNT_CLASS},
     { "  ldst reg",          "ldstr",  0x3b200000, 0x38000000, COUNT_CLASS},
     { "  Atomic ldst",       "atomic", 0x3b200c00, 0x38200000, COUNT_CLASS},
-    { "  ldst reg (reg off)","ldstro", 0x3b200b00, 0x38200800, COUNT_CLASS},
+    { "  ldst reg (reg off)", "ldstro", 0x3b200b00, 0x38200800, COUNT_CLASS},
     { "  ldst reg (pac)",    "ldstpa", 0x3b200200, 0x38200800, COUNT_CLASS},
     { "  ldst reg (imm)",    "ldsti",  0x3b000000, 0x39000000, COUNT_CLASS},
     { "Loads & Stores",      "ldst",   0x0a000000, 0x08000000, COUNT_CLASS},
@@ -202,7 +202,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 
     counts = g_hash_table_get_values(insns);
     if (counts && g_list_next(counts)) {
-        g_string_append_printf(report,"Individual Instructions:\n");
+        g_string_append_printf(report, "Individual Instructions:\n");
         counts = g_list_sort(counts, cmp_exec_count);
 
         for (i = 0; i < limit && g_list_next(counts);
-- 
2.23.0


