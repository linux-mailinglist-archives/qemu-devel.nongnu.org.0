Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD05BF0D2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:06:56 +0200 (CEST)
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamKM-00044C-Hm
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0e-0006sy-5Y
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0b-0002Hx-Fd
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JnRCq3cmQQ+iHKtSYTziLeQ4kbJFdrb03hpOwbRilYk=;
 b=QZhXwtaLmjH5GM4xXIpvGwXVp+0hzN5ea2gIIRXE12LW5fImr8Qsm9Nspi2Tg4bUZF+r+g
 AzM23a6YVeKtBbprVENtctTNOsqpigMhrXGMWCr8pSYIzCJ25CijB9Z7ZDJeSyQPpHyaGB
 EL/Ce3/xratje4fUtijJDPcL2p0Kv4E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-iYpxg0SsM2O_tSn7P_Nh8w-1; Tue, 20 Sep 2022 13:26:07 -0400
X-MC-Unique: iYpxg0SsM2O_tSn7P_Nh8w-1
Received: by mail-ej1-f71.google.com with SMTP id
 he41-20020a1709073da900b00780bff831ebso1759533ejc.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JnRCq3cmQQ+iHKtSYTziLeQ4kbJFdrb03hpOwbRilYk=;
 b=iRq9gSIB8cFO0LjMSgaV82253NI4YQwfycoFBhdMiN6soi6LlAA3GiOpZRNVtOh5fm
 WzRCUnYMEP/g0vnDgJiUDj3V/8i/oxaPhCyiReGZ/ZJ2SZkEArMGRHMv6JtFSOImNSfn
 vePKNhXcJgzueDZY8iRcy/lAgWvXS/gVQfdqtBO+/TngpK490pA7RWeTd59eUKJW7hx6
 fCR9y8OJM9kNHq+VtgJa6R1sl2MZXpKeEAL/2oLh8Vo5BkKZbuF6QJraSd83cxq6iZVQ
 TXQkGRgvdJjgvoJToYS0G2BntviobC1/ONjcRBTgR4FeoIxZfkrPr/BOgvGacDg9pkJL
 hJkg==
X-Gm-Message-State: ACrzQf2tlETOnDZz2pTQ7vmpvjLaTlu9FtWnRaa96e+QUC9CdNnI6srq
 +g+2z44+BwfT1zr/p1CWQCkPSv0jLKj17oNyAMIx6hli+umjyKY739W9Stv+1nWal7W68iQAyLQ
 4sz/hlQJa8ddBB88ZIsBYQiC4l57K4AbI950X9jv4QqncS5PteyjDjESp3wP3mktrqUI=
X-Received: by 2002:aa7:d556:0:b0:451:f7e6:5121 with SMTP id
 u22-20020aa7d556000000b00451f7e65121mr21215286edr.188.1663694765369; 
 Tue, 20 Sep 2022 10:26:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7w4BVoEu5H/AuMvXagEEi3WPTkw6GcBugnA/V8T7SVmgPDJ9tb2tH+28VgAJOmambnRz4+ug==
X-Received: by 2002:aa7:d556:0:b0:451:f7e6:5121 with SMTP id
 u22-20020aa7d556000000b00451f7e65121mr21215246edr.188.1663694764917; 
 Tue, 20 Sep 2022 10:26:04 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a1709062db100b0077f15e98256sm115149eji.203.2022.09.20.10.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:26:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 37/37] target/i386: remove old SSE decoder
Date: Tue, 20 Sep 2022 19:25:07 +0200
Message-Id: <20220920172507.95568-38-pbonzini@redhat.com>
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
 target/i386/tcg/translate.c      | 1722 +-----------------------------
 5 files changed, 19 insertions(+), 1908 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 43b32edbfc..76bf20b878 100644
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
index e4de3bac0a..64876696f5 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -1538,9 +1538,6 @@ static void disas_insn_new(DisasContext *s, CPUState *cpu, int b)
     X86DecodedInsn decode;
     X86DecodeFunc decode_func = decode_root;
 
-#ifdef CONFIG_USER_ONLY
-    if (limit) { --limit; }
-#endif
     s->has_modrm = false;
 
  next_byte:
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index ef4e3478fa..31186545c8 100644
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
index 627d321f00..c00cf0c682 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -128,9 +128,6 @@ typedef struct DisasContext {
     /* TCG local register indexes (only used inside old micro ops) */
     TCGv tmp0;
     TCGv tmp4;
-    TCGv_ptr ptr0;
-    TCGv_ptr ptr1;
-    TCGv_ptr ptr2;
     TCGv_i32 tmp2_i32;
     TCGv_i32 tmp3_i32;
     TCGv_i64 tmp1_i64;
@@ -2871,57 +2868,6 @@ static void gen_sty_env_A0(DisasContext *s, int offset, bool align)
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
@@ -4607,40 +2917,15 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
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
@@ -8470,7 +6755,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         set_cc_op(s, CC_OP_POPCNT);
         break;
-    case 0x110 ... 0x117:
+    case 0x10e ... 0x117:
     case 0x128 ... 0x12f:
     case 0x138 ... 0x13a:
     case 0x150 ... 0x179:
@@ -8478,7 +6763,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1c2:
     case 0x1c4 ... 0x1c6:
     case 0x1d0 ... 0x1fe:
-        gen_sse(env, s, b, pc_start);
+        disas_insn_new(s, cpu, b);
         break;
     default:
         goto unknown_op;
@@ -8635,9 +6920,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->tmp2_i32 = tcg_temp_new_i32();
     dc->tmp3_i32 = tcg_temp_new_i32();
     dc->tmp4 = tcg_temp_new();
-    dc->ptr0 = tcg_temp_new_ptr();
-    dc->ptr1 = tcg_temp_new_ptr();
-    dc->ptr2 = tcg_temp_new_ptr();
     dc->cc_srcT = tcg_temp_local_new();
 }
 
-- 
2.37.2


