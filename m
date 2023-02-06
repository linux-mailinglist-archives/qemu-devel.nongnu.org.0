Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613AF68C70C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 20:51:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP7Uv-0007gl-SM; Mon, 06 Feb 2023 14:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <32FnhYwYKCjcmbmnlkZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--titusr.bounces.google.com>)
 id 1pP7Ut-0007f8-0G
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:49:51 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <32FnhYwYKCjcmbmnlkZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--titusr.bounces.google.com>)
 id 1pP7Uq-0007sn-6l
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:49:50 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 z9-20020a25ba49000000b007d4416e3667so12625184ybj.23
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 11:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+guheRGNxwsLT53HDTDKJqAj8KCTAUkh+fSSePFZRRA=;
 b=BN/fWqtqI4ZgKmI9BbtSMM5Wqa7DaToEUtSOeEKAy55OlWsXqGAJDnYPVdOK2qSn2O
 vUk5ICZnnewoBlPw7clMUnq0Q0n4Ty4isjhuJRxK0hcKBvAKstglCZ5ztrV6akX0Mx3c
 8y28oanCo3I9N19jzIkXbYe0r3TW/4L6BCPp/ksc+mS3koExr0qLVGAAWaEX+q9Da1ND
 C6FADvushIxiGK4Nx9p1hDBoFlFy5gHbjxAujrFIRjnCICp+awA+n6MsrKlDRpkIXazD
 mVVx3lyzSWByU3e1LY31LvolxUVw9hMd/gRVGamLmHMd2rw2kGx3PwuHI6lTvHKLHqY+
 cpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+guheRGNxwsLT53HDTDKJqAj8KCTAUkh+fSSePFZRRA=;
 b=nclPiqdpXoMoNB8zWVW2lEgwokQwoAZ3znrKydGkoC1KUqSh08MX6BwDLr9ec2VwKT
 90mOkO9TwYRZpO8pyU8e3W8orcbgUpFdo+Z0rqEpaRDVwsvBbasTSTtRYC7FDXopr5ul
 GZ4p5FnCjF1jBocM7DN/+WCT+IJjArFsUK2RPdM9t6S0R3FAAgKAvh1xadHDGiIGMAjW
 SLsRPDgRUeBLsFAzLjIyY6TS1bRcDY+bMAgTipPBtfP4LsKVnUDZazVx/ehuyMEXDiAy
 dTnfBfd1u1V3OtQW8iAgvgMdUpg9sn7FKXmPh6vriu/G17JNaVHQuS3o1S02hsoNmykh
 BBwg==
X-Gm-Message-State: AO0yUKX3jr5rrlod+foUgSty0mvOLUhsGYfRxpzxD/p4ER+7GTFvTSev
 d7xCeo1CE2/6pImEFEZXhRZUdA/hjRo=
X-Google-Smtp-Source: AK7set8l7w18I4EsWsPbvUFothQXJLbazvbwrhpsqP2V8FqidHws0wI9ht1SokqMWB0HLCsEPRNE4zsIqS4=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6902:30d:b0:881:39d0:46ee with SMTP id
 b13-20020a056902030d00b0088139d046eemr91253ybs.522.1675712984253; Mon, 06 Feb
 2023 11:49:44 -0800 (PST)
Date: Mon,  6 Feb 2023 19:49:34 +0000
In-Reply-To: <20230206194936.168843-1-titusr@google.com>
Mime-Version: 1.0
References: <20230206194936.168843-1-titusr@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230206194936.168843-2-titusr@google.com>
Subject: [PATCH 1/3] hw/gpio: add PCA6414 i2c GPIO expander
From: Titus Rwantare <titusr@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=32FnhYwYKCjcmbmnlkZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--titusr.bounces.google.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a simple i2c device that allows i2c capable devices to have
GPIOs.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/arm/Kconfig                  |   1 +
 hw/gpio/meson.build             |   1 +
 hw/gpio/pca_i2c_gpio.c          | 362 ++++++++++++++++++++++++++++++++
 hw/gpio/trace-events            |   5 +
 hw/i2c/Kconfig                  |   4 +
 include/hw/gpio/pca_i2c_gpio.h  |  72 +++++++
 tests/qtest/meson.build         |   1 +
 tests/qtest/pca_i2c_gpio-test.c | 169 +++++++++++++++
 8 files changed, 615 insertions(+)
 create mode 100644 hw/gpio/pca_i2c_gpio.c
 create mode 100644 include/hw/gpio/pca_i2c_gpio.h
 create mode 100644 tests/qtest/pca_i2c_gpio-test.c

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d157de9b8..1b533ddd76 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -418,6 +418,7 @@ config NPCM7XX
     select SSI
     select UNIMP
     select PCA954X
