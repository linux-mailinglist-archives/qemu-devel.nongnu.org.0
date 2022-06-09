Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4742454474D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:24:25 +0200 (CEST)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEOu-0002uh-9Y
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE72-0001U6-JW
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE70-00060y-CF
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id s1so8358409wra.9
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XtUVBNi8Hf8p1qU71YRb6ABVBGS+B/b2TUi9wKuJp40=;
 b=yMpIlZ96Z0LOVZ7k1utzjc/cAFyrCn9mxGwsiOlzYo2jb7AiftK7CcKKnXh3XKC3tt
 WtLtGQHBEtKtYUO6SDa4VeAaiJzUKVtcsG2ghGCDQg0U+0KOBbiZntZRAYXDDviBKP7G
 qoK82OJ/32nOckI1sh7/Qp5/lG72LyVl/gL0EDN9wpGBWu+TsQFJ1g9BUkjBo7wnih5E
 axqElVgegtiXHlsVUaB0Hgvtploa85p8BCfYLrjiHztltsm2LohkhKFNqeGip42yX2+I
 LmFYHc6rgLJqxlGdSdy/4ZGUDb+8IDAyFn9i/LkYdcLqKTUup4mm7x0zoH2CthlQiYEf
 fD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XtUVBNi8Hf8p1qU71YRb6ABVBGS+B/b2TUi9wKuJp40=;
 b=2O0pZRw44D2B4GG8peeTb2Ss/VQPZLt9qe7mA6MmkS7AsSBoMbe4hVR9KlXoTfimgS
 anZOLTim/K62CZKq1k/PAsAncj5dTCOt5i1P/gKMVp6+FDAWut1afF+5kU/hIikR+zzP
 BUrVR/ksv3MDBtvdgV/uVbVmeV47vaiEBEZyri/dtYGZlLZ4aa6hXXVIiwQjr1Wq5f9q
 l0l+kaL2NGdywzVLCOEoF0lXYa+bc2P+23M3OnblxNkMfqySnAILQzxClT34llWNVzZ4
 yaEfRae1HT2pMNK2VQAUb4B11Gnku84mg7H4KJaiuXvVrH5DfNMwJkGJ64K3mw7a4gE9
 z4gA==
X-Gm-Message-State: AOAM531PKq04ytrCttB2kAraZ8MfLLlzUN2u80JHAxTECzzF5g6n9jhB
 gElyoCeX+9xxn8GI35ihey4SyLnHlLPnXw==
X-Google-Smtp-Source: ABdhPJzCDQ5p3EIWarWSH6Tyg2DD9oty4dJVHmy6YqmUmXVp5N2cWEXkmkXdeVsxs8Uq37vUFp0dRg==
X-Received: by 2002:a05:6000:152:b0:216:160:2e60 with SMTP id
 r18-20020a056000015200b0021601602e60mr27313517wrx.663.1654765552585; 
 Thu, 09 Jun 2022 02:05:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/55] target/arm: Move get_phys_addr_v6 to ptw.c
Date: Thu,  9 Jun 2022 10:04:53 +0100
Message-Id: <20220609090537.1971756-12-peter.maydell@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-5-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  11 +--
 target/arm/helper.c | 161 +-------------------------------------------
 target/arm/ptw.c    | 153 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+), 164 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 2dbd97b8cbf..349b842d3ce 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -25,15 +25,18 @@ bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
                               uint32_t *table, uint32_t address);
 int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
                   int ap, int domain_prot);
+int simple_ap_to_rw_prot_is_user(int ap, bool is_user);
+
+static inline int
+simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
+{
+    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
+}
 
 bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, int *prot,
                           ARMMMUFaultInfo *fi);
-bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
-                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                      hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                      target_ulong *page_size, ARMMMUFaultInfo *fi);
 bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, int *prot,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 321716914b1..4a588220250 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10631,7 +10631,7 @@ int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap, int domain_prot)
  * @ap:      The 2-bit simple AP (AP[2:1])
  * @is_user: TRUE if accessing from PL0
  */
-static inline int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
+int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
 {
     switch (ap) {
     case 0:
@@ -10647,12 +10647,6 @@ static inline int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
     }
 }
 
