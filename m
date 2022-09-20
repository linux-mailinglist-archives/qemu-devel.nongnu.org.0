Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D290E5BF047
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:38:24 +0200 (CEST)
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalsl-0006w3-V4
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0T-0006ZZ-UC
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0R-0002Fc-B7
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/59JyXFay2hDfFk/6CL8NE8vmjr5IrSGvkbHsj6SXY=;
 b=MqPusRuP6LXyZcAUcEHs2YfRsJt+W0dHOjfpp7/gsrdTCrfGhoHb1aAz/ZgQZPhz4Wz+0Z
 htbuVc09UVPMq4u8kMHxFiGGFRIPCm+rTRZz4rM0u0sEYqmggg9GWYbHP7URSaDiAa73xT
 LuPeY2YW3pZGSR/bljer6zfo1AIZjd8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-_hROJYVON2S04bNMPTGbgA-1; Tue, 20 Sep 2022 13:25:57 -0400
X-MC-Unique: _hROJYVON2S04bNMPTGbgA-1
Received: by mail-ej1-f69.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso1771548ejb.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=k/59JyXFay2hDfFk/6CL8NE8vmjr5IrSGvkbHsj6SXY=;
 b=3cWWf+pvvL/P2O8J3nIWcG8eg1QT+zn5aienlib7q6b3FKfKlGh8v8TwT1W7rJZoE9
 Qf6y4fzQW8NjLGOCrdjFT5Zqng7XhlXZrrzOnxn4pK8KbUGP/mrxtFydsRRrTtjSy9zS
 gedKPKVKOVJrqsw3TSdPERPbuZb3fOA2S/hXHj6Gtp2AjIVWImuOPO5G47uT+WWzfxxy
 L+dcMnDegGSW1JcYChuL9pgT0ihBwegLCqbPpg2noHYwPaa70CHO+r6qp28uBnQH3Qa6
 VxjM3dPEQD4w6+ZcbywkRzyIGeVYqucmxtL/sn/qRxzuv+AphG/bg7/TVi+fqLxZw7Xh
 SDQQ==
X-Gm-Message-State: ACrzQf1lBbyT9WtvAjmrOacJCJjlzc5O4UOX3gIan2vJqn2ilOSpFXnD
 dRYIevoj/p8zRyhXuu8l8RtXfg0lEK8cqggAyom1xqbdnf5TP2UxlzG/TYM3MtUXWhYzH4pmG+2
 ji50eoZdCOK6pMJOEehuejkwMOGn5YVNqBIxL8xHNJTzzyBG9/1iRiZIQXn/Wda5rNB8=
X-Received: by 2002:a17:906:9bd4:b0:770:4efb:acbe with SMTP id
 de20-20020a1709069bd400b007704efbacbemr17959503ejc.436.1663694755503; 
 Tue, 20 Sep 2022 10:25:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6x1IBVn194IIxDXfwn2y5nMIMnlF2fD/n7EVUul9YLMmp3s7bdGLdtGs4pihWfDKHcZtjcsg==
X-Received: by 2002:a17:906:9bd4:b0:770:4efb:acbe with SMTP id
 de20-20020a1709069bd400b007704efbacbemr17959468ejc.436.1663694755025; 
 Tue, 20 Sep 2022 10:25:55 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170906328b00b007389c5a45f0sm151433ejw.148.2022.09.20.10.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 30/37] target/i386: reimplement 0x0f 0x10-0x17, add AVX
Date: Tue, 20 Sep 2022 19:25:00 +0200
Message-Id: <20220920172507.95568-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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

These are mostly moves, and yet are a total pain.  The main issue
is that:

1) some instructions are selected by mod==11 (register operand)
vs. mod=00/01/10 (memory operand)

2) stores to memory are two-operand operations, while the 3-register
and load-from-memory versions operate on the entire contents of the
destination; this makes it easier to separate the gen_* function for
the store case

3) it's inefficient to load into xmm_T0 only to move the value out
again, so the gen_* function for the load case is separated too

