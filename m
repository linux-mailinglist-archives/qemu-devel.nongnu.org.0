Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AEC5BF007
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:23:14 +0200 (CEST)
Received: from localhost ([::1]:40526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oale3-0004eR-UY
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0N-0006T4-Pv
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0K-0002Ea-UT
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sDJqAb6a5pfeDt1eLTOtA+KyzkZgubtGC2La834bVzs=;
 b=OqhGL4HM6n38NZWd597bNIqvGPG80MjrAbjbTCkahuKxrgS8tO2ewsM+Q4fnRBzjGIqSpk
 uEiL18qouEqi0k+CvVIscRbHCpOYZ7sxldjRAnYizTGXISVRzLca50FiViQ/C+OmoVeFCA
 x+mOAZlO4wUCDKIMUaXSbgjqs94n6Us=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-482-6a0VzYeEMiOID2vhio1_DA-1; Tue, 20 Sep 2022 13:25:51 -0400
X-MC-Unique: 6a0VzYeEMiOID2vhio1_DA-1
Received: by mail-ed1-f72.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so2348247eda.19
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sDJqAb6a5pfeDt1eLTOtA+KyzkZgubtGC2La834bVzs=;
 b=lRHziFopXgP6c4F/ZEM0uFi11QycJEAd1mwT+02pRYAR/QhPFyUC3NK8vHpc92wXmI
 Tdsa8loavLpt82ruvovYwFnYsiUe4mhrEVHFtiAr82Q52vWNbRSEAEVKL5Zf76hYViMK
 y8kGJvT+gScldQy7hr7Cegei8ubCnac/D1700pJOTG3gGu9lbv1DFJPrcqT67Rz9gNyr
 WVxkRF/gkyay+Pf6yYytIBEQVR1k77ACbJPBq/VrgvPZsYMDQh+0vGUt20Lv4yup5Qr7
 auTj88arw6EBy8QJ7NKyvcxhEV5mRPYnsChECc5sH0BSg413eTp8uaBCLsVKw0JYfEe/
 tRzQ==
X-Gm-Message-State: ACrzQf1PazTLAVwebiuPnUDPS4tvUU/Nnxl4fMfztzfHOVHWw4oQkDt3
 jJv/8BVFqYBGpeAI+as2pQFhek5xDXjZ2Fg75Xhy2FxjIwv9quLkMcZxCZO0CbSNLU2T8X/BRdU
 0KBo/zny0L1wGlu0MBnxj6XRhxaolCFeCA2/fjQhgQytPDaHS2nv8vWiJDpK3rK1ZWho=
X-Received: by 2002:a17:907:1c29:b0:77d:89d8:f7b2 with SMTP id
 nc41-20020a1709071c2900b0077d89d8f7b2mr17976136ejc.639.1663694749402; 
 Tue, 20 Sep 2022 10:25:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6k1qRDueA9LGkBUOxgfB5BYckE8BWZ08ZKEfF2+2OIORLI/IVx4eQD5bs4KPi8ck1EYJmLSA==
X-Received: by 2002:a17:907:1c29:b0:77d:89d8:f7b2 with SMTP id
 nc41-20020a1709071c2900b0077d89d8f7b2mr17976098ejc.639.1663694748756; 
 Tue, 20 Sep 2022 10:25:48 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a17090632c900b0076f08f6b563sm188160ejk.65.2022.09.20.10.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 26/37] target/i386: reimplement 0x0f 0x3a, add AVX
Date: Tue, 20 Sep 2022 19:24:56 +0200
Message-Id: <20220920172507.95568-27-pbonzini@redhat.com>
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

The more complicated operations here are insertions and extractions.
Otherwise, there are just more entries than usual because the PS/PD/SS/SD
variations are encoded in the opcode rater than in the prefixes.

