Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9261313D86
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:31:29 +0100 (CET)
Received: from localhost ([::1]:58834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BJo-0000yT-Sm
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94oi-0003ya-8t
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94oQ-0003vV-Ta
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:55 -0500
Received: by mail-wm1-x335.google.com with SMTP id m1so12901247wml.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B1h5etOiLMptd0QotFJfPFeVz8tBFIurLvpYgVaGA0I=;
 b=R0z69Li9EdbacZlvdfkGtXv6Mu0PJf6ko9KupVUs/cGNGkzpYnlBFJbnja+83/MN9M
 AJXl2exJBFPV3gvrZyUlSTx3smpuW9L7QesVd7+Hx9HPM34ry/RFG4d2kwTFOkO8lQi8
 YID6BFeP1DRi+c+YkPYB/NVg2aaHtdgBdtfnMWRDnoG0WRU66T1/eh/a4op7y2Bn1cVa
 paeTolwKDLxlxGvaYJgWba64UDVNfOi67qyiUkGpyJyGs4UflDkephQ8kzFqEsNECpMw
 qtZUUpboWg1rYqpLwGTMrs+kNvuEbKuGH694Wpen3b9Tu1O6KuKrgnWAfH5X9VJxUZrF
 OBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B1h5etOiLMptd0QotFJfPFeVz8tBFIurLvpYgVaGA0I=;
 b=kEVi6IfTkZM+G6mQkGLR/2sBMj8y0QdzKGqjZLtCEZs7U8xFHg+XiCoHiFzqpHqHIJ
 Jwt4QhESW0fivIhYx9i4V4NmriKzS3HdjPv2r9bhsNQlzz/Ef0pUTxH1DeY9l+Myf1MP
 esC0DYsISx777Upo2Xw3jA/QoWf2TmO8bOZ8e1qhREUWrVS0NFOzJ3pMMiKQbWj4zLW0
 2SiWxgiQRuFNmPHbednkiH4zy3jp98wOewv2YmcPCn/raqs/6uNhRM1GEsM4ugeRnI0o
 8hn81vOThEiXZyzP7VfOq/g/dHEtwL+NxlvhO2kqh0KsNvEf6yn5+om4P7/31Z2ofOA+
 ltVg==
X-Gm-Message-State: AOAM532oI1XyQ90bManmvuIacMD8uHzQL4HchqdAVro8Oe6thv5kamGH
 QNjSJ3LXcPnbjW7KfhGrEdZQ+lk9MHYCrw==
X-Google-Smtp-Source: ABdhPJwKDLIwHto3u4tWbEO1ZrjhFVdXTx+D8soytaQkyfK/y3m1Yzo3aWN3GbHo1GbM04eGVTSZgA==
X-Received: by 2002:a05:600c:2210:: with SMTP id
 z16mr5648130wml.50.1612784077476; 
 Mon, 08 Feb 2021 03:34:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a21sm16818134wmb.5.2021.02.08.03.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 03:34:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] bswap.h: Remove unused float-access functions
Date: Mon,  8 Feb 2021 11:34:28 +0000
Message-Id: <20210208113428.7181-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208113428.7181-1-peter.maydell@linaro.org>
References: <20210208113428.7181-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The float-access functions stfl_*, stfq*, ldfl* and ldfq* are now
unused; remove them.  (Accesses to float64 and float32 types can be
made with the ldl/stl/ldq/stq functions, as float64 and float32 are
guaranteed to be typedefs for normal integer types.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/loads-stores.rst | 14 ++++-----
 include/exec/cpu-all.h      |  8 -----
 include/qemu/bswap.h        | 60 -------------------------------------
 3 files changed, 5 insertions(+), 77 deletions(-)

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index ee43f5dfee2..568274baec0 100644
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
index cfb1d793311..babf0a8959f 100644
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
index 8b01c38040c..4aaf992b5d7 100644
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


