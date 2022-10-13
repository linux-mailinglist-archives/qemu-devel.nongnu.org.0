Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C835FE49C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:58:13 +0200 (CEST)
Received: from localhost ([::1]:58522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6DV-0002ir-04
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63U-0002kA-0X
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63R-0005Hd-S3
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKNGYPjj1fH+LOvJEQuLX6aJLFNQ00rp8CkStTPkFj0=;
 b=abB/nI2S72+boxevtvMvj6muy4QvvjIOpeRQTfHHPXHNYlpliVnay6Ol15udgkcTP8WBE2
 txAsjkkrkTrRNmnIoLb/vw/uh6lDlLvoBZqHJBE5BzCIjXvsyioZcyFU1FrElny8prZuMg
 91ibfb2b/H694GwIz9mNcAupS9nCiGc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-HpHKBohuPBGpKD8RIDQIyQ-1; Thu, 13 Oct 2022 17:47:48 -0400
X-MC-Unique: HpHKBohuPBGpKD8RIDQIyQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso1460554ejb.5
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UKNGYPjj1fH+LOvJEQuLX6aJLFNQ00rp8CkStTPkFj0=;
 b=N1lELu52BjuiP0+hCnFlD6lDEPCFuVtV71v9iua4tRnRqX7uClNbDRfWfsmzk/oMbr
 uFvANm11YEdCV9N2goLjla+uNAQIUM44O6LgQWQ0P2m5Egt4mmiky+Su+7NIbE6Dg7uu
 tyEhEh3MnY7/vKEWAO26rxSPu6qJlRKVzFgdTYopfXm2HLoVqnbqnnmMat8llXpM4Fiz
 qvdN7UxU7LOLkNMmz9MmYPwqgzNArscxvqf8URLBo+L2fIh46iXqy4slk833nk3frJYL
 JGMlhlEjc2IX638q6vOYk8fqR4iXpzZHTbfQwtmr8nKkWeWf9MWpKkjgtN+QIgSGJaqI
 yiiQ==
X-Gm-Message-State: ACrzQf0W64HgwFciMiX8oSBW9XuBYarz1VjVIiBQbxifrD9DoHupaomt
 7YBkim80kfhVKtNTo5Ywwkhyo9hH0S4AAMYuUukWp9CM1O6aV3SK7GyAPLb2caVT0CBXCGuY6jy
 ehqQOdO8bU1ZRdFqjXy/+ed4fLO1LbWQ012A9n2eND05ZkA8Xwj0IQwTFmOxdue7HAGU=
X-Received: by 2002:a17:907:a044:b0:78d:b569:b891 with SMTP id
 gz4-20020a170907a04400b0078db569b891mr1297379ejc.224.1665697665049; 
 Thu, 13 Oct 2022 14:47:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6RZjGfoy9MVNGrP3MYwSPTBFNaT67PcBR0jL0iF2nVMV09WPRn0P5jcKWTBUwrmA+Q05tPlw==
X-Received: by 2002:a17:907:a044:b0:78d:b569:b891 with SMTP id
 gz4-20020a170907a04400b0078db569b891mr1297359ejc.224.1665697664492; 
 Thu, 13 Oct 2022 14:47:44 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a50fc91000000b00458f077aecasm545216edq.17.2022.10.13.14.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 17/35] target/i386: reimplement 0x0f 0x60-0x6f, add AVX
Date: Thu, 13 Oct 2022 23:46:33 +0200
Message-Id: <20221013214651.672114-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
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

These are both MMX and SSE/AVX instructions, except for vmovdqu.  In both
cases the inputs and output is in s->ptr{0,1,2}, so the only difference
between MMX, SSE, and AVX is which helper to call.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  42 +++++++
 target/i386/tcg/emit.c.inc       | 202 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  19 ++-
 3 files changed, 262 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 013e155343..673c522b4f 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -135,6 +135,19 @@ static uint8_t get_modrm(DisasContext *s, CPUX86State *env)
     return s->modrm;
 }
 
