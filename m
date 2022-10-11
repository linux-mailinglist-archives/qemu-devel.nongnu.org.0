Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1785FB166
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:26:31 +0200 (CEST)
Received: from localhost ([::1]:60564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDP3-0005v6-R7
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCV2-00034q-GC
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCV0-0004jI-Dl
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NTxqgtmvM6vM7LoW1rTnMsxQj7jZW6AAYTeeVOeHAoQ=;
 b=KVcIql57foioWKOfXJg6tUDIWiarkZmTcuT5x+QbKaVyXjpzmhU4NDKs4celb+GdA9YlS9
 jSbhAM3+IRo5pl7eI2ID5MzypQWSFxRYPaomZHCefS3nPNvLr+7G/J9/QdR9WQ3ksbxrte
 +JRLq/MUijKWDNd0p8CeYF5z42RTU74=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-TtvrMpv3MpyNI8Cq-cxbeg-1; Tue, 11 Oct 2022 06:28:32 -0400
X-MC-Unique: TtvrMpv3MpyNI8Cq-cxbeg-1
Received: by mail-ej1-f71.google.com with SMTP id
 sc11-20020a1709078a0b00b0078d95df8a2eso2345689ejc.2
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NTxqgtmvM6vM7LoW1rTnMsxQj7jZW6AAYTeeVOeHAoQ=;
 b=4F3SDa3jDijupVK6sArjL7Krim5ZN9CFzcl5h1ajQfzdjdgH/E+6qM6BSZ++fcEHT5
 vFc53/bM+JJgflwOwJA8mxyEPJ3vh1dGGu9Js5udzJMVlc2R+eCCaKxiydHqZSyGunYV
 K9P39HT0mgHKzBTgFPsTilA7ygXyoXqDSmue77cFiI1IJ4jDMoBUk22+qegNg/fEvpKr
 sTWCB8GV9m8rtpsCpUk4m7tHS4Jsj/JrbYTBdbL0yfonJyQf40iJQObyd6lW1Rob3pES
 xPW9f9BGT4JeH6Nc05NVzI1y9hH+49xd3sjWuV9oQzGRajqpRzxIJzeWJGtMKVHJdoSi
 hVRQ==
X-Gm-Message-State: ACrzQf1xBgk/TJ5LPUs256qFIwmlfLq7n+dVObzc4ZbQawsqftVEkj0p
 Nx1fCY713k1+xBf89SLlRC9BapUb9nTikuxGlgBseRwTr9PN8MT8xX7UVoWnfd1n4x7QpMhC3Ye
 vmAwBcs3u8rfkxtLp/KM1wWkjBoR+kUl2PsrSfGFg1yf6ifmkcrkoGisX8S0033qHZ1k=
X-Received: by 2002:a17:907:6d8f:b0:78d:9b5e:1a0f with SMTP id
 sb15-20020a1709076d8f00b0078d9b5e1a0fmr12804330ejc.23.1665484110887; 
 Tue, 11 Oct 2022 03:28:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4K1Z+XmHhUryG/sjGgHZv3yp9ooRmMd/lRn0FH3eljSn1mNrP8FIgHK9xVEO4Iil0i2uukUw==
X-Received: by 2002:a17:907:6d8f:b0:78d:9b5e:1a0f with SMTP id
 sb15-20020a1709076d8f00b0078d9b5e1a0fmr12804306ejc.23.1665484110457; 
 Tue, 11 Oct 2022 03:28:30 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 z11-20020aa7d40b000000b00458d50b4a24sm8689358edq.96.2022.10.11.03.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 31/37] target/i386: Enable TARGET_TB_PCREL
Date: Tue, 11 Oct 2022 12:26:54 +0200
Message-Id: <20221011102700.319178-32-pbonzini@redhat.com>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221001140935.465607-27-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu-param.h     |   4 ++
 target/i386/tcg/tcg-cpu.c   |   8 ++-
 target/i386/tcg/translate.c | 130 ++++++++++++++++++++++++++++--------
 3 files changed, 113 insertions(+), 29 deletions(-)

diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index 9740bd7abd..1e79389761 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -25,4 +25,8 @@
 #define TARGET_PAGE_BITS 12
 #define NB_MMU_MODES 3
 
+#ifndef CONFIG_USER_ONLY
+# define TARGET_TB_PCREL 1
+#endif
+
 #endif
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6cf14c83ff..828244abe2 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -49,9 +49,11 @@ static void x86_cpu_exec_exit(CPUState *cs)
 static void x86_cpu_synchronize_from_tb(CPUState *cs,
                                         const TranslationBlock *tb)
 {
-    X86CPU *cpu = X86_CPU(cs);
-
-    cpu->env.eip = tb_pc(tb) - tb->cs_base;
+    /* The instruction pointer is always up to date with TARGET_TB_PCREL. */
+    if (!TARGET_TB_PCREL) {
+        CPUX86State *env = cs->env_ptr;
+        env->eip = tb_pc(tb) - tb->cs_base;
+    }
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 689a45256c..279a3ae999 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -78,6 +78,7 @@ typedef struct DisasContext {
 
     target_ulong pc;       /* pc = eip + cs_base */
     target_ulong cs_base;  /* base of CS segment */
+    target_ulong pc_save;
 
     MemOp aflag;
     MemOp dflag;
@@ -480,9 +481,10 @@ static void gen_add_A0_im(DisasContext *s, int val)
     }
 }
 
