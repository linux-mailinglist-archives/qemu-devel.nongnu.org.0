Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D7164BCC7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 20:10:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Adl-0007sl-Ke; Tue, 13 Dec 2022 14:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p5Adi-0007sF-QG; Tue, 13 Dec 2022 14:08:30 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p5Ade-00066B-2G; Tue, 13 Dec 2022 14:08:30 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B15422924;
 Tue, 13 Dec 2022 19:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670958504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+8FhzPg+FJF8Pm4/rHzoK9yBUqnncwNHtOeps6BM5Ps=;
 b=NgJY3tLMvSR0DdRcoSfBXMkWQ75H+m20M3zGy4RMnk/Y446uK5v1myD5nq908dLOk3y7MH
 y0rnQzP00CksB+Rk+T0XZup8i/7MG7y7V++LX07SRD2Uavl7p+jqVqfjDYPf7/djsqURtN
 mDu4sahzh05HgWfVO0sc2ZfayRFOAUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670958504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+8FhzPg+FJF8Pm4/rHzoK9yBUqnncwNHtOeps6BM5Ps=;
 b=Vs7rjY81ffayIRgc/58f5vPpnUShXmHWHMFB9tt35haoiwjJ2bn5UM+F8tPuS51IIqhBCG
 nWQ+3M1oF/yok5Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE17E138F9;
 Tue, 13 Dec 2022 19:08:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GPhFLKTNmGOcBwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 13 Dec 2022 19:08:20 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 1/6] target/arm: Fix checkpatch comment style warnings in
 helper.c
Date: Tue, 13 Dec 2022 16:05:32 -0300
Message-Id: <20221213190537.511-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
References: <20221213190537.511-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix these:

WARNING: Block comments use a leading /* on a separate line
WARNING: Block comments use * on subsequent lines
WARNING: Block comments use a trailing */ on a separate line

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
This is roughly a combination of the following patches from
https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de

