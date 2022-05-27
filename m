Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D9B53662D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:54:31 +0200 (CEST)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudEM-0008AQ-3z
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8N-0001Tr-BO
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:19 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8L-0005Oc-59
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:19 -0400
Received: by mail-pl1-x62d.google.com with SMTP id a13so4598363plh.6
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9h8O/PKdXL0KvuNK2v2gIq3YV3vKmkNQsNhTF8q3vR8=;
 b=F9MiOENocr2Agrn7togaV7sdzrW0gxRA9iQTuOIHgdrFdEPECcBqHN49CO4c7m2eU9
 x25oKyvr2WUJg3ifGx7qAnx8hs9WJW31HULT0vMzyQ+oevZnfP9dbEdNQweZ3PuGf4f6
 hcmi5zHYPeltm2FZ5onVwWenATzWFTbEnTkbJYmnivxJ1NB8FvibLo6DNqOETsN5OkT9
 GUNSWJBcR43Qr2YiPG9hxDn/nY8kbV7e8+NOzdsEAjO0p8JaWHq5F735Pgbfb+57Q7Ww
 z5IEWMkj2cQrqE5z6tnDe7BunJ3r3S+qMiNVSq9+xv58sHFnq094Ja4G7rRU+NHbECqp
 ue8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9h8O/PKdXL0KvuNK2v2gIq3YV3vKmkNQsNhTF8q3vR8=;
 b=blJnHpQpyiK3VX9A7R6yQhDz1vpjP+Sfjajhk3jqn8dB07ALZ1Yei/jr/UoioVMogg
 rhkSY/ryi6uBigjocaP5F4T26e03J6XHiAfCbVwzLMK+2kYvFxrU9py/IXDwtX/jk4Vk
 e8JCtWfD5sZRhTXxCuh7KDf5+RjKj4DY3knShxdePFGjSH+yIZF/aUu/tAyxYWpKbrvs
 ZUwrju9Pu90zBEUdl0x3S+G1nXTLzpRNEvv/sYJigTjn0JpGh0xyBHUT2LhgDEGgorr2
 QFiGofsu4/b4oJ9hCqmte1hyxEQyJ1uTXY/XOHZjlWqluIGN00dg76w9YehcRYNI5EZY
 sT1A==
X-Gm-Message-State: AOAM5315ONe8rfgSKR0Rs0SYUvb3ZlZ6zTeNnKKwuPx79QuFsDH92jcP
 ixlHfOSHHGUQA2DVtFOK6RK8oCp7uYFPaw==
X-Google-Smtp-Source: ABdhPJyQg2aaB2bEMz+g07RGblQTWtpAnTUUO22lTFZ3NkSLchPbEYPWgItN6feLLqJqPo9kt4556w==
X-Received: by 2002:a17:902:ea43:b0:161:f1fb:fb28 with SMTP id
 r3-20020a170902ea4300b00161f1fbfb28mr37353998plg.20.1653670095820; 
 Fri, 27 May 2022 09:48:15 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 07/17] target/m68k: Fix pc, c flag,
 and address argument for EXCP_DIV0
Date: Fri, 27 May 2022 09:47:57 -0700
Message-Id: <20220527164807.135038-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

According to the M68040 Users Manual, section 8.4.3,
Six word stack frame (format 2), Zero Div (and others)
is supposed to record the next insn in PC and the
address of the trapping instruction in ADDRESS.

While the N, Z and V flags are documented to be undefine on DIV0,
the C flag is documented as always cleared.

Update helper_div* to take the instruction length as an argument
and use raise_exception_format2.  Hoist the reset of the C flag
above the division by zero check.

Update m68k_interrupt_all to pass mmu.ar to do_stack_frame.
Update cpu_loop to pass mmu.ar to siginfo.si_addr, as the
kernel does in trap_c().

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/helper.h       | 12 +++++-----
 linux-user/m68k/cpu_loop.c |  2 +-
 target/m68k/op_helper.c    | 48 +++++++++++++++++++++++---------------
 target/m68k/translate.c    | 33 +++++++++++++-------------
 4 files changed, 52 insertions(+), 43 deletions(-)

diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index 0a6b4146f6..f016c4c1c2 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -1,12 +1,12 @@
 DEF_HELPER_1(bitrev, i32, i32)
 DEF_HELPER_1(ff1, i32, i32)
 DEF_HELPER_FLAGS_2(sats, TCG_CALL_NO_RWG_SE, i32, i32, i32)
