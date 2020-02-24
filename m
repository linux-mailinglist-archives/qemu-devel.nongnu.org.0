Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECB116A83B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 15:23:33 +0100 (CET)
Received: from localhost ([::1]:37056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Edv-0004W9-HE
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 09:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j6Ea8-0004M1-K4
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:19:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j6Ea4-0005pk-D9
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:19:36 -0500
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:38674)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j6Ea3-0005nU-UW
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:19:32 -0500
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail01.asahi-net.or.jp (Postfix) with ESMTPA id 9BA60558C3;
 Mon, 24 Feb 2020 23:19:29 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 43BF824008F;
 Mon, 24 Feb 2020 23:19:29 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v32 06/22] target/rx: CPU definition
Date: Mon, 24 Feb 2020 23:19:07 +0900
Message-Id: <20200224141923.82118-7-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224141923.82118-1-ysato@users.sourceforge.jp>
References: <20200224141923.82118-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.13
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
Cc: richard.henderson@linaro.org, philmd@redhat.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Message-Id: <20190616142836.10614-4-ysato@users.sourceforge.jp>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20190607091116.49044-4-ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Use newer QOM style, split cpu-qom.h, restrict access to
 extable array, use rx_cpu_tlb_fill() extracted from patch of
 Yoshinori Sato 'Convert to CPUClass::tlb_fill']
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 target/rx/cpu-param.h   |  31 ++++++
 target/rx/cpu-qom.h     |  42 ++++++++
 target/rx/cpu.h         | 181 +++++++++++++++++++++++++++++++++
 target/rx/cpu.c         | 218 ++++++++++++++++++++++++++++++++++++++++
 target/rx/gdbstub.c     | 112 +++++++++++++++++++++
 gdb-xml/rx-core.xml     |  70 +++++++++++++
 target/rx/Makefile.objs |   1 -
 7 files changed, 654 insertions(+), 1 deletion(-)
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
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
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
index 0000000000..8328900f3f
--- /dev/null
+++ b/target/rx/cpu-qom.h
@@ -0,0 +1,42 @@
+#ifndef QEMU_RX_CPU_QOM_H
+#define QEMU_RX_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+/*
+ * RX CPU
+ *
+ * Copyright (c) 2019 Yoshinori Sato
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
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
index 0000000000..2d1eb7665c
--- /dev/null
+++ b/target/rx/cpu.h
@@ -0,0 +1,181 @@
+/*
+ *  RX emulation definition
+ *
+ *  Copyright (c) 2019 Yoshinori Sato
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
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
+    NUM_REGS =3D 16,
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
+extern const char rx_crname[][6];
+
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
+static inline void cpu_get_tb_cpu_state(CPURXState *env, target_ulong *p=
c,
+                                        target_ulong *cs_base, uint32_t =
*flags)
+{
+    *pc =3D env->pc;
+    *cs_base =3D 0;
+    *flags =3D FIELD_DP32(0, PSW, PM, env->psw_pm);
+}
+
+static inline int cpu_mmu_index(CPURXState *env, bool ifetch)
+{
+    return 0;
+}
+
+static inline uint32_t rx_cpu_pack_psw(CPURXState *env)
+{
+    uint32_t psw =3D 0;
+    psw =3D FIELD_DP32(psw, PSW, IPL, env->psw_ipl);
+    psw =3D FIELD_DP32(psw, PSW, PM,  env->psw_pm);
+    psw =3D FIELD_DP32(psw, PSW, U,   env->psw_u);
+    psw =3D FIELD_DP32(psw, PSW, I,   env->psw_i);
+    psw =3D FIELD_DP32(psw, PSW, O,   env->psw_o >> 31);
+    psw =3D FIELD_DP32(psw, PSW, S,   env->psw_s >> 31);
+    psw =3D FIELD_DP32(psw, PSW, Z,   env->psw_z =3D=3D 0);
+    psw =3D FIELD_DP32(psw, PSW, C,   env->psw_c);
+    return psw;
+}
+
+#endif /* RX_CPU_H */
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
new file mode 100644
index 0000000000..8ff0f1c14f
--- /dev/null
+++ b/target/rx/cpu.c
@@ -0,0 +1,218 @@
+/*
+ * QEMU RX CPU
+ *
+ * Copyright (c) 2019 Yoshinori Sato
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
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
+    RXCPU *cpu =3D RXCPU(cs);
+
+    cpu->env.pc =3D value;
+}
+
+static void rx_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *t=
b)
+{
+    RXCPU *cpu =3D RXCPU(cs);
+
+    cpu->env.pc =3D tb->pc;
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
+    RXCPU *cpu =3D RXCPU(s);
+    RXCPUClass *rcc =3D RXCPU_GET_CLASS(cpu);
+    CPURXState *env =3D &cpu->env;
+    uint32_t *resetvec;
+
+    rcc->parent_reset(s);
+
+    memset(env, 0, offsetof(CPURXState, end_reset_fields));
+
+    resetvec =3D rom_ptr(0xfffffffc, 4);
+    if (resetvec) {
+        /* In the case of kernel, it is ignored because it is not set. *=
/
+        env->pc =3D ldl_p(resetvec);
+    }
+    rx_cpu_unpack_psw(env, 0, 1);
+    env->regs[0] =3D env->isp =3D env->usp =3D 0;
+    env->fpsw =3D 0;
+    set_flush_to_zero(1, &env->fp_status);
+    set_flush_inputs_to_zero(1, &env->fp_status);
+}
+
+static void rx_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    const char *typename =3D object_class_get_name(OBJECT_CLASS(data));
+
+    qemu_printf("%s\n", typename);
+}
+
+void rx_cpu_list(void)
+{
+    GSList *list;
+    list =3D object_class_get_list_sorted(TYPE_RX_CPU, false);
+    g_slist_foreach(list, rx_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
+static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
+{
+    ObjectClass *oc;
+
+    oc =3D object_class_by_name(cpu_model);
+    if (object_class_dynamic_cast(oc, TYPE_RX_CPU) =3D=3D NULL ||
+        object_class_is_abstract(oc)) {
+        oc =3D NULL;
+    }
+
+    return oc;
+}
+
+static void rx_cpu_realize(DeviceState *dev, Error **errp)
+{
+    CPUState *cs =3D CPU(dev);
+    RXCPUClass *rcc =3D RXCPU_GET_CLASS(dev);
+    Error *local_err =3D NULL;
+
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err !=3D NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    cpu_reset(cs);
+    qemu_init_vcpu(cs);
+
+    rcc->parent_realize(dev, errp);
+}
+
+static void rx_cpu_set_irq(void *opaque, int no, int request)
+{
+    RXCPU *cpu =3D opaque;
+    CPUState *cs =3D CPU(cpu);
+    int irq =3D request & 0xff;
+
+    static const int mask[] =3D {
+        [RX_CPU_IRQ] =3D CPU_INTERRUPT_HARD,
+        [RX_CPU_FIR] =3D CPU_INTERRUPT_FIR,
+    };
+    if (irq) {
+        cpu->env.req_irq =3D irq;
+        cpu->env.req_ipl =3D (request >> 8) & 0x0f;
+        cpu_interrupt(cs, mask[no]);
+    } else {
+        cpu_reset_interrupt(cs, mask[no]);
+    }
+}
+
+static void rx_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
+{
+    info->mach =3D bfd_mach_rx;
+    info->print_insn =3D print_insn_rx;
+}
+
+static bool rx_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+                            MMUAccessType access_type, int mmu_idx,
+                            bool probe, uintptr_t retaddr)
+{
+    uint32_t address, physical, prot;
+
+    /* Linear mapping */
+    address =3D physical =3D addr & TARGET_PAGE_MASK;
+    prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    tlb_set_page(cs, address, physical, prot, mmu_idx, TARGET_PAGE_SIZE)=
;
+    return true;
+}
+
+static void rx_cpu_init(Object *obj)
+{
+    CPUState *cs =3D CPU(obj);
+    RXCPU *cpu =3D RXCPU(obj);
+    CPURXState *env =3D &cpu->env;
+
+    cpu_set_cpustate_pointers(cpu);
+    cs->env_ptr =3D env;
+    qdev_init_gpio_in(DEVICE(cpu), rx_cpu_set_irq, 2);
+}
+
+static void rx_cpu_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    CPUClass *cc =3D CPU_CLASS(klass);
+    RXCPUClass *rcc =3D RXCPU_CLASS(klass);
+
+    device_class_set_parent_realize(dc, rx_cpu_realize,
+                                    &rcc->parent_realize);
+
+    rcc->parent_reset =3D cc->reset;
+    cc->reset =3D rx_cpu_reset;
+
+    cc->class_by_name =3D rx_cpu_class_by_name;
+    cc->has_work =3D rx_cpu_has_work;
+    cc->do_interrupt =3D rx_cpu_do_interrupt;
+    cc->cpu_exec_interrupt =3D rx_cpu_exec_interrupt;
+    cc->dump_state =3D rx_cpu_dump_state;
+    cc->set_pc =3D rx_cpu_set_pc;
+    cc->synchronize_from_tb =3D rx_cpu_synchronize_from_tb;
+    cc->gdb_read_register =3D rx_cpu_gdb_read_register;
+    cc->gdb_write_register =3D rx_cpu_gdb_write_register;
+    cc->get_phys_page_debug =3D rx_cpu_get_phys_page_debug;
+    cc->disas_set_info =3D rx_cpu_disas_set_info;
+    cc->tcg_initialize =3D rx_translate_init;
+    cc->tlb_fill =3D rx_cpu_tlb_fill;
+
+    cc->gdb_num_core_regs =3D 26;
+    cc->gdb_core_xml_file =3D "rx-core.xml";
+}
+
+static const TypeInfo rx_cpu_info =3D {
+    .name =3D TYPE_RX_CPU,
+    .parent =3D TYPE_CPU,
+    .instance_size =3D sizeof(RXCPU),
+    .instance_init =3D rx_cpu_init,
+    .abstract =3D true,
+    .class_size =3D sizeof(RXCPUClass),
+    .class_init =3D rx_cpu_class_init,
+};
+
+static const TypeInfo rx62n_rx_cpu_info =3D {
+    .name =3D TYPE_RX62N_CPU,
+    .parent =3D TYPE_RX_CPU,
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
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "exec/gdbstub.h"
+
+int rx_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
+{
+    RXCPU *cpu =3D RXCPU(cs);
+    CPURXState *env =3D &cpu->env;
+
+    switch (n) {
+    case 0 ... 15:
+        return gdb_get_regl(mem_buf, env->regs[n]);
+    case 16:
+        return gdb_get_regl(mem_buf, (env->psw_u) ? env->regs[0] : env->=
usp);
+    case 17:
+        return gdb_get_regl(mem_buf, (!env->psw_u) ? env->regs[0] : env-=
>isp);
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
+    RXCPU *cpu =3D RXCPU(cs);
+    CPURXState *env =3D &cpu->env;
+    uint32_t psw;
+    switch (n) {
+    case 0 ... 15:
+        env->regs[n] =3D ldl_p(mem_buf);
+        if (n =3D=3D 0) {
+            if (env->psw_u) {
+                env->usp =3D env->regs[0];
+            } else {
+                env->isp =3D env->regs[0];
+            }
+        }
+        break;
+    case 16:
+        env->usp =3D ldl_p(mem_buf);
+        if (env->psw_u) {
+            env->regs[0] =3D ldl_p(mem_buf);
+        }
+        break;
+    case 17:
+        env->isp =3D ldl_p(mem_buf);
+        if (!env->psw_u) {
+            env->regs[0] =3D ldl_p(mem_buf);
+        }
+        break;
+    case 18:
+        psw =3D ldl_p(mem_buf);
+        rx_cpu_unpack_psw(env, psw, 1);
+        break;
+    case 19:
+        env->pc =3D ldl_p(mem_buf);
+        break;
+    case 20:
+        env->intb =3D ldl_p(mem_buf);
+        break;
+    case 21:
+        env->bpsw =3D ldl_p(mem_buf);
+        break;
+    case 22:
+        env->bpc =3D ldl_p(mem_buf);
+        break;
+    case 23:
+        env->fintv =3D ldl_p(mem_buf);
+        break;
+    case 24:
+        env->fpsw =3D ldl_p(mem_buf);
+        break;
+    case 25:
+        return 8;
+    default:
+        return 0;
+    }
+
+    return 4;
+}
diff --git a/gdb-xml/rx-core.xml b/gdb-xml/rx-core.xml
new file mode 100644
index 0000000000..b5aa9ac4a8
--- /dev/null
+++ b/gdb-xml/rx-core.xml
@@ -0,0 +1,70 @@
+<?xml version=3D"1.0"?>
+<!-- Copyright (C) 2019 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification=
,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name=3D"org.gnu.gdb.rx.core">
+  <reg name=3D"r0" bitsize=3D"32" type=3D"data_ptr"/>
+  <reg name=3D"r1" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r2" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r3" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r4" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r5" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r6" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r7" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r8" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r9" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r10" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r11" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r12" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r13" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r14" bitsize=3D"32" type=3D"uint32"/>
+  <reg name=3D"r15" bitsize=3D"32" type=3D"uint32"/>
+
+  <flags id=3D"psw_flags" size=3D"4">
+    <field name=3D"C" start=3D"0" end=3D"0"/>
+    <field name=3D"Z" start=3D"1" end=3D"1"/>
+    <field name=3D"S" start=3D"2" end=3D"2"/>
+    <field name=3D"O" start=3D"3" end=3D"3"/>
+    <field name=3D"I" start=3D"16" end=3D"16"/>
+    <field name=3D"U" start=3D"17" end=3D"17"/>
+    <field name=3D"PM" start=3D"20" end=3D"20"/>
+    <field name=3D"IPL" start=3D"24" end=3D"27"/>
+  </flags>
+
+  <flags id=3D"fpsw_flags" size=3D"4">
+    <field name=3D"RM" start=3D"0" end=3D"1"/>
+    <field name=3D"CV" start=3D"2" end=3D"2"/>
+    <field name=3D"CO" start=3D"3" end=3D"3"/>
+    <field name=3D"CZ" start=3D"4" end=3D"4"/>
+    <field name=3D"CU" start=3D"5" end=3D"5"/>
+    <field name=3D"CX" start=3D"6" end=3D"6"/>
+    <field name=3D"CE" start=3D"7" end=3D"7"/>
+    <field name=3D"DN" start=3D"8" end=3D"8"/>
+    <field name=3D"EV" start=3D"10" end=3D"10"/>
+    <field name=3D"EO" start=3D"11" end=3D"11"/>
+    <field name=3D"EZ" start=3D"12" end=3D"12"/>
+    <field name=3D"EU" start=3D"13" end=3D"13"/>
+    <field name=3D"EX" start=3D"14" end=3D"14"/>
+    <field name=3D"FV" start=3D"26" end=3D"26"/>
+    <field name=3D"FO" start=3D"27" end=3D"27"/>
+    <field name=3D"FZ" start=3D"28" end=3D"28"/>
+    <field name=3D"FU" start=3D"29" end=3D"29"/>
+    <field name=3D"FX" start=3D"30" end=3D"30"/>
+    <field name=3D"FS" start=3D"31" end=3D"31"/>
+  </flags>
+
+  <reg name=3D"usp" bitsize=3D"32" type=3D"data_ptr"/>
+  <reg name=3D"isp" bitsize=3D"32" type=3D"data_ptr"/>
+  <reg name=3D"psw" bitsize=3D"32" type=3D"psw_flags"/>
+  <reg name=3D"pc" bitsize=3D"32" type=3D"code_ptr"/>
+  <reg name=3D"intb" bitsize=3D"32" type=3D"data_ptr"/>
+  <reg name=3D"bpsw" bitsize=3D"32" type=3D"psw_flags"/>
+  <reg name=3D"bpc" bitsize=3D"32" type=3D"code_ptr"/>
+  <reg name=3D"fintv" bitsize=3D"32" type=3D"code_ptr"/>
+  <reg name=3D"fpsw" bitsize=3D"32" type=3D"fpsw_flags"/>
+  <reg name=3D"acc" bitsize=3D"64" type=3D"uint64"/>
+</feature>
diff --git a/target/rx/Makefile.objs b/target/rx/Makefile.objs
index aa6f2d2d6c..a0018d5bc5 100644
--- a/target/rx/Makefile.objs
+++ b/target/rx/Makefile.objs
@@ -1,5 +1,4 @@
 obj-y +=3D translate.o op_helper.o helper.o cpu.o gdbstub.o disas.o
-obj-$(CONFIG_SOFTMMU) +=3D monitor.o
=20
 DECODETREE =3D $(SRC_PATH)/scripts/decodetree.py
=20
--=20
2.20.1


