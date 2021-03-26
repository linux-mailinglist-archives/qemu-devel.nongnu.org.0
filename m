Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF5534AF83
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 20:48:02 +0100 (CET)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsR7-0001A6-Qh
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 15:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsGy-00067j-1Y
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:45322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsGu-0000rv-QB
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80013AF26;
 Fri, 26 Mar 2021 19:37:17 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 11/65] target/arm: tcg: fix comment style before move to
 cpu-mmu
Date: Fri, 26 Mar 2021 20:36:07 +0100
Message-Id: <20210326193701.5981-12-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

before exporting some functionality from helper.c into a new module,
fix the comment style of those functions.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/tcg/helper.c | 152 ++++++++++++++++++++++++++--------------
 1 file changed, 101 insertions(+), 51 deletions(-)

diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index d9220be7c5..d18dc6cbfa 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -10154,7 +10154,8 @@ static inline bool regime_translation_disabled(CPUARMState *env,
             return false;
         case 0:
         default:
-            /* HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
+            /*
+             * HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
              * we warned about that in armv7m_nvic.c when the guest set it.
              */
             return true;
@@ -10208,7 +10209,8 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 #endif /* !CONFIG_USER_ONLY */
 
-/* Convert a possible stage1+2 MMU index into the appropriate
+/*
+ * Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
 static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
@@ -10279,7 +10281,8 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
-/* Translate section/page access permissions to page
+/*
+ * Translate section/page access permissions to page
  * R/W protection flags
  *
  * @env:         CPUARMState
@@ -10335,7 +10338,8 @@ static inline int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
     }
 }
 
-/* Translate section/page access permissions to page
+/*
+ * Translate section/page access permissions to page
  * R/W protection flags.
  *
  * @ap:      The 2-bit simple AP (AP[2:1])
@@ -10363,7 +10367,8 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
-/* Translate S2 section/page access permissions to protection flags
+/*
+ * Translate S2 section/page access permissions to protection flags
  *
  * @env:     CPUARMState
  * @s2ap:    The 2-bit stage2 access permissions (S2AP)
@@ -10411,7 +10416,8 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
     return prot;
 }
 
-/* Translate section/page access permissions to protection flags
+/*
+ * Translate section/page access permissions to protection flags
  *
  * @env:     CPUARMState
  * @mmu_idx: MMU index indicating required translation regime
@@ -10448,7 +10454,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
         return prot_rw;
     }
 
-    /* TODO have_wxn should be replaced with
+    /*
+     * TODO have_wxn should be replaced with
      *   ARM_FEATURE_V8 || (ARM_FEATURE_V7 && ARM_FEATURE_EL2)
      * when ARM_FEATURE_EL2 starts getting set. For now we assume all LPAE
      * compatible processors have EL2, which is required for [U]WXN.
@@ -10720,7 +10727,8 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                     phys_addr = (desc & 0xfffff000) | (address & 0xfff);
                     *page_size = 0x1000;
                 } else {
-                    /* UNPREDICTABLE in ARMv5; we choose to take a
+                    /*
+                     * UNPREDICTABLE in ARMv5; we choose to take a
                      * page translation fault.
                      */
                     fi->type = ARMFault_Translation;
@@ -10786,7 +10794,8 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
     }
     type = (desc & 3);
     if (type == 0 || (type == 3 && !cpu_isar_feature(aa32_pxn, cpu))) {
-        /* Section translation fault, or attempt to use the encoding
+        /*
+         * Section translation fault, or attempt to use the encoding
          * which is Reserved on implementations without PXN.
          */
         fi->type = ARMFault_Translation;
@@ -10891,7 +10900,8 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         }
     }
     if (ns) {
-        /* The NS bit will (as required by the architecture) have no effect if
+        /*
+         * The NS bit will (as required by the architecture) have no effect if
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
@@ -10973,7 +10983,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     return true;
 }
 
-/* Translate from the 4-bit stage 2 representation of
+/*
+ * Translate from the 4-bit stage 2 representation of
  * memory attributes (without cache-allocation hints) to
  * the 8-bit representation of the stage 1 MAIR registers
  * (which includes allocation hints).
@@ -11262,7 +11273,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         stride = 9;
     }
 
-    /* Note that QEMU ignores shareability and cacheability attributes,
+    /*
+     * Note that QEMU ignores shareability and cacheability attributes,
      * so we don't need to do anything with the SH, ORGN, IRGN fields
      * in the TTBCR.  Similarly, TTBCR:A1 selects whether we get the
      * ASID from TTBR0 or TTBR1, but QEMU's TLB doesn't currently
@@ -11271,19 +11283,22 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
@@ -11296,7 +11311,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          */
         level = 4 - (inputsize - 4) / stride;
     } else {
-        /* For stage 2 translations the starting level is specified by the
+        /*
+         * For stage 2 translations the starting level is specified by the
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
          */
         uint32_t sl0 = extract32(tcr->raw_tcr, 6, 2);
@@ -11336,7 +11352,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      */
     descaddr &= ~indexmask;
 
-    /* The address field in the descriptor goes up to bit 39 for ARMv7
+    /*
+     * The address field in the descriptor goes up to bit 39 for ARMv7
      * but up to bit 47 for ARMv8, but we use the descaddrmask
      * up to bit 39 for AArch32, because we don't need other bits in that case
      * to construct next descriptor address (anyway they should be all zeroes).
@@ -11344,7 +11361,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddrmask = ((1ull << (aarch64 ? 48 : 40)) - 1) &
                    ~indexmask_grainsize;
 
-    /* Secure accesses start with the page table in secure memory and
+    /*
+     * Secure accesses start with the page table in secure memory and
      * can be downgraded to non-secure at any step. Non-secure accesses
      * remain non-secure. We implement this by just ORing in the NSTable/NS
      * bits at each step.
@@ -11370,7 +11388,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr = descriptor & descaddrmask;
 
         if ((descriptor & 2) && (level < 3)) {
-            /* Table entry. The top five bits are attributes which may
+            /*
+             * Table entry. The top five bits are attributes which may
              * propagate down through lower levels of the table (and
              * which are all arranged so that 0 means "no effect", so
              * we can gather them up by ORing in the bits at each level).
@@ -11380,7 +11399,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             indexmask = indexmask_grainsize;
             continue;
         }
-        /* Block entry at level 1 or 2, or page entry at level 3.
+        /*
+         * Block entry at level 1 or 2, or page entry at level 3.
          * These are basically the same thing, although the number
          * of bits we pull in from the vaddr varies.
          */
@@ -11402,15 +11422,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
@@ -11437,7 +11459,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
 
     if (ns) {
-        /* The NS bit will (as required by the architecture) have no effect if
+        /*
+         * The NS bit will (as required by the architecture) have no effect if
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
@@ -11491,7 +11514,8 @@ static inline void get_phys_addr_pmsav7_default(CPUARMState *env,
             break;
         }
     } else {
-        /* Default system address map for M profile cores.
+        /*
+         * Default system address map for M profile cores.
          * The architecture specifies which regions are execute-never;
          * at the MPU level no other checks are defined.
          */
@@ -11517,7 +11541,8 @@ static inline void get_phys_addr_pmsav7_default(CPUARMState *env,
 static bool pmsav7_use_background_region(ARMCPU *cpu,
                                          ARMMMUIdx mmu_idx, bool is_user)
 {
-    /* Return true if we should use the default memory map as a
+    /*
+     * Return true if we should use the default memory map as a
      * "background" region if there are no hits against any MPU regions.
      */
     CPUARMState *env = &cpu->env;
@@ -11543,7 +11568,8 @@ static inline bool m_is_ppb_region(CPUARMState *env, uint32_t address)
 
 static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
 {
-    /* True if address is in the M profile system region
+    /*
+     * True if address is in the M profile system region
      * 0xe0000000 - 0xffffffff
      */
     return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
@@ -11565,7 +11591,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
     if (regime_translation_disabled(env, mmu_idx) ||
         m_is_ppb_region(env, address)) {
-        /* MPU disabled or M profile PPB access: use default memory map.
+        /*
+         * MPU disabled or M profile PPB access: use default memory map.
          * The other case which uses the default memory map in the
          * v7M ARM ARM pseudocode is exception vector reads from the vector
          * table. In QEMU those accesses are done in arm_v7m_load_vector(),
@@ -11631,7 +11658,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
                 srdis_mask = srdis ? 0x3 : 0x0;
                 for (i = 2; i <= 8 && rsize < TARGET_PAGE_BITS; i *= 2) {
-                    /* This will check in groups of 2, 4 and then 8, whether
+                    /*
+                     * This will check in groups of 2, 4 and then 8, whether
                      * the subregion bits are consistent. rsize is incremented
                      * back up to give the region size, considering consistent
                      * adjacent subregions as one region. Stop testing if rsize
@@ -11739,7 +11767,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 static bool v8m_is_sau_exempt(CPUARMState *env,
                               uint32_t address, MMUAccessType access_type)
 {
-    /* The architecture specifies that certain address ranges are
+    /*
+     * The architecture specifies that certain address ranges are
      * exempt from v8M SAU/IDAU checks.
      */
     return
@@ -11755,7 +11784,8 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                 V8M_SAttributes *sattrs)
 {
-    /* Look up the security attributes for this address. Compare the
+    /*
+     * Look up the security attributes for this address. Compare the
      * pseudocode SecurityCheck() function.
      * We assume the caller has zero-initialized *sattrs.
      */
@@ -11806,7 +11836,8 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
                         sattrs->subpage = true;
                     }
                     if (sattrs->srvalid) {
-                        /* If we hit in more than one region then we must report
+                        /*
+                         * If we hit in more than one region then we must report
                          * as Secure, not NS-Callable, with no valid region
                          * number info.
                          */
@@ -11864,7 +11895,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                               int *prot, bool *is_subpage,
                               ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
-    /* Perform a PMSAv8 MPU lookup (without also doing the SAU check
+    /*
+     * Perform a PMSAv8 MPU lookup (without also doing the SAU check
      * that a full phys-to-virt translation does).
      * mregion is (if not NULL) set to the region number which matched,
      * or -1 if no region number is returned (MPU off, address did not
@@ -11888,7 +11920,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         *mregion = -1;
     }
 
-    /* Unlike the ARM ARM pseudocode, we don't need to check whether this
+    /*
+     * Unlike the ARM ARM pseudocode, we don't need to check whether this
      * was an exception vector read from the vector table (which is always
      * done using the default system address map), because those accesses
      * are done in arm_v7m_load_vector(), which always does a direct
@@ -11905,7 +11938,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
         for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
             /* region search */
-            /* Note that the base address is bits [31:5] from the register
+            /*
+             * Note that the base address is bits [31:5] from the register
              * with bits [4:0] all zeroes, but the limit address is bits
              * [31:5] from the register with bits [4:0] all ones.
              */
@@ -11941,7 +11975,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             }
 
             if (matchregion != -1) {
-                /* Multiple regions match -- always a failure (unlike
+                /*
+                 * Multiple regions match -- always a failure (unlike
                  * PMSAv7 where highest-numbered-region wins)
                  */
                 fi->type = ARMFault_Permission;
@@ -11981,7 +12016,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         if (*prot && !xn && !(pxn && !is_user)) {
             *prot |= PAGE_EXEC;
         }
-        /* We don't need to look the attribute up in the MAIR0/MAIR1
+        /*
+         * We don't need to look the attribute up in the MAIR0/MAIR1
          * registers because that only tells us about cacheability.
          */
         if (mregion) {
@@ -12009,7 +12045,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
         v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
         if (access_type == MMU_INST_FETCH) {
-            /* Instruction fetches always use the MMU bank and the
+            /*
+             * Instruction fetches always use the MMU bank and the
              * transaction attribute determined by the fetch address,
              * regardless of CPU state. This is painful for QEMU
              * to handle, because it would mean we need to encode
@@ -12038,14 +12075,16 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
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
@@ -12093,8 +12132,10 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
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
@@ -12154,7 +12195,8 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     return false;
 }
 
-/* Combine either inner or outer cacheability attributes for normal
+/*
+ * Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
  *
@@ -12170,7 +12212,8 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
         /* stage 1 write-through takes precedence */
         return s1;
     } else if (extract32(s2, 2, 2) == 2) {
-        /* stage 2 write-through takes precedence, but the allocation hint
+        /*
+         * stage 2 write-through takes precedence, but the allocation hint
          * is still taken from stage 1
          */
         return (2 << 2) | extract32(s1, 0, 2);
@@ -12179,7 +12222,8 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
     }
 }
 
-/* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
+/*
+ * Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
  * and CombineS1S2Desc()
  *
  * @s1:      Attributes from stage 1 walk
@@ -12229,7 +12273,8 @@ static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
             ret.attrs = 0xc; /* GRE */
         }
 
-        /* Any location for which the resultant memory type is any
+        /*
+         * Any location for which the resultant memory type is any
          * type of Device memory is always treated as Outer Shareable.
          */
         ret.shareability = 2;
@@ -12239,7 +12284,8 @@ static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
                   | combine_cacheattr_nibble(s1lo, s2lo);
 
         if (ret.attrs == 0x44) {
-            /* Any location for which the resultant memory type is Normal
+            /*
+             * Any location for which the resultant memory type is Normal
              * Inner Non-cacheable, Outer Non-cacheable is always treated
              * as Outer Shareable.
              */
@@ -12256,7 +12302,8 @@ static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
 }
 
 
-/* get_phys_addr - get the physical address for this virtual address
+/*
+ * get_phys_addr - get the physical address for this virtual address
  *
  * Find the physical address corresponding to the given virtual address,
  * by doing a translation table walk on MMU based systems or using the
@@ -12291,7 +12338,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
 
     if (mmu_idx != s1_mmu_idx) {
-        /* Call ourselves recursively to do the stage 1 and then stage 2
+        /*
+         * Call ourselves recursively to do the stage 1 and then stage 2
          * translations if mmu_idx is a two-stage regime.
          */
         if (arm_feature(env, ARM_FEATURE_EL2)) {
@@ -12363,14 +12411,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
2.26.2


