Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E641A00F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 17:25:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP7Ob-0003RD-PH
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 11:25:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP7JV-0007St-Ca
	for qemu-devel@nongnu.org; Fri, 10 May 2019 11:19:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP7JU-0008Oh-2Q
	for qemu-devel@nongnu.org; Fri, 10 May 2019 11:19:57 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35855)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hP7JT-0008My-SK
	for qemu-devel@nongnu.org; Fri, 10 May 2019 11:19:56 -0400
Received: by mail-pl1-x632.google.com with SMTP id d21so3002737plr.3
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s87CuOmfhyfGLXIPM91Iv48ElcI94bqoXpVc6e0DK1o=;
	b=wRHDNs9M8gJ4f3SIGelLWIcpVo0JF7TP9xoi97E4O+rS4EdcreMwqicJKIK/KUZz1w
	Bh51hKNPKPPzUzX70dTM6bAOOlymFTNS6dpndAM/UhKdlaEQ+MRKrtLzA5UvvUBAesXQ
	qfgi7ML1Y4lSUDcVJC6hQXS731VOgEUkc0zuMHG3X9JjvUZuN0Rf4xYDtdZmlZ9cFd/y
	ndwYXzytYLp6tmtwMF8bAP6u0WOUGpkmaWc66m0rOffQQMy5HMp0+knmpfISo85JH1xz
	JKJxZFKbVTo8ctCj19s7OzzYO4WPDahWINAi/dcN/L3qbR1aaqhLn/SAszzAoHuoazS1
	6QXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s87CuOmfhyfGLXIPM91Iv48ElcI94bqoXpVc6e0DK1o=;
	b=Hzw1dBHjOO0XC9pM0mx4zXQb3a8+3Xkdf//1p8PCY68iv3JORFhhiqNefpeSk8S+N/
	kYddEMRcn1ee0uq8BZKQwzZ5YEid2gAhDYHapdt/5FJl1KNKT2TtK2d+Cz9GDcjG80eN
	+r1TROAiUlrGd3QKX6SRsJFRqnc3mWnKOSbJ3wIIuPfhpWdCzpVuhPgSI5PObxV98VEM
	qdL8aawh7ItxSMw/glD7IM3RIosAfd/MhvjYduvuYn2RQDUJ3bgcU/5OI4FYhMJdcHh3
	4yAgQyNzI+q/HMbdKE2RD5UMYWUKQKT8kWh5FupOBqwo3eWW/F6ZluRmXWqTzEgunE8f
	H7mw==
X-Gm-Message-State: APjAAAVPnWohhL4Tcf3+wdauzkEboS719aww+8CCbL1bjhGA0IYwb7gP
	LJDVQTR6mzER0sqLc16Kjce2ygMivUk=
X-Google-Smtp-Source: APXvYqzYDf6vEGvZWPBEx4IKu2Qln7cuP4OSey/yPIUVPVBjFwbETpUH7kVNTfNIpYb8gRpwyxXZ6A==
X-Received: by 2002:a17:902:8698:: with SMTP id
	g24mr14293071plo.151.1557501594578; 
	Fri, 10 May 2019 08:19:54 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231])
	by smtp.gmail.com with ESMTPSA id 19sm5920517pgz.24.2019.05.10.08.19.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 08:19:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2019 08:19:23 -0700
Message-Id: <20190510151944.22981-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510151944.22981-1-richard.henderson@linaro.org>
References: <20190510151944.22981-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::632
Subject: [Qemu-devel] [PULL 06/27] target/i386: Convert to CPUClass::tlb_fill
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not support probing, but we do not need it yet either.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.h         |  5 ++--
 target/i386/cpu.c         |  5 ++--
 target/i386/excp_helper.c | 61 +++++++++++++++++++++++++--------------
 target/i386/mem_helper.c  | 21 --------------
 4 files changed, 44 insertions(+), 48 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0128910661..fce6660bac 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1656,8 +1656,9 @@ void host_cpuid(uint32_t function, uint32_t count,
 void host_vendor_fms(char *vendor, int *family, int *model, int *stepping);
 
 /* helper.c */
-int x86_cpu_handle_mmu_fault(CPUState *cpu, vaddr addr, int size,
-                             int is_write, int mmu_idx);
+bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr);
 void x86_cpu_set_a20(X86CPU *cpu, int a20_state);
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 722c5514d4..3c98869577 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5915,9 +5915,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = x86_cpu_gdb_write_register;
     cc->get_arch_id = x86_cpu_get_arch_id;
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
-#ifdef CONFIG_USER_ONLY
-    cc->handle_mmu_fault = x86_cpu_handle_mmu_fault;
-#else
+    cc->tlb_fill = x86_cpu_tlb_fill;
+#ifndef CONFIG_USER_ONLY
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_debug = x86_cpu_get_phys_page_debug;
diff --git a/target/i386/excp_helper.c b/target/i386/excp_helper.c
index 49231f6b69..68bf8e3f7c 100644
--- a/target/i386/excp_helper.c
+++ b/target/i386/excp_helper.c
@@ -137,26 +137,7 @@ void raise_exception_ra(CPUX86State *env, int exception_index, uintptr_t retaddr
     raise_interrupt2(env, exception_index, 0, 0, 0, retaddr);
 }
 
