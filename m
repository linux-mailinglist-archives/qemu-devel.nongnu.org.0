Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D8832D5B6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:57:28 +0100 (CET)
Received: from localhost ([::1]:49668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpPr-0001fH-LO
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpGy-0001ge-Ba
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:16 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpGp-0007sK-WD
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869287; x=1646405287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=os+QgHb9AxiF6OvItjjoWsfrcYZhzGBWbXCWpaXedaQ=;
 b=rJwnfkaF75Eav6tZd6CuNGSuktWYVpVX5aRKjxxd02y3UZh16ixa9lB4
 U/oCwZFrEzt7kcl2bC3BCm39kJ73FGyoZ7gDvh7R6+nK8o8zTGA7B+BX7
 OHg/rOXXfBQmdQscDne22ka+wInkwX6KL2BqAEiHk6OqtonqsMNqKUt1B
 pfomjb08Bs2Ip5amYdhKIsBvsOy2DTvs7gtjV9GSjXQZYRXUBxbWjwtLP
 ufb6QopQGa5DUqU+RwksihJTOZLrB2+pCqzuqLYzpk0vxlD12VX9NY2bW
 Oo1mceHCkHPs2EEFuZOufqMpWVIxVM7xQMfcbzLkCXD4PmpRtXAsisnj6 g==;
IronPort-SDR: A4QnEI4SXfHiZImsy/ioZ6OH23u4eyMLdJ6Fou3Cfer50L3LIXKzoIegJGMlKnRO4nXwIaE+kX
 axE+bIGqGeg/jIfVana8qfy1SvoMFqWkufqoUw6InmjrnW/J2aVUfyLHOiM+DtDQlLwXN1s0/0
 P+e+YtCZUOn+m5DdsO9m0cbTvXp7BF4Nb3Ald6bemCMhwi89Y0XVzclYA2odg5K2TS37in4x0t
 8Q7BdhVwpQTkkLTq68xV1XJVZ8FWIGfvwMtEyFBYWOLw94PKkt0b5beE8mdzRXpKwMABLjVHJi
 /CU=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984402"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:06 +0800
IronPort-SDR: xzkqwfYHiNoDjFxsMAVX0T1wqVb1tcKUA8hYIhkhH1IAGTZJiBpQlrZQtRs4sgl2r6swNELd7c
 c3DEQKWxB3NxVqWezcETsCmUrpAiTMcSwlX2hsOXtpC5RA4ucZXV3WtlIHKicwXu0SOr2prGpV
 1MkpDxo1sSNP/SXzG5GML41mlmLyc/vGfQb4TtKt35eYQS/rAdSKgV/yhQoZmVcHzaaK7/WMjt
 PVJsWR/O9KUfZfgJouFg2Am2YsjkI9VoQryTs/LlI5R4XyqjeX34w83tSQ6Pgcv6o6rCXK7UuM
 g/a44sIsTqUPAMB4eLsooyje
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:19 -0800
IronPort-SDR: BbPaSC3JumSQWj9PAk1gcpZVZM1JghjB9hItCnCZhh/rftmxdBNR/57Oq/OG7sli1dCr8PBuLh
 tIoKGkyjBPv1bqON3Xjarp311lE8RWbDfsea4O7JdawpkT17iOjet2d7fWmHySnag8M8srA6hp
 KaqHw353QlB2e94dbSVl1/XjHsUVc/Q2qSnBeRhc5XwhjYiu2zT4SiIcNHqTXj0AxQR52zcyp0
 hjjVPz6yMXmXzOwlaSdqXTP77svKIkO8j1g6dDPNdMmWqi5tPiqFJeg1BrcECIXrzTZxSLeX0C
 f7U=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:06 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 04/19] target-riscv: support QMP dump-guest-memory
Date: Thu,  4 Mar 2021 09:46:36 -0500
Message-Id: <20210304144651.310037-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jones <drjones@redhat.com>, Mingwang Li <limingwang@huawei.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Yifei Jiang <jiangyifei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yifei Jiang <jiangyifei@huawei.com>