These three-byte opcodes also include AVX new instructions, whose
implementation in the helpers was originally done by Paul Brook
<paul@nowt.org>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h            |  95 ++++++++++
 target/i386/ops_sse_header.h     |  10 +
 target/i386/tcg/decode-new.c.inc |  75 ++++++++
 target/i386/tcg/emit.c.inc       | 309 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |   3 +-
 5 files changed, 491 insertions(+), 1 deletion(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index e7830ff277..cb8909adcf 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2381,6 +2381,101 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #endif
 #endif
 
+#if SHIFT >= 1
+void glue(helper_vpermilpd_imm, SUFFIX)(Reg *d, Reg *s, uint32_t order)
+{
+    uint64_t r0, r1;
+    int i;
+
+    for (i = 0; i < 1 << SHIFT; i += 2) {
+        r0 = s->Q(i + ((order >> 0) & 1));
+        r1 = s->Q(i + ((order >> 1) & 1));
+        d->Q(i) = r0;
+        d->Q(i+1) = r1;
+
+        order >>= 2;
+    }
+}
+
+void glue(helper_vpermilps_imm, SUFFIX)(Reg *d, Reg *s, uint32_t order)
+{
+    uint32_t r0, r1, r2, r3;
+    int i;
+
+    for (i = 0; i < 2 << SHIFT; i += 4) {
+        r0 = s->L(i + ((order >> 0) & 3));
+        r1 = s->L(i + ((order >> 2) & 3));
+        r2 = s->L(i + ((order >> 4) & 3));
+        r3 = s->L(i + ((order >> 6) & 3));
+        d->L(i) = r0;
+        d->L(i+1) = r1;
+        d->L(i+2) = r2;
+        d->L(i+3) = r3;
+    }
+}
+
+#if SHIFT >= 2
+void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
+{
+    uint64_t r0, r1, r2, r3;
+
+    switch (order & 3) {
+    case 0:
+        r0 = v->Q(0);
+        r1 = v->Q(1);
+        break;
+    case 1:
+        r0 = v->Q(2);
+        r1 = v->Q(3);
+        break;
+    case 2:
+        r0 = s->Q(0);
+        r1 = s->Q(1);
+        break;
+    case 3:
+        r0 = s->Q(2);
+        r1 = s->Q(3);
+        break;
+    }
+    switch ((order >> 4) & 3) {
+    case 0:
+        r2 = v->Q(0);
+        r3 = v->Q(1);
+        break;
+    case 1:
+        r2 = v->Q(2);
+        r3 = v->Q(3);
+        break;
+    case 2:
+        r2 = s->Q(0);
+        r3 = s->Q(1);
+        break;
+    case 3:
+        r2 = s->Q(2);
+        r3 = s->Q(3);
+        break;
+    }
+    d->Q(0) = r0;
+    d->Q(1) = r1;
+    d->Q(2) = r2;
+    d->Q(3) = r3;
+}
+
+void helper_vpermq_ymm(Reg *d, Reg *s, uint32_t order)
+{
+    uint64_t r0, r1, r2, r3;
+    r0 = s->Q(order & 3);
+    r1 = s->Q((order >> 2) & 3);
+    r2 = s->Q((order >> 4) & 3);
+    r3 = s->Q((order >> 6) & 3);
+    d->Q(0) = r0;
+    d->Q(1) = r1;
+    d->Q(2) = r2;
+    d->Q(3) = r3;
+}
+#endif
+#endif
+
 #undef SSE_HELPER_S
 
 #undef LANE_WIDTH
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 98178be148..1afc4ff6a1 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -411,6 +411,16 @@ DEF_HELPER_4(glue(aeskeygenassist, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_5(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
 
+/* AVX helpers */
+#if SHIFT >= 1
+DEF_HELPER_3(glue(vpermilpd_imm, SUFFIX), void, Reg, Reg, i32)
+DEF_HELPER_3(glue(vpermilps_imm, SUFFIX), void, Reg, Reg, i32)
+#if SHIFT == 2
+DEF_HELPER_4(vpermdq_ymm, void, Reg, Reg, Reg, i32)
+DEF_HELPER_3(vpermq_ymm, void, Reg, Reg, i32)
+#endif
+#endif
+
 #undef SHIFT
 #undef Reg
 #undef SUFFIX
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 0bc41b01c9..a1f0d7a24c 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -375,7 +375,78 @@ static void decode_0F38(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     }
 }
 
+static void decode_VINSERTPS(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry
+        vinsertps_reg = X86_OP_ENTRY4(VINSERTPS_r, V,dq, H,dq, U,dq, vex5 cpuid(SSE41) p_66),
+        vinsertps_mem = X86_OP_ENTRY4(VINSERTPS_m, V,dq, H,dq, M,d,  vex5 cpuid(SSE41) p_66);
+
+    int modrm = get_modrm(s, env);
+    *entry = (modrm >> 6) == 3 ? vinsertps_reg : vinsertps_mem;
+}
+
 static const X86OpEntry opcodes_0F3A[256] = {
+    /*
+     * These are VEX-only, but incorrectly listed in the manual as exception type 4.
+     * Also the "qq" instructions are sometimes omitted by Table 2-17, but are VEX256
+     * only.
+     */
+    [0x00] = X86_OP_ENTRY3(VPERMQ,      V,qq, W,qq, I,b,  vex6 cpuid(AVX2) p_66),
+    [0x01] = X86_OP_ENTRY3(VPERMQ,      V,qq, W,qq, I,b,  vex6 cpuid(AVX2) p_66), /* VPERMPD */
+    [0x02] = X86_OP_ENTRY4(VBLENDPS,    V,x,  H,x,  W,x,  vex6 cpuid(AVX2) p_66), /* VPBLENDD */
+    [0x04] = X86_OP_ENTRY3(VPERMILPS_i, V,x,  W,x,  I,b,  vex6 cpuid(AVX) p_66),
+    [0x05] = X86_OP_ENTRY3(VPERMILPD_i, V,x,  W,x,  I,b,  vex6 cpuid(AVX) p_66),
+    [0x06] = X86_OP_ENTRY4(VPERM2x128,  V,qq, H,qq, W,qq, vex6 cpuid(AVX) p_66),
+
+    [0x14] = X86_OP_ENTRY3(PEXTRB,     E,b,  V,dq, I,b,  vex5 cpuid(SSE41) zext0 p_66),
+    [0x15] = X86_OP_ENTRY3(PEXTRW,     E,w,  V,dq, I,b,  vex5 cpuid(SSE41) zext0 p_66),
+    [0x16] = X86_OP_ENTRY3(PEXTR,      E,y,  V,dq, I,b,  vex5 cpuid(SSE41) p_66),
+    [0x17] = X86_OP_ENTRY3(VEXTRACTPS, E,d,  V,dq, I,b,  vex5 cpuid(SSE41) p_66),
+
+    [0x20] = X86_OP_ENTRY4(PINSRB,     V,dq, H,dq, E,b,  vex5 cpuid(SSE41) zext2 p_66),
+    [0x21] = X86_OP_GROUP0(VINSERTPS),
+    [0x22] = X86_OP_ENTRY4(PINSR,      V,dq, H,dq, E,y,  vex5 cpuid(SSE41) p_66),
+
+    [0x40] = X86_OP_ENTRY4(VDDPS,      V,x,  H,x,  W,x,  vex2 cpuid(SSE41) p_66),
+    [0x41] = X86_OP_ENTRY4(VDDPD,      V,dq, H,dq, W,dq, vex2 cpuid(SSE41) p_66),
+    [0x42] = X86_OP_ENTRY4(VMPSADBW,   V,x,  H,x,  W,x,  vex2 cpuid(SSE41) avx2_256 p_66),
+    [0x44] = X86_OP_ENTRY4(PCLMULQDQ,  V,dq, H,dq, W,dq, vex4 cpuid(PCLMULQDQ) p_66),
+    [0x46] = X86_OP_ENTRY4(VPERM2x128, V,qq, H,qq, W,qq, vex6 cpuid(AVX2) p_66),
+
+    [0x60] = X86_OP_ENTRY4(PCMPESTRM,  None,None, V,dq, W,dq, vex4_unal cpuid(SSE42) p_66),
+    [0x61] = X86_OP_ENTRY4(PCMPESTRI,  None,None, V,dq, W,dq, vex4_unal cpuid(SSE42) p_66),
+    [0x62] = X86_OP_ENTRY4(PCMPISTRM,  None,None, V,dq, W,dq, vex4_unal cpuid(SSE42) p_66),
+    [0x63] = X86_OP_ENTRY4(PCMPISTRI,  None,None, V,dq, W,dq, vex4_unal cpuid(SSE42) p_66),
+
+    [0x08] = X86_OP_ENTRY3(VROUNDPS,   V,x,  W,x,  I,b,  vex2 cpuid(SSE41) p_66),
+    [0x09] = X86_OP_ENTRY3(VROUNDPD,   V,x,  W,x,  I,b,  vex2 cpuid(SSE41) p_66),
+    /*
+     * Not listed as four operand in the manual.  Also writes and reads 128-bits
+     * from the first two operands due to the V operand picking higher entries of
+     * the H operand; the "Vss,Hss,Wss" description from the manual is incorrect.
+     * For other unary operations such as VSQRTSx this is hidden by the "REPScalar"
+     * value of vex_special, because the table lists the operand types of VSQRTPx.
+     */
+    [0x0a] = X86_OP_ENTRY4(VROUNDSS,   V,x,  H,x, W,ss, vex3 cpuid(SSE41) p_66),
+    [0x0b] = X86_OP_ENTRY4(VROUNDSD,   V,x,  H,x, W,sd, vex3 cpuid(SSE41) p_66),
+    [0x0c] = X86_OP_ENTRY4(VBLENDPS,   V,x,  H,x,  W,x,  vex4 cpuid(SSE41) p_66),
+    [0x0d] = X86_OP_ENTRY4(VBLENDPD,   V,x,  H,x,  W,x,  vex4 cpuid(SSE41) p_66),
+    [0x0e] = X86_OP_ENTRY4(VPBLENDW,   V,x,  H,x,  W,x,  vex4 cpuid(SSE41) p_66),
+    [0x0f] = X86_OP_ENTRY4(PALIGNR,    V,x,  H,x,  W,x,  vex4 cpuid(SSSE3) mmx p_00_66),
+
+    [0x18] = X86_OP_ENTRY4(VINSERTx128,  V,qq, H,qq, W,qq, vex6 cpuid(AVX) p_66),
+    [0x19] = X86_OP_ENTRY3(VEXTRACTx128, W,dq, V,qq, I,b,  vex6 cpuid(AVX) p_66),
+
+    [0x38] = X86_OP_ENTRY4(VINSERTx128,  V,qq, H,qq, W,qq, vex6 cpuid(AVX2) p_66),
+    [0x39] = X86_OP_ENTRY3(VEXTRACTx128, W,dq, V,qq, I,b,  vex6 cpuid(AVX2) p_66),
+
+    /* Listed incorrectly as type 4 */
+    [0x4a] = X86_OP_ENTRY4(VBLENDVPS, V,x,  H,x,  W,x,   vex6 cpuid(AVX) p_66),
+    [0x4b] = X86_OP_ENTRY4(VBLENDVPD, V,x,  H,x,  W,x,   vex6 cpuid(AVX) p_66),
+    [0x4c] = X86_OP_ENTRY4(VPBLENDVB, V,x,  H,x,  W,x,   vex6 cpuid(AVX) p_66 avx2_256),
+
+    [0xdf] = X86_OP_ENTRY3(VAESKEYGEN, V,dq, W,dq, I,b,  vex4 cpuid(AES) p_66),
+
     [0xF0] = X86_OP_ENTRY3(RORX, G,y, E,y, I,b, vex13 cpuid(BMI2) p_f2),
 };
 
@@ -916,6 +987,10 @@ static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_
         }
     }
     if (e->op3 != X86_TYPE_None) {
+        /*
+         * A couple instructions actually use the extra immediate byte for an Lx
+         * register operand; those are handled in the gen_* functions as one off.
+         */
         assert(e->op3 == X86_TYPE_I && e->s3 == X86_SIZE_b);
         s->rip_offset += 1;
     }
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 0e0783416b..c5e90111a9 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -473,6 +473,55 @@ HORIZONTAL_FP_SSE(VHADD, hadd)
 HORIZONTAL_FP_SSE(VHSUB, hsub)
 HORIZONTAL_FP_SSE(VADDSUB, addsub)
 
+static inline void gen_ternary_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                   int op3, SSEFunc_0_epppp xmm, SSEFunc_0_epppp ymm)
+{
+    SSEFunc_0_epppp fn = s->vex_l ? ymm : xmm;
+    TCGv_ptr ptr3 = tcg_temp_new_ptr();
+
+    /* The format of the fourth input is Lx */
+    tcg_gen_addi_ptr(ptr3, cpu_env, ZMM_OFFSET(op3));
+    fn(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, ptr3);
+    tcg_temp_free_ptr(ptr3);
+}
+#define TERNARY_SSE(uvname, lname)                                                 \
+static void gen_##uvname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_ternary_sse(s, env, decode, (uint8_t)decode->immediate >> 4,               \
+                    gen_helper_##lname##_xmm, gen_helper_##lname##_ymm);           \
+}
+TERNARY_SSE(VBLENDVPS, blendvps)
+TERNARY_SSE(VBLENDVPD, blendvpd)
+TERNARY_SSE(VPBLENDVB, pblendvb)
+
+static inline void gen_binary_imm_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                      SSEFunc_0_epppi xmm, SSEFunc_0_epppi ymm)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    if (!s->vex_l) {
+        xmm(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, imm);
+    } else {
+        ymm(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, imm);
+    }
+}
+
+#define BINARY_IMM_SSE(uname, lname)                                               \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_binary_imm_sse(s, env, decode,                                             \
+                       gen_helper_##lname##_xmm,                                   \
+                       gen_helper_##lname##_ymm);                                  \
+}
+
+BINARY_IMM_SSE(VBLENDPD,   blendpd)
+BINARY_IMM_SSE(VBLENDPS,   blendps)
+BINARY_IMM_SSE(VPBLENDW,   pblendw)
+BINARY_IMM_SSE(VDDPS,      dpps)
+#define gen_helper_dppd_ymm NULL
+BINARY_IMM_SSE(VDDPD,      dppd)
+BINARY_IMM_SSE(VMPSADBW,   mpsadbw)
+BINARY_IMM_SSE(PCLMULQDQ,  pclmulqdq)
+
 #define BINARY_INT_GVEC(uname, func, ...)                                          \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
 {                                                                                  \
@@ -638,6 +687,32 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
 UNARY_IMM_SSE(PSHUFD,     pshufd)
 UNARY_IMM_SSE(PSHUFHW,    pshufhw)
 UNARY_IMM_SSE(PSHUFLW,    pshuflw)
+#define gen_helper_vpermq_xmm NULL
+UNARY_IMM_SSE(VPERMQ,      vpermq)
+UNARY_IMM_SSE(VPERMILPS_i, vpermilps_imm)
+UNARY_IMM_SSE(VPERMILPD_i, vpermilpd_imm)
+
+static inline void gen_unary_imm_fp_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                        SSEFunc_0_eppi xmm, SSEFunc_0_eppi ymm)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    if (!s->vex_l) {
+        xmm(cpu_env, OP_PTR0, OP_PTR1, imm);
+    } else {
+        ymm(cpu_env, OP_PTR0, OP_PTR1, imm);
+    }
+}
+
+#define UNARY_IMM_FP_SSE(uname, lname)                                             \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_unary_imm_fp_sse(s, env, decode,                                           \
+                      gen_helper_##lname##_xmm,                                    \
+                      gen_helper_##lname##_ymm);                                   \
+}
+
+UNARY_IMM_FP_SSE(VROUNDPS,    roundps)
+UNARY_IMM_FP_SSE(VROUNDPD,    roundpd)
 
 static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
 {
@@ -958,6 +1033,18 @@ static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 
 }
 
