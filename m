Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FF4606B60
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:41:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleE8-00074z-6V
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:41:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleAC-0008Rr-3b
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleA3-0007xZ-AB
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:37:11 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9z-00016a-CD
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:37:11 -0400
Received: by mail-pj1-x102c.google.com with SMTP id pb15so734653pjb.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DfngjCYW3yhM7GTZnvGecJb6bmu3XmLkK+TAKSRW4rQ=;
 b=Oowj5dC8FvOA10U/QDzHzPHfRLms3fjyFXA5oAsJXCys5YHx7PDyGBErl5y0tcE0Qs
 BrVV+pSje8pQPQhWM+zyU8HZvxQe01iFRJ2p8Z7tYrKYFqbGoLpRNceu3DWlyfUuAK7S
 bHRqjWFnTPSkyT7jQ7vPKkCXxMDaX39C9iTGG2OGTuLewEKJDv7kcn3bvB2APglZAXJ7
 Dmm+O9xJNy88uWVW1OadohKFEL2BXYK0sTmr7wstEo/qAWBmJrJQjr4Ku8gCAL9FqGde
 H4YXo6kNqsKyDUzpkhWMG+kAqXsVHvY/zdOEM6b/NJY1cKsaCUbpWOXPlsP2g6nuabfG
 7Z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DfngjCYW3yhM7GTZnvGecJb6bmu3XmLkK+TAKSRW4rQ=;
 b=S6auWlqe/7cgoXVxhh2uT38KPfo1xdK1pJ8gIXfbWswtJVZ/5wbCJ0BWPUgy+hnQ4e
 nkim1Zg3EZQNP3LaTPaNvIEw0KK8XbleuqS0cupWPK908UcQEmni4jquZF+l0kRe9u5Q
 dGiTuH/r0xV1FHcM3AoUwoxVYj7XgY9grI3FaEdSNN1CGxh5r2Dv0JJ0/tFmE+dZNeQ4
 s6w2ilYSWieb5GStVtzAce9ADNg/xFjkI9k34Ufx6mdu5g/3b8v3ac73D+54hxC0+djZ
 laCqEUUkmKqHnpaG3LrflpmA6vMldglki1ZBG2ac8Uvo1u5plcwFQhiY6eY9ds9tWwz9
 w02w==
X-Gm-Message-State: ACrzQf2rK5bwzDqZmk3Sx04PKtLBP5Xdqt3zdWHhOHskDybsUFECYLcD
 CqNAFp0+FHoYim1WQwCn1pUlH6UYFHOhvByI
X-Google-Smtp-Source: AMsMyM4jhBgGj2JA4jufNezut8qWb/tZ4SqSKzXFIMgzOU5p/pSlKSzE0CcyivnuPbn649q0eiPdnQ==
X-Received: by 2002:a17:90b:4d90:b0:20d:9ded:4144 with SMTP id
 oj16-20020a17090b4d9000b0020d9ded4144mr18364403pjb.90.1666305425967; 
 Thu, 20 Oct 2022 15:37:05 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:37:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 12/14] target/arm: Implement FEAT_HAFDBS,
 access flag portion
Date: Fri, 21 Oct 2022 08:35:46 +1000
Message-Id: <20221020223548.2310496-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Perform the atomic update for hardware management of the access flag.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Raise permission fault if pte read-only and atomic update reqd.
    Split out dirty bit portion.
    Prepare for a single update for AF + DB.
v5: Fix s1ns typo; incorporate i_yzsvv comment.
    Move the AF update before attributes are extracted and merged.
    Do permission check before pte writeback, per AArch64.S1Translate.
---
 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu64.c            |   1 +
 target/arm/ptw.c              | 176 +++++++++++++++++++++++++++++-----
 3 files changed, 156 insertions(+), 22 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index cfb4b0768b..580e67b190 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -32,6 +32,7 @@ the following architecture extensions:
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_GTG (Guest translation granule size)
+- FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 85e0d1daf1..fe1369fe96 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1165,6 +1165,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 1);   /* FEAT_HAFDBS, AF only */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 165e70d044..209ea7024b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -21,7 +21,9 @@ typedef struct S1Translate {
     bool in_secure;
     bool in_debug;
     bool out_secure;
+    bool out_rw;
     bool out_be;
+    hwaddr out_virt;
     hwaddr out_phys;
     void *out_host;
 } S1Translate;