-DEF_HELPER_3(divuw, void, env, int, i32)
-DEF_HELPER_3(divsw, void, env, int, s32)
-DEF_HELPER_4(divul, void, env, int, int, i32)
-DEF_HELPER_4(divsl, void, env, int, int, s32)
-DEF_HELPER_4(divull, void, env, int, int, i32)
-DEF_HELPER_4(divsll, void, env, int, int, s32)
+DEF_HELPER_4(divuw, void, env, int, i32, int)
+DEF_HELPER_4(divsw, void, env, int, s32, int)
+DEF_HELPER_5(divul, void, env, int, int, i32, int)
+DEF_HELPER_5(divsl, void, env, int, int, s32, int)
+DEF_HELPER_5(divull, void, env, int, int, i32, int)
+DEF_HELPER_5(divsll, void, env, int, int, s32, int)
 DEF_HELPER_2(set_sr, void, env, i32)
 DEF_HELPER_3(cf_movec_to, void, env, i32, i32)
 DEF_HELPER_3(m68k_movec_to, void, env, i32, i32)
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index e24d17e180..6598bce3c4 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -50,7 +50,7 @@ void cpu_loop(CPUM68KState *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->mmu.ar);
             break;
         case EXCP_DIV0:
-            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->mmu.ar);
             break;
         case EXCP_TRAP0:
             {
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 750d65576f..729ee0e934 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -396,7 +396,6 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_ILLEGAL:
-    case EXCP_DIV0:
     case EXCP_TRAPCC:
     case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
@@ -404,6 +403,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_CHK:
+    case EXCP_DIV0:
         do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
         break;
 
@@ -574,18 +574,19 @@ raise_exception_format2(CPUM68KState *env, int tt, int ilen, uintptr_t raddr)
     cpu_loop_exit(cs);
 }
 
