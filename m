Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167504992E6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:32:34 +0100 (CET)
Received: from localhost ([::1]:48410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC60v-0002S4-7A
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:32:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5rj-0005AJ-Sc
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:04 -0500
Received: from [2a00:1450:4864:20::533] (port=41550
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5ri-0004J8-8H
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:03 -0500
Received: by mail-ed1-x533.google.com with SMTP id j2so58502195edj.8
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axHH0XLnnpwjpRa/aOwox3XwLDn8CpqdWoFvoE9BTRU=;
 b=HtkSebmIKUEb2Ybmwkih4yeK32INV55+ZPTBNMnSj0Ne5O0aPi1t5lcu4W3iDN0VAo
 NaN/qsB0VQyOa22zWZiXXm8Q+rilNVJ17wGMm56YspGLlU+4gFZ7dCZ02nnMYIhfI2UK
 8SsKMQFHu2sJP6R0Ktg2TqeLczVgxNuqBSZJ6OZheZCYV3vUgCXCC2XV0f72iYPu6RVO
 tQZFL2OcgPiI5vcD5Pj8og2eY/Le6gSzPfDOaqXu+5M2hU4+gpagiXMccmpL3qSkO5O+
 y5imd6db5NXiiKMjn1r7xzNTV5yHfN5u+3FB5OOUWCSReJL2Pzs5oSgnbwINWDB4QrUK
 3CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axHH0XLnnpwjpRa/aOwox3XwLDn8CpqdWoFvoE9BTRU=;
 b=5ata+PpLur23Isc1FWqQa7yd82CLXudDJ598Eq0+O1gu2e8LT0OitFjTkc3OBrMjh4
 a3f5hyeTn6uzg11VU9LNfOCINnFa34mD7sHJuSK/rYzf33Ndsm0lBfFwLy+E+J8ZYFhP
 cbMXhI06PTbnUIk1ctnMKmCEfEcv+58zk0WZtBREBOWSjAhHtAE3XoX3a8/80U6KPrr1
 j033qkDITjXn1+icMLqaA9VuD9WuXaLBlQ7C+OJFKEufgjGZE0hTjVQNVma3OSAyhSI0
 FtYtx68UQgtFmAZ01vJYndjAAmoVXX2d2Pq1JvZtxW5N0OlKg4bhX5917h8qQKga8qyI
 3JGA==
X-Gm-Message-State: AOAM531VldYcDNVvSuveFNjA2H8PCd53oaRVZHjaHjTAAxlAdOPEDqg/
 xk203UUguL/jHrFdSDqGRwJebg==
X-Google-Smtp-Source: ABdhPJwVBvgClHEx40fErAZGz3P8D9+DFnny1P+AHmAanPNbmI5W5qMgbr7p4Kuk715K+VgUD5pghA==
X-Received: by 2002:a05:6402:1604:: with SMTP id
 f4mr17387585edv.352.1643055780801; 
 Mon, 24 Jan 2022 12:23:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o23sm5270901ejn.22.2022.01.24.12.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:22:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A0E851FFCB;
 Mon, 24 Jan 2022 20:16:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 20/22] tests/plugins: add instruction matching to libinsn.so
Date: Mon, 24 Jan 2022 20:16:06 +0000
Message-Id: <20220124201608.604599-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vasilev Oleg <vasilev.oleg@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu, Alexandre Iooss <erdnaxe@crans.org>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds simple instruction matching to the libinsn.so plugin which
is useful for examining the execution distance between instructions.
For example to track how often we flush in ARM due to TLB updates:

  -plugin ./tests/plugin/libinsn.so,match=tlbi

which leads to output like this:

  0xffffffc01018fa00, tlbi aside1is, x0,  339, 32774 match hits, 23822 since last, avg 47279
  0xffffffc01018fa00, tlbi aside1is, x0,  340, 32775 match hits, 565051 since last, avg 47295
  0xffffffc0101915a4, tlbi vae1is, x0,  155, 32776 match hits, 151135 since last, avg 47298
  0xffffffc01018fc60, tlbi vae1is, x4,  224, 32777 match hits, 814 since last, avg 47297
  0xffffffc010194a44, tlbi vale1is, x1,  8835, 32778 match hits, 52027 since last, avg 47297
  0xffffffc010194a44, tlbi vale1is, x1,  8836, 32779 match hits, 8347 since last, avg 47296
  0xffffffc010194a44, tlbi vale1is, x1,  8837, 32780 match hits, 33677 since last, avg 47295

showing we do some sort of TLBI invalidation every 47 thousand
instructions.

Cc: Vasilev Oleg <vasilev.oleg@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Emilio Cota <cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/insn.c | 88 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index d5a0a08cb4..3f48c86fd7 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -28,9 +28,25 @@ static uint64_t inline_insn_count;
 
 static bool do_inline;
 static bool do_size;
-static bool do_frequency;
 static GArray *sizes;
 
+typedef struct {
+    char *match_string;
+    uint64_t hits[MAX_CPUS];
+    uint64_t last_hit[MAX_CPUS];
+    uint64_t total_delta[MAX_CPUS];
+    GPtrArray *history[MAX_CPUS];
+} Match;
+
+static GArray *matches;
+
+typedef struct {
+    Match *match;
+    uint64_t vaddr;
+    uint64_t hits;
+    char *disas;
+} Instruction;
+
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
     unsigned int i = cpu_index % MAX_CPUS;
@@ -45,6 +61,36 @@ static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
     c->insn_count++;
 }
 
