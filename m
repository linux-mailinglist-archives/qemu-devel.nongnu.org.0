Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA2807E9
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Aug 2019 20:59:34 +0200 (CEST)
Received: from localhost ([::1]:41566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htzFd-00061O-N6
	for lists+qemu-devel@lfdr.de; Sat, 03 Aug 2019 14:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32780)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1htz4y-0006b2-0G
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1htz4w-0007KS-H7
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:31 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37893)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1htz4w-0007Jh-Az
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:30 -0400
Received: by mail-pf1-x430.google.com with SMTP id y15so37633372pfn.5
 for <qemu-devel@nongnu.org>; Sat, 03 Aug 2019 11:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F8zJJPz0HoAAcPGItYsG98fn3EhRGHL9/KSAWCPhxyQ=;
 b=nyYDZlSWyWGgw+mPVtlmhwfzB+jmeYrS0DerBgWFeqgL+G4q5VWZOZ8SvW5yOrpQZt
 OHDluovFZg0lfnnBNbYnupFrR153G38gNkqA67gqexIqco+RYNjPDDClWR8fgOPjk5BQ
 qnpqCzjqxWSrxhSjZ5eOopQU/pnZtFYggk0+wyZSClNmfhdb17isKnb+g1TbzwJMVhtk
 Gl+rsPp3ix+4j/Aw5+T6ATffS5ACO04ZxhbIp5pfMjzVEN1p4GImzqxntaCIfY/+qj4T
 mffVDkVALM4tRvVLgN2k3kDSiu2BT7swflBjyPLmIt0k8m82/9y5KlfaqFVLSQOHQ1zm
 TfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F8zJJPz0HoAAcPGItYsG98fn3EhRGHL9/KSAWCPhxyQ=;
 b=o0yJNPvJSSoIYfzAAeSjesfH89itSZYHqFOerrKD4Op5WLrIwjT3fSjdiRUk1ezPX3
 XaUZ/nntgySvENdhrtRv8/ELC7Br819YWsGgQFAMRAXgx2muX6JxoUbm2QIs8Bxs8gn1
 dzBFDwkvzUFHd336o6/dQQ5uraYgMrr7XFzKDe8gNt+9p9i9DE/pdv+aYZ0tRROmvWSx
 tVd0KDiKLxwiXHurFuv/tCIJ37RACbVMhPXKO0Bhfwzufh6Lq9DNgJkCZnWegAuk+os6
 5nkRuOl5QNa5wBjYs2QroRPPkcS7M5xoyajyfipmj1DFXGXl1enSPrvnN6C9I3hwCNdd
 z/Ow==
X-Gm-Message-State: APjAAAWJ4YZnOLcxhuHBGJTAssgmB2b9LzxoF2Rxfxiz/gEkDU5wzK5Q
 nWYR2pxC7Vbnt3+wLuK4YhhvBzabwKw=
X-Google-Smtp-Source: APXvYqy3xTj9oqSIYbTPypv1AsJSv14cGHMyy2JQWWk3EshdshfwPQgU9GhGjz63ufBmQnI88Z3QJw==
X-Received: by 2002:a63:f926:: with SMTP id h38mr40174630pgi.80.1564858108975; 
 Sat, 03 Aug 2019 11:48:28 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 03 Aug 2019 11:48:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  3 Aug 2019 11:47:48 -0700
Message-Id: <20190803184800.8221-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::430
Subject: [Qemu-devel] [PATCH v3 22/34] target/arm: Add regime_has_2_ranges
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 16 ++++++++++++++++
 target/arm/helper.c        | 22 +++++-----------------
 target/arm/translate-a64.c |  3 +--
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index dd0bc4377f..1b64ceeda6 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -824,6 +824,22 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
+/* Return true if this address translation regime has two ranges.  */
+static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_EL10_0:
+    case ARMMMUIdx_EL10_1:
+    case ARMMMUIdx_EL20_0:
+    case ARMMMUIdx_EL20_2:
+        return true;
+    default:
+        return false;
+    }
+}
+
 /* Return true if this address translation regime is secure */
 static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9c2c81c434..5472424179 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9006,15 +9006,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     }
 
     if (is_aa64) {
-        switch (regime_el(env, mmu_idx)) {
-        case 1:
-            if (!is_user) {
-                xn = pxn || (user_rw & PAGE_WRITE);
-            }
-            break;
-        case 2:
-        case 3:
-            break;
+        if (regime_has_2_ranges(mmu_idx) && !is_user) {
+            xn = pxn || (user_rw & PAGE_WRITE);
         }
     } else if (arm_feature(env, ARM_FEATURE_V7)) {
         switch (regime_el(env, mmu_idx)) {
@@ -9548,7 +9541,6 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
                                         ARMMMUIdx mmu_idx)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    uint32_t el = regime_el(env, mmu_idx);
     bool tbi, tbid, epd, hpd, using16k, using64k;
     int select, tsz;
 
@@ -9558,7 +9550,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
      */
     select = extract64(va, 55, 1);
 
-    if (el > 1) {
+    if (!regime_has_2_ranges(mmu_idx)) {
         tsz = extract32(tcr, 0, 6);
         using64k = extract32(tcr, 14, 1);
         using16k = extract32(tcr, 15, 1);
@@ -9714,10 +9706,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
-        /* If we are in 64-bit EL2 or EL3 then there is no TTBR1, so mark it
-         * invalid.
-         */
-        ttbr1_valid = (el < 2);
+        ttbr1_valid = regime_has_2_ranges(mmu_idx);
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
     } else {
@@ -11368,8 +11357,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
             int tbii, tbid;
 
-            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
-            if (regime_el(env, stage1) < 2) {
+            if (regime_has_2_ranges(mmu_idx)) {
                 ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
                 tbid = (p1.tbi << 1) | p0.tbi;
                 tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index dbe2189e51..06ff3a7f2e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -175,8 +175,7 @@ static void gen_top_byte_ignore(DisasContext *s, TCGv_i64 dst,
     if (tbi == 0) {
         /* Load unmodified address */
         tcg_gen_mov_i64(dst, src);
-    } else if (s->current_el >= 2) {
-        /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+    } else if (!regime_has_2_ranges(s->mmu_idx)) {
         /* Force tag byte to all zero */
         tcg_gen_extract_i64(dst, src, 0, 56);
     } else {
-- 
2.17.1


