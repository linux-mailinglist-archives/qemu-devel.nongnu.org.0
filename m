Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B0E3542FF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:49:35 +0200 (CEST)
Received: from localhost ([::1]:58262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQXl-0006EX-Fc
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHE-0001Il-G1
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQH9-0001jW-6T
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:28 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so7363794wma.0
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+eD9/4PxuofF/EcVcaO5wAPVHJCdzIAdzCadWF/N8SY=;
 b=ZtvX7QOLuA5ct52dXqQpULc+xh8rRcT0PU9+Q0HNiyFh9IOWxx8sqNSfuxAy4YyTCH
 a5TrPcmn7umnVR2zqxWfxGLsOXeTvUAGmx7WQPoXWbtv35g1/G7cIo/p5YL40f0hUauX
 E/MDCfzHPQM5Uk71RRJBkPU9zydu8BnLbdKbde7jHKGym9by3jZ5pKulVavO3q8UefAP
 mFxkzQncR+p/SBg8+bhJXhsQu/oeM3+Lx7a1YS7ZVdnvNsdUaOC5Mecc+Mn4uBTpdo9U
 FJYUXatP8vWXptn+Ms/QsZdLgp42kHimckdYbUheHpMeuTHw0OFIT7128NBLQrW+jPXy
 9NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+eD9/4PxuofF/EcVcaO5wAPVHJCdzIAdzCadWF/N8SY=;
 b=XdTqpV5o6Q/ZzlCCFUV8/3DZQ5S0nnVmLxertOXeZCtU5ZuAh+AEW7yZkmVkL3TZt4
 QfVVCct7skF2K1DFIC9OT9eiWaWDAlOg/Yp0QuJCZGf4WEFzfWDjvaX0JxDw4XPhh/AT
 ZW5Sd1Wm2c0smoLfSoipuBpX3v68CVRakBiKGEnzgSz6gE1fypp6ulbsoGVBiL8KNEJy
 MvwW3gsjrZB6pbCt1M+jBaSwPOdCMAWVrIozyFNX4NfSzMiriT+AB2ZGxPh/1m5HGS8N
 FHCYmAzQQp1WyJwE3ITx1Id23yJHxL46gapaeH78Fxc1+8BF7WzyqaCd6Rf8D8QNwk+0
 Svvw==
X-Gm-Message-State: AOAM533bTgg3RXjjViZATW587ZdU1aEBc+Vf/0vgvHqgW/XwwQ/JfLDo
 qwYN88Wy3lz9M4lOZWlD7hAxcvRVQSbPKQ==
X-Google-Smtp-Source: ABdhPJzIfKfPdAE4kHB+9HKAj83aHEeHQ63LgGC7AL2wK+phPwDDU0qKJn1Bojgl+WbT+xv/vbzOyA==
X-Received: by 2002:a05:600c:4013:: with SMTP id
 i19mr25317117wmm.33.1617633141919; 
 Mon, 05 Apr 2021 07:32:21 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:21 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 14/27] arc: Add support for ARCv2
Date: Mon,  5 Apr 2021 15:31:25 +0100
Message-Id: <20210405143138.17016-15-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shahab Vahedi <shahab@synopsys.com>

Add remaining bits of the Synopsys ARCv2 (EM/HS) support into QEMU,
configure bits, arch_init and configuration files for softmmu (hardware
emulation).

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
---
 configure                               |  2 ++
 default-configs/arc-softmmu.mak         |  5 +++++
 default-configs/devices/arc-softmmu.mak |  7 +++++++
 default-configs/targets/arc-softmmu.mak |  3 +++
 disas.c                                 |  2 ++
 disas/meson.build                       |  1 +
 hw/Kconfig                              |  1 +
 hw/arc/Kconfig                          |  9 +++++++++
 hw/arc/Makefile.objs                    | 21 ---------------------
 hw/arc/meson.build                      |  6 +-----
 hw/meson.build                          |  1 +
 include/disas/dis-asm.h                 | 10 +++++++++-
 include/elf.h                           |  5 +++++
 include/exec/poison.h                   |  2 ++
 include/sysemu/arch_init.h              |  1 +
 meson.build                             |  5 +++--
 softmmu/arch_init.c                     |  2 ++
 target/meson.build                      |  1 +
 18 files changed, 55 insertions(+), 29 deletions(-)
 create mode 100644 default-configs/arc-softmmu.mak
 create mode 100644 default-configs/devices/arc-softmmu.mak
 create mode 100644 default-configs/targets/arc-softmmu.mak
 create mode 100644 hw/arc/Kconfig
 delete mode 100644 hw/arc/Makefile.objs

