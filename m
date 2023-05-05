Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF76F7A9C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrr-0008Hs-Dm; Thu, 04 May 2023 21:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrk-0008Go-HX
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:09 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujri-0006xs-IU
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:08 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1a50cb65c92so8231235ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248645; x=1685840645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MYKoZRgqijJtTAATIS/Z9PJuep3yN5xuWDKdqT5dlQ=;
 b=oq+Wr9q/HG4FDuAbKE0Si98DnfZ6X2MB9oaBbIjQ6bSikH4lPdGF1oJb8v/pH7Ejix
 riogKS263oeNMr3CPLn6xoRrzbz/XkH900c9ipdhoPyFux36Ddq5LZ7Y6pONx1wdi5el
 s/Gl9FgzI8+rc8Nu0HUFxdo6Fhc1VqVxiqSch4WFFYvfBPf7j4OvA1B+M4hT0nAbbNWF
 79axN7TUEbWhS3/5uUZy6NqNMJpQZl/ZvqgmaIxVFLwY3x8c3TwNss1yv73IUVVZV6UN
 1lHuL7vtmntPB1NckS3WfFUhh53uYe4yrpMVyMFmKkwfUhNHTXPS01poqMyG4c9GtTwZ
 vwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248645; x=1685840645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9MYKoZRgqijJtTAATIS/Z9PJuep3yN5xuWDKdqT5dlQ=;
 b=hHVWGElgzXYvuuHLvFcE/v2QJR8Yk2Vtqgw5PBV19zDABaxC3LE9svK1bhjVzrdqkq
 jqcfn0TcpqPlSVPgIfPTf0YYCvXS6ORQWfKDDjadJAsnb6ndIfC2jXGF3CA+SIhjKPwS
 w4CR2QNWKbm4lynrHk6/HKxeQvVpLc1Q0x/7ZHd8JRolvqBNo4gGokJw1Z5qUC1lLnYW
 g2bHNeKBHJJ/vlbsKpjYMx5nAbsO78X5SpQCFKPG9IGzDnL5xJDSsjzqYm3GuWGOtUeR
 p0K9+glGfH9R6iQtY+0Z2FAn8ZrwqjBT4Z9EyFLzp5c6XJ+MTLCSRReCOqFF7eKGfHCC
 gHUw==
X-Gm-Message-State: AC+VfDxIKhmo5r3GWVpXcqyH48VKv0PB4WepIyyTvt1gxidTGrn9+ocB
 gU1jqh8Wbu9dkv3PfikF0U7JMsMGJe7hAA==
X-Google-Smtp-Source: ACHHUZ4cI0Dk3HG2zJ4hRfLe2U3tK0ObMa5s2n/lTCedKyR7TIUvoIDrAKbWKEABQ6rGmeJ2HPWA1A==
X-Received: by 2002:a17:903:1108:b0:1ab:624:38cb with SMTP id
 n8-20020a170903110800b001ab062438cbmr6165679plh.14.1683248644738; 
 Thu, 04 May 2023 18:04:04 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:04 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/89] target/riscv: add support for Zcmp extension
Date: Fri,  5 May 2023 11:01:26 +1000
Message-Id: <20230505010241.21812-15-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x636.google.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add encode, trans* functions for Zcmp instructions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230307081403.61950-7-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16.decode                |  18 +++
 target/riscv/translate.c                  |   5 +
 target/riscv/insn_trans/trans_rvzce.c.inc | 187 +++++++++++++++++++++-
 3 files changed, 209 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index ab780fa46a..55c9574299 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -21,6 +21,8 @@
 %rs1_3     7:3                !function=ex_rvc_register
 %rs2_3     2:3                !function=ex_rvc_register
 %rs2_5     2:5
+%r1s       7:3                !function=ex_sreg_register
+%r2s       2:3                !function=ex_sreg_register
 
 # Immediates:
 %imm_ci        12:s1 2:5
@@ -45,6 +47,8 @@
 
 %uimm_cl_b  5:1 6:1
 %uimm_cl_h  5:1                      !function=ex_shift_1
+%spimm      2:2                      !function=ex_shift_4
+%urlist     4:4
 
 # Argument sets imported from insn32.decode:
 &empty                  !extern
@@ -56,7 +60,9 @@
 &u         imm rd       !extern
 &shift     shamt rs1 rd !extern
 &r2        rd rs1       !extern
+&r2_s      rs1 rs2      !extern
 
+&cmpp      urlist spimm
 
 # Formats 16:
 @cr        ....  ..... .....  .. &r      rs2=%rs2_5       rs1=%rd     %rd
