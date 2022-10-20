Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48658606519
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:52:50 +0200 (CEST)
Received: from localhost ([::1]:48382 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXqh-0005gH-Ju
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:52:49 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXpR-0004TN-Oz
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZL-0001b2-NI
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:23:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZ1-00016k-4V
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:33 -0400
Received: by mail-wr1-x430.google.com with SMTP id bp11so34123429wrb.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x/W3YkfaznZAYyZCbVAFL8NmzfZ6dPSqWWMDIBipNM8=;
 b=owkWYdUwpB/bdcdNRRdNmzFo9tCi/ZHHgEH4u3pEH3ge45RXu2UIRVJg8ZYfJsqKve
 BDtLGBVmTGdelIqtNN9ZctCPwm22VESWLEYxLjJYLtobMrcbA7QKtQv5vVvrQeMJXbdY
 FJ4KaS5+mdbpn0csAAXyu/vdUkPuEkGKlo7+C0LbGhobu326RtUioK3Twy5BGHLSRQ6B
 R9sYO0XR9ObuqEr405EhcXTpUYvALA778qXwjTO4cCHW6TTFLyVGgQ3Z+6V7cqoF6Ehj
 i5xlBJrSYZdcxKlwNVZQqMqY0+4uT1Q5Ri0bg6umZO8Sw0lMUwo/oA5bbdthRqEd/nkQ
 Z5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x/W3YkfaznZAYyZCbVAFL8NmzfZ6dPSqWWMDIBipNM8=;
 b=zlNNVjO+/pCCWliu162I3bWDu7hiz+64K70YwoY+qo2sE7RmV3Wi/yLVa3QyQLc25s
 GCm8ialwa9n5nvkfvNPn/+sNcBx5yFIWUI58+WpcTF+zdVFETg3SAOeopTITNzw8G2gU
 Ek3AMNxdqNULv0wA96zhkbNWTeucahtD+z1HBntwG0Eo/BY0TfgdGUxHJ/eVCJmAc306
 c5olkkcP1Win3WDaUuJAETvXWEnh6vU7m+WFjDZlFqDfQ1SjUKoKDDUpLgj3xaB7YKk2
 vqzTZEYNQmHVlB06PF9sAPnCSizsFn2Z9DnE20yqIuwDs+WjTmmhNQFkCFnXGxLpQ15u
 tU/Q==
X-Gm-Message-State: ACrzQf1QRDiy6tk2ZBMW9EmnYoLDlctugmlq9IIdJ7gC6xCmAjb6fvhW
 aHM5hAVAu/aL+tDim7UzkCVCOLzlXHbKCA==
X-Google-Smtp-Source: AMsMyM4PD9COYLhYpqjCPMwD78PmIJfTo57qpDdu4XHZ/9wqoOy5bN1OF9S1TP3tl04GB/Eil4I58g==
X-Received: by 2002:adf:d226:0:b0:235:d9ae:1de9 with SMTP id
 k6-20020adfd226000000b00235d9ae1de9mr2037431wrh.599.1666268533542; 
 Thu, 20 Oct 2022 05:22:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/24] target/arm: Remove gen_exception_internal_insn pc
 argument
Date: Thu, 20 Oct 2022 13:21:41 +0100
Message-Id: <20221020122146.3177980-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
Since we always pass dc->pc_curr, fold the arithmetic to zero displacement.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221020030641.2066807-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c |  6 +++---
 target/arm/translate.c     | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8ed192198fd..713f1a89a4a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -332,9 +332,9 @@ static void gen_exception_internal(int excp)
     gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
-    gen_a64_update_pc(s, pc - s->pc_curr);
+    gen_a64_update_pc(s, 0);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2211,7 +2211,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
          * Secondly, "HLT 0xf000" is the A64 semihosting syscall instruction.
          */
         if (semihosting_enabled(s->current_el == 0) && imm16 == 0xf000) {
-            gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, EXCP_SEMIHOST);
         } else {
             unallocated_encoding(s);
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 350f991649b..9104ab82325 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1074,10 +1074,10 @@ static inline void gen_smc(DisasContext *s)
     s->base.is_jmp = DISAS_SMC;
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
     gen_set_condexec(s);
-    gen_update_pc(s, pc - s->pc_curr);
+    gen_update_pc(s, 0);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1169,7 +1169,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
      */
     if (semihosting_enabled(s->current_el != 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
         return;
     }
 
@@ -6556,7 +6556,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
     if (arm_dc_feature(s, ARM_FEATURE_M) &&
         semihosting_enabled(s->current_el == 0) &&
         (a->imm == 0xab)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
         gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
     }
@@ -8762,7 +8762,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M) &&
         semihosting_enabled(s->current_el == 0) &&
         (a->imm == semihost_imm)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
         gen_update_pc(s, curr_insn_len(s));
         s->svc_imm = a->imm;
-- 
2.25.1


