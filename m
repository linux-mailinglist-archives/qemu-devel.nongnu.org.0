Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E92D54476C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:29:35 +0200 (CEST)
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzETt-0000O0-OL
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE70-0001Si-Vj
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6y-00060e-Nh
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:54 -0400
Received: by mail-wr1-x433.google.com with SMTP id q15so23422931wrc.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VG4un4lC8exaz+aSq1lh+oEDzRxMaXaOxXswh3zyYxQ=;
 b=RNFip/6FQJ0qiatRXnuFSwr2NKZi/wJ4POxtXwUSNPccIJDNi+9LIRwKQL5d1L9KAR
 x9BNLllr8/EJOWN7f2Eu3AHuGm1bMN+kmHfMOhTfjwtc8ATMygZrhOyd0kgybk4c2fuJ
 VqrrIo2kJE6l5SQbS4OI/bXMJ1V4kSLQeE7QjyzXWYvkLfc2gk0acJcjPpzMQ18rpOT9
 kq4TDC+Cdvrbs34UFdvexWrwh/za0WJTZjIpd8LfOOvekl+bISw/EbpDG845eKVU7ME5
 x1mXIBk0MUfImKqtaW0XcTIbhcv7RMHn20vgKbmNqzdCbMcaubMxgjfPia3EkPPTZwP2
 T9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VG4un4lC8exaz+aSq1lh+oEDzRxMaXaOxXswh3zyYxQ=;
 b=2MFgUC6g6iPq+I3u1DU+/eBMlaG/ivGHCtEjHv6QWk9PJpE/JZoKAiyR90jIgfzRrP
 8/FKPdmKhKegxo9ijvMx6FUcd1GYeLmdDskFXQg/+0kWegBJ3RvhwCXjNgy2lMswIuPS
 HYtnrOxD4P7I7bSss9BaEzixWMu2yOPZmakxJgborcEfOxPrKNYyJYjgSBqk2InHDPu4
 /7Ji7/cOef88BB80eSdetr7EYXq5sSdjutOolCW0U3bE4Sz8h6eFP4akwDNirFsRwiog
 /b3RqLCvTAyvJBlG/ME2mSEzZCvoJ6d9iwmwRnkoE1eD6r18GWXBL3bRqr6fk3N6NQa9
 8T+Q==
X-Gm-Message-State: AOAM531aZgBVwAIuhQua8xCvrSpeQ8NGz6tP58UGLnMt7IOCgcy1e9iw
 sKEoy13DTmHpOgHkJ9obcotMkvnl3CL+Mg==
X-Google-Smtp-Source: ABdhPJxfS9v7a1fKd9R2P9G0ajDqkSz0I8yLOLYEZSvVGvESu9Ls/7vsujIKr3+guyV/bMcSJ8PfAQ==
X-Received: by 2002:a5d:58ed:0:b0:217:dd5:7508 with SMTP id
 f13-20020a5d58ed000000b002170dd57508mr24328263wrd.606.1654765551221; 
 Thu, 09 Jun 2022 02:05:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/55] target/arm: Move get_phys_addr_v5 to ptw.c
Date: Thu,  9 Jun 2022 10:04:52 +0100
Message-Id: <20220609090537.1971756-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Message-id: 20220604040607.269301-4-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  15 +++--
 target/arm/helper.c | 137 +++-----------------------------------------
 target/arm/ptw.c    | 123 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+), 135 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index e2023ae7508..2dbd97b8cbf 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -11,16 +11,21 @@
 
 #ifndef CONFIG_USER_ONLY
 
+uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi);
+uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi);
+
 bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
                                  ARMCacheAttrs s1, ARMCacheAttrs s2);
 
-bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
-                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                      hwaddr *phys_ptr, int *prot,
-                      target_ulong *page_size,
-                      ARMMMUFaultInfo *fi);
+bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
+                              uint32_t *table, uint32_t address);
+int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
+                  int ap, int domain_prot);
+
 bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, int *prot,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3ffd122178d..321716914b1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10578,8 +10578,7 @@ bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
  * @ap:          The 3-bit access permissions (AP[2:0])
  * @domain_prot: The 2-bit domain access permissions
  */
