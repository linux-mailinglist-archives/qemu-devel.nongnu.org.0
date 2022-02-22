Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DDB4C041D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 22:50:27 +0100 (CET)
Received: from localhost ([::1]:57908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMd3D-00065H-3I
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 16:50:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=045d7fed6=alistair.francis@opensource.wdc.com>)
 id 1nMcy8-0001gL-Sx
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 16:45:12 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:48798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=045d7fed6=alistair.francis@opensource.wdc.com>)
 id 1nMcy6-0001ok-Mz
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 16:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1645566310; x=1677102310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wl/+WSzCFoq5nO90BN6K5istP41jyA7U1JfB2b4EWHI=;
 b=Dv1Q9qUcUtSBwPHRR1eARrx29RYhIoaMv5iqPeCucF2L5G9knhAwx/E5
 t1uBlKrqcIYNUac922fPZd7nwsRDFe70OuE4DYHVE/EHSr0O/RMlvXPMn
 W8AVtbdxL5fnHwq8h5P5tWrqQBxpQegCSe3oZJmHszPajMhoKucFRtDZJ
 UQDuCePIiL3xQja9s5SUR0h4EJpyol7cuvrOvvHx0fcWCiSCD8EAj1qj8
 LuXt+dy/ep4u9gUi0VOBgus7q67y63VtbVn4TFEDpdjFy3yfaDa1nBa1P
 CgH82WIpX/Br1SsI65hO58FBU/oPOFGNfetWu6IrxRN+A2AYKJD9Cj5yw Q==;
X-IronPort-AV: E=Sophos;i="5.88,389,1635177600"; d="scan'208";a="297822898"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Feb 2022 05:45:04 +0800
IronPort-SDR: r+E7d2rHZcQKCg15a/MwTtPc9sMoMmmpk/LNhhATAzotvozOX4IhYRg8Qif7/h/zuf9A+BRBoN
 3h3IE5KvjhM6f3fvyM0lQxBYIYAhjTzb85H9q4QEci8NviASIPuwm31zkylLe1oeXgR/erFmqV
 s/OcdjaFvPld9hGKsMerSiictf2qxDPVvwb/t9kKPBvePtRnPd67yedJWgxySs0e2E+qAjSq3P
 OMoutddaKrpdcN/yHbhhaqq+lRf/igJEB/ZDoIRVkPo63SpqjGo5v819AsdnVKkM1px0RmPZYk
 kN33T7YEROCRd1QVqeCsWivm
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 13:17:42 -0800
IronPort-SDR: 3bpxBfytzvsy31Y/09iJiEeJRoj4CMjfKhJPApSDX/rLXmGzzSxmTwGFsJRs3kF0p5D8czkxJ4
 KtB2pwinTZMqJvRloXhYiz3sCM/IpvzbrEevSfjWcEFcfAF4hBCDEni/GpY4hkgg3u4MES/VBg
 1TKujqeuQH0e0XUVCsEc5eeoymVDzUjXGyvujqghnHIN1gQCaiFDI4CObbRI0XKHe4hXk0IvAs
 vDm5cf5lpA8HtKhya0CjHIg0dSu5oQpIZB3e7OWZcVf4n0mR3YCxX8Mlpch+sWRDOMLnoZ5/la
 qVM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 13:45:05 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K3CPr0XbSz1SVnx
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 13:45:04 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1645566303; x=1648158304; bh=wl/+WSzCFoq5nO90BN
 6K5istP41jyA7U1JfB2b4EWHI=; b=S0y1J81EsYBjbimLDDFtxUzFy0jgMif3Hd
 cpZVC/vzPg8SLFUIvvJVMy7v4aWAfVqpzVs+ixK+zC2/ZpfFCT2Ts+qpMuYB7BSL
 czGfrTQme6owpEjvFWC1viCGn86OzFcrKvf/pyHTQAZsqLeUxRcIMiCJf3OBMylo
 /FfyCHneR+vgnmofRnK/7Y29r4N/rbydWkhbgG/BIvywseFjBFcimJZnNv1+/l+s
 gd8ta7ZVv97/M/y/yYbcrX5vCHYJhzT4NaByeq6VG0PE0WTtGsjMNU51+sYp7TqM
 niPJyd4jLVg1LVk/HeUpG+onhtbkg4R/6BifI48M1y+0da4C+QMQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id oRhseLhKZauf for <qemu-devel@nongnu.org>;
 Tue, 22 Feb 2022 13:45:03 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.99])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K3CPl0Yx3z1Rwrw;
 Tue, 22 Feb 2022 13:44:58 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH v1 2/2] riscv: opentitan: Connect opentitan SPI Host