@@ -97,6 +103,8 @@
 @cl_h         ... . .. ... .. ... ..  &i  imm=%uimm_cl_h  rs1=%rs1_3 rd=%rs2_3
 @cs_b         ... . .. ... .. ... ..  &s  imm=%uimm_cl_b  rs1=%rs1_3 rs2=%rs2_3
 @cs_h         ... . .. ... .. ... ..  &s  imm=%uimm_cl_h  rs1=%rs1_3 rs2=%rs2_3
+@cm_pp        ... ...  ........   ..  &cmpp  %urlist      %spimm
+@cm_mv        ... ...  ... .. ... ..  &r2_s  rs2=%r2s     rs1=%r1s
 
 # *** RV32/64C Standard Extension (Quadrant 0) ***
 {
@@ -176,6 +184,16 @@ slli              000 .  .....  ..... 10 @c_shift2
 {
   sq              101  ... ... .. ... 10 @c_sqsp
   c_fsd           101   ......  ..... 10 @c_sdsp
+
+  # *** RV64 and RV32 Zcmp Extension ***
+  [
+    cm_push         101  11000  .... .. 10 @cm_pp
+    cm_pop          101  11010  .... .. 10 @cm_pp
+    cm_popret       101  11110  .... .. 10 @cm_pp
+    cm_popretz      101  11100  .... .. 10 @cm_pp
+    cm_mva01s       101  011 ... 11 ... 10 @cm_mv
+    cm_mvsa01       101  011 ... 01 ... 10 @cm_mv
+  ]
 }
 sw                110 .  .....  ..... 10 @c_swsp
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3634137d85..6872d17fb9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -757,6 +757,11 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
     return 8 + reg;
 }
 
+static int ex_sreg_register(DisasContext *ctx, int reg)
+{
+    return reg < 2 ? reg + 8 : reg + 16;
+}
+
 static int ex_rvc_shiftli(DisasContext *ctx, int imm)
 {
     /* For RV128 a shamt of 0 means a shift by 64. */
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index de96c4afaf..a47959eb67 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the Zcb Standard Extension.
+ * RISC-V translation routines for the Zc[b,mp] Standard Extensions.
  *
  * Copyright (c) 2021-2022 PLCT Lab
  *
@@ -21,6 +21,11 @@
         return false;           \
 } while (0)
 
+#define REQUIRE_ZCMP(ctx) do {   \
+    if (!ctx->cfg_ptr->ext_zcmp) \
+        return false;            \
+} while (0)
+
 static bool trans_c_zext_b(DisasContext *ctx, arg_c_zext_b *a)
 {
     REQUIRE_ZCB(ctx);
@@ -98,3 +103,183 @@ static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
     REQUIRE_ZCB(ctx);
     return gen_store(ctx, a, MO_UW);
 }
