Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A70602DA6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:58:19 +0200 (CEST)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn6n-00076P-NM
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiS-0004RZ-5J
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiA-0005HX-3k
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M94LNBJ9aZEIQuFsUJHstxcBiq2v4UtctFBHVZSnvTM=;
 b=Cgt+LzV1SKJB7RzZT6buWHzqfEFB1ksjnwO381Imb7OVL2r7ijRSCtzVioMWP2+AGpbGYs
 sYaegFQDWmebBO7hc/t2zqQ1zs7PTEi4cWyt2nABnzN5F4KrRUzVexJbTBYd2We7OnGMV7
 UStZ/lrOJO1qYqjYDGc534j4hiYQr+8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-J05JrFj_M3W-pdGkGAsSrg-1; Tue, 18 Oct 2022 09:32:40 -0400
X-MC-Unique: J05JrFj_M3W-pdGkGAsSrg-1
Received: by mail-ed1-f70.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so11692115eda.19
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M94LNBJ9aZEIQuFsUJHstxcBiq2v4UtctFBHVZSnvTM=;
 b=2L3M73sRl2RxP0dO5pow4GDSdS1yqCiH0vGci1yLiIfqe35RRVuC32vEZn0PzfrwSs
 RFtPs+bfG75JM3wnJdlmbWjJ8yh3A9CLDBnL95JKoCPwm8zzdYoZuTKqk8zfRxcBzP2w
 WctDx/SruRyh6zZ24QgCgOD6p9ABI0JBd21pd7Nw4XEWwJkPjZsvBC6lsc4H5PNb0C5p
 BEkb2R/ywjCzxf12xWRMFv+ZUTjPv2HzFphhNRXgA9J6UGlXoJz8mi2iQc70DMQOazJM
 9FKw+QLvVGEh8sEKBcKM/K1AAS4BketVzocTSEb71dcFTj3LxmL9Z/Z4ophmIU8gdqlB
 pTXA==
X-Gm-Message-State: ACrzQf33mNeHAD6/bbYbWxBs6Rm94QJikLYlBR/RA3hI4NGaS28LXo+7
 vKfxiL1VV++DRgqDO9TFXUvCvCGDKSXH9/fPOzlXjOXcTAeuEN2vw8T1xONuKLHSn5fyM8l2tjx
 O/VSRk2eJXwOqX6ecjQHddiK06UhdNdlb5r3r0wzbgIIXSjR2psV9wd7SlDU5H3JoRpA=
X-Received: by 2002:a17:906:8a79:b0:78d:9c52:2196 with SMTP id
 hy25-20020a1709068a7900b0078d9c522196mr2480913ejc.328.1666099958630; 
 Tue, 18 Oct 2022 06:32:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NpsN7rXbg/tvnvZ9eIB/4DKqHHAd4zHCzf8lTtXQ6sn3LCgibfgdml14SxdxxwjJ02csYOg==
X-Received: by 2002:a17:906:8a79:b0:78d:9c52:2196 with SMTP id
 hy25-20020a1709068a7900b0078d9c522196mr2480880ejc.328.1666099958153; 
 Tue, 18 Oct 2022 06:32:38 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a056402045600b0044e01e2533asm8915359edw.43.2022.10.18.06.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 35/53] target/i386: reimplement 0x0f 0x60-0x6f, add AVX
Date: Tue, 18 Oct 2022 15:30:24 +0200
Message-Id: <20221018133042.856368-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index dc04aa9cbb..8a749f33fd 100644
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
index e2c01af02d..5133b8c23d 100644
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
@@ -4764,7 +4781,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


