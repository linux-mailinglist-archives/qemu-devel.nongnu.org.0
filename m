Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7BE37C779
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:27:51 +0200 (CEST)
Received: from localhost ([::1]:53964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgriA-0006Sh-P1
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgrf2-0003Q3-Rx
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:24:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgrer-0000Sm-Cu
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620836664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gdgpr1Eml/gbyzPL7J/VNir4Aqh5LXBsLZGkEqerUk=;
 b=cd7L5S9xFbgGgqVy7bPu1i+gcD2gHee/ftyGHdLn6+/IkUM7GciX1QNeSwF2BziPZvvwDN
 OmKTUtscXCDioBNprkTD2R9d0p6dEcQsFjwsrXBeTsMy9c24R101TjIz46JB9Uc0yquVfn
 7wVrEV5V98h5nqV+Ncaw1B3ujHiGntc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-MQxXldTFOFWEtrkaVPGQIg-1; Wed, 12 May 2021 12:24:19 -0400
X-MC-Unique: MQxXldTFOFWEtrkaVPGQIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62297801B12;
 Wed, 12 May 2021 16:24:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BAAC1B058;
 Wed, 12 May 2021 16:24:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 048A81138529; Wed, 12 May 2021 18:24:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] Remove the deprecated moxie target
Date: Wed, 12 May 2021 18:24:09 +0200
Message-Id: <20210512162412.338120-3-armbru@redhat.com>
In-Reply-To: <20210512162412.338120-1-armbru@redhat.com>
References: <20210512162412.338120-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

There are no known users of this CPU anymore, and there are no
binaries available online which could be used for regression tests,
so the code has likely completely bit-rotten already. It's been
marked as deprecated since two releases now and nobody spoke up
that there is still a need to keep it, thus let's remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210430160355.698194-1-thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[Commit message typos fixed, trivial conflicts resolved]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/system/deprecated.rst                |   8 -
 docs/system/removed-features.rst          |   7 +
 default-configs/devices/moxie-softmmu.mak |   5 -
 default-configs/targets/moxie-softmmu.mak |   2 -
 meson.build                               |   1 -
 qapi/machine.json                         |   2 +-
 qapi/misc-target.json                     |   2 +-
 include/disas/dis-asm.h                   |   1 -
 include/elf.h                             |   3 -
 include/exec/poison.h                     |   2 -
 include/hw/elf_ops.h                      |   8 -
 include/sysemu/arch_init.h                |   1 -
 target/moxie/cpu-param.h                  |  17 -
 target/moxie/cpu.h                        | 123 ---
 target/moxie/helper.h                     |   5 -
 target/moxie/machine.h                    |   1 -
 target/moxie/mmu.h                        |  19 -
 disas/moxie.c                             | 360 ---------
 hw/moxie/moxiesim.c                       | 155 ----
 softmmu/arch_init.c                       |   2 -
 target/moxie/cpu.c                        | 161 ----
 target/moxie/helper.c                     | 120 ---
 target/moxie/machine.c                    |  19 -
 target/moxie/mmu.c                        |  32 -
 target/moxie/translate.c                  | 892 ----------------------
 tests/qtest/boot-serial-test.c            |   8 -
 tests/qtest/machine-none-test.c           |   1 -
 fpu/softfloat-specialize.c.inc            |   2 +-
 .gitlab-ci.yml                            |   6 +-
 MAINTAINERS                               |   8 -
 disas/meson.build                         |   1 -
 hw/Kconfig                                |   1 -
 hw/meson.build                            |   1 -
 hw/moxie/Kconfig                          |   3 -
 hw/moxie/meson.build                      |   4 -
 target/meson.build                        |   1 -
 target/moxie/meson.build                  |  14 -
 tests/qtest/meson.build                   |   2 -
 38 files changed, 13 insertions(+), 1987 deletions(-)
 delete mode 100644 default-configs/devices/moxie-softmmu.mak
 delete mode 100644 default-configs/targets/moxie-softmmu.mak
 delete mode 100644 target/moxie/cpu-param.h
 delete mode 100644 target/moxie/cpu.h
 delete mode 100644 target/moxie/helper.h
 delete mode 100644 target/moxie/machine.h
 delete mode 100644 target/moxie/mmu.h
 delete mode 100644 disas/moxie.c
 delete mode 100644 hw/moxie/moxiesim.c
 delete mode 100644 target/moxie/cpu.c
 delete mode 100644 target/moxie/helper.c
 delete mode 100644 target/moxie/machine.c
 delete mode 100644 target/moxie/mmu.c
 delete mode 100644 target/moxie/translate.c
 delete mode 100644 hw/moxie/Kconfig
 delete mode 100644 hw/moxie/meson.build
 delete mode 100644 target/moxie/meson.build

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index f9169077ae..cd91c4528f 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -198,14 +198,6 @@ from Linux upstream kernel, declare it deprecated.
 System emulator CPUS
 --------------------
 
-``moxie`` CPU (since 5.2.0)
-'''''''''''''''''''''''''''
-
-The ``moxie`` guest CPU support is deprecated and will be removed in
-a future version of QEMU. It's unclear whether anybody is still using
-CPU emulation in QEMU, and there are no test images available to make
-sure that the code is still working.
-
 ``lm32`` CPUs (since 5.2.0)
 '''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index c21e6fa5ee..f49737c4ef 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -291,6 +291,13 @@ via the CPU ``mmu`` option when using the ``rv32`` or ``rv64`` CPUs.
 The ``max-cpu-compat`` property of the ``pseries`` machine type should be used
 instead.
 
+``moxie`` CPU (removed in 6.1)
+''''''''''''''''''''''''''''''
+
+Nobody was using this CPU emulation in QEMU, and there were no test images
+available to make sure that the code is still working, so it has been removed
+without replacement.
+
 System emulator machines
 ------------------------
 
diff --git a/default-configs/devices/moxie-softmmu.mak b/default-configs/devices/moxie-softmmu.mak
deleted file mode 100644
index bd50da3c58..0000000000
--- a/default-configs/devices/moxie-softmmu.mak
+++ /dev/null
@@ -1,5 +0,0 @@
-# Default configuration for moxie-softmmu
-
-# Boards:
-#
-CONFIG_MOXIESIM=y
diff --git a/default-configs/targets/moxie-softmmu.mak b/default-configs/targets/moxie-softmmu.mak
deleted file mode 100644
index 183e6b0ebd..0000000000
--- a/default-configs/targets/moxie-softmmu.mak
+++ /dev/null
@@ -1,2 +0,0 @@
-TARGET_ARCH=moxie
-TARGET_WORDS_BIGENDIAN=y
diff --git a/meson.build b/meson.build
index 0b41ff4118..40e8f012ac 100644
--- a/meson.build
+++ b/meson.build
@@ -1214,7 +1214,6 @@ disassemblers = {
   'm68k' : ['CONFIG_M68K_DIS'],
   'microblaze' : ['CONFIG_MICROBLAZE_DIS'],
   'mips' : ['CONFIG_MIPS_DIS'],
-  'moxie' : ['CONFIG_MOXIE_DIS'],
   'nios2' : ['CONFIG_NIOS2_DIS'],
   'or1k' : ['CONFIG_OPENRISC_DIS'],
   'ppc' : ['CONFIG_PPC_DIS'],
diff --git a/qapi/machine.json b/qapi/machine.json
index 6e90d463fc..f1e2ccceba 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -31,7 +31,7 @@
 { 'enum' : 'SysEmuTarget',
   'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'cris', 'hppa', 'i386', 'lm32',
              'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
-             'mips64el', 'mipsel', 'moxie', 'nios2', 'or1k', 'ppc',
+             'mips64el', 'mipsel', 'nios2', 'or1k', 'ppc',
              'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
              'sh4eb', 'sparc', 'sparc64', 'tricore', 'unicore32',
              'x86_64', 'xtensa', 'xtensaeb' ] }
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 0c7491cd82..6200c671be 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -23,7 +23,7 @@
 ##
 { 'event': 'RTC_CHANGE',
   'data': { 'offset': 'int' },
-  'if': 'defined(TARGET_ALPHA) || defined(TARGET_ARM) || defined(TARGET_HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) || defined(TARGET_MIPS64) || defined(TARGET_MOXIE) || defined(TARGET_PPC) || defined(TARGET_PPC64) || defined(TARGET_S390X) || defined(TARGET_SH4) || defined(TARGET_SPARC)' }
+  'if': 'defined(TARGET_ALPHA) || defined(TARGET_ARM) || defined(TARGET_HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) || defined(TARGET_MIPS64) || defined(TARGET_PPC) || defined(TARGET_PPC64) || defined(TARGET_S390X) || defined(TARGET_SH4) || defined(TARGET_SPARC)' }
 
 ##
 # @rtc-reset-reinjection:
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 4701445e80..8e985e7e94 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -443,7 +443,6 @@ int print_insn_m32r             (bfd_vma, disassemble_info*);
 int print_insn_m88k             (bfd_vma, disassemble_info*);
 int print_insn_mn10200          (bfd_vma, disassemble_info*);
 int print_insn_mn10300          (bfd_vma, disassemble_info*);
-int print_insn_moxie            (bfd_vma, disassemble_info*);
 int print_insn_ns32k            (bfd_vma, disassemble_info*);
 int print_insn_big_powerpc      (bfd_vma, disassemble_info*);
 int print_insn_little_powerpc   (bfd_vma, disassemble_info*);
diff --git a/include/elf.h b/include/elf.h
index 78237c9a87..33ed830ec3 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -206,9 +206,6 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_AARCH64  183
 
-#define EM_MOXIE           223     /* Moxie processor family */
-#define EM_MOXIE_OLD       0xFEED
-
 #define EF_AVR_MACH     0x7F       /* Mask for AVR e_flags to get core type */
 
 /* This is the info that is needed to parse the dynamic section of the file */
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 4cd3f8abb4..de972bfd8e 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -20,7 +20,6 @@
 #pragma GCC poison TARGET_ABI_MIPSO32
 #pragma GCC poison TARGET_MIPS64
 #pragma GCC poison TARGET_ABI_MIPSN64
-#pragma GCC poison TARGET_MOXIE
 #pragma GCC poison TARGET_NIOS2
 #pragma GCC poison TARGET_OPENRISC
 #pragma GCC poison TARGET_PPC
@@ -79,7 +78,6 @@
 #pragma GCC poison CONFIG_MICROBLAZE_DIS
 #pragma GCC poison CONFIG_MIPS_DIS
 #pragma GCC poison CONFIG_NANOMIPS_DIS
