Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D19586F9A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 19:34:43 +0200 (CEST)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIZJS-0000M1-O4
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 13:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oIZ4v-0004jW-32
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 13:19:41 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oIZ4r-0006hp-Gd
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 13:19:40 -0400
Received: by mail-pg1-x529.google.com with SMTP id 12so10270942pga.1
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 10:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RpgqIBfXejfb09y7nbpUgiujczZM9oDI0g2Jg2a1vdw=;
 b=nplQzj4u5JViDirKWLKoDct041Kh1fj9nm6HLVwkeGeaDyJVQsQSbDg+XR1ZoiMFa4
 U+ePv4ZU8RI8J70hvC1gTHN71a9Zf+laDJDqVTUgSoSOIWddyotplmPg6/jWelSJHepn
 G7UXbbORcEBoJfPALKUwcfqCMDF7LNV4azD3xP4YfSCysC+JMlu0XIoub3sPTedjRp87
 ncXV8TjO4z0Qyl+QgrHPlVbHvzg0UiFv8lxqkH0HV+RbAAsukKlYblwn9MvvMXA43xNO
 d60t2fL1JZdKoER31JG1X5mdS+l0f6NZgAn7Y3AlTG9C4bcqhXG68hbygr7u+Z2XTozT
 mjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RpgqIBfXejfb09y7nbpUgiujczZM9oDI0g2Jg2a1vdw=;
 b=ClpNaoHoewYpIKDZmP0j10QLUo9KEVfK2RMwRYpWyHi+yl5VmjjbQ1ckzAPbp288Rx
 SlBKSOCpEdTT1q0T6BfWiK1VmmQISmp/8SpAfLV8A9PIuKmgSMcTofSimM5WwXPALv92
 1k/I2A1jPr8NgF7idIYIlkj58U6EJ3alUrKEQ9+F7O6/57toYzszKIH+MnB8oI7564fI
 3gNYLw74PHQjUTj5Lpk57XQSQ6/XgApa/KyYId0MCawDcxmUlMoqSUOrJDZiJD9nMJeG
 tBdaJwGk6FatBZAywCEz6OmQgKvDznVn+qWaKLMoGsaPnmccGgeiLrxyDfrVJUeVwf5T
 +YrQ==
X-Gm-Message-State: ACgBeo26QbAa1LhXEX1TN3baGzCxuFnUexRJkRsInGIkHO05BoSwxHrl
 Z6irEz3qYEQYAdjBbWK4XrwKrVvXMlreAA==
X-Google-Smtp-Source: AA6agR4XT9FumtH2kQGMfyZoyK1UoMW3ddawg+7TQXDEb6qhc/U/adrshwBVybbB23CmLrzSuHdoHQ==
X-Received: by 2002:a63:8049:0:b0:41b:e8db:d916 with SMTP id
 j70-20020a638049000000b0041be8dbd916mr6797203pgd.40.1659374375867; 
 Mon, 01 Aug 2022 10:19:35 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.176.236.198])
 by smtp.googlemail.com with ESMTPSA id
 i10-20020a056a00004a00b0052ab602a7d0sm1709942pfk.100.2022.08.01.10.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 10:19:35 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v7 3/4] target/riscv: smstateen check for fcsr
Date: Mon,  1 Aug 2022 22:48:42 +0530
Message-Id: <20220801171843.72986-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801171843.72986-1-mchitale@ventanamicro.com>
References: <20220801171843.72986-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If smstateen is implemented and sstateen0.fcsr is clear then the
floating point operations must return illegal instruction exception.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c                        | 23 +++++++++++++
 target/riscv/insn_trans/trans_rvf.c.inc   | 40 +++++++++++++++++++++--
 target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
 3 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 011d6c5976..0512391220 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -79,6 +79,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
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
@@ -1866,6 +1870,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -1914,6 +1921,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -1963,6 +1974,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2014,6 +2029,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2073,6 +2092,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index a1d3eb52ad..ce8a0cc34b 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -24,9 +24,43 @@
             return false; \
 } while (0)
 
-#define REQUIRE_ZFINX_OR_F(ctx) do {\
-    if (!ctx->cfg_ptr->ext_zfinx) { \
-        REQUIRE_EXT(ctx, RVF); \
+#ifndef CONFIG_USER_ONLY
+static inline bool smstateen_check(DisasContext *ctx, int index)
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
+        return false;
+    }
+
+    return true;
+}
+#else
+#define smstateen_check(ctx, index) (true)
+#endif
+
+#define REQUIRE_ZFINX_OR_F(ctx) do { \
+    if (!has_ext(ctx, RVF)) { \
+        if (!ctx->cfg_ptr->ext_zfinx) { \
+            return false; \
+        } \
+        if (!smstateen_check(ctx, 0)) { \
+            return false; \
+        } \
     } \
 } while (0)
 
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 5d07150cd0..44d962c920 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -20,18 +20,27 @@
     if (!ctx->cfg_ptr->ext_zfh) {      \
         return false;         \
     }                         \
+    if (!smstateen_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
     if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
         return false;                  \
     }                                  \
+    if (!smstateen_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
     if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
         return false;                         \
     }                                         \
+    if (!smstateen_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
@@ -39,6 +48,9 @@
           ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     \
         return false;                                        \
     }                                                        \
+    if (!smstateen_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
-- 
2.25.1


