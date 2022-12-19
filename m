Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B1F65064B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:21:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75je-0000t3-9Y; Sun, 18 Dec 2022 21:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jb-0000fY-FO
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:31 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jV-00015X-96
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416305; x=1702952305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FIMAReO8fXe+YRY+QgOavq1HmVvfN04k2FyBaT0sflE=;
 b=c7g8fyJKp38i8o8t7GABCi/cD9NjTPfPVmgUVbYgm7YPk11DVPps7/fF
 21BUkid2sp4JOtlDXxWRLQZx/7dL/Pg8TTsBZY8yPthHIiprfRyQH66/O
 pk+ZbQ7EC0Qeknx5P87jZjh2xEr5ZGC10M1XOkUdpYfROEbdMk9DH0tmg
 fVS0qdPNsE4admC2vjcY8vo3Un6exs5Xkuud2R0w65ksZJXtLUdnoYZ+U
 68G0egE5tnQbh4VztZhj0G41b93mOvgcPd3w4+46W6SLU6IyBF0mJwfSp
 1WupRCaGLeWf0FZN1ctaym/O0NRPXqPo6epNmc+BrxX91kuZrJWboln3i g==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199355"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:03 +0800
IronPort-SDR: sIgUWzC3gkD3gaYOoK7HLC1BAZYvy+Oq0Nd5yycCP7J8E/55x2QmvXrhVQImASFd9wDyiELl5A
 oLPr902TTjp0qD/Rw4JOmk+pofA28kO1ftfrk6d+e95Eet+mMXJjYN3CdjdT6U5QGeVPkcnvA5
 8lDXWNWRCQtPce0JumIC06NrHFALDjbDV2HLMa8V6lL3F45cs7S34tRB94ljlue3UBn+GcKokh
 aSz9pSQ89sAnJhPSPtVqtdkhUErlmEZUrOLtbllo/4EX9lVM6nY7OdzfrrA3KXeSUOZWbyMl13
 Ytw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:36 -0800
IronPort-SDR: KDStNa1RuOHxlJEWpNHlcr3WNIH+Nmf1oxTDjHk6vAtFYsCTkSXoS9YGaJOhnYMZ9aRVoinbwl
 d22picJDwfiQ4hxqx+EUE4Xd207/LvhUWVyKMCpWt/OzzN3gbe/sPWyPciQND0DlOvU208qnEi
 joXcA/jtau9vwdv7/r/wI5W46+mn6YbAib4mk2HWzSnsVrOTrJSCepWAgejDrbo3oBeoSysXBS
 JkvDZMYhuNdw9HGxqlqSHf2A7ypxm2X7oxLVobvWb3lHbZHvlBkIQ/C5h6IO465GdLhp0b8I9E
 5ag=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:03 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Jq1Qh0z1RvLy
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416282; x=1674008283; bh=FIMAReO8fXe+YRY+Qg
 Oavq1HmVvfN04k2FyBaT0sflE=; b=DVbk5bfsDEIk8JyKcUhdQx4EJfVKlxpBK/
 2A4DDXOXIUtOe8D1kKmUNnkFxRPW+s2zInOzfGi7wnMrUh78gHLMyKFnROcRdTDe
 +hjimfbE+eA9DoMXyvFV20VncMMx5e5LABUs2rmsJNxHv19JbD5vL9Zb9XGX4rEj
 bLtQ0UWX6Fikbxrq4sLjaK1tXGfPPLM05nvilVKe4ofdi9yBe+ElE8E9w6lOucjs
 60czyHTK60C6C+02ku9OkRYlU7JcRkHoL/NPibUih7GBT/NMgCRfJysemtPYjfC7
 5gg+3IKqy8+uIPj3flCVcPVEa/2KhWYS2tOo/yueeE2ytvB7ychQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 989F7dvUaX6M for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:02 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Jn1RhRz1Rwrq;
 Sun, 18 Dec 2022 18:18:00 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/45] hw/misc: pfsoc: add fabric clocks to ioscb
Date: Mon, 19 Dec 2022 12:16:39 +1000
Message-Id: <20221219021703.20473-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
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


