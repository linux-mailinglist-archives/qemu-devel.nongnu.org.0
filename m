Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F6B5A922A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:36:33 +0200 (CEST)
Received: from localhost ([::1]:38136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfga-00057O-EY
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTex7-0001T6-EW
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTex0-0003AO-Ru
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3REAHuapFJUYclfbIdPQbtZkfTTxzjiTaVwLoWZYQGg=;
 b=TmDQ2ZLFLWlhj7ALeEE5xSnBYcoJajGVHMCOYZWIk4s+TSQum9ZD4Nt20qefQt0M3tJxsK
 BKjWwHRNcZ9Yevnw9gl6UHhpx+LvzOka6eh2ZERIAWYZsQQW+Xj70gXp/G9jrsKZG5avsQ
 v2k0CTFmpIO6N4FnY63Gzj8Y/h3bJbw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-0-taQgKKNbmtUr14U24tag-1; Thu, 01 Sep 2022 03:49:21 -0400
X-MC-Unique: 0-taQgKKNbmtUr14U24tag-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay21-20020a05600c1e1500b003a6271a9718so9498139wmb.0
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3REAHuapFJUYclfbIdPQbtZkfTTxzjiTaVwLoWZYQGg=;
 b=3nz0VLhoMM7GvOH7qFa5yH8NxBD7V3SrRe3CmDIkheuORo8ebnvIInmkSjEJm54KrG
 rCEGctewSSGAZZsrmNRGoOeuw3J/DUSbzVW1N1buI2hYDHwS33bFbIvfk2Os0vJN7R72
 LrIVxbbk9t+Cf8a7abOkssj52rjNpNJs5oka1ETT2ouGQSzTe44sPgEjU54tGFkwtcs0
 lehsQ/2z9dSe9akJubSON2m5aZEcNX/qFtwEWGPPY6goccOfT59G350Xy9oprgsh7Zrt
 W99SiUYHTZ4i67iWVkA+JjW8YbcoNdbEifd69bYj/8TnzgkEl8hPfRVlP7t/uk/SnIG+
 tm5A==
X-Gm-Message-State: ACgBeo3bf2FRv6zKRghhwehqEUTxWWQsy0BThBjfQoXvG6V+MMr0bWMk
 8dTwnDsrMivQQX65erbj1R+1DU/xAsriuKqQcWvrbhjWsUYXSN7a3uoJvTjbaewmfQom8tG/c2d
 wkR76W/nEroy6EAoOdpTe28NLylhzB3f8m/GMCi25fvYD6veYZkP1tx+aJnZARLJTpGc=
X-Received: by 2002:a05:600c:3b1b:b0:3a8:4044:9a9c with SMTP id
 m27-20020a05600c3b1b00b003a840449a9cmr4149455wms.69.1662018559310; 
 Thu, 01 Sep 2022 00:49:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7HojsFYlkQ4mbFHF2467fqcxZXjQS/nd1pQsK1Pd6hCqetjH0B8eM94Zb/yja40AwAJ1WACg==
X-Received: by 2002:a05:600c:3b1b:b0:3a8:4044:9a9c with SMTP id
 m27-20020a05600c3b1b00b003a840449a9cmr4149420wms.69.1662018558655; 
 Thu, 01 Sep 2022 00:49:18 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a5d4f85000000b0021e6c52c921sm16388484wru.54.2022.09.01.00.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 15/23] i386: Destructive vector helpers for AVX
Date: Thu,  1 Sep 2022 09:48:34 +0200
Message-Id: <20220901074842.57424-16-pbonzini@redhat.com>
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

These helpers need to take special care to avoid overwriting source values
before the wole result has been calculated.  Currently they use a dummy
Reg typed variable to store the result then assign the whole register.
This will cause 128 bit operations to corrupt the upper half of the register,
so replace it with explicit temporaries and element assignments.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-14-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 556 ++++++++++++++++++++----------------------
 1 file changed, 262 insertions(+), 294 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 557cc7ce7d..7d48c05693 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -41,6 +41,7 @@
 #endif
 
 #define LANE_WIDTH (SHIFT ? 16 : 8)
