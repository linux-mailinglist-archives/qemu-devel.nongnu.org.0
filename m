Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEBD81ED3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 16:16:57 +0200 (CEST)
Received: from localhost ([::1]:54304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hudnE-0000Lf-E7
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 10:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35095)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mrolnik@gmail.com>) id 1hudkt-0003qA-6v
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:14:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1hudkq-0006lq-Bd
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:14:31 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38920)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1hudko-0006fp-67
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:14:28 -0400
Received: by mail-wm1-x342.google.com with SMTP id u25so62823305wmc.4
 for <qemu-devel@nongnu.org>; Mon, 05 Aug 2019 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DfUPX4d+oYL58rU5/XwmCjG2LU+U0B2z9crX+xLdr20=;
 b=Z2knA3k5mff8+G1iotGYB/DdfQFmYkzOGgjmJ7oE9P1Yb0vshTYYVxGxiDGIYuinzr
 iXCQ5JXx2OFxZ0GcMVAIIbNnixBAUHqXI77/NmESUjMxMaQsMt02SxaT240eqZECD8Fk
 tpGn73/hT53lRtGnVneAM8jPR3ZhDt5x0106bMbdmCb0rMylAn9DV8kNKNWDgXXNYo+j
 34943uNtsreUNApgRCRLkXq/PvA6TzngC97XKuMPvqqCIAJXy18pHy87z1d6BtklDVWg
 Cn5N2QUp3hL1bdfbT1t0vbKQaw1eT0qxyMd2ZhZFcL40JAP5Y8ZBYqdLQeaEqBWLXFrd
 F8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DfUPX4d+oYL58rU5/XwmCjG2LU+U0B2z9crX+xLdr20=;
 b=PpkVrm/Stu6QPRVcQnrU5jwGwt/aI4xQpLhrNRQQkzLLFh3Cbi4HTDzrHo4kpo9YYh
 Xs7+/ZjsM8SEp+X6oED0z3IbnkDG4KYG6QrByPtIupD14rMDjTjqtAif5DiXjbPoPDzQ
 V7NLixDiloHuRYLRv3hY1htBsn0WFCaVUUXXEicCPle1EXkVZevPSCxCm5YxDiw0NEzZ
 uc77sKwhER/NR5UL05qh68r0wUuSFgylbZFKpgD+rMJg3Ui9WA6CH34IyvdBpcBjQPdH
 2U8pZjJRulRGXfuT/QXGI/QDe8tvcZOUnZ4boKm3TiJ6dR0xU/OJucOgT9hdsfNDR/1f
 KPoQ==
X-Gm-Message-State: APjAAAU37PA6gdawN67ByD9tI5nSQH2JaSmj20byb2iFufEQkjjPP2qJ
 A8f+/8L0e/UoyPHkYpOC817B72eEEfp/PzGO
X-Google-Smtp-Source: APXvYqxOYlNBXjtkjzx8cLQ2eSnvU/6PHSeuXcPzYbGkBj8Dz2H9a9SxOIduZx4RcySto1xL/2QE1A==
X-Received: by 2002:a05:600c:2243:: with SMTP id
 a3mr18437762wmm.83.1565014458639; 
 Mon, 05 Aug 2019 07:14:18 -0700 (PDT)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-182-81-63.red.bezeqint.net. [79.182.81.63])
 by smtp.gmail.com with ESMTPSA id v23sm75256211wmj.32.2019.08.05.07.14.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 07:14:17 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 17:14:02 +0300
Message-Id: <20190805141408.89268-3-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20190805141408.89268-1-mrolnik@gmail.com>
References: <20190805141408.89268-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH for 4.2 v28 2/8] target/avr: Add instruction
 helpers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, Michael Rolnik <mrolnik@gmail.com>,
 richard.henderson@linaro.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 dovgaluk@ispras.ru, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sarah Harris <S.E.Harris@kent.ac.uk>

