Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2612C185CAD
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Mar 2020 14:33:14 +0100 (CET)
Received: from localhost ([::1]:53978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDTOD-0002cY-2q
	for lists+qemu-devel@lfdr.de; Sun, 15 Mar 2020 09:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jDTJd-00085Z-6N
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 09:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jDTJZ-00038D-F0
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 09:28:28 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jDTJY-00034D-Kz
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 09:28:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id f7so15093413wml.4
 for <qemu-devel@nongnu.org>; Sun, 15 Mar 2020 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/Fe7Y0hMuyO3GLFWa6hjZBXUsucIi8Io8iNwBE45pw=;
 b=B77jucL6wgmpzT2b4fAWS/QA1blvbtmKkNYhVywtnZfb8gDhnQrFts/xCVpffAIIks
 Re1hubtArHXn5WXOQ/b4dAUyzwMuB0Vdt3E74mtVBa6Tv3nV8t38uiV3taCRl/TdS/DC
 qXNZ1X4RTPfTOcEfY+hHgZR/hINIGBXdEA8WgUJFAZpnoLdXJOmDjgK1onp9m8+wq8Do
 p8mmm2G8uF5kCpx75PDRWE0LijH3qgKIsmMgrVtmYVg2O1PLhM3jbJLJvRr3pXFfdbjR
 RKPR39p9tflO7BoZcIQLpkFRbzZTdiW+a+U0ZuTIt/wOorgY9j3hyEo/J/bAD7jxXij6
 XEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F/Fe7Y0hMuyO3GLFWa6hjZBXUsucIi8Io8iNwBE45pw=;
 b=hOhu1GOCmKlMOWfourOMr98z3dSrwi31mVQQ3nM3+gJOCfb5kl8057+qOiO7xGu9fY
 8YiD9gEwy2T3KN/nFVW9akDv/dUvyQrH0aIZpYwNWRwRQ6KQPMSK//CdFXeb3wLiZPhA
 grJnkoV0JiuSgA+76KcGvaBUAcAJjFvYUBqx48ts5z0vpe8WVYZvsrKDHTfJE2YmZ4x4
 fJmSJgmvRkAo2rHstMeZq1bXCScGu/zgxHscwdArEASvi4YD6KKhUtlKagDgam3zN0i/
 QicN73U4ZLB6GmFiiAf1uC6NGFiKNJZG5py9RfgIRIT9ROnBMnhcxFnJdvk7OlfSQ/UN
 E5Xw==
X-Gm-Message-State: ANhLgQ3kTPxaH5CL/ri2+CLJ3NeFahjPAGv8KQSRwOuqPrsqERbtbHhp
 RDIiTOR2kc5PG9LCwXSVUzguLRfK
X-Google-Smtp-Source: ADFU+vuJJ/ZOkigxYhglzXz/1+OH+uPjEa0Uo280yYLiBkDqZQmpIHCWURCWi/PkHLG9xHeirnv7DQ==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr21836961wmj.176.1584278901978; 
 Sun, 15 Mar 2020 06:28:21 -0700 (PDT)
Received: from localhost.localdomain (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id d15sm87590503wrp.37.2020.03.15.06.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:28:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/13] target/rx: CPU definitions
Date: Sun, 15 Mar 2020 14:28:01 +0100
Message-Id: <20200315132810.7022-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200315132810.7022-1-f4bug@amsat.org>
References: <20200315132810.7022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32c
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yoshinori Sato <ysato@users.sourceforge.jp>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Use newer QOM style, split cpu-qom.h, restrict access to
 extable array, use rx_cpu_tlb_fill() extracted from patch of
 Yoshinori Sato 'Convert to CPUClass::tlb_fill', call cpu_reset
 after qemu_init_vcpu, make rx_crname a function]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200224141923.82118-7-ysato@users.sourceforge.jp>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/rx/cpu-param.h   |  31 ++++++
 target/rx/cpu-qom.h     |  43 ++++++++
 target/rx/cpu.h         | 180 ++++++++++++++++++++++++++++++++
 target/rx/cpu.c         | 226 ++++++++++++++++++++++++++++++++++++++++
 target/rx/gdbstub.c     | 112 ++++++++++++++++++++
 target/rx/translate.c   |  17 ++-
 gdb-xml/rx-core.xml     |  70 +++++++++++++
 target/rx/Makefile.objs |   1 -
 8 files changed, 674 insertions(+), 6 deletions(-)
 create mode 100644 target/rx/cpu-param.h
 create mode 100644 target/rx/cpu-qom.h
 create mode 100644 target/rx/cpu.h
 create mode 100644 target/rx/cpu.c
 create mode 100644 target/rx/gdbstub.c
 create mode 100644 gdb-xml/rx-core.xml

