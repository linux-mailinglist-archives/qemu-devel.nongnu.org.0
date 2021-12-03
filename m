Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E84679B8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:48:56 +0100 (CET)
Received: from localhost ([::1]:52792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9rr-00061Y-Js
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:48:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mt9nl-0002C0-4O
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:44:42 -0500
Received: from [2a00:1450:4864:20::332] (port=37814
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mt9nW-00010Q-II
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:44:40 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso5068756wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 06:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aw9//rMqmIasQm/iGFUqITI+tDFIlD0DW72eVqm7DkE=;
 b=kWireGXJFaoIIDmcTLlmHjAT5XJYAWJE8z6evmchMSv2a530ohGVAsbKq4j0vtAN9m
 CXdr67pNVpr1m3bmNfC5o4FQZJiRkE9aHfTzIEDBSQOm6OO3s0rbAlruIdFCLNivJ7KX
 zVWES2pyThb4iPHul+sY+RZ6iv9ynvJ07GXvI1oTEGgxCwKauNiXDCvxlOCqGW+2Xhf/
 KwsGf1ZgX7XvdgYdR354CDfQg1109wMnCzdc9klcLb73SuUKHn/q73s96BIYnmh6lVrl
 F+zUaIGz3d38tMZBK5Qkc+EDV6MZSRxVV1LddhRKEhe1dg0F4Clzghrd1RuSDxRMkmQO
 qlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aw9//rMqmIasQm/iGFUqITI+tDFIlD0DW72eVqm7DkE=;
 b=HOCTFiSP2Zl8p2TRoxHvCQotiQwQqfqe1IP0WA0fxncEhjKys3XWEAuxzP6bQzKiee
 24vAiyEtz2hsZghCQeRcy/hDXP9hVhOd82d9LpcbBJjA14Qqf6+m4zBv4dNYHANw8syJ
 gJDAhoy8M6bEO3f/iqmI00i2MtHdjQOZaGctR1O9PNPATZ2gu0hNDUTpyo++xAnGW+TN
 CGGC5xLJ6YqOxYbzly+tdAX2JlSfMrfW1xsUScWAoFzRImYI8Gv496Ogu1tGTHAgPA5/
 tI1v/4BSwTaWE4DXdOO++HqubaePr+eLf/WXn4O0/wviiqlK48NpicXRChoYAxnNAiHx
 SxnQ==
X-Gm-Message-State: AOAM532InikoMmr/tVgIIID5PPF8PYM+v26k9BzjVYlaoF2KvgUmeC1C
 FtAZzMK5IM0oNrl37QTbvE8Fsg==
X-Google-Smtp-Source: ABdhPJxbEBYkXHSbNWv3cSBnbtLqA3spv41kPylk8ZpTmEleNjU/fqaD3ObkRy4SVlCQeMJIHKs42w==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr15829808wml.119.1638542664369; 
 Fri, 03 Dec 2021 06:44:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u2sm3146263wrs.17.2021.12.03.06.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 06:44:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0AFD81FF98;
 Fri,  3 Dec 2021 14:44:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  1/2] tests/plugin: allow libinsn.so per-CPU counts
Date: Fri,  3 Dec 2021 14:44:20 +0000
Message-Id: <20211203144421.1445232-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203144421.1445232-1-alex.bennee@linaro.org>
References: <20211203144421.1445232-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: minyihh@uci.edu, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Alexandre Iooss <erdnaxe@crans.org>, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


