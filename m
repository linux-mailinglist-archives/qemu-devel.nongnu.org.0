Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8291954A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 00:36:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOrdv-0006hv-Dy
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 18:35:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOrVJ-0007vf-AU
	for qemu-devel@nongnu.org; Thu, 09 May 2019 18:27:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOrVG-0005ag-7L
	for qemu-devel@nongnu.org; Thu, 09 May 2019 18:27:05 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42882)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOrVE-0005Zy-AS
	for qemu-devel@nongnu.org; Thu, 09 May 2019 18:27:02 -0400
Received: by mail-pl1-x641.google.com with SMTP id x15so1799287pln.9
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 15:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=13zPpr8eu2CJQOgqlDgYW1euE5CjP18/vmWEohkbXwc=;
	b=dO1yfP9HxFuzKXeCT+GQcDf1ZjAVtRQSKIyV6vEoFBGhr/HhJRsLwD9YtGY9vT5m9c
	NLAWBMaz9RxtsSgFlzLeL7w5o72sBO2kJh8qAq8VsAH6H54GvprU8Qzch1Evx25MITes
	WPmxnV7yNoOP+TSHTBMmDbKAYyLFGzA690Q389UK/NQGDK5GVKi0rWTSyMeKwwRIXvMO
	RAg8bSsH0bQEyMwsbpNrxMHQ7XydpJkiDMxB3D2kQtHaz7L8QtRBC3osPl7mfmzbRVzm
	22pPXMDgHK0gm22kKqWSu+hehfJMJ/TX14r92yds9b++kSMekkHZoeuoOtDOB//w8EMm
	4MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=13zPpr8eu2CJQOgqlDgYW1euE5CjP18/vmWEohkbXwc=;
	b=JwvOuxEIFM5+ICi2wxNyakT6oE+V2gJTH0t0sNfTCcqP5iVoi8PcTkqRpb5Y8vL0q+
	hLldRr1ffCoFirBwJQtxF/FnNmyPSZQlLjoojDEl0PrjAdfZloyrFl4p6LSVtJveVwcU
	adWUweWo9tydTK5UqvMSSZ1gV2p7Bbjxc96v+PBUXRBC65kxV1I7W0QPKrDA9JrMB2wN
	yBPUAZo0ZxyNKvXV6myZHlwDvr0jpABqApjkdV4EIxT2n89weWnwua2TpSCRM/c6ZhFo
	PmtXI0baajuzFeHcMk625QyTHip7RGm95g4geeynuSBF+QXzm6r7jq/MQ8lT5jvFnV1a
	2JEA==
X-Gm-Message-State: APjAAAWMBFCl7EnQAbWDmiL/XPxRIpzOaA4bM8mMg0un5PQdQxso/f3l
	KA4yI6sqXPM7MoHmtuQb5orxcIm7eh8=
X-Google-Smtp-Source: APXvYqzYBbBsIATBIYYQQYe1Akw3VOYMorJJXtnQwyqC+wBQ84UUhrV+tZwblnsvqlWT7FEwB7qEzQ==
X-Received: by 2002:a17:902:2c01:: with SMTP id
	m1mr3748693plb.108.1557440818972; 
	Thu, 09 May 2019 15:26:58 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231])
	by smtp.gmail.com with ESMTPSA id m2sm4490521pfi.24.2019.05.09.15.26.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 15:26:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  9 May 2019 15:26:23 -0700
Message-Id: <20190509222631.14271-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509222631.14271-1-richard.henderson@linaro.org>
References: <20190509222631.14271-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v3 19/27] target/sh4: Convert to
 CPUClass::tlb_fill
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
Cc: Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.h       |   5 +-
 target/sh4/cpu.c       |   5 +-
 target/sh4/helper.c    | 197 ++++++++++++++++++++---------------------
 target/sh4/op_helper.c |  12 ---
 4 files changed, 101 insertions(+), 118 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 1be36fe875..547194aac7 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -243,8 +243,9 @@ void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
 void sh4_translate_init(void);
 int cpu_sh4_signal_handler(int host_signum, void *pinfo,
                            void *puc);
