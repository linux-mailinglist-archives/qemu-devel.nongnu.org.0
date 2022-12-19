Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE6C650660
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:27:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75it-0008HH-BQ; Sun, 18 Dec 2022 21:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75in-0008H4-ML
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:41 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75il-00015X-QP
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416259; x=1702952259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xbWWfWawTbSX2KmhEqxJ2DZscLJ5uVr1ICmRd7oSxqk=;
 b=oyOGI7FB/MXf0JWsnoUI9zEap7Vb5KYaDoqORpjbgwGLkXQA1DMuTDjY
 aMA7qqn/ns2f5swQsC1RcAct9e7vI3a8x8NgUbn7eb55o2iXvEZOGJuRg
 ur/vbEh18z4wm4LsTmzwM8DwRU9faLa9DzrK5T0CKf3vtqFHlZZA6ksH0
 jA+nXYn4vlIs3t/AlhWJYBIetMn3nnnlszMLPjM393Gywcp6rrgWmtCrg
 8Uvmw4JWC16qUssk8OEtKiydY6CK2L7RLUawczmWel/xdV/jtBPyMBq4G
 UONvUP1eAg93U9Jg3NQndxc6iegl5SZkvh0xkC907P9EnJD5H7Z3WJPzM Q==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199309"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:38 +0800
IronPort-SDR: VSvw72N2qtao1kaKi1j1/+N7tMP5jR8qXH7gVJuNeCdfW5n1gcUxixY7/eyWf7Lm4CA2pTgsj4
 AoEbJNOomvfcjSk/lbSHRcHeDcVCcJsO0SSZdvGKHI8skZQd/DxjIKdLKWHpjcwqRJsvZoaSly
 Cps58xdZN+k0R7QOEye9C+fQSXDcJSLepkhD0j+bgvN7gFsJn5nU8WqasQFToVfHharANSf5/4
 zbNRktbKzywlXJ5MEQUJzOQi3Q+MwAv8cu8kFc3sv4uwtnJ+oQjRVF97t6miNc9Q/LHi/iRtus
 j9U=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:11 -0800
IronPort-SDR: i5lqXMNCKnmpgM0EFlmHKDvncif5KpBaDGQAk5syAnFxyRwMFH3qDRolh2/+K4PV8ZNWOVhWt4
 VwtRy4GkLOJwdS7YMV6BrGLBat0onSO94Cl4a1ytYZOAhZjBD1C/09/jmZy/8jl8CkCA8+8zpZ
 3kakut+78BOe6k48mn0MYO+FyJyqikZM+F2iZdU9eRjgl6Gy/ZEkVwi3Onaxd60FlsVMR2XvLE
 NCUa49eHrK59qJHHsJDrjQcquSxdY0pIzEyGSasFyj6+h5wxKJx72sdUmNUSWoF3RhPGqW3mJ9
 toU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:38 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3JL36dKz1Rwrq
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:38 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416257; x=1674008258; bh=xbWWfWawTbSX2KmhEq
 xJ2DZscLJ5uVr1ICmRd7oSxqk=; b=Zr0liNoT0JuGUmxuFbSaJYXnfJyfObu5or
 Zeok4shAb46V5KNpuA8E8kTc33QGWIYfz5wHQrAUFj/OMeLgCNfhsNG8MMu24KCY
 OxXPWcTCKRlpShwQRCKRsgpj4ZN4SlCGl6v3WFNn9yJPB0uvzsCbCiUaobAtNovc
 tttfdkwtGs2+1rUgXbLstuh9HlwX+HH2VicyFOwhHW/SdHZCwnMX8FQV/9dZawNz
 3F5N/CLhKaCw8b71WmZ6UWbzY9k/P7vZ/Wl0I5ZZIoEMlqgl5HZn3oVPMncTSroM
 ZidgnW1OXIVnOe2bSzS91FXoiuksen629lS3rO4Gdhs+OXvMgU1Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id klR_TjocLbw7 for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:37 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3JH4kgFz1RvTp;
 Sun, 18 Dec 2022 18:17:35 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Mayuresh Chitale <mchitale@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/45] target/riscv: smstateen check for h/s/envcfg
Date: Mon, 19 Dec 2022 12:16:28 +1000
Message-Id: <20221219021703.20473-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mayuresh Chitale <mchitale@ventanamicro.com>

