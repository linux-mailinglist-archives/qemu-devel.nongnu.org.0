Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F164AF64B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 17:16:27 +0100 (CET)
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpdp-0001vj-PW
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 11:16:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnll-00030W-QI
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:30 -0500
Received: from [2a00:1450:4864:20::536] (port=36683
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlK-0007sO-Be
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:13 -0500
Received: by mail-ed1-x536.google.com with SMTP id s7so5409617edd.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FY3te3zfqLp5nnKkdOF5vtBHhRQZFWMIIuZXZpuWjGs=;
 b=HfdBd5/4cVkZTHOe3TjmMjjdExy3pep8L7EaL7rn+maOBqJ9UeiXrlgKazuEDVbT7Y
 Q4hW9JKyC8HtVxPnlaguPm6AKStcFbuJFxtSn4SwWAqMDOcu0AcnseFrRfHkAYhcrQo6
 UMvXgagQ07DXxKh095uJuYOTlziuKnQzTu3w8d7gvjIEPQ1ySn+iCXr7q3jZGchUhAiy
 YE73c/mzyJwXJiUdWsBWGzKlQ7+4VBD2VIH9kLEj0IH+oBQCPek85mbG2biwvVZY+ixW
 lheOCDAd0kxOYyx9j7z2uPFsjlbhmxWeQjk2srpYOnOCPJ0VFOOWssflrwrYDqZ4FJyB
 GLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FY3te3zfqLp5nnKkdOF5vtBHhRQZFWMIIuZXZpuWjGs=;
 b=3bAYi2MvJWHDB/fy1ohq74jg1V8LOw1XroHdOg7HyKHdHsxdPmcex6r6TLWKf6VKLF
 oYbtwNRCQExtHUo1ScyszKlnRu7ZzxMFRzSDYSQIBjz/9QAesuJ1jAhuzXhB3q7UEfcS
 LjklSmV/M4zIhuqpC4z1fI9yGj94MvzWf3+bydpudKrbMKVjcezYhkMzWeGE9O74GUVe
 CSB+Z+hpupwUk4DvSBR4/hCcjzywEpdOg0kHXMWgnaIQqVavmPIVKpv6iw0SgTJOOBuG
 25ftdU/g5CsQ4DU/GB7LxCnkVttT4Ffj2PujFWsja96XeQOS/T+HFOwCqCYJ+w9/eaB3
 Bbyw==
X-Gm-Message-State: AOAM531uvvhLIU6UtXXr6w9xNyWlX8AAp00lSMS9uskJ5Q0P6JBHXCLo
 vqnhZNhyWkJ5unoBFYMGzicAcQ==
X-Google-Smtp-Source: ABdhPJyZBhaz0sTz1HAhptueN3j4VAoSS+vyDyHLxId0hEktsGxNZYT1/Ymdcfks/Ac4cGaMoQnq+w==
X-Received: by 2002:a05:6402:12d5:: with SMTP id
 k21mr2756794edx.138.1644416150081; 
 Wed, 09 Feb 2022 06:15:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f19sm4421537edr.96.2022.02.09.06.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:48 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 60B911FFCE;
 Wed,  9 Feb 2022 14:15:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 23/28] tests/plugin: allow libinsn.so per-CPU counts
Date: Wed,  9 Feb 2022 14:15:24 +0000
Message-Id: <20220209141529.3418384-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We won't go fully flexible but for most system emulation 8 vCPUs
resolution should be enough for anybody ;-)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220204204335.1689602-24-alex.bennee@linaro.org>

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