+    select PCA_I2C_GPIO
 
 config FSL_IMX25
     bool
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index b726e6d27a..1e5b602002 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -12,3 +12,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
+softmmu_ss.add(when: 'CONFIG_PCA_I2C_GPIO', if_true: files('pca_i2c_gpio.c'))
diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c
new file mode 100644
index 0000000000..afae497a22
--- /dev/null
+++ b/hw/gpio/pca_i2c_gpio.c
@@ -0,0 +1,362 @@
+/*
+ * NXP PCA I2C GPIO Expanders
+ *
+ * Low-voltage translating 16-bit I2C/SMBus GPIO expander with interrupt output,
+ * reset, and configuration registers
+ *
+ * Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf
+ *
+ * Copyright 2023 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * These devices, by default, are configured to input only. The configuration is
+ * settable through qom/qmp, or i2c.To set some pins as inputs before boot, use
+ * the following in the board file of the machine:
+ *      object_property_set_uint(Object *obj, const char *name,
+ *                               uint64_t value, Error **errp);
+ * specifying name as "gpio_config" and the value as a bitfield of the inputs
+ * e.g. for the pca6416, a value of 0xFFF0, sets pins 0-3 as outputs and
+ * 4-15 as inputs.
+ * This value can also be set at runtime through qmp externally, or by
+ * writing to the config register using i2c.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/gpio/pca_i2c_gpio.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qapi/visitor.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "trace.h"
+
+/*
+ * compare new_output to curr_output and update irq to match new_output
+ *
+ * The Input port registers (registers 0 and 1) reflect the incoming logic
+ * levels of the pins, regardless of whether the pin is defined as an input or
+ * an output by the Configuration register.
+ */
+static void pca_i2c_update_irqs(PCAGPIOState *ps)
+{
+    PCAGPIOClass *pc = PCA_I2C_GPIO_GET_CLASS(ps);
+    uint16_t out_diff = ps->new_output ^ ps->curr_output;
+    uint16_t in_diff = ps->new_input ^ ps->curr_input;
+    uint16_t mask, pin_i;
+
+    if (in_diff || out_diff) {
+        for (int i = 0; i < pc->num_pins; i++) {
+            mask = BIT(i);
+            /* pin must be configured as an output to be set here */
+            if (out_diff & ~ps->config & mask) {
+                pin_i = mask & ps->new_output;
+                qemu_set_irq(ps->output[i], pin_i > 0);
+                ps->curr_output &= ~mask;
+                ps->curr_output |= pin_i;
+            }
+
+            if (in_diff & mask) {
+                ps->curr_input &= ~mask;
+                ps->curr_input |= mask & ps->new_input;
+            }
+        }
+        /* make diff = 0 */
+        ps->new_input = ps->curr_input;
+    }
+}
+
+static void pca_i2c_irq_handler(void *opaque, int n, int level)
+{
+    PCAGPIOState *ps = opaque;
+    PCAGPIOClass *pc = PCA_I2C_GPIO_GET_CLASS(opaque);
+    uint16_t mask = BIT(n);
+
+    g_assert(n < pc->num_pins);
+    g_assert(n >= 0);
+
+    ps->new_input &= ~mask;
+
+    if (level > 0) {
+        ps->new_input |= BIT(n);
+    }
+
+    pca_i2c_update_irqs(ps);
+}
+
+/* slave to master */
+static uint8_t pca6416_recv(I2CSlave *i2c)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
+    uint8_t data;
+
+    switch (ps->command) {
+    case PCA6416_INPUT_PORT_0:
+        data = ps->curr_input;
+        break;
+
+    case PCA6416_INPUT_PORT_1:
+        data = ps->curr_input >> 8;
+        break;
+
+    /*
+     * i2c reads to the output registers reflect the values written
+     * NOT the actual values of the gpios
+     */
+    case PCA6416_OUTPUT_PORT_0:
+        data = ps->new_output;
+        break;
+
+    case PCA6416_OUTPUT_PORT_1:
+        data = ps->new_output >> 8;
+        break;
+
+    case PCA6416_POLARITY_INVERSION_PORT_0:
+        data = ps->polarity_inv;
+        break;
+
+    case PCA6416_POLARITY_INVERSION_PORT_1:
+        data = ps->polarity_inv >> 8;
+        break;
+
+    case PCA6416_CONFIGURATION_PORT_0:
+        data = ps->config;
+        break;
+
+    case PCA6416_CONFIGURATION_PORT_1:
+        data = ps->config >> 8;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: reading from unsupported register 0x%02x",
+                      __func__, ps->command);
+        data = 0xFF;
+        break;
+    }
+
+    trace_pca_i2c_recv(DEVICE(ps)->canonical_path, ps->command, data);
+    return data;
+}
+
+/* master to slave */
+static int pca6416_send(I2CSlave *i2c, uint8_t data)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
+    if (ps->i2c_cmd) {
+        ps->command = data;
+        ps->i2c_cmd = false;
+        return 0;
+    }
+
+    trace_pca_i2c_send(DEVICE(ps)->canonical_path, ps->command, data);
+
+    switch (ps->command) {
+    case PCA6416_INPUT_PORT_0:
+    case PCA6416_INPUT_PORT_1:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing to read only reg: 0x%02x",
+                      __func__, ps->command);
+        break;
+
+    case PCA6416_OUTPUT_PORT_0:
+        ps->new_output &= 0xFF00;
+        ps->new_output |= data;
+        break;
+
+    case PCA6416_OUTPUT_PORT_1:
+        ps->new_output &= 0xFF;
+        ps->new_output |= data << 8;
+        break;
+
+    case PCA6416_POLARITY_INVERSION_PORT_0:
+        ps->polarity_inv &= 0xFF00;
+        ps->polarity_inv |= data;
+        break;
+
+    case PCA6416_POLARITY_INVERSION_PORT_1:
+        ps->polarity_inv &= 0xFF;
+        ps->polarity_inv |= data << 8;
+        break;
+
+    case PCA6416_CONFIGURATION_PORT_0:
+        ps->config &= 0xFF00;
+        ps->config |= data;
+        break;
+
+    case PCA6416_CONFIGURATION_PORT_1:
+        ps->config &= 0xFF;
+        ps->config |= data << 8;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: writing to unsupported register\n",
+                      __func__);
+        return -1;
+    }
+
+    pca_i2c_update_irqs(ps);
+    return 0;
+}
+
+static int pca_i2c_event(I2CSlave *i2c, enum i2c_event event)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
+
+    switch (event) {
+    case I2C_START_RECV:
+        trace_pca_i2c_event(DEVICE(ps)->canonical_path, "START_RECV");
+        break;
+
+    case I2C_START_SEND:
+        trace_pca_i2c_event(DEVICE(ps)->canonical_path, "START_SEND");
+        ps->i2c_cmd = true;
+        break;
+
+    case I2C_FINISH:
+        trace_pca_i2c_event(DEVICE(ps)->canonical_path, "FINISH");
+        break;
+
+    case I2C_NACK:
+        trace_pca_i2c_event(DEVICE(ps)->canonical_path, "NACK");
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: %s: unknown event 0x%x\n",
+                      DEVICE(ps)->canonical_path, __func__, event);
+        return -1;
+    }
+
+    return 0;
+}
+
+static void pca_i2c_config_get(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(obj);
+    visit_type_uint16(v, name, &ps->config, errp);
+}
+
+static void pca_i2c_config_set(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(obj);
+    if (!visit_type_uint16(v, name, &ps->config, errp)) {
+        return;
+    }
+    pca_i2c_update_irqs(ps);
+}
+
+
+static void pca_i2c_input_get(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(obj);
+    visit_type_uint16(v, name, &ps->curr_input, errp);
+}
+
+static void pca_i2c_input_set(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(obj);
+    if (!visit_type_uint16(v, name, &ps->new_input, errp)) {
+        return;
+    }
+    pca_i2c_update_irqs(ps);
+}
+
+static void pca_i2c_output_get(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(obj);
+    visit_type_uint16(v, name, &ps->curr_output, errp);
+}
+
+static void pca_i2c_output_set(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(obj);
+    if (!visit_type_uint16(v, name, &ps->new_output, errp)) {
+        return;
+    }
+    pca_i2c_update_irqs(ps);
+}
+
+static void pca_i2c_realize(DeviceState *dev, Error **errp)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(dev);
+    pca_i2c_update_irqs(ps);
+}
+
+static const VMStateDescription vmstate_pca_i2c_gpio = {
+    .name = TYPE_PCA_I2C_GPIO,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_I2C_SLAVE(parent, PCAGPIOState),
+        VMSTATE_UINT16(polarity_inv, PCAGPIOState),
+        VMSTATE_UINT16(config, PCAGPIOState),
+        VMSTATE_UINT16(curr_input, PCAGPIOState),
+        VMSTATE_UINT16(curr_output, PCAGPIOState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void pca6416_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    PCAGPIOClass *pc = PCA_I2C_GPIO_CLASS(klass);
+
+    dc->desc = "PCA6416 16-bit I/O expander";
+    dc->realize = pca_i2c_realize;
+    dc->vmsd = &vmstate_pca_i2c_gpio;
+
+    k->event = pca_i2c_event;
+    k->recv = pca6416_recv;
+    k->send = pca6416_send;
+
+    pc->num_pins = PCA6416_NUM_PINS;
+}
+
+static void pca_i2c_gpio_init(Object *obj)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(obj);
+    PCAGPIOClass *pc = PCA_I2C_GPIO_GET_CLASS(obj);
+    DeviceState *dev = DEVICE(obj);
+
+    ps->new_output = PCA_I2C_OUTPUT_DEFAULT;
+    ps->config = PCA_I2C_CONFIG_DEFAULT;
+
+    object_property_add(obj, "gpio_input", "uint16",
+                        pca_i2c_input_get,
+                        pca_i2c_input_set, NULL, NULL);
+    object_property_add(obj, "gpio_output", "uint16",
+                        pca_i2c_output_get,
+                        pca_i2c_output_set, NULL, NULL);
+    object_property_add(obj, "gpio_config", "uint16",
+                        pca_i2c_config_get,
+                        pca_i2c_config_set, NULL, NULL);
+    qdev_init_gpio_in(dev, pca_i2c_irq_handler, pc->num_pins);
+    qdev_init_gpio_out(dev, ps->output, pc->num_pins);
+}
+
+static const TypeInfo pca_gpio_types[] = {
+    {
+    .name = TYPE_PCA_I2C_GPIO,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(PCAGPIOState),
+    .instance_init = pca_i2c_gpio_init,
+    .class_size = sizeof(PCAGPIOClass),
+    .abstract = true,
+    },
+    {
+    .name = TYPE_PCA6416_GPIO,
+    .parent = TYPE_PCA_I2C_GPIO,
+    .class_init = pca6416_gpio_class_init,
+    },
+};
+
+DEFINE_TYPES(pca_gpio_types);
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 9736b362ac..3fb0685096 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -31,3 +31,8 @@ sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " val
 # aspeed_gpio.c
 aspeed_gpio_read(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
 aspeed_gpio_write(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
+
+# pca_i2c_gpio.c
+pca_i2c_event(const char *id, const char *event) "%s: %s"
+pca_i2c_recv(const char *id, uint8_t cmd, uint8_t data) "%s cmd: 0x%" PRIx8 " data 0x%" PRIx8
+pca_i2c_send(const char *id, uint8_t cmd, uint8_t data) "%s cmd: 0x%" PRIx8 " data 0x%" PRIx8
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 14886b35da..b59a79fddf 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -42,6 +42,10 @@ config PCA954X
     bool
     select I2C
 
+config PCA_I2C_GPIO
+    bool
+    select I2C
+
 config PMBUS
     bool
     select SMBUS
diff --git a/include/hw/gpio/pca_i2c_gpio.h b/include/hw/gpio/pca_i2c_gpio.h
new file mode 100644
index 0000000000..a10897c0e0
--- /dev/null
+++ b/include/hw/gpio/pca_i2c_gpio.h
@@ -0,0 +1,72 @@
+/*
+ * NXP PCA6416A
+ * Low-voltage translating 16-bit I2C/SMBus GPIO expander with interrupt output,
+ * reset, and configuration registers
+ *
+ * Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf
+ *
+ * Note: Polarity inversion emulation not implemented
+ *
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef PCA_I2C_GPIO_H
+#define PCA_I2C_GPIO_H
+
+#include "hw/i2c/i2c.h"
+#include "qom/object.h"
+
+#define PCA6416_NUM_PINS         16
+
+typedef struct PCAGPIOClass {
+    I2CSlaveClass parent;
+
+    uint8_t num_pins;
+} PCAGPIOClass;
+
+typedef struct PCAGPIOState {
+    I2CSlave parent;
+
+    uint16_t polarity_inv;
+    uint16_t config;
+
+    /* the values of the gpio pins are mirrored in these integers */
+    uint16_t curr_input;
+    uint16_t curr_output;
+    uint16_t new_input;
+    uint16_t new_output;
+
+    /*
+     * Note that these outputs need to be consumed by some other input
+     * to be useful, qemu ignores writes to disconnected gpio pins
+     */
+    qemu_irq output[PCA6416_NUM_PINS];
+
+    /* i2c transaction info */
+    uint8_t command;
+    bool i2c_cmd;
+
+} PCAGPIOState;
+
+#define TYPE_PCA_I2C_GPIO "pca_i2c_gpio"
+OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_GPIO)
+
+#define PCA6416_INPUT_PORT_0                 0x00 /* read */
+#define PCA6416_INPUT_PORT_1                 0x01 /* read */
+#define PCA6416_OUTPUT_PORT_0                0x02 /* read/write */
+#define PCA6416_OUTPUT_PORT_1                0x03 /* read/write */
+#define PCA6416_POLARITY_INVERSION_PORT_0    0x04 /* read/write */
+#define PCA6416_POLARITY_INVERSION_PORT_1    0x05 /* read/write */
+#define PCA6416_CONFIGURATION_PORT_0         0x06 /* read/write */
+#define PCA6416_CONFIGURATION_PORT_1         0x07 /* read/write */
+
+#define PCA6416_OUTPUT_DEFAULT               0xFFFF
+#define PCA6416_CONFIG_DEFAULT               0xFFFF
+
+#define PCA_I2C_OUTPUT_DEFAULT               0xFFFF
+#define PCA_I2C_CONFIG_DEFAULT               0xFFFF
+
+#define TYPE_PCA6416_GPIO "pca6416"
+
+#endif
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e97616d327..49f406af6b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -241,6 +241,7 @@ qos_test_ss.add(
   'ne2000-test.c',
   'tulip-test.c',
   'nvme-test.c',
+  'pca_i2c_gpio-test.c',
   'pca9552-test.c',
   'pci-test.c',
   'pcnet-test.c',
diff --git a/tests/qtest/pca_i2c_gpio-test.c b/tests/qtest/pca_i2c_gpio-test.c
new file mode 100644
index 0000000000..041ca34e22
--- /dev/null
+++ b/tests/qtest/pca_i2c_gpio-test.c
@@ -0,0 +1,169 @@
+/*
+ * QTest for PCA I2C GPIO expanders
+ *
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/gpio/pca_i2c_gpio.h"
+#include "libqtest-single.h"
+#include "libqos/i2c.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+#include "qemu/bitops.h"
+
+
+#define TEST_ID "pca_i2c_gpio-test"
+#define PCA_CONFIG_BYTE     0x55
+#define PCA_CONFIG_WORD     0x5555
+
+static uint16_t qmp_pca_gpio_get(const char *id, const char *property)
+{
+    QDict *response;
+    uint16_t ret;
+    response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
+                   "'property': %s } }", id, property);
+    g_assert(qdict_haskey(response, "return"));
+    ret = qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")));
+    qobject_unref(response);
+    return ret;
+}
+
+static void qmp_pca_gpio_set(const char *id, const char *property,
+                             uint16_t value)
+{
+    QDict *response;
+
+    response = qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %s, "
+                   "'property': %s, 'value': %u } }",
+                   id, property, value);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+static void test_set_input(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    uint8_t value;
+    uint16_t qmp_value;
+    /* configure pins to be inputs */
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_0, 0xFF);
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_1, 0xFF);
+
+    qmp_pca_gpio_set(TEST_ID, "gpio_input", 0xAAAA);
+    value = i2c_get8(i2cdev, PCA6416_INPUT_PORT_0);
+    g_assert_cmphex(value, ==, 0xAA);
+    value = i2c_get8(i2cdev, PCA6416_INPUT_PORT_1);
+    g_assert_cmphex(value, ==, 0xAA);
+
+    qmp_value = qmp_pca_gpio_get(TEST_ID, "gpio_input");
+    g_assert_cmphex(qmp_value, ==, 0xAAAA);
+}
+static void test_config(void *obj, void *data, QGuestAllocator *alloc)
+{
+
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    uint8_t value;
+    uint16_t qmp_value;
+    /* configure half the pins to be inputs */
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_0, PCA_CONFIG_BYTE);
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_1, PCA_CONFIG_BYTE);
+    value = i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_0);
+    g_assert_cmphex(value, ==, PCA_CONFIG_BYTE);
+
+    value = i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_1);
+    g_assert_cmphex(value, ==, PCA_CONFIG_BYTE);
+
+    /* the pins that match the config should be set, the rest are undef */
+    qmp_pca_gpio_set(TEST_ID, "gpio_input", 0xFFFF);
+    value = i2c_get8(i2cdev, PCA6416_INPUT_PORT_0);
+    g_assert_cmphex(value & PCA_CONFIG_BYTE, ==, 0x55);
+    value = i2c_get8(i2cdev, PCA6416_INPUT_PORT_1);
+    g_assert_cmphex(value & PCA_CONFIG_BYTE, ==, 0x55);
+    qmp_value = qmp_pca_gpio_get(TEST_ID, "gpio_input");
+    g_assert_cmphex(qmp_value & PCA_CONFIG_WORD, ==, 0x5555);
+
+    /*
+     * i2c will return the value written to the output register, not the values
+     * of the output pins, so we check only the configured pins
+     */
+    qmp_pca_gpio_set(TEST_ID, "gpio_output", 0xFFFF);
+    value = i2c_get8(i2cdev, PCA6416_OUTPUT_PORT_0);
+    g_assert_cmphex(value & ~PCA_CONFIG_BYTE, ==, 0xAA);
+    value = i2c_get8(i2cdev, PCA6416_OUTPUT_PORT_1);
+    g_assert_cmphex(value & ~PCA_CONFIG_BYTE, ==, 0xAA);
+
+    qmp_value = qmp_pca_gpio_get(TEST_ID, "gpio_output");
+    g_assert_cmphex(qmp_value & ~PCA_CONFIG_WORD, ==, 0xAAAA);
+}
+
+static void test_set_output(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    uint8_t value;
+    uint16_t qmp_value;
+    /* configure pins to be outputs */
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_0, 0);
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_1, 0);
+
+    qmp_pca_gpio_set(TEST_ID, "gpio_output", 0x5555);
+    value = i2c_get8(i2cdev, PCA6416_OUTPUT_PORT_0);
+    g_assert_cmphex(value, ==, 0x55);
+    value = i2c_get8(i2cdev, PCA6416_OUTPUT_PORT_1);
+    g_assert_cmphex(value, ==, 0x55);
+
+    qmp_value = qmp_pca_gpio_get(TEST_ID, "gpio_output");
+    g_assert_cmphex(qmp_value, ==, 0x5555);
+}
+
+static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    uint8_t value;
+
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_0, 0xFF);
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_1, 0xFF);
+    i2c_set8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_0, 0);
+    i2c_set8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_1, 0);
+
+    value = i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_0);
+    g_assert_cmphex(value, ==, 0xFF);
+
+    value = i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_1);
+    g_assert_cmphex(value, ==, 0xFF);
+
+    value = i2c_get8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_0);
+    g_assert_cmphex(value, ==, 0);
+
+    value = i2c_get8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_1);
+    g_assert_cmphex(value, ==, 0);
+
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_0, 0xAB);
+    value = i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_0);
+    g_assert_cmphex(value, ==, 0xAB);
+
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_1, 0xBC);
+    value = i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_1);
+    g_assert_cmphex(value, ==, 0xBC);
+
+}
+
+static void pca_i2c_gpio_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" TEST_ID ",address=0x78"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { 0x78 });
+    g_test_set_nonfatal_assertions();
+
+    qos_node_create_driver("pca6416", i2c_device_create);
+    qos_node_consumes("pca6416", "i2c-bus", &opts);
+
+    qos_add_test("tx-rx", "pca6416", test_tx_rx, NULL);
+    qos_add_test("set_output_gpio", "pca6416", test_set_output, NULL);
+    qos_add_test("set_input_gpio", "pca6416", test_set_input, NULL);
+    qos_add_test("follow_gpio_config", "pca6416", test_config, NULL);
+}
+libqos_init(pca_i2c_gpio_register_nodes);
-- 
2.39.1.519.gcb327c4b5f-goog