-#pragma GCC poison CONFIG_MOXIE_DIS
 #pragma GCC poison CONFIG_NIOS2_DIS
 #pragma GCC poison CONFIG_PPC_DIS
 #pragma GCC poison CONFIG_RISCV_DIS
diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 6ee458e7bc..1c37cec4ae 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -368,14 +368,6 @@ static int glue(load_elf, SZ)(const char *name, int fd,
                 }
             }
             break;
-        case EM_MOXIE:
-            if (ehdr.e_machine != EM_MOXIE) {
-                if (ehdr.e_machine != EM_MOXIE_OLD) {
-                    ret = ELF_LOAD_WRONG_ARCH;
-                    goto fail;
-                }
-            }
-            break;
         case EM_MIPS:
         case EM_NANOMIPS:
             if ((ehdr.e_machine != EM_MIPS) &&
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 16da279696..44e3734d18 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -19,7 +19,6 @@ enum {
     QEMU_ARCH_XTENSA = (1 << 12),
     QEMU_ARCH_OPENRISC = (1 << 13),
     QEMU_ARCH_UNICORE32 = (1 << 14),
-    QEMU_ARCH_MOXIE = (1 << 15),
     QEMU_ARCH_TRICORE = (1 << 16),
     QEMU_ARCH_NIOS2 = (1 << 17),
     QEMU_ARCH_HPPA = (1 << 18),
diff --git a/target/moxie/cpu-param.h b/target/moxie/cpu-param.h
deleted file mode 100644
index 9a40ef525c..0000000000
--- a/target/moxie/cpu-param.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * Moxie cpu parameters for qemu.
- *
- * Copyright (c) 2008, 2010, 2013 Anthony Green
- * SPDX-License-Identifier: LGPL-2.1+
- */
-
-#ifndef MOXIE_CPU_PARAM_H
-#define MOXIE_CPU_PARAM_H 1
-
-#define TARGET_LONG_BITS 32
-#define TARGET_PAGE_BITS 12     /* 4k */
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-#define NB_MMU_MODES 1
-
-#endif
diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
deleted file mode 100644
index bd6ab66084..0000000000
--- a/target/moxie/cpu.h
+++ /dev/null
@@ -1,123 +0,0 @@
-/*
- *  Moxie emulation
- *
- *  Copyright (c) 2008, 2010, 2013 Anthony Green
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef MOXIE_CPU_H
-#define MOXIE_CPU_H
-
-#include "exec/cpu-defs.h"
-#include "qom/object.h"
-
-#define MOXIE_EX_DIV0        0
-#define MOXIE_EX_BAD         1
-#define MOXIE_EX_IRQ         2
-#define MOXIE_EX_SWI         3
-#define MOXIE_EX_MMU_MISS    4
-#define MOXIE_EX_BREAK      16
-
-typedef struct CPUMoxieState {
-
-    uint32_t flags;               /* general execution flags */
-    uint32_t gregs[16];           /* general registers */
-    uint32_t sregs[256];          /* special registers */
-    uint32_t pc;                  /* program counter */
-    /* Instead of saving the cc value, we save the cmp arguments
-       and compute cc on demand.  */
-    uint32_t cc_a;                /* reg a for condition code calculation */
-    uint32_t cc_b;                /* reg b for condition code calculation */
-
-    void *irq[8];
-
-    /* Fields up to this point are cleared by a CPU reset */
-    struct {} end_reset_fields;
-} CPUMoxieState;
-
-#include "hw/core/cpu.h"
-
-#define TYPE_MOXIE_CPU "moxie-cpu"
-
-OBJECT_DECLARE_TYPE(MoxieCPU, MoxieCPUClass,
-                    MOXIE_CPU)
-
-/**
- * MoxieCPUClass:
- * @parent_reset: The parent class' reset handler.
- *
- * A Moxie CPU model.
- */
-struct MoxieCPUClass {
-    /*< private >*/
-    CPUClass parent_class;
-    /*< public >*/
-
-    DeviceRealize parent_realize;
-    DeviceReset parent_reset;
-};
-
-/**
- * MoxieCPU:
- * @env: #CPUMoxieState
- *
- * A Moxie CPU.
- */
-struct MoxieCPU {
-    /*< private >*/
-    CPUState parent_obj;
-    /*< public >*/
-
-    CPUNegativeOffsetState neg;
-    CPUMoxieState env;
-};
-
-
-void moxie_cpu_do_interrupt(CPUState *cs);
-void moxie_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr moxie_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void moxie_translate_init(void);
-int cpu_moxie_signal_handler(int host_signum, void *pinfo,
-                             void *puc);
-
-#define MOXIE_CPU_TYPE_SUFFIX "-" TYPE_MOXIE_CPU
-#define MOXIE_CPU_TYPE_NAME(model) model MOXIE_CPU_TYPE_SUFFIX
-#define CPU_RESOLVING_TYPE TYPE_MOXIE_CPU
-
-#define cpu_signal_handler cpu_moxie_signal_handler
-
-static inline int cpu_mmu_index(CPUMoxieState *env, bool ifetch)
-{
-    return 0;
-}
-
-typedef CPUMoxieState CPUArchState;
-typedef MoxieCPU ArchCPU;
-
-#include "exec/cpu-all.h"
-
-static inline void cpu_get_tb_cpu_state(CPUMoxieState *env, target_ulong *pc,
-                                        target_ulong *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *flags = 0;
-}
-
-bool moxie_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr);
-
-#endif /* MOXIE_CPU_H */
diff --git a/target/moxie/helper.h b/target/moxie/helper.h
deleted file mode 100644
index d94ef7a17e..0000000000
--- a/target/moxie/helper.h
+++ /dev/null
@@ -1,5 +0,0 @@
-DEF_HELPER_2(raise_exception, void, env, int)
-DEF_HELPER_1(debug, void, env)
-
-DEF_HELPER_FLAGS_3(div, TCG_CALL_NO_WG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(udiv, TCG_CALL_NO_WG, i32, env, i32, i32)
diff --git a/target/moxie/machine.h b/target/moxie/machine.h
deleted file mode 100644
index a1b72907ae..0000000000
--- a/target/moxie/machine.h
+++ /dev/null
@@ -1 +0,0 @@
-extern const VMStateDescription vmstate_moxie_cpu;
diff --git a/target/moxie/mmu.h b/target/moxie/mmu.h
deleted file mode 100644
index d80690f4d2..0000000000
--- a/target/moxie/mmu.h
+++ /dev/null
@@ -1,19 +0,0 @@
-#ifndef TARGET_MOXIE_MMU_H
-#define TARGET_MOXIE_MMU_H
-
-#define MOXIE_MMU_ERR_EXEC  0
-#define MOXIE_MMU_ERR_READ  1
-#define MOXIE_MMU_ERR_WRITE 2
-#define MOXIE_MMU_ERR_FLUSH 3
-
-typedef struct {
-    uint32_t phy;
-    uint32_t pfn;
-    int cause_op;
-} MoxieMMUResult;
-
-int moxie_mmu_translate(MoxieMMUResult *res,
-                        CPUMoxieState *env, uint32_t vaddr,
-                        int rw, int mmu_idx);
-
-#endif
diff --git a/disas/moxie.c b/disas/moxie.c
deleted file mode 100644
index e94ab4c33d..0000000000
--- a/disas/moxie.c
+++ /dev/null
@@ -1,360 +0,0 @@
-/* Disassemble moxie instructions.
-   Copyright (c) 2009  Free Software Foundation, Inc.
-
-   This program is free software; you can redistribute it and/or modify
-   it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 2 of the License, or
-   (at your option) any later version.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, see <http://www.gnu.org/licenses/>. */
-
-#include "qemu/osdep.h"
-#define STATIC_TABLE
-#define DEFINE_TABLE
-
-#include "disas/dis-asm.h"
-
-static void *stream;
-
-/* Form 1 instructions come in different flavors:
-
-   Some have no arguments                          (MOXIE_F1_NARG)
-   Some only use the A operand                     (MOXIE_F1_A)
-   Some use A and B registers                      (MOXIE_F1_AB)
-   Some use A and consume a 4 byte immediate value (MOXIE_F1_A4)
-   Some use just a 4 byte immediate value          (MOXIE_F1_4)
-   Some use just a 4 byte memory address           (MOXIE_F1_M)
-   Some use B and an indirect A                    (MOXIE_F1_AiB)
-   Some use A and an indirect B                    (MOXIE_F1_ABi)
-   Some consume a 4 byte immediate value and use X (MOXIE_F1_4A)
-   Some use B and an indirect A plus 4 bytes       (MOXIE_F1_AiB4)
-   Some use A and an indirect B plus 4 bytes       (MOXIE_F1_ABi4)
-
-   Form 2 instructions also come in different flavors:
-
-   Some have no arguments                          (MOXIE_F2_NARG)
-   Some use the A register and an 8-bit value      (MOXIE_F2_A8V)
-
-   Form 3 instructions also come in different flavors:
-
-   Some have no arguments                          (MOXIE_F3_NARG)
-   Some have a 10-bit PC relative operand          (MOXIE_F3_PCREL).  */
-
-#define MOXIE_F1_NARG 0x100
-#define MOXIE_F1_A    0x101
-#define MOXIE_F1_AB   0x102
-/* #define MOXIE_F1_ABC  0x103 */
-#define MOXIE_F1_A4   0x104
-#define MOXIE_F1_4    0x105
-#define MOXIE_F1_AiB  0x106
-#define MOXIE_F1_ABi  0x107
-#define MOXIE_F1_4A   0x108
-#define MOXIE_F1_AiB4 0x109
-#define MOXIE_F1_ABi4 0x10a
-#define MOXIE_F1_M    0x10b
-
-#define MOXIE_F2_NARG 0x200
-#define MOXIE_F2_A8V  0x201
-
-#define MOXIE_F3_NARG  0x300
-#define MOXIE_F3_PCREL 0x301
-
-typedef struct moxie_opc_info_t {
-    short         opcode;
-    unsigned      itype;
-    const char *  name;
-} moxie_opc_info_t;
-
-extern const moxie_opc_info_t moxie_form1_opc_info[64];
-extern const moxie_opc_info_t moxie_form2_opc_info[4];
-extern const moxie_opc_info_t moxie_form3_opc_info[16];
-
-/* The moxie processor's 16-bit instructions come in two forms:
-
-   FORM 1 instructions start with a 0 bit...
-
-   0oooooooaaaabbbb
-   0              F
-
-   ooooooo - form 1 opcode number
-   aaaa    - operand A
-   bbbb    - operand B
-
-   FORM 2 instructions start with bits "10"...
-
-   10ooaaaavvvvvvvv
-   0              F
-
-   oo       - form 2 opcode number
-   aaaa     - operand A
-   vvvvvvvv - 8-bit immediate value
-
-   FORM 3 instructions start with a bits "11"...
-
-   11oooovvvvvvvvvv
-   0              F
-
-   oooo         - form 3 opcode number
-   vvvvvvvvvv   - 10-bit immediate value.  */
-
-const moxie_opc_info_t moxie_form1_opc_info[64] =
-    {
-        { 0x00, MOXIE_F1_NARG, "nop" },
-        { 0x01, MOXIE_F1_A4,   "ldi.l" },
-        { 0x02, MOXIE_F1_AB,   "mov" },
-        { 0x03, MOXIE_F1_M,    "jsra" },
-        { 0x04, MOXIE_F1_NARG, "ret" },
-        { 0x05, MOXIE_F1_AB,   "add.l" },
-        { 0x06, MOXIE_F1_AB,   "push" },
-        { 0x07, MOXIE_F1_AB,   "pop" },
-        { 0x08, MOXIE_F1_A4,   "lda.l" },
-        { 0x09, MOXIE_F1_4A,   "sta.l" },
-        { 0x0a, MOXIE_F1_ABi,  "ld.l" },
-        { 0x0b, MOXIE_F1_AiB,  "st.l" },
-        { 0x0c, MOXIE_F1_ABi4, "ldo.l" },
-        { 0x0d, MOXIE_F1_AiB4, "sto.l" },
-        { 0x0e, MOXIE_F1_AB,   "cmp" },
-        { 0x0f, MOXIE_F1_NARG, "bad" },
-        { 0x10, MOXIE_F1_NARG, "bad" },
-        { 0x11, MOXIE_F1_NARG, "bad" },
-        { 0x12, MOXIE_F1_NARG, "bad" },
-        { 0x13, MOXIE_F1_NARG, "bad" },
-        { 0x14, MOXIE_F1_NARG, "bad" },
-        { 0x15, MOXIE_F1_NARG, "bad" },
-        { 0x16, MOXIE_F1_NARG, "bad" },
-        { 0x17, MOXIE_F1_NARG, "bad" },
-        { 0x18, MOXIE_F1_NARG, "bad" },
-        { 0x19, MOXIE_F1_A,    "jsr" },
-        { 0x1a, MOXIE_F1_M,    "jmpa" },
-        { 0x1b, MOXIE_F1_A4,   "ldi.b" },
-        { 0x1c, MOXIE_F1_ABi,  "ld.b" },
-        { 0x1d, MOXIE_F1_A4,   "lda.b" },
-        { 0x1e, MOXIE_F1_AiB,  "st.b" },
-        { 0x1f, MOXIE_F1_4A,   "sta.b" },
-        { 0x20, MOXIE_F1_A4,   "ldi.s" },
-        { 0x21, MOXIE_F1_ABi,  "ld.s" },
-        { 0x22, MOXIE_F1_A4,   "lda.s" },
-        { 0x23, MOXIE_F1_AiB,  "st.s" },
-        { 0x24, MOXIE_F1_4A,   "sta.s" },
-        { 0x25, MOXIE_F1_A,    "jmp" },
-        { 0x26, MOXIE_F1_AB,   "and" },
-        { 0x27, MOXIE_F1_AB,   "lshr" },
-        { 0x28, MOXIE_F1_AB,   "ashl" },
-        { 0x29, MOXIE_F1_AB,   "sub.l" },
-        { 0x2a, MOXIE_F1_AB,   "neg" },
-        { 0x2b, MOXIE_F1_AB,   "or" },
-        { 0x2c, MOXIE_F1_AB,   "not" },
-        { 0x2d, MOXIE_F1_AB,   "ashr" },
-        { 0x2e, MOXIE_F1_AB,   "xor" },
-        { 0x2f, MOXIE_F1_AB,   "mul.l" },
-        { 0x30, MOXIE_F1_4,    "swi" },
-        { 0x31, MOXIE_F1_AB,   "div.l" },
-        { 0x32, MOXIE_F1_AB,   "udiv.l" },
-        { 0x33, MOXIE_F1_AB,   "mod.l" },
-        { 0x34, MOXIE_F1_AB,   "umod.l" },
-        { 0x35, MOXIE_F1_NARG, "brk" },
-        { 0x36, MOXIE_F1_ABi4, "ldo.b" },
-        { 0x37, MOXIE_F1_AiB4, "sto.b" },
-        { 0x38, MOXIE_F1_ABi4, "ldo.s" },
-        { 0x39, MOXIE_F1_AiB4, "sto.s" },
-        { 0x3a, MOXIE_F1_NARG, "bad" },
-        { 0x3b, MOXIE_F1_NARG, "bad" },
-        { 0x3c, MOXIE_F1_NARG, "bad" },
-        { 0x3d, MOXIE_F1_NARG, "bad" },
-        { 0x3e, MOXIE_F1_NARG, "bad" },
-        { 0x3f, MOXIE_F1_NARG, "bad" }
-    };
-
-const moxie_opc_info_t moxie_form2_opc_info[4] =
-    {
-        { 0x00, MOXIE_F2_A8V,  "inc" },
-        { 0x01, MOXIE_F2_A8V,  "dec" },
-        { 0x02, MOXIE_F2_A8V,  "gsr" },
-        { 0x03, MOXIE_F2_A8V,  "ssr" }
-    };
-
-const moxie_opc_info_t moxie_form3_opc_info[16] =
-    {
-        { 0x00, MOXIE_F3_PCREL,"beq" },
-        { 0x01, MOXIE_F3_PCREL,"bne" },
-        { 0x02, MOXIE_F3_PCREL,"blt" },
-        { 0x03, MOXIE_F3_PCREL,"bgt" },
-        { 0x04, MOXIE_F3_PCREL,"bltu" },
-        { 0x05, MOXIE_F3_PCREL,"bgtu" },
-        { 0x06, MOXIE_F3_PCREL,"bge" },
-        { 0x07, MOXIE_F3_PCREL,"ble" },
-        { 0x08, MOXIE_F3_PCREL,"bgeu" },
-        { 0x09, MOXIE_F3_PCREL,"bleu" },
-        { 0x0a, MOXIE_F3_NARG, "bad" },
-        { 0x0b, MOXIE_F3_NARG, "bad" },
-        { 0x0c, MOXIE_F3_NARG, "bad" },
-        { 0x0d, MOXIE_F3_NARG, "bad" },
-        { 0x0e, MOXIE_F3_NARG, "bad" },
-        { 0x0f, MOXIE_F3_NARG, "bad" }
-    };
-
-/* Macros to extract operands from the instruction word.  */
-#define OP_A(i) ((i >> 4) & 0xf)
-#define OP_B(i) (i & 0xf)
-#define INST2OFFSET(o) ((((signed short)((o & ((1<<10)-1))<<6))>>6)<<1)
-
-static const char * reg_names[16] =
-    { "$fp", "$sp", "$r0", "$r1", "$r2", "$r3", "$r4", "$r5",
-      "$r6", "$r7", "$r8", "$r9", "$r10", "$r11", "$r12", "$r13" };
-
-int
-print_insn_moxie(bfd_vma addr, struct disassemble_info * info)
-{
-    int length = 2;
-    int status;
-    stream = info->stream;
-    const moxie_opc_info_t * opcode;
-    bfd_byte buffer[4];
-    unsigned short iword;
-    fprintf_function fpr = info->fprintf_func;
-
-    if ((status = info->read_memory_func(addr, buffer, 2, info)))
-        goto fail;
-    iword = (bfd_getb16(buffer) >> 16);
-
-    /* Form 1 instructions have the high bit set to 0.  */
-    if ((iword & (1<<15)) == 0) {
-        /* Extract the Form 1 opcode.  */
-        opcode = &moxie_form1_opc_info[iword >> 8];
-        switch (opcode->itype) {
-        case MOXIE_F1_NARG:
-            fpr(stream, "%s", opcode->name);
-            break;
-        case MOXIE_F1_A:
-            fpr(stream, "%s\t%s", opcode->name,
-                reg_names[OP_A(iword)]);
-            break;
-        case MOXIE_F1_AB:
-            fpr(stream, "%s\t%s, %s", opcode->name,
-                reg_names[OP_A(iword)],
-                reg_names[OP_B(iword)]);
-            break;
-        case MOXIE_F1_A4:
-            {
-                unsigned imm;
-                if ((status = info->read_memory_func(addr + 2, buffer, 4, info)))
-                    goto fail;
-                imm = bfd_getb32(buffer);
-                fpr(stream, "%s\t%s, 0x%x", opcode->name,
-                    reg_names[OP_A(iword)], imm);
-                length = 6;
-            }
-            break;
-        case MOXIE_F1_4:
-            {
-                unsigned imm;
-                if ((status = info->read_memory_func(addr + 2, buffer, 4, info)))
-                    goto fail;
-                imm = bfd_getb32(buffer);
-                fpr(stream, "%s\t0x%x", opcode->name, imm);
-                length = 6;
-            }
-            break;
-        case MOXIE_F1_M:
-            {
-                unsigned imm;
-                if ((status = info->read_memory_func(addr + 2, buffer, 4, info)))
-                    goto fail;
-                imm = bfd_getb32(buffer);
-                fpr(stream, "%s\t", opcode->name);
-                info->print_address_func((bfd_vma) imm, info);
-                length = 6;
-            }
-            break;
-        case MOXIE_F1_AiB:
-            fpr (stream, "%s\t(%s), %s", opcode->name,
-                 reg_names[OP_A(iword)], reg_names[OP_B(iword)]);
-            break;
-        case MOXIE_F1_ABi:
-            fpr(stream, "%s\t%s, (%s)", opcode->name,
-                reg_names[OP_A(iword)], reg_names[OP_B(iword)]);
-            break;
-        case MOXIE_F1_4A:
-            {
-                unsigned imm;
-                if ((status = info->read_memory_func(addr + 2, buffer, 4, info)))
-                    goto fail;
-                imm = bfd_getb32(buffer);
-                fpr(stream, "%s\t0x%x, %s",
-                    opcode->name, imm, reg_names[OP_A(iword)]);
-                length = 6;
-            }
-            break;
-        case MOXIE_F1_AiB4:
-            {
-                unsigned imm;
-                if ((status = info->read_memory_func(addr+2, buffer, 4, info)))
-                    goto fail;
-                imm = bfd_getb32(buffer);
-                fpr(stream, "%s\t0x%x(%s), %s", opcode->name,
-                    imm,
-                    reg_names[OP_A(iword)],
-                    reg_names[OP_B(iword)]);
-                length = 6;
-            }
-            break;
-        case MOXIE_F1_ABi4:
-            {
-                unsigned imm;
-                if ((status = info->read_memory_func(addr+2, buffer, 4, info)))
-                    goto fail;
-                imm = bfd_getb32(buffer);
-                fpr(stream, "%s\t%s, 0x%x(%s)",
-                    opcode->name,
-                    reg_names[OP_A(iword)],
-                    imm,
-                    reg_names[OP_B(iword)]);
-                length = 6;
-            }
-            break;
-        default:
-            abort();
-        }
-    }
-    else if ((iword & (1<<14)) == 0) {
-        /* Extract the Form 2 opcode.  */
-        opcode = &moxie_form2_opc_info[(iword >> 12) & 3];
-        switch (opcode->itype) {
-        case MOXIE_F2_A8V:
-            fpr(stream, "%s\t%s, 0x%x",
-                opcode->name,
-                reg_names[(iword >> 8) & 0xf],
-                iword & ((1 << 8) - 1));
-            break;
-        case MOXIE_F2_NARG:
-            fpr(stream, "%s", opcode->name);
-            break;
-        default:
-            abort();
-        }
-    } else {
-        /* Extract the Form 3 opcode.  */
-        opcode = &moxie_form3_opc_info[(iword >> 10) & 15];
-        switch (opcode->itype) {
-        case MOXIE_F3_PCREL:
-            fpr(stream, "%s\t", opcode->name);
-            info->print_address_func((bfd_vma) (addr + INST2OFFSET(iword) + 2),
-                                     info);
-            break;
-        default:
-            abort();
-        }
-    }
-
-    return length;
-
- fail:
-    info->memory_error_func(status, addr, info);
-    return -1;
-}
diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
deleted file mode 100644
index 3d255d4879..0000000000
--- a/hw/moxie/moxiesim.c
+++ /dev/null
@@ -1,155 +0,0 @@
-/*
- * QEMU/moxiesim emulation
- *
- * Emulates a very simple machine model similar to the one used by the
- * GDB moxie simulator.
- *
- * Copyright (c) 2008, 2009, 2010, 2013 Anthony Green
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-#include "qemu/osdep.h"
-#include "qemu/error-report.h"
-#include "qapi/error.h"
-#include "cpu.h"
-#include "net/net.h"
-#include "sysemu/reset.h"
-#include "sysemu/sysemu.h"
-#include "hw/boards.h"
-#include "hw/loader.h"
-#include "hw/char/serial.h"
-#include "elf.h"
-
-#define PHYS_MEM_BASE 0x80000000
-#define FIRMWARE_BASE 0x1000
-#define FIRMWARE_SIZE (128 * 0x1000)
-
-typedef struct {
-    uint64_t ram_size;
-    const char *kernel_filename;
-    const char *kernel_cmdline;
-    const char *initrd_filename;
-} LoaderParams;
-
-static void load_kernel(MoxieCPU *cpu, LoaderParams *loader_params)
-{
-    uint64_t entry, kernel_high;
-    int64_t initrd_size;
-    long kernel_size;
-    ram_addr_t initrd_offset;
-
-    kernel_size = load_elf(loader_params->kernel_filename,  NULL, NULL, NULL,
-                           &entry, NULL, &kernel_high, NULL, 1, EM_MOXIE,
-                           0, 0);
-
-    if (kernel_size <= 0) {
-        error_report("could not load kernel '%s'",
-                     loader_params->kernel_filename);
-        exit(1);
-    }
-
-    /* load initrd */
-    initrd_size = 0;
-    initrd_offset = 0;
-    if (loader_params->initrd_filename) {
-        initrd_size = get_image_size(loader_params->initrd_filename);
-        if (initrd_size > 0) {
-            initrd_offset = (kernel_high + ~TARGET_PAGE_MASK)
-              & TARGET_PAGE_MASK;
-            if (initrd_offset + initrd_size > loader_params->ram_size) {
-                error_report("memory too small for initial ram disk '%s'",
-                             loader_params->initrd_filename);
-                exit(1);
-            }
-            initrd_size = load_image_targphys(loader_params->initrd_filename,
-                                              initrd_offset,
-                                              loader_params->ram_size);
-        }
-        if (initrd_size == (target_ulong)-1) {
-            error_report("could not load initial ram disk '%s'",
-                         loader_params->initrd_filename);
-            exit(1);
-        }
-    }
-}
-
-static void main_cpu_reset(void *opaque)
-{
-    MoxieCPU *cpu = opaque;
-
-    cpu_reset(CPU(cpu));
-}
-
-static void moxiesim_init(MachineState *machine)
-{
-    MoxieCPU *cpu = NULL;
-    ram_addr_t ram_size = machine->ram_size;
-    const char *kernel_filename = machine->kernel_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
-    const char *initrd_filename = machine->initrd_filename;
-    CPUMoxieState *env;
-    MemoryRegion *address_space_mem = get_system_memory();
-    MemoryRegion *ram = g_new(MemoryRegion, 1);
-    MemoryRegion *rom = g_new(MemoryRegion, 1);
-    hwaddr ram_base = 0x200000;
-    LoaderParams loader_params;
-
-    /* Init CPUs. */
-    cpu = MOXIE_CPU(cpu_create(machine->cpu_type));
-    env = &cpu->env;
-
-    qemu_register_reset(main_cpu_reset, cpu);
-
-    /* Allocate RAM. */
-    memory_region_init_ram(ram, NULL, "moxiesim.ram", ram_size, &error_fatal);
-    memory_region_add_subregion(address_space_mem, ram_base, ram);
-
-    memory_region_init_ram(rom, NULL, "moxie.rom", FIRMWARE_SIZE, &error_fatal);
-    memory_region_add_subregion(get_system_memory(), FIRMWARE_BASE, rom);
-
-    if (kernel_filename) {
-        loader_params.ram_size = ram_size;
-        loader_params.kernel_filename = kernel_filename;
-        loader_params.kernel_cmdline = kernel_cmdline;
-        loader_params.initrd_filename = initrd_filename;
-        load_kernel(cpu, &loader_params);
-    }
-    if (machine->firmware) {
-        if (load_image_targphys(machine->firmware, FIRMWARE_BASE, FIRMWARE_SIZE) < 0) {
-            error_report("Failed to load firmware '%s'", machine->firmware);
-        }
-    }
-
-    /* A single 16450 sits at offset 0x3f8.  */
-    if (serial_hd(0)) {
-        serial_mm_init(address_space_mem, 0x3f8, 0, env->irq[4],
-                       8000000/16, serial_hd(0), DEVICE_LITTLE_ENDIAN);
-    }
-}
-
-static void moxiesim_machine_init(MachineClass *mc)
-{
-    mc->desc = "Moxie simulator platform";
-    mc->init = moxiesim_init;
-    mc->is_default = true;
-    mc->default_cpu_type = MOXIE_CPU_TYPE_NAME("MoxieLite");
-}
-
-DEFINE_MACHINE("moxiesim", moxiesim_machine_init)
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index f09bab830c..afb0904020 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -64,8 +64,6 @@ int graphic_depth = 32;
 #define QEMU_ARCH QEMU_ARCH_MICROBLAZE
 #elif defined(TARGET_MIPS)
 #define QEMU_ARCH QEMU_ARCH_MIPS
