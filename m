Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4BE50ACDE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:40:13 +0200 (CEST)
Received: from localhost ([::1]:50458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhLI-0000qc-7l
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIf-0006OJ-Uo
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:29 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIe-0005JO-68
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587848; x=1682123848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZgC2XGZNz9GOqFHwEiweZQEoaeQwoAuD6cvXgf97ucI=;
 b=kfRSMyeyxRcVWGDtJSAEYAaaIgvs+aPNszMuWEzzikdhzhN06gjiNvda
 cy4oc8Ekf4tyK+Mx3AEDYCfZdIBmmDnAI7dci6HWD99hUi1ePim61Iw3X
 DHEgCvAHfoNeJJOcMJW7P6ioElgJZ3m4et2LHFYTHIkAAfL9nQ5fD/FU8
 r+amoiGFa8T8pCFkN3MY7WzoPY2UYq0AyfnaKhjFGL8MW4lIGbiHzeOcI
 9GbycxIhpU07tM5tV2CsxMIgs1iu8cfjBoAsUvf1gWoy12+DR6efu358x
 NpRP16R4BLvmRcH/gDCsQLT+NMxEbAKS9/FMHLkbAD7TQm4e3YjydYFD3 Q==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="302715719"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:15 +0800
IronPort-SDR: ASeOtSVetivZBCo+L95FGBEoFK9YbM4dVJuTcWRWxeJmNdRCiC2TO3KNsDF9neZYyuQCC+1hYL
 jwoDh5FXwBgrQUYXPhGHWIE+fpBdL+6Yq/HUmaCvawZMSUr00LjlgVALHfYXFGdcBpPrxefb17
 5EhOF0jl2rrrDcfVEdJ57emXN9lBRgI1WdQauYxICm6CSjdGY/UXmBEnHQjfarutHUDXzi93LM
 +HnW9rTspk2MdgJyE+mtbKJStcUEfsYg/XpeZ748qyA+cKpUXrQ+FrgJLnj9u0j5JudUBmQNY0
 qQULpjetX+KOsyEg+VR3NyOr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:07:32 -0700
IronPort-SDR: rPi1Fw5nS9Gn5CUSJgudOXr1q9IQnwur9BytaiR7WcZgLFcfM5EIEgEi35aGypY7I6W+LmSzNU
 S5RxMni0LF/LbXDd+PRs+WzrzqYCIPM66vqGI6K0wLde/aeUqy8lo4srkdekHzXzexDhLXAqxC
 iTDg3ygoLsfwDfjovrvd8M8DqS4RsWNGgialuvrzOmruGZqpxO6f8atZ6ZbqJkwk5O9VYn6azb
 2ShCzcQPV2l4f6A5Qr0rq1G1Rs2c/OQFO3gbJZ9KenKxrmw4/N5as+Vf/wPzXG98y7h9wqv1Yt
 lII=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwTl1Cryz1Rvlx
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1650587834; x=1653179835; bh=ZgC2XGZ
 Nz9GOqFHwEiweZQEoaeQwoAuD6cvXgf97ucI=; b=B4uFn1rMaj+2+zjvHMTIZrQ
 LAlOlCEcsRayxT5lsETtacPWJtv7f8F++PH5aq/LQ3xMXyAvTgOVga+R/5oUKROh
 HclDXrzCOg3zdyeXHElOYaVxswa0Da0ZH7IM++AA9lFg1fPvKmHLJLR4Mu2uXTdx
 HE/8ry5DuStf9j1NWuZa1bwYOB6onciqJcPtJyJouwgBUjKRXON2Y20eVnUcMnoI
 rgo/MwudHSjeMMt9AYPASWbJgjUrj8twK/SwbY/vKgsol5OMKiJYK3fjdpEVkob4
 b6COd4d+XjwgYP3RcFKfAWtXPfSDHMuQHLPzMhGA+lqoEpyyC7awI8zDPktjO7Q=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 8PpDO_e3bM4t for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:14 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwTg4Qddz1Rwrw;
 Thu, 21 Apr 2022 17:37:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL v2 02/31] riscv: opentitan: Connect opentitan SPI Host
Date: Fri, 22 Apr 2022 10:36:27 +1000
Message-Id: <20220422003656.1648121-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Connect spi host[1/0] to opentitan.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220303045426.511588-2-alistair.francis@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h | 30 +++++++++++++++++++++---------
 hw/riscv/opentitan.c         | 36 ++++++++++++++++++++++++++++++++----
 2 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 00da9ded43..68892cd8e5 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -23,11 +23,18 @@
 #include "hw/intc/sifive_plic.h"
 #include "hw/char/ibex_uart.h"
 #include "hw/timer/ibex_timer.h"
+#include "hw/ssi/ibex_spi_host.h"
 #include "qom/object.h"
=20
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
 OBJECT_DECLARE_SIMPLE_TYPE(LowRISCIbexSoCState, RISCV_IBEX_SOC)