Stubs for unimplemented instructions and helpers for instructions that need to interact with QEMU.
SPM and WDR are unimplemented because they require emulation of complex peripherals.
The implementation of SLEEP is very limited due to the lack of peripherals to generate wake interrupts.
Memory access instructions are implemented here because some address ranges actually refer to CPU registers.

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 target/avr/helper.c | 354 ++++++++++++++++++++++++++++++++++++++++++++
 target/avr/helper.h |  29 ++++
 2 files changed, 383 insertions(+)
 create mode 100644 target/avr/helper.c
 create mode 100644 target/avr/helper.h

diff --git a/target/avr/helper.c b/target/avr/helper.c
new file mode 100644
index 0000000000..f0f0d4f15a
--- /dev/null
+++ b/target/avr/helper.c
@@ -0,0 +1,354 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#include "qemu/osdep.h"
+
+#include "cpu.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "sysemu/sysemu.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/helper-proto.h"
+#include "exec/ioport.h"
+#include "qemu/host-utils.h"
+#include "qemu/error-report.h"
+
+bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    bool ret = false;
+    CPUClass *cc = CPU_GET_CLASS(cs);
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+
+    if (interrupt_request & CPU_INTERRUPT_RESET) {
+        if (cpu_interrupts_enabled(env)) {
+            cs->exception_index = EXCP_RESET;
+            cc->do_interrupt(cs);
+
+            cs->interrupt_request &= ~CPU_INTERRUPT_RESET;
+
+            ret = true;
+        }
+    }
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        if (cpu_interrupts_enabled(env) && env->intsrc != 0) {
+            int index = ctz32(env->intsrc);
+            cs->exception_index = EXCP_INT(index);
+            cc->do_interrupt(cs);
+
+            env->intsrc &= env->intsrc - 1; /* clear the interrupt */
+            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
+
+            ret = true;
+        }
+    }
+    return ret;
+}
+
+void avr_cpu_do_interrupt(CPUState *cs)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+
+    uint32_t ret = env->pc_w;
+    int vector = 0;
+    int size = avr_feature(env, AVR_FEATURE_JMP_CALL) ? 2 : 1;
+    int base = 0;
+
+    if (cs->exception_index == EXCP_RESET) {
+        vector = 0;
+    } else if (env->intsrc != 0) {
+        vector = ctz32(env->intsrc) + 1;
+    }
+
+    if (avr_feature(env, AVR_FEATURE_3_BYTE_PC)) {
+        cpu_stb_data(env, env->sp--, (ret & 0x0000ff));
+        cpu_stb_data(env, env->sp--, (ret & 0x00ff00) >> 8);
+        cpu_stb_data(env, env->sp--, (ret & 0xff0000) >> 16);
+    } else if (avr_feature(env, AVR_FEATURE_2_BYTE_PC)) {
+        cpu_stb_data(env, env->sp--, (ret & 0x0000ff));
+        cpu_stb_data(env, env->sp--, (ret & 0x00ff00) >> 8);
+    } else {
+        cpu_stb_data(env, env->sp--, (ret & 0x0000ff));
+    }
+
+    env->pc_w = base + vector * size;
+    env->sregI = 0; /* clear Global Interrupt Flag */
+
+    cs->exception_index = -1;
+}
+
+int avr_cpu_memory_rw_debug(CPUState *cs, vaddr addr, uint8_t *buf,
+                                int len, bool is_write)
+{
+    return cpu_memory_rw_debug(cs, addr, buf, len, is_write);
+}
+
+hwaddr avr_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+{
+    return addr; /* I assume 1:1 address correspondance */
+}
+
+int avr_cpu_handle_mmu_fault(
+    CPUState *cs, vaddr address, int size, int rw, int mmu_idx)
+{
+    /* currently it's assumed that this will never happen */
+    cs->exception_index = EXCP_DEBUG;
+    cpu_dump_state(cs, stderr, 0);
+    return 1;
+}
+
+bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                        MMUAccessType access_type, int mmu_idx,
+                        bool probe, uintptr_t retaddr)
+{
+    int prot = 0;
+    MemTxAttrs attrs = {};
+    uint32_t paddr;
+
+    address &= TARGET_PAGE_MASK;
+
+    if (mmu_idx == MMU_CODE_IDX) {
+        /* access to code in flash */
+        paddr = OFFSET_CODE + address;
+        prot = PAGE_READ | PAGE_EXEC;
+        if (paddr + TARGET_PAGE_SIZE > OFFSET_DATA) {
+            error_report("execution left flash memory");
+            exit(1);
+        }
+    } else if (address < NO_CPU_REGISTERS + NO_IO_REGISTERS) {
+        /*
+         * access to CPU registers, exit and rebuilt this TB to use full access
+         * incase it touches specially handled registers like SREG or SP
+         */
+        AVRCPU *cpu = AVR_CPU(cs);
+        CPUAVRState *env = &cpu->env;
+        env->fullacc = 1;
+        cpu_loop_exit_restore(cs, retaddr);
+    } else {
+        /* access to memory. nothing special */
+        paddr = OFFSET_DATA + address;
+        prot = PAGE_READ | PAGE_WRITE;
+    }
+
+    tlb_set_page_with_attrs(
+        cs, address, paddr, attrs, prot, mmu_idx, TARGET_PAGE_SIZE);
+
+    return true;
+}
+
+void helper_sleep(CPUAVRState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = EXCP_HLT;
+    cpu_loop_exit(cs);
+}
+
+void helper_unsupported(CPUAVRState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    /*
+     *  I count not find what happens on the real platform, so
+     *  it's EXCP_DEBUG for meanwhile
+     */
+    cs->exception_index = EXCP_DEBUG;
+    if (qemu_loglevel_mask(LOG_UNIMP)) {
+        qemu_log("UNSUPPORTED\n");
+        cpu_dump_state(cs, qemu_logfile, 0);
+    }
+    cpu_loop_exit(cs);
+}
+
+void helper_debug(CPUAVRState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = EXCP_DEBUG;
+    cpu_loop_exit(cs);
+}
+
+void helper_break(CPUAVRState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = EXCP_DEBUG;
+    cpu_loop_exit(cs);
+}
+
+void helper_wdr(CPUAVRState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    /* WD is not implemented yet, placeholder */
+    cs->exception_index = EXCP_DEBUG;
+    cpu_loop_exit(cs);
+}
+
+/*
+ * This function implements IN instruction
+ *
+ * It does the following
+ * a.  if an IO register belongs to CPU, its value is read and returned
+ * b.  otherwise io address is translated to mem address and physical memory
+ *     is read.
+ * c.  it caches the value for sake of SBI, SBIC, SBIS & CBI implementation
+ *
+ */
+target_ulong helper_inb(CPUAVRState *env, uint32_t port)
+{
+    target_ulong data = 0;
+
+    switch (port) {
+    case 0x38: /* RAMPD */
+        data = 0xff & (env->rampD >> 16);
+        break;
+    case 0x39: /* RAMPX */
+        data = 0xff & (env->rampX >> 16);
+        break;
+    case 0x3a: /* RAMPY */
+        data = 0xff & (env->rampY >> 16);
+        break;
+    case 0x3b: /* RAMPZ */
+        data = 0xff & (env->rampZ >> 16);
+        break;
+    case 0x3c: /* EIND */
+        data = 0xff & (env->eind >> 16);
+        break;
+    case 0x3d: /* SPL */
+        data = env->sp & 0x00ff;
+        break;
+    case 0x3e: /* SPH */
+        data = env->sp >> 8;
+        break;
+    case 0x3f: /* SREG */
+        data = cpu_get_sreg(env);
+        break;
+    default:
+        /* not a special register, pass to normal memory access */
+        cpu_physical_memory_read(OFFSET_IO_REGISTERS + port, &data, 1);
+    }
+
+    return data;
+}
+
+/*
+ *  This function implements OUT instruction
+ *
+ *  It does the following
+ *  a.  if an IO register belongs to CPU, its value is written into the register
+ *  b.  otherwise io address is translated to mem address and physical memory
+ *      is written.
+ *  c.  it caches the value for sake of SBI, SBIC, SBIS & CBI implementation
+ *
+ */
+void helper_outb(CPUAVRState *env, uint32_t port, uint32_t data)
+{
+    data &= 0x000000ff;
+
+    switch (port) {
+    case 0x38: /* RAMPD */
+        if (avr_feature(env, AVR_FEATURE_RAMPD)) {
+            env->rampD = (data & 0xff) << 16;
+        }
+        break;
+    case 0x39: /* RAMPX */
+        if (avr_feature(env, AVR_FEATURE_RAMPX)) {
+            env->rampX = (data & 0xff) << 16;
+        }
+        break;
+    case 0x3a: /* RAMPY */
+        if (avr_feature(env, AVR_FEATURE_RAMPY)) {
+            env->rampY = (data & 0xff) << 16;
+        }
+        break;
+    case 0x3b: /* RAMPZ */
+        if (avr_feature(env, AVR_FEATURE_RAMPZ)) {
+            env->rampZ = (data & 0xff) << 16;
+        }
+        break;
+    case 0x3c: /* EIDN */
+        env->eind = (data & 0xff) << 16;
+        break;
+    case 0x3d: /* SPL */
+        env->sp = (env->sp & 0xff00) | (data);
+        break;
+    case 0x3e: /* SPH */
+        if (avr_feature(env, AVR_FEATURE_2_BYTE_SP)) {
+            env->sp = (env->sp & 0x00ff) | (data << 8);
+        }
+        break;
+    case 0x3f: /* SREG */
+        cpu_set_sreg(env, data);
+        break;
+    default:
+        /* not a special register, pass to normal memory access */
+        cpu_physical_memory_write(OFFSET_IO_REGISTERS + port, &data, 1);
+    }
+}
+
+/*
+ *  this function implements LD instruction when there is a posibility to read
+ *  from a CPU register
+ */
+target_ulong helper_fullrd(CPUAVRState *env, uint32_t addr)
+{
+    uint8_t data;
+
+    env->fullacc = false;
+
+    if (addr < NO_CPU_REGISTERS) {
+        /* CPU registers */
+        data = env->r[addr];
+    } else if (addr < NO_CPU_REGISTERS + NO_IO_REGISTERS) {
+        /* IO registers */
+        data = helper_inb(env, addr - NO_CPU_REGISTERS);
+    } else {
+        /* memory */
+        cpu_physical_memory_read(OFFSET_DATA + addr, &data, 1);
+    }
+    return data;
+}
+
+/*
+ *  this function implements ST instruction when there is a posibility to write
+ *  into a CPU register
+ */
+void helper_fullwr(CPUAVRState *env, uint32_t data, uint32_t addr)
+{
+    env->fullacc = false;
+
+    /* Following logic assumes this: */
+    assert(OFFSET_CPU_REGISTERS == OFFSET_DATA);
+    assert(OFFSET_IO_REGISTERS == OFFSET_CPU_REGISTERS + NO_CPU_REGISTERS);
+
+    if (addr < NO_CPU_REGISTERS) {
+        /* CPU registers */
+        env->r[addr] = data;
+    } else if (addr < NO_CPU_REGISTERS + NO_IO_REGISTERS) {
+        /* IO registers */
+        helper_outb(env, addr - NO_CPU_REGISTERS, data);
+    } else {
+        /* memory */
+        cpu_physical_memory_write(OFFSET_DATA + addr, &data, 1);
+    }
+}
diff --git a/target/avr/helper.h b/target/avr/helper.h
new file mode 100644
index 0000000000..bf087504a8
--- /dev/null
+++ b/target/avr/helper.h
@@ -0,0 +1,29 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+DEF_HELPER_1(wdr, void, env)
+DEF_HELPER_1(debug, void, env)
+DEF_HELPER_1(break, void, env)
+DEF_HELPER_1(sleep, void, env)
+DEF_HELPER_1(unsupported, void, env)
+DEF_HELPER_3(outb, void, env, i32, i32)
+DEF_HELPER_2(inb, tl, env, i32)
+DEF_HELPER_3(fullwr, void, env, i32, i32)
+DEF_HELPER_2(fullrd, tl, env, i32)
-- 
2.17.2 (Apple Git-113)


