Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA8564371
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:23:04 +0200 (CEST)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nOB-0001XP-Uc
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEX-0008Pv-En
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:06 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nET-0001p4-6w
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807180; x=1688343180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=APFVxoA4w+pXZxR4aPhchR0JJ0se4W7/l8p6DPel2nw=;
 b=OTURtUHjB5W9FOAw1bBHb+FcAqITPpphVCTAjPvIzVrp1qabP7dUjqQh
 IxWeC49PJQmkmiea/+RdzNC4rhnO9fRAX5pkn2DCJCeiH/ASBi/2gSEYy
 oi/8tUMU/Op6Qe9Tek1r521DPVHsZJg7NmXKosZjqZg9jzYpGDrcDHKge
 4iJnJtl1sVKTdcZyAS5fTTSnILwYBLQl81WvDYR9B+QuBrDB2AlhyScgl
 QmdKMzUT1yHS77TrCq3CSsgEgqkY5H5bg0qtpKKUDAmjmkxIOvi4c+0bi
 XWEbJccq0+0gS/n3drcStsAgowMpOT3P88mHdeH3aDj2GI1eI/mlgwGWH g==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667240"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:12:58 +0800
IronPort-SDR: ReCIgM24OxwujA/3o+pnrBO4IXyBvpwU3F+vZ6+hwmDP9iypwMa6mUsSTrapqCeboNbxXtNB08
 GNILPNHrCLEBnekm3ghhPKzEDKRbAHAJhIY4Ow5cy2qYfSzeSyh4aJj+GpE/k8PWVfA7eVqEs7
 lh0L1eJA64RM5uPoaDo+QxAkaas7hAB0w6sUkfXj4oKifudKh+Vvi/OAaMz/vrGSzLHTngLFyl
 rKycvnlZrb3Peb2m2OLXam9Xww5pLSlLUicmXCaCKSIXLrcc0L2oC71Xij1IKFIEuzSar7fejy
 it896EAc0JC3KW3oYB1FKGsK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:21 -0700
IronPort-SDR: sUpUEl7ECVa5uGgOI4DoZBiniqTc5yRqPlIrNZKJ9Z/o6aq+nsmt3ztiU1naFreZrtbRMM8Eox
 7nnycoCfpTGJzvu5WmIbLnYNjvwD5uZEsO2igTXjHQJC3JfGMU4f+W8HIDBmiDwuDkGEBUkzXf
 ktBfC67YKXkb8AQr/Jg7zIr1bjtND82Sl8Bt2b1IoZkPqoW184ZEwyfU08ZILDDtgfwhW9WruS
 Z3iW9Bp4SHWrcozKtBmPmIwFiZ0l4oDDXzEOFkLRiYgBAvHZi3VAOI8EDzhGuB+f6sC9MauB71
 PB8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:12:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8XW1VxGz1Rwnm
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:12:59 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807178; x=1659399179; bh=APFVxoA4w+pXZxR4aP
 hchR0JJ0se4W7/l8p6DPel2nw=; b=V11V1tos0++7ITowmek21aZhQnwJiQ+szd
 6g8AfF7zoRCh5vWiE3nbz1+6hYRkTfW+nm2pKLTJY39+4RGQeS1uE+pkj6agk+2N
 j8NAQhTSoOfqdIr3amA3cornJMA/f+GeNvTIAVVv5w48u1RRXUEDmiZ97abgwNgt
 nIpm7RvDUYvpCEsicJorLJ8ZB12HighmrAXU6amquUXM40ZYsBSDrlxQYgRKiBJO
 Q3fCXNzszPq0bJFmyOxgKICadc/4ESR9FiK/Eq4Af8xM5z/qQqFyQCnGUETnImZy
 1vnd8Pbo9+swFzYe5ViL8P9ff+kjaxLNb+d48rlkmMpw0oLBnkeA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AzV0ictUfvTl for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:12:58 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8XS3GrKz1RtVk;
 Sat,  2 Jul 2022 17:12:56 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atish.patra@wdc.com>
Subject: [PULL v2 09/19] target/riscv: pmu: Make number of counters
 configurable
Date: Sun,  3 Jul 2022 10:12:24 +1000
Message-Id: <20220703001234.439716-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
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

