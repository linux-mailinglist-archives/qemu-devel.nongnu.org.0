Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E46065C6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:28:10 +0200 (CEST)
Received: from localhost ([::1]:45926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYOu-0008GE-FC
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:28:08 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olY70-0005y0-ED
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYi-0001Iq-RV
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:02 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYf-0000yW-Vd
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i9so938791wrv.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=127zUVwrPwCKlSkn3MdeP67nPIv5rz5Zmn0vSiZKB+Y=;
 b=hkwr+AtbPvCBEb0RuT/Fjqv9JKn1StFfF8ff0XHSiicbxBnQcKqjbHVX6b5j2FT7tS
 AMUHtVw5hbDlr3SmSzkgkGT6FgeUUvC9aOkgYi0YbWI88+f/Ml1IEHXftB9yBMXwS/z9
 RyPEjc9B+vqhiB1AevE/x85eZSgPrdcSRw5hGNCX9ovKH+M6BVKyhxvDT9mpBe0t07tj
 P2qjjfn9zrORtj1nye4/KGs5V4O+3H/jZ2iAmVj4FX/DDckY1Fmpk4607xvtOqfpj05A
 ttVe+eRkwDmDo5O6xLaUbyvDFd5bg8xVGvBEQ610hTex6QaXN0CnRDpdFdzi/HSUEplf
 qc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=127zUVwrPwCKlSkn3MdeP67nPIv5rz5Zmn0vSiZKB+Y=;
 b=PXYzLj7V7rCWTiCnhFbVZJCNzP56edZidJLr/1d+OJgduW/91EdF8o0MswtaQVAeLR
 GiI2cUj4Io1V4UGVMIKtjfymBHKt1zkPF4hTwdNitSdazkFa/13e2KGufdJdVaizkw79
 2Gc39q1evpTGQ/ia/P1Z0lLA1Bvj1PAZVU9Gc39G1NG3/pSPkq80aOP+59qUMzfUOXvZ
 cKrk5zyHK2i/J/1y0pYkds8B1sxSsRPX5VuQMi4aPCPFD191LrPLxT/KZLIepg3opXbe
 48IbSQfnY078qd2kOt8Le/nhNZ+lkbTUI0hrz/mK4j0z0FLYXwiDp/6/3JfcLDuZAen0
 gF4w==
X-Gm-Message-State: ACrzQf3S92KI6DA4/ajTFRnZBE/Z2Zfl7C1UeAIXVIRpkU5QJY1NAmrm
 uJ2CvuxgTFPGq16SEphI5+DFSKrc2rEOjw==
X-Google-Smtp-Source: AMsMyM6VxB8ixGLqw32q3C9f3gp/rP7Rp9S87J2SKpl/1MVZj1ZwkeMXkIL4rnfWV+8TdPGeFX+IzA==
X-Received: by 2002:a5d:6384:0:b0:22e:6027:9da4 with SMTP id
 p4-20020a5d6384000000b0022e60279da4mr8185620wru.686.1666268515448; 
 Thu, 20 Oct 2022 05:21:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.21.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:21:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/24] target/arm: Use probe_access_full for BTI
Date: Thu, 20 Oct 2022 13:21:27 +0100
Message-Id: <20221020122146.3177980-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Add a field to TARGET_PAGE_ENTRY_EXTRA to hold the guarded bit.
In is_guarded_page, use probe_access_full instead of just guessing
that the tlb entry is still present.  Also handles the FIXME about
executing from device memory.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221011031911.2408754-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-param.h     |  9 +++++----
 target/arm/cpu.h           | 13 -------------
 target/arm/internals.h     |  1 +
 target/arm/ptw.c           |  7 ++++---
 target/arm/translate-a64.c | 21 ++++++++++-----------
 5 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 38347b0d208..f4338fd10e4 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -36,12 +36,13 @@
  *
  * For ARMMMUIdx_Stage2*, pte_attrs is the S2 descriptor bits [5:2].
  * Otherwise, pte_attrs is the same as the MAIR_EL1 8-bit format.
- * For shareability, as in the SH field of the VMSAv8-64 PTEs.
+ * For shareability and guarded, as in the SH and GP fields respectively
+ * of the VMSAv8-64 PTEs.
  */
 # define TARGET_PAGE_ENTRY_EXTRA  \
-     uint8_t pte_attrs;           \
-     uint8_t shareability;
-
+    uint8_t pte_attrs;            \
+    uint8_t shareability;         \
+    bool guarded;
 #endif
 
 #define NB_MMU_MODES 8
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9a358c410be..9df7adbe81f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3388,19 +3388,6 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
 /* Shared between translate-sve.c and sve_helper.c.  */
 extern const uint64_t pred_esz_masks[5];
 
-/* Helper for the macros below, validating the argument type. */
-static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
-{
-    return x;
-}
-
-/*
- * Lvalue macros for ARM TLB bits that we must cache in the TCG TLB.
- * Using these should be a bit more self-documenting than using the
- * generic target bits directly.
- */
-#define arm_tlb_bti_gp(x) (typecheck_memtxattrs(x)->target_tlb_bit0)
-
 /*
  * AArch64 usage of the PAGE_TARGET_* bits for linux-user.
  * Note that with the Linux kernel, PROT_MTE may not be cleared by mprotect
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9566364dcae..c3c3920ded2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1095,6 +1095,7 @@ typedef struct ARMCacheAttrs {
     unsigned int attrs:8;
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
     bool is_s2_format:1;
+    bool guarded:1;              /* guarded bit of the v8-64 PTE */
 } ARMCacheAttrs;
 
 /* Fields that are valid upon success. */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 23f16f4ff7f..2d182d62e5a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1313,9 +1313,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          */
         result->f.attrs.secure = false;
     }
-    /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
-    if (aarch64 && guarded && cpu_isar_feature(aa64_bti, cpu)) {
-        arm_tlb_bti_gp(&result->f.attrs) = true;
+
+    /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
+    if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
+        result->f.guarded = guarded;
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5b67375f4ec..60ff753d817 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14601,22 +14601,21 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
 #ifdef CONFIG_USER_ONLY
     return page_get_flags(addr) & PAGE_BTI;
 #else
+    CPUTLBEntryFull *full;
+    void *host;
     int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
-    unsigned int index = tlb_index(env, mmu_idx, addr);
-    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
+    int flags;
 
     /*
      * We test this immediately after reading an insn, which means
-     * that any normal page must be in the TLB.  The only exception
-     * would be for executing from flash or device memory, which
-     * does not retain the TLB entry.
-     *
-     * FIXME: Assume false for those, for now.  We could use
-     * arm_cpu_get_phys_page_attrs_debug to re-read the page
-     * table entry even for that case.
+     * that the TLB entry must be present and valid, and thus this
+     * access will never raise an exception.
      */
-    return (tlb_hit(entry->addr_code, addr) &&
-            arm_tlb_bti_gp(&env_tlb(env)->d[mmu_idx].fulltlb[index].attrs));
+    flags = probe_access_full(env, addr, MMU_INST_FETCH, mmu_idx,
+                              false, &host, &full, 0);
+    assert(!(flags & TLB_INVALID_MASK));
+
+    return full->guarded;
 #endif
 }
 
-- 
2.25.1


