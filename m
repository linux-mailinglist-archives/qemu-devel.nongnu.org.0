Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D1CE83B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 17:48:26 +0200 (CEST)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHVFI-0000C5-RI
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 11:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iHUwO-0002fb-L9
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 11:28:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iHUwK-0005Bu-W9
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 11:28:52 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41834)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iHUwK-0005BR-Kx
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 11:28:48 -0400
Received: by mail-wr1-x442.google.com with SMTP id q9so15849282wrm.8
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2019 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/O/UgEaGYt9Y+FF6QjgMS4U3ASkLFc3mv9nkgvjFUmw=;
 b=y4V6Nh2dh9EpjX9c0cOKA47/Aq3gSleHgua35/dIfu1Fi0pctZdZqFnDjpM7YtE7Tz
 KZ1LoUZfEZ1buhLxfpZa10ZYGcr0xEjEQTMm71DjOg88V9G/R/5X8Q01EGZ6/ZDfXKoS
 lNXdyNd7xcEeAAr/91XtP6gJ0E0mYn10Y2Q59L7QQPr5cQBEK2ata0LmIJFNTUjE1Eg9
 mn1p4lJ688G1oqjZmeBV8ipNluK/Jg5Y1picBK0M5ifN5jVcvOWYE/OYzZ9c+F3BXWxi
 0mk92cggqkOBCVwHcZP4ZY6T9Cm8yig5II3ve1t633SRQgzTfTNm/J+SJF4yvIX2aGH4
 Xgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/O/UgEaGYt9Y+FF6QjgMS4U3ASkLFc3mv9nkgvjFUmw=;
 b=dzdA6/9CnttPfARw/fyQNBQks5Ac2HcmRM76lij7hS0RHZhsnLqSKKIMDcyCs3cncu
 BTonyCbuuj7oDTscv/BuzEgqpI6eZL7WuNFv5ifyRbzSD7P+Wxz39nptllyIrirgo+UD
 t4kMuhbraiy35+O0/CMnnbKVO9sxlaljdVceQJpGZvjIqFVG523myh5dxqJ1XxppdBIp
 pTMmcWf8CBk7yOy69QC0fWnga2etxvQDNxq2/0uA8aEXAgE36tUdOtF1oWl+LDh/fMDA
 WtU43TDNENTMap+cUFkyHnkjJlIthkIKQlvP/vqKCHSSN2L7/xb4f1PdSCbkGiAaTNTQ
 pIEA==
X-Gm-Message-State: APjAAAWIiJJweQQVsnm3ydqusX/NkfZ39Gw70AvAreX4Bt+7mKGFkaIW
 bLwMuemGK3Xeb68z8fwsEMXxfQ==
X-Google-Smtp-Source: APXvYqzgTqpxdRILjFSJKmJJv6+1bTCyKA696snsS0YUCzwGe4rEPVh8hPSR07yTtejwV852aaehyg==
X-Received: by 2002:a05:6000:108c:: with SMTP id
 y12mr21928439wrw.238.1570462127138; 
 Mon, 07 Oct 2019 08:28:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h7sm15903821wrs.15.2019.10.07.08.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:28:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 446851FF99;
 Mon,  7 Oct 2019 16:28:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v9 09/13] Adding info [tb-list|tb] commands to HMP (WIP)
Date: Mon,  7 Oct 2019 16:28:35 +0100
Message-Id: <20191007152839.30804-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007152839.30804-1-alex.bennee@linaro.org>
References: <20191007152839.30804-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>

These commands allow the exploration of TBs generated by the TCG.
Understand which one hotter, with more guest/host instructions... and
examine their guest, host and IR code.

The goal of this command is to allow the dynamic exploration of TCG
behavior and code quality. Therefore, for now, a corresponding QMP
command is not worthwhile.

