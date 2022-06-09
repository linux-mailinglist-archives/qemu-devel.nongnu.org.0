Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45A544816
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:55:49 +0200 (CEST)
Received: from localhost ([::1]:38206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEtI-0007Uq-9D
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7I-0001Yb-W1
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:18 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7E-00062u-Kx
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d14so22478158wra.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WD/V0E1GSbC8kw/VTqqWFOO+IaFp5Vx0rfDhyIWhFDU=;
 b=AEa7RquiRN8Zm/M2WAO56Kis0lEpu8H6AzF7P3XXGVxgdAHEr6p51Kw0FxcnX4IHyU
 UP0DxsUyg8VN7jWt1BZb/5YPab9cDALHw23DA6yYqC8R4aQT7DbkC2F+BzQQsRhDhIro
 6UH2wsOmx2czkgQZk9qHsUbIIT00/rlkCSOqkeQoWiglFnZdkwzc45QqYUvFQzY4IgSa
 KO8ibbZmjwZ5tkRJ9XBSbPHZxifZhOEJscU88nh/vFp9jT8y1b+d4i11L1CvSYE2OSJJ
 BsdN64Bi80ikkxYHnrrXLo27P3RHoWdZ+JaYNd5cVlnnB0/RzP9lH6hZO1wIzRTg5iZi
 3n1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WD/V0E1GSbC8kw/VTqqWFOO+IaFp5Vx0rfDhyIWhFDU=;
 b=LKIA1s9Hi4BqnQ86Uh1UPFRq/Hs/rAf+a7ImOZYlOmEXABauo4qu2KD509hyRKF+qt
 LC/MoMZEc4FDqt935/m0ELUEk6TkiCw7i3BXzawHG1nfOHImvDabmQvdcyHf4Vfm4xTJ
 C6FBbpEeMW4jBgEzs2p0RaRKD4d06+yvcIIngVqBWnZCw5lPA2/CqI5VKbZa6D6at87l
 4BFnfBdZbsOFwPnQrGsmjtjGJ7Klau4UvGChrXaq/iA8sotX1vNeKYjA3GYWNz1crVRI
 k4l8X63VBP6Psa934t3CxThjE3poAp0HFL65LVZFcf+Rfc7D2sh4EbKlXLmOdMHmXjtS
 Iwog==
X-Gm-Message-State: AOAM533ZdcV4v6GjwBQI3MqSbsmxEN84vcRAZJtwpOwm++6lYpCp4wZL
 WTvxSFdqYIGMYVDYjZHHAcCN+u1tI2WPag==
X-Google-Smtp-Source: ABdhPJz1meO6qZOZIuIZt7OruMaLKiphM09Zs/oMTRQg1DFY1mKlxl9ccmXpYeT+kdLwCuJkrCb/FA==
X-Received: by 2002:a5d:4344:0:b0:20c:cad4:9e9b with SMTP id
 u4-20020a5d4344000000b0020ccad49e9bmr36841605wrr.187.1654765563996; 
 Thu, 09 Jun 2022 02:06:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/55] target/arm: Move combine_cacheattrs and subroutines to
 ptw.c
Date: Thu,  9 Jun 2022 10:05:03 +0100
Message-Id: <20220609090537.1971756-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

There are a handful of helpers for combine_cacheattrs
that we can move at the same time as the main entry point.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-15-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |   3 -
 target/arm/helper.c | 218 -------------------------------------------
 target/arm/ptw.c    | 221 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 221 insertions(+), 221 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index dd6fb93f336..b2dfe489bbe 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -20,9 +20,6 @@ bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
 
-ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
-                                 ARMCacheAttrs s1, ARMCacheAttrs s2);
-
 int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
                   int ap, int domain_prot);
 int simple_ap_to_rw_prot_is_user(int ap, bool is_user);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a144cb26413..dab485e64ae 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10977,36 +10977,6 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     }
     return true;
 }
