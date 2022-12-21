Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554D665390D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:52:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87md-0000Au-G9; Wed, 21 Dec 2022 17:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mZ-0008PJ-4j
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:51 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mX-0000bQ-Av
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662509; x=1703198509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FIMAReO8fXe+YRY+QgOavq1HmVvfN04k2FyBaT0sflE=;
 b=OPIkz+am5ri61gG/ssVDyFw93d2587379vxR3x+5eFMFT5bNY2+2/iL7
 QVerYTKB+XXsmqyeOvslccDR7CCGYubXMAedq15DDMiLTYI7Rm0XBn1et
 sPv3SsoD/8TgMDvxcEJxHy1IaJlgNlqHEAKcJ4j0ffJQbhKYNb3NgN+9H
 kcYlFpupmr/XdXegValH6OJAkwbmStqtGkJSoqFSOPVs3cjOPnELk5Uf8
 l9AE8w7I/1UbTvqlYsmz7joKwRtCZbeGCRK1ousNuqbZ503xuhLhPAv16
 RC+7OC2mOifbhyVxxh3o6f8nrKk/hns2UDFziF4+d/C45bsn1wR+Wgpn/ Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561364"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:12 +0800
IronPort-SDR: eeYZYTvJ+aOwNr60hoyza43Vox2VbHn6/fYpZjPBLRu9p+Wx3OQJyiK2Vz6jlrYqrrPDFDIrPd
 o3IZrsW0kWKWzZMJdEv5x0BUsBkiASffdnqbtkaml/YDUn7jWELCVEuYItXu0c62fQ95i3hbAd
 rnDvbMt4XNB5BE5aC1E5MXjkJOFHYecIKV4Ul1ZK+Vqlts9ENtLn4Y13j3LOIt4J+rx4JzSBB/
 vU8LnYtTYArhxPLduPIxwRYLd6A8+nXfAxM9vqAzkpsbjfVUtQXarEytWt1Q7Xdr8OZEQW2tH4
 shw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:41 -0800
IronPort-SDR: 2hW8stgPIqcPMrACihyR1T+saxg3UPT6U+hoY+R1yzmJ3h7RQUf2iKphow/htiGTQDSsGEtq6g
 0d0eBZYcF+KIJWUXqxKMXhyMmW0ze6FOmnTBiCzq7kJ1ZiKOVn7QUu+fU7L9xK+cL455YTpgyH
 w9FWX0tEA7LfAHpgHLTlFZhxK20evJ2+TUuho7dEHvRgzAz2EcoOQ4Nm0W9MfVtpvc4H38BqOg
 lyYLEBMakq4BzHarpKvONYMWLs07auzI9yz5hkZItOhbw07mCymmuWNFop++DZ4U53ApSaJQE3
 7fI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMD4Z02z1RvTr
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662472; x=1674254473; bh=FIMAReO8fXe+YRY+Qg
 Oavq1HmVvfN04k2FyBaT0sflE=; b=padYCk69N9rbo8sDmHkqqom0peDq9MtmHE
 iKdz+X93pCHBJzIc0phy8iz/VU8HEH996wWZpmN1lZgGG0CrT5Sbk4WfKD2Kc5vg
 nOIS+W8QIGnXb3q8HClvuvjkcVs9BG4if/8nqjQQ6Qrxjk7IMraIthlVTYmOLkid
 qvwaPAWtZMax4qmPFaS8+Mz8ewEHk1XGfntaZ7jRSeHniNDrjc5IL+SycuQdmHw6
 w7nnxEG8VprGhEqRkCIWxu2xtdmubYiX6Dw8ampRiUnJFWET/YZKGwrN9vIWeU0v
 BEZB0XplcEVDeL/Nc0zpFFyXjALA3cadW5x374ra+WXhlTJU+mrQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id a4_tZulatHo3 for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:12 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMB6Zrfz1Rwt8;
 Wed, 21 Dec 2022 14:41:10 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 21/45] hw/misc: pfsoc: add fabric clocks to ioscb
