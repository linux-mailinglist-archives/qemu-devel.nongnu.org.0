Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD02C39BE52
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:17:00 +0200 (CEST)
Received: from localhost ([::1]:36226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDRL-0007gP-S0
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCku-0000Bq-Fx
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:08 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCke-0002Cm-FB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:08 -0400
Received: by mail-wm1-x32f.google.com with SMTP id f20so1516808wmg.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sc/6uajFSwSpb53JElt22XiaxKOlvTHLpMwHaEEN5+g=;
 b=t0vz8HfzwvE8bOXplCvnxf2Mgd1L9NoAhuG7EixVrTsr7QyMgUdVkXMNm5cDs+jzQq
 jLW654pamsz8Ir3ofA8FE1llovuOHNjcrXOhdQWe08TeNvWesi7VU9btFfBqRuUIOc6W
 OMQq/j3bs9yyx6QdK6o+QhNQXJVE3LySa6WbOGMyYq2pClypi2wFaE3Rc9ESkEfOvt9d
 WwWG4P+x4V12w9WJRbE70uZHqS5zn+HWPfVy9T+eFvO5BWhgHKJTPe1GsSXJd2TnIOJ7
 iraXuLyQbDcBCJ1RlxoUafh68SdBIDBJEuc+2zKFmeQvMpUvp/jECA1JKYPhoSNPCvLQ
 3udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sc/6uajFSwSpb53JElt22XiaxKOlvTHLpMwHaEEN5+g=;
 b=HfUWPgUZsuePH7fqGLHdRAp5v9PG5UcTq9JlANviaeAj/N6g79zLmTAy/0XWqofx+y
 6bKq7DoaExPjxETm/k6zii6fvufbliEza/sUhlBbBfMp7ZJcN71eBBF+fFui/I4fPunJ
 urEttUKu2p+5ThRnsjNufbpf/jcRhJaWRBaZ+VzdrVoBZtbknzvrdxLy0aJOsDZ0Tu3H
 VR5RaDT322BBb+No3vsABIMsiLVPTwED3zs1j81ciLKmHlBuwSt9tuw9sZnN1pMu9vam
 HxRFwmFTliwxW34grur+db+IQm7HyJc6VqfqsRVw01oAbuJp4VAJPtLAavpKikVa5ZAD
 EQbg==
X-Gm-Message-State: AOAM530PYXqKI5uUF+PHcXZKOrK0emkB7WkG4l0YGmIpdS+4opCrux4d
 ORdyLYpDo/ALkYCD6c7tDjX7wM6Rur9Mag==
X-Google-Smtp-Source: ABdhPJwapkbpcjgjgv9A+xiJYk1Jr67WiIYtZqEPJ1YWX6XImfMHkwYleVZepI0LYmrgDKslu8AHPg==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr4462577wmd.126.1622824370280; 
 Fri, 04 Jun 2021 09:32:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j18sm7153953wrw.30.2021.06.04.09.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A03961FFB1;
 Fri,  4 Jun 2021 16:53:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 27/99] target/arm: fix style in preparation of new cpregs
 module
Date: Fri,  4 Jun 2021 16:52:00 +0100
Message-Id: <20210604155312.15902-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

