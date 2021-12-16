Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD374767BC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 03:08:26 +0100 (CET)
Received: from localhost ([::1]:40524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxgC1-0004tj-KD
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 21:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3S5y6YQcKCoIqusrujomuumrk.iuswks0-jk1krtutmt0.uxm@flex--komlodi.bounces.google.com>)
 id 1mxg5U-000616-GJ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 21:01:40 -0500
Received: from [2607:f8b0:4864:20::349] (port=54996
 helo=mail-ot1-x349.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3S5y6YQcKCoIqusrujomuumrk.iuswks0-jk1krtutmt0.uxm@flex--komlodi.bounces.google.com>)
 id 1mxg5Q-0007k5-SV
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 21:01:39 -0500
Received: by mail-ot1-x349.google.com with SMTP id
 p3-20020a05683019c300b0058663e33ba5so4032252otp.21
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 18:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=EPpz9NJRStRYbMsFvYissWf1+qt9BE74PmOZ3x6mxmA=;
 b=OfbNUaFRYW5GgxdCQ7L/a8h11hEYQaDkiYoa3pR2PECTAv2h0MP7ofjssHSCbvDY+0
 PwGa0388uzVf/KUApUWNFY89nhzCbYFZI7YKwstY9dU2cX5p/L4pvRxxMKLaPAzhnR7u
 uwzywxe9WMLWxw80TGgWrGoTT0mVFczn/25kMbgiO3LVKrNJ8iXBa/ll6yh0d4UMCKgI
 6tPhwdL1Eb4tWTEt5+U33fDnFgnreDTMPCgvSH9UimKV/QRP6I+rChw0tnG9zusFZjNa
 evZEruzXFlMre06XfNVG7PzwqzvHrlflfV7o05PRR8kU2ePOgMQTQ6iyYYvudF+Fcdh4
 RyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=EPpz9NJRStRYbMsFvYissWf1+qt9BE74PmOZ3x6mxmA=;
 b=H52kgOEyTL7UvioWqjoTYOzbMpMiiNy+DI3jIGliSLL68DG0JinvsOHaMk9QlRhg44
 X/jg82pWAsLXftPwplDvIzFxUWmch//6IflQsdcRhibrdi+LEFMwxly6rVjvTQUiSzsw
 e1GXbOk2b8mL6eZcGNAuiLi9dBbi/j7bvn6V5B1FO/zwDBAujT9Jtqg62glIHBQ1+WHP
 oY1iCOz23Efu6XbkucvQlUrXRX1lBz2LDOeB08a07waLvs9m+xniYxC1zMt0bdliP0/C
 4oCfweGok0ppu3CkC7Ay68YFX8n9ucOuM2xnHXN0pU9Zh2q6VAJ+cIe4JotxLVkzT90P
 I/4Q==
X-Gm-Message-State: AOAM533BD9fJanYIAO8SgBAzlvIxl8E8cr2y04P3/dFFI/wB25nwwWJK
 YDarqBmODxJ1QZ6oLW6Nwx+vgx8S1tqEyrwOoVgnyFL10v4n9Shqjtf7bEnUlHOk+3T5YkJZzAx
 CGaD25k6nt08xRDUXxo1fYy75qWBGOh/XcAukuUxRX6rw7xq15dbfqoEu6Zl5P6A=
X-Google-Smtp-Source: ABdhPJzsrTWXqFkW733DPBSWHcjAl/DXV5u6s5urlClt4Bz4k8GzdRm2UOJDP0Q0cxMH3m2noYIXY61mK5Wk
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:90a:3d42:: with SMTP id
 o2mr234654pjf.1.1639619659829; Wed, 15 Dec 2021 17:54:19 -0800 (PST)
Date: Thu, 16 Dec 2021 01:54:12 +0000
In-Reply-To: <20211216015417.1234812-1-komlodi@google.com>
Message-Id: <20211216015417.1234812-2-komlodi@google.com>
Mime-Version: 1.0
References: <20211216015417.1234812-1-komlodi@google.com>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [RFC PATCH 1/6] hw/gpio/gpio_transmitter: Add Device
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com, 
 kfting@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::349
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::349;
 envelope-from=3S5y6YQcKCoIqusrujomuumrk.iuswks0-jk1krtutmt0.uxm@flex--komlodi.bounces.google.com;
 helo=mail-ot1-x349.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

This adds a GPIO transmitter, a device which takes in the GPIO state of
a GPIO controller and transmits it via chardev.

The purpose of this device is to relay any GPIO changes to external
software that may need to act on them.

To integrate this device into a GPIO controller, the GPIO transmitter
should be initialized like any other device, then any GPIO controllers
being initialized should get a pointer to the transmitter.

To transmit data, the GPIO controller calls google_gpio_tx_transmit()
with the GPIO controller's controller number (i.e. which controller is
currently transmitting out of how many exist in the machine), and the
state of the GPIO pins on that controller.

On an error, the GPIO transmitter doesn't provide any feedback to the
controller and only logs a guest error. This is because it is a
completely separate entity from the GPIO controller and the GPIO
controller doesn't care about it, and because any
errors would be the fault of the external software receiving the GPIO
transmitter packets.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/gpio/Kconfig                           |   3 +
 hw/gpio/google_gpio_transmitter.c         | 127 ++++++++++++++++++++++
 hw/gpio/meson.build                       |   1 +
 include/hw/gpio/google_gpio_transmitter.h |  46 ++++++++
 4 files changed, 177 insertions(+)
 create mode 100644 hw/gpio/google_gpio_transmitter.c
 create mode 100644 include/hw/gpio/google_gpio_transmitter.h

diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index f0e7405f6e..760646cc3a 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -13,3 +13,6 @@ config GPIO_PWR
 
 config SIFIVE_GPIO
     bool
+
+config GOOGLE_GPIO_TRANSMITTER
+    bool
diff --git a/hw/gpio/google_gpio_transmitter.c b/hw/gpio/google_gpio_transmitter.c
new file mode 100644
index 0000000000..3429121ccb
--- /dev/null
+++ b/hw/gpio/google_gpio_transmitter.c
@@ -0,0 +1,127 @@
+/*
+ * Google GPIO Transmitter.
+ *
+ * This is a fake hardware model that does not exist on any board or IC.
+ * The purpose of this model is to aggregate GPIO state changes from a GPIO
+ * controller and transmit them via chardev.
+ *
+ * Copyright 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/gpio/google_gpio_transmitter.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/sysbus.h"
+#include "chardev/char-fe.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+
+#define PACKET_REVISION 0x01
+
+void google_gpio_tx_transmit(GoogleGPIOTXState *s, uint8_t controller,
+                              uint32_t gpios)
+{
+    uint8_t packet[6];
+
+    packet[0] = PACKET_REVISION;
+    packet[1] = controller;
+    memcpy(&packet[2], &gpios, sizeof(gpios));
+    qemu_chr_fe_write_all(&s->chr, packet, ARRAY_SIZE(packet));
+}
+
+static void google_gpio_tx_event(void *opaque, QEMUChrEvent evt)
+{
+    switch (evt) {
+    case CHR_EVENT_OPENED:
+    case CHR_EVENT_CLOSED:
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /*
+         * Ignore events.
+         * Our behavior stays the same regardless of what happens.
+         */
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void google_gpio_tx_receive(void *opaque, const uint8_t *buf, int size)
+{
+    GoogleGPIOTXState *s = GOOGLE_GPIO_TX(opaque);
+
+    switch (buf[0]) {
+    case GPIOTXCODE_OK:
+        break;
+    case GPIOTXCODE_MALFORMED_PKT:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Transmitted malformed packet\n",
+                      object_get_canonical_path(OBJECT(s)));
+        break;
+    case GPIOTXCODE_UNKNOWN_VERSION:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Transmitted malformed packet "
+                      "with a version the recipent can't handle. Sent "
+                      "version %d\n", object_get_canonical_path(OBJECT(s)),
+                      PACKET_REVISION);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unknown response 0x%x\n",
+                      object_get_canonical_path(OBJECT(s)), buf[0]);
+        break;
+    }
+
+    if (size != 1) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Expects packets only of length 1\n",
+                      object_get_canonical_path(OBJECT(s)));
+    }
+}
+
+static int google_gpio_tx_can_receive(void *opaque)
+{
+    return 1;
+}
+
+static void google_gpio_tx_realize(DeviceState *dev, Error **errp)
+{
+    GoogleGPIOTXState *s = GOOGLE_GPIO_TX(dev);
+
+    qemu_chr_fe_set_handlers(&s->chr, google_gpio_tx_can_receive,
+                             google_gpio_tx_receive,
+                             google_gpio_tx_event,
+                             NULL, OBJECT(s), NULL, true);
+}
+
+static Property google_gpio_properties[] = {
+    DEFINE_PROP_CHR("gpio-chardev", GoogleGPIOTXState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void google_gpio_tx_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "Google GPIO Controller Transmitter";
+    dc->realize = google_gpio_tx_realize;
+    device_class_set_props(dc, google_gpio_properties);
+}
+
+static const TypeInfo google_gpio_tx_types[] = {
+    {
+        .name = TYPE_GOOGLE_GPIO_TRANSMITTER,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(GoogleGPIOTXState),
+        .class_init = google_gpio_tx_class_init,
+    },
+};
+
+DEFINE_TYPES(google_gpio_tx_types);
diff --git a/include/hw/gpio/google_gpio_transmitter.h b/include/hw/gpio/google_gpio_transmitter.h
new file mode 100644
index 0000000000..fa7d7b3b77
--- /dev/null
+++ b/include/hw/gpio/google_gpio_transmitter.h
@@ -0,0 +1,46 @@
+/*
+ * Google GPIO Transmitter.
+ *
+ * This is a fake hardware model that does not exist on any board or IC.
+ * The purpose of this model is to aggregate GPIO state changes from a GPIO
+ * controller and transmit them via chardev.
+ *
+ * Copyright 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+#ifndef GOOGLE_GPIO_TRANSMITTER_H
+#define GOOGLE_GPIO_TRANSMITTER_H
+
+#include "chardev/char-fe.h"
+#include "hw/sysbus.h"
+
+#define TYPE_GOOGLE_GPIO_TRANSMITTER "google.gpio-transmitter"
+#define GOOGLE_GPIO_TX(obj) \
+    OBJECT_CHECK(GoogleGPIOTXState, (obj), TYPE_GOOGLE_GPIO_TRANSMITTER)
+
+#define GPIO_TX_NUM_CONTROLLERS 8
+
+typedef enum {
+    GPIOTXCODE_OK              = 0x00,
+    GPIOTXCODE_MALFORMED_PKT   = 0xe0,
+    GPIOTXCODE_UNKNOWN_VERSION = 0xe1,
+} GoogleGPIOTXCode;
+
+typedef struct {
+    SysBusDevice parent;
+
+    CharBackend chr;
+} GoogleGPIOTXState;
+
+void google_gpio_tx_transmit(GoogleGPIOTXState *s, uint8_t controller,
+                             uint32_t gpios);
+
+#endif /* GOOGLE_GPIO_TRANSMITTER_H */
-- 
2.34.1.173.g76aa8bc2d0-goog