+static inline const X86OpEntry *decode_by_prefix(DisasContext *s, const X86OpEntry entries[4])
+{
+    if (s->prefix & PREFIX_REPNZ) {
+        return &entries[3];
+    } else if (s->prefix & PREFIX_REPZ) {
+        return &entries[2];
+    } else if (s->prefix & PREFIX_DATA) {
+        return &entries[1];
+    } else {
+        return &entries[0];
+    }
+}
+
 static void decode_group17(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86GenFunc group17_gen[8] = {
@@ -144,6 +157,17 @@ static void decode_group17(DisasContext *s, CPUX86State *env, X86OpEntry *entry,
     entry->gen = group17_gen[op];
 }
 
+static void decode_0F6F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F6F[4] = {
+        X86_OP_ENTRY3(MOVDQ,       P,q, None,None, Q,q, vex1 mmx),  /* movq */
+        X86_OP_ENTRY3(MOVDQ,       V,x, None,None, W,x, vex1),      /* movdqa */
+        X86_OP_ENTRY3(MOVDQ,       V,x, None,None, W,x, vex4_unal), /* movdqu */
+        {},
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F6F);
+}
+
 static const X86OpEntry opcodes_0F38_00toEF[240] = {
 };
 
@@ -229,8 +253,26 @@ static void decode_0F3A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 }
 
 static const X86OpEntry opcodes_0F[256] = {
+    [0x60] = X86_OP_ENTRY3(PUNPCKLBW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x61] = X86_OP_ENTRY3(PUNPCKLWD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x62] = X86_OP_ENTRY3(PUNPCKLDQ,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x63] = X86_OP_ENTRY3(PACKSSWB,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x64] = X86_OP_ENTRY3(PCMPGTB,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x65] = X86_OP_ENTRY3(PCMPGTW,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x66] = X86_OP_ENTRY3(PCMPGTD,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x67] = X86_OP_ENTRY3(PACKUSWB,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+
     [0x38] = X86_OP_GROUP0(0F38),
     [0x3a] = X86_OP_GROUP0(0F3A),
+
+    [0x68] = X86_OP_ENTRY3(PUNPCKHBW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x69] = X86_OP_ENTRY3(PUNPCKHWD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x6a] = X86_OP_ENTRY3(PUNPCKHDQ,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x6b] = X86_OP_ENTRY3(PACKSSDW,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x6c] = X86_OP_ENTRY3(PUNPCKLQDQ, V,x, H,x, W,x,  vex4 p_66 avx2_256),
+    [0x6d] = X86_OP_ENTRY3(PUNPCKHQDQ, V,x, H,x, W,x,  vex4 p_66 avx2_256),
+    [0x6e] = X86_OP_ENTRY3(MOVD_to,    V,x, None,None, E,y, vex5 mmx p_00_66),  /* wrong dest Vy on SDM! */
+    [0x6f] = X86_OP_GROUP0(0F6F),
 };
 
 static void do_decode_0F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 947deacd37..8dbacc21ed 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -71,6 +71,56 @@ static inline int xmm_offset(MemOp ot)
     }
 }
 
