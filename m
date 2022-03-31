Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96514ED0C0
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:13:57 +0200 (CEST)
Received: from localhost ([::1]:58426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiRo-0000jt-Ms
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:13:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiG1-00058S-ID
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:01:46 -0400
Received: from [2607:f8b0:4864:20::62a] (port=36512
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiFz-0005VE-LI
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:01:45 -0400
Received: by mail-pl1-x62a.google.com with SMTP id m18so17042271plx.3
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 17:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vU/vwN9FVTXagwqbEnS8hrShalxb2jy8QJbiaHA11Qs=;
 b=2a1uWBYZCbcjVKXvmC6Kit6ze9jkegwjLnD6lvz+KJBkMucx6uwHxpBtIQLlOhPAC8
 DdFUt4eO74NwdIKjejjjzOc+9r7vpO96lF1mgsggQlpTEMOGvWlv3ksGjK0CCtzX+bKp
 vUgFsNZCN6PMXBcwaJq8sTNG9SkW47tR1rEcvStiDgdp13bfBFkmAw0GOD5OnYWG1Xm/
 4+jGVJuv8h6RTDsYWzvHF7P1UKeYixMW6RvsItehEcr3PfVR1QoLpr1sEr44Z71nC6ek
 4N1Ni44dxcroMmMGk9B12+awUESl3nh12xYNFzk8Ob2baLFn5vhmDjuA8Ggo1dsAr2jz
 TsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vU/vwN9FVTXagwqbEnS8hrShalxb2jy8QJbiaHA11Qs=;
 b=FOnjeb/Xn/oTwRR1Rh2fIOuOrWjztURVURTXeWB5lwS6i8no1mgCKNJ/Ce0e6f+FJU
 uIqsBxzNhLe2rsdmZLSci3zgyFDMx8ldr7N105Ad9u8eECPg49/2Sn3qrPXsEY91NvPJ
 9XYXAZXQOrfXULEcGrE6UmZt8A8i3RV4jUL1q9m5rnQXb1pUlingXRXBn9R6zfbqFgJ7
 JAE1107Z2cPf+rTp1StEwc/fS7u15eiMmnBEGTL+vjNhOZjZztyGLH+X/VWEI4FpxuMI
 rYOsPbXntBbcVhu6/mXAK84w/uPUyW6svvaGiyXfdMv5EjhPtSXIXagq5ka8ZaTMV1m7
 XhaA==
X-Gm-Message-State: AOAM5305NsCsiRdb5b243XGdLBvvqB2sHMcjrq7GhOBRz8He5pIMZQAe
 QD9SibUY6kArIlyeH1GzvsDC0r6AdrNIiw==
X-Google-Smtp-Source: ABdhPJyeYeet/NE8ej4etsJBQ9IPpFVY4zjnsIn6wGG/AfKN1kzUbhI9ZOfsPMGmNmEMCzDzdFET4g==
X-Received: by 2002:a17:902:e5c8:b0:154:7d7d:20ab with SMTP id
 u8-20020a170902e5c800b001547d7d20abmr2368239plf.29.1648684901975; 
 Wed, 30 Mar 2022 17:01:41 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm8891669pjb.2.2022.03.30.17.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:01:41 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/12] target/riscv: pmu: Make number of counters
 configurable
Date: Wed, 30 Mar 2022 17:01:18 -0700
Message-Id: <20220331000127.2107823-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331000127.2107823-1-atishp@rivosinc.com>
References: <20220331000127.2107823-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The RISC-V privilege specification provides flexibility to implement
any number of counters from 29 programmable counters. However, the QEMU
implements all the counters.

Make it configurable through pmu config parameter which now will indicate
how many programmable counters should be implemented by the cpu.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c |  2 +-
 target/riscv/cpu.h |  2 +-
 target/riscv/csr.c | 94 ++++++++++++++++++++++++++++++----------------
 3 files changed, 63 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1995ed0d6979..f63602828680 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -794,7 +794,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
+    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 92bad7e35e4d..47319dbce4b9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -378,7 +378,6 @@ struct RISCVCPUConfig {
     bool ext_zbb;
     bool ext_zbc;
     bool ext_zbs;
-    bool ext_pmu;
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_svinval;
@@ -396,6 +395,7 @@ struct RISCVCPUConfig {
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
 
+    uint8_t pmu_num;
     char *priv_spec;
     char *user_spec;
     char *bext_spec;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f1b264b2c7a4..e2d17b619877 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -71,9 +71,17 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
+    int base_csrno = CSR_HPMCOUNTER3;
+    bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
 
-    if (!cpu->cfg.ext_pmu) {
-        /* The PMU extension is not enabled */
+    if (rv32 && csrno >= CSR_CYCLEH) {
+        /* Offset for RV32 hpmcounternh counters */
+        base_csrno += 0x80;
+    }
+    ctr_index = csrno - base_csrno;
+
+    if (!cpu->cfg.pmu_num || ctr_index >= (cpu->cfg.pmu_num)) {
+        /* No counter is enabled in PMU or the counter is out of range */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -101,7 +109,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         }
-        if (riscv_cpu_mxl(env) == MXL_RV32) {
+        if (rv32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->mcounteren, COUNTEREN_CY)) {
@@ -156,7 +164,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         }
-        if (riscv_cpu_mxl(env) == MXL_RV32) {
+        if (rv32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->hcounteren, COUNTEREN_CY) &&
@@ -200,6 +208,26 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
 }
 
 #if !defined(CONFIG_USER_ONLY)
+static RISCVException mctr(CPURISCVState *env, int csrno)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    int ctr_index;
+    int base_csrno = CSR_MHPMCOUNTER3;
+
+    if ((riscv_cpu_mxl(env) == MXL_RV32) && csrno >= CSR_MCYCLEH) {
+        /* Offset for RV32 mhpmcounternh counters */
+        base_csrno += 0x80;
+    }
+    ctr_index = csrno - base_csrno;
+    if (!cpu->cfg.pmu_num || ctr_index >= cpu->cfg.pmu_num) {
+        /* The PMU is not enabled or counter is out of range*/
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException any(CPURISCVState *env, int csrno)
 {
     return RISCV_EXCP_NONE;
@@ -3571,35 +3599,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_zero },
     [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_zero },
 
-    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   any,    read_zero },
-    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   any,    read_zero },
-    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   any,    read_zero },
-    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   any,    read_zero },
-    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   any,    read_zero },
-    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   any,    read_zero },
-    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   any,    read_zero },
-    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  any,    read_zero },
-    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  any,    read_zero },
-    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  any,    read_zero },
-    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  any,    read_zero },
-    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  any,    read_zero },
-    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  any,    read_zero },
-    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  any,    read_zero },
-    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  any,    read_zero },
-    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  any,    read_zero },
-    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  any,    read_zero },
-    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  any,    read_zero },
-    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  any,    read_zero },
-    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  any,    read_zero },
-    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  any,    read_zero },
-    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  any,    read_zero },
-    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  any,    read_zero },
-    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  any,    read_zero },
-    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  any,    read_zero },
-    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  any,    read_zero },
-    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  any,    read_zero },
-    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  any,    read_zero },
-    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  any,    read_zero },
+    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
 
     [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
     [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
-- 
2.25.1


