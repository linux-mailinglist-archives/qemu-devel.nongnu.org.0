Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAC62F7DCC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:11:46 +0100 (CET)
Received: from localhost ([::1]:33516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PpJ-00042s-Nx
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEc-0001LE-6K
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:50 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEZ-00088M-Ga
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:49 -0500
Received: by mail-wr1-x431.google.com with SMTP id d26so9282724wrb.12
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TuD3MyBbI9GFDeT/ByJSV2h/ASr/XDzxKeW4MjzUVRg=;
 b=Q0aDtJbz/fMZharRJPl2XfVSJdkHgP7oEifMypK7tBjzVd6+hLpjLBKO5FKh9TmNf+
 +gYAJd+Gf5clB0Eg0673zpcRKeV9RxQksht3JsWtUE/AjbreySMeAgvCrz8yJJ2TF312
 kz6LeVKkrwTNDwPqaf1J07qVI7tCa9XCq3TglTJhR5C4cv473atUXZBybo+QDpSjz2wb
 EoJc2qonmADuCvVKI2jUDdWnnDpm/wVb/4er9zN2/WLcGwTzjhVe3l+1g/Y69IaNVHW8
 2Jc3PH1ZIhzKEnV65fW87Yhn+aySHG6Qlday3ybB2D+NoFdpxZBVv91zTAS7vtPNgqdW
 HMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TuD3MyBbI9GFDeT/ByJSV2h/ASr/XDzxKeW4MjzUVRg=;
 b=OH4FjHo2ROj4fuwLp4w3Z/q5Is9tEHvNnEne/DDmbccuhXbutYslB8BW2kzkuaCYPt
 oR3PcEgq2saM2NUl996yzgIpgINWvTXbnZmNkWT4JVPjISQPbKw536lEozLBzGool8TG
 pVU3d9MB68pKlGa2+69GWbJU7fY55MiM1nioxlV/0G9c7DcEeUURaLfYzk0YaEI0Prqa
 E1OXcM2JtfukkEOF2XT5CRD+ZLz8HLBU7DsgQR+OgzEN3bCfqUi3cJyg1iInHfLyBX07
 AUc4N7VTx20Gi4belpYcNWN67WcFW9fC7/3b5oQvk4xue6f+2poi8imupLnMDXJ0I3u2
 M65g==
X-Gm-Message-State: AOAM531D4qW5oalpaVc8W7QGIVuEcorTZ1au5G//FyOhCykNJrdTQK9B
 4ps5LQQtv/ev4BwLY62WSrKXxA==
X-Google-Smtp-Source: ABdhPJy0KkeCj3El9y0sVWWgeH80+0xyNcSZSJKfv6fowWRAb4cD42lm4Y5NNOkJlRAPV2yqGMhl4w==
X-Received: by 2002:adf:8290:: with SMTP id 16mr12818937wrc.27.1610717626068; 
 Fri, 15 Jan 2021 05:33:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h16sm14582901wrq.29.2021.01.15.05.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:33:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3F731FFB1;
 Fri, 15 Jan 2021 13:08:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 26/30] riscv: Add semihosting support
Date: Fri, 15 Jan 2021 13:08:24 +0000
Message-Id: <20210115130828.23968-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Keith Packard <keithp@keithp.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Packard <keithp@keithp.com>

Adapt the arm semihosting support code for RISCV. This implementation
is based on the standard for RISC-V semihosting version 0.2 as
documented in

   https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2

Signed-off-by: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210107170717.2098982-6-keithp@keithp.com>
Message-Id: <20210108224256.2321-17-alex.bennee@linaro.org>

diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
index 94a236c9c2..d847bd5692 100644
--- a/default-configs/devices/riscv32-softmmu.mak
+++ b/default-configs/devices/riscv32-softmmu.mak
@@ -3,6 +3,8 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
+CONFIG_SEMIHOSTING=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index 76b6195648..d5eec75f05 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -3,6 +3,8 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
+CONFIG_SEMIHOSTING=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/default-configs/targets/riscv32-linux-user.mak b/default-configs/targets/riscv32-linux-user.mak
index dfb259e8aa..6a9d1b1bc1 100644
--- a/default-configs/targets/riscv32-linux-user.mak
+++ b/default-configs/targets/riscv32-linux-user.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=riscv32
 TARGET_BASE_ARCH=riscv
 TARGET_ABI_DIR=riscv
 TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-csr.xml gdb-xml/riscv-32bit-virtual.xml
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/default-configs/targets/riscv64-linux-user.mak b/default-configs/targets/riscv64-linux-user.mak
index b13895f3b0..0a92849a1b 100644
--- a/default-configs/targets/riscv64-linux-user.mak
+++ b/default-configs/targets/riscv64-linux-user.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=riscv64
 TARGET_BASE_ARCH=riscv
 TARGET_ABI_DIR=riscv
 TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-csr.xml gdb-xml/riscv-64bit-virtual.xml
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
index bc53e92c79..0bfab1c669 100644
--- a/hw/semihosting/common-semi.h
+++ b/hw/semihosting/common-semi.h
@@ -1,6 +1,6 @@
 /*
  *  Semihosting support for systems modeled on the Arm "Angel"
- *  semihosting syscalls design.
+ *  semihosting syscalls design. This includes Arm and RISC-V processors
  *
  *  Copyright (c) 2005, 2007 CodeSourcery.
  *  Copyright (c) 2019 Linaro
@@ -26,6 +26,9 @@
  *     Semihosting for AArch32 and AArch64 Release 2.0
  *     https://static.docs.arm.com/100863/0200/semihosting.pdf
  *
+ *  RISC-V Semihosting is documented in:
+ *     RISC-V Semihosting
+ *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
  */
 
 #ifndef COMMON_SEMI_H
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 534753ca12..17aa992165 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -109,6 +109,8 @@ typedef struct TaskState {
     /* FPA state */
     FPA11 fpa;
 # endif
+#endif
+#if defined(TARGET_ARM) || defined(TARGET_RISCV)
     int swi_errno;
 #endif
 #if defined(TARGET_I386) && !defined(TARGET_X86_64)
@@ -122,7 +124,7 @@ typedef struct TaskState {
 #ifdef TARGET_M68K
     abi_ulong tp_value;
 #endif
-#if defined(TARGET_ARM) || defined(TARGET_M68K)
+#if defined(TARGET_ARM) || defined(TARGET_M68K) || defined(TARGET_RISCV)
     /* Extra fields for semihosted binaries.  */
     abi_ulong heap_base;
     abi_ulong heap_limit;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b41e8836c3..4196ef8b69 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -542,6 +542,7 @@
 #define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
 #define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
 #define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
+#define RISCV_EXCP_SEMIHOST                      0x10
 #define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
 #define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
 #define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
diff --git a/hw/semihosting/arm-compat-semi.c b/hw/semihosting/arm-compat-semi.c
index 293791f721..5fcb8663c6 100644
--- a/hw/semihosting/arm-compat-semi.c
+++ b/hw/semihosting/arm-compat-semi.c
@@ -1,6 +1,6 @@
 /*
  *  Semihosting support for systems modeled on the Arm "Angel"
- *  semihosting syscalls design.
+ *  semihosting syscalls design. This includes Arm and RISC-V processors
  *
  *  Copyright (c) 2005, 2007 CodeSourcery.
  *  Copyright (c) 2019 Linaro
@@ -25,6 +25,10 @@
  *  ARM Semihosting is documented in:
  *     Semihosting for AArch32 and AArch64 Release 2.0
  *     https://static.docs.arm.com/100863/0200/semihosting.pdf
+ *
+ *  RISC-V Semihosting is documented in:
+ *     RISC-V Semihosting
+ *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
  */
 
 #include "qemu/osdep.h"
@@ -222,6 +226,42 @@ common_semi_rambase(CPUState *cs)
 
 #endif /* TARGET_ARM */
 
+#ifdef TARGET_RISCV
+static inline target_ulong
+common_semi_arg(CPUState *cs, int argno)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return env->gpr[xA0 + argno];
+}
+
+static inline void
+common_semi_set_ret(CPUState *cs, target_ulong ret)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    env->gpr[xA0] = ret;
+}
+
+static inline bool
+common_semi_sys_exit_extended(CPUState *cs, int nr)
+{
+    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
+}
+
+#ifndef CONFIG_USER_ONLY
+
+static inline target_ulong
+common_semi_rambase(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return common_semi_find_region_base(env->gpr[xSP]);
+}
+#endif
+
+#endif
+
 /*
  * Allocate a new guest file descriptor and return it; if we
  * couldn't allocate a new fd then return -1.
@@ -398,6 +438,12 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
         sp = env->regs[13];
     }
 #endif
+#ifdef TARGET_RISCV
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    sp = env->gpr[xSP];
+#endif
 
     return sp - 64;
 }
@@ -741,6 +787,37 @@ static const GuestFDFunctions guestfd_fns[] = {
      put_user_u32(val, args + (n) * 4))
 #endif
 
+#ifdef TARGET_RISCV
+
+/*
+ * get_user_ual is defined as get_user_u32 in softmmu-semi.h,
+ * we need a macro that fetches a target_ulong
+ */
+#define get_user_utl(arg, p)                    \
+    ((sizeof(target_ulong) == 8) ?              \
+     get_user_u64(arg, p) :                     \
+     get_user_u32(arg, p))
+
+/*
+ * put_user_ual is defined as put_user_u32 in softmmu-semi.h,
+ * we need a macro that stores a target_ulong
+ */
+#define put_user_utl(arg, p)                    \
+    ((sizeof(target_ulong) == 8) ?              \
+     put_user_u64(arg, p) :                     \
+     put_user_u32(arg, p))
+
+#define GET_ARG(n) do {                                                 \
+        if (get_user_utl(arg ## n, args + (n) * sizeof(target_ulong))) { \
+            errno = EFAULT;                                             \
+            return set_swi_errno(cs, -1);                              \
+        }                                                               \
+    } while (0)
+
+#define SET_ARG(n, val)                                 \
+    put_user_utl(val, args + (n) * sizeof(target_ulong))
+#endif
+
 /*
  * Do a semihosting call.
  *
@@ -1179,6 +1256,9 @@ target_ulong do_common_semihosting(CPUState *cs)
         if (is_a64(cs->env_ptr)) {
             return 0;
         }
+#endif
+#ifdef TARGET_RISCV
+        return 0;
 #endif
         /* fall through -- invalid for A32/T32 */
     default:
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index a1f0f6050e..c0015ee7f6 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -1,11 +1,11 @@
 /*
- * ARM Semihosting Console Support
+ * ARM Compatible Semihosting Console Support.
  *
  * Copyright (c) 2019 Linaro Ltd
  *
- * Currently ARM is unique in having support for semihosting support
- * in linux-user. So for now we implement the common console API but
- * just for arm linux-user.
+ * Currently ARM and RISC-V are unique in having support for
+ * semihosting support in linux-user. So for now we implement the
+ * common console API but just for arm and risc-v linux-user.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a2afb95fa1..f8350f5f78 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
+#include "hw/semihosting/common-semi.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -847,6 +848,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
 
+    if  (cause == RISCV_EXCP_SEMIHOST) {
+        if (env->priv >= PRV_S) {
+            env->gpr[xA0] = do_common_semihosting(cs);
+            env->pc += 4;
+            return;
+        }
+        cause = RISCV_EXCP_BREAKPOINT;
+    }
+
     if (!async) {
         /* set tval to badaddr for traps with address information */
         switch (cause) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 554d52a4be..0f28b5f41e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -64,6 +64,7 @@ typedef struct DisasContext {
     uint16_t vlen;
     uint16_t mlen;
     bool vl_eq_vlmax;
+    CPUState *cs;
 } DisasContext;
 
 #ifdef TARGET_RISCV64
