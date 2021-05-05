Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565E737378E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:30:51 +0200 (CEST)
Received: from localhost ([::1]:44522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDrm-0006HI-Bp
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkX-0000vP-M6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:22 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:56177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkP-0005BA-Bf
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:21 -0400
Received: by mail-wm1-x330.google.com with SMTP id i128so974538wma.5
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pzxmZD4B0lAUAH8sN7d3Ghe+Y5XcNwSkO4kOPPQi1iI=;
 b=t1EZxG0Kl7tkdZSzFCP0uMUFnfkTaFbuymR9dzujn3bMHkACC5jCW9WcMz0u8fnsuM
 nJngLqz53vTPL/YJTU09S0UrQF5Ejc2cPMz0j4gq+CWXRfQM7OYw4r/+8WKKusY+12XG
 rAjTJJYmhNyoT4UZujcLswiNcfZLWg7aBFxE2img1h1DwC/43zE08GUf2D87uR6LcLxz
 8ix6SaeNo5eYpqrnPBp7BxJ/BoqAFS8QfxME8tHpe3BjSPaoOvsmHEwt12nDKF3RnQuw
 tRYrA60I4QgqOiKg+yihypAVl4WnaWJ0NpLh2Fy8aVO3oDc/R41W7T1TJk3eqGCSWEiB
 ltsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pzxmZD4B0lAUAH8sN7d3Ghe+Y5XcNwSkO4kOPPQi1iI=;
 b=gx+5HMJ7LdQJhNU6yi2JzK8rmoCEt5bijy7Fo2bG0UubhFMtc+2EKlF5quHGWTdxRo
 OolL+SpgULoVKPi5g72K3MyZcDNFfwzoC8tuxhiQwF/X6ErXf/4hhtfK9bw2VvzLAc8p
 fOoZi0SIItEcxh+y7QwADGlTe91yl1ECE/UtKYsNUpVLcJc7HH0xlFEE8wekvoQMdvl1
 XYtHLh+Wp+CHdkKvO6loxkwa25KbcGARvae4bVX/dkOokbmek1ZvMwaD1xdqeQlOkRO8
 N1aIREOFinCby+MBWAuYRyzTsx+AlZwroBTbEo8OK3xnN5RNe+eYOVTv+m00LLlJtKyf
 tAxQ==
X-Gm-Message-State: AOAM532PAlnSL4c+fiwnrw7HPfeayU9Dso9m/XlYWPa65Bs1qHKK6DGp
 DejcfbIKPwuhxTout57wE54q1w==
X-Google-Smtp-Source: ABdhPJwDQOPyfxu88Zpg/uD+cmrF7lOWMiDpMfZDMxMBCCR2TRDJixsoRkfUXwYzFlXy30chvV7iaA==
X-Received: by 2002:a1c:6646:: with SMTP id a67mr8705560wmc.11.1620206591236; 
 Wed, 05 May 2021 02:23:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 61sm20282645wrm.52.2021.05.05.02.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:23:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 75B7E1FF93;
 Wed,  5 May 2021 10:23:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 7/7] tcg: add trace events for [exit|goto]_tb and goto_ptr
Date: Wed,  5 May 2021 10:22:59 +0100
Message-Id: <20210505092259.8202-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505092259.8202-1-alex.bennee@linaro.org>
References: <20210505092259.8202-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, minyihh@uci.edu,
 robhenry@microsoft.com, vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 mohamad.gebai@gmail.com, kuhn.chenqun@huawei.com,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are generic trace points in common helper functions used by all
front ends. They mainly serve as additional in-tree examples of TCG
trace points and can be used to compare and contrast with getting
similar information from the TCG plugins.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tcg/tcg-op.c |  8 ++++++++
 trace-events | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 70475773f4..46b00f6e9b 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2687,6 +2687,8 @@ void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
         tcg_debug_assert(idx == TB_EXIT_REQUESTED);
     }
 
+    trace_exit_tb_tcg(val & ~TB_EXIT_MASK, val & TB_EXIT_MASK);
+
     plugin_gen_disable_mem_helpers();
     tcg_gen_op1i(INDEX_op_exit_tb, val);
 }
@@ -2703,6 +2705,9 @@ void tcg_gen_goto_tb(unsigned idx)
     plugin_gen_disable_mem_helpers();
     /* When not chaining, we simply fall through to the "fallback" exit.  */
     if (!qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
+
+        trace_goto_tb_tcg(idx);
+
         tcg_gen_op1i(INDEX_op_goto_tb, idx);
     }
 }
@@ -2715,6 +2720,9 @@ void tcg_gen_lookup_and_goto_ptr(void)
         plugin_gen_disable_mem_helpers();
         ptr = tcg_temp_new_ptr();
         gen_helper_lookup_tb_ptr(ptr, cpu_env);
+
+        trace_goto_ptr_tcg(ptr);
+
         tcg_gen_op1i(INDEX_op_goto_ptr, tcgv_ptr_arg(ptr));
         tcg_temp_free_ptr(ptr);
     } else {
diff --git a/trace-events b/trace-events
index ac7cef9335..1fcb8c4dda 100644
--- a/trace-events
+++ b/trace-events
@@ -136,6 +136,18 @@ vcpu guest_cpu_reset(void)
 # Targets: TCG(all)
 vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=%d", "vaddr=0x%016"PRIx64" info=%d"
 
+# Mode: user, softmmu
+# Targets: TCG(all)
+tcg exit_tb(uint64_t ptr, uint64_t idx) "tb=0x%016"PRIx64"/%"PRId64"", "tb=0x%016"PRIx64"/%"PRId64""
+
+# Mode: user, softmmu
+# Targets: TCG(all)
+tcg goto_tb(uint64_t idx) "idx=%"PRId64"", "idx=%"PRId64""
+
+# Mode: user, softmmu
+# Targets: TCG(all)
+tcg goto_ptr(TCGv_ptr ptr) "", "ptr=%p"
+
 # include/user/syscall-trace.h
 
 # @num: System call number.
-- 
2.20.1


