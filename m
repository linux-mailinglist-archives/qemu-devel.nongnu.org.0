Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4C83ACC7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 04:06:14 +0200 (CEST)
Received: from localhost ([::1]:39624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ha9hL-0008El-GH
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 22:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52892)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1ha9dn-0005ix-RI
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:02:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ha9di-0001aL-Nv
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:02:31 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41955)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ha9di-0001Za-BP
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:02:26 -0400
Received: by mail-pf1-x441.google.com with SMTP id m30so3804935pff.8
 for <qemu-devel@nongnu.org>; Sun, 09 Jun 2019 19:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PgVLmIPurmoMLUq3jAEaHsupw3/lbJG3qz8+sJW5vNE=;
 b=jBBb15975R7eyxMIg5BBAaZOLtcgyjXVWKgMt4cZwA4giQOA/Dktpcxx2voWUwdh27
 WCQY+V4pUKcr6otkVaoLsAYwWrvgv4blfpfQYkhnwG9iHPgjmcL8nYXxRPGBX/mTBSIQ
 yU2u0DES51LSGK7deC/N68CDxqaOk/x6q5xLPgZYroKuKEs0bvuPjicZibTE9OC+i0Kd
 ajr3drZRcBm8vQUSJtvqTTbVZemQuJOwqJeonPvLEBilLUz9aWzyWRX+5Ib+CX0Zi1eb
 UVxXjumO36qo/lz3h9JEd7p9X/tY8kcqoF8HWNJwcrfRDGj/M7t/j1BuCj6CeVJHmdkZ
 rM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PgVLmIPurmoMLUq3jAEaHsupw3/lbJG3qz8+sJW5vNE=;
 b=qadTxOW7YQ65AcvEqu/8GmfeyAMlzBaC2rmFeMchFjl7JONpQ5ejm84exZiqAGxncj
 7X0OAGwpH8o5ygPYWQnqRvp0IerAsuujZJP+JpKaKjOovQQVouna4o/a0VDJhDYNkhqm
 b0i/2FatunQvlbn/cy8qlh0gwrp73NhP6VWX3bi0iI2XTITXGn/uQhECokmtqHv07hj9
 3uzF9ziG88jV7S4+rl2AZCO/hibGtwm02W2Yu8IIFSEvqOnjnOJyPuDhA2CIeAlJ/qCU
 IBWKSSeUEBsuqq7YKTKmWQu6P6c5adasYIPqzgWNkGeTPJxAGCi7f34/Ny7kDiVjP7O2
 fLwA==
X-Gm-Message-State: APjAAAXLeLxXWUG+n2YnULZ+g4s4DxBYcd+erG8EVSZh4W0S6+wugLkV
 pDxt/yIz37xtAfbyyk1JI1pwCutcZTs=
X-Google-Smtp-Source: APXvYqzhXwlEYmVHJ5D+efxfofqiU7W9+JJ7Z2mmcvonYje5GMSBjVUh1ug/em3vwaIVh8rn64acFA==
X-Received: by 2002:a63:81c6:: with SMTP id
 t189mr13373661pgd.293.1560132143754; 
 Sun, 09 Jun 2019 19:02:23 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
 [97.113.13.231])
 by smtp.gmail.com with ESMTPSA id l63sm9749013pfl.181.2019.06.09.19.02.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Jun 2019 19:02:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun,  9 Jun 2019 19:01:41 -0700
Message-Id: <20190610020218.9228-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610020218.9228-1-richard.henderson@linaro.org>
References: <20190610020218.9228-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PULL 02/39] tcg: Split out target/arch/cpu-param.h
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For all targets, into this new file move TARGET_LONG_BITS,
TARGET_PAGE_BITS, TARGET_PHYS_ADDR_SPACE_BITS,
TARGET_VIRT_ADDR_SPACE_BITS, and NB_MMU_MODES.

Include this new file from exec/cpu-defs.h.

This now removes the somewhat odd requirement that target/arch/cpu.h
defines TARGET_LONG_BITS before including exec/cpu-defs.h, so push the
bulk of the includes within target/arch/cpu.h to the top.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h       | 22 +++++++++++++++++-
 target/alpha/cpu-param.h      | 31 ++++++++++++++++++++++++++
 target/alpha/cpu.h            | 23 +------------------
 target/arm/cpu-param.h        | 34 ++++++++++++++++++++++++++++
 target/arm/cpu.h              | 33 +++------------------------
 target/cris/cpu-param.h       | 17 ++++++++++++++
 target/cris/cpu.h             | 11 +--------
 target/hppa/cpu-param.h       | 34 ++++++++++++++++++++++++++++
 target/hppa/cpu.h             | 24 +-------------------
 target/i386/cpu-param.h       | 28 +++++++++++++++++++++++
 target/i386/cpu.h             | 21 ------------------
 target/lm32/cpu-param.h       | 17 ++++++++++++++
 target/lm32/cpu.h             | 12 +++-------
 target/m68k/cpu-param.h       | 22 ++++++++++++++++++
 target/m68k/cpu.h             | 16 ++-----------
 target/microblaze/cpu-param.h | 18 +++++++++++++++
 target/microblaze/cpu.h       | 14 ++----------
 target/mips/cpu-param.h       | 29 ++++++++++++++++++++++++
 target/mips/cpu.h             |  3 +--
 target/mips/mips-defs.h       | 15 -------------
 target/moxie/cpu-param.h      | 17 ++++++++++++++
 target/moxie/cpu.h            | 12 +---------
 target/nios2/cpu-param.h      | 21 ++++++++++++++++++
 target/nios2/cpu.h            | 17 ++------------
 target/openrisc/cpu-param.h   | 17 ++++++++++++++
 target/openrisc/cpu.h         | 14 +++---------
 target/ppc/cpu-param.h        | 37 ++++++++++++++++++++++++++++++
 target/ppc/cpu.h              | 42 ++++-------------------------------
 target/riscv/cpu-param.h      | 23 +++++++++++++++++++
 target/riscv/cpu.h            | 21 ++++--------------
 target/s390x/cpu-param.h      | 17 ++++++++++++++
 target/s390x/cpu.h            | 11 +--------
 target/sh4/cpu-param.h        | 21 ++++++++++++++++++
 target/sh4/cpu.h              | 14 +-----------
 target/sparc/cpu-param.h      | 28 +++++++++++++++++++++++
 target/sparc/cpu.h            | 20 ++---------------
 target/tilegx/cpu-param.h     | 17 ++++++++++++++
 target/tilegx/cpu.h           |  9 +-------
 target/tricore/cpu-param.h    | 17 ++++++++++++++
 target/tricore/cpu.h          |  4 +---
 target/tricore/tricore-defs.h |  5 -----
 target/unicore32/cpu-param.h  | 17 ++++++++++++++
 target/unicore32/cpu.h        | 10 +--------
 target/xtensa/cpu-param.h     | 21 ++++++++++++++++++
 target/xtensa/cpu.h           | 21 +++++-------------
 45 files changed, 544 insertions(+), 333 deletions(-)
 create mode 100644 target/alpha/cpu-param.h
 create mode 100644 target/arm/cpu-param.h
 create mode 100644 target/cris/cpu-param.h
 create mode 100644 target/hppa/cpu-param.h
 create mode 100644 target/i386/cpu-param.h
 create mode 100644 target/lm32/cpu-param.h
 create mode 100644 target/m68k/cpu-param.h
 create mode 100644 target/microblaze/cpu-param.h
 create mode 100644 target/mips/cpu-param.h
 create mode 100644 target/moxie/cpu-param.h
 create mode 100644 target/nios2/cpu-param.h
 create mode 100644 target/openrisc/cpu-param.h
 create mode 100644 target/ppc/cpu-param.h
 create mode 100644 target/riscv/cpu-param.h
 create mode 100644 target/s390x/cpu-param.h
 create mode 100644 target/sh4/cpu-param.h
 create mode 100644 target/sparc/cpu-param.h
 create mode 100644 target/tilegx/cpu-param.h
 create mode 100644 target/tricore/cpu-param.h
 create mode 100644 target/unicore32/cpu-param.h
 create mode 100644 target/xtensa/cpu-param.h

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 52d150aaf1..2694481769 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -34,8 +34,28 @@
 #endif
 #include "exec/memattrs.h"
 
