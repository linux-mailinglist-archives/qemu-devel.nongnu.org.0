Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E918521
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 08:11:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48673 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOcGn-0004Ep-92
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 02:11:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOc98-00066w-NM
	for qemu-devel@nongnu.org; Thu, 09 May 2019 02:03:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOc95-00079T-QT
	for qemu-devel@nongnu.org; Thu, 09 May 2019 02:03:10 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36223)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOc95-000790-Ik
	for qemu-devel@nongnu.org; Thu, 09 May 2019 02:03:07 -0400
Received: by mail-pl1-x643.google.com with SMTP id d21so591906plr.3
	for <qemu-devel@nongnu.org>; Wed, 08 May 2019 23:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8egen5zzcY5oFOy4H1qXOj5SeE6rAeyMWy2A1ca7FKQ=;
	b=UTDPg7E417IjOtNwyh3KfljIzXZ3kWxHIPPW1O/Q6YNrsZ8aZO4ZIni+ydHhskWbIl
	TudV3CYaKtUaGuHOIA9k3MB4QJb0rff+0TgvkhxIvj2/s4uRWD560o6+8/KygIbtWUuz
	OUbOcGjHNTcsvmsgj9UMee01QkkRAhLYtIMXfvcMSTqMI0oLTArjjut5dwUYPpQdqhHF
	gLhcXt8+7Q/TN8uVKCs2EbktcXTyPnlr6BrHEe3ifZGnD1tSSQnfcGQAdjSZ7sn00e0w
	EwjKnNCsxFMCilx+IUd5ogCot/R7925uOzuAUS+j+nZanjJ+bcq2/ig/Qsmc4jfxY3XG
	9viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8egen5zzcY5oFOy4H1qXOj5SeE6rAeyMWy2A1ca7FKQ=;
	b=J38SIuzKByDjxqrXOAUUejYjpGGGtGtf/trPZNr6of5+27Nz3mztQoMwivRIH+90+H
	SbXnIgH7+iFMCabDpjEYxwMyATNBGWvTwyRKPIdA7BgNhN/4iUGfe9Vh5O1zctkzVAxD
	/BLcNUJT8vmiCVN82jyAg1nOG+udw287S7i32kJhHTjAJma8M4wF05lqYOuxfEL05jyt
	ryxhxQIL6oFhSrdDb7vTNBxM4oYCA6ywp3Xdx3K6WzmoI/0SFOobCOkrnyiGO9zLTC0A
	oSB3eD4+CkcmAEh1rO6P97uA0CFLKQDh/Wmi7/yghCu/inFs5rlUvL+ue0/AJRdeGM/o
	tqIQ==
X-Gm-Message-State: APjAAAVVGYu9z29sV8pRatzFEc0hYgCkr443TWm1jm4hQUTgBjz9s+HM
	vGp+w97mjtPZ7tmofdNaadk2RHmXbaY=
X-Google-Smtp-Source: APXvYqwQrI6tRWl6deBbp3QlsO4KwViUFR++/C9QkvYULz3jq4RvnX2oxjboDpK+6M0G82s4klyuLA==
X-Received: by 2002:a17:902:7205:: with SMTP id
	ba5mr2693897plb.285.1557381786274; 
	Wed, 08 May 2019 23:03:06 -0700 (PDT)
Received: from localhost.localdomain (97-113-27-95.tukw.qwest.net.
	[97.113.27.95])
	by smtp.gmail.com with ESMTPSA id n7sm1496109pff.45.2019.05.08.23.03.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 23:03:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  8 May 2019 23:02:33 -0700
Message-Id: <20190509060246.4031-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509060246.4031-1-richard.henderson@linaro.org>
References: <20190509060246.4031-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v2 14/27] target/nios2: Convert to
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the leftover debugging cpu_dump_state.

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Keep user-only and system tlb_fill separate.
---
 target/nios2/cpu.h    |   5 +-
 target/nios2/cpu.c    |   5 +-
 target/nios2/helper.c | 172 +++++++++++++++++++++---------------------
 target/nios2/mmu.c    |  12 ---
 4 files changed, 91 insertions(+), 103 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 881e7d58c9..60a916b2e5 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -252,8 +252,9 @@ static inline int cpu_mmu_index(CPUNios2State *env, bool ifetch)
                                                   MMU_SUPERVISOR_IDX;
 }
 
