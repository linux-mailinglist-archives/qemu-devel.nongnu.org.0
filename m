Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E605A9211
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:28:09 +0200 (CEST)
Received: from localhost ([::1]:38138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfYV-00055K-6d
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewz-0001SK-RO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTeww-00039a-MF
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVDqfQsbPjz2PJzedAtKt9Ie3sZVvmyyqv7yLJZVb7Q=;
 b=Pyt4Y98D/TWRJZ9LZ5CXONHHARuEqWlZUBX5B+ZDXWM1W9kmG2upCsIKAOShCh9o/KF2e3
 l/U0ggtDP9M9fzQU3apwXQLcjj6BZuSy2/HPNKOQQSdGaLf35OOHsEuxqgH3EWVC9f1sP5
 +4p07xelA/8yNSd1x69QtQd7hfIiyHU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266-NsFmGk8TP3SVVYoAys-zJg-1; Thu, 01 Sep 2022 03:49:14 -0400
X-MC-Unique: NsFmGk8TP3SVVYoAys-zJg-1
Received: by mail-wm1-f71.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so9486156wmn.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YVDqfQsbPjz2PJzedAtKt9Ie3sZVvmyyqv7yLJZVb7Q=;
 b=SELfyzSwTKWPyeNLvJSgoLV2DUUZMWsWL121i5aZ6RxNgMcn70VFpWJEmeepzWiADR
 LDgW7pRaM8Q/hxGjZnc/8NrOjKDKZgh7pRRH94GLRZ6jXJ5qMVaUXCAn9aZSCg7DzAVy
 DeMFa3Dkvl9/EFfegCPnHnA3XLIFisYztnK+tAIupHhAt+NuiY102+uN1TqvvyQ0YG2x
 4wHvIfmD9suaiT1dHP/F5gRIyvTCk10zKV7tbP2NXEOdywjIyRlpFBZGlujrJsoFQsRm
 dku1bu7KTYWZq+UJWPUR3UCW8GNbn3Zv5qAVmNwS7bqQbMYjTkJEEcoesEqKrNzHQgJW
 ei5Q==
X-Gm-Message-State: ACgBeo3B+Fr0i/WI5D35N98SggOyLJYquOhUoXDMwIsnPypCk2NOw8Ub
 VNpTc1l3xge7frlnvpajSkn8PsnUQBa4ehAwJrwgrW8NvqZP1N+pLITZERFebgtOFFaG3zUvmAi
 wJ6L4sEa61Iup6Or2g6TgkajGAloNYppMdSNDVUWJT3R/4VyqdXYmIntf2BFiV0PP0XM=
X-Received: by 2002:a5d:424f:0:b0:226:d206:cd6e with SMTP id
 s15-20020a5d424f000000b00226d206cd6emr13013659wrr.554.1662018552495; 
 Thu, 01 Sep 2022 00:49:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7OiT0WAA2pXLEaNV0vCtCAHvwXJGIB9e5rzr13DIJtUs3li9WfJ0K3hr/ITPhnc0FNz5midA==
X-Received: by 2002:a5d:424f:0:b0:226:d206:cd6e with SMTP id
 s15-20020a5d424f000000b00226d206cd6emr13013648wrr.554.1662018552150; 
 Thu, 01 Sep 2022 00:49:12 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a05600c4e5400b003a5bd5ea215sm4415013wmq.37.2022.09.01.00.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 13/23] i386: Rewrite simple integer vector helpers
Date: Thu,  1 Sep 2022 09:48:32 +0200
Message-Id: <20220901074842.57424-14-pbonzini@redhat.com>
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

Rewrite the "simple" vector integer helpers in preperation for AVX support.

While the current code is able to use the same prototype for unary
(a = F(b)) and binary (a = F(b, c)) operations, future changes will cause
them to diverge.

No functional changes to existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-12-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 83 +++++++++++++++----------------------------
 1 file changed, 28 insertions(+), 55 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index a4a09226e3..ce03362810 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -229,63 +229,36 @@ void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 }
 #endif
 
