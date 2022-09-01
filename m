Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469E5A922D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:37:19 +0200 (CEST)
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfhO-0006hK-4y
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTexB-0001Tn-On
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTex9-0003BN-Hm
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JT9nUfXaAwH3lAfSMWeiHOzyGcwJZ/vNY0rng0C6F/Q=;
 b=Htg/TmVpMk/VQXvE3r9O2LWXUCS52X+1AX+t1vzaOwXFLwRFohk0cRX4+pT9op4RfY5ipH
 sRuKLUyjqyPf4HfSLeCQxj6023OT5VrlkFtokoo7ZurQU2cgK8xu08eMEEuETv9L8Wulwk
 9RsbJEREjFt445EZ+Rkh/kCQqJ+91gk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-BovkWOYGOT6WL2EXmF-R8g-1; Thu, 01 Sep 2022 03:49:30 -0400
X-MC-Unique: BovkWOYGOT6WL2EXmF-R8g-1
Received: by mail-wm1-f72.google.com with SMTP id
 j36-20020a05600c1c2400b003a540d88677so9479710wms.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JT9nUfXaAwH3lAfSMWeiHOzyGcwJZ/vNY0rng0C6F/Q=;
 b=Qyu8u+yeDAbmEcHK0Pf50ng2vK9PNM0AI3zPyFqbZV8NXdqwgwhpveQC32asRbbp0T
 8YUVzEVGzwj4TzBcql1ddLgYw8Uz2RGYG+GsK5H8hbWzcaYbmFtbu1pXzBpDfHr4ItWN
 JTo4aY1uc9MVxCkLM5Xhy5h9SfjNbg0/3/Wv4wy5YnB1DqP/tT1hZ5vbbhbe84WumS5W
 pV1eSt/mZAIcrEUhHQf3DCTfIQVQ1RHPZ+6duB6qszAVBzKqMglwLu+6slmVFsK1YkEV
 MuWXdRSzfv7SfjvRgbdoxBmMQwtCTTyLzanZuqQEPXY3dH1rUZHFtf/9BCECEcRqC93h
 bCCg==
X-Gm-Message-State: ACgBeo1lE7s44T9kJUO5Mw2oduFMxjia9Iyl/rHQtsXyzacXV+RAjXWR
 AZqvSTtbw/R9dLWJecA4rOjkOB34yj3fzpgUsBMcRH2jCN15WfH24xhEI7E5ssVQnUFF+I+R1Yb
 V+vS/duyJnjhIL1cZIboOa30IZugYsll1xogJ2dHdwVKvCFuobaZcqpiYsxxQAOgwFbs=
X-Received: by 2002:adf:f081:0:b0:225:7209:4bd7 with SMTP id
 n1-20020adff081000000b0022572094bd7mr14526112wro.36.1662018568542; 
 Thu, 01 Sep 2022 00:49:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6nUv/1cWI8/4JY6+PxaKrBbyTmbevJcZStvuVzEW1/lV6ea7eaQW2HAym45oxQDB+7CjXtCQ==
X-Received: by 2002:adf:f081:0:b0:225:7209:4bd7 with SMTP id
 n1-20020adff081000000b0022572094bd7mr14526087wro.36.1662018568150; 
 Thu, 01 Sep 2022 00:49:28 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003a3170a7af9sm4911883wms.4.2022.09.01.00.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 20/23] i386: Misc AVX helper prep
Date: Thu,  1 Sep 2022 09:48:39 +0200
Message-Id: <20220901074842.57424-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Paul Brook <paul@nowt.org>

Fixup various vector helpers that either trivially exten to 256 bit,
or don't have 256 bit variants.

No functional changes to existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-19-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 143 +++++++++++++++++++++++++++---------------
 1 file changed, 94 insertions(+), 49 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 61722fe4a2..7cfbcce49f 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -422,6 +422,7 @@ void glue(helper_psadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }
 }
 
+#if SHIFT < 2
 void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   target_ulong a0)
 {
@@ -433,6 +434,7 @@ void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         }
     }
 }
