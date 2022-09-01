Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5B05A9241
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:42:11 +0200 (CEST)
Received: from localhost ([::1]:44558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfm6-0004dq-73
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTeww-0001SA-VO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTews-00039O-Po
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnbqrRyb+Pgqqj81ijJJCqtS+n3s+WDNawbq5Qm6zEY=;
 b=BUebbpsNYBdma9uciRCOuQtttm/KWDjcYtteMZNjhohQhfPXDD+fGPvclW9BJqYxqJQoCa
 j52r9FKWyamtWsrmGhEBI5G4B0NQGA9mztq9BEP0dRFY/vdjNp4jxniuSVwwra1gnenSns
 3H/Jod9TZCzNlQivU9aGKXJaCHoeasA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-SjCkVOZgPUCXjuTHzcxF7A-1; Thu, 01 Sep 2022 03:49:11 -0400
X-MC-Unique: SjCkVOZgPUCXjuTHzcxF7A-1
Received: by mail-wr1-f69.google.com with SMTP id
 j12-20020adfff8c000000b002265dcdfad7so2781067wrr.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RnbqrRyb+Pgqqj81ijJJCqtS+n3s+WDNawbq5Qm6zEY=;
 b=UTXj6/dwp7wxfRTkbJSiA5g6T3wgPlMvb9p+qML1eYcvKNrkIPZrjUpMA8jItCsYob
 n/9EoPN+LLTW2DdHT6jORactTD8J5zgUzuL2NCKq75X+dhySbmCk603Mq1YnSDJ1VcSL
 Oov7C1F6SBvAaxJtp2ye9jhIacUo5NZ6SkyV/BR9grdDgcHyy9W4SVDALN7C+unvdwnl
 7fJYftBCkGNuAFjEZNzkJuC4lS8yffSKl9kYOVhrAlcl8MmC5p6lJO9mMk00IJHw1XgI
 KHq0YSy1oZkxm1iTfVs+j9QptK7FjflsUG3gtnHGzFwJlCjzKQRGOM4FuU2K/I1xfQZp
 E9DQ==
X-Gm-Message-State: ACgBeo0zCw1aeJ7lOG0G5SsGsd9nwWJCcjn58ftnsyT/syg7QqzzyQLT
 zGumhPMKF21kRXXfpQxUslIANh5ZTg2lr9MqAnZP7Qxyxbl8VOf+a5sciWe6UhHL6KVGFOx1/Dw
 UD5o+fDM7uQt2dHNhj0z+59OOFjJ//rUnC477Kk7RVl5veHZ/e6ORQ6Mjf++cBS9q/4I=
X-Received: by 2002:a05:600c:40d5:b0:3a5:3d9f:6e7f with SMTP id
 m21-20020a05600c40d500b003a53d9f6e7fmr4204932wmh.21.1662018548913; 
 Thu, 01 Sep 2022 00:49:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Tt8ZjYP+7uE5NyfoOWiEKIXiUsbr/Dbg4k18hMeaY1sW0/IBB2pO0C2ydDU0W4gKtJOx5YA==
X-Received: by 2002:a05:600c:40d5:b0:3a5:3d9f:6e7f with SMTP id
 m21-20020a05600c40d500b003a53d9f6e7fmr4204917wmh.21.1662018548539; 
 Thu, 01 Sep 2022 00:49:08 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 k36-20020a05600c1ca400b003a5f3de6fddsm5272964wms.25.2022.09.01.00.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 12/23] i386: Rewrite vector shift helper
Date: Thu,  1 Sep 2022 09:48:31 +0200
Message-Id: <20220901074842.57424-13-pbonzini@redhat.com>
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

Rewrite the vector shift helpers in preperation for AVX support (3 operand
form and 256 bit vectors).

For now keep the existing two operand interface.

No functional changes to existing helpers.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-11-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 247 +++++++++++++++++++-----------------------
 1 file changed, 112 insertions(+), 135 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 2c0090a647..a4a09226e3 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -40,6 +40,8 @@
 #define SUFFIX _xmm
 #endif
 
+#define LANE_WIDTH (SHIFT ? 16 : 8)
+
 /*
  * Copy the relevant parts of a Reg value around. In the case where
  * sizeof(Reg) > SIZE, these helpers operate only on the lower bytes of
@@ -56,198 +58,173 @@
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
+#if SHIFT >= 1
+void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
-    int shift;
+    Reg *s = d;
+    int shift, i, j;
 
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
-{
-    int shift, i;
-
-    shift = s->L(0);
+    shift = c->L(0);
     if (shift > 16) {
         shift = 16;
     }
-    for (i = 0; i < 16 - shift; i++) {
-        d->B(i) = d->B(i + shift);
-    }
-    for (i = 16 - shift; i < 16; i++) {
-        d->B(i) = 0;
+    for (j = 0; j < 8 << SHIFT; j += LANE_WIDTH) {
+        for (i = 0; i < 16 - shift; i++) {
+            d->B(j + i) = s->B(j + i + shift);
+        }
+        for (i = 16 - shift; i < 16; i++) {
+            d->B(j + i) = 0;
+        }
     }
 }
 
-void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
-    int shift, i;
+    Reg *s = d;
+    int shift, i, j;
 
-    shift = s->L(0);
+    shift = c->L(0);
     if (shift > 16) {
         shift = 16;
     }
-    for (i = 15; i >= shift; i--) {
-        d->B(i) = d->B(i - shift);
-    }
-    for (i = 0; i < shift; i++) {
-        d->B(i) = 0;
+    for (j = 0; j < 8 << SHIFT; j += LANE_WIDTH) {
+        for (i = 15; i >= shift; i--) {
+            d->B(j + i) = s->B(j + i - shift);
+        }
+        for (i = 0; i < shift; i++) {
+            d->B(j + i) = 0;
+        }
     }
 }
 #endif
-- 
2.37.1



