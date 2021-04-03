Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4753535AC
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Apr 2021 00:31:01 +0200 (CEST)
Received: from localhost ([::1]:48982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSonE-0006rl-TD
	for lists+qemu-devel@lfdr.de; Sat, 03 Apr 2021 18:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DuxoYAcKCpMI1AGHE13BB381.zB9D19H-01I18ABA3AH.BE3@flex--venture.bounces.google.com>)
 id 1lSol1-0004XM-JH
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 18:28:44 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:42670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DuxoYAcKCpMI1AGHE13BB381.zB9D19H-01I18ABA3AH.BE3@flex--venture.bounces.google.com>)
 id 1lSokr-0002qb-Ms
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 18:28:41 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id v6so13020794ybk.9
 for <qemu-devel@nongnu.org>; Sat, 03 Apr 2021 15:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9Rr9JYnLZhIsJpXVKMtSmriKFQyc6Y0e2KboV1hbcLc=;
 b=YiX0mdKCIDkL6MkHKCii3Ynh4PUSia4/bEzshjGpXjnLK3nDtV4NLhq1nNU1v0oVLT
 vPmQwwAGjxNFtBi6Mt3i1TvMTC5U2N2gCjyE61CTavV8L5oNmvrQ/sV4m4rijcGvG3+6
 k5OoJpXFBN1KavC0eMxRA6Pel4CaUAdvHz+MZrH9wEdr8fDF6ZEoIad40E5Tx6cxTuZd
 h0WKcO61Z5zh+TKqfGghA2lmz6BlJmqkQ2kyqlBfmQlmlbHJmU5EYs0oElPhcTRw9+yM
 k5xCm93A+ei8trYve2kOwQ2U4EV88MFPizuW1DQ9b+Sbd84bgojrRnIsvHTVgZv3jMaO
 9bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9Rr9JYnLZhIsJpXVKMtSmriKFQyc6Y0e2KboV1hbcLc=;
 b=UossRLtj1huQrHTNyYMY98wqkTWcW7G7hreaFs6TFp1Wqq/L2PEf7JAbvqbYhbQyhV
 X0vwBpHKH32/Cy1wVI3Xxafq0EBtgueJijGeSrWJ2eBbmjPSi3YpCVUD5l5Je4hrTnkJ
 o32P1Rdi8QlAW4aQdp8WW0c6BT8YUXg7DP440YZZoxDIVChZBKYFyqWjZ6r2vzIVmnYl
 o/v/zvndpR0qnBCh0WTeBkm8knSBbYNH7EsXJAFjwNihNkBwDHzJP/qrow1c97+jFAqH
 HWVhieD4U5oBhrHrC6sYh2k01nddu7iyW1IICM8dil9JUa1Aw19FAafFGnJTVkL5J0Om
 bikg==
X-Gm-Message-State: AOAM532a3bnPdHM6fE3JjwER/ymQ140UL6S5hUJTKMX2VXJU3lMxhd4l
 P7FbzYHHqKwy0CFCv2VEDGpTUHI34E3G
X-Google-Smtp-Source: ABdhPJzo23Cu2rf3f0QdTOhAQiy9R9brwPOrZ3bRyBHzgeeyn3ee21p3wUdwKsJOVT38xaRsmryIwFGgmAFg
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:bcbb:2e0c:25df:d735])
 (user=venture job=sendgmr) by 2002:a25:424c:: with SMTP id
 p73mr27279461yba.192.1617488910866; Sat, 03 Apr 2021 15:28:30 -0700 (PDT)