Accesses to henvcfg, henvcfgh and senvcfg are allowed only if the corresp=
onding
bit in mstateen0/hstateen0 is enabled. Otherwise an illegal instruction t=
rap is
generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221016124726.102129-3-mchitale@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 87 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 80 insertions(+), 7 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c861424e85..71236f2b5d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -41,6 +41,42 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations=
 *ops)
 }
=20
 /* Predicates */
+#if !defined(CONFIG_USER_ONLY)
+static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
+                                       uint64_t bit)
+{
+    bool virt =3D riscv_cpu_virt_enabled(env);
+    CPUState *cs =3D env_cpu(env);
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+
+    if (env->priv =3D=3D PRV_M || !cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!(env->mstateen[index] & bit)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (virt) {
+        if (!(env->hstateen[index] & bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+
+        if (env->priv =3D=3D PRV_U && !(env->sstateen[index] & bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    if (env->priv =3D=3D PRV_U && riscv_has_ext(env, RVS)) {
+        if (!(env->sstateen[index] & bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+#endif
+
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1874,6 +1910,13 @@ static RISCVException write_menvcfgh(CPURISCVState=
 *env, int csrno,
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret !=3D RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val =3D env->senvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1882,15 +1925,27 @@ static RISCVException write_senvcfg(CPURISCVState=
 *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask =3D SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENV=
CFG_CBZE;
+    RISCVException ret;
=20
-    env->senvcfg =3D (env->senvcfg & ~mask) | (val & mask);
+    ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret !=3D RISCV_EXCP_NONE) {
+        return ret;
+    }
=20
+    env->senvcfg =3D (env->senvcfg & ~mask) | (val & mask);
     return RISCV_EXCP_NONE;
 }
=20
 static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret !=3D RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val =3D env->henvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1899,6 +1954,12 @@ static RISCVException write_henvcfg(CPURISCVState =
*env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask =3D HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENV=
CFG_CBZE;
+    RISCVException ret;
+
+    ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret !=3D RISCV_EXCP_NONE) {
+        return ret;
+    }
=20
     if (riscv_cpu_mxl(env) =3D=3D MXL_RV64) {
         mask |=3D HENVCFG_PBMTE | HENVCFG_STCE;
@@ -1912,6 +1973,13 @@ static RISCVException write_henvcfg(CPURISCVState =
*env, int csrno,
 static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret !=3D RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val =3D env->henvcfg >> 32;
     return RISCV_EXCP_NONE;
 }
@@ -1921,9 +1989,14 @@ static RISCVException write_henvcfgh(CPURISCVState=
 *env, int csrno,
 {
     uint64_t mask =3D HENVCFG_PBMTE | HENVCFG_STCE;
     uint64_t valh =3D (uint64_t)val << 32;
+    RISCVException ret;
=20
-    env->henvcfg =3D (env->henvcfg & ~mask) | (valh & mask);
+    ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret !=3D RISCV_EXCP_NONE) {
+        return ret;
+    }
=20
+    env->henvcfg =3D (env->henvcfg & ~mask) | (valh & mask);
     return RISCV_EXCP_NONE;
 }
=20
@@ -1949,7 +2022,7 @@ static RISCVException write_mstateen(CPURISCVState =
*env, int csrno,
 static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask =3D SMSTATEEN_STATEEN;
+    uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
=20
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -1984,7 +2057,7 @@ static RISCVException write_mstateenh(CPURISCVState=
 *env, int csrno,
 static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask =3D SMSTATEEN_STATEEN;
+    uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
=20
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
@@ -2021,7 +2094,7 @@ static RISCVException write_hstateen(CPURISCVState =
*env, int csrno,
 static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask =3D SMSTATEEN_STATEEN;
+    uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
=20
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
@@ -2060,7 +2133,7 @@ static RISCVException write_hstateenh(CPURISCVState=
 *env, int csrno,
 static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
                                        target_ulong new_val)
 {
-    uint64_t wr_mask =3D SMSTATEEN_STATEEN;
+    uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
=20
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
@@ -2107,7 +2180,7 @@ static RISCVException write_sstateen(CPURISCVState =
*env, int csrno,
 static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask =3D SMSTATEEN_STATEEN;
+    uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
=20
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
--=20
2.38.1