=20
+enum {
+    OPENTITAN_SPI_HOST0,
+    OPENTITAN_SPI_HOST1,
+    OPENTITAN_NUM_SPI_HOSTS,
+};
+
 struct LowRISCIbexSoCState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -37,6 +44,7 @@ struct LowRISCIbexSoCState {
     SiFivePLICState plic;
     IbexUartState uart;
     IbexTimerState timer;
+    IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
=20
     MemoryRegion flash_mem;
     MemoryRegion rom;
@@ -89,15 +97,19 @@ enum {
 };
=20
 enum {
-    IBEX_TIMER_TIMEREXPIRED0_0 =3D 126,
-    IBEX_UART0_RX_PARITY_ERR_IRQ =3D 8,
-    IBEX_UART0_RX_TIMEOUT_IRQ =3D 7,
-    IBEX_UART0_RX_BREAK_ERR_IRQ =3D 6,
-    IBEX_UART0_RX_FRAME_ERR_IRQ =3D 5,
-    IBEX_UART0_RX_OVERFLOW_IRQ =3D 4,
-    IBEX_UART0_TX_EMPTY_IRQ =3D 3,
-    IBEX_UART0_RX_WATERMARK_IRQ =3D 2,
-    IBEX_UART0_TX_WATERMARK_IRQ =3D 1,
+    IBEX_UART0_TX_WATERMARK_IRQ   =3D 1,
+    IBEX_UART0_RX_WATERMARK_IRQ   =3D 2,
+    IBEX_UART0_TX_EMPTY_IRQ       =3D 3,
+    IBEX_UART0_RX_OVERFLOW_IRQ    =3D 4,
+    IBEX_UART0_RX_FRAME_ERR_IRQ   =3D 5,
+    IBEX_UART0_RX_BREAK_ERR_IRQ   =3D 6,
+    IBEX_UART0_RX_TIMEOUT_IRQ     =3D 7,
+    IBEX_UART0_RX_PARITY_ERR_IRQ  =3D 8,
+    IBEX_TIMER_TIMEREXPIRED0_0    =3D 126,
+    IBEX_SPI_HOST0_ERR_IRQ        =3D 150,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 151,
+    IBEX_SPI_HOST1_ERR_IRQ        =3D 152,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 153,
 };
=20
 #endif
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 833624d66c..2d401dcb23 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -120,11 +120,18 @@ static void lowrisc_ibex_soc_init(Object *obj)
     object_initialize_child(obj, "uart", &s->uart, TYPE_IBEX_UART);
=20
     object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
+
+    for (int i =3D 0; i < OPENTITAN_NUM_SPI_HOSTS; i++) {
+        object_initialize_child(obj, "spi_host[*]", &s->spi_host[i],
+                                TYPE_IBEX_SPI_HOST);
+    }
 }
=20
 static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
 {
     const MemMapEntry *memmap =3D ibex_memmap;
+    DeviceState *dev;
+    SysBusDevice *busdev;
     MachineState *ms =3D MACHINE(qdev_get_machine());
     LowRISCIbexSoCState *s =3D RISCV_IBEX_SOC(dev_soc);
     MemoryRegion *sys_mem =3D get_system_memory();
@@ -209,14 +216,35 @@ static void lowrisc_ibex_soc_realize(DeviceState *d=
ev_soc, Error **errp)
                           qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),
                                            IRQ_M_TIMER));
=20
+    /* SPI-Hosts */
+    for (int i =3D 0; i < OPENTITAN_NUM_SPI_HOSTS; ++i) {
+        dev =3D DEVICE(&(s->spi_host[i]));
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi_host[i]), errp)) {
+            return;
+        }
+        busdev =3D SYS_BUS_DEVICE(dev);
+        sysbus_mmio_map(busdev, 0, memmap[IBEX_DEV_SPI_HOST0 + i].base);
+
+        switch (i) {
+        case OPENTITAN_SPI_HOST0:
+            sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
+                                IBEX_SPI_HOST0_ERR_IRQ));
+            sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
+                                IBEX_SPI_HOST0_SPI_EVENT_IRQ));
+            break;
+        case OPENTITAN_SPI_HOST1:
+            sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
+                                IBEX_SPI_HOST1_ERR_IRQ));
+            sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
+                                IBEX_SPI_HOST1_SPI_EVENT_IRQ));
+            break;
+        }
+    }
+
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
     create_unimplemented_device("riscv.lowrisc.ibex.spi_device",
         memmap[IBEX_DEV_SPI_DEVICE].base, memmap[IBEX_DEV_SPI_DEVICE].si=
ze);
-    create_unimplemented_device("riscv.lowrisc.ibex.spi_host0",
-        memmap[IBEX_DEV_SPI_HOST0].base, memmap[IBEX_DEV_SPI_HOST0].size=
);
-    create_unimplemented_device("riscv.lowrisc.ibex.spi_host1",
-        memmap[IBEX_DEV_SPI_HOST1].base, memmap[IBEX_DEV_SPI_HOST1].size=
);
     create_unimplemented_device("riscv.lowrisc.ibex.i2c",
         memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
--=20
2.35.1


