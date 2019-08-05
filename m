Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613A282494
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 20:04:59 +0200 (CEST)
Received: from localhost ([::1]:56368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huhLu-0001qh-L2
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 14:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51337)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1huhKe-0001KU-6j
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 14:03:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1huhKc-0008HC-9e
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 14:03:40 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33063)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1huhKa-0008Ge-Cl
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 14:03:37 -0400
Received: by mail-wm1-x342.google.com with SMTP id h19so7193285wme.0
 for <qemu-devel@nongnu.org>; Mon, 05 Aug 2019 11:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1slUGVTRC6RA0vil6xneVXHT+hWs0FhLhmq2qSsOEZ0=;
 b=iq55lWjGMXgL1IEQDcoVyCHwHi3F70vzTn+goFuc777p7j8a8wdWpfiAQ889jZQMhE
 uyCUTaylcXxHEh2Whp5mmxzkN6ixEyVRPWOoppXoNfUsVJ/X9lqXoeFHMBPFgjuO8giR
 +T+PUX/nvBZX+V+yFHiNgVQf002M5jbGNiaPWpFtOcPS2rm73pPWzLpMfuyMzHjzgesM
 hcdTgJM7vONnFOEg9EY3pBV5CGwzFkBVbfznKtF+jKJs6l4n09ZW3GQqjFNOJLmUv6sY
 rlIPK41BebxRHeh1khOTgdyZO2Egesb75bGisszHgSvJcZHvHVBZZPcuJIVxnZ7RoLUQ
 YBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1slUGVTRC6RA0vil6xneVXHT+hWs0FhLhmq2qSsOEZ0=;
 b=HBdICwIo48y2IG+OXdCB/3vhD+6p2LrOszla9Gq72PfjWfjtl3m8KLf0JHB1QKGjZl
 MtOwkhyEfNsqNwjkkc+D2UTIQ28D260qY3KqEdSlneFRFvGsCVuW7hbwDkEUEyOE5nIP
 Zi1PxbRt3GZFtLGgMQ+OQ5jnR4O6fMMc6Mf5rt/6m7stO1aTAcJj7o4LpITH6b2af/Ze
 xidt5pjcdc/Eu6UKRFCnYDx5d8ePnqMM+my9bXpU8qnHEg9mXecQd7aGF50GqG/klNTX
 qyuE5p8kJ2uWT4HdwCDQykbNZ5h4zb5KtH/ZHpxMUz98FKBh5w/jq2qBfXl+jHdV58sX
 5E4A==
X-Gm-Message-State: APjAAAXP/0NzXSZp91DpicsuF5x3Ifwu2IEwvfuZQx1Kn/IhBeMKZ8N9
 I6/HWVYHfYWc+gVqc7g1IcHEM+xrWsfXEw==
X-Google-Smtp-Source: APXvYqzbDBkW4rnaiIV+0YnBJZc3D5hcx/LKvP48QkNF7g7iJjhr8iTEhlyDfIFLs+LmB2rvruq2Mw==
X-Received: by 2002:a1c:7e14:: with SMTP id z20mr19155909wmc.83.1565028214887; 
 Mon, 05 Aug 2019 11:03:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p7sm58897670wrs.6.2019.08.05.11.03.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 11:03:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 19:03:32 +0100
Message-Id: <20190805180332.10185-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH] target/i386: Return 'indefinite integer value'
 for invalid SSE fp->int conversions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The x86 architecture requires that all conversions from floating
point to integer which raise the 'invalid' exception (infinities of
both signs, NaN, and all values which don't fit in the destination
integer) return what the x86 spec calls the "indefinite integer
value", which is 0x8000_0000 for 32-bits or 0x8000_0000_0000_0000 for
64-bits.  The softfloat functions return the more usual behaviour of
positive overflows returning the maximum value that fits in the
destination integer format and negative overflows returning the
minimum value that fits.

Wrap the softfloat functions in x86-specific versions which
detect the 'invalid' condition and return the indefinite integer.

Note that we don't use these wrappers for the 3DNow! pf2id and pf2iw
instructions, which do return the minimum value that fits in
an int32 if the input float is a large negative number.

