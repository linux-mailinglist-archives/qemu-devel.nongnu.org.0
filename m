Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E365FB0D4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:56:39 +0200 (CEST)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCwA-0000It-LC
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCU6-0001so-Lr
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCU4-0004S2-Jc
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kfJZrHKhK90+vm7Oq61/X5IHIyexTd1oiv6ouy8QF0Q=;
 b=b4rhoPgeSczpQ7LHKYndtLjaywZJFuypDxFvh4ZijVT7f1i3bDr4+d/4TNlnheypV+HWZt
 HGfnxxcaZ6lEIp4KtCqzTO1M6gFSaDekDq+Zwp6JJkTDnUkRohUM3pgNDrL2uYnQbhO5LN
 1HwvbILThp6CyTjIJyrD4I+ia3a0xjU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-58-gzrGlQ0OOPihRKm8Ydqc1w-1; Tue, 11 Oct 2022 06:27:34 -0400
X-MC-Unique: gzrGlQ0OOPihRKm8Ydqc1w-1
Received: by mail-ej1-f70.google.com with SMTP id
 gn33-20020a1709070d2100b00787e6fbcb72so5673721ejc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfJZrHKhK90+vm7Oq61/X5IHIyexTd1oiv6ouy8QF0Q=;
 b=h7fTYZdVS7OVRr2Ckq1IhKEOnfICa0AyzNO2qODJtQKrs8U0VIqur+4mYye1hHlIuh
 lTiZzN4MFYHLp8Is/u0nYInuAYTxnN955wFvs5FNj8KNO52UtxgS7n0HD65I2FR+a/2v
 xNd8hKgzueFXdibGwXlDV0kDVcmTyjQ0mGV/NJqlFqXGrQfHbrsj1nDGoBW1tFraReTl
 uelbrQStRL/EwQoY2i8vOts4vGFFfW0y4lsBMTLCWQtuFtXQ6BmkpL98Ux8cMA0IQ3Ok
 TYt1fa/CQvKbC2CWXi0OSu6i+ip1PRqhN289QvDAuU9Fm/X9r9MT5ThRNTxBp9bSSXbP
 qlOA==
X-Gm-Message-State: ACrzQf3MLLm3ABRGhRnVvfosg08KO990aAeZB7z3c3FPqZzF8gpHYmxO
 yMRzia1pYqNv2HdhThA20EuWJfTYSLVCaNbXkC0pteWQQ9Z+Z5trxFy8vhts/OHrT4FCfFq7X9O
 JiI/yiyduiMZLqQ9sUkRBKMKGiRN3aU96Hjn9BDp0TcyCeqYTTudV/nITqP5mZiYVweQ=
X-Received: by 2002:a17:906:8446:b0:78d:9f1a:9afc with SMTP id
 e6-20020a170906844600b0078d9f1a9afcmr11139916ejy.637.1665484053141; 
 Tue, 11 Oct 2022 03:27:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7DnW5tVICZuwZBopjKhQVSiTPSn+sQyJqVi6eZUQAMSzw+A5WHHLZWKq4dRADVs4mZoC1Y+A==
X-Received: by 2002:a17:906:8446:b0:78d:9f1a:9afc with SMTP id
 e6-20020a170906844600b0078d9f1a9afcmr11139896ejy.637.1665484052823; 
 Tue, 11 Oct 2022 03:27:32 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 d41-20020a056402402900b0045bef7cf489sm5112999eda.89.2022.10.11.03.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/37] target/i386: Create gen_update_eip_cur
Date: Tue, 11 Oct 2022 12:26:33 +0200
Message-Id: <20221011102700.319178-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Like gen_update_cc_op, sync EIP before doing something
that could raise an exception.  Replace all gen_jmp_im
that use s->base.pc_next.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-6-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 52 ++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5a9c3b1e71..85253e1e17 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -511,10 +511,14 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
     }
 }
 
-static inline void gen_jmp_im(DisasContext *s, target_ulong pc)
+static void gen_jmp_im(DisasContext *s, target_ulong pc)
 {
-    tcg_gen_movi_tl(s->tmp0, pc);
-    gen_op_jmp_v(s->tmp0);
+    gen_op_jmp_v(tcg_constant_tl(pc));
+}
+
+static void gen_update_eip_cur(DisasContext *s)
+{
+    gen_jmp_im(s, s->base.pc_next - s->cs_base);
 }
 
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
@@ -703,7 +707,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
         target_ulong next_eip = s->pc - s->cs_base;
 
         gen_update_cc_op(s);
-        gen_jmp_im(s, cur_eip);
+        gen_update_eip_cur(s);
         if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
             svm_flags |= SVM_IOIO_REP_MASK;
         }
@@ -1335,7 +1339,7 @@ static void gen_helper_fp_arith_STN_ST0(int op, int opreg)
 static void gen_exception(DisasContext *s, int trapno)
 {
     gen_update_cc_op(s);
-    gen_jmp_im(s, s->base.pc_next - s->cs_base);
+    gen_update_eip_cur(s);
     gen_helper_raise_exception(cpu_env, tcg_const_i32(trapno));
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2630,7 +2634,7 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
 static void gen_interrupt(DisasContext *s, int intno)
 {
     gen_update_cc_op(s);
-    gen_jmp_im(s, s->base.pc_next - s->cs_base);
+    gen_update_eip_cur(s);
     gen_helper_raise_interrupt(cpu_env, tcg_constant_i32(intno),
                                tcg_constant_i32(s->pc - s->base.pc_next));
     s->base.is_jmp = DISAS_NORETURN;
@@ -6831,7 +6835,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     do_lret:
         if (PE(s) && !VM86(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
                                       tcg_const_i32(val));
         } else {
@@ -7327,7 +7331,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (prefixes & PREFIX_REPZ) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
         }
@@ -7353,7 +7357,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         break;
 #ifdef WANT_ICEBP
@@ -7460,7 +7464,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x132: /* rdmsr */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             if (b & 2) {
                 gen_helper_rdmsr(cpu_env);
             } else {
@@ -7472,7 +7476,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x131: /* rdtsc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -7483,7 +7487,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x133: /* rdpmc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_rdpmc(cpu_env);
         s->base.is_jmp = DISAS_NORETURN;
         break;
@@ -7513,7 +7517,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x105: /* syscall */
         /* XXX: is it usable in real mode ? */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
@@ -7539,13 +7543,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #endif
     case 0x1a2: /* cpuid */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_cpuid(cpu_env);
         break;
     case 0xf4: /* hlt */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
         }
@@ -7642,7 +7646,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
             gen_extu(s->aflag, s->A0);
             gen_add_A0_ds_seg(s);
@@ -7654,7 +7658,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
             break;
@@ -7732,7 +7736,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
                              tcg_const_i32(s->pc - s->base.pc_next));
             tcg_gen_exit_tb(NULL, 0);
@@ -7744,7 +7748,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmmcall(cpu_env);
             break;
 
@@ -7756,7 +7760,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7768,7 +7772,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7794,7 +7798,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_clgi(cpu_env);
             break;
 
@@ -7940,7 +7944,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
             }
@@ -8853,7 +8857,7 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     if (dc->base.is_jmp == DISAS_TOO_MANY) {
-        gen_jmp_im(dc, dc->base.pc_next - dc->cs_base);
+        gen_update_eip_cur(dc);
         gen_eob(dc);
     }
 }
-- 
2.37.3