+static void gen_PALIGNR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    if (!(s->prefix & PREFIX_DATA)) {
+        gen_helper_palignr_mmx(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, imm);
+    } else if (!s->vex_l) {
+        gen_helper_palignr_xmm(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, imm);
+    } else {
+        gen_helper_palignr_ymm(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, imm);
+    }
+}
+
 static void gen_PANDN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     int vec_len = vector_len(s, decode);
@@ -968,6 +1055,42 @@ static void gen_PANDN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
                       decode->op[1].offset, vec_len, vec_len);
 }
 
+static void gen_PCMPESTRI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    gen_helper_pcmpestri_xmm(cpu_env, OP_PTR1, OP_PTR2, imm);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
+static void gen_PCMPESTRM(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    gen_helper_pcmpestrm_xmm(cpu_env, OP_PTR1, OP_PTR2, imm);
+    set_cc_op(s, CC_OP_EFLAGS);
+    if ((s->prefix & PREFIX_VEX) && !s->vex_l) {
+        tcg_gen_gvec_dup_imm(MO_64, offsetof(CPUX86State, xmm_regs[0].ZMM_X(1)),
+                             16, 16, 0);
+    }
+}
+
+static void gen_PCMPISTRI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    gen_helper_pcmpistri_xmm(cpu_env, OP_PTR1, OP_PTR2, imm);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
+static void gen_PCMPISTRM(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    gen_helper_pcmpistrm_xmm(cpu_env, OP_PTR1, OP_PTR2, imm);
+    set_cc_op(s, CC_OP_EFLAGS);
+    if ((s->prefix & PREFIX_VEX) && !s->vex_l) {
+        tcg_gen_gvec_dup_imm(MO_64, offsetof(CPUX86State, xmm_regs[0].ZMM_X(1)),
+                             16, 16, 0);
+    }
+}
+
 static void gen_PDEP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[1].ot;