The manual also has various mistakes in the operands here, for example
the store case of MOVHPS operates on a 128-bit source (albeit discarding
the bottom 64 bits) and therefore should be Mq,Vdq rather than Mq,Vq.
Likewise for the destination and source of MOVHLPS.

VUNPCK?PS and VUNPCK?PD are the same as VUNPCK?DQ and VUNPCK?QDQ,
but encoded as prefixes rather than separate operands.  The helpers
can be reused however.

For MOVSLDUP, MOVSHDUP and MOVDDUP I chose to reimplement them as
helpers.  I named the helper for MOVDDUP "movdldup" in preparation
for possible future introduction of MOVDHDUP and to clarify the
similarity with MOVSLDUP.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h            |   7 ++
 target/i386/ops_sse_header.h     |   3 +
 target/i386/tcg/decode-new.c.inc | 126 ++++++++++++++++++++++++++++++
 target/i386/tcg/emit.c.inc       | 127 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |   1 +
 5 files changed, 264 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 104a53fda0..43b32edbfc 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1683,6 +1683,10 @@ void glue(helper_ptest, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     CC_SRC = (zf ? 0 : CC_Z) | (cf ? 0 : CC_C);
 }
 
+#define FMOVSLDUP(i) s->L((i) & ~1)
+#define FMOVSHDUP(i) s->L((i) | 1)
+#define FMOVDLDUP(i) s->Q((i) & ~1)
+
 #define SSE_HELPER_F(name, elem, num, F)                        \
     void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
     {                                                           \
@@ -1705,6 +1709,9 @@ SSE_HELPER_F(helper_pmovzxbq, Q, 1 << SHIFT, s->B)
 SSE_HELPER_F(helper_pmovzxwd, L, 2 << SHIFT, s->W)
 SSE_HELPER_F(helper_pmovzxwq, Q, 1 << SHIFT, s->W)
 SSE_HELPER_F(helper_pmovzxdq, Q, 1 << SHIFT, s->L)
+SSE_HELPER_F(helper_pmovsldup, L, 2 << SHIFT, FMOVSLDUP)
+SSE_HELPER_F(helper_pmovshdup, L, 2 << SHIFT, FMOVSHDUP)
+SSE_HELPER_F(helper_pmovdldup, Q, 1 << SHIFT, FMOVDLDUP)
 #endif
 
 void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index dd8dcebc23..00de6d69f1 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -355,6 +355,9 @@ DEF_HELPER_3(glue(pmovzxbq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxwd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxwq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxdq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(pmovsldup, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(pmovshdup, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(pmovdldup, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(pmuldq, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(pcmpeqq, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(packusdw, SUFFIX), void, env, Reg, Reg, Reg)
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 461921a98d..e0ddddcd9e 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -556,6 +556,122 @@ static void decode_0F3A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     *entry = opcodes_0F3A[*b];
 }
 
+/*
+ * There are some mistakes in the operands in the manual, and the load/store/register
+ * cases are easiest to keep separate, so the entries for 10-17 follow simplicity and
+ * efficiency of implementation rather than copying what the manual says.
+ *
+ * In particular:
+ *
+ * 1) "VMOVSS m32, xmm1" and "VMOVSD m64, xmm1" do not support VEX.vvvv != 1111b,
+ * but this is not mentioned in the tables.
+ *
+ * 2) MOVHLPS, MOVHPS, MOVHPD, MOVLPD, MOVLPS read the high quadword of one of their
+ * operands, which must therefore be dq; MOVLPD and MOVLPS also write the high
+ * quadword of the V operand.
+ */
+static void decode_0F10(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F10_reg[4] = {
+        X86_OP_ENTRY3(MOVDQ,   V,x,  None,None, W,x, vex4_unal), /* MOVUPS */
+        X86_OP_ENTRY3(MOVDQ,   V,x,  None,None, W,x, vex4_unal), /* MOVUPD */
+        X86_OP_ENTRY3(VMOVSS,  V,x,  H,x,       W,x, vex4),
+        X86_OP_ENTRY3(VMOVLPx, V,x,  H,x,       W,x, vex4), /* MOVSD */
+    };
+
+    static const X86OpEntry opcodes_0F10_mem[4] = {
+        X86_OP_ENTRY3(MOVDQ,      V,x,  None,None, W,x,  vex4_unal), /* MOVUPS */
+        X86_OP_ENTRY3(MOVDQ,      V,x,  None,None, W,x,  vex4_unal), /* MOVUPD */
+        X86_OP_ENTRY3(VMOVSS_ld,  V,x,  H,x,       M,ss, vex4),
+        X86_OP_ENTRY3(VMOVSD_ld,  V,x,  H,x,       M,sd, vex4),
+    };
+
+    if ((get_modrm(s, env) >> 6) == 3) {
+        *entry = *decode_by_prefix(s, opcodes_0F10_reg);
+    } else {
+        *entry = *decode_by_prefix(s, opcodes_0F10_mem);
+    }
+}
+
+static void decode_0F11(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F11_reg[4] = {
+        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVPS */
+        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVPD */
+        X86_OP_ENTRY3(VMOVSS,  W,x,  H,x,       V,x, vex4),
+        X86_OP_ENTRY3(VMOVLPx, W,x,  H,x,       V,q, vex4), /* MOVSD */
+    };
+
+    static const X86OpEntry opcodes_0F11_mem[4] = {
+        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVPS */
+        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVPD */
+        X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex4),
+        X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex4), /* MOVSD */
+    };
+
+    if ((get_modrm(s, env) >> 6) == 3) {
+        *entry = *decode_by_prefix(s, opcodes_0F11_reg);
+    } else {
+        *entry = *decode_by_prefix(s, opcodes_0F11_mem);
+    }
+}
+
+static void decode_0F12(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F12_mem[4] = {
+        /*
+         * Use dq for operand for compatibility with gen_MOVSD and
+         * to allow VEX128 only.
+         */
+        X86_OP_ENTRY3(VMOVLPx_ld, V,dq, H,dq,      M,q, vex4), /* MOVLPS */
+        X86_OP_ENTRY3(VMOVLPx_ld, V,dq, H,dq,      M,q, vex4), /* MOVLPD */
+        X86_OP_ENTRY3(VMOVSLDUP,  V,x,  None,None, W,x, vex4 cpuid(SSE3)),
+        X86_OP_ENTRY3(VMOVDDUP,   V,x,  None,None, WM,q, vex4 cpuid(SSE3)), /* qq if VEX.256 */
+    };
+    static const X86OpEntry opcodes_0F12_reg[4] = {
+        X86_OP_ENTRY3(VMOVHLPS,  V,dq, H,dq,       U,dq, vex4),
+        X86_OP_ENTRY3(VMOVLPx,   W,x,  H,x,        U,q,  vex4), /* MOVLPD */
+        X86_OP_ENTRY3(VMOVSLDUP, V,x,  None,None,  U,x,  vex4 cpuid(SSE3)),
+        X86_OP_ENTRY3(VMOVDDUP,  V,x,  None,None,  U,x,  vex4 cpuid(SSE3)),
+    };
+
+    if ((get_modrm(s, env) >> 6) == 3) {
+        *entry = *decode_by_prefix(s, opcodes_0F12_reg);
+    } else {
+        *entry = *decode_by_prefix(s, opcodes_0F12_mem);
+        if ((s->prefix & PREFIX_REPNZ) && s->vex_l) {
+            entry->s2 = X86_SIZE_qq;
+        }
+    }
+}
+
+static void decode_0F16(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F16_mem[4] = {
+        /*
+         * Operand 1 technically only reads the low 64 bits, but uses dq so that
+         * it is easier to check for op0 == op1 in an endianness-neutral manner.
+         */
+        X86_OP_ENTRY3(VMOVHPx_ld, V,dq, H,dq,      M,q, vex4), /* MOVHPS */
+        X86_OP_ENTRY3(VMOVHPx_ld, V,dq, H,dq,      M,q, vex4), /* MOVHPD */
+        X86_OP_ENTRY3(VMOVSHDUP,  V,x,  None,None, W,x, vex4 cpuid(SSE3)),
+        {},
+    };
+    static const X86OpEntry opcodes_0F16_reg[4] = {
+        /* Same as above, operand 1 could be Hq if it wasn't for big-endian.  */
+        X86_OP_ENTRY3(VMOVLHPS,  V,dq, H,dq,      U,q, vex4),
+        X86_OP_ENTRY3(VMOVHPx,   V,x,  H,x,       U,x, vex4), /* MOVHPD */
+        X86_OP_ENTRY3(VMOVSHDUP, V,x,  None,None, U,x, vex4 cpuid(SSE3)),
+        {},
+    };
+
+    if ((get_modrm(s, env) >> 6) == 3) {
+        *entry = *decode_by_prefix(s, opcodes_0F16_reg);
+    } else {
+        *entry = *decode_by_prefix(s, opcodes_0F16_mem);
+    }
+}
+
 static void decode_sse_unary(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     if (!(s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))) {
@@ -593,6 +709,16 @@ static void decode_0FE6(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 }
 
 static const X86OpEntry opcodes_0F[256] = {
+    [0x10] = X86_OP_GROUP0(0F10),
+    [0x11] = X86_OP_GROUP0(0F11),
+    [0x12] = X86_OP_GROUP0(0F12),
+    [0x13] = X86_OP_ENTRY3(VMOVLPx_st,  M,q, None,None, V,q,  vex4 p_00_66),
+    [0x14] = X86_OP_ENTRY3(VUNPCKLPx,   V,x, H,x, W,x,        vex4 p_00_66),
+    [0x15] = X86_OP_ENTRY3(VUNPCKHPx,   V,x, H,x, W,x,        vex4 p_00_66),
+    [0x16] = X86_OP_GROUP0(0F16),
+    /* Incorrectly listed as Mq,Vq in the manual */
+    [0x17] = X86_OP_ENTRY3(VMOVHPx_st,  M,q, None,None, V,dq, vex4 p_00_66),
+
     [0x50] = X86_OP_ENTRY3(MOVMSK,     G,y, None,None, U,x, vex7 p_00_66),
     [0x51] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
     [0x52] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex5 p_00_f3),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 71b8fcbe24..381fdf0ae6 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -394,6 +394,7 @@ static inline void gen_fp_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn
         gen_illegal_opcode(s);
     }
 }
+
 #define FP_SSE(uname, lname)                                                       \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
 {                                                                                  \
@@ -412,6 +413,20 @@ FP_SSE(VMIN, min)
 FP_SSE(VDIV, div)
 FP_SSE(VMAX, max)
 
+#define FP_UNPACK_SSE(uname, lname)                                                \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    /* PS maps to the DQ integer instruction, PD maps to QDQ.  */                  \
+    gen_fp_sse(s, env, decode,                                                     \
+               gen_helper_##lname##qdq_xmm,                                        \
+               gen_helper_##lname##dq_xmm,                                         \
+               gen_helper_##lname##qdq_ymm,                                        \
+               gen_helper_##lname##dq_ymm,                                         \
+               NULL, NULL);                                                        \
+}
+FP_UNPACK_SSE(VUNPCKLPx, punpckl)
+FP_UNPACK_SSE(VUNPCKHPx, punpckh)
+
 /*
  * 00 = v*ps Vps, Wpd
  * f3 = v*ss Vss, Wps
@@ -749,6 +764,10 @@ UNARY_INT_SSE(VPMOVZXWD,    pmovzxwd)
 UNARY_INT_SSE(VPMOVZXWQ,    pmovzxwq)
 UNARY_INT_SSE(VPMOVZXDQ,    pmovzxdq)
 
+UNARY_INT_SSE(VMOVSLDUP,    pmovsldup)
+UNARY_INT_SSE(VMOVSHDUP,    pmovshdup)
+UNARY_INT_SSE(VMOVDDUP,     pmovdldup)
+
 UNARY_INT_SSE(VCVTDQ2PD, cvtdq2pd)
 UNARY_INT_SSE(VCVTPD2DQ, cvtpd2dq)
 UNARY_INT_SSE(VCVTTPD2DQ, cvttpd2dq)
@@ -1816,6 +1835,114 @@ static void gen_VMASKMOVPS_st(DisasContext *s, CPUX86State *env, X86DecodedInsn
     gen_maskmov(s, env, decode, gen_helper_vpmaskmovd_st_xmm, gen_helper_vpmaskmovd_st_ymm);
 }
 
+static void gen_VMOVHPx_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_ldq_env_A0(s, decode->op[0].offset + offsetof(XMMReg, XMM_Q(1)));
+    if (decode->op[0].offset != decode->op[1].offset) {
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset + offsetof(XMMReg, XMM_Q(0)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
+    }
+}
+
+static void gen_VMOVHPx_st(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_stq_env_A0(s, decode->op[2].offset + offsetof(XMMReg, XMM_Q(1)));
+}
+
+static void gen_VMOVHPx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (decode->op[0].offset != decode->op[2].offset) {
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset + offsetof(XMMReg, XMM_Q(1)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(1)));
+    }
+    if (decode->op[0].offset != decode->op[1].offset) {
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset + offsetof(XMMReg, XMM_Q(0)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
+    }
+}
+
+static void gen_VMOVHLPS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset + offsetof(XMMReg, XMM_Q(1)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
+    if (decode->op[0].offset != decode->op[1].offset) {
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset + offsetof(XMMReg, XMM_Q(1)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(1)));
+    }
+}
+
+static void gen_VMOVLHPS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(1)));
+    if (decode->op[0].offset != decode->op[1].offset) {
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset + offsetof(XMMReg, XMM_Q(0)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
+    }
+}
+
+/*
+ * Note that MOVLPx supports 256-bit operation unlike MOVHLPx, MOVLHPx, MOXHPx.
+ * Use a gvec move to move everything above the bottom 64 bits.
+ */
+
+static void gen_VMOVLPx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset + offsetof(XMMReg, XMM_Q(0)));
+    tcg_gen_gvec_mov(MO_64, decode->op[0].offset, decode->op[1].offset, vec_len, vec_len);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
+}
+
+static void gen_VMOVLPx_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
+    tcg_gen_gvec_mov(MO_64, decode->op[0].offset, decode->op[1].offset, vec_len, vec_len);
+    tcg_gen_st_i64(s->tmp1_i64, OP_PTR0, offsetof(ZMMReg, ZMM_Q(0)));
+}
+
+static void gen_VMOVLPx_st(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, OP_PTR2, offsetof(ZMMReg, ZMM_Q(0)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
+}
+
+static void gen_VMOVSD_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv zero = tcg_constant_i64(0);
+
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
+    tcg_gen_st_i64(zero, OP_PTR0, offsetof(ZMMReg, ZMM_Q(1)));
+    tcg_gen_st_i64(s->tmp1_i64, OP_PTR0, offsetof(ZMMReg, ZMM_Q(0)));
+}
+
+static void gen_VMOVSS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    tcg_gen_ld_i32(s->tmp2_i32, OP_PTR2, offsetof(ZMMReg, ZMM_L(0)));
+    tcg_gen_gvec_mov(MO_64, decode->op[0].offset, decode->op[1].offset, vec_len, vec_len);
+    tcg_gen_st_i32(s->tmp2_i32, OP_PTR0, offsetof(ZMMReg, ZMM_L(0)));
+}
+
+static void gen_VMOVSS_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0, s->mem_index, MO_LEUL);
+    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    tcg_gen_st_i32(s->tmp2_i32, OP_PTR0, offsetof(ZMMReg, ZMM_L(0)));
+}
+
+static void gen_VMOVSS_st(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_ld_i32(s->tmp2_i32, OP_PTR2, offsetof(ZMMReg, ZMM_L(0)));
+    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0, s->mem_index, MO_LEUL);
+}
+
 static void gen_VPMASKMOV_st(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     if (s->rex_w) {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index eb7a4d0e4d..f61be8f113 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4696,6 +4696,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         if (use_new &&
             (b == 0x138 || b == 0x13a ||
+             (b >= 0x110 && b <= 0x117) ||
              (b >= 0x150 && b <= 0x17f) ||
              b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
-- 
2.37.2


