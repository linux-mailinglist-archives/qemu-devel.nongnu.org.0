Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCC39BE04
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:05:30 +0200 (CEST)
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDGD-0005z7-BN
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRF-0002sI-MV
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:49 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRA-0003nv-1m
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:49 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso5918310wmj.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S7aS1OcWQ66/PtC9FuFs6o6VaPhc4vwGyLuPu8rbtBw=;
 b=x+m82SoI/BQ/TeyWVXAo1IJysggCCsHSsFt6svYkPcG6HLy1LPWQahTsfJ3Riy6iDE
 Vp0EtCDclVfiVFJHFrbrwQPpzLBrFpodcOnb4VOHGlrixo0+N07HPJ98J8Rq14oBLvDv
 Ied62TBHW4vm7+uU60Hom+wLQGjNDfJrJMuiH8cAaw4gWhwVR3SeDilTBz0diriiywIC
 v4OIx983BR+WFxrt9bXSX1mYc3XY2TZRb7Pts8i18u4xolAj5L3Xmj+fe1rqMak2JAm0
 K6xmA5pF2Yg2ij9qjIpA5HII3GmvfxOQ4AgxkIgLt+VRlwlVIpQGL62yTqDKWJQbl4qj
 c6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S7aS1OcWQ66/PtC9FuFs6o6VaPhc4vwGyLuPu8rbtBw=;
 b=PaRj8JofKowq1LQUaJG633hCW8Iwx66ayNqmIPWmShkmJ5jA5+sPjTSnYH5OEAnXaY
 DdWXTzv/cZtkRq2PMQRB6ilQkxcXR4Eja5UpbdsiwFas0/GdYWwCAxvlZT8KbchNFlvh
 Kgp9cAoLPiHAhX8VTpbjRl5e7fWxMc4rWLlVovj6mi8lMv/UlRgtWaVUUJsBfLznta/J
 2xaccxmSAccrLWCyxKsU/TzhqH/AgEVCmUGqJLh4LE2eRareKELi/1bXL2Y3ejMA8SLv
 JuRtiglx7n1hGgocYBcADj4X+SVBn2l0K6Lh/qtTVXgEKRyoAJd+QrAm2MoWa4wEgfFH
 7r7g==
X-Gm-Message-State: AOAM532cjw18xwRCVHKtE87yKguOU9k9x6mZ8MSg7ogP3jWeX9oSMMPB
 FQvOL6DFz/Ko34L089EhJ4Ajpw==
X-Google-Smtp-Source: ABdhPJyubNWPPJWBfmguk/gXOo6E+/YWiv1EB3vxlBINLruztKiu0RMef34WEEyvrm/ckdZKuTrzFA==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr4464018wmh.86.1622823162455; 
 Fri, 04 Jun 2021 09:12:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b8sm5422422wmd.35.2021.06.04.09.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 348D21FFAF;
 Fri,  4 Jun 2021 16:53:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 25/99] target/arm: tcg: fix comment style before move to
 cpu-mmu
Date: Fri,  4 Jun 2021 16:51:58 +0100
Message-Id: <20210604155312.15902-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

before exporting some functionality from helper.c into a new module,
fix the comment style of those functions.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper.c | 152 ++++++++++++++++++++++++++--------------
 1 file changed, 101 insertions(+), 51 deletions(-)

diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index a66c1f0b9e..2a5022032c 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -10477,7 +10477,8 @@ static inline bool regime_translation_disabled(CPUARMState *env,
             return false;
         case 0:
         default:
-            /* HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
+            /*
+             * HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
              * we warned about that in armv7m_nvic.c when the guest set it.
              */
             return true;
@@ -10531,7 +10532,8 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 #endif /* !CONFIG_USER_ONLY */
 
-/* Convert a possible stage1+2 MMU index into the appropriate
+/*
+ * Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
 static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
@@ -10602,7 +10604,8 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
-/* Translate section/page access permissions to page
+/*
+ * Translate section/page access permissions to page
  * R/W protection flags
  *
  * @env:         CPUARMState
@@ -10658,7 +10661,8 @@ static inline int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
     }
 }
 
-/* Translate section/page access permissions to page
+/*
+ * Translate section/page access permissions to page
  * R/W protection flags.
  *
  * @ap:      The 2-bit simple AP (AP[2:1])
@@ -10686,7 +10690,8 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
-/* Translate S2 section/page access permissions to protection flags
+/*
+ * Translate S2 section/page access permissions to protection flags
  *
  * @env:     CPUARMState
  * @s2ap:    The 2-bit stage2 access permissions (S2AP)
@@ -10734,7 +10739,8 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
     return prot;
 }
 
-/* Translate section/page access permissions to protection flags
+/*
+ * Translate section/page access permissions to protection flags
  *
  * @env:     CPUARMState
  * @mmu_idx: MMU index indicating required translation regime
@@ -10771,7 +10777,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
         return prot_rw;
     }
 
-    /* TODO have_wxn should be replaced with
+    /*
+     * TODO have_wxn should be replaced with
      *   ARM_FEATURE_V8 || (ARM_FEATURE_V7 && ARM_FEATURE_EL2)
      * when ARM_FEATURE_EL2 starts getting set. For now we assume all LPAE
      * compatible processors have EL2, which is required for [U]WXN.
@@ -11043,7 +11050,8 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                     phys_addr = (desc & 0xfffff000) | (address & 0xfff);
                     *page_size = 0x1000;
                 } else {
-                    /* UNPREDICTABLE in ARMv5; we choose to take a
+                    /*
+                     * UNPREDICTABLE in ARMv5; we choose to take a
                      * page translation fault.
                      */
                     fi->type = ARMFault_Translation;
@@ -11109,7 +11117,8 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
     }
     type = (desc & 3);
     if (type == 0 || (type == 3 && !cpu_isar_feature(aa32_pxn, cpu))) {
-        /* Section translation fault, or attempt to use the encoding
+        /*
+         * Section translation fault, or attempt to use the encoding
          * which is Reserved on implementations without PXN.
          */
         fi->type = ARMFault_Translation;
@@ -11214,7 +11223,8 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         }
     }
     if (ns) {
-        /* The NS bit will (as required by the architecture) have no effect if
+        /*
+         * The NS bit will (as required by the architecture) have no effect if
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
@@ -11296,7 +11306,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     return true;
 }
 
-/* Translate from the 4-bit stage 2 representation of
+/*
+ * Translate from the 4-bit stage 2 representation of
  * memory attributes (without cache-allocation hints) to
  * the 8-bit representation of the stage 1 MAIR registers
  * (which includes allocation hints).
@@ -11585,7 +11596,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         stride = 9;
     }
 
-    /* Note that QEMU ignores shareability and cacheability attributes,
+    /*
+     * Note that QEMU ignores shareability and cacheability attributes,
      * so we don't need to do anything with the SH, ORGN, IRGN fields
      * in the TTBCR.  Similarly, TTBCR:A1 selects whether we get the
      * ASID from TTBR0 or TTBR1, but QEMU's TLB doesn't currently
@@ -11594,19 +11606,22 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      */
     ttbr = regime_ttbr(env, mmu_idx, param.select);
 
-    /* Here we should have set up all the parameters for the translation:
+    /*
+     * Here we should have set up all the parameters for the translation:
      * inputsize, ttbr, epd, stride, tbi
      */
 
     if (param.epd) {
-        /* Translation table walk disabled => Translation fault on TLB miss
+        /*
+         * Translation table walk disabled => Translation fault on TLB miss
          * Note: This is always 0 on 64-bit EL2 and EL3.
          */
         goto do_fault;
     }
 
     if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-        /* The starting level depends on the virtual address size (which can
+        /*
+         * The starting level depends on the virtual address size (which can
          * be up to 48 bits) and the translation granule size. It indicates
          * the number of strides (stride bits at a time) needed to
          * consume the bits of the input address. In the pseudocode this is:
@@ -11619,7 +11634,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          */
         level = 4 - (inputsize - 4) / stride;
     } else {
-        /* For stage 2 translations the starting level is specified by the
+        /*
+         * For stage 2 translations the starting level is specified by the
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
          */
         uint32_t sl0 = extract32(tcr->raw_tcr, 6, 2);
@@ -11659,7 +11675,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      */
     descaddr &= ~indexmask;
 
-    /* The address field in the descriptor goes up to bit 39 for ARMv7
+    /*
+     * The address field in the descriptor goes up to bit 39 for ARMv7
      * but up to bit 47 for ARMv8, but we use the descaddrmask
      * up to bit 39 for AArch32, because we don't need other bits in that case
      * to construct next descriptor address (anyway they should be all zeroes).
@@ -11667,7 +11684,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddrmask = ((1ull << (aarch64 ? 48 : 40)) - 1) &
                    ~indexmask_grainsize;
 
-    /* Secure accesses start with the page table in secure memory and
+    /*
+     * Secure accesses start with the page table in secure memory and
      * can be downgraded to non-secure at any step. Non-secure accesses
      * remain non-secure. We implement this by just ORing in the NSTable/NS
      * bits at each step.
@@ -11693,7 +11711,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr = descriptor & descaddrmask;
 
         if ((descriptor & 2) && (level < 3)) {
-            /* Table entry. The top five bits are attributes which may
+            /*
+             * Table entry. The top five bits are attributes which may
              * propagate down through lower levels of the table (and
              * which are all arranged so that 0 means "no effect", so
              * we can gather them up by ORing in the bits at each level).
@@ -11703,7 +11722,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             indexmask = indexmask_grainsize;
             continue;
         }
-        /* Block entry at level 1 or 2, or page entry at level 3.
+        /*
+         * Block entry at level 1 or 2, or page entry at level 3.
          * These are basically the same thing, although the number
          * of bits we pull in from the vaddr varies.
          */
@@ -11725,15 +11745,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             break;
         }
         attrs |= extract32(tableattrs, 0, 2) << 11;     /* XN, PXN */