-static inline void gen_op_jmp_v(TCGv dest)
+static inline void gen_op_jmp_v(DisasContext *s, TCGv dest)
 {
     tcg_gen_mov_tl(cpu_eip, dest);
+    s->pc_save = -1;
 }
 
 static inline
@@ -519,12 +521,24 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
 
 static void gen_update_eip_cur(DisasContext *s)
 {
-    tcg_gen_movi_tl(cpu_eip, s->base.pc_next - s->cs_base);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_tl(cpu_eip, cpu_eip, s->base.pc_next - s->pc_save);
+    } else {
+        tcg_gen_movi_tl(cpu_eip, s->base.pc_next - s->cs_base);
+    }
+    s->pc_save = s->base.pc_next;
 }
 
 static void gen_update_eip_next(DisasContext *s)
 {
-    tcg_gen_movi_tl(cpu_eip, s->pc - s->cs_base);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_tl(cpu_eip, cpu_eip, s->pc - s->pc_save);
+    } else {
+        tcg_gen_movi_tl(cpu_eip, s->pc - s->cs_base);
+    }
+    s->pc_save = s->pc;
 }
 
 static int cur_insn_len(DisasContext *s)
@@ -539,6 +553,7 @@ static TCGv_i32 cur_insn_len_i32(DisasContext *s)
 
 static TCGv_i32 eip_next_i32(DisasContext *s)
 {
+    assert(s->pc_save != -1);
     /*
      * This function has two users: lcall_real (always 16-bit mode), and
      * iret_protected (16, 32, or 64-bit mode).  IRET only uses the value
@@ -550,17 +565,38 @@ static TCGv_i32 eip_next_i32(DisasContext *s)
     if (CODE64(s)) {
         return tcg_constant_i32(-1);
     }
-    return tcg_constant_i32(s->pc - s->cs_base);
+    if (TARGET_TB_PCREL) {
+        TCGv_i32 ret = tcg_temp_new_i32();
+        tcg_gen_trunc_tl_i32(ret, cpu_eip);
+        tcg_gen_addi_i32(ret, ret, s->pc - s->pc_save);
+        return ret;
+    } else {
+        return tcg_constant_i32(s->pc - s->cs_base);
+    }
 }
 
 static TCGv eip_next_tl(DisasContext *s)
 {
-    return tcg_constant_tl(s->pc - s->cs_base);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        TCGv ret = tcg_temp_new();
+        tcg_gen_addi_tl(ret, cpu_eip, s->pc - s->pc_save);
+        return ret;
+    } else {
+        return tcg_constant_tl(s->pc - s->cs_base);
+    }
 }
 
 static TCGv eip_cur_tl(DisasContext *s)
 {
-    return tcg_constant_tl(s->base.pc_next - s->cs_base);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        TCGv ret = tcg_temp_new();
+        tcg_gen_addi_tl(ret, cpu_eip, s->base.pc_next - s->pc_save);
+        return ret;
+    } else {
+        return tcg_constant_tl(s->base.pc_next - s->cs_base);
+    }
 }
 
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
@@ -2260,7 +2296,12 @@ static TCGv gen_lea_modrm_1(DisasContext *s, AddressParts a)
         ea = cpu_regs[a.base];
     }
     if (!ea) {
-        tcg_gen_movi_tl(s->A0, a.disp);
+        if (TARGET_TB_PCREL && a.base == -2) {
+            /* With cpu_eip ~= pc_save, the expression is pc-relative. */
+            tcg_gen_addi_tl(s->A0, cpu_eip, a.disp - s->pc_save);
+        } else {
+            tcg_gen_movi_tl(s->A0, a.disp);
+        }
         ea = s->A0;
     } else if (a.disp != 0) {
         tcg_gen_addi_tl(s->A0, ea, a.disp);
@@ -2748,32 +2789,58 @@ static void gen_jr(DisasContext *s)
 /* Jump to eip+diff, truncating the result to OT. */
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
 {
-    target_ulong dest = s->pc - s->cs_base + diff;
+    bool use_goto_tb = s->jmp_opt;
+    target_ulong mask = -1;
+    target_ulong new_pc = s->pc + diff;
+    target_ulong new_eip = new_pc - s->cs_base;
 
     /* In 64-bit mode, operand size is fixed at 64 bits. */
     if (!CODE64(s)) {
         if (ot == MO_16) {
-            dest &= 0xffff;
+            mask = 0xffff;
+            if (TARGET_TB_PCREL && CODE32(s)) {
+                use_goto_tb = false;
+            }
         } else {
-            dest &= 0xffffffff;
+            mask = 0xffffffff;
         }
     }
+    new_eip &= mask;
 
     gen_update_cc_op(s);
     set_cc_op(s, CC_OP_DYNAMIC);
-    if (!s->jmp_opt) {
-        tcg_gen_movi_tl(cpu_eip, dest);
-        gen_eob(s);
-    } else if (translator_use_goto_tb(&s->base, dest))  {
+
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_tl(cpu_eip, cpu_eip, new_pc - s->pc_save);
+        /*
+         * If we can prove the branch does not leave the page and we have
+         * no extra masking to apply (data16 branch in code32, see above),
+         * then we have also proven that the addition does not wrap.
+         */
+        if (!use_goto_tb || !is_same_page(&s->base, new_pc)) {
+            tcg_gen_andi_tl(cpu_eip, cpu_eip, mask);
+            use_goto_tb = false;
+        }
+    }
+
+    if (use_goto_tb &&
+        translator_use_goto_tb(&s->base, new_eip + s->cs_base)) {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
-        tcg_gen_movi_tl(cpu_eip, dest);
+        if (!TARGET_TB_PCREL) {
+            tcg_gen_movi_tl(cpu_eip, new_eip);
+        }
         tcg_gen_exit_tb(s->base.tb, tb_num);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
-        /* jump to another page */
-        tcg_gen_movi_tl(cpu_eip, dest);
-        gen_jr(s);
+        if (!TARGET_TB_PCREL) {
+            tcg_gen_movi_tl(cpu_eip, new_eip);
+        }
+        if (s->jmp_opt) {
+            gen_jr(s);   /* jump to another page */
+        } else {
+            gen_eob(s);  /* exit to main loop */
+        }
     }
 }
 
@@ -5329,7 +5396,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
             gen_push_v(s, eip_next_tl(s));
-            gen_op_jmp_v(s->T0);
+            gen_op_jmp_v(s, s->T0);
             gen_bnd_jmp(s);
             s->base.is_jmp = DISAS_JUMP;
             break;
@@ -5359,7 +5426,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (dflag == MO_16) {
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
-            gen_op_jmp_v(s->T0);
+            gen_op_jmp_v(s, s->T0);
             gen_bnd_jmp(s);
             s->base.is_jmp = DISAS_JUMP;
             break;
@@ -5377,7 +5444,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                           eip_next_tl(s));
             } else {
                 gen_op_movl_seg_T0_vm(s, R_CS);
-                gen_op_jmp_v(s->T1);
+                gen_op_jmp_v(s, s->T1);
             }
             s->base.is_jmp = DISAS_JUMP;
             break;