-#define SSE_HELPER_B(name, F)                                   \
+#define SSE_HELPER_1(name, elem, num, F)                        \
     void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
     {                                                           \
-        d->B(0) = F(d->B(0), s->B(0));                          \
-        d->B(1) = F(d->B(1), s->B(1));                          \
-        d->B(2) = F(d->B(2), s->B(2));                          \
-        d->B(3) = F(d->B(3), s->B(3));                          \
-        d->B(4) = F(d->B(4), s->B(4));                          \
-        d->B(5) = F(d->B(5), s->B(5));                          \
-        d->B(6) = F(d->B(6), s->B(6));                          \
-        d->B(7) = F(d->B(7), s->B(7));                          \
-        XMM_ONLY(                                               \
-                 d->B(8) = F(d->B(8), s->B(8));                 \
-                 d->B(9) = F(d->B(9), s->B(9));                 \
-                 d->B(10) = F(d->B(10), s->B(10));              \
-                 d->B(11) = F(d->B(11), s->B(11));              \
-                 d->B(12) = F(d->B(12), s->B(12));              \
-                 d->B(13) = F(d->B(13), s->B(13));              \
-                 d->B(14) = F(d->B(14), s->B(14));              \
-                 d->B(15) = F(d->B(15), s->B(15));              \
-                                                        )       \
-            }
+        int n = num;                                            \
+        for (int i = 0; i < n; i++) {                           \
+            d->elem(i) = F(s->elem(i));                         \
+        }                                                       \
+    }
+
+#define SSE_HELPER_2(name, elem, num, F)                        \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    {                                                           \
+        Reg *v = d;                                             \
+        int n = num;                                            \
+        for (int i = 0; i < n; i++) {                           \
+            d->elem(i) = F(v->elem(i), s->elem(i));             \
+        }                                                       \
+    }
+
+#define SSE_HELPER_B(name, F)                                   \
+    SSE_HELPER_2(name, B, 8 << SHIFT, F)
 
 #define SSE_HELPER_W(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
-    {                                                           \
-        d->W(0) = F(d->W(0), s->W(0));                          \
-        d->W(1) = F(d->W(1), s->W(1));                          \
-        d->W(2) = F(d->W(2), s->W(2));                          \
-        d->W(3) = F(d->W(3), s->W(3));                          \
-        XMM_ONLY(                                               \
-                 d->W(4) = F(d->W(4), s->W(4));                 \
-                 d->W(5) = F(d->W(5), s->W(5));                 \
-                 d->W(6) = F(d->W(6), s->W(6));                 \
-                 d->W(7) = F(d->W(7), s->W(7));                 \
-                                                        )       \
-            }
+    SSE_HELPER_2(name, W, 4 << SHIFT, F)
 
 #define SSE_HELPER_L(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
-    {                                                           \
-        d->L(0) = F(d->L(0), s->L(0));                          \
-        d->L(1) = F(d->L(1), s->L(1));                          \
-        XMM_ONLY(                                               \
-                 d->L(2) = F(d->L(2), s->L(2));                 \
-                 d->L(3) = F(d->L(3), s->L(3));                 \
-                                                        )       \
-            }
+    SSE_HELPER_2(name, L, 2 << SHIFT, F)
 
 #define SSE_HELPER_Q(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
-    {                                                           \
-        d->Q(0) = F(d->Q(0), s->Q(0));                          \
-        XMM_ONLY(                                               \
-                 d->Q(1) = F(d->Q(1), s->Q(1));                 \
-                                                        )       \
-            }
+    SSE_HELPER_2(name, Q, 1 << SHIFT, F)
 
 #if SHIFT == 0
 static inline int satub(int x)
@@ -1544,12 +1517,12 @@ void glue(helper_phsubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     MOVE(*d, r);
 }
 
-#define FABSB(_, x) (x > INT8_MAX  ? -(int8_t)x : x)
-#define FABSW(_, x) (x > INT16_MAX ? -(int16_t)x : x)
-#define FABSL(_, x) (x > INT32_MAX ? -(int32_t)x : x)
-SSE_HELPER_B(helper_pabsb, FABSB)
-SSE_HELPER_W(helper_pabsw, FABSW)
-SSE_HELPER_L(helper_pabsd, FABSL)
+#define FABSB(x) (x > INT8_MAX  ? -(int8_t)x : x)
+#define FABSW(x) (x > INT16_MAX ? -(int16_t)x : x)
+#define FABSL(x) (x > INT32_MAX ? -(int32_t)x : x)
+SSE_HELPER_1(helper_pabsb, B, 8 << SHIFT, FABSB)
+SSE_HELPER_1(helper_pabsw, W, 4 << SHIFT, FABSW)
+SSE_HELPER_1(helper_pabsd, L, 2 << SHIFT, FABSL)
 
 #define FMULHRSW(d, s) (((int16_t) d * (int16_t)s + 0x4000) >> 15)
 SSE_HELPER_W(helper_pmulhrsw, FMULHRSW)
-- 
2.37.1