@@ -747,6 +748,15 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    CPUState *cpu = ctx->cs;
+    CPURISCVState *env = cpu->env_ptr;
+
+    return cpu_ldl_code(env, pc);
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.c.inc"
 #include "insn_trans/trans_rvm.c.inc"
@@ -814,6 +824,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->cs = cs;
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 2a61a853bf..32312be202 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -29,7 +29,42 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 
 static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
 {
-    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+    target_ulong    ebreak_addr = ctx->base.pc_next;
+    target_ulong    pre_addr = ebreak_addr - 4;
+    target_ulong    post_addr = ebreak_addr + 4;
+    uint32_t pre    = 0;
+    uint32_t ebreak = 0;
+    uint32_t post   = 0;
+
+    /*
+     * The RISC-V semihosting spec specifies the following
+     * three-instruction sequence to flag a semihosting call:
+     *
+     *      slli zero, zero, 0x1f       0x01f01013
+     *      ebreak                      0x00100073
+     *      srai zero, zero, 0x7        0x40705013
+     *
+     * The two shift operations on the zero register are no-ops, used
+     * here to signify a semihosting exception, rather than a breakpoint.
+     *
+     * Uncompressed instructions are required so that the sequence is easy
+     * to validate.
+     *
+     * The three instructions are required to lie in the same page so
+     * that no exception will be raised when fetching them.
+     */
+
+    if ((pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
+        pre    = opcode_at(&ctx->base, pre_addr);
+        ebreak = opcode_at(&ctx->base, ebreak_addr);
+        post   = opcode_at(&ctx->base, post_addr);
+    }
+
+    if  (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
+        generate_exception(ctx, RISCV_EXCP_SEMIHOST);
+    } else {
+        generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+    }
     exit_tb(ctx); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
diff --git a/qemu-options.hx b/qemu-options.hx
index 1698a0c751..263caa21ec 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4197,10 +4197,10 @@ ERST
 DEF("semihosting", 0, QEMU_OPTION_semihosting,
     "-semihosting    semihosting mode\n",
     QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
-    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
+    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting``
-    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
+    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
 
     Note that this allows guest direct access to the host filesystem, so
     should only be used with a trusted guest OS.
@@ -4212,10 +4212,10 @@ DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
     "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
     "                semihosting configuration\n",
 QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
-QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
+QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]``
-    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II
+    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
     only).
 
     Note that this allows guest direct access to the host filesystem, so
@@ -4230,6 +4230,8 @@ SRST
     open/read/write/seek/select. Tensilica baremetal libc for ISS and
     linux platform "sim" use this interface.
 
+    On RISC-V this implements the standard semihosting API, version 0.2.
+
     ``target=native|gdb|auto``
         Defines where the semihosting calls will be addressed, to QEMU
         (``native``) or to GDB (``gdb``). The default is ``auto``, which
-- 
2.20.1