-int nios2_cpu_handle_mmu_fault(CPUState *env, vaddr address, int size,
-                               int rw, int mmu_idx);
+bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                        MMUAccessType access_type, int mmu_idx,
+                        bool probe, uintptr_t retaddr);
 
 static inline int cpu_interrupts_enabled(CPUNios2State *env)
 {
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index fbfaa2ce26..186af4913d 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -200,9 +200,8 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
-#ifdef CONFIG_USER_ONLY
-    cc->handle_mmu_fault = nios2_cpu_handle_mmu_fault;
-#else
+    cc->tlb_fill = nios2_cpu_tlb_fill;
+#ifndef CONFIG_USER_ONLY
     cc->do_unaligned_access = nios2_cpu_do_unaligned_access;
     cc->get_phys_page_debug = nios2_cpu_get_phys_page_debug;
 #endif
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index e01fc1ff3e..72884e4260 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -38,15 +38,16 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     env->regs[R_EA] = env->regs[R_PC] + 4;
 }
 
-int nios2_cpu_handle_mmu_fault(CPUState *cs, vaddr address, int size,
-                               int rw, int mmu_idx)
+bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                        MMUAccessType access_type, int mmu_idx,
+                        bool probe, uintptr_t retaddr)
 {
     cs->exception_index = 0xaa;
     /* Page 0x1000 is kuser helper */
     if (address < 0x1000 || address >= 0x2000) {
         cpu_dump_state(cs, stderr, 0);
     }
-    return 1;
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 #else /* !CONFIG_USER_ONLY */
@@ -203,89 +204,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     }
 }
 
-static int cpu_nios2_handle_virtual_page(
-    CPUState *cs, target_ulong address, int rw, int mmu_idx)
-{
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
-    target_ulong vaddr, paddr;
-    Nios2MMULookup lu;
-    unsigned int hit;
-    hit = mmu_translate(env, &lu, address, rw, mmu_idx);
-    if (hit) {
-        vaddr = address & TARGET_PAGE_MASK;
-        paddr = lu.paddr + vaddr - lu.vaddr;
-
-        if (((rw == 0) && (lu.prot & PAGE_READ)) ||
-            ((rw == 1) && (lu.prot & PAGE_WRITE)) ||
-            ((rw == 2) && (lu.prot & PAGE_EXEC))) {
-
-            tlb_set_page(cs, vaddr, paddr, lu.prot,
-                         mmu_idx, TARGET_PAGE_SIZE);
-            return 0;
-        } else {
-            /* Permission violation */
-            cs->exception_index = (rw == 0) ? EXCP_TLBR :
-                                               ((rw == 1) ? EXCP_TLBW :
-                                                            EXCP_TLBX);
-        }
-    } else {
-        cs->exception_index = EXCP_TLBD;
-    }
-
-    if (rw == 2) {
-        env->regs[CR_TLBMISC] &= ~CR_TLBMISC_D;
-    } else {
-        env->regs[CR_TLBMISC] |= CR_TLBMISC_D;
-    }
-    env->regs[CR_PTEADDR] &= CR_PTEADDR_PTBASE_MASK;
-    env->regs[CR_PTEADDR] |= (address >> 10) & CR_PTEADDR_VPN_MASK;
-    env->mmu.pteaddr_wr = env->regs[CR_PTEADDR];
-    env->regs[CR_BADADDR] = address;
-    return 1;
-}
-
-int nios2_cpu_handle_mmu_fault(CPUState *cs, vaddr address, int size,
-                               int rw, int mmu_idx)
-{
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
-
-    if (cpu->mmu_present) {
-        if (MMU_SUPERVISOR_IDX == mmu_idx) {
-            if (address >= 0xC0000000) {
-                /* Kernel physical page - TLB bypassed */
-                address &= TARGET_PAGE_MASK;
-                tlb_set_page(cs, address, address, PAGE_BITS,
-                             mmu_idx, TARGET_PAGE_SIZE);
-            } else if (address >= 0x80000000) {
-                /* Kernel virtual page */
-                return cpu_nios2_handle_virtual_page(cs, address, rw, mmu_idx);
-            } else {
-                /* User virtual page */
-                return cpu_nios2_handle_virtual_page(cs, address, rw, mmu_idx);
-            }
-        } else {
-            if (address >= 0x80000000) {
-                /* Illegal access from user mode */
-                cs->exception_index = EXCP_SUPERA;
-                env->regs[CR_BADADDR] = address;
-                return 1;
-            } else {
-                /* User virtual page */
-                return cpu_nios2_handle_virtual_page(cs, address, rw, mmu_idx);
-            }
-        }
-    } else {
-        /* No MMU */
-        address &= TARGET_PAGE_MASK;
-        tlb_set_page(cs, address, address, PAGE_BITS,
-                     mmu_idx, TARGET_PAGE_SIZE);
-    }
-
-    return 0;
-}
-
 hwaddr nios2_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -321,4 +239,86 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     env->regs[CR_EXCEPTION] = EXCP_UNALIGN << 2;
     helper_raise_exception(env, EXCP_UNALIGN);
 }
