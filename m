Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D655765FA15
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:22:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCb-0001lI-PK; Thu, 05 Jan 2023 22:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCK-0001Zq-9Y
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:14 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCH-00088g-38
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974908; x=1704510908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rnzCsfvf1xA25fYkQwc6MngbPhPAukF/7JijHpQBRIc=;
 b=epIk7cexWaGRD0sP6ssjtZzr3HS1pPIKlVTzfyqmNPFeivWs3X6lTjNt
 yywodjk2CGH24igEbefywt8lsoT7JcGlwljfYSQ3ADRY9V/OrLRFlqQi5
 3hizB5lc2+Wx4k7cUKNYzkhoNgDrsGdGfrJaoJwQTj+vckNreq0baFNvV
 ucrs6wukbQMlGeaWMkzVys2ZdoLLPyWvFMcsZjpJpJQg0ctYaPPVGaAA5
 0iVYJHGXoxz1baIxTH8NFzwVjRV9DGUDPdzMUCYtUVHI8ofDUXgeYxD5a
 0JNk6M9ad5ftNMolgUueF1CdRh40ngYP3cDu/tsLCgxD0Jtl14DhXmj1i w==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254792"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:37 +0800
IronPort-SDR: xps0w1rrTDYtRcFcghFLPC0OfK1IzU73ZWxcIHCO+Ln0HWYi4iAnbBCL9/qYu8dDG+vtdOXXNh
 hUorA5pD9vQMWaycDU7ZSoHma3ApW/SYXy3cr8s8QPxDdRJ+XnksHoHXkr/ykO0LSXqxU1RQNp
 C2FJXU0O4CjW466yKLfJdCWwtABWPB/56knK7I2v00zs70HAu9FA77tsort1F4bjrtk5DpmVUh
 H4dWUFBfOrXvsPYIksUCCctGuaxkXiJPWcSTRxvdAfJ1zMjs+FngSkMMcgGLvElxxnHgJiQ8nx
 LDs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:49 -0800
IronPort-SDR: rDBRHE0iibLey7s36ytvO1kkHxSxUN5aTCtEav1hARYYRtC6Yn6nlGFnBbw7of2Fu5wLKAvBrA
 Jt384oK2tQWnl+6V/zw2BTkQtR/lmYCD70XfNj86HdxGLM2+jmpIrbJpmU2Mbxmaot/ybvADNQ
 dvVKRJWCi4aqU2uYKtOfdsnBUFIUPDM9FkLlKJZb1BhfooTiIJ05zTtn+KlkX5lcM6n5nwHKPn
 VDoLabqlIsSqk8v3B8lyBkBVxYNVG2qjfwAzsuXffeJaAqD2ciOUMnt5mpT8KHG+gZEPlgCXo0
 GB4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jn6hnyz1RvLy
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974877; x=1675566878; bh=rnzCsfvf1xA25fYkQw
 c6MngbPhPAukF/7JijHpQBRIc=; b=Yy4OGJCyNVAivLkvwsE13+s+Ymj4PxbtZD
 tialdY2flItW4O2h7cn8RoUxwU7V/EYwjmrA5rH2Wj0cgOzl/d0NLLTdJZU4U5X5
 NgZQH/IXOcJ0wKqMyeBT05OQMoK81qub7KRFB3P9UZTCEDRUnsppQFGyPeCbXXxO
 0p0gPTe68jDcW1U/D1VnS+sOIvxBZU+vyGr9ba7QowFl3uc8tDGLkIhxNR4IQ03C
 3Q9Eq7h82K22MLsqLSgs3u+oOPqyab7VfBqwmSp6b4XREMVG8+7y/IekTzeYGZZj
 AfmSwj2Z/G7iu9bmGBdHGAVYBIn/kajNwD5tI160LSaSVotfqsAQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id O5JZ77ZfRAS0 for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:37 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jl6tJYz1Rwrq;
 Thu,  5 Jan 2023 19:14:35 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 19/43] hw/misc: pfsoc: add fabric clocks to ioscb
Date: Fri,  6 Jan 2023 13:13:33 +1000
Message-Id: <20230106031357.777790-20-alistair.francis@opensource.wdc.com>
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
2.39.0


