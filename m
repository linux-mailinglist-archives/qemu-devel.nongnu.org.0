Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83497495AFC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:39:49 +0100 (CET)
Received: from localhost ([::1]:42896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAoWR-000836-V1
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:39:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyg-0007B2-QU
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:51 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyW-0004AK-EG
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744840; x=1674280840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lO8ob1XoTb7PGEauculY+Ka22EkYgGZLbuFHUiMExkM=;
 b=QXa1gUdIgLiQdRzaUY+EFoBNWFiG3WMQjlg3jR3fMe97MUn5wO6AeRV8
 79B22e9OxWn7+B01WSjzWXejg+fnVQIJDZKEaPArCuOSU6qj9J2bkBpCx
 4mKFQ0scaBSNRA6a9Mxt/lYfUAnw87olOIl9lwxwGFzAIRdpAm6qtouOi
 +2OEHFok1fEGSlMg6ls/otpoaKRarltmXJX4SfjrzmhEDAKg2dUPB7Pu2
 zfiEX5pi67YFRBw4ogAmf2hLOa2MEkWoDJQWFGrPJvc9Zz1Rw0KaDeMdN
 pXWpqjW2QOwOogLDlj3U4y9bVZD9Lwl8nMM9iNxIiz0QAzlooa6aUsdge w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082951"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:34 +0800
IronPort-SDR: Z+befMP+gMN3VUQNSMMbEz7/s3fdJfnVSV1bMyzCcvoNflESnpUe52Vrg39gcFbLeaN263sta/
 ZAYy6FXw0dEx2fbsHcqIFaV6P7ycWTk6pNvd3Oh+wZQLNx5A7V9fEDSD3DN+Q4IshBjazH5E2p
 HWCc5r8t4xYUMhifNvsLVM4IA+Yg+4ts152tgqx88MI1tnvhk1oYoCqx6ScVdq/3LXEXJkLxP1
 ihw2nlj28863sb4dVmNXmfSY4+1APh6NnswtgFAeFHIcD/1t9BrYcc5LA1eol6R5/9FnDHzNMh
 vS9woq+1CPtYsTiCqem0PU6E
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:01 -0800
IronPort-SDR: g2b8QZ8JuxqD04QIITgcDSaQCLEbOaZWG4ouyzTpHugq2BEueTifj4uREj6I38h8PYopuCXPPc
 gIOnI2hyzcz+YgGyO5UvyOK7nP91fe6qaLhzjrMnPIkfPTaSKQRpiJY/inN4LJcKb7RPMiD8tG
 QBvgqQyHh7Tp6nEv90/tpmtnCPY6btkg7IhrzEwesgtiGPDJdAm18a/E2aeLmnbirQj0KF6Q0Q
 gOqD5ITopOcg9pikrzto86nfz5xoi67hy8y5FjLOm66iPZdLKcAdVqaNQolm2vjvDX9+0p9ASI
 F5M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:34 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7yp0GCSz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:34 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744833; x=1645336834; bh=lO8ob1XoTb7PGEaucu
 lY+Ka22EkYgGZLbuFHUiMExkM=; b=Exx0Feb5mxR89mRFjDQK+IGyiwos6ATh1c
 3gf1mFItLOuAicMorvXBJeDbiUYrU2v3pCjyIFMWfNF82SG/F3HelykkGucOnwEa
 9G2gNticm0bX3U6/me5PgHx2Qad6SlUE0cz4daOXXBeZKZ4DqRV/EkTnAxN7PcDt
 X8uxo5kSDdSvLKD+tPiPeKv0sFqoNMEOEcTItwyKE3oB1v5SFowxDAM7RKQfeiQW
 PVOs0gAkTb7ftli1+C09fPLyGZ3Yv4PygzKU/f33oEA59DiGM1waN3hoMv97Ckv1
 7sls7L8Abie2t5QSZEfZuwPDtoCJN2QJTd3EK/pm9RfxjnOCLswg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id H0VOB2NuLuey for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:33 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7yk6XGZz1RvlN;
 Thu, 20 Jan 2022 22:00:30 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 26/61] target/riscv: rvv-1.0: Add Zve64f support for widening
 type-convert insns
Date: Fri, 21 Jan 2022 15:57:55 +1000
Message-Id: <20220121055830.3164408-27-alistair.francis@opensource.wdc.com>
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

From: Frank Chang <frank.chang@sifive.com>

Vector widening conversion instructions are provided to and from all
supported integer EEWs for Zve64f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-9-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++++------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 08f25e3ce4..58f12366dd 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -77,6 +77,17 @@ static bool require_zve64f(DisasContext *s)
     return s->ext_zve64f ? s->sew <=3D MO_32 : true;
 }
=20
+static bool require_scale_zve64f(DisasContext *s)
+{
+    /* RVV + Zve64f =3D RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve64f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve64f ? s->sew <=3D MO_16 : true;
+}
+
 /* Destination vector register group cannot overlap source mask register=
. */
 static bool require_vm(int vm, int vd)
 {
@@ -2333,7 +2344,8 @@ static bool opfvv_widen_check(DisasContext *s, arg_=
rmrr *a)
            require_scale_rvf(s) &&
            (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
=20
 /* OPFVV with WIDEN */
@@ -2372,7 +2384,8 @@ static bool opfvf_widen_check(DisasContext *s, arg_=
rmrr *a)
            require_scale_rvf(s) &&
            (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_ds(s, a->rd, a->rs2, a->vm);
+           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
=20
 /* OPFVF with WIDEN */
@@ -2402,7 +2415,8 @@ static bool opfwv_widen_check(DisasContext *s, arg_=
rmrr *a)
            require_scale_rvf(s) &&
            (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
=20
 /* WIDEN OPFVV with WIDEN */
@@ -2441,7 +2455,8 @@ static bool opfwf_widen_check(DisasContext *s, arg_=
rmrr *a)
            require_scale_rvf(s) &&
            (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dd(s, a->rd, a->rs2, a->vm);
+           vext_check_dd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
=20
 /* WIDEN OPFVF with WIDEN */
@@ -2700,14 +2715,16 @@ static bool opfv_widen_check(DisasContext *s, arg=
_rmr *a)
 static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
=20
 static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew !=3D MO_8);
+           (s->sew !=3D MO_8) &&
+           require_scale_zve64f(s);
 }
=20
 #define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
@@ -2758,7 +2775,8 @@ static bool opfxv_widen_check(DisasContext *s, arg_=
rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV widening instructions ignore vs1 check */
-           vext_check_ds(s, a->rd, a->rs2, a->vm);
+           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
=20
 #define GEN_OPFXV_WIDEN_TRANS(NAME)                                \
--=20
2.31.1


