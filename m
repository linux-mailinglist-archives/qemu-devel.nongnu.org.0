Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5B55F433
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 05:39:56 +0200 (CEST)
Received: from localhost ([::1]:40246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6OYV-0003ai-H2
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 23:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVQ-0007bo-H8; Tue, 28 Jun 2022 23:36:44 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVO-0006nz-Jm; Tue, 28 Jun 2022 23:36:44 -0400
Received: by mail-pj1-x1030.google.com with SMTP id l2so13233418pjf.1;
 Tue, 28 Jun 2022 20:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NXvhEiMTm4gtnwtl8PNzi7kh9fQPpkM3x9AxlrD9smk=;
 b=e0k3qOQcJwpJmDuL3zrJAexjwPLgS6E9FhcmEyCM9KgVzI7udlfqKVgM9jykY46bh3
 aH7PoxHluJorRqpI+AOgq2dXpAyj6UJ82HYtnxovqy1H2+xtQdCQNaUgvN47DeXAkQ/F
 z+3ggbJLkqcPrDCaRoc5D/7lTL7KsYvSG88dai/lXOw7l5d07zUsuXWV/oqabOzGOtmX
 5LKmvg5pIMjzSIE3MTTk6LVDYDfDTbylUEhmla8cyGsrgeOK0O4u65f7V2xI1dSLb/Fj
 ZuNtcMrY+EWe85kBvkFJvj3X+IQ8a9Z/f8G+HRJJw6+IPfcv/UJvAXf3yOKgVsq+0BcG
 J9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NXvhEiMTm4gtnwtl8PNzi7kh9fQPpkM3x9AxlrD9smk=;
 b=vr6dXy5rSUiP9vkmXUHMhy5uLNi3+EDpJNdYfjOm3VhZZ1R2/ZGJhj3uTGxPVdn/gD
 jHKqf4+jWO0YCh3qAkn45IZHItFBtIaDBhJ6qKBHkH0FSowX2lZg3U1Ehbrz48454l4S
 HbruaT3GqFBpg6niEPdlh2NaASoofCoLKTIcbUFpi1Vanwa6JsxRYPCtkhh2V7u1Xwiy
 5ze7TyrP2TB8yZUj+3FOWQIaR5L35k0IujLzb88xrA8W9s+kRUaCQR0x/rfq9ydhJuOU
 PvETKwtkNR5uTgPC405pB3u/rAnQttf24OG297dy8w5Xnw7BjpgfaV1HvmZZynmP+PdO
 i9XA==
X-Gm-Message-State: AJIora9mJRTFQ+BtaPk3TPdZ6uHEPaRzMIrzVe35/xUF3gPJRr8VPV0x
 iZkRgNUJeRLbz62wW572MtQ=
X-Google-Smtp-Source: AGRyM1uQblr7UrMgKBmh2zCbfC32WGIVHV5LkZJPqhHiTUByfcHSRPQEL15F0KrPOXy7/cJyzFLBRQ==
X-Received: by 2002:a17:903:40c9:b0:16a:2d26:5553 with SMTP id
 t9-20020a17090340c900b0016a2d265553mr8105522pld.31.1656473800944; 
 Tue, 28 Jun 2022 20:36:40 -0700 (PDT)
Received: from localhost (fwdproxy-prn-008.fbsv.net.
 [2a03:2880:ff:8::face:b00c]) by smtp.gmail.com with ESMTPSA id
 h13-20020a62b40d000000b00522d32a6a38sm10128831pfn.121.2022.06.28.20.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:40 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 06/13] hw/i2c/aspeed: add slave device in old register mode
Date: Tue, 28 Jun 2022 20:36:27 -0700
Message-Id: <20220629033634.3850922-7-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Klaus Jensen <k.jensen@samsung.com>

Add slave mode functionality for the Aspeed I2C controller in old
register mode. This is implemented by realizing an I2C slave device
owned by the I2C controller and attached to its own bus.

The I2C slave device only implements asynchronous sends on the bus, so
slaves not supporting that will not be able to communicate with it.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
[ clg: checkpatch fixes ]
Message-Id: <20220601210831.67259-6-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c         | 89 +++++++++++++++++++++++++++++++++----
 include/hw/i2c/aspeed_i2c.h |  8 ++++
 2 files changed, 88 insertions(+), 9 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index c153a1a942..8a8514586f 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -696,9 +696,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
     switch (offset) {
     case A_I2CD_FUN_CTRL:
         if (SHARED_FIELD_EX32(value, SLAVE_EN)) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                          __func__);
-            break;
+            i2c_slave_set_address(bus->slave, bus->regs[R_I2CD_DEV_ADDR]);
         }
         bus->regs[R_I2CD_FUN_CTRL] = value & 0x0071C3FF;
         break;