diff --git a/configure b/configure
index 535e6a9269..80d993fac7 100755
--- a/configure
+++ b/configure
@@ -680,6 +680,8 @@ elif check_define __arm__ ; then
   cpu="arm"
 elif check_define __aarch64__ ; then
   cpu="aarch64"
+elif check_define __arc__ ; then
+  cpu="arc"
 else
   cpu=$(uname -m)
 fi
diff --git a/default-configs/arc-softmmu.mak b/default-configs/arc-softmmu.mak
new file mode 100644
index 0000000000..4300a90c93
--- /dev/null
+++ b/default-configs/arc-softmmu.mak
@@ -0,0 +1,5 @@
+# Default configuration for arc-softmmu
+
+CONFIG_VIRTIO_MMIO=y
+CONFIG_SERIAL=y
+CONFIG_OPENCORES_ETH=y
diff --git a/default-configs/devices/arc-softmmu.mak b/default-configs/devices/arc-softmmu.mak
new file mode 100644
index 0000000000..0ce4176b2d
--- /dev/null
+++ b/default-configs/devices/arc-softmmu.mak
@@ -0,0 +1,7 @@
+# Default configuration for arc-softmmu
+
+CONFIG_SEMIHOSTING=n
+
+# Boards:
+#
+CONFIG_ARC_VIRT=y
diff --git a/default-configs/targets/arc-softmmu.mak b/default-configs/targets/arc-softmmu.mak
new file mode 100644
index 0000000000..a50b090b97
--- /dev/null
+++ b/default-configs/targets/arc-softmmu.mak
@@ -0,0 +1,3 @@
+TARGET_ARCH=arcv2
+TARGET_BASE_ARCH=arc
+TARGET_XML_FILES= gdb-xml/arc-v2-core.xml gdb-xml/arc-v2-aux.xml gdb-xml/arc-v2-other.xml
diff --git a/disas.c b/disas.c
index a61f95b580..a10fa41330 100644
--- a/disas.c
+++ b/disas.c
@@ -208,6 +208,8 @@ static void initialize_debug_host(CPUDebug *s)
     s->info.cap_insn_split = 6;
 #elif defined(__hppa__)
     s->info.print_insn = print_insn_hppa;
+#elif defined(__arc__)
+    s->info.print_insn = print_insn_arc;
 #endif
 }
 
diff --git a/disas/meson.build b/disas/meson.build
index 4c8da01877..c35836fa9f 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -4,6 +4,7 @@ subdir('libvixl')
 common_ss.add(when: 'CONFIG_ALPHA_DIS', if_true: files('alpha.c'))
 common_ss.add(when: 'CONFIG_ARM_A64_DIS', if_true: files('arm-a64.cc'))
 common_ss.add_all(when: 'CONFIG_ARM_A64_DIS', if_true: libvixl_ss)
+common_ss.add(when: 'CONFIG_ARC_DIS', if_true: files('arc.c'))
 common_ss.add(when: 'CONFIG_ARM_DIS', if_true: files('arm.c'))
 common_ss.add(when: 'CONFIG_CRIS_DIS', if_true: files('cris.c'))
 common_ss.add(when: 'CONFIG_HEXAGON_DIS', if_true: files('hexagon.c'))
