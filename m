Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD11A03B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 17:31:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP7Uh-00010S-Qg
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 11:31:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP7JR-0007Pb-IJ
	for qemu-devel@nongnu.org; Fri, 10 May 2019 11:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP7JP-0008Er-VV
	for qemu-devel@nongnu.org; Fri, 10 May 2019 11:19:53 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36208)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hP7JP-0008ED-NP
	for qemu-devel@nongnu.org; Fri, 10 May 2019 11:19:51 -0400
Received: by mail-pg1-x543.google.com with SMTP id a3so3181989pgb.3
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=arkTudclBbivAZzWnq6ClicZUzHEE3qicGPLMaqemkE=;
	b=o1bcK7Y/KLk+oCtZu68b5QuVTg94gZkj8VRibWyLTLLXRmh2ll/RD0yD7QGWhtmkg9
	o8p/SB4r4veWG6WsRvAYRyZDBh+/cR9eG8k2vvALN5Z/YAOpq4l828/Kbd1zxsT8qiDv
	dz9B0CIhtb1/paoaNDmBes0moxLeLHHDDr/4z91lNfJIqC1fbpd4iXHxBb5QCqzDHMFx
	EDRSY5P9dlu/k35/xBTcH7wYQ49/1s+Hakmx0r2/de4Uq8zXZVx4DAYGYP8lTq1XzF/i
	bh2rpmTZ9oeknwUK93SeAJfVnFB8lpZoUp1MaT8SnC2pVsUzGepNUjbnC0v0NXdYTytr
	+q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=arkTudclBbivAZzWnq6ClicZUzHEE3qicGPLMaqemkE=;
	b=NqBsHDG+eTQPF1URMX9GXuthWLe2C2y8XV6W2lCseuXPr03vh6pbOIVsLdJOs2RFef
	ZpCgVEW/VocXU8Uare/vhcXkU/Ybv5VnK/IyQ/IY4BflTyMJ7YWopFTF82ZoWqVQ8gF0
	iNQElaP7ZOAfM9ecoG6X7UpIFEEmLW1tpBcfsf4hPn/NieC8GV651l2PI3ONijHEFT7X
	x1iag6cXk2DufziCM0tOJlLeVHG9O9vtQ1wtdDluADVJjOns8haOQv1A1+vixKNzTJCg
	ZljsRdlRTr4ZtyZ/ZUyzESNk1gTMZe+sD4o3iMp1Xn/n4HLJK+yYl6gBr8IfYg+zEf/D
	WePQ==
X-Gm-Message-State: APjAAAXfGPschEsAn/QIS0v7Kb8iLPrzyKGg9l6xhuYy+Qfmp+LTqlNP
	mQb4hKlAV8mWeHADiiQl1PpMSPUl7Ys=
X-Google-Smtp-Source: APXvYqwYVQG34tWCFXteJJrjyWJ0r1zB9A7+1ksmkjkKVROsy41z97PLauy4tQOFyHWkj8onilYvWw==
X-Received: by 2002:a63:af45:: with SMTP id s5mr14259077pgo.420.1557501590462; 
	Fri, 10 May 2019 08:19:50 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231])
	by smtp.gmail.com with ESMTPSA id 19sm5920517pgz.24.2019.05.10.08.19.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 08:19:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2019 08:19:20 -0700
Message-Id: <20190510151944.22981-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510151944.22981-1-richard.henderson@linaro.org>
References: <20190510151944.22981-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PULL 03/27] target/arm: Convert to CPUClass::tlb_fill
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-arm@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 10 +++--
 target/arm/cpu.c       | 22 +---------
 target/arm/helper.c    | 98 ++++++++++++++++++++++++++----------------
 target/arm/op_helper.c | 29 ++-----------
 4 files changed, 73 insertions(+), 86 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 587a1ddf58..5a02f458f3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -761,10 +761,12 @@ static inline bool arm_extabort_type(MemTxResult result)
     return result != MEMTX_DECODE_ERROR;
 }
 
-/* Do a page table walk and add page to TLB if possible */
-bool arm_tlb_fill(CPUState *cpu, vaddr address,
-                  MMUAccessType access_type, int mmu_idx,
-                  ARMMMUFaultInfo *fi);
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr);
+
+void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
+                       int mmu_idx, ARMMMUFaultInfo *fi) QEMU_NORETURN;
 
 /* Return true if the stage 1 translation regime is using LPAE format page
  * tables */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a181fa8dc1..bb8e824c3e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2133,23 +2133,6 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-#ifdef CONFIG_USER_ONLY
-static int arm_cpu_handle_mmu_fault(CPUState *cs, vaddr address, int size,
-                                    int rw, int mmu_idx)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    env->exception.vaddress = address;
-    if (rw == 2) {
-        cs->exception_index = EXCP_PREFETCH_ABORT;
-    } else {
-        cs->exception_index = EXCP_DATA_ABORT;
-    }
-    return 1;
-}
-#endif
-
 static gchar *arm_gdb_arch_name(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -2182,9 +2165,8 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->synchronize_from_tb = arm_cpu_synchronize_from_tb;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
-#ifdef CONFIG_USER_ONLY
-    cc->handle_mmu_fault = arm_cpu_handle_mmu_fault;
-#else
+    cc->tlb_fill = arm_cpu_tlb_fill;
+#ifndef CONFIG_USER_ONLY
     cc->do_interrupt = arm_cpu_do_interrupt;
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
     cc->do_transaction_failed = arm_cpu_do_transaction_failed;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1e6eb0d0f3..f1a2b94ddb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12596,43 +12596,6 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 }
 