@@ -719,12 +717,15 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
             bus->controller->intr_status &= ~(1 << bus->id);
             qemu_irq_lower(aic->bus_get_irq(bus));
         }
-        if (handle_rx && (SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD,
-                                                  M_RX_CMD) ||
-                      SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD,
-                                              M_S_RX_CMD_LAST))) {
-            aspeed_i2c_handle_rx_cmd(bus);
-            aspeed_i2c_bus_raise_interrupt(bus);
+        if (handle_rx) {
+            if (SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD, M_RX_CMD) ||
+                SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD,
+                                        M_S_RX_CMD_LAST)) {
+                aspeed_i2c_handle_rx_cmd(bus);
+                aspeed_i2c_bus_raise_interrupt(bus);
+            } else if (aspeed_i2c_get_state(bus) == I2CD_STXD) {
+                i2c_ack(bus->bus);
+            }
         }
         break;
     case A_I2CD_DEV_ADDR:
@@ -1036,6 +1037,73 @@ static const TypeInfo aspeed_i2c_info = {
     .abstract   = true,
 };
 
+static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
+{
+    BusState *qbus = qdev_get_parent_bus(DEVICE(slave));
+    AspeedI2CBus *bus = ASPEED_I2C_BUS(qbus->parent);
+    uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
+    uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
+    uint32_t value;
+
+    switch (event) {
+    case I2C_START_SEND_ASYNC:
+        value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, value << 1);
+
+        ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
+
+        aspeed_i2c_set_state(bus, I2CD_STXD);
+
+        break;
+
+    case I2C_FINISH:
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, NORMAL_STOP, 1);
+
+        aspeed_i2c_set_state(bus, I2CD_IDLE);
+
+        break;
+
+    default:
+        return -1;
+    }
+
+    aspeed_i2c_bus_raise_interrupt(bus);
+
+    return 0;
+}
+
+static void aspeed_i2c_bus_slave_send_async(I2CSlave *slave, uint8_t data)
+{
+    BusState *qbus = qdev_get_parent_bus(DEVICE(slave));
+    AspeedI2CBus *bus = ASPEED_I2C_BUS(qbus->parent);
+    uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
+    uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
+
+    SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, data);
+    SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
+
+    aspeed_i2c_bus_raise_interrupt(bus);
+}
+
+static void aspeed_i2c_bus_slave_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
+
+    dc->desc = "Aspeed I2C Bus Slave";
+
+    sc->event = aspeed_i2c_bus_slave_event;
+    sc->send_async = aspeed_i2c_bus_slave_send_async;
+}
+
+static const TypeInfo aspeed_i2c_bus_slave_info = {
+    .name           = TYPE_ASPEED_I2C_BUS_SLAVE,
+    .parent         = TYPE_I2C_SLAVE,
+    .instance_size  = sizeof(AspeedI2CBusSlave),
+    .class_init     = aspeed_i2c_bus_slave_class_init,
+};
+
 static void aspeed_i2c_bus_reset(DeviceState *dev)
 {
     AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
@@ -1060,6 +1128,8 @@ static void aspeed_i2c_bus_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
     s->bus = i2c_init_bus(dev, name);
+    s->slave = i2c_slave_create_simple(s->bus, TYPE_ASPEED_I2C_BUS_SLAVE,
+                                       0xff);
 
     memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
                           s, name, aic->reg_size);
@@ -1219,6 +1289,7 @@ static const TypeInfo aspeed_1030_i2c_info = {
 static void aspeed_i2c_register_types(void)
 {
     type_register_static(&aspeed_i2c_bus_info);
+    type_register_static(&aspeed_i2c_bus_slave_info);
     type_register_static(&aspeed_i2c_info);
     type_register_static(&aspeed_2400_i2c_info);
     type_register_static(&aspeed_2500_i2c_info);
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 1398befc10..ba148b2f6d 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -223,6 +223,9 @@ struct AspeedI2CBus {
 
     struct AspeedI2CState *controller;
 
+    /* slave mode */
+    I2CSlave *slave;
+
     MemoryRegion mr;
 
     I2CBus *bus;
@@ -249,6 +252,11 @@ struct AspeedI2CState {
     AddressSpace dram_as;
 };
 
+#define TYPE_ASPEED_I2C_BUS_SLAVE "aspeed.i2c.slave"
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedI2CBusSlave, ASPEED_I2C_BUS_SLAVE)
+struct AspeedI2CBusSlave {
+    I2CSlave i2c;
+};
 
 struct AspeedI2CClass {
     SysBusDeviceClass parent_class;
-- 
2.30.2


