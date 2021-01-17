Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE342F95B8
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 23:02:11 +0100 (CET)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1G7e-00073N-VA
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 17:02:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1G08-0005nQ-Ee
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:24 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:21687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1G04-0005UJ-7P
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610920460; x=1642456460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=94WOHNyZiVhE+oo2h7DvLhsCfhILnlqkwHEMYJLBxOk=;
 b=B5k+pCTWXLKjr2tBrlbhbEMZIJEVghgvIMfngP6XAFwG3ifJjJRFakOK
 kTPdMKd7kPyPtSjXRdoQLkp5g9CwwZ58+nGup0w9znMt5yatI4fwlwxjp
 DSZoF4IGxM6ZmXpJY90WIwXCi7p8SwRGsRKJtq74ZAtkM7+BHJaLe7SN5
 yyMwa6MoYNiaHEcXmaoYqTj0aBrYHSyFEZYl3XklgSKtzg0e5CmGEJ8PC
 8OqVn2zYO2i6k1Ehda9cLifsEX87EvvbP//N9ZGxWqGgeeFC3JWHt2/R6
 MA+TjwKOBJkcfWwu2ISNL1u6xnYYfxfZx5TVqdLEGAf754DtSViwnCANI Q==;
IronPort-SDR: +CTPEvmrRQiRzd+hX1FAlT6iA+AIglSUbMH/Ln6ozp2kmrWoJ3UVix0+kAklXPMDoiQWL4MHEK
 VyvfLh2m0Q/CY5Dp9WCc65VQds+QlGMqa8z4xZ5X7X1phJCVNm1Jy5+5je/sWY9xpCzP8Jamkh
 d/YFR7nlVs/m9fIki97f3g/OTkv4Lf9OmpFQTYK4VYj09CVpdOVEBnr2ZdiSSrjFF7l7VnzVRq
 KAT/gRUMTg4cvzYV1RH7sxWe1PJWMbi0W+aASVGJD8DfY0oKkHw0xNzy/ByewOkvByLoVUUg6U
 9wY=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157645973"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 05:54:07 +0800
IronPort-SDR: fH2lyfMnyWmdpbLH7D+jnf/MlwqW8wcVBxVqMz8tM/dzCNMnG55RkbeC+ydGjJaqLocx5cZr8+
 gNAkygVFKPVycD0NYTMFGJ5+iIMU/AtGniyhQ4KLCx6QFGvPk9sZdFqDmqMhYuSAIdOkKdWvzO
 TPhMLgo406uurP2PVm9g1qdAdXEM+XteTXmzhadsooZsq1PABouMdMUL+Z0RdWT945Xddzb9zu
 f4bw5MXiEsIWt0Aao0nlbklvEjcPHtad3VF1UqL19hCgCKCYODfJkiscPGflPs4Z84TQy32xSy
 Ov0TuhxIUfhzUQBL7+Mtpf/X
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 13:38:46 -0800
IronPort-SDR: wDZ8WYl1oEj4bHc3Xd5PSbiTGaHud/4fdnSeAne/qyfEwYQiNXMbIKs2lom9Som7Id+polwupj
 WmDBrpfnqELw5sAD/PJ1DqE3/ghAKTiSapOiPNX9hKMAWj1pxL1PdsvaK9nVzcGvO7rhUVmMpu
 mCCfZCgjbgr/03k0ciVnR6dv+PfVh87CNvxIUPDkyNgWDyDWOglCP9PSxv3zsFDCQQSFjaFBoK
 +rcaBO6Jx3y4x4D36ss5dAbbM/Q/+NoOsW/4yfW7hqZwwDA1GlfG34arAQKqlqLXe7VPGXpVfM
 gq4=
WDCIronportException: Internal
Received: from 7l95g12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.251])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2021 13:54:07 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 10/12] target/riscv: Generate the GDB XML file for CSR
 registers dynamically
