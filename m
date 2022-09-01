Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F145A921C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:31:35 +0200 (CEST)
Received: from localhost ([::1]:44520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfbq-0000BT-LM
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTex9-0001TM-Rt
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTex7-0003Aw-60
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ft71QaJ3LzYCrx6idmpkX1A3Ap34QJJWk7lqbXj4fu8=;
 b=cV5lsTyVgMhjOBKi/zjO9SJN0eS8y3PiK+mHsLJyhccHKezI11rEC3BBuDh2Nnq8crnySb
 SqXS+lQ5d22hKz187I8TFHjNyqeVyrc8z5Bg1leMvcjjutN12syBn8jUYtQEjwwJwch6YQ
 1aeBEa9G3EZcS0sjr5ncnKs9XLARvDM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-487-fuCPznBlNouv7Osurzd1pA-1; Thu, 01 Sep 2022 03:49:24 -0400
X-MC-Unique: fuCPznBlNouv7Osurzd1pA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so9486368wmn.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ft71QaJ3LzYCrx6idmpkX1A3Ap34QJJWk7lqbXj4fu8=;
 b=0ZLvxLmY+3UjtFE0YkpM/xH/bbX3ePmiRToNii+ykIgEpsBpXX+7VgaX4x3jPMdq9v
 laXw/xGYpbvZkdNTdt6jUfrTrrLuHek8BDQG04S9LDWnejkMSkZyj1bRizALPzhp9Exp
 x09IR1Q9kPEH/xqrKkEnn/ohhofeQF+CoDyKfJ39tufA1afD91XckyMSajeDw4VOnqE9
 pxO9qxvsjOzxdc3opyHNg3wEWIy0KhNPKNISABK6b6HuNxRmkG8yGDFbK7ZbaoFvqEox
 rF5OrZOZF2kpdaWttYoZXljXUdfJ/Dmv+AYtwYpCQq9MIJNdNhhms4HWGDtJJ8Vv0pN/
 fLZg==
X-Gm-Message-State: ACgBeo1/bwIjDRfi4g14VPiC8W/IvhdN7N0hBy+P1ff8ytqp83qsda8K
 w1KcpfyqPksxy1XblE3nTRc8xIyiCj6gsid37ZXuTGUCmYdpmRAqSe914qxGMMHchleK3bcY6t9
 qrCK+ljlxGjir7UjxVehGAPfdxKzcU23eKVqdXJi1vZ8zFPAcAxTULz7Cc1RJ62zsL8s=
X-Received: by 2002:adf:fc83:0:b0:226:d2d4:bc27 with SMTP id
 g3-20020adffc83000000b00226d2d4bc27mr11912319wrr.606.1662018563249; 
 Thu, 01 Sep 2022 00:49:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7IPqpaUSq4NaOsblBfEHhW+hBX6PfNO7qkniU0uUvaUr5DV6p2uiY0C2HsdeQD0usIjKv98w==
X-Received: by 2002:adf:fc83:0:b0:226:d2d4:bc27 with SMTP id
 g3-20020adffc83000000b00226d2d4bc27mr11912297wrr.606.1662018562866; 
 Thu, 01 Sep 2022 00:49:22 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c19d400b003a6a3595edasm5261388wmq.27.2022.09.01.00.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 17/23] i386: reimplement AVX comparison helpers
Date: Thu,  1 Sep 2022 09:48:36 +0200
Message-Id: <20220901074842.57424-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
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

AVX includes an additional set of comparison predicates, some of which
our softfloat implementation does not expose as separate functions.
Rewrite the helpers in terms of floatN_compare for future extensibility.

Signed-off-by: Paul Brook <paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220424220204.2493824-24-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 97 ++++++++++++++++++++----------------
 target/i386/ops_sse_header.h | 24 ++++-----
 target/i386/tcg/translate.c  | 20 ++++----
 3 files changed, 75 insertions(+), 66 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index d881d03228..de874e136f 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1005,57 +1005,66 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }
 }
 