-
-/* Translate from the 4-bit stage 2 representation of
- * memory attributes (without cache-allocation hints) to
- * the 8-bit representation of the stage 1 MAIR registers
- * (which includes allocation hints).
- *
- * ref: shared/translation/attrs/S2AttrDecode()
- *      .../S2ConvertAttrsHints()
- */
-static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
-{
-    uint8_t hiattr = extract32(s2attrs, 2, 2);
-    uint8_t loattr = extract32(s2attrs, 0, 2);
-    uint8_t hihint = 0, lohint = 0;
-
-    if (hiattr != 0) { /* normal memory */
-        if (arm_hcr_el2_eff(env) & HCR_CD) { /* cache disabled */
-            hiattr = loattr = 1; /* non-cacheable */
-        } else {
-            if (hiattr != 1) { /* Write-through or write-back */
-                hihint = 3; /* RW allocate */
-            }
-            if (loattr != 1) { /* Write-through or write-back */
-                lohint = 3; /* RW allocate */
-            }
-        }
-    }
-
-    return (hiattr << 6) | (hihint << 4) | (loattr << 2) | lohint;
-}
 #endif /* !CONFIG_USER_ONLY */
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
@@ -11653,194 +11623,6 @@ do_fault:
     return true;
 }
 
-/* Combine either inner or outer cacheability attributes for normal
- * memory, according to table D4-42 and pseudocode procedure
- * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
- *
- * NB: only stage 1 includes allocation hints (RW bits), leading to
- * some asymmetry.
- */
-static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
-{
-    if (s1 == 4 || s2 == 4) {
-        /* non-cacheable has precedence */
-        return 4;
-    } else if (extract32(s1, 2, 2) == 0 || extract32(s1, 2, 2) == 2) {
-        /* stage 1 write-through takes precedence */
-        return s1;
-    } else if (extract32(s2, 2, 2) == 2) {
-        /* stage 2 write-through takes precedence, but the allocation hint
-         * is still taken from stage 1
-         */
-        return (2 << 2) | extract32(s1, 0, 2);
-    } else { /* write-back */
-        return s1;
-    }
-}
-
-/*
- * Combine the memory type and cacheability attributes of
- * s1 and s2 for the HCR_EL2.FWB == 0 case, returning the
- * combined attributes in MAIR_EL1 format.
- */
-static uint8_t combined_attrs_nofwb(CPUARMState *env,
-                                    ARMCacheAttrs s1, ARMCacheAttrs s2)
-{
-    uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
-
-    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
-
-    s1lo = extract32(s1.attrs, 0, 4);
-    s2lo = extract32(s2_mair_attrs, 0, 4);
-    s1hi = extract32(s1.attrs, 4, 4);
-    s2hi = extract32(s2_mair_attrs, 4, 4);
-
-    /* Combine memory type and cacheability attributes */
-    if (s1hi == 0 || s2hi == 0) {
-        /* Device has precedence over normal */
-        if (s1lo == 0 || s2lo == 0) {
-            /* nGnRnE has precedence over anything */
-            ret_attrs = 0;
-        } else if (s1lo == 4 || s2lo == 4) {
-            /* non-Reordering has precedence over Reordering */
-            ret_attrs = 4;  /* nGnRE */
-        } else if (s1lo == 8 || s2lo == 8) {
-            /* non-Gathering has precedence over Gathering */
-            ret_attrs = 8;  /* nGRE */
-        } else {
-            ret_attrs = 0xc; /* GRE */
-        }
-    } else { /* Normal memory */
-        /* Outer/inner cacheability combine independently */
-        ret_attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
-                  | combine_cacheattr_nibble(s1lo, s2lo);
-    }
-    return ret_attrs;
-}
-
-static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
-{
-    /*
-     * Given the 4 bits specifying the outer or inner cacheability
-     * in MAIR format, return a value specifying Normal Write-Back,
-     * with the allocation and transient hints taken from the input
-     * if the input specified some kind of cacheable attribute.
-     */
-    if (attr == 0 || attr == 4) {
-        /*
-         * 0 == an UNPREDICTABLE encoding
-         * 4 == Non-cacheable
-         * Either way, force Write-Back RW allocate non-transient
-         */
-        return 0xf;
-    }
-    /* Change WriteThrough to WriteBack, keep allocation and transient hints */
-    return attr | 4;
-}
-
-/*
- * Combine the memory type and cacheability attributes of
- * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
- * combined attributes in MAIR_EL1 format.
- */
-static uint8_t combined_attrs_fwb(CPUARMState *env,
-                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
-{
-    switch (s2.attrs) {
-    case 7:
-        /* Use stage 1 attributes */
-        return s1.attrs;
-    case 6:
-        /*
-         * Force Normal Write-Back. Note that if S1 is Normal cacheable
-         * then we take the allocation hints from it; otherwise it is
-         * RW allocate, non-transient.
-         */
-        if ((s1.attrs & 0xf0) == 0) {
-            /* S1 is Device */
-            return 0xff;
-        }
-        /* Need to check the Inner and Outer nibbles separately */
-        return force_cacheattr_nibble_wb(s1.attrs & 0xf) |
-            force_cacheattr_nibble_wb(s1.attrs >> 4) << 4;
-    case 5:
-        /* If S1 attrs are Device, use them; otherwise Normal Non-cacheable */
-        if ((s1.attrs & 0xf0) == 0) {
-            return s1.attrs;
-        }
-        return 0x44;
-    case 0 ... 3:
-        /* Force Device, of subtype specified by S2 */
-        return s2.attrs << 2;
-    default:
-        /*
-         * RESERVED values (including RES0 descriptor bit [5] being nonzero);
-         * arbitrarily force Device.
-         */
-        return 0;
-    }
-}
-
-/* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
- * and CombineS1S2Desc()
- *
- * @env:     CPUARMState
- * @s1:      Attributes from stage 1 walk
- * @s2:      Attributes from stage 2 walk
- */
-ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
-                                 ARMCacheAttrs s1, ARMCacheAttrs s2)
-{
-    ARMCacheAttrs ret;
-    bool tagged = false;
-
-    assert(s2.is_s2_format && !s1.is_s2_format);
-    ret.is_s2_format = false;
-
-    if (s1.attrs == 0xf0) {
-        tagged = true;
-        s1.attrs = 0xff;
-    }
-
-    /* Combine shareability attributes (table D4-43) */
-    if (s1.shareability == 2 || s2.shareability == 2) {
-        /* if either are outer-shareable, the result is outer-shareable */
-        ret.shareability = 2;
-    } else if (s1.shareability == 3 || s2.shareability == 3) {
-        /* if either are inner-shareable, the result is inner-shareable */
-        ret.shareability = 3;
-    } else {
-        /* both non-shareable */
-        ret.shareability = 0;
-    }
-
-    /* Combine memory type and cacheability attributes */
-    if (arm_hcr_el2_eff(env) & HCR_FWB) {
-        ret.attrs = combined_attrs_fwb(env, s1, s2);
-    } else {
-        ret.attrs = combined_attrs_nofwb(env, s1, s2);
-    }
-
-    /*
-     * Any location for which the resultant memory type is any
-     * type of Device memory is always treated as Outer Shareable.
-     * Any location for which the resultant memory type is Normal
-     * Inner Non-cacheable, Outer Non-cacheable is always treated
-     * as Outer Shareable.
-     * TODO: FEAT_XS adds another value (0x40) also meaning iNCoNC
-     */
-    if ((ret.attrs & 0xf0) == 0 || ret.attrs == 0x44) {
-        ret.shareability = 2;
-    }
-
-    /* TODO: CombineS1S2Desc does not consider transient, only WB, RWA. */
-    if (tagged && ret.attrs == 0xff) {
-        ret.attrs = 0xf0;
-    }
-
-    return ret;
-}
-
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5737a3976b8..f2ca2bb8fe1 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1008,6 +1008,227 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     return ret;
 }
 
