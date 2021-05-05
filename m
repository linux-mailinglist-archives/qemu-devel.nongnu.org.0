Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5FC374C05
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:38:43 +0200 (CEST)
Received: from localhost ([::1]:35848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR6I-0003Vt-2f
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQs2-0007RJ-91
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:59 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:42191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrt-0000Q9-7A
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257028; x=1651793028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DVBFNXfYUcIYw0n/vuetOzN6NP8PIXn4wpMgfPrqrDM=;
 b=OQl/1Qbaa2SncsnGuuyvoyKQhQTkb1rbCrZnHxVjrvJTHHeW2Mbf9rUX
 n4P6kmeT3XxJMX2tELpZpktj2dLQ5ee13I/oMXfl2lfdVUILOd25yAl1m
 iqAR3bsbd7AkgsENYXfX06ynntLy6IWwLbHSqnVXwCyLs8IrPoOlekwZ8
 aZP6cKFau/m1WKVH4Tp93udPwPGGKoYQ4KQl5By0yzgwxn+wGuJR2Wdp0
 WeZNTSBlkTnB7vUtCmKlzM/cWcx0a0sv4iRNrmXUraxjRSYq/xIBE3at2
 Z3zrGzlA+ZfJdSyoir7SdytbgOGrImq8qfKZSAPOkydUr67jPigydt/82 A==;
IronPort-SDR: TiLWHvZDUAd0Cw7GX6LjydJHbMvdRUmIceq24GkBjptii5PYYlZyHD1euvb6vrdGt2J3GIiLeh
 VjWIUXukvLsWIJZpjgB5FgJ6CE+S3PpqNtDe5Pzgy/MRySFRHLIl7KYglZ62oFWF+rHTVJRIJB
 iqEQ9NaK4dTGPIhUA2WbPqKeagtYq8T3DSUVgI0Ln0aFgyG/ahrUjJ2gRJE+tJM5LyvKwsZDn7
 KAj2jJmABowPzM/7pFySXJ6yS9grVF84218GXzYZ26kLKYOXchPOEyKsIkZ8/6FKc/fKuhWaFy
 Ses=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="278356925"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:23:48 +0800
IronPort-SDR: gI8o1SILEGhjBIygLbBqzyZG3Y/OGvu19ZRsF6Ad+UBhFwdEume1QzK7AUwK+Fv/jpspz52A6B
 MaSahF3QCVNy9LZjDGJ3KOLUdxXZBetL017oJp90+h3xUQyNt5nEyLvoJkARrHwsli7iZjoZG+
 Ym6E+Ep2ecaIJCjJR+0NP2zIvqoSQS7uKHISgjEaFcgSflAQDr2uPcC0Y3Q1wleQUsWDOTMQKp
 7iBO9F7p8gobCuyo9OoEAQf4gj/eKSz9k+8Y2IJlU1UgrPA1RsO8ZAlX2g/teREKpVY/WRFrJ7
 zTtF1I9Ml02N+RkoA3tFX4Dt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:29 -0700
IronPort-SDR: CF0mkNEDDP30N8g4xJ214P9pc0BZcdIn+w8L1VuS4E5KxRC2sWUpGgls/EuLsu2Uad7QeGKB2I
 PR/ycqXO0/TJInbSDmbjcaD8qxDkV+cr+mFWXuRK+Yh61vGzbYAuhPjKEIdfXKugghKxkX/8Lp
 DfkqE+tY28W6IGKbja/zh5LJoxhyggeUS/d6NFpgcqjN+p5EtbFqjnTNSLdKcn6twMD+tg53MI
 4SE7n2bVIfUSRzZMhMmIyvZWXNken/kP959EBDqS0BXMjZvR+XnTYoedw6OjxGEwMzRswUVpkR
 wIs=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:23:46 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 10/42] target/riscv: Use the RISCVException enum for CSR
 predicates
Date: Thu,  6 May 2021 09:22:40 +1000
Message-Id: <20210505232312.4175486-11-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 187261fa671c3a77cf5aa482adb2a558c02a7cad.1617290165.git.alistair.francis@wdc.com
---
 target/riscv/cpu.h |  3 +-
 target/riscv/csr.c | 80 +++++++++++++++++++++++++---------------------
 2 files changed, 46 insertions(+), 37 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8079da8fa8..1dd42a6bc1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -472,7 +472,8 @@ static inline target_ulong riscv_csr_read(CPURISCVState *env, int csrno)
     return val;
 }
 
