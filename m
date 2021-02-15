Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928E231B6CA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:57:38 +0100 (CET)
Received: from localhost ([::1]:60072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBadN-0007no-Km
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaYN-0001wi-7c
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:52:28 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaYL-0008BG-16
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:52:26 -0500
Received: by mail-wm1-x32a.google.com with SMTP id x4so8722568wmi.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TvE0yWk1hg4q3LaA1yHQdcnBQxWHt+/trmjQtSus1JU=;
 b=M2I4KvNjDPZPXw0Zw8THleTtjiCnw9Se9jb8PE26TXQZCfIkb+STL9fBoX90mjGnxo
 jG9YcTVJzhHkj+1Q6H/v9FDg586YF6cy4vGinI4ApUDZRpPIbnMjU/dz6UZWLEEW2cVo
 7F8JnwoHItRVA/aDidYQPYPRwHknmrP2KtWoYGZI21xp6Pj0E1ABYQtzj1bPOjfQDqt/
 fzDSuSFCEaD52Xc5OofuOo+z9zjDLHX54BiNur4xC/47GiIHtbjhf8f+m+dqZPyfg+YR
 lBUC03lbf0o34bdSp4BoWL9eVz8IWXMpKLitHRfGPfC+etkEG/EENdazJluRegGEGSke
 R5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TvE0yWk1hg4q3LaA1yHQdcnBQxWHt+/trmjQtSus1JU=;
 b=kCliU4KUU0uOcN7gJ2yPx5QEAszUUAbYiQNVUmxdMyIo1HdGpbOEBn6aPfNIjNPoss
 i2U6zRSaIwvtjxyqqWzKvk5YM6ICaSKUltlkNvw4207s7o0ddHTKsoEwNSLCp/yzn+Le
 8S7vzJF38DcojMvWisDgPmysmkzKi+WUoaKZwZ3EH+Lfk9keWIC8EnlTt4VfvTNALHva
 y4nCqKYGa58pZ1ESy2f3JvT1ZJC6aDT/qx7gnxEJdSGsqjzjMX+/DbQVuy9/kBv4Iiy7
 6pPzJXFFaqixlS7i+2HWvrymjB18Wr07qaC+yWVD/vBOoeJ9hXfr/+ox9Re62mHG0QA3
 mifQ==
X-Gm-Message-State: AOAM530T4o2mlfUOsaX0K3myHAZmyJaTJUpWKxdDkNHeQHHYGbM+cHvH
 7gXDasXuPIJIkuczzA76jZyIVg==
X-Google-Smtp-Source: ABdhPJxjIvElLFn948F6Gh/koHUrGaxu631Z1rs3RM16FMoJ8VaFNb+xNIowqf99PlZ391pIPYpF9A==
X-Received: by 2002:a1c:2846:: with SMTP id o67mr8547285wmo.188.1613382743693; 
 Mon, 15 Feb 2021 01:52:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm22657401wre.78.2021.02.15.01.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:52:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 48C321FF9D;
 Mon, 15 Feb 2021 09:42:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/15] bswap.h: Remove unused float-access functions
Date: Mon, 15 Feb 2021 09:42:43 +0000
Message-Id: <20210215094244.12716-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The float-access functions stfl_*, stfq*, ldfl* and ldfq* are now
unused; remove them.  (Accesses to float64 and float32 types can be
made with the ldl/stl/ldq/stq functions, as float64 and float32 are
guaranteed to be typedefs for normal integer types.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210208113428.7181-6-peter.maydell@linaro.org>
Message-Id: <20210211122750.22645-15-alex.bennee@linaro.org>

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


