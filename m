Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174D60715F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:47:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmkN-0006Jg-8a
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:47:15 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmIC-0003cS-3K
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHz-0003P0-PW
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:58 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHt-0005uL-62
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:55 -0400
Received: by mail-pl1-x62d.google.com with SMTP id l4so1567477plb.8
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=otax3boOrkJbpvJnQWAvehNepZr14GD0jCowiyMr4Ww=;
 b=kmAPj91qi3D0giv3FOtbx2trwu39E0vY25Zvn7e19+MMcbdcixfQIF0T6gCI8Qs93K
 MBtW5P7CNBGKHdgpAlwNPK/AKxBl3GSwK5d22ApbgKvRDCG3Oi9xRUkIsX1ZemrkQq3L
 IWAvt7NL+KZCwq12QpZTNgWQ+YfTA/TVUwSblTxODjBig3DnVkLoKYoWTr3EvrzqMG5f
 ncaNn47rHziLmVbjIjJEYqAJ2ci0mfkh4Ir4uR0ViIy6zFO5GJXbo3Fnh9NeD73h8P/P
 sFw1wNFeJC/ixSEuhAY9EMCcfVHs3lffNUrCCw9/nnubY3syEtCAC+krDC4800MCyHXc
 RVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otax3boOrkJbpvJnQWAvehNepZr14GD0jCowiyMr4Ww=;
 b=Owx9ApC+kLAsTyHMlwff/GIdTCpF6IEWjDaiaRopYhTGdj7mkx13ZoVzqxNb8Y/Gcd
 t7WB0B5zJpOCptrSBGEIF1JiWttDDsjHuYiZSM3jwANCyUHDN2+moor3+TR9dvdH4BD9
 euExwP7/5hWtMDRv7US5mDKSy055whUcHgZgzIiRfvvLVH7rFnNLCbyRBq4yNGFEncJx
 qr4LQjXYYabEsWMFMoLxRTg7cz7fkrsYI+WQyz/D4kBdx11Y28ljcdT05LHLAx1G5QMS
 OKxOQRPohaOz/Itrj4pT1Gd6M8Rcbwwz8IQl+zYoCEcBtZCH34fjAl7wUQ9EHg4l5AER
 Fw1g==
X-Gm-Message-State: ACrzQf2kN7XAmjSymA3plSbhRmJhx5g/RNVQS6gYwbQ1t1R8cDAdcnLH
 smXmaSS5WuT4GXQuqwhLqxQ5Y6q/UdzVGtUa
X-Google-Smtp-Source: AMsMyM5zyYHG7gzzDm55KjVWmuxszL+cprADfH82lnVApHPo3rNa0dVaTufcvrZ+JBIHFXTufamqmg==
X-Received: by 2002:a17:903:1053:b0:185:37cb:da04 with SMTP id
 f19-20020a170903105300b0018537cbda04mr18269080plc.108.1666336666859; 
 Fri, 21 Oct 2022 00:17:46 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/36] include/qemu/int128: Use Int128 structure for TCI
Date: Fri, 21 Oct 2022 17:15:43 +1000
Message-Id: <20221021071549.2398137-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


