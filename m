Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADFD887E8
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 06:20:35 +0200 (CEST)
Received: from localhost ([::1]:34878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwIrq-0004iQ-Ab
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 00:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34689)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIko-0005Ow-MB
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkm-0004F8-4L
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:18 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:47088)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hwIkl-0004Ew-U5
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:16 -0400
Received: by mail-ot1-x343.google.com with SMTP id z17so22039221otk.13
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 21:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yMfSxCj3hPs9P0sLn5EV7jE/uUeD9Vqi65PSWmUj6As=;
 b=M0cjkg4XJ9ge2fa8IQuIVL1OWICEf2eh5MEiUT9kygYNq9KsXJ+ucigGeFSWZfUfzX
 IWvhhYDmigCloK7cJmpYQoDgLFnTVP4DXd5yycaq/4fvGlPkgAiBX1xMku9969fjgS3b
 9Uqn8jeq8D4vheNi/DHbnmdSPO2ykigYNwO0Q5BrQCxwThmqN8tfYxK0QMdmtip3YvJ/
 sR4XMoEbaxJ3wZiUsKYFMyUVgIpT5m/jUhkpr/9KAaG1pCNK+cA1mU7cK2uup2IDHWvu
 lRo9BXo0Mzflva5GxpAtQMf0iVTd+HiqKI9xbZJENUYKlVTwo8mFc2A5lqLvBzWv0zyw
 QuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yMfSxCj3hPs9P0sLn5EV7jE/uUeD9Vqi65PSWmUj6As=;
 b=RW07MIvRSuMa8w8brtMu9+SvvSmlffoA1RmhhM/G5pkaJC0Odyw/kQCiIb9LMoBMpK
 0CP6Uhf7zKjf9QINPadQgEbk6XGoW3x3bzC1jE4t07x8I6QEckwkusdqYH2i6bMEgkg4
 /lFjYmkMyxuAak20226iFiZE3IeO6bcMlhbXF/8EQ184jAfovhT2zJxGJJkRK+EhkVRZ
 8tJ8XoztmvLmoJhw4S0SjzhFAwPrsT6MhfS9mHXLuKdOe4edC7GbX7iSYr4PCSj9URSC
 nsfoFx6ISx1B7pyFt/lXvJ2602dn2u6JCAATQYVE38gUupiHJHOHFgG3mR42oIpJv8G6
 TTGQ==
X-Gm-Message-State: APjAAAXJymGYgsdbrIPIR/obZtFv16bH6KMCQefSiFaddNAlD46IfeFE
 Nw0DHWNt66TgQ75vdPs+7+o3+6f3
X-Google-Smtp-Source: APXvYqyprA9TPaz6I2EnKr3OyUvLc7IKBZ50wSJZ0Re8kk1Bbah57112REBRYU1qCBlzV5vMaFhI8g==
X-Received: by 2002:aca:4588:: with SMTP id s130mr8015617oia.79.1565410394793; 
 Fri, 09 Aug 2019 21:13:14 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id f84sm33383540oig.43.2019.08.09.21.13.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 21:13:14 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Aug 2019 00:12:23 -0400
Message-Id: <20190810041255.6820-8-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810041255.6820-1-jan.bobek@gmail.com>
References: <20190810041255.6820-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: [Qemu-devel] [RFC PATCH v2 07/39] target/i386: use pc_start from
 DisasContext
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The variable pc_start is already a member of DisasContext. Remove the
superfluous local variable.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 131 ++++++++++++++++++++--------------------
 1 file changed, 65 insertions(+), 66 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 7532d65778..b1ba2fc3e5 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4495,13 +4495,12 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     TCGMemOp ot;
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
-    target_ulong pc_start = s->base.pc_next;
 
     {
     int prefixes;
     TCGMemOp aflag, dflag;
 
-    s->pc_start = s->pc = pc_start;
+    s->pc_start = s->pc = s->base.pc_next;
     s->override = -1;
 #ifdef TARGET_X86_64
     s->rex_x = 0;
@@ -6357,7 +6356,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa5:
         ot = mo_b_d(b, s->dflag);
         if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_movs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_movs(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base);
         } else {
             gen_movs(s, ot);
         }
