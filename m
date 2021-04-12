Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB635D174
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 21:51:27 +0200 (CEST)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW2ak-00045X-Ji
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 15:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3baN0YAcKCpAFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com>)
 id 1lW2VO-0007lY-CG
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:45:54 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:43106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3baN0YAcKCpAFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com>)
 id 1lW2VL-0006dl-IY
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:45:54 -0400
Received: by mail-qk1-x749.google.com with SMTP id u5so9670287qkj.10
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 12:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=5RE2+QZrpzbMcQz6gYDAIFrNlqEfMUUldErJDNl0hLk=;
 b=P82QvM8gay6I3DKtgOQwIBydZ+0kgkzH0kkdGyF4nWtfUo4k0iB3IcDOK/patJXY5b
 LkV2Id56AzdNPPfaxME1F7QjDoOfnkLKnQVWPunSBtspFF2AaVOvP0M22qD34KUa5y6s
 0fK37PEEwEiQ0ODtXAIhKDIm12ZxeizzfOL621jSq/hk40d48gDjxjZsX0rKE2dwHBX1
 tpBTrVQ9ICGEA5nd2gru6LzMH+X0FlYpj5+cQ2+eqzBnpAh2/Y7LuQ5adHDa/Klvd3cr
 BFLan2QZGAhhSJP48x/zgycfp/zoS/OYXk5jvsdROlqlRyWxPkaO4fSYHRDEFt8RkVtl
 fMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=5RE2+QZrpzbMcQz6gYDAIFrNlqEfMUUldErJDNl0hLk=;
 b=JrkBZHHk+tT2PfBBuNuRwWl7oXXxLEqIHSku8khxYPVlVk5ZR5SuFZJ9HZ3THC9VCO
 OUHSxFl4qDVMYoowhaTgpXTzk4uoT21/dQQ6Fthh2r5FagC3m2zaHPbmvfxg996DpVO6
 IrMx793QFhHCeCzkjLgtSNm0i00QmSWgFP6sreW5dy6ounXzjzVoaKwj5mscVxO4uer7
 YCbMILi8EDsS+eY9OFinol9ScFaHfRPG7U4aXJWeaKe1f7qzwDDHtAKn+91SilbgwP5J
 vzMB4yBaPSyv3uJ2DfR18M0EOrmH8xHUMi22RNWfxLdmgonck1jEwt+Pm/VVDddsgUqI
 nf8g==
X-Gm-Message-State: AOAM530yYIe+G1DO9bGdJLRRjLzphDnfXkSfuG9Qcfl2jLSjkeB+ajw8
 OoCGDo9TbMW9BT2qgxkBKbpUm72iv/i4
X-Google-Smtp-Source: ABdhPJyt+16IBrxw3B2+/vn+UemV3pA58a7wwh2S2fZ5rJ40MZiqFjxUhUSRIoK58zlp0tLwoG1Qdhdk8PWE
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:7285:fb47:eb76:b9a4])
 (user=venture job=sendgmr) by 2002:ad4:4f84:: with SMTP id
 em4mr6374663qvb.26.1618256749700; Mon, 12 Apr 2021 12:45:49 -0700 (PDT)
Date: Mon, 12 Apr 2021 12:45:22 -0700
In-Reply-To: <20210412194522.664594-1-venture@google.com>
Message-Id: <20210412194522.664594-5-venture@google.com>
Mime-Version: 1.0
References: <20210412194522.664594-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v4 4/4] hw/i2c: add pca954x i2c-mux switch
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3baN0YAcKCpAFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pca954x is an i2c mux, and this adds support for two variants of
this device: the pca9546 and pca9548.

