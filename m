Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5960C0D1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 03:18:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on8U2-0003wV-RO; Mon, 24 Oct 2022 21:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1on8U0-0003wH-Kg
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:11:56 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1on8Tx-0001Ai-HK
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1666660313; x=1698196313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vt19p99Al03qFGOL4os6AYGva6CgF2vqTmfV4DW4iy8=;
 b=PbGC1tY2rvjLH1GhG4QU9CROekVh9Bs0efDcrquGu3++Ztd8aDzq7o45
 Hms+WBDkaGYwmeSMZYehRhk0y0DFYQKFmmnRgERlL+D+2PW6GH4mmDPNR
 p46ZSwyGoWRfWMApY/OU1JMrb+5iawa2obmbtADz1+xAmz5URyUugmXWh
 5tdGAnE65Jfxbn/9BoWese7dnJYda2N8z1DKI5+OI3Gze6kxvjmw5pLA1
 EZjMQqZWu8yB/rttJ51U1TgcExYOBx7ItzbiIuj1usAsoUD2PSc2+3lNg
 3NPOuGCvFMNoTUJK6YAo4vOnKho79MvBvrNGN5cssRKXS76Zsclm1qGzh w==;
X-IronPort-AV: E=Sophos;i="5.95,210,1661788800"; d="scan'208";a="318966285"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2022 09:11:43 +0800
IronPort-SDR: qva5UChwiQrRZPd3cnIzqAS4g3euUSsP58I8IPPfMS5CcoHapV8Cf89OIR3UYc1R/RZVAW7vGI
 nbSxl6chdd/NUB43Z1G/sxEdnEjX6Jus4MigC3Pa5OCcNXPQgnX2dDt1tTMPMfoVEuUfsQTbVh
 IvihxJxCrAnfx9VNCAA9ayxIPWB4fdUn6LJQBIeRj5W2abMrMAM4EMAvr0KtGc38ox5KkUWQ2p
 mI1eP7NsdMue9Hq0WlVZLkz77+gkB9fJYE8bHqFhXlZl2N9C2NaBwV3WiAL+0MgQ2Xq/YgfB3w
 XlUm0wlmsdFMsCS2RwJ3cT28
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 17:31:07 -0700
IronPort-SDR: JaBKE4zlf7G5fwPkur3RJPhinqF7rN+yht3oUFC391PQY8xW1/ZyBPb+0j+E0cH4FlYR1E6aka
 lZ23ymZRFVuQtf0FqzSNotSEl8LXUX0PSFWjCu90h87T/suWBIKWMrx8T41BCQW/9QcdppsF9a
 3sEMRH7iWsaYDtbbQ50tnGfHuf2LbQTBvH9zvOShWSG9hcyHNUKD1XDXg2CtCPc22lnkc9Xbs4
 eSq4TYG9SorZBQmPJ2c5bcSTRty/fuWGWSDbU7ZMZ7krOlJiKKeftBtYtkiL2atYAdh4zlRD/y
 tR4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 18:11:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MxDRf72Mhz1Rwrq
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 18:11:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1666660302; x=1669252303; bh=Vt19p99Al03qFGOL4o
 s6AYGva6CgF2vqTmfV4DW4iy8=; b=OV1MUjzHYvIQTFhxuxzDR5gZgGne2Bh7NJ
 vHjt7TIvILJPwjD8VSBUn74DK3Xy+MX20KKg6zIt4sBwPpZeMsMpkS+hMeQO3MD8
 RdQYeHJL0gvOFPwtKNWoHT5H2kU5+2NMfvHMZZjPzA1TpLyrG6tUIuxokHJEYPP5
 19Pktg9NI6SAIGkYic0XlgU42RCLeN/hG65pMVILrdHpZZ9mYLlvZitvHjF91BLg
 R4njfbAQGFAKGA9O1jvJ7uBZUo2vamE+NOZrBpI6EsEZv/4JbdX83TCZk9lq5R9N
 lWjEPUwjkodzdM7EYJ5VVNlkLMVGQm7MOm+iVAlD5FMNTCI26kyA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id r_8jRIoq7m5Q for <qemu-devel@nongnu.org>;
 Mon, 24 Oct 2022 18:11:42 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.77])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MxDRZ71zJz1RvLy;
 Mon, 24 Oct 2022 18:11:38 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v0 1/2] hw/riscv/opentitan: bump opentitan
Date: Tue, 25 Oct 2022 11:10:41 +1000
Message-Id: <20221025011040.246503-2-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025011040.246503-1-wilfred.mallawa@opensource.wdc.com>
References: <20221025011040.246503-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch updates the OpenTitan model to match
the specified register layout as per [1]. Which is also the latest
commit of OpenTitan supported by TockOS.

Note: Pinmux and Padctrl has been merged into Pinmux [2][3], this patch r=
emoves
any references to Padctrl. Note: OpenTitan doc [2] has not yet specified
much detail regarding this, except for a note that states `TODO: this
section needs to be updated to reflect the pinmux/padctrl merger`