-int superh_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int size, int rw,
-                                int mmu_idx);
+bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                         MMUAccessType access_type, int mmu_idx,
+                         bool probe, uintptr_t retaddr);
 
 void sh4_cpu_list(void);
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index da2799082e..c4736a0a73 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -229,9 +229,8 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->synchronize_from_tb = superh_cpu_synchronize_from_tb;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
-#ifdef CONFIG_USER_ONLY
-    cc->handle_mmu_fault = superh_cpu_handle_mmu_fault;
-#else
+    cc->tlb_fill = superh_cpu_tlb_fill;
+#ifndef CONFIG_USER_ONLY
     cc->do_unaligned_access = superh_cpu_do_unaligned_access;
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
 #endif
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index fa51269fb1..1517a6152f 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -27,43 +27,6 @@
 #include "hw/sh4/sh_intc.h"
 #endif
 
-#if defined(CONFIG_USER_ONLY)
-
-void superh_cpu_do_interrupt(CPUState *cs)
-{
-    cs->exception_index = -1;
-}
-
-int superh_cpu_handle_mmu_fault(CPUState *cs, vaddr address, int size, int rw,
-                                int mmu_idx)
-{
-    SuperHCPU *cpu = SUPERH_CPU(cs);
-    CPUSH4State *env = &cpu->env;
-
-    env->tea = address;
-    cs->exception_index = -1;
-    switch (rw) {
-    case 0:
-        cs->exception_index = 0x0a0;
-        break;
-    case 1:
-        cs->exception_index = 0x0c0;
-        break;
-    case 2:
-        cs->exception_index = 0x0a0;
-        break;
-    }
-    return 1;
-}
-
-int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr)
-{
-    /* For user mode, only U0 area is cacheable. */
-    return !(addr & 0x80000000);
-}
-
-#else /* !CONFIG_USER_ONLY */
-
 #define MMU_OK                   0
 #define MMU_ITLB_MISS            (-1)
 #define MMU_ITLB_MULTIPLE        (-2)
@@ -79,6 +42,21 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr)
 #define MMU_DADDR_ERROR_READ     (-12)
 #define MMU_DADDR_ERROR_WRITE    (-13)
 
+#if defined(CONFIG_USER_ONLY)
+
+void superh_cpu_do_interrupt(CPUState *cs)
+{
+    cs->exception_index = -1;
+}
+
+int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)
+{
+    /* For user mode, only U0 area is cacheable. */
+    return !(addr & 0x80000000);
+}
+
+#else /* !CONFIG_USER_ONLY */
+
 void superh_cpu_do_interrupt(CPUState *cs)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
@@ -458,69 +436,6 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
     return get_mmu_address(env, physical, prot, address, rw, access_type);
 }
 
