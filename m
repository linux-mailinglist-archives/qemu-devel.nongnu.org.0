Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CE14EDF70
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:15:24 +0200 (CEST)
Received: from localhost ([::1]:50402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZyOJ-0006hW-3F
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:15:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nZy7R-0000f9-U8; Thu, 31 Mar 2022 12:57:57 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:54843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nZy7P-0000uX-QR; Thu, 31 Mar 2022 12:57:57 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 9DC6D3201F8B;
 Thu, 31 Mar 2022 12:57:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 31 Mar 2022 12:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=JVRG2cvJfMysYr
 N5Gr28SQd9WP9ebYIs3e8XYSuZ/vg=; b=AtXTb6HH967BNdBvqpl8kIXrNbnmGD
 K6jo5bukiKndZEekm/lT2hd2Q2B65bUYCcSZ7lGnd3O3ztnvLuBcYHcINta/GdZI
 e3CgEsaSuM1HgAipFmCZOD9RzcPLN6rwaMBbpnDV/cbbDNyJkrOY+xnfa9Ust+wl
 l1OPSmWXk3tMQg711upzq8DkMMlnlRhQyL+6KeU9Zt9YwpGsdBfsM4+nsm07pxgt
 utNeKoFaaLXRzZR9MM1QBGPxG9ew9747Tq1V6xVuu0QuTMe//CFPkwJa4SBdALZx
 sl47ecLiTJCU3fB2Kc45m2qg1K8KuVa1/s1N6Jmgk038d4Obvotm51aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JVRG2c
 vJfMysYrN5Gr28SQd9WP9ebYIs3e8XYSuZ/vg=; b=BaERtq/XXnOjxgCFPxNY6p
 rVQAa4Pm7RMDR7a/NLXPw+2dM2YpESLvJXPa9wt0MzPfuWzcKO/OpA5q+PqDYbz+
 jcgS7SOJ5rK0z9F5GAyhIiIm6E3jYgF+9gsbQY8JsJLWOeaMxtHEIuBVu+i/m1bH
 jp2wgLUpMafip4gHyKu6e2XXT9EMmvFlF7n6uOHujIdpoc/xwVLD4SlBWMe3TogT
 A/M+3kouxAX98owdfzthZHQ4ANOM6E1X2hJk9xGKZM40ZlCkg86b/GbYXSmW4mWd
 956YMjhWkzIiIBpFq0yza7tP0NcG9Ma7ATJViGhZdQpqbwU2Jlm3QdsjntatA5ag
 ==
X-ME-Sender: <xms:kd1FYmMdB50zceaBVbUhL7tHKzWQwg_S7yo-gSAYuPa8Tr5J_IN06A>
 <xme:kd1FYk-RqHmdU2N-8VILY18z67NTHpmAilItrrLXdBBBT9glLKmORsIB2UpAXGhCg
 FTHdK4kkV7col6CpXM>
X-ME-Received: <xmr:kd1FYtQwh629q_BBRF8Xq1gsrXUh-M6g_QrP4ilcFn7bLec75ZokieW3zFJVN_QvdVk2XbAHjNolvakK2b4Urw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:kd1FYmuuwXhEvHH1sr0ZyX6oDPm5MBSSkkgcRN5gGAjtNq45DRV1QQ>
 <xmx:kd1FYucpEz6JnxvjbWqb_Ui86dhRppEKxkBDg8PetDXNA-rMKThDJQ>
 <xmx:kd1FYq39qBk6NXaEYgy6mllsGP2mL-LhctywduHzYQCTYid38iLkMQ>
 <xmx:kd1FYvUDRBarN6g209ED3nOy2RIaH12-FPCSx7oFpBYzsHLE9eb_uw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 12:57:51 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/4] hw/i2c: add slave mode for aspeed_i2c
Date: Thu, 31 Mar 2022 18:57:36 +0200
Message-Id: <20220331165737.1073520-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331165737.1073520-1-its@irrelevant.dk>
References: <20220331165737.1073520-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add slave mode functionality for the Aspeed I2C controller. This is
implemented by creating an Aspeed I2C Slave device that attaches to the
bus.