@@ -6792,7 +6859,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         ot = gen_pop_T0(s);
         gen_stack_update(s, val + (1 << ot));
         /* Note that gen_pop_T0 uses a zero-extending load.  */
-        gen_op_jmp_v(s->T0);
+        gen_op_jmp_v(s, s->T0);
         gen_bnd_jmp(s);
         s->base.is_jmp = DISAS_JUMP;
         break;
@@ -6800,7 +6867,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         ot = gen_pop_T0(s);
         gen_pop_update(s, ot);
         /* Note that gen_pop_T0 uses a zero-extending load.  */
-        gen_op_jmp_v(s->T0);
+        gen_op_jmp_v(s, s->T0);
         gen_bnd_jmp(s);
         s->base.is_jmp = DISAS_JUMP;
         break;
@@ -6818,7 +6885,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_op_ld_v(s, dflag, s->T0, s->A0);
             /* NOTE: keeping EIP updated is not a problem in case of
                exception */
-            gen_op_jmp_v(s->T0);
+            gen_op_jmp_v(s, s->T0);
             /* pop selector */
             gen_add_A0_im(s, 1 << dflag);
             gen_op_ld_v(s, dflag, s->T0, s->A0);
@@ -8680,6 +8747,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     int iopl = (flags >> IOPL_SHIFT) & 3;
 
     dc->cs_base = dc->base.tb->cs_base;
+    dc->pc_save = dc->base.pc_next;
     dc->flags = flags;
 #ifndef CONFIG_USER_ONLY
     dc->cpl = cpl;
@@ -8743,9 +8811,14 @@ static void i386_tr_tb_start(DisasContextBase *db, CPUState *cpu)
 static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
+    target_ulong pc_arg = dc->base.pc_next;
 
     dc->prev_insn_end = tcg_last_op();
-    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op);
+    if (TARGET_TB_PCREL) {
+        pc_arg -= dc->cs_base;
+        pc_arg &= ~TARGET_PAGE_MASK;
+    }
+    tcg_gen_insn_start(pc_arg, dc->cc_op);
 }
 
 static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
@@ -8846,7 +8919,12 @@ void restore_state_to_opc(CPUX86State *env, TranslationBlock *tb,
                           target_ulong *data)
 {
     int cc_op = data[1];
-    env->eip = data[0] - tb->cs_base;
+
+    if (TARGET_TB_PCREL) {
+        env->eip = (env->eip & TARGET_PAGE_MASK) | data[0];
+    } else {
+        env->eip = data[0] - tb->cs_base;
+    }
     if (cc_op != CC_OP_DYNAMIC) {
         env->cc_op = cc_op;
     }
-- 
2.37.3