@@ -238,6 +240,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
     uint8_t pte_attrs;
     bool pte_secure;
 
+    ptw->out_virt = addr;
+
     if (unlikely(ptw->in_debug)) {
         /*
          * From gdbstub, do not use softmmu so that we don't modify the
@@ -266,6 +270,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             pte_secure = is_secure;
         }
         ptw->out_host = NULL;
+        ptw->out_rw = false;
     } else {
         CPUTLBEntryFull *full;
         int flags;
@@ -280,6 +285,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             goto fail;
         }
         ptw->out_phys = full->phys_addr;
+        ptw->out_rw = full->prot & PROT_WRITE;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
     }
@@ -323,14 +329,16 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
+    void *host = ptw->out_host;
     uint32_t data;
 
-    if (likely(ptw->out_host)) {
+    if (likely(host)) {
         /* Page tables are in RAM, and we have the host address. */
+        data = qatomic_read((uint32_t *)host);
         if (ptw->out_be) {
-            data = ldl_be_p(ptw->out_host);
+            data = be32_to_cpu(data);
         } else {
-            data = ldl_le_p(ptw->out_host);
+            data = le32_to_cpu(data);
         }
     } else {
         /* Page tables are in MMIO. */
@@ -356,15 +364,25 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
+    void *host = ptw->out_host;
     uint64_t data;
 
-    if (likely(ptw->out_host)) {
+    if (likely(host)) {
         /* Page tables are in RAM, and we have the host address. */
+#ifdef CONFIG_ATOMIC64
+        data = qatomic_read__nocheck((uint64_t *)host);
         if (ptw->out_be) {
-            data = ldq_be_p(ptw->out_host);
+            data = be64_to_cpu(data);
         } else {
-            data = ldq_le_p(ptw->out_host);
+            data = le64_to_cpu(data);
         }
+#else
+        if (ptw->out_be) {
+            data = ldq_be_p(host);
+        } else {
+            data = ldq_le_p(host);
+        }
+#endif
     } else {
         /* Page tables are in MMIO. */
         MemTxAttrs attrs = { .secure = ptw->out_secure };
@@ -385,6 +403,91 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
     return data;
 }
 
+static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
+                             uint64_t new_val, S1Translate *ptw,
+                             ARMMMUFaultInfo *fi)
+{
+    uint64_t cur_val;
+    void *host = ptw->out_host;
+
+    if (unlikely(!host)) {
+        fi->type = ARMFault_UnsuppAtomicUpdate;
+        fi->s1ptw = true;
+        return 0;
+    }
+
+    /*
+     * Raising a stage2 Protection fault for an atomic update to a read-only
+     * page is delayed until it is certain that there is a change to make.
+     */
+    if (unlikely(!ptw->out_rw)) {
+        int flags;
+        void *discard;
+
+        env->tlb_fi = fi;
+        flags = probe_access_flags(env, ptw->out_virt, MMU_DATA_STORE,
+                                   arm_to_core_mmu_idx(ptw->in_ptw_idx),
+                                   true, &discard, 0);
+        env->tlb_fi = NULL;
+
+        if (unlikely(flags & TLB_INVALID_MASK)) {
+            assert(fi->type != ARMFault_None);
+            fi->s2addr = ptw->out_virt;
+            fi->stage2 = true;
+            fi->s1ptw = true;
+            fi->s1ns = !ptw->in_secure;
+            return 0;
+        }
+
+        /* In case CAS mismatches and we loop, remember writability. */
+        ptw->out_rw = true;
+    }
+
+#ifdef CONFIG_ATOMIC64
+    if (ptw->out_be) {
+        old_val = cpu_to_be64(old_val);
+        new_val = cpu_to_be64(new_val);
+        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)host, old_val, new_val);
+        cur_val = be64_to_cpu(cur_val);
+    } else {
+        old_val = cpu_to_le64(old_val);
+        new_val = cpu_to_le64(new_val);
+        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)host, old_val, new_val);
+        cur_val = le64_to_cpu(cur_val);
+    }
+#else
+    /*
+     * We can't support the full 64-bit atomic cmpxchg on the host.
+     * Because this is only used for FEAT_HAFDBS, which is only for AA64,
+     * we know that TCG_OVERSIZED_GUEST is set, which means that we are
+     * running in round-robin mode and could only race with dma i/o.
+     */
+#ifndef TCG_OVERSIZED_GUEST
+# error "Unexpected configuration"
+#endif
+    bool locked = qemu_mutex_iothread_locked();
+    if (!locked) {
+       qemu_mutex_lock_iothread();
+    }
+    if (ptw->out_be) {
+        cur_val = ldq_be_p(host);
+        if (cur_val == old_val) {
+            stq_be_p(host, new_val);
+        }
+    } else {
+        cur_val = ldq_le_p(host);
+        if (cur_val == old_val) {
+            stq_le_p(host, new_val);
+        }
+    }
+    if (!locked) {
+        qemu_mutex_unlock_iothread();
+    }
+#endif
+
+    return cur_val;
+}
+
 static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
                                      uint32_t *table, uint32_t address)
 {
@@ -1077,7 +1180,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    uint64_t descriptor;
+    uint64_t descriptor, new_descriptor;
     bool nstable;
 
     /* TODO: This code does not support shareability levels. */
@@ -1291,7 +1394,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
+    new_descriptor = descriptor;
 
+ restart_atomic_update:
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
         goto do_translation_fault;
@@ -1337,17 +1442,36 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * to give a correct page or table address, the address field
      * in a block descriptor is smaller; so we need to explicitly
      * clear the lower bits here before ORing in the low vaddr bits.
+     *
+     * Afterward, descaddr is the final physical address.
      */
     page_size = (1ULL << ((stride * (4 - level)) + 3));
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
 
+    if (likely(!ptw->in_debug)) {
+        /*
+         * Access flag.
+         * If HA is enabled, prepare to update the descriptor below.
+         * Otherwise, pass the access fault on to software.
+         */
+        if (!(descriptor & (1 << 10))) {
+            if (param.ha) {
+                new_descriptor |= 1 << 10; /* AF */
+            } else {
+                fi->type = ARMFault_AccessFlag;
+                goto do_fault;
+            }
+        }
+    }
+
     /*
-     * Extract attributes from the descriptor, and apply table descriptors.
-     * Stage 2 table descriptors do not include any attribute fields.
-     * HPD disables all the table attributes except NSTable.
+     * Extract attributes from the (modified) descriptor, and apply
+     * table descriptors. Stage 2 table descriptors do not include
+     * any attribute fields. HPD disables all the table attributes
+     * except NSTable.
      */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
+    attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
     if (!regime_is_stage2(mmu_idx)) {
         attrs |= nstable << 5; /* NS */
         if (!param.hpd) {
@@ -1361,18 +1485,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         }
     }
 
-    /*
-     * Here descaddr is the final physical address, and attributes
-     * are all in attrs.
-     */
-    if ((attrs & (1 << 10)) == 0) {
-        /* Access flag */
-        fi->type = ARMFault_AccessFlag;
-        goto do_fault;
-    }
-
     ap = extract32(attrs, 6, 2);
-
     if (regime_is_stage2(mmu_idx)) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
         xn = extract64(attrs, 54, 2);
@@ -1389,6 +1502,25 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         goto do_fault;
     }
 
+    /* If FEAT_HAFDBS has made changes, update the PTE. */
+    if (new_descriptor != descriptor) {
+        new_descriptor = arm_casq_ptw(env, descriptor, new_descriptor, ptw, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
+        /*
+         * I_YZSVV says that if the in-memory descriptor has changed,
+         * then we must use the information in that new value
+         * (which might include a different output address, different
+         * attributes, or generate a fault).
+         * Restart the handling of the descriptor value from scratch.
+         */
+        if (new_descriptor != descriptor) {
+            descriptor = new_descriptor;
+            goto restart_atomic_update;
+        }
+    }
+
     if (ns) {
         /*
          * The NS bit will (as required by the architecture) have no effect if
-- 
2.34.1


