Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E978544821
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:58:51 +0200 (CEST)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEwE-000300-Ac
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7L-0001Yr-Ok
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:18 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:47100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7G-00061B-H8
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:15 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso12264463wmr.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IkbtgPvv7dCQdgswPKDWhOCh/FDmgZL+ieXHCGa70Nc=;
 b=uexGmZ7w53heQKOcqy9uLQQPEFllbg7yoEshVBByqDqi19iQ6HnagqXP1fQOrJBpc1
 2IHmV/90X6zqfg0H1aAm+H1+ksAqy7qD/iDjVY1oiJ8GBfPYDk8wkYfT0MN943CAgRpd
 PINdbyGFtWLCNzQSILGbEMa/6UmjVqB3nQJiYwprIco+/TRslz7fuKe16Fb6LT6RQz+x
 fGxzI84cmPFa9hFsTiuBaDxBo6AyZzs+gw5eBzlq75tTnYbVSv7oBhbtMa/QeDkzMO3k
 8su8vGpLLkYviwAfD5rxueLRYgAeoosoR3TQtDI8tgvuO908BSoZ9T0INn4mqtB4U8Vp
 c/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IkbtgPvv7dCQdgswPKDWhOCh/FDmgZL+ieXHCGa70Nc=;
 b=hAY410lb1OAuXxdJ8FB5VBQY8QtKmq8iD0VUM6WCtgiK65Vyp+LuXNstLKZbABrTju
 M6tEpIqhqUyhRTP1FdDKjqCrbWMi/ZwhFMxjj/60zp9CTHTJJoqBP8Y18qwgjOaYWP+w
 aSmtuqPAJgtoeWH8cs/EhusoejsPXJeyhauBNfcYYhgsv3bb5EC+OG3yW4Bqcm2KZLyN
 LcIGmcGa27tcPblBlfBjVxx76xT0am9k+CejDMk9KgfEbmvVsfqHeE/ZVdsrCP/YZI/A
 R50g/q8kyHJHx5pdwp/yhkkSUkSybgnhqCjUOuBlk2qVXlRXI1cz1/UT7VndceDTOZKM
 np9A==
X-Gm-Message-State: AOAM530fdAdUAO48syIHhvhXr/LojzI46t7s/mAa/r+4pt+Uw7bjA8mb
 G5s9au/aF0epLViJDjpKal6HgyrMLBmtFQ==
X-Google-Smtp-Source: ABdhPJyX9etWV5k2EzvvFdG0fLTog0UjKECH+YpBhFYR41rOpxjIT9BTvcHwreKK7vyffY3X67trfg==
X-Received: by 2002:a05:600c:2e14:b0:39c:58c4:c6ed with SMTP id
 o20-20020a05600c2e1400b0039c58c4c6edmr2306223wmf.156.1654765565602; 
 Thu, 09 Jun 2022 02:06:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/55] target/arm: Move get_phys_addr_lpae to ptw.c
Date: Thu,  9 Jun 2022 10:05:04 +0100
Message-Id: <20220609090537.1971756-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-16-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  10 ++
 target/arm/helper.c | 416 +-------------------------------------------
 target/arm/ptw.c    | 411 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 429 insertions(+), 408 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index b2dfe489bbe..31744df6646 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -11,6 +11,8 @@
 
 #ifndef CONFIG_USER_ONLY
 
+extern const uint8_t pamax_map[7];
+
 uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
                      ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi);
 uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
@@ -30,6 +32,14 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
+ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
+                                   ARMMMUIdx mmu_idx);
+bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
+                        int inputsize, int stride, int outputsize);
+int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0);
+int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
+               int ap, int ns, int xn, int pxn);
+
 bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
                         bool s1_is_el0,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dab485e64ae..7de815fe986 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10652,7 +10652,7 @@ int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
  * @xn:      XN (execute-never) bits
  * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
  */
