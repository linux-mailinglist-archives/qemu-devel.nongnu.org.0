Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8095C5A32A0
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:30:00 +0200 (CEST)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRilz-0000we-EC
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVi-0007EH-Iz
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVG-0007qV-Mv
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vLmD0zmrzApy3raDGv/uUpAiWJQdUPxyPzWTBxnFFXI=;
 b=C3etWHFOqB8gm7R3Zx4VJHHiiASiEAbQGyZ9j9fOH6JE2qOEaGeUec9XcVH00oQaCvptEc
 U+YMcL6dIyzHrEJQ7uqvkMUAM2/fKKbhouRVsU+mx24yZB8YTItcZCYJDFicABuIeoehRm
 5JQahjwIw4T4jwfjOkNVZt98msp98dE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-4kMN76ZmO0K_d6xYtrfsHg-1; Fri, 26 Aug 2022 19:12:32 -0400
X-MC-Unique: 4kMN76ZmO0K_d6xYtrfsHg-1
Received: by mail-ed1-f71.google.com with SMTP id
 b13-20020a056402350d00b0043dfc84c533so1842512edd.5
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vLmD0zmrzApy3raDGv/uUpAiWJQdUPxyPzWTBxnFFXI=;
 b=4qJXBYoFiu2ZU/Jm4b2CTWHYlWxME5h86cK64LK2I4zDR+qZNGA4TSyFJ4EdRBCEHQ
 /6/AMxMKOQjSxzcmJmtmakm5vA2zG47TyTJKCLtkn1Q+s5+z29lXIDK4VCwJmXFFBtN1
 gT6Tt/t1a4otlJK6TQBy34GdfmDYsmxQk/UxRBYw+DpbL9nMkBIOCZW9DxKVkkgyRuD1
 ZNgnha0EJrSVlDW0UeqkKqM2EFoVKQw4nZ8oWwpr5MEEjOZxnLpecYW9pz6f4lMQbNcH
 btqVIAJWPoAKZbeDdLcsFFb0rdU/SwDeh3on1HyHc798XnAfWF+Kuw8R/E6PDvb+uCgD
 al9g==
X-Gm-Message-State: ACgBeo1P84zpzHaay7wT0Sp4SkMDg8C11E59FILuBFBHyXEIrdgrJIB5
 5SC7W65mshVdXvar1UPNoX33YI5dSs9ijY0b1bZ78YGj6kNFWO78D1QWgD9J5ajFJXdW/4eKOda
 ktwod1tv8KXf6xK8SFvv0E3KY8Q0Sf21t6bW8J0uBc49w2LvyU+gg8kgxjq+zYHxSf60=
X-Received: by 2002:a05:6402:5cd:b0:446:5965:f4af with SMTP id
 n13-20020a05640205cd00b004465965f4afmr8310324edx.12.1661555550910; 
 Fri, 26 Aug 2022 16:12:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6wg1uBEmKVv/jrvOVhg2pF6L3yIoy/aoH31LeyYmTWQx0EFQbMQSnlYxA7J/UjHCa/SwI8YA==
X-Received: by 2002:a05:6402:5cd:b0:446:5965:f4af with SMTP id
 n13-20020a05640205cd00b004465965f4afmr8310306edx.12.1661555550531; 
 Fri, 26 Aug 2022 16:12:30 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 ch4-20020a0564021bc400b00445d760fc69sm1970009edb.50.2022.08.26.16.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 13/23] i386: Rewrite simple integer vector helpers
Date: Sat, 27 Aug 2022 01:11:54 +0200
Message-Id: <20220826231204.201395-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826231204.201395-1-pbonzini@redhat.com>
References: <20220826231204.201395-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
index 8c745f5cab..8395733432 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -223,63 +223,36 @@ void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
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
@@ -1538,12 +1511,12 @@ void glue(helper_phsubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
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