-/* XXX: unordered */
-#define SSE_HELPER_CMP(name, F)                                         \
-    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
+#define SSE_HELPER_CMP_P(name, F, C)                                    \
+    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
+                                             Reg *d, Reg *s)    \
     {                                                                   \
-        d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-        d->ZMM_L(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
-        d->ZMM_L(2) = F(32, d->ZMM_S(2), s->ZMM_S(2));                  \
-        d->ZMM_L(3) = F(32, d->ZMM_S(3), s->ZMM_S(3));                  \
+        Reg *v = d;                                                     \
+        int i;                                                          \
+        for (i = 0; i < 2 << SHIFT; i++) {                              \
+            d->ZMM_L(i) = C(F(32, v->ZMM_S(i), s->ZMM_S(i))) ? -1 : 0;  \
+        }                                                               \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env,          \
+                                             Reg *d, Reg *s)    \
     {                                                                   \
-        d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-    }                                                                   \
-                                                                        \
-    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
-    {                                                                   \
-        d->ZMM_Q(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
-        d->ZMM_Q(1) = F(64, d->ZMM_D(1), s->ZMM_D(1));                  \
-    }                                                                   \
-                                                                        \
-    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)        \
-    {                                                                   \
-        d->ZMM_Q(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
+        Reg *v = d;                                                     \
+        int i;                                                          \
+        for (i = 0; i < 1 << SHIFT; i++) {                              \
+            d->ZMM_Q(i) = C(F(64, v->ZMM_D(i), s->ZMM_D(i))) ? -1 : 0;  \
+        }                                                               \
     }
 
-#define FPU_CMPEQ(size, a, b)                                           \
-    (float ## size ## _eq_quiet(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPLT(size, a, b)                                           \
-    (float ## size ## _lt(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPLE(size, a, b)                                           \
-    (float ## size ## _le(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPUNORD(size, a, b)                                        \
-    (float ## size ## _unordered_quiet(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPNEQ(size, a, b)                                          \
-    (float ## size ## _eq_quiet(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPNLT(size, a, b)                                          \
-    (float ## size ## _lt(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPNLE(size, a, b)                                          \
-    (float ## size ## _le(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPORD(size, a, b)                                          \
-    (float ## size ## _unordered_quiet(a, b, &env->sse_status) ? 0 : -1)
+#if SHIFT == 1
+#define SSE_HELPER_CMP(name, F, C)                                          \
+    SSE_HELPER_CMP_P(name, F, C)                                            \
+    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)    \
+    {                                                                       \
+        Reg *v = d;                                                         \
+        d->ZMM_L(0) = C(F(32, v->ZMM_S(0), s->ZMM_S(0))) ? -1 : 0;          \
+    }                                                                       \
+                                                                            \
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)    \
+    {                                                                       \
+        Reg *v = d;                                                         \
+        d->ZMM_Q(0) = C(F(64, v->ZMM_D(0), s->ZMM_D(0))) ? -1 : 0;          \
+    }
 
-SSE_HELPER_CMP(cmpeq, FPU_CMPEQ)
-SSE_HELPER_CMP(cmplt, FPU_CMPLT)
-SSE_HELPER_CMP(cmple, FPU_CMPLE)
-SSE_HELPER_CMP(cmpunord, FPU_CMPUNORD)
-SSE_HELPER_CMP(cmpneq, FPU_CMPNEQ)
-SSE_HELPER_CMP(cmpnlt, FPU_CMPNLT)
-SSE_HELPER_CMP(cmpnle, FPU_CMPNLE)
-SSE_HELPER_CMP(cmpord, FPU_CMPORD)
+#define FPU_EQ(x) (x == float_relation_equal)
+#define FPU_LT(x) (x == float_relation_less)
+#define FPU_LE(x) (x <= float_relation_equal)
+#define FPU_UNORD(x) (x == float_relation_unordered)
+
+#define FPU_CMPQ(size, a, b) \
+    float ## size ## _compare_quiet(a, b, &env->sse_status)
+#define FPU_CMPS(size, a, b) \
+    float ## size ## _compare(a, b, &env->sse_status)
+
+#else
+#define SSE_HELPER_CMP(name, F, C) SSE_HELPER_CMP_P(name, F, C)
+#endif
+
+SSE_HELPER_CMP(cmpeq, FPU_CMPQ, FPU_EQ)
+SSE_HELPER_CMP(cmplt, FPU_CMPS, FPU_LT)
+SSE_HELPER_CMP(cmple, FPU_CMPS, FPU_LE)
+SSE_HELPER_CMP(cmpunord, FPU_CMPQ,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneq, FPU_CMPQ, !FPU_EQ)
+SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
+SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
+SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
+
+#undef SSE_HELPER_CMP
 
 static const int comis_eflags[4] = {CC_C, CC_Z, 0, CC_Z | CC_P | CC_C};
 
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index fc697536a0..d99464afb0 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -201,20 +201,20 @@ DEF_HELPER_3(glue(hsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(addsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(addsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
 
-#define SSE_HELPER_CMP(name, F)                           \
-    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
-    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)         \
-    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)         \
+#define SSE_HELPER_CMP(name, F, C)                              \
+    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg) \
+    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)               \
+    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg) \
     DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
 
-SSE_HELPER_CMP(cmpeq, FPU_CMPEQ)
-SSE_HELPER_CMP(cmplt, FPU_CMPLT)
-SSE_HELPER_CMP(cmple, FPU_CMPLE)
-SSE_HELPER_CMP(cmpunord, FPU_CMPUNORD)
-SSE_HELPER_CMP(cmpneq, FPU_CMPNEQ)
-SSE_HELPER_CMP(cmpnlt, FPU_CMPNLT)
-SSE_HELPER_CMP(cmpnle, FPU_CMPNLE)
-SSE_HELPER_CMP(cmpord, FPU_CMPORD)
+SSE_HELPER_CMP(cmpeq, FPU_CMPQ, FPU_EQ)
+SSE_HELPER_CMP(cmplt, FPU_CMPS, FPU_LT)
+SSE_HELPER_CMP(cmple, FPU_CMPS, FPU_LE)
+SSE_HELPER_CMP(cmpunord, FPU_CMPQ,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneq, FPU_CMPQ, !FPU_EQ)
+SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
+SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
+SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
 
 DEF_HELPER_3(ucomiss, void, env, Reg, Reg)
 DEF_HELPER_3(comiss, void, env, Reg, Reg)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 99c84473f4..fc081e6ad6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3022,20 +3022,20 @@ static const SSEFunc_l_ep sse_op_table3bq[] = {
 };
 #endif
 
-#define SSE_FOP(x) { \
+#define SSE_CMP(x) { \
     gen_helper_ ## x ## ps ## _xmm, gen_helper_ ## x ## pd ## _xmm, \
     gen_helper_ ## x ## ss, gen_helper_ ## x ## sd}
 static const SSEFunc_0_epp sse_op_table4[8][4] = {
-    SSE_FOP(cmpeq),
-    SSE_FOP(cmplt),
-    SSE_FOP(cmple),
-    SSE_FOP(cmpunord),
-    SSE_FOP(cmpneq),
-    SSE_FOP(cmpnlt),
-    SSE_FOP(cmpnle),
-    SSE_FOP(cmpord),
+    SSE_CMP(cmpeq),
+    SSE_CMP(cmplt),
+    SSE_CMP(cmple),
+    SSE_CMP(cmpunord),
+    SSE_CMP(cmpneq),
+    SSE_CMP(cmpnlt),
+    SSE_CMP(cmpnle),
+    SSE_CMP(cmpord),
 };
-#undef SSE_FOP
+#undef SSE_CMP
 
 static const SSEFunc_0_epp sse_op_table5[256] = {
     [0x0c] = gen_helper_pi2fw,
-- 
2.37.1



