Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0DE3B2E88
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:04:16 +0200 (CEST)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwO5e-0006TK-Vm
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3z-0003f8-0G
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:31 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:53600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3w-0003qt-QO
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624536149; x=1656072149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wTSMQcxrzoNLuvbpTokHxXESlCREDyWr7/06oIRidGM=;
 b=U5R1O6h/DKtzPnFOZkXGuwM38OLFStl7OrcKMZEcVZRzF8fCL6JLbt6s
 cJtB/2r9z80sVg4W+FHA3kYtQCtXJ5or2I9mee1tKB9LhaqyxWq7UdPBt
 4wuUJgbjguMwf7uSJwjRykQpHCjyGhqUfKJFdsg8jhH1H+4OpRQvwp6CZ
 hyLluqWcXbUpn0DLXmmmcp77wR0MF30+0Cx503YuQG/qaqGW3YQIR0Cp3
 gOWw/t0Q45PAxBIiFtiF2p3vxyKBsqTZYDxxWTssd6xfQ74Rq7bAGIU4Z
 F14LXz/aAEJcq9PT1QnDqFgUYd24r4HQUWWjiXaGflZ/PTEWgIweq3KeZ g==;
IronPort-SDR: nnJ3utGx4CcGUx0Qeky2NrIqGiZfZVNF9S5vt35Q6lnZoih9koSvQO3pqjW/zJnQrBgX/VHcd8
 FSZwGTCC+SGZYPypMqRDaR8K+EmfNHU0T67NKw+VqVg5+08HS66yhchcN+I0VzZRG/XEQr0x/O
 e80lpU+UZeF5WERiG+4hxUo3aym9yMfoohrkognadg7TY3ADOpS9ViAr68Pfe17FS6zF7dgM/v
 DYJJC3Ss9CE3nekXe+SaZgW32tx5vjNcCMzC/bBy3rd127gjHe7izJnUxzJhnhpfQFXj9t9mAW
 cRE=
X-IronPort-AV: E=Sophos;i="5.83,296,1616428800"; d="scan'208";a="173360802"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2021 20:02:15 +0800
IronPort-SDR: HFSQEv3ohOPjw+kq1O4IwM6GY5PZcPOU6H7D6kenRq6Hl2/uX5GBkxc7yj8IYXZGNB0ffcX907
 +HsWih5pdf9jXJyugEwoc9xFW+nNQVUKcMBWnca+7nWWTs71/1bfwgp3FiU+UXbAGR2K0NmlnS
 UUhuV0ZUmd6CGYBXR39GEjYhdeDRuEQgtTbreEZTPvEsV9bEJIBRchOL/GEYYoE7mzQCxVJgDG
 +miHa2pUHbu7QXi8lXksHfZ0Z+/YsxhaJLlk9Q7r0Kq27yKJ/Aum5aN1uDlMh4yjeU7Moj9KPn
 5/+JZcLAzCHN0D2lEpEtGcX0
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 04:39:31 -0700
IronPort-SDR: yYwIZJUQ7eZ8VXTBFSnOK1NuXSVYUWyVRmO7nWCfhvpkpXX422Nqemh+BCkE/GkbfMDiwNWRgm
 PQCxqnnm+WrzkvdKZiNYrEUDTT3nikFi+XNrSs7dz75nbjbJXlw6t/SHZZsBpf/o7qplgYmrwS
 3e5ErQl9UHMu3woI8w2lwFYsXlQrI1VqIkrbkekJRnBy25l72Aq5Xdn28zXQUV06KxGRY8Rl4h
 K183e9V7QsmqNWWcK2n6JWfu2JbL5jU0+u4eqWDmILkqNFr7ysdBtruPS1+ABRxNuJozF63YNW
 mKM=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Jun 2021 05:02:16 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 4/7] hw/char: QOMify sifive_uart
Date: Thu, 24 Jun 2021 05:02:08 -0700
Message-Id: <20210624120211.85499-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624120211.85499-1-alistair.francis@wdc.com>
References: <20210624120211.85499-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=802348aeb=alistair.francis@wdc.com;
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Jünger <lukas.juenger@greensocs.com>

This QOMifies the SiFive UART model. Migration and reset have been
implemented.

Signed-off-by: Lukas Jünger <lukas.juenger@greensocs.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210616092326.59639-3-lukas.juenger@greensocs.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/sifive_uart.h |  11 ++--
 hw/char/sifive_uart.c         | 114 +++++++++++++++++++++++++++++++---
 2 files changed, 109 insertions(+), 16 deletions(-)

diff --git a/include/hw/char/sifive_uart.h b/include/hw/char/sifive_uart.h
index 3e962be659..7f6c79f8bd 100644
--- a/include/hw/char/sifive_uart.h
+++ b/include/hw/char/sifive_uart.h
@@ -21,6 +21,7 @@
 #define HW_SIFIVE_UART_H
 
 #include "chardev/char-fe.h"