-static inline int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                int ap, int domain_prot)
+int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap, int domain_prot)
 {
     bool is_user = regime_is_user(env, mmu_idx);
 
@@ -10782,8 +10781,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     return prot_rw | PAGE_EXEC;
 }
 
-static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                     uint32_t *table, uint32_t address)
+bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
+                              uint32_t *table, uint32_t address)
 {
     /* Note that we can only get here for an AArch32 PL0/PL1 lookup */
     TCR *tcr = regime_tcr(env, mmu_idx);
@@ -10882,8 +10881,8 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -10911,8 +10910,8 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     return 0;
 }
 
-static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -10940,128 +10939,6 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     return 0;
 }
 
-bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
-                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                      hwaddr *phys_ptr, int *prot,
-                      target_ulong *page_size,
-                      ARMMMUFaultInfo *fi)
-{
-    CPUState *cs = env_cpu(env);
-    int level = 1;
-    uint32_t table;
-    uint32_t desc;
-    int type;
-    int ap;
-    int domain = 0;
-    int domain_prot;
-    hwaddr phys_addr;
-    uint32_t dacr;
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
-    domain = (desc >> 5) & 0x0f;
-    if (regime_el(env, mmu_idx) == 1) {
-        dacr = env->cp15.dacr_ns;
-    } else {
-        dacr = env->cp15.dacr_s;
-    }
-    domain_prot = (dacr >> (domain * 2)) & 3;
-    if (type == 0) {
-        /* Section translation fault.  */
-        fi->type = ARMFault_Translation;
-        goto do_fault;
-    }
-    if (type != 2) {
-        level = 2;
-    }
-    if (domain_prot == 0 || domain_prot == 2) {
-        fi->type = ARMFault_Domain;
-        goto do_fault;
-    }
-    if (type == 2) {
-        /* 1Mb section.  */
-        phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
-        ap = (desc >> 10) & 3;
-        *page_size = 1024 * 1024;
-    } else {
-        /* Lookup l2 entry.  */
-        if (type == 1) {
-            /* Coarse pagetable.  */
-            table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        } else {
-            /* Fine pagetable.  */
-            table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
-        }
-        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
-        if (fi->type != ARMFault_None) {
-            goto do_fault;
-        }
-        switch (desc & 3) {
-        case 0: /* Page translation fault.  */
-            fi->type = ARMFault_Translation;
-            goto do_fault;
-        case 1: /* 64k page.  */
-            phys_addr = (desc & 0xffff0000) | (address & 0xffff);
-            ap = (desc >> (4 + ((address >> 13) & 6))) & 3;
-            *page_size = 0x10000;
-            break;
-        case 2: /* 4k page.  */
-            phys_addr = (desc & 0xfffff000) | (address & 0xfff);
-            ap = (desc >> (4 + ((address >> 9) & 6))) & 3;
-            *page_size = 0x1000;
-            break;
-        case 3: /* 1k page, or ARMv6/XScale "extended small (4k) page" */
-            if (type == 1) {
-                /* ARMv6/XScale extended small page format */
-                if (arm_feature(env, ARM_FEATURE_XSCALE)
-                    || arm_feature(env, ARM_FEATURE_V6)) {
-                    phys_addr = (desc & 0xfffff000) | (address & 0xfff);
-                    *page_size = 0x1000;
-                } else {
-                    /* UNPREDICTABLE in ARMv5; we choose to take a
-                     * page translation fault.
-                     */
-                    fi->type = ARMFault_Translation;
-                    goto do_fault;
-                }
-            } else {
-                phys_addr = (desc & 0xfffffc00) | (address & 0x3ff);
-                *page_size = 0x400;
-            }
-            ap = (desc >> 4) & 3;
-            break;
-        default:
-            /* Never happens, but compiler isn't smart enough to tell.  */
-            g_assert_not_reached();
-        }
-    }
-    *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
-    *prot |= *prot ? PAGE_EXEC : 0;
-    if (!(*prot & (1 << access_type))) {
-        /* Access permission fault.  */
-        fi->type = ARMFault_Permission;
-        goto do_fault;
-    }
-    *phys_ptr = phys_addr;
-    return false;
-do_fault:
-    fi->domain = domain;
-    fi->level = level;
-    return true;
-}
-
 bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
                       hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 318000f6d94..09c44726287 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -13,6 +13,129 @@
 #include "ptw.h"
 
 
