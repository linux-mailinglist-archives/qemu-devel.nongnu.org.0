Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819414AA17E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:59:44 +0100 (CET)
Received: from localhost ([::1]:58576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5gF-0007H6-Kh
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:59:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5R6-0006vf-C7
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:44:04 -0500
Received: from [2a00:1450:4864:20::42b] (port=34550
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5R4-0007P4-7O
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:44:03 -0500
Received: by mail-wr1-x42b.google.com with SMTP id f17so13471889wrx.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhmXOO/6q9XmPV09312oaXBgVpi24xyzc4IO4oCe4TQ=;
 b=kNfY0pBzjxqa/tYlSv6xJMFD+J71gGGqieuTG2j5WigVe7pKOX2ZETHCVYrLigqlm3
 FnqJyLQawQ6LlhZIu5iGsw0lnfVfOABgvTI6uJd4bqf3MZsSa8fgLFVsltHZtBErTN5F
 xMJTJSvyqWrzuabVtJ0tTL91pggfwWPORMEd1xY/Zl+fp/f1+4O0ej1peWwJrq7mXWui
 LBi9MGT7in+C6J16bciLo9P5JkgdR8Bp6GEk0dZHiqmeQ5WvAmZrYd/MwDmatZ6x3xus
 rghbVDKeeTUecfHfNcl7BfTWocJlyO8B6ddyr/rRqlGCH5VYpowrmkrbnO6rOsMmFQsb
 f3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhmXOO/6q9XmPV09312oaXBgVpi24xyzc4IO4oCe4TQ=;
 b=Sd+Aze75WpMPPxlJHwIOxiPz5zV4sXmTX0eSY7tKeXXft9hwCXYZMU9OV43rKdfGia
 P7DYR7iQhFtvzNYER6Vm7HvmvtpZ4GbPOm/G8LNPjYSQ7FZE4NWMViz+27R2PEDDxFvA
 ZGtVN+mnwVyxCVHZ9k4cdHBR87U31UQ/Zv1wB6ocs7QngdyvaNwI3JU4oNRBfNAR5oHx
 t+dNDMZ60eRTmlFTqNzGBsd0oskL8peyjP4O25BvKsAnlV1ogVt5Dc2ynuIb7CPEvmJY
 nuH4co1C1OIoQV6071rmF9QhG0MFKNc3AljIU/2/5K1YtUxuz/uypaXcqrduQARa6QHt
 OfdQ==
X-Gm-Message-State: AOAM530vSnES0ZEkkdRX9mHm7hF2BPXpoRUg8Wln7vBU+FAocXfN9998
 vB43ToA8Vg+FcK3AnH1Bffw6Ag==
X-Google-Smtp-Source: ABdhPJzHj9nVcDZ09mwVi+LNTwEwDmwEgb+8Updh8mpmNAHW77p695RGZ0VqiTDlpG7BlCGD6BLkfg==
X-Received: by 2002:a5d:5445:: with SMTP id w5mr536939wrv.680.1644007440926;
 Fri, 04 Feb 2022 12:44:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d2sm2773031wru.40.2022.02.04.12.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:44:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8CEB1FFD1;
 Fri,  4 Feb 2022 20:43:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 26/26] plugins: move reset of plugin data to tb_start
Date: Fri,  4 Feb 2022 20:43:35 +0000
Message-Id: <20220204204335.1689602-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can't always guarantee we get to the end of a translator loop.
Although this can happen for a variety of reasons it does happen more
often on x86 system emulation when an instruction spans across to an
un-faulted page. This caused confusion of the instruction tracking
data resulting in apparent reverse execution (at least from the
plugins point of view).

Fix this by moving the reset code to plugin_gen_tb_start so we always
start with a clean slate.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/824
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220124201608.604599-23-alex.bennee@linaro.org>
---
 accel/tcg/plugin-gen.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 22d95fe1c3..ae70e4a5b0 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -854,10 +854,21 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
 
 bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_only)
 {
-    struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
     bool ret = false;
 
     if (test_bit(QEMU_PLUGIN_EV_VCPU_TB_TRANS, cpu->plugin_mask)) {
+        struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
+        int i;
+
+        /* reset callbacks */
+        for (i = 0; i < PLUGIN_N_CB_SUBTYPES; i++) {
+            if (ptb->cbs[i]) {
+                g_array_set_size(ptb->cbs[i], 0);
+            }
+        }
+        ptb->n = 0;
+        tcg_ctx->plugin_insn = NULL;
+
         ret = true;
 
         ptb->vaddr = tb->pc;
@@ -904,23 +915,19 @@ void plugin_gen_insn_end(void)
     plugin_gen_empty_callback(PLUGIN_GEN_AFTER_INSN);
 }
 
+/*
+ * There are cases where we never get to finalise a translation - for
+ * example a page fault during translation. As a result we shouldn't
+ * do any clean-up here and make sure things are reset in
+ * plugin_gen_tb_start.
+ */
 void plugin_gen_tb_end(CPUState *cpu)
 {
     struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
-    int i;
 
     /* collect instrumentation requests */
     qemu_plugin_tb_trans_cb(cpu, ptb);
 
     /* inject the instrumentation at the appropriate places */
     plugin_gen_inject(ptb);
-
-    /* clean up */
-    for (i = 0; i < PLUGIN_N_CB_SUBTYPES; i++) {
-        if (ptb->cbs[i]) {
-            g_array_set_size(ptb->cbs[i], 0);
-        }
-    }
-    ptb->n = 0;
-    tcg_ctx->plugin_insn = NULL;
 }
-- 
2.30.2