Fixes: https://bugs.launchpad.net/qemu/+bug/1815423
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I've tested that this fixes the LP:1815423 test case. If anybody
has an x86 VM image to hand that has node.js installed it would
also be useful to test the operations in
https://bugs.launchpad.net/qemu/+bug/1832281
(I don't have such a VM.)

The other approach here would be to make the softfloat functions be
flexible enough to allow this behaviour -- from my reading of IEEE754
I think the exact returned result for 'invalid' inputs for float to
int conversions is not specified.

 target/i386/ops_sse.h | 88 +++++++++++++++++++++++++++++--------------
 1 file changed, 60 insertions(+), 28 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index ed05989768f..ec1ec745d09 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -710,102 +710,134 @@ void helper_cvtsq2sd(CPUX86State *env, ZMMReg *d, uint64_t val)
 #endif
 
 /* float to integer */
+
+/*
+ * x86 mandates that we return the indefinite integer value for the result
+ * of any float-to-integer conversion that raises the 'invalid' exception.
+ * Wrap the softfloat functions to get this behaviour.
+ */
+#define WRAP_FLOATCONV(RETTYPE, FN, FLOATTYPE, INDEFVALUE)              \
+    static inline RETTYPE x86_##FN(FLOATTYPE a, float_status *s)        \
+    {                                                                   \
+        int oldflags, newflags;                                         \
+        RETTYPE r;                                                      \
+                                                                        \
+        oldflags = get_float_exception_flags(s);                        \
+        set_float_exception_flags(0, s);                                \
+        r = FN(a, s);                                                   \
+        newflags = get_float_exception_flags(s);                        \
+        if (newflags & float_flag_invalid) {                            \
+            r = INDEFVALUE;                                             \
+        }                                                               \
+        set_float_exception_flags(newflags | oldflags, s);              \
+        return r;                                                       \
+    }
+
+WRAP_FLOATCONV(int32_t, float32_to_int32, float32, INT32_MIN)
+WRAP_FLOATCONV(int32_t, float32_to_int32_round_to_zero, float32, INT32_MIN)
+WRAP_FLOATCONV(int32_t, float64_to_int32, float64, INT32_MIN)
+WRAP_FLOATCONV(int32_t, float64_to_int32_round_to_zero, float64, INT32_MIN)
+WRAP_FLOATCONV(int64_t, float32_to_int64, float32, INT64_MIN)
+WRAP_FLOATCONV(int64_t, float32_to_int64_round_to_zero, float32, INT64_MIN)
+WRAP_FLOATCONV(int64_t, float64_to_int64, float64, INT64_MIN)
+WRAP_FLOATCONV(int64_t, float64_to_int64_round_to_zero, float64, INT64_MIN)
+
 void helper_cvtps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_L(0) = float32_to_int32(s->ZMM_S(0), &env->sse_status);
-    d->ZMM_L(1) = float32_to_int32(s->ZMM_S(1), &env->sse_status);
-    d->ZMM_L(2) = float32_to_int32(s->ZMM_S(2), &env->sse_status);
-    d->ZMM_L(3) = float32_to_int32(s->ZMM_S(3), &env->sse_status);
+    d->ZMM_L(0) = x86_float32_to_int32(s->ZMM_S(0), &env->sse_status);
+    d->ZMM_L(1) = x86_float32_to_int32(s->ZMM_S(1), &env->sse_status);
+    d->ZMM_L(2) = x86_float32_to_int32(s->ZMM_S(2), &env->sse_status);
+    d->ZMM_L(3) = x86_float32_to_int32(s->ZMM_S(3), &env->sse_status);
 }
 
 void helper_cvtpd2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_L(0) = float64_to_int32(s->ZMM_D(0), &env->sse_status);
-    d->ZMM_L(1) = float64_to_int32(s->ZMM_D(1), &env->sse_status);
+    d->ZMM_L(0) = x86_float64_to_int32(s->ZMM_D(0), &env->sse_status);
+    d->ZMM_L(1) = x86_float64_to_int32(s->ZMM_D(1), &env->sse_status);
     d->ZMM_Q(1) = 0;
 }
 
 void helper_cvtps2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
-    d->MMX_L(0) = float32_to_int32(s->ZMM_S(0), &env->sse_status);
-    d->MMX_L(1) = float32_to_int32(s->ZMM_S(1), &env->sse_status);
+    d->MMX_L(0) = x86_float32_to_int32(s->ZMM_S(0), &env->sse_status);
+    d->MMX_L(1) = x86_float32_to_int32(s->ZMM_S(1), &env->sse_status);
 }
 
 void helper_cvtpd2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