-#elif defined(TARGET_MOXIE)
-#define QEMU_ARCH QEMU_ARCH_MOXIE
 #elif defined(TARGET_NIOS2)
 #define QEMU_ARCH QEMU_ARCH_NIOS2
 #elif defined(TARGET_OPENRISC)
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
deleted file mode 100644
index 83bec34d36..0000000000
--- a/target/moxie/cpu.c
+++ /dev/null
@@ -1,161 +0,0 @@
-/*
- * QEMU Moxie CPU
- *
- * Copyright (c) 2013 Anthony Green
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "cpu.h"
-#include "migration/vmstate.h"
-#include "machine.h"
-
-static void moxie_cpu_set_pc(CPUState *cs, vaddr value)
-{
-    MoxieCPU *cpu = MOXIE_CPU(cs);
-
-    cpu->env.pc = value;
-}
-
-static bool moxie_cpu_has_work(CPUState *cs)
-{
-    return cs->interrupt_request & CPU_INTERRUPT_HARD;
-}
-
-static void moxie_cpu_reset(DeviceState *dev)
-{
-    CPUState *s = CPU(dev);
-    MoxieCPU *cpu = MOXIE_CPU(s);
-    MoxieCPUClass *mcc = MOXIE_CPU_GET_CLASS(cpu);
-    CPUMoxieState *env = &cpu->env;
-
-    mcc->parent_reset(dev);
-
-    memset(env, 0, offsetof(CPUMoxieState, end_reset_fields));
-    env->pc = 0x1000;
-}
-
-static void moxie_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
-{
-    info->mach = bfd_arch_moxie;
-    info->print_insn = print_insn_moxie;
-}
-
-static void moxie_cpu_realizefn(DeviceState *dev, Error **errp)
-{
-    CPUState *cs = CPU(dev);
-    MoxieCPUClass *mcc = MOXIE_CPU_GET_CLASS(dev);
-    Error *local_err = NULL;
-
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
-    mcc->parent_realize(dev, errp);
-}
-
-static void moxie_cpu_initfn(Object *obj)
-{
-    MoxieCPU *cpu = MOXIE_CPU(obj);
-
-    cpu_set_cpustate_pointers(cpu);
-}
-
-static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = g_strdup_printf(MOXIE_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_MOXIE_CPU) ||
-                       object_class_is_abstract(oc))) {
-        return NULL;
-    }
-    return oc;
-}
-
-#include "hw/core/tcg-cpu-ops.h"
-
-static struct TCGCPUOps moxie_tcg_ops = {
-    .initialize = moxie_translate_init,
-    .tlb_fill = moxie_cpu_tlb_fill,
-
-#ifndef CONFIG_USER_ONLY
-    .do_interrupt = moxie_cpu_do_interrupt,
-#endif /* !CONFIG_USER_ONLY */
-};
-
-static void moxie_cpu_class_init(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
-    MoxieCPUClass *mcc = MOXIE_CPU_CLASS(oc);
-
-    device_class_set_parent_realize(dc, moxie_cpu_realizefn,
-                                    &mcc->parent_realize);
-    device_class_set_parent_reset(dc, moxie_cpu_reset, &mcc->parent_reset);
-
-    cc->class_by_name = moxie_cpu_class_by_name;
-
-    cc->has_work = moxie_cpu_has_work;
-    cc->dump_state = moxie_cpu_dump_state;
-    cc->set_pc = moxie_cpu_set_pc;
-#ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = moxie_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_moxie_cpu;
-#endif
-    cc->disas_set_info = moxie_cpu_disas_set_info;
-    cc->tcg_ops = &moxie_tcg_ops;
-}
-
-static void moxielite_initfn(Object *obj)
-{
-    /* Set cpu feature flags */
-}
-
-static void moxie_any_initfn(Object *obj)
-{
-    /* Set cpu feature flags */
-}
-
-#define DEFINE_MOXIE_CPU_TYPE(cpu_model, initfn) \
-    {                                            \
-        .parent = TYPE_MOXIE_CPU,                \
-        .instance_init = initfn,                 \
-        .name = MOXIE_CPU_TYPE_NAME(cpu_model),  \
-    }
-
-static const TypeInfo moxie_cpus_type_infos[] = {
-    { /* base class should be registered first */
-        .name = TYPE_MOXIE_CPU,
-        .parent = TYPE_CPU,
-        .instance_size = sizeof(MoxieCPU),
-        .instance_init = moxie_cpu_initfn,
-        .class_size = sizeof(MoxieCPUClass),
-        .class_init = moxie_cpu_class_init,
-    },
-    DEFINE_MOXIE_CPU_TYPE("MoxieLite", moxielite_initfn),
-    DEFINE_MOXIE_CPU_TYPE("any", moxie_any_initfn),
-};
-
-DEFINE_TYPES(moxie_cpus_type_infos)
diff --git a/target/moxie/helper.c b/target/moxie/helper.c
deleted file mode 100644
index b1919f62b3..0000000000
--- a/target/moxie/helper.c
+++ /dev/null
@@ -1,120 +0,0 @@
-/*
- *  Moxie helper routines.
- *
- *  Copyright (c) 2008, 2009, 2010, 2013 Anthony Green
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-
-#include "cpu.h"
-#include "mmu.h"
-#include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
-#include "qemu/host-utils.h"
-#include "exec/helper-proto.h"
-
-void helper_raise_exception(CPUMoxieState *env, int ex)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = ex;
-    /* Stash the exception type.  */
-    env->sregs[2] = ex;
-    /* Stash the address where the exception occurred.  */
-    cpu_restore_state(cs, GETPC(), true);
-    env->sregs[5] = env->pc;
-    /* Jump to the exception handline routine.  */
-    env->pc = env->sregs[1];
-    cpu_loop_exit(cs);
-}
-
-uint32_t helper_div(CPUMoxieState *env, uint32_t a, uint32_t b)
-{
-    if (unlikely(b == 0)) {
-        helper_raise_exception(env, MOXIE_EX_DIV0);
-        return 0;
-    }
-    if (unlikely(a == INT_MIN && b == -1)) {
-        return INT_MIN;
-    }
-
-    return (int32_t)a / (int32_t)b;
-}
-
-uint32_t helper_udiv(CPUMoxieState *env, uint32_t a, uint32_t b)
-{
-    if (unlikely(b == 0)) {
-        helper_raise_exception(env, MOXIE_EX_DIV0);
-        return 0;
-    }
-    return a / b;
-}
-
-void helper_debug(CPUMoxieState *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
-}
-
-bool moxie_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr)
-{
-    MoxieCPU *cpu = MOXIE_CPU(cs);
-    CPUMoxieState *env = &cpu->env;
-    MoxieMMUResult res;
-    int prot, miss;
-
-    address &= TARGET_PAGE_MASK;
-    prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-    miss = moxie_mmu_translate(&res, env, address, access_type, mmu_idx);
-    if (likely(!miss)) {
-        tlb_set_page(cs, address, res.phy, prot, mmu_idx, TARGET_PAGE_SIZE);
-        return true;
-    }
-    if (probe) {
-        return false;
-    }
-
-    cs->exception_index = MOXIE_EX_MMU_MISS;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-void moxie_cpu_do_interrupt(CPUState *cs)
-{
-    switch (cs->exception_index) {
-    case MOXIE_EX_BREAK:
-        break;
-    default:
-        break;
-    }
-}
-
-hwaddr moxie_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
-{
-    MoxieCPU *cpu = MOXIE_CPU(cs);
-    uint32_t phy = addr;
-    MoxieMMUResult res;
-    int miss;
-
-    miss = moxie_mmu_translate(&res, &cpu->env, addr, 0, 0);
-    if (!miss) {
-        phy = res.phy;
-    }
-    return phy;
-}
diff --git a/target/moxie/machine.c b/target/moxie/machine.c
deleted file mode 100644
index d0f177048c..0000000000
--- a/target/moxie/machine.c
+++ /dev/null
@@ -1,19 +0,0 @@
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "machine.h"
-#include "migration/cpu.h"
-
-const VMStateDescription vmstate_moxie_cpu = {
-    .name = "cpu",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32(flags, CPUMoxieState),
-        VMSTATE_UINT32_ARRAY(gregs, CPUMoxieState, 16),
-        VMSTATE_UINT32_ARRAY(sregs, CPUMoxieState, 256),
-        VMSTATE_UINT32(pc, CPUMoxieState),
-        VMSTATE_UINT32(cc_a, CPUMoxieState),
-        VMSTATE_UINT32(cc_b, CPUMoxieState),
-        VMSTATE_END_OF_LIST()
-    }
-};
diff --git a/target/moxie/mmu.c b/target/moxie/mmu.c
deleted file mode 100644
index 87783a36f8..0000000000
--- a/target/moxie/mmu.c
+++ /dev/null
@@ -1,32 +0,0 @@
-/*
- *  Moxie mmu emulation.
- *
- *  Copyright (c) 2008, 2013 Anthony Green
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-
-#include "cpu.h"
-#include "mmu.h"
-
-int moxie_mmu_translate(MoxieMMUResult *res,
-                       CPUMoxieState *env, uint32_t vaddr,
-                       int rw, int mmu_idx)
-{
-    /* Perform no translation yet.  */
-    res->phy = vaddr;
-    return 0;
-}
diff --git a/target/moxie/translate.c b/target/moxie/translate.c
deleted file mode 100644
index 24a742b25e..0000000000
--- a/target/moxie/translate.c
+++ /dev/null
@@ -1,892 +0,0 @@
-/*
- *  Moxie emulation for qemu: main translation routines.
- *
- *  Copyright (c) 2009, 2013 Anthony Green
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public License
- * as published by the Free Software Foundation; either version 2.1 of
- * the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-/* For information on the Moxie architecture, see
- *    http://moxielogic.org/wiki
- */
-
-#include "qemu/osdep.h"
-
-#include "cpu.h"
-#include "exec/exec-all.h"
-#include "disas/disas.h"
-#include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
-#include "qemu/qemu-print.h"
-
-#include "exec/helper-proto.h"
-#include "exec/helper-gen.h"
-#include "exec/log.h"
-
-/* This is the state at translation time.  */
-typedef struct DisasContext {
-    TranslationBlock *tb;
-    target_ulong pc, saved_pc;
-    uint32_t opcode;
-    uint32_t fp_status;
-    /* Routine used to access memory */
-    int memidx;
-    int bstate;
-    target_ulong btarget;
-    int singlestep_enabled;
-} DisasContext;
-
-enum {
-    BS_NONE     = 0, /* We go out of the TB without reaching a branch or an
-                      * exception condition */
-    BS_STOP     = 1, /* We want to stop translation for any reason */
-    BS_BRANCH   = 2, /* We reached a branch condition     */
-    BS_EXCP     = 3, /* We reached an exception condition */
-};
-
-static TCGv cpu_pc;
-static TCGv cpu_gregs[16];
-static TCGv cc_a, cc_b;
-
-#include "exec/gen-icount.h"
-
-#define REG(x) (cpu_gregs[x])
-
-/* Extract the signed 10-bit offset from a 16-bit branch
-   instruction.  */
-static int extract_branch_offset(int opcode)
-{
-  return (((signed short)((opcode & ((1 << 10) - 1)) << 6)) >> 6) << 1;
-}
-
-void moxie_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    MoxieCPU *cpu = MOXIE_CPU(cs);
-    CPUMoxieState *env = &cpu->env;
-    int i;
-    qemu_fprintf(f, "pc=0x%08x\n", env->pc);
-    qemu_fprintf(f, "$fp=0x%08x $sp=0x%08x $r0=0x%08x $r1=0x%08x\n",
-                 env->gregs[0], env->gregs[1], env->gregs[2], env->gregs[3]);
-    for (i = 4; i < 16; i += 4) {
-        qemu_fprintf(f, "$r%d=0x%08x $r%d=0x%08x $r%d=0x%08x $r%d=0x%08x\n",
-                     i - 2, env->gregs[i], i - 1, env->gregs[i + 1],
-                     i, env->gregs[i + 2], i + 1, env->gregs[i + 3]);
-    }
-    for (i = 4; i < 16; i += 4) {
-        qemu_fprintf(f, "sr%d=0x%08x sr%d=0x%08x sr%d=0x%08x sr%d=0x%08x\n",
-                     i - 2, env->sregs[i], i - 1, env->sregs[i + 1],
-                     i, env->sregs[i + 2], i + 1, env->sregs[i + 3]);
-    }
-}
-
-void moxie_translate_init(void)
-{
-    int i;
-    static const char * const gregnames[16] = {
-        "$fp", "$sp", "$r0", "$r1",
-        "$r2", "$r3", "$r4", "$r5",
-        "$r6", "$r7", "$r8", "$r9",
-        "$r10", "$r11", "$r12", "$r13"
-    };
-
-    cpu_pc = tcg_global_mem_new_i32(cpu_env,
-                                    offsetof(CPUMoxieState, pc), "$pc");
-    for (i = 0; i < 16; i++)
-        cpu_gregs[i] = tcg_global_mem_new_i32(cpu_env,
-                                              offsetof(CPUMoxieState, gregs[i]),
-                                              gregnames[i]);
-
-    cc_a = tcg_global_mem_new_i32(cpu_env,
-                                  offsetof(CPUMoxieState, cc_a), "cc_a");
-    cc_b = tcg_global_mem_new_i32(cpu_env,
-                                  offsetof(CPUMoxieState, cc_b), "cc_b");
-}
-
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
-{
-    if (unlikely(ctx->singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
-static inline void gen_goto_tb(CPUMoxieState *env, DisasContext *ctx,
-                               int n, target_ulong dest)
-{
-    if (use_goto_tb(ctx, dest)) {
-        tcg_gen_goto_tb(n);
-        tcg_gen_movi_i32(cpu_pc, dest);
-        tcg_gen_exit_tb(ctx->tb, n);
-    } else {
-        tcg_gen_movi_i32(cpu_pc, dest);
-        if (ctx->singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        }
-        tcg_gen_exit_tb(NULL, 0);
-    }
-}
-
-static int decode_opc(MoxieCPU *cpu, DisasContext *ctx)
-{
-    CPUMoxieState *env = &cpu->env;
-
-    /* Local cache for the instruction opcode.  */
-    int opcode;
-    /* Set the default instruction length.  */
-    int length = 2;
-
-    /* Examine the 16-bit opcode.  */
-    opcode = ctx->opcode;
-
-    /* Decode instruction.  */
-    if (opcode & (1 << 15)) {
-        if (opcode & (1 << 14)) {
-            /* This is a Form 3 instruction.  */
-            int inst = (opcode >> 10 & 0xf);
-
-#define BRANCH(cond)                                                         \
-    do {                                                                     \
-        TCGLabel *l1 = gen_new_label();                                      \
-        tcg_gen_brcond_i32(cond, cc_a, cc_b, l1);                            \
-        gen_goto_tb(env, ctx, 1, ctx->pc+2);                                 \
-        gen_set_label(l1);                                                   \
-        gen_goto_tb(env, ctx, 0, extract_branch_offset(opcode) + ctx->pc+2); \
-        ctx->bstate = BS_BRANCH;                                             \
-    } while (0)
-
-            switch (inst) {
-            case 0x00: /* beq */
-                BRANCH(TCG_COND_EQ);
-                break;
-            case 0x01: /* bne */
-                BRANCH(TCG_COND_NE);
-                break;
-            case 0x02: /* blt */
-                BRANCH(TCG_COND_LT);
-                break;
-            case 0x03: /* bgt */
-                BRANCH(TCG_COND_GT);
-                break;
-            case 0x04: /* bltu */
-                BRANCH(TCG_COND_LTU);
-                break;
-            case 0x05: /* bgtu */
-                BRANCH(TCG_COND_GTU);
-                break;
-            case 0x06: /* bge */
-                BRANCH(TCG_COND_GE);
-                break;
-            case 0x07: /* ble */
-                BRANCH(TCG_COND_LE);
-                break;
-            case 0x08: /* bgeu */
-                BRANCH(TCG_COND_GEU);
-                break;
-            case 0x09: /* bleu */
-                BRANCH(TCG_COND_LEU);
-                break;
-            default:
-                {
-                    TCGv temp = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(cpu_pc, ctx->pc);
-                    tcg_gen_movi_i32(temp, MOXIE_EX_BAD);
-                    gen_helper_raise_exception(cpu_env, temp);
-                    tcg_temp_free_i32(temp);
-                }
-                break;
-            }
-        } else {
-            /* This is a Form 2 instruction.  */
-            int inst = (opcode >> 12 & 0x3);
-            switch (inst) {
-            case 0x00: /* inc */
-                {
-                    int a = (opcode >> 8) & 0xf;
-                    unsigned int v = (opcode & 0xff);
-                    tcg_gen_addi_i32(REG(a), REG(a), v);
-                }
-                break;
-            case 0x01: /* dec */
-                {
-                    int a = (opcode >> 8) & 0xf;
-                    unsigned int v = (opcode & 0xff);
-                    tcg_gen_subi_i32(REG(a), REG(a), v);
-                }
-                break;
-            case 0x02: /* gsr */
-                {
-                    int a = (opcode >> 8) & 0xf;
-                    unsigned v = (opcode & 0xff);
-                    tcg_gen_ld_i32(REG(a), cpu_env,
-                                   offsetof(CPUMoxieState, sregs[v]));
-                }
-                break;
-            case 0x03: /* ssr */
-                {
-                    int a = (opcode >> 8) & 0xf;
-                    unsigned v = (opcode & 0xff);
-                    tcg_gen_st_i32(REG(a), cpu_env,
-                                   offsetof(CPUMoxieState, sregs[v]));
-                }
-                break;
-            default:
-                {
-                    TCGv temp = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(cpu_pc, ctx->pc);
-                    tcg_gen_movi_i32(temp, MOXIE_EX_BAD);
-                    gen_helper_raise_exception(cpu_env, temp);
-                    tcg_temp_free_i32(temp);
-                }
-                break;
-            }
-        }
-    } else {
-        /* This is a Form 1 instruction.  */
-        int inst = opcode >> 8;
-        switch (inst) {
-        case 0x00: /* nop */
-            break;
-        case 0x01: /* ldi.l (immediate) */
-            {
-                int reg = (opcode >> 4) & 0xf;
-                int val = cpu_ldl_code(env, ctx->pc+2);
-                tcg_gen_movi_i32(REG(reg), val);
-                length = 6;
-            }
-            break;
-        case 0x02: /* mov (register-to-register) */
-            {
-                int dest  = (opcode >> 4) & 0xf;
-                int src = opcode & 0xf;
-                tcg_gen_mov_i32(REG(dest), REG(src));
-            }
-            break;
-        case 0x03: /* jsra */
-            {
-                TCGv t1 = tcg_temp_new_i32();
-                TCGv t2 = tcg_temp_new_i32();
-
-                tcg_gen_movi_i32(t1, ctx->pc + 6);
-
-                /* Make space for the static chain and return address.  */
-                tcg_gen_subi_i32(t2, REG(1), 8);
-                tcg_gen_mov_i32(REG(1), t2);
-                tcg_gen_qemu_st32(t1, REG(1), ctx->memidx);
-
-                /* Push the current frame pointer.  */
-                tcg_gen_subi_i32(t2, REG(1), 4);
-                tcg_gen_mov_i32(REG(1), t2);
-                tcg_gen_qemu_st32(REG(0), REG(1), ctx->memidx);
-
-                /* Set the pc and $fp.  */
-                tcg_gen_mov_i32(REG(0), REG(1));
-
-                gen_goto_tb(env, ctx, 0, cpu_ldl_code(env, ctx->pc+2));
-
-                tcg_temp_free_i32(t1);
-                tcg_temp_free_i32(t2);
-
-                ctx->bstate = BS_BRANCH;
-                length = 6;
-            }
-            break;
-        case 0x04: /* ret */
-            {
-                TCGv t1 = tcg_temp_new_i32();
-
-                /* The new $sp is the old $fp.  */
-                tcg_gen_mov_i32(REG(1), REG(0));
-
-                /* Pop the frame pointer.  */
-                tcg_gen_qemu_ld32u(REG(0), REG(1), ctx->memidx);
-                tcg_gen_addi_i32(t1, REG(1), 4);
-                tcg_gen_mov_i32(REG(1), t1);
-
-
-                /* Pop the return address and skip over the static chain
-                   slot.  */
-                tcg_gen_qemu_ld32u(cpu_pc, REG(1), ctx->memidx);
-                tcg_gen_addi_i32(t1, REG(1), 8);
-                tcg_gen_mov_i32(REG(1), t1);
-
-                tcg_temp_free_i32(t1);
-
-                /* Jump... */
-                tcg_gen_exit_tb(NULL, 0);
-
-                ctx->bstate = BS_BRANCH;
-            }
-            break;
-        case 0x05: /* add.l */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                tcg_gen_add_i32(REG(a), REG(a), REG(b));
-            }
-            break;
-        case 0x06: /* push */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                TCGv t1 = tcg_temp_new_i32();
-                tcg_gen_subi_i32(t1, REG(a), 4);
-                tcg_gen_mov_i32(REG(a), t1);
-                tcg_gen_qemu_st32(REG(b), REG(a), ctx->memidx);
-                tcg_temp_free_i32(t1);
-            }
-            break;
-        case 0x07: /* pop */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-                TCGv t1 = tcg_temp_new_i32();
-
-                tcg_gen_qemu_ld32u(REG(b), REG(a), ctx->memidx);
-                tcg_gen_addi_i32(t1, REG(a), 4);
-                tcg_gen_mov_i32(REG(a), t1);
-                tcg_temp_free_i32(t1);
-            }
-            break;
-        case 0x08: /* lda.l */
-            {
-                int reg = (opcode >> 4) & 0xf;
-
-                TCGv ptr = tcg_temp_new_i32();
-                tcg_gen_movi_i32(ptr, cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_ld32u(REG(reg), ptr, ctx->memidx);
-                tcg_temp_free_i32(ptr);
-
-                length = 6;
-            }
-            break;
-        case 0x09: /* sta.l */
-            {
-                int val = (opcode >> 4) & 0xf;
-
-                TCGv ptr = tcg_temp_new_i32();
-                tcg_gen_movi_i32(ptr, cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_st32(REG(val), ptr, ctx->memidx);
-                tcg_temp_free_i32(ptr);
-
-                length = 6;
-            }
-            break;
-        case 0x0a: /* ld.l (register indirect) */
-            {
-                int src  = opcode & 0xf;
-                int dest = (opcode >> 4) & 0xf;
-
-                tcg_gen_qemu_ld32u(REG(dest), REG(src), ctx->memidx);
-            }
-            break;
-        case 0x0b: /* st.l */
-            {
-                int dest = (opcode >> 4) & 0xf;
-                int val  = opcode & 0xf;
-
-                tcg_gen_qemu_st32(REG(val), REG(dest), ctx->memidx);
-            }
-            break;
-        case 0x0c: /* ldo.l */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                TCGv t1 = tcg_temp_new_i32();
-                TCGv t2 = tcg_temp_new_i32();
-                tcg_gen_addi_i32(t1, REG(b), cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_ld32u(t2, t1, ctx->memidx);
-                tcg_gen_mov_i32(REG(a), t2);
-
-                tcg_temp_free_i32(t1);
-                tcg_temp_free_i32(t2);
-
-                length = 6;
-            }
-            break;
-        case 0x0d: /* sto.l */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                TCGv t1 = tcg_temp_new_i32();
-                TCGv t2 = tcg_temp_new_i32();
-                tcg_gen_addi_i32(t1, REG(a), cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_st32(REG(b), t1, ctx->memidx);
-
-                tcg_temp_free_i32(t1);
-                tcg_temp_free_i32(t2);
-
-                length = 6;
-            }
-            break;
-        case 0x0e: /* cmp */
-            {
-                int a  = (opcode >> 4) & 0xf;
-                int b  = opcode & 0xf;
-
-                tcg_gen_mov_i32(cc_a, REG(a));
-                tcg_gen_mov_i32(cc_b, REG(b));
-            }
-            break;
-        case 0x19: /* jsr */
-            {
-                int fnreg = (opcode >> 4) & 0xf;
-
-                /* Load the stack pointer into T0.  */
-                TCGv t1 = tcg_temp_new_i32();
-                TCGv t2 = tcg_temp_new_i32();
-
-                tcg_gen_movi_i32(t1, ctx->pc+2);
-
-                /* Make space for the static chain and return address.  */
-                tcg_gen_subi_i32(t2, REG(1), 8);
-                tcg_gen_mov_i32(REG(1), t2);
-                tcg_gen_qemu_st32(t1, REG(1), ctx->memidx);
-
-                /* Push the current frame pointer.  */
-                tcg_gen_subi_i32(t2, REG(1), 4);
-                tcg_gen_mov_i32(REG(1), t2);
-                tcg_gen_qemu_st32(REG(0), REG(1), ctx->memidx);
-
-                /* Set the pc and $fp.  */
-                tcg_gen_mov_i32(REG(0), REG(1));
-                tcg_gen_mov_i32(cpu_pc, REG(fnreg));
-                tcg_temp_free_i32(t1);
-                tcg_temp_free_i32(t2);
-                tcg_gen_exit_tb(NULL, 0);
-                ctx->bstate = BS_BRANCH;
-            }
-            break;
-        case 0x1a: /* jmpa */
-            {
-                tcg_gen_movi_i32(cpu_pc, cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_exit_tb(NULL, 0);
-                ctx->bstate = BS_BRANCH;
-                length = 6;
-            }
-            break;
-        case 0x1b: /* ldi.b (immediate) */
-            {
-                int reg = (opcode >> 4) & 0xf;
-                int val = cpu_ldl_code(env, ctx->pc+2);
-                tcg_gen_movi_i32(REG(reg), val);
-                length = 6;
-            }
-            break;
-        case 0x1c: /* ld.b (register indirect) */
-            {
-                int src  = opcode & 0xf;
-                int dest = (opcode >> 4) & 0xf;
-
-                tcg_gen_qemu_ld8u(REG(dest), REG(src), ctx->memidx);
-            }
-            break;
-        case 0x1d: /* lda.b */
-            {
-                int reg = (opcode >> 4) & 0xf;
-
-                TCGv ptr = tcg_temp_new_i32();
-                tcg_gen_movi_i32(ptr, cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_ld8u(REG(reg), ptr, ctx->memidx);
-                tcg_temp_free_i32(ptr);
-
-                length = 6;
-            }
-            break;
-        case 0x1e: /* st.b */
-            {
-                int dest = (opcode >> 4) & 0xf;
-                int val  = opcode & 0xf;
-
-                tcg_gen_qemu_st8(REG(val), REG(dest), ctx->memidx);
-            }
-            break;
-        case 0x1f: /* sta.b */
-            {
-                int val = (opcode >> 4) & 0xf;
-
-                TCGv ptr = tcg_temp_new_i32();
-                tcg_gen_movi_i32(ptr, cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_st8(REG(val), ptr, ctx->memidx);
-                tcg_temp_free_i32(ptr);
-
-                length = 6;
-            }
-            break;
-        case 0x20: /* ldi.s (immediate) */
-            {
-                int reg = (opcode >> 4) & 0xf;
-                int val = cpu_ldl_code(env, ctx->pc+2);
-                tcg_gen_movi_i32(REG(reg), val);
-                length = 6;
-            }
-            break;
-        case 0x21: /* ld.s (register indirect) */
-            {
-                int src  = opcode & 0xf;
-                int dest = (opcode >> 4) & 0xf;
-
-                tcg_gen_qemu_ld16u(REG(dest), REG(src), ctx->memidx);
-            }
-            break;
-        case 0x22: /* lda.s */
-            {
-                int reg = (opcode >> 4) & 0xf;
-
-                TCGv ptr = tcg_temp_new_i32();
-                tcg_gen_movi_i32(ptr, cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_ld16u(REG(reg), ptr, ctx->memidx);
-                tcg_temp_free_i32(ptr);
-
-                length = 6;
-            }
-            break;
-        case 0x23: /* st.s */
-            {
-                int dest = (opcode >> 4) & 0xf;
-                int val  = opcode & 0xf;
-
-                tcg_gen_qemu_st16(REG(val), REG(dest), ctx->memidx);
-            }
-            break;
-        case 0x24: /* sta.s */
-            {
-                int val = (opcode >> 4) & 0xf;
-
-                TCGv ptr = tcg_temp_new_i32();
-                tcg_gen_movi_i32(ptr, cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_st16(REG(val), ptr, ctx->memidx);
-                tcg_temp_free_i32(ptr);
-
-                length = 6;
-            }
-            break;
-        case 0x25: /* jmp */
-            {
-                int reg = (opcode >> 4) & 0xf;
-                tcg_gen_mov_i32(cpu_pc, REG(reg));
-                tcg_gen_exit_tb(NULL, 0);
-                ctx->bstate = BS_BRANCH;
-            }
-            break;
-        case 0x26: /* and */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                tcg_gen_and_i32(REG(a), REG(a), REG(b));
-            }
-            break;
-        case 0x27: /* lshr */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                TCGv sv = tcg_temp_new_i32();
-                tcg_gen_andi_i32(sv, REG(b), 0x1f);
-                tcg_gen_shr_i32(REG(a), REG(a), sv);
-                tcg_temp_free_i32(sv);
-            }
-            break;
-        case 0x28: /* ashl */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                TCGv sv = tcg_temp_new_i32();
-                tcg_gen_andi_i32(sv, REG(b), 0x1f);
-                tcg_gen_shl_i32(REG(a), REG(a), sv);
-                tcg_temp_free_i32(sv);
-            }
-            break;
-        case 0x29: /* sub.l */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                tcg_gen_sub_i32(REG(a), REG(a), REG(b));
-            }
-            break;
-        case 0x2a: /* neg */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                tcg_gen_neg_i32(REG(a), REG(b));
-            }
-            break;
-        case 0x2b: /* or */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                tcg_gen_or_i32(REG(a), REG(a), REG(b));
-            }
-            break;
-        case 0x2c: /* not */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                tcg_gen_not_i32(REG(a), REG(b));
-            }
-            break;
-        case 0x2d: /* ashr */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                TCGv sv = tcg_temp_new_i32();
-                tcg_gen_andi_i32(sv, REG(b), 0x1f);
-                tcg_gen_sar_i32(REG(a), REG(a), sv);
-                tcg_temp_free_i32(sv);
-            }
-            break;
-        case 0x2e: /* xor */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                tcg_gen_xor_i32(REG(a), REG(a), REG(b));
-            }
-            break;
-        case 0x2f: /* mul.l */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                tcg_gen_mul_i32(REG(a), REG(a), REG(b));
-            }
-            break;
-        case 0x30: /* swi */
-            {
-                int val = cpu_ldl_code(env, ctx->pc+2);
-
-                TCGv temp = tcg_temp_new_i32();
-                tcg_gen_movi_i32(temp, val);
-                tcg_gen_st_i32(temp, cpu_env,
-                               offsetof(CPUMoxieState, sregs[3]));
-                tcg_gen_movi_i32(cpu_pc, ctx->pc);
-                tcg_gen_movi_i32(temp, MOXIE_EX_SWI);
-                gen_helper_raise_exception(cpu_env, temp);
-                tcg_temp_free_i32(temp);
-
-                length = 6;
-            }
-            break;
-        case 0x31: /* div.l */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-                tcg_gen_movi_i32(cpu_pc, ctx->pc);
-                gen_helper_div(REG(a), cpu_env, REG(a), REG(b));
-            }
-            break;
-        case 0x32: /* udiv.l */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-                tcg_gen_movi_i32(cpu_pc, ctx->pc);
-                gen_helper_udiv(REG(a), cpu_env, REG(a), REG(b));
-            }
-            break;
-        case 0x33: /* mod.l */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-                tcg_gen_rem_i32(REG(a), REG(a), REG(b));
-            }
-            break;
-        case 0x34: /* umod.l */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-                tcg_gen_remu_i32(REG(a), REG(a), REG(b));
-            }
-            break;
-        case 0x35: /* brk */
-            {
-                TCGv temp = tcg_temp_new_i32();
-                tcg_gen_movi_i32(cpu_pc, ctx->pc);
-                tcg_gen_movi_i32(temp, MOXIE_EX_BREAK);
-                gen_helper_raise_exception(cpu_env, temp);
-                tcg_temp_free_i32(temp);
-            }
-            break;
-        case 0x36: /* ldo.b */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                TCGv t1 = tcg_temp_new_i32();
-                TCGv t2 = tcg_temp_new_i32();
-                tcg_gen_addi_i32(t1, REG(b), cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_ld8u(t2, t1, ctx->memidx);
-                tcg_gen_mov_i32(REG(a), t2);
-
-                tcg_temp_free_i32(t1);
-                tcg_temp_free_i32(t2);
-
-                length = 6;
-            }
-            break;
-        case 0x37: /* sto.b */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                TCGv t1 = tcg_temp_new_i32();
-                TCGv t2 = tcg_temp_new_i32();
-                tcg_gen_addi_i32(t1, REG(a), cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_st8(REG(b), t1, ctx->memidx);
-
-                tcg_temp_free_i32(t1);
-                tcg_temp_free_i32(t2);
-
-                length = 6;
-            }
-            break;
-        case 0x38: /* ldo.s */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                TCGv t1 = tcg_temp_new_i32();
-                TCGv t2 = tcg_temp_new_i32();
-                tcg_gen_addi_i32(t1, REG(b), cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_ld16u(t2, t1, ctx->memidx);
-                tcg_gen_mov_i32(REG(a), t2);
-
-                tcg_temp_free_i32(t1);
-                tcg_temp_free_i32(t2);
-
-                length = 6;
-            }
-            break;
-        case 0x39: /* sto.s */
-            {
-                int a = (opcode >> 4) & 0xf;
-                int b = opcode & 0xf;
-
-                TCGv t1 = tcg_temp_new_i32();
-                TCGv t2 = tcg_temp_new_i32();
-                tcg_gen_addi_i32(t1, REG(a), cpu_ldl_code(env, ctx->pc+2));
-                tcg_gen_qemu_st16(REG(b), t1, ctx->memidx);
-                tcg_temp_free_i32(t1);
-                tcg_temp_free_i32(t2);
-
-                length = 6;
-            }
-            break;
-        default:
-            {
-                TCGv temp = tcg_temp_new_i32();
-                tcg_gen_movi_i32(cpu_pc, ctx->pc);
-                tcg_gen_movi_i32(temp, MOXIE_EX_BAD);
-                gen_helper_raise_exception(cpu_env, temp);
-                tcg_temp_free_i32(temp);
-             }
-            break;
-        }
-    }
-
-    return length;
-}
-
-/* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
-{
-    CPUMoxieState *env = cs->env_ptr;
-    MoxieCPU *cpu = env_archcpu(env);
-    DisasContext ctx;
-    target_ulong pc_start;
-    int num_insns;
-
-    pc_start = tb->pc;
-    ctx.pc = pc_start;
-    ctx.saved_pc = -1;
-    ctx.tb = tb;
-    ctx.memidx = 0;
-    ctx.singlestep_enabled = 0;
-    ctx.bstate = BS_NONE;
-    num_insns = 0;
-
-    gen_tb_start(tb);
-    do {
-        tcg_gen_insn_start(ctx.pc);
-        num_insns++;
-
-        if (unlikely(cpu_breakpoint_test(cs, ctx.pc, BP_ANY))) {
-            tcg_gen_movi_i32(cpu_pc, ctx.pc);
-            gen_helper_debug(cpu_env);
-            ctx.bstate = BS_EXCP;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            ctx.pc += 2;
-            goto done_generating;
-        }
-
-        ctx.opcode = cpu_lduw_code(env, ctx.pc);
-        ctx.pc += decode_opc(cpu, &ctx);
-
-        if (num_insns >= max_insns) {
-            break;
-        }
-        if (cs->singlestep_enabled) {
-            break;
-        }
-        if ((ctx.pc & (TARGET_PAGE_SIZE - 1)) == 0) {
-            break;
-        }
-    } while (ctx.bstate == BS_NONE && !tcg_op_buf_full());
-
-    if (cs->singlestep_enabled) {
-        tcg_gen_movi_tl(cpu_pc, ctx.pc);
-        gen_helper_debug(cpu_env);
-    } else {
-        switch (ctx.bstate) {
-        case BS_STOP:
-        case BS_NONE:
-            gen_goto_tb(env, &ctx, 0, ctx.pc);
-            break;
-        case BS_EXCP:
-            tcg_gen_exit_tb(NULL, 0);
-            break;
-        case BS_BRANCH:
-        default:
-            break;
-        }
-    }
- done_generating:
-    gen_tb_end(tb, num_insns);
-
-    tb->size = ctx.pc - pc_start;
-    tb->icount = num_insns;
-}
-
-void restore_state_to_opc(CPUMoxieState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index d74509b1c5..d40adddafa 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -61,13 +61,6 @@ static const uint8_t kernel_plml605[] = {
     0xfc, 0xff, 0x00, 0xb8                  /* bri   -4  loop */
 };
 
