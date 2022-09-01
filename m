Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923785A9220
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:33:34 +0200 (CEST)
Received: from localhost ([::1]:41024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfdl-0002xS-Ei
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTexB-0001Th-Kj
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTex9-0003BR-KF
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4vZuVciV0YX/F9jLz5g5o86XdllCA9R+OzS131eDps=;
 b=fJAurUBqss2HHPuGegTkEiXxMneuvBXeoavSet2gxAefSIE6sZGEIt0pUl12G3FwfuI1x5
 I8TmQm3kNfz8A6ds90KzDuN4pMaionk0NVcXLkNgbPfmgzhhPlPPQ0EQQa69e3RPkzZNSD
 wdaDzdle7n28st5eMk4sGxem3w9kCxk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-230-yxUkJtu_NaGWt92R94EiXA-1; Thu, 01 Sep 2022 03:49:22 -0400
X-MC-Unique: yxUkJtu_NaGWt92R94EiXA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c66-20020a1c3545000000b003a5f6dd6a25so897632wma.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=I4vZuVciV0YX/F9jLz5g5o86XdllCA9R+OzS131eDps=;
 b=LlnMvUaErcYusvXiNim5o9O4GhU520kOi1bOu44fpjkALRi/rd4tXc9cs4AJ4L4dN0
 w6x1BjnlfhnI9YOX3IicXf8cgpv7UixXuez2j1Rw1oODE2XWOZ1CXvp5Dr8wN5cbe9mr
 95KXxwyhHOmhWLNuuxLuUO634vz99i8IZtljzAPt8DtDHMPdFIqR4p8uIa0zKl3LbLsC
 fuIERzU7836l8NS3d+pQyReWfUJ1FCqF/e7u7ChhunyJlAqGaXe5WQjgon8gaSNTgwYj
 3i8FWBBRE1ec+GEMm7sMTM57hd1e4qHaQhGP03mhYDdMsIeIK2i7V8WCEAaTgfBYJk/3
 Pbbw==
X-Gm-Message-State: ACgBeo1Nejdo1mpHvlPXsk0yJwE3O6bfYc/0h4iEYF/NYb0d/zmQTgJR
 juBJ66g5yblcvYkcnY6NE26FYRvg3DbsKbSq8s1IY1HRVx2kw4pJZ7G5C5VBwsfYKnYg59v3Hyg
 deWq58dBN8eEL549CD1DTceUNGL6aLgpuV5fJ9ZLIKKGAh4n98nVsuOX4eQMMl5wqxSc=
X-Received: by 2002:adf:ed50:0:b0:225:4c37:5346 with SMTP id
 u16-20020adfed50000000b002254c375346mr13765772wro.207.1662018561188; 
 Thu, 01 Sep 2022 00:49:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR520TQqGsDHP0nDSJXAqGErvPbFmJyT2BVOEi1Uwn8+TLmDKmgm4NBYoqFYWjSEAe5m5A7x+Q==
X-Received: by 2002:adf:ed50:0:b0:225:4c37:5346 with SMTP id
 u16-20020adfed50000000b002254c375346mr13765753wro.207.1662018560899; 
 Thu, 01 Sep 2022 00:49:20 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003a5c1e916c8sm12371851wmp.1.2022.09.01.00.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 16/23] i386: Floating point arithmetic helper AVX prep
Date: Thu,  1 Sep 2022 09:48:35 +0200
Message-Id: <20220901074842.57424-17-pbonzini@redhat.com>
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

Prepare the "easy" floating point vector helpers for AVX

No functional changes to existing helpers.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-16-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 138 ++++++++++++++++++++++++++++--------------
 1 file changed, 92 insertions(+), 46 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 7d48c05693..d881d03228 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -553,40 +553,58 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
 }
 #endif
 
-#if SHIFT == 1
+#if SHIFT >= 1
 /* FPU ops */
 /* XXX: not accurate */
 