+
+bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                        MMUAccessType access_type, int mmu_idx,
+                        bool probe, uintptr_t retaddr)
+{
+    Nios2CPU *cpu = NIOS2_CPU(cs);
+    CPUNios2State *env = &cpu->env;
+    unsigned int excp = EXCP_TLBD;
+    target_ulong vaddr, paddr;
+    Nios2MMULookup lu;
+    unsigned int hit;
+
+    if (!cpu->mmu_present) {
+        /* No MMU */
+        address &= TARGET_PAGE_MASK;
+        tlb_set_page(cs, address, address, PAGE_BITS,
+                     mmu_idx, TARGET_PAGE_SIZE);
+        return true;
+    }
+
+    if (MMU_SUPERVISOR_IDX == mmu_idx) {
+        if (address >= 0xC0000000) {
+            /* Kernel physical page - TLB bypassed */
+            address &= TARGET_PAGE_MASK;
+            tlb_set_page(cs, address, address, PAGE_BITS,
+                         mmu_idx, TARGET_PAGE_SIZE);
+            return true;
+        }
+    } else {
+        if (address >= 0x80000000) {
+            /* Illegal access from user mode */
+            if (probe) {
+                return false;
+            }
+            cs->exception_index = EXCP_SUPERA;
+            env->regs[CR_BADADDR] = address;
+            cpu_loop_exit_restore(cs, retaddr);
+        }
+    }
+
+    /* Virtual page.  */
+    hit = mmu_translate(env, &lu, address, access_type, mmu_idx);
+    if (hit) {
+        vaddr = address & TARGET_PAGE_MASK;
+        paddr = lu.paddr + vaddr - lu.vaddr;
+
+        if (((access_type == MMU_DATA_LOAD) && (lu.prot & PAGE_READ)) ||
+            ((access_type == MMU_DATA_STORE) && (lu.prot & PAGE_WRITE)) ||
+            ((access_type == MMU_INST_FETCH) && (lu.prot & PAGE_EXEC))) {
+            tlb_set_page(cs, vaddr, paddr, lu.prot,
+                         mmu_idx, TARGET_PAGE_SIZE);
+            return true;
+        }
+
+        /* Permission violation */
+        excp = (access_type == MMU_DATA_LOAD ? EXCP_TLBR :
+                access_type == MMU_DATA_STORE ? EXCP_TLBW : EXCP_TLBX);
+    }
+
+    if (probe) {
+        return false;
+    }
+
+    if (access_type == MMU_INST_FETCH) {
+        env->regs[CR_TLBMISC] &= ~CR_TLBMISC_D;
+    } else {
+        env->regs[CR_TLBMISC] |= CR_TLBMISC_D;
+    }
+    env->regs[CR_PTEADDR] &= CR_PTEADDR_PTBASE_MASK;
+    env->regs[CR_PTEADDR] |= (address >> 10) & CR_PTEADDR_VPN_MASK;
+    env->mmu.pteaddr_wr = env->regs[CR_PTEADDR];
+
+    cs->exception_index = excp;
+    env->regs[CR_BADADDR] = address;
+    cpu_loop_exit_restore(cs, retaddr);
+}
+
+void tlb_fill(CPUState *cs, target_ulong addr, int size,
+              MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
+{
+    nios2_cpu_tlb_fill(cs, addr, size, access_type, mmu_idx, false, retaddr);
+}
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 5acf442d8b..47fa474efb 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -36,18 +36,6 @@
 #define MMU_LOG(x)
 #endif
 
-void tlb_fill(CPUState *cs, target_ulong addr, int size,
-              MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
-{
-    int ret;
-
-    ret = nios2_cpu_handle_mmu_fault(cs, addr, size, access_type, mmu_idx);
-    if (unlikely(ret)) {
-        /* now we have a real cpu fault */
-        cpu_loop_exit_restore(cs, retaddr);
-    }
-}
-
 void mmu_read_debug(CPUNios2State *env, uint32_t rn)
 {
     switch (rn) {
-- 
2.17.1