+/*
+ * Translate from the 4-bit stage 2 representation of
+ * memory attributes (without cache-allocation hints) to
+ * the 8-bit representation of the stage 1 MAIR registers
+ * (which includes allocation hints).
+ *
+ * ref: shared/translation/attrs/S2AttrDecode()
+ *      .../S2ConvertAttrsHints()
+ */
+static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
+{
+    uint8_t hiattr = extract32(s2attrs, 2, 2);
+    uint8_t loattr = extract32(s2attrs, 0, 2);
+    uint8_t hihint = 0, lohint = 0;
+
+    if (hiattr != 0) { /* normal memory */
+        if (arm_hcr_el2_eff(env) & HCR_CD) { /* cache disabled */
+            hiattr = loattr = 1; /* non-cacheable */
+        } else {
+            if (hiattr != 1) { /* Write-through or write-back */
+                hihint = 3; /* RW allocate */
+            }
+            if (loattr != 1) { /* Write-through or write-back */
+                lohint = 3; /* RW allocate */
+            }
+        }
+    }
+
+    return (hiattr << 6) | (hihint << 4) | (loattr << 2) | lohint;
+}
+
+/*
+ * Combine either inner or outer cacheability attributes for normal
+ * memory, according to table D4-42 and pseudocode procedure
+ * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
+ *
+ * NB: only stage 1 includes allocation hints (RW bits), leading to
+ * some asymmetry.
+ */
+static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
+{
+    if (s1 == 4 || s2 == 4) {
+        /* non-cacheable has precedence */
+        return 4;
+    } else if (extract32(s1, 2, 2) == 0 || extract32(s1, 2, 2) == 2) {
+        /* stage 1 write-through takes precedence */
+        return s1;
+    } else if (extract32(s2, 2, 2) == 2) {
+        /* stage 2 write-through takes precedence, but the allocation hint
+         * is still taken from stage 1
+         */
+        return (2 << 2) | extract32(s1, 0, 2);
+    } else { /* write-back */
+        return s1;
+    }
+}
+
+/*
+ * Combine the memory type and cacheability attributes of
+ * s1 and s2 for the HCR_EL2.FWB == 0 case, returning the
+ * combined attributes in MAIR_EL1 format.
+ */
+static uint8_t combined_attrs_nofwb(CPUARMState *env,
+                                    ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
+
+    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
+
+    s1lo = extract32(s1.attrs, 0, 4);
+    s2lo = extract32(s2_mair_attrs, 0, 4);
+    s1hi = extract32(s1.attrs, 4, 4);
+    s2hi = extract32(s2_mair_attrs, 4, 4);
+
+    /* Combine memory type and cacheability attributes */
+    if (s1hi == 0 || s2hi == 0) {
+        /* Device has precedence over normal */
+        if (s1lo == 0 || s2lo == 0) {
+            /* nGnRnE has precedence over anything */
+            ret_attrs = 0;
+        } else if (s1lo == 4 || s2lo == 4) {
+            /* non-Reordering has precedence over Reordering */
+            ret_attrs = 4;  /* nGnRE */
+        } else if (s1lo == 8 || s2lo == 8) {
+            /* non-Gathering has precedence over Gathering */
+            ret_attrs = 8;  /* nGRE */
+        } else {
+            ret_attrs = 0xc; /* GRE */
+        }
+    } else { /* Normal memory */
+        /* Outer/inner cacheability combine independently */
+        ret_attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
+                  | combine_cacheattr_nibble(s1lo, s2lo);
+    }
+    return ret_attrs;
+}
+
+static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
+{
+    /*
+     * Given the 4 bits specifying the outer or inner cacheability
+     * in MAIR format, return a value specifying Normal Write-Back,
+     * with the allocation and transient hints taken from the input
+     * if the input specified some kind of cacheable attribute.
+     */
+    if (attr == 0 || attr == 4) {
+        /*
+         * 0 == an UNPREDICTABLE encoding
+         * 4 == Non-cacheable
+         * Either way, force Write-Back RW allocate non-transient
+         */
+        return 0xf;
+    }
+    /* Change WriteThrough to WriteBack, keep allocation and transient hints */
+    return attr | 4;
+}
+
+/*
+ * Combine the memory type and cacheability attributes of
+ * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
+ * combined attributes in MAIR_EL1 format.
+ */
+static uint8_t combined_attrs_fwb(CPUARMState *env,
+                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    switch (s2.attrs) {
+    case 7:
+        /* Use stage 1 attributes */
+        return s1.attrs;
+    case 6:
+        /*
+         * Force Normal Write-Back. Note that if S1 is Normal cacheable
+         * then we take the allocation hints from it; otherwise it is
+         * RW allocate, non-transient.
+         */
+        if ((s1.attrs & 0xf0) == 0) {
+            /* S1 is Device */
+            return 0xff;
+        }
+        /* Need to check the Inner and Outer nibbles separately */
+        return force_cacheattr_nibble_wb(s1.attrs & 0xf) |
+            force_cacheattr_nibble_wb(s1.attrs >> 4) << 4;
+    case 5:
+        /* If S1 attrs are Device, use them; otherwise Normal Non-cacheable */
+        if ((s1.attrs & 0xf0) == 0) {
+            return s1.attrs;
+        }
+        return 0x44;
+    case 0 ... 3:
+        /* Force Device, of subtype specified by S2 */
+        return s2.attrs << 2;
+    default:
+        /*
+         * RESERVED values (including RES0 descriptor bit [5] being nonzero);
+         * arbitrarily force Device.
+         */
+        return 0;
+    }
+}
+
+/*
+ * Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
+ * and CombineS1S2Desc()
+ *
+ * @env:     CPUARMState
+ * @s1:      Attributes from stage 1 walk
+ * @s2:      Attributes from stage 2 walk
+ */
+static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
+                                        ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    ARMCacheAttrs ret;
+    bool tagged = false;
+
+    assert(s2.is_s2_format && !s1.is_s2_format);
+    ret.is_s2_format = false;
+
+    if (s1.attrs == 0xf0) {
+        tagged = true;
+        s1.attrs = 0xff;
+    }
+
+    /* Combine shareability attributes (table D4-43) */
+    if (s1.shareability == 2 || s2.shareability == 2) {
+        /* if either are outer-shareable, the result is outer-shareable */
+        ret.shareability = 2;
+    } else if (s1.shareability == 3 || s2.shareability == 3) {
+        /* if either are inner-shareable, the result is inner-shareable */
+        ret.shareability = 3;
+    } else {
+        /* both non-shareable */
+        ret.shareability = 0;
+    }
+
+    /* Combine memory type and cacheability attributes */
+    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+        ret.attrs = combined_attrs_fwb(env, s1, s2);
+    } else {
+        ret.attrs = combined_attrs_nofwb(env, s1, s2);
+    }
+
+    /*
+     * Any location for which the resultant memory type is any
+     * type of Device memory is always treated as Outer Shareable.
+     * Any location for which the resultant memory type is Normal
+     * Inner Non-cacheable, Outer Non-cacheable is always treated
+     * as Outer Shareable.
+     * TODO: FEAT_XS adds another value (0x40) also meaning iNCoNC
+     */
+    if ((ret.attrs & 0xf0) == 0 || ret.attrs == 0x44) {
+        ret.shareability = 2;
+    }
+
+    /* TODO: CombineS1S2Desc does not consider transient, only WB, RWA. */
+    if (tagged && ret.attrs == 0xff) {
+        ret.attrs = 0xf0;
+    }
+
+    return ret;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.25.1


