Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD2359C43C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:35:37 +0200 (CEST)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAOl-0008H8-Un
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ol-0004gT-EO
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:34 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Of-0001cQ-MJ
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:29 -0400
Received: by mail-pl1-x631.google.com with SMTP id m2so10259326pls.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WBpLIBGMD5lRpOAKw5T58Wru1vUut/0oVVoO4QrpR+0=;
 b=lsHjzrm4CQW7KopXPYEmQAr4tsCD8crnwd6/W5Phn0c8jrzJG2GYMG4w0iRCXyQnuV
 0eYs8OXEqzvgvUaNfGS7DEJ6mrH/mOXZxQaWAZq6rVTQ12oZqf4rZkVIG7mcqERwChbn
 vUChgIsiuiHSaqb1z6tl4Deo7nBfW8O4Suzo8I8BL/C+lspSuKd6EtyT+BpHLYvXN3mR
 Om3BTOPowGxIjP72KkdzNJvej7SF4Waybdhv1sctkUBAMLq7UQavxxAap1pzkgIdblbk
 g5a+b8Vg/pYt9FiRbQvcZtSdDBnEsL/NrP+q/y1J7VjGGvQzYo4x6GKiF1Um3hLhjFkl
 JxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WBpLIBGMD5lRpOAKw5T58Wru1vUut/0oVVoO4QrpR+0=;
 b=ehxZeItcyxB1oqmKjpatK327TGn7uNX/GWi+szVC7vS0MGJZqpAjNigdAv8K7oFT8U
 3WWdsD7LVuKTmdQb1HovNbkn214fhhF8WuJya5M0TzG2B658wo+DKBKjNDTprPK+KI8o
 41ikk7gQMpKFbegixBT4nzEDr1ywSzssFkJpPYoRKWQjgWB8gEsLZG2R0xc1zS+VWTBB
 Z0q4ghecfT23dW9FrE0fI12YE0AU/k9rnr6m8nmeZfr10IpueczEARLVOUxseDk9lcl/
 6J72G3thU/9HL5Jkek4Dqu+9K0VA5rDVuiNzrzkUMsy5ccignGyNd7dRX2/KK3b1+EY1
 LYBA==
X-Gm-Message-State: ACgBeo3x8rbZiwD0gu7EsdlM7D8kfB9qinVlyYliDzfSzPEu0zRNlxBP
 xBTquUxgBcypFvCjgyEHzaC5XYGTNgUHZw==
X-Google-Smtp-Source: AA6agR7PGvR5Rgh0lrlyvFtUyPe5vm9eDj0RBRiPx7WgkzyR71BQIaXPfFp7+8Y5NIgwL6HwIN6xRw==
X-Received: by 2002:a17:902:c94a:b0:16f:81c1:255a with SMTP id
 i10-20020a170902c94a00b0016f81c1255amr20217323pla.35.1661182284070; 
 Mon, 22 Aug 2022 08:31:24 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 46/66] target/arm: Use probe_access_full for BTI
Date: Mon, 22 Aug 2022 08:27:21 -0700
Message-Id: <20220822152741.1617527-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Add a field to TARGET_PAGE_ENTRY_EXTRA to hold the guarded bit.
In is_guarded_page, use probe_access_full instead of just guessing
that the tlb entry is still present.  Also handles the FIXME about
executing from device memory.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h     |  8 ++++----
 target/arm/cpu.h           | 13 -------------
 target/arm/internals.h     |  1 +
 target/arm/ptw.c           |  7 ++++---
 target/arm/translate-a64.c | 22 ++++++++--------------
 5 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 118ca0e5c0..689a9645dc 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -32,12 +32,12 @@
 # define TARGET_PAGE_BITS_MIN  10
 
 /*
- * Cache the attrs and sharability fields from the page table entry.
+ * Cache the attrs, sharability, and gp fields from the page table entry.
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
index 8230a0b141..f48dcadad6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3376,19 +3376,6 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
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
index e914227e55..bab3e89227 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1067,6 +1067,7 @@ typedef struct ARMCacheAttrs {
     unsigned int attrs:8;
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
     bool is_s2_format:1;
+    bool guarded:1;              /* guarded bit of the v8-64 PTE */
 } ARMCacheAttrs;
 
 /* Fields that are valid upon success. */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dafbf71d00..69c22c039b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1319,9 +1319,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
index 305044a141..afabd77694 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14611,22 +14611,16 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
 #ifdef CONFIG_USER_ONLY
     return page_get_flags(addr) & PAGE_BTI;
 #else
+    CPUTLBEntryFull *full;
+    void *host;
     int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
-    unsigned int index = tlb_index(env, mmu_idx, addr);
-    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
+    int flags;
 
-    /*
-     * We test this immediately after reading an insn, which means
-     * that any normal page must be in the TLB.  The only exception
-     * would be for executing from flash or device memory, which
-     * does not retain the TLB entry.
-     *
-     * FIXME: Assume false for those, for now.  We could use
-     * arm_cpu_get_phys_page_attrs_debug to re-read the page
-     * table entry even for that case.
-     */
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
2.34.1