[RFC v14 11/80] target/arm: tcg: fix comment style before move to cpu-mmu
[RFC v14 13/80] target/arm: fix style in preparation of new cpregs module
[RFC v14 30/80] target/arm: fixup sve_exception_el code style before move
[RFC v14 32/80] target/arm: fix comments style of fp_exception_el before moving it
[RFC v14 36/80] target/arm: fix style of arm_cpu_do_interrupt functions before move
---
 target/arm/helper.c | 323 +++++++++++++++++++++++++++++---------------
 1 file changed, 215 insertions(+), 108 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d8c8223ec3..77da24b0e8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -83,7 +83,8 @@ uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri)
 static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t v)
 {
-    /* Raw write of a coprocessor register (as needed for migration, etc).
+    /*
+     * Raw write of a coprocessor register (as needed for migration, etc).
      * Note that constant registers are treated as write-ignored; the
      * caller should check for success by whether a readback gives the
      * value written.
@@ -101,7 +102,8 @@ static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
 
 static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
 {
-   /* Return true if the regdef would cause an assertion if you called
+   /*
+    * Return true if the regdef would cause an assertion if you called
     * read_raw_cp_reg() or write_raw_cp_reg() on it (ie if it is a
     * program bug for it not to have the NO_RAW flag).
     * NB that returning false here doesn't necessarily mean that calling
@@ -184,7 +186,8 @@ bool write_list_to_cpustate(ARMCPU *cpu)
         if (ri->type & ARM_CP_NO_RAW) {
             continue;
         }
-        /* Write value and confirm it reads back as written
+        /*
+         * Write value and confirm it reads back as written
          * (to catch read-only registers and partially read-only
          * registers where the incoming migration value doesn't match)
          */
@@ -237,7 +240,8 @@ static gint cpreg_key_compare(gconstpointer a, gconstpointer b)
 
 void init_cpreg_list(ARMCPU *cpu)
 {
-    /* Initialise the cpreg_tuples[] array based on the cp_regs hash.
+    /*
+     * Initialise the cpreg_tuples[] array based on the cp_regs hash.
      * Note that we require cpreg_tuples[] to be sorted by key ID.
      */
     GList *keys;
@@ -279,7 +283,8 @@ static CPAccessResult access_el3_aa32ns(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
-/* Some secure-only AArch32 registers trap to EL3 if used from
+/*
+ * Some secure-only AArch32 registers trap to EL3 if used from
  * Secure EL1 (but are just ordinary UNDEF in other non-EL3 contexts).
  * Note that an access from Secure EL1 can only happen if EL3 is AArch64.
  * We assume that the .access field is set to PL1_RW.
@@ -301,7 +306,8 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
     return CP_ACCESS_TRAP_UNCATEGORIZED;
 }
 
-/* Check for traps to performance monitor registers, which are controlled
+/*
+ * Check for traps to performance monitor registers, which are controlled
  * by MDCR_EL2.TPM for EL2 and MDCR_EL3.TPM for EL3.
  */
 static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -375,7 +381,8 @@ static void fcse_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     ARMCPU *cpu = env_archcpu(env);
 
     if (raw_read(env, ri) != value) {
-        /* Unlike real hardware the qemu TLB uses virtual addresses,
+        /*
+         * Unlike real hardware the qemu TLB uses virtual addresses,
          * not modified virtual addresses, so this causes a TLB flush.
          */
         tlb_flush(CPU(cpu));
@@ -390,7 +397,8 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     if (raw_read(env, ri) != value && !arm_feature(env, ARM_FEATURE_PMSA)
         && !extended_addresses_enabled(env)) {
-        /* For VMSA (when not using the LPAE long descriptor page table
+        /*
+         * For VMSA (when not using the LPAE long descriptor page table
          * format) this register includes the ASID, so do a TLB flush.
          * For PMSA it is purely a process ID and no action is needed.
          */
@@ -582,7 +590,8 @@ static void tlbiipas2is_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 static const ARMCPRegInfo cp_reginfo[] = {
-    /* Define the secure and non-secure FCSE identifier CP registers
+    /*
+     * Define the secure and non-secure FCSE identifier CP registers
      * separately because there is no secure bank in V8 (no _EL3).  This allows
      * the secure register to be properly reset and migrated. There is also no
      * v8 EL1 version of the register so the non-secure instance stands alone.
@@ -597,7 +606,8 @@ static const ARMCPRegInfo cp_reginfo[] = {
       .access = PL1_RW, .secure = ARM_CP_SECSTATE_S,
       .fieldoffset = offsetof(CPUARMState, cp15.fcseidr_s),
       .resetvalue = 0, .writefn = fcse_write, .raw_writefn = raw_write, },
-    /* Define the secure and non-secure context identifier CP registers
+    /*
+     * Define the secure and non-secure context identifier CP registers
      * separately because there is no secure bank in V8 (no _EL3).  This allows
      * the secure register to be properly reset and migrated.  In the
      * non-secure case, the 32-bit register will have reset and migration
@@ -618,7 +628,8 @@ static const ARMCPRegInfo cp_reginfo[] = {
 };
 
 static const ARMCPRegInfo not_v8_cp_reginfo[] = {
-    /* NB: Some of these registers exist in v8 but with more precise
+    /*
+     * NB: Some of these registers exist in v8 but with more precise
      * definitions that don't use CP_ANY wildcards (mostly in v8_cp_reginfo[]).
      */
     /* MMU Domain access control / MPU write buffer control */
@@ -628,7 +639,8 @@ static const ARMCPRegInfo not_v8_cp_reginfo[] = {
       .writefn = dacr_write, .raw_writefn = raw_write,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.dacr_s),
                              offsetoflow32(CPUARMState, cp15.dacr_ns) } },
-    /* ARMv7 allocates a range of implementation defined TLB LOCKDOWN regs.
+    /*
+     * ARMv7 allocates a range of implementation defined TLB LOCKDOWN regs.
      * For v6 and v5, these mappings are overly broad.
      */
     { .name = "TLB_LOCKDOWN", .cp = 15, .crn = 10, .crm = 0,
@@ -646,7 +658,8 @@ static const ARMCPRegInfo not_v8_cp_reginfo[] = {
 };
 
 static const ARMCPRegInfo not_v6_cp_reginfo[] = {
-    /* Not all pre-v6 cores implemented this WFI, so this is slightly
+    /*
+     * Not all pre-v6 cores implemented this WFI, so this is slightly
      * over-broad.
      */
     { .name = "WFI_v5", .cp = 15, .crn = 7, .crm = 8, .opc1 = 0, .opc2 = 2,
@@ -654,12 +667,14 @@ static const ARMCPRegInfo not_v6_cp_reginfo[] = {
 };
 
 static const ARMCPRegInfo not_v7_cp_reginfo[] = {
-    /* Standard v6 WFI (also used in some pre-v6 cores); not in v7 (which
+    /*
+     * Standard v6 WFI (also used in some pre-v6 cores); not in v7 (which
      * is UNPREDICTABLE; we choose to NOP as most implementations do).
      */
     { .name = "WFI_v6", .cp = 15, .crn = 7, .crm = 0, .opc1 = 0, .opc2 = 4,
       .access = PL1_W, .type = ARM_CP_WFI },
-    /* L1 cache lockdown. Not architectural in v6 and earlier but in practice
+    /*
+     * L1 cache lockdown. Not architectural in v6 and earlier but in practice
      * implemented in 926, 946, 1026, 1136, 1176 and 11MPCore. StrongARM and
      * OMAPCP will override this space.
      */
@@ -673,14 +688,16 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
     { .name = "DUMMY", .cp = 15, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = CP_ANY,
       .access = PL1_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
       .resetvalue = 0 },
-    /* We don't implement pre-v7 debug but most CPUs had at least a DBGDIDR;
+    /*
+     * We don't implement pre-v7 debug but most CPUs had at least a DBGDIDR;
      * implementing it as RAZ means the "debug architecture version" bits
      * will read as a reserved value, which should cause Linux to not try
      * to use the debug hardware.
      */
     { .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
       .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
-    /* MMU TLB control. Note that the wildcarding means we cover not just
+    /*
+     * MMU TLB control. Note that the wildcarding means we cover not just
      * the unified TLB ops but also the dside/iside/inner-shareable variants.
      */
     { .name = "TLBIALL", .cp = 15, .crn = 8, .crm = CP_ANY,
@@ -708,7 +725,8 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     /* In ARMv8 most bits of CPACR_EL1 are RES0. */
     if (!arm_feature(env, ARM_FEATURE_V8)) {
-        /* ARMv7 defines bits for unimplemented coprocessors as RAZ/WI.
+        /*
+         * ARMv7 defines bits for unimplemented coprocessors as RAZ/WI.
          * ASEDIS [31] and D32DIS [30] are both UNK/SBZP without VFP.
          * TRCDIS [28] is RAZ/WI since we do not implement a trace macrocell.
          */
@@ -724,7 +742,8 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                 value |= R_CPACR_ASEDIS_MASK;
             }
 
-            /* VFPv3 and upwards with NEON implement 32 double precision
+            /*
+             * VFPv3 and upwards with NEON implement 32 double precision
              * registers (D0-D31).
              */
             if (!cpu_isar_feature(aa32_simd_r32, env_archcpu(env))) {
@@ -766,7 +785,8 @@ static uint64_t cpacr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
 static void cpacr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    /* Call cpacr_write() so that we reset with the correct RAO bits set
+    /*
+     * Call cpacr_write() so that we reset with the correct RAO bits set
      * for our CPU features.
      */
     cpacr_write(env, ri, 0);
@@ -807,7 +827,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     { .name = "MVA_prefetch",
       .cp = 15, .crn = 7, .crm = 13, .opc1 = 0, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NOP },
-    /* We need to break the TB after ISB to execute self-modifying code
+    /*
+     * We need to break the TB after ISB to execute self-modifying code
      * correctly and also to take any pending interrupts immediately.
      * So use arm_cp_write_ignore() function instead of ARM_CP_NOP flag.
      */
@@ -822,7 +843,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ifar_s),
                              offsetof(CPUARMState, cp15.ifar_ns) },
       .resetvalue = 0, },
-    /* Watchpoint Fault Address Register : should actually only be present
+    /*
+     * Watchpoint Fault Address Register : should actually only be present
      * for 1136, 1176, 11MPCore.
      */
     { .name = "WFAR", .cp = 15, .crn = 6, .crm = 0, .opc1 = 0, .opc2 = 1,
@@ -1027,7 +1049,8 @@ static bool event_supported(uint16_t number)
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
-    /* Performance monitor registers user accessibility is controlled
+    /*
+     * Performance monitor registers user accessibility is controlled
      * by PMUSERENR. MDCR_EL2.TPM and MDCR_EL3.TPM allow configurable
      * trapping to EL2 or EL3 for other accesses.
      */
@@ -1115,7 +1138,8 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
     (MDCR_HPME | MDCR_HPMD | MDCR_HPMN | MDCR_HCCD | MDCR_HLP)
 #define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME | MDCR_SCCD)
 
-/* Returns true if the counter (pass 31 for PMCCNTR) should count events using
+/*
+ * Returns true if the counter (pass 31 for PMCCNTR) should count events using
  * the current EL, security state, and register configuration.
  */
 static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
@@ -1479,7 +1503,8 @@ static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
-    /* The value of PMSELR.SEL affects the behavior of PMXEVTYPER and
+    /*
+     * The value of PMSELR.SEL affects the behavior of PMXEVTYPER and
      * PMXEVCNTR. We allow [0..31] to be written to PMSELR here; in the
      * meanwhile, we check PMSELR.SEL when PMXEVTYPER and PMXEVCNTR are
      * accessed.
@@ -1590,7 +1615,8 @@ static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
         env->cp15.c14_pmevtyper[counter] = value & PMXEVTYPER_MASK;
         pmevcntr_op_finish(env, counter);
     }
-    /* Attempts to access PMXEVTYPER are CONSTRAINED UNPREDICTABLE when
+    /*
+     * Attempts to access PMXEVTYPER are CONSTRAINED UNPREDICTABLE when
      * PMSELR value is equal to or greater than the number of implemented
      * counters, but not equal to 0x1f. We opt to behave as a RAZ/WI.
      */
@@ -1691,8 +1717,10 @@ static uint64_t pmevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         return ret;
     } else {
-      /* We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
-       * are CONSTRAINED UNPREDICTABLE. */
+      /*
+       * We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
+       * are CONSTRAINED UNPREDICTABLE.
+       */
         return 0;
     }
 }
@@ -1767,7 +1795,8 @@ static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void vbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    /* Note that even though the AArch64 view of this register has bits
+    /*
+     * Note that even though the AArch64 view of this register has bits
      * [10:0] all RES0 we can only mask the bottom 5, to comply with the
      * architectural requirements for bits which are RES0 only in some
      * contexts. (ARMv8 would permit us to do no masking at all, but ARMv7
@@ -1830,7 +1859,8 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
         valid_mask &= ~SCR_HCE;
 
-        /* On ARMv7, SMD (or SCD as it is called in v7) is only
+        /*
+         * On ARMv7, SMD (or SCD as it is called in v7) is only
          * supported if EL2 exists. The bit is UNK/SBZP when
          * EL2 is unavailable. In QEMU ARMv7, we force it to always zero
          * when EL2 is unavailable.
@@ -1886,7 +1916,8 @@ static uint64_t ccsidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
 
-    /* Acquire the CSSELR index from the bank corresponding to the CCSIDR
+    /*
+     * Acquire the CSSELR index from the bank corresponding to the CCSIDR
      * bank
      */
     uint32_t index = A32_BANKED_REG_GET(env, csselr,
@@ -1961,7 +1992,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     /* the old v6 WFI, UNPREDICTABLE in v7 but we choose to NOP */
     { .name = "NOP", .cp = 15, .crn = 7, .crm = 0, .opc1 = 0, .opc2 = 4,
       .access = PL1_W, .type = ARM_CP_NOP },
-    /* Performance monitors are implementation defined in v7,
+    /*
+     * Performance monitors are implementation defined in v7,
      * but with an ARM recommended set of registers, which we
      * follow.
      *
@@ -2115,7 +2147,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .writefn = csselr_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.csselr_s),
                              offsetof(CPUARMState, cp15.csselr_ns) } },
-    /* Auxiliary ID register: this actually has an IMPDEF value but for now
+    /*
+     * Auxiliary ID register: this actually has an IMPDEF value but for now
      * just RAZ for all cores:
      */
     { .name = "AIDR", .state = ARM_CP_STATE_BOTH,
@@ -2123,7 +2156,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL1_R, .type = ARM_CP_CONST,
       .accessfn = access_aa64_tid1,
       .resetvalue = 0 },
-    /* Auxiliary fault status registers: these also are IMPDEF, and we
+    /*
+     * Auxiliary fault status registers: these also are IMPDEF, and we
      * choose to RAZ/WI for all cores.
      */
     { .name = "AFSR0_EL1", .state = ARM_CP_STATE_BOTH,
@@ -2134,7 +2168,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 1, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .type = ARM_CP_CONST, .resetvalue = 0 },
-    /* MAIR can just read-as-written because we don't implement caches
+    /*
+     * MAIR can just read-as-written because we don't implement caches
      * and so don't need to care about memory attributes.
      */
     { .name = "MAIR_EL1", .state = ARM_CP_STATE_AA64,
@@ -2146,10 +2181,12 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 6, .crn = 10, .crm = 2, .opc2 = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mair_el[3]),
       .resetvalue = 0 },
-    /* For non-long-descriptor page tables these are PRRR and NMRR;
+    /*
+     * For non-long-descriptor page tables these are PRRR and NMRR;
      * regardless they still act as reads-as-written for QEMU.
      */
-     /* MAIR0/1 are defined separately from their 64-bit counterpart which
+     /*
+      * MAIR0/1 are defined separately from their 64-bit counterpart which
       * allows them to assign the correct fieldoffset based on the endianness
       * handled in the field definitions.
       */
@@ -2312,7 +2349,8 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
 static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                        bool isread)
 {
-    /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero.
+    /*
+     * CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero.
      * Writable only at the highest implemented exception level.
      */
     int el = arm_current_el(env);
@@ -2471,7 +2509,8 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
                                        const ARMCPRegInfo *ri,
                                        bool isread)
 {
-    /* The AArch64 register view of the secure physical timer is
+    /*
+     * The AArch64 register view of the secure physical timer is
      * always accessible from EL3, and configurably accessible from
      * Secure EL1.
      */
@@ -2506,7 +2545,8 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
     ARMGenericTimer *gt = &cpu->env.cp15.c14_timer[timeridx];
 
     if (gt->ctl & 1) {
-        /* Timer enabled: calculate and set current ISTATUS, irq, and
+        /*
+         * Timer enabled: calculate and set current ISTATUS, irq, and
          * reset timer to when ISTATUS next has to change
          */
         uint64_t offset = timeridx == GTIMER_VIRT ?
@@ -2529,7 +2569,8 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
             /* Next transition is when we hit cval */
             nexttick = gt->cval + offset;
         }
-        /* Note that the desired next expiry time might be beyond the
+        /*
+         * Note that the desired next expiry time might be beyond the
          * signed-64-bit range of a QEMUTimer -- in this case we just
          * set the timer for as far in the future as possible. When the
          * timer expires we will reset the timer for any remaining period.
@@ -2646,7 +2687,8 @@ static void gt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
         /* Enable toggled */
         gt_recalc_timer(cpu, timeridx);
     } else if ((oldval ^ value) & 2) {
-        /* IMASK toggled: don't need to recalculate,
+        /*
+         * IMASK toggled: don't need to recalculate,
          * just set the interrupt line based on ISTATUS
          */
         int irqstate = (oldval & 4) && !(value & 2);
@@ -2957,7 +2999,8 @@ static void arm_gt_cntfrq_reset(CPUARMState *env, const ARMCPRegInfo *opaque)
 }
 
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
-    /* Note that CNTFRQ is purely reads-as-written for the benefit
+    /*
+     * Note that CNTFRQ is purely reads-as-written for the benefit
      * of software; writing it doesn't actually change the timer frequency.
      * Our reset value matches the fixed frequency we implement the timer at.
      */
@@ -3120,7 +3163,8 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .readfn = gt_virt_redir_cval_read, .raw_readfn = raw_read,
       .writefn = gt_virt_redir_cval_write, .raw_writefn = raw_write,
     },
-    /* Secure timer -- this is actually restricted to only EL3
+    /*
+     * Secure timer -- this is actually restricted to only EL3
      * and configurably Secure-EL1 via the accessfn.
      */
     { .name = "CNTPS_TVAL_EL1", .state = ARM_CP_STATE_AA64,
@@ -3159,7 +3203,8 @@ static CPAccessResult e2h_access(CPUARMState *env, const ARMCPRegInfo *ri,
 
 #else
 
-/* In user-mode most of the generic timer registers are inaccessible
+/*
+ * In user-mode most of the generic timer registers are inaccessible
  * however modern kernels (4.12+) allow access to cntvct_el0
  */
 
@@ -3167,7 +3212,8 @@ static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
 
-    /* Currently we have no support for QEMUTimer in linux-user so we
+    /*
+     * Currently we have no support for QEMUTimer in linux-user so we
      * can't call gt_get_countervalue(env), instead we directly
      * call the lower level functions.
      */
@@ -3208,7 +3254,8 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     if (ri->opc2 & 4) {
-        /* The ATS12NSO* operations must trap to EL3 or EL2 if executed in
+        /*
+         * The ATS12NSO* operations must trap to EL3 or EL2 if executed in
          * Secure EL1 (which can only happen if EL3 is AArch64).
          * They are simply UNDEF if executed from NS EL1.
          * They function normally from EL2 or EL3.
@@ -3369,7 +3416,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
             }
         }
     } else {
-        /* fsr is a DFSR/IFSR value for the short descriptor
+        /*
+         * fsr is a DFSR/IFSR value for the short descriptor
          * translation table format (with WnR always clear).
          * Convert it to a 32-bit PAR.
          */
@@ -3658,7 +3706,8 @@ static void pmsav7_rgnr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
-    /* Reset for all these registers is handled in arm_cpu_reset(),
+    /*
+     * Reset for all these registers is handled in arm_cpu_reset(),
      * because the PMSAv7 is also used by M-profile CPUs, which do
      * not register cpregs but still need the state to be reset.
      */
@@ -3759,7 +3808,8 @@ static void vmsa_ttbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 
     if (arm_feature(env, ARM_FEATURE_LPAE)) {
-        /* With LPAE the TTBCR could result in a change of ASID
+        /*
+         * With LPAE the TTBCR could result in a change of ASID
          * via the TTBCR.A1 bit, so do a TLB flush.
          */
         tlb_flush(CPU(cpu));
@@ -3876,7 +3926,8 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
                              offsetoflow32(CPUARMState, cp15.tcr_el[1])} },
 };
 
-/* Note that unlike TTBCR, writing to TTBCR2 does not require flushing
+/*
+ * Note that unlike TTBCR, writing to TTBCR2 does not require flushing
  * qemu tlbs nor adjusting cached masks.
  */
 static const ARMCPRegInfo ttbcr2_reginfo = {
@@ -3914,7 +3965,8 @@ static void omap_wfi_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void omap_cachemaint_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
-    /* On OMAP there are registers indicating the max/min index of dcache lines
+    /*
+     * On OMAP there are registers indicating the max/min index of dcache lines
      * containing a dirty line; cache flush operations have to reset these.
      */
     env->cp15.c15_i_max = 0x000;
@@ -3946,7 +3998,8 @@ static const ARMCPRegInfo omap_cp_reginfo[] = {
       .crm = 8, .opc1 = 0, .opc2 = 0, .access = PL1_RW,
       .type = ARM_CP_NO_RAW,
       .readfn = arm_cp_read_zero, .writefn = omap_wfi_write, },
-    /* TODO: Peripheral port remap register:
+    /*
+     * TODO: Peripheral port remap register:
      * On OMAP2 mcr p15, 0, rn, c15, c2, 4 sets up the interrupt controller
      * base address at $rn & ~0xfff and map size of 0x200 << ($rn & 0xfff),
      * when MMU is off.
@@ -3975,7 +4028,8 @@ static const ARMCPRegInfo xscale_cp_reginfo[] = {
       .cp = 15, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 1, .access = PL1_RW,
       .fieldoffset = offsetof(CPUARMState, cp15.c1_xscaleauxcr),
       .resetvalue = 0, },
-    /* XScale specific cache-lockdown: since we have no cache we NOP these
+    /*
+     * XScale specific cache-lockdown: since we have no cache we NOP these
      * and hope the guest does not really rely on cache behaviour.
      */
     { .name = "XSCALE_LOCK_ICACHE_LINE",
@@ -3993,7 +4047,8 @@ static const ARMCPRegInfo xscale_cp_reginfo[] = {
 };
 
 static const ARMCPRegInfo dummy_c15_cp_reginfo[] = {
-    /* RAZ/WI the whole crn=15 space, when we don't have a more specific
+    /*
+     * RAZ/WI the whole crn=15 space, when we don't have a more specific
      * implementation of this implementation-defined space.
      * Ideally this should eventually disappear in favour of actually
      * implementing the correct behaviour for all cores.
@@ -4033,7 +4088,8 @@ static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
 };
 
 static const ARMCPRegInfo cache_test_clean_cp_reginfo[] = {
-    /* The cache test-and-clean instructions always return (1 << 30)
+    /*
+     * The cache test-and-clean instructions always return (1 << 30)
      * to indicate that there are no dirty cache lines.
      */
     { .name = "TC_DCACHE", .cp = 15, .crn = 7, .crm = 10, .opc1 = 0, .opc2 = 3,
@@ -4069,7 +4125,8 @@ static uint64_t mpidr_read_val(CPUARMState *env)
 
     if (arm_feature(env, ARM_FEATURE_V7MP)) {
         mpidr |= (1U << 31);
-        /* Cores which are uniprocessor (non-coherent)
+        /*
+         * Cores which are uniprocessor (non-coherent)
          * but still implement the MP extensions set
          * bit 30. (For instance, Cortex-R5).
          */
@@ -4271,7 +4328,8 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
-/* See: D4.7.2 TLB maintenance requirements and the TLB maintenance instructions
+/*
+ * See: D4.7.2 TLB maintenance requirements and the TLB maintenance instructions
  * Page D4-1736 (DDI0487A.b)
  */
 
@@ -4404,7 +4462,8 @@ static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
-    /* Invalidate by VA, EL2
+    /*
+     * Invalidate by VA, EL2
      * Currently handles both VAE2 and VALE2, since we don't support
      * flush-last-level-only.
      */
@@ -4418,7 +4477,8 @@ static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
-    /* Invalidate by VA, EL3
+    /*
+     * Invalidate by VA, EL3
      * Currently handles both VAE3 and VALE3, since we don't support
      * flush-last-level-only.
      */
@@ -4443,7 +4503,8 @@ static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
-    /* Invalidate by VA, EL1&0 (AArch64 version).
+    /*
+     * Invalidate by VA, EL1&0 (AArch64 version).
      * Currently handles all of VAE1, VAAE1, VAALE1 and VALE1,
      * since we don't support flush-for-specific-ASID-only or
      * flush-last-level-only.
@@ -4764,7 +4825,8 @@ static CPAccessResult sp_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                     bool isread)
 {
     if (!(env->pstate & PSTATE_SP)) {
-        /* Access to SP_EL0 is undefined if it's being used as
+        /*
+         * Access to SP_EL0 is undefined if it's being used as
          * the stack pointer.
          */
         return CP_ACCESS_TRAP_UNCATEGORIZED;
@@ -4804,7 +4866,8 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 
     if (raw_read(env, ri) == value) {
-        /* Skip the TLB flush if nothing actually changed; Linux likes
+        /*
+         * Skip the TLB flush if nothing actually changed; Linux likes
          * to do a lot of pointless SCTLR writes.
          */
         return;
@@ -4872,7 +4935,8 @@ static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 static const ARMCPRegInfo v8_cp_reginfo[] = {
-    /* Minimal set of EL0-visible registers. This will need to be expanded
+    /*
+     * Minimal set of EL0-visible registers. This will need to be expanded
      * significantly for system emulation of AArch64 CPUs.
      */
     { .name = "NZCV", .state = ARM_CP_STATE_AA64,
@@ -5155,7 +5219,8 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 0, .opc2 = 0,
       .access = PL1_RW,
       .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_SVC]) },
-    /* We rely on the access checks not allowing the guest to write to the
+    /*
+     * We rely on the access checks not allowing the guest to write to the
      * state field when SPSel indicates that it's being used as the stack
      * pointer.
      */
@@ -5233,7 +5298,8 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         valid_mask &= ~HCR_HCD;
     } else if (cpu->psci_conduit != QEMU_PSCI_CONDUIT_SMC) {
-        /* Architecturally HCR.TSC is RES0 if EL3 is not implemented.
+        /*
+         * Architecturally HCR.TSC is RES0 if EL3 is not implemented.
          * However, if we're using the SMC PSCI conduit then QEMU is
          * effectively acting like EL3 firmware and so the guest at
          * EL2 should retain the ability to prevent EL1 from being
@@ -5657,7 +5723,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2is_write },
 #ifndef CONFIG_USER_ONLY
-    /* Unlike the other EL2-related AT operations, these must
+    /*
+     * Unlike the other EL2-related AT operations, these must
      * UNDEF from EL3 if EL2 is not implemented, which is why we
      * define them here rather than with the rest of the AT ops.
      */
@@ -5671,7 +5738,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .access = PL2_W, .accessfn = at_s1e2_access,
       .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = ats_write64 },
-    /* The AArch32 ATS1H* operations are CONSTRAINED UNPREDICTABLE
+    /*
+     * The AArch32 ATS1H* operations are CONSTRAINED UNPREDICTABLE
      * if EL2 is not implemented; we choose to UNDEF. Behaviour at EL3
      * with SCR.NS == 0 outside Monitor mode is UNPREDICTABLE; we choose
      * to behave as if SCR.NS was 1.
@@ -5684,7 +5752,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .writefn = ats1h_write, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC },
     { .name = "CNTHCTL_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 1, .opc2 = 0,
-      /* ARMv7 requires bit 0 and 1 to reset to 1. ARMv8 defines the
+      /*
+       * ARMv7 requires bit 0 and 1 to reset to 1. ARMv8 defines the
        * reset values as IMPDEF. We choose to reset to 3 to comply with
        * both ARMv7 and ARMv8.
        */
@@ -5767,7 +5836,8 @@ static const ARMCPRegInfo el2_sec_cp_reginfo[] = {
 static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
-    /* The NSACR is RW at EL3, and RO for NS EL1 and NS EL2.
+    /*
+     * The NSACR is RW at EL3, and RO for NS EL1 and NS EL2.
      * At Secure EL1 it traps to EL3 or EL2.
      */
     if (arm_current_el(env) == 3) {
@@ -6571,7 +6641,8 @@ static void define_pmu_regs(ARMCPU *cpu)
     }
 }
 
-/* We don't know until after realize whether there's a GICv3
+/*
+ * We don't know until after realize whether there's a GICv3
  * attached, and that is what registers the gicv3 sysregs.
  * So we have to fill in the GIC fields in ID_PFR/ID_PFR1_EL1/ID_AA64PFR0_EL1
  * at runtime.
@@ -6600,7 +6671,8 @@ static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
 }
 #endif
 
-/* Shared logic between LORID and the rest of the LOR* registers.
+/*
+ * Shared logic between LORID and the rest of the LOR* registers.
  * Secure state exclusion has already been dealt with.
  */
 static CPAccessResult access_lor_ns(CPUARMState *env,
@@ -7427,7 +7499,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 
     define_arm_cp_regs(cpu, cp_reginfo);
     if (!arm_feature(env, ARM_FEATURE_V8)) {
-        /* Must go early as it is full of wildcards that may be
+        /*
+         * Must go early as it is full of wildcards that may be
          * overridden by later definitions.
          */
         define_arm_cp_regs(cpu, not_v8_cp_reginfo);
@@ -7441,7 +7514,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa32_tid3,
               .resetvalue = cpu->isar.id_pfr0 },
-            /* ID_PFR1 is not a plain ARM_CP_CONST because we don't know
+            /*
+             * ID_PFR1 is not a plain ARM_CP_CONST because we don't know
              * the value of the GIC field until after we define these regs.
              */
             { .name = "ID_PFR1", .state = ARM_CP_STATE_BOTH,
@@ -7975,7 +8049,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 
         define_arm_cp_regs(cpu, el3_regs);
     }
-    /* The behaviour of NSACR is sufficiently various that we don't
+    /*
+     * The behaviour of NSACR is sufficiently various that we don't
      * try to describe it in a single reginfo:
      *  if EL3 is 64 bit, then trap to EL3 from S EL1,
      *     reads as constant 0xc00 from NS EL1 and NS EL2
@@ -8067,13 +8142,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa32_jazelle, cpu)) {
         define_arm_cp_regs(cpu, jazelle_regs);
     }
-    /* Slightly awkwardly, the OMAP and StrongARM cores need all of
+    /*
+     * Slightly awkwardly, the OMAP and StrongARM cores need all of
      * cp15 crn=0 to be writes-ignored, whereas for other cores they should
      * be read-only (ie write causes UNDEF exception).
      */
     {
         ARMCPRegInfo id_pre_v8_midr_cp_reginfo[] = {
-            /* Pre-v8 MIDR space.
+            /*
+             * Pre-v8 MIDR space.
              * Note that the MIDR isn't a simple constant register because
              * of the TI925 behaviour where writes to another register can
              * cause the MIDR value to change.
@@ -8173,7 +8250,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         if (arm_feature(env, ARM_FEATURE_OMAPCP) ||
             arm_feature(env, ARM_FEATURE_STRONGARM)) {
             size_t i;
-            /* Register the blanket "writes ignored" value first to cover the
+            /*
+             * Register the blanket "writes ignored" value first to cover the
              * whole space. Then update the specific ID registers to allow write
              * access, so that they ignore writes rather than causing them to
              * UNDEF.
@@ -8310,7 +8388,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .raw_writefn = raw_write,
         };
         if (arm_feature(env, ARM_FEATURE_XSCALE)) {
-            /* Normally we would always end the TB on an SCTLR write, but Linux
+            /*
+             * Normally we would always end the TB on an SCTLR write, but Linux
              * arch/arm/mach-pxa/sleep.S expects two instructions following
              * an MMU enable to execute from cache.  Imitate this behaviour.
              */
@@ -8705,7 +8784,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                                        const ARMCPRegInfo *r, void *opaque)
 {
-    /* Define implementations of coprocessor registers.
+    /*
+     * Define implementations of coprocessor registers.
      * We store these in a hashtable because typically
      * there are less than 150 registers in a space which
      * is 16*16*16*8*8 = 262144 in size.
@@ -8772,7 +8852,8 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
     default:
         g_assert_not_reached();
     }
-    /* The AArch64 pseudocode CheckSystemAccess() specifies that op1
+    /*
+     * The AArch64 pseudocode CheckSystemAccess() specifies that op1
      * encodes a minimum access level for the register. We roll this
      * runtime check into our general permission check code, so check
      * here that the reginfo's specified permissions are strict enough
@@ -8814,7 +8895,8 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
         assert((r->access & ~mask) == 0);
     }
 
-    /* Check that the register definition has enough info to handle
+    /*
+     * Check that the register definition has enough info to handle
      * reads and writes if they are permitted.
      */
     if (!(r->type & (ARM_CP_SPECIAL_MASK | ARM_CP_CONST))) {
@@ -8839,7 +8921,8 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                         continue;
                     }
                     if (state == ARM_CP_STATE_AA32) {
-                        /* Under AArch32 CP registers can be common
+                        /*
+                         * Under AArch32 CP registers can be common
                          * (same for secure and non-secure world) or banked.
                          */
                         char *name;
@@ -8865,8 +8948,10 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                             g_assert_not_reached();
                         }
                     } else {
-                        /* AArch64 registers get mapped to non-secure instance
-                         * of AArch32 */
+                        /*
+                         * AArch64 registers get mapped to non-secure instance
+                         * of AArch32
+                         */
                         add_cpreg_to_hashtable(cpu, r, opaque, state,
                                                ARM_CP_SECSTATE_NS,
                                                crm, opc1, opc2, r->name);
@@ -8952,7 +9037,8 @@ void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *opaque)
 
 static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
 {
-    /* Return true if it is not valid for us to switch to
+    /*
+     * Return true if it is not valid for us to switch to
      * this CPU mode (ie all the UNPREDICTABLE cases in
      * the ARM ARM CPSRWriteByInstr pseudocode).
      */
@@ -8973,10 +9059,12 @@ static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
     case ARM_CPU_MODE_UND:
     case ARM_CPU_MODE_IRQ:
     case ARM_CPU_MODE_FIQ:
-        /* Note that we don't implement the IMPDEF NSACR.RFR which in v7
+        /*
+         * Note that we don't implement the IMPDEF NSACR.RFR which in v7
          * allows FIQ mode to be Secure-only. (In v8 this doesn't exist.)
          */
-        /* If HCR.TGE is set then changes from Monitor to NS PL1 via MSR
+        /*
+         * If HCR.TGE is set then changes from Monitor to NS PL1 via MSR
          * and CPS are treated as illegal mode changes.
          */
         if (write_type == CPSRWriteByInstr &&
@@ -9034,7 +9122,8 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
         env->GE = (val >> 16) & 0xf;
     }
 
-    /* In a V7 implementation that includes the security extensions but does
+    /*
+     * In a V7 implementation that includes the security extensions but does
      * not include Virtualization Extensions the SCR.FW and SCR.AW bits control
      * whether non-secure software is allowed to change the CPSR_F and CPSR_A
      * bits respectively.
@@ -9050,7 +9139,8 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
         changed_daif = (env->daif ^ val) & mask;
 
         if (changed_daif & CPSR_A) {
-            /* Check to see if we are allowed to change the masking of async
+            /*
+             * Check to see if we are allowed to change the masking of async
              * abort exceptions from a non-secure state.
              */
             if (!(env->cp15.scr_el3 & SCR_AW)) {
@@ -9062,7 +9152,8 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
         }
 
         if (changed_daif & CPSR_F) {
-            /* Check to see if we are allowed to change the masking of FIQ
+            /*
+             * Check to see if we are allowed to change the masking of FIQ
              * exceptions from a non-secure state.
              */
             if (!(env->cp15.scr_el3 & SCR_FW)) {
@@ -9072,7 +9163,8 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
                 mask &= ~CPSR_F;
             }
 
-            /* Check whether non-maskable FIQ (NMFI) support is enabled.
+            /*
+             * Check whether non-maskable FIQ (NMFI) support is enabled.
              * If this bit is set software is not allowed to mask
              * FIQs, but is allowed to set CPSR_F to 0.
              */
@@ -9092,7 +9184,8 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     if (write_type != CPSRWriteRaw &&
         ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
         if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR) {
-            /* Note that we can only get here in USR mode if this is a
+            /*
+             * Note that we can only get here in USR mode if this is a
              * gdb stub write; for this case we follow the architectural
              * behaviour for guest writes in USR mode of ignoring an attempt
              * to switch mode. (Those are caught by translate.c for writes
@@ -9100,7 +9193,8 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
              */
             mask &= ~CPSR_M;
         } else if (bad_mode_switch(env, val & CPSR_M, write_type)) {
-            /* Attempt to switch to an invalid mode: this is UNPREDICTABLE in
+            /*
+             * Attempt to switch to an invalid mode: this is UNPREDICTABLE in
              * v7, and has defined behaviour in v8:
              *  + leave CPSR.M untouched
              *  + allow changes to the other CPSR fields
@@ -9243,7 +9337,8 @@ static void switch_mode(CPUARMState *env, int mode)
     env->regs[14] = env->banked_r14[r14_bank_number(mode)];
 }
 
-/* Physical Interrupt Target EL Lookup Table
+/*
+ * Physical Interrupt Target EL Lookup Table
  *
  * [ From ARM ARM section G1.13.4 (Table G1-15) ]
  *
@@ -9317,7 +9412,8 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         rw = ((env->cp15.scr_el3 & SCR_RW) == SCR_RW);
     } else {
-        /* Either EL2 is the highest EL (and so the EL2 register width
+        /*
+         * Either EL2 is the highest EL (and so the EL2 register width
          * is given by is64); or there is no EL2 or EL3, in which case
          * the value of 'rw' does not affect the table lookup anyway.
          */
@@ -9592,7 +9688,8 @@ void aarch64_sync_64_to_32(CPUARMState *env)
         env->banked_r13[bank_number(ARM_CPU_MODE_UND)] = env->xregs[23];
     }
 
-    /* Registers x24-x30 are mapped to r8-r14 in FIQ mode.  If we are in FIQ
+    /*
+     * Registers x24-x30 are mapped to r8-r14 in FIQ mode.  If we are in FIQ
      * mode, then we can copy to r8-r14.  Otherwise, we copy to the
      * FIQ bank for r8-r14.
      */
@@ -9938,7 +10035,8 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         /* High vectors. When enabled, base address cannot be remapped. */
         addr += 0xffff0000;
     } else {
-        /* ARM v7 architectures provide a vector base address register to remap
+        /*
+         * ARM v7 architectures provide a vector base address register to remap
          * the interrupt vector table.
          * This register is only followed in non-monitor mode, and is banked.
          * Note: only bits 31:5 are valid.
@@ -10072,7 +10170,8 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
 
     if (cur_el < new_el) {
-        /* Entry vector offset depends on whether the implemented EL
+        /*
+         * Entry vector offset depends on whether the implemented EL
          * immediately lower than the target level is using AArch32 or AArch64
          */
         bool is_aa64;
@@ -10273,7 +10372,8 @@ static void handle_semihosting(CPUState *cs)
 }
 #endif
 
-/* Handle a CPU exception for A and R profile CPUs.
+/*
+ * Handle a CPU exception for A and R profile CPUs.
  * Do any appropriate logging, handle PSCI calls, and then hand off
  * to the AArch64-entry or AArch32-entry function depending on the
  * target exception level's register width.
@@ -10318,7 +10418,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
     }
 #endif
 
-    /* Hooks may change global state so BQL should be held, also the
+    /*
+     * Hooks may change global state so BQL should be held, also the
      * BQL needs to be held for any modification of
      * cs->interrupt_request.
      */
@@ -10599,9 +10700,11 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     };
 }
 
-/* Note that signed overflow is undefined in C.  The following routines are
-   careful to use unsigned types where modulo arithmetic is required.
-   Failure to do so _will_ break on newer gcc.  */
+/*
+ * Note that signed overflow is undefined in C.  The following routines are
+ * careful to use unsigned types where modulo arithmetic is required.
+ * Failure to do so _will_ break on newer gcc.
+ */
 
 /* Signed saturating arithmetic.  */
 
@@ -10843,7 +10946,8 @@ uint32_t HELPER(sel_flags)(uint32_t flags, uint32_t a, uint32_t b)
     return (a & mask) | (b & ~mask);
 }
 
-/* CRC helpers.
+/*
+ * CRC helpers.
  * The upper bytes of val (above the number specified by 'bytes') must have
  * been zeroed out by the caller.
  */
@@ -10867,7 +10971,8 @@ uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
 
-/* Return the exception level to which FP-disabled exceptions should
+/*
+ * Return the exception level to which FP-disabled exceptions should
  * be taken, or 0 if FP is enabled.
  */
 int fp_exception_el(CPUARMState *env, int cur_el)
@@ -10875,7 +10980,8 @@ int fp_exception_el(CPUARMState *env, int cur_el)
 #ifndef CONFIG_USER_ONLY
     uint64_t hcr_el2;
 
-    /* CPACR and the CPTR registers don't exist before v6, so FP is
+    /*
+     * CPACR and the CPTR registers don't exist before v6, so FP is
      * always accessible
      */
     if (!arm_feature(env, ARM_FEATURE_V6)) {
@@ -10900,7 +11006,8 @@ int fp_exception_el(CPUARMState *env, int cur_el)
 
     hcr_el2 = arm_hcr_el2_eff(env);
 
-    /* The CPACR controls traps to EL1, or PL1 if we're 32 bit:
+    /*
+     * The CPACR controls traps to EL1, or PL1 if we're 32 bit:
      * 0, 2 : trap EL0 and EL1/PL1 accesses
      * 1    : trap only EL0 accesses
      * 3    : trap no accesses
-- 
2.35.3


