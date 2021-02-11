Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A1318B06
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:43:01 +0100 (CET)
Received: from localhost ([::1]:55578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABJE-0001sc-Np
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4v-0003D9-L7
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:13 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4t-0003vy-Mq
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:13 -0500
Received: by mail-wr1-x42c.google.com with SMTP id b3so4001503wrj.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7xh5Q0am567f2ghZbDcOvvaEWJ5DdA7QdC3uMKc3CA=;
 b=a/QARga0/9deLR9hpp8MGIWB76nqw+TCzU6xhQgWXR1wT8sFaPdB1JlW+jFAoeokpS
 ghrkw5gXqV9Jm5ijsrwhEXH20V1fOvrj07hE5ctH2Mtfwa88zJ+iZGFLCuXG6w0zmvmY
 njhodaG+gUzwPjS9Hd4g8WQnRHxOXo+qqfHaYw5TuPWPfMMcJebeB/eqAr3SJ7LnXQct
 42qWuSKw2yJmBz6IEdOiYPi7xSiubA8S5Z8eKvFY58GmjTqOWF0gna7epd1YyMmEA+Q5
 vOdJNqxrvEL2RlLt2lnwlltfR6T69EFwPPsLHs67zZ2DSkFsuoDfOZiS68BGfafHTlIL
 4aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7xh5Q0am567f2ghZbDcOvvaEWJ5DdA7QdC3uMKc3CA=;
 b=VJPrGK3GhQXGOANVduKpV5bn+4hL0ONQC/TBYMQQyD4kXhBZy+S2TusuoVFrsOsGV3
 azFGQ88MUG0v0+zXUC5CRweFy/eMe/13ZfvdDIKBGdii+FPnmrPoZaea1efA3latIYPk
 fHjfHu++jm1q4pGjqvgkmcxVuHd/UnGJSLofTprmvj9u9l8cWUSqhr1IqhPCGfYqhQ9f
 k6mj3J8QlR66WY+X9fOjKr8csE7VgLJU45PqNTVgiEcYoZzlj2J3eT4v/Ufc5JBEdKCM
 8+e8mZz4yWij+YD8RlQ+AdHGW4vU7KAmzS3t1SEQxD2jz6N8umFJcTAl0NJUEceV4JBO
 uS2g==
X-Gm-Message-State: AOAM530JERkK1URz4Qph/iGpwxhNiYWTCFPVnbw/PqHZ/hL3DGz9B/5D
 UvjlJ291YfN7cS6DjFWx2lNlrA==
X-Google-Smtp-Source: ABdhPJw0118JtTHGt1xMUij3vH8aofgpT/5w3MjgGSckX3HfN0cXlX0yuuznSbArboOmQFfCVWPbcw==
X-Received: by 2002:adf:de11:: with SMTP id b17mr569382wrm.225.1613046490227; 
 Thu, 11 Feb 2021 04:28:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a21sm10096952wmb.5.2021.02.11.04.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:28:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 650971FF9D;
 Thu, 11 Feb 2021 12:27:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 14/15] bswap.h: Remove unused float-access functions