+#define PACK_WIDTH (LANE_WIDTH / 2)
 
 /*
  * Copy the relevant parts of a Reg value around. In the case where
@@ -474,71 +475,81 @@ void glue(helper_movq_mm_T0, SUFFIX)(Reg *d, uint64_t val)
 }
 #endif
 
+#define SHUFFLE4(F, a, b, offset) do {      \
+    r0 = a->F((order & 3) + offset);        \
+    r1 = a->F(((order >> 2) & 3) + offset); \
+    r2 = b->F(((order >> 4) & 3) + offset); \
+    r3 = b->F(((order >> 6) & 3) + offset); \
+    d->F(offset) = r0;                      \
+    d->F(offset + 1) = r1;                  \
+    d->F(offset + 2) = r2;                  \
+    d->F(offset + 3) = r3;                  \
+    } while (0)
+
 #if SHIFT == 0
 void glue(helper_pshufw, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    uint16_t r0, r1, r2, r3;
 
-    r.W(0) = s->W(order & 3);
-    r.W(1) = s->W((order >> 2) & 3);
-    r.W(2) = s->W((order >> 4) & 3);
-    r.W(3) = s->W((order >> 6) & 3);
-    MOVE(*d, r);
+    SHUFFLE4(W, s, s, 0);
 }
 #else
 void glue(helper_shufps, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    Reg *v = d;
+    uint32_t r0, r1, r2, r3;
+    int i;
 
-    r.L(0) = d->L(order & 3);
-    r.L(1) = d->L((order >> 2) & 3);
-    r.L(2) = s->L((order >> 4) & 3);
-    r.L(3) = s->L((order >> 6) & 3);
-    MOVE(*d, r);
+    for (i = 0; i < 2 << SHIFT; i += 4) {
+        SHUFFLE4(L, v, s, i);
+    }
 }
 
 void glue(helper_shufpd, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    Reg *v = d;
+    uint64_t r0, r1;
+    int i;
 
-    r.Q(0) = d->Q(order & 1);
-    r.Q(1) = s->Q((order >> 1) & 1);
-    MOVE(*d, r);
+    for (i = 0; i < 1 << SHIFT; i += 2) {
+        r0 = v->Q(((order & 1) & 1) + i);
+        r1 = s->Q(((order >> 1) & 1) + i);
+        d->Q(i) = r0;
+        d->Q(i + 1) = r1;
+        order >>= 2;
+    }
 }
 
 void glue(helper_pshufd, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    uint32_t r0, r1, r2, r3;
+    int i;
 
-    r.L(0) = s->L(order & 3);
-    r.L(1) = s->L((order >> 2) & 3);
-    r.L(2) = s->L((order >> 4) & 3);
-    r.L(3) = s->L((order >> 6) & 3);
-    MOVE(*d, r);
+    for (i = 0; i < 2 << SHIFT; i += 4) {
+        SHUFFLE4(L, s, s, i);
+    }
 }
 
 void glue(helper_pshuflw, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    uint16_t r0, r1, r2, r3;
+    int i, j;
 
-    r.W(0) = s->W(order & 3);
-    r.W(1) = s->W((order >> 2) & 3);
-    r.W(2) = s->W((order >> 4) & 3);
-    r.W(3) = s->W((order >> 6) & 3);
-    r.Q(1) = s->Q(1);
-    MOVE(*d, r);
+    for (i = 0, j = 1; j < 1 << SHIFT; i += 8, j += 2) {
+        SHUFFLE4(W, s, s, i);
+        d->Q(j) = s->Q(j);
+    }
 }
 
 void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    uint16_t r0, r1, r2, r3;
+    int i, j;
 
-    r.Q(0) = s->Q(0);
-    r.W(4) = s->W(4 + (order & 3));
-    r.W(5) = s->W(4 + ((order >> 2) & 3));
-    r.W(6) = s->W(4 + ((order >> 4) & 3));
-    r.W(7) = s->W(4 + ((order >> 6) & 3));
-    MOVE(*d, r);
+    for (i = 4, j = 0; j < 1 << SHIFT; i += 8, j += 2) {
+        d->Q(j) = s->Q(j);
+        SHUFFLE4(W, s, s, i);
+    }
 }
 #endif
 
@@ -1091,156 +1102,132 @@ uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
     return val;
 }
 
-void glue(helper_packsswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
-    r.B(0) = satsb((int16_t)d->W(0));
-    r.B(1) = satsb((int16_t)d->W(1));
-    r.B(2) = satsb((int16_t)d->W(2));
-    r.B(3) = satsb((int16_t)d->W(3));
-#if SHIFT == 1
-    r.B(4) = satsb((int16_t)d->W(4));
-    r.B(5) = satsb((int16_t)d->W(5));
-    r.B(6) = satsb((int16_t)d->W(6));
-    r.B(7) = satsb((int16_t)d->W(7));
-#endif
-    r.B((4 << SHIFT) + 0) = satsb((int16_t)s->W(0));
-    r.B((4 << SHIFT) + 1) = satsb((int16_t)s->W(1));
-    r.B((4 << SHIFT) + 2) = satsb((int16_t)s->W(2));
-    r.B((4 << SHIFT) + 3) = satsb((int16_t)s->W(3));
-#if SHIFT == 1
-    r.B(12) = satsb((int16_t)s->W(4));
-    r.B(13) = satsb((int16_t)s->W(5));
-    r.B(14) = satsb((int16_t)s->W(6));
-    r.B(15) = satsb((int16_t)s->W(7));
-#endif
-    MOVE(*d, r);
+#define PACK_HELPER_B(name, F) \
+void glue(helper_pack ## name, SUFFIX)(CPUX86State *env,      \
+        Reg *d, Reg *s)                                       \
+{                                                             \
+    Reg *v = d;                                               \
+    uint8_t r[PACK_WIDTH * 2];                                \
+    int j, k;                                                 \
+    for (j = 0; j < 4 << SHIFT; j += PACK_WIDTH) {            \
+        for (k = 0; k < PACK_WIDTH; k++) {                    \
+            r[k] = F((int16_t)v->W(j + k));                   \
+        }                                                     \
+        for (k = 0; k < PACK_WIDTH; k++) {                    \
+            r[PACK_WIDTH + k] = F((int16_t)s->W(j + k));      \
+        }                                                     \
+        for (k = 0; k < PACK_WIDTH * 2; k++) {                \
+            d->B(2 * j + k) = r[k];                           \
+        }                                                     \
+    }                                                         \
 }
 
-void glue(helper_packuswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
-    r.B(0) = satub((int16_t)d->W(0));
-    r.B(1) = satub((int16_t)d->W(1));
-    r.B(2) = satub((int16_t)d->W(2));
-    r.B(3) = satub((int16_t)d->W(3));
-#if SHIFT == 1
-    r.B(4) = satub((int16_t)d->W(4));
-    r.B(5) = satub((int16_t)d->W(5));
-    r.B(6) = satub((int16_t)d->W(6));
-    r.B(7) = satub((int16_t)d->W(7));
-#endif
-    r.B((4 << SHIFT) + 0) = satub((int16_t)s->W(0));
-    r.B((4 << SHIFT) + 1) = satub((int16_t)s->W(1));
-    r.B((4 << SHIFT) + 2) = satub((int16_t)s->W(2));
-    r.B((4 << SHIFT) + 3) = satub((int16_t)s->W(3));
-#if SHIFT == 1
-    r.B(12) = satub((int16_t)s->W(4));
-    r.B(13) = satub((int16_t)s->W(5));
-    r.B(14) = satub((int16_t)s->W(6));
-    r.B(15) = satub((int16_t)s->W(7));
-#endif
-    MOVE(*d, r);
-}
+PACK_HELPER_B(sswb, satsb)
+PACK_HELPER_B(uswb, satub)
 
 void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    Reg r;
+    Reg *v = d;
+    uint16_t r[PACK_WIDTH];
+    int j, k;
 
-    r.W(0) = satsw(d->L(0));
-    r.W(1) = satsw(d->L(1));
-#if SHIFT == 1
-    r.W(2) = satsw(d->L(2));
-    r.W(3) = satsw(d->L(3));
-#endif
-    r.W((2 << SHIFT) + 0) = satsw(s->L(0));
-    r.W((2 << SHIFT) + 1) = satsw(s->L(1));
-#if SHIFT == 1
-    r.W(6) = satsw(s->L(2));
-    r.W(7) = satsw(s->L(3));
-#endif
-    MOVE(*d, r);
+    for (j = 0; j < 2 << SHIFT; j += PACK_WIDTH / 2) {
+        for (k = 0; k < PACK_WIDTH / 2; k++) {
+            r[k] = satsw(v->L(j + k));
+        }
+        for (k = 0; k < PACK_WIDTH / 2; k++) {
+            r[PACK_WIDTH / 2 + k] = satsw(s->L(j + k));
+        }
+        for (k = 0; k < PACK_WIDTH; k++) {
+            d->W(2 * j + k) = r[k];
+        }
+    }
 }
 
 #define UNPCK_OP(base_name, base)                                       \
                                                                         \
     void glue(helper_punpck ## base_name ## bw, SUFFIX)(CPUX86State *env,\
-                                                        Reg *d, Reg *s) \
+                                                Reg *d, Reg *s) \
     {                                                                   \
-        Reg r;                                                          \
+        Reg *v = d;                                                     \
+        uint8_t r[PACK_WIDTH * 2];                                      \
+        int j, i;                                                       \
                                                                         \
-        r.B(0) = d->B((base << (SHIFT + 2)) + 0);                       \
-        r.B(1) = s->B((base << (SHIFT + 2)) + 0);                       \
-        r.B(2) = d->B((base << (SHIFT + 2)) + 1);                       \
-        r.B(3) = s->B((base << (SHIFT + 2)) + 1);                       \
-        r.B(4) = d->B((base << (SHIFT + 2)) + 2);                       \
-        r.B(5) = s->B((base << (SHIFT + 2)) + 2);                       \
-        r.B(6) = d->B((base << (SHIFT + 2)) + 3);                       \
-        r.B(7) = s->B((base << (SHIFT + 2)) + 3);                       \
-        XMM_ONLY(                                                       \
-                 r.B(8) = d->B((base << (SHIFT + 2)) + 4);              \
-                 r.B(9) = s->B((base << (SHIFT + 2)) + 4);              \
-                 r.B(10) = d->B((base << (SHIFT + 2)) + 5);             \
-                 r.B(11) = s->B((base << (SHIFT + 2)) + 5);             \
-                 r.B(12) = d->B((base << (SHIFT + 2)) + 6);             \
-                 r.B(13) = s->B((base << (SHIFT + 2)) + 6);             \
-                 r.B(14) = d->B((base << (SHIFT + 2)) + 7);             \
-                 r.B(15) = s->B((base << (SHIFT + 2)) + 7);             \
-                                                                      ) \
-        MOVE(*d, r);                                                    \
+        for (j = 0; j < 8 << SHIFT; ) {                                 \
+            int k = j + base * PACK_WIDTH;                              \
+            for (i = 0; i < PACK_WIDTH; i++) {                          \
+                r[2 * i] = v->B(k + i);                                 \
+                r[2 * i + 1] = s->B(k + i);                             \
+            }                                                           \
+            for (i = 0; i < PACK_WIDTH * 2; i++, j++) {                 \
+                d->B(j) = r[i];                                         \
+            }                                                           \
+        }                                                               \
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## wd, SUFFIX)(CPUX86State *env,\
-                                                        Reg *d, Reg *s) \
+                                                Reg *d, Reg *s) \
     {                                                                   \
-        Reg r;                                                          \
+        Reg *v = d;                                                     \
+        uint16_t r[PACK_WIDTH];                                         \
+        int j, i;                                                       \
                                                                         \
-        r.W(0) = d->W((base << (SHIFT + 1)) + 0);                       \
-        r.W(1) = s->W((base << (SHIFT + 1)) + 0);                       \
-        r.W(2) = d->W((base << (SHIFT + 1)) + 1);                       \
-        r.W(3) = s->W((base << (SHIFT + 1)) + 1);                       \
-        XMM_ONLY(                                                       \
-                 r.W(4) = d->W((base << (SHIFT + 1)) + 2);              \
-                 r.W(5) = s->W((base << (SHIFT + 1)) + 2);              \
-                 r.W(6) = d->W((base << (SHIFT + 1)) + 3);              \
-                 r.W(7) = s->W((base << (SHIFT + 1)) + 3);              \
-                                                                      ) \
-            MOVE(*d, r);                                                \
+        for (j = 0; j < 4 << SHIFT; ) {                                 \
+            int k = j + base * PACK_WIDTH / 2;                          \
+            for (i = 0; i < PACK_WIDTH / 2; i++) {                      \
+                r[2 * i] = v->W(k + i);                                 \
+                r[2 * i + 1] = s->W(k + i);                             \
+            }                                                           \
+            for (i = 0; i < PACK_WIDTH; i++, j++) {                     \
+                d->W(j) = r[i];                                         \
+            }                                                           \
+        }                                                               \
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## dq, SUFFIX)(CPUX86State *env,\
-                                                        Reg *d, Reg *s) \
+                                                Reg *d, Reg *s) \
     {                                                                   \
-        Reg r;                                                          \
+        Reg *v = d;                                                     \
+        uint32_t r[PACK_WIDTH / 2];                                     \
+        int j, i;                                                       \
                                                                         \
-        r.L(0) = d->L((base << SHIFT) + 0);                             \
-        r.L(1) = s->L((base << SHIFT) + 0);                             \
-        XMM_ONLY(                                                       \
-                 r.L(2) = d->L((base << SHIFT) + 1);                    \
-                 r.L(3) = s->L((base << SHIFT) + 1);                    \
-                                                                      ) \
-            MOVE(*d, r);                                                \
+        for (j = 0; j < 2 << SHIFT; ) {                                 \
+            int k = j + base * PACK_WIDTH / 4;                          \
+            for (i = 0; i < PACK_WIDTH / 4; i++) {                      \
+                r[2 * i] = v->L(k + i);                                 \
+                r[2 * i + 1] = s->L(k + i);                             \
+            }                                                           \
+            for (i = 0; i < PACK_WIDTH / 2; i++, j++) {                 \
+                d->L(j) = r[i];                                         \
+            }                                                           \
+        }                                                               \
     }                                                                   \
                                                                         \
     XMM_ONLY(                                                   # qdq, SUFFIX)(      \
+                        CPUX86State *env, Reg *d, Reg *s)       \
              {                                                          \
-                 Reg r;                                                 \
+                 Reg *v = d;                                            \
+                 uint64_t r[2];                                         \
+                 int i;                                                 \
                                                                         \
-                 r.Q(0) = d->Q(base);                                   \
-                 r.Q(1) = s->Q(base);                                   \
-                 MOVE(*d, r);                                           \
+                 for (i = 0; i < 1 << SHIFT; i += 2) {                  \
+                     r[0] = v->Q(base + i);                             \
+                     r[1] = s->Q(base + i);                             \
+                     d->Q(i) = r[0];                                    \
+                     d->Q(i + 1) = r[1];                                \
+                 }                                                      \
              }                                                          \
                                                                         )
 
 UNPCK_OP(l, 0)
 UNPCK_OP(h, 1)
 
+#undef PACK_WIDTH
+#undef PACK_HELPER_B
+#undef UNPCK_OP
+
+
 /* 3DNow! float ops */
 #if SHIFT == 0
 void helper_pi2fd(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1393,122 +1380,86 @@ void helper_pswapd(CPUX86State *env, MMXReg *d, MMXReg *s)
 /* SSSE3 op helpers */
 void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
+    Reg *v = d;
     int i;
-    Reg r;
+#if SHIFT == 0
+    uint8_t r[8];
 
-    for (i = 0; i < (8 << SHIFT); i++) {
-        r.B(i) = (s->B(i) & 0x80) ? 0 : (d->B(s->B(i) & ((8 << SHIFT) - 1)));
+    for (i = 0; i < 8; i++) {
+        r[i] = (s->B(i) & 0x80) ? 0 : (v->B(s->B(i) & 7));
     }
+    for (i = 0; i < 8; i++) {
+        d->B(i) = r[i];
+    }
+#else
+    uint8_t r[8 << SHIFT];
 
-    MOVE(*d, r);
-}
-
-void glue(helper_phaddw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-
-    Reg r;
-
-    r.W(0) = (int16_t)d->W(0) + (int16_t)d->W(1);
-    r.W(1) = (int16_t)d->W(2) + (int16_t)d->W(3);
-    XMM_ONLY(r.W(2) = (int16_t)d->W(4) + (int16_t)d->W(5));
-    XMM_ONLY(r.W(3) = (int16_t)d->W(6) + (int16_t)d->W(7));
-    r.W((2 << SHIFT) + 0) = (int16_t)s->W(0) + (int16_t)s->W(1);
-    r.W((2 << SHIFT) + 1) = (int16_t)s->W(2) + (int16_t)s->W(3);
-    XMM_ONLY(r.W(6) = (int16_t)s->W(4) + (int16_t)s->W(5));
-    XMM_ONLY(r.W(7) = (int16_t)s->W(6) + (int16_t)s->W(7));
-
-    MOVE(*d, r);
-}
-
-void glue(helper_phaddd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
-    r.L(0) = (int32_t)d->L(0) + (int32_t)d->L(1);
-    XMM_ONLY(r.L(1) = (int32_t)d->L(2) + (int32_t)d->L(3));
-    r.L((1 << SHIFT) + 0) = (int32_t)s->L(0) + (int32_t)s->L(1);
-    XMM_ONLY(r.L(3) = (int32_t)s->L(2) + (int32_t)s->L(3));
-
-    MOVE(*d, r);
-}
-
-void glue(helper_phaddsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
-    r.W(0) = satsw((int16_t)d->W(0) + (int16_t)d->W(1));
-    r.W(1) = satsw((int16_t)d->W(2) + (int16_t)d->W(3));
-    XMM_ONLY(r.W(2) = satsw((int16_t)d->W(4) + (int16_t)d->W(5)));
-    XMM_ONLY(r.W(3) = satsw((int16_t)d->W(6) + (int16_t)d->W(7)));
-    r.W((2 << SHIFT) + 0) = satsw((int16_t)s->W(0) + (int16_t)s->W(1));
-    r.W((2 << SHIFT) + 1) = satsw((int16_t)s->W(2) + (int16_t)s->W(3));
-    XMM_ONLY(r.W(6) = satsw((int16_t)s->W(4) + (int16_t)s->W(5)));
-    XMM_ONLY(r.W(7) = satsw((int16_t)s->W(6) + (int16_t)s->W(7)));
-
-    MOVE(*d, r);
-}
-
-void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    d->W(0) = satsw((int8_t)s->B(0) * (uint8_t)d->B(0) +
-                    (int8_t)s->B(1) * (uint8_t)d->B(1));
-    d->W(1) = satsw((int8_t)s->B(2) * (uint8_t)d->B(2) +
-                    (int8_t)s->B(3) * (uint8_t)d->B(3));
-    d->W(2) = satsw((int8_t)s->B(4) * (uint8_t)d->B(4) +
-                    (int8_t)s->B(5) * (uint8_t)d->B(5));
-    d->W(3) = satsw((int8_t)s->B(6) * (uint8_t)d->B(6) +
-                    (int8_t)s->B(7) * (uint8_t)d->B(7));
-#if SHIFT == 1
-    d->W(4) = satsw((int8_t)s->B(8) * (uint8_t)d->B(8) +
-                    (int8_t)s->B(9) * (uint8_t)d->B(9));
-    d->W(5) = satsw((int8_t)s->B(10) * (uint8_t)d->B(10) +
-                    (int8_t)s->B(11) * (uint8_t)d->B(11));
-    d->W(6) = satsw((int8_t)s->B(12) * (uint8_t)d->B(12) +
-                    (int8_t)s->B(13) * (uint8_t)d->B(13));
-    d->W(7) = satsw((int8_t)s->B(14) * (uint8_t)d->B(14) +
-                    (int8_t)s->B(15) * (uint8_t)d->B(15));
+    for (i = 0; i < 8 << SHIFT; i++) {
+        int j = i & ~0xf;
+        r[i] = (s->B(i) & 0x80) ? 0 : v->B(j | (s->B(i) & 0xf));
+    }
+    for (i = 0; i < 8 << SHIFT; i++) {
+        d->B(i) = r[i];
+    }
 #endif
 }
 
