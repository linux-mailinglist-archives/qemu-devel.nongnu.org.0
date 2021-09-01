Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F883FD123
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:17:47 +0200 (CEST)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFor-0004e2-Og
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiB-0005FR-6z
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:47 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:10271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFi6-0007kS-Lw
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462242; x=1661998242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z8p9lUP52lSAzxzyeqBKXHuP01PsJixnSqSFhdByyPc=;
 b=cchBmm8kbQtnWuDrKvkte3vWqElWhozWOduFVg5wPA6pfslkFotdb7KM
 HbGtUfMGzh41ahM7r9dbVFTgJOgHhksvPeGioVmojcorqLC3qTd1T2jwJ
 0Nam8DbvZA+3x/qf5wjUSDx68vJpaxpiGGq70JfnaB04Sjuw7GizCLluY
 Tb4It8e3m8epUOTEBSpHG6suQfEo67fWh62wcgjDS+OK6n8kW+lp/JrDs
 I1DBMS9DyCzjAPsk4579KOOEMDvIxx0tFfg8D03+mxiao2qf17b3Yd48b
 ZdJu+JSIqmbXODXEq30swUleSIbX8J9lP15IhLstQv0etoSD6cxYkZv5m w==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178011642"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:10:40 +0800
IronPort-SDR: QSKX0YaXJVWfaOhqUS5RzQOzsSuNjPYtD3/6H3eZjHfz/k0vudiEXMeDhjxufl/aDnVu8p+WcV
 NTlVQqznvFliFX8ztTrgXCQlA5qsrup8f2J4OE3Xsxn2v8qXvTXGKLXP74mk9XlrfVPPMnRjCf
 zb9xg8stjT6xAa0VI4kKvdRziUeRRzhSxR0x996rJkoDZ2cvg/WISG+2yX7kRvBiQm9MgSB/wW
 L6lIv5yxIK3F3xNUOJb3Iax7dthSULXjPD/YnTCsPUWV4KRcBqxPsMwQfdhZJGaDJRAuftVDlL
 zKu6Lt0OYls1yxBJrUMbs1l5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:28 -0700
IronPort-SDR: /YDWVpj0ejyFp8giy0UqOqC6BD0LZwGvBYNirWKfcwVXejAufL1MCM1G01rZ6n5q6tEpYAat0W
 3e4FrhS+6+ulMcd+tfDgr1Xc/2n3lYl9B+ce3FxEi+Bylo090qjWGMnBgqQodC3nQ7XRlKD6Sv
 cAtMk+ZGC6T3XTipCeniQgnQ/rTv1e6PrUZ0KwUwP2/GKasfOjy1DcykXphljav08RfmgWL0Ea
 vFxo2oXMw8cHXrDcnibZhn2ISqzRZB/GCMStiHAKlz68E20qvHWGQ+4bZ9i/y78GixC1FEEwr0
 vb4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:10:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gznb40h1Bz1RvmD
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:10:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462239; x=1633054240; bh=Z8p9lUP52lSAzxzyeq
 BKXHuP01PsJixnSqSFhdByyPc=; b=TXQX5wOod+LdpVoQMboikAEg3uu++M8nwz
 MPiOnBQMij/Ouo21RVyItvlszWSqWv1bGj9FskAvVXiVfa3bGtGmFhKhSSdRZbQ6
 WYpx9p5qycjPrnGe+sL/9lgJ1y9jzFvBcBBDr09ipt+FJW0vAQsMAZEmK7sZO23O
 4DZY+eqma24abgHXM6m/vjrRCgdoWWvvDdT2ZNSI8+R7q9jSuOF1AktY+b+7B7lN
 mUKxKf0JHddwwuy5WZ185JgOK1beZddN5z47+LvPnCcFXAjbENjLFA+ALIDT32PX
 JkOGLdjpfJj30q2Q4A9M1779SFUEixtL0i/mY+xOH8DPB8Ja7J+w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id JpKAaAfEhtOz for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:10:39 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GznZy4ybBz1Rvl9;
 Tue, 31 Aug 2021 19:10:34 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/33] target/riscv: Add User CSRs read-only check
Date: Wed,  1 Sep 2021 12:09:30 +1000
Message-Id: <20210901020958.458454-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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
X-Mailman-Version: 2.1.23
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

For U-mode CSRs, read-only check is also needed.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210810014552.4884-1-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e747fbe0e9..6d7f2c2a95 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1422,11 +1422,11 @@ RISCVException riscv_csrrw(CPURISCVState *env, in=
t csrno,
     RISCVException ret;
     target_ulong old_value;
     RISCVCPU *cpu =3D env_archcpu(env);
+    int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
=20
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fail=
s */
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv =3D env->priv;
-    int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
=20
     if (riscv_has_ext(env, RVH) &&
         env->priv =3D=3D PRV_S &&
@@ -1439,11 +1439,13 @@ RISCVException riscv_csrrw(CPURISCVState *env, in=
t csrno,
         effective_priv++;
     }
=20
-    if ((write_mask && read_only) ||
-        (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) =
{
+    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
+    if (write_mask && read_only) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
=20
     /* ensure the CSR extension is enabled. */
     if (!cpu->cfg.ext_icsr) {
--=20
2.31.1