Add the support needed for creating prstatus elf notes. This allows
us to use QMP dump-guest-memory.

Now ELF notes of RISC-V only contain prstatus elf notes.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: 20210201124458.1248-2-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       |   4 +
 target/riscv/cpu_bits.h  |   1 +
 target/riscv/arch_dump.c | 202 +++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.c       |   2 +
 target/riscv/meson.build |   1 +
 5 files changed, 210 insertions(+)
 create mode 100644 target/riscv/arch_dump.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 419a21478c..0edb2826a2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -323,6 +323,10 @@ extern const char * const riscv_intr_names[];
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
 void riscv_cpu_do_interrupt(CPUState *cpu);
+int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
+                               int cpuid, void *opaque);
+int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
+                               int cpuid, void *opaque);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4196ef8b69..caf4599207 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -368,6 +368,7 @@
 #define MSTATUS_MIE         0x00000008
 #define MSTATUS_UPIE        0x00000010
 #define MSTATUS_SPIE        0x00000020
+#define MSTATUS_UBE         0x00000040
 #define MSTATUS_MPIE        0x00000080
 #define MSTATUS_SPP         0x00000100
 #define MSTATUS_MPP         0x00001800
diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
new file mode 100644
index 0000000000..709f621d82
--- /dev/null
+++ b/target/riscv/arch_dump.c
@@ -0,0 +1,202 @@
+/* Support for writing ELF notes for RISC-V architectures
+ *
+ * Copyright (C) 2021 Huawei Technologies Co., Ltd
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
+#include "cpu.h"
+#include "elf.h"
+#include "sysemu/dump.h"
+
+/* struct user_regs_struct from arch/riscv/include/uapi/asm/ptrace.h */
+struct riscv64_user_regs {
+    uint64_t pc;
+    uint64_t regs[31];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct riscv64_user_regs) != 256);
+
+/* struct elf_prstatus from include/linux/elfcore.h */
+struct riscv64_elf_prstatus {
+    char pad1[32]; /* 32 == offsetof(struct elf_prstatus, pr_pid) */
+    uint32_t pr_pid;
+    char pad2[76]; /* 76 == offsetof(struct elf_prstatus, pr_reg) -
+                            offsetof(struct elf_prstatus, pr_ppid) */
+    struct riscv64_user_regs pr_reg;
+    char pad3[8];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct riscv64_elf_prstatus) != 376);
+
+struct riscv64_note {
+    Elf64_Nhdr hdr;
+    char name[8]; /* align_up(sizeof("CORE"), 4) */
+    struct riscv64_elf_prstatus prstatus;
+} QEMU_PACKED;
+
+#define RISCV64_NOTE_HEADER_SIZE offsetof(struct riscv64_note, prstatus)
+#define RISCV64_PRSTATUS_NOTE_SIZE \
+            (RISCV64_NOTE_HEADER_SIZE + sizeof(struct riscv64_elf_prstatus))
+
+static void riscv64_note_init(struct riscv64_note *note, DumpState *s,
+                              const char *name, Elf64_Word namesz,
+                              Elf64_Word type, Elf64_Word descsz)
+{
+    memset(note, 0, sizeof(*note));
+
+    note->hdr.n_namesz = cpu_to_dump32(s, namesz);
+    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
+    note->hdr.n_type = cpu_to_dump32(s, type);
+
+    memcpy(note->name, name, namesz);
+}
+
+int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
+                               int cpuid, void *opaque)
+{
+    struct riscv64_note note;
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    DumpState *s = opaque;
+    int ret, i = 0;
+    const char name[] = "CORE";
+
+    riscv64_note_init(&note, s, name, sizeof(name),
+                      NT_PRSTATUS, sizeof(note.prstatus));
+
+    note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
+
+    note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
+
+    for (i = 0; i < 31; i++) {
+        note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->gpr[i + 1]);
+    }
+
+    ret = f(&note, RISCV64_PRSTATUS_NOTE_SIZE, s);
+    if (ret < 0) {
+        return -1;
+    }
+
+    return ret;
+}
+
+struct riscv32_user_regs {
+    uint32_t pc;
+    uint32_t regs[31];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct riscv32_user_regs) != 128);
+
+struct riscv32_elf_prstatus {
+    char pad1[24]; /* 24 == offsetof(struct elf_prstatus, pr_pid) */
+    uint32_t pr_pid;
+    char pad2[44]; /* 44 == offsetof(struct elf_prstatus, pr_reg) -
+                            offsetof(struct elf_prstatus, pr_ppid) */
+    struct riscv32_user_regs pr_reg;
+    char pad3[4];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct riscv32_elf_prstatus) != 204);
+
+struct riscv32_note {
+    Elf32_Nhdr hdr;
+    char name[8]; /* align_up(sizeof("CORE"), 4) */
+    struct riscv32_elf_prstatus prstatus;
+} QEMU_PACKED;
+
+#define RISCV32_NOTE_HEADER_SIZE offsetof(struct riscv32_note, prstatus)
+#define RISCV32_PRSTATUS_NOTE_SIZE \
+            (RISCV32_NOTE_HEADER_SIZE + sizeof(struct riscv32_elf_prstatus))
+
+static void riscv32_note_init(struct riscv32_note *note, DumpState *s,
+                              const char *name, Elf32_Word namesz,
+                              Elf32_Word type, Elf32_Word descsz)
+{
+    memset(note, 0, sizeof(*note));
+
+    note->hdr.n_namesz = cpu_to_dump32(s, namesz);
+    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
+    note->hdr.n_type = cpu_to_dump32(s, type);
+
+    memcpy(note->name, name, namesz);
+}
+
+int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
+                               int cpuid, void *opaque)
+{
+    struct riscv32_note note;
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    DumpState *s = opaque;
+    int ret, i;
+    const char name[] = "CORE";
+
+    riscv32_note_init(&note, s, name, sizeof(name),
+                      NT_PRSTATUS, sizeof(note.prstatus));
+
+    note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
+
+    note.prstatus.pr_reg.pc = cpu_to_dump32(s, env->pc);
+
+    for (i = 0; i < 31; i++) {
+        note.prstatus.pr_reg.regs[i] = cpu_to_dump32(s, env->gpr[i + 1]);
+    }
+
+    ret = f(&note, RISCV32_PRSTATUS_NOTE_SIZE, s);
+    if (ret < 0) {
+        return -1;
+    }
+
+    return ret;
+}
+
+int cpu_get_dump_info(ArchDumpInfo *info,
+                      const GuestPhysBlockList *guest_phys_blocks)
+{
+    RISCVCPU *cpu;
+    CPURISCVState *env;
+
+    if (first_cpu == NULL) {
+        return -1;
+    }
+    cpu = RISCV_CPU(first_cpu);
+    env = &cpu->env;
+
+    info->d_machine = EM_RISCV;
+
+#if defined(TARGET_RISCV64)
+    info->d_class = ELFCLASS64;
+#else
+    info->d_class = ELFCLASS32;
+#endif
+
+    info->d_endian = (env->mstatus & MSTATUS_UBE) != 0
+                     ? ELFDATA2MSB : ELFDATA2LSB;
+
+    return 0;
+}
+
+ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
+{
+    size_t note_size;
+
+    if (class == ELFCLASS64) {
+        note_size = RISCV64_PRSTATUS_NOTE_SIZE;
+    } else {
+        note_size = RISCV32_PRSTATUS_NOTE_SIZE;
+    }
+
+    return note_size * nr_cpus;
+}
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16f1a34238..ddea8fbeeb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -624,6 +624,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
+    cc->write_elf64_note = riscv_cpu_write_elf64_note;
+    cc->write_elf32_note = riscv_cpu_write_elf32_note;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 14a5c62dac..88ab850682 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -26,6 +26,7 @@ riscv_ss.add(files(
 
 riscv_softmmu_ss = ss.source_set()
 riscv_softmmu_ss.add(files(
+  'arch_dump.c',
   'pmp.c',
   'monitor.c',
   'machine.c'
-- 
2.30.1


