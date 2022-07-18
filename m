Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C21578558
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:27:58 +0200 (CEST)
Received: from localhost ([::1]:39488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRj2-0006c4-O1
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHb-00027f-TD
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHX-0003Az-Q2
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:34 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so7392316wmb.3
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=S9521uPJSfVMIBW00AoA0V1zvlCEYyKqf8sTNG4dyxo=;
 b=gwkSvpR/Q6z50AyG23b3Pgu8+dim+7d9cVEgIE2SAaqv7FPuPxRFE9cNHYUgplMmCH
 cM2kIcYYiv6zquSS+Zbw5w9QU/5Y9HnC1TsNU3EpV4OuJXwcXGJgg7WiKoPIvEnxz/5r
 5FfjZxqiB35eUQTcF1qwqSTzyQ90XeK1DrPq8y9bB6N4nQhDqrufg3RytdkM+RKWRiHP
 BGviX/dgPiJI+ZKzpDkQc53Uvl3pBXHFY+CYjQuDIKGz6d+AXvM5gbERU5EKtGba10u7
 fgjOL2waz3EBMSljrHRn7icyiXAhA2LLN0mPt7Djks+IicpjH3UtdnsSBsopkC/7tbVH
 SIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S9521uPJSfVMIBW00AoA0V1zvlCEYyKqf8sTNG4dyxo=;
 b=H36iXD2urbU4sTkcB6IlsyaO4P6qtpsY8lioQ5f+dRfFN9ggBNNf8M3K2RjhsDMxpj
 Y2B50CXbZpEM/u9uC4Mkuy4CWe9q7GaoMJi9C5u1JZwiPM5v5frYRCW81iM/gKOQfHiP
 DebYsFdwhUCylXnFIlUQdZWfry4dQxtzhME6RifIZGnuMm0gFg/WRl5Q8LyqJNxLFuh0
 lH+6/S6Z4Uwiqz4BboYytgBSDNTWBiLC6l2CAVF1yloHMO38Qh8P4veMIaVqVuC9U6rI
 F7Xska9Tgj/O5jz8WXBIJuTdMLcUWNsyvEgfXXOvPOiZuzOUShdm6p+TNPYUTRUGd0T7
 Yu0A==
X-Gm-Message-State: AJIora/v6AXg/lkDyutQLIwk/LaEiHsW2hQ/Av+m6qIDBPnPFSYZACK5
 mKOhFX47rvr1FcAEnark+V79ETE7Mye4ow==
X-Google-Smtp-Source: AGRyM1sUj/2fA+dFvIeA/9EX3TkHuTYxk3rFT9R2/62looozmWNFoY3WDAJPsHre+OGxuhIVpfQ65A==
X-Received: by 2002:a05:600c:48a:b0:3a2:ce31:a150 with SMTP id
 d10-20020a05600c048a00b003a2ce31a150mr25951645wme.48.1658152770572; 
 Mon, 18 Jul 2022 06:59:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] target/arm: Store VTCR_EL2,
 VSTCR_EL2 registers as uint64_t
Date: Mon, 18 Jul 2022 14:59:14 +0100
Message-Id: <20220718135920.13667-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Change the representation of the VSTCR_EL2 and VTCR_EL2 registers in
the CPU state struct from struct TCR to uint64_t.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220714132303.1287193-6-peter.maydell@linaro.org
---
 target/arm/cpu.h       |  4 ++--
 target/arm/internals.h |  4 ++--
 target/arm/helper.c    |  4 +---
 target/arm/ptw.c       | 14 +++++++-------
 4 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6afcc882f2c..b14c7c3eec3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -340,8 +340,8 @@ typedef struct CPUArchState {
         uint64_t vsttbr_el2; /* Secure Virtualization Translation Table. */
         /* MMU translation table base control. */
         TCR tcr_el[4];
-        TCR vtcr_el2; /* Virtualization Translation Control.  */
-        TCR vstcr_el2; /* Secure Virtualization Translation Control. */
+        uint64_t vtcr_el2; /* Virtualization Translation Control.  */
+        uint64_t vstcr_el2; /* Secure Virtualization Translation Control. */
         uint32_t c2_data; /* MPU data cacheable bits.  */
         uint32_t c2_insn; /* MPU instruction cacheable bits.  */
         union { /* MMU domain access control register
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0a1eb20afce..9f654b12cea 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -781,14 +781,14 @@ static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     if (mmu_idx == ARMMMUIdx_Stage2) {
-        return env->cp15.vtcr_el2.raw_tcr;
+        return env->cp15.vtcr_el2;
     }
     if (mmu_idx == ARMMMUIdx_Stage2_S) {
         /*
          * Note: Secure stage 2 nominally shares fields from VTCR_EL2, but
          * those are not currently used by QEMU, so just return VSTCR_EL2.
          */
-        return env->cp15.vstcr_el2.raw_tcr;
+        return env->cp15.vstcr_el2;
     }
     return env->cp15.tcr_el[regime_el(env, mmu_idx)].raw_tcr;
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7461d4091ef..ea541e4b0c9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5413,9 +5413,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "VTCR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
       .access = PL2_RW,
-      /* no .writefn needed as this can't cause an ASID change;
-       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
-       */
+      /* no .writefn needed as this can't cause an ASID change */
       .fieldoffset = offsetof(CPUARMState, cp15.vtcr_el2) },
     { .name = "VTTBR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 6, .crm = 2,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e9959848d88..8049c67f039 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -241,9 +241,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         if (arm_is_secure_below_el3(env)) {
             /* Check if page table walk is to secure or non-secure PA space. */
             if (*is_secure) {
-                *is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+                *is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
             } else {
-                *is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+                *is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
             }
         } else {
             assert(!*is_secure);
@@ -2341,9 +2341,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             ipa_secure = attrs->secure;
             if (arm_is_secure_below_el3(env)) {
                 if (ipa_secure) {
-                    attrs->secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+                    attrs->secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
                 } else {
-                    attrs->secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+                    attrs->secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
                 }
             } else {
                 assert(!ipa_secure);
@@ -2385,11 +2385,11 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             if (arm_is_secure_below_el3(env)) {
                 if (ipa_secure) {
                     attrs->secure =
-                        !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW));
+                        !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
                 } else {
                     attrs->secure =
-                        !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR_NSW))
-                        || (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW)));
+                        !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
+                        || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
                 }
             }
             return 0;
-- 
2.25.1


