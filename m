Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75FE5F3002
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 14:07:53 +0200 (CEST)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofKEi-0006AF-B9
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 08:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ofJvD-0000vY-IM
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:47:44 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ofJvB-0005nE-RJ
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:47:43 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x6so4173069pll.11
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 04:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UM5MexKR+cyBVNhqEZgvUagmw+jjLNQaHh2G7H7AC+Q=;
 b=V2dk8IWEis3whfqRCBM0VdkFwt7PVHX3fmi0NcAXzJ/V46C8vUwphjnJuynponcnLW
 XAj2jc7+POlxy1WMDenY88DEdobMUVpCK9FgKSRj1Lp4vq3VxOwjEkmI6VpzVHFHKrwf
 UNTfuP7zIFb1iPBLkuBfqgar6wtM1WpP9CyWwta2Ts8W66bd21mtPRjkZKuD76kcst5b
 fCHu8dW8ftfuNqA0Pvf7CoSHlZEQZstt5ZcTmIXxY9U1r42mCHoDl0qa9yJszr9x8xZf
 whMJw4nc1r08esA6vtdif8f149QQc4NvC/AMF9MSrSiCZDNeZGT/p0uLhsh+5Sv0C0IP
 E7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UM5MexKR+cyBVNhqEZgvUagmw+jjLNQaHh2G7H7AC+Q=;
 b=JnFWmqEMoz7LjRuQB7J6UUQfrQH7ofZ3g044i0wA07927Khlz2+I6dZQyBe0QoO612
 BR3+UPFXITAj/gylalBaW88ZtGYy0r3UmaxHs7xkckc6gfZU96l+inkDG9Ngp5x+KzU7
 pDxj+pfhtCMAjLK2xjuxpRtWsAl6Bk+tbNuY4XvjAiHYa7CQiSK2ZYLjxdMHJZUBUfe5
 phgyGCSH7hfMyaKzYJYERwSN/zjSOZtcoqlY1zAaOuXPK3yEW/5Af11S3AFWTmF0WYkv
 hwdyqrPCX7c/i+ATP2SNPBbwCMAhhoX61dmW05raB+MCoab2+Q/iGHsUibP7OqZvwGZn
 k93w==
X-Gm-Message-State: ACrzQf28ixvBNVxDlbelENP6WkSvpwESbT1Ge8dIi406PKpwLOVhZ+79
 nKVeUzQV4ZX6X+GY0AkpVtyFFA11ZNb6xg==
X-Google-Smtp-Source: AMsMyM7D8DJWz615pFxor4nrfj1kJw2B9v4kzIhr2T+QnnUpfUfQIXjE+cpLSIGPq+G3uShz0j930Q==
X-Received: by 2002:a17:90b:3b47:b0:202:a81f:4059 with SMTP id
 ot7-20020a17090b3b4700b00202a81f4059mr11880559pjb.150.1664797660248; 
 Mon, 03 Oct 2022 04:47:40 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 ix17-20020a170902f81100b001789b724712sm6979753plb.232.2022.10.03.04.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 04:47:39 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v10 4/5] target/riscv: smstateen check for fcsr
Date: Mon,  3 Oct 2022 17:17:17 +0530
Message-Id: <20221003114718.30659-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221003114718.30659-1-mchitale@ventanamicro.com>
References: <20221003114718.30659-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

If smstateen is implemented and sstateen0.fcsr is clear then the floating point
operations must return illegal instruction exception or virtual instruction
trap, if relevant.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c                        | 23 ++++++++++++
 target/riscv/insn_trans/trans_rvf.c.inc   | 43 +++++++++++++++++++++--
 target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
 3 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 71236f2b5d..8b25f885ec 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -84,6 +84,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
         !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
+
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
+        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
+    }
 #endif
     return RISCV_EXCP_NONE;
 }
@@ -2023,6 +2027,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -2059,6 +2066,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2096,6 +2107,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2135,6 +2150,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2182,6 +2201,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index a1d3eb52ad..93657680c6 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -24,9 +24,46 @@
             return false; \
 } while (0)
 
-#define REQUIRE_ZFINX_OR_F(ctx) do {\
-    if (!ctx->cfg_ptr->ext_zfinx) { \
-        REQUIRE_EXT(ctx, RVF); \
+#ifndef CONFIG_USER_ONLY
+static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
+{
+    CPUState *cpu = ctx->cs;
+    CPURISCVState *env = cpu->env_ptr;
+    uint64_t stateen = env->mstateen[index];
+
+    if (!ctx->cfg_ptr->ext_smstateen || env->priv == PRV_M) {
+        return true;
+    }
+
+    if (ctx->virt_enabled) {
+        stateen &= env->hstateen[index];
+    }
+
+    if (env->priv == PRV_U && has_ext(ctx, RVS)) {
+        stateen &= env->sstateen[index];
+    }
+
+    if (!(stateen & SMSTATEEN0_FCSR)) {
+        if (ctx->virt_enabled) {
+            ctx->virt_inst_excp = true;
+        }
+        return false;
+    }
+
+    return true;
+}
+#else
+#define smstateen_fcsr_check(ctx, index) (true)
+#endif
+
+#define REQUIRE_ZFINX_OR_F(ctx) do { \
+    if (!has_ext(ctx, RVF)) { \
+        if (!ctx->cfg_ptr->ext_zfinx) { \
+            return false; \
+        } \
+        if (!smstateen_fcsr_check(ctx, 0)) { \
+            return false; \
+        } \
     } \
 } while (0)
 
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 5d07150cd0..6c2e338c0a 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -20,18 +20,27 @@
     if (!ctx->cfg_ptr->ext_zfh) {      \
         return false;         \
     }                         \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
     if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
         return false;                  \
     }                                  \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
     if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
         return false;                         \
     }                                         \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
@@ -39,6 +48,9 @@
           ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     \
         return false;                                        \
     }                                                        \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
-- 
2.25.1


