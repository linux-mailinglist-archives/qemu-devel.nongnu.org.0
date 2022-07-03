Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B7564374
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:25:45 +0200 (CEST)
Received: from localhost ([::1]:49778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nQm-0005ju-5P
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEd-0008TT-EM
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:12 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEY-0001p4-TW
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807186; x=1688343186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LTM4nMae17Wywtl/G8GO4vUfELZqfaNA4hU9688v3y8=;
 b=iW8ZkNA0nCjOdpoFqnjS8148hPEttWMdtPMSmVyLPFAI1lZFu/TOCH+e
 9lcl74qGNay44UU8JcerijfEkRkUtQP5DS78VkGSBT79GHh7B5XbWFdGA
 sjY0M7YV4eWnfnsBXWhWQdmBbVr1kjG0YrC2EW9y6UPoxFXl+cn57nYRr
 nKxBBtO7Sie62GxaBgQK+6S/jFiuZtPA8FyaAbN+m3Fn/XMMR2V4NlffC
 F2mSMO2+BATi7FYyOgj8RlZKMFuB19brzyyxzgFQ4d2QYBgFTA4o/5MZo
 QeIZboi7cFamGjenS/EJzFpXg8N9FzvnHlamOCMPCGNqnYcANvXkzTTDK A==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667247"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:13:05 +0800
IronPort-SDR: gA6jY2rOet84leSFpR3kNxGlH5C6pt7MAR7fTP8e2dyj3kBD3mZEelhjw1Et6hwDidrI7ulspc
 uBzQWBqJ7KqzRfluD0j0e2dbjcODhumuiPZvHaHfTEZtFzwk/45boT21gHWkQwIEVDhB/M13Li
 fNWBTzFEEf7WuD0J4kK8vjSjRHs/qwuNuQJfFTtlWthH6eyzZgJJNdaBMHVlYj+NAqcMOsPO7D
 DTgeeikHAuOMaGedyupBHy+q7NkBMO7MNHQDw0jVFu2q/D01fuD56JFKs8vJ911nYnzvMULGy4
 Y/3yvYUWN5wtp0NLqLTMNjCh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:28 -0700
IronPort-SDR: AchhTUDkkk3HFZJvRCWZRmAWWagNZ0EdrnCaNW2L7twXiBCVM0KlpKv3IszjxRC63DXs/ziL3r
 lXfx8xOWeS3BShsoM55ZgjoNGdHa7h/PvVMs1uFFmjgdHsZMpVtOur3xeNyMHhp/v2hSOuRz+m
 isoSK5I97sralzzWaby+qe4M6lvSwGS6dAOynaXKAPo8UizHE+bf5oJbsOuxFUI/eSXwHkThjH
 eWihFV+qY1DeM24oV3ISgSRbcTwl4MBJ/LU1ARyNIOCA2Sqj9auEhel8VdH0YUAaxa7BJ/x8Jz
 Qeo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:13:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Xd53nFz1Rwry
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:13:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807183; x=1659399184; bh=LTM4nMae17Wywtl/G8
 GO4vUfELZqfaNA4hU9688v3y8=; b=Xk5RTjsQST1Bm4QD9T0Tzsl4+P54uXuBwe
 AhlRHYEC7EZ03pRPlljOcpQoijlGPK2n4xemOvgBRjWmiWIIUsZ5/EVrDx38qs4j
 sXRpvDgZl/vVZ+l5Fl63M687yNKeSc+gy4VEI9ozTofdSeAE3jHdOWGUxUebkCH9
 Tad0lznzZ/sCPwWqZeTHFSXT7jPacKhh1fXW3NQw4+SAywoOjA9ZjC4uaADWrTwG
 sIa3sEUpYFBcPTQgukcNii+1YVS/DqYsctuPwdZY/rkvwODnd1gEe+XrYlnvxnt9
 SjOIuCLaOND0i+utVuXzwmfigwkJfLzrjVlmCGxsKx95tn3Wm+MQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YXO4n641bq7A for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:13:03 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8XY2Z9lz1RtVk;
 Sat,  2 Jul 2022 17:13:01 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>
Subject: [PULL v2 11/19] target/riscv: Add support for hpmcounters/hpmevents
Date: Sun,  3 Jul 2022 10:12:26 +1000
Message-Id: <20220703001234.439716-12-alistair.francis@opensource.wdc.com>
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

From: Atish Patra <atish.patra@wdc.com>

With SBI PMU extension, user can use any of the available hpmcounters to
track any perf events based on the value written to mhpmevent csr.
Add read/write functionality for these csrs.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220620231603.2547260-7-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     |  11 +
 target/riscv/csr.c     | 469 ++++++++++++++++++++++++++++-------------
 target/riscv/machine.c |   3 +
 3 files changed, 331 insertions(+), 152 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a916db9f6..199d0d570b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -117,6 +117,8 @@ typedef struct CPUArchState CPURISCVState;
 #endif
=20
 #define RV_VLEN_MAX 1024
+#define RV_MAX_MHPMEVENTS 29
+#define RV_MAX_MHPMCOUNTERS 32
=20
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
@@ -277,6 +279,15 @@ struct CPUArchState {
=20
     target_ulong mcountinhibit;
=20
+    /* PMU counter configured values */
+    target_ulong mhpmcounter_val[RV_MAX_MHPMCOUNTERS];
+
+    /* for RV32 */
+    target_ulong mhpmcounterh_val[RV_MAX_MHPMCOUNTERS];
+
+    /* PMU event selector configured values */
+    target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
+
     target_ulong sscratch;
     target_ulong mscratch;
=20
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 94d39a4ce1..b931a3970e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -230,6 +230,15 @@ static RISCVException mctr(CPURISCVState *env, int c=
srno)
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException mctr32(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return mctr(env, csrno);
+}
+
 static RISCVException any(CPURISCVState *env, int csrno)
 {
     return RISCV_EXCP_NONE;
@@ -635,6 +644,75 @@ static RISCVException read_timeh(CPURISCVState *env,=
 int csrno,
=20
 #else /* CONFIG_USER_ONLY */
=20
+static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *v=
al)
+{
+    int evt_index =3D csrno - CSR_MHPMEVENT3;
+
+    *val =3D env->mhpmevent_val[evt_index];
+
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong v=
al)
+{
+    int evt_index =3D csrno - CSR_MHPMEVENT3;
+
+    env->mhpmevent_val[evt_index] =3D val;
+
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong=
 val)
+{
+    int ctr_index =3D csrno - CSR_MHPMCOUNTER3 + 3;
+
+    env->mhpmcounter_val[ctr_index] =3D val;
+
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulon=
g val)
+{
+    int ctr_index =3D csrno - CSR_MHPMCOUNTER3H + 3;
+
+    env->mhpmcounterh_val[ctr_index] =3D val;
+
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong *=
val)
+{
+    int ctr_index;
+
+    if (csrno >=3D CSR_MCYCLE && csrno <=3D CSR_MHPMCOUNTER31) {
+        ctr_index =3D csrno - CSR_MHPMCOUNTER3 + 3;
+    } else if (csrno >=3D CSR_CYCLE && csrno <=3D CSR_HPMCOUNTER31) {
+        ctr_index =3D csrno - CSR_HPMCOUNTER3 + 3;
+    } else {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    *val =3D env->mhpmcounter_val[ctr_index];
+
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong =
*val)
+{
+    int ctr_index;
+
+    if (csrno >=3D CSR_MCYCLEH && csrno <=3D CSR_MHPMCOUNTER31H) {
+        ctr_index =3D csrno - CSR_MHPMCOUNTER3H + 3;
+    } else if (csrno >=3D CSR_CYCLEH && csrno <=3D CSR_HPMCOUNTER31H) {
+        ctr_index =3D csrno - CSR_HPMCOUNTER3H + 3;
+    } else {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    *val =3D env->mhpmcounterh_val[ctr_index];
+
+    return RISCV_EXCP_NONE;
+}
+
+
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -3707,157 +3785,244 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
     [CSR_SPMBASE] =3D    { "spmbase", pointer_masking, read_spmbase, wri=
te_spmbase },
=20
     /* Performance Counters */
-    [CSR_HPMCOUNTER3]    =3D { "hpmcounter3",    ctr,    read_zero },
-    [CSR_HPMCOUNTER4]    =3D { "hpmcounter4",    ctr,    read_zero },
-    [CSR_HPMCOUNTER5]    =3D { "hpmcounter5",    ctr,    read_zero },
-    [CSR_HPMCOUNTER6]    =3D { "hpmcounter6",    ctr,    read_zero },
-    [CSR_HPMCOUNTER7]    =3D { "hpmcounter7",    ctr,    read_zero },
-    [CSR_HPMCOUNTER8]    =3D { "hpmcounter8",    ctr,    read_zero },
-    [CSR_HPMCOUNTER9]    =3D { "hpmcounter9",    ctr,    read_zero },
-    [CSR_HPMCOUNTER10]   =3D { "hpmcounter10",   ctr,    read_zero },
-    [CSR_HPMCOUNTER11]   =3D { "hpmcounter11",   ctr,    read_zero },
-    [CSR_HPMCOUNTER12]   =3D { "hpmcounter12",   ctr,    read_zero },
-    [CSR_HPMCOUNTER13]   =3D { "hpmcounter13",   ctr,    read_zero },
-    [CSR_HPMCOUNTER14]   =3D { "hpmcounter14",   ctr,    read_zero },
-    [CSR_HPMCOUNTER15]   =3D { "hpmcounter15",   ctr,    read_zero },
-    [CSR_HPMCOUNTER16]   =3D { "hpmcounter16",   ctr,    read_zero },
-    [CSR_HPMCOUNTER17]   =3D { "hpmcounter17",   ctr,    read_zero },
-    [CSR_HPMCOUNTER18]   =3D { "hpmcounter18",   ctr,    read_zero },
-    [CSR_HPMCOUNTER19]   =3D { "hpmcounter19",   ctr,    read_zero },
-    [CSR_HPMCOUNTER20]   =3D { "hpmcounter20",   ctr,    read_zero },
-    [CSR_HPMCOUNTER21]   =3D { "hpmcounter21",   ctr,    read_zero },
-    [CSR_HPMCOUNTER22]   =3D { "hpmcounter22",   ctr,    read_zero },
-    [CSR_HPMCOUNTER23]   =3D { "hpmcounter23",   ctr,    read_zero },
-    [CSR_HPMCOUNTER24]   =3D { "hpmcounter24",   ctr,    read_zero },
-    [CSR_HPMCOUNTER25]   =3D { "hpmcounter25",   ctr,    read_zero },
-    [CSR_HPMCOUNTER26]   =3D { "hpmcounter26",   ctr,    read_zero },
-    [CSR_HPMCOUNTER27]   =3D { "hpmcounter27",   ctr,    read_zero },
-    [CSR_HPMCOUNTER28]   =3D { "hpmcounter28",   ctr,    read_zero },
-    [CSR_HPMCOUNTER29]   =3D { "hpmcounter29",   ctr,    read_zero },
-    [CSR_HPMCOUNTER30]   =3D { "hpmcounter30",   ctr,    read_zero },
-    [CSR_HPMCOUNTER31]   =3D { "hpmcounter31",   ctr,    read_zero },
-
-    [CSR_MHPMCOUNTER3]   =3D { "mhpmcounter3",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER4]   =3D { "mhpmcounter4",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER5]   =3D { "mhpmcounter5",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER6]   =3D { "mhpmcounter6",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER7]   =3D { "mhpmcounter7",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER8]   =3D { "mhpmcounter8",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER9]   =3D { "mhpmcounter9",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER10]  =3D { "mhpmcounter10",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER11]  =3D { "mhpmcounter11",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER12]  =3D { "mhpmcounter12",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER13]  =3D { "mhpmcounter13",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER14]  =3D { "mhpmcounter14",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER15]  =3D { "mhpmcounter15",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER16]  =3D { "mhpmcounter16",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER17]  =3D { "mhpmcounter17",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER18]  =3D { "mhpmcounter18",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER19]  =3D { "mhpmcounter19",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER20]  =3D { "mhpmcounter20",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER21]  =3D { "mhpmcounter21",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER22]  =3D { "mhpmcounter22",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER23]  =3D { "mhpmcounter23",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER24]  =3D { "mhpmcounter24",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER25]  =3D { "mhpmcounter25",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER26]  =3D { "mhpmcounter26",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER27]  =3D { "mhpmcounter27",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER28]  =3D { "mhpmcounter28",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER29]  =3D { "mhpmcounter29",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER30]  =3D { "mhpmcounter30",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER31]  =3D { "mhpmcounter31",  mctr,   read_zero },
-
-    [CSR_MCOUNTINHIBIT]  =3D { "mcountinhibit",   any,    read_mcountinh=
ibit,
-                                                       write_mcountinhib=
it },
-
-    [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any,    read_zero },
-    [CSR_MHPMEVENT4]     =3D { "mhpmevent4",     any,    read_zero },
-    [CSR_MHPMEVENT5]     =3D { "mhpmevent5",     any,    read_zero },
-    [CSR_MHPMEVENT6]     =3D { "mhpmevent6",     any,    read_zero },
-    [CSR_MHPMEVENT7]     =3D { "mhpmevent7",     any,    read_zero },
-    [CSR_MHPMEVENT8]     =3D { "mhpmevent8",     any,    read_zero },
-    [CSR_MHPMEVENT9]     =3D { "mhpmevent9",     any,    read_zero },
-    [CSR_MHPMEVENT10]    =3D { "mhpmevent10",    any,    read_zero },
-    [CSR_MHPMEVENT11]    =3D { "mhpmevent11",    any,    read_zero },
-    [CSR_MHPMEVENT12]    =3D { "mhpmevent12",    any,    read_zero },
-    [CSR_MHPMEVENT13]    =3D { "mhpmevent13",    any,    read_zero },
-    [CSR_MHPMEVENT14]    =3D { "mhpmevent14",    any,    read_zero },
-    [CSR_MHPMEVENT15]    =3D { "mhpmevent15",    any,    read_zero },
-    [CSR_MHPMEVENT16]    =3D { "mhpmevent16",    any,    read_zero },
-    [CSR_MHPMEVENT17]    =3D { "mhpmevent17",    any,    read_zero },
-    [CSR_MHPMEVENT18]    =3D { "mhpmevent18",    any,    read_zero },
-    [CSR_MHPMEVENT19]    =3D { "mhpmevent19",    any,    read_zero },
-    [CSR_MHPMEVENT20]    =3D { "mhpmevent20",    any,    read_zero },
-    [CSR_MHPMEVENT21]    =3D { "mhpmevent21",    any,    read_zero },
-    [CSR_MHPMEVENT22]    =3D { "mhpmevent22",    any,    read_zero },
-    [CSR_MHPMEVENT23]    =3D { "mhpmevent23",    any,    read_zero },
-    [CSR_MHPMEVENT24]    =3D { "mhpmevent24",    any,    read_zero },
-    [CSR_MHPMEVENT25]    =3D { "mhpmevent25",    any,    read_zero },
-    [CSR_MHPMEVENT26]    =3D { "mhpmevent26",    any,    read_zero },
-    [CSR_MHPMEVENT27]    =3D { "mhpmevent27",    any,    read_zero },
-    [CSR_MHPMEVENT28]    =3D { "mhpmevent28",    any,    read_zero },
-    [CSR_MHPMEVENT29]    =3D { "mhpmevent29",    any,    read_zero },
-    [CSR_MHPMEVENT30]    =3D { "mhpmevent30",    any,    read_zero },
-    [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_zero },
-
-    [CSR_HPMCOUNTER3H]   =3D { "hpmcounter3h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER4H]   =3D { "hpmcounter4h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER5H]   =3D { "hpmcounter5h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER6H]   =3D { "hpmcounter6h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER7H]   =3D { "hpmcounter7h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER8H]   =3D { "hpmcounter8h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER9H]   =3D { "hpmcounter9h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER10H]  =3D { "hpmcounter10h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER11H]  =3D { "hpmcounter11h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER12H]  =3D { "hpmcounter12h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER13H]  =3D { "hpmcounter13h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER14H]  =3D { "hpmcounter14h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER15H]  =3D { "hpmcounter15h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER16H]  =3D { "hpmcounter16h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER17H]  =3D { "hpmcounter17h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER18H]  =3D { "hpmcounter18h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER19H]  =3D { "hpmcounter19h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER20H]  =3D { "hpmcounter20h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER21H]  =3D { "hpmcounter21h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER22H]  =3D { "hpmcounter22h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER23H]  =3D { "hpmcounter23h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER24H]  =3D { "hpmcounter24h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER25H]  =3D { "hpmcounter25h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER26H]  =3D { "hpmcounter26h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER27H]  =3D { "hpmcounter27h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER28H]  =3D { "hpmcounter28h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER29H]  =3D { "hpmcounter29h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER30H]  =3D { "hpmcounter30h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER31H]  =3D { "hpmcounter31h",  ctr32,  read_zero },
-
-    [CSR_MHPMCOUNTER3H]  =3D { "mhpmcounter3h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER4H]  =3D { "mhpmcounter4h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER5H]  =3D { "mhpmcounter5h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER6H]  =3D { "mhpmcounter6h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER7H]  =3D { "mhpmcounter7h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER8H]  =3D { "mhpmcounter8h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER9H]  =3D { "mhpmcounter9h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER10H] =3D { "mhpmcounter10h", any32,  read_zero },
-    [CSR_MHPMCOUNTER11H] =3D { "mhpmcounter11h", any32,  read_zero },
-    [CSR_MHPMCOUNTER12H] =3D { "mhpmcounter12h", any32,  read_zero },
-    [CSR_MHPMCOUNTER13H] =3D { "mhpmcounter13h", any32,  read_zero },
-    [CSR_MHPMCOUNTER14H] =3D { "mhpmcounter14h", any32,  read_zero },
-    [CSR_MHPMCOUNTER15H] =3D { "mhpmcounter15h", any32,  read_zero },
-    [CSR_MHPMCOUNTER16H] =3D { "mhpmcounter16h", any32,  read_zero },
-    [CSR_MHPMCOUNTER17H] =3D { "mhpmcounter17h", any32,  read_zero },
-    [CSR_MHPMCOUNTER18H] =3D { "mhpmcounter18h", any32,  read_zero },
-    [CSR_MHPMCOUNTER19H] =3D { "mhpmcounter19h", any32,  read_zero },
-    [CSR_MHPMCOUNTER20H] =3D { "mhpmcounter20h", any32,  read_zero },
-    [CSR_MHPMCOUNTER21H] =3D { "mhpmcounter21h", any32,  read_zero },
-    [CSR_MHPMCOUNTER22H] =3D { "mhpmcounter22h", any32,  read_zero },
-    [CSR_MHPMCOUNTER23H] =3D { "mhpmcounter23h", any32,  read_zero },
-    [CSR_MHPMCOUNTER24H] =3D { "mhpmcounter24h", any32,  read_zero },
-    [CSR_MHPMCOUNTER25H] =3D { "mhpmcounter25h", any32,  read_zero },
-    [CSR_MHPMCOUNTER26H] =3D { "mhpmcounter26h", any32,  read_zero },
-    [CSR_MHPMCOUNTER27H] =3D { "mhpmcounter27h", any32,  read_zero },
-    [CSR_MHPMCOUNTER28H] =3D { "mhpmcounter28h", any32,  read_zero },
-    [CSR_MHPMCOUNTER29H] =3D { "mhpmcounter29h", any32,  read_zero },
-    [CSR_MHPMCOUNTER30H] =3D { "mhpmcounter30h", any32,  read_zero },
-    [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", any32,  read_zero },
+    [CSR_HPMCOUNTER3]    =3D { "hpmcounter3",    ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER4]    =3D { "hpmcounter4",    ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER5]    =3D { "hpmcounter5",    ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER6]    =3D { "hpmcounter6",    ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER7]    =3D { "hpmcounter7",    ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER8]    =3D { "hpmcounter8",    ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER9]    =3D { "hpmcounter9",    ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER10]   =3D { "hpmcounter10",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER11]   =3D { "hpmcounter11",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER12]   =3D { "hpmcounter12",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER13]   =3D { "hpmcounter13",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER14]   =3D { "hpmcounter14",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER15]   =3D { "hpmcounter15",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER16]   =3D { "hpmcounter16",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER17]   =3D { "hpmcounter17",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER18]   =3D { "hpmcounter18",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER19]   =3D { "hpmcounter19",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER20]   =3D { "hpmcounter20",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER21]   =3D { "hpmcounter21",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER22]   =3D { "hpmcounter22",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER23]   =3D { "hpmcounter23",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER24]   =3D { "hpmcounter24",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER25]   =3D { "hpmcounter25",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER26]   =3D { "hpmcounter26",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER27]   =3D { "hpmcounter27",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER28]   =3D { "hpmcounter28",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER29]   =3D { "hpmcounter29",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER30]   =3D { "hpmcounter30",   ctr,    read_hpmcounter=
 },
+    [CSR_HPMCOUNTER31]   =3D { "hpmcounter31",   ctr,    read_hpmcounter=
 },
+
+    [CSR_MHPMCOUNTER3]   =3D { "mhpmcounter3",   mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER4]   =3D { "mhpmcounter4",   mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER5]   =3D { "mhpmcounter5",   mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER6]   =3D { "mhpmcounter6",   mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER7]   =3D { "mhpmcounter7",   mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER8]   =3D { "mhpmcounter8",   mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER9]   =3D { "mhpmcounter9",   mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER10]  =3D { "mhpmcounter10",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER11]  =3D { "mhpmcounter11",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER12]  =3D { "mhpmcounter12",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER13]  =3D { "mhpmcounter13",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER14]  =3D { "mhpmcounter14",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER15]  =3D { "mhpmcounter15",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER16]  =3D { "mhpmcounter16",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER17]  =3D { "mhpmcounter17",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER18]  =3D { "mhpmcounter18",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER19]  =3D { "mhpmcounter19",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER20]  =3D { "mhpmcounter20",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER21]  =3D { "mhpmcounter21",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER22]  =3D { "mhpmcounter22",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER23]  =3D { "mhpmcounter23",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER24]  =3D { "mhpmcounter24",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER25]  =3D { "mhpmcounter25",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER26]  =3D { "mhpmcounter26",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER27]  =3D { "mhpmcounter27",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER28]  =3D { "mhpmcounter28",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER29]  =3D { "mhpmcounter29",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER30]  =3D { "mhpmcounter30",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+    [CSR_MHPMCOUNTER31]  =3D { "mhpmcounter31",  mctr,    read_hpmcounte=
r,
+                                                       write_mhpmcounter=
 },
+
+    [CSR_MCOUNTINHIBIT]  =3D { "mcountinhibit",  any, read_mcountinhibit=
,
+                                                    write_mcountinhibit =
},
+
+    [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT4]     =3D { "mhpmevent4",     any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT5]     =3D { "mhpmevent5",     any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT6]     =3D { "mhpmevent6",     any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT7]     =3D { "mhpmevent7",     any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT8]     =3D { "mhpmevent8",     any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT9]     =3D { "mhpmevent9",     any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT10]    =3D { "mhpmevent10",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT11]    =3D { "mhpmevent11",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT12]    =3D { "mhpmevent12",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT13]    =3D { "mhpmevent13",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT14]    =3D { "mhpmevent14",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT15]    =3D { "mhpmevent15",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT16]    =3D { "mhpmevent16",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT17]    =3D { "mhpmevent17",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT18]    =3D { "mhpmevent18",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT19]    =3D { "mhpmevent19",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT20]    =3D { "mhpmevent20",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT21]    =3D { "mhpmevent21",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT22]    =3D { "mhpmevent22",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT23]    =3D { "mhpmevent23",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT24]    =3D { "mhpmevent24",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT25]    =3D { "mhpmevent25",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT26]    =3D { "mhpmevent26",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT27]    =3D { "mhpmevent27",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT28]    =3D { "mhpmevent28",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT29]    =3D { "mhpmevent29",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT30]    =3D { "mhpmevent30",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+    [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_mhpmevent,
+                                                       write_mhpmevent }=
,
+
+    [CSR_HPMCOUNTER3H]   =3D { "hpmcounter3h",   ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER4H]   =3D { "hpmcounter4h",   ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER5H]   =3D { "hpmcounter5h",   ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER6H]   =3D { "hpmcounter6h",   ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER7H]   =3D { "hpmcounter7h",   ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER8H]   =3D { "hpmcounter8h",   ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER9H]   =3D { "hpmcounter9h",   ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER10H]  =3D { "hpmcounter10h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER11H]  =3D { "hpmcounter11h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER12H]  =3D { "hpmcounter12h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER13H]  =3D { "hpmcounter13h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER14H]  =3D { "hpmcounter14h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER15H]  =3D { "hpmcounter15h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER16H]  =3D { "hpmcounter16h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER17H]  =3D { "hpmcounter17h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER18H]  =3D { "hpmcounter18h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER19H]  =3D { "hpmcounter19h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER20H]  =3D { "hpmcounter20h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER21H]  =3D { "hpmcounter21h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER22H]  =3D { "hpmcounter22h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER23H]  =3D { "hpmcounter23h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER24H]  =3D { "hpmcounter24h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER25H]  =3D { "hpmcounter25h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER26H]  =3D { "hpmcounter26h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER27H]  =3D { "hpmcounter27h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER28H]  =3D { "hpmcounter28h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER29H]  =3D { "hpmcounter29h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER30H]  =3D { "hpmcounter30h",  ctr32,  read_hpmcounter=
h },
+    [CSR_HPMCOUNTER31H]  =3D { "hpmcounter31h",  ctr32,  read_hpmcounter=
h },
+
+    [CSR_MHPMCOUNTER3H]  =3D { "mhpmcounter3h",  mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER4H]  =3D { "mhpmcounter4h",  mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER5H]  =3D { "mhpmcounter5h",  mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER6H]  =3D { "mhpmcounter6h",  mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER7H]  =3D { "mhpmcounter7h",  mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER8H]  =3D { "mhpmcounter8h",  mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER9H]  =3D { "mhpmcounter9h",  mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER10H] =3D { "mhpmcounter10h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER11H] =3D { "mhpmcounter11h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER12H] =3D { "mhpmcounter12h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER13H] =3D { "mhpmcounter13h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER14H] =3D { "mhpmcounter14h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER15H] =3D { "mhpmcounter15h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER16H] =3D { "mhpmcounter16h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER17H] =3D { "mhpmcounter17h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER18H] =3D { "mhpmcounter18h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER19H] =3D { "mhpmcounter19h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER20H] =3D { "mhpmcounter20h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER21H] =3D { "mhpmcounter21h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER22H] =3D { "mhpmcounter22h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER23H] =3D { "mhpmcounter23h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER24H] =3D { "mhpmcounter24h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER25H] =3D { "mhpmcounter25h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER26H] =3D { "mhpmcounter26h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER27H] =3D { "mhpmcounter27h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER28H] =3D { "mhpmcounter28h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER29H] =3D { "mhpmcounter29h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER30H] =3D { "mhpmcounter30h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
+    [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", mctr32,  read_hpmcounte=
rh,
+                                                       write_mhpmcounter=
h },
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 87cd55bfd3..99193c85bb 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -331,6 +331,9 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
+        VMSTATE_UINTTL_ARRAY(env.mhpmcounter_val, RISCVCPU, RV_MAX_MHPMC=
OUNTERS),
+        VMSTATE_UINTTL_ARRAY(env.mhpmcounterh_val, RISCVCPU, RV_MAX_MHPM=
COUNTERS),
+        VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU, RV_MAX_MHPMEVE=
NTS),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
--=20
2.36.1


