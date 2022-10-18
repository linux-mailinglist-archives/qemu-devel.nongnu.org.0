Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3D602DA7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:58:30 +0200 (CEST)
Received: from localhost ([::1]:49796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn6z-0007gI-2K
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmjC-0005KX-U8
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmj8-0005Tq-DV
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666100027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRlWJl7xu1etVNfJCy8cHT1/xWQN1we3BBzzCrYI2C0=;
 b=LFpDpjo0y0UtYPf/MBNBDpPqssyqqsND8K4719glOTy4UCto6+N0QXuXMLA4869NH4/Nke
 QWlkf3KJ0vAxp95GiclmAIg9voSloRnwDa642+7ZzpHzCOHf6Jn6Rd+6BFFI8h97YX1l8F
 e1/NoRawyOx2CMTHYnggrG38HW884rs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-MTEl8GxpPCmtsHvG-s2VyA-1; Tue, 18 Oct 2022 09:33:46 -0400
X-MC-Unique: MTEl8GxpPCmtsHvG-s2VyA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h13-20020a056402280d00b0045cb282161cso11717801ede.8
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRlWJl7xu1etVNfJCy8cHT1/xWQN1we3BBzzCrYI2C0=;
 b=g+LE7O3bB0tvPIjQ8iyCkoORRkr9G5oVRfQhVfkOTOPrEQdEl7lVQ3j1gSmYReSBO3
 5I7j5A9hU/mGxH2AbP1puiaFCf8hrVDpBe9RMXJrAyIi618Bwt1adEf7MWUUenM2VVLF
 TA5VYiUlVAr7ERz5Ji/Jw4suuetclnNVH2A1fdiTpSSkydULhz8v9bDAprHFoNfTjtuQ
 i8ggKObBDDssUZIbxEg+PLdXZgD7NbM7r6Bn2oAx/BHwUvSADzpbhvvKyeTjPzU9tmKA
 UKetL0yrkPIyMtlw4l2r2Cqvi9DwXKlH8SCFSuZ4AIc5VUPhOcQC+ZDm9hBAQzjNzXqg
 epMQ==
X-Gm-Message-State: ACrzQf2Is/Un9NF1EUEVHruvEHZ2aD/eTf4W6OOVm71lD93s8Aq9ju0r
 Q+5FyfsQrjN673TLIIqguyuqklQb2kTZaEjNQjQfLqKYHw274n5bYLsX9nUsyhRecoWq+JadAfw
 u+xiM0Ie82qzXoJcPOy+YYb14w9WctT7Mr5U1S6e55VITwJafLeBqjxUzfZR8oGUV0q4=
X-Received: by 2002:a05:6402:550e:b0:456:f79f:2bed with SMTP id
 fi14-20020a056402550e00b00456f79f2bedmr2691911edb.106.1666100023454; 
 Tue, 18 Oct 2022 06:33:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5QgXkFfALKllcsfYO2YwJFQ+cJFwapvlrcDnTHbsaDkHJ9MLk0cx6v9w2tRYsr1Mmg29qiZQ==
X-Received: by 2002:a05:6402:550e:b0:456:f79f:2bed with SMTP id
 fi14-20020a056402550e00b00456f79f2bedmr2691812edb.106.1666100022021; 
 Tue, 18 Oct 2022 06:33:42 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a50fc91000000b00458f077aecasm8854243edq.17.2022.10.18.06.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:33:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 53/53] target/i386: remove old SSE decoder
Date: Tue, 18 Oct 2022 15:30:42 +0200
Message-Id: <20221018133042.856368-54-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

With all SSE (and AVX!) instructions now implemented in disas_insn_new,
it's possible to remove gen_sse, as well as the helpers for instructions
that now use gvec.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h            |  124 ---
 target/i386/ops_sse_header.h     |   61 --
 target/i386/tcg/decode-new.c.inc |    3 -
 target/i386/tcg/emit.c.inc       |   17 +
 target/i386/tcg/translate.c      | 1721 +-----------------------------
 5 files changed, 19 insertions(+), 1907 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0037f92e5f..d35fc15c65 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -297,17 +297,6 @@ static inline int satsw(int x)
 #define FMAXUB(a, b) ((a) > (b)) ? (a) : (b)
 #define FMAXSW(a, b) ((int16_t)(a) > (int16_t)(b)) ? (a) : (b)
 
-#define FAND(a, b) ((a) & (b))
-#define FANDN(a, b) ((~(a)) & (b))
-#define FOR(a, b) ((a) | (b))
-#define FXOR(a, b) ((a) ^ (b))
-
-#define FCMPGTB(a, b) ((int8_t)(a) > (int8_t)(b) ? -1 : 0)
-#define FCMPGTW(a, b) ((int16_t)(a) > (int16_t)(b) ? -1 : 0)
-#define FCMPGTL(a, b) ((int32_t)(a) > (int32_t)(b) ? -1 : 0)
-#define FCMPEQ(a, b) ((a) == (b) ? -1 : 0)
-
-#define FMULLW(a, b) ((a) * (b))
 #define FMULHRW(a, b) (((int16_t)(a) * (int16_t)(b) + 0x8000) >> 16)
 #define FMULHUW(a, b) ((a) * (b) >> 16)
 #define FMULHW(a, b) ((int16_t)(a) * (int16_t)(b) >> 16)
@@ -315,46 +304,6 @@ static inline int satsw(int x)
 #define FAVG(a, b) (((a) + (b) + 1) >> 1)
 #endif
 
-SSE_HELPER_B(helper_paddb, FADD)
-SSE_HELPER_W(helper_paddw, FADD)
-SSE_HELPER_L(helper_paddl, FADD)
-SSE_HELPER_Q(helper_paddq, FADD)
-
-SSE_HELPER_B(helper_psubb, FSUB)
-SSE_HELPER_W(helper_psubw, FSUB)
-SSE_HELPER_L(helper_psubl, FSUB)
-SSE_HELPER_Q(helper_psubq, FSUB)
-
-SSE_HELPER_B(helper_paddusb, FADDUB)
-SSE_HELPER_B(helper_paddsb, FADDSB)
-SSE_HELPER_B(helper_psubusb, FSUBUB)
-SSE_HELPER_B(helper_psubsb, FSUBSB)
-
-SSE_HELPER_W(helper_paddusw, FADDUW)
-SSE_HELPER_W(helper_paddsw, FADDSW)
-SSE_HELPER_W(helper_psubusw, FSUBUW)
-SSE_HELPER_W(helper_psubsw, FSUBSW)
-
-SSE_HELPER_B(helper_pminub, FMINUB)
-SSE_HELPER_B(helper_pmaxub, FMAXUB)
-
-SSE_HELPER_W(helper_pminsw, FMINSW)
-SSE_HELPER_W(helper_pmaxsw, FMAXSW)
-
-SSE_HELPER_Q(helper_pand, FAND)
-SSE_HELPER_Q(helper_pandn, FANDN)
-SSE_HELPER_Q(helper_por, FOR)
-SSE_HELPER_Q(helper_pxor, FXOR)
-
-SSE_HELPER_B(helper_pcmpgtb, FCMPGTB)
-SSE_HELPER_W(helper_pcmpgtw, FCMPGTW)
-SSE_HELPER_L(helper_pcmpgtl, FCMPGTL)
-
-SSE_HELPER_B(helper_pcmpeqb, FCMPEQ)
-SSE_HELPER_W(helper_pcmpeqw, FCMPEQ)
-SSE_HELPER_L(helper_pcmpeql, FCMPEQ)
-
-SSE_HELPER_W(helper_pmullw, FMULLW)
 SSE_HELPER_W(helper_pmulhuw, FMULHUW)
 SSE_HELPER_W(helper_pmulhw, FMULHW)
 
@@ -432,29 +381,6 @@ void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 }
 #endif
 
-void glue(helper_movl_mm_T0, SUFFIX)(Reg *d, uint32_t val)
-{
-    int i;
-
-    d->L(0) = val;
-    d->L(1) = 0;
-    for (i = 1; i < (1 << SHIFT); i++) {
-        d->Q(i) = 0;
-    }
-}
-
-#ifdef TARGET_X86_64
-void glue(helper_movq_mm_T0, SUFFIX)(Reg *d, uint64_t val)
-{
-    int i;
-
-    d->Q(0) = val;
-    for (i = 1; i < (1 << SHIFT); i++) {
-        d->Q(i) = 0;
-    }
-}
-#endif
-
 #define SHUFFLE4(F, a, b, offset) do {      \
     r0 = a->F((order & 3) + offset);        \
     r1 = a->F(((order >> 2) & 3) + offset); \
@@ -1216,27 +1142,6 @@ uint32_t glue(helper_movmskpd, SUFFIX)(CPUX86State *env, Reg *s)
 
 #endif
 
-uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
-{
-    uint32_t val;
-    int i;
-
-    val = 0;
-    for (i = 0; i < (1 << SHIFT); i++) {
-        uint8_t byte = 0;
-        byte |= (s->B(8 * i + 0) >> 7);
-        byte |= (s->B(8 * i + 1) >> 6) & 0x02;
-        byte |= (s->B(8 * i + 2) >> 5) & 0x04;
-        byte |= (s->B(8 * i + 3) >> 4) & 0x08;
-        byte |= (s->B(8 * i + 4) >> 3) & 0x10;
-        byte |= (s->B(8 * i + 5) >> 2) & 0x20;
-        byte |= (s->B(8 * i + 6) >> 1) & 0x40;
-        byte |= (s->B(8 * i + 7)) & 0x80;
-        val |= byte << (8 * i);
-    }
-    return val;
-}
-
 #define PACK_HELPER_B(name, F) \
 void glue(helper_pack ## name, SUFFIX)(CPUX86State *env,      \
         Reg *d, Reg *v, Reg *s)                               \
@@ -1587,13 +1492,6 @@ void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
     }
 }
 
-#define FABSB(x) (x > INT8_MAX  ? -(int8_t)x : x)
-#define FABSW(x) (x > INT16_MAX ? -(int16_t)x : x)
-#define FABSL(x) (x > INT32_MAX ? -(int32_t)x : x)
-SSE_HELPER_1(helper_pabsb, B, 8 << SHIFT, FABSB)
-SSE_HELPER_1(helper_pabsw, W, 4 << SHIFT, FABSW)
-SSE_HELPER_1(helper_pabsd, L, 2 << SHIFT, FABSL)
-
 #define FMULHRSW(d, s) (((int16_t) d * (int16_t)s + 0x4000) >> 15)
 SSE_HELPER_W(helper_pmulhrsw, FMULHRSW)
 
@@ -1723,9 +1621,6 @@ void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
     }
 }
 
-#define FCMPEQQ(d, s) (d == s ? -1 : 0)
-SSE_HELPER_Q(helper_pcmpeqq, FCMPEQQ)
-
 void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     uint16_t r[8];
