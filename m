Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806635A329B
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:27:16 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRijL-00040r-Jc
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVj-0007GD-Ui
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVP-0007qe-KP
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OoHj0LaqAZEbzfPId1kM7cw3m7eW7SNwOHuk0WbTBQ8=;
 b=JJGT/EjJG+Y7J57Z3T9JbyboSV1hyX8llf0gxgLg5zEy83bOKc5UK1as73RJL9oIl6YcSH
 b+J1hDx8Zctyy+VwbJb47YEr5oJMtJhitHCxjEWkhOxlZs+9Uw0VhhBkYGW0QPX6LPSC0k
 cic070fa8UoFkE+L6IcuFL3uWoQ3mC4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-xOufiQrvMIeRRCbc-5FRMg-1; Fri, 26 Aug 2022 19:12:39 -0400
X-MC-Unique: xOufiQrvMIeRRCbc-5FRMg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y20-20020a056402359400b00447a871c48fso1863206edc.3
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OoHj0LaqAZEbzfPId1kM7cw3m7eW7SNwOHuk0WbTBQ8=;
 b=srrKpRAyKkoTI/wkFZKBiLsdXHptu6mS17pEJ1cMapDt/1ndlFMzPquwMGnybTocvd
 Ey/QZrHrSuHq1HB1oZ42hx3GVvhQ/5fXvkplGvfOHIYTLdymj3t8GYmMArkr4pKzwvHM
 +eA1nxYb6h+qGzX+PzaT4vRax8oekBFxZQZ7VuhXs+T7/wYROJH2ANywSM5ODDhBQBPK
 hG3XjC/PpzQAWvP8CCEKjV2SmvHdhfCjRhB9yX6/i1Tk0LhzFXIEsIVWkC0nbqhptlp1
 lj2TvBCRJo6xc+u7sivOgfV8y1hq6OI9Z4SeesyW+Rp1YRNdlRRCm/7aDKZq3Ou8Pm9v
 5VTg==
X-Gm-Message-State: ACgBeo0vDj0UYJOQJs+iD6sX+gARufuoU2MRPx+7whYKWQp4Qb+C3R7p
 Tl54li+K6F/pkLuQDc1rSRy4amqRVdO9nz1p6a62XOfhwlveh/6jzKZFOboJ7gd8Bueutdzsn+j
 YbgZdLgamirV/bdf5AdN1YunNSaKkMw5t8ZvfE3cFxm00xDV3j0enIT15mkbVOpnI4Pw=
X-Received: by 2002:a05:6402:1745:b0:448:116b:12fb with SMTP id
 v5-20020a056402174500b00448116b12fbmr1446997edx.421.1661555557279; 
 Fri, 26 Aug 2022 16:12:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5cEcdw3ybKm0akVerCDOiGkZBlyMWPJoANj+o762T1vKPs6Yf2HTAK1eDikPYKryv+VE0wUA==
X-Received: by 2002:a05:6402:1745:b0:448:116b:12fb with SMTP id
 v5-20020a056402174500b00448116b12fbmr1446978edx.421.1661555556872; 
 Fri, 26 Aug 2022 16:12:36 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090676d200b00730860b6c43sm1387051ejn.173.2022.08.26.16.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 14/23] i386: Misc integer AVX helper prep
Date: Sat, 27 Aug 2022 01:11:55 +0200
Message-Id: <20220826231204.201395-15-pbonzini@redhat.com>
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
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

More preparatory work for AVX support in various integer vector helpers

No functional changes to existing helpers.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-13-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 164 +++++++++++++++++++++---------------------
 1 file changed, 80 insertions(+), 84 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 8395733432..9ea763cad2 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -384,19 +384,22 @@ SSE_HELPER_W(helper_pavgw, FAVG)
 
 void glue(helper_pmuludq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->Q(0) = (uint64_t)s->L(0) * (uint64_t)d->L(0);
-#if SHIFT == 1
-    d->Q(1) = (uint64_t)s->L(2) * (uint64_t)d->L(2);
-#endif
+    Reg *v = d;
+    int i;
+
+    for (i = 0; i < (1 << SHIFT); i++) {
+        d->Q(i) = (uint64_t)s->L(i * 2) * (uint64_t)v->L(i * 2);
+    }
 }
 
 void glue(helper_pmaddwd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
+    Reg *v = d;
     int i;
 
     for (i = 0; i < (2 << SHIFT); i++) {
-        d->L(i) = (int16_t)s->W(2 * i) * (int16_t)d->W(2 * i) +
-            (int16_t)s->W(2 * i + 1) * (int16_t)d->W(2 * i + 1);
+        d->L(i) = (int16_t)s->W(2 * i) * (int16_t)v->W(2 * i) +
+            (int16_t)s->W(2 * i + 1) * (int16_t)v->W(2 * i + 1);
     }
 }
 
