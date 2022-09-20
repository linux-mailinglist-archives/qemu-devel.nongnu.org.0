Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4601B5BEF51
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:43:49 +0200 (CEST)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oal1u-0002ce-Hu
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzv-0006Ki-DI
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzt-00026K-Bu
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5yNNSCZf7PAfY9a2N0s5ZJwEMS+GSiiy9aGwbxeMwC0=;
 b=N6l8vFYwpfBOEOev91BaWaNbpFn7Mf/UiNSEJtI6QX+OjSmz+4k+3dlymVp2zMJoc7z7cP
 Oeq4aswug0B3WY7ChAq/b9E0yU4pQcTbWHCVlSfRLVExpnhSzQjMOkT4F8KVxhnFh8gCbY
 1fxOoT9Y1x5akuhwAMPuukuajNXge9A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-OeSd5-l_PN28H4rzX5xuUw-1; Tue, 20 Sep 2022 13:25:20 -0400
X-MC-Unique: OeSd5-l_PN28H4rzX5xuUw-1
Received: by mail-ed1-f70.google.com with SMTP id
 h13-20020a056402280d00b004528c8400afso2343980ede.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5yNNSCZf7PAfY9a2N0s5ZJwEMS+GSiiy9aGwbxeMwC0=;
 b=IEjI4EVvX8pTccKJQuuo6q8zqu3SGSj0ljCXMQd27K6Qj+7q9W8joWITt8I3ECNleF
 htUFzRGI1EPKvmrsd5pzZpo/OhuLZPJHMxfz+ZOsu10pnwZrhu7Lpig8gB/8SwXfJlvZ
 VdLQI/9O9IBv3dRMILlJQbzo/RqaAD+rqyYWgk39gVPnvzllL4fnDx3J1LLyWHXtTItE
 yZlLib/Ju/YwyRoB7nTmHX+gRwf+DPljv0ywRiSwADdy6ehfJkNvn36MFRjfQ5FKAQ73
 B646NgvalRTkrn9e36rEHgahBbGeTSF9P2aJk4NPpeOrDCZf1VK5B+g4h6ObFOwXr0d5
 X4fw==
X-Gm-Message-State: ACrzQf27PyKjgW8zeLaaKhrY4kJskvSrYZ+qFOei44RHl4zpCCPyIRS9
 Dh+CFDvCssmUNfV+5Zf3Gdew+i+8dGrw6vTwF+GS+FgpIGXdKvE2dQkk0MdeZ/wsJ3NLIfKgKvF
 E1BcuR2sFCo0PNRz/rhNxgjvhk+ZRoZmP3mcw9pUuX5V9R9GOQ0ANHRU6pTY8pztt+iQ=
X-Received: by 2002:a05:6402:350a:b0:44e:9da7:2afb with SMTP id
 b10-20020a056402350a00b0044e9da72afbmr21683436edd.290.1663694718587; 
 Tue, 20 Sep 2022 10:25:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM53sY0ACYsLl4FY6dLFdVq4CSxwCDyPV/bpzd89HziyjHSyeHTt6t0b4anlAxG4z7Rl4YN1Wg==
X-Received: by 2002:a05:6402:350a:b0:44e:9da7:2afb with SMTP id
 b10-20020a056402350a00b0044e9da72afbmr21683422edd.290.1663694718273; 
 Tue, 20 Sep 2022 10:25:18 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ti5-20020a170907c20500b007801ce34311sm198979ejc.19.2022.09.20.10.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 06/37] target/i386: add ALU load/writeback core
Date: Tue, 20 Sep 2022 19:24:36 +0200
Message-Id: <20220920172507.95568-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Add generic code generation that takes care of preparing operands
around calls to decode.e.gen in a table-driven manner, so that ALU
operations need not take care of that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  33 ++++++-
 target/i386/tcg/decode-new.h     |   7 ++
 target/i386/tcg/emit.c.inc       | 155 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  18 ++++
 4 files changed, 212 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index a908e8b086..be4e5705ed 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -513,6 +513,20 @@ static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_
     return true;
 }
 