+static void vcpu_insn_matched_exec_before(unsigned int cpu_index, void *udata)
+{
+    unsigned int i = cpu_index % MAX_CPUS;
+    Instruction *insn = (Instruction *) udata;
+    Match *match = insn->match;
+    g_autoptr(GString) ts = g_string_new("");
+
+    insn->hits++;
+    g_string_append_printf(ts, "0x%" PRIx64 ", %s, % "PRId64,
+                           insn->vaddr, insn->disas, insn->hits);
+
+    uint64_t icount = counts[i].insn_count;
+    uint64_t delta = icount - match->last_hit[i];
+
+    match->hits[i]++;
+    match->total_delta[i] += delta;
+
+    g_string_append_printf(ts,
+                           ", %"PRId64" match hits, %"PRId64
+                           " since last, avg %"PRId64"\n",
+                           match->hits[i], delta,
+                           match->total_delta[i] / match->hits[i]);
+
+    match->last_hit[i] = icount;
+
+    qemu_plugin_outs(ts->str);
+
+    g_ptr_array_add(match->history[i], insn);
+}
+
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 {
     size_t n = qemu_plugin_tb_n_insns(tb);
@@ -71,6 +117,29 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
             unsigned long *cnt = &g_array_index(sizes, unsigned long, sz);
             (*cnt)++;
         }
+
+        /*
+         * If we are tracking certain instructions we will need more
+         * information about the instruction which we also need to
+         * save if there is a hit.
+         */
+        if (matches) {
+            char *insn_disas = qemu_plugin_insn_disas(insn);
+            int j;
+            for (j = 0; j < matches->len; j++) {
+                Match *m = &g_array_index(matches, Match, j);
+                if (g_str_has_prefix(insn_disas, m->match_string)) {
+                    Instruction *rec = g_new0(Instruction, 1);
+                    rec->disas = g_strdup(insn_disas);
+                    rec->vaddr = qemu_plugin_insn_vaddr(insn);
+                    rec->match = m;
+                    qemu_plugin_register_vcpu_insn_exec_cb(
+                        insn, vcpu_insn_matched_exec_before,
+                        QEMU_PLUGIN_CB_NO_REGS, rec);
+                }
+            }
+            g_free(insn_disas);
+        }
     }
 }
 
@@ -105,6 +174,21 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     qemu_plugin_outs(out->str);
 }
 
+
+/* Add a match to the array of matches */
+static void parse_match(char *match)
+{
+    Match new_match = { .match_string = match };
+    int i;
+    for (i = 0; i < MAX_CPUS; i++) {
+        new_match.history[i] = g_ptr_array_new();
+    }
+    if (!matches) {
+        matches = g_array_new(false, true, sizeof(Match));
+    }
+    g_array_append_val(matches, new_match);
+}
+
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
@@ -122,6 +206,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                 fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
                 return -1;
             }
+        } else if (g_strcmp0(tokens[0], "match") == 0) {
+            parse_match(tokens[1]);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
-- 
2.30.2