+static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
+                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                             hwaddr *phys_ptr, int *prot,
+                             target_ulong *page_size,
+                             ARMMMUFaultInfo *fi)
+{
+    CPUState *cs = env_cpu(env);
+    int level = 1;
+    uint32_t table;
+    uint32_t desc;
+    int type;
+    int ap;
+    int domain = 0;
+    int domain_prot;
+    hwaddr phys_addr;
+    uint32_t dacr;
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
+    domain = (desc >> 5) & 0x0f;
+    if (regime_el(env, mmu_idx) == 1) {
+        dacr = env->cp15.dacr_ns;
+    } else {
+        dacr = env->cp15.dacr_s;
+    }
+    domain_prot = (dacr >> (domain * 2)) & 3;
+    if (type == 0) {
+        /* Section translation fault.  */
+        fi->type = ARMFault_Translation;
+        goto do_fault;
+    }
+    if (type != 2) {
+        level = 2;
+    }
+    if (domain_prot == 0 || domain_prot == 2) {
+        fi->type = ARMFault_Domain;
+        goto do_fault;
+    }
+    if (type == 2) {
+        /* 1Mb section.  */
+        phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
+        ap = (desc >> 10) & 3;
+        *page_size = 1024 * 1024;
+    } else {
+        /* Lookup l2 entry.  */
+        if (type == 1) {
+            /* Coarse pagetable.  */
+            table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
+        } else {
+            /* Fine pagetable.  */
+            table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
+        }
+        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+                           mmu_idx, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
+        switch (desc & 3) {
+        case 0: /* Page translation fault.  */
+            fi->type = ARMFault_Translation;
+            goto do_fault;
+        case 1: /* 64k page.  */
+            phys_addr = (desc & 0xffff0000) | (address & 0xffff);
+            ap = (desc >> (4 + ((address >> 13) & 6))) & 3;
+            *page_size = 0x10000;
+            break;
+        case 2: /* 4k page.  */
+            phys_addr = (desc & 0xfffff000) | (address & 0xfff);
+            ap = (desc >> (4 + ((address >> 9) & 6))) & 3;
+            *page_size = 0x1000;
+            break;
+        case 3: /* 1k page, or ARMv6/XScale "extended small (4k) page" */
+            if (type == 1) {
+                /* ARMv6/XScale extended small page format */
+                if (arm_feature(env, ARM_FEATURE_XSCALE)
+                    || arm_feature(env, ARM_FEATURE_V6)) {
+                    phys_addr = (desc & 0xfffff000) | (address & 0xfff);
+                    *page_size = 0x1000;
+                } else {
+                    /*
+                     * UNPREDICTABLE in ARMv5; we choose to take a
+                     * page translation fault.
+                     */
+                    fi->type = ARMFault_Translation;
+                    goto do_fault;
+                }
+            } else {
+                phys_addr = (desc & 0xfffffc00) | (address & 0x3ff);
+                *page_size = 0x400;
+            }
+            ap = (desc >> 4) & 3;
+            break;
+        default:
+            /* Never happens, but compiler isn't smart enough to tell.  */
+            g_assert_not_reached();
+        }
+    }
+    *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+    *prot |= *prot ? PAGE_EXEC : 0;
+    if (!(*prot & (1 << access_type))) {
+        /* Access permission fault.  */
+        fi->type = ARMFault_Permission;
+        goto do_fault;
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