+
+#define X_S0    8
+#define X_S1    9
+#define X_Sn    16
+
+static uint32_t decode_push_pop_list(DisasContext *ctx, target_ulong rlist)
+{
+    uint32_t reg_bitmap = 0;
+
+    if (ctx->cfg_ptr->ext_e && rlist > 6) {
+        return 0;
+    }
+
+    switch (rlist) {
+    case 15:
+        reg_bitmap |=  1 << (X_Sn + 11) ;
+        reg_bitmap |=  1 << (X_Sn + 10) ;
+        /* FALL THROUGH */
+    case 14:
+        reg_bitmap |=  1 << (X_Sn + 9) ;
+        /* FALL THROUGH */
+    case 13:
+        reg_bitmap |=  1 << (X_Sn + 8) ;
+        /* FALL THROUGH */
+    case 12:
+        reg_bitmap |=  1 << (X_Sn + 7) ;
+        /* FALL THROUGH */
+    case 11:
+        reg_bitmap |=  1 << (X_Sn + 6) ;
+        /* FALL THROUGH */
+    case 10:
+        reg_bitmap |=  1 << (X_Sn + 5) ;
+        /* FALL THROUGH */
+    case 9:
+        reg_bitmap |=  1 << (X_Sn + 4) ;
+        /* FALL THROUGH */
+    case 8:
+        reg_bitmap |=  1 << (X_Sn + 3) ;
+        /* FALL THROUGH */
+    case 7:
+        reg_bitmap |=  1 << (X_Sn + 2) ;
+        /* FALL THROUGH */
+    case 6:
+        reg_bitmap |=  1 << X_S1 ;
+        /* FALL THROUGH */
+    case 5:
+        reg_bitmap |= 1 << X_S0;
+        /* FALL THROUGH */
+    case 4:
+        reg_bitmap |= 1 << xRA;
+        break;
+    default:
+        break;
+    }
+
+    return reg_bitmap;
+}
+
+static bool gen_pop(DisasContext *ctx, arg_cmpp *a, bool ret, bool ret_val)
+{
+    REQUIRE_ZCMP(ctx);
+
+    uint32_t reg_bitmap = decode_push_pop_list(ctx, a->urlist);
+    if (reg_bitmap == 0) {
+        return false;
+    }
+
+    MemOp memop = get_ol(ctx) == MXL_RV32 ? MO_TEUL : MO_TEUQ;
+    int reg_size = memop_size(memop);
+    target_ulong stack_adj = ROUND_UP(ctpop32(reg_bitmap) * reg_size, 16) +
+                             a->spimm;
+    TCGv sp = dest_gpr(ctx, xSP);
+    TCGv addr = tcg_temp_new();
+    int i;
+
+    tcg_gen_addi_tl(addr, sp, stack_adj - reg_size);
+
+    for (i = X_Sn + 11; i >= 0; i--) {
+        if (reg_bitmap & (1 << i)) {
+            TCGv dest = dest_gpr(ctx, i);
+            tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
+            gen_set_gpr(ctx, i, dest);
+            tcg_gen_subi_tl(addr, addr, reg_size);
+        }
+    }
+
+    tcg_gen_addi_tl(sp, sp, stack_adj);
+    gen_set_gpr(ctx, xSP, sp);
+
+    if (ret_val) {
+        gen_set_gpr(ctx, xA0, ctx->zero);
+    }
+
+    if (ret) {
+        TCGv ret_addr = get_gpr(ctx, xRA, EXT_NONE);
+        gen_set_pc(ctx, ret_addr);
+        tcg_gen_lookup_and_goto_ptr();
+        ctx->base.is_jmp = DISAS_NORETURN;
+    }
+
+    return true;
+}
+
+static bool trans_cm_push(DisasContext *ctx, arg_cm_push *a)
+{
+    REQUIRE_ZCMP(ctx);
+
+    uint32_t reg_bitmap = decode_push_pop_list(ctx, a->urlist);
+    if (reg_bitmap == 0) {
+        return false;
+    }
+
+    MemOp memop = get_ol(ctx) == MXL_RV32 ? MO_TEUL : MO_TEUQ;
+    int reg_size = memop_size(memop);
+    target_ulong stack_adj = ROUND_UP(ctpop32(reg_bitmap) * reg_size, 16) +
+                             a->spimm;
+    TCGv sp = dest_gpr(ctx, xSP);
+    TCGv addr = tcg_temp_new();
+    int i;
+
+    tcg_gen_subi_tl(addr, sp, reg_size);
+
+    for (i = X_Sn + 11; i >= 0; i--) {
+        if (reg_bitmap & (1 << i)) {
+            TCGv val = get_gpr(ctx, i, EXT_NONE);
+            tcg_gen_qemu_st_tl(val, addr, ctx->mem_idx, memop);
+            tcg_gen_subi_tl(addr, addr, reg_size);
+        }
+    }
+
+    tcg_gen_subi_tl(sp, sp, stack_adj);
+    gen_set_gpr(ctx, xSP, sp);
+
+    return true;
+}
+
+static bool trans_cm_pop(DisasContext *ctx, arg_cm_pop *a)
+{
+    return gen_pop(ctx, a, false, false);
+}
+
+static bool trans_cm_popret(DisasContext *ctx, arg_cm_popret *a)
+{
+    return gen_pop(ctx, a, true, false);
+}
+
+static bool trans_cm_popretz(DisasContext *ctx, arg_cm_popret *a)
+{
+    return gen_pop(ctx, a, true, true);
+}
+
+static bool trans_cm_mva01s(DisasContext *ctx, arg_cm_mva01s *a)
+{
+    REQUIRE_ZCMP(ctx);
+
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_set_gpr(ctx, xA0, src1);
+    gen_set_gpr(ctx, xA1, src2);
+
+    return true;
+}
+
+static bool trans_cm_mvsa01(DisasContext *ctx, arg_cm_mvsa01 *a)
+{
+    REQUIRE_ZCMP(ctx);
+
+    if (a->rs1 == a->rs2) {
+        return false;
+    }
+
+    TCGv a0 = get_gpr(ctx, xA0, EXT_NONE);
+    TCGv a1 = get_gpr(ctx, xA1, EXT_NONE);
+
+    gen_set_gpr(ctx, a->rs1, a0);
+    gen_set_gpr(ctx, a->rs2, a1);
+
+    return true;
+}
-- 
2.40.0