-static inline int
-simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
-{
-    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
-}
-
 /* Translate S2 section/page access permissions to protection flags
  *
  * @env:     CPUARMState
@@ -10939,159 +10933,6 @@ uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     return 0;
 }
 
-bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
-                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                      hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                      target_ulong *page_size, ARMMMUFaultInfo *fi)
-{
-    CPUState *cs = env_cpu(env);
-    ARMCPU *cpu = env_archcpu(env);
-    int level = 1;
-    uint32_t table;
-    uint32_t desc;
-    uint32_t xn;
-    uint32_t pxn = 0;
-    int type;
-    int ap;
-    int domain = 0;
-    int domain_prot;
-    hwaddr phys_addr;
-    uint32_t dacr;
-    bool ns;
-
-    /* Pagetable walk.  */
-    /* Lookup l1 descriptor.  */
-    if (!get_level1_table_address(env, mmu_idx, &table, address)) {
-        /* Section translation fault if page walk is disabled by PD0 or PD1 */
-        fi->type = ARMFault_Translation;
-        goto do_fault;
-    }
-    desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
-    if (fi->type != ARMFault_None) {
-        goto do_fault;
-    }
-    type = (desc & 3);
-    if (type == 0 || (type == 3 && !cpu_isar_feature(aa32_pxn, cpu))) {
-        /* Section translation fault, or attempt to use the encoding
-         * which is Reserved on implementations without PXN.
-         */
-        fi->type = ARMFault_Translation;
-        goto do_fault;
-    }
-    if ((type == 1) || !(desc & (1 << 18))) {
-        /* Page or Section.  */
-        domain = (desc >> 5) & 0x0f;
-    }
-    if (regime_el(env, mmu_idx) == 1) {
-        dacr = env->cp15.dacr_ns;
-    } else {
-        dacr = env->cp15.dacr_s;
-    }
-    if (type == 1) {
-        level = 2;
-    }
-    domain_prot = (dacr >> (domain * 2)) & 3;
-    if (domain_prot == 0 || domain_prot == 2) {
-        /* Section or Page domain fault */
-        fi->type = ARMFault_Domain;
-        goto do_fault;
-    }
-    if (type != 1) {
-        if (desc & (1 << 18)) {
-            /* Supersection.  */
-            phys_addr = (desc & 0xff000000) | (address & 0x00ffffff);
-            phys_addr |= (uint64_t)extract32(desc, 20, 4) << 32;
-            phys_addr |= (uint64_t)extract32(desc, 5, 4) << 36;
-            *page_size = 0x1000000;
-        } else {
-            /* Section.  */
-            phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
-            *page_size = 0x100000;
-        }
-        ap = ((desc >> 10) & 3) | ((desc >> 13) & 4);
-        xn = desc & (1 << 4);
-        pxn = desc & 1;
-        ns = extract32(desc, 19, 1);
-    } else {
-        if (cpu_isar_feature(aa32_pxn, cpu)) {
-            pxn = (desc >> 2) & 1;
-        }
-        ns = extract32(desc, 3, 1);
-        /* Lookup l2 entry.  */
-        table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
-        if (fi->type != ARMFault_None) {
-            goto do_fault;
-        }
-        ap = ((desc >> 4) & 3) | ((desc >> 7) & 4);
-        switch (desc & 3) {
-        case 0: /* Page translation fault.  */
-            fi->type = ARMFault_Translation;
-            goto do_fault;
-        case 1: /* 64k page.  */
-            phys_addr = (desc & 0xffff0000) | (address & 0xffff);
-            xn = desc & (1 << 15);
-            *page_size = 0x10000;
-            break;
-        case 2: case 3: /* 4k page.  */
-            phys_addr = (desc & 0xfffff000) | (address & 0xfff);
-            xn = desc & 1;
-            *page_size = 0x1000;
-            break;
-        default:
-            /* Never happens, but compiler isn't smart enough to tell.  */
-            g_assert_not_reached();
-        }
-    }
-    if (domain_prot == 3) {
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-    } else {
-        if (pxn && !regime_is_user(env, mmu_idx)) {
-            xn = 1;
-        }
-        if (xn && access_type == MMU_INST_FETCH) {
-            fi->type = ARMFault_Permission;
-            goto do_fault;
-        }
-
-        if (arm_feature(env, ARM_FEATURE_V6K) &&
-                (regime_sctlr(env, mmu_idx) & SCTLR_AFE)) {
-            /* The simplified model uses AP[0] as an access control bit.  */
-            if ((ap & 1) == 0) {
-                /* Access flag fault.  */
-                fi->type = ARMFault_AccessFlag;
-                goto do_fault;
-            }
-            *prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
-        } else {
-            *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
-        }
-        if (*prot && !xn) {
-            *prot |= PAGE_EXEC;
-        }
-        if (!(*prot & (1 << access_type))) {
-            /* Access permission fault.  */
-            fi->type = ARMFault_Permission;
-            goto do_fault;
-        }
-    }
-    if (ns) {
-        /* The NS bit will (as required by the architecture) have no effect if
-         * the CPU doesn't support TZ or this is a non-secure translation
-         * regime, because the attribute will already be non-secure.
-         */
-        attrs->secure = false;
-    }
-    *phys_ptr = phys_addr;
-    return false;
-do_fault:
-    fi->domain = domain;
-    fi->level = level;
-    return true;
-}
-
 /*
  * check_s2_mmu_setup
  * @cpu:        ARMCPU
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 09c44726287..6a1f4b549d8 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -136,6 +136,159 @@ do_fault:
     return true;
 }
 
+static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
+                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                             hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
+                             target_ulong *page_size, ARMMMUFaultInfo *fi)
+{
+    CPUState *cs = env_cpu(env);
+    ARMCPU *cpu = env_archcpu(env);
+    int level = 1;
+    uint32_t table;
+    uint32_t desc;
+    uint32_t xn;
+    uint32_t pxn = 0;
+    int type;
+    int ap;
+    int domain = 0;
+    int domain_prot;
+    hwaddr phys_addr;
+    uint32_t dacr;
+    bool ns;
+
+    /* Pagetable walk.  */
+    /* Lookup l1 descriptor.  */
+    if (!get_level1_table_address(env, mmu_idx, &table, address)) {
+        /* Section translation fault if page walk is disabled by PD0 or PD1 */
+        fi->type = ARMFault_Translation;
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+                       mmu_idx, fi);
+    if (fi->type != ARMFault_None) {
+        goto do_fault;
+    }
+    type = (desc & 3);
+    if (type == 0 || (type == 3 && !cpu_isar_feature(aa32_pxn, cpu))) {
+        /* Section translation fault, or attempt to use the encoding
+         * which is Reserved on implementations without PXN.
+         */
+        fi->type = ARMFault_Translation;
+        goto do_fault;
+    }
+    if ((type == 1) || !(desc & (1 << 18))) {
+        /* Page or Section.  */
+        domain = (desc >> 5) & 0x0f;
+    }
+    if (regime_el(env, mmu_idx) == 1) {
+        dacr = env->cp15.dacr_ns;
+    } else {
+        dacr = env->cp15.dacr_s;
+    }
+    if (type == 1) {
+        level = 2;
+    }
+    domain_prot = (dacr >> (domain * 2)) & 3;
+    if (domain_prot == 0 || domain_prot == 2) {
+        /* Section or Page domain fault */
+        fi->type = ARMFault_Domain;
+        goto do_fault;
+    }
+    if (type != 1) {
+        if (desc & (1 << 18)) {
+            /* Supersection.  */
+            phys_addr = (desc & 0xff000000) | (address & 0x00ffffff);
+            phys_addr |= (uint64_t)extract32(desc, 20, 4) << 32;
+            phys_addr |= (uint64_t)extract32(desc, 5, 4) << 36;
+            *page_size = 0x1000000;
+        } else {
+            /* Section.  */
+            phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
+            *page_size = 0x100000;
+        }
+        ap = ((desc >> 10) & 3) | ((desc >> 13) & 4);
+        xn = desc & (1 << 4);
+        pxn = desc & 1;
+        ns = extract32(desc, 19, 1);
+    } else {
+        if (cpu_isar_feature(aa32_pxn, cpu)) {
+            pxn = (desc >> 2) & 1;
+        }
+        ns = extract32(desc, 3, 1);
+        /* Lookup l2 entry.  */
+        table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
+        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+                           mmu_idx, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
+        ap = ((desc >> 4) & 3) | ((desc >> 7) & 4);
+        switch (desc & 3) {
+        case 0: /* Page translation fault.  */
+            fi->type = ARMFault_Translation;
+            goto do_fault;
+        case 1: /* 64k page.  */
+            phys_addr = (desc & 0xffff0000) | (address & 0xffff);
+            xn = desc & (1 << 15);
+            *page_size = 0x10000;
+            break;
+        case 2: case 3: /* 4k page.  */
+            phys_addr = (desc & 0xfffff000) | (address & 0xfff);
+            xn = desc & 1;
+            *page_size = 0x1000;
+            break;
+        default:
+            /* Never happens, but compiler isn't smart enough to tell.  */
+            g_assert_not_reached();
+        }
+    }
+    if (domain_prot == 3) {
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    } else {
+        if (pxn && !regime_is_user(env, mmu_idx)) {
+            xn = 1;
+        }
+        if (xn && access_type == MMU_INST_FETCH) {
+            fi->type = ARMFault_Permission;
+            goto do_fault;
+        }
+
+        if (arm_feature(env, ARM_FEATURE_V6K) &&
+                (regime_sctlr(env, mmu_idx) & SCTLR_AFE)) {
+            /* The simplified model uses AP[0] as an access control bit.  */
+            if ((ap & 1) == 0) {
+                /* Access flag fault.  */
+                fi->type = ARMFault_AccessFlag;
+                goto do_fault;
+            }
+            *prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
+        } else {
+            *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+        }
+        if (*prot && !xn) {
+            *prot |= PAGE_EXEC;
+        }
+        if (!(*prot & (1 << access_type))) {
+            /* Access permission fault.  */
+            fi->type = ARMFault_Permission;
+            goto do_fault;
+        }
+    }
+    if (ns) {
+        /* The NS bit will (as required by the architecture) have no effect if
+         * the CPU doesn't support TZ or this is a non-secure translation
+         * regime, because the attribute will already be non-secure.
+         */
+        attrs->secure = false;
+    }
+    *phys_ptr = phys_addr;
+    return false;
+do_fault:
+    fi->domain = domain;
+    fi->level = level;
+    return true;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.25.1