This device is very common on BMCs to route a different channel to each
PCIe i2c bus downstream from the BMC.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 MAINTAINERS                      |   6 +
 hw/i2c/Kconfig                   |   4 +
 hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
 hw/i2c/meson.build               |   1 +
 hw/i2c/trace-events              |   5 +
 include/hw/i2c/i2c_mux_pca954x.h |  19 ++
 6 files changed, 325 insertions(+)
 create mode 100644 hw/i2c/i2c_mux_pca954x.c
 create mode 100644 include/hw/i2c/i2c_mux_pca954x.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 58f342108e..5ea0b60b8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2039,6 +2039,12 @@ S: Maintained
 F: hw/net/tulip.c
 F: hw/net/tulip.h
 
+pca954x
+M: Patrick Venture <venture@google.com>
+S: Maintained
+F: hw/i2c/i2c_mux_pca954x.c
+F: include/hw/i2c/i2c_mux_pca954x.h
+
 Generic Loader
 M: Alistair Francis <alistair@alistair23.me>
 S: Maintained
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 09642a6dcb..8d120a25d5 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -28,3 +28,7 @@ config IMX_I2C
 config MPC_I2C
     bool
     select I2C
+
+config PCA954X
+    bool
+    select I2C
diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
new file mode 100644
index 0000000000..847c59921c
--- /dev/null
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -0,0 +1,290 @@
+/*
+ * I2C multiplexer for PCA954x series of I2C multiplexer/switch chips.
+ *
+ * Copyright 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/i2c/i2c.h"
+#include "hw/i2c/i2c_mux_pca954x.h"
+#include "hw/i2c/smbus_slave.h"
+#include "hw/qdev-core.h"
+#include "hw/sysbus.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/queue.h"
+#include "qom/object.h"
+#include "trace.h"
+
+#define PCA9548_CHANNEL_COUNT 8
+#define PCA9546_CHANNEL_COUNT 4
+
+/*
+ * struct Pca954xChannel - The i2c mux device will have N of these states
+ * that own the i2c channel bus.
+ * @bus: The owned channel bus.
+ * @enabled: Is this channel active?
+ */
+typedef struct Pca954xChannel {
+    SysBusDevice parent;
+
+    I2CBus       *bus;
+
+    bool         enabled;
+} Pca954xChannel;
+
+#define TYPE_PCA954X_CHANNEL "pca954x-channel"
+#define PCA954X_CHANNEL(obj) \
+    OBJECT_CHECK(Pca954xChannel, (obj), TYPE_PCA954X_CHANNEL)
+
+/*
+ * struct Pca954xState - The pca954x state object.
+ * @control: The value written to the mux control.
+ * @channel: The set of i2c channel buses that act as channels which own the
+ * i2c children.
+ */
+typedef struct Pca954xState {
+    SMBusDevice parent;
+
+    uint8_t control;
+
+    /* The channel i2c buses. */
+    Pca954xChannel channel[PCA9548_CHANNEL_COUNT];
+} Pca954xState;
+
+/*
+ * struct Pca954xClass - The pca954x class object.
+ * @nchans: The number of i2c channels this device has.
+ */
+typedef struct Pca954xClass {
+    SMBusDeviceClass parent;
+
+    uint8_t nchans;
+} Pca954xClass;
+
+#define TYPE_PCA954X "pca954x"
+OBJECT_DECLARE_TYPE(Pca954xState, Pca954xClass, PCA954X)
+
+/*
+ * For each channel, if it's enabled, recursively call match on those children.
+ */
+static bool pca954x_match(I2CSlave *candidate, uint8_t address,
+                          bool broadcast,
+                          I2CNodeList *current_devs)
+{
+    Pca954xState *mux = PCA954X(candidate);
+    Pca954xClass *mc = PCA954X_GET_CLASS(mux);
+    int i;
+
+    /* They are talking to the mux itself (or all devices enabled). */
+    if ((candidate->address == address) || broadcast) {
+        I2CNode *node = g_malloc(sizeof(struct I2CNode));
+        node->elt = candidate;
+        QLIST_INSERT_HEAD(current_devs, node, next);
+        if (!broadcast) {
+            return true;
+        }
+    }
+
+    for (i = 0; i < mc->nchans; i++) {
+        if (!mux->channel[i].enabled) {
+            continue;
+        }
+
+        if (i2c_scan_bus(mux->channel[i].bus, address, broadcast,
+                         current_devs)) {
+            if (!broadcast) {
+                return true;
+            }
+        }
+    }
+
+    /* If we arrived here we didn't find a match, return broadcast. */
+    return broadcast;
+}
+
+static void pca954x_enable_channel(Pca954xState *s, uint8_t enable_mask)
+{
+    Pca954xClass *mc = PCA954X_GET_CLASS(s);
+    int i;
+
+    /*
+     * For each channel, check if their bit is set in enable_mask and if yes,
+     * enable it, otherwise disable, hide it.
+     */
+    for (i = 0; i < mc->nchans; i++) {
+        if (enable_mask & (1 << i)) {
+            s->channel[i].enabled = true;
+        } else {
+            s->channel[i].enabled = false;
+        }
+    }
+}
+
+static void pca954x_write(Pca954xState *s, uint8_t data)
+{
+    s->control = data;
+    pca954x_enable_channel(s, data);
+
+    trace_pca954x_write_bytes(data);
+}
+
+static int pca954x_write_data(SMBusDevice *d, uint8_t *buf, uint8_t len)
+{
+    Pca954xState *s = PCA954X(d);
+
+    if (len == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func__);
+        return -1;
+    }
+
+    /*
+     * len should be 1, because they write one byte to enable/disable channels.
+     */
+    if (len > 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: extra data after channel selection mask\n",
+            __func__);
+        return -1;
+    }
+
+    pca954x_write(s, buf[0]);
+    return 0;
+}
+
+static uint8_t pca954x_read_byte(SMBusDevice *d)
+{
+    Pca954xState *s = PCA954X(d);
+    uint8_t data = s->control;
+    trace_pca954x_read_data(data);
+    return data;
+}
+
+static void pca954x_enter_reset(Object *obj, ResetType type)
+{
+    Pca954xState *s = PCA954X(obj);
+    /* Reset will disable all channels. */
+    pca954x_write(s, 0);
+}
+
+I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
+{
+    Pca954xClass *pc = PCA954X_GET_CLASS(mux);
+    Pca954xState *pca954x = PCA954X(mux);
+
+    g_assert(channel < pc->nchans);
+    return I2C_BUS(qdev_get_child_bus(DEVICE(&pca954x->channel[channel]),
+                                      "i2c-bus"));
+}
+
+static void pca954x_channel_init(Object *obj)
+{
+    Pca954xChannel *s = PCA954X_CHANNEL(obj);
+    s->bus = i2c_init_bus(DEVICE(s), "i2c-bus");
+
+    /* Start all channels as disabled. */
+    s->enabled = false;
+}
+
+static void pca954x_channel_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "Pca954x Channel";
+}
+
+static void pca9546_class_init(ObjectClass *klass, void *data)
+{
+    Pca954xClass *s = PCA954X_CLASS(klass);
+    s->nchans = PCA9546_CHANNEL_COUNT;
+}
+
+static void pca9548_class_init(ObjectClass *klass, void *data)
+{
+    Pca954xClass *s = PCA954X_CLASS(klass);
+    s->nchans = PCA9548_CHANNEL_COUNT;
+}
+
+static void pca954x_realize(DeviceState *dev, Error **errp)
+{
+    Pca954xState *s = PCA954X(dev);
+    Pca954xClass *c = PCA954X_GET_CLASS(s);
+    int i;
+
+    /* SMBus modules. Cannot fail. */
+    for (i = 0; i < c->nchans; i++) {
+        sysbus_realize(SYS_BUS_DEVICE(&s->channel[i]), &error_abort);
+    }
+}
+
+static void pca954x_init(Object *obj)
+{
+    Pca954xState *s = PCA954X(obj);
+    Pca954xClass *c = PCA954X_GET_CLASS(obj);
+    int i;
+
+    /* Only initialize the children we expect. */
+    for (i = 0; i < c->nchans; i++) {
+        object_initialize_child(obj, "channel[*]", &s->channel[i],
+                                TYPE_PCA954X_CHANNEL);
+    }
+}
+
+static void pca954x_class_init(ObjectClass *klass, void *data)
+{
+    I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SMBusDeviceClass *k = SMBUS_DEVICE_CLASS(klass);
+
+    sc->match_and_add = pca954x_match;
+
+    rc->phases.enter = pca954x_enter_reset;
+
+    dc->desc = "Pca954x i2c-mux";
+    dc->realize = pca954x_realize;
+
+    k->write_data = pca954x_write_data;
+    k->receive_byte = pca954x_read_byte;
+}
+
+static const TypeInfo pca954x_info[] = {
+    {
+        .name          = TYPE_PCA954X,
+        .parent        = TYPE_SMBUS_DEVICE,
+        .instance_size = sizeof(Pca954xState),
+        .instance_init = pca954x_init,
+        .class_size    = sizeof(Pca954xClass),
+        .class_init    = pca954x_class_init,
+        .abstract      = true,
+    },
+    {
+        .name          = TYPE_PCA9546,
+        .parent        = TYPE_PCA954X,
+        .class_init    = pca9546_class_init,
+    },
+    {
+        .name          = TYPE_PCA9548,
+        .parent        = TYPE_PCA954X,
+        .class_init    = pca9548_class_init,
+    },
+    {
+        .name = TYPE_PCA954X_CHANNEL,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .class_init = pca954x_channel_class_init,
+        .instance_size = sizeof(Pca954xChannel),
+        .instance_init = pca954x_channel_init,
+    }
+};
+
+DEFINE_TYPES(pca954x_info)
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index cdcd694a7f..dd3aef02b2 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -14,4 +14,5 @@ i2c_ss.add(when: 'CONFIG_SMBUS_EEPROM', if_true: files('smbus_eeprom.c'))
 i2c_ss.add(when: 'CONFIG_VERSATILE_I2C', if_true: files('versatile_i2c.c'))
 i2c_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PPC4XX', if_true: files('ppc4xx_i2c.c'))