Date: Sun, 17 Jan 2021 13:54:01 -0800
Message-Id: <20210117215403.2277103-11-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117215403.2277103-1-alistair.francis@wdc.com>
References: <20210117215403.2277103-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=64494dccb=alistair.francis@wdc.com;
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present QEMU RISC-V uses a hardcoded XML to report the feature
"org.gnu.gdb.riscv.csr" [1]. There are two major issues with the
approach being used currently:

- The XML does not specify the "regnum" field of a CSR entry, hence
  consecutive numbers are used by the remote GDB client to access
  CSRs. In QEMU we have to maintain a map table to convert the GDB
  number to the hardware number which is error prone.
- The XML contains some CSRs that QEMU does not implement at all,
  which causes an "E14" response sent to remote GDB client.

Change to generate the CSR register list dynamically, based on the
availability presented in the CSR function table. This new approach
will reflect a correct list of CSRs that QEMU actually implements.

[1] https://sourceware.org/gdb/current/onlinedocs/gdb/RISC_002dV-Features.html#RISC_002dV-Features

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210116054123.5457-2-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     |   2 +
 target/riscv/cpu.c     |  12 ++
 target/riscv/gdbstub.c | 308 ++++++-----------------------------------
 3 files changed, 58 insertions(+), 264 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2718617ef4..02758ae0eb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -272,6 +272,8 @@ struct RISCVCPU {
     CPUNegativeOffsetState neg;
     CPURISCVState env;
 
+    char *dyn_csr_xml;
+
     /* Configuration Settings */
     struct {
         bool ext_i;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6aafe4e62c..27788021eb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -569,6 +569,17 @@ static gchar *riscv_gdb_arch_name(CPUState *cs)
     }
 }
 
+static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (strcmp(xmlname, "riscv-csr.xml") == 0) {
+        return cpu->dyn_csr_xml;
+    }
+
+    return NULL;
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -605,6 +616,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->vmsd = &vmstate_riscv_cpu;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
+    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
 #ifdef CONFIG_TCG
     cc->tcg_initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index eba12a86f2..5f96b7ea2a 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -20,256 +20,6 @@
 #include "exec/gdbstub.h"
 #include "cpu.h"
 
