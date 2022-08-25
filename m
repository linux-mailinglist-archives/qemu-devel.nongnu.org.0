Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C9A5A1C7D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:37:45 +0200 (CEST)
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLTr-0008BZ-Gg
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7U-0007zc-2h
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7R-0002jh-7v
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rftcleKzaj7+bQSu90jUAfXku6a0DS9NWPx/QUKtLMY=;
 b=LyCv8m6bAYfW1EliCoU4IoRIueStVJ3v+FZh57e4WbCwBZQanTBz4FhpzXRNP2sQqxhUJQ
 gy1sTX9hpNVKiXDAGo4PRmKbd4CUppi92VRx5vjKZtIAAzBHmqWMWR6ioonZMm+QpTjKJJ
 N3kMGOmGUa6Py9NcwTJJ6NkmebCdPbs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-dz8MbSYxNii0cC92MBr7pw-1; Thu, 25 Aug 2022 18:14:31 -0400
X-MC-Unique: dz8MbSYxNii0cC92MBr7pw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h82-20020a1c2155000000b003a64d0510d9so6506186wmh.8
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rftcleKzaj7+bQSu90jUAfXku6a0DS9NWPx/QUKtLMY=;
 b=RchgSzHKKoGuC5pnKCj5EHmv3FpNDqYpzd7G8TrQypbtWMqh/1R0i93bGuUvT+etKy
 nr9MMYS1i6rpFF+f4xO+SeB2HgGvrKu6i0zGQGvAe7yG8ibMwG6fo+ZPJ0AXcXk/3c5g
 77SeZE6nOZ8hPim889WO+McwR41v2PirTngv54jT9vfT2IogHI1nskzQMkLDytj0Th9F
 T8TDtPKIZ9wmtZ0YsbgqBljEkd6FrCb99PCJqrhoWX63bSW0gppz0D8PdN6YjPooXcY2
 dRpFEGfFsj0va+DD3rvBweKl0Ul/yIv/1yv91RgtgRpewWAEm+ps0h0bJHYlOJnjmLFV
 bf3g==
X-Gm-Message-State: ACgBeo3TQAmYPMz2OWwwtkiz9m6JpRQ4taukrxKFWtZSfWg3MTmQwe7M
 A+JAbtTolbOYVUOsKZHZ6iFcKVlb4HLguMkDWzW41mq3v5g1oPwqYkV44A9UOo4BguWO6yQ1bf+
 LNJ3XDNXul52sY8FEe9R5ypshFynum0oPWiLLFJ66HeoWbbDTg+6e0vMKyANnyK1Sicg=
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr8836423wmr.27.1661465669268; 
 Thu, 25 Aug 2022 15:14:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6lVmzoz3Q7sys/zWd0tGZTU17jxne/Qdcoptk0mfOh0eJDhUjDMkwvymrhVQt1o21+qM/F4w==
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr8836402wmr.27.1661465668669; 
 Thu, 25 Aug 2022 15:14:28 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r186-20020a1c44c3000000b003a5bd9448e5sm459695wma.28.2022.08.25.15.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 09/18] i386: Destructive vector helpers for AVX
Date: Fri, 26 Aug 2022 00:14:02 +0200
Message-Id: <20220825221411.35122-10-pbonzini@redhat.com>
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