Date: Wed, 23 Feb 2022 07:44:43 +1000
Message-Id: <20220222214443.4081039-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222214443.4081039-1-alistair.francis@opensource.wdc.com>
References: <20220222214443.4081039-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=045d7fed6=alistair.francis@opensource.wdc.com;
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

Conenct spi host[1/0] to opentitan.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/riscv/opentitan.c         | 42 ++++++++++++++++++++++++++++++++----
 include/hw/riscv/opentitan.h | 16 ++++++++++++--
 2 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index aec7cfa33f..abbe08d4d4 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -1,7 +1,7 @@
 /*
  * QEMU RISC-V Board Compatible with OpenTitan FPGA platform
  *
- * Copyright (c) 2020 Western Digital
+ * Copyright (c) 2022 Western Digital
  *
  * Provides a board compatible with the OpenTitan FPGA platform:
  *
@@ -34,13 +34,15 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x80000 },
     [IBEX_DEV_UART] =3D           {  0x40000000,  0x1000  },
     [IBEX_DEV_GPIO] =3D           {  0x40040000,  0x1000  },
-    [IBEX_DEV_SPI] =3D            {  0x40050000,  0x1000  },
+    [IBEX_DEV_SPI_DEVICE] =3D     {  0x40050000,  0x1000  },
     [IBEX_DEV_I2C] =3D            {  0x40080000,  0x1000  },
     [IBEX_DEV_PATTGEN] =3D        {  0x400e0000,  0x1000  },
     [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
     [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40110000,  0x1000  },
     [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x4000  },
     [IBEX_DEV_USBDEV] =3D         {  0x40150000,  0x1000  },
+    [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x1000  },
+    [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x1000  },
     [IBEX_DEV_PWRMGR] =3D         {  0x40400000,  0x1000  },
     [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x1000  },
     [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x1000  },
@@ -118,11 +120,18 @@ static void lowrisc_ibex_soc_init(Object *obj)
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
@@ -207,10 +216,35 @@ static void lowrisc_ibex_soc_realize(DeviceState *d=
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
-    create_unimplemented_device("riscv.lowrisc.ibex.spi",
-        memmap[IBEX_DEV_SPI].base, memmap[IBEX_DEV_SPI].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.spi_device",
+        memmap[IBEX_DEV_SPI_DEVICE].base, memmap[IBEX_DEV_SPI_DEVICE].si=
ze);
     create_unimplemented_device("riscv.lowrisc.ibex.i2c",
         memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index eac35ef590..3a3f412ef8 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -1,7 +1,7 @@
 /*
  * QEMU RISC-V Board Compatible with OpenTitan FPGA platform
  *
- * Copyright (c) 2020 Western Digital
+ * Copyright (c) 2022 Western Digital
  *
  * This program is free software; you can redistribute it and/or modify =
it
  * under the terms and conditions of the GNU General Public License,
@@ -23,11 +23,16 @@
 #include "hw/intc/sifive_plic.h"
 #include "hw/char/ibex_uart.h"
 #include "hw/timer/ibex_timer.h"
+#include "hw/ssi/ibex_spi_host.h"
 #include "qom/object.h"
=20
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
 OBJECT_DECLARE_SIMPLE_TYPE(LowRISCIbexSoCState, RISCV_IBEX_SOC)
=20
+#define OPENTITAN_NUM_SPI_HOSTS 2
+#define OPENTITAN_SPI_HOST0 0
+#define OPENTITAN_SPI_HOST1 1
+
 struct LowRISCIbexSoCState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -37,6 +42,7 @@ struct LowRISCIbexSoCState {
     SiFivePLICState plic;
     IbexUartState uart;
     IbexTimerState timer;
+    IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
=20
     MemoryRegion flash_mem;
     MemoryRegion rom;
@@ -57,8 +63,10 @@ enum {
     IBEX_DEV_FLASH,
     IBEX_DEV_FLASH_VIRTUAL,
     IBEX_DEV_UART,
+    IBEX_DEV_SPI_DEVICE,
+    IBEX_DEV_SPI_HOST0,
+    IBEX_DEV_SPI_HOST1,
     IBEX_DEV_GPIO,
-    IBEX_DEV_SPI,
     IBEX_DEV_I2C,
     IBEX_DEV_PATTGEN,
     IBEX_DEV_TIMER,
@@ -88,6 +96,10 @@ enum {
=20
 enum {
     IBEX_TIMER_TIMEREXPIRED0_0 =3D 126,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ =3D 153,
+    IBEX_SPI_HOST1_ERR_IRQ =3D 152,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ =3D 151,
+    IBEX_SPI_HOST0_ERR_IRQ =3D 150,
     IBEX_UART0_RX_PARITY_ERR_IRQ =3D 8,
     IBEX_UART0_RX_TIMEOUT_IRQ =3D 7,
     IBEX_UART0_RX_BREAK_ERR_IRQ =3D 6,
--=20
2.35.1


