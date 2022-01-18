Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310AA4913CC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 02:56:46 +0100 (CET)
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9djp-0003is-A0
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 20:56:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZ2-0008PR-LW
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:45:38 -0500
Received: from [2607:f8b0:4864:20::102c] (port=44858
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZ0-0007R6-Eq
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:45:35 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 l6-20020a17090a4d4600b001b44bb75a8bso1357806pjh.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=saEAV+U5QX5ij3udFGhSgLtQmUuaUQ+1k7XOWCvOjiM=;
 b=L53PRI0JqrjydsQ3s3UyMPZj3t4nS9OTaNFIGMaZeBB+YfcNdKZcLqJeZkX4Iv4vFx
 dtcGV9bTX4s8T9tMqrsYBnODWvZAotxHnyjyXsrssRu5beRM0EGN74qiWl5+IWKoSS9N
 52+Uo8OhwldFNx4V13CDjB3zbg72D3Om6nWnXodGRcyStGRbjt0mN9+Xra1PzRUIsLmr
 2ja1bs7Nc7HleNJ4Y0p4DopRdIQMwqMYMv+Ch2NwBvc3mUAQ0D/lmalPl7Nf4Z/uTY2q
 WM5XcViAN4LjouG7Ipir8k9KKyYuRWs185o+c72UGRV1GJ3W3ZsW6QL7o/ONtMnoFyk3
 P49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=saEAV+U5QX5ij3udFGhSgLtQmUuaUQ+1k7XOWCvOjiM=;
 b=Ms6MoCYlndmfs1LkewSYQdpY179hr5+03su8dKR0+yjTQECeWmP4Wwz6VQMSdwRXtl
 /ArBELE3d/csKg0AyNqYKKi87Yt0GS04Z+l6voriNRUItKow3JdzVV7o59aE3hJu8Nu3
 DuVBYuhXmsJz5l17LXS2QNVrJF/0+zroBsqsoXvr1BspHPmewGOY22DGwS8rJ302RBrx
 VuWTiJfGTTqfbAxzPccfv2+03O5Qbg4PIjv4fLTnbz4CJIHSVx5nVFqswjxMCfnmUscB
 grfi+YDWDGzeT729G0McHKRlAELKaUXP7oafgL4qdDvoimFVJmJmY13VHOA7yiuBmDzV
 rrcw==
X-Gm-Message-State: AOAM530Y3blbDBnlt6kJF185sCjWoFS+jhpsMiPGezLMzzNKkhVce3lC
 HWuzMwQ+1dKjt+fdnXqCdAZgEYNOJDIgsTaJ
X-Google-Smtp-Source: ABdhPJw/SDfEldS7D5R14EJ1t73r9b58yFlwIo/VdpbGDhaTYwxnHZjVTJfCFQgX1x4pxAysV9SszA==
X-Received: by 2002:a17:902:758d:b0:14a:aef3:b5c5 with SMTP id
 j13-20020a170902758d00b0014aaef3b5c5mr10232428pll.21.1642470330806; 
 Mon, 17 Jan 2022 17:45:30 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:45:30 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/17] target/riscv: rvv-1.0: Add Zve64f extension into
 RISC-V
Date: Tue, 18 Jan 2022 09:45:04 +0800
Message-Id: <20220118014522.13613-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c        | 4 ++++
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_helper.c | 5 ++++-
 target/riscv/csr.c        | 6 +++++-
 target/riscv/translate.c  | 2 ++
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bc25d3055..2ba22503da 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -589,6 +589,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_zve64f && !cpu->cfg.ext_f) {
+            error_setg(errp, "Zve64f extension depends upon RVF.");
+            return;
+        }
         if (cpu->cfg.ext_j) {
             ext |= RVJ;
         }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d63086765..86cc94d3bb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -329,6 +329,7 @@ struct RISCVCPU {
         bool ext_icsr;
         bool ext_zfh;
         bool ext_zfhmin;
+        bool ext_zve64f;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 434a83e66a..43d498aae1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -69,12 +69,15 @@ static RISCVMXL cpu_get_xl(CPURISCVState *env)
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
     uint32_t flags = 0;
 
     *pc = env->pc;
     *cs_base = 0;
 
-    if (riscv_has_ext(env, RVV)) {
+    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve64f) {
         /*
          * If env->vl equals to VLMAX, we can use generic vector operation
          * expanders (GVEC) to accerlate the vector operations.
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index adb3d4381d..e9311cfd9d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -47,7 +47,11 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
-    if (env->misa_ext & RVV) {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (env->misa_ext & RVV ||
+        cpu->cfg.ext_zve64f) {
 #if !defined(CONFIG_USER_ONLY)
         if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 615048ec87..d3c0d44e2e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -79,6 +79,7 @@ typedef struct DisasContext {
     bool ext_ifencei;
     bool ext_zfh;
     bool ext_zfhmin;
+    bool ext_zve64f;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -894,6 +895,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
+    ctx->ext_zve64f = cpu->cfg.ext_zve64f;
     ctx->vlen = cpu->cfg.vlen;
     ctx->elen = cpu->cfg.elen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
-- 
2.31.1


