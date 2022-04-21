Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0A5509804
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:52:38 +0200 (CEST)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQg9-0001LF-2q
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQR0-0004oF-AG
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:36:58 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQQy-0007vC-8i
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523016; x=1682059016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZgC2XGZNz9GOqFHwEiweZQEoaeQwoAuD6cvXgf97ucI=;
 b=Lffn0byPWYKa2vxw/dhf080T54t9ZPkYKO2tmIEK2y4pfQtuKslxdePu
 5hiMICQub3FuGI7o6DnjyzE0133whr+7N7odGd+HkcYYRAMod0IMg1ZXm
 7bg08ln60Tz3S+rnWNUl0WKpDubAZOwAriJ/21FeIifDtH2Q+t6K2PO6Q
 tmKhA4jL3Cc9hfBev+ARKNnURlxWOHfTeyD8bggdr4Ar+i5BkoxRN/gDQ
 537O+NbsmuLyywVDyIhuAUK3gEDb3Z0UL9i+CVRvglNB1aUPRkkGSMomH
 uHAAaw4YM7Sc6/V2mDme017b3H8rcagf/AcuZ6vxO8QvwPvnjaYwRn+SZ A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639924"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:36:55 +0800
IronPort-SDR: qGTA5uu/FdYHfVAZr5mlSgl7crnQlrbAAOYwO6u9pWrVHB5FkeNiDWVO+6WDGzkolH3kL+xz1j
 ZjBiDFmN/u8RcNGdMwLNDPf5Kv93zxPMqB1UaU8V/389AtXQ9rkwXmAmOhP76TxSj1I0aLUhlU
 ZKOzlZ4srUpumUJmHi38frnPXALgcGkpdvh0FDyrFrqrEDn6JzkqgnLbcCVl1uXBcZ4ZJWNvN7
 Kx/py0Ztc55bfHE/NR1z1r4vwpQb4f6W+s9e3SFarMo0A4/NZojPsSVOhpUQxH5nQX48scNePZ
 a/SckR1v1yJTGi3sjl+1k92D
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:07:57 -0700
IronPort-SDR: RQT9jL0Yj/vj5cJ+RCe61MVJvZ8S3pSVTKB5XgWRA8AJr2rf/6XF8pqZhC4OvpsP+UP1XJz16L
 bD79bCvZHEHI9izNt3PwgKzPJ8y8V70b36mKwt2gJhrP3ue+fMOMxcH4nCwRpRGVU6G8olOBS+
 FZ7BrRl5cN5FGJ4tnKXyhg6XYuGnLYAd5Spo5k3IPaeqVihedFuMlnY9w+kw3QUJiiZzKMMTuj
 pzwBCH/UEI2wMUnLmHF9xXiNklOqzwRtP5r4A0wmqqL0FVRy1ep/3sm9YEGWJKxv6UPEl8+tVx
 wmQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:36:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWB5lJ1z1SVnx
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:36:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1650523014; x=1653115015; bh=ZgC2XGZ
 Nz9GOqFHwEiweZQEoaeQwoAuD6cvXgf97ucI=; b=h+LlDoQcFabKG5J2JJHBI/S
 hZl15DsUZ+Gkh/ZeLxe+aDWS89HJekypZ2RALeoAtkN32ajVF5i9ft73s9KAO1E2
 WmpHZnvQLzJbYqHutQ8D+d00owog2mr7rIeq7rl8QOtx11X53+aU5pT6QAsGPex4
 h0mfllANCuKzOCFzJyZSLArkwQrvAQrP+7yocwKZMYdLx4bVqmOvKJiKLry3LHwt
 3gyJsL1gvHJVk1V7R22RE6UtFdVay1DZK9pnOTk8lbPiYE1lcy0KraDJDvCWjOy4
 QbPL6c7BZqVzBZO22Hik9ehbeB6hnfWmeL5DR77SqTV24g9BcpYwjw7KZ6X9b1g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YvMJqPtyENcK for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:36:54 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSW76hFyz1Rvlx;
 Wed, 20 Apr 2022 23:36:51 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 02/31] riscv: opentitan: Connect opentitan SPI Host
Date: Thu, 21 Apr 2022 16:36:01 +1000
Message-Id: <20220421063630.1033608-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