-void glue(helper_phsubw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
-    r.W(0) = (int16_t)d->W(0) - (int16_t)d->W(1);
-    r.W(1) = (int16_t)d->W(2) - (int16_t)d->W(3);
-    XMM_ONLY(r.W(2) = (int16_t)d->W(4) - (int16_t)d->W(5));
-    XMM_ONLY(r.W(3) = (int16_t)d->W(6) - (int16_t)d->W(7));
-    r.W((2 << SHIFT) + 0) = (int16_t)s->W(0) - (int16_t)s->W(1);
-    r.W((2 << SHIFT) + 1) = (int16_t)s->W(2) - (int16_t)s->W(3);
-    XMM_ONLY(r.W(6) = (int16_t)s->W(4) - (int16_t)s->W(5));
-    XMM_ONLY(r.W(7) = (int16_t)s->W(6) - (int16_t)s->W(7));
-    MOVE(*d, r);
+#define SSE_HELPER_HW(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+{                                                          \
+    Reg *v = d;                                            \
+    uint16_t r[4 << SHIFT];                                \
+    int i, j, k;                                           \
+    for (k = 0; k < 4 << SHIFT; k += LANE_WIDTH / 2) {     \
+        for (i = j = 0; j < LANE_WIDTH / 2; i++, j += 2) { \
+            r[i + k] = F(v->W(j + k), v->W(j + k + 1));    \
+        }                                                  \
+        for (j = 0; j < LANE_WIDTH / 2; i++, j += 2) {     \
+            r[i + k] = F(s->W(j + k), s->W(j + k + 1));    \
+        }                                                  \
+    }                                                      \
+    for (i = 0; i < 4 << SHIFT; i++) {                     \
+        d->W(i) = r[i];                                    \
+    }                                                      \
 }
 