+static int vector_reg_offset(X86DecodedOp *op)
+{
+    assert(op->unit == X86_OP_MMX || op->unit == X86_OP_SSE);
+
+    if (op->unit == X86_OP_MMX) {
+        return op->offset - mmx_offset(op->ot);
+    } else {
+        return op->offset - xmm_offset(op->ot);
+    }
+}
+
+static int vector_elem_offset(X86DecodedOp *op, MemOp ot, int n)
+{
+    int base_ofs = vector_reg_offset(op);
+    switch(ot) {
+    case MO_8:
+        if (op->unit == X86_OP_MMX) {
+            return base_ofs + offsetof(MMXReg, MMX_B(n));
+        } else {
+            return base_ofs + offsetof(ZMMReg, ZMM_B(n));
+        }
+    case MO_16:
+        if (op->unit == X86_OP_MMX) {
+            return base_ofs + offsetof(MMXReg, MMX_W(n));
+        } else {
+            return base_ofs + offsetof(ZMMReg, ZMM_W(n));
+        }
+    case MO_32:
+        if (op->unit == X86_OP_MMX) {
+            return base_ofs + offsetof(MMXReg, MMX_L(n));
+        } else {
+            return base_ofs + offsetof(ZMMReg, ZMM_L(n));
+        }
+    case MO_64:
+        if (op->unit == X86_OP_MMX) {
+            return base_ofs;
+        } else {
+            return base_ofs + offsetof(ZMMReg, ZMM_Q(n));
+        }
+    case MO_128:
+        assert(op->unit == X86_OP_SSE);
+        return base_ofs + offsetof(ZMMReg, ZMM_X(n));
+    case MO_256:
+        assert(op->unit == X86_OP_SSE);
+        return base_ofs + offsetof(ZMMReg, ZMM_Y(n));
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void compute_mmx_offset(X86DecodedOp *op)
 {
     if (!op->has_ea) {
@@ -183,6 +233,23 @@ static void gen_load(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv v)
     }
 }
 
+static TCGv_ptr op_ptr(X86DecodedInsn *decode, int opn)
+{
+    X86DecodedOp *op = &decode->op[opn];
+    if (op->v_ptr) {
+        return op->v_ptr;
+    }
+    op->v_ptr = tcg_temp_new_ptr();
+
+    /* The temporary points to the MMXReg or ZMMReg.  */
+    tcg_gen_addi_ptr(op->v_ptr, cpu_env, vector_reg_offset(op));
+    return op->v_ptr;
+}
+
+#define OP_PTR0 op_ptr(decode, 0)
+#define OP_PTR1 op_ptr(decode, 1)
+#define OP_PTR2 op_ptr(decode, 2)
+
 static void gen_writeback(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv v)
 {
     X86DecodedOp *op = &decode->op[opn];
@@ -216,6 +283,114 @@ static void gen_writeback(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv
     }
 }
 
+static inline int vector_len(DisasContext *s, X86DecodedInsn *decode)
+{
+    if (decode->e.special == X86_SPECIAL_MMX &&
+        !(s->prefix & (PREFIX_DATA | PREFIX_REPZ | PREFIX_REPNZ))) {
+        return 8;
+    }
+    return s->vex_l ? 32 : 16;
+}
+
+static void gen_store_sse(DisasContext *s, X86DecodedInsn *decode, int src_ofs)
+{
+    MemOp ot = decode->op[0].ot;
+    int vec_len = vector_len(s, decode);
+    bool aligned = sse_needs_alignment(s, decode, ot);
+
+    if (!decode->op[0].has_ea) {
+        tcg_gen_gvec_mov(MO_64, decode->op[0].offset, src_ofs, vec_len, vec_len);
+        return;
+    }
+
+    switch (ot) {
+    case MO_64:
+        gen_stq_env_A0(s, src_ofs);
+        break;
+    case MO_128:
+        gen_sto_env_A0(s, src_ofs, aligned);
+        break;
+    case MO_256:
+        gen_sty_env_A0(s, src_ofs, aligned);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+#define BINARY_INT_GVEC(uname, func, ...)                                          \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    int vec_len = vector_len(s, decode);                                          \
+                                                                                   \
+    func(__VA_ARGS__,                                                              \
+         decode->op[0].offset, decode->op[1].offset,                               \
+         decode->op[2].offset, vec_len, vec_len);                                  \
+}
+
+BINARY_INT_GVEC(PCMPGTB, tcg_gen_gvec_cmp, TCG_COND_GT, MO_8)
+BINARY_INT_GVEC(PCMPGTW, tcg_gen_gvec_cmp, TCG_COND_GT, MO_16)
+BINARY_INT_GVEC(PCMPGTD, tcg_gen_gvec_cmp, TCG_COND_GT, MO_32)
+
+
+/*
+ * 00 = p*  Pq, Qq (if mmx not NULL; no VEX)
+ * 66 = vp* Vx, Hx, Wx
+ *
+ * These are really the same encoding, because 1) V is the same as P when VEX.V
+ * is not present 2) P and Q are the same as H and W apart from MM/XMM
+ */
+static inline void gen_binary_int_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                      SSEFunc_0_eppp mmx, SSEFunc_0_eppp xmm, SSEFunc_0_eppp ymm)
+{
+    assert(!!mmx == !!(decode->e.special == X86_SPECIAL_MMX));
+
+    if (mmx && (s->prefix & PREFIX_VEX) && !(s->prefix & PREFIX_DATA)) {
+        /* VEX encoding is not applicable to MMX instructions.  */
+        gen_illegal_opcode(s);
+        return;
+    }
+    if (!(s->prefix & PREFIX_DATA)) {
+        mmx(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2);
+    } else if (!s->vex_l) {
+        xmm(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2);
+    } else {
+        ymm(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2);
+    }
+}
+
+
+#define BINARY_INT_MMX(uname, lname)                                               \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_binary_int_sse(s, env, decode,                                             \
+                          gen_helper_##lname##_mmx,                                \
+                          gen_helper_##lname##_xmm,                                \
+                          gen_helper_##lname##_ymm);                               \
+}
+BINARY_INT_MMX(PUNPCKLBW,  punpcklbw)
+BINARY_INT_MMX(PUNPCKLWD,  punpcklwd)
+BINARY_INT_MMX(PUNPCKLDQ,  punpckldq)
+BINARY_INT_MMX(PACKSSWB,   packsswb)
+BINARY_INT_MMX(PACKUSWB,   packuswb)
+BINARY_INT_MMX(PUNPCKHBW,  punpckhbw)
+BINARY_INT_MMX(PUNPCKHWD,  punpckhwd)
+BINARY_INT_MMX(PUNPCKHDQ,  punpckhdq)
+BINARY_INT_MMX(PACKSSDW,   packssdw)
+
+/* Instructions with no MMX equivalent.  */
+#define BINARY_INT_SSE(uname, lname)                                               \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_binary_int_sse(s, env, decode,                                             \
+                          NULL,                                                    \
+                          gen_helper_##lname##_xmm,                                \
+                          gen_helper_##lname##_ymm);                               \
+}
+
+BINARY_INT_SSE(PUNPCKLQDQ, punpcklqdq)
+BINARY_INT_SSE(PUNPCKHQDQ, punpckhqdq)
+
 static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
 {
     TCGv carry_in = NULL;
@@ -383,6 +558,33 @@ static void gen_MOVBE(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     }
 }
 