-void HELPER(divuw)(CPUM68KState *env, int destr, uint32_t den)
+void HELPER(divuw)(CPUM68KState *env, int destr, uint32_t den, int ilen)
 {
     uint32_t num = env->dregs[destr];
     uint32_t quot, rem;
 
+    env->cc_c = 0; /* always cleared, even if div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0; /* always cleared, even if overflow */
     if (quot > 0xffff) {
         env->cc_v = -1;
         /*
@@ -601,18 +602,19 @@ void HELPER(divuw)(CPUM68KState *env, int destr, uint32_t den)
     env->cc_v = 0;
 }
 
-void HELPER(divsw)(CPUM68KState *env, int destr, int32_t den)
+void HELPER(divsw)(CPUM68KState *env, int destr, int32_t den, int ilen)
 {
     int32_t num = env->dregs[destr];
     uint32_t quot, rem;
 
+    env->cc_c = 0; /* always cleared, even if overflow/div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0; /* always cleared, even if overflow */
     if (quot != (int16_t)quot) {
         env->cc_v = -1;
         /* nothing else is modified */
@@ -629,18 +631,20 @@ void HELPER(divsw)(CPUM68KState *env, int destr, int32_t den)
     env->cc_v = 0;
 }
 
-void HELPER(divul)(CPUM68KState *env, int numr, int regr, uint32_t den)
+void HELPER(divul)(CPUM68KState *env, int numr, int regr,
+                   uint32_t den, int ilen)
 {
     uint32_t num = env->dregs[numr];
     uint32_t quot, rem;
 
+    env->cc_c = 0; /* always cleared, even if div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0;
     env->cc_z = quot;
     env->cc_n = quot;
     env->cc_v = 0;
@@ -657,18 +661,20 @@ void HELPER(divul)(CPUM68KState *env, int numr, int regr, uint32_t den)
     }
 }
 
-void HELPER(divsl)(CPUM68KState *env, int numr, int regr, int32_t den)
+void HELPER(divsl)(CPUM68KState *env, int numr, int regr,
+                   int32_t den, int ilen)
 {
     int32_t num = env->dregs[numr];
     int32_t quot, rem;
 
+    env->cc_c = 0; /* always cleared, even if overflow/div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0;
     env->cc_z = quot;
     env->cc_n = quot;
     env->cc_v = 0;
@@ -685,19 +691,21 @@ void HELPER(divsl)(CPUM68KState *env, int numr, int regr, int32_t den)
     }
 }
 
-void HELPER(divull)(CPUM68KState *env, int numr, int regr, uint32_t den)
+void HELPER(divull)(CPUM68KState *env, int numr, int regr,
+                    uint32_t den, int ilen)
 {
     uint64_t num = deposit64(env->dregs[numr], 32, 32, env->dregs[regr]);
     uint64_t quot;
     uint32_t rem;
 
+    env->cc_c = 0; /* always cleared, even if overflow/div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0; /* always cleared, even if overflow */
     if (quot > 0xffffffffULL) {
         env->cc_v = -1;
         /*
@@ -720,19 +728,21 @@ void HELPER(divull)(CPUM68KState *env, int numr, int regr, uint32_t den)
     env->dregs[numr] = quot;
 }
 
-void HELPER(divsll)(CPUM68KState *env, int numr, int regr, int32_t den)
+void HELPER(divsll)(CPUM68KState *env, int numr, int regr,
+                    int32_t den, int ilen)
 {
     int64_t num = deposit64(env->dregs[numr], 32, 32, env->dregs[regr]);
     int64_t quot;
     int32_t rem;
 
+    env->cc_c = 0; /* always cleared, even if overflow/div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0; /* always cleared, even if overflow */
     if (quot != (int32_t)quot) {
         env->cc_v = -1;
         /*
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 6d6d026e3c..d775345bfa 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1601,6 +1601,7 @@ DISAS_INSN(divw)
     int sign;
     TCGv src;
     TCGv destr;
+    TCGv ilen;
 
     /* divX.w <EA>,Dn    32/16 -> 16r:16q */
 
@@ -1609,20 +1610,20 @@ DISAS_INSN(divw)
     /* dest.l / src.w */
 
     SRC_EA(env, src, OS_WORD, sign, NULL);
-    destr = tcg_const_i32(REG(insn, 9));
+    destr = tcg_constant_i32(REG(insn, 9));
+    ilen = tcg_constant_i32(s->pc - s->base.pc_next);
     if (sign) {
-        gen_helper_divsw(cpu_env, destr, src);
+        gen_helper_divsw(cpu_env, destr, src, ilen);
     } else {
-        gen_helper_divuw(cpu_env, destr, src);
+        gen_helper_divuw(cpu_env, destr, src, ilen);
     }
-    tcg_temp_free(destr);
 
     set_cc_op(s, CC_OP_FLAGS);
 }
 
 DISAS_INSN(divl)
 {
-    TCGv num, reg, den;
+    TCGv num, reg, den, ilen;
     int sign;
     uint16_t ext;
 
@@ -1639,15 +1640,14 @@ DISAS_INSN(divl)
         /* divX.l <EA>, Dr:Dq    64/32 -> 32r:32q */
 
         SRC_EA(env, den, OS_LONG, 0, NULL);
-        num = tcg_const_i32(REG(ext, 12));
-        reg = tcg_const_i32(REG(ext, 0));
+        num = tcg_constant_i32(REG(ext, 12));
+        reg = tcg_constant_i32(REG(ext, 0));
+        ilen = tcg_constant_i32(s->pc - s->base.pc_next);
         if (sign) {
-            gen_helper_divsll(cpu_env, num, reg, den);
+            gen_helper_divsll(cpu_env, num, reg, den, ilen);
         } else {
-            gen_helper_divull(cpu_env, num, reg, den);
+            gen_helper_divull(cpu_env, num, reg, den, ilen);
         }
-        tcg_temp_free(reg);
-        tcg_temp_free(num);
         set_cc_op(s, CC_OP_FLAGS);
         return;
     }
@@ -1656,15 +1656,14 @@ DISAS_INSN(divl)
     /* divXl.l <EA>, Dr:Dq    32/32 -> 32r:32q */
 
     SRC_EA(env, den, OS_LONG, 0, NULL);
-    num = tcg_const_i32(REG(ext, 12));
-    reg = tcg_const_i32(REG(ext, 0));
+    num = tcg_constant_i32(REG(ext, 12));
+    reg = tcg_constant_i32(REG(ext, 0));
+    ilen = tcg_constant_i32(s->pc - s->base.pc_next);
     if (sign) {
-        gen_helper_divsl(cpu_env, num, reg, den);
+        gen_helper_divsl(cpu_env, num, reg, den, ilen);
     } else {
-        gen_helper_divul(cpu_env, num, reg, den);
+        gen_helper_divul(cpu_env, num, reg, den, ilen);
     }
-    tcg_temp_free(reg);
-    tcg_temp_free(num);
 
     set_cc_op(s, CC_OP_FLAGS);
 }
-- 
2.34.1