-void glue(helper_phsubd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
-    r.L(0) = (int32_t)d->L(0) - (int32_t)d->L(1);
-    XMM_ONLY(r.L(1) = (int32_t)d->L(2) - (int32_t)d->L(3));
-    r.L((1 << SHIFT) + 0) = (int32_t)s->L(0) - (int32_t)s->L(1);
-    XMM_ONLY(r.L(3) = (int32_t)s->L(2) - (int32_t)s->L(3));
-    MOVE(*d, r);
+#define SSE_HELPER_HL(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+{                                                          \
+    Reg *v = d;                                            \
+    uint32_t r[2 << SHIFT];                                \
+    int i, j, k;                                           \
+    for (k = 0; k < 2 << SHIFT; k += LANE_WIDTH / 4) {     \
+        for (i = j = 0; j < LANE_WIDTH / 4; i++, j += 2) { \
+            r[i + k] = F(v->L(j + k), v->L(j + k + 1));    \
+        }                                                  \
+        for (j = 0; j < LANE_WIDTH / 4; i++, j += 2) {     \
+            r[i + k] = F(s->L(j + k), s->L(j + k + 1));    \
+        }                                                  \
+    }                                                      \
+    for (i = 0; i < 2 << SHIFT; i++) {                     \
+        d->L(i) = r[i];                                    \
+    }                                                      \
 }
 
