Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540B4767A7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 03:02:22 +0100 (CET)
Received: from localhost ([::1]:56772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxg68-00055m-Vc
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 21:02:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3TZy6YQcKCoQswutwlqowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--komlodi.bounces.google.com>)
 id 1mxg3Z-0003I7-47
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 20:59:41 -0500
Received: from [2607:f8b0:4864:20::34a] (port=48664
 helo=mail-ot1-x34a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3TZy6YQcKCoQswutwlqowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--komlodi.bounces.google.com>)
 id 1mxg3W-0007Rh-Lf
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 20:59:40 -0500
Received: by mail-ot1-x34a.google.com with SMTP id
 v13-20020a056830140d00b0055c8421bd62so10715567otp.15
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 17:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=QQN9Ad1Yq1PXKvpv4A5/4edmKsppTSY8pdqUGWCYZGo=;
 b=JKf1dTM61Oh8+25BUatVQcSjvZQgGrik/qq+kMl5XPXShBsYiPRhcumNP4x2bSSovU
 JdyUuNfPjBKkWnG57j3Q/CZ3e1G5PRrT+JJgPPjnBIh/oZuZ/WatD0+a3tBrN0+y90Tn
 J7MxYide1PFQeiZdJlKESpauIgpNXtwo24gF5yd39qb6zWIXW3M5OmI8Y7iPmXyFy+GB
 zCB1h8alDuvoShsXvX8JEuYWwUBTh6x6sWQn45/xxd9L/bhBMpo/vPnsyRZtyFwssAcf
 AueE+rYimdkce+SSRyoxrnTrYXu9WEe3UlDS5qQjKPOuxJGTDu7mFoWdrc9Z164Eud0L
 MfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=QQN9Ad1Yq1PXKvpv4A5/4edmKsppTSY8pdqUGWCYZGo=;
 b=WBBoWN33aTxCMmIYas25EfnLlZmKf+TO9lNgw3XcR9t2YWzUYdTOgDlyLsv7jz2Cx9
 HweG/vac3lVhMIKPbSTjlj6QRDRFEE5iRmz3bjDev2PYtrJE74g6AcwKuMdc8P7vJmVQ
 Q05Q+6rENgdbe0PS1syDtzoxYiHu3b3PYKwnE4eCyHOc6c+ZklfGQ3OUdAQi0NhUUFbu
 8LWHh6JugXibbTQlZ5C26An5mOJy/yr4aweqMSoGDqa0XWuCsBtfEsZ1PJ9rpfpaZ6kr
 RcmlO9aJ0T+0KdJn3nuNnGnB0C4NjexMp/TL3X62J9KYViKoYjNXzsoiT/sSZNuSycsi
 lB3w==
X-Gm-Message-State: AOAM532P29RVx2rli8a18Yt35Ewue6YkZZfHR7yB8JfNDtmNR3njcLIo
 yCrKXQzYJ/UftIcAnqcXEBV4cdXFYGOMFofC3s8C3fZ6A0goqYJcIWJFiDyemLx7iYBc2LCCIy5
 vjc63b3Zm+SCwTrAnk/84ui3/BFKUn97sIE7QPr1oYQfg7lZuzfIVKhIJiwLC1b8=
X-Google-Smtp-Source: ABdhPJw5++u6Kwml2mpt3jQTcimpBlVHlrTNVDzlnpEhHOXhdWOL4Y7lWKJjBx9bkXg5SdbAbOOjuIb788Ja
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:90b:128e:: with SMTP id
 fw14mr3231350pjb.173.1639619661681; Wed, 15 Dec 2021 17:54:21 -0800 (PST)
Date: Thu, 16 Dec 2021 01:54:13 +0000
In-Reply-To: <20211216015417.1234812-1-komlodi@google.com>
Message-Id: <20211216015417.1234812-3-komlodi@google.com>
Mime-Version: 1.0
References: <20211216015417.1234812-1-komlodi@google.com>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [RFC PATCH 2/6] hw/gpio/gpio_transmitter: Add allowlist
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com, 
 kfting@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::34a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::34a;
 envelope-from=3TZy6YQcKCoQswutwlqowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--komlodi.bounces.google.com;
 helo=mail-ot1-x34a.google.com
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