in preparation of the creation of a new cpregs module,
fix the style for the to-be-exported code.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h        |  54 ++++---
 target/arm/tcg/helper.c | 310 ++++++++++++++++++++++++++--------------
 2 files changed, 239 insertions(+), 125 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f9ce70e607..af788c7801 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2709,14 +2709,16 @@ typedef struct ARMCPRegInfo ARMCPRegInfo;
 typedef enum CPAccessResult {
     /* Access is permitted */
     CP_ACCESS_OK = 0,
-    /* Access fails due to a configurable trap or enable which would
+    /*
+     * Access fails due to a configurable trap or enable which would
      * result in a categorized exception syndrome giving information about
      * the failing instruction (ie syndrome category 0x3, 0x4, 0x5, 0x6,
      * 0xc or 0x18). The exception is taken to the usual target EL (EL1 or
      * PL1 if in EL0, otherwise to the current EL).
      */
     CP_ACCESS_TRAP = 1,
-    /* Access fails and results in an exception syndrome 0x0 ("uncategorized").
+    /*
+     * Access fails and results in an exception syndrome 0x0 ("uncategorized").
      * Note that this is not a catch-all case -- the set of cases which may
      * result in this failure is specifically defined by the architecture.
      */
@@ -2727,14 +2729,16 @@ typedef enum CPAccessResult {
     /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 */
     CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = 5,
     CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = 6,
-    /* Access fails and results in an exception syndrome for an FP access,
+    /*
+     * Access fails and results in an exception syndrome for an FP access,
      * trapped directly to EL2 or EL3
      */
     CP_ACCESS_TRAP_FP_EL2 = 7,
     CP_ACCESS_TRAP_FP_EL3 = 8,
 } CPAccessResult;
 
-/* Access functions for coprocessor registers. These cannot fail and
+/*
+ * Access functions for coprocessor registers. These cannot fail and
  * may not raise exceptions.
  */
 typedef uint64_t CPReadFn(CPUARMState *env, const ARMCPRegInfo *opaque);
@@ -2753,7 +2757,8 @@ typedef void CPResetFn(CPUARMState *env, const ARMCPRegInfo *opaque);
 struct ARMCPRegInfo {
     /* Name of register (useful mainly for debugging, need not be unique) */
     const char *name;
-    /* Location of register: coprocessor number and (crn,crm,opc1,opc2)
+    /*
+     * Location of register: coprocessor number and (crn,crm,opc1,opc2)
      * tuple. Any of crm, opc1 and opc2 may be CP_ANY to indicate a
      * 'wildcard' field -- any value of that field in the MRC/MCR insn
      * will be decoded to this register. The register read and write
@@ -2784,16 +2789,19 @@ struct ARMCPRegInfo {
     int access;
     /* Security state: ARM_CP_SECSTATE_* bits/values */
     int secure;
-    /* The opaque pointer passed to define_arm_cp_regs_with_opaque() when
+    /*
+     * The opaque pointer passed to define_arm_cp_regs_with_opaque() when
      * this register was defined: can be used to hand data through to the
      * register read/write functions, since they are passed the ARMCPRegInfo*.
      */
     void *opaque;
-    /* Value of this register, if it is ARM_CP_CONST. Otherwise, if
+    /*
+     * Value of this register, if it is ARM_CP_CONST. Otherwise, if
      * fieldoffset is non-zero, the reset value of the register.
      */
     uint64_t resetvalue;
-    /* Offset of the field in CPUARMState for this register.
+    /*
+     * Offset of the field in CPUARMState for this register.
      *
      * This is not needed if either:
      *  1. type is ARM_CP_CONST or one of the ARM_CP_SPECIALs
@@ -2801,7 +2809,8 @@ struct ARMCPRegInfo {
      */
     ptrdiff_t fieldoffset; /* offsetof(CPUARMState, field) */
 
-    /* Offsets of the secure and non-secure fields in CPUARMState for the
+    /*
+     * Offsets of the secure and non-secure fields in CPUARMState for the
      * register if it is banked.  These fields are only used during the static
      * registration of a register.  During hashing the bank associated
      * with a given security state is copied to fieldoffset which is used from
@@ -2814,36 +2823,42 @@ struct ARMCPRegInfo {
      */
     ptrdiff_t bank_fieldoffsets[2];
 
-    /* Function for making any access checks for this register in addition to
+    /*
+     * Function for making any access checks for this register in addition to
      * those specified by the 'access' permissions bits. If NULL, no extra
      * checks required. The access check is performed at runtime, not at
      * translate time.
      */
     CPAccessFn *accessfn;
-    /* Function for handling reads of this register. If NULL, then reads
+    /*
+     * Function for handling reads of this register. If NULL, then reads
      * will be done by loading from the offset into CPUARMState specified
      * by fieldoffset.
      */
     CPReadFn *readfn;
-    /* Function for handling writes of this register. If NULL, then writes
+    /*
+     * Function for handling writes of this register. If NULL, then writes
      * will be done by writing to the offset into CPUARMState specified
      * by fieldoffset.
      */
     CPWriteFn *writefn;
-    /* Function for doing a "raw" read; used when we need to copy
+    /*
+     * Function for doing a "raw" read; used when we need to copy
      * coprocessor state to the kernel for KVM or out for
      * migration. This only needs to be provided if there is also a
      * readfn and it has side effects (for instance clear-on-read bits).
      */
     CPReadFn *raw_readfn;
-    /* Function for doing a "raw" write; used when we need to copy KVM
+    /*
+     * Function for doing a "raw" write; used when we need to copy KVM
      * kernel coprocessor state into userspace, or for inbound
      * migration. This only needs to be provided if there is also a
      * writefn and it masks out "unwritable" bits or has write-one-to-clear
      * or similar behaviour.
      */
     CPWriteFn *raw_writefn;
-    /* Function for resetting the register. If NULL, then reset will be done
+    /*
+     * Function for resetting the register. If NULL, then reset will be done
      * by writing resetvalue to the field specified in fieldoffset. If
      * fieldoffset is 0 then no reset will be done.
      */
@@ -2863,7 +2878,8 @@ struct ARMCPRegInfo {
     CPWriteFn *orig_writefn;
 };
 
-/* Macros which are lvalues for the field in CPUARMState for the
+/*
+ * Macros which are lvalues for the field in CPUARMState for the
  * ARMCPRegInfo *ri.
  */
 #define CPREG_FIELD32(env, ri) \
@@ -2917,12 +2933,14 @@ void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
 /* CPReadFn that can be used for read-as-zero behaviour */
 uint64_t arm_cp_read_zero(CPUARMState *env, const ARMCPRegInfo *ri);
 
-/* CPResetFn that does nothing, for use if no reset is required even
+/*
+ * CPResetFn that does nothing, for use if no reset is required even
  * if fieldoffset is non zero.
  */
 void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *opaque);
 
-/* Return true if this reginfo struct's field in the cpu state struct
+/*
+ * Return true if this reginfo struct's field in the cpu state struct
  * is 64 bits wide.
  */
 static inline bool cpreg_field_is_64bit(const ARMCPRegInfo *ri)
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 7f818e5860..0f4ebcc46f 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -327,7 +327,8 @@ static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
 
 static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
 {
-   /* Return true if the regdef would cause an assertion if you called
+   /*
+    * Return true if the regdef would cause an assertion if you called
     * read_raw_cp_reg() or write_raw_cp_reg() on it (ie if it is a
     * program bug for it not to have the NO_RAW flag).
     * NB that returning false here doesn't necessarily mean that calling
@@ -431,7 +432,7 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
     regidx = *(uint32_t *)key;
     ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
 
-    if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
+    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
         /* The value array need not be initialized at this point */
         cpu->cpreg_array_len++;
@@ -447,7 +448,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
     regidx = *(uint32_t *)key;
     ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
 
-    if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
+    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_array_len++;
     }
 }
