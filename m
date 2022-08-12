Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5FD5909B4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 02:56:34 +0200 (CEST)
Received: from localhost ([::1]:56594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMIyX-0001vh-UF
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 20:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=216cf6cd4=wilfred.mallawa@opensource.wdc.com>)
 id 1oMIw7-0008EC-Vc
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 20:54:04 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:52078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=216cf6cd4=wilfred.mallawa@opensource.wdc.com>)
 id 1oMIw6-0006t1-5s
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 20:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660265642; x=1691801642;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9bVAoEgvlRaabyMifblnKOMq5ZLIJCVOXI8jjpw86a4=;
 b=YTLUZ+qUaG8RiR7Q8RflQtFJSJILgwrYftjGPbVbspjw5FsyjJkO9lo6
 H0EojN4cbKiMCWzCm6KWLGrqtUtTYpGPHqhMftveAWF7Ur0uQYC6aKIJo
 UeNZQUMC0seT7f3RV011b5YvBl/rUZzyHx2EtxFJg9UlKE240IdHzd3IW
 jV5TB0M3oIh6n2yB9DxdiVIobdheebAgKBBBOyyVkiZT2wEjUr/oALpth
 HLDnf6RXXqFtsFo7zZcXbpfr/C2PJl48Cbgh9z7Op/xXa8JQUXEHmjsv4
 f2tDK7w5mgBKskiMn7lx0LcwmvwE2k+xJrts6i4Q73MCoP9Dsn9Av4+8V Q==;
X-IronPort-AV: E=Sophos;i="5.93,231,1654531200"; d="scan'208";a="312780673"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Aug 2022 08:53:53 +0800
IronPort-SDR: LFHa+6EASWGNvwVHUq741a3QA+DzVzoHgQcfiQwIX8jZhuh6czWtIn/EUnWa+fJMCbRnwr7b+F
 HPVBKJ8VEWk5zTEe5UodWxDMhMZmDFhWZ4UfrE8NsCUhexbiOQRrWYMEgK3E+AqSm8rZLh5fUn
 H44+sEFVKReCviN4tmGZFl6HtCGjtgaLyMzj17ISqfNBbG1iJEiSCFvnLMtwzEeMvMKQHEBWlL
 BswXW2xbwnhl8kBk+Dqbq+zRFJ5vlbhwfMJHTWULV6k13UiN81jbikEJgkTJhxkQ8p1ENy3zbL
 f4ih9t9tlyZ4ZdVYNMAVKzLd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 17:14:46 -0700
IronPort-SDR: r4Fmp31GyyAuOcQHNwGZsuPa2e5oameHdwOytWcgDlXOpPTzozYo0jz6lLg3+PaQ6+7+YyX3rr
 4RmPvmu5nte5cgS5boygljngaZkH7DR3KSCk5tT7kAtS/+qHyNAtYqyP8PUPWMi7Wi4N8/XhID
 AKlRo59iQ0wbW4CsDYjrqhvgy8OmrsYp6I+I+hkCZ0gCkua2lIWNE3QQtNa0u45SH6ug6c2Ph8
 EYZMhHIoUMj6KWFbU43q3RwYo5mFCpXzCHQzBXyJaoho+ndnmdSvCPg9zk00p6rY97hrLNLtHq
 YB8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 17:53:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M3lYD3YP6z1Rwnx
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 17:53:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1660265631;
 x=1662857632; bh=9bVAoEgvlRaabyMifblnKOMq5ZLIJCVOXI8jjpw86a4=; b=
 JLINma8e5oU2Wb2M6/Nu1OrnAmZrOcHB+VjL0c9TDazgpvOGIR7nYF8FrisvyOqa
 /zYUFSqpUz0UcqHUZOeT0gJUen1z4X33xje9In1lK3Yvu+edDHBuMSbQcnFkFJVy
 HgV0AJ/UOGRiXC2scjSUcJsBjRaQT4pO72mbh7KHxWxqTmJj84sjwz/7YwfSOhLk
 lhkn7/zSJ2xB3PCBQgTxFXtGGMLaqe+MJEyeF9IWTTpZ8C67TVhTCOTWPR/dnLD2
 U8SvluWndPlBPervVeF809n+PXov1rhO4rLxUH/rdql6DO6gMch5BYJH4wSTDzb7
 qhblJW9kuH9+wbDjQanz+Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id IpoYPol_rIbX for <qemu-devel@nongnu.org>;
 Thu, 11 Aug 2022 17:53:51 -0700 (PDT)