These helpers need to take special care to avoid overwriting source values
before the wole result has been calculated.  Currently they use a dummy
Reg typed variable to store the result then assign the whole register.
This will cause 128 bit operations to corrupt the upper half of the register,
so replace it with explicit temporaries and element assignments.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-14-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 565 +++++++++++++++++++++---------------------
 1 file changed, 284 insertions(+), 281 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 4d1fcbd3ae..5265005f1e 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -475,71 +475,68 @@ void glue(helper_movq_mm_T0, SUFFIX)(Reg *d, uint64_t val)
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
 void helper_shufps(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    Reg *v = d;
+    uint32_t r0, r1, r2, r3;
 
-    r.L(0) = d->L(order & 3);
-    r.L(1) = d->L((order >> 2) & 3);
-    r.L(2) = s->L((order >> 4) & 3);
-    r.L(3) = s->L((order >> 6) & 3);
-    MOVE(*d, r);
+    SHUFFLE4(L, v, s, 0);
 }
 
 void helper_shufpd(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    Reg *v = d;
+    uint64_t r0, r1;
 
-    r.Q(0) = d->Q(order & 1);
-    r.Q(1) = s->Q((order >> 1) & 1);
-    MOVE(*d, r);
+    r0 = v->Q(order & 1);
+    r1 = s->Q((order >> 1) & 1);
+    d->Q(0) = r0;
+    d->Q(1) = r1;
 }
 
 void glue(helper_pshufd, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    uint32_t r0, r1, r2, r3;
 
-    r.L(0) = s->L(order & 3);
-    r.L(1) = s->L((order >> 2) & 3);
-    r.L(2) = s->L((order >> 4) & 3);
-    r.L(3) = s->L((order >> 6) & 3);
-    MOVE(*d, r);
+    SHUFFLE4(L, s, s, 0);
+#if SHIFT ==  2
+    SHUFFLE4(L, s, s, 4);
+#endif
 }
 
 void glue(helper_pshuflw, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    uint16_t r0, r1, r2, r3;
 
-    r.W(0) = s->W(order & 3);
-    r.W(1) = s->W((order >> 2) & 3);
-    r.W(2) = s->W((order >> 4) & 3);
-    r.W(3) = s->W((order >> 6) & 3);
-    r.Q(1) = s->Q(1);
-    MOVE(*d, r);
+    SHUFFLE4(W, s, s, 0);
+    d->Q(1) = s->Q(1);
 }
 
 void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    uint16_t r0, r1, r2, r3;
 
-    r.Q(0) = s->Q(0);
-    r.W(4) = s->W(4 + (order & 3));
-    r.W(5) = s->W(4 + ((order >> 2) & 3));
-    r.W(6) = s->W(4 + ((order >> 4) & 3));
-    r.W(7) = s->W(4 + ((order >> 6) & 3));
-    MOVE(*d, r);
+    d->Q(0) = s->Q(0);
+    SHUFFLE4(W, s, s, 4);
 }
 #endif
 
@@ -1092,156 +1089,157 @@ uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
     return val;
 }
 
