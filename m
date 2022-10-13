Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C475FE4F0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:06:27 +0200 (CEST)
Received: from localhost ([::1]:49138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6LR-0005tC-Sv
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63x-0002ru-Qw
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63v-0005KK-Dh
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wn63iYdBRq9pBwv9POO1bDlRoFDRvcGO2A2Toa6E3zM=;
 b=CEVQtTJh+awYB+Ni5Io9XDORUQEyXLDsOwABZdh8nuQxxAWtH2JPn4PMVI/YPQa9Rods1N
 6Uu9rTpSRcqcLw3vvle/Wx/qxfNwnP+VEzh3/5Ax9ZqS68Zk9bX6qYg8wiMCQdYLaQsay2
 KqziIfkZsZXrNo82FucsarTfd6XqKB8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-TIaobXwKNtCjkGu0Xw2l6Q-1; Thu, 13 Oct 2022 17:48:17 -0400
X-MC-Unique: TIaobXwKNtCjkGu0Xw2l6Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 w1-20020a056402268100b0045d06ea5575so1038081edd.6
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wn63iYdBRq9pBwv9POO1bDlRoFDRvcGO2A2Toa6E3zM=;
 b=an22HaOclVDF0NGcou0YQ9YvGC/b9sgT3nG69dKExdV6khReFcZ510fn1EwyHUaGk7
 4iyEvoVEE1NB5+MmaUsKmB4iFKhJMvwxB+czZTvUBp6t0lBvbZj/3TpbPCKQ+68JK9+E
 c6wXrtAdkt2CGJb0b00NfU0+sTCqm6lDZkxeGwVYOFVV1nmIHGzn2i17esdgRbAtj0oF
 KTF9g/5VMeNVSuepQSsJUNbijKVA3UQ3xO4ftz0j7IKgd1dWikTJZXSrKL1sqOjX8+bz
 xGpu5Xh8a3Eacj3Q4OZYSRdaCKGra/sdsMeNGMdcjhw9V+wW92vifAo8/gG4BnTuHm3s
 fXNg==
X-Gm-Message-State: ACrzQf1zEIXP8HkZf50XlPbFp6NKvN47JMcit96aM63rYaVD083Xjw/b
 Cah2U7yUe0PhX+1XTR+lrFIikrActHZDcg9H2lB/Uz1d9ZBUr4udJvwrqF7+O7Ll5BIQgJ+ZeKx
 jn5r7T49sDJ89kraWPdo369Am6VHnG2toFbvIi3wkayCAPZHdbvOcNEHmCMsmeE0tbyo=
X-Received: by 2002:a17:907:7b95:b0:731:113a:d7a2 with SMTP id
 ne21-20020a1709077b9500b00731113ad7a2mr1259846ejc.377.1665697695694; 
 Thu, 13 Oct 2022 14:48:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7suw2qCxrjm7RZsAhWjt9Bjj0k3Qxy/yh5Y7Oj/b1vt16FXaw7VveHSw/ugjy/fZ3Kwxpd+Q==
X-Received: by 2002:a17:907:7b95:b0:731:113a:d7a2 with SMTP id
 ne21-20020a1709077b9500b00731113ad7a2mr1259818ejc.377.1665697695112; 
 Thu, 13 Oct 2022 14:48:15 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a1709067d8200b007815c3e95f6sm438856ejo.146.2022.10.13.14.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:48:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 28/35] target/i386: reimplement 0x0f 0x10-0x17, add AVX
Date: Thu, 13 Oct 2022 23:46:44 +0200
Message-Id: <20221013214651.672114-29-pbonzini@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index a5b4a98ba0..fae1fd89d2 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -563,6 +563,122 @@ static void decode_0F3A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
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
@@ -600,6 +716,16 @@ static void decode_0FE6(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
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
index d4534c3f39..50c5c9268e 100644
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
@@ -1813,6 +1832,114 @@ static void gen_VMASKMOVPS_st(DisasContext *s, CPUX86State *env, X86DecodedInsn
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
+    TCGv_i64 zero = tcg_constant_i64(0);
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
     if (REX_W(s)) {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 04b51d7477..1e4732da1e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4775,6 +4775,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         if (use_new &&
             (b == 0x138 || b == 0x13a ||
+             (b >= 0x110 && b <= 0x117) ||
              (b >= 0x150 && b <= 0x17f) ||
              b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
-- 
2.37.3


