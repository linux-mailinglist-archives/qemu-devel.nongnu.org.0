Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8075BC32E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 08:56:27 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaAhc-0002da-W3
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 02:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oaAHq-00083R-V3
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:29:47 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oaAHc-00008P-Mp
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:29:46 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so5954494pjq.3
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 23:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qKOLOlrKYLnxVT2i8CA/EtwSKKnbk0sLlhpQ40kVUDg=;
 b=AHRaMVt4yvzRS1j6hbr7NqAfNax7hDEh7suBDcxECE8Khiis55I9s7jLQtCiV1QCmQ
 gEX1qeTrk8pFZoOgGa2gX9R1RL47Uf+4XHZTDcoCzYT/DKnhyRDjQgjm4AMTf00841En
 Zq2NdI7TwJDwUwAXvpB40Q3z3BhuGfqxAUj7C0tIpDOV4AsbqNrkNFJ8bf+mbB8rHwXk
 Tirf2OISFpmpv1jiegBBwvQE27zt1XTtusX4obHLkwZ1jyE2DjJzEdPOx2KkqKKRDT8J
 Sg9UlniW4uaXdMZhlX+cNuyEbLOmbop56R6ARXMZlo+gCT7jiZkE1zi+icBJEYzafn2r
 KiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qKOLOlrKYLnxVT2i8CA/EtwSKKnbk0sLlhpQ40kVUDg=;
 b=jn2Rflw5PQQtozy6pA4o/eY8rAAFfN0eGgo7v53JqBPYb8VPNQqrlT8zXquwhtl6G1
 zaATZj3F+RnBtu2oE3gMJ8mwvzx+v0JMtohhY/uxIu8ppcHgxlB1VYTYiwUSKkLYK6+3
 SrlI0SVP3ngOY6Trj0/iCkqwXOYcKfzUwReDBW6p5iBiLMKhrtuJ6zj1P4ypFW3XeHiT
 HYYItF0+JuswlkwungIKJaYSi40HxnrLrYsR0ecEH0xrIryTdeMRh/CMt7xY0byUcqgI
 8ngS+rwmmOHBdtVkdjsKoPLE8aqLLRvdlRPGd2KvrFkRXkLGIHTQYLptdYbGH/PGTK2F
 VYXQ==
X-Gm-Message-State: ACrzQf1YbpqBspU6P0H7XzCJDDSHIKue8r2C+cvSKzirqOsaMteu2b5H
 6oklLux56hWD3oBkjSXGuGlA5A7uq88kmg==
X-Google-Smtp-Source: AMsMyM5XiNJ3tOJ5g4ruqUC6yZdZPjEqJM2pHps76C+eBKtBhXXHMIapwBBp1K1bhdB1mI0oqjV0GA==
X-Received: by 2002:a17:90b:17c3:b0:202:bc13:e4e7 with SMTP id
 me3-20020a17090b17c300b00202bc13e4e7mr18335132pjb.125.1663568967521; 
 Sun, 18 Sep 2022 23:29:27 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.74.146])
 by smtp.googlemail.com with ESMTPSA id
 y1-20020a17090264c100b001782580ce9csm17678574pli.249.2022.09.18.23.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 23:29:26 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v9 3/4] target/riscv: smstateen check for fcsr
Date: Mon, 19 Sep 2022 11:59:07 +0530
Message-Id: <20220919062908.643945-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919062908.643945-1-mchitale@ventanamicro.com>
References: <20220919062908.643945-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 target/riscv/csr.c                        | 23 +++++++++++++
 target/riscv/insn_trans/trans_rvf.c.inc   | 40 +++++++++++++++++++++--
 target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
 3 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 59d5aa74ee..edaecf53ce 100644
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
@@ -2024,6 +2028,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -2072,6 +2079,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2121,6 +2132,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2172,6 +2187,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2231,6 +2250,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
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


