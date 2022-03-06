Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5604CEE90
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:35:22 +0100 (CET)
Received: from localhost ([::1]:34546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0PK-00037u-28
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:35:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0IG-0005DY-LP
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:28:04 -0500
Received: from [2a00:1450:4864:20::434] (port=33729
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0ID-0000aA-AR
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:28:04 -0500
Received: by mail-wr1-x434.google.com with SMTP id j17so20753445wrc.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 15:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kRIOuOMGsUAUvIubd48W92zj8CC5YP41QS1Lf8Mx0Uw=;
 b=EFP2xsTqQHZu80KL7l+JoavKxgj+Bx/qZhVRyKf2MQn4bCWuBcs+GCnRvQXkMoBU51
 qCSrpY41uhXHHdZqZMR82wekAjDj4kjhbxctM5A4gk0xXssL2OO6T7/k/QA/KnQIexRF
 AW2blyRPUj5Ob46Ajs82MuQmeIP3qvLIHddMm74/d0lHVgqfhtOyz2ov9CHxbQV6afMY
 QhLbTgaebMdCy+DaSq32TyNOwzCDrHCkUcReDLJBSEkJ6KNE22YAOQOU66CrYVecVGdw
 rX0XO/eP8rdkPxr1s/HQBsH+cwzW3A5R7GBhnIcYt5q+Co0Xh5h8swGQKpjaVUMhVgRK
 gOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kRIOuOMGsUAUvIubd48W92zj8CC5YP41QS1Lf8Mx0Uw=;
 b=Bbj/3ERaA1jG2WoQ/DhhpVISWs4udVv8H26IrBKqivabeDgrg45VciEHqjgo6HiAiS
 bhfE1yCWyw/ZqSi3oxoZZ7V04n8ZkKN5kQftGu4u7/OD9E0CUXS+R+nKEidQ1hPXQBar
 WwO1U3ka1dvY4JOF8pSPllsuMd48Xg9sVRjkGoWbHT+S8TRAm67CUQ32+wyWdIi25dg2
 VlusifHMRRQwKYzJOgE3Uql8fXvSL4T4Xfyq2vsU4tprtMWOGpZ8dv31r3HVEo5LH+k8
 hASV8IAzeiJjjA/c7QMLHdPsn27dwfbrkK5zSnMMlfBPnsJ1YJu/PBHJEgrZj4deEOYD
 Q4sw==
X-Gm-Message-State: AOAM530OrhRF6Q21J9zJw4geo9rql3oalipv+CeAdxqKxDsyShHAi2+1
 mJyjgFCkVwDTaxSUzMOctE8=
X-Google-Smtp-Source: ABdhPJxN4E0ggealTW0AYoXdbTg3F/K128VmzMD8Qop2D56DDNBgc5cVySYVcrJd1YX5rwKvl7X9Kg==
X-Received: by 2002:adf:dfc2:0:b0:1f0:262a:d831 with SMTP id
 q2-20020adfdfc2000000b001f0262ad831mr5960279wrn.589.1646609279853; 
 Sun, 06 Mar 2022 15:27:59 -0800 (PST)
Received: from nuc.. ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 e20-20020adfa454000000b001f01a14dce8sm9748999wra.97.2022.03.06.15.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 15:27:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: 
Subject: [PULL v2 28/33] target: Use forward declared type instead of
 structure type
Date: Mon,  7 Mar 2022 00:27:50 +0100
Message-Id: <20220306232750.41671-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306232750.41671-1-philippe.mathieu.daude@gmail.com>
References: <20220306232750.41671-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The CPU / CPU state are forward declared.

  $ git grep -E 'struct [A-Za-z]+CPU\ \*'
  target/arm/hvf_arm.h:16:void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
  target/openrisc/cpu.h:234:    int (*cpu_openrisc_map_address_code)(struct OpenRISCCPU *cpu,
  target/openrisc/cpu.h:238:    int (*cpu_openrisc_map_address_data)(struct OpenRISCCPU *cpu,

  $ git grep -E 'struct CPU[A-Za-z0-9]+State\ \*'
  target/mips/internal.h:137:    int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
  target/mips/internal.h:139:    void (*helper_tlbwi)(struct CPUMIPSState *env);
  target/mips/internal.h:140:    void (*helper_tlbwr)(struct CPUMIPSState *env);
  target/mips/internal.h:141:    void (*helper_tlbp)(struct CPUMIPSState *env);
  target/mips/internal.h:142:    void (*helper_tlbr)(struct CPUMIPSState *env);
  target/mips/internal.h:143:    void (*helper_tlbinv)(struct CPUMIPSState *env);
  target/mips/internal.h:144:    void (*helper_tlbinvf)(struct CPUMIPSState *env);
  target/xtensa/cpu.h:347:    struct CPUXtensaState *env;
  ...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214183144.27402-12-f4bug@amsat.org>
---
 target/arm/hvf_arm.h        |   2 +-
 target/i386/hvf/x86_emu.h   |  22 ++++----
 target/mips/internal.h      |  14 ++---
 target/openrisc/cpu.h       |   4 +-
 target/xtensa/cpu.h         |   2 +-
 target/i386/hvf/x86_emu.c   | 110 ++++++++++++++++++------------------
 target/i386/nvmm/nvmm-all.c |  14 ++---
 target/i386/whpx/whpx-all.c |  18 +++---
 8 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
index ea238cff83f..9a9d1a0bf59 100644
--- a/target/arm/hvf_arm.h
+++ b/target/arm/hvf_arm.h
@@ -13,6 +13,6 @@
 
 #include "cpu.h"
 
-void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
+void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
 #endif
diff --git a/target/i386/hvf/x86_emu.h b/target/i386/hvf/x86_emu.h
index 233f7b8daa3..640da90b30f 100644
--- a/target/i386/hvf/x86_emu.h
+++ b/target/i386/hvf/x86_emu.h
@@ -24,7 +24,7 @@
 #include "cpu.h"
 
 void init_emu(void);
-bool exec_instruction(struct CPUX86State *env, struct x86_decode *ins);
+bool exec_instruction(CPUX86State *env, struct x86_decode *ins);
 
 void load_regs(struct CPUState *cpu);
 void store_regs(struct CPUState *cpu);
@@ -36,15 +36,15 @@ target_ulong read_reg(CPUX86State *env, int reg, int size);
 void write_reg(CPUX86State *env, int reg, target_ulong val, int size);
 target_ulong read_val_from_reg(target_ulong reg_ptr, int size);
 void write_val_to_reg(target_ulong reg_ptr, target_ulong val, int size);
-void write_val_ext(struct CPUX86State *env, target_ulong ptr, target_ulong val, int size);
-uint8_t *read_mmio(struct CPUX86State *env, target_ulong ptr, int bytes);
-target_ulong read_val_ext(struct CPUX86State *env, target_ulong ptr, int size);
+void write_val_ext(CPUX86State *env, target_ulong ptr, target_ulong val, int size);
+uint8_t *read_mmio(CPUX86State *env, target_ulong ptr, int bytes);
+target_ulong read_val_ext(CPUX86State *env, target_ulong ptr, int size);
 
-void exec_movzx(struct CPUX86State *env, struct x86_decode *decode);
-void exec_shl(struct CPUX86State *env, struct x86_decode *decode);
-void exec_movsx(struct CPUX86State *env, struct x86_decode *decode);
-void exec_ror(struct CPUX86State *env, struct x86_decode *decode);
-void exec_rol(struct CPUX86State *env, struct x86_decode *decode);
-void exec_rcl(struct CPUX86State *env, struct x86_decode *decode);
-void exec_rcr(struct CPUX86State *env, struct x86_decode *decode);
+void exec_movzx(CPUX86State *env, struct x86_decode *decode);
+void exec_shl(CPUX86State *env, struct x86_decode *decode);
+void exec_movsx(CPUX86State *env, struct x86_decode *decode);
+void exec_ror(CPUX86State *env, struct x86_decode *decode);
+void exec_rol(CPUX86State *env, struct x86_decode *decode);
+void exec_rcl(CPUX86State *env, struct x86_decode *decode);
+void exec_rcr(CPUX86State *env, struct x86_decode *decode);
 #endif
diff --git a/target/mips/internal.h b/target/mips/internal.h
index f705d6bfa61..ac6e03e2f25 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -134,14 +134,14 @@ struct r4k_tlb_t {
 struct CPUMIPSTLBContext {
     uint32_t nb_tlb;
     uint32_t tlb_in_use;
-    int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
+    int (*map_address)(CPUMIPSState *env, hwaddr *physical, int *prot,
                        target_ulong address, MMUAccessType access_type);
-    void (*helper_tlbwi)(struct CPUMIPSState *env);
-    void (*helper_tlbwr)(struct CPUMIPSState *env);
-    void (*helper_tlbp)(struct CPUMIPSState *env);
-    void (*helper_tlbr)(struct CPUMIPSState *env);
-    void (*helper_tlbinv)(struct CPUMIPSState *env);
-    void (*helper_tlbinvf)(struct CPUMIPSState *env);
+    void (*helper_tlbwi)(CPUMIPSState *env);
+    void (*helper_tlbwr)(CPUMIPSState *env);
+    void (*helper_tlbp)(CPUMIPSState *env);
+    void (*helper_tlbr)(CPUMIPSState *env);
+    void (*helper_tlbinv)(CPUMIPSState *env);
+    void (*helper_tlbinvf)(CPUMIPSState *env);
     union {
         struct {
             r4k_tlb_t tlb[MIPS_TLB_MAX];
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index ee069b080c9..5711591520d 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -231,11 +231,11 @@ typedef struct CPUOpenRISCTLBContext {
     OpenRISCTLBEntry itlb[TLB_SIZE];
     OpenRISCTLBEntry dtlb[TLB_SIZE];
 
-    int (*cpu_openrisc_map_address_code)(struct OpenRISCCPU *cpu,
+    int (*cpu_openrisc_map_address_code)(OpenRISCCPU *cpu,
                                          hwaddr *physical,
                                          int *prot,
                                          target_ulong address, int rw);
-    int (*cpu_openrisc_map_address_data)(struct OpenRISCCPU *cpu,
+    int (*cpu_openrisc_map_address_data)(OpenRISCCPU *cpu,
                                          hwaddr *physical,
                                          int *prot,
                                          target_ulong address, int rw);
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 02143f2f776..f2165b17e2d 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -344,7 +344,7 @@ typedef struct XtensaGdbRegmap {
 } XtensaGdbRegmap;
 
 typedef struct XtensaCcompareTimer {
-    struct CPUXtensaState *env;
+    CPUXtensaState *env;
     QEMUTimer *timer;
 } XtensaCcompareTimer;
 
diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index 7c8203b21fb..050428795bb 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -171,12 +171,12 @@ void write_val_to_reg(target_ulong reg_ptr, target_ulong val, int size)
     }
 }
 
-static bool is_host_reg(struct CPUX86State *env, target_ulong ptr)
+static bool is_host_reg(CPUX86State *env, target_ulong ptr)
 {
     return (ptr - (target_ulong)&env->regs[0]) < sizeof(env->regs);
 }
 
-void write_val_ext(struct CPUX86State *env, target_ulong ptr, target_ulong val, int size)
+void write_val_ext(CPUX86State *env, target_ulong ptr, target_ulong val, int size)
 {
     if (is_host_reg(env, ptr)) {
         write_val_to_reg(ptr, val, size);
@@ -185,14 +185,14 @@ void write_val_ext(struct CPUX86State *env, target_ulong ptr, target_ulong val,
     vmx_write_mem(env_cpu(env), ptr, &val, size);
 }
 
-uint8_t *read_mmio(struct CPUX86State *env, target_ulong ptr, int bytes)
+uint8_t *read_mmio(CPUX86State *env, target_ulong ptr, int bytes)
 {
     vmx_read_mem(env_cpu(env), env->hvf_mmio_buf, ptr, bytes);
     return env->hvf_mmio_buf;
 }
 
 
-target_ulong read_val_ext(struct CPUX86State *env, target_ulong ptr, int size)
+target_ulong read_val_ext(CPUX86State *env, target_ulong ptr, int size)
 {
     target_ulong val;
     uint8_t *mmio_ptr;
@@ -222,7 +222,7 @@ target_ulong read_val_ext(struct CPUX86State *env, target_ulong ptr, int size)
     return val;
 }
 
-static void fetch_operands(struct CPUX86State *env, struct x86_decode *decode,
+static void fetch_operands(CPUX86State *env, struct x86_decode *decode,
                            int n, bool val_op0, bool val_op1, bool val_op2)
 {
     int i;
@@ -261,7 +261,7 @@ static void fetch_operands(struct CPUX86State *env, struct x86_decode *decode,
     }
 }
 
-static void exec_mov(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_mov(CPUX86State *env, struct x86_decode *decode)
 {
     fetch_operands(env, decode, 2, false, true, false);
     write_val_ext(env, decode->op[0].ptr, decode->op[1].val,
@@ -270,49 +270,49 @@ static void exec_mov(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_add(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_add(CPUX86State *env, struct x86_decode *decode)
 {
     EXEC_2OP_FLAGS_CMD(env, decode, +, SET_FLAGS_OSZAPC_ADD, true);
     env->eip += decode->len;
 }
 
-static void exec_or(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_or(CPUX86State *env, struct x86_decode *decode)
 {
     EXEC_2OP_FLAGS_CMD(env, decode, |, SET_FLAGS_OSZAPC_LOGIC, true);
     env->eip += decode->len;
 }
 
-static void exec_adc(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_adc(CPUX86State *env, struct x86_decode *decode)
 {
     EXEC_2OP_FLAGS_CMD(env, decode, +get_CF(env)+, SET_FLAGS_OSZAPC_ADD, true);
     env->eip += decode->len;
 }
 
-static void exec_sbb(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_sbb(CPUX86State *env, struct x86_decode *decode)
 {
     EXEC_2OP_FLAGS_CMD(env, decode, -get_CF(env)-, SET_FLAGS_OSZAPC_SUB, true);
     env->eip += decode->len;
 }
 
-static void exec_and(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_and(CPUX86State *env, struct x86_decode *decode)
 {
     EXEC_2OP_FLAGS_CMD(env, decode, &, SET_FLAGS_OSZAPC_LOGIC, true);
     env->eip += decode->len;
 }
 
-static void exec_sub(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_sub(CPUX86State *env, struct x86_decode *decode)
 {
     EXEC_2OP_FLAGS_CMD(env, decode, -, SET_FLAGS_OSZAPC_SUB, true);
     env->eip += decode->len;
 }
 
-static void exec_xor(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_xor(CPUX86State *env, struct x86_decode *decode)
 {
     EXEC_2OP_FLAGS_CMD(env, decode, ^, SET_FLAGS_OSZAPC_LOGIC, true);
     env->eip += decode->len;
 }
 
-static void exec_neg(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_neg(CPUX86State *env, struct x86_decode *decode)
 {
     /*EXEC_2OP_FLAGS_CMD(env, decode, -, SET_FLAGS_OSZAPC_SUB, false);*/
     int32_t val;
@@ -335,13 +335,13 @@ static void exec_neg(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_cmp(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_cmp(CPUX86State *env, struct x86_decode *decode)
 {
     EXEC_2OP_FLAGS_CMD(env, decode, -, SET_FLAGS_OSZAPC_SUB, false);
     env->eip += decode->len;
 }
 
-static void exec_inc(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_inc(CPUX86State *env, struct x86_decode *decode)
 {
     decode->op[1].type = X86_VAR_IMMEDIATE;
     decode->op[1].val = 0;
@@ -351,7 +351,7 @@ static void exec_inc(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_dec(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_dec(CPUX86State *env, struct x86_decode *decode)
 {
     decode->op[1].type = X86_VAR_IMMEDIATE;
     decode->op[1].val = 0;
@@ -360,13 +360,13 @@ static void exec_dec(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_tst(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_tst(CPUX86State *env, struct x86_decode *decode)
 {
     EXEC_2OP_FLAGS_CMD(env, decode, &, SET_FLAGS_OSZAPC_LOGIC, false);
     env->eip += decode->len;
 }
 
-static void exec_not(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_not(CPUX86State *env, struct x86_decode *decode)
 {
     fetch_operands(env, decode, 1, true, false, false);
 
@@ -375,7 +375,7 @@ static void exec_not(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-void exec_movzx(struct CPUX86State *env, struct x86_decode *decode)
+void exec_movzx(CPUX86State *env, struct x86_decode *decode)
 {
     int src_op_size;
     int op_size = decode->operand_size;
@@ -395,7 +395,7 @@ void exec_movzx(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_out(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_out(CPUX86State *env, struct x86_decode *decode)
 {
     switch (decode->opcode[0]) {
     case 0xe6:
@@ -419,7 +419,7 @@ static void exec_out(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_in(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_in(CPUX86State *env, struct x86_decode *decode)
 {
     target_ulong val = 0;
     switch (decode->opcode[0]) {
@@ -455,7 +455,7 @@ static void exec_in(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static inline void string_increment_reg(struct CPUX86State *env, int reg,
+static inline void string_increment_reg(CPUX86State *env, int reg,
                                         struct x86_decode *decode)
 {
     target_ulong val = read_reg(env, reg, decode->addressing_size);
@@ -467,8 +467,8 @@ static inline void string_increment_reg(struct CPUX86State *env, int reg,
     write_reg(env, reg, val, decode->addressing_size);
 }
 
-static inline void string_rep(struct CPUX86State *env, struct x86_decode *decode,
-                              void (*func)(struct CPUX86State *env,
+static inline void string_rep(CPUX86State *env, struct x86_decode *decode,
+                              void (*func)(CPUX86State *env,
                                            struct x86_decode *ins), int rep)
 {
     target_ulong rcx = read_reg(env, R_ECX, decode->addressing_size);
@@ -484,7 +484,7 @@ static inline void string_rep(struct CPUX86State *env, struct x86_decode *decode
     }
 }
 
-static void exec_ins_single(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_ins_single(CPUX86State *env, struct x86_decode *decode)
 {
     target_ulong addr = linear_addr_size(env_cpu(env), RDI(env),
                                          decode->addressing_size, R_ES);
@@ -497,7 +497,7 @@ static void exec_ins_single(struct CPUX86State *env, struct x86_decode *decode)
     string_increment_reg(env, R_EDI, decode);
 }
 
-static void exec_ins(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_ins(CPUX86State *env, struct x86_decode *decode)
 {
     if (decode->rep) {
         string_rep(env, decode, exec_ins_single, 0);
@@ -508,7 +508,7 @@ static void exec_ins(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_outs_single(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_outs_single(CPUX86State *env, struct x86_decode *decode)
 {
     target_ulong addr = decode_linear_addr(env, decode, RSI(env), R_DS);
 
@@ -520,7 +520,7 @@ static void exec_outs_single(struct CPUX86State *env, struct x86_decode *decode)
     string_increment_reg(env, R_ESI, decode);
 }
 
-static void exec_outs(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_outs(CPUX86State *env, struct x86_decode *decode)
 {
     if (decode->rep) {
         string_rep(env, decode, exec_outs_single, 0);
@@ -531,7 +531,7 @@ static void exec_outs(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_movs_single(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_movs_single(CPUX86State *env, struct x86_decode *decode)
 {
     target_ulong src_addr;
     target_ulong dst_addr;
@@ -548,7 +548,7 @@ static void exec_movs_single(struct CPUX86State *env, struct x86_decode *decode)
     string_increment_reg(env, R_EDI, decode);
 }
 
-static void exec_movs(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_movs(CPUX86State *env, struct x86_decode *decode)
 {
     if (decode->rep) {
         string_rep(env, decode, exec_movs_single, 0);
@@ -559,7 +559,7 @@ static void exec_movs(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_cmps_single(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_cmps_single(CPUX86State *env, struct x86_decode *decode)
 {
     target_ulong src_addr;
     target_ulong dst_addr;
@@ -579,7 +579,7 @@ static void exec_cmps_single(struct CPUX86State *env, struct x86_decode *decode)
     string_increment_reg(env, R_EDI, decode);
 }
 
-static void exec_cmps(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_cmps(CPUX86State *env, struct x86_decode *decode)
 {
     if (decode->rep) {
         string_rep(env, decode, exec_cmps_single, decode->rep);
@@ -590,7 +590,7 @@ static void exec_cmps(struct CPUX86State *env, struct x86_decode *decode)
 }
 
 
-static void exec_stos_single(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_stos_single(CPUX86State *env, struct x86_decode *decode)
 {
     target_ulong addr;
     target_ulong val;
@@ -604,7 +604,7 @@ static void exec_stos_single(struct CPUX86State *env, struct x86_decode *decode)
 }
 
 
-static void exec_stos(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_stos(CPUX86State *env, struct x86_decode *decode)
 {
     if (decode->rep) {
         string_rep(env, decode, exec_stos_single, 0);
@@ -615,7 +615,7 @@ static void exec_stos(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_scas_single(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_scas_single(CPUX86State *env, struct x86_decode *decode)
 {
     target_ulong addr;
 
@@ -628,7 +628,7 @@ static void exec_scas_single(struct CPUX86State *env, struct x86_decode *decode)
     string_increment_reg(env, R_EDI, decode);
 }
 
-static void exec_scas(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_scas(CPUX86State *env, struct x86_decode *decode)
 {
     decode->op[0].type = X86_VAR_REG;
     decode->op[0].reg = R_EAX;
@@ -641,7 +641,7 @@ static void exec_scas(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_lods_single(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_lods_single(CPUX86State *env, struct x86_decode *decode)
 {
     target_ulong addr;
     target_ulong val = 0;
@@ -653,7 +653,7 @@ static void exec_lods_single(struct CPUX86State *env, struct x86_decode *decode)
     string_increment_reg(env, R_ESI, decode);
 }
 
-static void exec_lods(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_lods(CPUX86State *env, struct x86_decode *decode)
 {
     if (decode->rep) {
         string_rep(env, decode, exec_lods_single, 0);
@@ -760,7 +760,7 @@ void simulate_rdmsr(struct CPUState *cpu)
     RDX(env) = (uint32_t)(val >> 32);
 }
 
-static void exec_rdmsr(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_rdmsr(CPUX86State *env, struct x86_decode *decode)
 {
     simulate_rdmsr(env_cpu(env));
     env->eip += decode->len;
@@ -855,7 +855,7 @@ void simulate_wrmsr(struct CPUState *cpu)
     printf("write msr %llx\n", RCX(cpu));*/
 }
 
-static void exec_wrmsr(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_wrmsr(CPUX86State *env, struct x86_decode *decode)
 {
     simulate_wrmsr(env_cpu(env));
     env->eip += decode->len;
@@ -865,7 +865,7 @@ static void exec_wrmsr(struct CPUX86State *env, struct x86_decode *decode)
  * flag:
  * 0 - bt, 1 - btc, 2 - bts, 3 - btr
  */
-static void do_bt(struct CPUX86State *env, struct x86_decode *decode, int flag)
+static void do_bt(CPUX86State *env, struct x86_decode *decode, int flag)
 {
     int32_t displacement;
     uint8_t index;
@@ -911,31 +911,31 @@ static void do_bt(struct CPUX86State *env, struct x86_decode *decode, int flag)
     set_CF(env, cf);
 }
 
-static void exec_bt(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_bt(CPUX86State *env, struct x86_decode *decode)
 {
     do_bt(env, decode, 0);
     env->eip += decode->len;
 }
 
-static void exec_btc(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_btc(CPUX86State *env, struct x86_decode *decode)
 {
     do_bt(env, decode, 1);
     env->eip += decode->len;
 }
 
-static void exec_btr(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_btr(CPUX86State *env, struct x86_decode *decode)
 {
     do_bt(env, decode, 3);
     env->eip += decode->len;
 }
 
-static void exec_bts(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_bts(CPUX86State *env, struct x86_decode *decode)
 {
     do_bt(env, decode, 2);
     env->eip += decode->len;
 }
 
-void exec_shl(struct CPUX86State *env, struct x86_decode *decode)
+void exec_shl(CPUX86State *env, struct x86_decode *decode)
 {
     uint8_t count;
     int of = 0, cf = 0;
@@ -1022,7 +1022,7 @@ void exec_movsx(CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-void exec_ror(struct CPUX86State *env, struct x86_decode *decode)
+void exec_ror(CPUX86State *env, struct x86_decode *decode)
 {
     uint8_t count;
 
@@ -1100,7 +1100,7 @@ void exec_ror(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-void exec_rol(struct CPUX86State *env, struct x86_decode *decode)
+void exec_rol(CPUX86State *env, struct x86_decode *decode)
 {
     uint8_t count;
 
@@ -1182,7 +1182,7 @@ void exec_rol(struct CPUX86State *env, struct x86_decode *decode)
 }
 
 
-void exec_rcl(struct CPUX86State *env, struct x86_decode *decode)
+void exec_rcl(CPUX86State *env, struct x86_decode *decode)
 {
     uint8_t count;
     int of = 0, cf = 0;
@@ -1267,7 +1267,7 @@ void exec_rcl(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-void exec_rcr(struct CPUX86State *env, struct x86_decode *decode)
+void exec_rcr(CPUX86State *env, struct x86_decode *decode)
 {
     uint8_t count;
     int of = 0, cf = 0;
@@ -1342,7 +1342,7 @@ void exec_rcr(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_xchg(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_xchg(CPUX86State *env, struct x86_decode *decode)
 {
     fetch_operands(env, decode, 2, true, true, false);
 
@@ -1354,7 +1354,7 @@ static void exec_xchg(struct CPUX86State *env, struct x86_decode *decode)
     env->eip += decode->len;
 }
 
-static void exec_xadd(struct CPUX86State *env, struct x86_decode *decode)
+static void exec_xadd(CPUX86State *env, struct x86_decode *decode)
 {
     EXEC_2OP_FLAGS_CMD(env, decode, +, SET_FLAGS_OSZAPC_ADD, true);
     write_val_ext(env, decode->op[1].ptr, decode->op[0].val,
@@ -1365,7 +1365,7 @@ static void exec_xadd(struct CPUX86State *env, struct x86_decode *decode)
 
 static struct cmd_handler {
     enum x86_decode_cmd cmd;
-    void (*handler)(struct CPUX86State *env, struct x86_decode *ins);
+    void (*handler)(CPUX86State *env, struct x86_decode *ins);
 } handlers[] = {
     {X86_DECODE_CMD_INVL, NULL,},
     {X86_DECODE_CMD_MOV, exec_mov},
@@ -1465,7 +1465,7 @@ void store_regs(struct CPUState *cpu)
     macvm_set_rip(cpu, env->eip);
 }
 
-bool exec_instruction(struct CPUX86State *env, struct x86_decode *ins)
+bool exec_instruction(CPUX86State *env, struct x86_decode *ins)
 {
     /*if (hvf_vcpu_id(cpu))
     printf("%d, %llx: exec_instruction %s\n", hvf_vcpu_id(cpu),  env->eip,
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 9af261eea32..e159dd2b939 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -85,7 +85,7 @@ nvmm_set_segment(struct nvmm_x64_state_seg *nseg, const SegmentCache *qseg)
 static void
 nvmm_set_registers(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
@@ -222,7 +222,7 @@ nvmm_get_segment(SegmentCache *qseg, const struct nvmm_x64_state_seg *nseg)
 static void
 nvmm_get_registers(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
@@ -347,7 +347,7 @@ nvmm_get_registers(CPUState *cpu)
 static bool
 nvmm_can_take_int(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_machine *mach = get_nvmm_mach();
@@ -394,7 +394,7 @@ nvmm_can_take_nmi(CPUState *cpu)
 static void
 nvmm_vcpu_pre_run(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
@@ -480,7 +480,7 @@ static void
 nvmm_vcpu_post_run(CPUState *cpu, struct nvmm_vcpu_exit *exit)
 {
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     uint64_t tpr;
 
@@ -652,7 +652,7 @@ static int
 nvmm_handle_halted(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     int ret = 0;
 
     qemu_mutex_lock_iothread();
@@ -685,7 +685,7 @@ nvmm_inject_ud(struct nvmm_machine *mach, struct nvmm_vcpu *vcpu)
 static int
 nvmm_vcpu_loop(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index ef896da0a21..a8222461440 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -221,7 +221,7 @@ static SegmentCache whpx_seg_h2q(const WHV_X64_SEGMENT_REGISTER *hs)
 
 static int whpx_set_tsc(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     WHV_REGISTER_NAME tsc_reg = WHvX64RegisterTsc;
     WHV_REGISTER_VALUE tsc_val;
     HRESULT hr;
@@ -260,7 +260,7 @@ static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
     HRESULT hr;
@@ -428,7 +428,7 @@ static void whpx_set_registers(CPUState *cpu, int level)
 
 static int whpx_get_tsc(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     WHV_REGISTER_NAME tsc_reg = WHvX64RegisterTsc;
     WHV_REGISTER_VALUE tsc_val;
     HRESULT hr;
@@ -449,7 +449,7 @@ static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
     uint64_t tpr, apic_base;
@@ -760,7 +760,7 @@ static int whpx_handle_portio(CPUState *cpu,
 
 static int whpx_handle_halt(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     int ret = 0;
 
     qemu_mutex_lock_iothread();
@@ -781,7 +781,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     int irq;
     uint8_t tpr;
@@ -903,7 +903,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 static void whpx_vcpu_post_run(CPUState *cpu)
 {
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
 
     env->eflags = vcpu->exit_ctx.VpContext.Rflags;
@@ -927,7 +927,7 @@ static void whpx_vcpu_post_run(CPUState *cpu)
 
 static void whpx_vcpu_process_async_events(CPUState *cpu)
 {
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
 
@@ -1333,7 +1333,7 @@ int whpx_init_vcpu(CPUState *cpu)
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = NULL;
     Error *local_error = NULL;
-    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     UINT64 freq = 0;
     int ret;
-- 
2.35.1


