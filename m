Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911B5A1C35
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:23:37 +0200 (CEST)
Received: from localhost ([::1]:49756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLGC-0002CP-Mi
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7R-0007r5-M4
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7O-0002jK-QH
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXVFEPCZ4SpL+mqtv7xhNta9JBWwJIliNJXiNQlpfHE=;
 b=QF4EsAKzY6vF9NvwPMFYIOno5KXovHVr9tybTkm+yXWZDjRsOA4SgOiqNxRs26Y1xW9PSx
 rTzK7c3CnhZjHLbwHfrdq2NtKGtuLgzU3kXmVVHSpmGCiZ9SyoTqaO2NDeb3fdZvSyNg2T
 uwdhSxni8oBcIvXD3wCe5W5XcPOup1Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-CzVzv86oPzm8tgtTy_9FUQ-1; Thu, 25 Aug 2022 18:14:29 -0400
X-MC-Unique: CzVzv86oPzm8tgtTy_9FUQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 h133-20020a1c218b000000b003a5fa79008bso3042221wmh.5
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HXVFEPCZ4SpL+mqtv7xhNta9JBWwJIliNJXiNQlpfHE=;
 b=60FYbdJ8wEl/4047dpqRY7fb7VHyCcl1mfCVIUOS+57BDaSu0cftanSOKkaPrdSKqZ
 V+zyJARwkBQtdZp50Wtz2QpAJPHKpRmcUC8zHDcYv6l9OlD7VWycRHR9O25H50mRR5Gr
 xp6S38eswMBc1ZizObqrp9/YDAvDlH9J+WqOnVQVp/iAHUgMaje6bMP24B25gL4Q75fx
 5aQ/OUPlzajMTaalxXD8xKR8NIOEsm5Jy7O9AE1Gw+1lUCQsWb5ua6HZOjLiWbtwL6hc
 Asj/h1a7n8p6+goDcDaaFAqjYq8490+cgiExVzOjPI2qbWfAoBieYKfJDB3Uxw750dZU
 F71g==
X-Gm-Message-State: ACgBeo22BJRu5S1wh0ABum+ca8QYlCpnD2fHgws9OQU+VRmkO3ZFV7yV
 44hY0nSx3Lpt3tegQHkrcZLvMBTrombjspbS3HubNoKLovRgCQUXLBM6/Y+q0k6f3kr5V6iFNIX
 ADKtgFond/hHvInBhHM6ZGHGkTfxsjtWy5aC4nOqihe6MYFznse2X/pWckP2OMfY4+Xk=
X-Received: by 2002:adf:d217:0:b0:225:259e:19e1 with SMTP id
 j23-20020adfd217000000b00225259e19e1mr3439181wrh.370.1661465667401; 
 Thu, 25 Aug 2022 15:14:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6WqsfqLPtmACY0mrg2kZIkOsXZHnEaGVXIYsdG49u3eHFhSsiRE2YVvATp9+W32NFZriaQ4g==
X-Received: by 2002:adf:d217:0:b0:225:259e:19e1 with SMTP id
 j23-20020adfd217000000b00225259e19e1mr3439172wrh.370.1661465667046; 
 Thu, 25 Aug 2022 15:14:27 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 v7-20020a5d6b07000000b002207cec45cesm340816wrw.81.2022.08.25.15.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 08/18] i386: Misc integer AVX helper prep
Date: Fri, 26 Aug 2022 00:14:01 +0200
Message-Id: <20220825221411.35122-9-pbonzini@redhat.com>
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

More perparatory work for AVX support in various integer vector helpers

No functional changes to existing helpers.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-13-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 164 +++++++++++++++++++++---------------------
 1 file changed, 80 insertions(+), 84 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0b5a8a9b34..4d1fcbd3ae 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -391,19 +391,22 @@ SSE_HELPER_W(helper_pavgw, FAVG)
 
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
 
@@ -417,32 +420,24 @@ static inline int abs1(int a)
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
@@ -459,20 +454,24 @@ void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 
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
 
@@ -1075,26 +1074,21 @@ uint32_t helper_movmskpd(CPUX86State *env, Reg *s)
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
 
@@ -1639,46 +1633,48 @@ SSE_HELPER_V(helper_blendvpd, Q, 2, FBLENDVPD)
 
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