-#if defined(CONFIG_USER_ONLY)
-int x86_cpu_handle_mmu_fault(CPUState *cs, vaddr addr, int size,
-                             int is_write, int mmu_idx)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-
-    /* user mode only emulation */
-    is_write &= 1;
-    env->cr[2] = addr;
-    env->error_code = (is_write << PG_ERROR_W_BIT);
-    env->error_code |= PG_ERROR_U_MASK;
-    cs->exception_index = EXCP0E_PAGE;
-    env->exception_is_int = 0;
-    env->exception_next_eip = -1;
-    return 1;
-}
-
-#else
-
+#if !defined(CONFIG_USER_ONLY)
 static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
                         int *prot)
 {
@@ -365,8 +346,8 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
  * 0  = nothing more to do
  * 1  = generate PF fault
  */
-int x86_cpu_handle_mmu_fault(CPUState *cs, vaddr addr, int size,
-                             int is_write1, int mmu_idx)
+static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
+                            int is_write1, int mmu_idx)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -691,3 +672,39 @@ do_check_protect_pse36:
     return 1;
 }
 #endif
+
+bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+#ifdef CONFIG_USER_ONLY
+    /* user mode only emulation */
+    env->cr[2] = addr;
+    env->error_code = (access_type == MMU_DATA_STORE) << PG_ERROR_W_BIT;
+    env->error_code |= PG_ERROR_U_MASK;
+    cs->exception_index = EXCP0E_PAGE;
+    env->exception_is_int = 0;
+    env->exception_next_eip = -1;
+    cpu_loop_exit_restore(cs, retaddr);
+#else
+    env->retaddr = retaddr;
+    if (handle_mmu_fault(cs, addr, size, access_type, mmu_idx)) {
+        /* FIXME: On error in get_hphys we have already jumped out.  */
+        g_assert(!probe);
+        raise_exception_err_ra(env, cs->exception_index,
+                               env->error_code, retaddr);
+    }
+    return true;
+#endif
+}
+
+#if !defined(CONFIG_USER_ONLY)
+void tlb_fill(CPUState *cs, target_ulong addr, int size,
+              MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
+{
+    x86_cpu_tlb_fill(cs, addr, size, access_type, mmu_idx, false, retaddr);
+}
+#endif
diff --git a/target/i386/mem_helper.c b/target/i386/mem_helper.c
index 6cc53bcb40..1885df29d2 100644
--- a/target/i386/mem_helper.c
+++ b/target/i386/mem_helper.c
@@ -191,24 +191,3 @@ void helper_boundl(CPUX86State *env, target_ulong a0, int v)
         raise_exception_ra(env, EXCP05_BOUND, GETPC());
     }
 }
-
-#if !defined(CONFIG_USER_ONLY)
-/* try to fill the TLB and return an exception if error. If retaddr is
- * NULL, it means that the function was called in C code (i.e. not
- * from generated code or from helper.c)
- */
-/* XXX: fix it to restore all registers */
-void tlb_fill(CPUState *cs, target_ulong addr, int size,
-              MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-    int ret;
-
-    env->retaddr = retaddr;
-    ret = x86_cpu_handle_mmu_fault(cs, addr, size, access_type, mmu_idx);
-    if (ret) {
-        raise_exception_err_ra(env, cs->exception_index, env->error_code, retaddr);
-    }
-}
-#endif
-- 
2.17.1


