Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5E4606314
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:32:12 +0200 (CEST)
Received: from localhost ([::1]:55772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWae-0008Cp-Ts
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:32:09 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWYh-0001dU-Iv
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU8I-0005ZO-EX
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:56 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU8D-00013M-L5
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:41 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 p6-20020a17090a748600b002103d1ef63aso2826800pjk.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=otax3boOrkJbpvJnQWAvehNepZr14GD0jCowiyMr4Ww=;
 b=dUAlh0zH/sALh3ZSKEbMiA/K6zl0GsrG2c/Caf2F8TLc53NqueTiNdjsOVtDV2gThm
 FpM1F9OakAqURjO3ZygHKxR6TfwEeuXbOTfC2IaKweJU3Rto+iBjObDerAY9uAWd+Clg
 REoDBe0+Y70j8AMJB/ftu0t7QNim89MQIQ+zm0pw8T1HD06GvKaiZoKPkEbU5fP2TZY/
 dxfrLP3pA2qj5TdXp5As3np1WQyC3N0KSpoyvlOkUiX0/qpJQvm/x8JmoE6gOBuM6QLR
 ReSfqx24H2LENu6yAcPmKobzmi6S4T0HUAHd2oAwVUcbfGrfhZOBqB83J3Wwt4P5UMR0
 txxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otax3boOrkJbpvJnQWAvehNepZr14GD0jCowiyMr4Ww=;
 b=Fyhav2iUU7rVO3VX1ZIl/GjvDisDy6agQX6JAY5YPtxuRs9Al5C7KpbZ40HTtwXeUJ
 WdIBd8ghg8Fh66nYwvycEg9K49P1OecAjHSD0A3vPwGB1PS2+7ccp7gKhAwCqYos+WBC
 LFB16nd/mkfXkHhgGr49FgTzmkY6uS6UhicMtfbkp2o8QN2L4xRds0B8KYKBOpNGeGcN
 RwG9iDY1xcqE2zETNC1Kxcv2gMz4ghpetOCTC3JEXnpm2nK2iZop6Wjm7m0Ji2nvx71/
 jGk/nah0FojK3rbK6v8KiEfwlTepGObJfOrubx/6R8dP2J4N27fY94Eu4S4dhYYh8V0m
 c+0g==
X-Gm-Message-State: ACrzQf0vmPiWJAwEbjeHGBk3BWkJ91gPRtC3m60wPIoFkaVpQT2l8QN2
 olGztqr4+VrjX/0kQMCMuhZ+klRz/t8by3rK
X-Google-Smtp-Source: AMsMyM4t9Us6oBGIq77eJqXkQ1H/x1z78EEp/1xviqQwRO4q1U/afOxuSePay4FJHktOKY32DoG6yg==
X-Received: by 2002:a17:90b:4b0c:b0:20d:233f:5dea with SMTP id
 lx12-20020a17090b4b0c00b0020d233f5deamr15459826pjb.241.1666266875114; 
 Thu, 20 Oct 2022 04:54:35 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/31] include/qemu/int128: Use Int128 structure for TCI
Date: Thu, 20 Oct 2022 21:52:39 +1000
Message-Id: <20221020115242.2301066-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We are about to allow passing Int128 to/from tcg helper functions,
but libffi doesn't support __int128_t, so use the structure.

In order for atomic128.h to continue working, we must provide
a mechanism to frob between real __int128_t and the structure.
Provide a new union, Int128Alias, for this.  We cannot modify
Int128 itself, as any changed alignment would also break libffi.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/atomic128.h | 34 ++++++++++++++++++++++++--------
 include/qemu/int128.h    | 18 ++++++++++++++---
 util/int128.c            | 42 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+), 11 deletions(-)

diff --git a/include/qemu/atomic128.h b/include/qemu/atomic128.h
index d179c05ede..5ba53f2f10 100644
--- a/include/qemu/atomic128.h
+++ b/include/qemu/atomic128.h
@@ -44,13 +44,23 @@
 #if defined(CONFIG_ATOMIC128)
 static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
 {
-    return qatomic_cmpxchg__nocheck(ptr, cmp, new);
+    Int128Alias r, c, n;
+
+    c.s = cmp;
+    n.s = new;
+    r.i = qatomic_cmpxchg__nocheck((__int128_t *)ptr, c.i, n.i);
+    return r.s;
 }
 # define HAVE_CMPXCHG128 1
 #elif defined(CONFIG_CMPXCHG128)
 static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
 {
-    return __sync_val_compare_and_swap_16(ptr, cmp, new);
+    Int128Alias r, c, n;
+
+    c.s = cmp;
+    n.s = new;
+    r.i = __sync_val_compare_and_swap_16((__int128_t *)ptr, c.i, n.i);
+    return r.s;
 }
 # define HAVE_CMPXCHG128 1
 #elif defined(__aarch64__)