From: Atish Patra <atishp@rivosinc.com>

The RISC-V privilege specification provides flexibility to implement
any number of counters from 29 programmable counters. However, the QEMU
implements all the counters.

Make it configurable through pmu config parameter which now will indicate
how many programmable counters should be implemented by the cpu.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220620231603.2547260-5-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  2 +-
 target/riscv/cpu.c |  3 +-
 target/riscv/csr.c | 94 ++++++++++++++++++++++++++++++----------------
 3 files changed, 63 insertions(+), 36 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 252c30a55d..ffee54ea5c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -397,7 +397,6 @@ struct RISCVCPUConfig {
     bool ext_zksed;
     bool ext_zksh;
     bool ext_zkt;
-    bool ext_pmu;
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_svinval;
@@ -421,6 +420,7 @@ struct RISCVCPUConfig {
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
=20
+    uint8_t pmu_num;
     char *priv_spec;
     char *user_spec;
     char *bext_spec;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1b57b3c439..d12c6dc630 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -851,7 +851,6 @@ static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
-    cpu->cfg.ext_pmu =3D true;
     cpu->cfg.ext_ifencei =3D true;
     cpu->cfg.ext_icsr =3D true;
     cpu->cfg.mmu =3D true;
@@ -879,7 +878,7 @@ static Property riscv_cpu_extensions[] =3D {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
+    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0ca05c7788..b4a8e15f49 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -73,9 +73,17 @@ static RISCVException ctr(CPURISCVState *env, int csrn=
o)
     CPUState *cs =3D env_cpu(env);
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     int ctr_index;
+    int base_csrno =3D CSR_HPMCOUNTER3;
+    bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? true : false;
=20
-    if (!cpu->cfg.ext_pmu) {
-        /* The PMU extension is not enabled */
+    if (rv32 && csrno >=3D CSR_CYCLEH) {
+        /* Offset for RV32 hpmcounternh counters */
+        base_csrno +=3D 0x80;
+    }
+    ctr_index =3D csrno - base_csrno;
+
+    if (!cpu->cfg.pmu_num || ctr_index >=3D (cpu->cfg.pmu_num)) {
+        /* No counter is enabled in PMU or the counter is out of range *=
/
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
@@ -103,7 +111,7 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
             }
             break;
         }
-        if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
+        if (rv32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->mcounteren, COUNTEREN_CY)) {
@@ -158,7 +166,7 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
             }
             break;
         }
-        if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
+        if (rv32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->hcounteren, COUNTEREN_CY) &&
@@ -202,6 +210,26 @@ static RISCVException ctr32(CPURISCVState *env, int =
csrno)
 }
=20
 #if !defined(CONFIG_USER_ONLY)
+static RISCVException mctr(CPURISCVState *env, int csrno)
+{
+    CPUState *cs =3D env_cpu(env);
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    int ctr_index;
+    int base_csrno =3D CSR_MHPMCOUNTER3;
+
+    if ((riscv_cpu_mxl(env) =3D=3D MXL_RV32) && csrno >=3D CSR_MCYCLEH) =
{
+        /* Offset for RV32 mhpmcounternh counters */
+        base_csrno +=3D 0x80;
+    }
+    ctr_index =3D csrno - base_csrno;
+    if (!cpu->cfg.pmu_num || ctr_index >=3D cpu->cfg.pmu_num) {
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
@@ -3687,35 +3715,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
     [CSR_HPMCOUNTER30]   =3D { "hpmcounter30",   ctr,    read_zero },
     [CSR_HPMCOUNTER31]   =3D { "hpmcounter31",   ctr,    read_zero },
=20
-    [CSR_MHPMCOUNTER3]   =3D { "mhpmcounter3",   any,    read_zero },
-    [CSR_MHPMCOUNTER4]   =3D { "mhpmcounter4",   any,    read_zero },
-    [CSR_MHPMCOUNTER5]   =3D { "mhpmcounter5",   any,    read_zero },
-    [CSR_MHPMCOUNTER6]   =3D { "mhpmcounter6",   any,    read_zero },
-    [CSR_MHPMCOUNTER7]   =3D { "mhpmcounter7",   any,    read_zero },
-    [CSR_MHPMCOUNTER8]   =3D { "mhpmcounter8",   any,    read_zero },
-    [CSR_MHPMCOUNTER9]   =3D { "mhpmcounter9",   any,    read_zero },
-    [CSR_MHPMCOUNTER10]  =3D { "mhpmcounter10",  any,    read_zero },
-    [CSR_MHPMCOUNTER11]  =3D { "mhpmcounter11",  any,    read_zero },
-    [CSR_MHPMCOUNTER12]  =3D { "mhpmcounter12",  any,    read_zero },
-    [CSR_MHPMCOUNTER13]  =3D { "mhpmcounter13",  any,    read_zero },
-    [CSR_MHPMCOUNTER14]  =3D { "mhpmcounter14",  any,    read_zero },
-    [CSR_MHPMCOUNTER15]  =3D { "mhpmcounter15",  any,    read_zero },
-    [CSR_MHPMCOUNTER16]  =3D { "mhpmcounter16",  any,    read_zero },
-    [CSR_MHPMCOUNTER17]  =3D { "mhpmcounter17",  any,    read_zero },
-    [CSR_MHPMCOUNTER18]  =3D { "mhpmcounter18",  any,    read_zero },
-    [CSR_MHPMCOUNTER19]  =3D { "mhpmcounter19",  any,    read_zero },
-    [CSR_MHPMCOUNTER20]  =3D { "mhpmcounter20",  any,    read_zero },
-    [CSR_MHPMCOUNTER21]  =3D { "mhpmcounter21",  any,    read_zero },
-    [CSR_MHPMCOUNTER22]  =3D { "mhpmcounter22",  any,    read_zero },
-    [CSR_MHPMCOUNTER23]  =3D { "mhpmcounter23",  any,    read_zero },
-    [CSR_MHPMCOUNTER24]  =3D { "mhpmcounter24",  any,    read_zero },
-    [CSR_MHPMCOUNTER25]  =3D { "mhpmcounter25",  any,    read_zero },
-    [CSR_MHPMCOUNTER26]  =3D { "mhpmcounter26",  any,    read_zero },
-    [CSR_MHPMCOUNTER27]  =3D { "mhpmcounter27",  any,    read_zero },
-    [CSR_MHPMCOUNTER28]  =3D { "mhpmcounter28",  any,    read_zero },
-    [CSR_MHPMCOUNTER29]  =3D { "mhpmcounter29",  any,    read_zero },
-    [CSR_MHPMCOUNTER30]  =3D { "mhpmcounter30",  any,    read_zero },
-    [CSR_MHPMCOUNTER31]  =3D { "mhpmcounter31",  any,    read_zero },
+    [CSR_MHPMCOUNTER3]   =3D { "mhpmcounter3",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER4]   =3D { "mhpmcounter4",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER5]   =3D { "mhpmcounter5",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER6]   =3D { "mhpmcounter6",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER7]   =3D { "mhpmcounter7",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER8]   =3D { "mhpmcounter8",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER9]   =3D { "mhpmcounter9",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER10]  =3D { "mhpmcounter10",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER11]  =3D { "mhpmcounter11",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER12]  =3D { "mhpmcounter12",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER13]  =3D { "mhpmcounter13",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER14]  =3D { "mhpmcounter14",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER15]  =3D { "mhpmcounter15",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER16]  =3D { "mhpmcounter16",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER17]  =3D { "mhpmcounter17",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER18]  =3D { "mhpmcounter18",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER19]  =3D { "mhpmcounter19",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER20]  =3D { "mhpmcounter20",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER21]  =3D { "mhpmcounter21",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER22]  =3D { "mhpmcounter22",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER23]  =3D { "mhpmcounter23",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER24]  =3D { "mhpmcounter24",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER25]  =3D { "mhpmcounter25",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER26]  =3D { "mhpmcounter26",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER27]  =3D { "mhpmcounter27",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER28]  =3D { "mhpmcounter28",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER29]  =3D { "mhpmcounter29",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER30]  =3D { "mhpmcounter30",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER31]  =3D { "mhpmcounter31",  mctr,   read_zero },
=20
     [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any,    read_zero },
     [CSR_MHPMEVENT4]     =3D { "mhpmevent4",     any,    read_zero },
--=20
2.36.1