This i2c slave device only implements the asynchronous version of
i2c_send() and the event callback.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/i2c/aspeed_i2c.c         | 95 +++++++++++++++++++++++++++++++++----
 hw/i2c/trace-events         |  2 +-
 hw/misc/meson.build         |  2 +
 include/hw/i2c/aspeed_i2c.h |  8 ++++
 4 files changed, 97 insertions(+), 10 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 03a4f5a91010..61b6424434f7 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -163,10 +163,15 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
           bus->intr_status & I2CD_INTR_TX_NAK ? "nak|" : "",
           bus->intr_status & I2CD_INTR_TX_ACK ? "ack|" : "",
           bus->intr_status & I2CD_INTR_RX_DONE ? "done|" : "",
+          bus->intr_status & I2CD_INTR_SLAVE_ADDR_RX_MATCH ? "slave-match|" : "",
           bus->intr_status & I2CD_INTR_NORMAL_STOP ? "normal|" : "",
           bus->intr_status & I2CD_INTR_ABNORMAL ? "abnormal" : "");
 
-    bus->intr_status &= bus->intr_ctrl;
+    /*
+     * WORKAROUND: the Linux Aspeed I2C driver masks SLAVE_ADDR_RX_MATCH for
+     * some reason, not sure if it is a bug...
+     */
+    bus->intr_status &= (bus->intr_ctrl | I2CD_INTR_SLAVE_ADDR_RX_MATCH);
     if (bus->intr_status) {
         bus->controller->intr_status |= 1 << bus->id;
         qemu_irq_raise(aic->bus_get_irq(bus));
@@ -196,6 +201,9 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
     case I2CD_INTR_STS_REG:
         value = bus->intr_status;
         break;
+    case I2CD_DEV_ADDR_REG:
+        value = bus->dev_addr;
+        break;
     case I2CD_POOL_CTRL_REG:
         value = bus->pool_ctrl;
         break;
@@ -535,10 +543,9 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
     switch (offset) {
     case I2CD_FUN_CTRL_REG:
         if (value & I2CD_SLAVE_EN) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                          __func__);
-            break;
+            i2c_slave_set_address(&bus->slave->i2c, bus->dev_addr);
         }
+
         bus->ctrl = value & 0x0071C3FF;
         break;
     case I2CD_AC_TIMING_REG1:
@@ -558,14 +565,19 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
             bus->controller->intr_status &= ~(1 << bus->id);
             qemu_irq_lower(aic->bus_get_irq(bus));
         }
-        if (handle_rx && (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST))) {
-            aspeed_i2c_handle_rx_cmd(bus);
-            aspeed_i2c_bus_raise_interrupt(bus);
+
+        if (handle_rx) {
+            if (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) {
+                aspeed_i2c_handle_rx_cmd(bus);
+                aspeed_i2c_bus_raise_interrupt(bus);
+            } else if (aspeed_i2c_get_state(bus) == I2CD_STXD) {
+                i2c_ack(bus->bus);
+            }
         }
+
         break;
     case I2CD_DEV_ADDR_REG:
-        qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                      __func__);
+        bus->dev_addr = value;
         break;
     case I2CD_POOL_CTRL_REG:
         bus->pool_ctrl &= ~0xffffff;
@@ -852,12 +864,74 @@ static const TypeInfo aspeed_i2c_info = {
     .abstract   = true,
 };
 
