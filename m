Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67000546ABA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:43:06 +0200 (CEST)
Received: from localhost ([::1]:34470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhiz-0005Ph-3h
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB6-0007le-Av
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:05 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:37858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB2-0007HT-4s
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:01 -0400
Received: by mail-lj1-x235.google.com with SMTP id d18so1713550ljc.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GIJAKjqjk82j4qLi89phpcXSoasjqOGMue/8bM6AHuI=;
 b=jMunyR24nal9ye+U+RlEQLnoyZ3GHK6+yLCtTinOvqctaf3NoeM28yhtDxtIBXc0/U
 ZbzLWvhxo5ragg2b1mps7lXRjdu+GTlcTeC6y6dsf67mKnwqSADxXVeJG+BWU3EbkIpZ
 X54wcErUqsqEcx+ah1LzlmIeNMf/8u/wUi3L5IxKBbtO1V+CiM5kqbGJJXat0eBXEXnf
 FbAYl6wSPFqdb+RRbgomlLtIVCyssO7JoQdunzxbeyKaH2nnbbaP3cCGBQoxZlpEmmqR
 Xm8u650VSdsMqGUvv+297IeL1uklGTac0ZMiw0LbCavhStxcUNgLkbjF61NkVeQ209Kz
 4wXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GIJAKjqjk82j4qLi89phpcXSoasjqOGMue/8bM6AHuI=;
 b=IG4ANcePNCZgjdJKwV7I/X0/MXoJZmtIw6ZLmFkBFA4B8DgUMgOfh+Oho3nx8xLtst
 xiIcNi2dEITr4O6zgzgttSt5ZHYAtjZ8s2Ae9RH3TV+wkJazBDZM9WY7mzt5X403x1r4
 QxRj0hbgBcNt3afVEKk8USaGTnDtOp/qSo7L5Juk9uq2EZIVzOpkNTimNtPzHtTwxsY5
 27xF9VK+nIfNvIybVpw/Yx9XJ6RWLbm6jnWTfe/GYpe2nNZQoPuaR1yO2hTJOEZhRP5F
 B5NwtsM1QmKB6Bwr7wAmVKadq0CamZCM0RjAmMXDq7vOu8hA61x8WIAI8vKO/JYmJIim
 0Kgw==
X-Gm-Message-State: AOAM531F70P6mjyGfprlN61ENEHF8Neh/orSMeITZzA3X/XDsaIm1oj1
 SteeYoY5LhqHzcPvewBS1YdelKHyhDq2Tw==
X-Google-Smtp-Source: ABdhPJxSn/cDoUs+MLeENk1k2qEuK9ywqVtY7bHShY8LClptFiciJJ/oz8Wuts3VOF4LA9l4K1isjg==
X-Received: by 2002:adf:e902:0:b0:213:a337:92ae with SMTP id
 f2-20020adfe902000000b00213a33792aemr41281187wrm.84.1654877267891; 
 Fri, 10 Jun 2022 09:07:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/28] target/arm: Move exception_bkpt_insn to debug_helper.c
Date: Fri, 10 Jun 2022 17:07:17 +0100
Message-Id: <20220610160738.2230762-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c | 31 +++++++++++++++++++++++++++++++
 target/arm/op_helper.c    | 29 -----------------------------
 2 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index a18a09a0c3e..80dff0788b7 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -430,6 +430,37 @@ void arm_debug_excp_handler(CPUState *cs)
     }
 }
 
+/*
+ * Raise an EXCP_BKPT with the specified syndrome register value,
+ * targeting the correct exception level for debug exceptions.
+ */
+void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
+{
+    int debug_el = arm_debug_target_el(env);
+    int cur_el = arm_current_el(env);
+
+    /* FSR will only be used if the debug target EL is AArch32. */
+    env->exception.fsr = arm_debug_exception_fsr(env);
+    /*
+     * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
+     * values to the guest that it shouldn't be able to see at its
+     * exception/security level.
+     */
+    env->exception.vaddress = 0;
+    /*
+     * Other kinds of architectural debug exception are ignored if
+     * they target an exception level below the current one (in QEMU
+     * this is checked by arm_generate_debug_exceptions()). Breakpoint
+     * instructions are special because they always generate an exception
+     * to somewhere: if they can't go to the configured debug exception
+     * level they are taken to the current exception level.
+     */
+    if (debug_el < cur_el) {
+        debug_el = cur_el;
+    }
+    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 97c8c9ec778..2a8bdc2cbf0 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -399,35 +399,6 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
-/* Raise an EXCP_BKPT with the specified syndrome register value,
- * targeting the correct exception level for debug exceptions.
- */
-void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
-{
-    int debug_el = arm_debug_target_el(env);
-    int cur_el = arm_current_el(env);
-
-    /* FSR will only be used if the debug target EL is AArch32. */
-    env->exception.fsr = arm_debug_exception_fsr(env);
-    /* FAR is UNKNOWN: clear vaddress to avoid potentially exposing
-     * values to the guest that it shouldn't be able to see at its
-     * exception/security level.
-     */
-    env->exception.vaddress = 0;
-    /*
-     * Other kinds of architectural debug exception are ignored if
-     * they target an exception level below the current one (in QEMU
-     * this is checked by arm_generate_debug_exceptions()). Breakpoint
-     * instructions are special because they always generate an exception
-     * to somewhere: if they can't go to the configured debug exception
-     * level they are taken to the current exception level.
-     */
-    if (debug_el < cur_el) {
-        debug_el = cur_el;
-    }
-    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
-}
-
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
 {
     return cpsr_read(env) & ~CPSR_EXEC;
-- 
2.25.1