-    d->MMX_L(0) = float64_to_int32(s->ZMM_D(0), &env->sse_status);
-    d->MMX_L(1) = float64_to_int32(s->ZMM_D(1), &env->sse_status);
+    d->MMX_L(0) = x86_float64_to_int32(s->ZMM_D(0), &env->sse_status);
+    d->MMX_L(1) = x86_float64_to_int32(s->ZMM_D(1), &env->sse_status);
 }
 
 int32_t helper_cvtss2si(CPUX86State *env, ZMMReg *s)
 {
-    return float32_to_int32(s->ZMM_S(0), &env->sse_status);
+    return x86_float32_to_int32(s->ZMM_S(0), &env->sse_status);
 }
 
 int32_t helper_cvtsd2si(CPUX86State *env, ZMMReg *s)
 {
-    return float64_to_int32(s->ZMM_D(0), &env->sse_status);
+    return x86_float64_to_int32(s->ZMM_D(0), &env->sse_status);
 }
 
 #ifdef TARGET_X86_64
 int64_t helper_cvtss2sq(CPUX86State *env, ZMMReg *s)
 {
-    return float32_to_int64(s->ZMM_S(0), &env->sse_status);
+    return x86_float32_to_int64(s->ZMM_S(0), &env->sse_status);
 }
 
 int64_t helper_cvtsd2sq(CPUX86State *env, ZMMReg *s)
 {
-    return float64_to_int64(s->ZMM_D(0), &env->sse_status);
+    return x86_float64_to_int64(s->ZMM_D(0), &env->sse_status);
 }
 #endif
 
 /* float to integer truncated */
 void helper_cvttps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_L(0) = float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
-    d->ZMM_L(1) = float32_to_int32_round_to_zero(s->ZMM_S(1), &env->sse_status);
-    d->ZMM_L(2) = float32_to_int32_round_to_zero(s->ZMM_S(2), &env->sse_status);
-    d->ZMM_L(3) = float32_to_int32_round_to_zero(s->ZMM_S(3), &env->sse_status);
+    d->ZMM_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
+    d->ZMM_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1), &env->sse_status);
+    d->ZMM_L(2) = x86_float32_to_int32_round_to_zero(s->ZMM_S(2), &env->sse_status);
+    d->ZMM_L(3) = x86_float32_to_int32_round_to_zero(s->ZMM_S(3), &env->sse_status);
 }
 
 void helper_cvttpd2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_L(0) = float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
-    d->ZMM_L(1) = float64_to_int32_round_to_zero(s->ZMM_D(1), &env->sse_status);
+    d->ZMM_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
+    d->ZMM_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1), &env->sse_status);
     d->ZMM_Q(1) = 0;
 }
 
 void helper_cvttps2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
-    d->MMX_L(0) = float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
-    d->MMX_L(1) = float32_to_int32_round_to_zero(s->ZMM_S(1), &env->sse_status);
+    d->MMX_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
+    d->MMX_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1), &env->sse_status);
 }
 
 void helper_cvttpd2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
-    d->MMX_L(0) = float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
-    d->MMX_L(1) = float64_to_int32_round_to_zero(s->ZMM_D(1), &env->sse_status);
+    d->MMX_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
+    d->MMX_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1), &env->sse_status);
 }
 
 int32_t helper_cvttss2si(CPUX86State *env, ZMMReg *s)
 {
-    return float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
+    return x86_float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
 }
 
 int32_t helper_cvttsd2si(CPUX86State *env, ZMMReg *s)
 {
-    return float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
+    return x86_float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
 }
 
 #ifdef TARGET_X86_64
 int64_t helper_cvttss2sq(CPUX86State *env, ZMMReg *s)
 {
-    return float32_to_int64_round_to_zero(s->ZMM_S(0), &env->sse_status);
+    return x86_float32_to_int64_round_to_zero(s->ZMM_S(0), &env->sse_status);
 }
 
 int64_t helper_cvttsd2sq(CPUX86State *env, ZMMReg *s)
 {
-    return float64_to_int64_round_to_zero(s->ZMM_D(0), &env->sse_status);
+    return x86_float64_to_int64_round_to_zero(s->ZMM_D(0), &env->sse_status);
 }
 #endif
 
-- 
2.20.1


