Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024765F2FDA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 13:53:49 +0200 (CEST)
Received: from localhost ([::1]:49104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofK15-0005lw-Ih
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 07:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ofJvA-0000uy-W4
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:47:42 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ofJv8-0005mB-KT
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:47:39 -0400
Received: by mail-pg1-x536.google.com with SMTP id e129so9446016pgc.9
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 04:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bIKmY3V4/R3k1fDtd2l4CmQgMRf9EaJEkusDrzEo5to=;
 b=WhqhwvMJMc+DhUmeQaT/6d2LA71NjgPHlNCE5B7/1ctSUkmT7hGRuvJ+O0OLiumZb0
 +Jblpo8nLXewtrGQIGN408V8Is1GVT0cqlvQTZBHrJ/1uy8/WK+JAC2lTO7M4k6u5sCn
 lZ3aQd4Z5e+MmjRk9K9YD/kODsjJUiukybXA6xhJTUryU9zrfgPvsZN9hEHNKWxOKvUP
 dDq9x7XKGqCrdWFJOT4kYCaJyK74A2w+2ifjSxc71l74wBfPqT2U04wCdDAozBjQ7uXx
 QdzPO2KKjJvWIdsvpEQX4QgL2WR2jOVjctJPVLmrkKqfJPK9Q1f5gGBIGNN3UYGwkdX8
 TBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bIKmY3V4/R3k1fDtd2l4CmQgMRf9EaJEkusDrzEo5to=;
 b=OtRyDrwBnK8X6LZcl8idOrffzrjnt2WXZRZKawH9tyLFGZMXJ7rtAAT8HVKC6w3Wpm
 th/R8DM1RQ4zIQGVA4c2i0YHMu5YfamTipsfJdAh4681M4eHAHPPlXGFswRgspPK3Imu
 DPO0GWg1LPB9TKan1EQ62Qij9zNxh5tEjf9JKNkV/AoBmrmb4LCh7S/A9BiMDUlBHLiR
 kaAEPhT0xh4D5PA5BHZbArVH2br2S6Cst+l1iZ6sGfQAIEg+AdI6NTSw5IpNK4Tu7hHb
 Rosqpg2eYChhOpootgkeyIJLT5p1nKROCENIVyA/Mn6NJXNZ+FIiW3QKX3K63L0Xnv2V
 eToA==
X-Gm-Message-State: ACrzQf13q5B7jYn3uhmAfmna9by7A9P6oG8ZRpIIFC5/nzfKFD7sPRHg
 79fShUugoFAI11KVAQThSP/peEvlmOgHPw==
X-Google-Smtp-Source: AMsMyM42wcAPsgq63tCR4IB4n3Xj5lPYU9DU+IrCX8k55mftfqTUD8aYAxGW7ODS4Pb3EmSmk/ofoA==
X-Received: by 2002:a63:fc4e:0:b0:449:5355:292 with SMTP id
 r14-20020a63fc4e000000b0044953550292mr8509298pgk.193.1664797657170; 
 Mon, 03 Oct 2022 04:47:37 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 ix17-20020a170902f81100b001789b724712sm6979753plb.232.2022.10.03.04.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 04:47:36 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v10 3/5] target/riscv: generate virtual instruction exception
Date: Mon,  3 Oct 2022 17:17:16 +0530
Message-Id: <20221003114718.30659-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221003114718.30659-1-mchitale@ventanamicro.com>
References: <20221003114718.30659-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds a mechanism to generate a virtual instruction
instruction exception instead of an illegal instruction exception
during instruction decode when virt is enabled.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/translate.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index db123da5ec..6926b639de 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -76,6 +76,7 @@ typedef struct DisasContext {
        to reset this known value.  */
     int frm;
     RISCVMXL ol;
+    bool virt_inst_excp;
     bool virt_enabled;
     const RISCVCPUConfig *cfg_ptr;
     bool hlsx;
@@ -243,7 +244,11 @@ static void gen_exception_illegal(DisasContext *ctx)
 {
     tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
                    offsetof(CPURISCVState, bins));
-    generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
+    if (ctx->virt_inst_excp) {
+        generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
+    } else {
+        generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
+    }
 }
 
 static void gen_exception_inst_addr_mis(DisasContext *ctx)
@@ -1067,6 +1072,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
+            ctx->virt_inst_excp = false;
             ctx->opcode = opcode;
             ctx->pc_succ_insn = ctx->base.pc_next + 2;
             if (decode_insn16(ctx, opcode)) {
@@ -1078,6 +1084,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         opcode32 = deposit32(opcode32, 16, 16,
                              translator_lduw(env, &ctx->base,
                                              ctx->base.pc_next + 2));
+        ctx->virt_inst_excp = false;
         ctx->opcode = opcode32;
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
 
-- 
2.25.1


