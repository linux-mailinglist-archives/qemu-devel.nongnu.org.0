Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD898144
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 19:30:37 +0200 (CEST)
Received: from localhost ([::1]:51082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0URP-0007wy-GA
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 13:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39572)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vandersonmr2@gmail.com>) id 1i0UL9-0007rn-0H
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vandersonmr2@gmail.com>) id 1i0UL7-0000Lk-Cv
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:24:06 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:40328)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <vandersonmr2@gmail.com>)
 id 1i0UL7-0000LS-88
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:24:05 -0400
Received: by mail-qt1-x842.google.com with SMTP id e8so3963185qtp.7
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fuop12Oaprtj7zpQ4AJuVY0ii2HhN4IYTAI/t2pejdo=;
 b=UmRKlzWA+f0XU0M6hZJFULnZe3gdDjGfC4zcBXzK6pRva3rt0TfHYPOIaHdWdbAjag
 OtrBiSODLAF0Pn0oGw20vtBKlruhxPdJeUW2c5qIvFJ+6e8/J+S88ey0IV9uGm4NQl6b
 gstotMlBbsbJDVGc7sL9jo2augUgRQwjrnTT3/ko0JnAcjwBCWnSTlLeW6Ec2Xv3PyLM
 y+Wjn6171EJWPqNseoQ6jyNS1lGiDpm72k8G49kt1JOI81glTmvvRdQvnn21JpQPZXP4
 Gnmv4DR+bdJXG6BCXCOhuOi3uWuhI9qZXi6roRr+pO/eKQv9dPsRfWMt4waYkm511Jht
 hqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fuop12Oaprtj7zpQ4AJuVY0ii2HhN4IYTAI/t2pejdo=;
 b=HYTBJeM6oN1b47n2xK+BsIqPTYr2X49O0SHsuSE2BRMilAMy10GiDsQJ6qKHt/uSTJ
 uLmxxcY2XRqI5cz5cCsAJZ5KpGWmYMc460nQYAh+8X81fNbCw8BNe7CKsx78c5WlC9E5
 83KvhyrnhuanCRiAs47UkjCTdwGdAmics4VbZr0LkWvgiqQkRMpWfSuFYaDcxAhyQo42
 oGe61W0bhfnFUtWNPWagoOlEFR5QadyEDkLSbinFEojlpVlt3EHqWqW6CcKj1bHU6Agr
 fYzHF/4LfSJHhwkC+v+bVc00tHHjRqFivXVQUXd2VtzIAqCzT587jivl5FxawR+AeuY1
 GGPg==
X-Gm-Message-State: APjAAAViMu1r9KkWYihvZxx65nFkFMdifvozYl4E1e7jrk7Sfo0kkLQd
 9DyF7qFGPgAkIEqSe8OkqVegSyGbTV/8xA==
X-Google-Smtp-Source: APXvYqw1fzfJlxrv9EzanrFwRE1afFs7IkaRlyVJ/n/TX8f/Fzj7wpL2equj8aiq03uEZzrImgZn6Q==
X-Received: by 2002:ac8:6a19:: with SMTP id t25mr32288709qtr.267.1566408244466; 
 Wed, 21 Aug 2019 10:24:04 -0700 (PDT)
Received: from vanderson-lmcad.gw.lmcad.ic.unicamp.br (gw.lmcad.ic.unicamp.br.
 [143.106.73.166])
 by smtp.googlemail.com with ESMTPSA id a3sm9623998qtp.10.2019.08.21.10.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 10:24:04 -0700 (PDT)
From: vandersonmr <vandersonmr2@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 14:23:28 -0300
Message-Id: <20190821172329.2062-10-vandersonmr2@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821172329.2062-1-vandersonmr2@gmail.com>
References: <20190821172329.2062-1-vandersonmr2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: [Qemu-devel] [PATCH v6 09/10] monitor: adding new info cfg command
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, vandersonmr <vandersonmr2@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding "info cfg id depth" commands to HMP.
This command allow the exploration a TB
neighbors by dumping [and opening] a .dot
file with the TB CFG neighbors colorized
by their hotness.

