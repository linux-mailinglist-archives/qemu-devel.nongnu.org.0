Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0465C53CD0B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 18:18:06 +0200 (CEST)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx9zx-0002rw-4K
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 12:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nx9n7-00017O-Sr
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:04:50 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nx9n4-0008I8-Sq
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:04:49 -0400
Received: by mail-pg1-x52b.google.com with SMTP id u4so4579636pgk.11
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iUIUDpa9FvNNgNq7/3rUENBfEESSF9Q8iuNpkRZi4vE=;
 b=JWbW4dz/UzNfvsu4SRpuU3L94TmkplXtvMHm6ij4L77OqeBT3pxshE9cJCOgTAZo2q
 rpZJrgOZJQ54VTCKRGjQfh+EZGA5qgZYtf6zJC1EHiJvJx7+0nFsnILiL8eX3fgSgFCr
 z6Rs0Xv3MXINnwhyua2fhzhI/tqLWFqA7V43vcVwjE9W5d3fmhiZ0eG3OPwo/surSvUX
 5+Qime9SdDeC7YUuCsQQPwzI7Te1TJyWieXE8N+esDwf1+VfRmlhNhp6gE/T7iuoXI3T
 BE2DP/A40IBu500+V9le3JNL7Dn29/Vaogza8z+w1Is7TB9K98DJyuulj6dvsvM/MTFW
 rcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iUIUDpa9FvNNgNq7/3rUENBfEESSF9Q8iuNpkRZi4vE=;
 b=1QLnU9zlGfRnE2u8eYki2oVqLUdvC7nt6pB2czELTljBRLWxRRKZhjk574G1vc4OME
 uKpP7rt36lxjPLuVkMIA5bGDhFueZU5BgWy3TGFdYWEUDZ1C68fOAIrx8K3j+rjD943v
 MrYW8PgiZTyg5XHnZctEdpP6WldIu2akaIBa4LfSadP7R0x4czhowAsdwBazCZIHVy89
 q6mdE8r5kxYc1sCjDwO00/vfhVi+pYz3ewcPY/ubu5RKcLhsDlspmQmNH20wGM1Mteg+
 sZwRv+1c9CdL+NZyHuhU2T/RIukHTzksaiu+co917DQF4Lrhz4EFf00OCCQI5NwJjCjR
 DWjA==
X-Gm-Message-State: AOAM531gFrdNlJXSKfAJz66NMk+rUDDTOIrQPePoz+pRc2FP7O3vzLZR
 v4YdvtQYiwGNbDebKOnqvZFEbyL3dQAuXQ==
X-Google-Smtp-Source: ABdhPJwpYYCYbFRjg6WR9F9I78ZYSz+4B/PGlGoh+io2oDgqikVnEYBf2qXQMWOPQP1ITqBrq5xyQg==
X-Received: by 2002:a65:6cc9:0:b0:399:26da:29af with SMTP id
 g9-20020a656cc9000000b0039926da29afmr9517316pgw.489.1654272282498; 
 Fri, 03 Jun 2022 09:04:42 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.0.22])
 by smtp.googlemail.com with ESMTPSA id
 z12-20020a1709027e8c00b0016196bd15f4sm5638035pla.15.2022.06.03.09.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 09:04:41 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v5 2/4] target/riscv: smstateen check for h/senvcfg
Date: Fri,  3 Jun 2022 21:34:23 +0530
Message-Id: <20220603160425.3667456-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220603160425.3667456-1-mchitale@ventanamicro.com>
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Accesses to henvcfg, henvcfgh and senvcfg are allowed
only if corresponding bit in mstateen0/hstateen0 is
enabled. Otherwise an illegal instruction trap is
generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 84 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 78 insertions(+), 6 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 324fefce59..ae91ae1f7e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -39,6 +39,37 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
+static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    bool virt = riscv_cpu_virt_enabled(env);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_NONE;
+    }
+
+#if !defined(CONFIG_USER_ONLY)
+    if (!(env->mstateen[0] & 1UL << bit)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (virt) {
+        if (!(env->hstateen[0] & 1UL << bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    if (mode == PRV_U) {
+        if (!(env->sstateen[0] & 1UL << bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+#endif
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1557,6 +1588,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->senvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1565,15 +1603,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
+    RISCVException ret;
 
-    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1582,6 +1632,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= HENVCFG_PBMTE | HENVCFG_STCE;
@@ -1595,6 +1651,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
 static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg >> 32;
     return RISCV_EXCP_NONE;
 }
@@ -1604,9 +1667,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
 {
     uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
     uint64_t valh = (uint64_t)val << 32;
+    RISCVException ret;
 
-    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
     return RISCV_EXCP_NONE;
 }
 
@@ -1628,7 +1696,8 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
                                      target_ulong new_val)
 {
     uint64_t *reg;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0];
     write_smstateen(env, reg, wr_mask, new_val);
@@ -1649,7 +1718,8 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
 {
     uint64_t *reg;
     uint64_t val;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
     val = (uint64_t)new_val << 32;
@@ -1671,7 +1741,8 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
                                      target_ulong new_val)
 {
     uint64_t *reg;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
     int index = csrno - CSR_HSTATEEN0;
 
     reg = &env->hstateen[index];
@@ -1694,8 +1765,9 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
 {
     uint64_t *reg;
     uint64_t val;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
     int index = csrno - CSR_HSTATEEN0H;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->hstateen[index];
     val = (uint64_t)new_val << 32;
-- 
2.25.1