Received: from fedora.wdc.com (unknown [10.225.165.27])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M3lY86GQRz1RtVk;
 Thu, 11 Aug 2022 17:53:48 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH] hw/riscv: opentitan: bump opentitan version
Date: Fri, 12 Aug 2022 10:52:30 +1000
Message-Id: <20220812005229.358850-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=216cf6cd4=wilfred.mallawa@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

The following patch updates opentitan to match the new configuration,
as per, lowRISC/opentitan@217a0168ba118503c166a9587819e3811eeb0c0c

Note: with this patch we now skip the usage of the opentitan
`boot_rom`. The Opentitan boot rom contains hw verification
for devies which we are currently not supporting in qemu. As of now,
the `boot_rom` has no major significance, however, would be good to
support in the future.

Tested by running utests from the latest tock [1]
(that supports this version of OT).

[1] https://github.com/tock/tock/pull/3056

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/riscv/opentitan.c         | 12 ++++++++----
 include/hw/riscv/opentitan.h | 11 ++++++-----
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 4495a2c039..af13dbe3b1 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -29,9 +29,9 @@
 #include "sysemu/sysemu.h"
=20
 static const MemMapEntry ibex_memmap[] =3D {
-    [IBEX_DEV_ROM] =3D            {  0x00008000, 16 * KiB },
-    [IBEX_DEV_RAM] =3D            {  0x10000000,  0x10000 },
-    [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x80000 },
+    [IBEX_DEV_ROM] =3D            {  0x00008000,   0x8000 },
+    [IBEX_DEV_RAM] =3D            {  0x10000000,  0x20000 },
+    [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x100000 },
     [IBEX_DEV_UART] =3D           {  0x40000000,  0x1000  },
     [IBEX_DEV_GPIO] =3D           {  0x40040000,  0x1000  },
     [IBEX_DEV_SPI_DEVICE] =3D     {  0x40050000,  0x1000  },
@@ -40,6 +40,7 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
     [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40110000,  0x1000  },
     [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x4000  },
+    [IBEX_DEV_LC_CTRL] =3D        {  0x40140000,  0x1000  },
     [IBEX_DEV_USBDEV] =3D         {  0x40150000,  0x1000  },
     [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x1000  },
     [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x1000  },
@@ -141,7 +142,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error=
_abort);
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x20000490,
+                            &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
=20
     /* Boot ROM */
@@ -253,6 +255,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
         memmap[IBEX_DEV_SENSOR_CTRL].base, memmap[IBEX_DEV_SENSOR_CTRL].=
size);
     create_unimplemented_device("riscv.lowrisc.ibex.otp_ctrl",
         memmap[IBEX_DEV_OTP_CTRL].base, memmap[IBEX_DEV_OTP_CTRL].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.lc_ctrl",
+        memmap[IBEX_DEV_LC_CTRL].base, memmap[IBEX_DEV_LC_CTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pwrmgr",
         memmap[IBEX_DEV_PWRMGR].base, memmap[IBEX_DEV_PWRMGR].size);
     create_unimplemented_device("riscv.lowrisc.ibex.rstmgr",
diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 68892cd8e5..26d960f288 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -74,6 +74,7 @@ enum {
     IBEX_DEV_TIMER,
     IBEX_DEV_SENSOR_CTRL,
     IBEX_DEV_OTP_CTRL,
+    IBEX_DEV_LC_CTRL,
     IBEX_DEV_PWRMGR,
     IBEX_DEV_RSTMGR,
     IBEX_DEV_CLKMGR,
@@ -105,11 +106,11 @@ enum {
     IBEX_UART0_RX_BREAK_ERR_IRQ   =3D 6,
     IBEX_UART0_RX_TIMEOUT_IRQ     =3D 7,
     IBEX_UART0_RX_PARITY_ERR_IRQ  =3D 8,
-    IBEX_TIMER_TIMEREXPIRED0_0    =3D 126,
-    IBEX_SPI_HOST0_ERR_IRQ        =3D 150,
-    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 151,
-    IBEX_SPI_HOST1_ERR_IRQ        =3D 152,
-    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 153,
+    IBEX_TIMER_TIMEREXPIRED0_0    =3D 127,
+    IBEX_SPI_HOST0_ERR_IRQ        =3D 151,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 152,
+    IBEX_SPI_HOST1_ERR_IRQ        =3D 153,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 154,
 };
=20
 #endif
--=20
2.37.1