@@ -410,32 +413,24 @@ static inline int abs1(int a)
     }
 }
 #endif
+
 void glue(helper_psadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    unsigned int val;
+    Reg *v = d;
+    int i;
 
-    val = 0;
-    val += abs1(d->B(0) - s->B(0));
-    val += abs1(d->B(1) - s->B(1));
-    val += abs1(d->B(2) - s->B(2));
-    val += abs1(d->B(3) - s->B(3));
-    val += abs1(d->B(4) - s->B(4));
-    val += abs1(d->B(5) - s->B(5));
-    val += abs1(d->B(6) - s->B(6));
-    val += abs1(d->B(7) - s->B(7));
-    d->Q(0) = val;
-#if SHIFT == 1
-    val = 0;
-    val += abs1(d->B(8) - s->B(8));
-    val += abs1(d->B(9) - s->B(9));
-    val += abs1(d->B(10) - s->B(10));
-    val += abs1(d->B(11) - s->B(11));
-    val += abs1(d->B(12) - s->B(12));
-    val += abs1(d->B(13) - s->B(13));
-    val += abs1(d->B(14) - s->B(14));
-    val += abs1(d->B(15) - s->B(15));
-    d->Q(1) = val;
-#endif
+    for (i = 0; i < (1 << SHIFT); i++) {
+        unsigned int val = 0;
+        val += abs1(v->B(8 * i + 0) - s->B(8 * i + 0));
+        val += abs1(v->B(8 * i + 1) - s->B(8 * i + 1));
+        val += abs1(v->B(8 * i + 2) - s->B(8 * i + 2));
+        val += abs1(v->B(8 * i + 3) - s->B(8 * i + 3));
+        val += abs1(v->B(8 * i + 4) - s->B(8 * i + 4));
+        val += abs1(v->B(8 * i + 5) - s->B(8 * i + 5));
+        val += abs1(v->B(8 * i + 6) - s->B(8 * i + 6));
+        val += abs1(v->B(8 * i + 7) - s->B(8 * i + 7));
+        d->Q(i) = val;
+    }
 }
 
 void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
@@ -452,20 +447,24 @@ void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 
 void glue(helper_movl_mm_T0, SUFFIX)(Reg *d, uint32_t val)
 {
+    int i;
+
     d->L(0) = val;
     d->L(1) = 0;
-#if SHIFT == 1
-    d->Q(1) = 0;
-#endif
+    for (i = 1; i < (1 << SHIFT); i++) {
+        d->Q(i) = 0;
+    }
 }
 
 #ifdef TARGET_X86_64
 void glue(helper_movq_mm_T0, SUFFIX)(Reg *d, uint64_t val)
 {
+    int i;
+
     d->Q(0) = val;
-#if SHIFT == 1
-    d->Q(1) = 0;
-#endif
+    for (i = 1; i < (1 << SHIFT); i++) {
+        d->Q(i) = 0;
+    }
 }
 #endif
 
@@ -1068,26 +1067,21 @@ uint32_t glue(helper_movmskpd, SUFFIX)(CPUX86State *env, Reg *s)
 uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
 {
     uint32_t val;
+    int i;
 
     val = 0;
-    val |= (s->B(0) >> 7);
-    val |= (s->B(1) >> 6) & 0x02;
-    val |= (s->B(2) >> 5) & 0x04;
-    val |= (s->B(3) >> 4) & 0x08;
-    val |= (s->B(4) >> 3) & 0x10;
-    val |= (s->B(5) >> 2) & 0x20;
-    val |= (s->B(6) >> 1) & 0x40;
-    val |= (s->B(7)) & 0x80;
-#if SHIFT == 1
-    val |= (s->B(8) << 1) & 0x0100;
-    val |= (s->B(9) << 2) & 0x0200;
-    val |= (s->B(10) << 3) & 0x0400;
-    val |= (s->B(11) << 4) & 0x0800;
-    val |= (s->B(12) << 5) & 0x1000;
-    val |= (s->B(13) << 6) & 0x2000;
-    val |= (s->B(14) << 7) & 0x4000;
-    val |= (s->B(15) << 8) & 0x8000;
-#endif
+    for (i = 0; i < (1 << SHIFT); i++) {
+        uint8_t byte = 0;
+        byte |= (s->B(8 * i + 0) >> 7);
+        byte |= (s->B(8 * i + 1) >> 6) & 0x02;
+        byte |= (s->B(8 * i + 2) >> 5) & 0x04;
+        byte |= (s->B(8 * i + 3) >> 4) & 0x08;
+        byte |= (s->B(8 * i + 4) >> 3) & 0x10;
+        byte |= (s->B(8 * i + 5) >> 2) & 0x20;
+        byte |= (s->B(8 * i + 6) >> 1) & 0x40;
+        byte |= (s->B(8 * i + 7)) & 0x80;
+        val |= byte << (8 * i);
+    }
     return val;
 }
 