+#endif
 
 void glue(helper_movl_mm_T0, SUFFIX)(Reg *d, uint32_t val)
 {
@@ -635,21 +637,24 @@ void helper_sqrtsd(CPUX86State *env, Reg *d, Reg *s)
 /* float to float conversions */
 void glue(helper_cvtps2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    float32 s0, s1;
-
-    s0 = s->ZMM_S(0);
-    s1 = s->ZMM_S(1);
-    d->ZMM_D(0) = float32_to_float64(s0, &env->sse_status);
-    d->ZMM_D(1) = float32_to_float64(s1, &env->sse_status);
+    int i;
+    for (i = 1 << SHIFT; --i >= 0; ) {
+        d->ZMM_D(i) = float32_to_float64(s->ZMM_S(i), &env->sse_status);
+    }
 }
 
 void glue(helper_cvtpd2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->ZMM_S(0) = float64_to_float32(s->ZMM_D(0), &env->sse_status);
-    d->ZMM_S(1) = float64_to_float32(s->ZMM_D(1), &env->sse_status);
-    d->Q(1) = 0;
+    int i;
+    for (i = 0; i < 1 << SHIFT; i++) {
+         d->ZMM_S(i) = float64_to_float32(s->ZMM_D(i), &env->sse_status);
+    }
+    for (i >>= 1; i < 1 << SHIFT; i++) {
+         d->Q(i) = 0;
+    }
 }
 
+#if SHIFT == 1
 void helper_cvtss2sd(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_D(0) = float32_to_float64(s->ZMM_S(0), &env->sse_status);
@@ -659,26 +664,27 @@ void helper_cvtsd2ss(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_S(0) = float64_to_float32(s->ZMM_D(0), &env->sse_status);
 }
+#endif
 
 /* integer to float */
 void glue(helper_cvtdq2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->ZMM_S(0) = int32_to_float32(s->ZMM_L(0), &env->sse_status);
-    d->ZMM_S(1) = int32_to_float32(s->ZMM_L(1), &env->sse_status);
-    d->ZMM_S(2) = int32_to_float32(s->ZMM_L(2), &env->sse_status);
-    d->ZMM_S(3) = int32_to_float32(s->ZMM_L(3), &env->sse_status);
+    int i;
+    for (i = 0; i < 2 << SHIFT; i++) {
+        d->ZMM_S(i) = int32_to_float32(s->ZMM_L(i), &env->sse_status);
+    }
 }
 
 void glue(helper_cvtdq2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    int32_t l0, l1;
-
-    l0 = (int32_t)s->ZMM_L(0);
-    l1 = (int32_t)s->ZMM_L(1);
-    d->ZMM_D(0) = int32_to_float64(l0, &env->sse_status);
-    d->ZMM_D(1) = int32_to_float64(l1, &env->sse_status);
+    int i;
+    for (i = 1 << SHIFT; --i >= 0; ) {
+        int32_t l = s->ZMM_L(i);
+        d->ZMM_D(i) = int32_to_float64(l, &env->sse_status);
+    }
 }
 
+#if SHIFT == 1
 void helper_cvtpi2ps(CPUX86State *env, ZMMReg *d, MMXReg *s)
 {
     d->ZMM_S(0) = int32_to_float32(s->MMX_L(0), &env->sse_status);
@@ -713,8 +719,11 @@ void helper_cvtsq2sd(CPUX86State *env, ZMMReg *d, uint64_t val)
 }
 #endif
 
+#endif
+
 /* float to integer */
 
+#if SHIFT == 1
 /*
  * x86 mandates that we return the indefinite integer value for the result
  * of any float-to-integer conversion that raises the 'invalid' exception.
@@ -745,22 +754,28 @@ WRAP_FLOATCONV(int64_t, float32_to_int64, float32, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float32_to_int64_round_to_zero, float32, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float64_to_int64, float64, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float64_to_int64_round_to_zero, float64, INT64_MIN)
+#endif
 
 void glue(helper_cvtps2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_L(0) = x86_float32_to_int32(s->ZMM_S(0), &env->sse_status);
-    d->ZMM_L(1) = x86_float32_to_int32(s->ZMM_S(1), &env->sse_status);
-    d->ZMM_L(2) = x86_float32_to_int32(s->ZMM_S(2), &env->sse_status);
-    d->ZMM_L(3) = x86_float32_to_int32(s->ZMM_S(3), &env->sse_status);
+    int i;
+    for (i = 0; i < 2 << SHIFT; i++) {
+        d->ZMM_L(i) = x86_float32_to_int32(s->ZMM_S(i), &env->sse_status);
+    }
 }
 
 void glue(helper_cvtpd2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_L(0) = x86_float64_to_int32(s->ZMM_D(0), &env->sse_status);
-    d->ZMM_L(1) = x86_float64_to_int32(s->ZMM_D(1), &env->sse_status);
-    d->ZMM_Q(1) = 0;
+    int i;
+    for (i = 0; i < 1 << SHIFT; i++) {
+        d->ZMM_L(i) = x86_float64_to_int32(s->ZMM_D(i), &env->sse_status);
+    }
+    for (i >>= 1; i < 1 << SHIFT; i++) {
+         d->Q(i) = 0;
+    }
 }
 
+#if SHIFT == 1
 void helper_cvtps2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
     d->MMX_L(0) = x86_float32_to_int32(s->ZMM_S(0), &env->sse_status);
@@ -794,23 +809,31 @@ int64_t helper_cvtsd2sq(CPUX86State *env, ZMMReg *s)
     return x86_float64_to_int64(s->ZMM_D(0), &env->sse_status);
 }
 #endif
+#endif
 
 /* float to integer truncated */
 void glue(helper_cvttps2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
-    d->ZMM_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1), &env->sse_status);
-    d->ZMM_L(2) = x86_float32_to_int32_round_to_zero(s->ZMM_S(2), &env->sse_status);
-    d->ZMM_L(3) = x86_float32_to_int32_round_to_zero(s->ZMM_S(3), &env->sse_status);
+    int i;
+    for (i = 0; i < 2 << SHIFT; i++) {
+        d->ZMM_L(i) = x86_float32_to_int32_round_to_zero(s->ZMM_S(i),
+                                                         &env->sse_status);
+    }
 }
 
 void glue(helper_cvttpd2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
-    d->ZMM_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1), &env->sse_status);
-    d->ZMM_Q(1) = 0;
+    int i;
+    for (i = 0; i < 1 << SHIFT; i++) {
+        d->ZMM_L(i) = x86_float64_to_int32_round_to_zero(s->ZMM_D(i),
+                                                         &env->sse_status);
+    }
+    for (i >>= 1; i < 1 << SHIFT; i++) {
+         d->Q(i) = 0;
+    }
 }
 