[AJB: WIP - we still can't be safely sure a translation will succeed]

Example of output:

TB id:1 | phys:0x34d54 virt:0x0000000000034d54 flags:0x0000f0
	| exec:4828932/0 guest inst cov:16.38%
	| trans:1 ints: g:3 op:82 op_opt:34 spills:3
	| h/g (host bytes / guest insts): 90.666664
	| time to gen at 2.4GHz => code:3150.83(ns) IR:712.08(ns)
	| targets: 0x0000000000034d5e (id:11), 0x0000000000034d0d (id:2)

TB id:2 | phys:0x34d0d virt:0x0000000000034d0d flags:0x0000f0
	| exec:4825842/0 guest inst cov:21.82%
	| trans:1 ints: g:4 op:80 op_opt:38 spills:2
	| h/g (host bytes / guest insts): 84.000000
	| time to gen at 2.4GHz => code:3362.92(ns) IR:793.75(ns)
	| targets: 0x0000000000034d19 (id:12), 0x0000000000034d54 (id:1)

TB id:2 | phys:0x34d0d virt:0x0000000000034d0d flags:0x0000f0
	| exec:6956495/0  guest inst cov:21.82%
	| trans:2 ints: g:2 op:40 op_opt:19 spills:1
	| h/g (host bytes / guest insts): 84.000000
	| time to gen at 2.4GHz => code:3130.83(ns) IR:722.50(ns)
	| targets: 0x0000000000034d19 (id:12), 0x0000000000034d54 (id:1)

----------------
IN:
0x00034d0d:  89 de                    movl     %ebx, %esi
0x00034d0f:  26 8b 0e                 movl     %es:(%esi), %ecx
0x00034d12:  26 f6 46 08 80           testb    $0x80, %es:8(%esi)
0x00034d17:  75 3b                    jne      0x34d54

------------------------------

TB id:1 | phys:0x34d54 virt:0x0000000000034d54 flags:0x0000f0
	| exec:5202686/0 guest inst cov:11.28%
	| trans:1 ints: g:3 op:82 op_opt:34 spills:3
	| h/g (host bytes / guest insts): 90.666664
	| time to gen at 2.4GHz => code:2793.75(ns) IR:614.58(ns)
	| targets: 0x0000000000034d5e (id:3), 0x0000000000034d0d (id:2)

TB id:2 | phys:0x34d0d virt:0x0000000000034d0d flags:0x0000f0
	| exec:5199468/0 guest inst cov:15.03%
	| trans:1 ints: g:4 op:80 op_opt:38 spills:2
	| h/g (host bytes / guest insts): 84.000000
	| time to gen at 2.4GHz => code:2958.75(ns) IR:719.58(ns)
	| targets: 0x0000000000034d19 (id:4), 0x0000000000034d54 (id:1)

------------------------------
2 TBs to reach 25% of guest inst exec coverage
Total of guest insts exec: 138346727

------------------------------

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
Message-Id: <20190829173437.5926-10-vandersonmr2@gmail.com>
[AJB: fix authorship, dropped coverset]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
AJB
  - dropped coverset for now
  - check tbs list for valid translations
  - document the valid but unreachable TLB case
---
 accel/tcg/tb-stats.c         | 319 ++++++++++++++++++++++++++++++++++-
 disas.c                      |  31 +++-
 hmp-commands-info.hx         |  16 ++
 include/exec/tb-stats.h      |  33 +++-
 include/qemu/log-for-trace.h |   4 +
 include/qemu/log.h           |   2 +
 monitor/misc.c               |  52 ++++++
 util/log.c                   |  54 ++++--
 8 files changed, 491 insertions(+), 20 deletions(-)

diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
index f08e5f2540..3c1cc8cd06 100644
--- a/accel/tcg/tb-stats.c
+++ b/accel/tcg/tb-stats.c
@@ -28,9 +28,23 @@ static enum TBStatsStatus tcg_collect_tb_stats;
 static uint32_t default_tbstats_flag;
 /* only accessed in safe work */
 static GList *last_search;
-
+static int id = 1; /* display_id increment counter */
 uint64_t dev_time;
 
+static TBStatistics *get_tbstats_by_id(int id)
+{
+    GList *iter;
+
+    for (iter = last_search; iter; iter = g_list_next(iter)) {
+        TBStatistics *tbs = iter->data;
+        if (tbs && tbs->display_id == id) {
+            return tbs;
+            break;
+        }
+    }
+    return NULL;
+}
+
 struct jit_profile_info {
     uint64_t translations;
     uint64_t aborted;
@@ -274,6 +288,309 @@ void init_tb_stats_htable_if_not(void)
     }
 }
 
