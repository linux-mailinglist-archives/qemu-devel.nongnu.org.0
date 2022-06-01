Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFFD53AE6F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 23:14:32 +0200 (CEST)
Received: from localhost ([::1]:41450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwVfi-0004BI-PI
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 17:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVaE-0000vR-Cm; Wed, 01 Jun 2022 17:08:50 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVaC-00023B-J9; Wed, 01 Jun 2022 17:08:50 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C48BE5C0189;
 Wed,  1 Jun 2022 17:08:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 01 Jun 2022 17:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654117727; x=
 1654204127; bh=32MG30NPQIOLOGllSPhwBfN4MhZO0P+vsJU93AjFWio=; b=g
 /VsnLoBPjd1zXrAa0oRXCZFfQtrDvhaOFc6BoKt/Cuancveu2DxZT65/udHq3Yat
 oG7m/zBbomJC6V2qFNzsEq+//w4YfPtdsYnDx8LY+nGmM1mD5ncdZF38lSVR71q7
 +8xSQ2zDdUkjVjCJj5ElKErqAWxmRhfthgJCfDVShU4hanPKEEE/CLJ7tTGtYAkz
 KdRH8/dl6XobnQIMH2BhBc9mAeyNL9LZQGchYKzzwWwDB0WXCD9WlFnZ8fSmH4Hw
 wBk9LYvIluJeiLLUGl2X4pPccL/LkWGm+fPa3QOlGs3lpaclgSzCMZcKD0Fs+eeP
 lM/CsUZwv97m1nJdP+Vpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654117727; x=1654204127; bh=32MG30NPQIOLO
 GllSPhwBfN4MhZO0P+vsJU93AjFWio=; b=uBLHB19sSIhBUzqkU5P8C38jQ2QgF
 gzMySXMnijV1nDWQy9Yj0sOw5eDLd0hzx+mH3yEZn28nFNLR51u2CVOg6XeDJuUv
 MuevGw1mL/r5uPfnLwlrkriBef4CGjp1eJDwF5fEiEmjR1y/wLv8A+9j0MFWELts
 fJR9ltI31Ch5uyYfRPqytxfEtZq55zodhvme1ggNCJ/nBAUmXHBcNFc8F3t/r5/Q
 HFncs6e/9ltAXP28I4H9M+cfdr/WXPrku+EBamdrturPYGW/b0mmKxNO5xCoEWBD
 KVx/ZVGr2jlgiA/eLN/ddmbo+4/T1dYKrR4rcwsEUtXyxmNarDZFS7SxQ==
X-ME-Sender: <xms:X9WXYhvsRzb3DRtRQKJERQdwNOMbSZhTLD5ta8fmjMvUftCBtKL1lw>
 <xme:X9WXYqflmRUV8H4NZbyA7bwV58SjSgGfQJqIBD0sD1mwBBuYkbJZO-7DOwZrDZcHU
 jnLaIURGUfG4BDXhQU>
X-ME-Received: <xmr:X9WXYkwqL_Zqbzg3w41IicRNhGMY0WvgRyUZ3-MiJjA_Yt06jFGyb904oN_dT22Dd_595MIHt111XMjaMtm4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledtgdduheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:X9WXYoO2CF0N3orW1K0nH39RFlRn1CSeiPuMmi-GU0xa3vUwkEPwnQ>
 <xmx:X9WXYh8st4cMRBCweGXdEHmlotVzZ_rEBpp6xOcXVtTNbzSn6-HLKw>
 <xmx:X9WXYoU_HGo_B1iRbFdAVBFAs4XGJUJ2hGvJcaGpJyXkd_9wuwnlrg>
 <xmx:X9WXYoU9hRCJT1VJvsh6eiX5etbYNevzw4q7SwLZOg3PjyP7yO8r7Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jun 2022 17:08:45 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-arm@nongnu.org,
 Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [RFC PATCH v2 5/6] hw/i2c/aspeed: add slave device in old register
 mode
Date: Wed,  1 Jun 2022 23:08:30 +0200
Message-Id: <20220601210831.67259-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601210831.67259-1-its@irrelevant.dk>
References: <20220601210831.67259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
---
 hw/i2c/aspeed_i2c.c         | 94 +++++++++++++++++++++++++++++++++----
 include/hw/i2c/aspeed_i2c.h |  8 ++++
 2 files changed, 92 insertions(+), 10 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 5a7eb5579b01..5904d5567bd2 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -33,7 +33,7 @@
 #include "trace.h"
 
 #define ASPEED_I2C_TRACE_INTR_TEMPLATE \
-    "pktdone|nak|ack|done|normal|abnormal|"
+    "pktdone|nak|ack|done|slave-match|normal|abnormal|"
 
 static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
 {
@@ -68,6 +68,10 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
             pstrcat(buf, BUF_SIZE, "done|");
         }
 
+        if (ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH)) {
+            pstrcat(buf, BUF_SIZE, "slave-match|");
+        }
+
         if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP)) {
             pstrcat(buf, BUF_SIZE, "normal|");
         }
@@ -710,9 +714,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
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
@@ -733,12 +735,14 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
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
+                SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD, M_S_RX_CMD_LAST)) {
+                aspeed_i2c_handle_rx_cmd(bus);
+                aspeed_i2c_bus_raise_interrupt(bus);
+            } else if (aspeed_i2c_get_state(bus) == I2CD_STXD) {
+                i2c_ack(bus->bus);
+            }
         }
         break;
     case A_I2CD_DEV_ADDR:
@@ -1054,6 +1058,73 @@ static const TypeInfo aspeed_i2c_info = {
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
@@ -1084,6 +1155,8 @@ static void aspeed_i2c_bus_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
     s->bus = i2c_init_bus(dev, name);
+    s->slave = i2c_slave_create_simple(s->bus, TYPE_ASPEED_I2C_BUS_SLAVE,
+                                       0xff);
 
     memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
                           s, name, aic->reg_size);
@@ -1243,6 +1316,7 @@ static const TypeInfo aspeed_1030_i2c_info = {
 static void aspeed_i2c_register_types(void)
 {
     type_register_static(&aspeed_i2c_bus_info);
+    type_register_static(&aspeed_i2c_bus_slave_info);
     type_register_static(&aspeed_i2c_info);
     type_register_static(&aspeed_2400_i2c_info);
     type_register_static(&aspeed_2500_i2c_info);
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 03fe829a3a57..9e88f086131a 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -223,6 +223,9 @@ struct AspeedI2CBus {
 
     struct AspeedI2CState *controller;
 
+    /* slave mode */
+    I2CSlave *slave;
+
     MemoryRegion mr;
 
     I2CBus *bus;
@@ -251,6 +254,11 @@ struct AspeedI2CState {
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
2.36.1