+#if SHIFT == 1
 void helper_cvttps2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
     d->MMX_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
@@ -844,6 +867,7 @@ int64_t helper_cvttsd2sq(CPUX86State *env, ZMMReg *s)
     return x86_float64_to_int64_round_to_zero(s->ZMM_D(0), &env->sse_status);
 }
 #endif
+#endif
 
 void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
@@ -857,6 +881,7 @@ void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
+#if SHIFT == 1
 void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
@@ -865,6 +890,7 @@ void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
                               &env->sse_status);
     set_float_exception_flags(old_flags, &env->sse_status);
 }
+#endif
 
 void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
@@ -876,13 +902,16 @@ void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
+#if SHIFT == 1
 void helper_rcpss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     d->ZMM_S(0) = float32_div(float32_one, s->ZMM_S(0), &env->sse_status);
     set_float_exception_flags(old_flags, &env->sse_status);
 }
+#endif
 
+#if SHIFT == 1
 static inline uint64_t helper_extrq(uint64_t src, int shift, int len)
 {
     uint64_t mask;
@@ -926,6 +955,7 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
 {
     d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), index, length);
 }
+#endif
 
 #define SSE_HELPER_HPS(name, F)  \
 void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
@@ -1052,6 +1082,7 @@ SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
 
 #undef SSE_HELPER_CMP
 
+#if SHIFT == 1
 static const int comis_eflags[4] = {CC_C, CC_Z, 0, CC_Z | CC_P | CC_C};
 
 void helper_ucomiss(CPUX86State *env, Reg *d, Reg *s)
@@ -1097,25 +1128,30 @@ void helper_comisd(CPUX86State *env, Reg *d, Reg *s)
     ret = float64_compare(d0, d1, &env->sse_status);
     CC_SRC = comis_eflags[ret + 1];
 }
