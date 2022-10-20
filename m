Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D2606BBC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:55:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleS2-0001ap-5D
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:55:46 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ole9h-0006Tj-H1
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9S-0006Gx-Sk
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:37 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9O-0000ya-RI
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:33 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso3243307pjn.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nTKpMKuE+pz6wCejYiz9sAtx5qQD3FQ5Cp+sm8SPKWU=;
 b=GtgOCkuw6yQgol5dE/Cos/eg31JPY5BDVmbvpuIflkcwQapI0mjOvT339InB4lbFEq
 wELMejVZthKY+z8F/sdlBRyeEIc60QKUrFUZ1zjkDeiaRIGj/ce52M+M5GSjpbK7wbj3
 h+2MkGfDtb83FOct3a09bUKAMwxN0Z0z2eMUjh0o/28EIIykd3DLr3FEyX9YHNpZk60L
 Q3wkPjRSEdNhEwZxZKis2I+2nJZM/Y9rzm/RiIzDX/Xxux2wJdS5DsZI7VyNMKeHW+uK
 SMVdTj+Xyeephmtu/XmWlVcKaEGMQHgHLrdvaOFAuRushKfwMBp/iMJrSFrhuNQW8Rd0
 Q4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nTKpMKuE+pz6wCejYiz9sAtx5qQD3FQ5Cp+sm8SPKWU=;
 b=yyFL6UUB0b9ObbOSN/k+bg36Iltv3kVNk4IUCa9BH8Fx/vJxHx/SOfivQ/eoIru0bZ
 wZJdQL/MfChwd8iK3zp3Bswfyoonpc31ruGmaXnfiFtfL760Z4VyclD/oNiAquKV5kh6
 IXLlHq/nRoomiv0zwHBALvR1zTh3ZQ3IIEL8UKeLn940oqGIS88IWzWT8mcacTsOWn0j
 ms/QsXjnk4c7qWThZ58zdWV4eJUjxXMGnH6Azm8ax/MyQVDPC+qlOPwqP5W4Y18+n05z
 SpMfvMPd5KZ0/L+rvzGsjmG4CK/2d3d1ADCeU+uKj2PunrMq/Bvtaq5pr7q+FXKg6Ao4
 /+Dw==
X-Gm-Message-State: ACrzQf2UKS8LCIpVjZt/V2CvLYWerqHX64IvImuwIBLxqQBYRZfwvFHQ
 2MnzMHm9mlHlT+a3hDEDlg3hR6RX1fYNJJWO
X-Google-Smtp-Source: AMsMyM5JQE0ViLaAgwTzi5EPUTCKGawe0X6xDkBu4wOks9F0MqWyIlJuUYiiMw35RcQO5Q0g3emYwA==
X-Received: by 2002:a17:902:ecc5:b0:180:a7ff:9954 with SMTP id
 a5-20020a170902ecc500b00180a7ff9954mr16419870plh.97.1666305388570; 
 Thu, 20 Oct 2022 15:36:28 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 01/14] target/arm: Introduce regime_is_stage2
Date: Fri, 21 Oct 2022 08:35:35 +1000
Message-Id: <20221020223548.2310496-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reduce the amount of typing required for this check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  5 +++++
 target/arm/helper.c    | 14 +++++---------
 target/arm/ptw.c       | 14 ++++++--------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c3c3920ded..2b6889073d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -673,6 +673,11 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
+{
+    return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
+}
+
 /* Return the exception level which controls this address translation regime */
 static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c672903f43..cbfaabbc09 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10352,7 +10352,7 @@ int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 37, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    } else if (regime_is_stage2(mmu_idx)) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBI bit so we always have 2 bits.  */
@@ -10364,7 +10364,7 @@ int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 51, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    } else if (regime_is_stage2(mmu_idx)) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBID bit so we always have 2 bits.  */
@@ -10474,7 +10474,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
-    bool stage2 = mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
+    bool stage2 = regime_is_stage2(mmu_idx);
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -10532,22 +10532,18 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         }
         ds = false;
     } else if (ds) {
-        switch (mmu_idx) {
-        case ARMMMUIdx_Stage2:
-        case ARMMMUIdx_Stage2_S:
+        if (regime_is_stage2(mmu_idx)) {
             if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_2_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_2_lpa2, cpu);
             }
-            break;
-        default:
+        } else {
             if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_lpa2, cpu);
             }
-            break;
         }
         if (ds) {
             min_tsz = 12;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6c5ed56a10..004375e02b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -842,8 +842,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     bool have_wxn;
     int wxn = 0;
 
-    assert(mmu_idx != ARMMMUIdx_Stage2);
-    assert(mmu_idx != ARMMMUIdx_Stage2_S);
+    assert(!regime_is_stage2(mmu_idx));
 
     user_rw = simple_ap_to_rw_prot_is_user(ap, true);
     if (is_user) {
@@ -1171,7 +1170,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         goto do_fault;
     }
 
-    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
+    if (!regime_is_stage2(mmu_idx)) {
         /*
          * The starting level depends on the virtual address size (which can
          * be up to 48 bits) and the translation granule size. It indicates
@@ -1342,7 +1341,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         attrs = extract64(descriptor, 2, 10)
             | (extract64(descriptor, 52, 12) << 10);
 
-        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        if (regime_is_stage2(mmu_idx)) {
             /* Stage 2 table descriptors do not include any attribute fields */
             break;
         }
@@ -1374,7 +1373,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     ap = extract32(attrs, 4, 2);
 
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    if (regime_is_stage2(mmu_idx)) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
         xn = extract32(attrs, 11, 2);
         result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
@@ -1404,7 +1403,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.guarded = guarded;
     }
 
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    if (regime_is_stage2(mmu_idx)) {
         result->cacheattrs.is_s2_format = true;
         result->cacheattrs.attrs = extract32(attrs, 0, 4);
     } else {
@@ -1435,8 +1434,7 @@ do_fault:
     fi->type = fault_type;
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
-    fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
-                               mmu_idx == ARMMMUIdx_Stage2_S);
+    fi->stage2 = fi->s1ptw || regime_is_stage2(mmu_idx);
     fi->s1ns = mmu_idx == ARMMMUIdx_Stage2;
     return true;
 }
-- 
2.34.1