-#define SSE_HELPER_S(name, F)                                           \
-    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
+#define SSE_HELPER_P(name, F)                                           \
+    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
+            Reg *d, Reg *s)                                             \
     {                                                                   \
-        d->ZMM_S(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-        d->ZMM_S(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
-        d->ZMM_S(2) = F(32, d->ZMM_S(2), s->ZMM_S(2));                  \
-        d->ZMM_S(3) = F(32, d->ZMM_S(3), s->ZMM_S(3));                  \
+        Reg *v = d;                                                     \
+        int i;                                                          \
+        for (i = 0; i < 2 << SHIFT; i++) {                              \
+            d->ZMM_S(i) = F(32, v->ZMM_S(i), s->ZMM_S(i));              \
+        }                                                               \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env,          \
+            Reg *d, Reg *s)                                     \
     {                                                                   \
-        d->ZMM_S(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-    }                                                                   \
-                                                                        \
-    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
-    {                                                                   \
-        d->ZMM_D(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
-        d->ZMM_D(1) = F(64, d->ZMM_D(1), s->ZMM_D(1));                  \
-    }                                                                   \
-                                                                        \
-    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)        \
-    {                                                                   \
-        d->ZMM_D(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
+        Reg *v = d;                                                     \
+        int i;                                                          \
+        for (i = 0; i < 1 << SHIFT; i++) {                              \
+            d->ZMM_D(i) = F(64, v->ZMM_D(i), s->ZMM_D(i));              \
+        }                                                               \
     }
 
+#if SHIFT == 1
+
+#define SSE_HELPER_S(name, F)                                           \
+    SSE_HELPER_P(name, F)                                               \
+                                                                        \
+    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)\
+    {                                                                   \
+        Reg *v = d;                                                     \
+        d->ZMM_S(0) = F(32, v->ZMM_S(0), s->ZMM_S(0));                  \
+    }                                                                   \
+                                                                        \
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)\
+    {                                                                   \
+        Reg *v = d;                                                     \
+        d->ZMM_D(0) = F(64, v->ZMM_D(0), s->ZMM_D(0));                  \
+    }
+
+#else
+
+#define SSE_HELPER_S(name, F) SSE_HELPER_P(name, F)
+
+#endif
+
 #define FPU_ADD(size, a, b) float ## size ## _add(a, b, &env->sse_status)
 #define FPU_SUB(size, a, b) float ## size ## _sub(a, b, &env->sse_status)
 #define FPU_MUL(size, a, b) float ## size ## _mul(a, b, &env->sse_status)
 #define FPU_DIV(size, a, b) float ## size ## _div(a, b, &env->sse_status)
-#define FPU_SQRT(size, a, b) float ## size ## _sqrt(b, &env->sse_status)
 
 /* Note that the choice of comparison op here is important to get the
  * special cases right: for min and max Intel specifies that (-0,0),
@@ -603,8 +621,34 @@ SSE_HELPER_S(mul, FPU_MUL)
 SSE_HELPER_S(div, FPU_DIV)
 SSE_HELPER_S(min, FPU_MIN)
 SSE_HELPER_S(max, FPU_MAX)
-SSE_HELPER_S(sqrt, FPU_SQRT)
 
+void glue(helper_sqrtps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    int i;
+    for (i = 0; i < 2 << SHIFT; i++) {
+        d->ZMM_S(i) = float32_sqrt(s->ZMM_S(i), &env->sse_status);
+    }
+}
+
+void glue(helper_sqrtpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    int i;
+    for (i = 0; i < 1 << SHIFT; i++) {
+        d->ZMM_D(i) = float64_sqrt(s->ZMM_D(i), &env->sse_status);
+    }
+}
+
+#if SHIFT == 1
+void helper_sqrtss(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->ZMM_S(0) = float32_sqrt(s->ZMM_S(0), &env->sse_status);
+}
+
+void helper_sqrtsd(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->ZMM_D(0) = float64_sqrt(s->ZMM_D(0), &env->sse_status);
+}
+#endif
 
 /* float to float conversions */
 void glue(helper_cvtps2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -822,18 +866,12 @@ int64_t helper_cvttsd2sq(CPUX86State *env, ZMMReg *s)
 void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
-    d->ZMM_S(0) = float32_div(float32_one,
-                              float32_sqrt(s->ZMM_S(0), &env->sse_status),
-                              &env->sse_status);
-    d->ZMM_S(1) = float32_div(float32_one,
-                              float32_sqrt(s->ZMM_S(1), &env->sse_status),
-                              &env->sse_status);
-    d->ZMM_S(2) = float32_div(float32_one,
-                              float32_sqrt(s->ZMM_S(2), &env->sse_status),
-                              &env->sse_status);
-    d->ZMM_S(3) = float32_div(float32_one,
-                              float32_sqrt(s->ZMM_S(3), &env->sse_status),
-                              &env->sse_status);
+    int i;
+    for (i = 0; i < 2 << SHIFT; i++) {
+        d->ZMM_S(i) = float32_div(float32_one,
+                                  float32_sqrt(s->ZMM_S(i), &env->sse_status),
+                                  &env->sse_status);
+    }
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
@@ -849,10 +887,10 @@ void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
-    d->ZMM_S(0) = float32_div(float32_one, s->ZMM_S(0), &env->sse_status);
-    d->ZMM_S(1) = float32_div(float32_one, s->ZMM_S(1), &env->sse_status);
-    d->ZMM_S(2) = float32_div(float32_one, s->ZMM_S(2), &env->sse_status);
-    d->ZMM_S(3) = float32_div(float32_one, s->ZMM_S(3), &env->sse_status);
+    int i;
+    for (i = 0; i < 2 << SHIFT; i++) {
+        d->ZMM_S(i) = float32_div(float32_one, s->ZMM_S(i), &env->sse_status);
+    }
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
@@ -947,18 +985,24 @@ void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     MOVE(*d, r);
 }
 
-void glue(helper_addsubps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_addsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->ZMM_S(0) = float32_sub(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
-    d->ZMM_S(1) = float32_add(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
-    d->ZMM_S(2) = float32_sub(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
-    d->ZMM_S(3) = float32_add(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
+    Reg *v = d;
+    int i;
+    for (i = 0; i < 2 << SHIFT; i += 2) {
+        d->ZMM_S(i) = float32_sub(v->ZMM_S(i), s->ZMM_S(i), &env->sse_status);
+        d->ZMM_S(i+1) = float32_add(v->ZMM_S(i+1), s->ZMM_S(i+1), &env->sse_status);
+    }
 }
 
-void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->ZMM_D(0) = float64_sub(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
-    d->ZMM_D(1) = float64_add(d->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
+    Reg *v = d;
+    int i;
+    for (i = 0; i < 1 << SHIFT; i += 2) {
+        d->ZMM_D(i) = float64_sub(v->ZMM_D(i), s->ZMM_D(i), &env->sse_status);
+        d->ZMM_D(i+1) = float64_add(v->ZMM_D(i+1), s->ZMM_D(i+1), &env->sse_status);
+    }
 }
 
 /* XXX: unordered */
@@ -2258,6 +2302,8 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 }
 #endif
 
+#undef SSE_HELPER_S
+
 #undef SHIFT
 #undef XMM_ONLY
 #undef Reg
-- 
2.37.1