+static void gen_MOVD_to(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[2].ot;
+    int vec_len = vector_len(s, decode);
+    int lo_ofs = vector_elem_offset(&decode->op[0], ot, 0);
+
+    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+
+    switch (ot) {
+    case MO_32:
+#ifdef TARGET_X86_64
+        tcg_gen_st32_tl(s->T1, cpu_env, lo_ofs);
+        break;
+    case MO_64:
+#endif
+        tcg_gen_st_tl(s->T1, cpu_env, lo_ofs);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void gen_MOVDQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_store_sse(s, decode, decode->op[2].offset);
+}
+
 static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index bb3076528f..20cc059c31 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2935,6 +2935,23 @@ static void gen_ldy_env_A0(DisasContext *s, int offset, bool align)
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(YMMReg, YMM_Q(3)));
 }
 
+static void gen_sty_env_A0(DisasContext *s, int offset, bool align)
+{
+    int mem_index = s->mem_index;
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(YMMReg, YMM_Q(0)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, mem_index,
+                        MO_LEUQ | (align ? MO_ALIGN_32 : 0));
+    tcg_gen_addi_tl(s->tmp0, s->A0, 8);
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(YMMReg, YMM_Q(1)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 16);
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(YMMReg, YMM_Q(2)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 24);
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(YMMReg, YMM_Q(3)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+}
+
 static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset)
 {
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(XMMReg, XMM_Q(0)));
@@ -4756,7 +4773,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #ifndef CONFIG_USER_ONLY
         use_new &= b <= limit;
 #endif
-        if (use_new && 0) {
+        if (use_new && (b >= 0x160 && b <= 0x16f)) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
         }
-- 
2.37.3


