Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CEE37A497
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:28:58 +0200 (CEST)
Received: from localhost ([::1]:52572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPdJ-000750-Vs
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVR-0008Ua-0H
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:49 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVJ-0006TG-K5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728440; x=1652264440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DVBFNXfYUcIYw0n/vuetOzN6NP8PIXn4wpMgfPrqrDM=;
 b=ehZZRPFoZqlSnk0UWLEYU/iBHq3Q56FQ+7ZOl7QObhz75OFPFnugI3sD
 cj+donM9cHtLZje6Ri9nj7mJ9gN8ilsoxgbFqF3KjYANnaOlqWso6lsWo
 PpkMIe0MLErubIxIif8jsMJqUXH/Hx4l7Iuw5V/YTib2nkNbAYvL4rvuC
 Jg9Oq8mAWF32pZQxvBH5Pf3Bx0fR48H+LvE2cIy6rJ1c8nNp2lYQBl4p9
 4H3NBOUFcBtScgd/EYODhFTbF2kfxjp1X3Rec7SY2N22FdfBa/9nH2QOU
 v2cky6n9bwloM9pSBbhPKHX3R/h7BPCwI64qo/LojZrogzs4Y7M+0a0eh A==;
IronPort-SDR: ClB3hsgneX+5BfXP0esQHM+Umjhqz5O/bqIaMQqNlp/mI5OO8ALWLYA+Tb80NXqOrcOz+Syi6o
 Xr4hfYkYDZyyv0NzT+YuaNxQYQ9N+hwuOgU6Sg1k7tUG+MrC+Z4Gz44ZThMnfLLqEe0hUIFMz3
 NuDUnVc9rs5cLH1YKayQAtxnHFfLw2WAcaNnKLbq869SVsDtiwmFhl6O0ErMhwLxLcFVMYAi9q
 41u66+OfqxjNiBhQrUzkMBLdT0N45MwEmxcRKv6yv+rq5yZAH07idJF4yq1hi4xscaYS3QPDau
 yrs=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735375"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:34 +0800
IronPort-SDR: 7wFhbIgbVvpxlA0EptMBokU3GnKX9frQvYeyb/NhRBV67SrWxGHMLIPkQoTV8SL9mdqRI4y37I
 R+6A+wiTlO6wxLEaVojQlHxfVVlZdoiO8FZ8LYtJIvOvyo4iOzRCL3Tn/vXLtA/q/2IIlnuxjP
 IfBmetqk1Xb3kkwXGzOIv+F7BtRO/gbHaufcGes11c6MD0vkzZxvKMG69VHCaO+CVAn320LJLc
 mYHzz6Xo/Bkqsd0R4w6YMd7UZDz31LykQmhhMerBJ6tI8ZZPzGjWb6Jz9PyzMPLKs/zafVz6hA
 aPqVoVaLNfSZMZH+n+08eCD+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:33 -0700
IronPort-SDR: Ftq63d/U2s5E5t0JervPCRONJbji46Qy/PstcoXif+6V0xGQu2KPv28ptpyFAzUkpzq0xzcjVI
 oJ0sWHxtn1GITVTMLzY1yRev8DujIdHHeQug4lvtLWZLg8W90OMr8WAMdyg7CVQ2pmJphWt9F4
 jTH1loPUQBuw6GDCtIph9miiWRc7kldqewepYR0VRzU7yrU92WcSId0D5u3HdE95vh31KQPHrI
 6pRioB4UXCpDizzFFo4Jl61q6o0JY5GK0ltX9rJUGs7a5DPE+1Drv47cPB2ZSPLDD3mouWw8Cm
 ltE=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:32 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 10/42] target/riscv: Use the RISCVException enum for CSR
 predicates
Date: Tue, 11 May 2021 20:19:19 +1000
Message-Id: <20210511101951.165287-11-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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


