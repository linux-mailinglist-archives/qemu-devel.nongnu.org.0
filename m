Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C952401E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 00:14:41 +0200 (CEST)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noubQ-0006fm-FW
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 18:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNW-0004cF-Uk
 for qemu-devel@nongnu.org; Wed, 11 May 2022 18:00:18 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNU-0006gy-Gb
 for qemu-devel@nongnu.org; Wed, 11 May 2022 18:00:18 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so6103404pjv.4
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 15:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0blOO6OMMRpfB03V+aWer2Uy71SbSrW98ReFlCeP2c=;
 b=m55T1fgtiCBZjB2RHZNG6pIhzzEg0Iimz9pQLOXxGYdg1e2/FqiMA6WrR1UHRsqBSI
 S1+IaZivFtFvnaV8hYvlNS0tZDZNCJRr+MUTLkisxMngs7m9mNY3YL1TnOqIPvca0QOv
 7xsQTcnpNdi7LvxWBuWmDPl0uG8LxqySeH5ofqysjYA72Wki3ykg3m3G7vM2Pbresc51
 0ZPB0tkfMZLFDhLdrRTiITmcV6jf/GEdRfLQPexbwoPED84qDBFd8XaraNaSKmeybtpS
 67cKUY0hdGjTkw+1HYz38BSQnXsoNY6U6UGPUmWZJyy6bWtLm1maPTPylphAaFn6O+8l
 P4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0blOO6OMMRpfB03V+aWer2Uy71SbSrW98ReFlCeP2c=;
 b=BuETfKwDE/STmUgu1ycVWbqgOt9gn7vBGWbsr+ME5xjhb4AThZ7xzDUo/3Xt4/+H4+
 5BV7lLS/g4PuoTUAkBsMqhKkMumTE1cng9MR7JdNzKZYSQyamOho6V+45M1JZwWwyUJi
 RI0b2kMlgkXSlOvlGRuV0W+4+otZYbB5JD/kGXpMLDRpjgJu/9PVT5Bd/7Bw1GYorH8s
 f174cafOc/ERZw860d/ymX2ZaRfsu8/u7gqgZmHJIM3leu0qowXMdZ4Sq1N7xFL4j3Gn
 WMn5z6wUPnsz+JsJ16MIPe7a6zcpO4pcMrGWYE7R+Dyio64Sr7Y0BHWwuWRHo2XK0rcT
 5b8w==
X-Gm-Message-State: AOAM531flCbGjkdkFCSySXWXCaDA3okhIxCXkarlIlh/ASpL1bJA2apD
 Kj9xsxP09ShN669kO9CD4PypqmY0xIgZug==
X-Google-Smtp-Source: ABdhPJxlK9brAtSBaEkVJiOsCmELqbknRSm9bs7pddRMmB3v9K01c/9z8+YRTcY1RDClGarj5APLsA==
X-Received: by 2002:a17:90a:ab90:b0:1da:375f:2f44 with SMTP id
 n16-20020a17090aab9000b001da375f2f44mr7444064pjq.33.1652306414824; 
 Wed, 11 May 2022 15:00:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a62e417000000b0050dc762816asm2261303pfh.68.2022.05.11.15.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 15:00:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v8 04/12] target/riscv: pmu: Make number of counters
 configurable
Date: Wed, 11 May 2022 14:59:48 -0700
Message-Id: <20220511215956.2351243-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511215956.2351243-1-atishp@rivosinc.com>
References: <20220511215956.2351243-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 5ad17b40189f..2dc4b500797d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -822,7 +822,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
+    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 09a0c71093c5..7cbcd8d62fc1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -391,7 +391,6 @@ struct RISCVCPUConfig {
     bool ext_zksed;
     bool ext_zksh;
     bool ext_zkt;
-    bool ext_pmu;
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_svinval;
@@ -413,6 +412,7 @@ struct RISCVCPUConfig {
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
 
+    uint8_t pmu_num;
     char *priv_spec;
     char *user_spec;
     char *bext_spec;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c625b17dd58e..7e14f7685fb9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -73,9 +73,17 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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
 
@@ -103,7 +111,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         }
-        if (riscv_cpu_mxl(env) == MXL_RV32) {
+        if (rv32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->mcounteren, COUNTEREN_CY)) {
@@ -158,7 +166,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         }
-        if (riscv_cpu_mxl(env) == MXL_RV32) {
+        if (rv32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->hcounteren, COUNTEREN_CY) &&
@@ -202,6 +210,26 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
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
@@ -3683,35 +3711,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


