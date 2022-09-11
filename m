Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D085B51D6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:17:58 +0200 (CEST)
Received: from localhost ([::1]:57518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWD5-00021z-J0
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0M-0000Gu-Pf
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0K-0006zk-SZ
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXfKQ9wMRjG03YHNEkvjK1M5NZzwlRM0zsPk2T4zDiY=;
 b=a69MCZHt8xaDIn2V8TxPHOy+gIuS8YovXfV9z9cD5OLg2Mpg9gg6+5a7roOAUvp5HBiFne
 1tYWm6k5HBdS3Er6MoirUYNi5OKu6JFgXvRakYj3IUw7Kz7FfvhRdK0vJBGtwsnTZXvKAa
 hz/5hK6VQtBsIJqrJwuiYlxKGYNx4mo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-PpGHnI5qOMyeXe776_L1rQ-1; Sun, 11 Sep 2022 19:04:42 -0400
X-MC-Unique: PpGHnI5qOMyeXe776_L1rQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so4959118edz.0
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AXfKQ9wMRjG03YHNEkvjK1M5NZzwlRM0zsPk2T4zDiY=;
 b=vrU10RoktFLSrRMKET9U80oel+UG45nZI7NZp9L7s9PV593T/R6csPmcs0yVi9y35C
 ozKiJHxQxaHvS0TdNXyflyxHa5d9yhqX/B1qveUj8SkR1xOu4wGF3iIJzEVGMzSKYFA/
 WR60AK0s2tMfDeE4NIXw6xQzWekxfwnLTZczrfSPM9VliNkIxu0TBVJxCpzunxjsFl31
 +SxEn8W2GSgxnml+3y06tQbltpOapUSZShJquayOsEdYGpgeMMZNUkuVCUL8DQ4oQ8Q1
 kVuZ8fPl6YE5dhYYOrgVaCxlsFYjytLUJivex5AmQiDRNX/8hLza0P55zT5ya4HvacfX
 w31A==
X-Gm-Message-State: ACgBeo3MxMPPMxdNCEiP1BTUnfq5qO1a7Jnkx68EFQJbsEUU5jaZjwLo
 xpKmEGAQPxu+mk1VL6IM4a2BPGeQgB29QRWr0CeXOkjbsdwJvfb1eqMz7kDx50649w9t1cids6U
 wg6iHHCqjU20LknALLZFIphxS1xRS3ryHYVkpKWc1cZwQJTR7x9J0vNae2dah14uOj9g=
X-Received: by 2002:a05:6402:2691:b0:43d:ba10:854b with SMTP id
 w17-20020a056402269100b0043dba10854bmr19582638edd.158.1662937481302; 
 Sun, 11 Sep 2022 16:04:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7mQhnebdpEp8TEePuKCDWRMB+UAU2P6geZR03b+dEJXju+ENUMwGvTUCubs2qnHvikuu9jUg==
X-Received: by 2002:a05:6402:2691:b0:43d:ba10:854b with SMTP id
 w17-20020a056402269100b0043dba10854bmr19582624edd.158.1662937480976; 
 Sun, 11 Sep 2022 16:04:40 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906310a00b0073d6d6e698bsm3470074ejx.187.2022.09.11.16.04.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:04:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/37] target/i386: add ALU load/writeback core
Date: Mon, 12 Sep 2022 01:03:46 +0200
Message-Id: <20220911230418.340941-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add generic code generation that takes care of preparing operands
around calls to decode.e.gen in a table-driven manner, so that ALU
operations need not take care of that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  20 +++-
 target/i386/tcg/decode-new.h     |   1 +
 target/i386/tcg/emit.c.inc       | 152 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  24 +++++
 4 files changed, 195 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index de8ef51a2d..7f76051b2d 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -228,7 +228,7 @@ static bool decode_op_size(DisasContext *s, X86OpEntry *e, X86OpSize size, MemOp
             *ot = MO_64;
             return true;
         }