@@ -89,12 +99,18 @@ Int128 QEMU_ERROR("unsupported atomic")
 #if defined(CONFIG_ATOMIC128)
 static inline Int128 atomic16_read(Int128 *ptr)
 {
-    return qatomic_read__nocheck(ptr);
+    Int128Alias r;
+
+    r.i = qatomic_read__nocheck((__int128_t *)ptr);
+    return r.s;
 }
 
 static inline void atomic16_set(Int128 *ptr, Int128 val)
 {
-    qatomic_set__nocheck(ptr, val);
+    Int128Alias v;
+
+    v.s = val;
+    qatomic_set__nocheck((__int128_t *)ptr, v.i);
 }
 
 # define HAVE_ATOMIC128 1
@@ -153,7 +169,8 @@ static inline Int128 atomic16_read(Int128 *ptr)
     if (have_atomic128) {
         asm("vmovdqa %1, %0" : "=x" (ret) : "m" (*ptr));
     } else {
-        ret = atomic16_cmpxchg(ptr, 0, 0);
+        Int128 z = int128_make64(0);
+        ret = atomic16_cmpxchg(ptr, z, z);
     }
     return ret;
 }
@@ -167,7 +184,7 @@ static inline void atomic16_set(Int128 *ptr, Int128 val)
         do {
             cmp = old;
             old = atomic16_cmpxchg(ptr, cmp, val);
-        } while (old != cmp);
+        } while (int128_ne(old, cmp));
     }
 }
 
@@ -176,7 +193,8 @@ static inline void atomic16_set(Int128 *ptr, Int128 val)
 static inline Int128 atomic16_read(Int128 *ptr)
 {
     /* Maybe replace 0 with 0, returning the old value.  */
-    return atomic16_cmpxchg(ptr, 0, 0);
+    Int128 z = int128_make64(0);
+    return atomic16_cmpxchg(ptr, z, z);
 }
 
 static inline void atomic16_set(Int128 *ptr, Int128 val)
@@ -185,7 +203,7 @@ static inline void atomic16_set(Int128 *ptr, Int128 val)
     do {
         cmp = old;
         old = atomic16_cmpxchg(ptr, cmp, val);
-    } while (old != cmp);
+    } while (int128_ne(old, cmp));
 }
 
 # define HAVE_ATOMIC128 1
diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index d2b76ca6ac..a062284025 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -3,7 +3,12 @@
 
 #include "qemu/bswap.h"
 
-#ifdef CONFIG_INT128
+/*
+ * With TCI, we need to use libffi for interfacing with TCG helpers.
+ * But libffi does not support __int128_t, and therefore cannot pass
+ * or return values of this type, force use of the Int128 struct.
+ */
+#if defined(CONFIG_INT128) && !defined(CONFIG_TCG_INTERPRETER)
 typedef __int128_t Int128;
 
 static inline Int128 int128_make64(uint64_t a)
@@ -460,8 +465,7 @@ Int128 int128_divu(Int128, Int128);
 Int128 int128_remu(Int128, Int128);
 Int128 int128_divs(Int128, Int128);
 Int128 int128_rems(Int128, Int128);
-
-#endif /* CONFIG_INT128 */
+#endif /* CONFIG_INT128 && !CONFIG_TCG_INTERPRETER */
 
 static inline void bswap128s(Int128 *s)
 {
@@ -472,4 +476,12 @@ static inline void bswap128s(Int128 *s)
 #define INT128_MAX int128_make128(UINT64_MAX, INT64_MAX)
 #define INT128_MIN int128_make128(0, INT64_MIN)
 
+#ifdef CONFIG_INT128
+typedef union {
+    Int128 s;
+    __int128_t i;
+    __uint128_t u;
+} Int128Alias;
+#endif /* CONFIG_INT128 */
+
 #endif /* INT128_H */
diff --git a/util/int128.c b/util/int128.c
index ed8f25fef1..df6c6331bd 100644
--- a/util/int128.c
+++ b/util/int128.c
@@ -144,4 +144,46 @@ Int128 int128_rems(Int128 a, Int128 b)
     return r;
 }
 
+#elif defined(CONFIG_TCG_INTERPRETER)
+
+Int128 int128_divu(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.u = a.u / b.u;
+    return r.s;
+}
+
+Int128 int128_remu(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.u = a.u % b.u;
+    return r.s;
+}
+
+Int128 int128_divs(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.i = a.i / b.i;
+    return r.s;
+}
+
+Int128 int128_rems(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.i = a.i % b.i;
+    return r.s;
+}
+
 #endif
-- 
2.34.1