Date: Thu, 11 Feb 2021 12:27:49 +0000
Message-Id: <20210211122750.22645-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The float-access functions stfl_*, stfq*, ldfl* and ldfq* are now
unused; remove them.  (Accesses to float64 and float32 types can be
made with the ldl/stl/ldq/stq functions, as float64 and float32 are
guaranteed to be typedefs for normal integer types.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210208113428.7181-6-peter.maydell@linaro.org>
---
 docs/devel/loads-stores.rst | 14 ++++-----
 include/exec/cpu-all.h      |  8 -----
 include/qemu/bswap.h        | 60 -------------------------------------
 3 files changed, 5 insertions(+), 77 deletions(-)

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index ee43f5dfee..568274baec 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -24,16 +24,12 @@ potentially unaligned pointer values.
 
 Function names follow the pattern:
 
-load: ``ld{type}{sign}{size}_{endian}_p(ptr)``
+load: ``ld{sign}{size}_{endian}_p(ptr)``
 
-store: ``st{type}{size}_{endian}_p(ptr, val)``
-
-``type``
- - (empty) : integer access
- - ``f`` : float access
+store: ``st{size}_{endian}_p(ptr, val)``
 
 ``sign``
- - (empty) : for 32 or 64 bit sizes (including floats and doubles)
+ - (empty) : for 32 or 64 bit sizes
  - ``u`` : unsigned
  - ``s`` : signed
 
@@ -67,8 +63,8 @@ of size ``sz`` bytes.
 
 
 Regexes for git grep
- - ``\<ldf\?[us]\?[bwlq]\(_[hbl]e\)\?_p\>``
- - ``\<stf\?[bwlq]\(_[hbl]e\)\?_p\>``
+ - ``\<ld[us]\?[bwlq]\(_[hbl]e\)\?_p\>``
+ - ``\<st[bwlq]\(_[hbl]e\)\?_p\>``
  - ``\<ldn_\([hbl]e\)?_p\>``
  - ``\<stn_\([hbl]e\)?_p\>``
 
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index cfb1d79331..babf0a8959 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -125,13 +125,9 @@ static inline void tswap64s(uint64_t *s)
 #define ldsw_p(p) ldsw_be_p(p)
 #define ldl_p(p) ldl_be_p(p)
 #define ldq_p(p) ldq_be_p(p)
-#define ldfl_p(p) ldfl_be_p(p)
-#define ldfq_p(p) ldfq_be_p(p)
 #define stw_p(p, v) stw_be_p(p, v)
 #define stl_p(p, v) stl_be_p(p, v)
 #define stq_p(p, v) stq_be_p(p, v)
-#define stfl_p(p, v) stfl_be_p(p, v)
-#define stfq_p(p, v) stfq_be_p(p, v)
 #define ldn_p(p, sz) ldn_be_p(p, sz)
 #define stn_p(p, sz, v) stn_be_p(p, sz, v)
 #else
@@ -139,13 +135,9 @@ static inline void tswap64s(uint64_t *s)
 #define ldsw_p(p) ldsw_le_p(p)
 #define ldl_p(p) ldl_le_p(p)
 #define ldq_p(p) ldq_le_p(p)
-#define ldfl_p(p) ldfl_le_p(p)
-#define ldfq_p(p) ldfq_le_p(p)
 #define stw_p(p, v) stw_le_p(p, v)
 #define stl_p(p, v) stl_le_p(p, v)
 #define stq_p(p, v) stq_le_p(p, v)
-#define stfl_p(p, v) stfl_le_p(p, v)
-#define stfq_p(p, v) stfq_le_p(p, v)
 #define ldn_p(p, sz) ldn_le_p(p, sz)
 #define stn_p(p, sz, v) stn_le_p(p, sz, v)
 #endif
diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 8b01c38040..4aaf992b5d 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -400,36 +400,6 @@ static inline void stq_le_p(void *ptr, uint64_t v)
     stq_he_p(ptr, le_bswap(v, 64));
 }
 
-/* float access */
-
-static inline float32 ldfl_le_p(const void *ptr)
-{
-    CPU_FloatU u;
-    u.l = ldl_le_p(ptr);
-    return u.f;
-}
-
-static inline void stfl_le_p(void *ptr, float32 v)
-{
-    CPU_FloatU u;
-    u.f = v;
-    stl_le_p(ptr, u.l);
-}
-
-static inline float64 ldfq_le_p(const void *ptr)
-{
-    CPU_DoubleU u;
-    u.ll = ldq_le_p(ptr);
-    return u.d;
-}
-
-static inline void stfq_le_p(void *ptr, float64 v)
-{
-    CPU_DoubleU u;
-    u.d = v;
-    stq_le_p(ptr, u.ll);
-}
-
 static inline int lduw_be_p(const void *ptr)
 {
     return (uint16_t)be_bswap(lduw_he_p(ptr), 16);
@@ -465,36 +435,6 @@ static inline void stq_be_p(void *ptr, uint64_t v)
     stq_he_p(ptr, be_bswap(v, 64));
 }
 
-/* float access */
-
-static inline float32 ldfl_be_p(const void *ptr)
-{
-    CPU_FloatU u;
-    u.l = ldl_be_p(ptr);
-    return u.f;
-}
-
-static inline void stfl_be_p(void *ptr, float32 v)
-{
-    CPU_FloatU u;
-    u.f = v;
-    stl_be_p(ptr, u.l);
-}
-
-static inline float64 ldfq_be_p(const void *ptr)
-{
-    CPU_DoubleU u;
-    u.ll = ldq_be_p(ptr);
-    return u.d;
-}
-
-static inline void stfq_be_p(void *ptr, float64 v)
-{
-    CPU_DoubleU u;
-    u.d = v;
-    stq_be_p(ptr, u.ll);
-}
-
 static inline unsigned long leul_to_cpu(unsigned long v)
 {
 #if HOST_LONG_BITS == 32
-- 
2.20.1


