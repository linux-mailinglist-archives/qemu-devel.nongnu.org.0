Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214813B2E86
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:04:08 +0200 (CEST)
Received: from localhost ([::1]:36246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwO5X-000662-4J
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3s-0003VY-Cj
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:25 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:41532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3o-0003pC-3t
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624536140; x=1656072140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8IPZknxPiBDzoNTxSv+VKq5QZC8E+IqWFDKTchLkUtU=;
 b=TKqzO73NkVwZzA9BhG/w+KkbuxdKGf9AnDRh4+2svbi1HSphoe7LFVxU
 1oIjMKQerGCX1UTR/iDn/rIEvicv2h2FZQ5NlXkmMTz5zSIPziDd8FIZY
 sYuoBdSBgCB6/vj4zmS30jGbWMCUYPjCpKTQyacxjaV0t0lFvstgZaFG1
 q5BvVMZlDHARpYX5K4KBhcTDFo97Id7LetuFXPdBnmhFXZVzQto3B8aO+
 ytJrlR1aviJ35pYZSROncUE/2l4X9fzva5pnXaJJTHtJKp/o2ky+b2AN0
 WA4KHT8kKPIZroGHAiO1aYQFLVA4BNVIpCWClgeQoUvUQUz2l+cw6sZHv Q==;
IronPort-SDR: 5Z2Q8UtUxGq0G8Husp/8nwGPt7zqsk51k7wIKXBgA70kFTDfgqpRPgoxX6HesWFcqeMzQSgiBB
 8zlWWeMfrsq7LCYRlk8g2L7TQvqkl1sHzrKHfpzV9zALCWQA9Cibob9fjnHyYq+5OvryEDQJGs
 6zyTh2UwYA9Ue5rkskyCUFVVqDxqOUK0sxtqrDFYf2bwh29yFAiGkaopGpMHHNHKJzkgoEr/IP
 lVzwrITdxToVTdBiAXo9GyPoBgnctd0TnjntQOQAAAOsFZQqIxzjLNbKKcq3kE+OaXDAucwRcg
 EKA=
X-IronPort-AV: E=Sophos;i="5.83,296,1616428800"; d="scan'208";a="284269191"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2021 20:02:15 +0800
IronPort-SDR: 3uDTDCMFegpo+mtHRECaPsb3lReIGPWGUBuLLs+DBnBhmVovYY+EDnKnyGGCHQMivtL91IG1Eq
 /CXAhVSfdfRbRLZntecPiqVWnHxRNF1DaJCRs5MgYrwqTf7Zrri5dTgrZpw4N1ynWUJWjBJ8dG
 xOgmN0VB9KcnU1Gq6XnyGRO0bIc7odq8Vo1QDMGNeIlBiCOm7+DNiFzlbXrgFazeoGqS2cACzJ
 nCLMOmoy3iyYI7BrAm9HUD8MX1jJBiJ6lX3PtOl9gNfKC5sNKUT+koD3hPpRWf/iPPckEecut9
 L2Wi+qN02S7T7olQvU5IDnxC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 04:40:50 -0700
IronPort-SDR: goeMpz0zUBJ8YeLo6lIYJW3GOklly4nRtgi/U8wgQ+dcCjq8IeAjKN1hB0ewfWfaLYtlJuBw9T
 vfx6qNgANzGq7DTM7e0duPKu0qmlPERMhfBdH0tGQUvg/Qiy8tzTL4e9STf632JtasaOaZNcYR
 L13UBOH80nGFTh5XLpqhU5459B+12B5K6D4s393Flc3BWL2JboXXLFZhtLEsY5W7vIFR0p1kjf
 muYxAJmTAVIWq3cw2aM5m8ZhNOl/MceD/pjHaGGB9u01V/W+vjqiI6l+2j0bx0E8EjARjimQFT
 QPs=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Jun 2021 05:02:16 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 7/7] hw/riscv: OpenTitan: Connect the mtime and mtimecmp timer