@@ -986,6 +1109,89 @@ static void gen_PEXT(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_pext(s->T0, s->T0, s->T1);
 }
 
+static inline void gen_pextr(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode, MemOp ot)
+{
+    int vec_len = vector_len(s, decode);
+    int mask = (vec_len >> ot) - 1;
+    int val = decode->immediate & mask;
+
+    switch (ot) {
+    case MO_8:
+        tcg_gen_ld8u_tl(s->T0, cpu_env, vector_elem_offset(&decode->op[1], ot, val));
+        break;
+    case MO_16:
+        tcg_gen_ld16u_tl(s->T0, cpu_env, vector_elem_offset(&decode->op[1], ot, val));
+        break;
+    case MO_32:
+#ifdef TARGET_X86_64
+        tcg_gen_ld32u_tl(s->T0, cpu_env, vector_elem_offset(&decode->op[1], ot, val));
+        break;
+    case MO_64:
+#endif
+        tcg_gen_ld_tl(s->T0, cpu_env, vector_elem_offset(&decode->op[1], ot, val));
+        break;
+    default:
+        abort();
+    }
+}
+
+static void gen_PEXTRB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_pextr(s, env, decode, MO_8);
+}
+
+static void gen_PEXTRW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_pextr(s, env, decode, MO_16);
+}
+
+static void gen_PEXTR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    gen_pextr(s, env, decode, ot);
+}
+
+static inline void gen_pinsr(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode, MemOp ot)
+{
+    int vec_len = vector_len(s, decode);
+    int mask = (vec_len >> ot) - 1;
+    int val = decode->immediate & mask;
+
+    if (decode->op[1].offset != decode->op[0].offset) {
+        assert(vec_len == 16);
+        gen_store_sse(s, decode, decode->op[1].offset);
+    }
+
+    switch (ot) {
+    case MO_8:
+        tcg_gen_st8_tl(s->T1, cpu_env, vector_elem_offset(&decode->op[0], ot, val));
+        break;
+    case MO_16:
+        tcg_gen_st16_tl(s->T1, cpu_env, vector_elem_offset(&decode->op[0], ot, val));
+        break;
+    case MO_32:
+#ifdef TARGET_X86_64
+        tcg_gen_st32_tl(s->T1, cpu_env, vector_elem_offset(&decode->op[0], ot, val));
+        break;
+    case MO_64:
+#endif
+        tcg_gen_st_tl(s->T1, cpu_env, vector_elem_offset(&decode->op[0], ot, val));
+        break;
+    default:
+        abort();
+    }
+}
+
+static void gen_PINSRB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_pinsr(s, env, decode, MO_8);
+}
+
+static void gen_PINSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_pinsr(s, env, decode, decode->op[2].ot);
+}
+
 static void gen_PMOVMSKB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     if (s->prefix & PREFIX_DATA) {
@@ -1194,6 +1400,13 @@ static void gen_SHRX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     tcg_gen_shr_tl(s->T0, s->T0, s->T1);
 }
 
