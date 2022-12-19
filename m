Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35B965066A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:29:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jV-0000R2-Rt; Sun, 18 Dec 2022 21:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jT-0000MR-KN
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:23 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jR-000190-T0
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416301; x=1702952301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DKKYFsAWy3mQQVNV1VM5SmTNOYbIwJL0N/VaovONcxU=;
 b=FD+gs3BGTNNDS5kZM6PBpd+kDx8YYQXXCSnyJQbPA/HtvexhbXUOzYRZ
 SKGQKQOWXn1mbuHfNJmnpb7N5omUkMwxP4ta7jZOHFDLmM2SlwNf/rsjA
 0pX4ebrB3D69HbEjjalBTkksrhByXW5MA96S8TqPxJLyWYoDScu4/GVIl
 yp/oIU4/SXTTWCuoqaC+Dype+n26LZwOCvNcLzo131aDyVj95NYuVfPqE
 TUlcMs+gab2c1LU6feM4Cvl7g+Pd8cr1pC4AT0A4+6ugIEkYdCLA1rsSx
 KSq3IOsfNlctvNCnxpzAwweBrwFW03NieSt71x4OyIn9YUMFIpRiC6dNI Q==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056794"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:19 +0800
IronPort-SDR: jviNUASFz2HAF9K7yaIg1ajmh1QS8Wy+dZVyYFMlxnIV/EHRE9IfqMRlqhQkiaIzma5VueJhzD
 Auz3D3l0quc/eEqk6smDh6FVJJasi+rT8p6Vt1b4YEsEXjFKVIIq22cnW9PJONViM33fYZQmAv
 HBwQy5wRblUqzscZC+XMoBgu0YWhxybge3gEizALkgwAPFquCV45HZLr3r+a7cr8IAclwGe58O
 jLi7M64wa1AMyVg/hkNOYbFAHjMPQWZlCq8RUqYvcgIVCt9S5S/iLC9ip1Owy+OY9fi9elDRhw
 U1U=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:36:35 -0800
IronPort-SDR: OavyPQ/FkitX36T8zL5xD+P0yqinEEn9YQ3iU9Oap0r0Te6PfC3/R/b1CJ4WaRMVOfzzlLEbnf
 N4sJU5hVKJuXqJPFCdS9uSqqWZfEsCLNQdf+ODjFZiQrXSLlwcdHZigdQ0t6ADF/LVEaOqVze/
 gaqFpLnOGZnwZCwNImg94LNhq6YsmTkV3H+0eZL6SXNCcr1U2fKy2TspgKykgnE0T9g8seNENB
 lR1WAltjgu1kgEOYTuj++64/8+MsgczATSPIC0bQN575wimBW8BAJoJl5HVPFaGPJM6Cxepcmh
 PIA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3K70cVQz1Rwrq
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:19 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416298; x=1674008299; bh=DKKYFsAWy3mQQVNV1V
 M5SmTNOYbIwJL0N/VaovONcxU=; b=N5LuElXHgKiMdGpiKcYe5en4NN6iwT+7p5
 O7nCyrVSfPjGnLOIKBzu200WJorwHicuKCE/mtb7GVg1B6SyQdoButM5od6OP5mZ
 nKu6cBl0ewDm1LgqjmQuuX+4tNMToexLUgW2ftdlKlM0KVWYVAs9omCeikLZcbvf
 ur0+YBwanlVOUwsaWR3/pXo4wt4LVFXDViF3dbxaq0gobuGs+Bv8bv8oeUq0WRkJ
 4Lj3XLKlTT/twDTyCx+YmVerLz7Yw0T2+EzDMbjRVq3ll3x6499haTYtbEm/jrHz
 nReYIvz5BMQAMrNKLnO/X6Lfjiwb5M5VgNMBehF4nM1zRCkaRccQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2owNuqpFpkIa for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:18 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3K51Nx3z1RvLy;
 Sun, 18 Dec 2022 18:18:16 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 28/45] target/riscv: Clear mstatus.MPRV when leaving M-mode for
 priv spec 1.12+
Date: Mon, 19 Dec 2022 12:16:46 +1000
Message-Id: <20221219021703.20473-29-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Bin Meng <bmeng@tinylab.org>

Since priv spec v1.12, MRET and SRET now clear mstatus.MPRV when
leaving M-mode.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221207090037.281452-2-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index a047d38152..878bcb03b8 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -154,6 +154,9 @@ target_ulong helper_sret(CPURISCVState *env)
                         get_field(mstatus, MSTATUS_SPIE));
     mstatus =3D set_field(mstatus, MSTATUS_SPIE, 1);
     mstatus =3D set_field(mstatus, MSTATUS_SPP, PRV_U);
+    if (env->priv_ver >=3D PRIV_VERSION_1_12_0) {
+        mstatus =3D set_field(mstatus, MSTATUS_MPRV, 0);
+    }
     env->mstatus =3D mstatus;
=20
     if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
@@ -203,6 +206,9 @@ target_ulong helper_mret(CPURISCVState *env)
     mstatus =3D set_field(mstatus, MSTATUS_MPIE, 1);
     mstatus =3D set_field(mstatus, MSTATUS_MPP, PRV_U);
     mstatus =3D set_field(mstatus, MSTATUS_MPV, 0);
+    if ((env->priv_ver >=3D PRIV_VERSION_1_12_0) && (prev_priv !=3D PRV_=
M)) {
+        mstatus =3D set_field(mstatus, MSTATUS_MPRV, 0);
+    }
     env->mstatus =3D mstatus;
     riscv_cpu_set_mode(env, prev_priv);
=20
--=20
2.38.1