-static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
+int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
 {
     int prot = 0;
 
@@ -10703,8 +10703,8 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
  * @xn:      XN (execute-never) bit
  * @pxn:     PXN (privileged execute-never) bit
  */
-static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
-                      int ap, int ns, int xn, int pxn)
+int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
+               int ap, int ns, int xn, int pxn)
 {
     bool is_user = regime_is_user(env, mmu_idx);
     int prot_rw, user_rw;
@@ -10919,8 +10919,8 @@ uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
  * Returns true if the suggested S2 translation parameters are OK and
  * false otherwise.
  */
-static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                               int inputsize, int stride, int outputsize)
+bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
+                        int inputsize, int stride, int outputsize)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
@@ -10980,7 +10980,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
 #endif /* !CONFIG_USER_ONLY */
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
-static const uint8_t pamax_map[] = {
+const uint8_t pamax_map[] = {
     [0] = 32,
     [1] = 36,
     [2] = 40,
@@ -11159,8 +11159,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 }
 
 #ifndef CONFIG_USER_ONLY
-static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
-                                          ARMMMUIdx mmu_idx)
+ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
+                                   ARMMMUIdx mmu_idx)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     uint32_t el = regime_el(env, mmu_idx);
@@ -11223,406 +11223,6 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
     };
 }
 
