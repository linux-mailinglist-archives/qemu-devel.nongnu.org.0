Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4CF65F9FF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:15:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBd-0001B4-KK; Thu, 05 Jan 2023 22:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBZ-00019s-04
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:25 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBW-00088g-68
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974861; x=1704510861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wsjBjUVCcyMTDhCUrrw1dEh5qbRJ/rH1vPT2V9nLvwQ=;
 b=YO0XGSz/n0jh3FMGj/yFASXUHd/615YdqEriJs7pvHfxjmiddgQ1YvFg
 3PJ/5t+a1fmXX8/c/ZZX+iCZ18PEgDEPjydWE6oVpBuJl0zYVgRSdtejO
 wE8SnuIHRaMf6PrZpkpE6J8MzAK7nWhSiO0tjywEPFc/KImBtzJZsCIWZ
 BZaE1dl1BaPr7ZwjTHicITQ9tsQU8SeMDOHfdQisrcYL1I/xnJQOB3zfb
 tKT0HAhdCUUp/eorqgc2Zn72ME1VyL4zikoycRmfcRGWRR7TW8T1oUvFf
 XYxmT3Kmrl2OCxuCDMdN+d5Ud9MQtW9YW48kCh8ZKJsEMFtY+8LIIFUHg g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254757"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:19 +0800
IronPort-SDR: 0/4OuG5h2P1ywo/qXt3upnY7gcjh2cl3C0mChTQpoUUZQfHSHnuKh6eEA3pQ0v2wJ4/PClrbo0
 zdFUlW2sqM7NrhJNGTsFuTqh35qzENyvJQaYl9O5iQIdamA2Cado2V8Qpc389dagyUNv96LHZj
 PkUlrmPMf4jWqRPsBPrn6wiOahWG3uCfCv+geqlaWNKo52vamk8je9JBUAY8w7ZNaXCeE3I6bH
 KuKPu7K7kIdhHoYi0Qe2jxW8F7pecc8L+1fKgxPrhFtplwp75nQhVv9mFZC86CQt3ByIk5K9Vu
 0pg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:30 -0800
IronPort-SDR: T2xQOOEv7Pv5jkh32jw16+28QP3Ai8LEdYZ9NOWJhVJBfEijZHybYT+BnV8CxwvS3rYs0Yes9K
 mM2g3iYjMLxbFJe7996reYV1GIZo64equwSXDynd9Bh8zSbKCdlxjqQeRcF6nyvzTkey1dCNZv
 QsdDrpCdeTvNvXDhdx38a2WppvSYITN0bA7TGXvYOeOBBTe1lLX8yW5aimPCFsRxECzFhFSWE5
 4VC+2FCtoXIMw7rp5HY9AO6+bxiCdrBPkFT4JUSvRL9H5/EnToXZhj6jVif+UFyMPUK3TYk1Ep
 eOc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:20 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jR1HLrz1RvTr
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:19 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974858; x=1675566859; bh=wsjBjUVCcyMTDhCUrr
 w1dEh5qbRJ/rH1vPT2V9nLvwQ=; b=QyxmJ2emtv+Ub12iCOPemKhQ8dgxEgtV8Q
 JTZl2V3trbKPyeHjZ/aoceFAwLiAf1QRiYKtVgqE24s68A3KONNIt8MC55gwUr8M
 SIlljSs+59mE/pPcWn+yEsNybCz89iceMfYmxQ2rfcZFK1afNuI/5j1zZHep2FBT
 sutMitEpwJPlM0nkYQvL3YPknWIYXRSQ9I+jrnEXrvdg/cSpnmNc4iUa+xVZHpuJ
 IU807rwIB4vufMvuvd0skCNbg0oET8zeVBzc1kxh9HJOF/GBV7C/T3GZnBfTNGyx
 9szhG9mRTtC3EXB8o7h65q2Uf9b9AuASPNzmRzy2E4YJZwaLvGAA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id VR1aKnDDctAm for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:18 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jP0Bwvz1RvTp;
 Thu,  5 Jan 2023 19:14:16 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Mayuresh Chitale <mchitale@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 08/43] target/riscv: smstateen check for h/s/envcfg
Date: Fri,  6 Jan 2023 13:13:22 +1000
Message-Id: <20230106031357.777790-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
2.39.0


