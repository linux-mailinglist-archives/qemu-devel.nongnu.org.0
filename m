Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF026063D1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:07:49 +0200 (CEST)
Received: from localhost ([::1]:48744 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olX99-00072i-7b
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:07:47 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWxS-0004dL-I7
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZJ-0001aq-NG
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:23:00 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYy-000130-9G
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id l32so14785502wms.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3O+4MnJv0rRyn/a/QFn0L+UaRzjg4a2Dnz6YCScVZBo=;
 b=mn38bEqUWbCwVTttS5hf5CZC4xnK+l7eRK5MCjNkrjP8ZjgJqK3ydsJCW4Ld0sPp73
 kWoEspf52t3oMwqJdHdWT3VaKRmjUvs0cX5wt+svRj5nBY1ILYNHoQMmfcAnQ0t+VSCM
 uCQf7d9jFWG6KwWT71igXNye4TlR/a6CFr2DP5Cxxn78b1ZryEu4kHelWYVAHimHtKp7
 H47TJswBttuJ2sbUIwX3KBr+VG3SQo07yozHsT/+jD1yFzsTCHmYr3KjkpAcGDX6iRvX
 f5/B3vfObnq5ru+mWV7qQK/QweGD/wHhLw6DIkbQfqMLAKQqJ54xSOwY4d69AnYsihG3
 1ouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3O+4MnJv0rRyn/a/QFn0L+UaRzjg4a2Dnz6YCScVZBo=;
 b=1/69qnMBlPHE2ERYQMIpYzzyxQDxDB4bcOflcsl6IphzB/8cHL2CgQ3mW1HZ37guM/
 GU9XepLymtlieC0zvKkl7XuG4S/anXpOhXdXrrcMwmQUel1fcc7xvbZhmtJjvIqVsrSy
 WF8U+NWCodNW6MmnVuFhaUfmhH+QZzBqKhzODM+hmDRCIzD03RVEqsTgSoqgJ675q5J5
 Lc0VZxxd8V3qAD9PnAlZ3ZPzmbuohCK2LcBzfYbyMwptWIKQMUAs/LgAKgDrZEucFc8+
 7VSLNGtKkjbI4YzXoBkxjjoa8+HF9uAVl06AzRp0nsksws728M/WAG8SY1uPFLn54nH0
 WCRw==
X-Gm-Message-State: ACrzQf3Tbh9WTKOAfgPbSCqlvYb0wkywyfnE5gBvOQw9csfqQwLhF7Lr
 SmQaCM0st9hHVwaH1FwG1WHimSxXbd+cRg==
X-Google-Smtp-Source: AMsMyM7VVuw712L6SQYcB+DyuOf52AJeYz32TRhUg2eRPULOXssNXBnVfG15G9Ic/a6Uknw0zjrv7g==
X-Received: by 2002:a05:600c:6890:b0:3c6:c323:878d with SMTP id
 fn16-20020a05600c689000b003c6c323878dmr29609333wmb.87.1666268525770; 
 Thu, 20 Oct 2022 05:22:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/24] target/arm: Split out get_phys_addr_twostage
Date: Thu, 20 Oct 2022 13:21:35 +0100
Message-Id: <20221020122146.3177980-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221011031911.2408754-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 191 +++++++++++++++++++++++++----------------------
 1 file changed, 100 insertions(+), 91 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8f41d285b7d..dd6556560af 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -31,6 +31,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
+static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
+                                      target_ulong address,
+                                      MMUAccessType access_type,
+                                      GetPhysAddrResult *result,
+                                      ARMMMUFaultInfo *fi)
+    __attribute__((nonnull));
+
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
 static const uint8_t pamax_map[] = {
     [0] = 32,
@@ -2428,6 +2435,94 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     return 0;
 }
 