-/*
- * The GDB CSR xml files list them in documentation order, not numerical order,
- * and are missing entries for unnamed CSRs.  So we need to map the gdb numbers
- * to the hardware numbers.
- */
-
-static int csr_register_map[] = {
-    CSR_USTATUS,
-    CSR_UIE,
-    CSR_UTVEC,
-    CSR_USCRATCH,
-    CSR_UEPC,
-    CSR_UCAUSE,
-    CSR_UTVAL,
-    CSR_UIP,
-    CSR_FFLAGS,
-    CSR_FRM,
-    CSR_FCSR,
-    CSR_CYCLE,
-    CSR_TIME,
-    CSR_INSTRET,
-    CSR_HPMCOUNTER3,
-    CSR_HPMCOUNTER4,
-    CSR_HPMCOUNTER5,
-    CSR_HPMCOUNTER6,
-    CSR_HPMCOUNTER7,
-    CSR_HPMCOUNTER8,
-    CSR_HPMCOUNTER9,
-    CSR_HPMCOUNTER10,
-    CSR_HPMCOUNTER11,
-    CSR_HPMCOUNTER12,
-    CSR_HPMCOUNTER13,
-    CSR_HPMCOUNTER14,
-    CSR_HPMCOUNTER15,
-    CSR_HPMCOUNTER16,
-    CSR_HPMCOUNTER17,
-    CSR_HPMCOUNTER18,
-    CSR_HPMCOUNTER19,
-    CSR_HPMCOUNTER20,
-    CSR_HPMCOUNTER21,
-    CSR_HPMCOUNTER22,
-    CSR_HPMCOUNTER23,
-    CSR_HPMCOUNTER24,
-    CSR_HPMCOUNTER25,
-    CSR_HPMCOUNTER26,
-    CSR_HPMCOUNTER27,
-    CSR_HPMCOUNTER28,
-    CSR_HPMCOUNTER29,
-    CSR_HPMCOUNTER30,
-    CSR_HPMCOUNTER31,
-    CSR_CYCLEH,
-    CSR_TIMEH,
-    CSR_INSTRETH,
-    CSR_HPMCOUNTER3H,
-    CSR_HPMCOUNTER4H,
-    CSR_HPMCOUNTER5H,
-    CSR_HPMCOUNTER6H,
-    CSR_HPMCOUNTER7H,
-    CSR_HPMCOUNTER8H,
-    CSR_HPMCOUNTER9H,
-    CSR_HPMCOUNTER10H,
-    CSR_HPMCOUNTER11H,
-    CSR_HPMCOUNTER12H,
-    CSR_HPMCOUNTER13H,
-    CSR_HPMCOUNTER14H,
-    CSR_HPMCOUNTER15H,
-    CSR_HPMCOUNTER16H,
-    CSR_HPMCOUNTER17H,
-    CSR_HPMCOUNTER18H,
-    CSR_HPMCOUNTER19H,
-    CSR_HPMCOUNTER20H,
-    CSR_HPMCOUNTER21H,
-    CSR_HPMCOUNTER22H,
-    CSR_HPMCOUNTER23H,
-    CSR_HPMCOUNTER24H,
-    CSR_HPMCOUNTER25H,
-    CSR_HPMCOUNTER26H,
-    CSR_HPMCOUNTER27H,
-    CSR_HPMCOUNTER28H,
-    CSR_HPMCOUNTER29H,
-    CSR_HPMCOUNTER30H,
-    CSR_HPMCOUNTER31H,
-    CSR_SSTATUS,
-    CSR_SEDELEG,
-    CSR_SIDELEG,
-    CSR_SIE,
-    CSR_STVEC,
-    CSR_SCOUNTEREN,
-    CSR_SSCRATCH,
-    CSR_SEPC,
-    CSR_SCAUSE,
-    CSR_STVAL,
-    CSR_SIP,
-    CSR_SATP,
-    CSR_MVENDORID,
-    CSR_MARCHID,
-    CSR_MIMPID,
-    CSR_MHARTID,
-    CSR_MSTATUS,
-    CSR_MISA,
-    CSR_MEDELEG,
-    CSR_MIDELEG,
-    CSR_MIE,
-    CSR_MTVEC,
-    CSR_MCOUNTEREN,
-    CSR_MSCRATCH,
-    CSR_MEPC,
-    CSR_MCAUSE,
-    CSR_MTVAL,
-    CSR_MIP,
-    CSR_MTINST,
-    CSR_MTVAL2,
-    CSR_PMPCFG0,
-    CSR_PMPCFG1,
-    CSR_PMPCFG2,
-    CSR_PMPCFG3,
-    CSR_PMPADDR0,
-    CSR_PMPADDR1,
-    CSR_PMPADDR2,
-    CSR_PMPADDR3,
-    CSR_PMPADDR4,
-    CSR_PMPADDR5,
-    CSR_PMPADDR6,
-    CSR_PMPADDR7,
-    CSR_PMPADDR8,
-    CSR_PMPADDR9,
-    CSR_PMPADDR10,
-    CSR_PMPADDR11,
-    CSR_PMPADDR12,
-    CSR_PMPADDR13,
-    CSR_PMPADDR14,
-    CSR_PMPADDR15,
-    CSR_MCYCLE,
-    CSR_MINSTRET,
-    CSR_MHPMCOUNTER3,
-    CSR_MHPMCOUNTER4,
-    CSR_MHPMCOUNTER5,
-    CSR_MHPMCOUNTER6,
-    CSR_MHPMCOUNTER7,
-    CSR_MHPMCOUNTER8,
-    CSR_MHPMCOUNTER9,
-    CSR_MHPMCOUNTER10,
-    CSR_MHPMCOUNTER11,
-    CSR_MHPMCOUNTER12,
-    CSR_MHPMCOUNTER13,
-    CSR_MHPMCOUNTER14,
-    CSR_MHPMCOUNTER15,
-    CSR_MHPMCOUNTER16,
-    CSR_MHPMCOUNTER17,
-    CSR_MHPMCOUNTER18,
-    CSR_MHPMCOUNTER19,
-    CSR_MHPMCOUNTER20,
-    CSR_MHPMCOUNTER21,
-    CSR_MHPMCOUNTER22,
-    CSR_MHPMCOUNTER23,
-    CSR_MHPMCOUNTER24,
-    CSR_MHPMCOUNTER25,
-    CSR_MHPMCOUNTER26,
-    CSR_MHPMCOUNTER27,
-    CSR_MHPMCOUNTER28,
-    CSR_MHPMCOUNTER29,
-    CSR_MHPMCOUNTER30,
-    CSR_MHPMCOUNTER31,
-    CSR_MCYCLEH,
-    CSR_MINSTRETH,
-    CSR_MHPMCOUNTER3H,
-    CSR_MHPMCOUNTER4H,
-    CSR_MHPMCOUNTER5H,
-    CSR_MHPMCOUNTER6H,
-    CSR_MHPMCOUNTER7H,
-    CSR_MHPMCOUNTER8H,
-    CSR_MHPMCOUNTER9H,
-    CSR_MHPMCOUNTER10H,
-    CSR_MHPMCOUNTER11H,
-    CSR_MHPMCOUNTER12H,
-    CSR_MHPMCOUNTER13H,
-    CSR_MHPMCOUNTER14H,
-    CSR_MHPMCOUNTER15H,
-    CSR_MHPMCOUNTER16H,
-    CSR_MHPMCOUNTER17H,
-    CSR_MHPMCOUNTER18H,
-    CSR_MHPMCOUNTER19H,
-    CSR_MHPMCOUNTER20H,
-    CSR_MHPMCOUNTER21H,
-    CSR_MHPMCOUNTER22H,
-    CSR_MHPMCOUNTER23H,
-    CSR_MHPMCOUNTER24H,
-    CSR_MHPMCOUNTER25H,
-    CSR_MHPMCOUNTER26H,
-    CSR_MHPMCOUNTER27H,
-    CSR_MHPMCOUNTER28H,
-    CSR_MHPMCOUNTER29H,
-    CSR_MHPMCOUNTER30H,
-    CSR_MHPMCOUNTER31H,
-    CSR_MHPMEVENT3,
-    CSR_MHPMEVENT4,
-    CSR_MHPMEVENT5,
-    CSR_MHPMEVENT6,
-    CSR_MHPMEVENT7,
-    CSR_MHPMEVENT8,
-    CSR_MHPMEVENT9,
-    CSR_MHPMEVENT10,
-    CSR_MHPMEVENT11,
-    CSR_MHPMEVENT12,
-    CSR_MHPMEVENT13,
-    CSR_MHPMEVENT14,
-    CSR_MHPMEVENT15,
-    CSR_MHPMEVENT16,
-    CSR_MHPMEVENT17,
-    CSR_MHPMEVENT18,
-    CSR_MHPMEVENT19,
-    CSR_MHPMEVENT20,
-    CSR_MHPMEVENT21,
-    CSR_MHPMEVENT22,
-    CSR_MHPMEVENT23,
-    CSR_MHPMEVENT24,
-    CSR_MHPMEVENT25,
-    CSR_MHPMEVENT26,
-    CSR_MHPMEVENT27,
-    CSR_MHPMEVENT28,
-    CSR_MHPMEVENT29,
-    CSR_MHPMEVENT30,
-    CSR_MHPMEVENT31,
-    CSR_TSELECT,
-    CSR_TDATA1,
-    CSR_TDATA2,
-    CSR_TDATA3,
-    CSR_DCSR,
-    CSR_DPC,
-    CSR_DSCRATCH,
-    CSR_HSTATUS,
-    CSR_HEDELEG,
-    CSR_HIDELEG,
-    CSR_HIE,
-    CSR_HCOUNTEREN,
-    CSR_HTVAL,
-    CSR_HIP,
-    CSR_HTINST,
-    CSR_HGATP,
-    CSR_MBASE,
-    CSR_MBOUND,
-    CSR_MIBASE,
-    CSR_MIBOUND,
-    CSR_MDBASE,
-    CSR_MDBOUND,
-    CSR_MUCOUNTEREN,
-    CSR_MSCOUNTEREN,
-    CSR_MHCOUNTEREN,
-};
-
 int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -315,11 +65,11 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
         target_ulong val = 0;
         int result;
         /*
-         * CSR_FFLAGS is at index 8 in csr_register, and gdb says it is FP
+         * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is FP
          * register 33, so we recalculate the map index.
          * This also works for CSR_FRM and CSR_FCSR.
          */
