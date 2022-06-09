Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A908544725
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:17:08 +0200 (CEST)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEHr-00051F-Ag
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE79-0001Xr-LQ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE77-00060y-Js
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id s1so8358409wra.9
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PQxd2r1Hvfyyf27MTzwwWzDTkgYpufX1zJ4GE3JaSv0=;
 b=dIKXG3OrPBWVrRHvaF6E0lPpMDMtut+AS/r6i2ObQqKYW9GfYvKY9l05PE9qvlyc3I
 RdznEX0cokNLSJ0s8ApqzczHhyfjfTc9//ASO5/tQI/H8sP7t+7eBCEUPc65E2KTS+1n
 VQoors/20iEudqdgTxeMY4PhB9ShKb9u5saTCqwStuRXYKFiyjh9susS3KNpI1E7v2fK
 Q4/KHMs9fPHbSb0YQhe2OvMFM0Wt6Hv91W6OTVtlns32p2Q56TSCLwy5WcCU+Gu0/amw
 1z5SkDK+TYUQlD+ys7uExbApmGgZBoVh3DnfBLp9moC0XbpjfiPYaGxd8+40WjVNYwVm
 zpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQxd2r1Hvfyyf27MTzwwWzDTkgYpufX1zJ4GE3JaSv0=;
 b=IN+R0SUZ4IFxVjCLW7qF1Il+YWY+IJd6LMxYqKtI/pzLBwG3/rbDnTqFYuBl4JUiev
 NGlpMSKOytvYzxJePwW21HP++yr7uZRsk7qeebvAt5RIJP63qmsfPWlfOrpHJkyWul63
 RPGYyeAx3ILhSR9Q+aWISkyZ/bzZYBR44cxOqAKd0fnQqLo8no0fonj2de8dwLYJjhCk
 tJaL8cF3ui014ZyapJd83rRZPOAg6Rxv0DdadUbN+0oeOZ/MPQjjhxBQxGcoPrNKdSAZ
 I0fUufDpE9jlm2giyUasUz762lRbEE3B0hLDN6eRPhC/jiXgfeIqLHLNKdYVffG6PCEA
 B+Aw==
X-Gm-Message-State: AOAM530wcQZWFhxtw3ZC3cQfhvSTAZC9/J75L+TJajyC4OQM/BRIiL+w
 AvfgJnv3HRdiju8msnLnslp4TDws5fsYyA==
X-Google-Smtp-Source: ABdhPJxxQ+oqIo+/lbLIv0nQ21YQjo4wN7QISZktZqLou2ld6Ga7xRZFkfgnt61ABL1jU6yx5Zpl+g==
X-Received: by 2002:a5d:5281:0:b0:20c:d5be:331c with SMTP id
 c1-20020a5d5281000000b0020cd5be331cmr37224786wrv.9.1654765560628; 
 Thu, 09 Jun 2022 02:06:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/55] target/arm: Move v8m_security_lookup to ptw.c
Date: Thu,  9 Jun 2022 10:05:00 +0100
Message-Id: <20220609090537.1971756-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

This function has one private helper, v8m_is_sau_exempt,
so move that at the same time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-12-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 123 ------------------------------------------
 target/arm/ptw.c    | 126 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+), 123 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 62e48f0925c..d6a749ad0ed 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9,7 +9,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
-#include "target/arm/idau.h"
 #include "trace.h"
 #include "cpu.h"
 #include "internals.h"
@@ -11693,128 +11692,6 @@ bool m_is_system_region(CPUARMState *env, uint32_t address)
     return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
 }
 
