Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5642568D039
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7O-0006Po-K8; Tue, 07 Feb 2023 02:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI78-0006Oa-5K
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:02 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI75-0008RS-BI
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753799; x=1707289799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wETotYCh8Dar8zwu9wTkK33Kyt+p5n8PB5KWMCUOGVE=;
 b=UbLpoCugMoGwlTwD9WdnS/tWoOvYoEvl1KKRixQRcftF/Vlra8nB7fcn
 i3n0d8eaTFAuAgCIRQsan4LS2rssss+VqnXkEznEW5DeXc4dnAWXx8xGq
 rp3lXMxywgVcPJVjcc6GqivK8p3rV3ZO0pvGZjA5igrOP19Ixp10HY70C
 Eq6MT2rzstXxKaYsC7BUDLqoDQ2Yv7384CWpESiHnon0msBpiXklhCcX9
 vzG9ClmEJG980LBz4YgWRJvw6R3IGijJliTX8AxTv6TF0VSDzDnaEVxPU
 JBtzcn7yY4bwzyF2u+ZjOkj0Wb6/ckeV9rXQfr9arTBsYEIlHrVQpMGkf Q==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657450"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:09:53 +0800
IronPort-SDR: F0NqOEoC69rmjOCCNTcPPrNY3whivleXRSofOhqVQy5iTw+ZsX/iXv1DhB2965zZGNcBZYqJuk
 6beQ2DJb+6GEqtWQcH5U3ipUURz8QwGG8s9yLdSaB+ySLvRYViJwsvIM+3M0yikHU5+C8y7wz7
 oWlWaY+L2UA1cAlYHnMidrYeWA1jOqKesdXPd8x/4eLBit7Dyp0Lp6miRA7d6T39XokbYmy0Vm
 fSHkvtZsSaHF9Sp/1+ysrH3TrkVhQlHrVWnPVPOKavYsD+1jPmr8kfjgqgxW3/bi6mpNCPVj7+
 V0Q=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:10 -0800
IronPort-SDR: tNJvp5pag0O2bMSyCfwwoLGBAivxoafl9+xLGBgVQssOOfvXRraeyu7U5nFCoZuDPepgqGZWHk
 oeQNAcnQU8Bn9tGsEf4J5uVOAswfJQdsS+F3rHvL1/5Wc+xaJ8dC3tVMTC3U0b8jKU0VnupLVc
 hsoVAcUhlqQT8fr+UOMieeFP0TIphHuL7jzKRTWoIY2a+tPvMx6f4HaYTQpSThWqVRVdlpjWtW
 Fnf5l4sfCY38R8ynOzPm0mFDVe1XCU0ZiLDCkghPGUKeoCe6U/+uxAIpfk01GeKp5jME1IyiPG
 S8w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:09:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQT5B7hz1Rwrq
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:09:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753792; x=1678345793; bh=wETotYCh8Dar8zwu9w
 TkK33Kyt+p5n8PB5KWMCUOGVE=; b=L1qYGC8I70g28Wf4KrGWt0EkPrc+c6Nzsz
 8XViXqroYokmctiuaWLfYvpgMHJNXQwuSUFqUBOZAzM6gWNH399gd6ITodjYBNlW
 SkuYA26UkLKVNfUWwzjTQRNTahNYoSYIMc1uLdSSWJuXAIHNZ4Ffm5oQQspT4glo
 XkvKf/rXNJY6mvQbvO1ve9+jFkSUlqHHBFe6u7s6Ty1Vf9or+BQqUX+WmwgzEPGZ
 dZUSAiC4+p40Y4TP8sA4OjsyjFRCc5zrR2LAgokHb0EujkPYJjFdRW5LmeU34lkj
 Qybp/oajyUmKu4pPh83+6KGZAumvIxD5oGkYk1RVXjFNNb/zOL6Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kFX2k2M1D4KF for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:09:52 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQR3sbpz1RvTr;
 Mon,  6 Feb 2023 23:09:51 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/32] include/hw/riscv/opentitan: update opentitan IRQs
Date: Tue,  7 Feb 2023 17:09:13 +1000
Message-Id: <20230207070943.2558857-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Updates the opentitan IRQs to match the latest supported commit of
Opentitan from TockOS.

OPENTITAN_SUPPORTED_SHA :=3D 565e4af39760a123c59a184aa2f5812a961fde47

Memory layout as per [1]