@@ -6367,7 +6366,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xab:
         ot = mo_b_d(b, s->dflag);
         if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_stos(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_stos(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base);
         } else {
             gen_stos(s, ot);
         }
@@ -6376,7 +6375,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xad:
         ot = mo_b_d(b, s->dflag);
         if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_lods(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_lods(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base);
         } else {
             gen_lods(s, ot);
         }
@@ -6385,9 +6384,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xaf:
         ot = mo_b_d(b, s->dflag);
         if (s->prefix & PREFIX_REPNZ) {
-            gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
+            gen_repz_scas(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base, 1);
         } else if (s->prefix & PREFIX_REPZ) {
-            gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
+            gen_repz_scas(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base, 0);
         } else {
             gen_scas(s, ot);
         }
@@ -6397,9 +6396,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa7:
         ot = mo_b_d(b, s->dflag);
         if (s->prefix & PREFIX_REPNZ) {
-            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
+            gen_repz_cmps(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base, 1);
         } else if (s->prefix & PREFIX_REPZ) {
-            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
+            gen_repz_cmps(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base, 0);
         } else {
             gen_cmps(s, ot);
         }
@@ -6408,10 +6407,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x6d:
         ot = mo_b_d32(b, s->dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        gen_check_io(s, ot, pc_start - s->cs_base, 
+        gen_check_io(s, ot, s->pc_start - s->cs_base,
                      SVM_IOIO_TYPE_MASK | svm_is_rep(s->prefix) | 4);
         if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_ins(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_ins(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base);
         } else {
             gen_ins(s, ot);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
@@ -6423,10 +6422,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x6f:
         ot = mo_b_d32(b, s->dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        gen_check_io(s, ot, pc_start - s->cs_base,
+        gen_check_io(s, ot, s->pc_start - s->cs_base,
                      svm_is_rep(s->prefix) | 4);
         if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_outs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_outs(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base);
         } else {
             gen_outs(s, ot);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
@@ -6443,7 +6442,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         ot = mo_b_d32(b, s->dflag);
         val = x86_ldub_code(env, s);
         tcg_gen_movi_tl(s->T0, val);
-        gen_check_io(s, ot, pc_start - s->cs_base,
+        gen_check_io(s, ot, s->pc_start - s->cs_base,
                      SVM_IOIO_TYPE_MASK | svm_is_rep(s->prefix));
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
@@ -6462,7 +6461,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         ot = mo_b_d32(b, s->dflag);
         val = x86_ldub_code(env, s);
         tcg_gen_movi_tl(s->T0, val);
-        gen_check_io(s, ot, pc_start - s->cs_base,
+        gen_check_io(s, ot, s->pc_start - s->cs_base,
                      svm_is_rep(s->prefix));
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
 
@@ -6482,7 +6481,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xed:
         ot = mo_b_d32(b, s->dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        gen_check_io(s, ot, pc_start - s->cs_base,
+        gen_check_io(s, ot, s->pc_start - s->cs_base,
                      SVM_IOIO_TYPE_MASK | svm_is_rep(s->prefix));
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
@@ -6500,7 +6499,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xef:
         ot = mo_b_d32(b, s->dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        gen_check_io(s, ot, pc_start - s->cs_base,
+        gen_check_io(s, ot, s->pc_start - s->cs_base,
                      svm_is_rep(s->prefix));
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
 
@@ -6541,7 +6540,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     do_lret:
         if (s->pe && !s->vm86) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             gen_helper_lret_protected(cpu_env, tcg_const_i32(s->dflag - 1),
                                       tcg_const_i32(val));
         } else {
@@ -6564,7 +6563,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         val = 0;
         goto do_lret;
     case 0xcf: /* iret */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_IRET);
+        gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_IRET);
         if (!s->pe) {
             /* real mode */
             gen_helper_iret_real(cpu_env, tcg_const_i32(s->dflag - 1));
@@ -6691,7 +6690,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /************************/
         /* flags */
     case 0x9c: /* pushf */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_PUSHF);
+        gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_PUSHF);
         if (s->vm86 && s->iopl != 3) {
             gen_exception(s, EXCP0D_GPF);
         } else {
@@ -6701,7 +6700,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0x9d: /* popf */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_POPF);
+        gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_POPF);
         if (s->vm86 && s->iopl != 3) {
             gen_exception(s, EXCP0D_GPF);
         } else {
@@ -7046,8 +7045,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (s->prefix & PREFIX_REPZ) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - pc_start));
+            gen_jmp_im(s, s->pc_start - s->cs_base);
+            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->pc_start));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7060,27 +7059,27 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0xcc: /* int3 */
-        gen_interrupt(s, EXCP03_INT3, pc_start - s->cs_base, s->pc - s->cs_base);
+        gen_interrupt(s, EXCP03_INT3, s->pc_start - s->cs_base, s->pc - s->cs_base);
         break;
     case 0xcd: /* int N */
         val = x86_ldub_code(env, s);
         if (s->vm86 && s->iopl != 3) {
             gen_exception(s, EXCP0D_GPF);
         } else {
-            gen_interrupt(s, val, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_interrupt(s, val, s->pc_start - s->cs_base, s->pc - s->cs_base);
         }
         break;
     case 0xce: /* into */
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
-        gen_helper_into(cpu_env, tcg_const_i32(s->pc - pc_start));
+        gen_jmp_im(s, s->pc_start - s->cs_base);
+        gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->pc_start));
         break;
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_ICEBP);
-        gen_debug(s, pc_start - s->cs_base);
+        gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_ICEBP);
+        gen_debug(s, s->pc_start - s->cs_base);
         break;
 #endif
     case 0xfa: /* cli */
@@ -7200,7 +7199,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_exception(s, EXCP0D_GPF);
         } else {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             if (b & 2) {
                 gen_helper_rdmsr(cpu_env);
             } else {
@@ -7210,7 +7209,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x131: /* rdtsc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_jmp_im(s, s->pc_start - s->cs_base);
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -7222,7 +7221,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x133: /* rdpmc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_jmp_im(s, s->pc_start - s->cs_base);
         gen_helper_rdpmc(cpu_env);
         break;
     case 0x134: /* sysenter */
@@ -7251,8 +7250,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x105: /* syscall */
         /* XXX: is it usable in real mode ? */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
-        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - pc_start));
+        gen_jmp_im(s, s->pc_start - s->cs_base);
+        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->pc_start));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
            generated after one has entered CPL0 if TF is set in FMASK.  */
