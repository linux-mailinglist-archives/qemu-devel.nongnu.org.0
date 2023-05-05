Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524226F7A4F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:05:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrY-00087e-0o; Thu, 04 May 2023 21:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrW-00087M-8I
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:54 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrU-0006uc-N6
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:54 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-51f1b6e8179so747440a12.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248631; x=1685840631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TItCTzTkSU2louEtCfJ4UF91sjN6WTuYpCMNNVreXeY=;
 b=Xc3uxRdmeBBefQU+gSp21Xr2HA0k5bqPSfeOB7jw2XAOdz36vLF63T97FurN6ESpBN
 sIEBFlQOg87W2XfrEYAslKCg5wfss5ZzUQww1HKhqf6Jr+sC6nKtOVJ+Lvhmu4jZoOqX
 W0Om+bonIQrbZdDqFeSKza5vWP5bdNzbjbZGxn6dHsua32M7GMSVm/OMNATmlxxVeA9z
 4mBwnEVuGYwfGiWismChc4PT29Xhs7odTAFh85lSWPJE6hZZY4w68z46vNwnDgEZUKbn
 3Vx37IYirpthl+sIh8eUIsSFyoLpcqYJa19n9wr4AwP7beSoJLNDbhdee/U4Nx+jbtmX
 KyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248631; x=1685840631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TItCTzTkSU2louEtCfJ4UF91sjN6WTuYpCMNNVreXeY=;
 b=fKpE1m3Z5r0lQFwa6UoQN98+C573Cr1BM2mabNqMoVFOpZXMQ0RUefbPkWTd1ozhWl
 A9B+5r+NQa4+R4hdoY6UJIiRLsFSTVGQdDZJJtNhRxl1jTa+PIbuQUX/qzHocCfTvP5F
 H+L8CjGkN1xWZNk4Ktg6HbIdo4NcQe7KJCKDpgv23sTa8+4krnBb50enqBTLQi48Bq4P
 Jejz4FkkeBN7VhZ6MFDov0WfnED8qPY75MoVN522OIpQtd8y5TUV4/PPhPT5xEqvHsSC
 K7wIAaYv/nJM+6jGVZM2e9Ea4hq7QSGqT5PDLJ1Mk9UT9P6IrdmcUes5A/78Hs+N0K5J
 hFzQ==
X-Gm-Message-State: AC+VfDyHj8uZ6OHRqZv31vpl2fZ5s8357IUL8XlAdd93cUfIQ2AixRGX
 aQux8w5aerVn3GnK6tNKEqkJQLGLZqGwWQ==
X-Google-Smtp-Source: ACHHUZ4lXVcFBeiP6rkISz0F0PRStFyCMD9cFlwIgBpmmr6IMmWKtAmCHBqK6SagVFhxpsOr1vf0Qg==
X-Received: by 2002:a17:903:11c8:b0:1ab:fb6:1e72 with SMTP id
 q8-20020a17090311c800b001ab0fb61e72mr6762060plh.42.1683248630976; 
 Thu, 04 May 2023 18:03:50 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:50 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL 10/89] target/riscv: add support for Zca extension
Date: Fri,  5 May 2023 11:01:22 +1000
Message-Id: <20230505010241.21812-11-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x536.google.com
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

Modify the check for C extension to Zca (C implies Zca).

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-Id: <20230307081403.61950-3-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 8 ++++++--
 target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0ee8ee147d..d1fdd0c2d7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 
     /* check misaligned: */
     next_pc = ctx->base.pc_next + imm;
-    if (!has_ext(ctx, RVC)) {
+    if (!ctx->cfg_ptr->ext_zca) {
         if ((next_pc & 0x3) != 0) {
             gen_exception_inst_addr_mis(ctx);
             return;
@@ -1122,7 +1122,11 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
     if (insn_len(opcode) == 2) {
         ctx->opcode = opcode;
         ctx->pc_succ_insn = ctx->base.pc_next + 2;
-        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
+        /*
+         * The Zca extension is added as way to refer to instructions in the C
+         * extension that do not include the floating-point loads and stores
+         */
+        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
             return;
         }
     } else {
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 4ad54e8a49..c70c495fc5 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
     gen_set_pc(ctx, cpu_pc);
-    if (!has_ext(ctx, RVC)) {
+    if (!ctx->cfg_ptr->ext_zca) {
         TCGv t0 = tcg_temp_new();
 
         misaligned = gen_new_label();
@@ -169,7 +169,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 
     gen_set_label(l); /* branch taken */
 
-    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
+    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
         /* misaligned */
         gen_exception_inst_addr_mis(ctx);
     } else {
-- 
2.40.0