The goal of this command is to allow the dynamic exploration
of TCG behavior and code quality. Therefore, for now, a
corresponding QMP command is not worthwhile.

Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
---
 accel/tcg/tb-stats.c    | 169 ++++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx    |   7 ++
 include/exec/tb-stats.h |   1 +
 monitor/misc.c          |  22 ++++++
 4 files changed, 199 insertions(+)

diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
index 875bc026b7..5bdcad2d80 100644
--- a/accel/tcg/tb-stats.c
+++ b/accel/tcg/tb-stats.c
@@ -657,6 +657,174 @@ void dump_tb_info(int id, int log_mask, bool use_monitor)
     /* tbdi free'd by do_dump_tb_info_safe */
 }
 
+/* TB CFG xdot/dot dump implementation */
+#define MAX_CFG_NUM_NODES 1000
+static int cfg_tb_id;
+static GHashTable *cfg_nodes;
+static uint64_t root_count;
+
+static void fputs_jump(TBStatistics *from, TBStatistics *to, FILE *dot)
+{
+    if (!from || !to) {
+        return;
+    }
+
+    int *from_id = (int *) g_hash_table_lookup(cfg_nodes, from);
+    int *to_id   = (int *) g_hash_table_lookup(cfg_nodes, to);
+
+    if (!from_id || !to_id) {
+        return;
+    }
+
+    GString *line = g_string_new(NULL);
+
+    g_string_printf(line, "   node_%d -> node_%d;\n", *from_id, *to_id);
+
+    fputs(line->str, dot);
+
+    g_string_free(line, true);
+}
+
+static void fputs_tbstats(TBStatistics *tbs, FILE *dot, int log_flags)
+{
+    if (!tbs) {
+        return;
+    }
+
+    GString *line = g_string_new(NULL);;
+
+    uint32_t color = 0xFF666;
+    uint64_t count = tbs->executions.normal;
+    if (count > 1.6 * root_count) {
+        color = 0xFF000;
+    } else if (count > 1.2 * root_count) {
+        color = 0xFF333;
+    } else if (count < 0.4 * root_count) {
+        color = 0xFFCCC;
+    } else if (count < 0.8 * root_count) {
+        color = 0xFF999;
+    }
+
+    GString *code_s = get_code_string(tbs, log_flags);
+
+    for (int i = 0; i < code_s->len; i++) {
+        if (code_s->str[i] == '\n') {
+            code_s->str[i] = ' ';
+            code_s = g_string_insert(code_s, i, "\\l");
+            i += 2;
+        }
+    }
+
+    g_string_printf(line,
+            "   node_%d [fillcolor=\"#%xFF0000\" shape=\"record\" "
+            "label=\"TB %d\\l"
+            "-------------\\l"
+            "PC:\t0x"TARGET_FMT_lx"\\l"
+            "exec count:\t%lu\\l"
+            "\\l %s\"];\n",
+            cfg_tb_id, color, cfg_tb_id, tbs->pc,
+            tbs->executions.normal, code_s->str);
+
+    fputs(line->str, dot);
+
+    int *id = g_new(int, 1);
+    *id = cfg_tb_id;
+    g_hash_table_insert(cfg_nodes, tbs, id);
+
+    cfg_tb_id++;
+
+    g_string_free(line, true);
+    g_string_free(code_s, true);
+}
+
+static void fputs_preorder_walk(TBStatistics *tbs, int depth, FILE *dot, int log_flags)
+{
+    if (tbs && depth > 0
+            && cfg_tb_id < MAX_CFG_NUM_NODES
+            && !g_hash_table_contains(cfg_nodes, tbs)) {
+
+        fputs_tbstats(tbs, dot, log_flags);
+
+        if (tbs->tb) {
+            TranslationBlock *left_tb  = NULL;
+            TranslationBlock *right_tb = NULL;
+            if (tbs->tb->jmp_dest[0]) {
+                left_tb = (TranslationBlock *) atomic_read(tbs->tb->jmp_dest);
+            }
+            if (tbs->tb->jmp_dest[1]) {
+                right_tb = (TranslationBlock *) atomic_read(tbs->tb->jmp_dest + 1);
+            }
+
+            if (left_tb) {
+                fputs_preorder_walk(left_tb->tb_stats, depth - 1, dot, log_flags);
+                fputs_jump(tbs, left_tb->tb_stats, dot);
+            }
+            if (right_tb) {
+                fputs_preorder_walk(right_tb->tb_stats, depth - 1, dot, log_flags);
+                fputs_jump(tbs, right_tb->tb_stats, dot);
+            }
+        }
+    }
+}
+
+struct PreorderInfo {
+    TBStatistics *tbs;
+    int depth;
+    int log_flags;
+};
+
+static void fputs_preorder_walk_safe(CPUState *cpu, run_on_cpu_data icmd)
+{
+    struct PreorderInfo *info = icmd.host_ptr;
+
+    GString *file_name = g_string_new(NULL);;
+    g_string_printf(file_name, "/tmp/qemu-cfg-tb-%d-%d.dot", id, info->depth);
+    FILE *dot = fopen(file_name->str, "w+");
+
+    fputs(
+            "digraph G {\n"
+            "   mclimit=1.5;\n"
+            "   rankdir=TD; ordering=out;\n"
+            "   graph[fontsize=10 fontname=\"Verdana\"];\n"
+            "   color=\"#efefef\";\n"
+            "   node[shape=box style=filled fontsize=8 fontname=\"Verdana\" fillcolor=\"#efefef\"];\n"
+            "   edge[fontsize=8 fontname=\"Verdana\"];\n"
+         , dot);
+
+    cfg_nodes = g_hash_table_new(NULL, NULL);
+    fputs_preorder_walk(info->tbs, info->depth, dot, info->log_flags);
+    g_hash_table_destroy(cfg_nodes);
+
+    fputs("}\n\0", dot);
+    fclose(dot);
+
+    qemu_log("CFG dumped: %s\n", file_name->str);
+
+    g_string_free(file_name, true);
+    g_free(info);
+}
+
+void dump_tb_cfg(int id, int depth, int log_flags)
+{
+    cfg_tb_id = 1;
+    root_count = 0;
+
+    /* do a pre-order walk in the CFG with a limited depth */
+    TBStatistics *root = get_tbstats_by_id(id);
+    if (root) {
+        root_count = root->executions.normal;
+    }
+
+    struct PreorderInfo *info = g_new(struct PreorderInfo, 1);
+    info->tbs = root;
+    info->depth = depth + 1;
+    info->log_flags = log_flags;
+    async_safe_run_on_cpu(first_cpu, fputs_preorder_walk_safe,
+            RUN_ON_CPU_HOST_PTR(info));
+}
+
+/* TBStatistic collection controls */
+
 
 void enable_collect_tb_stats(void)
 {
@@ -706,3 +874,4 @@ uint32_t get_default_tbstats_flag(void)
 {
     return default_tbstats_flag;
 }
+
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index f415479011..8c96924c0b 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -305,6 +305,13 @@ ETEXI
                       "dump flags can be used to set dump code level: out_asm in_asm op",
         .cmd        = hmp_info_tb,
     },
