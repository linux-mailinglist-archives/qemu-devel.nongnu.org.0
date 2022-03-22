Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F364E3FCD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:47:01 +0100 (CET)
Received: from localhost ([::1]:43338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWeqi-0003r3-Iu
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:47:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWemZ-0006tC-SC
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:42:43 -0400
Received: from [2607:f8b0:4864:20::42f] (port=35624
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWemY-0006jG-Cj
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:42:43 -0400
Received: by mail-pf1-x42f.google.com with SMTP id a5so18231648pfv.2
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=21r0MTqTy6EW9WiBP4H36YUfZKCd0c+Ilx4FpjjR+bM=;
 b=LsZYHay1vLbAR8SI2Rj30PnLUa5jxVmhbxElnE/aUzv48U1Alku4cQgNoTo6NZChx8
 Dl97ofpfL51ozRW8JVHy5pjGfDhFpff6/dyLJcpWO/mD19tIkWtrVXOVZtVU/PCPOtqo
 I0cqJC7sMPkdxD04/on/69s0ZdHAy42i47V5gp7m5yfVPyxsCEniEN0wQed1gRmVucb5
 3IumG7L3If3btIF9W7geN3QDj2IWz7T3YlrCsD6a0Cje2A5pOKJeInX0t5GM4J2Q4vV3
 CEEHze0X8NTbz8w7rc1pGJfr7jrTTF6SV3Z7NOmzQQpDpzkblIrWijsDFPFTOp2Qxy58
 GVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=21r0MTqTy6EW9WiBP4H36YUfZKCd0c+Ilx4FpjjR+bM=;
 b=ID8QKCeDrPnlTYRfbM9QjfxkoRgn+O8PNmdnL2MpE9u0EGkYPRiX2FUwfI2Dtu5ygt
 V43hKk97rJJ9t2B4uW8sqc4mtGHBnm1bisp2n2QmptmpO0a40L2RFiUVfpZy/lHJTWSb
 7/0CY0s0wVSJ+LlrJCMiC75MlVsA6UyKAtWBX4VJVJTEzUVCNyuZKgh/6gBMLnxAu2Db
 F/9b0RbQ5Et2cooL854ggHOtln06M2hPROl5FFAz+dcRFkktNI4lt/185jJhi5Tqiuxz
 PVoN0HhxZLqTMasMkKJxnC31znZplq/H/6UejYT8dFSoL483Bc1Uakv5kkMrU68fFEgj
 MFXw==
X-Gm-Message-State: AOAM5327VC29suYoDtI136T1FBKUAtReW5fWXKWafzBlC5rvQVNS09f+
 JGiajzcdzh5BSyun6r9+s9/BxA==
X-Google-Smtp-Source: ABdhPJzIT9P54TkWxtJDLib7vJbj7Vwnsn7EDEIoVCA/8BWcbe2MnGf6bvtG+u4Xg89A5ZbUOdGB+Q==
X-Received: by 2002:a05:6a00:24cd:b0:4f7:2340:a6cf with SMTP id
 d13-20020a056a0024cd00b004f72340a6cfmr29243438pfv.36.1647956560270; 
 Tue, 22 Mar 2022 06:42:40 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm3101216pjb.2.2022.03.22.06.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:42:39 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v1 3/4] target/riscv: smstateen check for fcsr
Date: Tue, 22 Mar 2022 19:12:17 +0530
Message-Id: <20220322134218.27322-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322134218.27322-1-mchitale@ventanamicro.com>
References: <20220322134218.27322-1-mchitale@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If smstateen is implemented and sstateen0.fcsr is clear
then the floating point operations must return illegal
instruction exception.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 46761a6fa8..5d7381c771 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -75,6 +75,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
         !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
+
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
+        return smstateen_acc_ok(env, PRV_U, SMSTATEEN0_FCSR);
+    }
 #endif
     return RISCV_EXCP_NONE;
 }
@@ -2005,6 +2009,10 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
     uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0];
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     write_smstateen(env, reg, wr_mask, new_val);
 
     return RISCV_EXCP_NONE;
@@ -2028,6 +2036,10 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
     reg = &env->mstateen[csrno - CSR_MSTATEEN0H - 0x10];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     write_smstateen(env, reg, wr_mask, val);
 
     return RISCV_EXCP_NONE;
@@ -2048,6 +2060,10 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
     uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
     int index = csrno - CSR_HSTATEEN0;
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->hstateen[index];
     wr_mask &= env->mstateen[index];
     write_smstateen(env, reg, wr_mask, new_val);
@@ -2071,6 +2087,10 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
     uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
     int index = csrno - CSR_HSTATEEN0H - 0x10;
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->hstateen[index];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
@@ -2096,6 +2116,10 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
     int index = csrno - CSR_SSTATEEN0;
     bool virt = riscv_cpu_virt_enabled(env);
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->sstateen[index];
     if (virt) {
         wr_mask &= env->mstateen[index];
-- 
2.17.1


