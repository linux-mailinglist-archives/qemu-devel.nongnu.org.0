Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F7C488206
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:10:33 +0100 (CET)
Received: from localhost ([::1]:57310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65s0-0008P8-Ou
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:10:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eu-00014w-Rv
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:01 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:35717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64es-0006uu-D7
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621174; x=1673157174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3bLyjbtkDgEDdcg6BFwBq8+coTOjkNJ9q/mdK9HbJWg=;
 b=qTRT2GwG1RQ8w0D7/d9k+/E9vzxBrDdoNcaeCR9V0+p/GyrKbhlWw9Sy
 41GEI08Fqiq0yZxUu6JmwV3k3pmtki7iq/xwog2C/9aLD2KSQGo3r3fTt
 ynFlai1J5nsxyFO2/JAdpZMrVYvtC6uyfKh1e6AqNck7HJySXZj0ebUTo
 kgePb7u+Jy23dMPWNamoKgMnG8rgsqajTem2KdMlc6OBS9zfFFLSCN1Ww
 E750hsz9+JUvoUxbsgaM54MvCxFnC0JvmS5/8xqmpTWBxuFOKZJFaK3Ho
 3e2KnDd2jf+MN76Yr/0Em1kEqAZ04kXkcp/EdvGt9cEkxAXYLHGtMhg5j g==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="188952292"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:51 +0800
IronPort-SDR: iKvuNy1bDxMPwHnmOIYKtpvs00b18eqyW2RyYtmdshqM7uRgIbi9eg2gFq1Q34t+GHrcs2t8b0
 qm7VjytT8o070sruPvSvIUIx4Q5eSlSzScvxnWbupjeRhYYp+CyyekIlNoq4gvnXLVBn8tM64K
 +98uqeqMdtJnVNI8SBKNPUB2pTcZd+dvAYoCng5aVjtooDaQS7QS1vuEKPCTo/81n5SzVha9Te
 Mjohvcpp5M3g+l545KIQy/hmvEsMygy+nCj0ZUPNIdJ2gpayfFGRPSFSXoawUM7D7hZQlYUMri
 ORBa0hbAcShXwh33hzyroVID
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:17 -0800
IronPort-SDR: e+amGKNGCfRipHP+/d6qKAtpIcTLm88alsqu1gsjdLx1TyauwGOt/Il+EsImF/rIOJIVpp8/29
 pHfTd0j9tpaTNGOuBeTJsKZK9Lk6qu0ezxQ5vLbg+j+gXiGrZ5/vaJKWBo3bbOIf0bFw3I7/hH
 g0BnZvO8EwIHXKh+1Yfi1lBCmEPOflfZETD80lhk4U0m03+LrwssQIgWZT8AQC2WeEDDjnq54p
 /3Oc1/QG1eoVTUzcrRhsazx7+fdzj1SGz663+DMHWFVNUYWeotYJ/UgkAITUcCs9Ev9UGirmsA
 FuY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:52 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Pv12Tpz1VSkY
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621170; x=1644213171; bh=3bLyjbt
 kDgEDdcg6BFwBq8+coTOjkNJ9q/mdK9HbJWg=; b=RQ33nHuq/kx7mGZ7h6MWvEo
 8qFif3bKwCtJIByENH7JvoSsMZDcg/VuB6ZZYlwClbkMGNOw+Bvtromo3cinP1DQ
 qBj1sTjiKoY/cjkXJIoO/L5C7CScGDWk+qCEemuph3KRMkUEPpsWVJKzYfLng9VQ
 f35akG6tmaaTvyK6o53zOj7dv5qbfvYO3AOqqvNOO41dpxUKqCVEx9mY0QcbcTqt
 E9mK+Ti6RhA5vkkhjzBUhZndPtYFRxq4cnR4QhcgBGm84PUfo0YPXDIdwRvBwz0r
 8phi7e+xp+3Lyhm710ppzvLm8mz19E2i3hHnZW3ah4pQ5/VHfF/tNfbDMGfY+Gg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BLsV7SB2tyjJ for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:50 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Pp2yXVz1VSkW;
 Fri,  7 Jan 2022 21:52:45 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 24/37] target/riscv: moving some insns close to similar insns
Date: Sat,  8 Jan 2022 15:50:35 +1000
Message-Id: <20220108055048.3512645-25-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

lwu and ld are functionally close to the other loads, but were after the
stores in the source file.
Similarly, xor was away from or and and by two arithmetic functions, whil=
e
the immediate versions were nicely put together.
This patch moves the aforementioned loads after lhu, and xor above or,
where they more logically belong.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-9-frederic.petrot@univ-grenoble-alpes.f=
r
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 34 ++++++++++++-------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 51607b3d40..710f5e6a85 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -176,6 +176,18 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
     return gen_load(ctx, a, MO_TEUW);
 }
=20
+static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load(ctx, a, MO_TEUL);
+}
+
+static bool trans_ld(DisasContext *ctx, arg_ld *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load(ctx, a, MO_TEUQ);
+}
+
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
     TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
@@ -207,18 +219,6 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
     return gen_store(ctx, a, MO_TESL);
 }
=20
-static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
-{
-    REQUIRE_64BIT(ctx);
-    return gen_load(ctx, a, MO_TEUL);
-}
-
-static bool trans_ld(DisasContext *ctx, arg_ld *a)
-{
-    REQUIRE_64BIT(ctx);
-    return gen_load(ctx, a, MO_TEUQ);
-}
-
 static bool trans_sd(DisasContext *ctx, arg_sd *a)
 {
     REQUIRE_64BIT(ctx);
@@ -317,11 +317,6 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *=
a)
     return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
 }
=20
-static bool trans_xor(DisasContext *ctx, arg_xor *a)
-{
-    return gen_logic(ctx, a, tcg_gen_xor_tl);
-}
-
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
     return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
@@ -332,6 +327,11 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a)
     return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
 }
=20
+static bool trans_xor(DisasContext *ctx, arg_xor *a)
+{
+    return gen_logic(ctx, a, tcg_gen_xor_tl);
+}
+
 static bool trans_or(DisasContext *ctx, arg_or *a)
 {
     return gen_logic(ctx, a, tcg_gen_or_tl);
--=20
2.31.1


