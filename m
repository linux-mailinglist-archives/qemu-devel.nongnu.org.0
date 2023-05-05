Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397526F7A8B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:17:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujun-0008LT-OL; Thu, 04 May 2023 21:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuV-0007xa-7M
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuT-0007uZ-7T
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:58 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6439d505274so194548b3a.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248814; x=1685840814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8F3Sjh0q82oloWl6cV86F6NpqB0/qVOCdqaCJ4JeI3s=;
 b=C54y8DjQrZk/C950cf8E2E6tGH8hDsgvzwuZzijzjQA+MX5vHcrRh7/zcpg4OJbeGI
 dSbynyliiX914wHGGSYbwar6qlcMmt6BMBZ06d49JtnQcaXOOLdaeKzgnZQ0OkqUQbNk
 j8EDxM5Hjx+dqkKKfo8jS+1I6YXFW0wlW3JCPPw6nXHffx7RTaxbxqhnVb9vE6mTr2D0
 vot1bhX8o1sSphxVr1TwQXW/69KGmjCJpNukZSyryuYiZNuvfmeh7z7H/N3O7Q69Qbya
 iEuOz3DSJFaGiR6CDHLNWPZG8q7CwDmhU3eVjfmHl25mEl5KExXP7ZXPuc/C2KUNzG5V
 58hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248814; x=1685840814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8F3Sjh0q82oloWl6cV86F6NpqB0/qVOCdqaCJ4JeI3s=;
 b=dTNlS5RBdKK39qm+Zix39qpAOru/AWc0qKKf9myX+ZI+NbS+o0FbvbwG1nCZ9+1eEe
 8x+rqLVQRBHY/VVJ0WY92rdiAJuJ3zRvwm4P97x2KBCnEj6wR7x5p9vRTHljEnxAbQ+m
 NK2RAACJJXnY5AfYojDNbZp31qXcoYLGMmxPdABfRHuDzvix5KeSEX99DZhmaNAi/zb/
 WwIoL3HF8TIry177ux1IeR6Vv6bc3vtKadsB1jzmhIj2Pb3+TQhpK8IVV8rZoPpr+E3a
 oJJBUVpm+u7Vyd/RwgZKqeVLbJw7uRTE5iX4HKNH5ZHVPFSprZtZF+TXXSrcCkLSXiW4
 F99A==
X-Gm-Message-State: AC+VfDxiHN04FMQQLiSrMoxQgi4/NtFg0uWqXFI7LIfU6mcDpEn6J/9A
 lytOjswFbn+8xzON15w6YjMb3Rp4w0oAPA==
X-Google-Smtp-Source: ACHHUZ6uvpbNk7U/gO04zg6Hr91A7/I9NXVo02k8w+s4TQwgIMDPNWoixtFWf+AfEN+ywINpPyBwMA==
X-Received: by 2002:a17:902:d490:b0:1ab:d2c:a1a6 with SMTP id
 c16-20020a170902d49000b001ab0d2ca1a6mr6349822plg.69.1683248814342; 
 Thu, 04 May 2023 18:06:54 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:53 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Fei Wu <fei2.wu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 63/89] target/riscv: Separate priv from mmu_idx
Date: Fri,  5 May 2023 11:02:15 +1000
Message-Id: <20230505010241.21812-64-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fei Wu <fei2.wu@intel.com>

Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
this assumption won't last as we are about to add more mmu_idx. Here an
individual priv field is added into TB_FLAGS.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fei Wu <fei2.wu@intel.com>
Message-Id: <20230324054154.414846-2-fei2.wu@intel.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-7-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-7-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                             |  2 +-
 target/riscv/cpu_helper.c                      |  4 +++-
 target/riscv/translate.c                       |  2 ++
 target/riscv/insn_trans/trans_privileged.c.inc |  2 +-
 target/riscv/insn_trans/trans_xthead.c.inc     | 14 +-------------
 5 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 786ad047ee..9b971ee1b0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -629,7 +629,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 
 #include "exec/cpu-all.h"
@@ -656,6 +655,7 @@ FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
 FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
 FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
+FIELD(TB_FLAGS, PRIV, 25, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7579e83c3d..36d6e422d7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -83,6 +83,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     fs = EXT_STATUS_DIRTY;
     vs = EXT_STATUS_DIRTY;
 #else
+    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
+
     flags |= cpu_mmu_index(env, 0);
     fs = get_field(env->mstatus, MSTATUS_FS);
     vs = get_field(env->mstatus, MSTATUS_VS);
@@ -751,7 +753,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      */
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
+    int mode = env->priv;
     bool use_background = false;
     hwaddr ppn;
     int napot_bits = 0;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3ab8a9999e..6d59348f0c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -67,6 +67,7 @@ typedef struct DisasContext {
     RISCVExtStatus mstatus_fs;
     RISCVExtStatus mstatus_vs;
     uint32_t mem_idx;
+    uint32_t priv;
     /*
      * Remember the rounding mode encoded in the previous fp instruction,
      * which we have already installed into env->fp_status.  Or -1 for
@@ -1153,6 +1154,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     uint32_t tb_flags = ctx->base.tb->flags;
 
     ctx->pc_succ_insn = ctx->base.pc_first;
+    ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
     ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index e3bee971c6..7c2837194c 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
      * that no exception will be raised when fetching them.
      */
 
-    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
+    if (semihosting_enabled(ctx->priv == PRV_U) &&
         (pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
         pre    = opcode_at(&ctx->base, pre_addr);
         ebreak = opcode_at(&ctx->base, ebreak_addr);
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index df504c3f2c..3e13b1d74d 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -263,25 +263,13 @@ static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
 
 /* XTheadCmo */
 
-static inline int priv_level(DisasContext *ctx)
-{
-#ifdef CONFIG_USER_ONLY
-    return PRV_U;
-#else
-     /* Priv level is part of mem_idx. */
-    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
-#endif
-}
-
 /* Test if priv level is M, S, or U (cannot fail). */
 #define REQUIRE_PRIV_MSU(ctx)
 
 /* Test if priv level is M or S. */
 #define REQUIRE_PRIV_MS(ctx)                                    \
 do {                                                            \
-    int priv = priv_level(ctx);                                 \
-    if (!(priv == PRV_M ||                                      \
-          priv == PRV_S)) {                                     \
+    if (ctx->priv == PRV_U) {                                   \
         return false;                                           \
     }                                                           \
 } while (0)
-- 
2.40.0


