Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0021C5FB0D3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:55:36 +0200 (CEST)
Received: from localhost ([::1]:51472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCv8-0007Z1-TF
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTy-0001pU-Ly
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTw-0004NZ-8P
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVip0KBxPg4z4BeuYr2Zar9WmRywPpxynwTVJk5vNl0=;
 b=b0XPWw2hbv5iWrGHeD4P06iQAo3GHxVBn+0goSHyEUNgTG74HLoyhEwx7kYVp3nhJfNr6i
 p2evRzt8m7RN5jEPoos2HdHQ6JLSqQQd4ik3RsoOz/HOrHoU/U4pG6KBKrvfCEypzM+nQV
 6e3XAxHF+cuZz5yOZJtdA6a0YRPWMoE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-413-sHfGqZLpM62dl3PLq8Urgg-1; Tue, 11 Oct 2022 06:27:23 -0400
X-MC-Unique: sHfGqZLpM62dl3PLq8Urgg-1
Received: by mail-ej1-f69.google.com with SMTP id
 sh33-20020a1709076ea100b0078d28567b70so5701534ejc.16
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVip0KBxPg4z4BeuYr2Zar9WmRywPpxynwTVJk5vNl0=;
 b=Cyj2Oroifubp5mgyT68MoUBqXnyhPBWtrJzdC5j3apR9lkSr0K0vRg1ubNkjj2/ddU
 ikBLZbibIaSJA+DLtzW5dtcSpXwA4Pag/QUUEUUPgLDcLN9wqJVWUwsS0Of3bUiIA1VQ
 ddRsbK/yBdN/kbKm466EgquV/a7FubM0udhYAB7gZVP+l99BPJIKJE+dcYfkMXJ1yD9k
 vpzABRb5TqHvzC1IxbNqLltLGqBHS5WuyMQaI8T1QeU3TuQuxjLg4DQtZmDybvRCuwKS
 i0W69fViq1/vHCGzTMug1vzS/DsrU+m3A6e2iC5UMzuJ5SZNiftDPZGgXtj4yFvzQXCO
 sgQw==
X-Gm-Message-State: ACrzQf1hFKYQP2AG5XbpCTCcEhOhdAeHDYQ9l8C3QwwzRbeL2HwXrc4E
 L6b3FDnd2P4FpdCE7YvWSlhBAxYX6JcNPddmGqukfC6uDgd4ON6LxRIlNfyvD1/mEwdjPEeBPTe
 W588uZ+it9Wdz0WNXRmTCF0kQPyoaCyLONIV4wqNTV++sGBqDoqFiSCyYdHL5So4oFFI=
X-Received: by 2002:a05:6402:51c6:b0:45b:d0d7:4b41 with SMTP id
 r6-20020a05640251c600b0045bd0d74b41mr14994497edd.219.1665484042110; 
 Tue, 11 Oct 2022 03:27:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6CS4ztNgATfdLHsspX8KDhnlEg0mIKw4deZ1Xn8uYUvK4C6davP1NDflR4c3We8KCwasJmUw==
X-Received: by 2002:a05:6402:51c6:b0:45b:d0d7:4b41 with SMTP id
 r6-20020a05640251c600b0045bd0d74b41mr14994477edd.219.1665484041698; 
 Tue, 11 Oct 2022 03:27:21 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05640210da00b004587c2b5048sm6566279edu.52.2022.10.11.03.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 06/37] target/i386: Remove pc_start
Date: Tue, 11 Oct 2022 12:26:29 +0200
Message-Id: <20221011102700.319178-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The DisasContext member and the disas_insn local variable of
the same name are identical to DisasContextBase.pc_next.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-2-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 114 +++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 54 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 44af8c107f..16bf56dbc7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -76,7 +76,6 @@ typedef struct DisasContext {
     DisasContextBase base;
 
     target_ulong pc;       /* pc = eip + cs_base */
-    target_ulong pc_start; /* pc at TB entry */
     target_ulong cs_base;  /* base of CS segment */
 
     MemOp aflag;
@@ -1345,13 +1344,13 @@ static void gen_exception(DisasContext *s, int trapno, target_ulong cur_eip)
    the instruction is known, but it isn't allowed in the current cpu mode.  */
 static void gen_illegal_opcode(DisasContext *s)
 {
-    gen_exception(s, EXCP06_ILLOP, s->pc_start - s->cs_base);
+    gen_exception(s, EXCP06_ILLOP, s->base.pc_next - s->cs_base);
 }
 
 /* Generate #GP for the current instruction. */
 static void gen_exception_gpf(DisasContext *s)
 {
-    gen_exception(s, EXCP0D_GPF, s->pc_start - s->cs_base);
+    gen_exception(s, EXCP0D_GPF, s->base.pc_next - s->cs_base);
 }
 
 /* Check for cpl == 0; if not, raise #GP and return false. */
@@ -2016,7 +2015,7 @@ static uint64_t advance_pc(CPUX86State *env, DisasContext *s, int num_bytes)
     }
 
     s->pc += num_bytes;