To avoid spamming whoever is connected to the chardev any time a pin state
changes, we'll provide an allowlist so the transmitter only transmits on
state changes the user cares about.

The allowlist is a qdev property that takes in an array of pin numbers
to pay attention to, and maps it to a relative pin number on a
controller, assuming each controller has 32-bits of pins.

If no allowlist is specified, we transmit on any pin update.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/gpio/google_gpio_transmitter.c         | 122 ++++++++++++++++++++++
 include/hw/gpio/google_gpio_transmitter.h |  20 ++++
 2 files changed, 142 insertions(+)

diff --git a/hw/gpio/google_gpio_transmitter.c b/hw/gpio/google_gpio_transmitter.c
index 3429121ccb..b0331e8f03 100644
--- a/hw/gpio/google_gpio_transmitter.c
+++ b/hw/gpio/google_gpio_transmitter.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 
+#include "migration/vmstate.h"
 #include "hw/gpio/google_gpio_transmitter.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/sysbus.h"
@@ -28,11 +29,36 @@
 
 #define PACKET_REVISION 0x01
 
+static bool google_gpio_tx_check_allowlist(GoogleGPIOTXState *s,
+                                           uint32_t controller, uint32_t gpios)
+{
+    /* If the user didn't give us a list, allow everything */
+    if (!s->gpio_state_by_ctlr) {
+        return true;
+    }
+
+    GPIOCtlrState *gs = g_hash_table_lookup(s->gpio_state_by_ctlr, &controller);
+
+    if (!gs) {
+        return false;
+    }
+
+    bool updated = (gs->gpios & gs->allowed) != (gpios & gs->allowed);
+    /* Update the new state */
+    gs->gpios = gpios;
+
+    return updated;
+}
+
 void google_gpio_tx_transmit(GoogleGPIOTXState *s, uint8_t controller,
                               uint32_t gpios)
 {
     uint8_t packet[6];
 
+    if (!google_gpio_tx_check_allowlist(s, controller, gpios)) {
+        return;
+    }
+
     packet[0] = PACKET_REVISION;
     packet[1] = controller;
     memcpy(&packet[2], &gpios, sizeof(gpios));
@@ -91,18 +117,112 @@ static int google_gpio_tx_can_receive(void *opaque)
     return 1;
 }
 
+void google_gpio_tx_state_init(GoogleGPIOTXState *s, uint8_t controller,
+                               uint32_t gpios)
+{
+    if (!s->gpio_state_by_ctlr) {
+        return;
+    }
+
+    GPIOCtlrState *gs = g_hash_table_lookup(s->gpio_state_by_ctlr, &controller);
+    if (gs) {
+        gs->gpios = gpios;
+    }
+}
+
+void google_gpio_tx_allowlist_qdev_init(GoogleGPIOTXState *s,
+                                        const uint32_t *allowed_pins,
+                                        size_t num)
+{
+    size_t i;
+    char propname[64];
+
+    qdev_prop_set_uint32(DEVICE(s), "len-gpio-allowlist", num);
+
+    for (i = 0; i < num; i++) {
+        snprintf(propname, sizeof(propname), "gpio-allowlist[%zu]", i);
+        qdev_prop_set_uint32(DEVICE(s), propname, allowed_pins[i]);
+    }
+}
+
+static void google_gpio_tx_allowlist_init(GoogleGPIOTXState *s)
+{
+    size_t i;
+    GPIOCtlrState *gs;
+
+    if (!s->gpio_allowlist) {
+        return;
+    }
+
+    s->gpio_state_by_ctlr = g_hash_table_new_full(g_int_hash, g_int_equal,
+                                                  g_free, g_free);
+
+    for (i = 0; i < s->gpio_allowlist_sz; i++) {
+        uint32_t controller = s->gpio_allowlist[i] / 32;
+        uint32_t pin = (1 << (s->gpio_allowlist[i] % 32));
+
+        gs = g_hash_table_lookup(s->gpio_state_by_ctlr, &controller);
+        if (gs) {
+            gs->allowed |= pin;
+        } else {
+            gs = g_malloc0(sizeof(*gs));
+            gs->allowed |= pin;
+            /*
+             * The hash table relies on a pointer to be the key, so the pointer
+             * containing the controller num must remain unchanged.
+             * Because of that, just allocate a new key with the controller num.
+             */
+            uint32_t *ctlr = g_memdup(&controller, sizeof(controller));
+            g_hash_table_insert(s->gpio_state_by_ctlr, ctlr, gs);
+        }
+    }
+}
+
 static void google_gpio_tx_realize(DeviceState *dev, Error **errp)
 {
     GoogleGPIOTXState *s = GOOGLE_GPIO_TX(dev);
 
+    google_gpio_tx_allowlist_init(s);
+
     qemu_chr_fe_set_handlers(&s->chr, google_gpio_tx_can_receive,
                              google_gpio_tx_receive,
                              google_gpio_tx_event,
                              NULL, OBJECT(s), NULL, true);
 }
 