diff --git a/hw/Kconfig b/hw/Kconfig
index ff40bd3f7b..cdc0d380a3 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -41,6 +41,7 @@ source vfio/Kconfig
 source watchdog/Kconfig
 
 # arch Kconfig
+source arc/Kconfig
 source arm/Kconfig
 source alpha/Kconfig
 source avr/Kconfig
diff --git a/hw/arc/Kconfig b/hw/arc/Kconfig
new file mode 100644
index 0000000000..b47afbcdf2
--- /dev/null
+++ b/hw/arc/Kconfig
@@ -0,0 +1,9 @@
+config ARC_VIRT
+    bool
+    select SERIAL
+    select VIRTIO_MMIO
+    select PCI_EXPRESS_GENERIC_BRIDGE
+    select PCI_DEVICES
+
+config ARC
+    bool
diff --git a/hw/arc/Makefile.objs b/hw/arc/Makefile.objs
deleted file mode 100644
index 28d7766cd9..0000000000
--- a/hw/arc/Makefile.objs
+++ /dev/null
@@ -1,21 +0,0 @@
-#
-#  QEMU ARC CPU
-#
-#  Copyright (c) 2019
-#
-#  This library is free software; you can redistribute it and/or
-#  modify it under the terms of the GNU Lesser General Public
-#  License as published by the Free Software Foundation; either
-#  version 2.1 of the License, or (at your option) any later version.
-#
-#  This library is distributed in the hope that it will be useful,
-#  but WITHOUT ANY WARRANTY; without even the implied warranty of
-#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-#  Lesser General Public License for more details.
-#
-#  You should have received a copy of the GNU Lesser General Public
-#  License along with this library; if not, see
-#  http://www.gnu.org/licenses/lgpl-2.1.html
-#
-
-obj-y   = arc_sim.o arc_uart.o sample.o pic_cpu.o boot.o board-hsdk.o sim-hs.o nsim.o
diff --git a/hw/arc/meson.build b/hw/arc/meson.build
index 6a587307a4..f3b517013d 100644
--- a/hw/arc/meson.build
+++ b/hw/arc/meson.build
@@ -1,13 +1,9 @@
 arc_ss = ss.source_set()
 arc_ss.add(files(
   'arc_sim.c',
-  'arc_uart.c',
-  'sample.c',
   'pic_cpu.c',
   'boot.c',
-  'board-hsdk.c',
-  'sim-hs.c',
-  'nsim.c',
 ))
+arc_ss.add(when: 'CONFIG_ARC_VIRT', if_true: files('virt.c'))
 
 hw_arch += {'arc': arc_ss}
diff --git a/hw/meson.build b/hw/meson.build
index 8ba79b1a52..8f1a151c68 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -42,6 +42,7 @@ subdir('xen')
 subdir('xenpv')
 
 subdir('alpha')
+subdir('arc')
 subdir('arm')
 subdir('avr')
 subdir('cris')
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 13fa1edd41..8a0aa19bc2 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -206,7 +206,14 @@ enum bfd_architecture
   bfd_arch_v850,       /* NEC V850 */
 #define bfd_mach_v850          0
   bfd_arch_arc,        /* Argonaut RISC Core */
-#define bfd_mach_arc_base 0
+#define bfd_mach_arc_a4        0
+#define bfd_mach_arc_a5        1
+#define bfd_mach_arc_arc600    2
+#define bfd_mach_arc_arc601    4
+#define bfd_mach_arc_arc700    3
+#define bfd_mach_arc_arcv2     5
+#define bfd_mach_arc_arcv2em   6
+#define bfd_mach_arc_arcv2hs   7
   bfd_arch_m32r,       /* Mitsubishi M32R/D */
 #define bfd_mach_m32r          0  /* backwards compatibility */
   bfd_arch_mn10200,    /* Matsushita MN10200 */