+    {
+        .name       = "cfg",
+        .args_type  = "id:i,depth:i?,flags:s?",
+        .params     = "id [depth flags]",
+        .help       = "plot CFG around TB with the given id",
+        .cmd        = hmp_info_cfg,
+    },
     {
         .name       = "coverset",
         .args_type  = "coverage:i?",
diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
index 69c3a8e5e1..0d7a03bdfa 100644
--- a/include/exec/tb-stats.h
+++ b/include/exec/tb-stats.h
@@ -129,6 +129,7 @@ void dump_tbs_info(int count, int sort_by, bool use_monitor);
  */
 void dump_tb_info(int id, int log_mask, bool use_monitor);
 
+void dump_tb_cfg(int id, int depth, int log_flags);
 
 /* TBStatistic collection controls */
 void enable_collect_tb_stats(void);
diff --git a/monitor/misc.c b/monitor/misc.c
index 26b19c62dc..5cce807bb9 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -556,6 +556,28 @@ static void hmp_info_tb(Monitor *mon, const QDict *qdict)
     dump_tb_info(id, mask, true);
 }
 
+static void hmp_info_cfg(Monitor *mon, const QDict *qdict)
+{
+    const int id = qdict_get_int(qdict, "id");
+    const int depth = qdict_get_try_int(qdict, "depth", 3);
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
+    dump_tb_cfg(id, depth, mask);
+}
+
 static void hmp_info_coverset(Monitor *mon, const QDict *qdict)
 {
     int coverage;
-- 
2.22.0


