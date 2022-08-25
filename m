Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3AE5A1CA7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:44:35 +0200 (CEST)
Received: from localhost ([::1]:40970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLaU-0004xf-Du
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7b-0008M6-Ka
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7Z-0002kq-F4
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fvbas4UYAGgZt48EwXWa6wXU7k3HQ7SO5UNXPPy1GOE=;
 b=MZ8x5kTUwdnt7TU+1FjHJzkv1jK0W+KFzutpv5YS+VEyy/NghpgstofTrVbOSjIfssXJGT
 iw0OHi3f0HJIvufKZANYOelUcDqxGzlxJ+nAqvrkPg4GgOV5VEeBLQ7Iv+3KqdOXVPYyZC
 HfnlSw0rweDbC7X9+3YjGQXVH9WMftA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-eDgHNCBQN9GTJxBKWrYU9Q-1; Thu, 25 Aug 2022 18:14:39 -0400
X-MC-Unique: eDgHNCBQN9GTJxBKWrYU9Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay21-20020a05600c1e1500b003a6271a9718so11236822wmb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fvbas4UYAGgZt48EwXWa6wXU7k3HQ7SO5UNXPPy1GOE=;
 b=yd6LPncwjR4P2JN06tPaP5d9RtTQ0noVMVYCav20lovYmQzZO+wmAJ0FxS5jYiSeAZ
 wXOMIOJgt2swn/Rn0VJQMtWZo3d3AEDtXm7Ik8vTp6GqYzfJDeAF0xEektZAvxMzNjl5
 gQHtpiZAv0y3NKXorvuXA1EnD53HQtGwpnhaR0yCpkOQLndUNnAKslJDkRAlDjlxl0TT
 uc3adQtiHtC1y70NyDVtGwGWaFXXsz7PEj3TXsD2hy4wYbx1jDJIFAYtzZh5AEHp1KnQ
 kJdZY0Qta9bdAUNupEFZczx6YVISMQSRIUfSI2yTjdkj+d753IjxmYhvyO3uTBnZC58f
 i77A==
X-Gm-Message-State: ACgBeo12B5a1739wcfDuskvd26eSS1ipeoaZ4M/zkxHwgF2BQ5V/Soq3
 TrPpN+ApUJSb78jz8zVGSxVAxTMATU6qts+n1gFRA8gATrYHtx2+kI8u8BLGpu8zk1GfHmpp5CU
 ABLigGbcUAXn/CgKC0LBFVHkEgnOS6jTNYVFmDCbtNN3ipDUm4NaqCGDZTzTEhaeh9+w=
X-Received: by 2002:a5d:508a:0:b0:225:54cd:6a6f with SMTP id
 a10-20020a5d508a000000b0022554cd6a6fmr3579700wrt.658.1661465678128; 
 Thu, 25 Aug 2022 15:14:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4v666PyZAZU9ytgnf6fvJFZgQYnrdrwRgzg0MbLCHvD/nW0PJkLVNXytBlN5pe6XernbNT3A==
X-Received: by 2002:a5d:508a:0:b0:225:54cd:6a6f with SMTP id
 a10-20020a5d508a000000b0022554cd6a6fmr3579687wrt.658.1661465677693; 
 Thu, 25 Aug 2022 15:14:37 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c19cb00b003a5c7a942edsm6735433wmq.28.2022.08.25.15.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 15/18] i386: Misc AVX helper prep
Date: Fri, 26 Aug 2022 00:14:08 +0200
Message-Id: <20220825221411.35122-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
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

From: Paul Brook <paul@nowt.org>

Fixup various vector helpers that either trivially exten to 256 bit,
or don't have 256 bit variants.

No functional changes to existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-19-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 143 +++++++++++++++++++++++++++---------------
 1 file changed, 94 insertions(+), 49 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 7252e03619..6d5f9b9323 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -440,6 +440,7 @@ void glue(helper_psadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }
 }
 
+#if SHIFT < 2
 void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   target_ulong a0)
 {
@@ -451,6 +452,7 @@ void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         }
     }
 }
+#endif
 
 void glue(helper_movl_mm_T0, SUFFIX)(Reg *d, uint32_t val)
 {
@@ -640,21 +642,24 @@ void helper_sqrtsd(CPUX86State *env, Reg *d, Reg *s)
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
@@ -664,26 +669,27 @@ void helper_cvtsd2ss(CPUX86State *env, Reg *d, Reg *s)
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
@@ -718,8 +724,11 @@ void helper_cvtsq2sd(CPUX86State *env, ZMMReg *d, uint64_t val)
 }
 #endif
 
