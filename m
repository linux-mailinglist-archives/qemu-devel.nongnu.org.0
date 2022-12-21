Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F7565392C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:57:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87lo-0007PJ-Rs; Wed, 21 Dec 2022 17:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lm-0007Oz-BN
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lj-0000Xf-Lt
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662459; x=1703198459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xbWWfWawTbSX2KmhEqxJ2DZscLJ5uVr1ICmRd7oSxqk=;
 b=UOtlAU64usRCe0m0YaKAg9KkkQ/66wriUKQwDdTbPeWTNYCI8ciGKzIN
 6WDeAA+nsI7F2HSoTYH9sbKjzR+kllDMCU2SmVClO0sBJmmRRiKEsw4K9
 woGKcST+Y7qaOJhkEyUdVvdlJnxae3kvkw+X2fBocVw30Tl7/AcUMGn6f
 ad5sL8lD8mDUths4KxXs1RjXs7zrzdoU9qoqowVWFm0A5mjKAd7UlPqw2
 AZlO4OHLYQAWTTdt7EZBibUqGtveicWwT58vMpMO8FEZobbDh+7OQmwu8
 uB1A0Ick/tMV5Vb/R9pWS8Xq/ummzD5srNq2hd4o5fjh4+nSKTXzhbGTx Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561309"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:51 +0800
IronPort-SDR: uJgY6oAPd0APFOj615EAJKpkTkMQ4vDTy66tvLoR7ktf1syvjdrXhiEXe3YNzl+inSKgMJobQW
 5yyg3criai43V20Jn57q7XUMXdJB7pjKcijZjPeON9OMTOsRvZ8OElKSpUnQwHbLgSZIyC2WZN
 SDn0ordfnD6vDQvgAi/BJ0yZwGCWQuu7GTjibwmFgkJmiPSz64lb8ATE0SV9qoAc3CvIeHi4Dg
 l6XWqrOOK2TvV2Oo9Ew2Mu0sHyNy0cZQOMiV2/wLz9akU3hX9NpSc3YhjeK93U99lT/MukKXPc
 HJA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:20 -0800
IronPort-SDR: pXY1PxeIspHeyjPx8JkAHWIQ+On9QiFn7SkhxLW08YQDDETY3Wwdh+ILmNvBNRZgfDy4AUU0V7
 HsYMRcVgC/5NwI+WGuoTw1y7sH65TMq3VL8AZAVA8pRuH0IbBXpqdWIU/yJXZczBEkhfAfUL6t
 mxFbZmZ43IDCzCHXYv13tF8dnotm9Mt1UtFp0gl9gw61jVc38JjwDQA+40OzBaNJUtDYK8sXTu
 mgE+CkDUxfjC8I0HJPXMsqoU3hm1lVldIMEiwmMhCn+cRrrejBQjy+z2qH4dzvSVQMn8RQnKXg
 IEM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:51 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLq1fMYz1RwtC
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662450; x=1674254451; bh=xbWWfWawTbSX2KmhEq
 xJ2DZscLJ5uVr1ICmRd7oSxqk=; b=m3IdNiuFIb9IMPMXqyKlmzS7Fe8iYgo4QN
 x2j70wLfwxp78oYvnqso3XYSQ6BIaNH/mvQMozai+zqprRLtpV9F1sdd0nEg1vIg
 I/C0mm1dwocWoboN0JfnhqqGhuW4zspFC/8VSbo1gdPjfcnijGXC4Gi1rwaSru9k
 luOGzqmzGF8k/rMiD41mjCpTFWRnu0uzFeOPlwjSb63rm+vJHuNVwZbSM9yVacaF
 pwAv6RHZYOts9IWa+NQeAl7ruwsXVgbud6cqIcBo8fxOHW7/zKTPafexYHyiHA6v
 qyni1/5OeGmZ2X0DcHO1b/NhalB48DGqqGZ5+Eepl4bChYhukr8A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qtySPlCeGllo for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:50 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLm5K6Gz1RvTp;
 Wed, 21 Dec 2022 14:40:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Mayuresh Chitale <mchitale@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 10/45] target/riscv: smstateen check for h/s/envcfg
Date: Thu, 22 Dec 2022 08:39:47 +1000
Message-Id: <20221221224022.425831-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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