@@ -468,7 +469,8 @@ static gint cpreg_key_compare(gconstpointer a, gconstpointer b)
 
 void init_cpreg_list(ARMCPU *cpu)
 {
-    /* Initialise the cpreg_tuples[] array based on the cp_regs hash.
+    /*
+     * Initialise the cpreg_tuples[] array based on the cp_regs hash.
      * Note that we require cpreg_tuples[] to be sorted by key ID.
      */
     GList *keys;
@@ -510,7 +512,8 @@ static CPAccessResult access_el3_aa32ns(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
-/* Some secure-only AArch32 registers trap to EL3 if used from
+/*
+ * Some secure-only AArch32 registers trap to EL3 if used from
  * Secure EL1 (but are just ordinary UNDEF in other non-EL3 contexts).
  * Note that an access from Secure EL1 can only happen if EL3 is AArch64.
  * We assume that the .access field is set to PL1_RW.
@@ -537,7 +540,8 @@ static uint64_t arm_mdcr_el2_eff(CPUARMState *env)
     return arm_is_el2_enabled(env) ? env->cp15.mdcr_el2 : 0;
 }
 
-/* Check for traps to "powerdown debug" registers, which are controlled
+/*
+ * Check for traps to "powerdown debug" registers, which are controlled
  * by MDCR.TDOSA
  */
 static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -557,7 +561,8 @@ static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
-/* Check for traps to "debug ROM" registers, which are controlled
+/*
+ * Check for traps to "debug ROM" registers, which are controlled
  * by MDCR_EL2.TDRA for EL2 but by the more general MDCR_EL3.TDA for EL3.
  */
 static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -577,7 +582,8 @@ static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
-/* Check for traps to general debug registers, which are controlled
+/*
+ * Check for traps to general debug registers, which are controlled
  * by MDCR_EL2.TDA for EL2 and MDCR_EL3.TDA for EL3.
  */
 static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -597,7 +603,8 @@ static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
-/* Check for traps to performance monitor registers, which are controlled
+/*
+ * Check for traps to performance monitor registers, which are controlled
  * by MDCR_EL2.TPM for EL2 and MDCR_EL3.TPM for EL3.
  */
 static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -671,7 +678,8 @@ static void fcse_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     ARMCPU *cpu = env_archcpu(env);
 
     if (raw_read(env, ri) != value) {
-        /* Unlike real hardware the qemu TLB uses virtual addresses,
+        /*
+         * Unlike real hardware the qemu TLB uses virtual addresses,
          * not modified virtual addresses, so this causes a TLB flush.
          */
         tlb_flush(CPU(cpu));
@@ -686,7 +694,8 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     if (raw_read(env, ri) != value && !arm_feature(env, ARM_FEATURE_PMSA)
         && !extended_addresses_enabled(env)) {
-        /* For VMSA (when not using the LPAE long descriptor page table
+        /*
+         * For VMSA (when not using the LPAE long descriptor page table
          * format) this register includes the ASID, so do a TLB flush.
          * For PMSA it is purely a process ID and no action is needed.
          */
@@ -851,7 +860,8 @@ static void tlbimva_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 static const ARMCPRegInfo cp_reginfo[] = {
-    /* Define the secure and non-secure FCSE identifier CP registers
+    /*
+     * Define the secure and non-secure FCSE identifier CP registers
      * separately because there is no secure bank in V8 (no _EL3).  This allows
      * the secure register to be properly reset and migrated. There is also no
      * v8 EL1 version of the register so the non-secure instance stands alone.
@@ -866,7 +876,8 @@ static const ARMCPRegInfo cp_reginfo[] = {
       .access = PL1_RW, .secure = ARM_CP_SECSTATE_S,
       .fieldoffset = offsetof(CPUARMState, cp15.fcseidr_s),
       .resetvalue = 0, .writefn = fcse_write, .raw_writefn = raw_write, },
-    /* Define the secure and non-secure context identifier CP registers
+    /*
+     * Define the secure and non-secure context identifier CP registers
      * separately because there is no secure bank in V8 (no _EL3).  This allows
      * the secure register to be properly reset and migrated.  In the
      * non-secure case, the 32-bit register will have reset and migration
@@ -888,7 +899,8 @@ static const ARMCPRegInfo cp_reginfo[] = {
 };
 
 static const ARMCPRegInfo not_v8_cp_reginfo[] = {
-    /* NB: Some of these registers exist in v8 but with more precise
+    /*
+     * NB: Some of these registers exist in v8 but with more precise
      * definitions that don't use CP_ANY wildcards (mostly in v8_cp_reginfo[]).
      */
     /* MMU Domain access control / MPU write buffer control */
@@ -898,7 +910,8 @@ static const ARMCPRegInfo not_v8_cp_reginfo[] = {
       .writefn = dacr_write, .raw_writefn = raw_write,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.dacr_s),
                              offsetoflow32(CPUARMState, cp15.dacr_ns) } },
-    /* ARMv7 allocates a range of implementation defined TLB LOCKDOWN regs.
+    /*
+     * ARMv7 allocates a range of implementation defined TLB LOCKDOWN regs.
      * For v6 and v5, these mappings are overly broad.
      */
     { .name = "TLB_LOCKDOWN", .cp = 15, .crn = 10, .crm = 0,
@@ -917,7 +930,8 @@ static const ARMCPRegInfo not_v8_cp_reginfo[] = {
 };
 
 static const ARMCPRegInfo not_v6_cp_reginfo[] = {
-    /* Not all pre-v6 cores implemented this WFI, so this is slightly
+    /*
+     * Not all pre-v6 cores implemented this WFI, so this is slightly
      * over-broad.
      */
     { .name = "WFI_v5", .cp = 15, .crn = 7, .crm = 8, .opc1 = 0, .opc2 = 2,
@@ -926,12 +940,14 @@ static const ARMCPRegInfo not_v6_cp_reginfo[] = {
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
@@ -945,14 +961,16 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
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
@@ -981,7 +999,8 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     /* In ARMv8 most bits of CPACR_EL1 are RES0. */
     if (!arm_feature(env, ARM_FEATURE_V8)) {
-        /* ARMv7 defines bits for unimplemented coprocessors as RAZ/WI.
+        /*
+         * ARMv7 defines bits for unimplemented coprocessors as RAZ/WI.
          * ASEDIS [31] and D32DIS [30] are both UNK/SBZP without VFP.
          * TRCDIS [28] is RAZ/WI since we do not implement a trace macrocell.
          */
@@ -994,7 +1013,8 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                 value |= (1 << 31);
             }
 
-            /* VFPv3 and upwards with NEON implement 32 double precision
+            /*
+             * VFPv3 and upwards with NEON implement 32 double precision
              * registers (D0-D31).
              */
             if (!cpu_isar_feature(aa32_simd_r32, env_archcpu(env))) {
@@ -1036,7 +1056,8 @@ static uint64_t cpacr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
 static void cpacr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    /* Call cpacr_write() so that we reset with the correct RAO bits set
+    /*
+     * Call cpacr_write() so that we reset with the correct RAO bits set
      * for our CPU features.
      */
     cpacr_write(env, ri, 0);
@@ -1076,7 +1097,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     { .name = "MVA_prefetch",
       .cp = 15, .crn = 7, .crm = 13, .opc1 = 0, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NOP },
-    /* We need to break the TB after ISB to execute self-modifying code
+    /*
+     * We need to break the TB after ISB to execute self-modifying code
      * correctly and also to take any pending interrupts immediately.
      * So use arm_cp_write_ignore() function instead of ARM_CP_NOP flag.
      */
@@ -1091,7 +1113,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ifar_s),
                              offsetof(CPUARMState, cp15.ifar_ns) },
       .resetvalue = 0, },
-    /* Watchpoint Fault Address Register : should actually only be present
+    /*
+     * Watchpoint Fault Address Register : should actually only be present
      * for 1136, 1176, 11MPCore.
      */
     { .name = "WFAR", .cp = 15, .crn = 6, .crm = 0, .opc1 = 0, .opc2 = 1,
@@ -2492,7 +2515,8 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
 static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                        bool isread)
 {
-    /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero.
+    /*
+     * CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero.
      * Writable only at the highest implemented exception level.
      */
     int el = arm_current_el(env);
@@ -2651,7 +2675,8 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
                                        const ARMCPRegInfo *ri,
                                        bool isread)
 {
-    /* The AArch64 register view of the secure physical timer is
+    /*
+     * The AArch64 register view of the secure physical timer is
      * always accessible from EL3, and configurably accessible from
      * Secure EL1.
      */
@@ -2686,7 +2711,8 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
     ARMGenericTimer *gt = &cpu->env.cp15.c14_timer[timeridx];
 
     if (gt->ctl & 1) {
-        /* Timer enabled: calculate and set current ISTATUS, irq, and
+        /*
+         * Timer enabled: calculate and set current ISTATUS, irq, and
          * reset timer to when ISTATUS next has to change
          */
         uint64_t offset = timeridx == GTIMER_VIRT ?
@@ -2709,7 +2735,8 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
             /* Next transition is when we hit cval */
             nexttick = gt->cval + offset;
         }
-        /* Note that the desired next expiry time might be beyond the
+        /*
+         * Note that the desired next expiry time might be beyond the
          * signed-64-bit range of a QEMUTimer -- in this case we just
          * set the timer for as far in the future as possible. When the
          * timer expires we will reset the timer for any remaining period.
@@ -2826,7 +2853,8 @@ static void gt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
         /* Enable toggled */
         gt_recalc_timer(cpu, timeridx);
     } else if ((oldval ^ value) & 2) {
-        /* IMASK toggled: don't need to recalculate,
+        /*
+         * IMASK toggled: don't need to recalculate,
          * just set the interrupt line based on ISTATUS
          */
         int irqstate = (oldval & 4) && !(value & 2);
@@ -3143,7 +3171,8 @@ static void arm_gt_cntfrq_reset(CPUARMState *env, const ARMCPRegInfo *opaque)
 }
 
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
-    /* Note that CNTFRQ is purely reads-as-written for the benefit
+    /*
+     * Note that CNTFRQ is purely reads-as-written for the benefit
      * of software; writing it doesn't actually change the timer frequency.
      * Our reset value matches the fixed frequency we implement the timer at.
      */
@@ -3306,7 +3335,8 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .readfn = gt_virt_redir_cval_read, .raw_readfn = raw_read,
       .writefn = gt_virt_redir_cval_write, .raw_writefn = raw_write,
     },
-    /* Secure timer -- this is actually restricted to only EL3
+    /*
+     * Secure timer -- this is actually restricted to only EL3
      * and configurably Secure-EL1 via the accessfn.
      */
     { .name = "CNTPS_TVAL_EL1", .state = ARM_CP_STATE_AA64,
@@ -3346,7 +3376,8 @@ static CPAccessResult e2h_access(CPUARMState *env, const ARMCPRegInfo *ri,
 
 #else
 
-/* In user-mode most of the generic timer registers are inaccessible
+/*
+ * In user-mode most of the generic timer registers are inaccessible
  * however modern kernels (4.12+) allow access to cntvct_el0
  */
 
@@ -3354,7 +3385,8 @@ static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
 
-    /* Currently we have no support for QEMUTimer in linux-user so we
+    /*
+     * Currently we have no support for QEMUTimer in linux-user so we
      * can't call gt_get_countervalue(env), instead we directly
      * call the lower level functions.
      */
@@ -3396,7 +3428,8 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     if (ri->opc2 & 4) {
-        /* The ATS12NSO* operations must trap to EL3 or EL2 if executed in
+        /*
+         * The ATS12NSO* operations must trap to EL3 or EL2 if executed in
          * Secure EL1 (which can only happen if EL3 is AArch64).
          * They are simply UNDEF if executed from NS EL1.
          * They function normally from EL2 or EL3.
@@ -3554,7 +3587,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
             }
         }
     } else {
-        /* fsr is a DFSR/IFSR value for the short descriptor
+        /*
+         * fsr is a DFSR/IFSR value for the short descriptor
          * translation table format (with WnR always clear).
          * Convert it to a 32-bit PAR.
          */
@@ -3836,7 +3870,8 @@ static void pmsav7_rgnr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
-    /* Reset for all these registers is handled in arm_cpu_reset(),
+    /*
+     * Reset for all these registers is handled in arm_cpu_reset(),
      * because the PMSAv7 is also used by M-profile CPUs, which do
      * not register cpregs but still need the state to be reset.
      */
@@ -3922,11 +3957,14 @@ static void vmsa_ttbcr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     if (!arm_feature(env, ARM_FEATURE_V8)) {
         if (arm_feature(env, ARM_FEATURE_LPAE) && (value & TTBCR_EAE)) {
-            /* Pre ARMv8 bits [21:19], [15:14] and [6:3] are UNK/SBZP when
-             * using Long-desciptor translation table format */
+            /*
+             * Pre ARMv8 bits [21:19], [15:14] and [6:3] are UNK/SBZP when
+             * using Long-desciptor translation table format
+             */
             value &= ~((7 << 19) | (3 << 14) | (0xf << 3));
         } else if (arm_feature(env, ARM_FEATURE_EL3)) {
-            /* In an implementation that includes the Security Extensions
+            /*
+             * In an implementation that includes the Security Extensions
              * TTBCR has additional fields PD0 [4] and PD1 [5] for
              * Short-descriptor translation table format.
              */
@@ -3936,7 +3974,8 @@ static void vmsa_ttbcr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
     }
 
-    /* Update the masks corresponding to the TCR bank being written
+    /*
+     * Update the masks corresponding to the TCR bank being written
      * Note that we always calculate mask and base_mask, but
      * they are only used for short-descriptor tables (ie if EAE is 0);
      * for long-descriptor tables the TCR fields are used differently
@@ -3954,7 +3993,8 @@ static void vmsa_ttbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     TCR *tcr = raw_ptr(env, ri);
 
     if (arm_feature(env, ARM_FEATURE_LPAE)) {
-        /* With LPAE the TTBCR could result in a change of ASID
+        /*
+         * With LPAE the TTBCR could result in a change of ASID
          * via the TTBCR.A1 bit, so do a TLB flush.
          */
         tlb_flush(CPU(cpu));
@@ -3968,7 +4008,8 @@ static void vmsa_ttbcr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     TCR *tcr = raw_ptr(env, ri);
 
-    /* Reset both the TCR as well as the masks corresponding to the bank of
+    /*
+     * Reset both the TCR as well as the masks corresponding to the bank of
      * the TCR being reset.
      */
     tcr->raw_tcr = 0;
@@ -4100,7 +4141,8 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
-/* Note that unlike TTBCR, writing to TTBCR2 does not require flushing
+/*
+ * Note that unlike TTBCR, writing to TTBCR2 does not require flushing
  * qemu tlbs nor adjusting cached masks.
  */
 static const ARMCPRegInfo ttbcr2_reginfo = {
@@ -4136,7 +4178,8 @@ static void omap_wfi_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void omap_cachemaint_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
-    /* On OMAP there are registers indicating the max/min index of dcache lines
+    /*
+     * On OMAP there are registers indicating the max/min index of dcache lines
      * containing a dirty line; cache flush operations have to reset these.
      */
     env->cp15.c15_i_max = 0x000;
@@ -4168,7 +4211,8 @@ static const ARMCPRegInfo omap_cp_reginfo[] = {
       .crm = 8, .opc1 = 0, .opc2 = 0, .access = PL1_RW,
       .type = ARM_CP_NO_RAW,
       .readfn = arm_cp_read_zero, .writefn = omap_wfi_write, },
-    /* TODO: Peripheral port remap register:
+    /*
+     * TODO: Peripheral port remap register:
      * On OMAP2 mcr p15, 0, rn, c15, c2, 4 sets up the interrupt controller
      * base address at $rn & ~0xfff and map size of 0x200 << ($rn & 0xfff),
      * when MMU is off.
@@ -4198,7 +4242,8 @@ static const ARMCPRegInfo xscale_cp_reginfo[] = {
       .cp = 15, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 1, .access = PL1_RW,
       .fieldoffset = offsetof(CPUARMState, cp15.c1_xscaleauxcr),
       .resetvalue = 0, },
-    /* XScale specific cache-lockdown: since we have no cache we NOP these
+    /*
+     * XScale specific cache-lockdown: since we have no cache we NOP these
      * and hope the guest does not really rely on cache behaviour.
      */
     { .name = "XSCALE_LOCK_ICACHE_LINE",
@@ -4217,7 +4262,8 @@ static const ARMCPRegInfo xscale_cp_reginfo[] = {
 };
 
 static const ARMCPRegInfo dummy_c15_cp_reginfo[] = {
-    /* RAZ/WI the whole crn=15 space, when we don't have a more specific
+    /*
+     * RAZ/WI the whole crn=15 space, when we don't have a more specific
      * implementation of this implementation-defined space.
      * Ideally this should eventually disappear in favour of actually
      * implementing the correct behaviour for all cores.
@@ -4260,7 +4306,8 @@ static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
 };
 
 static const ARMCPRegInfo cache_test_clean_cp_reginfo[] = {
-    /* The cache test-and-clean instructions always return (1 << 30)
+    /*
+     * The cache test-and-clean instructions always return (1 << 30)
      * to indicate that there are no dirty cache lines.
      */
     { .name = "TC_DCACHE", .cp = 15, .crn = 7, .crm = 10, .opc1 = 0, .opc2 = 3,
@@ -4298,7 +4345,8 @@ static uint64_t mpidr_read_val(CPUARMState *env)
 
     if (arm_feature(env, ARM_FEATURE_V7MP)) {
         mpidr |= (1U << 31);
-        /* Cores which are uniprocessor (non-coherent)
+        /*
+         * Cores which are uniprocessor (non-coherent)
          * but still implement the MP extensions set
          * bit 30. (For instance, Cortex-R5).
          */
@@ -4501,7 +4549,8 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
-/* See: D4.7.2 TLB maintenance requirements and the TLB maintenance instructions
+/*
+ * See: D4.7.2 TLB maintenance requirements and the TLB maintenance instructions
  * Page D4-1736 (DDI0487A.b)
  */
 
@@ -4668,7 +4717,8 @@ static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
-    /* Invalidate by VA, EL2
+    /*
+     * Invalidate by VA, EL2
      * Currently handles both VAE2 and VALE2, since we don't support
      * flush-last-level-only.
      */
@@ -4682,7 +4732,8 @@ static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
-    /* Invalidate by VA, EL3
+    /*
+     * Invalidate by VA, EL3
      * Currently handles both VAE3 and VALE3, since we don't support
      * flush-last-level-only.
      */
@@ -4707,7 +4758,8 @@ static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
-    /* Invalidate by VA, EL1&0 (AArch64 version).
+    /*
+     * Invalidate by VA, EL1&0 (AArch64 version).
      * Currently handles all of VAE1, VAAE1, VAALE1 and VALE1,
      * since we don't support flush-for-specific-ASID-only or
      * flush-last-level-only.
@@ -4958,7 +5010,8 @@ static CPAccessResult sp_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                     bool isread)
 {
     if (!(env->pstate & PSTATE_SP)) {
-        /* Access to SP_EL0 is undefined if it's being used as
+        /*
+         * Access to SP_EL0 is undefined if it's being used as
          * the stack pointer.
          */
         return CP_ACCESS_TRAP_UNCATEGORIZED;
@@ -4998,7 +5051,8 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 
     if (raw_read(env, ri) == value) {
-        /* Skip the TLB flush if nothing actually changed; Linux likes
+        /*
+         * Skip the TLB flush if nothing actually changed; Linux likes
          * to do a lot of pointless SCTLR writes.
          */
         return;
@@ -5039,7 +5093,8 @@ static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 static const ARMCPRegInfo v8_cp_reginfo[] = {
-    /* Minimal set of EL0-visible registers. This will need to be expanded
+    /*
+     * Minimal set of EL0-visible registers. This will need to be expanded
      * significantly for system emulation of AArch64 CPUs.
      */
     { .name = "NZCV", .state = ARM_CP_STATE_AA64,
@@ -5314,7 +5369,8 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 0, .opc2 = 0,
       .access = PL1_RW,
       .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_SVC]) },
-    /* We rely on the access checks not allowing the guest to write to the
+    /*
+     * We rely on the access checks not allowing the guest to write to the
      * state field when SPSel indicates that it's being used as the stack
      * pointer.
      */
@@ -5510,7 +5566,8 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         valid_mask &= ~HCR_HCD;
     } else if (cpu->psci_conduit != QEMU_PSCI_CONDUIT_SMC) {
-        /* Architecturally HCR.TSC is RES0 if EL3 is not implemented.
+        /*
+         * Architecturally HCR.TSC is RES0 if EL3 is not implemented.
          * However, if we're using the SMC PSCI conduit then QEMU is
          * effectively acting like EL3 firmware and so the guest at
          * EL2 should retain the ability to prevent EL1 from being
@@ -5772,7 +5829,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "VTCR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
       .access = PL2_RW,
-      /* no .writefn needed as this can't cause an ASID change;
+      /*
+       * no .writefn needed as this can't cause an ASID change;
        * no .raw_writefn or .resetfn needed as we never use mask/base_mask
        */
       .fieldoffset = offsetof(CPUARMState, cp15.vtcr_el2) },
@@ -5846,7 +5904,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .access = PL2_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae2is_write },
 #ifndef CONFIG_USER_ONLY
-    /* Unlike the other EL2-related AT operations, these must
+    /*
+     * Unlike the other EL2-related AT operations, these must
      * UNDEF from EL3 if EL2 is not implemented, which is why we
      * define them here rather than with the rest of the AT ops.
      */
@@ -5858,7 +5917,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 8, .opc2 = 1,
       .access = PL2_W, .accessfn = at_s1e2_access,
       .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC, .writefn = ats_write64 },
-    /* The AArch32 ATS1H* operations are CONSTRAINED UNPREDICTABLE
+    /*
+     * The AArch32 ATS1H* operations are CONSTRAINED UNPREDICTABLE
      * if EL2 is not implemented; we choose to UNDEF. Behaviour at EL3
      * with SCR.NS == 0 outside Monitor mode is UNPREDICTABLE; we choose
      * to behave as if SCR.NS was 1.
@@ -5871,7 +5931,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .writefn = ats1h_write, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC },
     { .name = "CNTHCTL_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 1, .opc2 = 0,
-      /* ARMv7 requires bit 0 and 1 to reset to 1. ARMv8 defines the
+      /*
+       * ARMv7 requires bit 0 and 1 to reset to 1. ARMv8 defines the
        * reset values as IMPDEF. We choose to reset to 3 to comply with
        * both ARMv7 and ARMv8.
        */
@@ -5964,7 +6025,8 @@ static const ARMCPRegInfo el2_sec_cp_reginfo[] = {
 static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
-    /* The NSACR is RW at EL3, and RO for NS EL1 and NS EL2.
+    /*
+     * The NSACR is RW at EL3, and RO for NS EL1 and NS EL2.
      * At Secure EL1 it traps to EL3 or EL2.
      */
     if (arm_current_el(env) == 3) {
@@ -6012,7 +6074,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "TCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 2,
       .access = PL3_RW,
-      /* no .writefn needed as this can't cause an ASID change;
+      /*
+       * no .writefn needed as this can't cause an ASID change;
        * we must provide a .raw_writefn and .resetfn because we handle
        * reset and migration for the AArch32 TTBCR(S), which might be
        * using mask and base_mask.
@@ -6278,7 +6341,8 @@ static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static void oslar_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    /* Writes to OSLAR_EL1 may update the OS lock status, which can be
+    /*
+     * Writes to OSLAR_EL1 may update the OS lock status, which can be
      * read via a bit in OSLSR_EL1.
      */
     int oslock;
@@ -6293,7 +6357,8 @@ static void oslar_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 static const ARMCPRegInfo debug_cp_reginfo[] = {
-    /* DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
+    /*
+     * DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
      * debug components. The AArch64 version of DBGDRAR is named MDRAR_EL1;
      * unlike DBGDRAR it is never accessible from EL0.
      * DBGDSAR is deprecated and must RAZ from v8 anyway, so it has no AArch64
@@ -6315,7 +6380,8 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_tda,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
       .resetvalue = 0 },
-    /* MDCCSR_EL0, aka DBGDSCRint. This is a read-only mirror of MDSCR_EL1.
+    /*
+     * MDCCSR_EL0, aka DBGDSCRint. This is a read-only mirror of MDSCR_EL1.
      * We don't implement the configurable EL0 access.
      */
     { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
@@ -6338,21 +6404,24 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
       .access = PL1_RW, .accessfn = access_tdosa,
       .type = ARM_CP_NOP },
-    /* Dummy DBGVCR: Linux wants to clear this on startup, but we don't
+    /*
+     * Dummy DBGVCR: Linux wants to clear this on startup, but we don't
      * implement vector catch debug events yet.
      */
     { .name = "DBGVCR",
       .cp = 14, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tda,
       .type = ARM_CP_NOP },
-    /* Dummy DBGVCR32_EL2 (which is only for a 64-bit hypervisor
+    /*
+     * Dummy DBGVCR32_EL2 (which is only for a 64-bit hypervisor
      * to save and restore a 32-bit guest's DBGVCR)
      */
     { .name = "DBGVCR32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 2, .opc1 = 4, .crn = 0, .crm = 7, .opc2 = 0,
       .access = PL2_RW, .accessfn = access_tda,
       .type = ARM_CP_NOP },
-    /* Dummy MDCCINT_EL1, since we don't implement the Debug Communications
+    /*
+     * Dummy MDCCINT_EL1, since we don't implement the Debug Communications
      * Channel but Linux may try to access this register. The 32-bit
      * alias is DBGDCCINT.
      */
@@ -6624,7 +6693,8 @@ static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = env_archcpu(env);
     int i = ri->crm;
 
-    /* Bits [63:49] are hardwired to the value of bit [48]; that is, the
+    /*
+     * Bits [63:49] are hardwired to the value of bit [48]; that is, the
      * register reads and behaves as if values written are sign extended.
      * Bits [1:0] are RES0.
      */
@@ -6752,7 +6822,8 @@ static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = env_archcpu(env);
     int i = ri->crm;
 
-    /* BAS[3] is a read-only copy of BAS[2], and BAS[1] a read-only
+    /*
+     * BAS[3] is a read-only copy of BAS[2], and BAS[1] a read-only
      * copy of BAS[0].
      */
     value = deposit64(value, 6, 1, extract64(value, 5, 1));
@@ -6764,7 +6835,8 @@ static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
 static void define_debug_regs(ARMCPU *cpu)
 {
-    /* Define v7 and v8 architectural debug registers.
+    /*
+     * Define v7 and v8 architectural debug registers.
      * These are just dummy implementations for now.
      */
     int i;
@@ -6927,7 +6999,8 @@ static void define_pmu_regs(ARMCPU *cpu)
     }
 }
 
-/* We don't know until after realize whether there's a GICv3
+/*
+ * We don't know until after realize whether there's a GICv3
  * attached, and that is what registers the gicv3 sysregs.
  * So we have to fill in the GIC fields in ID_PFR/ID_PFR1_EL1/ID_AA64PFR0_EL1
  * at runtime.
@@ -6956,7 +7029,8 @@ static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
 }
 #endif
 
-/* Shared logic between LORID and the rest of the LOR* registers.
+/*
+ * Shared logic between LORID and the rest of the LOR* registers.
  * Secure state exclusion has already been dealt with.
  */
 static CPAccessResult access_lor_ns(CPUARMState *env,
@@ -7699,7 +7773,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 
     define_arm_cp_regs(cpu, cp_reginfo);
     if (!arm_feature(env, ARM_FEATURE_V8)) {
-        /* Must go early as it is full of wildcards that may be
+        /*
+         * Must go early as it is full of wildcards that may be
          * overridden by later definitions.
          */
         define_arm_cp_regs(cpu, not_v8_cp_reginfo);
@@ -7713,7 +7788,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa32_tid3,
               .resetvalue = cpu->isar.id_pfr0 },
-            /* ID_PFR1 is not a plain ARM_CP_CONST because we don't know
+            /*
+             * ID_PFR1 is not a plain ARM_CP_CONST because we don't know
              * the value of the GIC field until after we define these regs.
              */
             { .name = "ID_PFR1", .state = ARM_CP_STATE_BOTH,
@@ -7825,7 +7901,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, not_v7_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_V8)) {
-        /* AArch64 ID registers, which all have impdef reset values.
+        /*
+         * AArch64 ID registers, which all have impdef reset values.
          * Note that within the ID register ranges the unused slots
          * must all RAZ, not UNDEF; future architecture versions may
          * define new registers here.
@@ -8149,11 +8226,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             define_one_arm_cp_reg(cpu, &rvbar);
         }
     } else {
-        /* If EL2 is missing but higher ELs are enabled, we need to
+        /*
+         * If EL2 is missing but higher ELs are enabled, we need to
          * register the no_el2 reginfos.
          */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-            /* When EL3 exists but not EL2, VPIDR and VMPIDR take the value
+            /*
+             * When EL3 exists but not EL2, VPIDR and VMPIDR take the value
              * of MIDR_EL1 and MPIDR_EL1.
              */
             ARMCPRegInfo vpidr_regs[] = {
@@ -8193,7 +8272,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 
         define_arm_cp_regs(cpu, el3_regs);
     }
-    /* The behaviour of NSACR is sufficiently various that we don't
+    /*
+     * The behaviour of NSACR is sufficiently various that we don't
      * try to describe it in a single reginfo:
      *  if EL3 is 64 bit, then trap to EL3 from S EL1,
      *     reads as constant 0xc00 from NS EL1 and NS EL2
@@ -8285,13 +8365,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
@@ -8395,7 +8477,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         if (arm_feature(env, ARM_FEATURE_OMAPCP) ||
             arm_feature(env, ARM_FEATURE_STRONGARM)) {
             ARMCPRegInfo *r;
-            /* Register the blanket "writes ignored" value first to cover the
+            /*
+             * Register the blanket "writes ignored" value first to cover the
              * whole space. Then update the specific ID registers to allow write
              * access, so that they ignore writes rather than causing them to
              * UNDEF.
@@ -8757,7 +8840,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
-    /* Private utility function for define_one_arm_cp_reg_with_opaque():
+    /*
+     * Private utility function for define_one_arm_cp_reg_with_opaque():
      * add a single reginfo struct to the hash table.
      */
     uint32_t *key = g_new(uint32_t, 1);
@@ -8766,13 +8850,15 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
 
     r2->name = g_strdup(name);
-    /* Reset the secure state to the specific incoming state.  This is
+    /*
+     * Reset the secure state to the specific incoming state.  This is
      * necessary as the register may have been defined with both states.
      */
     r2->secure = secstate;
 
     if (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1]) {
-        /* Register is banked (using both entries in array).
+        /*
+         * Register is banked (using both entries in array).
          * Overwriting fieldoffset as the array is only used to define
          * banked registers but later only fieldoffset is used.
          */
@@ -8781,7 +8867,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 
     if (state == ARM_CP_STATE_AA32) {
         if (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1]) {
-            /* If the register is banked then we don't need to migrate or
+            /*
+             * If the register is banked then we don't need to migrate or
              * reset the 32-bit instance in certain cases:
              *
              * 1) If the register has both 32-bit and 64-bit instances then we
@@ -8796,15 +8883,15 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                 r2->type |= ARM_CP_ALIAS;
             }
         } else if ((secstate != r->secure) && !ns) {
-            /* The register is not banked so we only want to allow migration of
+            /*
+             * The register is not banked so we only want to allow migration of
              * the non-secure instance.
              */
             r2->type |= ARM_CP_ALIAS;
         }
 
         if (r->state == ARM_CP_STATE_BOTH) {
-            /* We assume it is a cp15 register if the .cp field is left unset.
-             */
+            /* We assume it is a cp15 register if the .cp field is left unset */
             if (r2->cp == 0) {
                 r2->cp = 15;
             }
@@ -8817,7 +8904,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         }
     }
     if (state == ARM_CP_STATE_AA64) {
-        /* To allow abbreviation of ARMCPRegInfo
+        /*
+         * To allow abbreviation of ARMCPRegInfo
          * definitions, we treat cp == 0 as equivalent to
          * the value for "standard guest-visible sysreg".
          * STATE_BOTH definitions are also always "standard
@@ -8835,17 +8923,20 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     if (opaque) {
         r2->opaque = opaque;
     }
-    /* reginfo passed to helpers is correct for the actual access,
+    /*
+     * reginfo passed to helpers is correct for the actual access,
      * and is never ARM_CP_STATE_BOTH:
      */
     r2->state = state;
-    /* Make sure reginfo passed to helpers for wildcarded regs
+    /*
+     * Make sure reginfo passed to helpers for wildcarded regs
      * has the correct crm/opc1/opc2 for this reg, not CP_ANY:
      */
     r2->crm = crm;
     r2->opc1 = opc1;
     r2->opc2 = opc2;
-    /* By convention, for wildcarded registers only the first
+    /*
+     * By convention, for wildcarded registers only the first
      * entry is used for migration; the others are marked as
      * ALIAS so we don't try to transfer the register
      * multiple times. Special registers (ie NOP/WFI) are
@@ -8860,7 +8951,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         r2->type |= ARM_CP_ALIAS | ARM_CP_NO_GDB;
     }
 
-    /* Check that raw accesses are either forbidden or handled. Note that
+    /*
+     * Check that raw accesses are either forbidden or handled. Note that
      * we can't assert this earlier because the setup of fieldoffset for
      * banked registers has to be done first.
      */
@@ -8868,9 +8960,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         assert(!raw_accessors_invalid(r2));
     }
 
-    /* Overriding of an existing definition must be explicitly
-     * requested.
-     */
+    /* Overriding of an existing definition must be explicitly requested. */
     if (!(r->type & ARM_CP_OVERRIDE)) {
         ARMCPRegInfo *oldreg;
         oldreg = g_hash_table_lookup(cpu->cp_regs, key);
@@ -8890,7 +8980,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                                        const ARMCPRegInfo *r, void *opaque)
 {
-    /* Define implementations of coprocessor registers.
+    /*
+     * Define implementations of coprocessor registers.
      * We store these in a hashtable because typically
      * there are less than 150 registers in a space which
      * is 16*16*16*8*8 = 262144 in size.
@@ -8955,7 +9046,8 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
     default:
         g_assert_not_reached();
     }
-    /* The AArch64 pseudocode CheckSystemAccess() specifies that op1
+    /*
+     * The AArch64 pseudocode CheckSystemAccess() specifies that op1
      * encodes a minimum access level for the register. We roll this
      * runtime check into our general permission check code, so check
      * here that the reginfo's specified permissions are strict enough
@@ -8998,10 +9090,11 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
         assert((r->access & ~mask) == 0);
     }
 
-    /* Check that the register definition has enough info to handle
+    /*
+     * Check that the register definition has enough info to handle
      * reads and writes if they are permitted.
      */
-    if (!(r->type & (ARM_CP_SPECIAL|ARM_CP_CONST))) {
+    if (!(r->type & (ARM_CP_SPECIAL | ARM_CP_CONST))) {
         if (r->access & PL3_R) {
             assert((r->fieldoffset ||
                    (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1])) ||
@@ -9024,7 +9117,8 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                         continue;
                     }
                     if (state == ARM_CP_STATE_AA32) {
-                        /* Under AArch32 CP registers can be common
+                        /*
+                         * Under AArch32 CP registers can be common
                          * (same for secure and non-secure world) or banked.
                          */
                         char *name;
@@ -9048,8 +9142,10 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                             break;
                         }
                     } else {
-                        /* AArch64 registers get mapped to non-secure instance
-                         * of AArch32 */
+                        /*
+                         * AArch64 registers get mapped to non-secure
+                         * instance of AArch32
+                         */
                         add_cpreg_to_hashtable(cpu, r, opaque, state,
                                                ARM_CP_SECSTATE_NS,
                                                crm, opc1, opc2, r->name);
-- 
2.20.1