+#endif
 
 uint32_t glue(helper_movmskps, SUFFIX)(CPUX86State *env, Reg *s)
 {
-    int b0, b1, b2, b3;
+    uint32_t mask;
+    int i;
 
-    b0 = s->ZMM_L(0) >> 31;
-    b1 = s->ZMM_L(1) >> 31;
-    b2 = s->ZMM_L(2) >> 31;
-    b3 = s->ZMM_L(3) >> 31;
-    return b0 | (b1 << 1) | (b2 << 2) | (b3 << 3);
+    mask = 0;
+    for (i = 0; i < 2 << SHIFT; i++) {
+        mask |= (s->ZMM_L(i) >> (31 - i)) & (1 << i);
+    }
+    return mask;
 }
 
 uint32_t glue(helper_movmskpd, SUFFIX)(CPUX86State *env, Reg *s)
 {
-    int b0, b1;
+    uint32_t mask;
+    int i;
 
-    b0 = s->ZMM_L(1) >> 31;
-    b1 = s->ZMM_L(3) >> 31;
-    return b0 | (b1 << 1);
+    mask = 0;
+    for (i = 0; i < 1 << SHIFT; i++) {
+        mask |= (s->ZMM_Q(i) >> (63 - i)) & (1 << i);
+    }
+    return mask;
 }
 
 #endif
@@ -1712,6 +1748,7 @@ SSE_HELPER_L(helper_pmaxud, MAX)
 #define FMULLD(d, s) ((int32_t)d * (int32_t)s)
 SSE_HELPER_L(helper_pmulld, FMULLD)
 
+#if SHIFT == 1
 void glue(helper_phminposuw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int idx = 0;
@@ -1743,12 +1780,14 @@ void glue(helper_phminposuw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     d->L(1) = 0;
     d->Q(1) = 0;
 }
+#endif
 
 void glue(helper_roundps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t mode)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     signed char prev_rounding_mode;
+    int i;
 
     prev_rounding_mode = env->sse_status.float_rounding_mode;
     if (!(mode & (1 << 2))) {
@@ -1768,10 +1807,9 @@ void glue(helper_roundps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         }
     }
 
-    d->ZMM_S(0) = float32_round_to_int(s->ZMM_S(0), &env->sse_status);
-    d->ZMM_S(1) = float32_round_to_int(s->ZMM_S(1), &env->sse_status);
-    d->ZMM_S(2) = float32_round_to_int(s->ZMM_S(2), &env->sse_status);
-    d->ZMM_S(3) = float32_round_to_int(s->ZMM_S(3), &env->sse_status);
+    for (i = 0; i < 2 << SHIFT; i++) {
+        d->ZMM_S(i) = float32_round_to_int(s->ZMM_S(i), &env->sse_status);
+    }
 
     if (mode & (1 << 3) && !(old_flags & float_flag_inexact)) {
         set_float_exception_flags(get_float_exception_flags(&env->sse_status) &
@@ -1786,6 +1824,7 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     signed char prev_rounding_mode;
+    int i;
 
     prev_rounding_mode = env->sse_status.float_rounding_mode;
     if (!(mode & (1 << 2))) {
@@ -1805,8 +1844,9 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         }
     }
 
-    d->ZMM_D(0) = float64_round_to_int(s->ZMM_D(0), &env->sse_status);
-    d->ZMM_D(1) = float64_round_to_int(s->ZMM_D(1), &env->sse_status);
+    for (i = 0; i < 1 << SHIFT; i++) {
+        d->ZMM_D(i) = float64_round_to_int(s->ZMM_D(i), &env->sse_status);
+    }
 
     if (mode & (1 << 3) && !(old_flags & float_flag_inexact)) {
         set_float_exception_flags(get_float_exception_flags(&env->sse_status) &
@@ -1816,6 +1856,7 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     env->sse_status.float_rounding_mode = prev_rounding_mode;
 }
 
+#if SHIFT == 1
 void glue(helper_roundss, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t mode)
 {
@@ -1883,6 +1924,7 @@ void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     }
     env->sse_status.float_rounding_mode = prev_rounding_mode;
 }
+#endif
 
 #define FBLENDP(d, s, m) (m ? s : d)
 SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
@@ -1984,6 +2026,7 @@ void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #define FCMPGTQ(d, s) ((int64_t)d > (int64_t)s ? -1 : 0)
 SSE_HELPER_Q(helper_pcmpgtq, FCMPGTQ)
 
+#if SHIFT == 1
 static inline int pcmp_elen(CPUX86State *env, int reg, uint32_t ctrl)
 {
     target_long val, limit;
@@ -2204,6 +2247,8 @@ target_ulong helper_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
     return crc;
 }
 
+#endif
+
 void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                     uint32_t ctrl)
 {
-- 
2.37.1