+static void google_gpio_tx_finalize(Object *obj)
+{
+    GoogleGPIOTXState *s = GOOGLE_GPIO_TX(obj);
+
+    g_hash_table_destroy(s->gpio_state_by_ctlr);
+    g_free(s->gpio_allowlist);
+}
+
+static int google_gpio_tx_post_load(void *opaque, int version_id)
+{
+    GoogleGPIOTXState *s = GOOGLE_GPIO_TX(opaque);
+
+    google_gpio_tx_allowlist_init(s);
+    return 0;
+}
+
+static const VMStateDescription vmstate_google_gpio_tx = {
+    .name = "gpio_transmitter",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = google_gpio_tx_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_VARRAY_UINT32(gpio_allowlist, GoogleGPIOTXState,
+                              gpio_allowlist_sz, 0, vmstate_info_uint32,
+                              uint32_t),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static Property google_gpio_properties[] = {
     DEFINE_PROP_CHR("gpio-chardev", GoogleGPIOTXState, chr),
+    DEFINE_PROP_ARRAY("gpio-allowlist", GoogleGPIOTXState, gpio_allowlist_sz,
+                      gpio_allowlist, qdev_prop_uint32, uint32_t),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -112,6 +232,7 @@ static void google_gpio_tx_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "Google GPIO Controller Transmitter";
     dc->realize = google_gpio_tx_realize;
+    dc->vmsd = &vmstate_google_gpio_tx;
     device_class_set_props(dc, google_gpio_properties);
 }
 
@@ -120,6 +241,7 @@ static const TypeInfo google_gpio_tx_types[] = {
         .name = TYPE_GOOGLE_GPIO_TRANSMITTER,
         .parent = TYPE_SYS_BUS_DEVICE,
         .instance_size = sizeof(GoogleGPIOTXState),
+        .instance_finalize = google_gpio_tx_finalize,
         .class_init = google_gpio_tx_class_init,
     },
 };
diff --git a/include/hw/gpio/google_gpio_transmitter.h b/include/hw/gpio/google_gpio_transmitter.h
index fa7d7b3b77..ddc3561372 100644
--- a/include/hw/gpio/google_gpio_transmitter.h
+++ b/include/hw/gpio/google_gpio_transmitter.h
@@ -34,13 +34,33 @@ typedef enum {
     GPIOTXCODE_UNKNOWN_VERSION = 0xe1,
 } GoogleGPIOTXCode;
 
+typedef struct {
+    uint32_t gpios;
+    uint32_t allowed;
+} GPIOCtlrState;
+
 typedef struct {
     SysBusDevice parent;
 
+    GHashTable *gpio_state_by_ctlr;
+    uint32_t *gpio_allowlist;
+    uint32_t gpio_allowlist_sz;
+
     CharBackend chr;
 } GoogleGPIOTXState;
 
 void google_gpio_tx_transmit(GoogleGPIOTXState *s, uint8_t controller,
                              uint32_t gpios);
+/*
+ * If using an allowlist, this function should be called by the GPIO controller
+ * to set an initial state of the controller's GPIO pins.
+ * Otherwise all pins will be assumed to have an initial state of 0.
+ */
+void google_gpio_tx_state_init(GoogleGPIOTXState *s, uint8_t controller,
+                               uint32_t gpios);
 
+/* Helper function to be called to initialize the allowlist qdev properties */
+void google_gpio_tx_allowlist_qdev_init(GoogleGPIOTXState *s,
+                                        const uint32_t *allowed_pins,
+                                        size_t num);
 #endif /* GOOGLE_GPIO_TRANSMITTER_H */
-- 
2.34.1.173.g76aa8bc2d0-goog