-        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], &val,
+        result = riscv_csrrw_debug(env, n - 32, &val,
                                    0, 0);
         if (result == 0) {
             return gdb_get_regl(buf, val);
@@ -338,11 +88,11 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
         target_ulong val = ldtul_p(mem_buf);
         int result;
         /*
-         * CSR_FFLAGS is at index 8 in csr_register, and gdb says it is FP
+         * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is FP
          * register 33, so we recalculate the map index.
          * This also works for CSR_FRM and CSR_FCSR.
          */
-        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], NULL,
+        result = riscv_csrrw_debug(env, n - 32, NULL,
                                    val, -1);
         if (result == 0) {
             return sizeof(target_ulong);
@@ -353,11 +103,11 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
 
 static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
 {
-    if (n < ARRAY_SIZE(csr_register_map)) {
+    if (n < CSR_TABLE_SIZE) {
         target_ulong val = 0;
         int result;
 
-        result = riscv_csrrw_debug(env, csr_register_map[n], &val, 0, 0);
+        result = riscv_csrrw_debug(env, n, &val, 0, 0);
         if (result == 0) {
             return gdb_get_regl(buf, val);
         }
@@ -367,11 +117,11 @@ static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
 
 static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
 {
-    if (n < ARRAY_SIZE(csr_register_map)) {
+    if (n < CSR_TABLE_SIZE) {
         target_ulong val = ldtul_p(mem_buf);
         int result;
 
-        result = riscv_csrrw_debug(env, csr_register_map[n], NULL, val, -1);
+        result = riscv_csrrw_debug(env, n, NULL, val, -1);
         if (result == 0) {
             return sizeof(target_ulong);
         }
@@ -405,6 +155,38 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
+static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    GString *s = g_string_new(NULL);
+    riscv_csr_predicate_fn predicate;
+    int bitsize = riscv_cpu_is_32bit(env) ? 32 : 64;
+    int i;
+
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
+
+    for (i = 0; i < CSR_TABLE_SIZE; i++) {
+        predicate = csr_ops[i].predicate;
+        if (predicate && !predicate(env, i)) {
+            if (csr_ops[i].name) {
+                g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
+            } else {
+                g_string_append_printf(s, "<reg name=\"csr%03x\"", i);
+            }
+            g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
+            g_string_append_printf(s, " regnum=\"%d\"/>", base_reg + i);
+        }
+    }
+
+    g_string_append_printf(s, "</feature>");
+
+    cpu->dyn_csr_xml = g_string_free(s, false);
+    return CSR_TABLE_SIZE;
+}
+
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -417,16 +199,14 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  36, "riscv-32bit-fpu.xml", 0);
     }
 #if defined(TARGET_RISCV32)
-    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             240, "riscv-32bit-csr.xml", 0);
-
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-32bit-virtual.xml", 0);
 #elif defined(TARGET_RISCV64)
-    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             240, "riscv-64bit-csr.xml", 0);
-
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-64bit-virtual.xml", 0);
 #endif
+
+    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
+                             riscv_gen_dynamic_csr_xml(cs, cs->gdb_num_regs),
+                             "riscv-csr.xml", 0);
 }
-- 
2.29.2