-void glue(helper_phsubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
+SSE_HELPER_HW(phaddw, FADD)
+SSE_HELPER_HW(phsubw, FSUB)
+SSE_HELPER_HW(phaddsw, FADDSW)
+SSE_HELPER_HW(phsubsw, FSUBSW)
+SSE_HELPER_HL(phaddd, FADD)
+SSE_HELPER_HL(phsubd, FSUB)
 
-    r.W(0) = satsw((int16_t)d->W(0) - (int16_t)d->W(1));
-    r.W(1) = satsw((int16_t)d->W(2) - (int16_t)d->W(3));
-    XMM_ONLY(r.W(2) = satsw((int16_t)d->W(4) - (int16_t)d->W(5)));
-    XMM_ONLY(r.W(3) = satsw((int16_t)d->W(6) - (int16_t)d->W(7)));
-    r.W((2 << SHIFT) + 0) = satsw((int16_t)s->W(0) - (int16_t)s->W(1));
-    r.W((2 << SHIFT) + 1) = satsw((int16_t)s->W(2) - (int16_t)s->W(3));
-    XMM_ONLY(r.W(6) = satsw((int16_t)s->W(4) - (int16_t)s->W(5)));
-    XMM_ONLY(r.W(7) = satsw((int16_t)s->W(6) - (int16_t)s->W(7)));
-    MOVE(*d, r);
+#undef SSE_HELPER_HW
+#undef SSE_HELPER_HL
+
+void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    Reg *v = d;
+    int i;
+    for (i = 0; i < 4 << SHIFT; i++) {
+        d->W(i) = satsw((int8_t)s->B(i * 2) * (uint8_t)v->B(i * 2) +
+                        (int8_t)s->B(i * 2 + 1) * (uint8_t)v->B(i * 2 + 1));
+    }
 }
 
 #define FABSB(x) (x > INT8_MAX  ? -(int8_t)x : x)