Date: Thu, 22 Dec 2022 08:39:58 +1000
Message-Id: <20221221224022.425831-22-alistair.francis@opensource.wdc.com>
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

From: Conor Dooley <conor.dooley@microchip.com>

On PolarFire SoC, some peripherals (eg the PCI root port) are clocked by
"Clock Conditioning Circuitry" in the FPGA. The specific clock depends
on the FPGA bitstream & can be locked to one particular {D,P}LL - in the
Icicle Kit Reference Design v2022.09 or later this is/will be the case.

Linux v6.1+ will have a driver for this peripheral and devicetrees that
previously relied on "fixed-frequency" clock nodes have been switched
over to clock-controller nodes. The IOSCB region is represented in QEMU,
but the specific region of it that the CCCs occupy has not so v6.1-rcN
kernels fail to boot in QEMU.

Add the regions as unimplemented so that the status-quo in terms of boot
is maintained.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Message-Id: <20221117225518.4102575-2-conor@kernel.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/misc/mchp_pfsoc_ioscb.h | 1 +
 hw/misc/mchp_pfsoc_ioscb.c         | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pf=
soc_ioscb.h
index 9235523e33..687b213742 100644
--- a/include/hw/misc/mchp_pfsoc_ioscb.h
+++ b/include/hw/misc/mchp_pfsoc_ioscb.h
@@ -30,6 +30,7 @@ typedef struct MchpPfSoCIoscbState {
     MemoryRegion lane23;
     MemoryRegion ctrl;
     MemoryRegion cfg;
+    MemoryRegion ccc;
     MemoryRegion pll_mss;
     MemoryRegion cfm_mss;
     MemoryRegion pll_ddr;
diff --git a/hw/misc/mchp_pfsoc_ioscb.c b/hw/misc/mchp_pfsoc_ioscb.c
index f4fd55a0e5..f976e42f72 100644
--- a/hw/misc/mchp_pfsoc_ioscb.c
+++ b/hw/misc/mchp_pfsoc_ioscb.c
@@ -33,6 +33,7 @@
  */
 #define IOSCB_WHOLE_REG_SIZE        0x10000000
 #define IOSCB_SUBMOD_REG_SIZE       0x1000
+#define IOSCB_CCC_REG_SIZE          0x2000000
=20
 /*
  * There are many sub-modules in the IOSCB module.
@@ -45,6 +46,7 @@
 #define IOSCB_LANE23_BASE           0x06510000
 #define IOSCB_CTRL_BASE             0x07020000
 #define IOSCB_CFG_BASE              0x07080000
+#define IOSCB_CCC_BASE              0x08000000
 #define IOSCB_PLL_MSS_BASE          0x0E001000
 #define IOSCB_CFM_MSS_BASE          0x0E002000
 #define IOSCB_PLL_DDR_BASE          0x0E010000
@@ -168,6 +170,10 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *de=
v, Error **errp)
                           "mchp.pfsoc.ioscb.cfg", IOSCB_SUBMOD_REG_SIZE)=
;
     memory_region_add_subregion(&s->container, IOSCB_CFG_BASE, &s->cfg);
=20
+    memory_region_init_io(&s->ccc, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
+                          "mchp.pfsoc.ioscb.ccc", IOSCB_CCC_REG_SIZE);
+    memory_region_add_subregion(&s->container, IOSCB_CCC_BASE, &s->ccc);
+
     memory_region_init_io(&s->pll_mss, OBJECT(s), &mchp_pfsoc_pll_ops, s=
,
                           "mchp.pfsoc.ioscb.pll_mss", IOSCB_SUBMOD_REG_S=
IZE);
     memory_region_add_subregion(&s->container, IOSCB_PLL_MSS_BASE, &s->p=
ll_mss);
--=20
2.38.1


