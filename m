Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED85B5207
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:43:50 +0200 (CEST)
Received: from localhost ([::1]:35394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWc6-0006sk-QD
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1L-0001Ki-4S
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1I-0007MO-8M
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVLfn8FkZ0VcBJC3suTAwrnb6C5HFPcZMGzf+IzVQYI=;
 b=V3unoRwKdJ2A9sl942eALSRrsJQfW82kxAfIqj3rNfrzJFJyMNkoxoDhz8PQPVmabI3g+C
 fAmsgXHKpKbj009ZqILRiZG1yR51uSkQ/f8prb2+m7FdyzYm2etpeVUFklyS+xNnULrsQa
 gtuh31TLQr6wNbnJT9I+nKVXs3dMFlg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-NmEniMP0P6-C9IUCEcslVA-1; Sun, 11 Sep 2022 19:05:42 -0400
X-MC-Unique: NmEniMP0P6-C9IUCEcslVA-1
Received: by mail-ed1-f72.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso5054244edc.21
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RVLfn8FkZ0VcBJC3suTAwrnb6C5HFPcZMGzf+IzVQYI=;
 b=GaU1Z/wA39EGi8ss359OdglgMPT34mAmksS5Owd/A9BSZgEr6e8Oy+UFxuz5WJcIo4
 PXwYg7wLV+uZvh5uUEBYkQkFaJDUlQPjBdXB6HPH1Sk8E8Yfwk0Ww+RozCfkaTZxSCwM
 wiX/o97FZoDZ25khF8ncLwTO2ahqIGvO1oie+BF2unvEXfOw1OqwM1blCx5J2Y3zBPBe
 U1QwXhg9t1YbTDhkrdqZCprovTpN/SZzusqeC55XHrTZagR9dGD1aa7JzB2BvEgGlE/H
 wD6UXWKIAY2hE4Mo0Wjkh1Lq9fBwA1DATE7uc9K3STFS8ShW7C5WP19MHU1GBLo2eF2B
 EIKg==
X-Gm-Message-State: ACgBeo2kN+xcYyx4LRYvVDpQSiFvCVX1+tNe/rKDfo9ivhLn9sUOnKKd
 x3BwwLybaF/KQmYaunSLbUvH0fXc3WqtFoFDrB9jxSdTR7AWiIPKX0sNLwZ0S4MQwR8CNeHhRjC
 sx773CDJ76tKFHsLSb0B0dIy6/m4zWeC5ybuHAtWs/hU1TdzNvdU725RoFtnHat2sXh4=
X-Received: by 2002:a05:6402:5168:b0:44e:9ca8:bf6 with SMTP id
 d8-20020a056402516800b0044e9ca80bf6mr20081283ede.384.1662937540553; 
 Sun, 11 Sep 2022 16:05:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7gXN8VfvbfwLrKcqiVtB05W67P3/gQC8sd+DSf7BbFdStYmGfWxE3Yibl8FIg2SdUvW9ckkQ==
X-Received: by 2002:a05:6402:5168:b0:44e:9ca8:bf6 with SMTP id
 d8-20020a056402516800b0044e9ca80bf6mr20081262ede.384.1662937539902; 
 Sun, 11 Sep 2022 16:05:39 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 kb8-20020a170907924800b00777d41ba812sm3459180ejb.113.2022.09.11.16.05.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/37] target/i386: reimplement 0x0f 0x3a, add AVX
Date: Mon, 12 Sep 2022 01:04:06 +0200
Message-Id: <20220911230418.340941-27-pbonzini@redhat.com>
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

The more complicated operations here are insertions and extractions.
Otherwise, there are just more entries than usual because the PS/PD/SS/SD
variations are encoded in the opcode rater than in the prefixes.