@@ -1531,32 +1482,38 @@ SSE_HELPER_L(helper_psignd, FSIGNL)
 void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   int32_t shift)
 {
-    Reg r;
+    Reg *v = d;
+    int i;
 
     /* XXX could be checked during translation */
-    if (shift >= (16 << SHIFT)) {
-        r.Q(0) = 0;
-        XMM_ONLY(r.Q(1) = 0);
+    if (shift >= (SHIFT ? 32 : 16)) {
+        for (i = 0; i < (1 << SHIFT); i++) {
+            d->Q(i) = 0;
+        }
     } else {
         shift <<= 3;
 #define SHR(v, i) (i < 64 && i > -64 ? i > 0 ? v >> (i) : (v << -(i)) : 0)
 #if SHIFT == 0
-        r.Q(0) = SHR(s->Q(0), shift - 0) |
-            SHR(d->Q(0), shift -  64);
+        d->Q(0) = SHR(s->Q(0), shift - 0) |
+            SHR(v->Q(0), shift -  64);
 #else
-        r.Q(0) = SHR(s->Q(0), shift - 0) |
-            SHR(s->Q(1), shift -  64) |
-            SHR(d->Q(0), shift - 128) |
-            SHR(d->Q(1), shift - 192);
-        r.Q(1) = SHR(s->Q(0), shift + 64) |
-            SHR(s->Q(1), shift -   0) |
-            SHR(d->Q(0), shift -  64) |
-            SHR(d->Q(1), shift - 128);
+        for (i = 0; i < (1 << SHIFT); i += 2) {
+            uint64_t r0, r1;
+
+            r0 = SHR(s->Q(i), shift - 0) |
+                 SHR(s->Q(i + 1), shift -  64) |
+                 SHR(v->Q(i), shift - 128) |
+                 SHR(v->Q(i + 1), shift - 192);
+            r1 = SHR(s->Q(i), shift + 64) |
+                 SHR(s->Q(i + 1), shift -   0) |
+                 SHR(v->Q(i), shift -  64) |
+                 SHR(v->Q(i + 1), shift - 128);
+            d->Q(i) = r0;
+            d->Q(i + 1) = r1;
+        }
 #endif
 #undef SHR
     }
-
-    MOVE(*d, r);
 }
 
 #define XMM0 (env->xmm_regs[0])
@@ -1681,17 +1638,23 @@ SSE_HELPER_Q(helper_pcmpeqq, FCMPEQQ)
 
 void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    Reg r;
+    Reg *v = d;
+    uint16_t r[8];
+    int i, j, k;
 
-    r.W(0) = satuw((int32_t) d->L(0));
-    r.W(1) = satuw((int32_t) d->L(1));
-    r.W(2) = satuw((int32_t) d->L(2));
-    r.W(3) = satuw((int32_t) d->L(3));
-    r.W(4) = satuw((int32_t) s->L(0));
-    r.W(5) = satuw((int32_t) s->L(1));
-    r.W(6) = satuw((int32_t) s->L(2));
-    r.W(7) = satuw((int32_t) s->L(3));
-    MOVE(*d, r);
+    for (i = 0, j = 0; i <= 2 << SHIFT; i += 8, j += 4) {
+        r[0] = satuw(v->L(j));
+        r[1] = satuw(v->L(j + 1));
+        r[2] = satuw(v->L(j + 2));
+        r[3] = satuw(v->L(j + 3));
+        r[4] = satuw(s->L(j));
+        r[5] = satuw(s->L(j + 1));
+        r[6] = satuw(s->L(j + 2));
+        r[7] = satuw(s->L(j + 3));
+        for (k = 0; k < 8; k++) {
+            d->W(i + k) = r[k];
+        }
+    }
 }
 
 #define FMINSB(d, s) MIN((int8_t)d, (int8_t)s)