@@ -7277,7 +7276,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
     case 0x1a2: /* cpuid */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_jmp_im(s, s->pc_start - s->cs_base);
         gen_helper_cpuid(cpu_env);
         break;
     case 0xf4: /* hlt */
@@ -7285,8 +7284,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_exception(s, EXCP0D_GPF);
         } else {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - pc_start));
+            gen_jmp_im(s, s->pc_start - s->cs_base);
+            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - s->pc_start));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7298,7 +7297,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 0: /* sldt */
             if (!s->pe || s->vm86)
                 goto illegal_op;
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_READ);
+            gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_LDTR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, ldt.selector));
             ot = mod == 3 ? s->dflag : MO_16;
@@ -7310,7 +7309,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (s->cpl != 0) {
                 gen_exception(s, EXCP0D_GPF);
             } else {
-                gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);
+                gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_LDTR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lldt(cpu_env, s->tmp2_i32);
@@ -7319,7 +7318,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 1: /* str */
             if (!s->pe || s->vm86)
                 goto illegal_op;
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_READ);
+            gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_TR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, tr.selector));
             ot = mod == 3 ? s->dflag : MO_16;
@@ -7331,7 +7330,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (s->cpl != 0) {
                 gen_exception(s, EXCP0D_GPF);
             } else {
-                gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);
+                gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_TR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ltr(cpu_env, s->tmp2_i32);
@@ -7359,7 +7358,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         modrm = x86_ldub_code(env, s);
         switch (modrm) {
         CASE_MODRM_MEM_OP(0): /* sgdt */
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_READ);
+            gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_GDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0,
                              cpu_env, offsetof(CPUX86State, gdt.limit));
@@ -7377,7 +7376,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
             gen_extu(s->aflag, s->A0);
             gen_add_A0_ds_seg(s);