Date: Thu, 24 Jun 2021 05:02:11 -0700
Message-Id: <20210624120211.85499-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624120211.85499-1-alistair.francis@wdc.com>
References: <20210624120211.85499-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=802348aeb=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect the Ibex timer to the OpenTitan machine. The timer can trigger
the RISC-V MIE interrupt as well as a custom device interrupt.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 5e7f4e9b4537f863bcb8db1264b840b56ef2a929.1624001156.git.alistair.francis@wdc.com
---
 include/hw/riscv/opentitan.h |  5 ++++-
 hw/riscv/opentitan.c         | 14 +++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index aab9bc9245..86cceef698 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -22,6 +22,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/intc/ibex_plic.h"
 #include "hw/char/ibex_uart.h"
+#include "hw/timer/ibex_timer.h"
 #include "qom/object.h"
 
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
@@ -35,6 +36,7 @@ struct LowRISCIbexSoCState {
     RISCVHartArrayState cpus;
     IbexPlicState plic;
     IbexUartState uart;
+    IbexTimerState timer;
 
     MemoryRegion flash_mem;
     MemoryRegion rom;
@@ -57,7 +59,7 @@ enum {
     IBEX_DEV_SPI,
     IBEX_DEV_I2C,
     IBEX_DEV_PATTGEN,
-    IBEX_DEV_RV_TIMER,
+    IBEX_DEV_TIMER,
     IBEX_DEV_SENSOR_CTRL,
     IBEX_DEV_OTP_CTRL,
     IBEX_DEV_PWRMGR,
@@ -82,6 +84,7 @@ enum {
 };
 
 enum {
+    IBEX_TIMER_TIMEREXPIRED0_0 = 125,
     IBEX_UART0_RX_PARITY_ERR_IRQ = 8,
     IBEX_UART0_RX_TIMEOUT_IRQ = 7,
     IBEX_UART0_RX_BREAK_ERR_IRQ = 6,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 7545dcda9c..c5a7e3bacb 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -36,7 +36,7 @@ static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_SPI] =            {  0x40050000,  0x1000  },
     [IBEX_DEV_I2C] =            {  0x40080000,  0x1000  },
     [IBEX_DEV_PATTGEN] =        {  0x400e0000,  0x1000  },
-    [IBEX_DEV_RV_TIMER] =       {  0x40100000,  0x1000  },
+    [IBEX_DEV_TIMER] =          {  0x40100000,  0x1000  },
     [IBEX_DEV_SENSOR_CTRL] =    {  0x40110000,  0x1000  },
     [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
     [IBEX_DEV_PWRMGR] =         {  0x40400000,  0x1000  },
@@ -106,6 +106,8 @@ static void lowrisc_ibex_soc_init(Object *obj)
     object_initialize_child(obj, "plic", &s->plic, TYPE_IBEX_PLIC);
 
     object_initialize_child(obj, "uart", &s->uart, TYPE_IBEX_UART);
+
+    object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
 }
 
 static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -159,6 +161,14 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                        3, qdev_get_gpio_in(DEVICE(&s->plic),
                        IBEX_UART0_RX_OVERFLOW_IRQ));
 
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer), 0, memmap[IBEX_DEV_TIMER].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer),
+                       0, qdev_get_gpio_in(DEVICE(&s->plic),
+                       IBEX_TIMER_TIMEREXPIRED0_0));
+
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
     create_unimplemented_device("riscv.lowrisc.ibex.spi",
@@ -167,8 +177,6 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
         memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
         memmap[IBEX_DEV_PATTGEN].base, memmap[IBEX_DEV_PATTGEN].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.rv_timer",
-        memmap[IBEX_DEV_RV_TIMER].base, memmap[IBEX_DEV_RV_TIMER].size);
     create_unimplemented_device("riscv.lowrisc.ibex.sensor_ctrl",
         memmap[IBEX_DEV_SENSOR_CTRL].base, memmap[IBEX_DEV_SENSOR_CTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.otp_ctrl",
-- 
2.31.1