-int superh_cpu_handle_mmu_fault(CPUState *cs, vaddr address, int size, int rw,
-                                int mmu_idx)
-{
-    SuperHCPU *cpu = SUPERH_CPU(cs);
-    CPUSH4State *env = &cpu->env;
-    target_ulong physical;
-    int prot, ret, access_type;
-
-    access_type = ACCESS_INT;
-    ret =
-	get_physical_address(env, &physical, &prot, address, rw,
-			     access_type);
-
-    if (ret != MMU_OK) {
-	env->tea = address;
-	if (ret != MMU_DTLB_MULTIPLE && ret != MMU_ITLB_MULTIPLE) {
-	    env->pteh = (env->pteh & PTEH_ASID_MASK) |
-		    (address & PTEH_VPN_MASK);
-	}
-	switch (ret) {
-	case MMU_ITLB_MISS:
-	case MMU_DTLB_MISS_READ:
-            cs->exception_index = 0x040;
-	    break;
-	case MMU_DTLB_MULTIPLE:
-	case MMU_ITLB_MULTIPLE:
-            cs->exception_index = 0x140;
-	    break;
-	case MMU_ITLB_VIOLATION:
-            cs->exception_index = 0x0a0;
-	    break;
-	case MMU_DTLB_MISS_WRITE:
-            cs->exception_index = 0x060;
-	    break;
-	case MMU_DTLB_INITIAL_WRITE:
-            cs->exception_index = 0x080;
-	    break;
-	case MMU_DTLB_VIOLATION_READ:
-            cs->exception_index = 0x0a0;
-	    break;
-	case MMU_DTLB_VIOLATION_WRITE:
-            cs->exception_index = 0x0c0;
-	    break;
-	case MMU_IADDR_ERROR:
-	case MMU_DADDR_ERROR_READ:
-            cs->exception_index = 0x0e0;
-	    break;
-	case MMU_DADDR_ERROR_WRITE:
-            cs->exception_index = 0x100;
-	    break;
-	default:
-            cpu_abort(cs, "Unhandled MMU fault");
-	}
-	return 1;
-    }
-
-    address &= TARGET_PAGE_MASK;
-    physical &= TARGET_PAGE_MASK;
-
-    tlb_set_page(cs, address, physical, prot, mmu_idx, TARGET_PAGE_SIZE);
-    return 0;
-}
-
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
@@ -745,7 +660,6 @@ void cpu_sh4_write_mmaped_utlb_addr(CPUSH4State *s, hwaddr addr,
         if (needs_tlb_flush) {
             tlb_flush_page(CPU(sh_env_get_cpu(s)), vpn << 10);
         }
-        
     } else {
         int index = (addr & 0x00003f00) >> 8;
         tlb_t * entry = &s->utlb[index];
@@ -885,3 +799,84 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+
+bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                         MMUAccessType access_type, int mmu_idx,
+                         bool probe, uintptr_t retaddr)
+{
+    SuperHCPU *cpu = SUPERH_CPU(cs);
+    CPUSH4State *env = &cpu->env;
+    int ret;
+
+#ifdef CONFIG_USER_ONLY
+    ret = (access_type == MMU_DATA_STORE ? MMU_DTLB_VIOLATION_WRITE :
+           access_type == MMU_INST_FETCH ? MMU_ITLB_VIOLATION :
+           MMU_DTLB_VIOLATION_READ);
+#else
+    target_ulong physical;
+    int prot, sh_access_type;
+
+    sh_access_type = ACCESS_INT;
+    ret = get_physical_address(env, &physical, &prot, address,
+                               access_type, sh_access_type);
+
+    if (ret == MMU_OK) {
+        address &= TARGET_PAGE_MASK;
+        physical &= TARGET_PAGE_MASK;
+        tlb_set_page(cs, address, physical, prot, mmu_idx, TARGET_PAGE_SIZE);
+        return true;
+    }
+    if (probe) {
+        return false;
+    }
+
+    if (ret != MMU_DTLB_MULTIPLE && ret != MMU_ITLB_MULTIPLE) {
+        env->pteh = (env->pteh & PTEH_ASID_MASK) | (address & PTEH_VPN_MASK);
+    }
+#endif
+
+    env->tea = address;
+    switch (ret) {
+    case MMU_ITLB_MISS:
+    case MMU_DTLB_MISS_READ:
+        cs->exception_index = 0x040;
+        break;
+    case MMU_DTLB_MULTIPLE:
+    case MMU_ITLB_MULTIPLE:
+        cs->exception_index = 0x140;
+        break;
+    case MMU_ITLB_VIOLATION:
+        cs->exception_index = 0x0a0;
+        break;
+    case MMU_DTLB_MISS_WRITE:
+        cs->exception_index = 0x060;
+        break;
+    case MMU_DTLB_INITIAL_WRITE:
+        cs->exception_index = 0x080;
+        break;
+    case MMU_DTLB_VIOLATION_READ:
+        cs->exception_index = 0x0a0;
+        break;
+    case MMU_DTLB_VIOLATION_WRITE:
+        cs->exception_index = 0x0c0;
+        break;
+    case MMU_IADDR_ERROR:
+    case MMU_DADDR_ERROR_READ:
+        cs->exception_index = 0x0e0;
+        break;
+    case MMU_DADDR_ERROR_WRITE:
+        cs->exception_index = 0x100;
+        break;
+    default:
+        cpu_abort(cs, "Unhandled MMU fault");
+    }
+    cpu_loop_exit_restore(cs, retaddr);
+}
+
+#ifndef CONFIG_USER_ONLY
+void tlb_fill(CPUState *cs, target_ulong addr, int size,
+              MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
+{
+    superh_cpu_tlb_fill(cs, addr, size, access_type, mmu_idx, false, retaddr);
+}
+#endif
diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index 28027f9e0b..bd5d782b50 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -41,18 +41,6 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     cpu_loop_exit_restore(cs, retaddr);
 }
 
-void tlb_fill(CPUState *cs, target_ulong addr, int size,
-              MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
-{
-    int ret;
-
-    ret = superh_cpu_handle_mmu_fault(cs, addr, size, access_type, mmu_idx);
-    if (ret) {
-        /* now we have a real cpu fault */
-        cpu_loop_exit_restore(cs, retaddr);
-    }
-}
-
 #endif
 
 void helper_ldtlb(CPUSH4State *env)
-- 
2.17.1


