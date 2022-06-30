Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC70556106A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 06:58:26 +0200 (CEST)
Received: from localhost ([::1]:47548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mG1-0003BZ-TW
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 00:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9q-0002x5-Oh; Thu, 30 Jun 2022 00:52:02 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:59591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9m-0006zQ-0v; Thu, 30 Jun 2022 00:52:02 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A816B2B058DA;
 Thu, 30 Jun 2022 00:51:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 30 Jun 2022 00:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656564715; x=
 1656568315; bh=UmREOY/aUFrB+A+AP2hqRaG2Pb3TmYIqU01UHavr8Jo=; b=L
 EC30/hyupEruLjCiBatMdJVFNF5a5hrD2fdkUaVq/tr9Q5uu1zULhRpYtSMfxsRk
 oBCu8ORSbaQi0sVcLq4mHJ+mciKKqTkwS5UNkSbG3lkXcdOb776666QX6l15zVcM
 bry8kxo1eurCTCWaf6aaxSQBIeFj+zG/NTvuU7Nkf6GvVGIwewSGk8ZQQjqeUQta
 krpCVbm5igvE2W9dIB6DiDSx93qHOB6yQrMFgzOlvJ7AIPfLIEQTayrHEhrOw0k0
 FsxE3IKXgG7/uR0kTdiVUTkuP3fG7QxpIYDX8pBPMOQKj8tXNMUCBN4q7xk1Sxd5
 kuX1XD2tLDOCQT8IStXPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656564715; x=1656568315; bh=UmREOY/aUFrB+A+AP2hqRaG2Pb3TmYIqU01
 UHavr8Jo=; b=khuCR54DQ1bOKnP+uY+tvjw+67nCWKcNExVO97K7mMjaySV8h/j
 MRoDZgwzanFYv31Z4jrcHLpQQu6lsQxhXS5EdxOYzeuIS0K/aeNxbiqFLdF5aIB0
 J12AKYdbrYLXtNxnOaUHtlXGJh+b8LYN3zcwgmbSGn6mJAqzkrBeCFy3e9LDrR4x
 lqm75PS9twvDGPYmCh+KIkp1rkDDnjPodFXq1B2ZEalVh98F8v02q4vC/S+8X85N
 U7fOnAyIIUprOI+HgT0Z3VEOQnnHRZLfBoJ5gC8L3VHzyMsCe5666iiw55nZhjrO
 aSa9T1Bq45dB7QMQgWhKCHvg8aC+MkLeGMQ==
X-ME-Sender: <xms:6iu9YlUuUOO7NSrgpUytpvZQoSEKvD-tzgaw4iBQK9RxQYPazLBC4A>
 <xme:6iu9Ylk0Fof4zePqcTKIiSazu9H5AR6Ju0j88rxEcewUniHqzHXyg2DmviOjwbPje
 igvzr7DGz0UmaFBbxw>
X-ME-Received: <xmr:6iu9YhaY6N6hDrWCPeyfA68M_criM4rESkolYNQPjFTpst09gJgzvgNiW603F7-vfqEhDD6i3f3A9AXE7zDvcBeQkBQL-p5a>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefr
 vghtvghrucffvghlvghvohhrhigrshcuoehmvgesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepffevudejfeehteegkedtieelhfffvefgleelveejledvvdehfeduudefteek
 vedunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 gvsehpjhgurdguvghv
X-ME-Proxy: <xmx:6iu9YoXx125MAH95cqUKn5qECTvih-tKrYfAg5gsGwDSmZJE0JVRLw>
 <xmx:6iu9YvkXz22NxCPPPR8if9egorlnSPF6vzusu3uIcDc43eVd4rFpyQ>
 <xmx:6iu9YleHKVkOLHIh0ZqO-lwXdZ8QjxabXYCUgd_bY1FQNzxTgdRLlg>
 <xmx:6yu9Yh6y5cv1K-GNO5NRwloV-aVWT6LGDq7K0GXrn8MK5rd3swl9nhCSb20>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:51:54 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 06/14] hw/i2c/aspeed: add slave device in old register mode
Date: Wed, 29 Jun 2022 21:51:25 -0700
Message-Id: <20220630045133.32251-7-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
2.37.0