+#include "cpu-param.h"
+
 #ifndef TARGET_LONG_BITS
-#error TARGET_LONG_BITS must be defined before including this header
+# error TARGET_LONG_BITS must be defined in cpu-param.h
+#endif
+#ifndef NB_MMU_MODES
+# error NB_MMU_MODES must be defined in cpu-param.h
+#endif
+#ifndef TARGET_PHYS_ADDR_SPACE_BITS
+# error TARGET_PHYS_ADDR_SPACE_BITS must be defined in cpu-param.h
+#endif
+#ifndef TARGET_VIRT_ADDR_SPACE_BITS
+# error TARGET_VIRT_ADDR_SPACE_BITS must be defined in cpu-param.h
+#endif
+#ifndef TARGET_PAGE_BITS
+# ifdef TARGET_PAGE_BITS_VARY
+#  ifndef TARGET_PAGE_BITS_MIN
+#   error TARGET_PAGE_BITS_MIN must be defined in cpu-param.h
+#  endif
+# else
+#  error TARGET_PAGE_BITS must be defined in cpu-param.h
+# endif
 #endif
 
 #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
diff --git a/target/alpha/cpu-param.h b/target/alpha/cpu-param.h
new file mode 100644
index 0000000000..692aee27ca
--- /dev/null
+++ b/target/alpha/cpu-param.h
@@ -0,0 +1,31 @@
+/*
+ * Alpha cpu parameters for qemu.
+ *
+ * Copyright (c) 2007 Jocelyn Mayer
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef ALPHA_CPU_PARAM_H
+#define ALPHA_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 64
+#define TARGET_PAGE_BITS 13
+#ifdef CONFIG_USER_ONLY
+/*
+ * ??? The kernel likes to give addresses in high memory.  If the host has
+ * more virtual address space than the guest, this can lead to impossible
+ * allocations.  Honor the long-standing assumption that only kernel addrs
+ * are negative, but otherwise allow allocations anywhere.  This could lead
+ * to tricky emulation problems for programs doing tagged addressing, but
+ * that's far fewer than encounter the impossible allocation problem.
+ */
+#define TARGET_PHYS_ADDR_SPACE_BITS  63
+#define TARGET_VIRT_ADDR_SPACE_BITS  63
+#else
+/* ??? EV4 has 34 phys addr bits, EV5 has 40, EV6 has 44.  */
+#define TARGET_PHYS_ADDR_SPACE_BITS  44
+#define TARGET_VIRT_ADDR_SPACE_BITS  (30 + TARGET_PAGE_BITS)
+#endif
+#define NB_MMU_MODES 3
+
+#endif
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index ba6bc31b15..dc1883f0f1 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -22,8 +22,8 @@
 
 #include "qemu-common.h"
 #include "cpu-qom.h"
+#include "exec/cpu-defs.h"
 
-#define TARGET_LONG_BITS 64
 #define ALIGNED_ONLY
 
 #define CPUArchState struct CPUAlphaState
