Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3271C5447C4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:40:46 +0200 (CEST)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEej-0006jL-6C
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE77-0001X7-3o
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:01 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE75-000620-2C
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:00 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 i17-20020a7bc951000000b0039c4760ec3fso594191wml.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0CrroLgAVXvSasQsUTUPnEeQd/AepQTm/OwhtRxFesc=;
 b=oS8y6H0wz3miCZrehSvpsKh3E4CCBENGX9eKT4jV7y9XYRXYC1sFicKCHV6dDEirAL
 ZJGnUABEGeEkp+qysASvYMPtU7xR9w1lubLNvIuyUPO87abBD/NWxFrT+cCj2P6C6utE
 Z3edGgRmyDGfnOVoB+sEBfmlTpyHJCNCAt+A9MjPUQ3OL6lns1UTCUJu34FgvVlYiF+o
 WslEjfFr3k5YNcQvpHH2730M0E1Cey4r0k09Vn+VkuqBE93MTF9YogMlZsA7OZ4gkw9k
 c+BtND+LWBc2bJENbkJ+vyVKYm8kUtkqtpmNQU02fTqGMKit00vr+qkIgbXo4D9uAvud
 zbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0CrroLgAVXvSasQsUTUPnEeQd/AepQTm/OwhtRxFesc=;
 b=YYiurH1qabR7SnBlRqTy/eMYJPaofvaAPFDwws1ezD/LA1e/YsVO7ALL08pjXc3T45
 vrD0pEMZATsZ5sk3dthkuRnPVxKf7U0h/yuiIBLjxwKZcQK8sLSz3n5J3xvah1Jbzyi+
 VumRqYEYhJKo4k2SeRkAdn5oLhMejsnDs0JTnZU8PvO2gszTU0j4AZi2FVbGVsQRh4Eb
 U4GCjPVSNBfJcwcKWFO7ENI8UoT+Kh3DpEx7TSHZREEy8tkZ/EIKxRGWed9e457u7Dts
 Lj/XbMOjQrNaatzX1Mz816MuVFisOe7+NWc8mclicqULB9Z8XGam6qfN+c7Nevz0eEku
 3sew==
X-Gm-Message-State: AOAM531xN9gfJ4iy9rV9Dt68JjcYVQccfDsQSwupfceI7RcMd7310fi1
 DtdhpCsvamXsjKFOuIVTM9nuJWbqWZ6pUg==
X-Google-Smtp-Source: ABdhPJxni+gpUdmoVG6s5OaQCDXxFwS8n+Zfo/UBActphgoLn90rT7c1OgtjGBQmpF0CnV7KuU99CQ==
X-Received: by 2002:a7b:c04b:0:b0:39c:511e:2dd4 with SMTP id
 u11-20020a7bc04b000000b0039c511e2dd4mr2366777wmc.58.1654765557402; 
 Thu, 09 Jun 2022 02:05:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/55] target/arm: Move get_phys_addr_pmsav8 to ptw.c
Date: Thu,  9 Jun 2022 10:04:57 +0100
Message-Id: <20220609090537.1971756-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Message-id: 20220604040607.269301-9-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  5 ---
 target/arm/helper.c | 75 -------------------------------------------
 target/arm/ptw.c    | 77 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+), 80 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index d24b7c263a8..d569507951f 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -41,11 +41,6 @@ void get_phys_addr_pmsav7_default(CPUARMState *env,
                                   int32_t address, int *prot);
 bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user);
 
-bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                          int *prot, target_ulong *page_size,
-                          ARMMMUFaultInfo *fi);
 bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
                         bool s1_is_el0,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2ebaf694075..44997fd179d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11970,81 +11970,6 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     return !(*prot & (1 << access_type));
 }
 