-void glue(helper_packsswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
+#if SHIFT == 0
+#define PACK_WIDTH 4
+#else
+#define PACK_WIDTH 8
+#endif
 
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
+#define PACK4(F, to, reg, from) do {        \
+    r[to + 0] = F((int16_t)reg->W(from + 0));   \
+    r[to + 1] = F((int16_t)reg->W(from + 1));   \
+    r[to + 2] = F((int16_t)reg->W(from + 2));   \
+    r[to + 3] = F((int16_t)reg->W(from + 3));   \
+    } while (0)
+
+#define PACK_HELPER_B(name, F) \
+void glue(helper_pack ## name, SUFFIX)(CPUX86State *env, \
+        Reg *d, Reg *s)                         \
+{                                               \
+    Reg *v = d;                                 \
+    uint8_t r[PACK_WIDTH * 2];                  \
+    int i;                                      \
+    PACK4(F, 0, v, 0);                          \
+    PACK4(F, PACK_WIDTH, s, 0);                 \
+    XMM_ONLY(                                   \
+        PACK4(F, 4, v, 4);                      \
+        PACK4(F, 12, s, 4);                     \
+        )                                       \
+    for (i = 0; i < PACK_WIDTH * 2; i++) {      \
+        d->B(i) = r[i];                         \
+    }                                           \
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
+    int i, j, k;
 
-    r.W(0) = satsw(d->L(0));
-    r.W(1) = satsw(d->L(1));
-#if SHIFT == 1
-    r.W(2) = satsw(d->L(2));
-    r.W(3) = satsw(d->L(3));
+    for (i = 0, j = 0; i <= 2 << SHIFT; i += 8, j += 4) {
+        r[0] = satsw(v->L(j));
+        r[1] = satsw(v->L(j + 1));
+        r[PACK_WIDTH / 2 + 0] = satsw(s->L(j));
+        r[PACK_WIDTH / 2 + 1] = satsw(s->L(j + 1));
+#if SHIFT >= 1
+        r[2] = satsw(v->L(j + 2));
+        r[3] = satsw(v->L(j + 3));
+        r[6] = satsw(s->L(j + 2));
+        r[7] = satsw(s->L(j + 3));
 #endif
-    r.W((2 << SHIFT) + 0) = satsw(s->L(0));
-    r.W((2 << SHIFT) + 1) = satsw(s->L(1));
-#if SHIFT == 1
-    r.W(6) = satsw(s->L(2));
-    r.W(7) = satsw(s->L(3));
-#endif
-    MOVE(*d, r);
+        for (k = 0; k < PACK_WIDTH; k++) {
+            d->W(i + k) = r[k];
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
+        int i;                                                          \
                                                                         \
-        r.B(0) = d->B((base << (SHIFT + 2)) + 0);                       \
-        r.B(1) = s->B((base << (SHIFT + 2)) + 0);                       \
-        r.B(2) = d->B((base << (SHIFT + 2)) + 1);                       \
-        r.B(3) = s->B((base << (SHIFT + 2)) + 1);                       \
-        r.B(4) = d->B((base << (SHIFT + 2)) + 2);                       \
-        r.B(5) = s->B((base << (SHIFT + 2)) + 2);                       \
-        r.B(6) = d->B((base << (SHIFT + 2)) + 3);                       \
-        r.B(7) = s->B((base << (SHIFT + 2)) + 3);                       \
+        r[0] = v->B((base * PACK_WIDTH) + 0);                           \
+        r[1] = s->B((base * PACK_WIDTH) + 0);                           \
+        r[2] = v->B((base * PACK_WIDTH) + 1);                           \
+        r[3] = s->B((base * PACK_WIDTH) + 1);                           \
+        r[4] = v->B((base * PACK_WIDTH) + 2);                           \
+        r[5] = s->B((base * PACK_WIDTH) + 2);                           \
+        r[6] = v->B((base * PACK_WIDTH) + 3);                           \
+        r[7] = s->B((base * PACK_WIDTH) + 3);                           \
         XMM_ONLY(                                                       \
-                 r.B(8) = d->B((base << (SHIFT + 2)) + 4);              \
-                 r.B(9) = s->B((base << (SHIFT + 2)) + 4);              \
-                 r.B(10) = d->B((base << (SHIFT + 2)) + 5);             \
-                 r.B(11) = s->B((base << (SHIFT + 2)) + 5);             \
-                 r.B(12) = d->B((base << (SHIFT + 2)) + 6);             \
-                 r.B(13) = s->B((base << (SHIFT + 2)) + 6);             \
-                 r.B(14) = d->B((base << (SHIFT + 2)) + 7);             \
-                 r.B(15) = s->B((base << (SHIFT + 2)) + 7);             \
+                 r[8] = v->B((base * PACK_WIDTH) + 4);                  \
+                 r[9] = s->B((base * PACK_WIDTH) + 4);                  \
+                 r[10] = v->B((base * PACK_WIDTH) + 5);                 \
+                 r[11] = s->B((base * PACK_WIDTH) + 5);                 \
+                 r[12] = v->B((base * PACK_WIDTH) + 6);                 \
+                 r[13] = s->B((base * PACK_WIDTH) + 6);                 \
+                 r[14] = v->B((base * PACK_WIDTH) + 7);                 \
+                 r[15] = s->B((base * PACK_WIDTH) + 7);                 \
                                                                       ) \
-        MOVE(*d, r);                                                    \
+        for (i = 0; i < PACK_WIDTH * 2; i++) {                          \
+            d->B(i) = r[i];                                             \
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
+        int i;                                                          \
                                                                         \
-        r.W(0) = d->W((base << (SHIFT + 1)) + 0);                       \
-        r.W(1) = s->W((base << (SHIFT + 1)) + 0);                       \
-        r.W(2) = d->W((base << (SHIFT + 1)) + 1);                       \
-        r.W(3) = s->W((base << (SHIFT + 1)) + 1);                       \
+        r[0] = v->W((base * (PACK_WIDTH / 2)) + 0);                     \
+        r[1] = s->W((base * (PACK_WIDTH / 2)) + 0);                     \
+        r[2] = v->W((base * (PACK_WIDTH / 2)) + 1);                     \
+        r[3] = s->W((base * (PACK_WIDTH / 2)) + 1);                     \
         XMM_ONLY(                                                       \
-                 r.W(4) = d->W((base << (SHIFT + 1)) + 2);              \
-                 r.W(5) = s->W((base << (SHIFT + 1)) + 2);              \
-                 r.W(6) = d->W((base << (SHIFT + 1)) + 3);              \
-                 r.W(7) = s->W((base << (SHIFT + 1)) + 3);              \
+                 r[4] = v->W((base * 4) + 2);                           \
+                 r[5] = s->W((base * 4) + 2);                           \
+                 r[6] = v->W((base * 4) + 3);                           \
+                 r[7] = s->W((base * 4) + 3);                           \
                                                                       ) \
-            MOVE(*d, r);                                                \
+        for (i = 0; i < PACK_WIDTH; i++) {                              \
+            d->W(i) = r[i];                                             \
+        }                                                               \
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## dq, SUFFIX)(CPUX86State *env,\
-                                                        Reg *d, Reg *s) \
+                                                Reg *d, Reg *s) \
     {                                                                   \
-        Reg r;                                                          \
+        Reg *v = d;                                                     \
+        uint32_t r[4];                                                  \
                                                                         \
-        r.L(0) = d->L((base << SHIFT) + 0);                             \
-        r.L(1) = s->L((base << SHIFT) + 0);                             \
+        r[0] = v->L((base * (PACK_WIDTH / 4)) + 0);                     \
+        r[1] = s->L((base * (PACK_WIDTH / 4)) + 0);                     \
         XMM_ONLY(                                                       \
-                 r.L(2) = d->L((base << SHIFT) + 1);                    \
-                 r.L(3) = s->L((base << SHIFT) + 1);                    \
+                 r[2] = v->L((base * 2) + 1);                           \
+                 r[3] = s->L((base * 2) + 1);                           \
+                 d->L(2) = r[2];                                        \
+                 d->L(3) = r[3];                                        \
                                                                       ) \
-            MOVE(*d, r);                                                \
+        d->L(0) = r[0];                                                 \
+        d->L(1) = r[1];                                                 \
     }                                                                   \
                                                                                Reg *s) \
+             void glue(helper_punpck ## base_name ## qdq, SUFFIX)(      \
+                        CPUX86State *env, Reg *d, Reg *s)       \
              {                                                          \
-                 Reg r;                                                 \
+                 Reg *v = d;                                            \
+                 uint64_t r[2];                                         \
                                                                         \
-                 r.Q(0) = d->Q(base);                                   \
-                 r.Q(1) = s->Q(base);                                   \
-                 MOVE(*d, r);                                           \
+                 r[0] = v->Q(base);                                     \
+                 r[1] = s->Q(base);                                     \
+                 d->Q(0) = r[0];                                        \
+                 d->Q(1) = r[1];                                        \
              }                                                          \
                                                                         )
 
 UNPCK_OP(l, 0)
 UNPCK_OP(h, 1)
 