+static void collect_tb_stats(void *p, uint32_t hash, void *userp)
+{
+    last_search = g_list_prepend(last_search, p);
+}
+
+static void count_invalid_tbs(gpointer data, gpointer user_data)
+{
+    TranslationBlock *tb = (TranslationBlock *) data;
+    unsigned *counter = (unsigned *) user_data;
+    if (tb->cflags & CF_INVALID) {
+        *counter = *counter + 1;
+    }
+}
+
+static int dump_tb_header(TBStatistics *tbs)
+{
+    unsigned g = stat_per_translation(tbs, code.num_guest_inst);
+    unsigned ops = stat_per_translation(tbs, code.num_tcg_ops);
+    unsigned ops_opt = stat_per_translation(tbs, code.num_tcg_ops_opt);
+    unsigned spills = stat_per_translation(tbs, code.spills);
+    unsigned h = stat_per_translation(tbs, code.out_len);
+    unsigned act = tbs->tbs->len;
+    unsigned invalid = 0;
+
+    float guest_host_prop = g ? ((float) h / g) : 0;
+
+    g_ptr_array_foreach(tbs->tbs, &count_invalid_tbs, &invalid);
+
+    qemu_log("TB id:%d | phys:0x"TB_PAGE_ADDR_FMT" virt:0x"TARGET_FMT_lx
+             " flags:%#08x %d inv/%d\n",
+             tbs->display_id, tbs->phys_pc, tbs->pc, tbs->flags,
+             invalid, act);
+
+    if (tbs_stats_enabled(tbs, TB_EXEC_STATS)) {
+        qemu_log("\t| exec:%lu/%lu guest inst cov:%.2f%%\n", tbs->executions.normal,
+                tbs->executions.atomic, tbs->executions.coverage / 100.0f);
+    }
+
+    if (tbs_stats_enabled(tbs, TB_JIT_STATS)) {
+        qemu_log("\t| trans:%lu ints: g:%u op:%u op_opt:%u spills:%d"
+             "\n\t| h/g (host bytes / guest insts): %f\n",
+             tbs->translations.total, g, ops, ops_opt, spills, guest_host_prop);
+    }
+
+    if (tbs_stats_enabled(tbs, TB_JIT_TIME)) {
+        qemu_log("\t| time to gen at 2.4GHz => code:%0.2lf(ns) IR:%0.2lf(ns)\n",
+             tbs->time.code / 2.4, tbs->time.interm / 2.4);
+    }
+
+    qemu_log("\n");
+
+    return act - invalid;
+}
+
+static gint
+inverse_sort_tbs(gconstpointer p1, gconstpointer p2, gpointer psort_by)
+{
+    const TBStatistics *tbs1 = (TBStatistics *) p1;
+    const TBStatistics *tbs2 = (TBStatistics *) p2;
+    int sort_by = *((int *) psort_by);
+    unsigned long c1 = 0;
+    unsigned long c2 = 0;
+
+    if (likely(sort_by == SORT_BY_SPILLS)) {
+        c1 = stat_per_translation(tbs1, code.spills);
+        c2 = stat_per_translation(tbs2, code.spills);
+    } else if (likely(sort_by == SORT_BY_HOTNESS)) {
+        c1 = stat_per_translation(tbs1, executions.normal);
+        c2 = stat_per_translation(tbs2, executions.normal);
+    } else if (likely(sort_by == SORT_BY_HG)) {
+        if (tbs1->code.num_guest_inst == 0) {
+            return -1;
+        }
+        if (tbs2->code.num_guest_inst == 0) {
+            return 1;
+        }
+
+        float a =
+            (float) stat_per_translation(tbs1, code.out_len) / tbs1->code.num_guest_inst;
+        float b =
+            (float) stat_per_translation(tbs2, code.out_len) / tbs2->code.num_guest_inst;
+        c1 = a <= b ? 0 : 1;
+        c2 = a <= b ? 1 : 0;
+    }
+
+    return c1 < c2 ? 1 : c1 == c2 ? 0 : -1;
+}
+
+static void dump_last_search_headers(int count)
+{
+    if (!last_search) {
+        qemu_log("No data collected yet\n");
+        return;
+    }
+
+    GList *l = last_search;
+    while (l != NULL && count--) {
+        TBStatistics *tbs = (TBStatistics *) l->data;
+        GList *next = l->next;
+        dump_tb_header(tbs);
+        l = next;
+    }
+}
+
+static uint64_t calculate_last_search_coverages(void)
+{
+    uint64_t total_exec_count = 0;
+    GList *i;
+
+    /* Compute total execution count for all tbs */
+    for (i = last_search; i; i = i->next) {
+        TBStatistics *tbs = (TBStatistics *) i->data;
+        total_exec_count +=
+            (tbs->executions.atomic + tbs->executions.normal) * tbs->code.num_guest_inst;
+    }
+
+    for (i = last_search; i; i = i->next) {
+        TBStatistics *tbs = (TBStatistics *) i->data;
+        uint64_t tb_total_execs =
+            (tbs->executions.atomic + tbs->executions.normal) * tbs->code.num_guest_inst;
+        tbs->executions.coverage = (10000 * tb_total_execs) / (total_exec_count + 1);
+    }
+
+    return total_exec_count;
+}
+
+static void do_dump_tbs_info(int total, int sort_by)
+{
+    id = 1;
+    GList *i;
+    int count = total;
+
+    g_list_free(last_search);
+    last_search = NULL;
+
+    qht_iter(&tb_ctx.tb_stats, collect_tb_stats, NULL);
+
+    last_search = g_list_sort_with_data(last_search, inverse_sort_tbs, &sort_by);
+
+    if (!last_search) {
+        qemu_printf("No data collected yet!\n");
+        return;
+    }
+
+    calculate_last_search_coverages();
+
+    for (i = last_search; i && count--; i = i->next) {
+        TBStatistics *tbs = (TBStatistics *) i->data;
+        tbs->display_id = id++;
+    }
+
+    /* free the unused bits */
+    if (i) {
+        if (i->next) {
+            i->next->prev = NULL;
+        }
+        g_list_free(i->next);
+        i->next = NULL;
+    }
+
+    dump_last_search_headers(total);
+}
+
+struct tbs_dump_info {
+    int count;
+    int sort_by;
+};
+
+static void do_dump_tbs_info_safe(CPUState *cpu, run_on_cpu_data tbdi)
+{
+    struct tbs_dump_info *info = tbdi.host_ptr;
+    qemu_log_to_monitor(true);
+    do_dump_tbs_info(info->count, info->sort_by);
+    qemu_log_to_monitor(false);
+    g_free(info);
+}
+
+/*
+ * When we dump_tbs_info on a live system via the HMP we want to
+ * ensure the system is quiessent before we start outputting stuff.
+ * Otherwise we could pollute the output with other logging output.
+ */
+
+void dump_tbs_info(int count, int sort_by, bool use_monitor)
+{
+    if (use_monitor) {
+        struct tbs_dump_info *tbdi = g_new(struct tbs_dump_info, 1);
+        tbdi->count = count;
+        tbdi->sort_by = sort_by;
+        async_safe_run_on_cpu(first_cpu, do_dump_tbs_info_safe,
+                              RUN_ON_CPU_HOST_PTR(tbdi));
+    } else {
+        do_dump_tbs_info(count, sort_by);
+    }
+}
+
+/*
+ * We cannot always re-generate the code even if we know there are
+ * valid translations still in the cache. The reason being the guest
+ * may have un-mapped the page code. In real life this would be
+ * un-reachable as the jump cache is cleared and the following QHT
+ * lookup will do a get_page_addr_code() and fault.
+ *
+ * TODO: can we do this safely? We need to
+ *  a) somehow recover the mmu_idx for this translation
+ *  b) probe MMU_INST_FETCH to know it will succeed
+ */
+static GString *get_code_string(TBStatistics *tbs, int log_flags)
+{
+    int old_log_flags = qemu_loglevel;
+
+    CPUState *cpu = first_cpu;
+    uint32_t cflags = curr_cflags() | CF_NOCACHE;
+    TranslationBlock *tb = NULL;
+
+    GString *code_s = g_string_new(NULL);
+    qemu_log_to_string(true, code_s);
+
+    qemu_set_log(log_flags);
+
+    if (sigsetjmp(cpu->jmp_env, 0) == 0) {
+        mmap_lock();
+        tb = tb_gen_code(cpu, tbs->pc, tbs->cs_base, tbs->flags, cflags);
+        tb_phys_invalidate(tb, -1);
+        mmap_unlock();
+    } else {
+        /*
+         * The mmap_lock is dropped by tb_gen_code if it runs out of
+         * memory.
+         */
+        qemu_log("\ncould not gen code for this TB (no longer mapped?)\n");
+        assert_no_pages_locked();
+    }
+
+    qemu_set_log(old_log_flags);
+    qemu_log_to_string(false, NULL);
+
+    if (tb) {
+        tcg_tb_remove(tb);
+    }
+
+    return code_s;
+}
+
+static void do_tb_dump_with_statistics(TBStatistics *tbs, int log_flags)
+{
+    g_autoptr(GString) code_s = NULL;
+
+    qemu_log("\n------------------------------\n\n");
+
+    if (dump_tb_header(tbs) > 0) {
+        code_s = get_code_string(tbs, log_flags);
+    } else {
+        code_s = g_string_new("cannot re-translate non-active translation");
+    }
+    qemu_log("%s", code_s->str);
+    qemu_log("------------------------------\n");
+}
+
+struct tb_dump_info {
+    int id;
+    int log_flags;
+    bool use_monitor;
+};
+
+static void do_dump_tb_info_safe(CPUState *cpu, run_on_cpu_data info)
+{
+    struct tb_dump_info *tbdi = (struct tb_dump_info *) info.host_ptr;
+
+    if (!last_search) {
+        qemu_log("no search on record\n");
+        return;
+    }
+
+    qemu_log_to_monitor(tbdi->use_monitor);
+
+    TBStatistics *tbs = get_tbstats_by_id(tbdi->id);
+    if (tbs) {
+        do_tb_dump_with_statistics(tbs, tbdi->log_flags);
+    } else {
+        qemu_log("no TB statitics found with id %d\n", tbdi->id);
+    }
+
+    qemu_log_to_monitor(false);
+
+    g_free(tbdi);
+}
+
+void dump_tb_info(int id, int log_mask, bool use_monitor)
+{
+    struct tb_dump_info *tbdi = g_new(struct tb_dump_info, 1);
+
+    tbdi->id = id;
+    tbdi->log_flags = log_mask;
+    tbdi->use_monitor = use_monitor;
+
+    async_safe_run_on_cpu(first_cpu, do_dump_tb_info_safe,
+                          RUN_ON_CPU_HOST_PTR(tbdi));
+
+    /* tbdi free'd by do_dump_tb_info_safe */
+}
+
+
 void enable_collect_tb_stats(void)
 {
     init_tb_stats_htable_if_not();
diff --git a/disas.c b/disas.c
index 3e2bfa572b..d5292d4246 100644
--- a/disas.c
+++ b/disas.c
@@ -8,6 +8,8 @@
 #include "disas/disas.h"
 #include "disas/capstone.h"
 
+#include "qemu/log-for-trace.h"
+
 typedef struct CPUDebug {
     struct disassemble_info info;
     CPUState *cpu;
@@ -420,6 +422,22 @@ static bool cap_disas_monitor(disassemble_info *info, uint64_t pc, int count)
 # define cap_disas_monitor(i, p, c)  false
 #endif /* CONFIG_CAPSTONE */
 
+static int fprintf_log(struct _IO_FILE *a, const char *b, ...)
+{
+    va_list ap;
+    va_start(ap, b);
+
+    if (!to_string) {
+        vfprintf(a, b, ap);
+    } else {
+        qemu_vlog(b, ap);
+    }
+
+    va_end(ap);
+
+    return 1;
+}
+
 /* Disassemble this for me please... (debugging).  */
 void target_disas(FILE *out, CPUState *cpu, target_ulong code,
                   target_ulong size)
@@ -429,7 +447,7 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     int count;
     CPUDebug s;
 
-    INIT_DISASSEMBLE_INFO(s.info, out, fprintf);
+    INIT_DISASSEMBLE_INFO(s.info, out, fprintf_log);
 
     s.cpu = cpu;
     s.info.read_memory_func = target_read_memory;
@@ -460,11 +478,12 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     }
 
     for (pc = code; size > 0; pc += count, size -= count) {
-	fprintf(out, "0x" TARGET_FMT_lx ":  ", pc);
-	count = s.info.print_insn(pc, &s.info);
-	fprintf(out, "\n");
-	if (count < 0)
-	    break;
+        fprintf_log(out, "0x" TARGET_FMT_lx ":  ", pc);
+        count = s.info.print_insn(pc, &s.info);
+        fprintf_log(out, "\n");
+        if (count < 0) {
+            break;
+        }
         if (size < count) {
             fprintf(out,
                     "Disassembler disagrees with translator over instruction "
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 257ee7d7a3..c8418211d9 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -289,6 +289,22 @@ ETEXI
         .help       = "show dynamic compiler info",
         .cmd        = hmp_info_jit,
     },
+    {
+        .name       = "tb-list",
+        .args_type  = "number:i?,sortedby:s?",
+        .params     = "[number sortedby]",
+        .help       = "show a [number] translated blocks sorted by [sortedby]"
+                      "sortedby opts: hotness hg spills",
+        .cmd        = hmp_info_tblist,
+    },
+    {
+        .name       = "tb",
+        .args_type  = "id:i,flags:s?",
+        .params     = "id [flag1,flag2,...]",
+        .help       = "show information about one translated block by id."
+                      "dump flags can be used to set dump code level: out_asm in_asm op",
+        .cmd        = hmp_info_tb,
+    },
 #endif
 
 STEXI
diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
index c20a3e6439..b5e9c54b33 100644
--- a/include/exec/tb-stats.h
+++ b/include/exec/tb-stats.h
@@ -35,8 +35,11 @@
 enum SortBy { SORT_BY_HOTNESS, SORT_BY_HG /* Host/Guest */, SORT_BY_SPILLS };
 enum TbstatsCmd { START, PAUSE, STOP, FILTER };
 
+#define tbs_stats_enabled(tbs, JIT_STATS) \
+    (tbs && (tbs->stats_enabled & JIT_STATS))
+
 #define tb_stats_enabled(tb, JIT_STATS) \
-    (tb && tb->tb_stats && (tb->tb_stats->stats_enabled & JIT_STATS))
+    (tb && tb->tb_stats && tbs_stats_enabled(tb->tb_stats, JIT_STATS))
 
 #define stat_per_translation(stat, name) \
     (stat->translations.total ? stat->name / stat->translations.total : 0)
@@ -65,6 +68,8 @@ struct TBStatistics {
     struct {
         unsigned long normal;
         unsigned long atomic;
+        /* filled only when dumping x% cover set */
+        uint16_t coverage;
     } executions;
 
     /* JIT Stats - protected by lock */
@@ -86,7 +91,6 @@ struct TBStatistics {
 
     struct {
         unsigned long total;
-        unsigned long uncached;
         unsigned long spanning;
     } translations;
 
@@ -107,6 +111,9 @@ struct TBStatistics {
         int64_t opt;
         int64_t la;
     } time;
+
+    /* HMP information - used for referring to previous search */
+    int display_id;
 };
 
 bool tb_stats_cmp(const void *ap, const void *bp);
@@ -133,4 +140,26 @@ void do_hmp_tbstats_safe(CPUState *cpu, run_on_cpu_data icmd);
  */
 void tbstats_reset_tbs(void);
 
+/**
+ * dump_tbs_info: report the hottest blocks
+ *
+ * @count: the limit of hotblocks
+ * @sort_by: property in which the dump will be sorted
+ * @use_monitor: redirect output to monitor
+ *
+ * Report the hottest blocks to either the log or monitor
+ */
+void dump_tbs_info(int count, int sort_by, bool use_monitor);
+
+/**
+ * dump_tb_info: dump information about one TB
+ *
+ * @id: the display id of the block (from previous search)
+ * @mask: the temporary logging mask
+ * @Use_monitor: redirect output to monitor
+ *
+ * Re-run a translation of a block at addr for the purposes of debug output
+ */
+void dump_tb_info(int id, int log_mask, bool use_monitor);
+
 #endif
diff --git a/include/qemu/log-for-trace.h b/include/qemu/log-for-trace.h
index 2f0a5b080e..3de88484cb 100644
--- a/include/qemu/log-for-trace.h
+++ b/include/qemu/log-for-trace.h
@@ -20,6 +20,9 @@
 
 /* Private global variable, don't use */
 extern int qemu_loglevel;
+extern bool to_string;
+
+extern int32_t max_num_hot_tbs_to_dump;
 
 #define LOG_TRACE          (1 << 15)
 
@@ -31,5 +34,6 @@ static inline bool qemu_loglevel_mask(int mask)
 
 /* main logging function */
 int GCC_FMT_ATTR(1, 2) qemu_log(const char *fmt, ...);
+int qemu_vlog(const char *fmt, va_list va);
 
 #endif
diff --git a/include/qemu/log.h b/include/qemu/log.h
index a8d1997cde..804cf90f0f 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -114,6 +114,8 @@ typedef struct QEMULogItem {
 extern const QEMULogItem qemu_log_items[];
 
 void qemu_set_log(int log_flags);
+void qemu_log_to_monitor(bool enable);
+void qemu_log_to_string(bool enable, GString *s);
 void qemu_log_needs_buffers(void);
 void qemu_set_log_filename(const char *filename, Error **errp);
 void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
diff --git a/monitor/misc.c b/monitor/misc.c
index 218263d29a..af09a97085 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -504,6 +504,58 @@ static void hmp_tbstats(Monitor *mon, const QDict *qdict)
 
 }
 
+static void hmp_info_tblist(Monitor *mon, const QDict *qdict)
+{
+    int number_int;
+    const char *sortedby_str = NULL;
+    if (!tcg_enabled()) {
+        error_report("TB information is only available with accel=tcg");
+        return;
+    }
+    if (!tb_ctx.tb_stats.map) {
+        error_report("no TB information recorded");
+        return;
+    }
+
+    number_int = qdict_get_try_int(qdict, "number", 10);
+    sortedby_str = qdict_get_try_str(qdict, "sortedby");
+
+    int sortedby = SORT_BY_HOTNESS;
+    if (sortedby_str == NULL || strcmp(sortedby_str, "hotness") == 0) {
+        sortedby = SORT_BY_HOTNESS;
+    } else if (strcmp(sortedby_str, "hg") == 0) {
+        sortedby = SORT_BY_HG;
+    } else if (strcmp(sortedby_str, "spills") == 0) {
+        sortedby = SORT_BY_SPILLS;
+    } else {
+        error_report("valid sort options are: hotness hg spills");
+        return;
+    }
+
+    dump_tbs_info(number_int, sortedby, true);
+}
+
+static void hmp_info_tb(Monitor *mon, const QDict *qdict)
+{
+    const int id = qdict_get_int(qdict, "id");
+    const char *flags = qdict_get_try_str(qdict, "flags");
+    int mask;
+
+    if (!tcg_enabled()) {
+        error_report("TB information is only available with accel=tcg");
+        return;
+    }
+
+    mask = flags ? qemu_str_to_log_mask(flags) : CPU_LOG_TB_IN_ASM;
+
+    if (!mask) {
+        error_report("Unable to parse log flags, see 'help log'");
+        return;
+    }
+
+    dump_tb_info(id, mask, true);
+}
+
 static void hmp_info_jit(Monitor *mon, const QDict *qdict)
 {
     if (!tcg_enabled()) {
diff --git a/util/log.c b/util/log.c
index 86bd691967..fa78e2bca9 100644
--- a/util/log.c
+++ b/util/log.c
@@ -33,25 +33,55 @@ int qemu_loglevel;
 static int log_append = 0;
 static GArray *debug_regions;
 int32_t max_num_hot_tbs_to_dump;
+static bool to_monitor;
+bool to_string;
 
-/* Return the number of characters emitted.  */
-int qemu_log(const char *fmt, ...)
+GString *string;
+
+int qemu_vlog(const char *fmt, va_list va)
 {
     int ret = 0;
-    if (qemu_logfile) {
-        va_list ap;
-        va_start(ap, fmt);
-        ret = vfprintf(qemu_logfile, fmt, ap);
-        va_end(ap);
-
-        /* Don't pass back error results.  */
-        if (ret < 0) {
-            ret = 0;
+    if (to_string) {
+        if (string) {
+            g_string_append_vprintf(string, fmt, va);
         }
+    } else if (to_monitor) {
+        ret = qemu_vprintf(fmt, va);
+    } else if (qemu_logfile) {
+        ret = vfprintf(qemu_logfile, fmt, va);
+    }
+
+    /* Don't pass back error results.  */
+    if (ret < 0) {
+        ret = 0;
     }
     return ret;
 }
 
+/* Return the number of characters emitted.  */
+int qemu_log(const char *fmt, ...)
+{
+    int ret = 0;
+    va_list ap;
+    va_start(ap, fmt);
+
+    ret = qemu_vlog(fmt, ap);
+
+    va_end(ap);
+    return ret;
+}
+
+void qemu_log_to_monitor(bool enable)
+{
+    to_monitor = enable;
+}
+
+void qemu_log_to_string(bool enable, GString *s)
+{
+    to_string = enable;
+    string = s;
+}
+
 static bool log_uses_own_buffers;
 
 /* enable or disable low levels log */
@@ -300,6 +330,7 @@ int qemu_str_to_log_mask(const char *str)
             trace_enable_events((*tmp) + 6);
             mask |= LOG_TRACE;
 #endif
+#ifdef CONFIG_TCG
         } else if (g_str_has_prefix(*tmp, "tb_stats")) {
             mask |= CPU_LOG_TB_STATS;
             set_default_tbstats_flag(TB_JIT_STATS | TB_EXEC_STATS | TB_JIT_TIME);
@@ -329,6 +360,7 @@ int qemu_str_to_log_mask(const char *str)
                 }
                 set_default_tbstats_flag(flags);
             }
+#endif
         } else {
             for (item = qemu_log_items; item->mask != 0; item++) {
                 if (g_str_equal(*tmp, item->name)) {
-- 
2.20.1


