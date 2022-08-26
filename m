Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175815A3297
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:25:56 +0200 (CEST)
Received: from localhost ([::1]:47110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRii3-0000U7-5s
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVX-00074A-Mn
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiV6-0007qJ-DF
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SkcLlE3+NWnE1Ni60695EMJiMdZS1Zu17YnLw8OeY/U=;
 b=SUQi3jQiZgUfVAehLSsPje+9mMDh88CCgwh0rdgWI4oiKKV0ohIlJcGfg48KZ0xjug0bta
 KhNXym7ozyizU4KUctbg4Sq7hbIj51kMmJJQZ9GwlurXBFmqDiKqaDPEWwbYpffMm5Klj0
 aTOKuPaGlZqTwA8KArUzCEB59UKwZ7U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-508-tYWdAsjgPLWCEqDnzo3rhQ-1; Fri, 26 Aug 2022 19:12:30 -0400
X-MC-Unique: tYWdAsjgPLWCEqDnzo3rhQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h17-20020a05640250d100b00446d1825c9fso1848245edb.14
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=SkcLlE3+NWnE1Ni60695EMJiMdZS1Zu17YnLw8OeY/U=;
 b=wqeSvqwBc6SnOZ6jOo5KH61xhbY0k0sHybfaHDZyAslPsRYw0Imfv7UDmRRB7EhCxk
 3gXlEhQteY92UwKcFVlap4lfVX+9jzjpKQYAttd0/oe2PcOCaRl7U2xo1KnBJg6s5kWE
 hwfDho21Wf/QWynDcgdCQu/22I+kzpRxIva4bPTUtVcOlcdhQRpz+0PikUjWxZ7shH3O
 M/0QFHjMt9lgwTunleTFHpQSvPdjv9Ao7VtaKcIoDBH7LDUBPMB+NBjc185p8LpUHlLR
 uzszrSrwbRbrlWWu1k6FlSV4vTuRGF2srmsokd16qUJeTxsJwLFGUZzrsV/h8DiJpeJ4
 2Esw==
X-Gm-Message-State: ACgBeo2LYFmjih5lxg/7c0m8yCY4ZZ6/WKKrbe7OM5qbBeShN1WzHmKX
 bwgywyTtmOpzVF+WkkXaYl5RjgriX2/u/tyf+whqphQpBewIWuaj0tV6zQqxEDer0YdSqbPMPjy
 JN+cNVDnTi7KHGfoYZTmaUhZMTyJlQamtiNogrO8fZp1VukaR0Q2q+qMfhfqteNfArS4=
X-Received: by 2002:a17:906:4795:b0:73d:daa0:3cbf with SMTP id
 cw21-20020a170906479500b0073ddaa03cbfmr4954064ejc.693.1661555549014; 
 Fri, 26 Aug 2022 16:12:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6/9fNjS8uajm1RbKdFDZEfxUV6cEebWeYmS/OA6GMBhtCwPuUp0qSfgAa1wJtsZl0MfUFNZQ==
X-Received: by 2002:a17:906:4795:b0:73d:daa0:3cbf with SMTP id
 cw21-20020a170906479500b0073ddaa03cbfmr4954054ejc.693.1661555548708; 
 Fri, 26 Aug 2022 16:12:28 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 es5-20020a056402380500b0043bc4b28464sm1804833edb.34.2022.08.26.16.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 12/23] i386: Rewrite vector shift helper
Date: Sat, 27 Aug 2022 01:11:53 +0200
Message-Id: <20220826231204.201395-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826231204.201395-1-pbonzini@redhat.com>
References: <20220826231204.201395-1-pbonzini@redhat.com>
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

Rewrite the vector shift helpers in preperation for AVX support (3 operand
form and 256 bit vectors).

For now keep the existing two operand interface.

No functional changes to existing helpers.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-11-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 221 ++++++++++++++++++------------------------
 1 file changed, 96 insertions(+), 125 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index f603981ab8..8c745f5cab 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -56,195 +56,166 @@
 #define MOVE(d, r) memcpy(&(d).B(0), &(r).B(0), SIZE)
 #endif
 
-void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    int shift;
+#if SHIFT == 0
+#define FPSRL(x, c) ((x) >> shift)
+#define FPSRAW(x, c) ((int16_t)(x) >> shift)
+#define FPSRAL(x, c) ((int32_t)(x) >> shift)
+#define FPSLL(x, c) ((x) << shift)
+#endif
 
