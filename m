Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDCA4679AF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:47:18 +0100 (CET)
Received: from localhost ([::1]:49044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9qH-0003gb-Lz
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:47:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mt9nc-00028M-2f
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:44:32 -0500
Received: from [2a00:1450:4864:20::42f] (port=39531
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mt9nY-00010y-Tk
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:44:31 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a18so6220865wrn.6
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 06:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axHH0XLnnpwjpRa/aOwox3XwLDn8CpqdWoFvoE9BTRU=;
 b=Bbynj+2WUSdUIiG7g46+ENKQJENW48/V+cQ9Wkoo7FdjEf49O/bLzJ5phRaPkIeRbF
 kjexp2qOiIz3TN84X+tdZlCIxck1TYMgVxyANNa4lAQPmrM3NZ4eQ9DW+GYfmrEfFdFn
 jzYW4ctoWNG34QnVqMd8MJQH1i+N/zGUOaGTxKK6yISMljavmgRaDxc0ifgB+BQK7Hui
 6Te685kW9qhhutfceVg963SjUNrLCtOMdI8cy4CgIH3Ii8W5mtPh4WT8g+YtY5Bmn2rk
 gQ04HWOvjZ4E5PiXBsYdQFTynGC26oQnSY7ZpFGYCSf9z7E4nNNwee+7HL+MJ7hTKE3W
 i0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axHH0XLnnpwjpRa/aOwox3XwLDn8CpqdWoFvoE9BTRU=;
 b=FkfcmTbHfKQ7t7dLkq6Ka1b1zizkAFIaLuGfCWp4fVQKKG0xh+jbR7fCDaJ2MhLxPR
 Q6kN6R0T9ZdazQ0Z/kB5X0x7zOPiOxNyTQanVSN1SfeERKfC1TREe2/vHyPMyAyb+/Mm
 w19cdZjeoVitlcnXTjYorxbETcbyLg55pI7rmRv3JeWUl887QiRS/ME9DlJCLse8JNj2
 8M2YLWvHvksmaqzBaP7Xi4tUTk+5dGyNYKSxvCKVOBYjjmvUyEwcjAtzadA0enpLl0Wn
 olUClzUD0n48pYuzsyfcM9zThpbD9ZUpDQkUI7XNjF9B5B4FxHGOwYVnxeQRGr/C0BXj
 OiOA==
X-Gm-Message-State: AOAM530LMlfw0CN7axk0xqde5gc8N9P6MhRgTfVlwinEmjdSJ+PVmyfB
 mvIM3Tul++Zv3/0JzWhGl+b9Lw==
X-Google-Smtp-Source: ABdhPJxJxQrzxVQBR5Hckq7mPIk5wLXjjUoAYokzo5fRaumOH0sGWmpYT+hh0QdBmSo/ZehMOpL1nA==
X-Received: by 2002:a5d:5008:: with SMTP id e8mr21774738wrt.83.1638542666202; 
 Fri, 03 Dec 2021 06:44:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm5547875wms.10.2021.12.03.06.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 06:44:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21C1E1FF99;
 Fri,  3 Dec 2021 14:44:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] tests/plugins: add instruction matching to libinsn.so
Date: Fri,  3 Dec 2021 14:44:21 +0000
Message-Id: <20211203144421.1445232-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203144421.1445232-1-alex.bennee@linaro.org>
References: <20211203144421.1445232-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, minyihh@uci.edu,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Alexandre Iooss <erdnaxe@crans.org>, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