@@ -31,28 +31,9 @@
 /* Alpha processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
 
-#include "exec/cpu-defs.h"
-
 #define ICACHE_LINE_SIZE 32
 #define DCACHE_LINE_SIZE 32
 
-#define TARGET_PAGE_BITS 13
-
-#ifdef CONFIG_USER_ONLY
-/* ??? The kernel likes to give addresses in high memory.  If the host has
-   more virtual address space than the guest, this can lead to impossible
-   allocations.  Honor the long-standing assumption that only kernel addrs
-   are negative, but otherwise allow allocations anywhere.  This could lead
-   to tricky emulation problems for programs doing tagged addressing, but
-   that's far fewer than encounter the impossible allocation problem.  */
-#define TARGET_PHYS_ADDR_SPACE_BITS  63
-#define TARGET_VIRT_ADDR_SPACE_BITS  63
-#else
-/* ??? EV4 has 34 phys addr bits, EV5 has 40, EV6 has 44.  */
-#define TARGET_PHYS_ADDR_SPACE_BITS  44
-#define TARGET_VIRT_ADDR_SPACE_BITS  (30 + TARGET_PAGE_BITS)
-#endif
-
 /* Alpha major type */
 enum {
     ALPHA_EV3  = 1,
@@ -217,8 +198,6 @@ enum {
    PALcode cheats and usees the KSEG mapping for its code+data rather than
    physical addresses.  */
 
-#define NB_MMU_MODES 3
-
 #define MMU_MODE0_SUFFIX _kernel
 #define MMU_MODE1_SUFFIX _user
 #define MMU_KERNEL_IDX   0
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
new file mode 100644
index 0000000000..6e6948e960
--- /dev/null
+++ b/target/arm/cpu-param.h
@@ -0,0 +1,34 @@
+/*
+ * ARM cpu parameters for qemu.
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef ARM_CPU_PARAM_H
+#define ARM_CPU_PARAM_H 1
+
+#ifdef TARGET_AARCH64
+# define TARGET_LONG_BITS             64
+# define TARGET_PHYS_ADDR_SPACE_BITS  48
+# define TARGET_VIRT_ADDR_SPACE_BITS  48
+#else
+# define TARGET_LONG_BITS             32
+# define TARGET_PHYS_ADDR_SPACE_BITS  40
+# define TARGET_VIRT_ADDR_SPACE_BITS  32
+#endif
+
+#ifdef CONFIG_USER_ONLY
+#define TARGET_PAGE_BITS 12
+#else
+/*
+ * ARMv7 and later CPUs have 4K pages minimum, but ARMv5 and v6
+ * have to support 1K tiny pages.
+ */
+# define TARGET_PAGE_BITS_VARY
+# define TARGET_PAGE_BITS_MIN  10
+#endif
+
+#define NB_MMU_MODES 8
+
+#endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c34207611b..f8020b4823 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -22,23 +22,15 @@
 
 #include "kvm-consts.h"
 #include "hw/registerfields.h"
-
-#if defined(TARGET_AARCH64)
-  /* AArch64 definitions */
-#  define TARGET_LONG_BITS 64
-#else
-#  define TARGET_LONG_BITS 32
-#endif
+#include "qemu-common.h"
+#include "cpu-qom.h"
+#include "exec/cpu-defs.h"
 
 /* ARM processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
 
 #define CPUArchState struct CPUARMState
 
-#include "qemu-common.h"
-#include "cpu-qom.h"
-#include "exec/cpu-defs.h"
-
 #define EXCP_UDEF            1   /* undefined instruction */
 #define EXCP_SWI             2   /* software interrupt */
 #define EXCP_PREFETCH_ABORT  3
@@ -114,7 +106,6 @@ enum {
 #define ARM_CPU_VIRQ 2
 #define ARM_CPU_VFIQ 3
 
-#define NB_MMU_MODES 8
 /* ARM-specific extra insn start words:
  * 1: Conditional execution bits
  * 2: Partial exception syndrome for data aborts
@@ -2639,24 +2630,6 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_CPUID_TI915T      0x54029152
 #define ARM_CPUID_TI925T      0x54029252
 
-#if defined(CONFIG_USER_ONLY)
-#define TARGET_PAGE_BITS 12
-#else
-/* ARMv7 and later CPUs have 4K pages minimum, but ARMv5 and v6
- * have to support 1K tiny pages.
- */
-#define TARGET_PAGE_BITS_VARY
-#define TARGET_PAGE_BITS_MIN 10
-#endif
-
-#if defined(TARGET_AARCH64)
-#  define TARGET_PHYS_ADDR_SPACE_BITS 48
-#  define TARGET_VIRT_ADDR_SPACE_BITS 48
-#else
-#  define TARGET_PHYS_ADDR_SPACE_BITS 40
-#  define TARGET_VIRT_ADDR_SPACE_BITS 32
-#endif
-
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
                                      unsigned int target_el)
 {
diff --git a/target/cris/cpu-param.h b/target/cris/cpu-param.h
new file mode 100644
index 0000000000..36a3058761
--- /dev/null
+++ b/target/cris/cpu-param.h
@@ -0,0 +1,17 @@
+/*
+ * CRIS cpu parameters for qemu.
+ *
+ * Copyright (c) 2007 AXIS Communications AB
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef CRIS_CPU_PARAM_H
+#define CRIS_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 32
+#define TARGET_PAGE_BITS 13
+#define TARGET_PHYS_ADDR_SPACE_BITS 32
+#define TARGET_VIRT_ADDR_SPACE_BITS 32
+#define NB_MMU_MODES 2
+
+#endif
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 857de79e24..25408c2bf7 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -23,13 +23,10 @@
 
 #include "qemu-common.h"
 #include "cpu-qom.h"
-
-#define TARGET_LONG_BITS 32
+#include "exec/cpu-defs.h"
 
 #define CPUArchState struct CPUCRISState
 
-#include "exec/cpu-defs.h"
-
 #define EXCP_NMI        1
 #define EXCP_GURU       2
 #define EXCP_BUSFAULT   3
@@ -105,8 +102,6 @@
 #define CC_A   14
 #define CC_P   15
 
-#define NB_MMU_MODES 2
-
 typedef struct {
     uint32_t hi;
     uint32_t lo;
@@ -260,12 +255,8 @@ enum {
 };
 
 /* CRIS uses 8k pages.  */
-#define TARGET_PAGE_BITS 13
 #define MMAP_SHIFT TARGET_PAGE_BITS
 
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-
 #define CRIS_CPU_TYPE_SUFFIX "-" TYPE_CRIS_CPU
 #define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_CRIS_CPU
diff --git a/target/hppa/cpu-param.h b/target/hppa/cpu-param.h
new file mode 100644
index 0000000000..a97d1428df
--- /dev/null
+++ b/target/hppa/cpu-param.h
@@ -0,0 +1,34 @@
+/*
+ * PA-RISC cpu parameters for qemu.
+ *
+ * Copyright (c) 2016 Richard Henderson <rth@twiddle.net>
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef HPPA_CPU_PARAM_H
+#define HPPA_CPU_PARAM_H 1
+
+#ifdef TARGET_HPPA64
+# define TARGET_LONG_BITS             64
+# define TARGET_REGISTER_BITS         64
+# define TARGET_VIRT_ADDR_SPACE_BITS  64
+# define TARGET_PHYS_ADDR_SPACE_BITS  64
+#elif defined(CONFIG_USER_ONLY)
+# define TARGET_LONG_BITS             32
+# define TARGET_REGISTER_BITS         32
+# define TARGET_VIRT_ADDR_SPACE_BITS  32
+# define TARGET_PHYS_ADDR_SPACE_BITS  32
+#else
+/*
+ * In order to form the GVA from space:offset,
+ * we need a 64-bit virtual address space.
+ */
+# define TARGET_LONG_BITS             64
+# define TARGET_REGISTER_BITS         32
+# define TARGET_VIRT_ADDR_SPACE_BITS  64
+# define TARGET_PHYS_ADDR_SPACE_BITS  32
+#endif
+#define TARGET_PAGE_BITS 12
+#define NB_MMU_MODES 5
+
+#endif
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index c1e0215e66..fb527eba88 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -22,25 +22,8 @@
 
 #include "qemu-common.h"
 #include "cpu-qom.h"
+#include "exec/cpu-defs.h"
 
-#ifdef TARGET_HPPA64
-#define TARGET_LONG_BITS            64
-#define TARGET_VIRT_ADDR_SPACE_BITS 64
-#define TARGET_REGISTER_BITS        64
-#define TARGET_PHYS_ADDR_SPACE_BITS 64
-#elif defined(CONFIG_USER_ONLY)
-#define TARGET_LONG_BITS            32
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-#define TARGET_REGISTER_BITS        32
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#else
-/* In order to form the GVA from space:offset,
-   we need a 64-bit virtual address space.  */
-#define TARGET_LONG_BITS            64
-#define TARGET_VIRT_ADDR_SPACE_BITS 64
-#define TARGET_REGISTER_BITS        32
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#endif
 
 /* PA-RISC 1.x processors have a strong memory model.  */
 /* ??? While we do not yet implement PA-RISC 2.0, those processors have
@@ -50,12 +33,7 @@
 
 #define CPUArchState struct CPUHPPAState
 
-#include "exec/cpu-defs.h"
-
-#define TARGET_PAGE_BITS 12
-
 #define ALIGNED_ONLY
-#define NB_MMU_MODES     5
 #define MMU_KERNEL_IDX   0
 #define MMU_USER_IDX     3
 #define MMU_PHYS_IDX     4
diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
new file mode 100644
index 0000000000..57abc64c0d
--- /dev/null
+++ b/target/i386/cpu-param.h
@@ -0,0 +1,28 @@
+/*
+ * i386 cpu parameters for qemu.
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef I386_CPU_PARAM_H
+#define I386_CPU_PARAM_H 1
+
+#ifdef TARGET_X86_64
+# define TARGET_LONG_BITS             64
+# define TARGET_PHYS_ADDR_SPACE_BITS  52
+/*
+ * ??? This is really 48 bits, sign-extended, but the only thing
+ * accessible to userland with bit 48 set is the VSYSCALL, and that
+ * is handled via other mechanisms.
+ */
+# define TARGET_VIRT_ADDR_SPACE_BITS  47
+#else
+# define TARGET_LONG_BITS             32
+# define TARGET_PHYS_ADDR_SPACE_BITS  36
+# define TARGET_VIRT_ADDR_SPACE_BITS  32
+#endif
+#define TARGET_PAGE_BITS 12
+#define NB_MMU_MODES 3
+
+#endif
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index bd06523a53..36f5095768 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -24,13 +24,6 @@
 #include "qemu-common.h"
 #include "cpu-qom.h"
 #include "hyperv-proto.h"
-
-#ifdef TARGET_X86_64
-#define TARGET_LONG_BITS 64
-#else
-#define TARGET_LONG_BITS 32
-#endif
-
 #include "exec/cpu-defs.h"
 
 /* The x86 has a strong memory model with some store-after-load re-ordering */
@@ -956,7 +949,6 @@ typedef struct {
 #define MAX_FIXED_COUNTERS 3
 #define MAX_GP_COUNTERS    (MSR_IA32_PERF_STATUS - MSR_P6_EVNTSEL0)
 
-#define NB_MMU_MODES 3
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
 #define NB_OPMASK_REGS 8
@@ -1695,19 +1687,6 @@ void cpu_x86_update_dr7(CPUX86State *env, uint32_t new_dr7);
 /* hw/pc.c */
 uint64_t cpu_get_tsc(CPUX86State *env);
 
-#define TARGET_PAGE_BITS 12
-
-#ifdef TARGET_X86_64
-#define TARGET_PHYS_ADDR_SPACE_BITS 52
-/* ??? This is really 48 bits, sign-extended, but the only thing
-   accessible to userland with bit 48 set is the VSYSCALL, and that
-   is handled via other mechanisms.  */
-#define TARGET_VIRT_ADDR_SPACE_BITS 47
-#else
-#define TARGET_PHYS_ADDR_SPACE_BITS 36
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-#endif
-
 /* XXX: This value should match the one returned by CPUID
  * and in exec.c */
 # if defined(TARGET_X86_64)
diff --git a/target/lm32/cpu-param.h b/target/lm32/cpu-param.h
new file mode 100644
index 0000000000..d89574ad19
--- /dev/null
+++ b/target/lm32/cpu-param.h
@@ -0,0 +1,17 @@
+/*
+ * LatticeMico32 cpu parameters for qemu.
+ *
+ * Copyright (c) 2010 Michael Walle <michael@walle.cc>
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef LM32_CPU_PARAM_H
+#define LM32_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 32
+#define TARGET_PAGE_BITS 12
+#define TARGET_PHYS_ADDR_SPACE_BITS 32
+#define TARGET_VIRT_ADDR_SPACE_BITS 32
+#define NB_MMU_MODES 1
+
+#endif
diff --git a/target/lm32/cpu.h b/target/lm32/cpu.h
index d224d4426e..e75110c4e0 100644
--- a/target/lm32/cpu.h
+++ b/target/lm32/cpu.h
@@ -20,26 +20,20 @@
 #ifndef LM32_CPU_H
 #define LM32_CPU_H
 
-#define TARGET_LONG_BITS 32
-
-#define CPUArchState struct CPULM32State
-
 #include "qemu-common.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+
+#define CPUArchState struct CPULM32State
+
 struct CPULM32State;
 typedef struct CPULM32State CPULM32State;
 
-#define NB_MMU_MODES 1
-#define TARGET_PAGE_BITS 12
 static inline int cpu_mmu_index(CPULM32State *env, bool ifetch)
 {
     return 0;
 }
 
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-
 /* Exceptions indices */
 enum {
     EXCP_RESET = 0,
diff --git a/target/m68k/cpu-param.h b/target/m68k/cpu-param.h
new file mode 100644
index 0000000000..06556dfbf3
--- /dev/null
+++ b/target/m68k/cpu-param.h
@@ -0,0 +1,22 @@
+/*
+ * m68k cpu parameters for qemu.
+ *
+ * Copyright (c) 2005-2007 CodeSourcery
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef M68K_CPU_PARAM_H
+#define M68K_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 32
+/*
+ * Coldfire Linux uses 8k pages
+ * and m68k linux uses 4k pages
+ * use the smallest one
+ */
+#define TARGET_PAGE_BITS 12
+#define TARGET_PHYS_ADDR_SPACE_BITS 32
+#define TARGET_VIRT_ADDR_SPACE_BITS 32
+#define NB_MMU_MODES 2
+
+#endif
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 9deff9e234..e99c102302 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -21,14 +21,12 @@
 #ifndef M68K_CPU_H
 #define M68K_CPU_H
 
-#define TARGET_LONG_BITS 32
-
-#define CPUArchState struct CPUM68KState
-
 #include "qemu-common.h"
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
 
+#define CPUArchState struct CPUM68KState
+
 #define OS_BYTE     0
 #define OS_WORD     1
 #define OS_LONG     2
@@ -82,7 +80,6 @@
 #define M68K_MAX_TTR 2
 #define TTR(type, index) ttr[((type & ACCESS_CODE) == ACCESS_CODE) * 2 + index]
 
-#define NB_MMU_MODES 2
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
 typedef CPU_LDoubleU FPReg;
@@ -502,12 +499,6 @@ void m68k_cpu_list(void);
 
 void register_m68k_insns (CPUM68KState *env);
 
-/* Coldfire Linux uses 8k pages
- * and m68k linux uses 4k pages
- * use the smallest one
- */
-#define TARGET_PAGE_BITS 12
-
 enum {
     /* 1 bit to define user level / supervisor access */
     ACCESS_SUPER = 0x01,
@@ -522,9 +513,6 @@ enum {
     ACCESS_DATA  = 0x20, /* Data load/store access        */
 };
 
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-
 #define M68K_CPU_TYPE_SUFFIX "-" TYPE_M68K_CPU
 #define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_M68K_CPU
diff --git a/target/microblaze/cpu-param.h b/target/microblaze/cpu-param.h
new file mode 100644
index 0000000000..4abbc62d50
--- /dev/null
+++ b/target/microblaze/cpu-param.h
@@ -0,0 +1,18 @@
+/*
+ * MicroBlaze cpu parameters for qemu.
+ *
+ * Copyright (c) 2009 Edgar E. Iglesias
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef MICROBLAZE_CPU_PARAM_H
+#define MICROBLAZE_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 64
+#define TARGET_PHYS_ADDR_SPACE_BITS 64
+#define TARGET_VIRT_ADDR_SPACE_BITS 64
+/* FIXME: MB uses variable pages down to 1K but linux only uses 4k.  */
+#define TARGET_PAGE_BITS 12
+#define NB_MMU_MODES 3
+
+#endif
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 7a9fb8f4aa..b8db8ca9a3 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -22,13 +22,11 @@
 
 #include "qemu-common.h"
 #include "cpu-qom.h"
-
-#define TARGET_LONG_BITS 64
+#include "exec/cpu-defs.h"
+#include "fpu/softfloat-types.h"
 
 #define CPUArchState struct CPUMBState
 
-#include "exec/cpu-defs.h"
-#include "fpu/softfloat-types.h"
 struct CPUMBState;
 typedef struct CPUMBState CPUMBState;
 #if !defined(CONFIG_USER_ONLY)
@@ -228,8 +226,6 @@ typedef struct CPUMBState CPUMBState;
 #define CC_NE  1
 #define CC_EQ  0
 
-#define NB_MMU_MODES    3
-
 #define STREAM_EXCEPTION (1 << 0)
 #define STREAM_ATOMIC    (1 << 1)
 #define STREAM_TEST      (1 << 2)
@@ -340,12 +336,6 @@ void mb_tcg_init(void);
 int cpu_mb_signal_handler(int host_signum, void *pinfo,
                           void *puc);
 
-/* FIXME: MB uses variable pages down to 1K but linux only uses 4k.  */
-#define TARGET_PAGE_BITS 12
-
-#define TARGET_PHYS_ADDR_SPACE_BITS 64
-#define TARGET_VIRT_ADDR_SPACE_BITS 64
-
 #define CPU_RESOLVING_TYPE TYPE_MICROBLAZE_CPU
 
 #define cpu_signal_handler cpu_mb_signal_handler
diff --git a/target/mips/cpu-param.h b/target/mips/cpu-param.h
new file mode 100644
index 0000000000..308660d29d
--- /dev/null
+++ b/target/mips/cpu-param.h
@@ -0,0 +1,29 @@
+/*
+ * MIPS cpu parameters for qemu.
+ *
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef MIPS_CPU_PARAM_H
+#define MIPS_CPU_PARAM_H 1
+
+#ifdef TARGET_MIPS64
+# define TARGET_LONG_BITS 64
+#else
+# define TARGET_LONG_BITS 32
+#endif
+#ifdef TARGET_MIPS64
+#define TARGET_PHYS_ADDR_SPACE_BITS 48
+#define TARGET_VIRT_ADDR_SPACE_BITS 48
+#else
+#define TARGET_PHYS_ADDR_SPACE_BITS 40
+# ifdef CONFIG_USER_ONLY
+#  define TARGET_VIRT_ADDR_SPACE_BITS 31
+# else
+#  define TARGET_VIRT_ADDR_SPACE_BITS 32
+#endif
+#endif
+#define TARGET_PAGE_BITS 12
+#define NB_MMU_MODES 4
+
+#endif
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 06a8ed4748..34e7aec4d0 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -7,9 +7,9 @@
 
 #include "qemu-common.h"
 #include "cpu-qom.h"
-#include "mips-defs.h"
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat.h"
+#include "mips-defs.h"
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
@@ -103,7 +103,6 @@ struct CPUMIPSFPUContext {
 #define FP_UNIMPLEMENTED  32
 };
 
-#define NB_MMU_MODES 4
 #define TARGET_INSN_START_EXTRA_WORDS 2
 
 typedef struct CPUMIPSMVPContext CPUMIPSMVPContext;
diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index dbdb4b2b2d..bbf056a548 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -5,23 +5,8 @@
 //#define USE_HOST_FLOAT_REGS
 
 /* Real pages are variable size... */
-#define TARGET_PAGE_BITS 12
 #define MIPS_TLB_MAX 128
 
-#if defined(TARGET_MIPS64)
-#define TARGET_LONG_BITS 64
-#define TARGET_PHYS_ADDR_SPACE_BITS 48
-#define TARGET_VIRT_ADDR_SPACE_BITS 48
-#else
-#define TARGET_LONG_BITS 32
-#define TARGET_PHYS_ADDR_SPACE_BITS 40
-# ifdef CONFIG_USER_ONLY
-#  define TARGET_VIRT_ADDR_SPACE_BITS 31
-# else
-#  define TARGET_VIRT_ADDR_SPACE_BITS 32
-#endif
-#endif
-
 /*
  * bit definitions for insn_flags (ISAs/ASEs flags)
  * ------------------------------------------------
diff --git a/target/moxie/cpu-param.h b/target/moxie/cpu-param.h
new file mode 100644
index 0000000000..9a40ef525c
--- /dev/null
+++ b/target/moxie/cpu-param.h
@@ -0,0 +1,17 @@
+/*
+ * Moxie cpu parameters for qemu.
+ *
+ * Copyright (c) 2008, 2010, 2013 Anthony Green
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef MOXIE_CPU_PARAM_H
+#define MOXIE_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 32
+#define TARGET_PAGE_BITS 12     /* 4k */
+#define TARGET_PHYS_ADDR_SPACE_BITS 32
+#define TARGET_VIRT_ADDR_SPACE_BITS 32
+#define NB_MMU_MODES 1
+
+#endif
diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
index a63a96bc05..7164dd7f5f 100644
--- a/target/moxie/cpu.h
+++ b/target/moxie/cpu.h
@@ -21,8 +21,7 @@
 #define MOXIE_CPU_H
 
 #include "qemu-common.h"
-
-#define TARGET_LONG_BITS 32
+#include "exec/cpu-defs.h"
 
 #define CPUArchState struct CPUMoxieState
 
@@ -33,15 +32,6 @@
 #define MOXIE_EX_MMU_MISS    4
 #define MOXIE_EX_BREAK      16
 
-#include "exec/cpu-defs.h"
-
-#define TARGET_PAGE_BITS 12     /* 4k */
-
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-
-#define NB_MMU_MODES 1
-
 typedef struct CPUMoxieState {
 
     uint32_t flags;               /* general execution flags */
diff --git a/target/nios2/cpu-param.h b/target/nios2/cpu-param.h
new file mode 100644
index 0000000000..38bedbfd61
--- /dev/null
+++ b/target/nios2/cpu-param.h
@@ -0,0 +1,21 @@
+/*
+ * Altera Nios II cpu parameters for qemu.
+ *
+ * Copyright (c) 2012 Chris Wulff <crwulff@gmail.com>
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef NIOS2_CPU_PARAM_H
+#define NIOS2_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 32
+#define TARGET_PAGE_BITS 12
+#define TARGET_PHYS_ADDR_SPACE_BITS 32
+#ifdef CONFIG_USER_ONLY
+# define TARGET_VIRT_ADDR_SPACE_BITS 31
+#else
+# define TARGET_VIRT_ADDR_SPACE_BITS 32
+#endif
+#define NB_MMU_MODES 2
+
+#endif
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 35d3886dc2..c4ccea9cf0 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -22,13 +22,11 @@
 #define NIOS2_CPU_H
 
 #include "qemu-common.h"
-
-#define TARGET_LONG_BITS 32
+#include "exec/cpu-defs.h"
+#include "qom/cpu.h"
 
 #define CPUArchState struct CPUNios2State
 
-#include "exec/cpu-defs.h"
-#include "qom/cpu.h"
 struct CPUNios2State;
 typedef struct CPUNios2State CPUNios2State;
 #if !defined(CONFIG_USER_ONLY)
@@ -164,8 +162,6 @@ typedef struct Nios2CPUClass {
 
 #define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
 
-#define NB_MMU_MODES 2
-
 struct CPUNios2State {
     uint32_t regs[NUM_CORE_REGS];
 
@@ -225,13 +221,6 @@ void nios2_check_interrupts(CPUNios2State *env);
 
 void do_nios2_semihosting(CPUNios2State *env);
 
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#ifdef CONFIG_USER_ONLY
-# define TARGET_VIRT_ADDR_SPACE_BITS 31
-#else
-# define TARGET_VIRT_ADDR_SPACE_BITS 32
-#endif
-
 #define CPU_RESOLVING_TYPE TYPE_NIOS2_CPU
 
 #define cpu_gen_code cpu_nios2_gen_code
@@ -239,8 +228,6 @@ void do_nios2_semihosting(CPUNios2State *env);
 
 #define CPU_SAVE_VERSION 1
 
-#define TARGET_PAGE_BITS 12
-
 /* MMU modes definitions */
 #define MMU_MODE0_SUFFIX _kernel
 #define MMU_MODE1_SUFFIX _user
diff --git a/target/openrisc/cpu-param.h b/target/openrisc/cpu-param.h
new file mode 100644
index 0000000000..06ee64d171
--- /dev/null
+++ b/target/openrisc/cpu-param.h
@@ -0,0 +1,17 @@
+/*
+ * OpenRISC cpu parameters for qemu.
+ *
+ * Copyright (c) 2011-2012 Jia Liu <proljc@gmail.com>
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef OPENRISC_CPU_PARAM_H
+#define OPENRISC_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 32
+#define TARGET_PAGE_BITS 13
+#define TARGET_PHYS_ADDR_SPACE_BITS 32
+#define TARGET_VIRT_ADDR_SPACE_BITS 32
+#define NB_MMU_MODES 3
+
+#endif
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 9473d94d0c..3727efabf3 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -20,17 +20,15 @@
 #ifndef OPENRISC_CPU_H
 #define OPENRISC_CPU_H
 
-#define TARGET_LONG_BITS 32
+#include "qemu-common.h"
+#include "exec/cpu-defs.h"
+#include "qom/cpu.h"
 
 #define CPUArchState struct CPUOpenRISCState
 
 /* cpu_openrisc_map_address_* in CPUOpenRISCTLBContext need this decl.  */
 struct OpenRISCCPU;
 
-#include "qemu-common.h"
-#include "exec/cpu-defs.h"
-#include "qom/cpu.h"
-
 #define TYPE_OPENRISC_CPU "or1k-cpu"
 
 #define OPENRISC_CPU_CLASS(klass) \
@@ -56,7 +54,6 @@ typedef struct OpenRISCCPUClass {
     void (*parent_reset)(CPUState *cpu);
 } OpenRISCCPUClass;
 
-#define NB_MMU_MODES    3
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
 enum {
@@ -65,11 +62,6 @@ enum {
     MMU_USER_IDX = 2,
 };
 
-#define TARGET_PAGE_BITS 13
-
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-
 #define SET_FP_CAUSE(reg, v)    do {\
                                     (reg) = ((reg) & ~(0x3f << 12)) | \
                                             ((v & 0x3f) << 12);\
diff --git a/target/ppc/cpu-param.h b/target/ppc/cpu-param.h
new file mode 100644
index 0000000000..37b458d33d
--- /dev/null
+++ b/target/ppc/cpu-param.h
@@ -0,0 +1,37 @@
+/*
+ * PowerPC cpu parameters for qemu.
+ *
+ * Copyright (c) 2007 Jocelyn Mayer
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef PPC_CPU_PARAM_H
+#define PPC_CPU_PARAM_H 1
+
+#ifdef TARGET_PPC64
+# define TARGET_LONG_BITS 64
+/*
+ * Note that the official physical address space bits is 62-M where M
+ * is implementation dependent.  I've not looked up M for the set of
+ * cpus we emulate at the system level.
+ */
+#define TARGET_PHYS_ADDR_SPACE_BITS 62
+/*
+ * Note that the PPC environment architecture talks about 80 bit virtual
+ * addresses, with segmentation.  Obviously that's not all visible to a
+ * single process, which is all we're concerned with here.
+ */
+# ifdef TARGET_ABI32
+#  define TARGET_VIRT_ADDR_SPACE_BITS 32
+# else
+#  define TARGET_VIRT_ADDR_SPACE_BITS 64
+# endif
+#else
+# define TARGET_LONG_BITS 32
+# define TARGET_PHYS_ADDR_SPACE_BITS 36
+# define TARGET_VIRT_ADDR_SPACE_BITS 32
+#endif
+#define TARGET_PAGE_BITS 12
+#define NB_MMU_MODES 10
+
+#endif
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index d7f23ad5e0..02ca453df3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -22,53 +22,20 @@
 
 #include "qemu-common.h"
 #include "qemu/int128.h"
+#include "exec/cpu-defs.h"
+#include "cpu-qom.h"
+#include "exec/cpu-defs.h"
+#include "cpu-qom.h"
 
 /* #define PPC_EMULATE_32BITS_HYPV */
 
-#if defined(TARGET_PPC64)
-/* PowerPC 64 definitions */
-#define TARGET_LONG_BITS 64
-#define TARGET_PAGE_BITS 12
-
 #define TCG_GUEST_DEFAULT_MO 0
 
-/*
- * Note that the official physical address space bits is 62-M where M
- * is implementation dependent.  I've not looked up M for the set of
- * cpus we emulate at the system level.
- */
-#define TARGET_PHYS_ADDR_SPACE_BITS 62
-
-/*
- * Note that the PPC environment architecture talks about 80 bit
- * virtual addresses, with segmentation.  Obviously that's not all
- * visible to a single process, which is all we're concerned with
- * here.
- */
-#ifdef TARGET_ABI32
-# define TARGET_VIRT_ADDR_SPACE_BITS 32
-#else
-# define TARGET_VIRT_ADDR_SPACE_BITS 64
-#endif
-
 #define TARGET_PAGE_BITS_64K 16
 #define TARGET_PAGE_BITS_16M 24
 
-#else /* defined(TARGET_PPC64) */
-/* PowerPC 32 definitions */
-#define TARGET_LONG_BITS 32
-#define TARGET_PAGE_BITS 12
-
-#define TARGET_PHYS_ADDR_SPACE_BITS 36
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-
-#endif /* defined(TARGET_PPC64) */
-
 #define CPUArchState struct CPUPPCState
 
-#include "exec/cpu-defs.h"
-#include "cpu-qom.h"
-
 #if defined(TARGET_PPC64)
 #define PPC_ELF_MACHINE     EM_PPC64
 #else
@@ -974,7 +941,6 @@ struct ppc_radix_page_info {
  * + real/paged mode combinations. The other two modes are for
  * external PID load/store.
  */
-#define NB_MMU_MODES    10
 #define MMU_MODE8_SUFFIX _epl
 #define MMU_MODE9_SUFFIX _eps
 #define PPC_TLB_EPID_LOAD 8
diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
new file mode 100644
index 0000000000..664fc1d371
--- /dev/null
+++ b/target/riscv/cpu-param.h
@@ -0,0 +1,23 @@
+/*
+ * RISC-V cpu parameters for qemu.
+ *
+ * Copyright (c) 2017-2018 SiFive, Inc.
+ * SPDX-License-Identifier: GPL-2.0+
+ */
+
+#ifndef RISCV_CPU_PARAM_H
+#define RISCV_CPU_PARAM_H 1
+
+#if defined(TARGET_RISCV64)
+# define TARGET_LONG_BITS 64
+# define TARGET_PHYS_ADDR_SPACE_BITS 56 /* 44-bit PPN */
+# define TARGET_VIRT_ADDR_SPACE_BITS 48 /* sv48 */
+#elif defined(TARGET_RISCV32)
+# define TARGET_LONG_BITS 32
+# define TARGET_PHYS_ADDR_SPACE_BITS 34 /* 22-bit PPN */
+# define TARGET_VIRT_ADDR_SPACE_BITS 32 /* sv32 */
+#endif
+#define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
+#define NB_MMU_MODES 4
+
+#endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 74e726c1c9..bc517dbad8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -20,27 +20,15 @@
 #ifndef RISCV_CPU_H
 #define RISCV_CPU_H
 
-/* QEMU addressing/paging config */
-#define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
-#if defined(TARGET_RISCV64)
-#define TARGET_LONG_BITS 64
-#define TARGET_PHYS_ADDR_SPACE_BITS 56 /* 44-bit PPN */
-#define TARGET_VIRT_ADDR_SPACE_BITS 48 /* sv48 */
-#elif defined(TARGET_RISCV32)
-#define TARGET_LONG_BITS 32
-#define TARGET_PHYS_ADDR_SPACE_BITS 34 /* 22-bit PPN */
-#define TARGET_VIRT_ADDR_SPACE_BITS 32 /* sv32 */
-#endif
-
-#define TCG_GUEST_DEFAULT_MO 0
-
-#define CPUArchState struct CPURISCVState
-
 #include "qemu-common.h"
 #include "qom/cpu.h"
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat.h"
 
+#define TCG_GUEST_DEFAULT_MO 0
+
+#define CPUArchState struct CPURISCVState
+
 #define TYPE_RISCV_CPU "riscv-cpu"
 
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
@@ -98,7 +86,6 @@ enum {
 
 #define TRANSLATE_FAIL 1
 #define TRANSLATE_SUCCESS 0
-#define NB_MMU_MODES 4
 #define MMU_USER_IDX 3
 
 #define MAX_RISCV_PMPS (16)
diff --git a/target/s390x/cpu-param.h b/target/s390x/cpu-param.h
new file mode 100644
index 0000000000..472db648d7
--- /dev/null
+++ b/target/s390x/cpu-param.h
@@ -0,0 +1,17 @@
+/*
+ * S/390 cpu parameters for qemu.
+ *
+ * Copyright (c) 2009 Ulrich Hecht
+ * SPDX-License-Identifier: GPL-2.0+
+ */
+
+#ifndef S390_CPU_PARAM_H
+#define S390_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 64
+#define TARGET_PAGE_BITS 12
+#define TARGET_PHYS_ADDR_SPACE_BITS 64
+#define TARGET_VIRT_ADDR_SPACE_BITS 64
+#define NB_MMU_MODES 4
+
+#endif
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 4fc08a2c88..1577252e72 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -24,26 +24,17 @@
 #include "qemu-common.h"
 #include "cpu-qom.h"
 #include "cpu_models.h"
-
-#define TARGET_LONG_BITS 64
+#include "exec/cpu-defs.h"
 
 #define ELF_MACHINE_UNAME "S390X"
 
 #define CPUArchState struct CPUS390XState
 
-#include "exec/cpu-defs.h"
-
 /* The z/Architecture has a strong memory model with some store-after-load re-ordering */
 #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
-#define TARGET_PAGE_BITS 12
-
-#define TARGET_PHYS_ADDR_SPACE_BITS 64
-#define TARGET_VIRT_ADDR_SPACE_BITS 64
-
 #include "exec/cpu-all.h"
 
-#define NB_MMU_MODES 4
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
 #define MMU_MODE0_SUFFIX _primary
diff --git a/target/sh4/cpu-param.h b/target/sh4/cpu-param.h
new file mode 100644
index 0000000000..81ace3503b
--- /dev/null
+++ b/target/sh4/cpu-param.h
@@ -0,0 +1,21 @@
+/*
+ * SH4 cpu parameters for qemu.
+ *
+ * Copyright (c) 2005 Samuel Tardieu
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef SH4_CPU_PARAM_H
+#define SH4_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 32
+#define TARGET_PAGE_BITS 12  /* 4k */
+#define TARGET_PHYS_ADDR_SPACE_BITS  32
+#ifdef CONFIG_USER_ONLY
+# define TARGET_VIRT_ADDR_SPACE_BITS 31
+#else
+# define TARGET_VIRT_ADDR_SPACE_BITS 32
+#endif
+#define NB_MMU_MODES 2
+
+#endif
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 547194aac7..7af6ff5d57 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -22,8 +22,8 @@
 
 #include "qemu-common.h"
 #include "cpu-qom.h"
+#include "exec/cpu-defs.h"
 
-#define TARGET_LONG_BITS 32
 #define ALIGNED_ONLY
 
 /* CPU Subtypes */
@@ -38,17 +38,6 @@
 
 #define CPUArchState struct CPUSH4State
 
-#include "exec/cpu-defs.h"
-
-#define TARGET_PAGE_BITS 12	/* 4k XXXXX */
-
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#ifdef CONFIG_USER_ONLY
-# define TARGET_VIRT_ADDR_SPACE_BITS 31
-#else
-# define TARGET_VIRT_ADDR_SPACE_BITS 32
-#endif
-
 #define SR_MD 30
 #define SR_RB 29
 #define SR_BL 28
@@ -132,7 +121,6 @@ typedef struct tlb_t {
 #define UTLB_SIZE 64
 #define ITLB_SIZE 4
 
-#define NB_MMU_MODES 2
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
 enum sh_features {
diff --git a/target/sparc/cpu-param.h b/target/sparc/cpu-param.h
new file mode 100644
index 0000000000..4746d89411
--- /dev/null
+++ b/target/sparc/cpu-param.h
@@ -0,0 +1,28 @@
+/*
+ * Sparc cpu parameters for qemu.
+ *
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef SPARC_CPU_PARAM_H
+#define SPARC_CPU_PARAM_H 1
+
+#ifdef TARGET_SPARC64
+# define TARGET_LONG_BITS 64
+# define TARGET_PAGE_BITS 13 /* 8k */
+# define TARGET_PHYS_ADDR_SPACE_BITS  41
+# ifdef TARGET_ABI32
+#  define TARGET_VIRT_ADDR_SPACE_BITS 32
+# else
+#  define TARGET_VIRT_ADDR_SPACE_BITS 44
+# endif
+# define NB_MMU_MODES 6
+#else
+# define TARGET_LONG_BITS 32
+# define TARGET_PAGE_BITS 12 /* 4k */
+# define TARGET_PHYS_ADDR_SPACE_BITS 36
+# define TARGET_VIRT_ADDR_SPACE_BITS 32
+# define NB_MMU_MODES 3
+#endif
+
+#endif
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index f31e8535df..bcfdf513cf 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -4,31 +4,18 @@
 #include "qemu-common.h"
 #include "qemu/bswap.h"
 #include "cpu-qom.h"
+#include "exec/cpu-defs.h"
 
 #define ALIGNED_ONLY
 
 #if !defined(TARGET_SPARC64)
-#define TARGET_LONG_BITS 32
 #define TARGET_DPREGS 16
-#define TARGET_PAGE_BITS 12 /* 4k */
-#define TARGET_PHYS_ADDR_SPACE_BITS 36
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
 #else
-#define TARGET_LONG_BITS 64
 #define TARGET_DPREGS 32
-#define TARGET_PAGE_BITS 13 /* 8k */
-#define TARGET_PHYS_ADDR_SPACE_BITS 41
-# ifdef TARGET_ABI32
-#  define TARGET_VIRT_ADDR_SPACE_BITS 32
-# else
-#  define TARGET_VIRT_ADDR_SPACE_BITS 44
-# endif
 #endif
 
 #define CPUArchState struct CPUSPARCState
 
-#include "exec/cpu-defs.h"
-
 /*#define EXCP_INTERRUPT 0x100*/
 
 /* trap definitions */
@@ -225,10 +212,7 @@ enum {
 #define MIN_NWINDOWS 3
 #define MAX_NWINDOWS 32
 
-#if !defined(TARGET_SPARC64)
-#define NB_MMU_MODES 3
-#else
-#define NB_MMU_MODES 6
+#ifdef TARGET_SPARC64
 typedef struct trap_state {
     uint64_t tpc;
     uint64_t tnpc;
diff --git a/target/tilegx/cpu-param.h b/target/tilegx/cpu-param.h
new file mode 100644
index 0000000000..80a341cbb7
--- /dev/null
+++ b/target/tilegx/cpu-param.h
@@ -0,0 +1,17 @@
+/*
+ * TILE-Gx cpu parameters for qemu.
+ *
+ * Copyright (c) 2015 Chen Gang
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef TILEGX_CPU_PARAM_H
+#define TILEGX_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 64
+#define TARGET_PAGE_BITS 16  /* TILE-Gx uses 64KB page size */
+#define TARGET_PHYS_ADDR_SPACE_BITS 42
+#define TARGET_VIRT_ADDR_SPACE_BITS 64
+#define NB_MMU_MODES 1
+
+#endif
diff --git a/target/tilegx/cpu.h b/target/tilegx/cpu.h
index 238f8d36d7..429a6c6b43 100644
--- a/target/tilegx/cpu.h
+++ b/target/tilegx/cpu.h
@@ -21,13 +21,9 @@
 #define TILEGX_CPU_H
 
 #include "qemu-common.h"
-
-#define TARGET_LONG_BITS 64
-
-#define CPUArchState struct CPUTLGState
-
 #include "exec/cpu-defs.h"
 
+#define CPUArchState struct CPUTLGState
 
 /* TILE-Gx common register alias */
 #define TILEGX_R_RE    0   /*  0 register, for function/syscall return value */
@@ -154,9 +150,6 @@ static inline TileGXCPU *tilegx_env_get_cpu(CPUTLGState *env)
 #define ENV_OFFSET offsetof(TileGXCPU, env)
 
 /* TILE-Gx memory attributes */
-#define TARGET_PAGE_BITS 16  /* TILE-Gx uses 64KB page size */
-#define TARGET_PHYS_ADDR_SPACE_BITS 42
-#define TARGET_VIRT_ADDR_SPACE_BITS 64
 #define MMU_USER_IDX    0  /* Current memory operation is in user mode */
 
 #include "exec/cpu-all.h"
diff --git a/target/tricore/cpu-param.h b/target/tricore/cpu-param.h
new file mode 100644
index 0000000000..cf5d9af89d
--- /dev/null
+++ b/target/tricore/cpu-param.h
@@ -0,0 +1,17 @@
+/*
+ * TriCore cpu parameters for qemu.
+ *
+ * Copyright (c) 2012-2014 Bastian Koppelmann C-Lab/University Paderborn
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef TRICORE_CPU_PARAM_H
+#define TRICORE_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 32
+#define TARGET_PAGE_BITS 14
+#define TARGET_PHYS_ADDR_SPACE_BITS 32
+#define TARGET_VIRT_ADDR_SPACE_BITS 32
+#define NB_MMU_MODES 3
+
+#endif
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 287f4328a3..bccde45a07 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -20,10 +20,10 @@
 #ifndef TRICORE_CPU_H
 #define TRICORE_CPU_H
 
-#include "tricore-defs.h"
 #include "qemu-common.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "tricore-defs.h"
 
 #define CPUArchState struct CPUTriCoreState
 
@@ -31,8 +31,6 @@ struct CPUTriCoreState;
 
 struct tricore_boot_info;
 
-#define NB_MMU_MODES 3
-
 typedef struct tricore_def_t tricore_def_t;
 
 typedef struct CPUTriCoreState CPUTriCoreState;
diff --git a/target/tricore/tricore-defs.h b/target/tricore/tricore-defs.h
index e871aa1c6b..f5e0a0bed8 100644
--- a/target/tricore/tricore-defs.h
+++ b/target/tricore/tricore-defs.h
@@ -18,11 +18,6 @@
 #ifndef QEMU_TRICORE_DEFS_H
 #define QEMU_TRICORE_DEFS_H
 
-#define TARGET_PAGE_BITS 14
-#define TARGET_LONG_BITS 32
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-
 #define TRICORE_TLB_MAX 128
 
 #endif /* QEMU_TRICORE_DEFS_H */
diff --git a/target/unicore32/cpu-param.h b/target/unicore32/cpu-param.h
new file mode 100644
index 0000000000..94d8a5daa1
--- /dev/null
+++ b/target/unicore32/cpu-param.h
@@ -0,0 +1,17 @@
+/*
+ * UniCore32 cpu parameters for qemu.
+ *
+ * Copyright (C) 2010-2012 Guan Xuetao
+ * SPDX-License-Identifier: GPL-2.0+
+ */
+
+#ifndef UNICORE32_CPU_PARAM_H
+#define UNICORE32_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS                32
+#define TARGET_PAGE_BITS                12
+#define TARGET_PHYS_ADDR_SPACE_BITS     32
+#define TARGET_VIRT_ADDR_SPACE_BITS     32
+#define NB_MMU_MODES      2
+
+#endif
diff --git a/target/unicore32/cpu.h b/target/unicore32/cpu.h
index f052ee08bf..a4c4ea328e 100644
--- a/target/unicore32/cpu.h
+++ b/target/unicore32/cpu.h
@@ -12,19 +12,11 @@
 #ifndef UNICORE32_CPU_H
 #define UNICORE32_CPU_H
 
-#define TARGET_LONG_BITS                32
-#define TARGET_PAGE_BITS                12
-
-#define TARGET_PHYS_ADDR_SPACE_BITS     32
-#define TARGET_VIRT_ADDR_SPACE_BITS     32
-
-#define CPUArchState                struct CPUUniCore32State
-
 #include "qemu-common.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 
-#define NB_MMU_MODES            2
+#define CPUArchState                struct CPUUniCore32State
 
 typedef struct CPUUniCore32State {
     /* Regs for current mode.  */
diff --git a/target/xtensa/cpu-param.h b/target/xtensa/cpu-param.h
new file mode 100644
index 0000000000..4fde21b941
--- /dev/null
+++ b/target/xtensa/cpu-param.h
@@ -0,0 +1,21 @@
+/*
+ * Xtensa cpu parameters for qemu.
+ *
+ * Copyright (c) 2011, Max Filippov, Open Source and Linux Lab.
+ * SPDX-License-Identifier: BSD-3-Clause
+ */
+
+#ifndef XTENSA_CPU_PARAM_H
+#define XTENSA_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 32
+#define TARGET_PAGE_BITS 12
+#define TARGET_PHYS_ADDR_SPACE_BITS 32
+#ifdef CONFIG_USER_ONLY
+#define TARGET_VIRT_ADDR_SPACE_BITS 30
+#else
+#define TARGET_VIRT_ADDR_SPACE_BITS 32
+#endif
+#define NB_MMU_MODES 4
+
+#endif
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index a0df46f73b..0c6afd43a4 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -28,28 +28,17 @@
 #ifndef XTENSA_CPU_H
 #define XTENSA_CPU_H
 
-#define ALIGNED_ONLY
-#define TARGET_LONG_BITS 32
-
-/* Xtensa processors have a weak memory model */
-#define TCG_GUEST_DEFAULT_MO      (0)
-
-#define CPUArchState struct CPUXtensaState
-
 #include "qemu-common.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "xtensa-isa.h"
 
-#define NB_MMU_MODES 4
+#define ALIGNED_ONLY
 
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#ifdef CONFIG_USER_ONLY
-#define TARGET_VIRT_ADDR_SPACE_BITS 30
-#else
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-#endif
-#define TARGET_PAGE_BITS 12
+/* Xtensa processors have a weak memory model */
+#define TCG_GUEST_DEFAULT_MO      (0)
+
+#define CPUArchState struct CPUXtensaState
 
 enum {
     /* Additional instructions */
-- 
2.17.1


