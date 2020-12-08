Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC6B2D2E07
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:19:46 +0100 (CET)
Received: from localhost ([::1]:38066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmemH-00088T-GX
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmc7W-0005Aw-Gj; Tue, 08 Dec 2020 07:29:30 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmc7R-0007oj-UX; Tue, 08 Dec 2020 07:29:30 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqzxK5yV5z15Z2x;
 Tue,  8 Dec 2020 20:28:37 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Tue, 8 Dec 2020
 20:29:02 +0800
From: "zhouyang (T)" <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>
Subject: [PATCH 1/5] contrib: Don't use '#' flag of printf format
Date: Tue, 8 Dec 2020 20:21:30 +0800
Message-ID: <20201208122134.3308101-2-zhouyang789@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201208122134.3308101-1-zhouyang789@huawei.com>
References: <20201208122134.3308101-1-zhouyang789@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhouyang789@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 08 Dec 2020 10:10:03 -0500
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

I found some style problems while check the code using checkpatch.pl.
This commit fixs the misuse of '#' flag of printf format

Signed-off-by: zhouyang (T) <zhouyang789@huawei.com>
---
 contrib/plugins/hotblocks.c | 2 +-
 contrib/plugins/hotpages.c  | 2 +-
 contrib/plugins/howvec.c    | 2 +-
 contrib/plugins/lockstep.c  | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 37435a3fc7..4b08340143 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -63,7 +63,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 
         for (i = 0; i < limit && it->next; i++, it = it->next) {
             ExecCount *rec = (ExecCount *) it->data;
-            g_string_append_printf(report, "%#016"PRIx64", %d, %ld, %"PRId64"\n",
+            g_string_append_printf(report, "0x%016"PRIx64", %d, %ld, %"PRId64"\n",
                                    rec->start_addr, rec->trans_count,
                                    rec->insns, rec->exec_count);
         }
diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index ecd6c18732..eacc678eac 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -88,7 +88,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
         for (i = 0; i < limit && it->next; i++, it = it->next) {
             PageCounters *rec = (PageCounters *) it->data;
             g_string_append_printf(report,
-                                   "%#016"PRIx64", 0x%04x, %"PRId64
+                                   "0x%016"PRIx64", 0x%04x, %"PRId64
                                    ", 0x%04x, %"PRId64"\n",
                                    rec->page_address,
                                    rec->cpu_read, rec->reads,
diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 3b9a6939f2..6e602aaccf 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -209,7 +209,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
              i++, counts = g_list_next(counts)) {
             InsnExecCount *rec = (InsnExecCount *) counts->data;
             g_string_append_printf(report,
-                                   "Instr: %-24s\t(%ld hits)\t(op=%#08x/%s)\n",
+                                   "Instr: %-24s\t(%ld hits)\t(op=0x%08x/%s)\n",
                                    rec->insn,
                                    rec->count,
                                    rec->opcode,
diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 5aad50869d..7fd35eb669 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -134,7 +134,7 @@ static void report_divergance(ExecState *us, ExecState *them)
 
     /* Output short log entry of going out of sync... */
     if (verbose || divrec.distance == 1 || diverged) {
-        g_string_printf(out, "@ %#016lx vs %#016lx (%d/%d since last)\n",
+        g_string_printf(out, "@ 0x%016lx vs 0x%016lx (%d/%d since last)\n",
                         us->pc, them->pc, g_slist_length(divergence_log),
                         divrec.distance);
         qemu_plugin_outs(out->str);
@@ -144,7 +144,7 @@ static void report_divergance(ExecState *us, ExecState *them)
         int i;
         GSList *entry;
 
-        g_string_printf(out, "Δ insn_count @ %#016lx (%ld) vs %#016lx (%ld)\n",
+        g_string_printf(out, "Δ insn_count @ 0x%016lx (%ld) vs 0x%016lx (%ld)\n",
                         us->pc, us->insn_count, them->pc, them->insn_count);
 
         for (entry = log, i = 0;
@@ -152,7 +152,7 @@ static void report_divergance(ExecState *us, ExecState *them)
              entry = g_slist_next(entry), i++) {
             ExecInfo *prev = (ExecInfo *) entry->data;
             g_string_append_printf(out,
-                                   "  previously @ %#016lx/%ld (%ld insns)\n",
+                                   "  previously @ 0x%016lx/%ld (%ld insns)\n",
                                    prev->block->pc, prev->block->insns,
                                    prev->insn_count);
         }
-- 
2.23.0


