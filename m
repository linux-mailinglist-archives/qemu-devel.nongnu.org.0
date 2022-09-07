Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E55B0021
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:13:59 +0200 (CEST)
Received: from localhost ([::1]:51044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVr89-0007oh-Lr
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4d-0004su-N0
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:21 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4b-0004UV-JB
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537972; x=1694073972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nwidhC7SMTO28XVStpjSpPXKy2/kUm/ODlnipL/Eq8E=;
 b=MRPqvDe4vMHRI/jESp5umcMqnh7SCk2BqOWWWdVwXN9suqOI9CtACa0B
 wSHctsy0B3vyY3ZQLIHWFvHEKlLXjAKCQzqQWspcIA/jb3j888gf3dCge
 aQ8oZCRndQbS6NM7fmd3QmS1yMisr5JoIG5J8Dtz2DiwIJDGHo1lD4kQE
 eMx87Qx147SpC9sMYpRYGiMSA/8PGccIgCPZMpVMyMluEdPNTMySwCTcc
 cvhXrTbRylrCdJNK5AucXjmCeBmz6gmYp1/FhHvkCJ40aM8tO6zt2UFvl
 TCJ1ChCviHOLURe7p4kECJgWHSqcJNnuwBqnMHbzEfwmvzfFW9NjQfSDc w==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715068"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:06 +0800
IronPort-SDR: IZ31FHc41Qb7Lz+gJ3Mn7yRS70TpEYTm8tqtANe69r4YtJJd4+9dPc+wkHxcIGxd73VV4XqJVF
 zYfBDa0dCesmyFz6JTrObb9W7d2/vb7AyA4LbbYM6OyhCRF+1BrcyCR8Arq2IFqHqfFbmtTad0
 gs6kzpb2d2S7AZOr3CY4d40LgUXl9TW+FRpvZaQ2GVzH0OmIiRZ16bL7wyBajIll0I7wZeEI01
 WStwIXMDr5ygi0EGku+FG27HWe2/7cjGkJ4rnKr1ZfYrUDZToV444UA6X5pj+0RToRFFhRB5Rh
 LTUm4GbfyRr1l31JiVcwMAmV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:04 -0700
IronPort-SDR: rmJ+5RY6hevajAzEy4CzUEk5L588rwPgV7t4K1eAWNhZnzJW3GtprFNRv/sb4PtopbJive1UfX
 qMf70SCCciBxfIMP13VjDjq73XfTgRt0F5I/7azRn+n4FdXprK8unf3wuNe6j+CTwB3Tn0yrUO
 1V09duRwKQw+j9YITWlw4VUcqy1IAavyR2k45L8bcT5KyNW4VnrCxnPlDyKcSXpKug/pEpauTC
 9XDgOdja2mblD8/Xbp+dm8sJ+zxczQ0lQyDl0UcX/jUtVSnUj0fJb7xYa0+jk3IMUKuY2AqK6S
 zwU=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:06 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 28/44] hw/riscv: opentitan: bump opentitan version
Date: Wed,  7 Sep 2022 10:03:37 +0200
Message-Id: <20220907080353.111926-29-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220812005229.358850-1-wilfred.mallawa@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h | 11 ++++++-----
 hw/riscv/opentitan.c         | 12 ++++++++----
 2 files changed, 14 insertions(+), 9 deletions(-)

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
     IBEX_UART0_RX_BREAK_ERR_IRQ   = 6,
     IBEX_UART0_RX_TIMEOUT_IRQ     = 7,
     IBEX_UART0_RX_PARITY_ERR_IRQ  = 8,
-    IBEX_TIMER_TIMEREXPIRED0_0    = 126,
-    IBEX_SPI_HOST0_ERR_IRQ        = 150,
-    IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 151,
-    IBEX_SPI_HOST1_ERR_IRQ        = 152,
-    IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 153,
+    IBEX_TIMER_TIMEREXPIRED0_0    = 127,
+    IBEX_SPI_HOST0_ERR_IRQ        = 151,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 152,
+    IBEX_SPI_HOST1_ERR_IRQ        = 153,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 154,
 };
 
 #endif
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 4495a2c039..af13dbe3b1 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -29,9 +29,9 @@
 #include "sysemu/sysemu.h"
 
 static const MemMapEntry ibex_memmap[] = {
-    [IBEX_DEV_ROM] =            {  0x00008000, 16 * KiB },
-    [IBEX_DEV_RAM] =            {  0x10000000,  0x10000 },
-    [IBEX_DEV_FLASH] =          {  0x20000000,  0x80000 },
+    [IBEX_DEV_ROM] =            {  0x00008000,   0x8000 },
+    [IBEX_DEV_RAM] =            {  0x10000000,  0x20000 },
+    [IBEX_DEV_FLASH] =          {  0x20000000,  0x100000 },
     [IBEX_DEV_UART] =           {  0x40000000,  0x1000  },
     [IBEX_DEV_GPIO] =           {  0x40040000,  0x1000  },
     [IBEX_DEV_SPI_DEVICE] =     {  0x40050000,  0x1000  },
@@ -40,6 +40,7 @@ static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_TIMER] =          {  0x40100000,  0x1000  },
     [IBEX_DEV_SENSOR_CTRL] =    {  0x40110000,  0x1000  },
     [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
+    [IBEX_DEV_LC_CTRL] =        {  0x40140000,  0x1000  },
     [IBEX_DEV_USBDEV] =         {  0x40150000,  0x1000  },
     [IBEX_DEV_SPI_HOST0] =      {  0x40300000,  0x1000  },
     [IBEX_DEV_SPI_HOST1] =      {  0x40310000,  0x1000  },
@@ -141,7 +142,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x20000490,
+                            &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
 
     /* Boot ROM */
@@ -253,6 +255,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
         memmap[IBEX_DEV_SENSOR_CTRL].base, memmap[IBEX_DEV_SENSOR_CTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.otp_ctrl",
         memmap[IBEX_DEV_OTP_CTRL].base, memmap[IBEX_DEV_OTP_CTRL].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.lc_ctrl",
+        memmap[IBEX_DEV_LC_CTRL].base, memmap[IBEX_DEV_LC_CTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pwrmgr",
         memmap[IBEX_DEV_PWRMGR].base, memmap[IBEX_DEV_PWRMGR].size);
     create_unimplemented_device("riscv.lowrisc.ibex.rstmgr",
-- 
2.37.2


