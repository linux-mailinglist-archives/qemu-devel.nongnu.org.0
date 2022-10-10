Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0EE5FA079
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:50:26 +0200 (CEST)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohu6r-0001Fe-Ae
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkw-0006Dg-5F
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtku-0005Yq-1F
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:45 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so460947wmq.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U4bZaH9ewSTtKGJ2hCxNf/XLdmqRHOO4aZlMXbD0cQY=;
 b=GxVYy9sCyoGr8DOHU4jr7vQUSUEbfplVpoo16SMBWSuQ4j+f8cYTzEcKuQ1maR0AAs
 /NYySrY6EtyVgnrmZwnkjIfI3CH4CpByggzj3Yi7gx+qTrKcAO2nhGLxtJOQJgoEUbp5
 PdaUqyEvOuYAU5dcaG1IwTimLGBcustxINrnBAm81V8RgRPOu1OgB5pes4shzX8e+7s0
 5vWH220hlkulm6I+QfzhgBvt+Ack/9Hixw4ih1AFrrmtIu3z7Mtzkiw2Fr5G2ENZP8c2
 1L6IWtSmGFBDR67DLL/0bh5oigZagKwvsxKpUqVImgqb3tYKvY0KyGpPjxlDy8275ZTJ
 ZvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U4bZaH9ewSTtKGJ2hCxNf/XLdmqRHOO4aZlMXbD0cQY=;
 b=kV6N/2HvMoDuSWFrw7H+Ck9MjCH0et8z74G8JPjluaylfOG1gQUHGRRqOoo+YOwylK
 yHgZ1k1tmUTIhstegwNwcE0H4Zmsd6iVSXUWYpei31wYRC/qXvh1gjdGRkOL11t9B+G7
 AJt7/gWszg1SGaMmnapHYDDZVzaoiTOpguBY1lZshaOKp77j22S6HwtPSOIxkE5ceESx
 0H5RrBZCqc3k/9o9KTndgyWFIxlcATjYEkmblnBnVEgZV+4PQM9cFR8ygZODh4VY+sHT
 8vhAOoYQVRhS0IPZFvaxPCjWN8IOobVcbTCQ0pYtcHtWwRckL/cUHYAKnfPw5wouvzqq
 2T1w==
X-Gm-Message-State: ACrzQf3bdSmb4I/Kd/dOIltTBEYU7PClaTZtwKAp6zDUd6+UMOC1lhAt
 xHExo1ad8EUFJibBUcyhx/KJcLzOh/YSSw==
X-Google-Smtp-Source: AMsMyM4a+xBRoQ7ROsXMCd4VBluOhLr/f6oF1Ds2Jlt0aSlS/KfN6DL/BdMaKQKbSV3cS30Rcw+Gow==
X-Received: by 2002:a05:600c:5114:b0:3b5:428:cf67 with SMTP id
 o20-20020a05600c511400b003b50428cf67mr20539446wms.80.1665412062233; 
 Mon, 10 Oct 2022 07:27:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/28] target/arm: Split out get_phys_addr_with_secure
Date: Mon, 10 Oct 2022 15:27:11 +0100
Message-Id: <20221010142730.502083-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Retain the existing get_phys_addr interface using the security
state derived from mmu_idx.  Move the kerneldoc comments to the
header file where they belong.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/ptw.c       | 44 ++++++++++++++----------------------------
 2 files changed, 55 insertions(+), 29 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 307a5965053..3524d11dc57 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1145,6 +1145,46 @@ typedef struct GetPhysAddrResult {
     ARMCacheAttrs cacheattrs;
 } GetPhysAddrResult;
 
+/**
+ * get_phys_addr_with_secure: get the physical address for a virtual address
+ * @env: CPUARMState
+ * @address: virtual address to get physical address for
+ * @access_type: 0 for read, 1 for write, 2 for execute
+ * @mmu_idx: MMU index indicating required translation regime
+ * @is_secure: security state for the access
+ * @result: set on translation success.
+ * @fi: set to fault info if the translation fails
+ *
+ * Find the physical address corresponding to the given virtual address,
+ * by doing a translation table walk on MMU based systems or using the
+ * MPU state on MPU based systems.
+ *
+ * Returns false if the translation was successful. Otherwise, phys_ptr, attrs,
+ * prot and page_size may not be filled in, and the populated fsr value provides
+ * information on why the translation aborted, in the format of a
+ * DFSR/IFSR fault register, with the following caveats:
+ *  * we honour the short vs long DFSR format differences.
+ *  * the WnR bit is never set (the caller must do this).
+ *  * for PSMAv5 based systems we don't bother to return a full FSR format
+ *    value.
+ */
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type,
+                               ARMMMUIdx mmu_idx, bool is_secure,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+    __attribute__((nonnull));
+
+/**
+ * get_phys_addr: get the physical address for a virtual address
+ * @env: CPUARMState
+ * @address: virtual address to get physical address for
+ * @access_type: 0 for read, 1 for write, 2 for execute
+ * @mmu_idx: MMU index indicating required translation regime
+ * @result: set on translation success.
+ * @fi: set to fault info if the translation fails
+ *
+ * Similarly, but use the security regime of @mmu_idx.
+ */
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d789807b086..74dcb843fe2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2260,35 +2260,12 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     return ret;
 }
 
-/**
- * get_phys_addr - get the physical address for this virtual address
- *
- * Find the physical address corresponding to the given virtual address,
- * by doing a translation table walk on MMU based systems or using the
- * MPU state on MPU based systems.
- *
- * Returns false if the translation was successful. Otherwise, phys_ptr, attrs,
- * prot and page_size may not be filled in, and the populated fsr value provides
- * information on why the translation aborted, in the format of a
- * DFSR/IFSR fault register, with the following caveats:
- *  * we honour the short vs long DFSR format differences.
- *  * the WnR bit is never set (the caller must do this).
- *  * for PSMAv5 based systems we don't bother to return a full FSR format
- *    value.
- *
- * @env: CPUARMState
- * @address: virtual address to get physical address for
- * @access_type: 0 for read, 1 for write, 2 for execute
- * @mmu_idx: MMU index indicating required translation regime
- * @result: set on translation success.
- * @fi: set to fault info if the translation fails
- */
-bool get_phys_addr(CPUARMState *env, target_ulong address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool is_secure, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
-    bool is_secure = regime_is_secure(env, mmu_idx);
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2304,8 +2281,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
 
-            ret = get_phys_addr(env, address, access_type, s1_mmu_idx,
-                                result, fi);
+            ret = get_phys_addr_with_secure(env, address, access_type,
+                                            s1_mmu_idx, is_secure, result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
@@ -2517,6 +2494,15 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 }
 
+bool get_phys_addr(CPUARMState *env, target_ulong address,
+                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+{
+    return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
+                                     regime_is_secure(env, mmu_idx),
+                                     result, fi);
+}
+
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
-- 
2.25.1


