Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12261495D07
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:46:14 +0100 (CET)
Received: from localhost ([::1]:54260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqUn-0004iY-6G
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:46:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAnAr-00065l-BK
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:13:25 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:54834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAnAo-0007Cg-NO
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642745601; x=1674281601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N+1aRLXT092oBNqxBx2BPdiTh6Kqw+t9KVDu5u2B7YY=;
 b=NceM3nJmuec2Xk5HKcDE5sWpT4pcP5HxpsixNU82Me3B6vxQpLWzmqOS
 PKH6Vo4T5I7FdAU9L9sH+FfXua/O2B9EKSkaIVQ7QRHVeZrlqe9lknre7
 glcoviCl5asi4rKbISkyWtdpBmDlYA3sJHtd/8bSiE5WDcFZTR5wSK309
 nKIJqOF+kOby2w6EkjHMiLMyu1hH5CPjA+rpN5LQu3Wpuzc36Q2jPFEer
 CPD63UeLHX7Tf1U67G9XXyTn3Mj9BlaHktsT1NDcnKfxMx9zz/ptFvsn1
 CsJCEuqot11Tdc7euJNTI/8cyOcgfF0GYXabXrXbiUaFOhUbbCRNS03YG A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="195814959"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:13:17 +0800
IronPort-SDR: W1AETn0sW0pG0tV7tJygJwXEBChPxqtA/8ufB9ugvQdv2I4Pks+N55OBkLORDABxCVaWhfBAuP
 Tg4bqrFNfMhi9w6g5NoAObPOpYgJKfzr6wGFwf/OpCy5L/wgwk4b2QL3zbvl6yDCm0hhXFaEiN
 Y4RVpNSghu3O0+W9jRRDEnbatPVXia4X3v0e/C8eL2Q8IlcXgEZFvA7bDMn6wdTf72PxtDXEWt
 d/8Q3vL+dZnYtc7u5FpQ9M4U/4qYAtC4/893DLo4bjn+7pJ+aEx7sc6iBkwv6HIuXlzol98m3l
 W4yLGjyqyTz6qUiuZWOi4gYg
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:45:29 -0800
IronPort-SDR: ZzY33hnisot8pxmBx/MAVVBY/G50fFCALXmrdmBYPQhPbRd9tqOUkp4OdJwE1GP15CVjh0tIXv
 uuCm02AC81wxn4cC4HkYD9quQST8WBkR2LTLuJaShRvMdckVgFbCuA2RdoNWNT/KDWnVatdTcM
 FYS6hoKGTit65K/H03VO+mrS+FlQkTz0wkEvdLWU7n9Iao6qqT+/laB2T0dS4oKS/IbA+dMfmH
 BWPb+LTsI+m3loZ72vMVHqoSGcwRcIZXeJevOVXOsF734ISIBX6m9Ky3xduKsS1VuOs1xK6oYa
 pdU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:13:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg80V6MGVz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:02 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744922; x=1645336923; bh=N+1aRLXT092oBNqxBx
 2BPdiTh6Kqw+t9KVDu5u2B7YY=; b=hakkfTkG/L3nWxAatKf9yyeGbmP74TsNSt
 5qPxe1J5SXrwWBnavzD2UqerbA945qWPxceZp2425O1bVXUKt7zbvUEXbvzWqImR
 EovyaqgZBOEuiUSGTAyFL+X8iWv5FaiPaY/esZzSYGqRGHhT2sXy2Nv7FZxOBi9I
 Zeb8c8YTXwLj845ryk9h2Og6zEHD+d8cx1bOsxV45HAJhSzbBhZXV1eUuJzSV7t0
 vMChWnB0rhpcqeLArnjjm3VnuwL9mFhxte45m3DzzaAc8cLcHRhKchnBdTMKvdOP
 gf8P8JPdO51wYRePKrcqGRkV8GNPFbUV8KOTE+ZfIYyd81mq6Knw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gIq4766SIUy7 for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:02 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg80R0gKCz1RvlN;
 Thu, 20 Jan 2022 22:01:58 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 48/61] target/riscv: Adjust csr write mask with XLEN
Date: Fri, 21 Jan 2022 15:58:17 +1000
Message-Id: <20220121055830.3164408-49-alistair.francis@opensource.wdc.com>
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

Write mask is representing the bits we care about.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-11-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c                |  3 ++-
 target/riscv/insn_trans/trans_rvi.c.inc | 12 ++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 67693cb42b..1a75ba11e6 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -50,7 +50,8 @@ target_ulong helper_csrr(CPURISCVState *env, int csr)
=20
 void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
 {
-    RISCVException ret =3D riscv_csrrw(env, csr, NULL, src, -1);
+    target_ulong mask =3D env->xl =3D=3D MXL_RV32 ? UINT32_MAX : (target=
_ulong)-1;
+    RISCVException ret =3D riscv_csrrw(env, csr, NULL, src, mask);
=20
     if (ret !=3D RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 04d3ea237f..631bc1f09e 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -924,7 +924,8 @@ static bool do_csrrw_i128(DisasContext *ctx, int rd, =
int rc,
=20
 static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
 {
-    if (get_xl(ctx) < MXL_RV128) {
+    RISCVMXL xl =3D get_xl(ctx);
+    if (xl < MXL_RV128) {
         TCGv src =3D get_gpr(ctx, a->rs1, EXT_NONE);
=20
         /*
@@ -935,7 +936,8 @@ static bool trans_csrrw(DisasContext *ctx, arg_csrrw =
*a)
             return do_csrw(ctx, a->csr, src);
         }
=20
-        TCGv mask =3D tcg_constant_tl(-1);
+        TCGv mask =3D tcg_constant_tl(xl =3D=3D MXL_RV32 ? UINT32_MAX :
+                                                     (target_ulong)-1);
         return do_csrrw(ctx, a->rd, a->csr, src, mask);
     } else {
         TCGv srcl =3D get_gpr(ctx, a->rs1, EXT_NONE);
@@ -1013,7 +1015,8 @@ static bool trans_csrrc(DisasContext *ctx, arg_csrr=
c *a)
=20
 static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
 {
-    if (get_xl(ctx) < MXL_RV128) {
+    RISCVMXL xl =3D get_xl(ctx);
+    if (xl < MXL_RV128) {
         TCGv src =3D tcg_constant_tl(a->rs1);
=20
         /*
@@ -1024,7 +1027,8 @@ static bool trans_csrrwi(DisasContext *ctx, arg_csr=
rwi *a)
             return do_csrw(ctx, a->csr, src);
         }
=20
-        TCGv mask =3D tcg_constant_tl(-1);
+        TCGv mask =3D tcg_constant_tl(xl =3D=3D MXL_RV32 ? UINT32_MAX :
+                                                     (target_ulong)-1);
         return do_csrrw(ctx, a->rd, a->csr, src, mask);
     } else {
         TCGv src =3D tcg_constant_tl(a->rs1);
--=20
2.31.1


