Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8844257F885
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 05:53:17 +0200 (CEST)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFp9g-0007pb-Cy
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 23:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1oFp4K-0004gf-1Q
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 23:47:44 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1oFp4I-0003z4-AR
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 23:47:43 -0400
Received: by mail-pl1-x62e.google.com with SMTP id i3so4821838pld.0
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 20:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDG96KKsx6xYR+4FXvjrMDoQsfrX7xQiKRdC8QeeS0g=;
 b=JN9ay4jVQpqvgukCO4XVOKkm7t4DappHkSNz2IExRdKLRd6AAfjMoHwntOzY9ACafe
 qwgnfR0hRefdJSfqOtABiDt1DAy9lQvGjAXMe9pSsErTMW+WmbP7deAY2M5LAejrYAJn
 k6bT7z2WIUxGoXuYxQ9zkf018HZk/oY6ZZPMQK2aPKImYBBcXhLHFp14kee8tFcgLmoR
 ilWyjDSLCpDOrBFOqwVsB2RxuM5GbdCiMHWMaINqLSB2tkuU87QxCj7HXfkZNoi6mfU4
 J8XTxXrPNmhcll3yDrbpmrRUJTXLF84tCe8khhLgPmHeXh/C+ic1wryJZk3bcW/jRX58
 pfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDG96KKsx6xYR+4FXvjrMDoQsfrX7xQiKRdC8QeeS0g=;
 b=WINwAdK/K0YxXAK3awFAFRqOIL1t59U1DUkpmE1biXpja/RIsGb7karysCiZfm0mUJ
 9CNkQA19EDSqdU0YeWXnMGBSxVvdb471hXkGt4U9fEWVCKdRWT0l+FKWYLf66cADh7s7
 +fxn0YDfghHMHPN+GJ7pXWLYbWu0bfoODbE2dYJxIG1C7YiRqA19BaR1yE4+T+vStgZX
 4V/1x1KEhiHcPCICmcdOqjuw25uTFs4rO1VdyoWG7C6TwjvNOEELnh1uTn50Hi4npecp
 2czsbHoPT//v37SzH5+pdlyz99R9qJu2p2XzOWaPHcD0diHzCetrFVcO7UIKAbvS8PpD
 rP2Q==
X-Gm-Message-State: AJIora+lm63ijG/SDNiaUoVImzghsCH0JgUvo5ZS9Fox0vp5UMm1qULs
 EWQ5Dm0eeJPQHI0jGxlTpsWPIO7ULfcWWQ==
X-Google-Smtp-Source: AGRyM1vY6MOeuP+fcdu2gEVgWkggTa9xIdZhYSDorTkSP8T0kqqk30X8SCE2frlOEXqFIg7MTBcwvw==
X-Received: by 2002:a17:902:ba94:b0:16b:fa16:15ed with SMTP id
 k20-20020a170902ba9400b0016bfa1615edmr10939969pls.8.1658720859721; 
 Sun, 24 Jul 2022 20:47:39 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a17090322c500b0016a214e4afasm7763420plg.125.2022.07.24.20.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 20:47:39 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v5 1/1] target/riscv: Add Zihintpause support
Date: Sun, 24 Jul 2022 20:47:28 -0700
Message-Id: <20220725034728.2620750-2-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725034728.2620750-1-daolu@rivosinc.com>
References: <20220725034728.2620750-1-daolu@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=daolu@rivosinc.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Added support for RISC-V PAUSE instruction from Zihintpause extension,
enabled by default.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Dao Lu <daolu@rivosinc.com>
---
 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 966e5f2dd7..d4635c7df4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -73,6 +73,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
+    ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
@@ -987,6 +988,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 561d7fa92c..4be4b82a83 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -426,6 +426,7 @@ struct RISCVCPUConfig {
     bool ext_zkt;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_zihintpause;
     bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4033565393..595fdcdad8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -149,7 +149,12 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
 sra      0100000 .....    ..... 101 ..... 0110011 @r
 or       0000000 .....    ..... 110 ..... 0110011 @r
 and      0000000 .....    ..... 111 ..... 0110011 @r
-fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
+
+{
+  pause  0000 0001   0000   00000 000 00000 0001111
+  fence  ---- pred:4 succ:4 ----- 000 ----- 0001111
+}
+
 fence_i  ---- ----   ----   ----- 001 ----- 0001111
 csrrw    ............     ..... 001 ..... 1110011 @csr
 csrrs    ............     ..... 010 ..... 1110011 @csr
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index ca8e3d1ea1..c49dbec0eb 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -792,6 +792,22 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
     return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
 }
 
+static bool trans_pause(DisasContext *ctx, arg_pause *a)
+{
+    if (!ctx->cfg_ptr->ext_zihintpause) {
+        return false;
+    }
+
+    /*
+     * PAUSE is a no-op in QEMU,
+     * end the TB and return to main loop
+     */
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp = DISAS_NORETURN;
+
+    return true;
+}
 
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
 {
-- 
2.25.1


