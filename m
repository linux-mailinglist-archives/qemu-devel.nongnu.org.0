Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA224994AC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:49:10 +0100 (CET)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6Gz-0001NI-KH
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:49:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5rm-0005Bj-Ll
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:06 -0500
Received: from [2a00:1450:4864:20::62b] (port=35648
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5rk-0004JK-TZ
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:06 -0500
Received: by mail-ej1-x62b.google.com with SMTP id s5so24634781ejx.2
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aw9//rMqmIasQm/iGFUqITI+tDFIlD0DW72eVqm7DkE=;
 b=HYLqfquScx/h8wnEQ3Mw7hSkylcYU0FQ8CCpAUf6h/z1ukEByh+QCt0gVgDcq1D24s
 hjDgyF0wQmPrcF943sMNgvLmsDkgc/Jr0Oqfdx+1We3UHtTZiN1qJflgXxT5I6ZdtVfu
 KIBwKqeYgzDHLWPwUc3RHsUaMaWuLt/4u7YVUEhBVly6QtXL2s0B16+t8FrMxKNoNsvc
 QkM0Pg/y5dr8N3M/yAYAImyl2jp73j9AHkDBuTXuBLir18ubRwX9a84CMRg5HtWtDvOw
 PEOFOHoKkb/fB7EB9K+w8CKsJtko4dmbqijyV/KceEPnJWNIwjosFByZPzTlKQrdylJ4
 6aUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aw9//rMqmIasQm/iGFUqITI+tDFIlD0DW72eVqm7DkE=;
 b=ZLypNnLIVRCJAfZ9FqE/d6PCffMSGtLFpmNOBqfnGJYq5ezWSyoPkDllz1L1ftpSne
 sv1if6qVK/M344nUR085sftmyzu714MQlkg2R5KSHdX6oqBt9lfumj/BAxaEumMifvvx
 YbU3Jzye8aVsxu4uadt991nsCwEN4hPHyfWUuK/icXv9oK9HauHHoN77UJU4tzPMY4P0
 UCTydGKIzRv5gWp1rsrlPJYq7oPJB49dNT50Do87C8HhxSj+lvPp0dWM1b3YK3SQDqBb
 2WJ+RlXCYpzGzt4sYfQ2/Dozwyxx082th4OZ/SvVkS5kXhoSPT0Lz7q2WXzMhr66SrNu
 1FSg==
X-Gm-Message-State: AOAM533XPvc0C9uTzNe8I4S4euPJTK4n5nUesPzbdv3tIVYiCu/Fof+g
 nhwYQ6mGJeGwqG5NiTyZp1sztg==
X-Google-Smtp-Source: ABdhPJwnph9iQcxLX4U9fM7JNzLz3587LND1vDGIk2jIa708npM4fRs3tQCeryq65w1/e1MHILDK1w==
X-Received: by 2002:a17:907:2d06:: with SMTP id
 gs6mr4361974ejc.765.1643055783444; 
 Mon, 24 Jan 2022 12:23:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id uz30sm5303096ejb.61.2022.01.24.12.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:22:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91D0C1FFCA;
 Mon, 24 Jan 2022 20:16:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 19/22] tests/plugin: allow libinsn.so per-CPU counts
Date: Mon, 24 Jan 2022 20:16:05 +0000
Message-Id: <20220124201608.604599-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, Alexandre Iooss <erdnaxe@crans.org>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We won't go fully flexible but for most system emulation 8 vCPUs
resolution should be enough for anybody ;-)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/insn.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index d229fdc001..d5a0a08cb4 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -16,22 +16,33 @@
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
-static uint64_t insn_count;
+#define MAX_CPUS 8 /* lets not go nuts */
+
+typedef struct {
+    uint64_t last_pc;
+    uint64_t insn_count;
+} InstructionCount;
+
+static InstructionCount counts[MAX_CPUS];
+static uint64_t inline_insn_count;
+
 static bool do_inline;
 static bool do_size;
+static bool do_frequency;
 static GArray *sizes;
 
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
-    static uint64_t last_pc;
+    unsigned int i = cpu_index % MAX_CPUS;
+    InstructionCount *c = &counts[i];
     uint64_t this_pc = GPOINTER_TO_UINT(udata);
-    if (this_pc == last_pc) {
+    if (this_pc == c->last_pc) {
         g_autofree gchar *out = g_strdup_printf("detected repeat execution @ 0x%"
                                                 PRIx64 "\n", this_pc);
         qemu_plugin_outs(out);
     }
-    last_pc = this_pc;
-    insn_count++;
+    c->last_pc = this_pc;
+    c->insn_count++;
 }
 
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
@@ -44,7 +55,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 
         if (do_inline) {
             qemu_plugin_register_vcpu_insn_exec_inline(
-                insn, QEMU_PLUGIN_INLINE_ADD_U64, &insn_count, 1);
+                insn, QEMU_PLUGIN_INLINE_ADD_U64, &inline_insn_count, 1);
         } else {
             uint64_t vaddr = qemu_plugin_insn_vaddr(insn);
             qemu_plugin_register_vcpu_insn_exec_cb(
@@ -66,9 +77,9 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
     g_autoptr(GString) out = g_string_new(NULL);
+    int i;
 
     if (do_size) {
-        int i;
         for (i = 0; i <= sizes->len; i++) {
             unsigned long *cnt = &g_array_index(sizes, unsigned long, i);
             if (*cnt) {
@@ -76,8 +87,20 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
                                        "len %d bytes: %ld insns\n", i, *cnt);
             }
         }
+    } else if (do_inline) {
+        g_string_append_printf(out, "insns: %" PRIu64 "\n", inline_insn_count);
     } else {
-        g_string_append_printf(out, "insns: %" PRIu64 "\n", insn_count);
+        uint64_t total_insns = 0;
+        for (i = 0; i < MAX_CPUS; i++) {
+            InstructionCount *c = &counts[i];
+            if (c->insn_count) {
+                g_string_append_printf(out, "cpu %d insns: %" PRIu64 "\n",
+                                       i, c->insn_count);
+                total_insns += c->insn_count;
+            }
+        }
+        g_string_append_printf(out, "total insns: %" PRIu64 "\n",
+                               total_insns);
     }
     qemu_plugin_outs(out->str);
 }
-- 
2.30.2