[1] https://github.com/lowRISC/opentitan/blob/565e4af39760a123c59a184aa2f=
5812a961fde47/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230123063619.222459-1-wilfred.mallawa@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h | 14 +++----
 hw/riscv/opentitan.c         | 80 ++++++++++++++++++------------------
 2 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 7659d1bc5b..c40b05052a 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -94,9 +94,9 @@ enum {
     IBEX_DEV_EDNO,
     IBEX_DEV_EDN1,
     IBEX_DEV_ALERT_HANDLER,
-    IBEX_DEV_NMI_GEN,
+    IBEX_DEV_SRAM_CTRL,
     IBEX_DEV_OTBN,
-    IBEX_DEV_PERI,
+    IBEX_DEV_IBEX_CFG,
 };
=20
 enum {
@@ -108,11 +108,11 @@ enum {
     IBEX_UART0_RX_BREAK_ERR_IRQ   =3D 6,
     IBEX_UART0_RX_TIMEOUT_IRQ     =3D 7,
     IBEX_UART0_RX_PARITY_ERR_IRQ  =3D 8,
-    IBEX_TIMER_TIMEREXPIRED0_0    =3D 127,
-    IBEX_SPI_HOST0_ERR_IRQ        =3D 134,
-    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 135,
-    IBEX_SPI_HOST1_ERR_IRQ        =3D 136,
-    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 137,
+    IBEX_TIMER_TIMEREXPIRED0_0    =3D 124,
+    IBEX_SPI_HOST0_ERR_IRQ        =3D 131,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 132,
+    IBEX_SPI_HOST1_ERR_IRQ        =3D 133,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 134,
 };
=20
 #endif
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 64d5d435b9..353f030d80 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -31,47 +31,47 @@
 /*
  * This version of the OpenTitan machine currently supports
  * OpenTitan RTL version:
- * <lowRISC/opentitan@d072ac505f82152678d6e04be95c72b728a347b8>
+ * <lowRISC/opentitan@565e4af39760a123c59a184aa2f5812a961fde47>
  *
  * MMIO mapping as per (specified commit):
  * lowRISC/opentitan: hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h
  */
 static const MemMapEntry ibex_memmap[] =3D {
-    [IBEX_DEV_ROM] =3D            {  0x00008000,  0x8000 },
-    [IBEX_DEV_RAM] =3D            {  0x10000000,  0x20000 },
-    [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x100000 },
-    [IBEX_DEV_UART] =3D           {  0x40000000,  0x1000  },
-    [IBEX_DEV_GPIO] =3D           {  0x40040000,  0x1000  },
-    [IBEX_DEV_SPI_DEVICE] =3D     {  0x40050000,  0x1000  },
-    [IBEX_DEV_I2C] =3D            {  0x40080000,  0x1000  },
-    [IBEX_DEV_PATTGEN] =3D        {  0x400e0000,  0x1000  },
-    [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
-    [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x4000  },
-    [IBEX_DEV_LC_CTRL] =3D        {  0x40140000,  0x1000  },
-    [IBEX_DEV_ALERT_HANDLER] =3D  {  0x40150000,  0x1000  },
-    [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x1000  },
-    [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x1000  },
-    [IBEX_DEV_USBDEV] =3D         {  0x40320000,  0x1000  },
-    [IBEX_DEV_PWRMGR] =3D         {  0x40400000,  0x1000  },
-    [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x1000  },
-    [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x1000  },
-    [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000  },
-    [IBEX_DEV_AON_TIMER] =3D      {  0x40470000,  0x1000  },
-    [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40490000,  0x1000  },
-    [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x1000  },
-    [IBEX_DEV_AES] =3D            {  0x41100000,  0x1000  },
-    [IBEX_DEV_HMAC] =3D           {  0x41110000,  0x1000  },
-    [IBEX_DEV_KMAC] =3D           {  0x41120000,  0x1000  },
-    [IBEX_DEV_OTBN] =3D           {  0x41130000,  0x10000 },
-    [IBEX_DEV_KEYMGR] =3D         {  0x41140000,  0x1000  },
-    [IBEX_DEV_CSRNG] =3D          {  0x41150000,  0x1000  },
-    [IBEX_DEV_ENTROPY] =3D        {  0x41160000,  0x1000  },
-    [IBEX_DEV_EDNO] =3D           {  0x41170000,  0x1000  },
-    [IBEX_DEV_EDN1] =3D           {  0x41180000,  0x1000  },
-    [IBEX_DEV_NMI_GEN] =3D        {  0x411c0000,  0x1000  },
-    [IBEX_DEV_PERI] =3D           {  0x411f0000,  0x10000 },
-    [IBEX_DEV_PLIC] =3D           {  0x48000000,  0x4005000 },
-    [IBEX_DEV_FLASH_VIRTUAL] =3D  {  0x80000000,  0x80000 },
+    [IBEX_DEV_ROM] =3D            {  0x00008000,  0x8000      },
+    [IBEX_DEV_RAM] =3D            {  0x10000000,  0x20000     },
+    [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x100000    },
+    [IBEX_DEV_UART] =3D           {  0x40000000,  0x40        },
+    [IBEX_DEV_GPIO] =3D           {  0x40040000,  0x40        },
+    [IBEX_DEV_SPI_DEVICE] =3D     {  0x40050000,  0x2000      },
+    [IBEX_DEV_I2C] =3D            {  0x40080000,  0x80        },
+    [IBEX_DEV_PATTGEN] =3D        {  0x400e0000,  0x40        },
+    [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x200       },
+    [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x2000      },
+    [IBEX_DEV_LC_CTRL] =3D        {  0x40140000,  0x100       },
+    [IBEX_DEV_ALERT_HANDLER] =3D  {  0x40150000,  0x800       },
+    [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x40        },
+    [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x40        },
+    [IBEX_DEV_USBDEV] =3D         {  0x40320000,  0x1000      },
+    [IBEX_DEV_PWRMGR] =3D         {  0x40400000,  0x80        },
+    [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x80        },
+    [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x80        },
+    [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000      },
+    [IBEX_DEV_AON_TIMER] =3D      {  0x40470000,  0x40        },
+    [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40490000,  0x40        },
+    [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x200       },
+    [IBEX_DEV_AES] =3D            {  0x41100000,  0x100       },
+    [IBEX_DEV_HMAC] =3D           {  0x41110000,  0x1000      },
+    [IBEX_DEV_KMAC] =3D           {  0x41120000,  0x1000      },
+    [IBEX_DEV_OTBN] =3D           {  0x41130000,  0x10000     },
+    [IBEX_DEV_KEYMGR] =3D         {  0x41140000,  0x100       },
+    [IBEX_DEV_CSRNG] =3D          {  0x41150000,  0x80        },
+    [IBEX_DEV_ENTROPY] =3D        {  0x41160000,  0x100       },
+    [IBEX_DEV_EDNO] =3D           {  0x41170000,  0x80        },
+    [IBEX_DEV_EDN1] =3D           {  0x41180000,  0x80        },
+    [IBEX_DEV_SRAM_CTRL] =3D      {  0x411c0000,  0x20        },
+    [IBEX_DEV_IBEX_CFG] =3D       {  0x411f0000,  0x100       },
+    [IBEX_DEV_PLIC] =3D           {  0x48000000,  0x8000000   },
+    [IBEX_DEV_FLASH_VIRTUAL] =3D  {  0x80000000,  0x80000     },
 };
=20
 static void opentitan_board_init(MachineState *machine)
@@ -294,12 +294,12 @@ static void lowrisc_ibex_soc_realize(DeviceState *d=
ev_soc, Error **errp)
         memmap[IBEX_DEV_EDN1].base, memmap[IBEX_DEV_EDN1].size);
     create_unimplemented_device("riscv.lowrisc.ibex.alert_handler",
         memmap[IBEX_DEV_ALERT_HANDLER].base, memmap[IBEX_DEV_ALERT_HANDL=
ER].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.nmi_gen",
-        memmap[IBEX_DEV_NMI_GEN].base, memmap[IBEX_DEV_NMI_GEN].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.sram_ctrl",
+        memmap[IBEX_DEV_SRAM_CTRL].base, memmap[IBEX_DEV_SRAM_CTRL].size=
);
     create_unimplemented_device("riscv.lowrisc.ibex.otbn",
         memmap[IBEX_DEV_OTBN].base, memmap[IBEX_DEV_OTBN].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.peri",
-        memmap[IBEX_DEV_PERI].base, memmap[IBEX_DEV_PERI].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.ibex_cfg",
+        memmap[IBEX_DEV_IBEX_CFG].base, memmap[IBEX_DEV_IBEX_CFG].size);
 }
=20
 static Property lowrisc_ibex_soc_props[] =3D {
--=20
2.39.1


