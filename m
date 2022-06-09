Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A470A544866
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:10:07 +0200 (CEST)
Received: from localhost ([::1]:55902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzF78-0003sd-8D
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7Q-0001ZD-Fe
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:22 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7O-0005xd-3T
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id u8so27137707wrm.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JfidimcrBCl7Udx4o3Zs0c4uqkOTceip308AFLIscT0=;
 b=iORuARJVwwG7cRteZ+Qo+xAm0B1S0qTOkFSIP6hNa+Q/+4XQD1BqHnlgTY6I1Hqn5V
 NvFBRrtYowDAoCPbjMFu83+vb/URbr42RhRLADK7OuFcMEGrpraphyUonXtKkuW/vOO+
 TueQaJJ/ZUtzCgHeNFofW0s7bacFbhfJjulrVRMM2yr34E9dVkvAhISr5CKe7pWPkyiJ
 spyIgYgh0TSGs+6MWLcSqXQk8KyRNCFUqnoUupUfsmTWG/qajhCGMdCJt+YBGZLb4ORe
 YUE1sJcLIvC8oL/ou/RfwpmACDszrX3g+sAuq2Tkm972tYWebBCGv52k7r1dDTj716bL
 4fGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JfidimcrBCl7Udx4o3Zs0c4uqkOTceip308AFLIscT0=;
 b=bIf14kmcdpLXwpbqRMnjLMNOFymLt18QJ86AtxqUtmefys/u4L6nM4sV+RbIbDxgwH
 IK4mycYjBwht8Bjr0d9pS8EZ5UjK8zivDXvrFfSyP+Y0meCxVwiJ/dDgijomWQ95Dif4
 K/88Kdnb+RZQ9E1zJMV6oPKh5JsqFxKSMSNmzOnPf/9P7WQmY+jFV833f+yZ7uBqRLRe
 ED2yS/Nuhv5e9grX8Hguu0WAEZdLvd14p+bIrIbVD4eogSbfNhy0yKP3qSTt92sReYEp
 ZDnGhIDjoSMIleECNP53ptLIyOKBahmwhAiRTu/zARrKAIi+YTU/G7r5eP0geSe1x5Nz
 CenQ==
X-Gm-Message-State: AOAM533kTccI2d9uUzlmfjy5EHB6RJMmAxPaT+HIE5LJTLPnJo2cgWk7
 jvwMvZUl2kAvG2elO+5DYhIPUbkNVurKaA==
X-Google-Smtp-Source: ABdhPJxAPsi2WdTm2vuR2Y/R5HoxJTQVzLgHXwzFy62yU4Q72BrmOkUX+MnHjsZ1khtuMPAqJtCnlA==
X-Received: by 2002:a5d:6dd1:0:b0:210:7a1:cda0 with SMTP id
 d17-20020a5d6dd1000000b0021007a1cda0mr37329039wrz.570.1654765576678; 
 Thu, 09 Jun 2022 02:06:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/55] target/arm: Move arm_cpu_get_phys_page_attrs_debug to
 ptw.c
Date: Thu,  9 Jun 2022 10:05:15 +0100
Message-Id: <20220609090537.1971756-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Message-id: 20220604040607.269301-27-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 26 --------------------------
 target/arm/ptw.c    | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 69b1c060c1f..fe1e426f883 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10606,32 +10606,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     };
 }
 
-#ifndef CONFIG_USER_ONLY
-hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
-                                         MemTxAttrs *attrs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot;
-    bool ret;
-    ARMMMUFaultInfo fi = {};
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    ARMCacheAttrs cacheattrs = {};
-
-    *attrs = (MemTxAttrs) {};
-
-    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &phys_addr,
-                        attrs, &prot, &page_size, &fi, &cacheattrs);
-
-    if (ret) {
-        return -1;
-    }
-    return phys_addr;
-}
-#endif
-
 /* Note that signed overflow is undefined in C.  The following routines are
    careful to use unsigned types where modulo arithmetic is required.
    Failure to do so _will_ break on newer gcc.  */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ec60afd9bff..e9f6870d0a6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2491,3 +2491,27 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                     phys_ptr, prot, page_size, fi);
     }
 }
+
+hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
+                                         MemTxAttrs *attrs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    hwaddr phys_addr;
+    target_ulong page_size;
+    int prot;
+    bool ret;
+    ARMMMUFaultInfo fi = {};
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    ARMCacheAttrs cacheattrs = {};
+
+    *attrs = (MemTxAttrs) {};
+
+    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &phys_addr,
+                        attrs, &prot, &page_size, &fi, &cacheattrs);
+
+    if (ret) {
+        return -1;
+    }
+    return phys_addr;
+}
-- 
2.25.1