-        if (s->vex_l && e->s0 != X86_SIZE_qq) {
+        if (s->vex_l && e->s0 != X86_SIZE_qq && e->s1 != X86_SIZE_qq) {
             return false;
         }
         *ot = MO_128;
@@ -741,7 +741,23 @@ static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
     if (decode.op[0].has_ea || decode.op[1].has_ea || decode.op[2].has_ea) {
         gen_load_ea(s, &decode.mem);
     }
-    decode.e.gen(s, env, &decode);
+    if (s->prefix & PREFIX_LOCK) {
+        if (decode.op[0].unit != X86_OP_INT || !decode.op[0].has_ea) {
+            goto illegal_op;
+        }
+        gen_load(s, s->T1, NULL, &decode.op[2], decode.immediate);
+        decode.e.gen(s, env, &decode);
+    } else {
+        if (decode.op[0].unit == X86_OP_MMX) {
+            gen_mmx_offset(s->ptr0, &decode.op[0]);
+        } else if (decode.op[0].unit == X86_OP_SSE) {
+            gen_xmm_offset(s->ptr0, &decode.op[0]);
+        }
+        gen_load(s, s->T0, s->ptr1, &decode.op[1], decode.immediate);
+        gen_load(s, s->T1, s->ptr2, &decode.op[2], decode.immediate);
+        decode.e.gen(s, env, &decode);
+        gen_writeback(s, &decode.op[0]);
+    }
     return s->pc;
  illegal_op:
     gen_illegal_opcode(s);
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index fb44560aae..a2d3c3867f 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -168,6 +168,7 @@ typedef struct X86DecodedOp {
     MemOp ot;     /* For b/c/d/p/s/q/v/w/y/z */
     X86OpUnit unit;
     bool has_ea;
+    int offset;   /* For MMX and SSE */
 } X86DecodedOp;
 
 struct X86DecodedInsn {
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index e86364ffc1..6fa0062d6a 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -29,3 +29,155 @@ static void gen_load_ea(DisasContext *s, AddressParts *mem)
     TCGv ea = gen_lea_modrm_1(s, *mem);
     gen_lea_v_seg(s, s->aflag, ea, mem->def_seg, s->override);
 }
+
+static void gen_mmx_offset(TCGv_ptr ptr, X86DecodedOp *op)
+{
+    if (!op->has_ea) {
+        op->offset = offsetof(CPUX86State, fpregs[op->n].mmx);
+    } else {
+        op->offset = offsetof(CPUX86State, mmx_t0);
+    }
+    tcg_gen_addi_ptr(ptr, cpu_env, op->offset);
+
+    /*
+     * ptr is for passing to helpers, and points to the MMXReg; op->offset
+     * is for TCG ops and points to the operand.
+     */
+    if (op->ot == MO_32) {
+        op->offset += offsetof(MMXReg, MMX_L(0));
+    }
+}
+
+static int xmm_offset(MemOp ot)
+{
+    if (ot == MO_8) {
+        return offsetof(ZMMReg, ZMM_B(0));
+    } else if (ot == MO_16) {
+        return offsetof(ZMMReg, ZMM_W(0));
+    } else if (ot == MO_32) {
+        return offsetof(ZMMReg, ZMM_L(0));
+    } else if (ot == MO_64) {
+        return offsetof(ZMMReg, ZMM_Q(0));
+    } else if (ot == MO_128) {
+        return offsetof(ZMMReg, ZMM_X(0));
+    } else if (ot == MO_256) {
+        return offsetof(ZMMReg, ZMM_Y(0));
+    } else {
+       abort();
+    }
+}
+
+static void gen_xmm_offset(TCGv_ptr ptr, X86DecodedOp *op)
+{
+    if (!op->has_ea) {
+        op->offset = ZMM_OFFSET(op->n);
+    } else {
+        op->offset = offsetof(CPUX86State, xmm_t0);
+    }
+    /*
+     * ptr is for passing to helpers, and points to the ZMMReg; op->offset
+     * is for TCG ops (especially gvec) and points to the base of the vector.
+     */
+    tcg_gen_addi_ptr(ptr, cpu_env, op->offset);
+    op->offset += xmm_offset(op->ot);
+}
+
+static void gen_load_sse(DisasContext *s, TCGv temp, MemOp ot, int dest_ofs)
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
+        gen_ldo_env_A0(s, dest_ofs);
+    } else if (ot == MO_256) {
+        gen_ldy_env_A0(s, dest_ofs);
+    }
+}
+
+static void gen_load(DisasContext *s, TCGv v, TCGv_ptr ptr, X86DecodedOp *op, uint64_t imm)
+{
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
+        tcg_gen_movi_tl(v, imm);
+        break;
+
+    case X86_OP_MMX:
+        gen_mmx_offset(ptr, op);
+        goto load_vector;
+
+    case X86_OP_SSE:
+        gen_xmm_offset(ptr, op);
+    load_vector:
+        if (op->has_ea) {
+            gen_load_sse(s, v, op->ot, op->offset);
+        }
+        break;
+
+    default:
+        abort();
+    }
+}
+
+static void gen_writeback(DisasContext *s, X86DecodedOp *op)
+{
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
+    case X86_OP_CR:
+    case X86_OP_DR:
+        /* TBD */
+        break;
+    case X86_OP_INT:
+        if (op->has_ea) {
+            gen_op_st_v(s, op->ot, s->T0, s->A0);
+        } else {
+            gen_op_mov_reg_v(s, op->ot, op->n, s->T0);
+        }
+        break;
+    case X86_OP_MMX:
+    case X86_OP_SSE:
+        break;
+    default:
+        abort();
+    }
+}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index f66bf2ac79..7e9920e29c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2831,6 +2831,30 @@ static inline void gen_sto_env_A0(DisasContext *s, int offset)
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
 }
 
+static inline void gen_ldy_env_A0(DisasContext *s, int offset)
+{
+    int mem_index = s->mem_index;
+    gen_ldo_env_A0(s, offset);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 16);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_addi_tl(s->tmp0, s->A0, 24);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+}
+
+static inline void gen_sty_env_A0(DisasContext *s, int offset)
+{
+    int mem_index = s->mem_index;
+    gen_sto_env_A0(s, offset);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 16);
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 24);
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+}
+
 static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset)
 {
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(XMMReg, XMM_Q(0)));
-- 
2.37.2