-
-bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                          int *prot, target_ulong *page_size,
-                          ARMMMUFaultInfo *fi)
-{
-    uint32_t secure = regime_is_secure(env, mmu_idx);
-    V8M_SAttributes sattrs = {};
-    bool ret;
-    bool mpu_is_subpage;
-
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
-        if (access_type == MMU_INST_FETCH) {
-            /* Instruction fetches always use the MMU bank and the
-             * transaction attribute determined by the fetch address,
-             * regardless of CPU state. This is painful for QEMU
-             * to handle, because it would mean we need to encode
-             * into the mmu_idx not just the (user, negpri) information
-             * for the current security state but also that for the
-             * other security state, which would balloon the number
-             * of mmu_idx values needed alarmingly.
-             * Fortunately we can avoid this because it's not actually
-             * possible to arbitrarily execute code from memory with
-             * the wrong security attribute: it will always generate
-             * an exception of some kind or another, apart from the
-             * special case of an NS CPU executing an SG instruction
-             * in S&NSC memory. So we always just fail the translation
-             * here and sort things out in the exception handler
-             * (including possibly emulating an SG instruction).
-             */
-            if (sattrs.ns != !secure) {
-                if (sattrs.nsc) {
-                    fi->type = ARMFault_QEMU_NSCExec;
-                } else {
-                    fi->type = ARMFault_QEMU_SFault;
-                }
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
-                return true;
-            }
-        } else {
-            /* For data accesses we always use the MMU bank indicated
-             * by the current CPU state, but the security attributes
-             * might downgrade a secure access to nonsecure.
-             */
-            if (sattrs.ns) {
-                txattrs->secure = false;
-            } else if (!secure) {
-                /* NS access to S memory must fault.
-                 * Architecturally we should first check whether the
-                 * MPU information for this address indicates that we
-                 * are doing an unaligned access to Device memory, which
-                 * should generate a UsageFault instead. QEMU does not
-                 * currently check for that kind of unaligned access though.
-                 * If we added it we would need to do so as a special case
-                 * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
-                 */
-                fi->type = ARMFault_QEMU_SFault;
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
-                return true;
-            }
-        }
-    }
-
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
-                            txattrs, prot, &mpu_is_subpage, fi, NULL);
-    *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
-    return ret;
-}
-
 /* Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 27715dbfa8c..28caa7a7ae0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -605,6 +605,83 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     return !(*prot & (1 << access_type));
 }
 
+static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
+                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                                 int *prot, target_ulong *page_size,
+                                 ARMMMUFaultInfo *fi)
+{
+    uint32_t secure = regime_is_secure(env, mmu_idx);
+    V8M_SAttributes sattrs = {};
+    bool ret;
+    bool mpu_is_subpage;
+
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
+        if (access_type == MMU_INST_FETCH) {
+            /*
+             * Instruction fetches always use the MMU bank and the
+             * transaction attribute determined by the fetch address,
+             * regardless of CPU state. This is painful for QEMU
+             * to handle, because it would mean we need to encode
+             * into the mmu_idx not just the (user, negpri) information
+             * for the current security state but also that for the
+             * other security state, which would balloon the number
+             * of mmu_idx values needed alarmingly.
+             * Fortunately we can avoid this because it's not actually
+             * possible to arbitrarily execute code from memory with
+             * the wrong security attribute: it will always generate
+             * an exception of some kind or another, apart from the
+             * special case of an NS CPU executing an SG instruction
+             * in S&NSC memory. So we always just fail the translation
+             * here and sort things out in the exception handler
+             * (including possibly emulating an SG instruction).
+             */
+            if (sattrs.ns != !secure) {
+                if (sattrs.nsc) {
+                    fi->type = ARMFault_QEMU_NSCExec;
+                } else {
+                    fi->type = ARMFault_QEMU_SFault;
+                }
+                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                *phys_ptr = address;
+                *prot = 0;
+                return true;
+            }
+        } else {
+            /*
+             * For data accesses we always use the MMU bank indicated
+             * by the current CPU state, but the security attributes
+             * might downgrade a secure access to nonsecure.
+             */
+            if (sattrs.ns) {
+                txattrs->secure = false;
+            } else if (!secure) {
+                /*
+                 * NS access to S memory must fault.
+                 * Architecturally we should first check whether the
+                 * MPU information for this address indicates that we
+                 * are doing an unaligned access to Device memory, which
+                 * should generate a UsageFault instead. QEMU does not
+                 * currently check for that kind of unaligned access though.
+                 * If we added it we would need to do so as a special case
+                 * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
+                 */
+                fi->type = ARMFault_QEMU_SFault;
+                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                *phys_ptr = address;
+                *prot = 0;
+                return true;
+            }
+        }
+    }
+
+    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
+                            txattrs, prot, &mpu_is_subpage, fi, NULL);
+    *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
+    return ret;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.25.1