+static void decode_temp_free(X86DecodedOp *op)
+{
+    if (op->v_ptr) {
+        tcg_temp_free_ptr(op->v_ptr);
+    }
+}
+
+static void decode_temps_free(X86DecodedInsn *decode)
+{
+    decode_temp_free(&decode->op[0]);
+    decode_temp_free(&decode->op[1]);
+    decode_temp_free(&decode->op[2]);
+}
+
 /*
  * Convert one instruction. s->base.is_jmp is set if the translation must
  * be stopped.
@@ -738,7 +752,24 @@ static void disas_insn_new(DisasContext *s, CPUState *cpu, int b)
     if (decode.op[0].has_ea || decode.op[1].has_ea || decode.op[2].has_ea) {
         gen_load_ea(s, &decode.mem);
     }
-    decode.e.gen(s, env, &decode);
+    if (s->prefix & PREFIX_LOCK) {
+        if (decode.op[0].unit != X86_OP_INT || !decode.op[0].has_ea) {
+            goto illegal_op;
+        }
+        gen_load(s, &decode, 2, s->T1);
+        decode.e.gen(s, env, &decode);
+    } else {
+        if (decode.op[0].unit == X86_OP_MMX) {
+            compute_mmx_offset(&decode.op[0]);
+        } else if (decode.op[0].unit == X86_OP_SSE) {
+            compute_xmm_offset(&decode.op[0]);
+        }
+        gen_load(s, &decode, 1, s->T0);
+        gen_load(s, &decode, 2, s->T1);
+        decode.e.gen(s, env, &decode);
+        gen_writeback(s, &decode, 0, s->T0);
+    }
+    decode_temps_free(&decode);
     return;
  illegal_op:
     gen_illegal_opcode(s);
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index 2f22d4d22e..3a856b48e7 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -168,6 +168,13 @@ typedef struct X86DecodedOp {
     MemOp ot;     /* For b/c/d/p/s/q/v/w/y/z */
     X86OpUnit unit;
     bool has_ea;
+    int offset;   /* For MMX and SSE */
+
+    /*
+     * This field is used internally by macros OP0_PTR/OP1_PTR/OP2_PTR,
+     * do not access directly!
+     */
+    TCGv_ptr v_ptr;
 } X86DecodedOp;
 
 struct X86DecodedInsn {
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index e86364ffc1..8f60658537 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -29,3 +29,158 @@ static void gen_load_ea(DisasContext *s, AddressParts *mem)
     TCGv ea = gen_lea_modrm_1(s, *mem);
     gen_lea_v_seg(s, s->aflag, ea, mem->def_seg, s->override);
 }