-static bool v8m_is_sau_exempt(CPUARMState *env,
-                              uint32_t address, MMUAccessType access_type)
-{
-    /* The architecture specifies that certain address ranges are
-     * exempt from v8M SAU/IDAU checks.
-     */
-    return
-        (access_type == MMU_INST_FETCH && m_is_system_region(env, address)) ||
-        (address >= 0xe0000000 && address <= 0xe0002fff) ||
-        (address >= 0xe000e000 && address <= 0xe000efff) ||
-        (address >= 0xe002e000 && address <= 0xe002efff) ||
-        (address >= 0xe0040000 && address <= 0xe0041fff) ||
-        (address >= 0xe00ff000 && address <= 0xe00fffff);
-}
-
-void v8m_security_lookup(CPUARMState *env, uint32_t address,
-                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                V8M_SAttributes *sattrs)
-{
-    /* Look up the security attributes for this address. Compare the
-     * pseudocode SecurityCheck() function.
-     * We assume the caller has zero-initialized *sattrs.
-     */
-    ARMCPU *cpu = env_archcpu(env);
-    int r;
-    bool idau_exempt = false, idau_ns = true, idau_nsc = true;
-    int idau_region = IREGION_NOTVALID;
-    uint32_t addr_page_base = address & TARGET_PAGE_MASK;
-    uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
-
-    if (cpu->idau) {
-        IDAUInterfaceClass *iic = IDAU_INTERFACE_GET_CLASS(cpu->idau);
-        IDAUInterface *ii = IDAU_INTERFACE(cpu->idau);
-
-        iic->check(ii, address, &idau_region, &idau_exempt, &idau_ns,
-                   &idau_nsc);
-    }
-
-    if (access_type == MMU_INST_FETCH && extract32(address, 28, 4) == 0xf) {
-        /* 0xf0000000..0xffffffff is always S for insn fetches */
-        return;
-    }
-
-    if (idau_exempt || v8m_is_sau_exempt(env, address, access_type)) {
-        sattrs->ns = !regime_is_secure(env, mmu_idx);
-        return;
-    }
-
-    if (idau_region != IREGION_NOTVALID) {
-        sattrs->irvalid = true;
-        sattrs->iregion = idau_region;
-    }
-
-    switch (env->sau.ctrl & 3) {
-    case 0: /* SAU.ENABLE == 0, SAU.ALLNS == 0 */
-        break;
-    case 2: /* SAU.ENABLE == 0, SAU.ALLNS == 1 */
-        sattrs->ns = true;
-        break;
-    default: /* SAU.ENABLE == 1 */
-        for (r = 0; r < cpu->sau_sregion; r++) {
-            if (env->sau.rlar[r] & 1) {
-                uint32_t base = env->sau.rbar[r] & ~0x1f;
-                uint32_t limit = env->sau.rlar[r] | 0x1f;
-
-                if (base <= address && limit >= address) {
-                    if (base > addr_page_base || limit < addr_page_limit) {
-                        sattrs->subpage = true;
-                    }
-                    if (sattrs->srvalid) {
-                        /* If we hit in more than one region then we must report
-                         * as Secure, not NS-Callable, with no valid region
-                         * number info.
-                         */
-                        sattrs->ns = false;
-                        sattrs->nsc = false;
-                        sattrs->sregion = 0;
-                        sattrs->srvalid = false;
-                        break;
-                    } else {
-                        if (env->sau.rlar[r] & 2) {
-                            sattrs->nsc = true;
-                        } else {
-                            sattrs->ns = true;
-                        }
-                        sattrs->srvalid = true;
-                        sattrs->sregion = r;
-                    }
-                } else {
-                    /*
-                     * Address not in this region. We must check whether the
-                     * region covers addresses in the same page as our address.
-                     * In that case we must not report a size that covers the
-                     * whole page for a subsequent hit against a different MPU
-                     * region or the background region, because it would result
-                     * in incorrect TLB hits for subsequent accesses to
-                     * addresses that are in this MPU region.
-                     */
-                    if (limit >= base &&
-                        ranges_overlap(base, limit - base + 1,
-                                       addr_page_base,
-                                       TARGET_PAGE_SIZE)) {
-                        sattrs->subpage = true;
-                    }
-                }
-            }
-        }
-        break;
-    }
-
-    /*
-     * The IDAU will override the SAU lookup results if it specifies
-     * higher security than the SAU does.
-     */
-    if (!idau_ns) {
-        if (sattrs->ns || (!idau_nsc && sattrs->nsc)) {
-            sattrs->ns = false;
-            sattrs->nsc = idau_nsc;
-        }
-    }
-}
-
 /* Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b82638b5a06..c15fba43c31 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -11,6 +11,7 @@
 #include "qemu/range.h"
 #include "cpu.h"
 #include "internals.h"
+#include "idau.h"
 #include "ptw.h"
 
 
@@ -766,6 +767,131 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     return !(*prot & (1 << access_type));
 }
 
+static bool v8m_is_sau_exempt(CPUARMState *env,
+                              uint32_t address, MMUAccessType access_type)
+{
+    /*
+     * The architecture specifies that certain address ranges are
+     * exempt from v8M SAU/IDAU checks.
+     */
+    return
+        (access_type == MMU_INST_FETCH && m_is_system_region(env, address)) ||
+        (address >= 0xe0000000 && address <= 0xe0002fff) ||
+        (address >= 0xe000e000 && address <= 0xe000efff) ||
+        (address >= 0xe002e000 && address <= 0xe002efff) ||
+        (address >= 0xe0040000 && address <= 0xe0041fff) ||
+        (address >= 0xe00ff000 && address <= 0xe00fffff);
+}
+
+void v8m_security_lookup(CPUARMState *env, uint32_t address,
+                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                V8M_SAttributes *sattrs)
+{
+    /*
+     * Look up the security attributes for this address. Compare the
+     * pseudocode SecurityCheck() function.
+     * We assume the caller has zero-initialized *sattrs.
+     */
+    ARMCPU *cpu = env_archcpu(env);
+    int r;
+    bool idau_exempt = false, idau_ns = true, idau_nsc = true;
+    int idau_region = IREGION_NOTVALID;
+    uint32_t addr_page_base = address & TARGET_PAGE_MASK;
+    uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
+
+    if (cpu->idau) {
+        IDAUInterfaceClass *iic = IDAU_INTERFACE_GET_CLASS(cpu->idau);
+        IDAUInterface *ii = IDAU_INTERFACE(cpu->idau);
+
+        iic->check(ii, address, &idau_region, &idau_exempt, &idau_ns,
+                   &idau_nsc);
+    }
+
+    if (access_type == MMU_INST_FETCH && extract32(address, 28, 4) == 0xf) {
+        /* 0xf0000000..0xffffffff is always S for insn fetches */
+        return;
+    }
+
+    if (idau_exempt || v8m_is_sau_exempt(env, address, access_type)) {
+        sattrs->ns = !regime_is_secure(env, mmu_idx);
+        return;
+    }
+
+    if (idau_region != IREGION_NOTVALID) {
+        sattrs->irvalid = true;
+        sattrs->iregion = idau_region;
+    }
+
+    switch (env->sau.ctrl & 3) {
+    case 0: /* SAU.ENABLE == 0, SAU.ALLNS == 0 */
+        break;
+    case 2: /* SAU.ENABLE == 0, SAU.ALLNS == 1 */
+        sattrs->ns = true;
+        break;
+    default: /* SAU.ENABLE == 1 */
+        for (r = 0; r < cpu->sau_sregion; r++) {
+            if (env->sau.rlar[r] & 1) {
+                uint32_t base = env->sau.rbar[r] & ~0x1f;
+                uint32_t limit = env->sau.rlar[r] | 0x1f;
+
+                if (base <= address && limit >= address) {
+                    if (base > addr_page_base || limit < addr_page_limit) {
+                        sattrs->subpage = true;
+                    }
+                    if (sattrs->srvalid) {
+                        /*
+                         * If we hit in more than one region then we must report
+                         * as Secure, not NS-Callable, with no valid region
+                         * number info.
+                         */
+                        sattrs->ns = false;
+                        sattrs->nsc = false;
+                        sattrs->sregion = 0;
+                        sattrs->srvalid = false;
+                        break;
+                    } else {
+                        if (env->sau.rlar[r] & 2) {
+                            sattrs->nsc = true;
+                        } else {
+                            sattrs->ns = true;
+                        }
+                        sattrs->srvalid = true;
+                        sattrs->sregion = r;
+                    }
+                } else {
+                    /*
+                     * Address not in this region. We must check whether the
+                     * region covers addresses in the same page as our address.
+                     * In that case we must not report a size that covers the
+                     * whole page for a subsequent hit against a different MPU
+                     * region or the background region, because it would result
+                     * in incorrect TLB hits for subsequent accesses to
+                     * addresses that are in this MPU region.
+                     */
+                    if (limit >= base &&
+                        ranges_overlap(base, limit - base + 1,
+                                       addr_page_base,
+                                       TARGET_PAGE_SIZE)) {
+                        sattrs->subpage = true;
+                    }
+                }
+            }
+        }
+        break;
+    }
+
+    /*
+     * The IDAU will override the SAU lookup results if it specifies
+     * higher security than the SAU does.
+     */
+    if (!idau_ns) {
+        if (sattrs->ns || (!idau_nsc && sattrs->nsc)) {
+            sattrs->ns = false;
+            sattrs->nsc = idau_nsc;
+        }
+    }
+}
+
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, MemTxAttrs *txattrs,
-- 
2.25.1


