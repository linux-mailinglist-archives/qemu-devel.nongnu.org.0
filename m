Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD8181ED5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 16:17:02 +0200 (CEST)
Received: from localhost ([::1]:54306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hudnJ-0000Sa-KH
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 10:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35151)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mrolnik@gmail.com>) id 1hudkw-0003uY-4a
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:14:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1hudku-0006pt-KW
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:14:34 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38491)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1hudku-0006p8-DX
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:14:32 -0400
Received: by mail-wm1-x343.google.com with SMTP id s15so51834308wmj.3
 for <qemu-devel@nongnu.org>; Mon, 05 Aug 2019 07:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LMDhWoclZ0On+7rl4/ZUIJtPMOTKUmQZ9lgwOiMn53I=;
 b=gHAYz+LjxlScFGWeJ+Au2NIs3pp+6qcA2eRjuwn9+HJFOLIyeSI00jRJoM20iLlHye
 p8UJ335Nr93NtLz/4C+k5QrLd3O+rQbX0QqazeVRXSKhH0ognVBLPMc5f5clI2bvrTip
 yUL5jHyTpx8GUJq1IhFFU3TwXjbHITClqMUljcUGFdUOcLJpFE4YWR6kw5wZOVgl2i9V
 XtQaYYK76tUbSCx+tXWOkheX8YNGPs3FvNtFxsltffB70p769Vm44pquebWZwtkOqHDy
 IuMVRBLZ5EI0mxpf8AgRL3a4OygCZT7miw5bGLvxiwWcRFoqwQfzeccnOeoXf5Qanmik
 1exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LMDhWoclZ0On+7rl4/ZUIJtPMOTKUmQZ9lgwOiMn53I=;
 b=okf5pdA5R/5XajH/Hc0ycFsWTosJ1anxIKCduhFmwl3fUoVVqimUEELVMqx/kSaj/j
 LtFvV7hG8iTLMbRjqwpyOnUoR0kHL1EvYYxCAj5Ex/l3O/RLLE9KdiVgwBg2fQ3BnDR5
 IHuXZpwtPA3II/oXBYDemVCQ9T4++PD34bw4pRwMbwz8U+dG3wFl25Uub5KMVxa7Qb00
 npc4SFxB/sOKDudJj6G5LLBGGdhnT++OJpsRl8AkTm694/Zw1Nm8AkgGDZLcnYMN4Gdx
 2stYwNB/pzne/oet820W+BvsOJydYP/iuNOs402QW0XtibfVVy+fnN0atjz4wXenI8ub
 Ao/Q==
X-Gm-Message-State: APjAAAX1jTmLbzvJiHoLPZZ3Am1DwLPaHZBlYBUa00l8arUA9sR3l4cr
 +OIl/RnvVoBC68/viseem80cqAM5qNNnKKW8
X-Google-Smtp-Source: APXvYqzUB4OsCbkDcIvnYvwmljgtXcvimdSEvtwqBTKuRCKmMV8gCgevsxeOVpDSA05at2PiBaxNrQ==
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr18661513wmh.3.1565014470833; 
 Mon, 05 Aug 2019 07:14:30 -0700 (PDT)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-182-81-63.red.bezeqint.net. [79.182.81.63])
 by smtp.gmail.com with ESMTPSA id v23sm75256211wmj.32.2019.08.05.07.14.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 07:14:30 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 17:14:07 +0300
Message-Id: <20190805141408.89268-8-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20190805141408.89268-1-mrolnik@gmail.com>
References: <20190805141408.89268-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH for 4.2 v28 7/8] target/avr: Register AVR
 support with the rest of QEMU, the build system, and the MAINTAINERS file
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
Cc: thuth@redhat.com, dovgaluk@ispras.ru, richard.henderson@linaro.org,
 Michael Rolnik <mrolnik@gmail.com>, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 MAINTAINERS                     |  6 ++++++
 arch_init.c                     |  2 ++
 configure                       |  7 +++++++
 default-configs/avr-softmmu.mak |  5 +++++
 include/disas/dis-asm.h         |  6 ++++++
 include/sysemu/arch_init.h      |  1 +
 qapi/common.json                |  3 ++-
 target/avr/Makefile.objs        | 33 +++++++++++++++++++++++++++++++++
 tests/machine-none-test.c       |  1 +
 9 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 default-configs/avr-softmmu.mak
 create mode 100644 target/avr/Makefile.objs

diff --git a/MAINTAINERS b/MAINTAINERS
index d6de200453..95febcff27 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -163,6 +163,12 @@ S: Maintained
 F: hw/arm/smmu*
 F: include/hw/arm/smmu*
 
+AVR TCG CPUs
+M: Michael Rolnik <mrolnik@gmail.com>
+S: Maintained
+F: target/avr/
+F: hw/avr/
+
 CRIS TCG CPUs
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
diff --git a/arch_init.c b/arch_init.c
index 74b0708634..413ad7acfd 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -85,6 +85,8 @@ int graphic_depth = 32;
 #define QEMU_ARCH QEMU_ARCH_UNICORE32
 #elif defined(TARGET_XTENSA)
 #define QEMU_ARCH QEMU_ARCH_XTENSA
