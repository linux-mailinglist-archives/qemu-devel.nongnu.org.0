Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F25A9F74
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:57:23 +0200 (CEST)
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpNS-0001Wc-Jl
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosm-0008Rt-AO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosf-0000A2-UF
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwT5o10YhHZZ49jClxqojaY9ZZg+oToD8hkb1jEPuXE=;
 b=dnXreXMQ5ZWL6ooC+CcVU2/bmlOpT2DvKUHT1VmhIxtsZM0aThVh0ekl7rtG5L76MtL3S1
 vkskNpAJIyzBe1d4aw6qfCEimh2wqNmcOEk/YbNhzZs+1P66qQYVov2OJCekqU3QggLHQz
 itQ4CgPQPNXzF1o397hp1xBAUIsnT3g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-LCTJBd3gMAO1jyABZfARhA-1; Thu, 01 Sep 2022 14:25:32 -0400
X-MC-Unique: LCTJBd3gMAO1jyABZfARhA-1
Received: by mail-ed1-f71.google.com with SMTP id
 p4-20020a056402500400b00447e8b6f62bso12349201eda.17
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qwT5o10YhHZZ49jClxqojaY9ZZg+oToD8hkb1jEPuXE=;
 b=WmAuNLZi3DPS1wgdChmt/W7egYvWu1Qx4GvNPswcqulf8oFhISwr9kjvkBOtae/bgl
 rcL1uj8PWVGpHUeqrQ96+UwjUD/RFp2dnclyIFv6LRSniT340kUnB8bOX7YnrtyGuBEh
 IpPlUOvUrH0UvQtUjyyI+l4X9hxltwQlGfb1f2oNa5j2sz+4WVmVIy1yJjORA8X7UsPA
 KH7wlIfeXsr3a9idmukzcnhjXY3vZWys/92drl358XZQCXxy3CWvMl3mWKWClJTPZBgy
 23BH0OXjNZJ+VwatJPQmbfqvMrsEO6ZN9IQt5hUGSvG7x+tD4QDbdvOQgeB/E+7TStce
 DrDw==
X-Gm-Message-State: ACgBeo19mBt0SdT+z7TxlZEvXH8/cx3EpBdBX3Ob0WSVFo8mqSn/nLCb
 s5cOG2Douw3/uVRJdzKAf5Dp9lNTC0WA0C2llgZbReDxR8C8l1cinLsaBHbgPaPW20DkdCj+Co5
 GDBU+kNbmCDB8iO3OWFDSGnuuPCNEtz1B1CSCpIId0Fi8iBHpSKvh75TupQp0U8sPyoA=
X-Received: by 2002:a17:906:9bc6:b0:73f:b594:e314 with SMTP id
 de6-20020a1709069bc600b0073fb594e314mr20961264ejc.557.1662056730840; 
 Thu, 01 Sep 2022 11:25:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5WgiA5m1ovsn+JZ0Xgh/3oWPlQ96AFQaa2f5dS/gYef1ZLrD+yD1OBNJ7OVTEHRXzUsuGP7A==
X-Received: by 2002:a17:906:9bc6:b0:73f:b594:e314 with SMTP id
 de6-20020a1709069bc600b0073fb594e314mr20961250ejc.557.1662056730545; 
 Thu, 01 Sep 2022 11:25:30 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r26-20020a056402019a00b0044402ac02f7sm1718510edv.67.2022.09.01.11.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 32/39] target/i386: Floating point arithmetic helper AVX prep
Date: Thu,  1 Sep 2022 20:24:22 +0200
Message-Id: <20220901182429.93533-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
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
index bb50ca6f8d..86ca74492e 100644
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
2.37.2



