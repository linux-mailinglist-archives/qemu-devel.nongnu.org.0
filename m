Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D4A4E5133
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:21:16 +0100 (CET)
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWz3C-0004DP-RV
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:21:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWyvy-000590-HO
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:13:46 -0400
Received: from [2607:f8b0:4864:20::1029] (port=55899
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWyvw-0007lE-H1
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:13:46 -0400
Received: by mail-pj1-x1029.google.com with SMTP id jx9so1323126pjb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VoEILtSFhp+UciYDcIHgF0YUSGOihXo4pPvWpk3MjZA=;
 b=ZqOp8zevlvuiNd4KHmDy5ecjTCYQco9I/ObxHGX4cFEA+011+BggHcJTob14inflFv
 gd3cqeEp2ZSmeiljAKDgiHXtURT3vaVmxMD1eimF11jaunEG3diBg5/Ymuu/Me+G6WXg
 NljYKEm3Tfs1ZANOXz0JP4jQlSySztldYuZbcbMHS1yF3M+/C6pcYL/wC2Zir1Jyl7Bz
 1iMU21AFRdaKdAutijDctbfgRi4XDSx0LimN7/gk1Dlv3H/oshXfzsBWmahi3nwNpNuC
 REBQ1WxOxuXDilu2k8R0okZnTw7hExbY1KgEoB+hqokfOg/Jt59bkH3Kj3vRdsa+sgjY
 telg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VoEILtSFhp+UciYDcIHgF0YUSGOihXo4pPvWpk3MjZA=;
 b=5RM4miwW9U3NZ/0mLif/bWGreHXq2A8w2Oo+riI1H5nZWw8JXF8vaXweKMwaBXq/F9
 6bXhCQWKbOkMR1XBhS+Bw7HW0mZ2u5wkPntFxI7DrPP4yQMI4ZJ/BWYUVU9c9et4ynBI
 pfiiR2mp7rTLzNUbRgerx61WYyJ7lH5gfNawO/ZsDnZnWVVvya35vKO/uAaCV/0dH1p5
 VSqBYGf7hGYX3xbekldoiPLgLSXaZWwzxljT9Jcr024YRNrv6/SUJBzlwKR5JDcYPJq2
 02mcrsIhNZ6VC8feY6sZKnpjNRuAr344kY5KP+hojPoPT5zStJiwFYveuBPvJC5W87d7
 MEaQ==
X-Gm-Message-State: AOAM532J4QGOUH7UR5gieSGJ7Xfz35G4qebcPlcMuiaRppB9HQc81Dix
 zXOTudYGY1dUAH00R4fBDz2dIv2tH9GIK/8V
X-Google-Smtp-Source: ABdhPJzpT/i6XTTuVx7Z5at5qgPjj6tEshag768PxTcSQi8E7/2pgdhqvpw0aBBGHMnFsmXxxM3x8A==
X-Received: by 2002:a17:902:f54d:b0:154:6794:ab38 with SMTP id
 h13-20020a170902f54d00b001546794ab38mr12880391plf.114.1648034010905; 
 Wed, 23 Mar 2022 04:13:30 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 f31-20020a631f1f000000b003742e45f7d7sm19798002pgf.32.2022.03.23.04.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:13:30 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 3/4] target/riscv: smstateen check for fcsr
Date: Wed, 23 Mar 2022 16:43:08 +0530
Message-Id: <20220323111309.9109-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220323111309.9109-1-mchitale@ventanamicro.com>
References: <20220323111309.9109-1-mchitale@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1029.google.com
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
index 2388f0226f..5959adc9b3 100644
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
@@ -2006,6 +2010,10 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
                        (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0];
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     write_smstateen(env, reg, wr_mask, new_val);
 
     return RISCV_EXCP_NONE;
@@ -2030,6 +2038,10 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
     reg = &env->mstateen[csrno - CSR_MSTATEEN0H - 0x10];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     write_smstateen(env, reg, wr_mask, val);
 
     return RISCV_EXCP_NONE;
@@ -2051,6 +2063,10 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
                        (1UL << SMSTATEEN0_HSENVCFG);
     int index = csrno - CSR_HSTATEEN0;
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->hstateen[index];
     wr_mask &= env->mstateen[index];
     write_smstateen(env, reg, wr_mask, new_val);
@@ -2075,6 +2091,10 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
     uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
                        (1UL << SMSTATEEN0_HSENVCFG);
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->hstateen[index];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
@@ -2100,6 +2120,10 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
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