@@ -460,6 +467,7 @@ int print_insn_riscv32          (bfd_vma, disassemble_info*);
 int print_insn_riscv64          (bfd_vma, disassemble_info*);
 int print_insn_rx(bfd_vma, disassemble_info *);
 int print_insn_hexagon(bfd_vma, disassemble_info *);
+int print_insn_arc              (bfd_vma, disassemble_info*);
 
 #ifdef CONFIG_CAPSTONE
 bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size);
diff --git a/include/elf.h b/include/elf.h
index 78237c9a87..8c7c4ab8a9 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -206,6 +206,11 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_AARCH64  183
 
+#define EM_TILEGX   191 /* TILE-Gx */
+
+#define EM_ARC_COMPACT  93  /* Synopsys ARCompact */
+#define EM_ARC_COMPACT2 195 /* Synopsys ARCompact V2 */
+
 #define EM_MOXIE           223     /* Moxie processor family */
 #define EM_MOXIE_OLD       0xFEED
 
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 4cd3f8abb4..ec04c8370b 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -8,6 +8,7 @@
 #pragma GCC poison TARGET_X86_64
 #pragma GCC poison TARGET_AARCH64
 #pragma GCC poison TARGET_ALPHA
+#pragma GCC poison TARGET_ARC
 #pragma GCC poison TARGET_ARM
 #pragma GCC poison TARGET_CRIS
 #pragma GCC poison TARGET_HEXAGON
@@ -69,6 +70,7 @@
 
 #pragma GCC poison CONFIG_ALPHA_DIS
 #pragma GCC poison CONFIG_ARM_A64_DIS
+#pragma GCC poison CONFIG_ARC_DIS
 #pragma GCC poison CONFIG_ARM_DIS
 #pragma GCC poison CONFIG_CRIS_DIS
 #pragma GCC poison CONFIG_HPPA_DIS
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 16da279696..ace91cd47c 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -26,6 +26,7 @@ enum {
     QEMU_ARCH_RISCV = (1 << 19),
     QEMU_ARCH_RX = (1 << 20),
     QEMU_ARCH_AVR = (1 << 21),
+    QEMU_ARCH_ARC = (1 << 22),
 
     QEMU_ARCH_NONE = (1 << 31),
 };
diff --git a/meson.build b/meson.build
index c6f4b0cf5e..a25425022e 100644
--- a/meson.build
+++ b/meson.build
@@ -56,8 +56,8 @@ have_block = have_system or have_tools
 python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
-supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
-  'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+supported_cpus = ['ppc', 'ppc64', 's390x', 'sparc64', 'riscv32', 'riscv64', 'x86', 'x86_64',
+  'arc', 'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
 targetos = host_machine.system()
@@ -1190,6 +1190,7 @@ config_target_mak = {}
 
 disassemblers = {
   'alpha' : ['CONFIG_ALPHA_DIS'],
+  'arc' : ['CONFIG_ARC_DIS'],
   'arm' : ['CONFIG_ARM_DIS'],
   'avr' : ['CONFIG_AVR_DIS'],
   'cris' : ['CONFIG_CRIS_DIS'],
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 7fd5c09b2b..27faed5edd 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -92,6 +92,8 @@ int graphic_depth = 32;
 #define QEMU_ARCH QEMU_ARCH_XTENSA
 #elif defined(TARGET_AVR)
 #define QEMU_ARCH QEMU_ARCH_AVR
+#elif defined(TARGET_ARC)
+#define QEMU_ARCH QEMU_ARCH_ARC
 #endif
 
 const uint32_t arch_type = QEMU_ARCH;
diff --git a/target/meson.build b/target/meson.build
index 0e2c4b69cb..c3d94ae1dd 100644
--- a/target/meson.build
+++ b/target/meson.build
@@ -1,4 +1,5 @@
 subdir('alpha')
+subdir('arc')
 subdir('arm')
 subdir('avr')
 subdir('cris')
-- 
2.20.1