@@ -1632,46 +1626,48 @@ SSE_HELPER_V(helper_blendvpd, Q, 2, FBLENDVPD)
 
 void glue(helper_ptest, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    uint64_t zf = (s->Q(0) &  d->Q(0)) | (s->Q(1) &  d->Q(1));
-    uint64_t cf = (s->Q(0) & ~d->Q(0)) | (s->Q(1) & ~d->Q(1));
+    uint64_t zf = 0, cf = 0;
+    int i;
 
+    for (i = 0; i < 1 << SHIFT; i++) {
+        zf |= (s->Q(i) &  d->Q(i));
+        cf |= (s->Q(i) & ~d->Q(i));
+    }
     CC_SRC = (zf ? 0 : CC_Z) | (cf ? 0 : CC_C);
 }
 
-#define SSE_HELPER_F(name, elem, num, F)        \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)     \
-    {                                           \
-        if (num > 2) {                          \
-            if (num > 4) {                      \
-                d->elem(7) = F(7);              \
-                d->elem(6) = F(6);              \
-                d->elem(5) = F(5);              \
-                d->elem(4) = F(4);              \
-            }                                   \
-            d->elem(3) = F(3);                  \
-            d->elem(2) = F(2);                  \
-        }                                       \
-        d->elem(1) = F(1);                      \
-        d->elem(0) = F(0);                      \
+#define SSE_HELPER_F(name, elem, num, F)                        \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    {                                                           \
+        int n = num;                                            \
+        for (int i = n; --i >= 0; ) {                           \
+            d->elem(i) = F(i);                                  \
+        }                                                       \
     }
 
-SSE_HELPER_F(helper_pmovsxbw, W, 8, (int8_t) s->B)
-SSE_HELPER_F(helper_pmovsxbd, L, 4, (int8_t) s->B)
-SSE_HELPER_F(helper_pmovsxbq, Q, 2, (int8_t) s->B)
-SSE_HELPER_F(helper_pmovsxwd, L, 4, (int16_t) s->W)
-SSE_HELPER_F(helper_pmovsxwq, Q, 2, (int16_t) s->W)
-SSE_HELPER_F(helper_pmovsxdq, Q, 2, (int32_t) s->L)
-SSE_HELPER_F(helper_pmovzxbw, W, 8, s->B)
-SSE_HELPER_F(helper_pmovzxbd, L, 4, s->B)
-SSE_HELPER_F(helper_pmovzxbq, Q, 2, s->B)
-SSE_HELPER_F(helper_pmovzxwd, L, 4, s->W)
-SSE_HELPER_F(helper_pmovzxwq, Q, 2, s->W)
-SSE_HELPER_F(helper_pmovzxdq, Q, 2, s->L)
+#if SHIFT > 0
+SSE_HELPER_F(helper_pmovsxbw, W, 4 << SHIFT, (int8_t) s->B)
+SSE_HELPER_F(helper_pmovsxbd, L, 2 << SHIFT, (int8_t) s->B)
+SSE_HELPER_F(helper_pmovsxbq, Q, 1 << SHIFT, (int8_t) s->B)
+SSE_HELPER_F(helper_pmovsxwd, L, 2 << SHIFT, (int16_t) s->W)
+SSE_HELPER_F(helper_pmovsxwq, Q, 1 << SHIFT, (int16_t) s->W)
+SSE_HELPER_F(helper_pmovsxdq, Q, 1 << SHIFT, (int32_t) s->L)
+SSE_HELPER_F(helper_pmovzxbw, W, 4 << SHIFT, s->B)
+SSE_HELPER_F(helper_pmovzxbd, L, 2 << SHIFT, s->B)
+SSE_HELPER_F(helper_pmovzxbq, Q, 1 << SHIFT, s->B)
+SSE_HELPER_F(helper_pmovzxwd, L, 2 << SHIFT, s->W)
+SSE_HELPER_F(helper_pmovzxwq, Q, 1 << SHIFT, s->W)
+SSE_HELPER_F(helper_pmovzxdq, Q, 1 << SHIFT, s->L)
+#endif
 
 void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->Q(0) = (int64_t)(int32_t) d->L(0) * (int32_t) s->L(0);
-    d->Q(1) = (int64_t)(int32_t) d->L(2) * (int32_t) s->L(2);
+    Reg *v = d;
+    int i;
+
+    for (i = 0; i < 1 << SHIFT; i++) {
+        d->Q(i) = (int64_t)(int32_t) v->L(2 * i) * (int32_t) s->L(2 * i);
+    }
 }
 
 #define FCMPEQQ(d, s) (d == s ? -1 : 0)
-- 
2.37.1