-/**
- * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
- *
- * Returns false if the translation was successful. Otherwise, phys_ptr, attrs,
- * prot and page_size may not be filled in, and the populated fsr value provides
- * information on why the translation aborted, in the format of a long-format
- * DFSR/IFSR fault register, with the following caveats:
- *  * the WnR bit is never set (the caller must do this).
- *
- * @env: CPUARMState
- * @address: virtual address to get physical address for
- * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
- * @mmu_idx: MMU index indicating required translation regime
- * @s1_is_el0: if @mmu_idx is ARMMMUIdx_Stage2 (so this is a stage 2 page table
- *             walk), must be true if this is stage 2 of a stage 1+2 walk for an
- *             EL0 access). If @mmu_idx is anything else, @s1_is_el0 is ignored.
- * @phys_ptr: set to the physical address corresponding to the virtual address
- * @attrs: set to the memory transaction attributes to use
- * @prot: set to the permissions for the page containing phys_ptr
- * @page_size_ptr: set to the size of the page containing phys_ptr
- * @fi: set to fault info if the translation fails
- * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
- */
-bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
-                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                        bool s1_is_el0,
-                        hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
-                        target_ulong *page_size_ptr,
-                        ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
-    /* Read an LPAE long-descriptor translation table. */
-    ARMFaultType fault_type = ARMFault_Translation;
-    uint32_t level;
-    ARMVAParameters param;
-    uint64_t ttbr;
-    hwaddr descaddr, indexmask, indexmask_grainsize;
-    uint32_t tableattrs;
-    target_ulong page_size;
-    uint32_t attrs;
-    int32_t stride;
-    int addrsize, inputsize, outputsize;
-    TCR *tcr = regime_tcr(env, mmu_idx);
-    int ap, ns, xn, pxn;
-    uint32_t el = regime_el(env, mmu_idx);
-    uint64_t descaddrmask;
-    bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
-
-    /* TODO: This code does not support shareability levels. */
-    if (aarch64) {
-        int ps;
-
-        param = aa64_va_parameters(env, address, mmu_idx,
-                                   access_type != MMU_INST_FETCH);
-        level = 0;
-
-        /*
-         * If TxSZ is programmed to a value larger than the maximum,
-         * or smaller than the effective minimum, it is IMPLEMENTATION
-         * DEFINED whether we behave as if the field were programmed
-         * within bounds, or if a level 0 Translation fault is generated.
-         *
-         * With FEAT_LVA, fault on less than minimum becomes required,
-         * so our choice is to always raise the fault.
-         */
-        if (param.tsz_oob) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
-        }
-
-        addrsize = 64 - 8 * param.tbi;
-        inputsize = 64 - param.tsz;
-
-        /*
-         * Bound PS by PARANGE to find the effective output address size.
-         * ID_AA64MMFR0 is a read-only register so values outside of the
-         * supported mappings can be considered an implementation error.
-         */
-        ps = FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-        ps = MIN(ps, param.ps);
-        assert(ps < ARRAY_SIZE(pamax_map));
-        outputsize = pamax_map[ps];
-    } else {
-        param = aa32_va_parameters(env, address, mmu_idx);
-        level = 1;
-        addrsize = (mmu_idx == ARMMMUIdx_Stage2 ? 40 : 32);
-        inputsize = addrsize - param.tsz;
-        outputsize = 40;
-    }
-
-    /*
-     * We determined the region when collecting the parameters, but we
-     * have not yet validated that the address is valid for the region.
-     * Extract the top bits and verify that they all match select.
-     *
-     * For aa32, if inputsize == addrsize, then we have selected the
-     * region by exclusion in aa32_va_parameters and there is no more
-     * validation to do here.
-     */
-    if (inputsize < addrsize) {
-        target_ulong top_bits = sextract64(address, inputsize,
-                                           addrsize - inputsize);
-        if (-top_bits != param.select) {
-            /* The gap between the two regions is a Translation fault */
-            fault_type = ARMFault_Translation;
-            goto do_fault;
-        }
-    }
-
-    if (param.using64k) {
-        stride = 13;
-    } else if (param.using16k) {
-        stride = 11;
-    } else {
-        stride = 9;
-    }
-
-    /* Note that QEMU ignores shareability and cacheability attributes,
-     * so we don't need to do anything with the SH, ORGN, IRGN fields
-     * in the TTBCR.  Similarly, TTBCR:A1 selects whether we get the
-     * ASID from TTBR0 or TTBR1, but QEMU's TLB doesn't currently
-     * implement any ASID-like capability so we can ignore it (instead
-     * we will always flush the TLB any time the ASID is changed).
-     */
-    ttbr = regime_ttbr(env, mmu_idx, param.select);
-
-    /* Here we should have set up all the parameters for the translation:
-     * inputsize, ttbr, epd, stride, tbi
-     */
-
-    if (param.epd) {
-        /* Translation table walk disabled => Translation fault on TLB miss
-         * Note: This is always 0 on 64-bit EL2 and EL3.
-         */
-        goto do_fault;
-    }
-
-    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-        /* The starting level depends on the virtual address size (which can
-         * be up to 48 bits) and the translation granule size. It indicates
-         * the number of strides (stride bits at a time) needed to
-         * consume the bits of the input address. In the pseudocode this is:
-         *  level = 4 - RoundUp((inputsize - grainsize) / stride)
-         * where their 'inputsize' is our 'inputsize', 'grainsize' is
-         * our 'stride + 3' and 'stride' is our 'stride'.
-         * Applying the usual "rounded up m/n is (m+n-1)/n" and simplifying:
-         * = 4 - (inputsize - stride - 3 + stride - 1) / stride
-         * = 4 - (inputsize - 4) / stride;
-         */
-        level = 4 - (inputsize - 4) / stride;
-    } else {
-        /* For stage 2 translations the starting level is specified by the
-         * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
-         */
-        uint32_t sl0 = extract32(tcr->raw_tcr, 6, 2);
-        uint32_t sl2 = extract64(tcr->raw_tcr, 33, 1);
-        uint32_t startlevel;
-        bool ok;
-
-        /* SL2 is RES0 unless DS=1 & 4kb granule. */
-        if (param.ds && stride == 9 && sl2) {
-            if (sl0 != 0) {
-                level = 0;
-                fault_type = ARMFault_Translation;
-                goto do_fault;
-            }
-            startlevel = -1;
-        } else if (!aarch64 || stride == 9) {
-            /* AArch32 or 4KB pages */
-            startlevel = 2 - sl0;
-
-            if (cpu_isar_feature(aa64_st, cpu)) {
-                startlevel &= 3;
-            }
-        } else {
-            /* 16KB or 64KB pages */
-            startlevel = 3 - sl0;
-        }
-
-        /* Check that the starting level is valid. */
-        ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
-                                inputsize, stride, outputsize);
-        if (!ok) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
-        }
-        level = startlevel;
-    }
-
-    indexmask_grainsize = MAKE_64BIT_MASK(0, stride + 3);
-    indexmask = MAKE_64BIT_MASK(0, inputsize - (stride * (4 - level)));
-
-    /* Now we can extract the actual base address from the TTBR */
-    descaddr = extract64(ttbr, 0, 48);
-
-    /*
-     * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [5:2] of TTBR.
-     *
-     * Otherwise, if the base address is out of range, raise AddressSizeFault.
-     * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
-     * but we've just cleared the bits above 47, so simplify the test.
-     */
-    if (outputsize > 48) {
-        descaddr |= extract64(ttbr, 2, 4) << 48;
-    } else if (descaddr >> outputsize) {
-        level = 0;
-        fault_type = ARMFault_AddressSize;
-        goto do_fault;
-    }
-
-    /*
-     * We rely on this masking to clear the RES0 bits at the bottom of the TTBR
-     * and also to mask out CnP (bit 0) which could validly be non-zero.
-     */
-    descaddr &= ~indexmask;
-
-    /*
-     * For AArch32, the address field in the descriptor goes up to bit 39
-     * for both v7 and v8.  However, for v8 the SBZ bits [47:40] must be 0
-     * or an AddressSize fault is raised.  So for v8 we extract those SBZ
-     * bits as part of the address, which will be checked via outputsize.
-     * For AArch64, the address field goes up to bit 47, or 49 with FEAT_LPA2;
-     * the highest bits of a 52-bit output are placed elsewhere.
-     */
-    if (param.ds) {
-        descaddrmask = MAKE_64BIT_MASK(0, 50);
-    } else if (arm_feature(env, ARM_FEATURE_V8)) {
-        descaddrmask = MAKE_64BIT_MASK(0, 48);
-    } else {
-        descaddrmask = MAKE_64BIT_MASK(0, 40);
-    }
-    descaddrmask &= ~indexmask_grainsize;
-
-    /* Secure accesses start with the page table in secure memory and
-     * can be downgraded to non-secure at any step. Non-secure accesses
-     * remain non-secure. We implement this by just ORing in the NSTable/NS
-     * bits at each step.
-     */
-    tableattrs = regime_is_secure(env, mmu_idx) ? 0 : (1 << 4);
-    for (;;) {
-        uint64_t descriptor;
-        bool nstable;
-
-        descaddr |= (address >> (stride * (4 - level))) & indexmask;
-        descaddr &= ~7ULL;
-        nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fi);
-        if (fi->type != ARMFault_None) {
-            goto do_fault;
-        }
-
-        if (!(descriptor & 1) ||
-            (!(descriptor & 2) && (level == 3))) {
-            /* Invalid, or the Reserved level 3 encoding */
-            goto do_fault;
-        }
-
-        descaddr = descriptor & descaddrmask;
-
-        /*
-         * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
-         * of descriptor.  For FEAT_LPA2 and effective DS, bits [51:50] of
-         * descaddr are in [9:8].  Otherwise, if descaddr is out of range,
-         * raise AddressSizeFault.
-         */
-        if (outputsize > 48) {
-            if (param.ds) {
-                descaddr |= extract64(descriptor, 8, 2) << 50;
-            } else {
-                descaddr |= extract64(descriptor, 12, 4) << 48;
-            }
-        } else if (descaddr >> outputsize) {
-            fault_type = ARMFault_AddressSize;
-            goto do_fault;
-        }
-
-        if ((descriptor & 2) && (level < 3)) {
-            /* Table entry. The top five bits are attributes which may
-             * propagate down through lower levels of the table (and
-             * which are all arranged so that 0 means "no effect", so
-             * we can gather them up by ORing in the bits at each level).
-             */
-            tableattrs |= extract64(descriptor, 59, 5);
-            level++;
-            indexmask = indexmask_grainsize;
-            continue;
-        }
-        /*
-         * Block entry at level 1 or 2, or page entry at level 3.
-         * These are basically the same thing, although the number
-         * of bits we pull in from the vaddr varies. Note that although
-         * descaddrmask masks enough of the low bits of the descriptor
-         * to give a correct page or table address, the address field
-         * in a block descriptor is smaller; so we need to explicitly
-         * clear the lower bits here before ORing in the low vaddr bits.
-         */
-        page_size = (1ULL << ((stride * (4 - level)) + 3));
-        descaddr &= ~(page_size - 1);
-        descaddr |= (address & (page_size - 1));
-        /* Extract attributes from the descriptor */
-        attrs = extract64(descriptor, 2, 10)
-            | (extract64(descriptor, 52, 12) << 10);
-
-        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-            /* Stage 2 table descriptors do not include any attribute fields */
-            break;
-        }
-        /* Merge in attributes from table descriptors */
-        attrs |= nstable << 3; /* NS */
-        guarded = extract64(descriptor, 50, 1);  /* GP */
-        if (param.hpd) {
-            /* HPD disables all the table attributes except NSTable.  */
-            break;
-        }
-        attrs |= extract32(tableattrs, 0, 2) << 11;     /* XN, PXN */
-        /* The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
-         * means "force PL1 access only", which means forcing AP[1] to 0.
-         */
-        attrs &= ~(extract32(tableattrs, 2, 1) << 4);   /* !APT[0] => AP[1] */
-        attrs |= extract32(tableattrs, 3, 1) << 5;      /* APT[1] => AP[2] */
-        break;
-    }
-    /* Here descaddr is the final physical address, and attributes
-     * are all in attrs.
-     */
-    fault_type = ARMFault_AccessFlag;
-    if ((attrs & (1 << 8)) == 0) {
-        /* Access flag */
-        goto do_fault;
-    }
-
-    ap = extract32(attrs, 4, 2);
-
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-        ns = mmu_idx == ARMMMUIdx_Stage2;
-        xn = extract32(attrs, 11, 2);
-        *prot = get_S2prot(env, ap, xn, s1_is_el0);
-    } else {
-        ns = extract32(attrs, 3, 1);
-        xn = extract32(attrs, 12, 1);
-        pxn = extract32(attrs, 11, 1);
-        *prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
-    }
-
-    fault_type = ARMFault_Permission;
-    if (!(*prot & (1 << access_type))) {
-        goto do_fault;
-    }
-
-    if (ns) {
-        /* The NS bit will (as required by the architecture) have no effect if
-         * the CPU doesn't support TZ or this is a non-secure translation
-         * regime, because the attribute will already be non-secure.
-         */
-        txattrs->secure = false;
-    }
-    /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
-    if (aarch64 && guarded && cpu_isar_feature(aa64_bti, cpu)) {
-        arm_tlb_bti_gp(txattrs) = true;
-    }
-
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-        cacheattrs->is_s2_format = true;
-        cacheattrs->attrs = extract32(attrs, 0, 4);
-    } else {
-        /* Index into MAIR registers for cache attributes */
-        uint8_t attrindx = extract32(attrs, 0, 3);
-        uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
-        assert(attrindx <= 7);
-        cacheattrs->is_s2_format = false;
-        cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
-    }
-
-    /*
-     * For FEAT_LPA2 and effective DS, the SH field in the attributes
-     * was re-purposed for output address bits.  The SH attribute in
-     * that case comes from TCR_ELx, which we extracted earlier.
-     */
-    if (param.ds) {
-        cacheattrs->shareability = param.sh;
-    } else {
-        cacheattrs->shareability = extract32(attrs, 6, 2);
-    }
-
-    *phys_ptr = descaddr;
-    *page_size_ptr = page_size;
-    return false;
-
-do_fault:
-    fi->type = fault_type;
-    fi->level = level;
-    /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
-    fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
-                               mmu_idx == ARMMMUIdx_Stage2_S);
-    fi->s1ns = mmu_idx == ARMMMUIdx_Stage2;
-    return true;
-}
-
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f2ca2bb8fe1..cbccf91b132 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -314,6 +314,417 @@ do_fault:
     return true;
 }
 