diff --git a/target/rx/cpu-param.h b/target/rx/cpu-param.h
new file mode 100644
index 0000000000..5da87fbebe
--- /dev/null
+++ b/target/rx/cpu-param.h
@@ -0,0 +1,31 @@
+/*
+ *  RX cpu parameters
+ *
+ *  Copyright (c) 2019 Yoshinori Sato
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef RX_CPU_PARAM_H
+#define RX_CPU_PARAM_H
+
+#define TARGET_LONG_BITS 32
+#define TARGET_PAGE_BITS 12
+
+#define TARGET_PHYS_ADDR_SPACE_BITS 32
+#define TARGET_VIRT_ADDR_SPACE_BITS 32
+
+#define NB_MMU_MODES 1
+#define MMU_MODE0_SUFFIX _all
+
+#endif
diff --git a/target/rx/cpu-qom.h b/target/rx/cpu-qom.h
new file mode 100644
index 0000000000..df43fcf103
--- /dev/null
+++ b/target/rx/cpu-qom.h
@@ -0,0 +1,43 @@
+/*
+ * RX CPU
+ *
+ * Copyright (c) 2019 Yoshinori Sato
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef RX_CPU_QOM_H
+#define RX_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+
+#define TYPE_RX_CPU "rx-cpu"
+
+#define TYPE_RX62N_CPU RX_CPU_TYPE_NAME("rx62n")
+
+#define RXCPU_CLASS(klass) \
+    OBJECT_CLASS_CHECK(RXCPUClass, (klass), TYPE_RX_CPU)
+#define RXCPU(obj) \
+    OBJECT_CHECK(RXCPU, (obj), TYPE_RX_CPU)
+#define RXCPU_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(RXCPUClass, (obj), TYPE_RX_CPU)
+
+/*
+ * RXCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_reset: The parent class' reset handler.
+ *
+ * A RX CPU model.
+ */
+typedef struct RXCPUClass {
+    /*< private >*/
+    CPUClass parent_class;
+    /*< public >*/
+
+    DeviceRealize parent_realize;
+    void (*parent_reset)(CPUState *cpu);
+
+} RXCPUClass;
+
+#define CPUArchState struct CPURXState
+
+#endif
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
new file mode 100644
index 0000000000..b716fc5789
--- /dev/null
+++ b/target/rx/cpu.h
@@ -0,0 +1,180 @@
+/*
+ *  RX emulation definition
+ *
+ *  Copyright (c) 2019 Yoshinori Sato
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef RX_CPU_H
+#define RX_CPU_H
+
+#include "qemu/bitops.h"
+#include "qemu-common.h"
+#include "hw/registerfields.h"
+#include "cpu-qom.h"
+
+#include "exec/cpu-defs.h"
+
+/* PSW define */
+REG32(PSW, 0)
+FIELD(PSW, C, 0, 1)
+FIELD(PSW, Z, 1, 1)
+FIELD(PSW, S, 2, 1)
+FIELD(PSW, O, 3, 1)
+FIELD(PSW, I, 16, 1)
+FIELD(PSW, U, 17, 1)
+FIELD(PSW, PM, 20, 1)
+FIELD(PSW, IPL, 24, 4)
+
+/* FPSW define */
+REG32(FPSW, 0)
+FIELD(FPSW, RM, 0, 2)
+FIELD(FPSW, CV, 2, 1)
+FIELD(FPSW, CO, 3, 1)
+FIELD(FPSW, CZ, 4, 1)
+FIELD(FPSW, CU, 5, 1)
+FIELD(FPSW, CX, 6, 1)
+FIELD(FPSW, CE, 7, 1)
+FIELD(FPSW, CAUSE, 2, 6)
+FIELD(FPSW, DN, 8, 1)
+FIELD(FPSW, EV, 10, 1)
+FIELD(FPSW, EO, 11, 1)
+FIELD(FPSW, EZ, 12, 1)
+FIELD(FPSW, EU, 13, 1)
+FIELD(FPSW, EX, 14, 1)
+FIELD(FPSW, ENABLE, 10, 5)
+FIELD(FPSW, FV, 26, 1)
+FIELD(FPSW, FO, 27, 1)
+FIELD(FPSW, FZ, 28, 1)
+FIELD(FPSW, FU, 29, 1)
+FIELD(FPSW, FX, 30, 1)
+FIELD(FPSW, FLAGS, 26, 4)
+FIELD(FPSW, FS, 31, 1)
+
+enum {
+    NUM_REGS = 16,
+};
+
+typedef struct CPURXState {
+    /* CPU registers */
+    uint32_t regs[NUM_REGS];    /* general registers */
+    uint32_t psw_o;             /* O bit of status register */
+    uint32_t psw_s;             /* S bit of status register */
+    uint32_t psw_z;             /* Z bit of status register */
+    uint32_t psw_c;             /* C bit of status register */
+    uint32_t psw_u;
+    uint32_t psw_i;
+    uint32_t psw_pm;
+    uint32_t psw_ipl;
+    uint32_t bpsw;              /* backup status */
+    uint32_t bpc;               /* backup pc */
+    uint32_t isp;               /* global base register */
+    uint32_t usp;               /* vector base register */
+    uint32_t pc;                /* program counter */
+    uint32_t intb;              /* interrupt vector */
+    uint32_t fintv;
+    uint32_t fpsw;
+    uint64_t acc;
+
+    /* Fields up to this point are cleared by a CPU reset */
+    struct {} end_reset_fields;
+
+    /* Internal use */
+    uint32_t in_sleep;
+    uint32_t req_irq;           /* Requested interrupt no (hard) */
+    uint32_t req_ipl;           /* Requested interrupt level */
+    uint32_t ack_irq;           /* execute irq */
+    uint32_t ack_ipl;           /* execute ipl */
+    float_status fp_status;
+    qemu_irq ack;               /* Interrupt acknowledge */
+} CPURXState;
+
+/*
+ * RXCPU:
+ * @env: #CPURXState
+ *
+ * A RX CPU
+ */
+struct RXCPU {
+    /*< private >*/
+    CPUState parent_obj;
+    /*< public >*/
+
+    CPUNegativeOffsetState neg;
+    CPURXState env;
+};
+
+typedef struct RXCPU RXCPU;
+typedef RXCPU ArchCPU;
+
+#define ENV_OFFSET offsetof(RXCPU, env)
+
+#define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
+#define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_RX_CPU
+
+const char *rx_crname(uint8_t cr);
+void rx_cpu_do_interrupt(CPUState *cpu);
+bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
+void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+int rx_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
+int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+
+void rx_translate_init(void);
+int cpu_rx_signal_handler(int host_signum, void *pinfo,
+                           void *puc);
+
+void rx_cpu_list(void);
+void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte);
+
+#define cpu_signal_handler cpu_rx_signal_handler
+#define cpu_list rx_cpu_list
+
+#include "exec/cpu-all.h"
+
+#define CPU_INTERRUPT_SOFT CPU_INTERRUPT_TGT_INT_0
+#define CPU_INTERRUPT_FIR  CPU_INTERRUPT_TGT_INT_1
+
+#define RX_CPU_IRQ 0
+#define RX_CPU_FIR 1
+
+static inline void cpu_get_tb_cpu_state(CPURXState *env, target_ulong *pc,
+                                        target_ulong *cs_base, uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = FIELD_DP32(0, PSW, PM, env->psw_pm);
+}
+
+static inline int cpu_mmu_index(CPURXState *env, bool ifetch)
+{
+    return 0;
+}
+
+static inline uint32_t rx_cpu_pack_psw(CPURXState *env)
+{
+    uint32_t psw = 0;
+    psw = FIELD_DP32(psw, PSW, IPL, env->psw_ipl);
+    psw = FIELD_DP32(psw, PSW, PM,  env->psw_pm);
+    psw = FIELD_DP32(psw, PSW, U,   env->psw_u);
+    psw = FIELD_DP32(psw, PSW, I,   env->psw_i);
+    psw = FIELD_DP32(psw, PSW, O,   env->psw_o >> 31);
+    psw = FIELD_DP32(psw, PSW, S,   env->psw_s >> 31);
+    psw = FIELD_DP32(psw, PSW, Z,   env->psw_z == 0);
+    psw = FIELD_DP32(psw, PSW, C,   env->psw_c);
+    return psw;
+}
+
+#endif /* RX_CPU_H */
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
new file mode 100644
index 0000000000..9c224a273c
--- /dev/null
+++ b/target/rx/cpu.c
@@ -0,0 +1,226 @@
+/*
+ * QEMU RX CPU
+ *
+ * Copyright (c) 2019 Yoshinori Sato
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/qemu-print.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "qemu-common.h"
+#include "migration/vmstate.h"
+#include "exec/exec-all.h"
+#include "hw/loader.h"
+#include "fpu/softfloat.h"
+
+static void rx_cpu_set_pc(CPUState *cs, vaddr value)
+{
+    RXCPU *cpu = RXCPU(cs);
+
+    cpu->env.pc = value;
+}
+
+static void rx_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+{
+    RXCPU *cpu = RXCPU(cs);
+
+    cpu->env.pc = tb->pc;
+}
+
+static bool rx_cpu_has_work(CPUState *cs)
+{
+    return cs->interrupt_request &
+        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR);
+}
+
+static void rx_cpu_reset(CPUState *s)
+{
+    RXCPU *cpu = RXCPU(s);
+    RXCPUClass *rcc = RXCPU_GET_CLASS(cpu);
+    CPURXState *env = &cpu->env;
+    uint32_t *resetvec;
+
+    rcc->parent_reset(s);
+
+    memset(env, 0, offsetof(CPURXState, end_reset_fields));
+
+    resetvec = rom_ptr(0xfffffffc, 4);
+    if (resetvec) {
+        /* In the case of kernel, it is ignored because it is not set. */
+        env->pc = ldl_p(resetvec);
+    }
+    rx_cpu_unpack_psw(env, 0, 1);
+    env->regs[0] = env->isp = env->usp = 0;
+    env->fpsw = 0;
+    set_flush_to_zero(1, &env->fp_status);
+    set_flush_inputs_to_zero(1, &env->fp_status);
+}
+
+static void rx_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+
+    qemu_printf("  %s\n", object_class_get_name(oc));
+}
+
+void rx_cpu_list(void)
+{
+    GSList *list;
+    list = object_class_get_list_sorted(TYPE_RX_CPU, false);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, rx_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
+static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
+{
+    ObjectClass *oc;
+    char *typename;
+
+    oc = object_class_by_name(cpu_model);
+    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_RX_CPU) != NULL &&
+        !object_class_is_abstract(oc)) {
+        return oc;
+    }
+    typename = g_strdup_printf(RX_CPU_TYPE_NAME("%s"), cpu_model);
+    oc = object_class_by_name(typename);
+    g_free(typename);
+    if (oc != NULL && object_class_is_abstract(oc)) {
+        oc = NULL;
+    }
+
+    return oc;
+}
+
+static void rx_cpu_realize(DeviceState *dev, Error **errp)
+{
+    CPUState *cs = CPU(dev);
+    RXCPUClass *rcc = RXCPU_GET_CLASS(dev);
+    Error *local_err = NULL;
+
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    qemu_init_vcpu(cs);
+    cpu_reset(cs);
+
+    rcc->parent_realize(dev, errp);
+}
+
+static void rx_cpu_set_irq(void *opaque, int no, int request)
+{
+    RXCPU *cpu = opaque;
+    CPUState *cs = CPU(cpu);
+    int irq = request & 0xff;
+
+    static const int mask[] = {
+        [RX_CPU_IRQ] = CPU_INTERRUPT_HARD,
+        [RX_CPU_FIR] = CPU_INTERRUPT_FIR,
+    };
+    if (irq) {
+        cpu->env.req_irq = irq;
+        cpu->env.req_ipl = (request >> 8) & 0x0f;
+        cpu_interrupt(cs, mask[no]);
+    } else {
+        cpu_reset_interrupt(cs, mask[no]);
+    }
+}
+
+static void rx_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
+{
+    info->mach = bfd_mach_rx;
+    info->print_insn = print_insn_rx;
+}
+
+static bool rx_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+                            MMUAccessType access_type, int mmu_idx,
+                            bool probe, uintptr_t retaddr)
+{
+    uint32_t address, physical, prot;
+
+    /* Linear mapping */
+    address = physical = addr & TARGET_PAGE_MASK;
+    prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    tlb_set_page(cs, address, physical, prot, mmu_idx, TARGET_PAGE_SIZE);
+    return true;
+}
+
+static void rx_cpu_init(Object *obj)
+{
+    CPUState *cs = CPU(obj);
+    RXCPU *cpu = RXCPU(obj);
+    CPURXState *env = &cpu->env;
+
+    cpu_set_cpustate_pointers(cpu);
+    cs->env_ptr = env;
+    qdev_init_gpio_in(DEVICE(cpu), rx_cpu_set_irq, 2);
+}
+
+static void rx_cpu_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    CPUClass *cc = CPU_CLASS(klass);
+    RXCPUClass *rcc = RXCPU_CLASS(klass);
+
+    device_class_set_parent_realize(dc, rx_cpu_realize,
+                                    &rcc->parent_realize);
+
+    rcc->parent_reset = cc->reset;
+    cc->reset = rx_cpu_reset;
+
+    cc->class_by_name = rx_cpu_class_by_name;
+    cc->has_work = rx_cpu_has_work;
+    cc->do_interrupt = rx_cpu_do_interrupt;
+    cc->cpu_exec_interrupt = rx_cpu_exec_interrupt;
+    cc->dump_state = rx_cpu_dump_state;
+    cc->set_pc = rx_cpu_set_pc;
+    cc->synchronize_from_tb = rx_cpu_synchronize_from_tb;
+    cc->gdb_read_register = rx_cpu_gdb_read_register;
+    cc->gdb_write_register = rx_cpu_gdb_write_register;
+    cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
+    cc->disas_set_info = rx_cpu_disas_set_info;
+    cc->tcg_initialize = rx_translate_init;
+    cc->tlb_fill = rx_cpu_tlb_fill;
+
+    cc->gdb_num_core_regs = 26;
+    cc->gdb_core_xml_file = "rx-core.xml";
+}
+
+static const TypeInfo rx_cpu_info = {
+    .name = TYPE_RX_CPU,
+    .parent = TYPE_CPU,
+    .instance_size = sizeof(RXCPU),
+    .instance_init = rx_cpu_init,
+    .abstract = true,
+    .class_size = sizeof(RXCPUClass),
+    .class_init = rx_cpu_class_init,
+};
+
+static const TypeInfo rx62n_rx_cpu_info = {
+    .name = TYPE_RX62N_CPU,
+    .parent = TYPE_RX_CPU,
+};
+
+static void rx_cpu_register_types(void)
+{
+    type_register_static(&rx_cpu_info);
+    type_register_static(&rx62n_rx_cpu_info);
+}
+
+type_init(rx_cpu_register_types)
diff --git a/target/rx/gdbstub.c b/target/rx/gdbstub.c
new file mode 100644
index 0000000000..d76ca52e82
--- /dev/null
+++ b/target/rx/gdbstub.c
@@ -0,0 +1,112 @@
+/*
+ * RX gdb server stub
+ *
+ * Copyright (c) 2019 Yoshinori Sato
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "exec/gdbstub.h"
+
+int rx_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
+{
+    RXCPU *cpu = RXCPU(cs);
+    CPURXState *env = &cpu->env;
+
+    switch (n) {
+    case 0 ... 15:
+        return gdb_get_regl(mem_buf, env->regs[n]);
+    case 16:
+        return gdb_get_regl(mem_buf, (env->psw_u) ? env->regs[0] : env->usp);
+    case 17:
+        return gdb_get_regl(mem_buf, (!env->psw_u) ? env->regs[0] : env->isp);
+    case 18:
+        return gdb_get_regl(mem_buf, rx_cpu_pack_psw(env));
+    case 19:
+        return gdb_get_regl(mem_buf, env->pc);
+    case 20:
+        return gdb_get_regl(mem_buf, env->intb);
+    case 21:
+        return gdb_get_regl(mem_buf, env->bpsw);
+    case 22:
+        return gdb_get_regl(mem_buf, env->bpc);
+    case 23:
+        return gdb_get_regl(mem_buf, env->fintv);
+    case 24:
+        return gdb_get_regl(mem_buf, env->fpsw);
+    case 25:
+        return 0;
+    }
+    return 0;
+}
+
+int rx_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+{
+    RXCPU *cpu = RXCPU(cs);
+    CPURXState *env = &cpu->env;
+    uint32_t psw;
+    switch (n) {
+    case 0 ... 15:
+        env->regs[n] = ldl_p(mem_buf);
+        if (n == 0) {
+            if (env->psw_u) {
+                env->usp = env->regs[0];
+            } else {
+                env->isp = env->regs[0];
+            }
+        }
+        break;
+    case 16:
+        env->usp = ldl_p(mem_buf);
+        if (env->psw_u) {
+            env->regs[0] = ldl_p(mem_buf);
+        }
+        break;
+    case 17:
+        env->isp = ldl_p(mem_buf);
+        if (!env->psw_u) {
+            env->regs[0] = ldl_p(mem_buf);
+        }
+        break;
+    case 18:
+        psw = ldl_p(mem_buf);
+        rx_cpu_unpack_psw(env, psw, 1);
+        break;
+    case 19:
+        env->pc = ldl_p(mem_buf);
+        break;
+    case 20:
+        env->intb = ldl_p(mem_buf);
+        break;
+    case 21:
+        env->bpsw = ldl_p(mem_buf);
+        break;
+    case 22:
+        env->bpc = ldl_p(mem_buf);
+        break;
+    case 23:
+        env->fintv = ldl_p(mem_buf);
+        break;
+    case 24:
+        env->fpsw = ldl_p(mem_buf);
+        break;
+    case 25:
+        return 8;
+    default:
+        return 0;
+    }
+
+    return 4;
+}
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 6b52424d0f..b3d7305f23 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -41,10 +41,17 @@ typedef struct DisasCompare {
     TCGCond cond;
 } DisasCompare;
 
-const char rx_crname[][6] = {
-    "psw", "pc", "usp", "fpsw", "", "", "", "",
-    "bpsw", "bpc", "isp", "fintv", "intb", "", "", "",
-};
+const char *rx_crname(uint8_t cr)
+{
+    static const char *cr_names[] = {
+        "psw", "pc", "usp", "fpsw", "", "", "", "",
+        "bpsw", "bpc", "isp", "fintv", "intb", "", "", ""
+    };
+    if (cr >= ARRAY_SIZE(cr_names)) {
+        return "illegal";
+    }
+    return cr_names[cr];
+}
 
 /* Target-specific values for dc->base.is_jmp.  */
 #define DISAS_JUMP    DISAS_TARGET_0