@@ -1746,22 +1641,6 @@ void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
     }
 }
 
-#define FMINSB(d, s) MIN((int8_t)d, (int8_t)s)
-#define FMINSD(d, s) MIN((int32_t)d, (int32_t)s)
-#define FMAXSB(d, s) MAX((int8_t)d, (int8_t)s)
-#define FMAXSD(d, s) MAX((int32_t)d, (int32_t)s)
-SSE_HELPER_B(helper_pminsb, FMINSB)
-SSE_HELPER_L(helper_pminsd, FMINSD)
-SSE_HELPER_W(helper_pminuw, MIN)
-SSE_HELPER_L(helper_pminud, MIN)
-SSE_HELPER_B(helper_pmaxsb, FMAXSB)
-SSE_HELPER_L(helper_pmaxsd, FMAXSD)
-SSE_HELPER_W(helper_pmaxuw, MAX)
-SSE_HELPER_L(helper_pmaxud, MAX)
-
-#define FMULLD(d, s) ((int32_t)d * (int32_t)s)
-SSE_HELPER_L(helper_pmulld, FMULLD)
-
 #if SHIFT == 1
 void glue(helper_phminposuw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
@@ -2042,9 +1921,6 @@ void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
 }
 
 /* SSE4.2 op helpers */
-#define FCMPGTQ(d, s) ((int64_t)d > (int64_t)s ? -1 : 0)
-SSE_HELPER_Q(helper_pcmpgtq, FCMPGTQ)
-
 #if SHIFT == 1
 static inline int pcmp_elen(CPUX86State *env, int reg, uint32_t ctrl)
 {
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 00de6d69f1..2f1f811f9f 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -64,46 +64,6 @@ DEF_HELPER_4(glue(pslldq, SUFFIX), void, env, Reg, Reg, Reg)
 #define SSE_HELPER_Q(name, F)\
     DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
-SSE_HELPER_B(paddb, FADD)
-SSE_HELPER_W(paddw, FADD)
-SSE_HELPER_L(paddl, FADD)
-SSE_HELPER_Q(paddq, FADD)
-
-SSE_HELPER_B(psubb, FSUB)
-SSE_HELPER_W(psubw, FSUB)
-SSE_HELPER_L(psubl, FSUB)
-SSE_HELPER_Q(psubq, FSUB)
-
-SSE_HELPER_B(paddusb, FADDUB)
-SSE_HELPER_B(paddsb, FADDSB)
-SSE_HELPER_B(psubusb, FSUBUB)
-SSE_HELPER_B(psubsb, FSUBSB)
-
-SSE_HELPER_W(paddusw, FADDUW)
-SSE_HELPER_W(paddsw, FADDSW)
-SSE_HELPER_W(psubusw, FSUBUW)
-SSE_HELPER_W(psubsw, FSUBSW)
-
-SSE_HELPER_B(pminub, FMINUB)
-SSE_HELPER_B(pmaxub, FMAXUB)
-
-SSE_HELPER_W(pminsw, FMINSW)
-SSE_HELPER_W(pmaxsw, FMAXSW)
-
-SSE_HELPER_Q(pand, FAND)
-SSE_HELPER_Q(pandn, FANDN)
-SSE_HELPER_Q(por, FOR)
-SSE_HELPER_Q(pxor, FXOR)
-
-SSE_HELPER_B(pcmpgtb, FCMPGTB)
-SSE_HELPER_W(pcmpgtw, FCMPGTW)
-SSE_HELPER_L(pcmpgtl, FCMPGTL)
-
-SSE_HELPER_B(pcmpeqb, FCMPEQ)
-SSE_HELPER_W(pcmpeqw, FCMPEQ)
-SSE_HELPER_L(pcmpeql, FCMPEQ)
-
-SSE_HELPER_W(pmullw, FMULLW)
 #if SHIFT == 0
 DEF_HELPER_3(glue(pmulhrw, SUFFIX), void, env, Reg, Reg)
 #endif
@@ -120,10 +80,6 @@ DEF_HELPER_4(glue(psadbw, SUFFIX), void, env, Reg, Reg, Reg)
 #if SHIFT < 2
 DEF_HELPER_4(glue(maskmov, SUFFIX), void, env, Reg, Reg, tl)
 #endif
-DEF_HELPER_2(glue(movl_mm_T0, SUFFIX), void, Reg, i32)
-#ifdef TARGET_X86_64
-DEF_HELPER_2(glue(movq_mm_T0, SUFFIX), void, Reg, i64)
-#endif
 
 #if SHIFT == 0
 DEF_HELPER_3(glue(pshufw, SUFFIX), void, Reg, Reg, int)
@@ -279,7 +235,6 @@ DEF_HELPER_2(glue(movmskps, SUFFIX), i32, env, Reg)
 DEF_HELPER_2(glue(movmskpd, SUFFIX), i32, env, Reg)
 #endif
 
-DEF_HELPER_2(glue(pmovmskb, SUFFIX), i32, env, Reg)
 DEF_HELPER_4(glue(packsswb, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(packuswb, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(packssdw, SUFFIX), void, env, Reg, Reg, Reg)
@@ -326,9 +281,6 @@ DEF_HELPER_4(glue(phaddsw, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(phsubw, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(phsubd, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(phsubsw, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_3(glue(pabsb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pabsw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pabsd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(pmaddubsw, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(pmulhrsw, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(pshufb, SUFFIX), void, env, Reg, Reg, Reg)
@@ -359,17 +311,7 @@ DEF_HELPER_3(glue(pmovsldup, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovshdup, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovdldup, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(pmuldq, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_4(glue(pcmpeqq, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(packusdw, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_4(glue(pminsb, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_4(glue(pminsd, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_4(glue(pminuw, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_4(glue(pminud, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_4(glue(pmaxsb, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_4(glue(pmaxsd, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_4(glue(pmaxuw, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_4(glue(pmaxud, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_4(glue(pmulld, SUFFIX), void, env, Reg, Reg, Reg)
 #if SHIFT == 1
 DEF_HELPER_3(glue(phminposuw, SUFFIX), void, env, Reg, Reg)
 #endif
@@ -390,9 +332,6 @@ DEF_HELPER_5(glue(mpsadbw, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
 
 /* SSE4.2 op helpers */
-#if SHIFT >= 1
-DEF_HELPER_4(glue(pcmpgtq, SUFFIX), void, env, Reg, Reg, Reg)
-#endif
 #if SHIFT == 1
 DEF_HELPER_4(glue(pcmpestri, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpestrm, SUFFIX), void, env, Reg, Reg, i32)
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 9e43de6827..8e1eb9db42 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -1542,9 +1542,6 @@ static void disas_insn_new(DisasContext *s, CPUState *cpu, int b)
     X86DecodedInsn decode;
     X86DecodeFunc decode_func = decode_root;
 
-#ifdef CONFIG_USER_ONLY
-    if (limit) { --limit; }
-#endif
     s->has_modrm = false;
 
  next_byte:
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 63af60ba65..27eca591a9 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -19,7 +19,24 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#define ZMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg])
+
+typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
+typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_0_epp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b);
+typedef void (*SSEFunc_0_eppp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                               TCGv_ptr reg_c);
+typedef void (*SSEFunc_0_epppp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                TCGv_ptr reg_c, TCGv_ptr reg_d);
+typedef void (*SSEFunc_0_eppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                               TCGv_i32 val);
+typedef void (*SSEFunc_0_epppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                TCGv_ptr reg_c, TCGv_i32 val);
+typedef void (*SSEFunc_0_ppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_i32 val);
+typedef void (*SSEFunc_0_pppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_ptr reg_c,
+                               TCGv_i32 val);
+typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                               TCGv val);
 typedef void (*SSEFunc_0_epppti)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                  TCGv_ptr reg_c, TCGv a0, TCGv_i32 scale);
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e9af467d6f..e19d5c1c64 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -129,9 +129,6 @@ typedef struct DisasContext {
     /* TCG local register indexes (only used inside old micro ops) */
     TCGv tmp0;
     TCGv tmp4;
-    TCGv_ptr ptr0;
-    TCGv_ptr ptr1;
-    TCGv_ptr ptr2;
     TCGv_i32 tmp2_i32;
     TCGv_i32 tmp3_i32;
     TCGv_i64 tmp1_i64;
@@ -2952,1696 +2949,10 @@ static void gen_sty_env_A0(DisasContext *s, int offset, bool align)
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
 }
 
-static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset)
-{
-    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(XMMReg, XMM_Q(0)));
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(XMMReg, XMM_Q(0)));
-    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(XMMReg, XMM_Q(1)));
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(XMMReg, XMM_Q(1)));
-}
-
-static inline void gen_op_movq(DisasContext *s, int d_offset, int s_offset)
-{
-    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset);
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset);
-}
-
-static inline void gen_op_movl(DisasContext *s, int d_offset, int s_offset)
-{
-    tcg_gen_ld_i32(s->tmp2_i32, cpu_env, s_offset);
-    tcg_gen_st_i32(s->tmp2_i32, cpu_env, d_offset);
-}
-
-static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
-{
-    tcg_gen_movi_i64(s->tmp1_i64, 0);
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset);
-}
-
-#define ZMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg])
-#define XMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg].ZMM_X(0))
-
-typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
-typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
-typedef void (*SSEFunc_0_epi)(TCGv_ptr env, TCGv_ptr reg, TCGv_i32 val);
-typedef void (*SSEFunc_0_epl)(TCGv_ptr env, TCGv_ptr reg, TCGv_i64 val);
-typedef void (*SSEFunc_0_epp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b);
-typedef void (*SSEFunc_0_eppp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
-                               TCGv_ptr reg_c);
-typedef void (*SSEFunc_0_epppp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
-                                TCGv_ptr reg_c, TCGv_ptr reg_d);
-typedef void (*SSEFunc_0_eppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
-                               TCGv_i32 val);
-typedef void (*SSEFunc_0_epppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
-                                TCGv_ptr reg_c, TCGv_i32 val);
-typedef void (*SSEFunc_0_ppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_i32 val);
-typedef void (*SSEFunc_0_pppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_ptr reg_c,
-                               TCGv_i32 val);
-typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
-                               TCGv val);
-typedef void (*SSEFunc_0_epppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
-                                TCGv_ptr reg_c, TCGv val);
-
-static bool first = true; static unsigned long limit;
 #include "decode-new.h"
 #include "emit.c.inc"
 #include "decode-new.c.inc"
 
-#define SSE_OPF_V0        (1 << 0) /* vex.v must be 1111b (only 2 operands) */
-#define SSE_OPF_CMP       (1 << 1) /* does not write for first operand */
-#define SSE_OPF_BLENDV    (1 << 2) /* blendv* instruction */
-#define SSE_OPF_SPECIAL   (1 << 3) /* magic */
-#define SSE_OPF_MMX       (1 << 5) /* MMX/integer/AVX2 instruction */
-#define SSE_OPF_SCALAR    (1 << 6) /* Has SSE scalar variants */
-#define SSE_OPF_SHUF      (1 << 9) /* pshufx/shufpx */
-
-#define OP(op, flags, a, b, c, d)       \
-    {flags, {{.op = a}, {.op = b}, {.op = c}, {.op = d} } }
-
-#define MMX_OP(x) OP(op2, SSE_OPF_MMX, \
-        gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm, NULL, NULL)
-
-#define SSE_FOP(name) OP(op2, SSE_OPF_SCALAR, \
-        gen_helper_##name##ps##_xmm, gen_helper_##name##pd##_xmm, \
-        gen_helper_##name##ss, gen_helper_##name##sd)
-#define SSE_OP(sname, dname, op, flags) OP(op, flags, \
-        gen_helper_##sname##_xmm, gen_helper_##dname##_xmm, NULL, NULL)
-
-#define SSE_OP_UNARY(a, b, c, d)       \
-    {SSE_OPF_SCALAR | SSE_OPF_V0, {{.op1 = a}, {.op1 = b}, {.op2 = c}, {.op2 = d} } }
-
-typedef union SSEFuncs {
-    SSEFunc_0_epp op1;
-    SSEFunc_0_ppi op1i;
-    SSEFunc_0_eppt op1t;
-    SSEFunc_0_eppp op2;
-    SSEFunc_0_pppi op2i;
-    SSEFunc_0_epppp op3;
-} SSEFuncs;
-
-struct SSEOpHelper_table1 {
-    int flags;
-    SSEFuncs fn[4];
-};
-
-#define SSE_SPECIAL { SSE_OPF_SPECIAL }
-
-static const struct SSEOpHelper_table1 sse_op_table1[256] = {
-    /* pure SSE operations */
-    [0x10] = SSE_SPECIAL, /* movups, movupd, movss, movsd */
-    [0x11] = SSE_SPECIAL, /* movups, movupd, movss, movsd */
-    [0x12] = SSE_SPECIAL, /* movlps, movlpd, movsldup, movddup */
-    [0x13] = SSE_SPECIAL, /* movlps, movlpd */
-    [0x14] = SSE_OP(punpckldq, punpcklqdq, op2, 0), /* unpcklps, unpcklpd */
-    [0x15] = SSE_OP(punpckhdq, punpckhqdq, op2, 0), /* unpckhps, unpckhpd */
-    [0x16] = SSE_SPECIAL, /* movhps, movhpd, movshdup */
-    [0x17] = SSE_SPECIAL, /* movhps, movhpd */
-
-    [0x28] = SSE_SPECIAL, /* movaps, movapd */
-    [0x29] = SSE_SPECIAL, /* movaps, movapd */
-    [0x2a] = SSE_SPECIAL, /* cvtpi2ps, cvtpi2pd, cvtsi2ss, cvtsi2sd */
-    [0x2b] = SSE_SPECIAL, /* movntps, movntpd, movntss, movntsd */
-    [0x2c] = SSE_SPECIAL, /* cvttps2pi, cvttpd2pi, cvttsd2si, cvttss2si */
-    [0x2d] = SSE_SPECIAL, /* cvtps2pi, cvtpd2pi, cvtsd2si, cvtss2si */
-    [0x2e] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR | SSE_OPF_V0,
-            gen_helper_ucomiss, gen_helper_ucomisd, NULL, NULL),
-    [0x2f] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR | SSE_OPF_V0,
-            gen_helper_comiss, gen_helper_comisd, NULL, NULL),
-    [0x50] = SSE_SPECIAL, /* movmskps, movmskpd */
-    [0x51] = SSE_OP_UNARY(
-                gen_helper_sqrtps_xmm, gen_helper_sqrtpd_xmm,
-                gen_helper_sqrtss, gen_helper_sqrtsd),
-    [0x52] = SSE_OP_UNARY(
-                gen_helper_rsqrtps_xmm, NULL, gen_helper_rsqrtss, NULL),
-    [0x53] = SSE_OP_UNARY(
-                gen_helper_rcpps_xmm, NULL, gen_helper_rcpss, NULL),
-    [0x54] = SSE_OP(pand, pand, op2, 0), /* andps, andpd */
-    [0x55] = SSE_OP(pandn, pandn, op2, 0), /* andnps, andnpd */
-    [0x56] = SSE_OP(por, por, op2, 0), /* orps, orpd */
-    [0x57] = SSE_OP(pxor, pxor, op2, 0), /* xorps, xorpd */
-    [0x58] = SSE_FOP(add),
-    [0x59] = SSE_FOP(mul),
-    [0x5a] = SSE_OP_UNARY(
-                 gen_helper_cvtps2pd_xmm, gen_helper_cvtpd2ps_xmm,
-                 gen_helper_cvtss2sd, gen_helper_cvtsd2ss),
-    [0x5b] = OP(op1, SSE_OPF_V0,
-                gen_helper_cvtdq2ps_xmm, gen_helper_cvtps2dq_xmm,
-                gen_helper_cvttps2dq_xmm, NULL),
-    [0x5c] = SSE_FOP(sub),
-    [0x5d] = SSE_FOP(min),
-    [0x5e] = SSE_FOP(div),
-    [0x5f] = SSE_FOP(max),
-
-    [0xc2] = SSE_FOP(cmpeq), /* sse_op_table4 */
-    [0xc6] = SSE_OP(shufps, shufpd, op2i, SSE_OPF_SHUF),
-
-    /* SSSE3, SSE4, MOVBE, CRC32, BMI1, BMI2, ADX.  */
-    [0x38] = SSE_SPECIAL,
-    [0x3a] = SSE_SPECIAL,
-
-    /* MMX ops and their SSE extensions */
-    [0x60] = MMX_OP(punpcklbw),
-    [0x61] = MMX_OP(punpcklwd),
-    [0x62] = MMX_OP(punpckldq),
-    [0x63] = MMX_OP(packsswb),
-    [0x64] = MMX_OP(pcmpgtb),
-    [0x65] = MMX_OP(pcmpgtw),
-    [0x66] = MMX_OP(pcmpgtl),
-    [0x67] = MMX_OP(packuswb),
-    [0x68] = MMX_OP(punpckhbw),
-    [0x69] = MMX_OP(punpckhwd),
-    [0x6a] = MMX_OP(punpckhdq),
-    [0x6b] = MMX_OP(packssdw),
-    [0x6c] = OP(op2, SSE_OPF_MMX,
-                NULL, gen_helper_punpcklqdq_xmm, NULL, NULL),
-    [0x6d] = OP(op2, SSE_OPF_MMX,
-                NULL, gen_helper_punpckhqdq_xmm, NULL, NULL),
-    [0x6e] = SSE_SPECIAL, /* movd mm, ea */
-    [0x6f] = SSE_SPECIAL, /* movq, movdqa, , movqdu */
-    [0x70] = OP(op1i, SSE_OPF_SHUF | SSE_OPF_MMX | SSE_OPF_V0,
-            gen_helper_pshufw_mmx, gen_helper_pshufd_xmm,
-            gen_helper_pshufhw_xmm, gen_helper_pshuflw_xmm),
-    [0x71] = SSE_SPECIAL, /* shiftw */
-    [0x72] = SSE_SPECIAL, /* shiftd */
-    [0x73] = SSE_SPECIAL, /* shiftq */
-    [0x74] = MMX_OP(pcmpeqb),
-    [0x75] = MMX_OP(pcmpeqw),
-    [0x76] = MMX_OP(pcmpeql),
-    [0x77] = SSE_SPECIAL, /* emms */
-    [0x78] = SSE_SPECIAL, /* extrq_i, insertq_i (sse4a) */
-    [0x79] = OP(op1, SSE_OPF_V0,
-            NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r),
-    [0x7c] = OP(op2, 0,
-                NULL, gen_helper_haddpd_xmm, NULL, gen_helper_haddps_xmm),
-    [0x7d] = OP(op2, 0,
-                NULL, gen_helper_hsubpd_xmm, NULL, gen_helper_hsubps_xmm),
-    [0x7e] = SSE_SPECIAL, /* movd, movd, , movq */
-    [0x7f] = SSE_SPECIAL, /* movq, movdqa, movdqu */
-    [0xc4] = SSE_SPECIAL, /* pinsrw */
-    [0xc5] = SSE_SPECIAL, /* pextrw */
-    [0xd0] = OP(op2, 0,
-                NULL, gen_helper_addsubpd_xmm, NULL, gen_helper_addsubps_xmm),
-    [0xd1] = MMX_OP(psrlw),
-    [0xd2] = MMX_OP(psrld),
-    [0xd3] = MMX_OP(psrlq),
-    [0xd4] = MMX_OP(paddq),
-    [0xd5] = MMX_OP(pmullw),
-    [0xd6] = SSE_SPECIAL,
-    [0xd7] = SSE_SPECIAL, /* pmovmskb */
-    [0xd8] = MMX_OP(psubusb),
-    [0xd9] = MMX_OP(psubusw),
-    [0xda] = MMX_OP(pminub),
-    [0xdb] = MMX_OP(pand),
-    [0xdc] = MMX_OP(paddusb),
-    [0xdd] = MMX_OP(paddusw),
-    [0xde] = MMX_OP(pmaxub),
-    [0xdf] = MMX_OP(pandn),
-    [0xe0] = MMX_OP(pavgb),
-    [0xe1] = MMX_OP(psraw),
-    [0xe2] = MMX_OP(psrad),
-    [0xe3] = MMX_OP(pavgw),
-    [0xe4] = MMX_OP(pmulhuw),
-    [0xe5] = MMX_OP(pmulhw),
-    [0xe6] = OP(op1, SSE_OPF_V0,
-            NULL, gen_helper_cvttpd2dq_xmm,
-            gen_helper_cvtdq2pd_xmm, gen_helper_cvtpd2dq_xmm),
-    [0xe7] = SSE_SPECIAL,  /* movntq, movntq */
-    [0xe8] = MMX_OP(psubsb),
-    [0xe9] = MMX_OP(psubsw),
-    [0xea] = MMX_OP(pminsw),
-    [0xeb] = MMX_OP(por),
-    [0xec] = MMX_OP(paddsb),
-    [0xed] = MMX_OP(paddsw),
-    [0xee] = MMX_OP(pmaxsw),
-    [0xef] = MMX_OP(pxor),
-    [0xf0] = SSE_SPECIAL, /* lddqu */
-    [0xf1] = MMX_OP(psllw),
-    [0xf2] = MMX_OP(pslld),
-    [0xf3] = MMX_OP(psllq),
-    [0xf4] = MMX_OP(pmuludq),
-    [0xf5] = MMX_OP(pmaddwd),
-    [0xf6] = MMX_OP(psadbw),
-    [0xf7] = OP(op1t, SSE_OPF_MMX | SSE_OPF_V0,
-                gen_helper_maskmov_mmx, gen_helper_maskmov_xmm, NULL, NULL),
-    [0xf8] = MMX_OP(psubb),
-    [0xf9] = MMX_OP(psubw),
-    [0xfa] = MMX_OP(psubl),
-    [0xfb] = MMX_OP(psubq),
-    [0xfc] = MMX_OP(paddb),
-    [0xfd] = MMX_OP(paddw),
-    [0xfe] = MMX_OP(paddl),
-};
-#undef MMX_OP
-#undef OP
-#undef SSE_FOP
-#undef SSE_OP
-#undef SSE_SPECIAL
-
-#define MMX_OP2(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm }
-
-static const SSEFunc_0_eppp sse_op_table2[3 * 8][2] = {
-    [0 + 2] = MMX_OP2(psrlw),
-    [0 + 4] = MMX_OP2(psraw),
-    [0 + 6] = MMX_OP2(psllw),
-    [8 + 2] = MMX_OP2(psrld),
-    [8 + 4] = MMX_OP2(psrad),
-    [8 + 6] = MMX_OP2(pslld),
-    [16 + 2] = MMX_OP2(psrlq),
-    [16 + 3] = { NULL, gen_helper_psrldq_xmm },
-    [16 + 6] = MMX_OP2(psllq),
-    [16 + 7] = { NULL, gen_helper_pslldq_xmm },
-};
-
-static const SSEFunc_0_epi sse_op_table3ai[] = {
-    gen_helper_cvtsi2ss,
-    gen_helper_cvtsi2sd
-};
-
-#ifdef TARGET_X86_64
-static const SSEFunc_0_epl sse_op_table3aq[] = {
-    gen_helper_cvtsq2ss,
-    gen_helper_cvtsq2sd
-};
-#endif
-
-static const SSEFunc_i_ep sse_op_table3bi[] = {
-    gen_helper_cvttss2si,
-    gen_helper_cvtss2si,
-    gen_helper_cvttsd2si,
-    gen_helper_cvtsd2si
-};
-
-#ifdef TARGET_X86_64
-static const SSEFunc_l_ep sse_op_table3bq[] = {
-    gen_helper_cvttss2sq,
-    gen_helper_cvtss2sq,
-    gen_helper_cvttsd2sq,
-    gen_helper_cvtsd2sq
-};
-#endif
-
-#define SSE_CMP(x) { \
-    gen_helper_ ## x ## ps ## _xmm, gen_helper_ ## x ## pd ## _xmm, \
-    gen_helper_ ## x ## ss, gen_helper_ ## x ## sd}
-static const SSEFunc_0_eppp sse_op_table4[8][4] = {
-    SSE_CMP(cmpeq),
-    SSE_CMP(cmplt),
-    SSE_CMP(cmple),
-    SSE_CMP(cmpunord),
-    SSE_CMP(cmpneq),
-    SSE_CMP(cmpnlt),
-    SSE_CMP(cmpnle),
-    SSE_CMP(cmpord),
-};
-#undef SSE_CMP
-
-struct SSEOpHelper_table6 {
-    SSEFuncs fn[2];
-    uint32_t ext_mask;
-    int flags;
-};
-
-struct SSEOpHelper_table7 {
-    union {
-        SSEFunc_0_eppi op1;
-        SSEFunc_0_epppi op2;
-        SSEFunc_0_epppp op3;
-    } fn[2];
-    uint32_t ext_mask;
-    int flags;
-};
-
-#define gen_helper_special_xmm NULL
-
-#define OP(name, op, flags, ext, mmx_name) \
-    {{{.op = mmx_name}, {.op = gen_helper_ ## name ## _xmm} }, \
-        CPUID_EXT_ ## ext, flags}
-#define BINARY_OP_MMX(name, ext) \
-    OP(name, op2, SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
-#define BINARY_OP(name, ext, flags) \
-    OP(name, op2, flags, ext, NULL)
-#define UNARY_OP_MMX(name, ext) \
-    OP(name, op1, SSE_OPF_V0 | SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
-#define UNARY_OP(name, ext, flags) \
-    OP(name, op1, SSE_OPF_V0 | flags, ext, NULL)
-#define BLENDV_OP(name, ext, flags) OP(name, op3, SSE_OPF_BLENDV, ext, NULL)
-#define CMP_OP(name, ext) OP(name, op1, SSE_OPF_CMP | SSE_OPF_V0, ext, NULL)
-#define SPECIAL_OP(ext) OP(special, op1, SSE_OPF_SPECIAL, ext, NULL)
-
-/* prefix [66] 0f 38 */
-static const struct SSEOpHelper_table6 sse_op_table6[256] = {
-    [0x00] = BINARY_OP_MMX(pshufb, SSSE3),
-    [0x01] = BINARY_OP_MMX(phaddw, SSSE3),
-    [0x02] = BINARY_OP_MMX(phaddd, SSSE3),
-    [0x03] = BINARY_OP_MMX(phaddsw, SSSE3),
-    [0x04] = BINARY_OP_MMX(pmaddubsw, SSSE3),
-    [0x05] = BINARY_OP_MMX(phsubw, SSSE3),
-    [0x06] = BINARY_OP_MMX(phsubd, SSSE3),
-    [0x07] = BINARY_OP_MMX(phsubsw, SSSE3),
-    [0x08] = BINARY_OP_MMX(psignb, SSSE3),
-    [0x09] = BINARY_OP_MMX(psignw, SSSE3),
-    [0x0a] = BINARY_OP_MMX(psignd, SSSE3),
-    [0x0b] = BINARY_OP_MMX(pmulhrsw, SSSE3),
-    [0x10] = BLENDV_OP(pblendvb, SSE41, SSE_OPF_MMX),
-    [0x14] = BLENDV_OP(blendvps, SSE41, 0),
-    [0x15] = BLENDV_OP(blendvpd, SSE41, 0),
-    [0x17] = CMP_OP(ptest, SSE41),
-    [0x1c] = UNARY_OP_MMX(pabsb, SSSE3),
-    [0x1d] = UNARY_OP_MMX(pabsw, SSSE3),
-    [0x1e] = UNARY_OP_MMX(pabsd, SSSE3),
-    [0x20] = UNARY_OP(pmovsxbw, SSE41, SSE_OPF_MMX),
-    [0x21] = UNARY_OP(pmovsxbd, SSE41, SSE_OPF_MMX),
-    [0x22] = UNARY_OP(pmovsxbq, SSE41, SSE_OPF_MMX),
-    [0x23] = UNARY_OP(pmovsxwd, SSE41, SSE_OPF_MMX),
-    [0x24] = UNARY_OP(pmovsxwq, SSE41, SSE_OPF_MMX),
-    [0x25] = UNARY_OP(pmovsxdq, SSE41, SSE_OPF_MMX),
-    [0x28] = BINARY_OP(pmuldq, SSE41, SSE_OPF_MMX),
-    [0x29] = BINARY_OP(pcmpeqq, SSE41, SSE_OPF_MMX),
-    [0x2a] = SPECIAL_OP(SSE41), /* movntdqa */
-    [0x2b] = BINARY_OP(packusdw, SSE41, SSE_OPF_MMX),
-    [0x30] = UNARY_OP(pmovzxbw, SSE41, SSE_OPF_MMX),
-    [0x31] = UNARY_OP(pmovzxbd, SSE41, SSE_OPF_MMX),
-    [0x32] = UNARY_OP(pmovzxbq, SSE41, SSE_OPF_MMX),
-    [0x33] = UNARY_OP(pmovzxwd, SSE41, SSE_OPF_MMX),
-    [0x34] = UNARY_OP(pmovzxwq, SSE41, SSE_OPF_MMX),
-    [0x35] = UNARY_OP(pmovzxdq, SSE41, SSE_OPF_MMX),
-    [0x37] = BINARY_OP(pcmpgtq, SSE41, SSE_OPF_MMX),
-    [0x38] = BINARY_OP(pminsb, SSE41, SSE_OPF_MMX),
-    [0x39] = BINARY_OP(pminsd, SSE41, SSE_OPF_MMX),
-    [0x3a] = BINARY_OP(pminuw, SSE41, SSE_OPF_MMX),
-    [0x3b] = BINARY_OP(pminud, SSE41, SSE_OPF_MMX),
-    [0x3c] = BINARY_OP(pmaxsb, SSE41, SSE_OPF_MMX),
-    [0x3d] = BINARY_OP(pmaxsd, SSE41, SSE_OPF_MMX),
-    [0x3e] = BINARY_OP(pmaxuw, SSE41, SSE_OPF_MMX),
-    [0x3f] = BINARY_OP(pmaxud, SSE41, SSE_OPF_MMX),
-    [0x40] = BINARY_OP(pmulld, SSE41, SSE_OPF_MMX),
-    [0x41] = UNARY_OP(phminposuw, SSE41, 0),
-    [0xdb] = UNARY_OP(aesimc, AES, 0),
-    [0xdc] = BINARY_OP(aesenc, AES, 0),
-    [0xdd] = BINARY_OP(aesenclast, AES, 0),
-    [0xde] = BINARY_OP(aesdec, AES, 0),
-    [0xdf] = BINARY_OP(aesdeclast, AES, 0),
-};
-
-/* prefix [66] 0f 3a */
-static const struct SSEOpHelper_table7 sse_op_table7[256] = {
-    [0x08] = UNARY_OP(roundps, SSE41, 0),
-    [0x09] = UNARY_OP(roundpd, SSE41, 0),
-    [0x0a] = BINARY_OP(roundss, SSE41, SSE_OPF_SCALAR),
-    [0x0b] = BINARY_OP(roundsd, SSE41, SSE_OPF_SCALAR),
-    [0x0c] = BINARY_OP(blendps, SSE41, 0),
-    [0x0d] = BINARY_OP(blendpd, SSE41, 0),
-    [0x0e] = BINARY_OP(pblendw, SSE41, SSE_OPF_MMX),
-    [0x0f] = BINARY_OP_MMX(palignr, SSSE3),
-    [0x14] = SPECIAL_OP(SSE41), /* pextrb */
-    [0x15] = SPECIAL_OP(SSE41), /* pextrw */
-    [0x16] = SPECIAL_OP(SSE41), /* pextrd/pextrq */
-    [0x17] = SPECIAL_OP(SSE41), /* extractps */
-    [0x20] = SPECIAL_OP(SSE41), /* pinsrb */
-    [0x21] = SPECIAL_OP(SSE41), /* insertps */
-    [0x22] = SPECIAL_OP(SSE41), /* pinsrd/pinsrq */
-    [0x40] = BINARY_OP(dpps, SSE41, 0),
-    [0x41] = BINARY_OP(dppd, SSE41, 0),
-    [0x42] = BINARY_OP(mpsadbw, SSE41, SSE_OPF_MMX),
-    [0x44] = BINARY_OP(pclmulqdq, PCLMULQDQ, 0),
-    [0x60] = CMP_OP(pcmpestrm, SSE42),
-    [0x61] = CMP_OP(pcmpestri, SSE42),
-    [0x62] = CMP_OP(pcmpistrm, SSE42),
-    [0x63] = CMP_OP(pcmpistri, SSE42),
-    [0xdf] = UNARY_OP(aeskeygenassist, AES, 0),
-};
-
-#undef OP
-#undef BINARY_OP_MMX
-#undef BINARY_OP
-#undef UNARY_OP_MMX
-#undef UNARY_OP
-#undef BLENDV_OP
-#undef SPECIAL_OP
-
-/* VEX prefix not allowed */
-#define CHECK_NO_VEX(s) do { \
-    if (s->prefix & PREFIX_VEX) \
-        goto illegal_op; \
-    } while (0)
-
-static void gen_sse(CPUX86State *env, DisasContext *s, int b)
-{
-    int b1, op1_offset, op2_offset, is_xmm, val;
-    int modrm, mod, rm, reg;
-    int sse_op_flags;
-    SSEFuncs sse_op_fn;
-    const struct SSEOpHelper_table6 *op6;
-    const struct SSEOpHelper_table7 *op7;
-    MemOp ot;
-
-    b &= 0xff;
-    if (s->prefix & PREFIX_DATA)
-        b1 = 1;
-    else if (s->prefix & PREFIX_REPZ)
-        b1 = 2;
-    else if (s->prefix & PREFIX_REPNZ)
-        b1 = 3;
-    else
-        b1 = 0;
-    sse_op_flags = sse_op_table1[b].flags;
-    sse_op_fn = sse_op_table1[b].fn[b1];
-    if ((sse_op_flags & SSE_OPF_SPECIAL) == 0
-            && !sse_op_fn.op1) {
-        goto unknown_op;
-    }
-    if ((b <= 0x5f && b >= 0x10) || b == 0xc6 || b == 0xc2) {
-        is_xmm = 1;
-    } else {
-        if (b1 == 0) {
-            /* MMX case */
-            is_xmm = 0;
-        } else {
-            is_xmm = 1;
-        }
-    }
-    /* simple MMX/SSE operation */
-    if (s->flags & HF_TS_MASK) {
-        gen_exception(s, EXCP07_PREX);
-        return;
-    }
-    if (s->flags & HF_EM_MASK) {
-    illegal_op:
-        gen_illegal_opcode(s);
-        return;
-    }
-    if (is_xmm
-        && !(s->flags & HF_OSFXSR_MASK)
-        && (b != 0x38 && b != 0x3a)) {
-        goto unknown_op;
-    }
-    if (b == 0x77) {
-        /* emms */
-        gen_helper_emms(cpu_env);
-        return;
-    }
-    /* prepare MMX state (XXX: optimize by storing fptt and fptags in
-       the static cpu state) */
-    if (!is_xmm) {
-        gen_helper_enter_mmx(cpu_env);
-    }
-
-    modrm = x86_ldub_code(env, s);
-    reg = ((modrm >> 3) & 7);
-    if (is_xmm) {
-        reg |= REX_R(s);
-    }
-    mod = (modrm >> 6) & 3;
-    if (sse_op_flags & SSE_OPF_SPECIAL) {
-        b |= (b1 << 8);
-        switch(b) {
-        case 0x0e7: /* movntq */
-            CHECK_NO_VEX(s);
-            if (mod == 3) {
-                goto illegal_op;
-            }
-            gen_lea_modrm(env, s, modrm);
-            gen_stq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
-            break;
-        case 0x1e7: /* movntdq */
-        case 0x02b: /* movntps */
-        case 0x12b: /* movntpd */
-            if (mod == 3)
-                goto illegal_op;
-            gen_lea_modrm(env, s, modrm);
-            gen_sto_env_A0(s, XMM_OFFSET(reg), true);
-            break;
-        case 0x3f0: /* lddqu */
-            if (mod == 3)
-                goto illegal_op;
-            gen_lea_modrm(env, s, modrm);
-            gen_ldo_env_A0(s, XMM_OFFSET(reg), true);
-            break;
-        case 0x22b: /* movntss */
-        case 0x32b: /* movntsd */
-            if (mod == 3)
-                goto illegal_op;
-            gen_lea_modrm(env, s, modrm);
-            if (b1 & 1) {
-                gen_stq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State,
-                    xmm_regs[reg].ZMM_L(0)));
-                gen_op_st_v(s, MO_32, s->T0, s->A0);
-            }
-            break;
-        case 0x6e: /* movd mm, ea */
-            CHECK_NO_VEX(s);
-#ifdef TARGET_X86_64
-            if (s->dflag == MO_64) {
-                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
-                tcg_gen_st_tl(s->T0, cpu_env,
-                              offsetof(CPUX86State, fpregs[reg].mmx));
-            } else
-#endif
-            {
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State,fpregs[reg].mmx));
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_movl_mm_T0_mmx(s->ptr0, s->tmp2_i32);
-            }
-            break;
-        case 0x16e: /* movd xmm, ea */
-#ifdef TARGET_X86_64
-            if (s->dflag == MO_64) {
-                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(reg));
-                gen_helper_movq_mm_T0_xmm(s->ptr0, s->T0);
-            } else
-#endif
-            {
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(reg));
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_movl_mm_T0_xmm(s->ptr0, s->tmp2_i32);
-            }
-            break;
-        case 0x6f: /* movq mm, ea */
-            CHECK_NO_VEX(s);
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
-            } else {
-                rm = (modrm & 7);
-                tcg_gen_ld_i64(s->tmp1_i64, cpu_env,
-                               offsetof(CPUX86State,fpregs[rm].mmx));
-                tcg_gen_st_i64(s->tmp1_i64, cpu_env,
-                               offsetof(CPUX86State,fpregs[reg].mmx));
-            }
-            break;
-        case 0x010: /* movups */
-        case 0x110: /* movupd */
-        case 0x028: /* movaps */
-        case 0x128: /* movapd */
-        case 0x16f: /* movdqa xmm, ea */
-        case 0x26f: /* movdqu xmm, ea */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, XMM_OFFSET(reg),
-                               /* movaps, movapd, movdqa */
-                               b == 0x028 || b == 0x128 || b == 0x16f);
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, XMM_OFFSET(reg), XMM_OFFSET(rm));
-            }
-            break;
-        case 0x210: /* movss xmm, ea */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_op_ld_v(s, MO_32, s->T0, s->A0);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
-                tcg_gen_movi_tl(s->T0, 0);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)));
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)));
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
-                               offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)));
-                tcg_gen_st_i32(s->tmp2_i32, cpu_env,
-                               offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
-            }
-            break;
-        case 0x310: /* movsd xmm, ea */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-                tcg_gen_movi_tl(s->T0, 0);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)));
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)));
-            }
-            break;
-        case 0x012: /* movlps */
-        case 0x112: /* movlpd */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                /* movhlps */
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(1)));
-            }
-            break;
-        case 0x212: /* movsldup */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, XMM_OFFSET(reg), true);
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(2)));
-            }
-            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
-            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(2)));
-            break;
-        case 0x312: /* movddup */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
-            }
-            gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
-            break;
-        case 0x016: /* movhps */
-        case 0x116: /* movhpd */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(1)));
-            } else {
-                /* movlhps */
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
-            }
-            break;
-        case 0x216: /* movshdup */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, XMM_OFFSET(reg), true);
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(1)));
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(3)));
-            }
-            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(1)));
-            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(3)));
-            break;
-        case 0x178:
-        case 0x378:
-            CHECK_NO_VEX(s);
-            {
-                int bit_index, field_length;
-
-                if (b1 == 1 && reg != 0)
-                    goto illegal_op;
-                field_length = x86_ldub_code(env, s) & 0x3F;
-                bit_index = x86_ldub_code(env, s) & 0x3F;
-                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(reg));
-                if (b1 == 1)
-                    gen_helper_extrq_i(cpu_env, s->ptr0,
-                                       tcg_const_i32(bit_index),
-                                       tcg_const_i32(field_length));
-                else {
-                    if (mod != 3) {
-                        gen_lea_modrm(env, s, modrm);
-                        op2_offset = offsetof(CPUX86State, xmm_t0);
-                        gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_D(0)));
-                    } else {
-                        rm = (modrm & 7) | REX_B(s);
-                        op2_offset = ZMM_OFFSET(rm);
-                    }
-                    tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-                    gen_helper_insertq_i(cpu_env, s->ptr0, s->ptr1,
-                                         tcg_const_i32(bit_index),
-                                         tcg_const_i32(field_length));
-                }
-            }
-            break;
-        case 0x7e: /* movd ea, mm */
-            CHECK_NO_VEX(s);
-#ifdef TARGET_X86_64
-            if (s->dflag == MO_64) {
-                tcg_gen_ld_i64(s->T0, cpu_env,
-                               offsetof(CPUX86State,fpregs[reg].mmx));
-                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 1);
-            } else
-#endif
-            {
-                tcg_gen_ld32u_tl(s->T0, cpu_env,
-                                 offsetof(CPUX86State,fpregs[reg].mmx.MMX_L(0)));
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 1);
-            }
-            break;
-        case 0x17e: /* movd ea, xmm */
-#ifdef TARGET_X86_64
-            if (s->dflag == MO_64) {
-                tcg_gen_ld_i64(s->T0, cpu_env,
-                               offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
-                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 1);
-            } else
-#endif
-            {
-                tcg_gen_ld32u_tl(s->T0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 1);
-            }
-            break;
-        case 0x27e: /* movq xmm, ea */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
-            }
-            gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
-            break;
-        case 0x7f: /* movq ea, mm */
-            CHECK_NO_VEX(s);
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_stq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
-            } else {
-                rm = (modrm & 7);
-                gen_op_movq(s, offsetof(CPUX86State, fpregs[rm].mmx),
-                            offsetof(CPUX86State,fpregs[reg].mmx));
-            }
-            break;
-        case 0x011: /* movups */
-        case 0x111: /* movupd */
-        case 0x029: /* movaps */
-        case 0x129: /* movapd */
-        case 0x17f: /* movdqa ea, xmm */
-        case 0x27f: /* movdqu ea, xmm */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_sto_env_A0(s, XMM_OFFSET(reg),
-                               /* movaps, movapd, movdqa */
-                               b == 0x029 || b == 0x129 || b == 0x17f);
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, XMM_OFFSET(rm), XMM_OFFSET(reg));
-            }
-            break;
-        case 0x211: /* movss ea, xmm */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                tcg_gen_ld32u_tl(s->T0, cpu_env,
-                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
-                gen_op_st_v(s, MO_32, s->T0, s->A0);
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
-            }
-            break;
-        case 0x311: /* movsd ea, xmm */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_stq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
-            }
-            break;
-        case 0x013: /* movlps */
-        case 0x113: /* movlpd */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_stq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                goto illegal_op;
-            }
-            break;
-        case 0x017: /* movhps */
-        case 0x117: /* movhpd */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_stq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(1)));
-            } else {
-                goto illegal_op;
-            }
-            break;
-        case 0x71: /* shift mm, im */
-        case 0x72:
-        case 0x73:
-        case 0x171: /* shift xmm, im */
-        case 0x172:
-        case 0x173:
-            val = x86_ldub_code(env, s);
-            if (is_xmm) {
-                tcg_gen_movi_tl(s->T0, val);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
-                tcg_gen_movi_tl(s->T0, 0);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_t0.ZMM_L(1)));
-                op1_offset = offsetof(CPUX86State,xmm_t0);
-            } else {
-                CHECK_NO_VEX(s);
-                tcg_gen_movi_tl(s->T0, val);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, mmx_t0.MMX_L(0)));
-                tcg_gen_movi_tl(s->T0, 0);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, mmx_t0.MMX_L(1)));
-                op1_offset = offsetof(CPUX86State,mmx_t0);
-            }
-            assert(b1 < 2);
-            SSEFunc_0_eppp fn = sse_op_table2[((b - 1) & 3) * 8 +
-                                       (((modrm >> 3)) & 7)][b1];
-            if (!fn) {
-                goto unknown_op;
-            }
-            if (is_xmm) {
-                rm = (modrm & 7) | REX_B(s);
-                op2_offset = ZMM_OFFSET(rm);
-            } else {
-                rm = (modrm & 7);
-                op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
-            }
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            tcg_gen_addi_ptr(s->ptr2, cpu_env, op1_offset);
-            fn(cpu_env, s->ptr0, s->ptr1, s->ptr2);
-            break;
-        case 0x050: /* movmskps */
-            rm = (modrm & 7) | REX_B(s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
-            gen_helper_movmskps_xmm(s->tmp2_i32, cpu_env, s->ptr0);
-            tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
-            break;
-        case 0x150: /* movmskpd */
-            rm = (modrm & 7) | REX_B(s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
-            gen_helper_movmskpd_xmm(s->tmp2_i32, cpu_env, s->ptr0);
-            tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
-            break;
-        case 0x02a: /* cvtpi2ps */
-        case 0x12a: /* cvtpi2pd */
-            CHECK_NO_VEX(s);
-            gen_helper_enter_mmx(cpu_env);
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,mmx_t0);
-                gen_ldq_env_A0(s, op2_offset);
-            } else {
-                rm = (modrm & 7);
-                op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
-            }
-            op1_offset = ZMM_OFFSET(reg);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            switch(b >> 8) {
-            case 0x0:
-                gen_helper_cvtpi2ps(cpu_env, s->ptr0, s->ptr1);
-                break;
-            default:
-            case 0x1:
-                gen_helper_cvtpi2pd(cpu_env, s->ptr0, s->ptr1);
-                break;
-            }
-            break;
-        case 0x22a: /* cvtsi2ss */
-        case 0x32a: /* cvtsi2sd */
-            ot = mo_64_32(s->dflag);
-            gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-            op1_offset = ZMM_OFFSET(reg);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            if (ot == MO_32) {
-                SSEFunc_0_epi sse_fn_epi = sse_op_table3ai[(b >> 8) & 1];
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                sse_fn_epi(cpu_env, s->ptr0, s->tmp2_i32);
-            } else {
-#ifdef TARGET_X86_64
-                SSEFunc_0_epl sse_fn_epl = sse_op_table3aq[(b >> 8) & 1];
-                sse_fn_epl(cpu_env, s->ptr0, s->T0);
-#else
-                goto illegal_op;
-#endif
-            }
-            break;
-        case 0x02c: /* cvttps2pi */
-        case 0x12c: /* cvttpd2pi */
-        case 0x02d: /* cvtps2pi */
-        case 0x12d: /* cvtpd2pi */
-            CHECK_NO_VEX(s);
-            gen_helper_enter_mmx(cpu_env);
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State, xmm_t0.ZMM_X(0));
-                /* FIXME: should be 64-bit access if b1 == 0.  */
-                gen_ldo_env_A0(s, op2_offset, !!b1);
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                op2_offset = ZMM_OFFSET(rm);
-            }
-            op1_offset = offsetof(CPUX86State,fpregs[reg & 7].mmx);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            switch(b) {
-            case 0x02c:
-                gen_helper_cvttps2pi(cpu_env, s->ptr0, s->ptr1);
-                break;
-            case 0x12c:
-                gen_helper_cvttpd2pi(cpu_env, s->ptr0, s->ptr1);
-                break;
-            case 0x02d:
-                gen_helper_cvtps2pi(cpu_env, s->ptr0, s->ptr1);
-                break;
-            case 0x12d:
-                gen_helper_cvtpd2pi(cpu_env, s->ptr0, s->ptr1);
-                break;
-            }
-            break;
-        case 0x22c: /* cvttss2si */
-        case 0x32c: /* cvttsd2si */
-        case 0x22d: /* cvtss2si */
-        case 0x32d: /* cvtsd2si */
-            ot = mo_64_32(s->dflag);
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                if ((b >> 8) & 1) {
-                    gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_Q(0)));
-                } else {
-                    gen_op_ld_v(s, MO_32, s->T0, s->A0);
-                    tcg_gen_st32_tl(s->T0, cpu_env,
-                                    offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
-                }
-                op2_offset = offsetof(CPUX86State,xmm_t0);
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                op2_offset = ZMM_OFFSET(rm);
-            }
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
-            if (ot == MO_32) {
-                SSEFunc_i_ep sse_fn_i_ep =
-                    sse_op_table3bi[((b >> 7) & 2) | (b & 1)];
-                sse_fn_i_ep(s->tmp2_i32, cpu_env, s->ptr0);
-                tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
-            } else {
-#ifdef TARGET_X86_64
-                SSEFunc_l_ep sse_fn_l_ep =
-                    sse_op_table3bq[((b >> 7) & 2) | (b & 1)];
-                sse_fn_l_ep(s->T0, cpu_env, s->ptr0);
-#else
-                goto illegal_op;
-#endif
-            }
-            gen_op_mov_reg_v(s, ot, reg, s->T0);
-            break;
-        case 0xc4: /* pinsrw */
-        case 0x1c4:
-            s->rip_offset = 1;
-            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-            val = x86_ldub_code(env, s);
-            if (b1) {
-                val &= 7;
-                tcg_gen_st16_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State,xmm_regs[reg].ZMM_W(val)));
-            } else {
-                CHECK_NO_VEX(s);
-                val &= 3;
-                tcg_gen_st16_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State,fpregs[reg].mmx.MMX_W(val)));
-            }
-            break;
-        case 0xc5: /* pextrw */
-        case 0x1c5:
-            if (mod != 3)
-                goto illegal_op;
-            ot = mo_64_32(s->dflag);
-            val = x86_ldub_code(env, s);
-            if (b1) {
-                val &= 7;
-                rm = (modrm & 7) | REX_B(s);
-                tcg_gen_ld16u_tl(s->T0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[rm].ZMM_W(val)));
-            } else {
-                val &= 3;
-                rm = (modrm & 7);
-                tcg_gen_ld16u_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State,fpregs[rm].mmx.MMX_W(val)));
-            }
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            gen_op_mov_reg_v(s, ot, reg, s->T0);
-            break;
-        case 0x1d6: /* movq ea, xmm */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_stq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
-                gen_op_movq_env_0(s,
-                                  offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(1)));
-            }
-            break;
-        case 0x2d6: /* movq2dq */
-            CHECK_NO_VEX(s);
-            gen_helper_enter_mmx(cpu_env);
-            rm = (modrm & 7);
-            gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                        offsetof(CPUX86State,fpregs[rm].mmx));
-            gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
-            break;
-        case 0x3d6: /* movdq2q */
-            CHECK_NO_VEX(s);
-            gen_helper_enter_mmx(cpu_env);
-            rm = (modrm & 7) | REX_B(s);
-            gen_op_movq(s, offsetof(CPUX86State, fpregs[reg & 7].mmx),
-                        offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
-            break;
-        case 0xd7: /* pmovmskb */
-        case 0x1d7:
-            if (mod != 3)
-                goto illegal_op;
-            if (b1) {
-                rm = (modrm & 7) | REX_B(s);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
-                gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
-            } else {
-                CHECK_NO_VEX(s);
-                rm = (modrm & 7);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State, fpregs[rm].mmx));
-                gen_helper_pmovmskb_mmx(s->tmp2_i32, cpu_env, s->ptr0);
-            }
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
-            break;
-
-        case 0x138:
-        case 0x038:
-            b = modrm;
-            if ((b & 0xf0) == 0xf0) {
-                goto do_0f_38_fx;
-            }
-            modrm = x86_ldub_code(env, s);
-            rm = modrm & 7;
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            mod = (modrm >> 6) & 3;
-
-            assert(b1 < 2);
-            op6 = &sse_op_table6[b];
-            if (op6->ext_mask == 0) {
-                goto unknown_op;
-            }
-            if (!(s->cpuid_ext_features & op6->ext_mask)) {
-                goto illegal_op;
-            }
-
-            if (b1) {
-                op1_offset = ZMM_OFFSET(reg);
-                if (mod == 3) {
-                    op2_offset = ZMM_OFFSET(rm | REX_B(s));
-                } else {
-                    op2_offset = offsetof(CPUX86State,xmm_t0);
-                    gen_lea_modrm(env, s, modrm);
-                    switch (b) {
-                    case 0x20: case 0x30: /* pmovsxbw, pmovzxbw */
-                    case 0x23: case 0x33: /* pmovsxwd, pmovzxwd */
-                    case 0x25: case 0x35: /* pmovsxdq, pmovzxdq */
-                        gen_ldq_env_A0(s, op2_offset +
-                                        offsetof(ZMMReg, ZMM_Q(0)));
-                        break;
-                    case 0x21: case 0x31: /* pmovsxbd, pmovzxbd */
-                    case 0x24: case 0x34: /* pmovsxwq, pmovzxwq */
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        tcg_gen_st_i32(s->tmp2_i32, cpu_env, op2_offset +
-                                        offsetof(ZMMReg, ZMM_L(0)));
-                        break;
-                    case 0x22: case 0x32: /* pmovsxbq, pmovzxbq */
-                        tcg_gen_qemu_ld_tl(s->tmp0, s->A0,
-                                           s->mem_index, MO_LEUW);
-                        tcg_gen_st16_tl(s->tmp0, cpu_env, op2_offset +
-                                        offsetof(ZMMReg, ZMM_W(0)));
-                        break;
-                    case 0x2a:            /* movntdqa */
-                        gen_ldo_env_A0(s, op1_offset + offsetof(ZMMReg, ZMM_X(0)), true);
-                        return;
-                    default:
-                        gen_ldo_env_A0(s, op2_offset + offsetof(ZMMReg, ZMM_X(0)), true);
-                    }
-                }
-                if (!op6->fn[b1].op1) {
-                    goto illegal_op;
-                }
-                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-                if (op6->flags & SSE_OPF_V0) {
-                    op6->fn[b1].op1(cpu_env, s->ptr0, s->ptr1);
-                } else {
-                    tcg_gen_addi_ptr(s->ptr2, cpu_env, op1_offset);
-                    if (op6->flags & SSE_OPF_BLENDV) {
-                        TCGv_ptr mask = tcg_temp_new_ptr();
-                        tcg_gen_addi_ptr(mask, cpu_env, ZMM_OFFSET(0));
-                        op6->fn[b1].op3(cpu_env, s->ptr0, s->ptr2, s->ptr1,
-                                       mask);
-                        tcg_temp_free_ptr(mask);
-                    } else {
-                        SSEFunc_0_eppp fn = op6->fn[b1].op2;
-                        fn(cpu_env, s->ptr0, s->ptr2, s->ptr1);
-                    }
-                }
-            } else {
-                CHECK_NO_VEX(s);
-                if ((op6->flags & SSE_OPF_MMX) == 0) {
-                    goto unknown_op;
-                }
-                op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
-                if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
-                } else {
-                    op2_offset = offsetof(CPUX86State,mmx_t0);
-                    gen_lea_modrm(env, s, modrm);
-                    gen_ldq_env_A0(s, op2_offset);
-                }
-                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-                if (op6->flags & SSE_OPF_V0) {
-                    op6->fn[0].op1(cpu_env, s->ptr0, s->ptr1);
-                } else {
-                    op6->fn[0].op2(cpu_env, s->ptr0, s->ptr0, s->ptr1);
-                }
-            }
-
-            if (op6->flags & SSE_OPF_CMP) {
-                set_cc_op(s, CC_OP_EFLAGS);
-            }
-            break;
-
-        case 0x238:
-        case 0x338:
-        do_0f_38_fx:
-            /* Various integer extensions at 0f 38 f[0-f].  */
-            b = modrm | (b1 << 8);
-            modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-
-            switch (b) {
-            case 0x3f0: /* crc32 Gd,Eb */
-            case 0x3f1: /* crc32 Gd,Ey */
-            do_crc32:
-                CHECK_NO_VEX(s);
-                if (!(s->cpuid_ext_features & CPUID_EXT_SSE42)) {
-                    goto illegal_op;
-                }
-                if ((b & 0xff) == 0xf0) {
-                    ot = MO_8;
-                } else if (s->dflag != MO_64) {
-                    ot = (s->prefix & PREFIX_DATA ? MO_16 : MO_32);
-                } else {
-                    ot = MO_64;
-                }
-
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[reg]);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                gen_helper_crc32(s->T0, s->tmp2_i32,
-                                 s->T0, tcg_const_i32(8 << ot));
-
-                ot = mo_64_32(s->dflag);
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                break;
-
-            case 0x1f0: /* crc32 or movbe */
-            case 0x1f1:
-                CHECK_NO_VEX(s);
-                /* For these insns, the f3 prefix is supposed to have priority
-                   over the 66 prefix, but that's not what we implement above
-                   setting b1.  */
-                if (s->prefix & PREFIX_REPNZ) {
-                    goto do_crc32;
-                }
-                /* FALLTHRU */
-            case 0x0f0: /* movbe Gy,My */
-            case 0x0f1: /* movbe My,Gy */
-                CHECK_NO_VEX(s);
-                if (!(s->cpuid_ext_features & CPUID_EXT_MOVBE)) {
-                    goto illegal_op;
-                }
-                if (s->dflag != MO_64) {
-                    ot = (s->prefix & PREFIX_DATA ? MO_16 : MO_32);
-                } else {
-                    ot = MO_64;
-                }
-
-                gen_lea_modrm(env, s, modrm);
-                if ((b & 1) == 0) {
-                    tcg_gen_qemu_ld_tl(s->T0, s->A0,
-                                       s->mem_index, ot | MO_BE);
-                    gen_op_mov_reg_v(s, ot, reg, s->T0);
-                } else {
-                    tcg_gen_qemu_st_tl(cpu_regs[reg], s->A0,
-                                       s->mem_index, ot | MO_BE);
-                }
-                break;
-            case 0x1f6: /* adcx Gy, Ey */
-            case 0x2f6: /* adox Gy, Ey */
-                CHECK_NO_VEX(s);
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_ADX)) {
-                    goto illegal_op;
-                } else {
-                    TCGv carry_in, carry_out, zero;
-                    int end_op;
-
-                    ot = mo_64_32(s->dflag);
-                    gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-
-                    /* Re-use the carry-out from a previous round.  */
-                    carry_in = NULL;
-                    carry_out = (b == 0x1f6 ? cpu_cc_dst : cpu_cc_src2);
-                    switch (s->cc_op) {
-                    case CC_OP_ADCX:
-                        if (b == 0x1f6) {
-                            carry_in = cpu_cc_dst;
-                            end_op = CC_OP_ADCX;
-                        } else {
-                            end_op = CC_OP_ADCOX;
-                        }
-                        break;
-                    case CC_OP_ADOX:
-                        if (b == 0x1f6) {
-                            end_op = CC_OP_ADCOX;
-                        } else {
-                            carry_in = cpu_cc_src2;
-                            end_op = CC_OP_ADOX;
-                        }
-                        break;
-                    case CC_OP_ADCOX:
-                        end_op = CC_OP_ADCOX;
-                        carry_in = carry_out;
-                        break;
-                    default:
-                        end_op = (b == 0x1f6 ? CC_OP_ADCX : CC_OP_ADOX);
-                        break;
-                    }
-                    /* If we can't reuse carry-out, get it out of EFLAGS.  */
-                    if (!carry_in) {
-                        if (s->cc_op != CC_OP_ADCX && s->cc_op != CC_OP_ADOX) {
-                            gen_compute_eflags(s);
-                        }
-                        carry_in = s->tmp0;
-                        tcg_gen_extract_tl(carry_in, cpu_cc_src,
-                                           ctz32(b == 0x1f6 ? CC_C : CC_O), 1);
-                    }
-
-                    switch (ot) {
-#ifdef TARGET_X86_64
-                    case MO_32:
-                        /* If we know TL is 64-bit, and we want a 32-bit
-                           result, just do everything in 64-bit arithmetic.  */
-                        tcg_gen_ext32u_i64(cpu_regs[reg], cpu_regs[reg]);
-                        tcg_gen_ext32u_i64(s->T0, s->T0);
-                        tcg_gen_add_i64(s->T0, s->T0, cpu_regs[reg]);
-                        tcg_gen_add_i64(s->T0, s->T0, carry_in);
-                        tcg_gen_ext32u_i64(cpu_regs[reg], s->T0);
-                        tcg_gen_shri_i64(carry_out, s->T0, 32);
-                        break;
-#endif
-                    default:
-                        /* Otherwise compute the carry-out in two steps.  */
-                        zero = tcg_const_tl(0);
-                        tcg_gen_add2_tl(s->T0, carry_out,
-                                        s->T0, zero,
-                                        carry_in, zero);
-                        tcg_gen_add2_tl(cpu_regs[reg], carry_out,
-                                        cpu_regs[reg], carry_out,
-                                        s->T0, zero);
-                        tcg_temp_free(zero);
-                        break;
-                    }
-                    set_cc_op(s, end_op);
-                }
-                break;
-
-            }
-            break;
-
-        case 0x03a:
-        case 0x13a:
-            b = modrm;
-            modrm = x86_ldub_code(env, s);
-            rm = modrm & 7;
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            mod = (modrm >> 6) & 3;
-
-            assert(b1 < 2);
-            op7 = &sse_op_table7[b];
-            if (op7->ext_mask == 0) {
-                goto unknown_op;
-            }
-            if (!(s->cpuid_ext_features & op7->ext_mask)) {
-                goto illegal_op;
-            }
-
-            s->rip_offset = 1;
-
-            if (op7->flags & SSE_OPF_SPECIAL) {
-                /* None of the "special" ops are valid on mmx registers */
-                if (b1 == 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                rm = (modrm & 7) | REX_B(s);
-                if (mod != 3)
-                    gen_lea_modrm(env, s, modrm);
-                reg = ((modrm >> 3) & 7) | REX_R(s);
-                val = x86_ldub_code(env, s);
-                switch (b) {
-                case 0x14: /* pextrb */
-                    tcg_gen_ld8u_tl(s->T0, cpu_env, offsetof(CPUX86State,
-                                            xmm_regs[reg].ZMM_B(val & 15)));
-                    if (mod == 3) {
-                        gen_op_mov_reg_v(s, ot, rm, s->T0);
-                    } else {
-                        tcg_gen_qemu_st_tl(s->T0, s->A0,
-                                           s->mem_index, MO_UB);
-                    }
-                    break;
-                case 0x15: /* pextrw */
-                    tcg_gen_ld16u_tl(s->T0, cpu_env, offsetof(CPUX86State,
-                                            xmm_regs[reg].ZMM_W(val & 7)));
-                    if (mod == 3) {
-                        gen_op_mov_reg_v(s, ot, rm, s->T0);
-                    } else {
-                        tcg_gen_qemu_st_tl(s->T0, s->A0,
-                                           s->mem_index, MO_LEUW);
-                    }
-                    break;
-                case 0x16:
-                    if (ot == MO_32) { /* pextrd */
-                        tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
-                                        offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(val & 3)));
-                        if (mod == 3) {
-                            tcg_gen_extu_i32_tl(cpu_regs[rm], s->tmp2_i32);
-                        } else {
-                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUL);
-                        }
-                    } else { /* pextrq */
-#ifdef TARGET_X86_64
-                        tcg_gen_ld_i64(s->tmp1_i64, cpu_env,
-                                        offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_Q(val & 1)));
-                        if (mod == 3) {
-                            tcg_gen_mov_i64(cpu_regs[rm], s->tmp1_i64);
-                        } else {
-                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
-                                                s->mem_index, MO_LEUQ);
-                        }
-#else
-                        goto illegal_op;
-#endif
-                    }
-                    break;
-                case 0x17: /* extractps */
-                    tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State,
-                                            xmm_regs[reg].ZMM_L(val & 3)));
-                    if (mod == 3) {
-                        gen_op_mov_reg_v(s, ot, rm, s->T0);
-                    } else {
-                        tcg_gen_qemu_st_tl(s->T0, s->A0,
-                                           s->mem_index, MO_LEUL);
-                    }
-                    break;
-                case 0x20: /* pinsrb */
-                    if (mod == 3) {
-                        gen_op_mov_v_reg(s, MO_32, s->T0, rm);
-                    } else {
-                        tcg_gen_qemu_ld_tl(s->T0, s->A0,
-                                           s->mem_index, MO_UB);
-                    }
-                    tcg_gen_st8_tl(s->T0, cpu_env, offsetof(CPUX86State,
-                                            xmm_regs[reg].ZMM_B(val & 15)));
-                    break;
-                case 0x21: /* insertps */
-                    if (mod == 3) {
-                        tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
-                                        offsetof(CPUX86State,xmm_regs[rm]
-                                                .ZMM_L((val >> 6) & 3)));
-                    } else {
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                    }
-                    tcg_gen_st_i32(s->tmp2_i32, cpu_env,
-                                    offsetof(CPUX86State,xmm_regs[reg]
-                                            .ZMM_L((val >> 4) & 3)));
-                    if ((val >> 0) & 1)
-                        tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
-                                        cpu_env, offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(0)));
-                    if ((val >> 1) & 1)
-                        tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
-                                        cpu_env, offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(1)));
-                    if ((val >> 2) & 1)
-                        tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
-                                        cpu_env, offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(2)));
-                    if ((val >> 3) & 1)
-                        tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
-                                        cpu_env, offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(3)));
-                    break;
-                case 0x22:
-                    if (ot == MO_32) { /* pinsrd */
-                        if (mod == 3) {
-                            tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[rm]);
-                        } else {
-                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUL);
-                        }
-                        tcg_gen_st_i32(s->tmp2_i32, cpu_env,
-                                        offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(val & 3)));
-                    } else { /* pinsrq */
-#ifdef TARGET_X86_64
-                        if (mod == 3) {
-                            gen_op_mov_v_reg(s, ot, s->tmp1_i64, rm);
-                        } else {
-                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
-                                                s->mem_index, MO_LEUQ);
-                        }
-                        tcg_gen_st_i64(s->tmp1_i64, cpu_env,
-                                        offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_Q(val & 1)));
-#else
-                        goto illegal_op;
-#endif
-                    }
-                    break;
-                }
-                return;
-            }
-
-            if (b1 == 0) {
-                CHECK_NO_VEX(s);
-                /* MMX */
-                if ((op7->flags & SSE_OPF_MMX) == 0) {
-                    goto illegal_op;
-                }
-                op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
-                if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
-                } else {
-                    op2_offset = offsetof(CPUX86State,mmx_t0);
-                    gen_lea_modrm(env, s, modrm);
-                    gen_ldq_env_A0(s, op2_offset);
-                }
-                val = x86_ldub_code(env, s);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-
-                /* We only actually have one MMX instuction (palignr) */
-                assert(b == 0x0f);
-
-                op7->fn[0].op2(cpu_env, s->ptr0, s->ptr0, s->ptr1,
-                               tcg_const_i32(val));
-                break;
-            }
-
-            /* SSE */
-            op1_offset = ZMM_OFFSET(reg);
-            if (mod == 3) {
-                op2_offset = ZMM_OFFSET(rm | REX_B(s));
-            } else {
-                op2_offset = offsetof(CPUX86State, xmm_t0);
-                gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, op2_offset + offsetof(ZMMReg, ZMM_X(0)), true);
-            }
-
-            val = x86_ldub_code(env, s);
-            if ((b & 0xfc) == 0x60) { /* pcmpXstrX */
-                set_cc_op(s, CC_OP_EFLAGS);
-
-                if (s->dflag == MO_64) {
-                    /* The helper must use entire 64-bit gp registers */
-                    val |= 1 << 8;
-                }
-            }
-
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            if (op7->flags & SSE_OPF_V0) {
-                op7->fn[b1].op1(cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
-            } else {
-                tcg_gen_addi_ptr(s->ptr2, cpu_env, op1_offset);
-                op7->fn[b1].op2(cpu_env, s->ptr0, s->ptr2, s->ptr1,
-                               tcg_const_i32(val));
-            }
-            if (op7->flags & SSE_OPF_CMP) {
-                set_cc_op(s, CC_OP_EFLAGS);
-            }
-            break;
-
-        default:
-        unknown_op:
-            gen_unknown_opcode(env, s);
-            return;
-        }
-    } else {
-        /* generic MMX or SSE operation */
-        switch(b) {
-        case 0x70: /* pshufx insn */
-        case 0xc6: /* pshufx insn */
-        case 0xc2: /* compare insns */
-            s->rip_offset = 1;
-            break;
-        default:
-            break;
-        }
-        if (is_xmm) {
-            op1_offset = ZMM_OFFSET(reg);
-            if (mod != 3) {
-                int sz = 4;
-
-                gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State, xmm_t0);
-
-                if (sse_op_flags & SSE_OPF_SCALAR) {
-                    if (sse_op_flags & SSE_OPF_CMP) {
-                        /* ucomis[sd], comis[sd] */
-                        if (b1 == 0) {
-                            sz = 2;
-                        } else {
-                            sz = 3;
-                        }
-                    } else {
-                        /* Most sse scalar operations.  */
-                        if (b1 == 2) {
-                            sz = 2;
-                        } else if (b1 == 3) {
-                            sz = 3;
-                        }
-                    }
-                }
-
-                switch (sz) {
-                case 2:
-                    /* 32 bit access */
-                    gen_op_ld_v(s, MO_32, s->T0, s->A0);
-                    tcg_gen_st32_tl(s->T0, cpu_env,
-                                    offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
-                    break;
-                case 3:
-                    /* 64 bit access */
-                    gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_D(0)));
-                    break;
-                default:
-                    /* 128 bit access */
-                    gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_X(0)), true);
-                    break;
-                }
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                op2_offset = ZMM_OFFSET(rm);
-            }
-        } else {
-            CHECK_NO_VEX(s);
-            op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,mmx_t0);
-                gen_ldq_env_A0(s, op2_offset);
-            } else {
-                rm = (modrm & 7);
-                op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
-            }
-        }
-
-
-        tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-        tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-        if ((sse_op_flags & SSE_OPF_V0) &&
-            !((sse_op_flags & SSE_OPF_SCALAR) && b1 >= 2)) {
-            if (sse_op_flags & SSE_OPF_SHUF) {
-                val = x86_ldub_code(env, s);
-                sse_op_fn.op1i(s->ptr0, s->ptr1, tcg_const_i32(val));
-            } else if (b == 0xf7) {
-                /* maskmov : we must prepare A0 */
-                if (mod != 3) {
-                    goto illegal_op;
-                }
-                tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
-                gen_extu(s->aflag, s->A0);
-                gen_add_A0_ds_seg(s);
-
-                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-                sse_op_fn.op1t(cpu_env, s->ptr0, s->ptr1, s->A0);
-                /* Does not write to the fist operand */
-                return;
-            } else {
-                sse_op_fn.op1(cpu_env, s->ptr0, s->ptr1);
-            }
-        } else {
-            tcg_gen_addi_ptr(s->ptr2, cpu_env, op1_offset);
-            if (sse_op_flags & SSE_OPF_SHUF) {
-                val = x86_ldub_code(env, s);
-                sse_op_fn.op2i(s->ptr0, s->ptr2, s->ptr1,
-                                   tcg_const_i32(val));
-            } else {
-                SSEFunc_0_eppp fn = sse_op_fn.op2;
-                if (b == 0xc2) {
-                    /* compare insns */
-                    val = x86_ldub_code(env, s) & 7;
-                    fn = sse_op_table4[val][b1];
-                }
-                fn(cpu_env, s->ptr0, s->ptr2, s->ptr1);
-            }
-        }
-
-        if (sse_op_flags & SSE_OPF_CMP) {
-            set_cc_op(s, CC_OP_EFLAGS);
-        }
-    }
-}
-
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
 static bool disas_insn(DisasContext *s, CPUState *cpu)