+i2c_ss.add(when: 'CONFIG_PCA954X', if_true: files('i2c_mux_pca954x.c'))
 softmmu_ss.add_all(when: 'CONFIG_I2C', if_true: i2c_ss)
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 82fe6f965f..82f19e6a2d 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -26,3 +26,8 @@ npcm7xx_smbus_recv_byte(const char *id, uint8_t value) "%s recv byte: 0x%02x"
 npcm7xx_smbus_stop(const char *id) "%s stopping"
 npcm7xx_smbus_nack(const char *id) "%s nacking"
 npcm7xx_smbus_recv_fifo(const char *id, uint8_t received, uint8_t expected) "%s recv fifo: received %u, expected %u"
+
+# i2c-mux-pca954x.c
+
+pca954x_write_bytes(uint8_t value) "PCA954X write data: 0x%02x"
+pca954x_read_data(uint8_t value) "PCA954X read data: 0x%02x"
diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
new file mode 100644
index 0000000000..8aaf9bbc39
--- /dev/null
+++ b/include/hw/i2c/i2c_mux_pca954x.h
@@ -0,0 +1,19 @@
+#ifndef QEMU_I2C_MUX_PCA954X
+#define QEMU_I2C_MUX_PCA954X
+
+#include "hw/i2c/i2c.h"
+
+#define TYPE_PCA9546 "pca9546"
+#define TYPE_PCA9548 "pca9548"
+
+/**
+ * Retrieves the i2c bus associated with the specified channel on this i2c
+ * mux.
+ * @mux: an i2c mux device.
+ * @channel: the i2c channel requested
+ *
+ * Returns: a pointer to the associated i2c bus.
+ */
+I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel);
+
+#endif
-- 
2.31.1.295.g9ea45b61b8-goog