-/* Walk the page table and (if the mapping exists) add the page
- * to the TLB. Return false on success, or true on failure. Populate
- * fsr with ARM DFSR/IFSR fault register format value on failure.
- */
-bool arm_tlb_fill(CPUState *cs, vaddr address,
-                  MMUAccessType access_type, int mmu_idx,
-                  ARMMMUFaultInfo *fi)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot;
-    int ret;
-    MemTxAttrs attrs = {};
-
-    ret = get_phys_addr(env, address, access_type,
-                        core_to_arm_mmu_idx(env, mmu_idx), &phys_addr,
-                        &attrs, &prot, &page_size, fi, NULL);
-    if (!ret) {
-        /*
-         * Map a single [sub]page. Regions smaller than our declared
-         * target page size are handled specially, so for those we
-         * pass in the exact addresses.
-         */
-        if (page_size >= TARGET_PAGE_SIZE) {
-            phys_addr &= TARGET_PAGE_MASK;
-            address &= TARGET_PAGE_MASK;
-        }
-        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
-                                prot, mmu_idx, page_size);
-        return 0;
-    }
-
-    return ret;
-}
-
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
@@ -13111,6 +13074,67 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
 
 #endif
 
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+#ifdef CONFIG_USER_ONLY
+    cpu->env.exception.vaddress = address;
+    if (access_type == MMU_INST_FETCH) {
+        cs->exception_index = EXCP_PREFETCH_ABORT;
+    } else {
+        cs->exception_index = EXCP_DATA_ABORT;
+    }
+    cpu_loop_exit_restore(cs, retaddr);
+#else
+    hwaddr phys_addr;
+    target_ulong page_size;
+    int prot, ret;
+    MemTxAttrs attrs = {};
+    ARMMMUFaultInfo fi = {};
+
+    /*
+     * Walk the page table and (if the mapping exists) add the page
+     * to the TLB.  On success, return true.  Otherwise, if probing,
+     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
+     * register format, and signal the fault.
+     */
+    ret = get_phys_addr(&cpu->env, address, access_type,
+                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
+                        &phys_addr, &attrs, &prot, &page_size, &fi, NULL);
+    if (likely(!ret)) {
+        /*
+         * Map a single [sub]page. Regions smaller than our declared
+         * target page size are handled specially, so for those we
+         * pass in the exact addresses.
+         */
+        if (page_size >= TARGET_PAGE_SIZE) {
+            phys_addr &= TARGET_PAGE_MASK;
+            address &= TARGET_PAGE_MASK;
+        }
+        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
+                                prot, mmu_idx, page_size);
+        return true;
+    } else if (probe) {
+        return false;
+    } else {
+        /* now we have a real cpu fault */
+        cpu_restore_state(cs, retaddr, true);
+        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
+    }
+#endif
+}
+
+#ifndef CONFIG_USER_ONLY
+void tlb_fill(CPUState *cs, target_ulong addr, int size,
+              MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
+{
+    arm_cpu_tlb_fill(cs, addr, size, access_type, mmu_idx, false, retaddr);
+}
+#endif
+
 void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
 {
     /* Implement DC ZVA, which zeroes a fixed-length block of memory.
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 8698b4dc83..8ee15a4bd4 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -126,8 +126,8 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
     return syn;
 }
 
-static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
-                          int mmu_idx, ARMMMUFaultInfo *fi)
+void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
+                       int mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUARMState *env = &cpu->env;
     int target_el;
@@ -179,27 +179,6 @@ static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
     raise_exception(env, exc, syn, target_el);
 }
 
-/* try to fill the TLB and return an exception if error. If retaddr is
- * NULL, it means that the function was called in C code (i.e. not
- * from generated code or from helper.c)
- */
-void tlb_fill(CPUState *cs, target_ulong addr, int size,
-              MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
-{
-    bool ret;
-    ARMMMUFaultInfo fi = {};
-
-    ret = arm_tlb_fill(cs, addr, access_type, mmu_idx, &fi);
-    if (unlikely(ret)) {
-        ARMCPU *cpu = ARM_CPU(cs);
-
-        /* now we have a real cpu fault */
-        cpu_restore_state(cs, retaddr, true);
-
-        deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
-    }
-}
-
 /* Raise a data fault alignment exception for the specified virtual address */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
@@ -212,7 +191,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     cpu_restore_state(cs, retaddr, true);
 
     fi.type = ARMFault_Alignment;
-    deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
+    arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
 /* arm_cpu_do_transaction_failed: handle a memory system error response
@@ -233,7 +212,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 
     fi.ea = arm_extabort_type(response);
     fi.type = ARMFault_SyncExternal;
-    deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
+    arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
 }
 
 #endif /* !defined(CONFIG_USER_ONLY) */
-- 
2.17.1


