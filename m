Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922B65B0093
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:35:40 +0200 (CEST)
Received: from localhost ([::1]:34988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVrT0-0006Ix-Sy
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq5J-0004yU-HV
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:59 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq5G-0004Ol-Fb
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662538013; x=1694074013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QaFRES8nkiXRUtEznZdao0tDrlv439MjRPAZnr1fYBY=;
 b=dIAC8V3rAN82vKn/n12MUTbtkELTbUVLqr0q4sjcDKR9M1K+BEohS37N
 0LSlKb7hR71t1h5qi4OJPUvOr5e/+55rc+pjUZcp63sRlwaadHrzLVRYm
 SI6ivmrhv/r2xOU89sS3x5kE2EIY0+FLzvxjXMmThYMg1W6UIDnl1r6Rj
 t9AehzS0HmX48Ys6/vssAhNAkvbd34zEvDvcOpdPJqFV4Og+/WPjd2FhH
 23aN4ii20jp27MMR2CGqFaMMp46Jiz8TPdW6xiwW9nTKJDxQBAEO4Uv+g
 wNSpJa7hyI2gZf5TxgFLuBVSO54acOUEDuv5IubYVNk/zVinUzwarW+0F Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715136"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:31 +0800
IronPort-SDR: QK9MkGfGVwzGICgRg9DcU8jZxl+H3eJ9qLBtg8HNfCMD1Rr4p0vddLzpjgt+/5q4s6XSlFqBNp
 6up0lZ1/tcJHNdVPZA8fWOnNbxucWPlIsMTcnSTTK4W6EBNDCr5Lf6r9Ek8CBCjubQMg85UjYg
 vuSS7qatUHy+1JWxb1I0c5w1OObrIQ7Pgy/U59RwxDn7Kofr88Z8/HIXQz/OIFXaa8tpJ2DG2R
 NEtPwCSKj+9wlvQ7icMppCsOFoG/qgA0uPshBFd1WPs2rAhmK5P+sGEbkyICanp/2LxTzRtZhR
 38BlDlQH3BBu5BO3wqjqqFlP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:29 -0700
IronPort-SDR: xouAU+B6oHUkb1yGssmKy4of/upSMtLBnokLeTxptk0KgMBksAV7oH3t4IUP7+VP7CWnjlE4Qc
 dGwMMfRPv45kx2NWQxJaNSScJse5ACfPBrzbWHEYOzhTLOxQ5h1rv5jlXbmbP7C1MsVWYLvPAG
 qfBwqzMqDMRLkFUR2r8PaMdaBeNGCO5b48VcP1bMhkMFMacvt6j2snQW+FAO3mBSdcOywwa0WA
 6z/zDjyjxWo37YEMxg9F8kKecyqW3vVRWEBs6TTCX7vpdTEC+5EgtPVzB6ebghcTHSJaPeL33v
 ZQ4=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:31 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 41/44] target/riscv: Simplify counter predicate function
Date: Wed,  7 Sep 2022 10:03:50 +0200
Message-Id: <20220907080353.111926-42-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Atish Patra <atishp@rivosinc.com>

All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
as a unified counter. Thus, the predicate function doesn't need handle each
case separately.

Simplify the predicate function so that we just handle things differently
between RV32/RV64 and S/HS mode.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220824221701.41932-3-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 110 ++++-----------------------------------------
 1 file changed, 9 insertions(+), 101 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 888ddfc4dd..2151e280a8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -75,6 +75,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
+    target_ulong ctr_mask;
     int base_csrno = CSR_CYCLE;
     bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
 
@@ -83,122 +84,29 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
         base_csrno += 0x80;
     }
     ctr_index = csrno - base_csrno;
+    ctr_mask = BIT(ctr_index);
 
     if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
         (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
         goto skip_ext_pmu_check;
     }
 
-    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
+    if (!(cpu->pmu_avail_ctrs & ctr_mask)) {
         /* No counter is enabled in PMU or the counter is out of range */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
 skip_ext_pmu_check:
 
-    if (env->priv == PRV_S) {
-        switch (csrno) {
-        case CSR_CYCLE:
-            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_TIME:
-            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_INSTRET:
-            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->mcounteren, 1 << ctr_index)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        }
-        if (rv32) {
-            switch (csrno) {
-            case CSR_CYCLEH:
-                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_TIMEH:
-                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_INSTRETH:
-                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->mcounteren, 1 << ctr_index)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            }
-        }
+    if (((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) ||
+        ((env->priv == PRV_U) && (!get_field(env->scounteren, ctr_mask)))) {
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     if (riscv_cpu_virt_enabled(env)) {
-        switch (csrno) {
-        case CSR_CYCLE:
-            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
-                get_field(env->mcounteren, COUNTEREN_CY)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_TIME:
-            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
-                get_field(env->mcounteren, COUNTEREN_TM)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_INSTRET:
-            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
-                get_field(env->mcounteren, COUNTEREN_IR)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << ctr_index) &&
-                 get_field(env->mcounteren, 1 << ctr_index)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        }
-        if (rv32) {
-            switch (csrno) {
-            case CSR_CYCLEH:
-                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
-                    get_field(env->mcounteren, COUNTEREN_CY)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_TIMEH:
-                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
-                    get_field(env->mcounteren, COUNTEREN_TM)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_INSTRETH:
-                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
-                    get_field(env->mcounteren, COUNTEREN_IR)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << ctr_index) &&
-                     get_field(env->mcounteren, 1 << ctr_index)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            }
+        if (!get_field(env->hcounteren, ctr_mask) &&
+            get_field(env->mcounteren, ctr_mask)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
     }
 #endif
-- 
2.37.2