+static void gen_VAESKEYGEN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    assert(!s->vex_l);
+    gen_helper_aeskeygenassist_xmm(cpu_env, OP_PTR0, OP_PTR1, imm);
+}
+
 static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_unary_fp_sse(s, env, decode,
@@ -1202,6 +1415,102 @@ static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
                      gen_helper_cvtsd2ss, gen_helper_cvtss2sd);
 }
 
+static void gen_VEXTRACTx128(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int mask = decode->immediate & 1;
+    int src_ofs = vector_elem_offset(&decode->op[1], MO_128, mask);
+    if (decode->op[0].has_ea) {
+        /* VEX-only instruction, no alignment requirements.  */
+        gen_sto_env_A0(s, src_ofs, false);
+    } else {
+        tcg_gen_gvec_mov(MO_64, decode->op[0].offset, src_ofs, 16, 16);
+    }
+}
+
+static void gen_VEXTRACTPS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_pextr(s, env, decode, MO_32);
+}
+
+static void gen_vinsertps(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int val = decode->immediate;
+    int dest_word = (val >> 4) & 3;
+    int new_mask = (val & 15) | (1 << dest_word);
+    int vec_len = 16;
+
+    assert(!s->vex_l);
+
+    if (new_mask == 15) {
+        /* All zeroes except possibly for the inserted element */
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else if (decode->op[1].offset != decode->op[0].offset) {
+        gen_store_sse(s, decode, decode->op[1].offset);
+    }
+
+    if (new_mask != (val & 15)) {
+        tcg_gen_st_i32(s->tmp2_i32, cpu_env,
+                       vector_elem_offset(&decode->op[0], MO_32, dest_word));
+    }
+
+    if (new_mask != 15) {
+        TCGv_i32 zero = tcg_constant_i32(0); /* float32_zero */
+        int i;
+        for (i = 0; i < 4; i++) {
+            if ((val >> i) & 1) {
+                tcg_gen_st_i32(zero, cpu_env,
+                               vector_elem_offset(&decode->op[0], MO_32, i));
+            }
+        }
+    }
+}
+
+static void gen_VINSERTPS_r(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int val = decode->immediate;
+    tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
+                   vector_elem_offset(&decode->op[2], MO_32, (val >> 6) & 3));
+    gen_vinsertps(s, env, decode);
+}
+
+static void gen_VINSERTPS_m(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0, s->mem_index, MO_LEUL);
+    gen_vinsertps(s, env, decode);
+}
+
+static void gen_VINSERTx128(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int mask = decode->immediate & 1;
+    tcg_gen_gvec_mov(MO_64,
+                     decode->op[0].offset + offsetof(YMMReg, YMM_X(mask)),
+                     decode->op[2].offset + offsetof(YMMReg, YMM_X(0)), 16, 16);
+    tcg_gen_gvec_mov(MO_64,
+                     decode->op[0].offset + offsetof(YMMReg, YMM_X(!mask)),
+                     decode->op[1].offset + offsetof(YMMReg, YMM_X(!mask)), 16, 16);
+}
+
+static void gen_VPERM2x128(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    assert(s->vex_l);
+    gen_helper_vpermdq_ymm(OP_PTR0, OP_PTR1, OP_PTR2, imm);
+}
+
+static void gen_VROUNDSD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    assert(!s->vex_l);
+    gen_helper_roundsd_xmm(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, imm);
+}
+
+static void gen_VROUNDSS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    assert(!s->vex_l);
+    gen_helper_roundss_xmm(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, imm);
+}
+
 static void gen_VZEROALL(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     TCGv_ptr ptr = tcg_temp_new_ptr();
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2366fd4211..302feeaaf6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4695,7 +4695,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         use_new &= b <= limit;
 #endif
         if (use_new &&
-            ((b >= 0x150 && b <= 0x17f) ||
+            (b == 0x13a ||
+             (b >= 0x150 && b <= 0x17f) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
-- 
2.37.2


