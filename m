Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DAA4AF49D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:02:16 +0100 (CET)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoU2-0008OT-W4
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:02:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnty-0000L9-2Z
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:24:58 -0500
Received: from [2a00:1450:4864:20::42c] (port=39757
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHntw-0001LD-CO
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:24:57 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d27so4356242wrc.6
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XggHg/DQ8QhJtcx6aM9YPetrL2sQVDLzuBfvyJu1Zn0=;
 b=aIpTCKE/V3kV8ZxRfMOHBwLIFNITUdlQquFH/oL1lgvRguf9gkT9Fl5muFyU9Dy/lw
 iMJuoNrmhHUEilVQlbHvNFLOZCf+YdRdEMtiDyhqT/4eeDJcDRxH2n3sXDwcp6SYXTvd
 GigR3sfWTCAfDd1D7r+V+Hn66jnRlHaMSbrqD3ob1pGVC6PHH1vqvg1+2vAkyycJGj7V
 eZxjMjhppIxr6LUzX/uXf49Oe51l0nBd5yLjf4gVU3PYjIiNkjB/V12dtuoMuUN2LDBA
 KKwDuTr3xzL2Xv3dzPZ4RkMZt+jtaaxEx2SCY2kSYKxO5QZd/Z3i4VkETVRwKBNTINi2
 5wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XggHg/DQ8QhJtcx6aM9YPetrL2sQVDLzuBfvyJu1Zn0=;
 b=LPOjW8QnFv/AkqTx60o5jPcdFDNesVt2d2dEQ0U6p8psKEMCxjTsw1gMTjK60h5XLp
 psHYIzfEDu6wvsnK/5c97PwHZx6Rao3Pb4kGjK3mXbTKiHAlk6LcVqxyz7BNwN3IGlHX
 YTO6iRrWqlDKAoh2lH2/VmbM0foNY0Vl2FgNP0Gq6Btvu5j8rUsX+23QMYFLdVLPQuuG
 UELHHQj0djYn0i7rnH7hd6JTGuj+muZe0W1vDeICV0beIC+QSaKC+BrfjiNPwstYaYkW
 S+9YpB+O7yg3kq7uQswyADpdp2Fz7K8SMetDO7qrEA7s/PMo8jWcllneWc/YeBU7qQdR
 cSjQ==
X-Gm-Message-State: AOAM530tkS4I4rqnmO2y7PHlIofoR9aNSEJ7uUu3ByzJuCxGgDKv+XPQ
 VMzY8w0VcPQk+4C4XOFKpwWIwA==
X-Google-Smtp-Source: ABdhPJwIiBvc2Fk/Ud2FE0mrQRWmGVX4FDLFoJ4tFN4L87Q8td6OtCTlchRbrYcYzvTfPCQ0DpbYrw==
X-Received: by 2002:a05:6000:15c4:: with SMTP id
 y4mr2346168wry.522.1644416695025; 
 Wed, 09 Feb 2022 06:24:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r11sm7428925wrt.28.2022.02.09.06.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:24:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 99FD41FFD1;
 Wed,  9 Feb 2022 14:15:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 26/28] plugins: move reset of plugin data to tb_start
Date: Wed,  9 Feb 2022 14:15:27 +0000
Message-Id: <20220209141529.3418384-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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

We unconditionally reset tcg_ctx->plugin_insn as the
plugin_insn_append code uses this as a proxy for knowing if plugins
are enabled for the current instruction. Otherwise we can hit a race
where a previously instrumented thread leaves a stale value after the
main thread exits and disables instrumentation.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/824
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220204204335.1689602-27-alex.bennee@linaro.org>

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 22d95fe1c3..3d0b101e34 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -854,10 +854,20 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
 
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
+
         ret = true;
 
         ptb->vaddr = tb->pc;
@@ -868,6 +878,9 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_onl
 
         plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
     }
+
+    tcg_ctx->plugin_insn = NULL;
+
     return ret;
 }
 
@@ -904,23 +917,19 @@ void plugin_gen_insn_end(void)
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