-    if (unlikely(s->pc - s->pc_start > X86_MAX_INSN_LENGTH)) {
+    if (unlikely(s->pc - s->base.pc_next > X86_MAX_INSN_LENGTH)) {
         /* If the instruction's 16th byte is on a different page than the 1st, a
          * page fault on the second page wins over the general protection fault
          * caused by the instruction being too long.
@@ -2614,7 +2613,7 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
     if (qemu_loglevel_mask(LOG_UNIMP)) {
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
-            target_ulong pc = s->pc_start, end = s->pc;
+            target_ulong pc = s->base.pc_next, end = s->pc;
 
             fprintf(logfile, "ILLOPC: " TARGET_FMT_lx ":", pc);
             for (; pc < end; ++pc) {
@@ -3226,8 +3225,7 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
         goto illegal_op; \
     } while (0)
 
-static void gen_sse(CPUX86State *env, DisasContext *s, int b,
-                    target_ulong pc_start)
+static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 {
     int b1, op1_offset, op2_offset, is_xmm, val;
     int modrm, mod, rm, reg;
@@ -3269,7 +3267,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
-        gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+        gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
         return;
     }
     if (s->flags & HF_EM_MASK) {
@@ -4717,11 +4715,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     MemOp ot, aflag, dflag;
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
-    target_ulong pc_start = s->base.pc_next;
     bool orig_cc_op_dirty = s->cc_op_dirty;
     CCOp orig_cc_op = s->cc_op;
 
-    s->pc_start = s->pc = pc_start;
+    s->pc = s->base.pc_next;
     s->override = -1;
 #ifdef TARGET_X86_64
     s->rex_w = false;
@@ -4745,7 +4742,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         s->base.num_insns--;
         tcg_remove_ops_after(s->prev_insn_end);
         s->base.is_jmp = DISAS_TOO_MANY;
-        return pc_start;
+        return s->base.pc_next;
     default:
         g_assert_not_reached();
     }
@@ -6079,7 +6076,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
                 /* if CR0.EM or CR0.TS are set, generate an FPU exception */
                 /* XXX: what to do if illegal op ? */
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
                 break;
             }
             modrm = x86_ldub_code(env, s);
@@ -6620,7 +6617,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                                offsetof(CPUX86State, segs[R_CS].selector));
                 tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
                                  offsetof(CPUX86State, fpcs));
-                tcg_gen_st_tl(tcg_constant_tl(pc_start - s->cs_base),
+                tcg_gen_st_tl(tcg_constant_tl(s->base.pc_next - s->cs_base),
                               cpu_env, offsetof(CPUX86State, fpip));
             }
         }
@@ -6632,7 +6629,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa5:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_movs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_movs(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base);
         } else {
             gen_movs(s, ot);
         }
@@ -6642,7 +6640,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xab:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_stos(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_stos(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base);
         } else {
             gen_stos(s, ot);
         }
@@ -6651,7 +6650,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xad:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_lods(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_lods(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base);
         } else {
             gen_lods(s, ot);
         }
@@ -6660,9 +6660,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xaf:
         ot = mo_b_d(b, dflag);
         if (prefixes & PREFIX_REPNZ) {
-            gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
+            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base, 1);
         } else if (prefixes & PREFIX_REPZ) {
-            gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
+            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base, 0);
         } else {
             gen_scas(s, ot);
         }
@@ -6672,9 +6674,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa7:
         ot = mo_b_d(b, dflag);
         if (prefixes & PREFIX_REPNZ) {
-            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
+            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base, 1);
         } else if (prefixes & PREFIX_REPZ) {
-            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
+            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base, 0);
         } else {
             gen_cmps(s, ot);
         }
