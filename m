Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5D37CB54
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 20:00:23 +0200 (CEST)
Received: from localhost ([::1]:43371 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hssti-0007Po-9M
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 14:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hssrE-0002Bs-1t
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hssr9-0002gn-Te
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:47 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:43094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hssr9-0002fq-Lo
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:43 -0400
Received: by mail-yw1-xc41.google.com with SMTP id n205so25261464ywb.10
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 10:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YLAV4S2K9nuAQ0oLu4D3+8uBxnJ+zXBmJQ4Cts7htIw=;
 b=FKzztEheieaRTuVnzJBllq8gZ7wF686XdxA4Jn7kwFjEjsm6OfwW8YRezyUYxqKz2n
 hudlbrnvJ0xUwNSOZJPLJwWDi7qv7rlIVvqBHpC1hj2LoXqYD7xfyM3AWfa0Q9U/TLa7
 HKUV+8RfECoEVqr7xVL6x5MSKjPSs1IoXFvm0/v3G6N5ht20VNnFGn0rxD4AnCL1zX+D
 NKB7iHd8WKE+gybkf0EOe+SW6DZ2tSiOH82CfTqLP/AlMc2QZZwudL5+f04M3uAVn4MW
 2C8e7wlMxtUa9yLWtw9w03YY3T9NBuiV+PqEZ3hHYko9ycQz9FY0+a0m6SG5GMAIIvBY
 X4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YLAV4S2K9nuAQ0oLu4D3+8uBxnJ+zXBmJQ4Cts7htIw=;
 b=XtlFZwKGml3kG7wmzfbJNa6nJkPmh9qihL1ZH5KZgWFfABr6kOuBAUm4sYe6EO2iac
 MLxuLmgdkSbxYgp/IGMDucs1H7nF+lJlVd6tTrbfhfvpQAgiiX1mQMJuq3IQp6JxO/yJ
 Ft5JbpR81Gx1KbiIlZcGcfv8r0pJrkuhR4zZ6a0AQgzaR93LXjlYqfbcFbSxEB+D/lPe
 8o3HxFOPvheKaTKrYbiPBurhzStI+5Kxt9okjZPGiwRROHqJLqjAl1E8opcv/9yE7cll
 WVQqyMaI/ssx1XkKhe+d5IBNnWjHyQWrxH60ksWSdQ09rm2aRjDS+ePwCoauWWCFwH8N
 piYQ==
X-Gm-Message-State: APjAAAWJks+9GSIqTY14fr1o1YIdyEpyIAA500SIbcM967KFkvPY3Bp7
 0PXVf5W4FGcqa2Ara15QEfwo6uvV
X-Google-Smtp-Source: APXvYqw1WftiSgTIWwwBGsG7UZL2p+ocVCyeWbReepz1RX6kmWW5aXQHuxJPCZZHM7TU56Z9t9m6pg==
X-Received: by 2002:a81:1488:: with SMTP id 130mr77883503ywu.176.1564595861982; 
 Wed, 31 Jul 2019 10:57:41 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id 206sm16077696ywk.44.2019.07.31.10.57.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:57:41 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 13:56:43 -0400
Message-Id: <20190731175702.4916-4-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175702.4916-1-jan.bobek@gmail.com>
References: <20190731175702.4916-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
Subject: [Qemu-devel] [RFC PATCH v1 03/22] target/i386: Use prefix,
 aflag and dflag from DisasContext
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
 Richard Henderson <richard.henderson@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <rth@twiddle.net>

The variables are already there, we just have to hide the ones
in disas_insn so that we are forced to use them.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target/i386/translate.c | 299 ++++++++++++++++++++--------------------
 1 file changed, 152 insertions(+), 147 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index c0866c2797..692261f73f 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4491,13 +4491,17 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
-    int b, prefixes;
+    int b;
     int shift;
-    TCGMemOp ot, aflag, dflag;
+    TCGMemOp ot;
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
     target_ulong pc_start = s->base.pc_next;
 
+    {
+    int prefixes;
+    TCGMemOp aflag, dflag;
+
     s->pc_start = s->pc = pc_start;
     s->override = -1;
 #ifdef TARGET_X86_64
@@ -4657,6 +4661,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     s->prefix = prefixes;
     s->aflag = aflag;
     s->dflag = dflag;
+    }
 
     /* now check op code */
  reswitch:
@@ -4682,7 +4687,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             op = (b >> 3) & 7;
             f = (b >> 1) & 3;
 
-            ot = mo_b_d(b, dflag);
+            ot = mo_b_d(b, s->dflag);
 
             switch(f) {
             case 0: /* OP Ev, Gv */
@@ -4740,7 +4745,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         {
             int val;
 
-            ot = mo_b_d(b, dflag);
+            ot = mo_b_d(b, s->dflag);
 
             modrm = x86_ldub_code(env, s);
             mod = (modrm >> 6) & 3;
@@ -4777,16 +4782,16 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /**************************/
         /* inc, dec, and other misc arith */
     case 0x40 ... 0x47: /* inc Gv */
-        ot = dflag;
+        ot = s->dflag;
         gen_inc(s, ot, OR_EAX + (b & 7), 1);
         break;
     case 0x48 ... 0x4f: /* dec Gv */
-        ot = dflag;
+        ot = s->dflag;
         gen_inc(s, ot, OR_EAX + (b & 7), -1);
         break;
     case 0xf6: /* GRP3 */
     case 0xf7:
-        ot = mo_b_d(b, dflag);
+        ot = mo_b_d(b, s->dflag);
 
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
@@ -5018,7 +5023,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     case 0xfe: /* GRP4 */
     case 0xff: /* GRP5 */
-        ot = mo_b_d(b, dflag);
+        ot = mo_b_d(b, s->dflag);
 
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
@@ -5032,10 +5037,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 /* operand size for jumps is 64 bit */
                 ot = MO_64;
             } else if (op == 3 || op == 5) {
-                ot = dflag != MO_16 ? MO_32 + (REX_W(s) == 1) : MO_16;
+                ot = s->dflag != MO_16 ? MO_32 + (REX_W(s) == 1) : MO_16;
             } else if (op == 6) {
                 /* default push size is 64 bit */
-                ot = mo_pushpop(s, dflag);
+                ot = mo_pushpop(s, s->dflag);
             }
         }
         if (mod != 3) {
@@ -5063,7 +5068,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
         case 2: /* call Ev */
             /* XXX: optimize if memory (no 'and' is necessary) */
-            if (dflag == MO_16) {
+            if (s->dflag == MO_16) {
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
             next_eip = s->pc - s->cs_base;
@@ -5081,19 +5086,19 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (s->pe && !s->vm86) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lcall_protected(cpu_env, s->tmp2_i32, s->T1,
-                                           tcg_const_i32(dflag - 1),
+                                           tcg_const_i32(s->dflag - 1),
                                            tcg_const_tl(s->pc - s->cs_base));
             } else {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->T1,
-                                      tcg_const_i32(dflag - 1),
+                                      tcg_const_i32(s->dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
             tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
             gen_jr(s, s->tmp4);
             break;
         case 4: /* jmp Ev */
-            if (dflag == MO_16) {
+            if (s->dflag == MO_16) {
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
             gen_op_jmp_v(s->T0);
@@ -5126,7 +5131,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     case 0x84: /* test Ev, Gv */
     case 0x85:
-        ot = mo_b_d(b, dflag);
+        ot = mo_b_d(b, s->dflag);
 
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
@@ -5139,7 +5144,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     case 0xa8: /* test eAX, Iv */
     case 0xa9:
-        ot = mo_b_d(b, dflag);
+        ot = mo_b_d(b, s->dflag);
         val = insn_get(env, s, ot);
 
         gen_op_mov_v_reg(s, ot, s->T0, OR_EAX);
@@ -5149,7 +5154,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
 
     case 0x98: /* CWDE/CBW */
-        switch (dflag) {
+        switch (s->dflag) {
 #ifdef TARGET_X86_64
         case MO_64:
             gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
@@ -5172,7 +5177,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0x99: /* CDQ/CWD */
-        switch (dflag) {
+        switch (s->dflag) {
 #ifdef TARGET_X86_64
         case MO_64:
             gen_op_mov_v_reg(s, MO_64, s->T0, R_EAX);
@@ -5199,7 +5204,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1af: /* imul Gv, Ev */
     case 0x69: /* imul Gv, Ev, I */
     case 0x6b:
-        ot = dflag;
+        ot = s->dflag;
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         if (b == 0x69)
@@ -5251,7 +5256,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x1c0:
     case 0x1c1: /* xadd Ev, Gv */
-        ot = mo_b_d(b, dflag);
+        ot = mo_b_d(b, s->dflag);
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
@@ -5283,7 +5288,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         {
             TCGv oldv, newv, cmpv;
 
-            ot = mo_b_d(b, dflag);
+            ot = mo_b_d(b, s->dflag);
             modrm = x86_ldub_code(env, s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
@@ -5344,7 +5349,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
 #ifdef TARGET_X86_64
-            if (dflag == MO_64) {
+            if (s->dflag == MO_64) {
                 if (!(s->cpuid_ext_features & CPUID_EXT_CX16)) {
                     goto illegal_op;
                 }
@@ -5384,7 +5389,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_helper_rdrand(s->T0, cpu_env);
             rm = (modrm & 7) | REX_B(s);
-            gen_op_mov_reg_v(s, dflag, rm, s->T0);
+            gen_op_mov_reg_v(s, s->dflag, rm, s->T0);
             set_cc_op(s, CC_OP_EFLAGS);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_end();
@@ -5421,7 +5426,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x68: /* push Iv */
     case 0x6a:
-        ot = mo_pushpop(s, dflag);
+        ot = mo_pushpop(s, s->dflag);
         if (b == 0x68)
             val = insn_get(env, s, ot);
         else
@@ -5506,7 +5511,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /* mov */
     case 0x88:
     case 0x89: /* mov Gv, Ev */
-        ot = mo_b_d(b, dflag);
+        ot = mo_b_d(b, s->dflag);
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
 
@@ -5515,7 +5520,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xc6:
     case 0xc7: /* mov Ev, Iv */
-        ot = mo_b_d(b, dflag);
+        ot = mo_b_d(b, s->dflag);
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         if (mod != 3) {
@@ -5532,7 +5537,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x8a:
     case 0x8b: /* mov Ev, Gv */
-        ot = mo_b_d(b, dflag);
+        ot = mo_b_d(b, s->dflag);
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
 
@@ -5564,7 +5569,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (reg >= 6)
             goto illegal_op;
         gen_op_movl_T0_seg(s, reg);
-        ot = mod == 3 ? dflag : MO_16;
+        ot = mod == 3 ? s->dflag : MO_16;
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
         break;
 
@@ -5577,7 +5582,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             TCGMemOp s_ot;
 
             /* d_ot is the size of destination */
-            d_ot = dflag;
+            d_ot = s->dflag;
             /* ot is the size of source */
             ot = (b & 1) + MO_8;
             /* s_ot is the sign+size of source */
@@ -5628,7 +5633,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             AddressParts a = gen_lea_modrm_0(env, s, modrm);
             TCGv ea = gen_lea_modrm_1(s, a);
             gen_lea_v_seg(s, s->aflag, ea, -1, -1);
-            gen_op_mov_reg_v(s, dflag, reg, s->A0);
+            gen_op_mov_reg_v(s, s->dflag, reg, s->A0);
         }
         break;
 
@@ -5639,7 +5644,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         {
             target_ulong offset_addr;
 
-            ot = mo_b_d(b, dflag);
+            ot = mo_b_d(b, s->dflag);
             switch (s->aflag) {
 #ifdef TARGET_X86_64
             case MO_64:
@@ -5677,7 +5682,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xb8 ... 0xbf: /* mov R, Iv */
 #ifdef TARGET_X86_64
-        if (dflag == MO_64) {
+        if (s->dflag == MO_64) {
             uint64_t tmp;
             /* 64 bit case */
             tmp = x86_ldq_code(env, s);
@@ -5687,7 +5692,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         } else
 #endif
         {
-            ot = dflag;
+            ot = s->dflag;
             val = insn_get(env, s, ot);
             reg = (b & 7) | REX_B(s);
             tcg_gen_movi_tl(s->T0, val);
@@ -5697,13 +5702,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     case 0x91 ... 0x97: /* xchg R, EAX */
     do_xchg_reg_eax:
-        ot = dflag;
+        ot = s->dflag;
         reg = (b & 7) | REX_B(s);
         rm = R_EAX;
         goto do_xchg_reg;
     case 0x86:
     case 0x87: /* xchg Ev, Gv */
-        ot = mo_b_d(b, dflag);
+        ot = mo_b_d(b, s->dflag);
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
@@ -5740,7 +5745,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1b5: /* lgs Gv */
         op = R_GS;
     do_lxx:
-        ot = dflag != MO_16 ? MO_32 : MO_16;
+        ot = s->dflag != MO_16 ? MO_32 : MO_16;
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
@@ -5768,7 +5773,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         shift = 2;
     grp2:
         {
-            ot = mo_b_d(b, dflag);
+            ot = mo_b_d(b, s->dflag);
             modrm = x86_ldub_code(env, s);
             mod = (modrm >> 6) & 3;
             op = (modrm >> 3) & 7;
@@ -5821,7 +5826,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         op = 1;
         shift = 0;
     do_shiftd:
-        ot = dflag;
+        ot = s->dflag;
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         rm = (modrm & 7) | REX_B(s);
@@ -5983,7 +5988,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 }
                 break;
             case 0x0c: /* fldenv mem */
-                gen_helper_fldenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                gen_helper_fldenv(cpu_env, s->A0, tcg_const_i32(s->dflag - 1));
                 break;
             case 0x0d: /* fldcw mem */
                 tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
@@ -5991,7 +5996,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_fldcw(cpu_env, s->tmp2_i32);
                 break;
             case 0x0e: /* fnstenv mem */
-                gen_helper_fstenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                gen_helper_fstenv(cpu_env, s->A0, tcg_const_i32(s->dflag - 1));
                 break;
             case 0x0f: /* fnstcw mem */
                 gen_helper_fnstcw(s->tmp2_i32, cpu_env);
@@ -6006,10 +6011,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_fpop(cpu_env);
                 break;
             case 0x2c: /* frstor mem */
-                gen_helper_frstor(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                gen_helper_frstor(cpu_env, s->A0, tcg_const_i32(s->dflag - 1));
                 break;
             case 0x2e: /* fnsave mem */
-                gen_helper_fsave(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                gen_helper_fsave(cpu_env, s->A0, tcg_const_i32(s->dflag - 1));
                 break;
             case 0x2f: /* fnstsw mem */
                 gen_helper_fnstsw(s->tmp2_i32, cpu_env);
@@ -6351,8 +6356,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     case 0xa4: /* movsS */
     case 0xa5:
-        ot = mo_b_d(b, dflag);
-        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
+        ot = mo_b_d(b, s->dflag);
+        if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_movs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
         } else {
             gen_movs(s, ot);
@@ -6361,8 +6366,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     case 0xaa: /* stosS */
     case 0xab:
-        ot = mo_b_d(b, dflag);
-        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
+        ot = mo_b_d(b, s->dflag);
+        if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_stos(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
         } else {
             gen_stos(s, ot);
@@ -6370,8 +6375,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xac: /* lodsS */
     case 0xad:
-        ot = mo_b_d(b, dflag);
-        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
+        ot = mo_b_d(b, s->dflag);
+        if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_lods(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
         } else {
             gen_lods(s, ot);
@@ -6379,10 +6384,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xae: /* scasS */
     case 0xaf:
-        ot = mo_b_d(b, dflag);
-        if (prefixes & PREFIX_REPNZ) {
+        ot = mo_b_d(b, s->dflag);
+        if (s->prefix & PREFIX_REPNZ) {
             gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
-        } else if (prefixes & PREFIX_REPZ) {
+        } else if (s->prefix & PREFIX_REPZ) {
             gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
         } else {
             gen_scas(s, ot);
@@ -6391,10 +6396,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     case 0xa6: /* cmpsS */
     case 0xa7:
-        ot = mo_b_d(b, dflag);
-        if (prefixes & PREFIX_REPNZ) {
+        ot = mo_b_d(b, s->dflag);
+        if (s->prefix & PREFIX_REPNZ) {
             gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
-        } else if (prefixes & PREFIX_REPZ) {
+        } else if (s->prefix & PREFIX_REPZ) {
             gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
         } else {
             gen_cmps(s, ot);
@@ -6402,11 +6407,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x6c: /* insS */
     case 0x6d:
-        ot = mo_b_d32(b, dflag);
+        ot = mo_b_d32(b, s->dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
         gen_check_io(s, ot, pc_start - s->cs_base, 
-                     SVM_IOIO_TYPE_MASK | svm_is_rep(prefixes) | 4);
-        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
+                     SVM_IOIO_TYPE_MASK | svm_is_rep(s->prefix) | 4);
+        if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_ins(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
         } else {
             gen_ins(s, ot);
@@ -6417,11 +6422,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x6e: /* outsS */
     case 0x6f:
-        ot = mo_b_d32(b, dflag);
+        ot = mo_b_d32(b, s->dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
         gen_check_io(s, ot, pc_start - s->cs_base,
-                     svm_is_rep(prefixes) | 4);
-        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
+                     svm_is_rep(s->prefix) | 4);
+        if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_outs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
         } else {
             gen_outs(s, ot);
@@ -6436,11 +6441,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     case 0xe4:
     case 0xe5:
-        ot = mo_b_d32(b, dflag);
+        ot = mo_b_d32(b, s->dflag);
         val = x86_ldub_code(env, s);
         tcg_gen_movi_tl(s->T0, val);
         gen_check_io(s, ot, pc_start - s->cs_base,
-                     SVM_IOIO_TYPE_MASK | svm_is_rep(prefixes));
+                     SVM_IOIO_TYPE_MASK | svm_is_rep(s->prefix));
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -6455,11 +6460,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xe6:
     case 0xe7:
-        ot = mo_b_d32(b, dflag);
+        ot = mo_b_d32(b, s->dflag);
         val = x86_ldub_code(env, s);
         tcg_gen_movi_tl(s->T0, val);
         gen_check_io(s, ot, pc_start - s->cs_base,
-                     svm_is_rep(prefixes));
+                     svm_is_rep(s->prefix));
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
 
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
@@ -6476,10 +6481,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xec:
     case 0xed:
-        ot = mo_b_d32(b, dflag);
+        ot = mo_b_d32(b, s->dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
         gen_check_io(s, ot, pc_start - s->cs_base,
-                     SVM_IOIO_TYPE_MASK | svm_is_rep(prefixes));
+                     SVM_IOIO_TYPE_MASK | svm_is_rep(s->prefix));
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -6494,10 +6499,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xee:
     case 0xef:
-        ot = mo_b_d32(b, dflag);
+        ot = mo_b_d32(b, s->dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
         gen_check_io(s, ot, pc_start - s->cs_base,
-                     svm_is_rep(prefixes));
+                     svm_is_rep(s->prefix));
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
 
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
@@ -6538,21 +6543,21 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (s->pe && !s->vm86) {
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
+            gen_helper_lret_protected(cpu_env, tcg_const_i32(s->dflag - 1),
                                       tcg_const_i32(val));
         } else {
             gen_stack_A0(s);
             /* pop offset */
-            gen_op_ld_v(s, dflag, s->T0, s->A0);
+            gen_op_ld_v(s, s->dflag, s->T0, s->A0);
             /* NOTE: keeping EIP updated is not a problem in case of
                exception */
             gen_op_jmp_v(s->T0);
             /* pop selector */
-            gen_add_A0_im(s, 1 << dflag);
-            gen_op_ld_v(s, dflag, s->T0, s->A0);
+            gen_add_A0_im(s, 1 << s->dflag);
+            gen_op_ld_v(s, s->dflag, s->T0, s->A0);
             gen_op_movl_seg_T0_vm(s, R_CS);
             /* add stack offset */
-            gen_stack_update(s, val + (2 << dflag));
+            gen_stack_update(s, val + (2 << s->dflag));
         }
         gen_eob(s);
         break;
@@ -6563,17 +6568,17 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_IRET);
         if (!s->pe) {
             /* real mode */
-            gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
+            gen_helper_iret_real(cpu_env, tcg_const_i32(s->dflag - 1));
             set_cc_op(s, CC_OP_EFLAGS);
         } else if (s->vm86) {
             if (s->iopl != 3) {
                 gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
             } else {
-                gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
+                gen_helper_iret_real(cpu_env, tcg_const_i32(s->dflag - 1));
                 set_cc_op(s, CC_OP_EFLAGS);
             }
         } else {
-            gen_helper_iret_protected(cpu_env, tcg_const_i32(dflag - 1),
+            gen_helper_iret_protected(cpu_env, tcg_const_i32(s->dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             set_cc_op(s, CC_OP_EFLAGS);
         }
@@ -6581,14 +6586,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xe8: /* call im */
         {
-            if (dflag != MO_16) {
+            if (s->dflag != MO_16) {
                 tval = (int32_t)insn_get(env, s, MO_32);
             } else {
                 tval = (int16_t)insn_get(env, s, MO_16);
             }
             next_eip = s->pc - s->cs_base;
             tval += next_eip;
-            if (dflag == MO_16) {
+            if (s->dflag == MO_16) {
                 tval &= 0xffff;
             } else if (!CODE64(s)) {
                 tval &= 0xffffffff;
@@ -6605,7 +6610,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
             if (CODE64(s))
                 goto illegal_op;
-            ot = dflag;
+            ot = s->dflag;
             offset = insn_get(env, s, ot);
             selector = insn_get(env, s, MO_16);
 
@@ -6614,13 +6619,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         }
         goto do_lcall;
     case 0xe9: /* jmp im */
-        if (dflag != MO_16) {
+        if (s->dflag != MO_16) {
             tval = (int32_t)insn_get(env, s, MO_32);
         } else {
             tval = (int16_t)insn_get(env, s, MO_16);
         }
         tval += s->pc - s->cs_base;
-        if (dflag == MO_16) {
+        if (s->dflag == MO_16) {
             tval &= 0xffff;
         } else if (!CODE64(s)) {
             tval &= 0xffffffff;
@@ -6634,7 +6639,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
             if (CODE64(s))
                 goto illegal_op;
-            ot = dflag;
+            ot = s->dflag;
             offset = insn_get(env, s, ot);
             selector = insn_get(env, s, MO_16);
 
@@ -6645,7 +6650,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xeb: /* jmp Jb */
         tval = (int8_t)insn_get(env, s, MO_8);
         tval += s->pc - s->cs_base;
-        if (dflag == MO_16) {
+        if (s->dflag == MO_16) {
             tval &= 0xffff;
         }
         gen_jmp(s, tval);
@@ -6654,7 +6659,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         tval = (int8_t)insn_get(env, s, MO_8);
         goto do_jcc;
     case 0x180 ... 0x18f: /* jcc Jv */
-        if (dflag != MO_16) {
+        if (s->dflag != MO_16) {
             tval = (int32_t)insn_get(env, s, MO_32);
         } else {
             tval = (int16_t)insn_get(env, s, MO_16);
@@ -6662,7 +6667,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     do_jcc:
         next_eip = s->pc - s->cs_base;
         tval += next_eip;
-        if (dflag == MO_16) {
+        if (s->dflag == MO_16) {
             tval &= 0xffff;
         }
         gen_bnd_jmp(s);
@@ -6678,7 +6683,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (!(s->cpuid_features & CPUID_CMOV)) {
             goto illegal_op;
         }
-        ot = dflag;
+        ot = s->dflag;
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         gen_cmovcc1(env, s, ot, b, modrm, reg);
@@ -6703,7 +6708,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         } else {
             ot = gen_pop_T0(s);
             if (s->cpl == 0) {
-                if (dflag != MO_16) {
+                if (s->dflag != MO_16) {
                     gen_helper_write_eflags(cpu_env, s->T0,
                                             tcg_const_i32((TF_MASK | AC_MASK |
                                                            ID_MASK | NT_MASK |
@@ -6718,7 +6723,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 }
             } else {
                 if (s->cpl <= s->iopl) {
-                    if (dflag != MO_16) {
+                    if (s->dflag != MO_16) {
                         gen_helper_write_eflags(cpu_env, s->T0,
                                                 tcg_const_i32((TF_MASK |
                                                                AC_MASK |
@@ -6735,7 +6740,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                                                               & 0xffff));
                     }
                 } else {
-                    if (dflag != MO_16) {
+                    if (s->dflag != MO_16) {
                         gen_helper_write_eflags(cpu_env, s->T0,
                                            tcg_const_i32((TF_MASK | AC_MASK |
                                                           ID_MASK | NT_MASK)));
@@ -6795,7 +6800,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /************************/
         /* bit operations */
     case 0x1ba: /* bt/bts/btr/btc Gv, im */
-        ot = dflag;
+        ot = s->dflag;
         modrm = x86_ldub_code(env, s);
         op = (modrm >> 3) & 7;
         mod = (modrm >> 6) & 3;
@@ -6828,7 +6833,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1bb: /* btc */
         op = 3;
     do_btx:
-        ot = dflag;
+        ot = s->dflag;
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
@@ -6933,14 +6938,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x1bc: /* bsf / tzcnt */
     case 0x1bd: /* bsr / lzcnt */
-        ot = dflag;
+        ot = s->dflag;
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
         gen_extu(ot, s->T0);
 
         /* Note that lzcnt and tzcnt are in different extensions.  */
-        if ((prefixes & PREFIX_REPZ)
+        if ((s->prefix & PREFIX_REPZ)
             && (b & 1
                 ? s->cpuid_ext3_features & CPUID_EXT3_ABM
                 : s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)) {
@@ -7033,14 +7038,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /* misc */
     case 0x90: /* nop */
         /* XXX: correct lock test for all insn */
-        if (prefixes & PREFIX_LOCK) {
+        if (s->prefix & PREFIX_LOCK) {
             goto illegal_op;
         }
         /* If REX_B is set, then this is xchg eax, r8d, not a nop.  */
         if (REX_B(s)) {
             goto do_xchg_reg_eax;
         }
-        if (prefixes & PREFIX_REPZ) {
+        if (s->prefix & PREFIX_REPZ) {
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
             gen_helper_pause(cpu_env, tcg_const_i32(s->pc - pc_start));
@@ -7107,7 +7112,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x62: /* bound */
         if (CODE64(s))
             goto illegal_op;
-        ot = dflag;
+        ot = s->dflag;
         modrm = x86_ldub_code(env, s);
         reg = (modrm >> 3) & 7;
         mod = (modrm >> 6) & 3;
@@ -7125,7 +7130,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1c8 ... 0x1cf: /* bswap reg */
         reg = (b & 7) | REX_B(s);
 #ifdef TARGET_X86_64
-        if (dflag == MO_64) {
+        if (s->dflag == MO_64) {
             gen_op_mov_v_reg(s, MO_64, s->T0, reg);
             tcg_gen_bswap64_i64(s->T0, s->T0);
             gen_op_mov_reg_v(s, MO_64, reg, s->T0);
@@ -7155,7 +7160,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             tval = (int8_t)insn_get(env, s, MO_8);
             next_eip = s->pc - s->cs_base;
             tval += next_eip;
-            if (dflag == MO_16) {
+            if (s->dflag == MO_16) {
                 tval &= 0xffff;
             }
 
@@ -7239,7 +7244,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (!s->pe) {
             gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
         } else {
-            gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
+            gen_helper_sysexit(cpu_env, tcg_const_i32(s->dflag - 1));
             gen_eob(s);
         }
         break;
@@ -7258,7 +7263,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (!s->pe) {
             gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
         } else {
-            gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
+            gen_helper_sysret(cpu_env, tcg_const_i32(s->dflag - 1));
             /* condition codes are modified only in long mode */
             if (s->lma) {
                 set_cc_op(s, CC_OP_EFLAGS);
@@ -7297,7 +7302,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, ldt.selector));
-            ot = mod == 3 ? dflag : MO_16;
+            ot = mod == 3 ? s->dflag : MO_16;
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 2: /* lldt */
@@ -7318,7 +7323,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, tr.selector));
-            ot = mod == 3 ? dflag : MO_16;
+            ot = mod == 3 ? s->dflag : MO_16;
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 3: /* ltr */
@@ -7362,7 +7367,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_op_st_v(s, MO_16, s->T0, s->A0);
             gen_add_A0_im(s, 2);
             tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, gdt.base));
-            if (dflag == MO_16) {
+            if (s->dflag == MO_16) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
@@ -7417,7 +7422,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_op_st_v(s, MO_16, s->T0, s->A0);
             gen_add_A0_im(s, 2);
             tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.base));
-            if (dflag == MO_16) {
+            if (s->dflag == MO_16) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
@@ -7567,7 +7572,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_op_ld_v(s, MO_16, s->T1, s->A0);
             gen_add_A0_im(s, 2);
             gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
-            if (dflag == MO_16) {
+            if (s->dflag == MO_16) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, gdt.base));
@@ -7584,7 +7589,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_op_ld_v(s, MO_16, s->T1, s->A0);
             gen_add_A0_im(s, 2);
             gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
-            if (dflag == MO_16) {
+            if (s->dflag == MO_16) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.base));
@@ -7603,7 +7608,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 0xee: /* rdpkru */
-            if (prefixes & PREFIX_LOCK) {
+            if (s->prefix & PREFIX_LOCK) {
                 goto illegal_op;
             }
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
@@ -7611,7 +7616,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_extr_i64_tl(cpu_regs[R_EAX], cpu_regs[R_EDX], s->tmp1_i64);
             break;
         case 0xef: /* wrpkru */
-            if (prefixes & PREFIX_LOCK) {
+            if (s->prefix & PREFIX_LOCK) {
                 goto illegal_op;
             }
             tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
@@ -7696,7 +7701,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s)) {
             int d_ot;
             /* d_ot is the size of destination */
-            d_ot = dflag;
+            d_ot = s->dflag;
 
             modrm = x86_ldub_code(env, s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
@@ -7771,7 +7776,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             TCGv t0;
             if (!s->pe || s->vm86)
                 goto illegal_op;
-            ot = dflag != MO_16 ? MO_32 : MO_16;
+            ot = s->dflag != MO_16 ? MO_32 : MO_16;
             modrm = x86_ldub_code(env, s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
@@ -7815,18 +7820,18 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (s->flags & HF_MPX_EN_MASK) {
             mod = (modrm >> 6) & 3;
             reg = ((modrm >> 3) & 7) | REX_R(s);
-            if (prefixes & PREFIX_REPZ) {
+            if (s->prefix & PREFIX_REPZ) {
                 /* bndcl */
                 if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
+                    || (s->prefix & PREFIX_LOCK)
                     || s->aflag == MO_16) {
                     goto illegal_op;
                 }
                 gen_bndck(env, s, modrm, TCG_COND_LTU, cpu_bndl[reg]);
-            } else if (prefixes & PREFIX_REPNZ) {
+            } else if (s->prefix & PREFIX_REPNZ) {
                 /* bndcu */
                 if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
+                    || (s->prefix & PREFIX_LOCK)
                     || s->aflag == MO_16) {
                     goto illegal_op;
                 }
@@ -7834,14 +7839,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_not_i64(notu, cpu_bndu[reg]);
                 gen_bndck(env, s, modrm, TCG_COND_GTU, notu);
                 tcg_temp_free_i64(notu);
-            } else if (prefixes & PREFIX_DATA) {
+            } else if (s->prefix & PREFIX_DATA) {
                 /* bndmov -- from reg/mem */
                 if (reg >= 4 || s->aflag == MO_16) {
                     goto illegal_op;
                 }
                 if (mod == 3) {
                     int reg2 = (modrm & 7) | REX_B(s);
-                    if (reg2 >= 4 || (prefixes & PREFIX_LOCK)) {
+                    if (reg2 >= 4 || (s->prefix & PREFIX_LOCK)) {
                         goto illegal_op;
                     }
                     if (s->flags & HF_MPX_IU_MASK) {
@@ -7870,7 +7875,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 /* bndldx */
                 AddressParts a = gen_lea_modrm_0(env, s, modrm);
                 if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
+                    || (s->prefix & PREFIX_LOCK)
                     || s->aflag == MO_16
                     || a.base < -1) {
                     goto illegal_op;
@@ -7905,10 +7910,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (s->flags & HF_MPX_EN_MASK) {
             mod = (modrm >> 6) & 3;
             reg = ((modrm >> 3) & 7) | REX_R(s);
-            if (mod != 3 && (prefixes & PREFIX_REPZ)) {
+            if (mod != 3 && (s->prefix & PREFIX_REPZ)) {
                 /* bndmk */
                 if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
+                    || (s->prefix & PREFIX_LOCK)
                     || s->aflag == MO_16) {
                     goto illegal_op;
                 }
@@ -7933,22 +7938,22 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 /* bnd registers are now in-use */
                 gen_set_hflag(s, HF_MPX_IU_MASK);
                 break;
-            } else if (prefixes & PREFIX_REPNZ) {
+            } else if (s->prefix & PREFIX_REPNZ) {
                 /* bndcn */
                 if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
+                    || (s->prefix & PREFIX_LOCK)
                     || s->aflag == MO_16) {
                     goto illegal_op;
                 }
                 gen_bndck(env, s, modrm, TCG_COND_GTU, cpu_bndu[reg]);
-            } else if (prefixes & PREFIX_DATA) {
+            } else if (s->prefix & PREFIX_DATA) {
                 /* bndmov -- to reg/mem */
                 if (reg >= 4 || s->aflag == MO_16) {
                     goto illegal_op;
                 }
                 if (mod == 3) {
                     int reg2 = (modrm & 7) | REX_B(s);
-                    if (reg2 >= 4 || (prefixes & PREFIX_LOCK)) {
+                    if (reg2 >= 4 || (s->prefix & PREFIX_LOCK)) {
                         goto illegal_op;
                     }
                     if (s->flags & HF_MPX_IU_MASK) {
@@ -7975,7 +7980,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 /* bndstx */
                 AddressParts a = gen_lea_modrm_0(env, s, modrm);
                 if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
+                    || (s->prefix & PREFIX_LOCK)
                     || s->aflag == MO_16
                     || a.base < -1) {
                     goto illegal_op;
@@ -8023,7 +8028,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 ot = MO_64;
             else
                 ot = MO_32;
-            if ((prefixes & PREFIX_LOCK) && (reg == 0) &&
+            if ((s->prefix & PREFIX_LOCK) && (reg == 0) &&
                 (s->cpuid_ext3_features & CPUID_EXT3_CR8LEG)) {
                 reg = 8;
             }
@@ -8113,7 +8118,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1c3: /* MOVNTI reg, mem */
         if (!(s->cpuid_features & CPUID_SSE2))
             goto illegal_op;
-        ot = mo_64_32(dflag);
+        ot = mo_64_32(s->dflag);
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         if (mod == 3)
@@ -8127,7 +8132,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         switch (modrm) {
         CASE_MODRM_MEM_OP(0): /* fxsave */
             if (!(s->cpuid_features & CPUID_FXSR)
-                || (prefixes & PREFIX_LOCK)) {
+                || (s->prefix & PREFIX_LOCK)) {
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
@@ -8140,7 +8145,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         CASE_MODRM_MEM_OP(1): /* fxrstor */
             if (!(s->cpuid_features & CPUID_FXSR)
-                || (prefixes & PREFIX_LOCK)) {
+                || (s->prefix & PREFIX_LOCK)) {
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
@@ -8179,8 +8184,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         CASE_MODRM_MEM_OP(4): /* xsave */
             if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
-                || (prefixes & (PREFIX_LOCK | PREFIX_DATA
-                                | PREFIX_REPZ | PREFIX_REPNZ))) {
+                || (s->prefix & (PREFIX_LOCK | PREFIX_DATA
+                                   | PREFIX_REPZ | PREFIX_REPNZ))) {
                 goto illegal_op;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8191,8 +8196,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         CASE_MODRM_MEM_OP(5): /* xrstor */
             if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
-                || (prefixes & (PREFIX_LOCK | PREFIX_DATA
-                                | PREFIX_REPZ | PREFIX_REPNZ))) {
+                || (s->prefix & (PREFIX_LOCK | PREFIX_DATA
+                                   | PREFIX_REPZ | PREFIX_REPNZ))) {
                 goto illegal_op;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8207,10 +8212,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(6): /* xsaveopt / clwb */
-            if (prefixes & PREFIX_LOCK) {
+            if (s->prefix & PREFIX_LOCK) {
                 goto illegal_op;
             }
-            if (prefixes & PREFIX_DATA) {
+            if (s->prefix & PREFIX_DATA) {
                 /* clwb */
                 if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_CLWB)) {
                     goto illegal_op;
@@ -8220,7 +8225,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 /* xsaveopt */
                 if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
                     || (s->cpuid_xsave_features & CPUID_XSAVE_XSAVEOPT) == 0
-                    || (prefixes & (PREFIX_REPZ | PREFIX_REPNZ))) {
+                    || (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))) {
                     goto illegal_op;
                 }
                 gen_lea_modrm(env, s, modrm);
@@ -8231,10 +8236,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(7): /* clflush / clflushopt */
-            if (prefixes & PREFIX_LOCK) {
+            if (s->prefix & PREFIX_LOCK) {
                 goto illegal_op;
             }
-            if (prefixes & PREFIX_DATA) {
+            if (s->prefix & PREFIX_DATA) {
                 /* clflushopt */
                 if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_CLFLUSHOPT)) {
                     goto illegal_op;
@@ -8254,8 +8259,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 0xd0 ... 0xd7: /* wrfsbase (f3 0f ae /2) */
         case 0xd8 ... 0xdf: /* wrgsbase (f3 0f ae /3) */
             if (CODE64(s)
-                && (prefixes & PREFIX_REPZ)
-                && !(prefixes & PREFIX_LOCK)
+                && (s->prefix & PREFIX_REPZ)
+                && !(s->prefix & PREFIX_LOCK)
                 && (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_FSGSBASE)) {
                 TCGv base, treg, src, dst;
 
@@ -8284,10 +8289,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             goto unknown_op;
 
         case 0xf8: /* sfence / pcommit */
-            if (prefixes & PREFIX_DATA) {
+            if (s->prefix & PREFIX_DATA) {
                 /* pcommit */
                 if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_PCOMMIT)
-                    || (prefixes & PREFIX_LOCK)) {
+                    || (s->prefix & PREFIX_LOCK)) {
                     goto illegal_op;
                 }
                 break;
@@ -8295,21 +8300,21 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             /* fallthru */
         case 0xf9 ... 0xff: /* sfence */
             if (!(s->cpuid_features & CPUID_SSE)
-                || (prefixes & PREFIX_LOCK)) {
+                || (s->prefix & PREFIX_LOCK)) {
                 goto illegal_op;
             }
             tcg_gen_mb(TCG_MO_ST_ST | TCG_BAR_SC);
             break;
         case 0xe8 ... 0xef: /* lfence */
             if (!(s->cpuid_features & CPUID_SSE)
-                || (prefixes & PREFIX_LOCK)) {
+                || (s->prefix & PREFIX_LOCK)) {
                 goto illegal_op;
             }
             tcg_gen_mb(TCG_MO_LD_LD | TCG_BAR_SC);
             break;
         case 0xf0 ... 0xf7: /* mfence */
             if (!(s->cpuid_features & CPUID_SSE2)
-                || (prefixes & PREFIX_LOCK)) {
+                || (s->prefix & PREFIX_LOCK)) {
                 goto illegal_op;
             }
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
@@ -8337,8 +8342,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_eob(s);
         break;
     case 0x1b8: /* SSE4.2 popcnt */
-        if ((prefixes & (PREFIX_REPZ | PREFIX_LOCK | PREFIX_REPNZ)) !=
-             PREFIX_REPZ)
+        if ((s->prefix & (PREFIX_REPZ | PREFIX_LOCK | PREFIX_REPNZ)) !=
+            PREFIX_REPZ)
             goto illegal_op;
         if (!(s->cpuid_ext_features & CPUID_EXT_POPCNT))
             goto illegal_op;
@@ -8349,7 +8354,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (s->prefix & PREFIX_DATA) {
             ot = MO_16;
         } else {
-            ot = mo_64_32(dflag);
+            ot = mo_64_32(s->dflag);
         }
 
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-- 
2.20.1