+#elif defined(TARGET_AVR)
+#define QEMU_ARCH QEMU_ARCH_AVR
 #endif
 
 const uint32_t arch_type = QEMU_ARCH;
diff --git a/configure b/configure
index 714e7fb6a1..57fc6a683c 100755
--- a/configure
+++ b/configure
@@ -7510,6 +7510,10 @@ case "$target_name" in
     target_compiler=$cross_cc_aarch64
     eval "target_compiler_cflags=\$cross_cc_cflags_${target_name}"
   ;;
+  avr)
+	gdb_xml_files="avr-cpu.xml"
+    target_compiler=$cross_cc_avr
+  ;;
   cris)
     target_compiler=$cross_cc_cris
   ;;
@@ -7787,6 +7791,9 @@ for i in $ARCH $TARGET_BASE_ARCH ; do
       disas_config "ARM_A64"
     fi
   ;;
+  avr)
+    disas_config "AVR"
+  ;;
   cris)
     disas_config "CRIS"
   ;;
diff --git a/default-configs/avr-softmmu.mak b/default-configs/avr-softmmu.mak
new file mode 100644
index 0000000000..d1e1c28118
--- /dev/null
+++ b/default-configs/avr-softmmu.mak
@@ -0,0 +1,5 @@
+# Default configuration for avr-softmmu
+
+# Boards:
+#
+CONFIG_AVR_SAMPLE=y
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index e9c7dd8eb4..8bedce17ac 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -211,6 +211,12 @@ enum bfd_architecture
 #define bfd_mach_m32r          0  /* backwards compatibility */
   bfd_arch_mn10200,    /* Matsushita MN10200 */
   bfd_arch_mn10300,    /* Matsushita MN10300 */
+  bfd_arch_avr,       /* Atmel AVR microcontrollers.  */
+#define bfd_mach_avr1          1
+#define bfd_mach_avr2          2
+#define bfd_mach_avr3          3
+#define bfd_mach_avr4          4
+#define bfd_mach_avr5          5
   bfd_arch_cris,       /* Axis CRIS */
 #define bfd_mach_cris_v0_v10   255
 #define bfd_mach_cris_v32      32
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 10cbafe970..aff57bfe61 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -25,6 +25,7 @@ enum {
     QEMU_ARCH_NIOS2 = (1 << 17),
     QEMU_ARCH_HPPA = (1 << 18),
     QEMU_ARCH_RISCV = (1 << 19),
+    QEMU_ARCH_AVR = (1 << 20),
 };
 
 extern const uint32_t arch_type;
diff --git a/qapi/common.json b/qapi/common.json
index 99d313ef3b..2b2e0de0af 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -183,11 +183,12 @@
 #        is true even for "qemu-system-x86_64".
 #
 # ppcemb: dropped in 3.1
+# avr: added in 4.2
 #
 # Since: 3.0
 ##
 { 'enum' : 'SysEmuTarget',
-  'data' : [ 'aarch64', 'alpha', 'arm', 'cris', 'hppa', 'i386', 'lm32',
+  'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'cris', 'hppa', 'i386', 'lm32',
              'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
              'mips64el', 'mipsel', 'moxie', 'nios2', 'or1k', 'ppc',
              'ppc64', 'riscv32', 'riscv64', 's390x', 'sh4',
diff --git a/target/avr/Makefile.objs b/target/avr/Makefile.objs
new file mode 100644
index 0000000000..2976affd95
--- /dev/null
+++ b/target/avr/Makefile.objs
@@ -0,0 +1,33 @@
+#
+#  QEMU AVR CPU
+#
+#  Copyright (c) 2019 Michael Rolnik
+#
+#  This library is free software; you can redistribute it and/or
+#  modify it under the terms of the GNU Lesser General Public
+#  License as published by the Free Software Foundation; either
+#  version 2.1 of the License, or (at your option) any later version.
+#
+#  This library is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+#  Lesser General Public License for more details.
+#
+#  You should have received a copy of the GNU Lesser General Public
+#  License along with this library; if not, see
+#  <http://www.gnu.org/licenses/lgpl-2.1.html>
+#
+
+DECODETREE = $(SRC_PATH)/scripts/decodetree.py
+decode-y = $(SRC_PATH)/target/avr/insn.decode
+
+target/avr/decode_insn.inc.c: $(decode-y) $(DECODETREE)
+	$(call quiet-command, \
+	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn --insnwidth 16 $<, \
+	  "GEN", $(TARGET_DIR)$@)
+
+target/avr/translate.o: target/avr/decode_insn.inc.c
+
+obj-y += translate.o cpu.o helper.o
+obj-y += gdbstub.o
+obj-$(CONFIG_SOFTMMU) += machine.o
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 5953d31755..3e5c74e73e 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -27,6 +27,7 @@ static struct arch2cpu cpus_map[] = {
     /* tested targets list */
     { "arm", "cortex-a15" },
     { "aarch64", "cortex-a57" },
+    { "avr", "avr6-avr-cpu" },
     { "x86_64", "qemu64,apic-id=0" },
     { "i386", "qemu32,apic-id=0" },
     { "alpha", "ev67" },
-- 
2.17.2 (Apple Git-113)