@@ -7389,8 +7388,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - pc_start));
+            gen_jmp_im(s, s->pc_start - s->cs_base);
+            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->pc_start));
             gen_eob(s);
             break;
 
@@ -7415,7 +7414,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(1): /* sidt */
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_READ);
+            gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_IDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.limit));
             gen_op_st_v(s, MO_16, s->T0, s->A0);
@@ -7466,9 +7465,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
-                             tcg_const_i32(s->pc - pc_start));
+                             tcg_const_i32(s->pc - s->pc_start));
             tcg_gen_exit_tb(NULL, 0);
             s->base.is_jmp = DISAS_NORETURN;
             break;
@@ -7478,7 +7477,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             gen_helper_vmmcall(cpu_env);
             break;
 
@@ -7491,7 +7490,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7504,7 +7503,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7533,7 +7532,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             gen_helper_clgi(cpu_env);
             break;
 
@@ -7544,7 +7543,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             gen_helper_skinit(cpu_env);
             break;
 
@@ -7557,7 +7556,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             gen_helper_invlpga(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7566,7 +7565,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_exception(s, EXCP0D_GPF);
                 break;
             }
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_WRITE);
+            gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_GDTR_WRITE);
             gen_lea_modrm(env, s, modrm);
             gen_op_ld_v(s, MO_16, s->T1, s->A0);
             gen_add_A0_im(s, 2);
@@ -7583,7 +7582,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_exception(s, EXCP0D_GPF);
                 break;
             }
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_WRITE);
+            gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_IDTR_WRITE);
             gen_lea_modrm(env, s, modrm);
             gen_op_ld_v(s, MO_16, s->T1, s->A0);
             gen_add_A0_im(s, 2);
@@ -7596,7 +7595,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_OP(4): /* smsw */
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_READ_CR0);
+            gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_READ_CR0);
             tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, cr[0]));
             if (CODE64(s)) {
                 mod = (modrm >> 6) & 3;
@@ -7628,7 +7627,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_exception(s, EXCP0D_GPF);
                 break;
             }
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
+            gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_WRITE_CR0);
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             gen_helper_lmsw(cpu_env, s->T0);
             gen_jmp_im(s, s->pc - s->cs_base);
@@ -7641,7 +7640,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             gen_lea_modrm(env, s, modrm);
             gen_helper_invlpg(cpu_env, s->A0);
             gen_jmp_im(s, s->pc - s->cs_base);
@@ -7670,7 +7669,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
             }
@@ -7691,7 +7690,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (s->cpl != 0) {
             gen_exception(s, EXCP0D_GPF);
         } else {
-            gen_svm_check_intercept(s, pc_start, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
+            gen_svm_check_intercept(s, s->pc_start, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
             /* nothing to do */
         }
         break;
@@ -8038,7 +8037,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             case 4:
             case 8:
                 gen_update_cc_op(s);
-                gen_jmp_im(s, pc_start - s->cs_base);
+                gen_jmp_im(s, s->pc_start - s->cs_base);
                 if (b & 2) {
                     if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                         gen_io_start();
@@ -8088,14 +8087,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (b & 2) {
-                gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_DR0 + reg);
+                gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_WRITE_DR0 + reg);
                 gen_op_mov_v_reg(s, ot, s->T0, rm);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
                 gen_jmp_im(s, s->pc - s->cs_base);
                 gen_eob(s);
             } else {
-                gen_svm_check_intercept(s, pc_start, SVM_EXIT_READ_DR0 + reg);
+                gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_READ_DR0 + reg);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_get_dr(s->T0, cpu_env, s->tmp2_i32);
                 gen_op_mov_reg_v(s, ot, rm, s->T0);
@@ -8106,7 +8105,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (s->cpl != 0) {
             gen_exception(s, EXCP0D_GPF);
         } else {
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
+            gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
             gen_jmp_im(s, s->pc - s->cs_base);
@@ -8332,7 +8331,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_nop_modrm(env, s, modrm);
         break;
     case 0x1aa: /* rsm */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_RSM);
+        gen_svm_check_intercept(s, s->pc_start, SVM_EXIT_RSM);
         if (!(s->flags & HF_SMM_MASK))
             goto illegal_op;
         gen_update_cc_op(s);
-- 
2.20.1