+
+static inline int mmx_offset(MemOp ot)
+{
+    switch (ot) {
+    case MO_8:
+        return offsetof(MMXReg, MMX_B(0));
+    case MO_16:
+        return offsetof(MMXReg, MMX_W(0));
+    case MO_32:
+        return offsetof(MMXReg, MMX_L(0));
+    case MO_64:
+        return offsetof(MMXReg, MMX_Q(0));
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static inline int xmm_offset(MemOp ot)
+{
+    switch (ot) {
+    case MO_8:
+        return offsetof(ZMMReg, ZMM_B(0));
+    case MO_16:
+        return offsetof(ZMMReg, ZMM_W(0));
+    case MO_32:
+        return offsetof(ZMMReg, ZMM_L(0));
+    case MO_64:
+        return offsetof(ZMMReg, ZMM_Q(0));
+    case MO_128:
+        return offsetof(ZMMReg, ZMM_X(0));
+    case MO_256:
+        return offsetof(ZMMReg, ZMM_Y(0));
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void compute_mmx_offset(X86DecodedOp *op)
+{
+    if (!op->has_ea) {
+        op->offset = offsetof(CPUX86State, fpregs[op->n].mmx) + mmx_offset(op->ot);
+    } else {
+        op->offset = offsetof(CPUX86State, mmx_t0) + mmx_offset(op->ot);
+    }
+}
+
+static void compute_xmm_offset(X86DecodedOp *op)
+{
+    if (!op->has_ea) {
+        op->offset = ZMM_OFFSET(op->n) + xmm_offset(op->ot);
+    } else {
+        op->offset = offsetof(CPUX86State, xmm_t0) + xmm_offset(op->ot);
+    }
+}
+
+static void gen_load_sse(DisasContext *s, TCGv temp, MemOp ot, int dest_ofs, bool aligned)
+{
+    if (ot == MO_8) {
+        gen_op_ld_v(s, MO_8, temp, s->A0);
+        tcg_gen_st8_tl(temp, cpu_env, dest_ofs);
+    } else if (ot == MO_16) {
+        gen_op_ld_v(s, MO_16, temp, s->A0);
+        tcg_gen_st16_tl(temp, cpu_env, dest_ofs);
+    } else if (ot == MO_32) {
+        gen_op_ld_v(s, MO_32, temp, s->A0);
+        tcg_gen_st32_tl(temp, cpu_env, dest_ofs);
+    } else if (ot == MO_64) {
+        gen_ldq_env_A0(s, dest_ofs);
+    } else if (ot == MO_128) {
+        gen_ldo_env_A0(s, dest_ofs, aligned);
+    } else if (ot == MO_256) {
+        gen_ldy_env_A0(s, dest_ofs, aligned);
+    }
+}
+
+static void gen_load(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv v)
+{
+    X86DecodedOp *op = &decode->op[opn];
+
+    switch (op->unit) {
+    case X86_OP_SKIP:
+        return;
+    case X86_OP_SEG:
+        tcg_gen_ld32u_tl(v, cpu_env,
+                         offsetof(CPUX86State,segs[op->n].selector));
+        break;
+    case X86_OP_CR:
+        tcg_gen_ld_tl(v, cpu_env, offsetof(CPUX86State, cr[op->n]));
+        break;
+    case X86_OP_DR:
+        tcg_gen_ld_tl(v, cpu_env, offsetof(CPUX86State, dr[op->n]));
+        break;
+    case X86_OP_INT:
+        if (op->has_ea) {
+            gen_op_ld_v(s, op->ot, v, s->A0);
+        } else {
+            gen_op_mov_v_reg(s, op->ot, v, op->n);
+        }
+        break;
+    case X86_OP_IMM:
+        tcg_gen_movi_tl(v, decode->immediate);
+        break;
+
+    case X86_OP_MMX:
+        compute_mmx_offset(op);
+        goto load_vector;
+
+    case X86_OP_SSE:
+        compute_xmm_offset(op);
+    load_vector:
+        if (op->has_ea) {
+            gen_load_sse(s, v, op->ot, op->offset, true);
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void gen_writeback(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv v)
+{
+    X86DecodedOp *op = &decode->op[opn];
+    switch (op->unit) {
+    case X86_OP_SKIP:
+        break;
+    case X86_OP_SEG:
+        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
+        gen_movl_seg_T0(s, op->n);
+        if (s->base.is_jmp) {
+            gen_jmp_im(s, s->pc - s->cs_base);
+            if (op->n == R_SS) {
+                s->flags &= ~HF_TF_MASK;
+                gen_eob_inhibit_irq(s, true);
+            } else {
+                gen_eob(s);
+            }
+        }
+        break;
+    case X86_OP_INT:
+        if (op->has_ea) {
+            gen_op_st_v(s, op->ot, v, s->A0);
+        } else {
+            gen_op_mov_reg_v(s, op->ot, op->n, v);
+        }
+        break;
+    case X86_OP_MMX:
+    case X86_OP_SSE:
+        break;
+    case X86_OP_CR:
+    case X86_OP_DR:
+    default:
+        g_assert_not_reached();
+    }
+}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index ad14f56a31..e6e82f32cb 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2832,6 +2832,24 @@ static inline void gen_sto_env_A0(DisasContext *s, int offset, bool align)
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
 }
 
+static void gen_ldy_env_A0(DisasContext *s, int offset, bool align)
+{
+    int mem_index = s->mem_index;
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index,
+                        MO_LEUQ | (align ? MO_ALIGN_32 : 0));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(YMMReg, YMM_Q(0)));
+    tcg_gen_addi_tl(s->tmp0, s->A0, 8);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(YMMReg, YMM_Q(1)));
+
+    tcg_gen_addi_tl(s->tmp0, s->A0, 16);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(YMMReg, YMM_Q(2)));
+    tcg_gen_addi_tl(s->tmp0, s->A0, 24);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(YMMReg, YMM_Q(3)));
+}
+
 static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset)
 {
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(XMMReg, XMM_Q(0)));
-- 
2.37.2


