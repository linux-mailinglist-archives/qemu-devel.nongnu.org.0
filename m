Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B97D43718A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 08:06:10 +0200 (CEST)
Received: from localhost ([::1]:34482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdngv-0001j7-3j
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 02:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdndI-0006Al-O7
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 02:02:24 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdndF-0001SM-O3
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 02:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634882541; x=1666418541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tIl49NFH4soxYku9mq71XJIPaUw0Rwo5rYYaBctrYPI=;
 b=OTPRfUY+1Dbs9b1MVLou2F2mwuhRmOpyjnqjMrPsdeTQd2jZ0qpsV9g2
 TR8ghj6pxrINPr42mFVf9NB+mkOgMt5zG0Gy/fG2xuk/4I4NvswJBKmOA
 5Sf5sOpsQilp+mcFE7L/yo866ZNgfdNRQRl1ztMoAD2KCHn9RGdRAoglC
 d/BcmnHnFIO/pf80RlUy7YgY7M25GCkDWw24OxpOjLx4zPYdKZqEb/NIP
 wRegEkD+YwlXe6znLIlBh5aoUh4nTxDPHjJYk2cZeuvlcl0QIxmnsFmTc
 ov0D+zc/HY6N8Q1IGo1Hh1BSw3F/RJ9hu8JhAOtmvuJN6oTkkDliz4bUr Q==;
X-IronPort-AV: E=Sophos;i="5.87,171,1631548800"; d="scan'208";a="182601935"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 14:02:16 +0800
IronPort-SDR: O2O9Ht02qsHc294J6H0YZAyGePixNu29ZrCWQ+iFz18uBUIUyV4wqNqOgncfduw66EDR8w6v5y
 icGYEU7Ia2YjaOpGGW8RuGPJK5nrF5jkYYtGry7YqScO9A3p9DOVVCuH+hDq5G727nU4U1S2Wp
 KQvCMsjuEtldn25v1sokqGwlJDPmzUISCdDuUcDL2RACFo4COqVbPfVFSaCkQlMGloL5VcjFmf
 uL93B8f62uYx053hxOkz0eyc/koR+RTCZyyJGO781ddAjRanFLan2w1mldLyu0L8GdNn7iBaEj
 EhjlgmW9oOu86Ttgf3oytMF1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 22:36:18 -0700
IronPort-SDR: 9ZtZY249hD7MFHTLLOycY9AwTBfrWHjXZZf/RjsMwGQ6U6B6vMRfOjDPOiCMybVIQ4h71Hu8qM
 JL8Qvb0gPItnFCIjWPGBY8o61Owq7/jtoAmh7nVGGHfwf9UbEss8Xij02dbndE5IbzVJYzhgSP
 3sclD6NjFmPpaf83mlPp7E7F52rRBGYsf2ScdU1AtJhGWaOhfwGVkXFDlx1NDHQnf8PLTI47Pc
 p6uwACkBvXxsO8TM0u8QFVH4kHgDRqohx6+DGqVhpCYafAGloiSCx6Beh981ocH7ndO6ufVw7w
 SqM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:02:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbDJl21fJz1RtVx
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 23:02:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634882534; x=1637474535; bh=tIl49NFH4soxYku9mq
 71XJIPaUw0Rwo5rYYaBctrYPI=; b=A3IomvUAwccmhBZ7oia1vUCGcmbNM1oj7F
 b/9ozHDw/hpGgm6OKYWRaKtKZCVGwJtzaIotN/x+7uxKbL6o3wuTjFIAws2+44mI
 SClSzmSAy89C9YjYTKDFiKjfmGkYmGkycUch7RC+uj0srYC17cGTyj0e+fmkSRr/
 SqUT/dCcsc/4b6AgeVdiPxz8l29CzvvAQEhF3lzcZW1ApGvkg2TD/16lvO28SA+m
 xifY31eGr62fFPkA5pXUUUSH5ZzxNuSvTHio96g5Hwdpm4kmaoMDk9lPxisGQXlg
 HyLiuw6/QE2zJ55BS/4ZbiPXIa6giOgHzR9OpyRDi0AVxHUP9oBA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iS_oxlLQ9hgM for <qemu-devel@nongnu.org>;
 Thu, 21 Oct 2021 23:02:14 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbDJc758jz1RtVl;
 Thu, 21 Oct 2021 23:02:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH v2 5/5] hw/riscv: virt: Use the PLIC config helper function
Date: Fri, 22 Oct 2021 16:01:33 +1000
Message-Id: <20211022060133.3045020-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
References: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2d3a8ec405..8715cfe659 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -748,24 +748,6 @@ static FWCfgState *create_fw_cfg(const MachineState =
*mc)
     return fw_cfg;
 }
=20
-/*
- * Return the per-socket PLIC hart topology configuration string
- * (caller must free with g_free())
- */
-static char *plic_hart_config_string(int hart_count)
-{
-    g_autofree const char **vals =3D g_new(const char *, hart_count + 1)=
;
-    int i;
-
-    for (i =3D 0; i < hart_count; i++) {
-        vals[i] =3D "MS";
-    }
-    vals[i] =3D NULL;
-
-    /* g_strjoinv() obliges us to cast away const here */
-    return g_strjoinv(",", (char **)vals);
-}
-
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap =3D virt_memmap;
@@ -840,7 +822,7 @@ static void virt_machine_init(MachineState *machine)
         }
=20
         /* Per-socket PLIC hart topology configuration string */
-        plic_hart_config =3D plic_hart_config_string(hart_count);
+        plic_hart_config =3D riscv_plic_hart_config_string(hart_count);
=20
         /* Per-socket PLIC */
         s->plic[i] =3D sifive_plic_create(
--=20
2.31.1