+#undef PACK_WIDTH
+#undef PACK_HELPER_B
+#undef PACK4
+
+
 /* 3DNow! float ops */
 #if SHIFT == 0
 void helper_pi2fd(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1394,122 +1392,113 @@ void helper_pswapd(CPUX86State *env, MMXReg *d, MMXReg *s)
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
+#if SHIFT == 0
 
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
+{                               \
+    Reg *v = d;                 \
+    uint16_t r[4];              \
+    r[0] = F(v->W(0), v->W(1)); \
+    r[1] = F(v->W(2), v->W(3)); \
+    r[2] = F(s->W(0), s->W(1)); \
+    r[3] = F(s->W(3), s->W(3)); \
+    d->W(0) = r[0];             \
+    d->W(1) = r[1];             \
+    d->W(2) = r[2];             \
+    d->W(3) = r[3];             \
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
+{                               \
+    Reg *v = d;                 \
+    uint32_t r0, r1;            \
+    r0 = F(v->L(0), v->L(1));   \
+    r1 = F(s->L(0), s->L(1));   \
+    d->W(0) = r0;               \
+    d->W(1) = r1;               \
 }
 
-void glue(helper_phsubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
+#else
 
-    r.W(0) = satsw((int16_t)d->W(0) - (int16_t)d->W(1));
-    r.W(1) = satsw((int16_t)d->W(2) - (int16_t)d->W(3));
-    XMM_ONLY(r.W(2) = satsw((int16_t)d->W(4) - (int16_t)d->W(5)));
-    XMM_ONLY(r.W(3) = satsw((int16_t)d->W(6) - (int16_t)d->W(7)));
-    r.W((2 << SHIFT) + 0) = satsw((int16_t)s->W(0) - (int16_t)s->W(1));
-    r.W((2 << SHIFT) + 1) = satsw((int16_t)s->W(2) - (int16_t)s->W(3));
-    XMM_ONLY(r.W(6) = satsw((int16_t)s->W(4) - (int16_t)s->W(5)));
-    XMM_ONLY(r.W(7) = satsw((int16_t)s->W(6) - (int16_t)s->W(7)));
-    MOVE(*d, r);
+#define SSE_HELPER_HW(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+{                                               \
+    Reg *v = d;                                 \
+    int16_t r[4 << SHIFT];                      \
+    int i, j;                                   \
+    for (i = j = 0; j < 8; i++, j += 2) {       \
+        r[i] = F(v->W(j), v->W(j + 1));         \
+    }                                           \
+    for (j = 0; j < 8; i++, j += 2) {           \
+        r[i] = F(s->W(j), s->W(j + 1));         \
+    }                                           \
+    for (i = 0; i < 4 << SHIFT; i++) {          \
+        d->W(i) = r[i];                         \
+    }                                           \
+}
+
+#define SSE_HELPER_HL(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+{                                               \
+    Reg *v = d;                                 \
+    int32_t r[2 << SHIFT];                      \
+    int i, j;                                   \
+    for (i = j = 0; j < 4; i++, j += 2) {       \
+        r[i] = F(v->L(j), v->L(j + 1));         \
+    }                                           \
+    for (j = 0; j < 4; i++, j += 2) {           \
+        r[i] = F(s->L(j), s->L(j + 1));         \
+    }                                           \
+    for (i = 0; i < 2 << SHIFT; i++) {          \
+        d->L(i) = r[i];                         \
+    }                                           \
+}
+#endif
+
+SSE_HELPER_HW(phaddw, FADD)
+SSE_HELPER_HW(phsubw, FSUB)
+SSE_HELPER_HW(phaddsw, FADDSW)
+SSE_HELPER_HW(phsubsw, FSUBSW)
+SSE_HELPER_HL(phaddd, FADD)
+SSE_HELPER_HL(phsubd, FSUB)
+
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
@@ -1532,32 +1521,38 @@ SSE_HELPER_L(helper_psignd, FSIGNL)
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
+	}
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
+	for (i = 0; i < (1 << SHIFT); i += 2) {
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
@@ -1682,17 +1677,23 @@ SSE_HELPER_Q(helper_pcmpeqq, FCMPEQQ)
 
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
@@ -1948,20 +1949,22 @@ void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
 void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t offset)
 {
+    Reg *v = d;
     int s0 = (offset & 3) << 2;
     int d0 = (offset & 4) << 0;
     int i;
-    Reg r;
+    uint16_t r[8];
 
     for (i = 0; i < 8; i++, d0++) {
-        r.W(i) = 0;
-        r.W(i) += abs1(d->B(d0 + 0) - s->B(s0 + 0));
-        r.W(i) += abs1(d->B(d0 + 1) - s->B(s0 + 1));
-        r.W(i) += abs1(d->B(d0 + 2) - s->B(s0 + 2));
-        r.W(i) += abs1(d->B(d0 + 3) - s->B(s0 + 3));
+        r[i] = 0;
+        r[i] += abs1(v->B(d0 + 0) - s->B(s0 + 0));
+        r[i] += abs1(v->B(d0 + 1) - s->B(s0 + 1));
+        r[i] += abs1(v->B(d0 + 2) - s->B(s0 + 2));
+        r[i] += abs1(v->B(d0 + 3) - s->B(s0 + 3));
+    }
+    for (i = 0; i < 8; i++) {
+        d->W(i) = r[i];
     }
-
-    MOVE(*d, r);
 }
 
 /* SSE4.2 op helpers */
-- 
2.37.1