+/**
+ * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
+ *
+ * Returns false if the translation was successful. Otherwise, phys_ptr,
+ * attrs, prot and page_size may not be filled in, and the populated fsr
+ * value provides information on why the translation aborted, in the format
+ * of a long-format DFSR/IFSR fault register, with the following caveat:
+ * the WnR bit is never set (the caller must do this).
+ *
+ * @env: CPUARMState
+ * @address: virtual address to get physical address for
+ * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
+ * @mmu_idx: MMU index indicating required translation regime
+ * @s1_is_el0: if @mmu_idx is ARMMMUIdx_Stage2 (so this is a stage 2 page
+ *             table walk), must be true if this is stage 2 of a stage 1+2
+ *             walk for an EL0 access. If @mmu_idx is anything else,
+ *             @s1_is_el0 is ignored.
+ * @phys_ptr: set to the physical address corresponding to the virtual address
+ * @attrs: set to the memory transaction attributes to use
+ * @prot: set to the permissions for the page containing phys_ptr
+ * @page_size_ptr: set to the size of the page containing phys_ptr
+ * @fi: set to fault info if the translation fails
+ * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
+ */
+bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
+                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                        bool s1_is_el0,
+                        hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
+                        target_ulong *page_size_ptr,
+                        ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = CPU(cpu);
+    /* Read an LPAE long-descriptor translation table. */
+    ARMFaultType fault_type = ARMFault_Translation;
+    uint32_t level;
+    ARMVAParameters param;
+    uint64_t ttbr;
+    hwaddr descaddr, indexmask, indexmask_grainsize;
+    uint32_t tableattrs;
+    target_ulong page_size;
+    uint32_t attrs;
+    int32_t stride;
+    int addrsize, inputsize, outputsize;
+    TCR *tcr = regime_tcr(env, mmu_idx);
+    int ap, ns, xn, pxn;
+    uint32_t el = regime_el(env, mmu_idx);
+    uint64_t descaddrmask;
+    bool aarch64 = arm_el_is_aa64(env, el);
+    bool guarded = false;
+
+    /* TODO: This code does not support shareability levels. */
+    if (aarch64) {
+        int ps;
+
+        param = aa64_va_parameters(env, address, mmu_idx,
+                                   access_type != MMU_INST_FETCH);
+        level = 0;
+
+        /*
+         * If TxSZ is programmed to a value larger than the maximum,
+         * or smaller than the effective minimum, it is IMPLEMENTATION
+         * DEFINED whether we behave as if the field were programmed
+         * within bounds, or if a level 0 Translation fault is generated.
+         *
+         * With FEAT_LVA, fault on less than minimum becomes required,
+         * so our choice is to always raise the fault.
+         */
+        if (param.tsz_oob) {
+            fault_type = ARMFault_Translation;
+            goto do_fault;
+        }
+
+        addrsize = 64 - 8 * param.tbi;
+        inputsize = 64 - param.tsz;
+
+        /*
+         * Bound PS by PARANGE to find the effective output address size.
+         * ID_AA64MMFR0 is a read-only register so values outside of the
+         * supported mappings can be considered an implementation error.
+         */
+        ps = FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+        ps = MIN(ps, param.ps);
+        assert(ps < ARRAY_SIZE(pamax_map));
+        outputsize = pamax_map[ps];
+    } else {
+        param = aa32_va_parameters(env, address, mmu_idx);
+        level = 1;
+        addrsize = (mmu_idx == ARMMMUIdx_Stage2 ? 40 : 32);
+        inputsize = addrsize - param.tsz;
+        outputsize = 40;
+    }
+
+    /*
+     * We determined the region when collecting the parameters, but we
+     * have not yet validated that the address is valid for the region.
+     * Extract the top bits and verify that they all match select.
+     *
+     * For aa32, if inputsize == addrsize, then we have selected the
+     * region by exclusion in aa32_va_parameters and there is no more
+     * validation to do here.
+     */
+    if (inputsize < addrsize) {
+        target_ulong top_bits = sextract64(address, inputsize,
+                                           addrsize - inputsize);
+        if (-top_bits != param.select) {
+            /* The gap between the two regions is a Translation fault */
+            fault_type = ARMFault_Translation;
+            goto do_fault;
+        }
+    }
+
+    if (param.using64k) {
+        stride = 13;
+    } else if (param.using16k) {
+        stride = 11;
+    } else {
+        stride = 9;
+    }
+
+    /*
+     * Note that QEMU ignores shareability and cacheability attributes,
+     * so we don't need to do anything with the SH, ORGN, IRGN fields
+     * in the TTBCR.  Similarly, TTBCR:A1 selects whether we get the
+     * ASID from TTBR0 or TTBR1, but QEMU's TLB doesn't currently
+     * implement any ASID-like capability so we can ignore it (instead
+     * we will always flush the TLB any time the ASID is changed).
+     */
+    ttbr = regime_ttbr(env, mmu_idx, param.select);
+
+    /*
+     * Here we should have set up all the parameters for the translation:
+     * inputsize, ttbr, epd, stride, tbi
+     */
+
+    if (param.epd) {
+        /*
+         * Translation table walk disabled => Translation fault on TLB miss
+         * Note: This is always 0 on 64-bit EL2 and EL3.
+         */
+        goto do_fault;
+    }
+
+    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
+        /*
+         * The starting level depends on the virtual address size (which can
+         * be up to 48 bits) and the translation granule size. It indicates
+         * the number of strides (stride bits at a time) needed to
+         * consume the bits of the input address. In the pseudocode this is:
+         *  level = 4 - RoundUp((inputsize - grainsize) / stride)
+         * where their 'inputsize' is our 'inputsize', 'grainsize' is
+         * our 'stride + 3' and 'stride' is our 'stride'.
+         * Applying the usual "rounded up m/n is (m+n-1)/n" and simplifying:
+         * = 4 - (inputsize - stride - 3 + stride - 1) / stride
+         * = 4 - (inputsize - 4) / stride;
+         */
+        level = 4 - (inputsize - 4) / stride;
+    } else {
+        /*
+         * For stage 2 translations the starting level is specified by the
+         * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
+         */
+        uint32_t sl0 = extract32(tcr->raw_tcr, 6, 2);
+        uint32_t sl2 = extract64(tcr->raw_tcr, 33, 1);
+        uint32_t startlevel;
+        bool ok;
+
+        /* SL2 is RES0 unless DS=1 & 4kb granule. */
+        if (param.ds && stride == 9 && sl2) {
+            if (sl0 != 0) {
+                level = 0;
+                fault_type = ARMFault_Translation;
+                goto do_fault;
+            }
+            startlevel = -1;
+        } else if (!aarch64 || stride == 9) {
+            /* AArch32 or 4KB pages */
+            startlevel = 2 - sl0;
+
+            if (cpu_isar_feature(aa64_st, cpu)) {
+                startlevel &= 3;
+            }
+        } else {
+            /* 16KB or 64KB pages */
+            startlevel = 3 - sl0;
+        }
+
+        /* Check that the starting level is valid. */
+        ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
+                                inputsize, stride, outputsize);
+        if (!ok) {
+            fault_type = ARMFault_Translation;
+            goto do_fault;
+        }
+        level = startlevel;
+    }
+
+    indexmask_grainsize = MAKE_64BIT_MASK(0, stride + 3);
+    indexmask = MAKE_64BIT_MASK(0, inputsize - (stride * (4 - level)));
+
+    /* Now we can extract the actual base address from the TTBR */
+    descaddr = extract64(ttbr, 0, 48);
+
+    /*
+     * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [5:2] of TTBR.
+     *
+     * Otherwise, if the base address is out of range, raise AddressSizeFault.
+     * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
+     * but we've just cleared the bits above 47, so simplify the test.
+     */
+    if (outputsize > 48) {
+        descaddr |= extract64(ttbr, 2, 4) << 48;
+    } else if (descaddr >> outputsize) {
+        level = 0;
+        fault_type = ARMFault_AddressSize;
+        goto do_fault;
+    }
+
+    /*
+     * We rely on this masking to clear the RES0 bits at the bottom of the TTBR
+     * and also to mask out CnP (bit 0) which could validly be non-zero.
+     */
+    descaddr &= ~indexmask;
+
+    /*
+     * For AArch32, the address field in the descriptor goes up to bit 39
+     * for both v7 and v8.  However, for v8 the SBZ bits [47:40] must be 0
+     * or an AddressSize fault is raised.  So for v8 we extract those SBZ
+     * bits as part of the address, which will be checked via outputsize.
+     * For AArch64, the address field goes up to bit 47, or 49 with FEAT_LPA2;
+     * the highest bits of a 52-bit output are placed elsewhere.
+     */
+    if (param.ds) {
+        descaddrmask = MAKE_64BIT_MASK(0, 50);
+    } else if (arm_feature(env, ARM_FEATURE_V8)) {
+        descaddrmask = MAKE_64BIT_MASK(0, 48);
+    } else {
+        descaddrmask = MAKE_64BIT_MASK(0, 40);
+    }
+    descaddrmask &= ~indexmask_grainsize;
+
+    /*
+     * Secure accesses start with the page table in secure memory and
+     * can be downgraded to non-secure at any step. Non-secure accesses
+     * remain non-secure. We implement this by just ORing in the NSTable/NS
+     * bits at each step.
+     */
+    tableattrs = regime_is_secure(env, mmu_idx) ? 0 : (1 << 4);
+    for (;;) {
+        uint64_t descriptor;
+        bool nstable;
+
+        descaddr |= (address >> (stride * (4 - level))) & indexmask;
+        descaddr &= ~7ULL;
+        nstable = extract32(tableattrs, 4, 1);
+        descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
+
+        if (!(descriptor & 1) ||
+            (!(descriptor & 2) && (level == 3))) {
+            /* Invalid, or the Reserved level 3 encoding */
+            goto do_fault;
+        }
+
+        descaddr = descriptor & descaddrmask;
+
+        /*
+         * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
+         * of descriptor.  For FEAT_LPA2 and effective DS, bits [51:50] of
+         * descaddr are in [9:8].  Otherwise, if descaddr is out of range,
+         * raise AddressSizeFault.
+         */
+        if (outputsize > 48) {
+            if (param.ds) {
+                descaddr |= extract64(descriptor, 8, 2) << 50;
+            } else {
+                descaddr |= extract64(descriptor, 12, 4) << 48;
+            }
+        } else if (descaddr >> outputsize) {
+            fault_type = ARMFault_AddressSize;
+            goto do_fault;
+        }
+
+        if ((descriptor & 2) && (level < 3)) {
+            /*
+             * Table entry. The top five bits are attributes which may
+             * propagate down through lower levels of the table (and
+             * which are all arranged so that 0 means "no effect", so
+             * we can gather them up by ORing in the bits at each level).
+             */
+            tableattrs |= extract64(descriptor, 59, 5);
+            level++;
+            indexmask = indexmask_grainsize;
+            continue;
+        }
+        /*
+         * Block entry at level 1 or 2, or page entry at level 3.
+         * These are basically the same thing, although the number
+         * of bits we pull in from the vaddr varies. Note that although
+         * descaddrmask masks enough of the low bits of the descriptor
+         * to give a correct page or table address, the address field
+         * in a block descriptor is smaller; so we need to explicitly
+         * clear the lower bits here before ORing in the low vaddr bits.
+         */
+        page_size = (1ULL << ((stride * (4 - level)) + 3));
+        descaddr &= ~(page_size - 1);
+        descaddr |= (address & (page_size - 1));
+        /* Extract attributes from the descriptor */
+        attrs = extract64(descriptor, 2, 10)
+            | (extract64(descriptor, 52, 12) << 10);
+
+        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+            /* Stage 2 table descriptors do not include any attribute fields */
+            break;
+        }
+        /* Merge in attributes from table descriptors */
+        attrs |= nstable << 3; /* NS */
+        guarded = extract64(descriptor, 50, 1);  /* GP */
+        if (param.hpd) {
+            /* HPD disables all the table attributes except NSTable.  */
+            break;
+        }
+        attrs |= extract32(tableattrs, 0, 2) << 11;     /* XN, PXN */
+        /*
+         * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
+         * means "force PL1 access only", which means forcing AP[1] to 0.
+         */
+        attrs &= ~(extract32(tableattrs, 2, 1) << 4);   /* !APT[0] => AP[1] */
+        attrs |= extract32(tableattrs, 3, 1) << 5;      /* APT[1] => AP[2] */
+        break;
+    }
+    /*
+     * Here descaddr is the final physical address, and attributes
+     * are all in attrs.
+     */
+    fault_type = ARMFault_AccessFlag;
+    if ((attrs & (1 << 8)) == 0) {
+        /* Access flag */
+        goto do_fault;
+    }
+
+    ap = extract32(attrs, 4, 2);
+
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        ns = mmu_idx == ARMMMUIdx_Stage2;
+        xn = extract32(attrs, 11, 2);
+        *prot = get_S2prot(env, ap, xn, s1_is_el0);
+    } else {
+        ns = extract32(attrs, 3, 1);
+        xn = extract32(attrs, 12, 1);
+        pxn = extract32(attrs, 11, 1);
+        *prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
+    }
+
+    fault_type = ARMFault_Permission;
+    if (!(*prot & (1 << access_type))) {
+        goto do_fault;
+    }
+
+    if (ns) {
+        /*
+         * The NS bit will (as required by the architecture) have no effect if
+         * the CPU doesn't support TZ or this is a non-secure translation
+         * regime, because the attribute will already be non-secure.
+         */
+        txattrs->secure = false;
+    }
+    /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
+    if (aarch64 && guarded && cpu_isar_feature(aa64_bti, cpu)) {
+        arm_tlb_bti_gp(txattrs) = true;
+    }
+
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        cacheattrs->is_s2_format = true;
+        cacheattrs->attrs = extract32(attrs, 0, 4);
+    } else {
+        /* Index into MAIR registers for cache attributes */
+        uint8_t attrindx = extract32(attrs, 0, 3);
+        uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+        assert(attrindx <= 7);
+        cacheattrs->is_s2_format = false;
+        cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
+    }
+
+    /*
+     * For FEAT_LPA2 and effective DS, the SH field in the attributes
+     * was re-purposed for output address bits.  The SH attribute in
+     * that case comes from TCR_ELx, which we extracted earlier.
+     */
+    if (param.ds) {
+        cacheattrs->shareability = param.sh;
+    } else {
+        cacheattrs->shareability = extract32(attrs, 6, 2);
+    }
+
+    *phys_ptr = descaddr;
+    *page_size_ptr = page_size;
+    return false;
+
+do_fault:
+    fi->type = fault_type;
+    fi->level = level;
+    /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
+    fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
+                               mmu_idx == ARMMMUIdx_Stage2_S);
+    fi->s1ns = mmu_idx == ARMMMUIdx_Stage2;
+    return true;
+}
+
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, int *prot,
-- 
2.25.1


