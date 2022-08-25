Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358AD5A1C8C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:41:26 +0200 (CEST)
Received: from localhost ([::1]:42308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLXM-0007Sz-BS
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7Y-0008D2-ST
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7W-0002kH-Vv
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0hzub3oFLEtUwwRTIdqW7g0Z8ZFMh+2g43PJvMaUq0=;
 b=RZqGKpbe8d5Ty+9oufpwisrrb3kejJg7h0zN2y97XBQJl45QQ8xmIfkFnqk9sKKbiFcDs9
 RuQprpRpZv1vRMF/Dat2yqhEsUbtw0TeKIKkCCOlTWS5Ps9OtKPczAC+EcIgts72VREq1a
 rBuJIISQemZeKS5i9WpEk+oDhEcHi2I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-lWHBbdJtOlCTSGmlt2yQVw-1; Thu, 25 Aug 2022 18:14:35 -0400
X-MC-Unique: lWHBbdJtOlCTSGmlt2yQVw-1
Received: by mail-wm1-f70.google.com with SMTP id
 b4-20020a05600c4e0400b003a5a96f1756so3066730wmq.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=j0hzub3oFLEtUwwRTIdqW7g0Z8ZFMh+2g43PJvMaUq0=;
 b=4t97pK7d7Nushb47uyEjDhMAOqSNyFmjjDb8jRikTvQh0XGiaxAsDkXi23QWMPwiUD
 +M8eCfhYHJOhU9KKuSyyWPGkd0ciM8tbDnMilS9RD1o9V4UOH+fTc7HTgHmNb4KMNUrP
 ZUxz7UPOeGKWA+1j7wveq6bhXJdU/h3U+INeccNEGtEUWflr6Z1dJMSsfY0XBj3OUdri
 b/Wj2JhDgswQ9G64p35HFpOPuX9RFEGkfXhbRk60ExfuVRAk7LyO+BLeMhRHzEF0OjK4
 6+ADprcsPhS56pT8veE8SrreTe8975FaT4U4pbbBbjahOQdlFeL3XZdhmxWwFjw3IxNM
 1GMQ==
X-Gm-Message-State: ACgBeo2LA7uDZmKz3oN4cgc1Dhi2rr5L+oPV2KJf50o2aRjcDNWfHDki
 4PZHDAsvt8S1L5V4ofHKM3q+ab2w5FP+qul8UVBH4oExe5bJcGniHUvKrC7RtAhLv1DFXvci0GU
 kydZda3U2BQj9jNXyMGYK/y6zAbaVxCUv2y8gBa07GQoJtfoNQaXKVCae4Lt5NbeAUwU=
X-Received: by 2002:a5d:6445:0:b0:225:1a75:7754 with SMTP id
 d5-20020a5d6445000000b002251a757754mr3331779wrw.239.1661465673760; 
 Thu, 25 Aug 2022 15:14:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5iYk/NmTDhJQP3wJ1DD9DBWwau6frlRwZbNRvX7Yyt1/8in5ok2A6PSW5guj7fQCNXFdUdug==
X-Received: by 2002:a5d:6445:0:b0:225:1a75:7754 with SMTP id
 d5-20020a5d6445000000b002251a757754mr3331770wrw.239.1661465673400; 
 Thu, 25 Aug 2022 15:14:33 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056000180c00b0022584e771adsm265647wrh.113.2022.08.25.15.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 12/18] i386: reimplement AVX comparison helpers
Date: Fri, 26 Aug 2022 00:14:05 +0200
Message-Id: <20220825221411.35122-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
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

AVX includes additional a more extensive set of comparison predicates,
some of some of which our softfloat implementation does not expose directly.
Rewrite the helpers in terms of floatN_compare for future extensibility.

Signed-off-by: Paul Brook <paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 97 ++++++++++++++++++++----------------
 target/i386/ops_sse_header.h | 24 ++++-----
 target/i386/tcg/translate.c  | 20 ++++----
 3 files changed, 75 insertions(+), 66 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 08359b8433..851a05d594 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -992,57 +992,66 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
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
+            d->ZMM_L(i) = F(32, C, v->ZMM_S(i), s->ZMM_S(i));           \
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
+            d->ZMM_Q(i) = F(64, C, v->ZMM_D(i), s->ZMM_D(i));           \
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
+        d->ZMM_L(0) = F(32, C, v->ZMM_S(0), s->ZMM_S(0));                   \
+    }                                                                       \
+                                                                            \
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)    \
+    {                                                                       \
+        Reg *v = d;                                                         \
+        d->ZMM_Q(0) = F(64, C, v->ZMM_D(0), s->ZMM_D(0));                   \
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
+#define FPU_CMPQ(size, COND, a, b) \
+    (COND(float ## size ## _compare_quiet(a, b, &env->sse_status)) ? -1 : 0)
+#define FPU_CMPS(size, COND, a, b) \
+    (COND(float ## size ## _compare(a, b, &env->sse_status)) ? -1 : 0)
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
index 1e67607ca3..059e001d82 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3021,20 +3021,20 @@ static const SSEFunc_l_ep sse_op_table3bq[] = {
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



