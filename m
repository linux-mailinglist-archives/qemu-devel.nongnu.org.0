Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC8B6EC1F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 23:38:11 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoa5J-0006kL-7E
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 17:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55319)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hoa3f-0008To-7X
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 17:04:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hoa3d-0005dD-GV
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 17:04:50 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hoa3c-0005BU-7O
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 17:04:48 -0400
Received: by mail-pf1-x42a.google.com with SMTP id q10so14672749pff.9
 for <qemu-devel@nongnu.org>; Fri, 19 Jul 2019 14:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dViyLUNG7AAQOa1/IU+ce+AJwf2YlyFeUgtyBFqzMXo=;
 b=tZlNqo9Wh5GbgSTtX3MhgnQUnuZagd6ixMAVmzu6ycjbnFLPjDNGDQhI5+J8on08il
 CrIq2i/k5ALR8ar1cCrP1yw8yKHKCrr+xEGIs/HOMlUFAgD+yu26TkSCL7IN9ALOUfGV
 chOrkGaTAUDCos1q3f9SKv9yFfSpH9+EX0ycdtSIe/W/VMgValTBxfIPKL4YvZWOWy95
 Z+hzTT1glSjpZItSEDXIBMNOlGYQz3RRdmNNzpk18WupjFNZYxxKwdWcVRhGOxzSRgP8
 IqRQlGFjO2S+A/B0WVY751lj8VboibwgGQw7OUx+twcMh7rTga7MEnm8TC6GX7LSWPzX
 eDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dViyLUNG7AAQOa1/IU+ce+AJwf2YlyFeUgtyBFqzMXo=;
 b=rUVGUJ4RHxxElIbiyY/nNLn9zf38Q4VMlPlGFSRxJsyVnYQdBcwzZC4NLTq7I6doqt
 HWNams7HhGCjVkYBLfHxTVNSnCRZkd/EX54VCLnQWLnNgpqjdiJCdh91jHULjSrxK5Nb
 ZBDu1NAN6hTogMV2hduV4e6U5Z3JFSXwXOhbOVpmShKFzx+LAZrLPJAgt9SzSbtYCI86
 XMA9Sr/6aAtNOp0f4kCQiAFt6rPR3IBf4Hlhpx+Itu5e+cxsS4yKm1M2RAJs8rm6y2rh
 sPSCTv1V75SnOJzj2F6CS8alWGIb2GIIzh2x3UT/FF2nhJORdki1wDoVKKyNHiw/AOIX
 lR6g==
X-Gm-Message-State: APjAAAUgW4dniOrlJnxHLVvudRPHX4x63AE/5PVE2SdVHbaWmGfampoV
 juC1olyTTnxZ6QNk49tChUH3g3mI8lY=
X-Google-Smtp-Source: APXvYqxREOAK+oMIDeJ6ZPII99RWzICJCJ8n3dkrd45sV2dCQE885FFhHxBFoux2jFuW5ed8Uhfngg==
X-Received: by 2002:a63:d941:: with SMTP id e1mr23408837pgj.75.1563570227747; 
 Fri, 19 Jul 2019 14:03:47 -0700 (PDT)
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net.
 [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id i6sm32724751pgi.40.2019.07.19.14.03.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 14:03:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 19 Jul 2019 14:03:18 -0700
Message-Id: <20190719210326.15466-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190719210326.15466-1-richard.henderson@linaro.org>
References: <20190719210326.15466-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42a
Subject: [Qemu-devel] [PATCH for-4.2 16/24] target/arm: Add
 regime_has_2_ranges
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 16 ++++++++++++++++
 target/arm/helper.c        | 22 +++++-----------------
 target/arm/translate-a64.c |  3 +--
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 047cbfd1d7..f653e0e7f5 100644
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
index 240a6ed168..2d5658f9e3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8999,15 +8999,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
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
@@ -9541,7 +9534,6 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
                                         ARMMMUIdx mmu_idx)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    uint32_t el = regime_el(env, mmu_idx);
     bool tbi, tbid, epd, hpd, using16k, using64k;
     int select, tsz;
 
@@ -9551,7 +9543,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
      */
     select = extract64(va, 55, 1);
 
-    if (el > 1) {
+    if (!regime_has_2_ranges(mmu_idx)) {
         tsz = extract32(tcr, 0, 6);
         using64k = extract32(tcr, 14, 1);
         using16k = extract32(tcr, 15, 1);
@@ -9707,10 +9699,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
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
@@ -11361,8 +11350,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
             int tbii, tbid;
 
-            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
-            if (regime_el(env, stage1) < 2) {
+            if (regime_has_2_ranges(mmu_idx)) {
                 ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
                 tbid = (p1.tbi << 1) | p0.tbi;
                 tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a9e65fe347..5679349310 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -176,8 +176,7 @@ static void gen_top_byte_ignore(DisasContext *s, TCGv_i64 dst,
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