+static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
+                                   target_ulong address,
+                                   MMUAccessType access_type,
+                                   GetPhysAddrResult *result,
+                                   ARMMMUFaultInfo *fi)
+{
+    hwaddr ipa;
+    int s1_prot;
+    int ret;
+    bool is_secure = ptw->in_secure;
+    bool ipa_secure, s2walk_secure;
+    ARMCacheAttrs cacheattrs1;
+    bool is_el0;
+    uint64_t hcr;
+
+    ret = get_phys_addr_with_struct(env, ptw, address, access_type, result, fi);
+
+    /* If S1 fails or S2 is disabled, return early.  */
+    if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+        return ret;
+    }
+
+    ipa = result->f.phys_addr;
+    ipa_secure = result->f.attrs.secure;
+    if (is_secure) {
+        /* Select TCR based on the NS bit from the S1 walk. */
+        s2walk_secure = !(ipa_secure
+                          ? env->cp15.vstcr_el2 & VSTCR_SW
+                          : env->cp15.vtcr_el2 & VTCR_NSW);
+    } else {
+        assert(!ipa_secure);
+        s2walk_secure = false;
+    }
+
+    is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
+    ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    ptw->in_secure = s2walk_secure;
+
+    /*
+     * S1 is done, now do S2 translation.
+     * Save the stage1 results so that we may merge prot and cacheattrs later.
+     */
+    s1_prot = result->f.prot;
+    cacheattrs1 = result->cacheattrs;
+    memset(result, 0, sizeof(*result));
+
+    ret = get_phys_addr_lpae(env, ptw, ipa, access_type, is_el0, result, fi);
+    fi->s2addr = ipa;
+
+    /* Combine the S1 and S2 perms.  */
+    result->f.prot &= s1_prot;
+
+    /* If S2 fails, return early.  */
+    if (ret) {
+        return ret;
+    }
+
+    /* Combine the S1 and S2 cache attributes. */
+    hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+    if (hcr & HCR_DC) {
+        /*
+         * HCR.DC forces the first stage attributes to
+         *  Normal Non-Shareable,
+         *  Inner Write-Back Read-Allocate Write-Allocate,
+         *  Outer Write-Back Read-Allocate Write-Allocate.
+         * Do not overwrite Tagged within attrs.
+         */
+        if (cacheattrs1.attrs != 0xf0) {
+            cacheattrs1.attrs = 0xff;
+        }
+        cacheattrs1.shareability = 0;
+    }
+    result->cacheattrs = combine_cacheattrs(hcr, cacheattrs1,
+                                            result->cacheattrs);
+
+    /*
+     * Check if IPA translates to secure or non-secure PA space.
+     * Note that VSTCR overrides VTCR and {N}SW overrides {N}SA.
+     */
+    result->f.attrs.secure =
+        (is_secure
+         && !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW))
+         && (ipa_secure
+             || !(env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))));
+
+    return 0;
+}
+
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
@@ -2441,99 +2536,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     if (mmu_idx != s1_mmu_idx) {
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
-         * translations if mmu_idx is a two-stage regime.
+         * translations if mmu_idx is a two-stage regime, and EL2 present.
+         * Otherwise, a stage1+stage2 translation is just stage 1.
          */
+        ptw->in_mmu_idx = mmu_idx = s1_mmu_idx;
         if (arm_feature(env, ARM_FEATURE_EL2)) {
-            hwaddr ipa;
-            int s1_prot;
-            int ret;
-            bool ipa_secure, s2walk_secure;
-            ARMCacheAttrs cacheattrs1;
-            bool is_el0;
-            uint64_t hcr;
-
-            ptw->in_mmu_idx = s1_mmu_idx;
-            ret = get_phys_addr_with_struct(env, ptw, address, access_type,
-                                            result, fi);
-
-            /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
-                                                   is_secure)) {
-                return ret;
-            }
-
-            ipa = result->f.phys_addr;
-            ipa_secure = result->f.attrs.secure;
-            if (is_secure) {
-                /* Select TCR based on the NS bit from the S1 walk. */
-                s2walk_secure = !(ipa_secure
-                                  ? env->cp15.vstcr_el2 & VSTCR_SW
-                                  : env->cp15.vtcr_el2 & VTCR_NSW);
-            } else {
-                assert(!ipa_secure);
-                s2walk_secure = false;
-            }
-
-            ptw->in_mmu_idx =
-                s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-            ptw->in_secure = s2walk_secure;
-            is_el0 = mmu_idx == ARMMMUIdx_E10_0;
-
-            /*
-             * S1 is done, now do S2 translation.
-             * Save the stage1 results so that we may merge
-             * prot and cacheattrs later.
-             */
-            s1_prot = result->f.prot;
-            cacheattrs1 = result->cacheattrs;
-            memset(result, 0, sizeof(*result));
-
-            ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
-                                     is_el0, result, fi);
-            fi->s2addr = ipa;
-
-            /* Combine the S1 and S2 perms.  */
-            result->f.prot &= s1_prot;
-
-            /* If S2 fails, return early.  */
-            if (ret) {
-                return ret;
-            }
-
-            /* Combine the S1 and S2 cache attributes. */
-            hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-            if (hcr & HCR_DC) {
-                /*
-                 * HCR.DC forces the first stage attributes to
-                 *  Normal Non-Shareable,
-                 *  Inner Write-Back Read-Allocate Write-Allocate,
-                 *  Outer Write-Back Read-Allocate Write-Allocate.
-                 * Do not overwrite Tagged within attrs.
-                 */
-                if (cacheattrs1.attrs != 0xf0) {
-                    cacheattrs1.attrs = 0xff;
-                }
-                cacheattrs1.shareability = 0;
-            }
-            result->cacheattrs = combine_cacheattrs(hcr, cacheattrs1,
-                                                    result->cacheattrs);
-
-            /*
-             * Check if IPA translates to secure or non-secure PA space.
-             * Note that VSTCR overrides VTCR and {N}SW overrides {N}SA.
-             */
-            result->f.attrs.secure =
-                (is_secure
-                 && !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW))
-                 && (ipa_secure
-                     || !(env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))));
-
-            return 0;
-        } else {
-            /*
-             * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
-             */
-            mmu_idx = stage_1_mmu_idx(mmu_idx);
+            return get_phys_addr_twostage(env, ptw, address, access_type,
+                                          result, fi);
         }
     }
 
-- 
2.25.1


