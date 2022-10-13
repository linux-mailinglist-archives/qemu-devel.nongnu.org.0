Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570815FE48D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:52:58 +0200 (CEST)
Received: from localhost ([::1]:56258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj68P-0000Z7-Di
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62r-0002Sy-K4
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62p-0005Bt-3e
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1m4GSqBqGlIa3q//KMDdJd3YNX7GLp4zH4HH4fvKc+s=;
 b=QG11cSJsAAVrOnvFu16QpHVAoRGD2NPjTVFEoaanRBX6ojRZcIPJ5rszHwAo+6XVgZdNT8
 A8JiEewJ9CwnPbWiv63uqH3x++i4i7zBULta1+nHZbu8ZV5BM21mF2yMvBIPRb+T11RM4F
 FHVAWJ2koxdczpF18XXpadBQj0uhhig=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-DYhjc2jHP5ilXWthqA8aLA-1; Thu, 13 Oct 2022 17:47:09 -0400
X-MC-Unique: DYhjc2jHP5ilXWthqA8aLA-1
Received: by mail-ed1-f70.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso2354152edc.21
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1m4GSqBqGlIa3q//KMDdJd3YNX7GLp4zH4HH4fvKc+s=;
 b=e0Qpl45x2tsC5K439moaIf6BlTm/40yJooJ38T8XCj6ak9IROY+xR+ueFBtzUYeD2f
 pkKj0HbWPrt07kpc86Au5icabZVe5skB/yW10yYg+atnFIqg14LH9Zq6MTwOWpOlu/v9
 s1wYJwxVl7f85EyCslqpqtdh0/CajrSdae6EVwkS9Qk+4hBS1U3EXIj4ooSbaF7wRmsv
 anjxUa8x96ljCgHbM/IFHrhtROMnIfKS1Ml+tnyjPjSBOvlLN7EAEBNEKQsqcYb+kXzK
 KYkPqrEoUk2hSg0yCl3A3YiEFWjlYyyCFXHcSUgj1svAqJPNbikt9zrr/cCW0Auev9eu
 r/EA==
X-Gm-Message-State: ACrzQf3+UvHhXUCLBSDYh0SJiDTXNmHRnO67E9JxvSmcSW6k3sTD5OCB
 5AcXzehIQB0/a6HFnJ0pa6pGo0wfNJEgMGtIZNYYmhtvIYAe0rHBVM3Mc2knCkFvop4ExBUglN9
 C3FrouvTrCPMfbg2ODFbDvQo/EBeok5JiJI31TlpIT37iy+sjv8u8E3rPtCpeZnJz2GY=
X-Received: by 2002:a05:6402:50d4:b0:45d:fe2:45 with SMTP id
 h20-20020a05640250d400b0045d0fe20045mr1237578edb.221.1665697627154; 
 Thu, 13 Oct 2022 14:47:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7rcA/fOt4l5vpkx5MxAHuy7tq0VsmsyguWK6zz+YaMhO5XE8ZotTREqBbU0i87yaVtUpzy5g==
X-Received: by 2002:a05:6402:50d4:b0:45d:fe2:45 with SMTP id
 h20-20020a05640250d400b0045d0fe20045mr1237568edb.221.1665697626873; 
 Thu, 13 Oct 2022 14:47:06 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a1709060cd100b00783c545544fsm405242ejh.215.2022.10.13.14.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 04/35] target/i386: add ALU load/writeback core
Date: Thu, 13 Oct 2022 23:46:20 +0200
Message-Id: <20221013214651.672114-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
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

Add generic code generation that takes care of preparing operands
around calls to decode.e.gen in a table-driven manner, so that ALU
operations need not take care of that.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index e86364ffc1..f8ba888c33 100644
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
+    switch(ot) {
+    case MO_8:
+        gen_op_ld_v(s, MO_8, temp, s->A0);
+        tcg_gen_st8_tl(temp, cpu_env, dest_ofs);
+        break;
+    case MO_16:
+        gen_op_ld_v(s, MO_16, temp, s->A0);
+        tcg_gen_st16_tl(temp, cpu_env, dest_ofs);
+        break;
+    case MO_32:
+        gen_op_ld_v(s, MO_32, temp, s->A0);
+        tcg_gen_st32_tl(temp, cpu_env, dest_ofs);
+        break;
+    case MO_64:
+        gen_ldq_env_A0(s, dest_ofs);
+        break;
+    case MO_128:
+        gen_ldo_env_A0(s, dest_ofs, aligned);
+        break;
+    case MO_256:
+        gen_ldy_env_A0(s, dest_ofs, aligned);
+        break;
+    default:
+        g_assert_not_reached();
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
+        /* Note that gen_movl_seg_T0 takes care of interrupt shadow and TF.  */
+        gen_movl_seg_T0(s, op->n);
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
index 292a8a8527..4403d376e0 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2913,6 +2913,24 @@ static inline void gen_sto_env_A0(DisasContext *s, int offset, bool align)
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
2.37.3


