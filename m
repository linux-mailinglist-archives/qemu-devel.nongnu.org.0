Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9E4495C68
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:58:04 +0100 (CET)
Received: from localhost ([::1]:48106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApkA-0002gX-Lg
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:58:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0X-0008Dz-P2
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:45 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0V-0004AK-V2
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744963; x=1674280963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vPZRUlXDPy4MVm9PsIiT6XmNqYiQ0yJDQrBKTD85GK8=;
 b=TX5REdAc9GaizzvAduqGcG5TlPwTshlumulbldxF9Dm6r9xlem92/IEq
 OPtJxXEUhwrW4814bT9AyOIYRd6fbvQ5XUJlH6SEijWF7wnMHoyqvT3sm
 aCWldmAp96DntY1z/vHsfkFgTa6wR3BJnG0BZ0csaq55CsjckfYoNR6Cm
 K1FY07AMaACTiF79zjdrY5gY0ZpsOHhNURjSopsl5VEsXzdwXnWEl9xoj
 zFNz9lT9yP+EQzC9XYMiSc7bblPGZYD3xVP7VV5hvoRz1jrblwecODK4w
 tWz/C1Rqr5IT/gLrCx7dazeIIsluK99d4VvRlsBxdvml/3F64T3r/ZBSH g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083042"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:25 +0800
IronPort-SDR: G+zAdJXLjID4LQCFBsWtphUNya1XxGTNaM/WJVO+usdQ6y6jmhpdPhEzmUeCcJ9jydNobI7MuP
 HeUgWd6uMFWknqjqvMuGgXHaahF8Yrxr2bzWiPWoEqNC/SAoH1Pl0VGnnXJt+ZN9IGetZiaju7
 otuPDg14XoknJtKxLGDGP7Fpjl9ae3NbtKIoZcgJ7QnHkmkdpnehT2I5V+AHXs3RzfNWYaFjTx
 iCiTH0qdjbsMJvlWbehQtpm0SMX1VpsEFHhid5eG0zopgZP7HfeGMcLpj/QXYoy8E9FkIfFEl5
 lqEadHppJ66yBP083xrywaB1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:52 -0800
IronPort-SDR: +vIjLupXONC952UclitxHdfLcHduhhScNEQei/DvCr3kL1fTB9D2Hw0DgAnU4+AemkcUWNPRyf
 r14r6Qk118NJNxY7xQJ5OLtZRtf4mJWAPZVbXTf9fC1xS34mb6cWECt5RB0MNOtKW31hDqIsm5
 NgKKnQpkI/4IFbu/H65y631gVrCXQfyfghxtw+rkvHvzC1bN2+gK4boJacAtD1K7J9w+l2JQV1
 tOPxJRFK6cY5ehtIWBeZOAHC6CCboGEBpxwgio5hWOkrEPAqKddTrc2RqQirCYSygbjRkYQwcq
 8Zo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7zn0xY2z1SHwl
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:25 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744884; x=1645336885; bh=vPZRUlXDPy4MVm9PsI
 iT6XmNqYiQ0yJDQrBKTD85GK8=; b=r0L5dHm4uCkBwo9DwN4dKtkSs3UWmzHTQS
 BCnJ+vg4PpBHPJOMlIGwG7x0l0UaIwLpMpKsGO9FjY55YmAZivK91Wo8iKyTvUhd
 NqMbNx/3npmotJvqMUmuFZ7Mtn0gd4nuLDN8FMG+NEAZp7MJ3dhWbra1tOh79R7/
 nOAlw2PHNJMx8qGo5/dPDAloiAtl0TumZbNuh1iKNyoahFDPbtyihk9JeWdkqpgB
 OzOpCd8ATB68TLrtCGdQs4Lh+28TUtF34tYW7fR4Owp4TrCw/LNQFsrCsV09YlNZ
 b/wL0NhSDBqmndWX4rrzrOb8OLh2EX1RA3tiuzMnJNumQfMxRPNw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id duw0Jzn7JUbY for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:24 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7zh6tBVz1RvlN;
 Thu, 20 Jan 2022 22:01:20 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 39/61] target/riscv: Adjust pmpcfg access with mxl
Date: Fri, 21 Jan 2022 15:58:08 +1000
Message-Id: <20220121055830.3164408-40-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-2-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 19 +++++++++++++++++++
 target/riscv/pmp.c | 12 ++++--------
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a9e7ac903b..6bc7ee780c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1497,9 +1497,23 @@ static RISCVException write_mseccfg(CPURISCVState =
*env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static bool check_pmp_reg_index(CPURISCVState *env, uint32_t reg_index)
+{
+    /* TODO: RV128 restriction check */
+    if ((reg_index & 1) && (riscv_cpu_mxl(env) =3D=3D MXL_RV64)) {
+        return false;
+    }
+    return true;
+}
+
 static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
+    uint32_t reg_index =3D csrno - CSR_PMPCFG0;
+
+    if (!check_pmp_reg_index(env, reg_index)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
     *val =3D pmpcfg_csr_read(env, csrno - CSR_PMPCFG0);
     return RISCV_EXCP_NONE;
 }
@@ -1507,6 +1521,11 @@ static RISCVException read_pmpcfg(CPURISCVState *e=
nv, int csrno,
 static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
+    uint32_t reg_index =3D csrno - CSR_PMPCFG0;
+
+    if (!check_pmp_reg_index(env, reg_index)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
     pmpcfg_csr_write(env, csrno - CSR_PMPCFG0, val);
     return RISCV_EXCP_NONE;
 }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 54abf42583..81b61bb65c 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -463,16 +463,11 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t =
reg_index,
 {
     int i;
     uint8_t cfg_val;
+    int pmpcfg_nums =3D 2 << riscv_cpu_mxl(env);
=20
     trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
=20
-    if ((reg_index & 1) && (sizeof(target_ulong) =3D=3D 8)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "ignoring pmpcfg write - incorrect address\n");
-        return;
-    }
-
-    for (i =3D 0; i < sizeof(target_ulong); i++) {
+    for (i =3D 0; i < pmpcfg_nums; i++) {
         cfg_val =3D (val >> 8 * i)  & 0xff;
         pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
     }
@@ -490,8 +485,9 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint=
32_t reg_index)
     int i;
     target_ulong cfg_val =3D 0;
     target_ulong val =3D 0;
+    int pmpcfg_nums =3D 2 << riscv_cpu_mxl(env);
=20
-    for (i =3D 0; i < sizeof(target_ulong); i++) {
+    for (i =3D 0; i < pmpcfg_nums; i++) {
         val =3D pmp_read_cfg(env, (reg_index * 4) + i);
         cfg_val |=3D (val << (i * 8));
     }
--=20
2.31.1