-    if (s->Q(0) > 15) {
-        d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
+void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+{
+    Reg *s = d;
+    int shift;
+    if (c->Q(0) > 15) {
+        for (int i = 0; i < 1 << SHIFT; i++) {
+            d->Q(i) = 0;
+        }
     } else {
-        shift = s->B(0);
-        d->W(0) >>= shift;
-        d->W(1) >>= shift;
-        d->W(2) >>= shift;
-        d->W(3) >>= shift;
-#if SHIFT == 1
-        d->W(4) >>= shift;
-        d->W(5) >>= shift;
-        d->W(6) >>= shift;
-        d->W(7) >>= shift;
-#endif
+        shift = c->B(0);
+        for (int i = 0; i < 4 << SHIFT; i++) {
+            d->W(i) = FPSRL(s->W(i), shift);
+        }
     }
 }
 
-void glue(helper_psraw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psllw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
     int shift;
+    if (c->Q(0) > 15) {
+        for (int i = 0; i < 1 << SHIFT; i++) {
+            d->Q(i) = 0;
+        }
+    } else {
+        shift = c->B(0);
+        for (int i = 0; i < 4 << SHIFT; i++) {
+            d->W(i) = FPSLL(s->W(i), shift);
+        }
+    }
+}
 
-    if (s->Q(0) > 15) {
+void glue(helper_psraw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+{
+    Reg *s = d;
+    int shift;
+    if (c->Q(0) > 15) {
         shift = 15;
     } else {
-        shift = s->B(0);
+        shift = c->B(0);
+    }
+    for (int i = 0; i < 4 << SHIFT; i++) {
+        d->W(i) = FPSRAW(s->W(i), shift);
     }
-    d->W(0) = (int16_t)d->W(0) >> shift;
-    d->W(1) = (int16_t)d->W(1) >> shift;
-    d->W(2) = (int16_t)d->W(2) >> shift;
-    d->W(3) = (int16_t)d->W(3) >> shift;
-#if SHIFT == 1
-    d->W(4) = (int16_t)d->W(4) >> shift;
-    d->W(5) = (int16_t)d->W(5) >> shift;
-    d->W(6) = (int16_t)d->W(6) >> shift;
-    d->W(7) = (int16_t)d->W(7) >> shift;
-#endif
 }
 
-void glue(helper_psllw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psrld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
     int shift;
-
-    if (s->Q(0) > 15) {
-        d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
+    if (c->Q(0) > 31) {
+        for (int i = 0; i < 1 << SHIFT; i++) {
+            d->Q(i) = 0;
+        }
     } else {
-        shift = s->B(0);
-        d->W(0) <<= shift;
-        d->W(1) <<= shift;
-        d->W(2) <<= shift;
-        d->W(3) <<= shift;
-#if SHIFT == 1
-        d->W(4) <<= shift;
-        d->W(5) <<= shift;
-        d->W(6) <<= shift;
-        d->W(7) <<= shift;
-#endif
+        shift = c->B(0);
+        for (int i = 0; i < 2 << SHIFT; i++) {
+            d->L(i) = FPSRL(s->L(i), shift);
+        }
     }
 }
 
-void glue(helper_psrld, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pslld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
     int shift;
-
-    if (s->Q(0) > 31) {
-        d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
+    if (c->Q(0) > 31) {
+        for (int i = 0; i < 1 << SHIFT; i++) {
+            d->Q(i) = 0;
+        }
     } else {
-        shift = s->B(0);
-        d->L(0) >>= shift;
-        d->L(1) >>= shift;
-#if SHIFT == 1
-        d->L(2) >>= shift;
-        d->L(3) >>= shift;
-#endif
+        shift = c->B(0);
+        for (int i = 0; i < 2 << SHIFT; i++) {
+            d->L(i) = FPSLL(s->L(i), shift);
+        }
     }
 }
 
-void glue(helper_psrad, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psrad, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
     int shift;
-
-    if (s->Q(0) > 31) {
+    if (c->Q(0) > 31) {
         shift = 31;
     } else {
-        shift = s->B(0);
+        shift = c->B(0);
+    }
+    for (int i = 0; i < 2 << SHIFT; i++) {
+        d->L(i) = FPSRAL(s->L(i), shift);
     }
-    d->L(0) = (int32_t)d->L(0) >> shift;
-    d->L(1) = (int32_t)d->L(1) >> shift;
-#if SHIFT == 1
-    d->L(2) = (int32_t)d->L(2) >> shift;
-    d->L(3) = (int32_t)d->L(3) >> shift;
-#endif
 }
 
-void glue(helper_pslld, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psrlq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
     int shift;
-
-    if (s->Q(0) > 31) {
-        d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
+    if (c->Q(0) > 63) {
+        for (int i = 0; i < 1 << SHIFT; i++) {
+            d->Q(i) = 0;
+        }
     } else {
-        shift = s->B(0);
-        d->L(0) <<= shift;
-        d->L(1) <<= shift;
-#if SHIFT == 1
-        d->L(2) <<= shift;
-        d->L(3) <<= shift;
-#endif
+        shift = c->B(0);
+        for (int i = 0; i < 1 << SHIFT; i++) {
+            d->Q(i) = FPSRL(s->Q(i), shift);
+        }
     }
 }
 
-void glue(helper_psrlq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psllq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
     int shift;
-
-    if (s->Q(0) > 63) {
-        d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
+    if (c->Q(0) > 63) {
+        for (int i = 0; i < 1 << SHIFT; i++) {
+            d->Q(i) = 0;
+        }
     } else {
-        shift = s->B(0);
-        d->Q(0) >>= shift;
-#if SHIFT == 1
-        d->Q(1) >>= shift;
-#endif
+        shift = c->B(0);
+        for (int i = 0; i < 1 << SHIFT; i++) {
+            d->Q(i) = FPSLL(s->Q(i), shift);
+        }
     }
 }
 
-void glue(helper_psllq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    int shift;
-
-    if (s->Q(0) > 63) {
-        d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
-    } else {
-        shift = s->B(0);
-        d->Q(0) <<= shift;
-#if SHIFT == 1
-        d->Q(1) <<= shift;
-#endif
-    }
-}
-
-#if SHIFT == 1
-void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+#if SHIFT >= 1
+void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
     int shift, i;
 
-    shift = s->L(0);
+    shift = c->L(0);
     if (shift > 16) {
         shift = 16;
     }
     for (i = 0; i < 16 - shift; i++) {
-        d->B(i) = d->B(i + shift);
+        d->B(i) = s->B(i + shift);
     }
     for (i = 16 - shift; i < 16; i++) {
         d->B(i) = 0;
     }
 }
 
-void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
     int shift, i;
 
-    shift = s->L(0);
+    shift = c->L(0);
     if (shift > 16) {
         shift = 16;
     }
     for (i = 15; i >= shift; i--) {
-        d->B(i) = d->B(i - shift);
+        d->B(i) = s->B(i - shift);
     }
     for (i = 0; i < shift; i++) {
         d->B(i) = 0;
-- 
2.37.1