-typedef int (*riscv_csr_predicate_fn)(CPURISCVState *env, int csrno);
+typedef RISCVException (*riscv_csr_predicate_fn)(CPURISCVState *env,
+                                                 int csrno);
 typedef int (*riscv_csr_read_fn)(CPURISCVState *env, int csrno,
     target_ulong *ret_value);
 typedef int (*riscv_csr_write_fn)(CPURISCVState *env, int csrno,
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index de7427d8f8..1938bdca7d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -35,29 +35,29 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
-static int fs(CPURISCVState *env, int csrno)
+static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* loose check condition for fcsr in vector extension */
     if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
-        return 0;
+        return RISCV_EXCP_NONE;
     }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int vs(CPURISCVState *env, int csrno)
+static RISCVException vs(CPURISCVState *env, int csrno)
 {
     if (env->misa & RVV) {
-        return 0;
+        return RISCV_EXCP_NONE;
     }
-    return -RISCV_EXCP_ILLEGAL_INST;
+    return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static int ctr(CPURISCVState *env, int csrno)
+static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
@@ -65,7 +65,7 @@ static int ctr(CPURISCVState *env, int csrno)
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     if (riscv_cpu_virt_enabled(env)) {
@@ -73,25 +73,25 @@ static int ctr(CPURISCVState *env, int csrno)
         case CSR_CYCLE:
             if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
                 get_field(env->mcounteren, HCOUNTEREN_CY)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_TIME:
             if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
                 get_field(env->mcounteren, HCOUNTEREN_TM)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_INSTRET:
             if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
                 get_field(env->mcounteren, HCOUNTEREN_IR)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
             if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
                 get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         }
@@ -100,93 +100,101 @@ static int ctr(CPURISCVState *env, int csrno)
             case CSR_CYCLEH:
                 if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
                     get_field(env->mcounteren, HCOUNTEREN_CY)) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_TIMEH:
                 if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
                     get_field(env->mcounteren, HCOUNTEREN_TM)) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_INSTRETH:
                 if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
                     get_field(env->mcounteren, HCOUNTEREN_IR)) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
                 if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
                     get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             }
         }
     }
 #endif
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int ctr32(CPURISCVState *env, int csrno)
+static RISCVException ctr32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     return ctr(env, csrno);
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static int any(CPURISCVState *env, int csrno)
+static RISCVException any(CPURISCVState *env, int csrno)
 {
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int any32(CPURISCVState *env, int csrno)
+static RISCVException any32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     return any(env, csrno);
 
 }
 
-static int smode(CPURISCVState *env, int csrno)
+static RISCVException smode(CPURISCVState *env, int csrno)
 {
-    return -!riscv_has_ext(env, RVS);
+    if (riscv_has_ext(env, RVS)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static int hmode(CPURISCVState *env, int csrno)
+static RISCVException hmode(CPURISCVState *env, int csrno)
 {
     if (riscv_has_ext(env, RVS) &&
         riscv_has_ext(env, RVH)) {
         /* Hypervisor extension is supported */
         if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
             env->priv == PRV_M) {
-            return 0;
+            return RISCV_EXCP_NONE;
         } else {
-            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
     }
 
-    return -RISCV_EXCP_ILLEGAL_INST;
+    return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static int hmode32(CPURISCVState *env, int csrno)
+static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return 0;
+        return RISCV_EXCP_NONE;
     }
 
     return hmode(env, csrno);
 
 }
 
-static int pmp(CPURISCVState *env, int csrno)
+static RISCVException pmp(CPURISCVState *env, int csrno)
 {
-    return -!riscv_feature(env, RISCV_FEATURE_PMP);
+    if (riscv_feature(env, RISCV_FEATURE_PMP)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
 }
 #endif
 
@@ -1293,8 +1301,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         return -RISCV_EXCP_ILLEGAL_INST;
     }
     ret = csr_ops[csrno].predicate(env, csrno);
-    if (ret < 0) {
-        return ret;
+    if (ret != RISCV_EXCP_NONE) {
+        return -ret;
     }
 
     /* execute combined read/write operation if it exists */
-- 
2.31.1