@@ -6692,7 +6696,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_io_start();
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_ins(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_ins(s, ot, s->base.pc_next - s->cs_base,
+                         s->pc - s->cs_base);
             /* jump generated by gen_repz_ins */
         } else {
             gen_ins(s, ot);
@@ -6713,7 +6718,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_io_start();
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_outs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_outs(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base);
             /* jump generated by gen_repz_outs */
         } else {
             gen_outs(s, ot);
@@ -6825,7 +6831,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     do_lret:
         if (PE(s) && !VM86(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
                                       tcg_const_i32(val));
         } else {
@@ -7295,7 +7301,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         val = x86_ldub_code(env, s);
         if (val == 0) {
-            gen_exception(s, EXCP00_DIVZ, pc_start - s->cs_base);
+            gen_exception(s, EXCP00_DIVZ, s->base.pc_next - s->cs_base);
         } else {
             gen_helper_aam(cpu_env, tcg_const_i32(val));
             set_cc_op(s, CC_OP_LOGICB);
@@ -7321,34 +7327,34 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (prefixes & PREFIX_REPZ) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - pc_start));
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
     case 0x9b: /* fwait */
         if ((s->flags & (HF_MP_MASK | HF_TS_MASK)) ==
             (HF_MP_MASK | HF_TS_MASK)) {
-            gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+            gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
         } else {
             gen_helper_fwait(cpu_env);
         }
         break;
     case 0xcc: /* int3 */
-        gen_interrupt(s, EXCP03_INT3, pc_start - s->cs_base, s->pc - s->cs_base);
+        gen_interrupt(s, EXCP03_INT3, s->base.pc_next - s->cs_base, s->pc - s->cs_base);
         break;
     case 0xcd: /* int N */
         val = x86_ldub_code(env, s);
         if (check_vm86_iopl(s)) {
-            gen_interrupt(s, val, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_interrupt(s, val, s->base.pc_next - s->cs_base, s->pc - s->cs_base);
         }
         break;
     case 0xce: /* into */
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
-        gen_helper_into(cpu_env, tcg_const_i32(s->pc - pc_start));
+        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         break;
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
@@ -7454,7 +7460,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x132: /* rdmsr */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             if (b & 2) {
                 gen_helper_rdmsr(cpu_env);
             } else {
@@ -7466,7 +7472,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x131: /* rdtsc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_jmp_im(s, s->base.pc_next - s->cs_base);
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -7477,7 +7483,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x133: /* rdpmc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_jmp_im(s, s->base.pc_next - s->cs_base);
         gen_helper_rdpmc(cpu_env);
         s->base.is_jmp = DISAS_NORETURN;
         break;
@@ -7507,8 +7513,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x105: /* syscall */
         /* XXX: is it usable in real mode ? */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
-        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - pc_start));
+        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
            generated after one has entered CPL0 if TF is set in FMASK.  */
@@ -7533,14 +7539,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
     case 0x1a2: /* cpuid */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_jmp_im(s, s->base.pc_next - s->cs_base);
         gen_helper_cpuid(cpu_env);
         break;
     case 0xf4: /* hlt */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - pc_start));
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7636,7 +7642,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
             gen_extu(s->aflag, s->A0);
             gen_add_A0_ds_seg(s);
@@ -7648,8 +7654,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - pc_start));
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
             break;
 
@@ -7726,9 +7732,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
-                             tcg_const_i32(s->pc - pc_start));
+                             tcg_const_i32(s->pc - s->base.pc_next));
             tcg_gen_exit_tb(NULL, 0);
             s->base.is_jmp = DISAS_NORETURN;
             break;
@@ -7738,7 +7744,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_vmmcall(cpu_env);
             break;
 
@@ -7750,7 +7756,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7762,7 +7768,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7788,7 +7794,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_clgi(cpu_env);
             break;
 
@@ -7934,7 +7940,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
             }
@@ -8386,7 +8392,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8399,7 +8405,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8411,7 +8417,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8424,7 +8430,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
                 break;
             }
             gen_helper_update_mxcsr(cpu_env);
@@ -8633,7 +8639,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1c2:
     case 0x1c4 ... 0x1c6:
     case 0x1d0 ... 0x1fe:
-        gen_sse(env, s, b, pc_start);
+        gen_sse(env, s, b);
         break;
     default:
         goto unknown_op;
-- 
2.37.3


