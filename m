Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E4A5A32A7
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:31:37 +0200 (CEST)
Received: from localhost ([::1]:42448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRinY-00035M-3K
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVl-0007M2-LL
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVU-0007qo-F1
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgv7mW6ielxwXjO6KDJmV0OpvgUjuac6qGEvyWX0ZoI=;
 b=CJsWJwCG2Mk7lJ5nO+WjtQkSplvtoYy8a9UEV4QyoKWcDycrLWx+OdsdpkKPPhwGV2PfqZ
 frnE1p0WKRkTeOxMhKpDIEjuCUFrbInKYfUgiQDGr2H99PZsG1wDKJwy3GUIX6rYkBhjJj
 70rNZ3+5zVqdC5nWzeLTBWAC2CNukTE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-tKWSMM-yNS-NqKsjbiO4Gw-1; Fri, 26 Aug 2022 19:12:42 -0400
X-MC-Unique: tKWSMM-yNS-NqKsjbiO4Gw-1
Received: by mail-ed1-f70.google.com with SMTP id
 z6-20020a05640240c600b0043e1d52fd98so1870907edb.22
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bgv7mW6ielxwXjO6KDJmV0OpvgUjuac6qGEvyWX0ZoI=;
 b=ZUUvb55BV3/apgSuM1/taefdkMJmyPcSauUB/JurZmX3mh86XfXHhn+avNdX8LVEJm
 TbIe5YcL8DXZh/bBNUxKqbN7mzKbioJw7190NhfvEnRgLUG5P+ajVlvIf5Zpk1ZSmyJN
 1hE/jfBvHu6484XDttXny7aLlq/ONjLLvaIuFRdDvFsYuhNHWUdiQ3hgBj77TaHkQNR4
 Nf20764LQV8LoZUUIlAlqOuzl2k6x7NJ53soQQVrLOHgVeWVFZbktT1WfypqeumM6kdc
 G/z7wfazCY8hpynWh4VintivrlH97ng1vGM63guqULJ+nYDBCVvQjGqq7hun4JzKbyUu
 wIXg==
X-Gm-Message-State: ACgBeo17+VUTj/WABQYnTYHTtymOChAnlGQPfsCMDZDJTohAyuY5WJpi
 KbxbA5c9tcEnEZSccauiGhgsmVrIbexyoju0AN6OCtCuOeD8wEPZvaA83hR8kwc0gPzHqD+/Ypx
 KUQfp/8MsxbSoS6oNiHVxWAB3aQLoy88Wh/ZNeJFR4i6lKix+sjwG53GmXcfiz20jBvI=
X-Received: by 2002:a17:906:2245:b0:715:7c81:e39d with SMTP id
 5-20020a170906224500b007157c81e39dmr6996868ejr.262.1661555561239; 
 Fri, 26 Aug 2022 16:12:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4mBTrkiHR7px/JQqRjXtw7lruud0oCZ3sLwDqHClmHt0vFtLjH6PKgJR4rjt1uN5HOS8bvZg==
X-Received: by 2002:a17:906:2245:b0:715:7c81:e39d with SMTP id
 5-20020a170906224500b007157c81e39dmr6996854ejr.262.1661555560955; 
 Fri, 26 Aug 2022 16:12:40 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a17090679d400b00715a02874acsm1426361ejo.35.2022.08.26.16.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 16/23] i386: Floating point arithmetic helper AVX prep
Date: Sat, 27 Aug 2022 01:11:57 +0200
Message-Id: <20220826231204.201395-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826231204.201395-1-pbonzini@redhat.com>
References: <20220826231204.201395-1-pbonzini@redhat.com>
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
index 09dabfcbd5..1d05e42a45 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -548,40 +548,58 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
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
@@ -598,8 +616,34 @@ SSE_HELPER_S(mul, FPU_MUL)
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
@@ -817,18 +861,12 @@ int64_t helper_cvttsd2sq(CPUX86State *env, ZMMReg *s)
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
 
@@ -844,10 +882,10 @@ void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
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
 
@@ -942,18 +980,24 @@ void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
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
@@ -2280,6 +2324,8 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 }
 #endif
 
+#undef SSE_HELPER_S
+
 #undef SHIFT
 #undef XMM_ONLY
 #undef Reg
-- 
2.37.1