[1] https://github.com/lowRISC/opentitan/blob/d072ac505f82152678d6e04be95=
c72b728a347b8/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h
[2] https://docs.opentitan.org/hw/top_earlgrey/doc/design/
[3] https://docs.opentitan.org/hw/ip/pinmux/doc/#overview

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/riscv/opentitan.c         | 13 +++++--------
 include/hw/riscv/opentitan.h |  9 ++++-----
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index be7ff1eea0..373fed36b6 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -29,7 +29,7 @@
 #include "sysemu/sysemu.h"
=20
 static const MemMapEntry ibex_memmap[] =3D {
-    [IBEX_DEV_ROM] =3D            {  0x00008000,   0x8000 },
+    [IBEX_DEV_ROM] =3D            {  0x00008000,  0x8000 },
     [IBEX_DEV_RAM] =3D            {  0x10000000,  0x20000 },
     [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x100000 },
     [IBEX_DEV_UART] =3D           {  0x40000000,  0x1000  },
@@ -38,17 +38,17 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_I2C] =3D            {  0x40080000,  0x1000  },
     [IBEX_DEV_PATTGEN] =3D        {  0x400e0000,  0x1000  },
     [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
-    [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40110000,  0x1000  },
     [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x4000  },
     [IBEX_DEV_LC_CTRL] =3D        {  0x40140000,  0x1000  },
-    [IBEX_DEV_USBDEV] =3D         {  0x40150000,  0x1000  },
+    [IBEX_DEV_ALERT_HANDLER] =3D  {  0x40150000,  0x1000  },
     [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x1000  },
     [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x1000  },
+    [IBEX_DEV_USBDEV] =3D         {  0x40320000,  0x1000  },
     [IBEX_DEV_PWRMGR] =3D         {  0x40400000,  0x1000  },
     [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x1000  },
     [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x1000  },
     [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000  },
-    [IBEX_DEV_PADCTRL] =3D        {  0x40470000,  0x1000  },
+    [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40490000,  0x1000  },
     [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x1000  },
     [IBEX_DEV_AES] =3D            {  0x41100000,  0x1000  },
     [IBEX_DEV_HMAC] =3D           {  0x41110000,  0x1000  },
@@ -59,10 +59,9 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_ENTROPY] =3D        {  0x41160000,  0x1000  },
     [IBEX_DEV_EDNO] =3D           {  0x41170000,  0x1000  },
     [IBEX_DEV_EDN1] =3D           {  0x41180000,  0x1000  },
-    [IBEX_DEV_ALERT_HANDLER] =3D  {  0x411b0000,  0x1000  },
     [IBEX_DEV_NMI_GEN] =3D        {  0x411c0000,  0x1000  },
     [IBEX_DEV_PERI] =3D           {  0x411f0000,  0x10000 },
-    [IBEX_DEV_PLIC] =3D           {  0x48000000,  0x4005000  },
+    [IBEX_DEV_PLIC] =3D           {  0x48000000,  0x4005000 },
     [IBEX_DEV_FLASH_VIRTUAL] =3D  {  0x80000000,  0x80000 },
 };
=20
@@ -265,8 +264,6 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
         memmap[IBEX_DEV_CLKMGR].base, memmap[IBEX_DEV_CLKMGR].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
         memmap[IBEX_DEV_PINMUX].base, memmap[IBEX_DEV_PINMUX].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.padctrl",
-        memmap[IBEX_DEV_PADCTRL].base, memmap[IBEX_DEV_PADCTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.usbdev",
         memmap[IBEX_DEV_USBDEV].base, memmap[IBEX_DEV_USBDEV].size);
     create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 6665cd5794..1fc055cdff 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -81,7 +81,6 @@ enum {
     IBEX_DEV_RSTMGR,
     IBEX_DEV_CLKMGR,
     IBEX_DEV_PINMUX,
-    IBEX_DEV_PADCTRL,
     IBEX_DEV_USBDEV,
     IBEX_DEV_FLASH_CTRL,
     IBEX_DEV_PLIC,
@@ -109,10 +108,10 @@ enum {
     IBEX_UART0_RX_TIMEOUT_IRQ     =3D 7,
     IBEX_UART0_RX_PARITY_ERR_IRQ  =3D 8,
     IBEX_TIMER_TIMEREXPIRED0_0    =3D 127,
-    IBEX_SPI_HOST0_ERR_IRQ        =3D 151,
-    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 152,
-    IBEX_SPI_HOST1_ERR_IRQ        =3D 153,
-    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 154,
+    IBEX_SPI_HOST0_ERR_IRQ        =3D 134,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 135,
+    IBEX_SPI_HOST1_ERR_IRQ        =3D 136,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 137,
 };
=20
 #endif
--=20
2.37.3


