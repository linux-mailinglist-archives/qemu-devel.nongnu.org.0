Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECDB65391F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:55:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87nA-0001jG-BD; Wed, 21 Dec 2022 17:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87n7-0001cP-Ss
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:25 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87n6-0000bf-4w
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662543; x=1703198543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DKKYFsAWy3mQQVNV1VM5SmTNOYbIwJL0N/VaovONcxU=;
 b=cfzdIdJJSQRfmQRqUc3YWPiq5bWq7m7TMdp/JROML59c1w2IZGpvQwql
 O0Gx6xVzZifdtFKkmLhc/jxI4LwhXUvn4epm+jZ6vIRDZ27djXT1HdjjJ
 MqnRM27jvhty5hc9Kp69Ag5n80kGHfRzffTeP6uUZw2RnAbF+Htf5P7RE
 pegm7sC0VL0RJy5HiP4OpBpRkLv8ir1mBOQLg2FGaoQjYv5UQsrVno/NY
 0mxk6sig/awKVjveytIGq6DZSQaDsespsPqY1y2vcpN1ttLbs7aYjn2so
 cDUlGqKkC3ycv9WY+ZXMnPJswN1MPwHsxBooxUGCjSU+JayzfMEgM6x1z w==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561398"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:28 +0800
IronPort-SDR: DLPCd8fdgI2oqlnnys/DsHY8AtG9xe2cJ6ReaV2hD3wafcIm84zG7PdX4rhIVYffhVHglH7Dl3
 1MrbuaWl2JGW8Px5009kN9RfJu86o+pLnZy3uG8feUk4BMEiSLsd/FyYF34tojdPMhkdcpZqOX
 eyKXXEeX6oKSuJ2n2UiUGe5S6j4KFhhknrm43j7fILAOr9dUvD74UycUo+jg4R1GalZPLqtMGn
 bIg1FL4YfH+ZSwCqu3EYZxpxbG4C/UlVJrGHdaapT/n2Z71zjaS3S078rAIgy+dS2f+LuxIr7w
 FT4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:57 -0800
IronPort-SDR: RnkR/ckR3Elfedf5r20uQTtcWTbTZwzpp35ZrY/vXdm0j+1VaigogssemZvseR3Sjw1H2HpAuZ
 R+v3izPNZR4Lx9UKAS+pM4dLVm3uRdK3EtLoit5xXY0bDn8CCYCZgbgSIzF6OXt1f3zf2SN1zr
 IrPJEafO5ra7ywojld5aRtC81RfilFEF7t2A8jEnZX2bK1tNQGAPdAyEn71ZKvkBWFs7OaT0Tf
 GynGDLza6heccDFdpnCYa/W3L2UqXXLSb+WRxI/rpMH7fAbtwod1+AdB6NE18hjKJU/NtGURfW
 Hns=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMX2tVbz1RvTr
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662488; x=1674254489; bh=DKKYFsAWy3mQQVNV1V
 M5SmTNOYbIwJL0N/VaovONcxU=; b=b/Tf/g3Lqn3xWlHq+fmASOxbZeNuRLzZCl
 MJR6IZLDCnLNkPgbPCMmqNnO1L7478yWm+/f7NX4u8sR7NIRv7wcQ9W2FzrtBlO/
 evTmrXNQ8khB+0C3JzBsmq8UrAupoQzLsafQvCQI4KffaXOktcQiW7N+pO8fffbM
 YgeLsu+txzQD/eXnAGjHXtz0UT9RlEAoi+Xfi9PTx5A8WYh1pRd+Da9bJiESIfz5
 qsB3ESuRwIUcCIMGa+PsqRgEPWWHZydxy5yqsTdgI7tmkWla1+WSQ1RnhV0iAmnW
 rHbFf++e1ldAAHkA0Syr0YzJ3WkhEEpUeke1/HDbw2ZM38vVtGGA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id c1HJ7AJwVDjs for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:28 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMV2wxLz1RvTp;
 Wed, 21 Dec 2022 14:41:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 28/45] target/riscv: Clear mstatus.MPRV when leaving M-mode
 for priv spec 1.12+
Date: Thu, 22 Dec 2022 08:40:05 +1000
Message-Id: <20221221224022.425831-29-alistair.francis@opensource.wdc.com>
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