-static const uint8_t bios_moxiesim[] = {
-    0x20, 0x10, 0x00, 0x00, 0x03, 0xf8,     /* ldi.s r1,0x3f8 */
-    0x1b, 0x20, 0x00, 0x00, 0x00, 0x54,     /* ldi.b r2,'T' */
-    0x1e, 0x12,                             /* st.b  r1,r2 */
-    0x1a, 0x00, 0x00, 0x00, 0x10, 0x00      /* jmpa  0x1000 */
-};
-
 static const uint8_t bios_raspi2[] = {
     0x08, 0x30, 0x9f, 0xe5,                 /* ldr   r3,[pc,#8]    Get base */
     0x54, 0x20, 0xa0, 0xe3,                 /* mov     r2,#'T' */
@@ -145,7 +138,6 @@ static testdef_t tests[] = {
       sizeof(kernel_pls3adsp1800), kernel_pls3adsp1800 },
     { "microblazeel", "petalogix-ml605", "", "TT",
       sizeof(kernel_plml605), kernel_plml605 },
-    { "moxie", "moxiesim", "", "TT", sizeof(bios_moxiesim), 0, bios_moxiesim },
     { "arm", "raspi2", "", "TT", sizeof(bios_raspi2), 0, bios_raspi2 },
     /* For hppa, force bios to output to serial by disabling graphics. */
     { "hppa", "hppa", "-vga none", "SeaBIOS wants SYSTEM HALT" },
diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
index aab06b9fc2..5feada15dc 100644
--- a/tests/qtest/machine-none-test.c
+++ b/tests/qtest/machine-none-test.c
@@ -40,7 +40,6 @@ static struct arch2cpu cpus_map[] = {
     { "mipsel", "I7200" },
     { "mips64", "20Kc" },
     { "mips64el", "I6500" },
-    { "moxie", "MoxieLite" },
     { "nios2", "FIXME" },
     { "or1k", "or1200" },
     { "ppc", "604" },
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 9ea318f3e2..60df67d441 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -152,7 +152,7 @@ static FloatParts parts_default_nan(float_status *status)
     /* This case is true for Alpha, ARM, MIPS, OpenRISC, PPC, RISC-V,
      * S390, SH4, TriCore, and Xtensa.  I cannot find documentation
      * for Unicore32; the choice from the original commit is unchanged.
-     * Our other supported targets, CRIS, LM32, Moxie, Nios2, and Tile,
+     * Our other supported targets, CRIS, LM32, and Nios2,
      * do not have floating-point.
      */
     if (snan_bit_is_one(status)) {
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index dcb6317aac..da6570799b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -89,7 +89,7 @@ build-system-alpine:
   variables:
     IMAGE: alpine
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
-      moxie-softmmu microblazeel-softmmu mips64el-softmmu
+      microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
     CONFIGURE_ARGS: --enable-docs --enable-trace-backends=log,simple,syslog
   artifacts:
@@ -125,7 +125,7 @@ build-system-ubuntu:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
-      moxie-softmmu microblazeel-softmmu mips64el-softmmu
+      microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
   artifacts:
     expire_in: 2 days
@@ -684,7 +684,7 @@ build-tci:
   variables:
     IMAGE: debian-all-test-cross
   script:
-    - TARGETS="aarch64 alpha arm hppa m68k microblaze moxie ppc64 s390x x86_64"
+    - TARGETS="aarch64 alpha arm hppa m68k microblaze ppc64 s390x x86_64"
     - mkdir build
     - cd build
     - ../configure --enable-tcg-interpreter
diff --git a/MAINTAINERS b/MAINTAINERS
index 06642d9799..50884fef15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -258,14 +258,6 @@ MIPS TCG CPUs (nanoMIPS ISA)
 S: Orphan
 F: disas/nanomips.*
 
-Moxie TCG CPUs
-M: Anthony Green <green@moxielogic.com>
-S: Maintained
-F: target/moxie/
-F: disas/moxie.c
-F: hw/moxie/
-F: default-configs/*/moxie-softmmu.mak
-
 NiosII TCG CPUs
 M: Chris Wulff <crwulff@gmail.com>
 M: Marek Vasut <marex@denx.de>
diff --git a/disas/meson.build b/disas/meson.build
index 4c8da01877..39a5475ff6 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -13,7 +13,6 @@ common_ss.add(when: 'CONFIG_LM32_DIS', if_true: files('lm32.c'))
 common_ss.add(when: 'CONFIG_M68K_DIS', if_true: files('m68k.c'))
 common_ss.add(when: 'CONFIG_MICROBLAZE_DIS', if_true: files('microblaze.c'))
 common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c'))
-common_ss.add(when: 'CONFIG_MOXIE_DIS', if_true: files('moxie.c'))
 common_ss.add(when: 'CONFIG_NANOMIPS_DIS', if_true: files('nanomips.cpp'))
 common_ss.add(when: 'CONFIG_NIOS2_DIS', if_true: files('nios2.c'))
 common_ss.add(when: 'CONFIG_PPC_DIS', if_true: files('ppc.c'))
diff --git a/hw/Kconfig b/hw/Kconfig
index ff40bd3f7b..559b7636f4 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -51,7 +51,6 @@ source lm32/Kconfig
 source m68k/Kconfig
 source microblaze/Kconfig
 source mips/Kconfig
-source moxie/Kconfig
 source nios2/Kconfig
 source openrisc/Kconfig
 source ppc/Kconfig
diff --git a/hw/meson.build b/hw/meson.build
index 8ba79b1a52..503cbc974f 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -51,7 +51,6 @@ subdir('lm32')
 subdir('m68k')
 subdir('microblaze')
 subdir('mips')
-subdir('moxie')
 subdir('nios2')
 subdir('openrisc')
 subdir('ppc')
diff --git a/hw/moxie/Kconfig b/hw/moxie/Kconfig
deleted file mode 100644
index 3793ef0372..0000000000
--- a/hw/moxie/Kconfig
+++ /dev/null
@@ -1,3 +0,0 @@
-config MOXIESIM
-    bool
-    select SERIAL
diff --git a/hw/moxie/meson.build b/hw/moxie/meson.build
deleted file mode 100644
index 05a7c2e00f..0000000000
--- a/hw/moxie/meson.build
+++ /dev/null
@@ -1,4 +0,0 @@
-moxie_ss = ss.source_set()
-moxie_ss.add(when: 'CONFIG_MOXIESIM', if_true: files('moxiesim.c'))
-
-hw_arch += {'moxie': moxie_ss}
diff --git a/target/meson.build b/target/meson.build
index 0e2c4b69cb..289a654caf 100644
--- a/target/meson.build
+++ b/target/meson.build
@@ -9,7 +9,6 @@ subdir('lm32')
 subdir('m68k')
 subdir('microblaze')
 subdir('mips')
-subdir('moxie')
 subdir('nios2')
 subdir('openrisc')
 subdir('ppc')
diff --git a/target/moxie/meson.build b/target/moxie/meson.build
deleted file mode 100644
index b4beb528cc..0000000000
--- a/target/moxie/meson.build
+++ /dev/null
@@ -1,14 +0,0 @@
-moxie_ss = ss.source_set()
-moxie_ss.add(files(
-  'cpu.c',
-  'helper.c',
-  'machine.c',
-  'machine.c',
-  'translate.c',
-))
-
-moxie_softmmu_ss = ss.source_set()
-moxie_softmmu_ss.add(files('mmu.c'))
-
-target_arch += {'moxie': moxie_ss}
-target_softmmu_arch += {'moxie': moxie_softmmu_ss}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 966bc93efa..49de74ff59 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -126,8 +126,6 @@ qtests_mips64el = \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
-qtests_moxie = [ 'boot-serial-test' ]
-
 qtests_ppc = \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +                     \
-- 
2.26.3