These three-byte opcodes also include AVX new instructions, whose
implementation in the helpers was originally done by Paul Brook
<paul@nowt.org>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h            |  95 +++++++++
 target/i386/ops_sse_header.h     |  10 +
 target/i386/tcg/decode-new.c.inc |  75 +++++++
 target/i386/tcg/emit.c.inc       | 323 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |   3 +-
 5 files changed, 505 insertions(+), 1 deletion(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 4f72164c0f..7eba1cf0f1 100644
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
index 4041816945..6b70d90734 100644
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
index e9a9981a7f..e7b406ff80 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -328,7 +328,78 @@ static void decode_0F38(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
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
 
@@ -839,6 +910,10 @@ static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_
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
index c90f933093..dbf2c05e16 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -405,6 +405,56 @@ HORIZONTAL_FP_SSE(VHADD, hadd)
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
+    fn(cpu_env, s->ptr0, s->ptr1, s->ptr2, ptr3);
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
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    if (!s->vex_l) {
+        xmm(cpu_env, s->ptr0, s->ptr1, s->ptr2, imm);
+    } else {
+        ymm(cpu_env, s->ptr0, s->ptr1, s->ptr2, imm);
+    }
+    tcg_temp_free_i32(imm);
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
 /*
  * 00 = p*  Pq, Qq (if mmx not NULL; no VEX)
  * 66 = vp* Vx, Hx, Wx
@@ -517,6 +567,33 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
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
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    if (!s->vex_l) {
+        xmm(cpu_env, s->ptr0, s->ptr1, imm);
+    } else {
+        ymm(cpu_env, s->ptr0, s->ptr1, imm);
+    }
+    tcg_temp_free_i32(imm);
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
@@ -874,6 +951,19 @@ static void gen_PADDQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
                      decode->op[2].offset, vec_len, vec_len);
 }
 
+static void gen_PALIGNR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    if (!(s->prefix & PREFIX_DATA)) {
+        gen_helper_palignr_mmx(cpu_env, s->ptr0, s->ptr1, s->ptr2, imm);
+    } else if (!s->vex_l) {
+        gen_helper_palignr_xmm(cpu_env, s->ptr0, s->ptr1, s->ptr2, imm);
+    } else {
+        gen_helper_palignr_ymm(cpu_env, s->ptr0, s->ptr1, s->ptr2, imm);
+    }
+    tcg_temp_free_i32(imm);
+}
+
 static void gen_PAND(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     int vec_len = sse_vec_len(s, decode);
@@ -919,6 +1009,46 @@ static void gen_PCMPEQD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
                      decode->op[2].offset, vec_len, vec_len);
 }
 
+static void gen_PCMPESTRI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    gen_helper_pcmpestri_xmm(cpu_env, s->ptr1, s->ptr2, imm);
+    tcg_temp_free_i32(imm);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
+static void gen_PCMPESTRM(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    gen_helper_pcmpestrm_xmm(cpu_env, s->ptr1, s->ptr2, imm);
+    tcg_temp_free_i32(imm);
+    set_cc_op(s, CC_OP_EFLAGS);
+    if ((s->prefix & PREFIX_VEX) && !s->vex_l) {
+        tcg_gen_gvec_dup_imm(MO_64, offsetof(CPUX86State, xmm_regs[0].ZMM_X(1)),
+                             16, 16, 0);
+    }
+}
+
+static void gen_PCMPISTRI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    gen_helper_pcmpistri_xmm(cpu_env, s->ptr1, s->ptr2, imm);
+    tcg_temp_free_i32(imm);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
+static void gen_PCMPISTRM(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    gen_helper_pcmpistrm_xmm(cpu_env, s->ptr1, s->ptr2, imm);
+    tcg_temp_free_i32(imm);
+    set_cc_op(s, CC_OP_EFLAGS);
+    if ((s->prefix & PREFIX_VEX) && !s->vex_l) {
+        tcg_gen_gvec_dup_imm(MO_64, offsetof(CPUX86State, xmm_regs[0].ZMM_X(1)),
+                             16, 16, 0);
+    }
+}
+
 static void gen_PCMPGTB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     int vec_len = sse_vec_len(s, decode);
       tcg_gen_ld8u_tl(s->T0, s->ptr1, offsetof(ZMMReg, ZMM_B(val)));
+        break;
+    case MO_16:
+        tcg_gen_ld16u_tl(s->T0, s->ptr1, offsetof(ZMMReg, ZMM_W(val)));
+        break;
+    case MO_32:
+        tcg_gen_ld_i32(s->tmp2_i32, s->ptr1, offsetof(ZMMReg, ZMM_L(val)));
+        tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+        break;
+#ifdef TARGET_X86_64
+    case MO_64:
+        tcg_gen_ld_tl(s->T0, s->ptr1, offsetof(ZMMReg, ZMM_Q(val)));
+        break;
+#endif
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
+    int vec_len = sse_vec_len(s, decode);
+    int mask = (vec_len >> ot) - 1;
+    int val = decode->immediate & mask;
+
+    if (decode->op[1].offset != decode->op[0].offset) {
+        assert(vec_len == 16);
+        gen_store_sse(s, env, decode, decode->op[1].offset);
+    }
+
+    switch(ot) {
+    case MO_8:
+        tcg_gen_st8_tl(s->T1, s->ptr0, offsetof(ZMMReg, ZMM_B(val)));
+        break;
+    case MO_16:
+        tcg_gen_st16_tl(s->T1, s->ptr0, offsetof(ZMMReg, ZMM_W(val)));
+        break;
+    case MO_32:
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T1);
+        tcg_gen_st_i32(s->tmp2_i32, s->ptr0, offsetof(ZMMReg, ZMM_L(val)));
+        break;
+#ifdef TARGET_X86_64
+    case MO_64:
+        tcg_gen_st_i64(s->T1, s->ptr0, offsetof(ZMMReg, ZMM_Q(val)));
+        break;
+#endif
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
@@ -1259,6 +1474,14 @@ static void gen_SSE4a_R(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
     }
 }
 
+static inline void gen_VAESKEYGEN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    assert(!s->vex_l);
+    gen_helper_aeskeygenassist_xmm(cpu_env, s->ptr0, s->ptr1, imm);
+    tcg_temp_free_i32(imm);
+}
+
 #define gen_VAND   gen_PAND
 #define gen_VANDN  gen_PANDN
 
@@ -1304,5 +1527,105 @@ static void gen_VCVTps_dq(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
     fn(cpu_env, s->ptr0, s->ptr2);
 }
 
+static void gen_VEXTRACTx128(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int mask = decode->immediate & 1;
+    int src_ofs = decode->op[1].offset + offsetof(YMMReg, YMM_X(mask));
+    if (decode->op[0].has_ea) {
+        gen_sto_env_A0(s, src_ofs);
+    } else {
+        tcg_gen_gvec_mov(MO_64, decode->op[0].offset + offsetof(YMMReg, YMM_X(0)), src_ofs, 16, 16);
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
+    TCGv_i32 zero = tcg_const_i32(0); /* float32_zero */
+    int val = decode->immediate;
+    int dest_word = (val >> 4) & 3;
+    int new_mask = (val & 15) | (1 << dest_word);
+    int vec_len = 16;
+
+    assert(!s->vex_l);
+
+    if (new_mask == 15) {
+        /* All zeroes plus possibly from the inserted element */
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else if (decode->op[1].offset != decode->op[0].offset) {
+        gen_store_sse(s, env, decode, decode->op[1].offset);
+    }
+
+    if (new_mask != (val & 15)) {
+        tcg_gen_st_i32(s->tmp2_i32, s->ptr0, offsetof(ZMMReg, ZMM_L(dest_word)));
+    }
+
+    if (new_mask != 15) {
+        if ((val >> 0) & 1)
+            tcg_gen_st_i32(zero, s->ptr0, offsetof(ZMMReg, ZMM_L(0)));
+        if ((val >> 1) & 1)
+            tcg_gen_st_i32(zero, s->ptr0, offsetof(ZMMReg, ZMM_L(1)));
+        if ((val >> 2) & 1)
+            tcg_gen_st_i32(zero, s->ptr0, offsetof(ZMMReg, ZMM_L(2)));
+        if ((val >> 3) & 1)
+            tcg_gen_st_i32(zero, s->ptr0, offsetof(ZMMReg, ZMM_L(3)));
+    }
+
+    tcg_temp_free_i32(zero);
+}
+
+static void gen_VINSERTPS_r(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int val = decode->immediate;
+    tcg_gen_ld_i32(s->tmp2_i32, s->ptr2, offsetof(ZMMReg, ZMM_L((val >> 6) & 3)));
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
 #define gen_VOR   gen_POR
+
+static inline void gen_VPERM2x128(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    assert(s->vex_l);
+    gen_helper_vpermdq_ymm(s->ptr0, s->ptr1, s->ptr2, imm);
+    tcg_temp_free_i32(imm);
+}
+
+static inline void gen_VROUNDSD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    assert(!s->vex_l);
+    gen_helper_roundsd_xmm(cpu_env, s->ptr0, s->ptr1, s->ptr2, imm);
+    tcg_temp_free_i32(imm);
+}
+
+static inline void gen_VROUNDSS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_const_i32(decode->immediate);
+    assert(!s->vex_l);
+    gen_helper_roundss_xmm(cpu_env, s->ptr0, s->ptr1, s->ptr2, imm);
+    tcg_temp_free_i32(imm);
+}
+
 #define gen_VXOR  gen_PXOR
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d15e988891..556087b1e9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4667,7 +4667,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         use_new &= b <= limit;
 #endif
         if (use_new &&
-            ((b >= 0x150 && b <= 0x17f) ||
+            (b == 0x13a ||
+             (b >= 0x150 && b <= 0x17f) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
             return disas_insn_new(s, cpu, b);
         }
-- 
2.37.2