+#endif
+
 /* float to integer */
 
+#if SHIFT == 1
 /*
  * x86 mandates that we return the indefinite integer value for the result
  * of any float-to-integer conversion that raises the 'invalid' exception.
@@ -750,22 +759,28 @@ WRAP_FLOATCONV(int64_t, float32_to_int64, float32, INT64_MIN)
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
@@ -799,23 +814,31 @@ int64_t helper_cvtsd2sq(CPUX86State *env, ZMMReg *s)
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
@@ -849,6 +872,7 @@ int64_t helper_cvttsd2sq(CPUX86State *env, ZMMReg *s)
     return x86_float64_to_int64_round_to_zero(s->ZMM_D(0), &env->sse_status);
 }
 #endif
+#endif
 
 void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
@@ -862,6 +886,7 @@ void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
+#if SHIFT == 1
 void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
@@ -870,6 +895,7 @@ void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
                               &env->sse_status);
     set_float_exception_flags(old_flags, &env->sse_status);
 }
+#endif
 
 void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
@@ -881,13 +907,16 @@ void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
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
@@ -931,6 +960,7 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
 {
     d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), index, length);
 }
+#endif
 
 #define SSE_HELPER_HPS(name, F)  \
 void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
@@ -1053,6 +1083,7 @@ SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
 
 #undef SSE_HELPER_CMP
 
+#if SHIFT == 1
 static const int comis_eflags[4] = {CC_C, CC_Z, 0, CC_Z | CC_P | CC_C};
 
 void helper_ucomiss(CPUX86State *env, Reg *d, Reg *s)
@@ -1098,25 +1129,30 @@ void helper_comisd(CPUX86State *env, Reg *d, Reg *s)
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
@@ -1765,6 +1801,7 @@ SSE_HELPER_L(helper_pmaxud, MAX)
 #define FMULLD(d, s) ((int32_t)d * (int32_t)s)
 SSE_HELPER_L(helper_pmulld, FMULLD)
 
+#if SHIFT == 1
 void glue(helper_phminposuw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int idx = 0;
@@ -1796,12 +1833,14 @@ void glue(helper_phminposuw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
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
@@ -1821,10 +1860,9 @@ void glue(helper_roundps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
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
@@ -1839,6 +1877,7 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     signed char prev_rounding_mode;
+    int i;
 
     prev_rounding_mode = env->sse_status.float_rounding_mode;
     if (!(mode & (1 << 2))) {
@@ -1858,8 +1897,9 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         }
     }
 
-    d->ZMM_D(0) = float64_round_to_int(s->ZMM_D(0), &env->sse_status);
-    d->ZMM_D(1) = float64_round_to_int(s->ZMM_D(1), &env->sse_status);
+    for (i = 0; i < 1 << SHIFT; i++) {
+        d->ZMM_D(i) = float64_round_to_int(s->ZMM_D(i), &env->sse_status);
+    }
 
     if (mode & (1 << 3) && !(old_flags & float_flag_inexact)) {
         set_float_exception_flags(get_float_exception_flags(&env->sse_status) &
@@ -1869,6 +1909,7 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     env->sse_status.float_rounding_mode = prev_rounding_mode;
 }
 
+#if SHIFT == 1
 void glue(helper_roundss, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t mode)
 {
@@ -1936,6 +1977,7 @@ void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     }
     env->sse_status.float_rounding_mode = prev_rounding_mode;
 }
+#endif
 
 #define FBLENDP(d, s, m) (m ? s : d)
 SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
@@ -2034,6 +2076,7 @@ void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #define FCMPGTQ(d, s) ((int64_t)d > (int64_t)s ? -1 : 0)
 SSE_HELPER_Q(helper_pcmpgtq, FCMPGTQ)
 
+#if SHIFT == 1
 static inline int pcmp_elen(CPUX86State *env, int reg, uint32_t ctrl)
 {
     target_long val, limit;
@@ -2254,6 +2297,8 @@ target_ulong helper_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
     return crc;
 }
 
+#endif
+
 void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                     uint32_t ctrl)
 {
-- 
2.37.1