+static int aspeed_i2c_slave_event(I2CSlave *slave, enum i2c_event event)
+{
+    AspeedI2CSlave *s = ASPEED_I2C_SLAVE(slave);
+    AspeedI2CBus *bus = s->bus;
+
+    switch (event) {
+    case I2C_START_SEND:
+        bus->buf = bus->dev_addr << 1;
+
+        bus->buf &= I2CD_BYTE_BUF_RX_MASK;
+        bus->buf <<= I2CD_BYTE_BUF_RX_SHIFT;
+
+        bus->intr_status |= (I2CD_INTR_SLAVE_ADDR_RX_MATCH | I2CD_INTR_RX_DONE);
+        aspeed_i2c_set_state(bus, I2CD_STXD);
+
+        break;
+
+    case I2C_FINISH:
+        bus->intr_status |= I2CD_INTR_NORMAL_STOP;
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
+static void aspeed_i2c_slave_send_async(I2CSlave *slave, uint8_t data)
+{
+    AspeedI2CSlave *s = ASPEED_I2C_SLAVE(slave);
+    AspeedI2CBus *bus = s->bus;
+
+    bus->buf = (data & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_SHIFT;
+    bus->intr_status |= I2CD_INTR_RX_DONE;
+
+    aspeed_i2c_bus_raise_interrupt(bus);
+}
+
+static void aspeed_i2c_slave_class_init(ObjectClass *klass, void *Data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
+
+    dc->desc = "Aspeed I2C Bus Slave";
+
+    sc->event = aspeed_i2c_slave_event;
+    sc->send_async = aspeed_i2c_slave_send_async;
+}
+
+static const TypeInfo aspeed_i2c_slave_info = {
+    .name          = TYPE_ASPEED_I2C_SLAVE,
+    .parent        = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(AspeedI2CSlave),
+    .class_init    = aspeed_i2c_slave_class_init,
+};
+
 static void aspeed_i2c_bus_reset(DeviceState *dev)
 {
     AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
 
     s->intr_ctrl = 0;
     s->intr_status = 0;
+    s->dev_addr = 0;
     s->cmd = 0;
     s->buf = 0;
     s->dma_addr = 0;
@@ -881,6 +955,8 @@ static void aspeed_i2c_bus_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
     s->bus = i2c_init_bus(dev, name);
+    s->slave = ASPEED_I2C_SLAVE(i2c_slave_create_simple(s->bus, TYPE_ASPEED_I2C_SLAVE, 0xff));
+    s->slave->bus = s;
 
     memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
                           s, name, aic->reg_size);
@@ -1016,6 +1092,7 @@ static const TypeInfo aspeed_2600_i2c_info = {
 static void aspeed_i2c_register_types(void)
 {
     type_register_static(&aspeed_i2c_bus_info);
+    type_register_static(&aspeed_i2c_slave_info);
     type_register_static(&aspeed_i2c_info);
     type_register_static(&aspeed_2400_i2c_info);
     type_register_static(&aspeed_2500_i2c_info);
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 7d8907c1eede..85e4bddff936 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -9,7 +9,7 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
 # aspeed_i2c.c
 
 aspeed_i2c_bus_cmd(uint32_t cmd, const char *cmd_flags, uint32_t count, uint32_t intr_status) "handling cmd=0x%x %s count=%d intr=0x%x"
-aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5) "handled intr=0x%x %s%s%s%s%s"
+aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5, const char *str6) "handled intr=0x%x %s%s%s%s%s%s"
 aspeed_i2c_bus_read(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
 aspeed_i2c_bus_write(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
 aspeed_i2c_bus_send(const char *mode, int i, int count, uint8_t byte) "%s send %d/%d 0x%02x"
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 6fb69612e064..c1c1abea41dd 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -122,6 +122,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
 
 softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
 
+softmmu_ss.add(when: 'CONFIG_I2C', if_true: files('i2c-echo.c'))
+
 specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
 
 specific_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 4b9be09274c7..3f1a9c07a00b 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -42,6 +42,7 @@ struct AspeedI2CBus {
     SysBusDevice parent_obj;
 
     struct AspeedI2CState *controller;
+    struct AspeedI2CSlave *slave;
 
     MemoryRegion mr;
 
@@ -53,6 +54,7 @@ struct AspeedI2CBus {
     uint32_t timing[2];
     uint32_t intr_ctrl;
     uint32_t intr_status;
+    uint32_t dev_addr;
     uint32_t cmd;
     uint32_t buf;
     uint32_t pool_ctrl;
@@ -76,6 +78,12 @@ struct AspeedI2CState {
     AddressSpace dram_as;
 };
 
+#define TYPE_ASPEED_I2C_SLAVE "aspeed.i2c.slave"
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedI2CSlave, ASPEED_I2C_SLAVE)
+struct AspeedI2CSlave {
+    I2CSlave i2c;
+    AspeedI2CBus *bus;
+};
 
 struct AspeedI2CClass {
     SysBusDeviceClass parent_class;
-- 
2.35.1