@@ -365,7 +372,7 @@ static void move_to_cr(DisasContext *ctx, TCGv val, int cr)
     if (cr >= 8 && !is_privileged(ctx, 0)) {
         /* Some control registers can only be written in privileged mode. */
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "disallow control register write %s", rx_crname[cr]);
+                      "disallow control register write %s", rx_crname(cr));
         return;
     }
     z = tcg_const_i32(0);
diff --git a/gdb-xml/rx-core.xml b/gdb-xml/rx-core.xml
new file mode 100644
index 0000000000..b5aa9ac4a8
--- /dev/null
+++ b/gdb-xml/rx-core.xml
@@ -0,0 +1,70 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2019 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.rx.core">
+  <reg name="r0" bitsize="32" type="data_ptr"/>
+  <reg name="r1" bitsize="32" type="uint32"/>
+  <reg name="r2" bitsize="32" type="uint32"/>
+  <reg name="r3" bitsize="32" type="uint32"/>
+  <reg name="r4" bitsize="32" type="uint32"/>
+  <reg name="r5" bitsize="32" type="uint32"/>
+  <reg name="r6" bitsize="32" type="uint32"/>
+  <reg name="r7" bitsize="32" type="uint32"/>
+  <reg name="r8" bitsize="32" type="uint32"/>
+  <reg name="r9" bitsize="32" type="uint32"/>
+  <reg name="r10" bitsize="32" type="uint32"/>
+  <reg name="r11" bitsize="32" type="uint32"/>
+  <reg name="r12" bitsize="32" type="uint32"/>
+  <reg name="r13" bitsize="32" type="uint32"/>
+  <reg name="r14" bitsize="32" type="uint32"/>
+  <reg name="r15" bitsize="32" type="uint32"/>
+
+  <flags id="psw_flags" size="4">
+    <field name="C" start="0" end="0"/>
+    <field name="Z" start="1" end="1"/>
+    <field name="S" start="2" end="2"/>
+    <field name="O" start="3" end="3"/>
+    <field name="I" start="16" end="16"/>
+    <field name="U" start="17" end="17"/>
+    <field name="PM" start="20" end="20"/>
+    <field name="IPL" start="24" end="27"/>
+  </flags>
+
+  <flags id="fpsw_flags" size="4">
+    <field name="RM" start="0" end="1"/>
+    <field name="CV" start="2" end="2"/>
+    <field name="CO" start="3" end="3"/>
+    <field name="CZ" start="4" end="4"/>
+    <field name="CU" start="5" end="5"/>
+    <field name="CX" start="6" end="6"/>
+    <field name="CE" start="7" end="7"/>
+    <field name="DN" start="8" end="8"/>
+    <field name="EV" start="10" end="10"/>
+    <field name="EO" start="11" end="11"/>
+    <field name="EZ" start="12" end="12"/>
+    <field name="EU" start="13" end="13"/>
+    <field name="EX" start="14" end="14"/>
+    <field name="FV" start="26" end="26"/>
+    <field name="FO" start="27" end="27"/>
+    <field name="FZ" start="28" end="28"/>
+    <field name="FU" start="29" end="29"/>
+    <field name="FX" start="30" end="30"/>
+    <field name="FS" start="31" end="31"/>
+  </flags>
+
+  <reg name="usp" bitsize="32" type="data_ptr"/>
+  <reg name="isp" bitsize="32" type="data_ptr"/>
+  <reg name="psw" bitsize="32" type="psw_flags"/>
+  <reg name="pc" bitsize="32" type="code_ptr"/>
+  <reg name="intb" bitsize="32" type="data_ptr"/>
+  <reg name="bpsw" bitsize="32" type="psw_flags"/>
+  <reg name="bpc" bitsize="32" type="code_ptr"/>
+  <reg name="fintv" bitsize="32" type="code_ptr"/>
+  <reg name="fpsw" bitsize="32" type="fpsw_flags"/>
+  <reg name="acc" bitsize="64" type="uint64"/>
+</feature>
diff --git a/target/rx/Makefile.objs b/target/rx/Makefile.objs
index aa6f2d2d6c..a0018d5bc5 100644
--- a/target/rx/Makefile.objs
+++ b/target/rx/Makefile.objs
@@ -1,5 +1,4 @@
 obj-y += translate.o op_helper.o helper.o cpu.o gdbstub.o disas.o
-obj-$(CONFIG_SOFTMMU) += monitor.o
 
 DECODETREE = $(SRC_PATH)/scripts/decodetree.py
 
-- 
2.21.1