@@ -4694,40 +3005,15 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 
     prefixes = 0;
 
-    if (first) first = false, limit = getenv("LIMIT") ? atol(getenv("LIMIT")) : -1;
-    bool use_new = true;
-#ifdef CONFIG_USER_ONLY
-    use_new &= limit > 0;
-#endif
  next_byte:
     s->prefix = prefixes;
     b = x86_ldub_code(env, s);
     /* Collect prefixes.  */
     switch (b) {
     default:
-#ifndef CONFIG_USER_ONLY
-        use_new &= b <= limit;
-#endif
-        if (use_new && 0) {
-            disas_insn_new(s, cpu, b);
-            return s->pc;
-        }
         break;
     case 0x0f:
         b = x86_ldub_code(env, s) + 0x100;
-#ifndef CONFIG_USER_ONLY
-        use_new &= b <= limit;
-#endif
-        if (use_new &&
-            (b == 0x138 || b == 0x13a ||
-             (b >= 0x10e && b <= 0x117) ||
-             (b >= 0x128 && b <= 0x12f) ||
-             (b >= 0x150 && b <= 0x17f) ||
-             b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
-             (b >= 0x1d0 && b <= 0x1ff))) {
-            disas_insn_new(s, cpu, b + 0x100);
-            return s->pc;
-        }
         break;
     case 0xf3:
         prefixes |= PREFIX_REPZ;
@@ -8449,7 +6735,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 
         set_cc_op(s, CC_OP_POPCNT);
         break;
-    case 0x110 ... 0x117:
+    case 0x10e ... 0x117:
     case 0x128 ... 0x12f:
     case 0x138 ... 0x13a:
     case 0x150 ... 0x179:
@@ -8457,7 +6743,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1c2:
     case 0x1c4 ... 0x1c6:
     case 0x1d0 ... 0x1fe:
-        gen_sse(env, s, b);
+        disas_insn_new(s, cpu, b);
         break;
     default:
         goto unknown_op;
@@ -8623,9 +6909,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->tmp2_i32 = tcg_temp_new_i32();
     dc->tmp3_i32 = tcg_temp_new_i32();
     dc->tmp4 = tcg_temp_new();
-    dc->ptr0 = tcg_temp_new_ptr();
-    dc->ptr1 = tcg_temp_new_ptr();
-    dc->ptr2 = tcg_temp_new_ptr();
     dc->cc_srcT = tcg_temp_local_new();
 }
 
-- 
2.37.3


