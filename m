Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7820495D03
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:42:44 +0100 (CET)
Received: from localhost ([::1]:47468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqRP-000064-UH
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:42:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAnAn-000656-Ti
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:13:22 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:54834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAnAl-0007Cg-Rc
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642745598; x=1674281598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bUjz7eRFR1gjUHSOajKMdYNuk2eQkeoW3rLA+XBUITQ=;
 b=d58n566F9BV9RpgIfYA01wjmiNbrTNysPA6EHFyrub/g48nzJgrdh6Si
 Vi5wZHavqBzxSETx7x9ouIUm4KQhjbPkZB8rWB6ergvFidCQMIolw3vn0
 ec+sA+I1RRRAdVJ38lWLvycrf6Iv1Ki0QGa8F5v6pbbvaAatztx453NmT
 fFeaZjRpDTne7KzqIdziVWxg5iakW88l4QOzvxd23tbW7e1qKlcd3tIze
 /nac0YJfUTtUVB1+nwW0zDZ4/SFh37NguevwQB86gAlw4j4HENa5wNeI5
 W6DrYfKsr3KMpBeHX61S9mZymhr7M0OdDpSCMOTiJ22XSm6jlrwl/hM2f A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="195814958"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:13:17 +0800
IronPort-SDR: vXLymIPwJqel77t5xDfCyiJTOKBkTr/CHlH7/Sy/rmKCzwR4tSDHi0VVcj6Hoz0n65BKpp5B7k
 GpFRHXNkNVwBQbL05oHPljn1GNM8INyjkr3+9sUOVb2VNB5KunDJD8IwZ4VAr0elRTg3SloD80
 vOngzgrlvYVerel1pCHUqFPYFS7+OsGaHvm8RMuvX5xo5TcBw5PjEDVk31Y91QxDepii382a8o
 nVOUwP4rfRNqwB18Phy1oUoRQ2HEIOS2Dy346s84Bvm9rUTIH4lp0GNWCb41ooGCsDOlUHcs/3
 0MovJPigKpXtzCZ/IgQuhWug
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:45:28 -0800
IronPort-SDR: UqOjP1jkNooEjh6iHiUdk/yGRe50F6rk5Fc10KH8cXbR05tj0fyVv7yl0kelZznVLc65e40MKu
 FCk8AluN9GMnZKunbft8JHVMcF+tp46llE9UqvH9ZQQFVBIzyZAdfrZaBQ51k9uEuneQbGay7p
 0gra4yRuJHRqi15CWC03fDTNf0MzZSJLb6DbbUVMzdqX5EgT5x3fVCby1bQa72q+bJyFQgUYj9
 rkVMqIVs2fdxlI5Jks29qO56g5AeuMomNpCzLbwRkC5ilvVLUdSdAxTLzihSvH3E5Kz3Ik7UlM
 ZcI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:13:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg80w0DSfz1SVp5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744943; x=1645336944; bh=bUjz7eRFR1gjUHSOaj
 KMdYNuk2eQkeoW3rLA+XBUITQ=; b=p04WTLigIgv4vd01y8guGmtAFM3vmntMZB
 YiwnrXUD1k5pM2EKAe7K9LbOTZ+0BBgiV5JTSKopvqEVlyxpRE2SAwJt+xNkXDpR
 92RKvq1SeFXU+07JNScG9CTBovntABpnneZkb5Q8mLJUI9/fDEaKXz8MpF8OUWpA
 sI/D9+aaJbgXDmlizr4eroxv5P1Q/+vHyM45QhtsUJ04KdvBUfgbLEslzmJzok1u
 jzmuiZe7lAAswzq7MqcTCRTi/TAL9XEMuxAyrNtUL8rarQ9b2sajtGZipRZMk+Js
 VFm5/xgcznqfn5/3riM5gLycU213OPMTWlyfhg4Rhas5ykiyxQmw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id JbLaRui-FhEf for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:23 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg80r2Swhz1RvlN;
 Thu, 20 Jan 2022 22:02:19 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 53/61] target/riscv: Split out the vill from vtype
Date: Fri, 21 Jan 2022 15:58:22 +1000
Message-Id: <20220121055830.3164408-54-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

We need not specially process vtype when XLEN changes.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-16-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h           |  1 +
 target/riscv/cpu_helper.c    |  3 +--
 target/riscv/csr.c           | 13 ++++++++++++-
 target/riscv/machine.c       |  5 +++--
 target/riscv/vector_helper.c |  3 ++-
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 89621e1996..6c740b92c1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -125,6 +125,7 @@ struct CPURISCVState {
     target_ulong vl;
     target_ulong vstart;
     target_ulong vtype;
+    bool vill;
=20
     target_ulong pc;
     target_ulong load_res;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 502aee84ab..327a2c4f1d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -60,8 +60,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ul=
ong *pc,
         uint32_t maxsz =3D vlmax << sew;
         bool vl_eq_vlmax =3D (env->vstart =3D=3D 0) && (vlmax =3D=3D env=
->vl) &&
                            (maxsz >=3D 8);
-        flags =3D FIELD_DP32(flags, TB_FLAGS, VILL,
-                    FIELD_EX64(env->vtype, VTYPE, VILL));
+        flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
         flags =3D FIELD_DP32(flags, TB_FLAGS, SEW, sew);
         flags =3D FIELD_DP32(flags, TB_FLAGS, LMUL,
                     FIELD_EX64(env->vtype, VTYPE, VLMUL));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 292f7e1624..b11d92b51b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -283,7 +283,18 @@ static RISCVException write_fcsr(CPURISCVState *env,=
 int csrno,
 static RISCVException read_vtype(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    *val =3D env->vtype;
+    uint64_t vill;
+    switch (env->xl) {
+    case MXL_RV32:
+        vill =3D (uint32_t)env->vill << 31;
+        break;
+    case MXL_RV64:
+        vill =3D (uint64_t)env->vill << 63;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    *val =3D (target_ulong)vill | env->vtype;
     return RISCV_EXCP_NONE;
 }
=20
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index a4b7859c2a..740e11fcff 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -124,8 +124,8 @@ static bool vector_needed(void *opaque)
=20
 static const VMStateDescription vmstate_vector =3D {
     .name =3D "cpu/vector",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .needed =3D vector_needed,
     .fields =3D (VMStateField[]) {
             VMSTATE_UINT64_ARRAY(env.vreg, RISCVCPU, 32 * RV_VLEN_MAX / =
64),
@@ -134,6 +134,7 @@ static const VMStateDescription vmstate_vector =3D {
             VMSTATE_UINTTL(env.vl, RISCVCPU),
             VMSTATE_UINTTL(env.vstart, RISCVCPU),
             VMSTATE_UINTTL(env.vtype, RISCVCPU),
+            VMSTATE_BOOL(env.vill, RISCVCPU),
             VMSTATE_END_OF_LIST()
         }
 };
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ad505ec9b2..a9484c22ea 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -52,7 +52,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_=
ulong s1,
         || (ediv !=3D 0)
         || (reserved !=3D 0)) {
         /* only set vill bit. */
-        env->vtype =3D FIELD_DP64(0, VTYPE, VILL, 1);
+        env->vill =3D 1;
+        env->vtype =3D 0;
         env->vl =3D 0;
         env->vstart =3D 0;
         return 0;
--=20
2.31.1