+#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
@@ -49,12 +50,10 @@ enum {
 
 #define SIFIVE_UART_GET_TXCNT(txctrl)   ((txctrl >> 16) & 0x7)
 #define SIFIVE_UART_GET_RXCNT(rxctrl)   ((rxctrl >> 16) & 0x7)
+#define SIFIVE_UART_RX_FIFO_SIZE 8
 
 #define TYPE_SIFIVE_UART "riscv.sifive.uart"
-
-typedef struct SiFiveUARTState SiFiveUARTState;
-DECLARE_INSTANCE_CHECKER(SiFiveUARTState, SIFIVE_UART,
-                         TYPE_SIFIVE_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveUARTState, SIFIVE_UART)
 
 struct SiFiveUARTState {
     /*< private >*/
@@ -64,8 +63,8 @@ struct SiFiveUARTState {
     qemu_irq irq;
     MemoryRegion mmio;
     CharBackend chr;
-    uint8_t rx_fifo[8];
-    unsigned int rx_fifo_len;
+    uint8_t rx_fifo[SIFIVE_UART_RX_FIFO_SIZE];
+    uint8_t rx_fifo_len;
     uint32_t ie;
     uint32_t ip;
     uint32_t txctrl;
diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index 5df8212961..278e21c434 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -19,10 +19,12 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
+#include "migration/vmstate.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
 #include "hw/irq.h"
 #include "hw/char/sifive_uart.h"
+#include "hw/qdev-properties-system.h"
 
 /*
  * Not yet implemented:
@@ -175,20 +177,112 @@ static int sifive_uart_be_change(void *opaque)
     return 0;
 }
 
+static Property sifive_uart_properties[] = {
+    DEFINE_PROP_CHR("chardev", SiFiveUARTState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sifive_uart_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    SiFiveUARTState *s = SIFIVE_UART(obj);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_uart_ops, s,
+                          TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
+    sysbus_init_mmio(sbd, &s->mmio);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void sifive_uart_realize(DeviceState *dev, Error **errp)
+{
+    SiFiveUARTState *s = SIFIVE_UART(dev);
+
+    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
+                             sifive_uart_event, sifive_uart_be_change, s,
+                             NULL, true);
+
+}
+
+static void sifive_uart_reset_enter(Object *obj, ResetType type)
+{
+    SiFiveUARTState *s = SIFIVE_UART(obj);
+    s->ie = 0;
+    s->ip = 0;
+    s->txctrl = 0;
+    s->rxctrl = 0;
+    s->div = 0;
+    s->rx_fifo_len = 0;
+}
+
+static void sifive_uart_reset_hold(Object *obj)
+{
+    SiFiveUARTState *s = SIFIVE_UART(obj);
+    qemu_irq_lower(s->irq);
+}
+
+static const VMStateDescription vmstate_sifive_uart = {
+    .name = TYPE_SIFIVE_UART,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(rx_fifo, SiFiveUARTState,
+                            SIFIVE_UART_RX_FIFO_SIZE),
+        VMSTATE_UINT8(rx_fifo_len, SiFiveUARTState),
+        VMSTATE_UINT32(ie, SiFiveUARTState),
+        VMSTATE_UINT32(ip, SiFiveUARTState),
+        VMSTATE_UINT32(txctrl, SiFiveUARTState),
+        VMSTATE_UINT32(rxctrl, SiFiveUARTState),
+        VMSTATE_UINT32(div, SiFiveUARTState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+
+static void sifive_uart_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
+
+    dc->realize = sifive_uart_realize;
+    dc->vmsd = &vmstate_sifive_uart;
+    rc->phases.enter = sifive_uart_reset_enter;
+    rc->phases.hold  = sifive_uart_reset_hold;
+    device_class_set_props(dc, sifive_uart_properties);
+}
+
+static const TypeInfo sifive_uart_info = {
+    .name          = TYPE_SIFIVE_UART,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SiFiveUARTState),
+    .instance_init = sifive_uart_init,
+    .class_init    = sifive_uart_class_init,
+};
+
+static void sifive_uart_register_types(void)
+{
+    type_register_static(&sifive_uart_info);
+}
+
+type_init(sifive_uart_register_types)
+
 /*
  * Create UART device.
  */
 SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
     Chardev *chr, qemu_irq irq)
 {
-    SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
-    s->irq = irq;
-    qemu_chr_fe_init(&s->chr, chr, &error_abort);
-    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
-                             sifive_uart_event, sifive_uart_be_change, s,
-                             NULL, true);
-    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
-                          TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
-    memory_region_add_subregion(address_space, base, &s->mmio);
-    return s;
+    DeviceState *dev;
+    SysBusDevice *s;
+    SiFiveUARTState *r;
+
+    dev = qdev_new("riscv.sifive.uart");
+    s = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", chr);
+    sysbus_realize_and_unref(s, &error_fatal);
+    memory_region_add_subregion(address_space, base,
+                                sysbus_mmio_get_region(s, 0));
+    sysbus_connect_irq(s, 0, irq);
+
+    r = SIFIVE_UART(dev);
+    return r;
 }
-- 
2.31.1


