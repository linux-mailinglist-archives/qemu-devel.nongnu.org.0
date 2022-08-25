Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCE15A1C56
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:28:55 +0200 (CEST)
Received: from localhost ([::1]:53248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLLL-0004WD-0E
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7N-0007dT-7S
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7L-0002ix-Av
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWhQktPYK0DG3LYM16bkIqGCaa61EV2OuC9oZ3uKQSs=;
 b=LzmFd3Fcl3Llhm+XU+/1w0nQSUiNqr2UpqfIdGbBTfIX1gX7COTviTFMYlZ3pJ0K050osW
 VPMzkm39vASp9PMGT0CFI0nMEMVHzGA6CoHB4x7R6c/PnEZmppRZyC5rXknVttLNKTynWA
 qnX5UeQ9Q11sH9tTVSJVQG5vJckoKFM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-LnfzC8xBPDiZwuuf14bV0w-1; Thu, 25 Aug 2022 18:14:25 -0400
X-MC-Unique: LnfzC8xBPDiZwuuf14bV0w-1
Received: by mail-wm1-f71.google.com with SMTP id
 v3-20020a1cac03000000b003a7012c430dso306545wme.3
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YWhQktPYK0DG3LYM16bkIqGCaa61EV2OuC9oZ3uKQSs=;
 b=EvG8LAdv1UUJIf4DgbQB9ArTmAyob1DGhKg8ucC/d8EDCKfCIu0uThlo6wWCoaiyIy
 X0WOQxD87hADXWxS/Te2WptgY6iooAxabnJBmHXuz5kOQC1poBb78f7/aBEL7xhbG9qd
 fMCZzqxc7zqM7n/u/Dmq9as+pIt3J8ic5wMjkmtV0L/IfBfz3Y6QU/wptzBOiVjdUMNN
 JVPVH1nAk+meb2Jgwiz4nVh0ulkrLxZqTyTBGqwPz4LroJXQzwVm4U3BYCQyWymLe/1K
 rWFLXz5eUC8CDcwxFYbKU4CQC4SeF+Es6ixtJ0KipdDHul1RmbR6+lRgAwSyhrigGaMJ
 F7lg==
X-Gm-Message-State: ACgBeo2gcMP2w1bqwVAaJ/mF+I36VWP7eI5Dch5moRr/YukyCNKNjOD+
 cKlYg7tuk88zMAb+c2+cBsbaeph7XOMlSnwMmSEMvyzr9LmG0+p009GzulKeofgIt4JnfWj4QvY
 L+iQV4CpL440yf9UZoUzHDHe55CnVzOZ10nuTXtjtFj7YOxhuia7iVCzEOQX/5OjcRQg=
X-Received: by 2002:a05:6000:156f:b0:225:57be:b1d6 with SMTP id
 15-20020a056000156f00b0022557beb1d6mr3260189wrz.423.1661465663774; 
 Thu, 25 Aug 2022 15:14:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5rBzg2r3eCNb6VPjY+uAj58fBTrpYmcOxQryQxwkNhwH4Z6+5PYGViet2fI2WvsALYLrigog==
X-Received: by 2002:a05:6000:156f:b0:225:57be:b1d6 with SMTP id
 15-20020a056000156f00b0022557beb1d6mr3260177wrz.423.1661465663464; 
 Thu, 25 Aug 2022 15:14:23 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 h3-20020adfe983000000b002254a7f4b9csm311680wrm.48.2022.08.25.15.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 06/18] i386: Rewrite vector shift helper
Date: Fri, 26 Aug 2022 00:13:59 +0200
Message-Id: <20220825221411.35122-7-pbonzini@redhat.com>
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

Rewrite the vector shift helpers in preperation for AVX support (3 operand
form and 256 bit vectors).

For now keep the existing two operand interface.

No functional changes to existing helpers.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-11-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 221 ++++++++++++++++++------------------------
 1 file changed, 96 insertions(+), 125 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index b12b271fcd..a1d3fbc482 100644
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
+	}
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
+	}
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
+	}
+    } else {
+        shift = c->B(0);
+        for (int i = 0; i < 4 << SHIFT; i++) {
+            d->W(i) = FPSLL(s->W(i), shift);
+	}
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
+	}
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
+	}
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
+	}
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
+	}
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