@@ -1947,20 +1910,25 @@ void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
 void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t offset)
 {
-    int s0 = (offset & 3) << 2;
-    int d0 = (offset & 4) << 0;
-    int i;
-    Reg r;
+    Reg *v = d;
+    int i, j;
+    uint16_t r[8];
 
-    for (i = 0; i < 8; i++, d0++) {
-        r.W(i) = 0;
-        r.W(i) += abs1(d->B(d0 + 0) - s->B(s0 + 0));
-        r.W(i) += abs1(d->B(d0 + 1) - s->B(s0 + 1));
-        r.W(i) += abs1(d->B(d0 + 2) - s->B(s0 + 2));
-        r.W(i) += abs1(d->B(d0 + 3) - s->B(s0 + 3));
+    for (j = 0; j < 4 << SHIFT; ) {
+        int s0 = (j * 2) + ((offset & 3) << 2);
+        int d0 = (j * 2) + ((offset & 4) << 0);
+        for (i = 0; i < LANE_WIDTH / 2; i++, d0++) {
+            r[i] = 0;
+            r[i] += abs1(v->B(d0 + 0) - s->B(s0 + 0));
+            r[i] += abs1(v->B(d0 + 1) - s->B(s0 + 1));
+            r[i] += abs1(v->B(d0 + 2) - s->B(s0 + 2));
+            r[i] += abs1(v->B(d0 + 3) - s->B(s0 + 3));
+        }
+        for (i = 0; i < LANE_WIDTH / 2; i++, j++) {
+            d->W(j) = r[i];
+        }
+        offset >>= 3;
     }
-
-    MOVE(*d, r);
 }
 
 /* SSE4.2 op helpers */
-- 
2.37.1