Date: Sat,  3 Apr 2021 15:28:10 -0700
In-Reply-To: <20210403222810.3481372-1-venture@google.com>
Message-Id: <20210403222810.3481372-3-venture@google.com>
Mime-Version: 1.0
References: <20210403222810.3481372-1-venture@google.com>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH 2/2] hw/i2c: add pca954x i2c-mux switch
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3DuxoYAcKCpMI1AGHE13BB381.zB9D19H-01I18ABA3AH.BE3@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 MAINTAINERS                      |   6 +
 hw/i2c/Kconfig                   |   4 +
 hw/i2c/i2c_mux_pca954x.c         | 182 +++++++++++++++++++++++++++++++
 hw/i2c/meson.build               |   1 +
 hw/i2c/trace-events              |   5 +
 include/hw/i2c/i2c_mux_pca954x.h |  60 ++++++++++
 6 files changed, 258 insertions(+)
 create mode 100644 hw/i2c/i2c_mux_pca954x.c
 create mode 100644 include/hw/i2c/i2c_mux_pca954x.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 69003cdc3c..6cec2a9320 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2040,6 +2040,12 @@ S: Maintained
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
index 0000000000..8017913637
--- /dev/null
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -0,0 +1,182 @@
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
+#include "hw/i2c/i2c_mux_pca954x.h"
+#include "hw/i2c/smbus_slave.h"
+#include "hw/qdev-core.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/queue.h"
+#include "trace.h"
+
+int pca954x_add_child(I2CSlave *mux, uint8_t channel, I2CSlave *child)
+{
+    g_autofree char *name = NULL;
+    /*
+     * Ok, so we need to try to add the i2c_dev to channel for mux.
+     * A channel can have multiple devices, we need a list for each channel.
+     */
+    Pca954xClass *pc = PCA954X_GET_CLASS(mux);
+    Pca954xState *pca954x = PCA954X(mux);
+    PcaMuxChild *controlled_device;
+
+    /* Is the channel legal? */
+    if (channel >= pc->nchans) {
+        return -1;
+    }
+
+    controlled_device = g_new0(PcaMuxChild, 1);
+    controlled_device->channel = channel;
+    controlled_device->child = child;
+    object_ref(OBJECT(controlled_device->child));
+
+    /* Hide the device. */
+    child->reachable = 0;
+
+    QSLIST_INSERT_HEAD(&pca954x->children, controlled_device, sibling);
+
+    name = g_strdup_printf("i2c@%u-child[%u]", channel,
+                           pca954x->count[channel]);
+    object_property_add_link(OBJECT(mux), name,
+                             object_get_typename(OBJECT(child)),
+                             (Object **)&controlled_device->child,
+                             NULL, /* read-only property */
+                             0);
+    pca954x->count[channel]++;
+
+    return 0;
+}
+
+static void pca954x_enable_channel(Pca954xState *s, uint8_t enable_mask)
+{
+    PcaMuxChild *kid;
+    I2CSlave *child;
+
+    /*
+     * For each child, check if their bit is set in data and if yes, enable
+     * them, otherwise disable, hide them.
+     */
+    QSLIST_FOREACH(kid, &s->children, sibling) {
+        child = I2C_SLAVE(kid->child);
+        if (enable_mask & (1 << kid->channel)) {
+            child->reachable = true;
+        } else {
+            child->reachable = false;
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
+static void pca9546_class_init(ObjectClass *oc, void *data)
+{
+    Pca954xClass *s = PCA954X_CLASS(oc);
+    s->nchans = PCA9546_CHANNEL_COUNT;
+}
+
+static void pca9548_class_init(ObjectClass *oc, void *data)
+{
+    Pca954xClass *s = PCA954X_CLASS(oc);
+    s->nchans = PCA9548_CHANNEL_COUNT;
+}
+
+static void pca954x_enter_reset(Object *obj, ResetType type)
+{
+    Pca954xState *s = PCA954X(obj);
+    /* Reset will disable all channels. */
+    pca954x_write(s, 0);
+}
+
+static void pca954x_init(Object *obj)
+{
+    Pca954xState *s = PCA954X(obj);
+    memset(s->count, 0x00, sizeof(s->count));
+}
+
+static void pca954x_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SMBusDeviceClass *k = SMBUS_DEVICE_CLASS(klass);
+
+    dc->desc = "Pca954x i2c-mux";
+    k->write_data = pca954x_write_data;
+    k->receive_byte = pca954x_read_byte;
+    rc->phases.enter = pca954x_enter_reset;
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
index 0000000000..4ea240af26
--- /dev/null
+++ b/include/hw/i2c/i2c_mux_pca954x.h
@@ -0,0 +1,60 @@
+#ifndef QEMU_I2C_MUX_PCA954X
+#define QEMU_I2C_MUX_PCA954X
+
+#include "hw/qdev-core.h"
+#include "hw/i2c/i2c.h"
+#include "hw/i2c/smbus_slave.h"
+
+#define PCA9548_CHANNEL_COUNT 8
+#define PCA9546_CHANNEL_COUNT 4
+
+/* The i2c mux shares ownership of a bus child. */
+typedef struct PcaMuxChild {
+    I2CSlave *child;
+
+    /* The channel on which this child lives. */
+    uint8_t channel;
+
+    QSLIST_ENTRY(PcaMuxChild) sibling;
+} PcaMuxChild;
+
+typedef struct Pca954xState {
+    SMBusDevice parent;
+
+    uint8_t control;
+
+    /* The children this mux co-owns with its parent bus. */
+    QSLIST_HEAD(, PcaMuxChild) children;
+
+    /* The number of children per channel. */
+    unsigned int count[PCA9548_CHANNEL_COUNT];
+} Pca954xState;
+
+typedef struct Pca954xClass {
+    SMBusDeviceClass parent;
+
+    /* The number of channels this mux has. */
+    uint8_t nchans;
+} Pca954xClass;
+
+#define TYPE_PCA9546 "pca9546"
+#define TYPE_PCA9548 "pca9548"
+
+#define TYPE_PCA954X "pca954x"
+
+#define PCA954X(obj) OBJECT_CHECK(Pca954xState, (obj), TYPE_PCA954X)
+#define PCA954X_CLASS(klass)                                                   \
+     OBJECT_CLASS_CHECK(Pca954xClass, (klass), TYPE_PCA954X)
+#define PCA954X_GET_CLASS(obj)                                                 \
+     OBJECT_GET_CLASS(Pca954xClass, (obj), TYPE_PCA954X)
+
+/**
+ * pca954x_add_child - Adds a child i2c device to the mux device on the
+ * specified channel.
+ * @mux - The i2c mux to control this child.
+ * @channel - The channel of the i2c mux that gates this child.
+ * @child - The i2c child device to add to the mux.
+ */
+int pca954x_add_child(I2CSlave *mux, uint8_t channel, I2CSlave *child);
+
+#endif
-- 
2.31.0.208.g409f899ff0-goog


