Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130576F7A47
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:04:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujr5-0007vM-Hk; Thu, 04 May 2023 21:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujr2-0007v7-3b
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:24 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujr0-0006oF-1l
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:23 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1aaec9ad820so10785515ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248599; x=1685840599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cRmIoFl2e8CRrWTPkl6Y/zweMYKh21Ri0y8chZO7848=;
 b=bl5+m1JZk67/dyNQIUlEAervOpEQw36Xg3QHhLi0pA6ZCN8l3+65Urk5ifKpZQdFmn
 e/+EdPrDInlXh5mxAOyVlhoBtI13pZcC5uOWvKKxmXDWlTILmWSd10wG9b8kMOBUnvtT
 2I8cc85v6faxeQnJ1X9DiOb1vqtzY+48wSB7QBqcu+xGdoUn0nirImnlAP0vWsvLochQ
 aEEg1OF/t1iD/japa6q4UkRiEkS3RHTAijyIk7XvjKFdtDyr9T1SOO90cgS/TgRMsjaI
 lISUkFBQvMrDtSAFctElgoQhRGL0EmFVUY9nX0TOu3eePq3cqTZy34Jp/6mRrcB57UlK
 P5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248599; x=1685840599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cRmIoFl2e8CRrWTPkl6Y/zweMYKh21Ri0y8chZO7848=;
 b=BUWvOx1qBE+zwMuDnyLphFHtEk2EFegIP0263R8ufiMY9a34/F6heMPTw0sv+xmUPY
 dDmbOkFVc4C2GVq0DSLLwO7RGk+IUG+kabrDCH4N91ZOfzQubAfYf7Cmf9Slj3cjX+FS
 tu2gLgJk1fTlaMgENrc/H4ZLT6r7wQVoKt6RjZovhz7BPp3l2lmSvLUm+Fl8Fe9YqW8Q
 fCpglGw/8Ej1HC5T1j8YZ55sNlHHrf1s7Yiec9DtRUlRw/YSH8E4Xs66AsXiqxzj70Gm
 aGE4INBO3yEAE9dM+fUMPphQVO/ty7RbTDw0C7FlUR0oCOdLMyFvVrC3PrTnDmvjFgzy
 fgRg==
X-Gm-Message-State: AC+VfDwMGpxMFtKmaWmDYXGm51UF0i0Kj9+iXiEa9sL9VfpMmWKJzYRD
 ARTGY/0eSv3pwvAboSbUd/Gq8h0gX1d0Vw==
X-Google-Smtp-Source: ACHHUZ6wHzX3uEv1YaEkJSG6CnGoi08dhd6ix4kI6+arf2vcVEkieWAbKqtbpMuMW3QUSpzO+pZLPA==
X-Received: by 2002:a17:903:41c6:b0:1aa:e739:4097 with SMTP id
 u6-20020a17090341c600b001aae7394097mr6466656ple.5.1683248598990; 
 Thu, 04 May 2023 18:03:18 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:18 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 01/89] target/riscv: Avoid env_archcpu() when reading
 RISCVCPUConfig
Date: Fri,  5 May 2023 11:01:13 +1000
Message-Id: <20230505010241.21812-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

Use riscv_cpu_cfg(env) instead of env_archcpu().cfg.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230309071329.45932-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c |  9 ++++-----
 target/riscv/csr.c        | 40 ++++++++++++---------------------------
 target/riscv/gdbstub.c    |  4 ++--
 3 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..e677255f87 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -314,7 +314,6 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
                                     int extirq, unsigned int extirq_def_prio,
                                     uint64_t pending, uint8_t *iprio)
 {
-    RISCVCPU *cpu = env_archcpu(env);
     int irq, best_irq = RISCV_EXCP_NONE;
     unsigned int prio, best_prio = UINT_MAX;
 
@@ -323,7 +322,8 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
     }
 
     irq = ctz64(pending);
-    if (!((extirq == IRQ_M_EXT) ? cpu->cfg.ext_smaia : cpu->cfg.ext_ssaia)) {
+    if (!((extirq == IRQ_M_EXT) ? riscv_cpu_cfg(env)->ext_smaia :
+                                  riscv_cpu_cfg(env)->ext_ssaia)) {
         return irq;
     }
 
@@ -765,7 +765,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
     bool use_background = false;
     hwaddr ppn;
-    RISCVCPU *cpu = env_archcpu(env);
     int napot_bits = 0;
     target_ulong napot_mask;
 
@@ -946,7 +945,7 @@ restart:
 
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
-        } else if (pbmte || cpu->cfg.ext_svnapot) {
+        } else if (pbmte || riscv_cpu_cfg(env)->ext_svnapot) {
             ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
         } else {
             ppn = pte >> PTE_PPN_SHIFT;
@@ -1043,7 +1042,7 @@ restart:
                benefit. */
             target_ulong vpn = addr >> PGSHIFT;
 
-            if (cpu->cfg.ext_svnapot && (pte & PTE_N)) {
+            if (riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
                 napot_bits = ctzl(ppn) + 1;
                 if ((i != (levels - 1)) || (napot_bits != 4)) {
                     return TRANSLATE_FAIL;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..70468572fe 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -89,9 +89,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (cpu->cfg.ext_zve32f) {
+    if (riscv_cpu_cfg(env)->ext_zve32f) {
 #if !defined(CONFIG_USER_ONLY)
         if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
@@ -194,9 +192,7 @@ static RISCVException mctr32(CPURISCVState *env, int csrno)
 
 static RISCVException sscofpmf(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_sscofpmf) {
+    if (!riscv_cpu_cfg(env)->ext_sscofpmf) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -311,9 +307,7 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
 
 static RISCVException mstateen(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_smstateen) {
+    if (!riscv_cpu_cfg(env)->ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -322,9 +316,7 @@ static RISCVException mstateen(CPURISCVState *env, int csrno)
 
 static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_smstateen) {
+    if (!riscv_cpu_cfg(env)->ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -391,10 +383,9 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
 
 static RISCVException sstc(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
     bool hmode_check = false;
 
-    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
+    if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -1171,27 +1162,21 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
 static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    *val = cpu->cfg.mvendorid;
+    *val = riscv_cpu_cfg(env)->mvendorid;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_marchid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    *val = cpu->cfg.marchid;
+    *val = riscv_cpu_cfg(env)->marchid;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_mimpid(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    *val = cpu->cfg.mimpid;
+    *val = riscv_cpu_cfg(env)->mimpid;
     return RISCV_EXCP_NONE;
 }
 
@@ -1233,9 +1218,8 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
 
 static bool validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
-
-    return (vm & 0xf) <= satp_mode_max_from_map(cpu->cfg.satp_mode.map);
+    return (vm & 0xf) <=
+           satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
 }
 
 static RISCVException write_mstatus(CPURISCVState *env, int csrno,
@@ -1898,7 +1882,7 @@ static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
 static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
-    RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
@@ -1921,7 +1905,7 @@ static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
 static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
                                      target_ulong val)
 {
-    RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
                     (cfg->ext_sstc ? MENVCFG_STCE : 0) |
                     (cfg->ext_svadu ? MENVCFG_HADE : 0);
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 840d1ec5c6..692bbb64f6 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -130,7 +130,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
 
 static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
 {
-    uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    uint16_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
     if (n < 32) {
         int i;
         int cnt = 0;
@@ -146,7 +146,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
 
 static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
 {
-    uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    uint16_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
     if (n < 32) {
         int i;
         for (i = 0; i < vlenb; i += 8) {
-- 
2.40.0


