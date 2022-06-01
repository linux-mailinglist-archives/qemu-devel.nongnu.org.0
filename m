Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB253AE81
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 23:25:55 +0200 (CEST)
Received: from localhost ([::1]:53292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwVqk-00046d-5f
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 17:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVaG-0000yj-KT; Wed, 01 Jun 2022 17:08:52 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:35037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVaE-00023Z-Od; Wed, 01 Jun 2022 17:08:52 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F30FE5C01C7;
 Wed,  1 Jun 2022 17:08:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 01 Jun 2022 17:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654117729; x=
 1654204129; bh=60NMw08L2ryECnMFT4jorObfQQnqhXdOTETyqAobztw=; b=q
 6yY6WdSTT33aC9n9K9qWg5bdk5PRZX0NGvZMv0G/144haYGrGWoX5/lC9G80jVUf
 evY/y4DFYRtVGpKZlN7+IEywxM2Wb4yrjGptGi8sYEEaH29xPmiPbAAS80WEULOW
 fk6ZEJac339OP17HZs5pGdIDge4OiRG0Ky5Ub14Yacwj3NKDtS8bx24ofcrCDlsc
 dWLiLWrPTTA0Zs4etGjINnRwg8nAfSJtu4xVP6UYMFo+tsz1fFyndM03zAPCwBE8
 +X/VvGrL4EQ5X8tOqmPiO9wECPo8XvHXl11Th4SfmQqd68ntfo3jJn+wuLg3901S
 +8hYARPbV1n9gFDrHF2yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654117729; x=1654204129; bh=60NMw08L2ryEC
 nMFT4jorObfQQnqhXdOTETyqAobztw=; b=Ouai+9FojQZQD7FJqAJ9p+IeazM7i
 rIaQsPqWx28eX1851IURUqow45zjjUUchtb2pqi0viYN9WJHL64Fk2JDOVXftWF+
 JCGdfT5QmIGZezWi1mh6yQcCoCYIvT+1xYb9qDq0dalj0bz4zJOWiAuj+WCzHAi9
 uF1KDpzDRIeftzVju1EiY3aAg1GxQakU2uyexU3UYJKi1ry3+TMor50CQnr22UsS
 3hrIH5T+s7xMdultVtTNTQ2O0hGhAnAfoZIbzMcxIN11QCAvNdD7UVc93+/36fK3
 luLwbfxu8We2WYmvHhFH2aJWTW9wQvtZJPFSOn8RG5fwwGyWTxtJGu6jw==
X-ME-Sender: <xms:YdWXYqkTTzcilhkxg8KX4Yzyqd3L3JdmEz64ufPuuUrGSG2EdyKoaA>
 <xme:YdWXYh1RF44KhCeV1WY9MWr_nUEkn2V4EiRMoMLm9Cx-1i9N0sWOSkqLm95qokkkr
 aF4EYkLmZlQD-xwr3o>
X-ME-Received: <xmr:YdWXYorv6VYxRz6y7YWdeOpkI9FeJUpJM2x5BMfk9RYtIA2VwSynN2iL0LEsFzXlWIVdd9PRTZLkitXagLvp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledtgdduheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:YdWXYull7PJWTjYngd2KiPAWYS2m0ysloB7fZBxuZ46YPTS1qqrHkQ>
 <xmx:YdWXYo1-Rg9rj_k1ei6X8LmxaJ_iqsXq9lKacWHfuPJWRzPZ0S_b6A>
 <xmx:YdWXYlssmUcMEcyUHgcRMvHHQGU-eSaKOrwZi2sbBZIl-sienP4UqA>
 <xmx:YdWXYtsLD9iddB95wJ4uouYWKXeeH2lBIi1KUBil_kjzLGQmX9bm0w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jun 2022 17:08:47 -0400 (EDT)
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
Subject: [RFC PATCH v2 6/6] hw/misc: add a toy i2c echo device [DO NOT PULL]
Date: Wed,  1 Jun 2022 23:08:31 +0200
Message-Id: <20220601210831.67259-7-its@irrelevant.dk>
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

Add an example I2C device to demonstrate how a slave may master the bus
and send data asynchronously to another slave.

The device will echo whatever it is sent to the device identified by the
first byte received.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/misc/i2c-echo.c  | 162 ++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build |   2 +
 2 files changed, 164 insertions(+)
 create mode 100644 hw/misc/i2c-echo.c

diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c
new file mode 100644
index 000000000000..27992eff8c5b
--- /dev/null
+++ b/hw/misc/i2c-echo.c
@@ -0,0 +1,162 @@
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "qemu/main-loop.h"
+#include "block/aio.h"
+#include "hw/i2c/i2c.h"
+
+#define TYPE_I2C_ECHO "i2c-echo"
+OBJECT_DECLARE_SIMPLE_TYPE(I2CEchoState, I2C_ECHO)
+
+enum i2c_echo_state {
+    I2C_ECHO_STATE_IDLE,
+    I2C_ECHO_STATE_REQUEST_MASTER,
+    I2C_ECHO_STATE_START_SEND,
+    I2C_ECHO_STATE_ACK,
+};
+
+typedef struct I2CEchoState {
+    I2CSlave parent_obj;
+
+    I2CBus *bus;
+
+    enum i2c_echo_state state;
+    QEMUBH *bh;
+
+    unsigned int pos;
+    uint8_t data[3];
+} I2CEchoState;
+
+static void i2c_echo_bh(void *opaque)
+{
+    I2CEchoState *state = opaque;
+
+    switch (state->state) {
+    case I2C_ECHO_STATE_IDLE:
+        return;
+
+    case I2C_ECHO_STATE_REQUEST_MASTER:
+        i2c_bus_master(state->bus, state->bh);
+        state->state = I2C_ECHO_STATE_START_SEND;
+        return;
+
+    case I2C_ECHO_STATE_START_SEND:
+        if (i2c_start_send_async(state->bus, state->data[0])) {
+            goto release_bus;
+        }
+
+        state->pos++;
+        state->state = I2C_ECHO_STATE_ACK;
+        return;
+
+    case I2C_ECHO_STATE_ACK:
+        if (state->pos > 2) {
+            break;
+        }
+
+        if (i2c_send_async(state->bus, state->data[state->pos++])) {
+            break;
+        }
+
+        return;
+    }
+
+
+    i2c_end_transfer(state->bus);
+release_bus:
+    i2c_bus_release(state->bus);
+
+    state->state = I2C_ECHO_STATE_IDLE;
+}
+
+static int i2c_echo_event(I2CSlave *s, enum i2c_event event)
+{
+    I2CEchoState *state = I2C_ECHO(s);
+
+    switch (event) {
+    case I2C_START_RECV:
+        state->pos = 0;
+
+        break;
+
+    case I2C_START_SEND:
+        state->pos = 0;
+
+        break;
+
+    case I2C_FINISH:
+        state->pos = 0;
+        state->state = I2C_ECHO_STATE_REQUEST_MASTER;
+        qemu_bh_schedule(state->bh);
+
+        break;
+
+    case I2C_NACK:
+        break;
+
+    default:
+        return -1;
+    }
+
+    return 0;
+}
+
+static uint8_t i2c_echo_recv(I2CSlave *s)
+{
+    I2CEchoState *state = I2C_ECHO(s);
+
+    if (state->pos > 2) {
+        return 0xff;
+    }
+
+    return state->data[state->pos++];
+}
+
+static int i2c_echo_send(I2CSlave *s, uint8_t data)
+{
+    I2CEchoState *state = I2C_ECHO(s);
+
+    if (state->pos > 2) {
+        return -1;
+    }
+
+    state->data[state->pos++] = data;
+
+    return 0;
+}
+
+static void i2c_echo_realize(DeviceState *dev, Error **errp)
+{
+    I2CEchoState *state = I2C_ECHO(dev);
+    BusState *bus = qdev_get_parent_bus(dev);
+
+    state->bus = I2C_BUS(bus);
+    state->bh = qemu_bh_new(i2c_echo_bh, state);
+
+    return;
+}
+
+static void i2c_echo_class_init(ObjectClass *oc, void *data)
+{
+    I2CSlaveClass *sc = I2C_SLAVE_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = i2c_echo_realize;
+
+    sc->event = i2c_echo_event;
+    sc->recv = i2c_echo_recv;
+    sc->send = i2c_echo_send;
+}
+
+static const TypeInfo i2c_echo = {
+    .name = TYPE_I2C_ECHO,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(I2CEchoState),
+    .class_init = i2c_echo_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&i2c_echo);
+}
+
+type_init(register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 0135d1975ceb..4132fe5e0bf7 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -125,6 +125,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
 
 softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
 
+softmmu_ss.add(when: 'CONFIG_I2C', if_true: files('i2c-echo.c'))
+
 specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
 
 specific_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))
-- 
2.36.1