-        /* The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
+        /*
+         * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
          * means "force PL1 access only", which means forcing AP[1] to 0.
          */
         attrs &= ~(extract32(tableattrs, 2, 1) << 4);   /* !APT[0] => AP[1] */
         attrs |= extract32(tableattrs, 3, 1) << 5;      /* APT[1] => AP[2] */
         break;
     }
-    /* Here descaddr is the final physical address, and attributes
-     * are all in attrs.
+    /*
+     * Here descaddr is the final physical address,
+     * and attributes are all in attrs.
      */
     fault_type = ARMFault_AccessFlag;
     if ((attrs & (1 << 8)) == 0) {
@@ -11760,7 +11782,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
 
     if (ns) {
-        /* The NS bit will (as required by the architecture) have no effect if
+        /*
+         * The NS bit will (as required by the architecture) have no effect if
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
@@ -11814,7 +11837,8 @@ static inline void get_phys_addr_pmsav7_default(CPUARMState *env,
             break;
         }
     } else {
-        /* Default system address map for M profile cores.
+        /*
+         * Default system address map for M profile cores.
          * The architecture specifies which regions are execute-never;
          * at the MPU level no other checks are defined.
          */
@@ -11840,7 +11864,8 @@ static inline void get_phys_addr_pmsav7_default(CPUARMState *env,
 static bool pmsav7_use_background_region(ARMCPU *cpu,
                                          ARMMMUIdx mmu_idx, bool is_user)
 {
-    /* Return true if we should use the default memory map as a
+    /*
+     * Return true if we should use the default memory map as a
      * "background" region if there are no hits against any MPU regions.
      */
     CPUARMState *env = &cpu->env;
@@ -11866,7 +11891,8 @@ static inline bool m_is_ppb_region(CPUARMState *env, uint32_t address)
 
 static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
 {
-    /* True if address is in the M profile system region
+    /*
+     * True if address is in the M profile system region
      * 0xe0000000 - 0xffffffff
      */
     return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
@@ -11888,7 +11914,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
     if (regime_translation_disabled(env, mmu_idx) ||
         m_is_ppb_region(env, address)) {
-        /* MPU disabled or M profile PPB access: use default memory map.
+        /*
+         * MPU disabled or M profile PPB access: use default memory map.
          * The other case which uses the default memory map in the
          * v7M ARM ARM pseudocode is exception vector reads from the vector
          * table. In QEMU those accesses are done in arm_v7m_load_vector(),
@@ -11954,7 +11981,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
                 srdis_mask = srdis ? 0x3 : 0x0;
                 for (i = 2; i <= 8 && rsize < TARGET_PAGE_BITS; i *= 2) {
-                    /* This will check in groups of 2, 4 and then 8, whether
+                    /*
+                     * This will check in groups of 2, 4 and then 8, whether
                      * the subregion bits are consistent. rsize is incremented
                      * back up to give the region size, considering consistent
                      * adjacent subregions as one region. Stop testing if rsize
@@ -12062,7 +12090,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 static bool v8m_is_sau_exempt(CPUARMState *env,
                               uint32_t address, MMUAccessType access_type)
 {
-    /* The architecture specifies that certain address ranges are
+    /*
+     * The architecture specifies that certain address ranges are
      * exempt from v8M SAU/IDAU checks.
      */
     return
@@ -12078,7 +12107,8 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                 V8M_SAttributes *sattrs)
 {
-    /* Look up the security attributes for this address. Compare the
+    /*
+     * Look up the security attributes for this address. Compare the
      * pseudocode SecurityCheck() function.
      * We assume the caller has zero-initialized *sattrs.
      */
@@ -12129,7 +12159,8 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
                         sattrs->subpage = true;
                     }
                     if (sattrs->srvalid) {
-                        /* If we hit in more than one region then we must report
+                        /*
+                         * If we hit in more than one region then we must report
                          * as Secure, not NS-Callable, with no valid region
                          * number info.
                          */
@@ -12187,7 +12218,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                               int *prot, bool *is_subpage,
                               ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
-    /* Perform a PMSAv8 MPU lookup (without also doing the SAU check
+    /*
+     * Perform a PMSAv8 MPU lookup (without also doing the SAU check
      * that a full phys-to-virt translation does).
      * mregion is (if not NULL) set to the region number which matched,
      * or -1 if no region number is returned (MPU off, address did not
@@ -12211,7 +12243,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         *mregion = -1;
     }
 
-    /* Unlike the ARM ARM pseudocode, we don't need to check whether this
+    /*
+     * Unlike the ARM ARM pseudocode, we don't need to check whether this
      * was an exception vector read from the vector table (which is always
      * done using the default system address map), because those accesses
      * are done in arm_v7m_load_vector(), which always does a direct
@@ -12228,7 +12261,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
         for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
             /* region search */
-            /* Note that the base address is bits [31:5] from the register
+            /*
+             * Note that the base address is bits [31:5] from the register
              * with bits [4:0] all zeroes, but the limit address is bits
              * [31:5] from the register with bits [4:0] all ones.
              */
@@ -12264,7 +12298,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             }
 
             if (matchregion != -1) {
-                /* Multiple regions match -- always a failure (unlike
+                /*
+                 * Multiple regions match -- always a failure (unlike
                  * PMSAv7 where highest-numbered-region wins)
                  */
                 fi->type = ARMFault_Permission;
@@ -12304,7 +12339,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         if (*prot && !xn && !(pxn && !is_user)) {
             *prot |= PAGE_EXEC;
         }
-        /* We don't need to look the attribute up in the MAIR0/MAIR1
+        /*
+         * We don't need to look the attribute up in the MAIR0/MAIR1
          * registers because that only tells us about cacheability.
          */
         if (mregion) {
@@ -12332,7 +12368,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
         v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
         if (access_type == MMU_INST_FETCH) {
-            /* Instruction fetches always use the MMU bank and the
+            /*
+             * Instruction fetches always use the MMU bank and the
              * transaction attribute determined by the fetch address,
              * regardless of CPU state. This is painful for QEMU
              * to handle, because it would mean we need to encode
@@ -12361,14 +12398,16 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                 return true;
             }
         } else {
-            /* For data accesses we always use the MMU bank indicated
+            /*
+             * For data accesses we always use the MMU bank indicated
              * by the current CPU state, but the security attributes
              * might downgrade a secure access to nonsecure.
              */
             if (sattrs.ns) {
                 txattrs->secure = false;
             } else if (!secure) {
-                /* NS access to S memory must fault.
+                /*
+                 * NS access to S memory must fault.
                  * Architecturally we should first check whether the
                  * MPU information for this address indicates that we
                  * are doing an unaligned access to Device memory, which
@@ -12416,8 +12455,10 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
             continue;
         }
         mask = 1 << ((base >> 1) & 0x1f);
-        /* Keep this shift separate from the above to avoid an
-           (undefined) << 32.  */
+        /*
+         * Keep this shift separate from the above to avoid an
+         * (undefined) << 32
+         */
         mask = (mask << 1) - 1;
         if (((base ^ address) & ~mask) == 0) {
             break;
@@ -12477,7 +12518,8 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     return false;
 }
 
-/* Combine either inner or outer cacheability attributes for normal
+/*
+ * Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
  *
@@ -12493,7 +12535,8 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
         /* stage 1 write-through takes precedence */
         return s1;
     } else if (extract32(s2, 2, 2) == 2) {
-        /* stage 2 write-through takes precedence, but the allocation hint
+        /*
+         * stage 2 write-through takes precedence, but the allocation hint
          * is still taken from stage 1
          */
         return (2 << 2) | extract32(s1, 0, 2);
@@ -12502,7 +12545,8 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
     }
 }
 
-/* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
+/*
+ * Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
  * and CombineS1S2Desc()
  *
  * @s1:      Attributes from stage 1 walk
@@ -12552,7 +12596,8 @@ static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
             ret.attrs = 0xc; /* GRE */
         }
 
-        /* Any location for which the resultant memory type is any
+        /*
+         * Any location for which the resultant memory type is any
          * type of Device memory is always treated as Outer Shareable.
          */
         ret.shareability = 2;
@@ -12562,7 +12607,8 @@ static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
                   | combine_cacheattr_nibble(s1lo, s2lo);
 
         if (ret.attrs == 0x44) {
-            /* Any location for which the resultant memory type is Normal
+            /*
+             * Any location for which the resultant memory type is Normal
              * Inner Non-cacheable, Outer Non-cacheable is always treated
              * as Outer Shareable.
              */
@@ -12579,7 +12625,8 @@ static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
 }
 
 
-/* get_phys_addr - get the physical address for this virtual address
+/*
+ * get_phys_addr - get the physical address for this virtual address
  *
  * Find the physical address corresponding to the given virtual address,
  * by doing a translation table walk on MMU based systems or using the
@@ -12614,7 +12661,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
 
     if (mmu_idx != s1_mmu_idx) {
-        /* Call ourselves recursively to do the stage 1 and then stage 2
+        /*
+         * Call ourselves recursively to do the stage 1 and then stage 2
          * translations if mmu_idx is a two-stage regime.
          */
         if (arm_feature(env, ARM_FEATURE_EL2)) {
@@ -12686,14 +12734,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         }
     }
 
-    /* The page table entries may downgrade secure to non-secure, but
+    /*
+     * The page table entries may downgrade secure to non-secure, but
      * cannot upgrade an non-secure translation regime's attributes
      * to secure.
      */
     attrs->secure = regime_is_secure(env, mmu_idx);
     attrs->user = regime_is_user(env, mmu_idx);
 
-    /* Fast Context Switch Extension. This doesn't exist at all in v8.
+    /*
+     * Fast Context Switch Extension. This doesn't exist at all in v8.
      * In v7 and earlier it affects all stage 1 translations.
      */
     if (address < 0x02000000 && mmu_idx != ARMMMUIdx_Stage2
-- 
2.20.1


