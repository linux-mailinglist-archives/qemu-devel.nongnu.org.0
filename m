Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D196C2423
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 22:56:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peNTd-0005ay-T7; Mon, 20 Mar 2023 17:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UdYYZAYKCog5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com>)
 id 1peNTa-0005XU-Kd
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:34 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UdYYZAYKCog5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com>)
 id 1peNTW-0006Yr-UF
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:34 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-541888850d4so136872457b3.21
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679349329;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=7v9BBmW/hV7zJrGNIg4gLIF5VQ3yq0jB2Ae5FmH9ojY=;
 b=pVCN76odT3wEWMqF//2OOzW/wiS7Lk9wS1ta4POg3zNjFwFy8QedaGXuPnikWuqh9b
 MLlfbrwIvamz9v87EXmF/lTMzofr2LRM6zBqblUr+ubWCdb1xMKGZ6jkfU3AoMAC5AFz
 wft51RnWelE/3NSq7BX4QMdGJmG2DCkLz5INIt+b+L8kpMzWjCTc9ReAEWdyVa9bhr98
 iTtY8gADTMRNIrN8rnXd2aeA4QQJYUQPcYrpP00KZirI5ROqV4m5Zd5WGlvU5BXxQpIs
 QDC2gEdzBQtcuPN55tISwGi6P13nLLScDN5wbU0msYRaBJhnCQ+gsf3HzDPG1Xd1hLbN
 uOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679349329;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7v9BBmW/hV7zJrGNIg4gLIF5VQ3yq0jB2Ae5FmH9ojY=;
 b=QUqJ60DEf4KioIVLOQKp1d2Q0LtSyS+mBKRn31Jpn4ToTCiiChdSxkrEbNoRTwBv4N
 yNvGmWAw6YQReUce9McnL12uI8c+X/62qSO801ILhecwRUSsrWvayDbEsRGhhIZrCwj/
 B0Gim5tIqhQoLejY0EloOekKItgJUU27MeuqFMgOCEFWotkZmz/umPla1SXuFE14Z72e
 c4yMECtD1BQOil2E6XPfI0lwSjSmdFGzV5vsFTtxMOBD5gPglHBI9dQ6hsiksRmFtdII
 xV570kKQIYbt+RFkem/j4ujSong8CCAFqbnpWGFe8SotOhSXfdPHbKwilejxbzj3DTK0
 PfrQ==
X-Gm-Message-State: AO0yUKXX1OgUIVaryL4r4gYrqYqClyw+4BfsGHNccx1uXK1QXXNsQpBO
 0H9DE3hK44PYEy6T3bXuJvJa38nwYd8=
X-Google-Smtp-Source: AK7set/QaXtmlKY9dXL6THISQEZ7/x9YBlp1Q4MVq19ASjX6WtcOLy4uCJUb/xMgt5qwksMtalC8KB0FBwE=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:ca10:0:b0:544:6828:3c09 with SMTP id
 p16-20020a81ca10000000b0054468283c09mr11022246ywi.0.1679349329662; Mon, 20
 Mar 2023 14:55:29 -0700 (PDT)
Date: Mon, 20 Mar 2023 21:54:56 +0000
In-Reply-To: <20230320215500.722960-1-titusr@google.com>
Mime-Version: 1.0
References: <20230320215500.722960-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230320215500.722960-3-titusr@google.com>
Subject: [PATCH v3 2/5] hw/gpio: add PCA953x i2c GPIO expanders
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3UdYYZAYKCog5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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

The PCA6416 is an i2c device with 16 GPIO pins, the PCA9538 has 8 pins.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/gpio/Kconfig                 |   5 +
 hw/gpio/meson.build             |   1 +
 hw/gpio/pca_i2c_gpio.c          | 392 ++++++++++++++++++++++++++++++++
 hw/gpio/trace-events            |   5 +
 include/hw/gpio/pca_i2c_gpio.h  |  67 ++++++
 roms/edk2                       |   2 +-
 roms/openbios                   |   2 +-
 roms/opensbi                    |   2 +-
 roms/seabios                    |   2 +-
 tests/lcitool/libvirt-ci        |   2 +-
 tests/qtest/meson.build         |   1 +
 tests/qtest/pca_i2c_gpio-test.c | 188 +++++++++++++++
 12 files changed, 664 insertions(+), 5 deletions(-)
 create mode 100644 hw/gpio/pca_i2c_gpio.c
 create mode 100644 include/hw/gpio/pca_i2c_gpio.h
 create mode 100644 tests/qtest/pca_i2c_gpio-test.c

diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index d2cf3accc8..80395af197 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -16,3 +16,8 @@ config GPIO_PWR
=20
 config SIFIVE_GPIO
     bool
+
+config PCA_I2C_GPIO
+    bool
+    depends on I2C
+    default y if I2C_DEVICES
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index b726e6d27a..1e5b602002 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -12,3 +12,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_=
gpio.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c')=
)
+softmmu_ss.add(when: 'CONFIG_PCA_I2C_GPIO', if_true: files('pca_i2c_gpio.c=
'))
diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c
new file mode 100644
index 0000000000..00ba343f95
--- /dev/null
+++ b/hw/gpio/pca_i2c_gpio.c
@@ -0,0 +1,392 @@
+/*
+ * NXP PCA I2C GPIO Expanders
+ *
+ * Low-voltage translating 16-bit I2C/SMBus GPIO expander with interrupt o=
utput,
+ * reset, and configuration registers
+ *
+ * Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf
+ *
+ * Copyright 2023 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * To assert some input pins before boot, use the following in the board f=
ile of
+ * the machine:
+ *      object_property_set_uint(Object *obj, const char *name,
+ *                               uint64_t value, Error **errp);
+ * specifying name as "gpio_config" and the value as a bitfield of the inp=
uts
+ * e.g. for the pca6416, a value of 0xFFF0, configures pins 0-3 as outputs=
 and
+ * 4-15 as inputs.
+ * Then using name "gpio_input" with value "0x0F00" would raise GPIOs 8-11=
.
+ *
+ * This value can also be set at runtime through qmp externally, or by
+ * writing to the config register using i2c. The guest driver should gener=
ally
+ * control the config register, but exposing it via qmp allows external te=
sting.
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
+#include "qemu/bitops.h"
+#include "trace.h"
+
+/*
+ * compare new_output to curr_output and update irq to match new_output
+ *
+ * The Input port registers (registers 0 and 1) reflect the incoming logic
+ * levels of the pins, regardless of whether the pin is defined as an inpu=
t or
+ * an output by the Configuration register.
+ */
+static void pca_i2c_update_irqs(PCAGPIOState *ps)
+{
+    PCAGPIOClass *pc =3D PCA_I2C_GPIO_GET_CLASS(ps);
+    uint16_t out_diff =3D ps->new_output ^ ps->curr_output;
+    uint16_t in_diff =3D ps->new_input ^ ps->curr_input;
+    uint16_t mask, pin_i;
+
+    if (in_diff || out_diff) {
+        for (int i =3D 0; i < pc->num_pins; i++) {
+            mask =3D BIT(i);
+            /* pin must be configured as an output to be set here */
+            if (out_diff & ~ps->config & mask) {
+                pin_i =3D mask & ps->new_output;
+                qemu_set_irq(ps->output[i], pin_i > 0);
+                ps->curr_output &=3D ~mask;
+                ps->curr_output |=3D pin_i;
+            }
+
+            if (in_diff & mask) {
+                ps->curr_input &=3D ~mask;
+                ps->curr_input |=3D mask & ps->new_input;
+            }
+        }
+        /* make diff =3D 0 */
+        ps->new_input =3D ps->curr_input;
+    }
+}
+
+static void pca_i2c_irq_handler(void *opaque, int n, int level)
+{
+    PCAGPIOState *ps =3D opaque;
+    PCAGPIOClass *pc =3D PCA_I2C_GPIO_GET_CLASS(opaque);
+    uint16_t mask =3D BIT(n);
+
+    g_assert(n < pc->num_pins);
+    g_assert(n >=3D 0);
+
+    ps->new_input &=3D ~mask;
+
+    if (level > 0) {
+        ps->new_input |=3D BIT(n);
+    }
+
+    pca_i2c_update_irqs(ps);
+}
+
+/* slave to master */
+static uint8_t _pca953x_recv(I2CSlave *i2c, uint32_t shift)
+{
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(i2c);
+    uint8_t data;
+
+    switch (ps->command) {
+    case PCA953x_INPUT_PORT:
+        data =3D extract16(ps->curr_input, shift, 8);
+        break;
+    /*
+     * i2c reads to the output registers reflect the values written
+     * NOT the actual values of the gpios
+     */
+    case PCA953x_OUTPUT_PORT:
+        data =3D extract16(ps->new_output, shift, 8);
+        break;
+
+    case PCA953x_POLARITY_INVERSION_PORT:
+        data =3D extract16(ps->polarity_inv, shift, 8);
+        break;
+
+    case PCA953x_CONFIGURATION_PORT:
+        data =3D extract16(ps->config, shift, 8);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: reading from unsupported register 0x%02x",
+                      __func__, ps->command);
+        data =3D 0xFF;
+        break;
+    }
+
+    trace_pca_i2c_recv(DEVICE(ps)->canonical_path, ps->command, shift, dat=
a);
+    return data;
+}
+
+static uint8_t pca6416_recv(I2CSlave *i2c)
+{
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(i2c);
+    uint32_t shift =3D ps->command & 1 ? 8 : 0;
+
+    /* Transform command into 4 port equivalent */
+    ps->command =3D ps->command >> 1;
+
+    return _pca953x_recv(i2c, shift);
+}
+
+static uint8_t pca953x_recv(I2CSlave *i2c)
+{
+    return _pca953x_recv(i2c, 0);
+}
+
+/* master to slave */
+static int _pca953x_send(I2CSlave *i2c, uint32_t shift, uint8_t data)
+{
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(i2c);
+
+    if (ps->i2c_cmd) {
+        ps->command =3D data;
+        ps->i2c_cmd =3D false;
+        return 0;
+    }
+
+    trace_pca_i2c_send(DEVICE(ps)->canonical_path, ps->command, shift, dat=
a);
+
+    switch (ps->command) {
+    case PCA953x_INPUT_PORT:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing to read only reg: 0x%0=
2x",
+                      __func__, ps->command);
+        break;
+    case PCA953x_OUTPUT_PORT:
+        ps->new_output =3D deposit16(ps->new_output, shift, 8, data);
+        break;
+
+    case PCA953x_POLARITY_INVERSION_PORT:
+        ps->polarity_inv =3D deposit16(ps->polarity_inv, shift, 8, data);
+        break;
+
+    case PCA953x_CONFIGURATION_PORT:
+        ps->config =3D deposit16(ps->config, shift, 8, data);
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
+static int pca6416_send(I2CSlave *i2c, uint8_t data)
+{
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(i2c);
+    uint32_t shift =3D ps->command & 1 ? 8 : 0;
+
+    /* Transform command into 4 port equivalent */
+    ps->command =3D ps->command >> 1;
+
+    return _pca953x_send(i2c, shift, data);
+}
+
+static int pca953x_send(I2CSlave *i2c, uint8_t data)
+{
+    return _pca953x_send(i2c, 0, data);
+}
+
+static int pca_i2c_event(I2CSlave *i2c, enum i2c_event event)
+{
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(i2c);
+
+    switch (event) {
+    case I2C_START_RECV:
+        trace_pca_i2c_event(DEVICE(ps)->canonical_path, "START_RECV");
+        break;
+
+    case I2C_START_SEND:
+        trace_pca_i2c_event(DEVICE(ps)->canonical_path, "START_SEND");
+        ps->i2c_cmd =3D true;
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
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(obj);
+    visit_type_uint16(v, name, &ps->config, errp);
+}
+
+static void pca_i2c_config_set(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(obj);
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
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(obj);
+    visit_type_uint16(v, name, &ps->curr_input, errp);
+}
+
+static void pca_i2c_input_set(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(obj);
+    if (!visit_type_uint16(v, name, &ps->new_input, errp)) {
+        return;
+    }
+    pca_i2c_update_irqs(ps);
+}
+
+static void pca_i2c_output_get(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(obj);
+    visit_type_uint16(v, name, &ps->curr_output, errp);
+}
+
+static void pca_i2c_output_set(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(obj);
+    if (!visit_type_uint16(v, name, &ps->new_output, errp)) {
+        return;
+    }
+    pca_i2c_update_irqs(ps);
+}
+
+static void pca_i2c_enter_reset(Object *obj, ResetType type)
+{
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(obj);
+
+    ps->polarity_inv =3D 0;
+    ps->config =3D 0;
+    ps->new_input =3D 0;
+    ps->new_output =3D 0;
+    ps->command =3D 0;
+
+    pca_i2c_update_irqs(ps);
+}
+
+
+static const VMStateDescription vmstate_pca_i2c_gpio =3D {
+    .name =3D TYPE_PCA_I2C_GPIO,
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
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
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
+    PCAGPIOClass *pc =3D PCA_I2C_GPIO_CLASS(klass);
+
+    dc->desc =3D "PCA6416 16-bit I/O expander";
+    pc->num_pins =3D PCA6416_NUM_PINS;
+
+    k->recv =3D pca6416_recv;
+    k->send =3D pca6416_send;
+}
+
+static void pca9538_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
+    PCAGPIOClass *pc =3D PCA_I2C_GPIO_CLASS(klass);
+
+    dc->desc =3D "PCA9538 8-bit I/O expander";
+    pc->num_pins =3D PCA9538_NUM_PINS;
+
+    k->recv =3D pca953x_recv;
+    k->send =3D pca953x_send;
+}
+
+static void pca_i2c_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+
+    dc->vmsd =3D &vmstate_pca_i2c_gpio;
+    rc->phases.enter =3D pca_i2c_enter_reset;
+    k->event =3D pca_i2c_event;
+}
+
+static void pca_i2c_gpio_init(Object *obj)
+{
+    PCAGPIOState *ps =3D PCA_I2C_GPIO(obj);
+    PCAGPIOClass *pc =3D PCA_I2C_GPIO_GET_CLASS(obj);
+    DeviceState *dev =3D DEVICE(obj);
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
+static const TypeInfo pca_gpio_types[] =3D {
+    {
+        .name =3D TYPE_PCA_I2C_GPIO,
+        .parent =3D TYPE_I2C_SLAVE,
+        .instance_size =3D sizeof(PCAGPIOState),
+        .instance_init =3D pca_i2c_gpio_init,
+        .class_size =3D sizeof(PCAGPIOClass),
+        .class_init =3D pca_i2c_gpio_class_init,
+        .abstract =3D true,
+    },
+    {
+        .name =3D TYPE_PCA6416_GPIO,
+        .parent =3D TYPE_PCA_I2C_GPIO,
+        .class_init =3D pca6416_gpio_class_init,
+    },
+    {
+    .name =3D TYPE_PCA9538_GPIO,
+    .parent =3D TYPE_PCA_I2C_GPIO,
+    .class_init =3D pca9538_gpio_class_init,
+    },
+};
+
+DEFINE_TYPES(pca_gpio_types);
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 9736b362ac..af9f9acfb8 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -31,3 +31,8 @@ sifive_gpio_update_output_irq(int64_t line, int64_t value=
) "line %" PRIi64 " val
 # aspeed_gpio.c
 aspeed_gpio_read(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " v=
alue 0x%" PRIx64
 aspeed_gpio_write(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " =
value 0x%" PRIx64
+
+# pca_i2c_gpio.c
+pca_i2c_event(const char *id, const char *event) "%s: %s"
+pca_i2c_recv(const char *id, uint8_t cmd, uint32_t shift, uint8_t data) "%=
s cmd: 0x%" PRIx8 "shift: %" PRIi32 " data 0x%" PRIx8
+pca_i2c_send(const char *id, uint8_t cmd, uint32_t shift, uint8_t data) "%=
s cmd: 0x%" PRIx8 "shift: %" PRIi32 " data 0x%" PRIx8
diff --git a/include/hw/gpio/pca_i2c_gpio.h b/include/hw/gpio/pca_i2c_gpio.=
h
new file mode 100644
index 0000000000..a4220105e8
--- /dev/null
+++ b/include/hw/gpio/pca_i2c_gpio.h
@@ -0,0 +1,67 @@
+/*
+ * NXP PCA6416A
+ * Low-voltage translating 16-bit I2C/SMBus GPIO expander with interrupt o=
utput,
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
+#define PCA_I2C_MAX_PINS                     16
+#define PCA6416_NUM_PINS                     16
+#define PCA9538_NUM_PINS                     8
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
+    qemu_irq output[PCA_I2C_MAX_PINS];
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
+#define PCA953x_INPUT_PORT                   0x00 /* read */
+#define PCA953x_OUTPUT_PORT                  0x01 /* read/write */
+#define PCA953x_POLARITY_INVERSION_PORT      0x02 /* read/write */
+#define PCA953x_CONFIGURATION_PORT           0x03 /* read/write */
+
+#define PCA_I2C_CONFIG_DEFAULT               0
+
+#define TYPE_PCA6416_GPIO "pca6416"
+#define TYPE_PCA9538_GPIO "pca9538"
+
+#endif
diff --git a/roms/edk2 b/roms/edk2
index f80f052277..b24306f15d 160000
--- a/roms/edk2
+++ b/roms/edk2
@@ -1 +1 @@
-Subproject commit f80f052277c88a67c55e107b550f504eeea947d3
+Subproject commit b24306f15daa2ff8510b06702114724b33895d3c
diff --git a/roms/openbios b/roms/openbios
index af97fd7af5..0e0afae657 160000
--- a/roms/openbios
+++ b/roms/openbios
@@ -1 +1 @@
-Subproject commit af97fd7af5e7c18f591a7b987291d3db4ffb28b5
+Subproject commit 0e0afae6579c1efe9f0d85505b75ffe989554133
diff --git a/roms/opensbi b/roms/opensbi
index 6b5188ca14..4489876e93 160000
--- a/roms/opensbi
+++ b/roms/opensbi
@@ -1 +1 @@
-Subproject commit 6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8
+Subproject commit 4489876e933d8ba0d8bc6c64bae71e295d45faac
diff --git a/roms/seabios b/roms/seabios
index ea1b7a0733..3208b098f5 160000
--- a/roms/seabios
+++ b/roms/seabios
@@ -1 +1 @@
-Subproject commit ea1b7a0733906b8425d948ae94fba63c32b1d425
+Subproject commit 3208b098f51a9ef96d0dfa71d5ec3a3eaec88f0a
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 232f41f160..e3eb28cf2e 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 232f41f160d4567b8c82dd52aa96c2bc3a5b75c1
+Subproject commit e3eb28cf2e17fbcf7fe7e19505ee432b8ec5bbb5
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 85ea4e8d99..68cd101f7a 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -244,6 +244,7 @@ qos_test_ss.add(
   'ne2000-test.c',
   'tulip-test.c',
   'nvme-test.c',
+  'pca_i2c_gpio-test.c',
   'pca9552-test.c',
   'pci-test.c',
   'pcnet-test.c',
diff --git a/tests/qtest/pca_i2c_gpio-test.c b/tests/qtest/pca_i2c_gpio-tes=
t.c
new file mode 100644
index 0000000000..2bb4c6a664
--- /dev/null
+++ b/tests/qtest/pca_i2c_gpio-test.c
@@ -0,0 +1,188 @@
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
+#define PCA6416_INPUT_PORT_0                 0x00 /* read */
+#define PCA6416_INPUT_PORT_1                 0x01 /* read */
+#define PCA6416_OUTPUT_PORT_0                0x02 /* read/write */
+#define PCA6416_OUTPUT_PORT_1                0x03 /* read/write */
+#define PCA6416_POLARITY_INVERSION_PORT_0    0x04 /* read/write */
+#define PCA6416_POLARITY_INVERSION_PORT_1    0x05 /* read/write */
+#define PCA6416_CONFIGURATION_PORT_0         0x06 /* read/write */
+#define PCA6416_CONFIGURATION_PORT_1         0x07 /* read/write */
+
+
+#define TEST_ID "pca_i2c_gpio-test"
+#define PCA_CONFIG_BYTE         0x55
+#define PCA_CONFIG_BYTE_UPPER   0xAA
+#define PCA_CONFIG_WORD         0xAA55
+
+static uint16_t qmp_pca_gpio_get(const char *id, const char *property)
+{
+    QDict *response;
+    uint16_t ret;
+    response =3D qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
+                   "'property': %s } }", id, property);
+    g_assert(qdict_haskey(response, "return"));
+    ret =3D qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")))=
;
+    qobject_unref(response);
+    return ret;
+}
+
+static void qmp_pca_gpio_set(const char *id, const char *property,
+                             uint16_t value)
+{
+    QDict *response;
+
+    response =3D qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %s, "
+                   "'property': %s, 'value': %u } }",
+                   id, property, value);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+static void test_set_input(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+    uint8_t value;
+    uint16_t qmp_value;
+    /* configure pins to be inputs */
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_0, 0xFF);
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_1, 0xFF);
+
+    qmp_pca_gpio_set(TEST_ID, "gpio_input", 0xAAAA);
+    value =3D i2c_get8(i2cdev, PCA6416_INPUT_PORT_0);
+    g_assert_cmphex(value, =3D=3D, 0xAA);
+    value =3D i2c_get8(i2cdev, PCA6416_INPUT_PORT_1);
+    g_assert_cmphex(value, =3D=3D, 0xAA);
+
+    qmp_value =3D qmp_pca_gpio_get(TEST_ID, "gpio_input");
+    g_assert_cmphex(qmp_value, =3D=3D, 0xAAAA);
+}
+static void test_config(void *obj, void *data, QGuestAllocator *alloc)
+{
+
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+    uint8_t value;
+    uint16_t qmp_value;
+    /* configure half the pins to be inputs */
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_0, PCA_CONFIG_BYTE);
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_1, PCA_CONFIG_BYTE_UPPER);
+    value =3D i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_0);
+    g_assert_cmphex(value, =3D=3D, PCA_CONFIG_BYTE);
+
+    value =3D i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_1);
+    g_assert_cmphex(value, =3D=3D, PCA_CONFIG_BYTE_UPPER);
+
+    /* the pins that match the config should be set, the rest are undef */
+    qmp_pca_gpio_set(TEST_ID, "gpio_input", 0xFFFF);
+    value =3D i2c_get8(i2cdev, PCA6416_INPUT_PORT_0);
+    g_assert_cmphex(value & PCA_CONFIG_BYTE, =3D=3D, 0x55);
+    value =3D i2c_get8(i2cdev, PCA6416_INPUT_PORT_1);
+    g_assert_cmphex(value & PCA_CONFIG_BYTE_UPPER, =3D=3D, 0xAA);
+    qmp_value =3D qmp_pca_gpio_get(TEST_ID, "gpio_input");
+    g_assert_cmphex(qmp_value & PCA_CONFIG_WORD, =3D=3D, 0xAA55);
+
+    /*
+     * i2c will return the value written to the output register, not the v=
alues
+     * of the output pins, so we check only the configured pins
+     */
+    qmp_pca_gpio_set(TEST_ID, "gpio_output", 0xFFFF);
+    value =3D i2c_get8(i2cdev, PCA6416_OUTPUT_PORT_0);
+    g_assert_cmphex(value & ~PCA_CONFIG_BYTE, =3D=3D, 0xAA);
+    value =3D i2c_get8(i2cdev, PCA6416_OUTPUT_PORT_1);
+    g_assert_cmphex(value & ~PCA_CONFIG_BYTE_UPPER, =3D=3D, 0x55);
+
+    qmp_value =3D qmp_pca_gpio_get(TEST_ID, "gpio_output");
+    g_assert_cmphex(qmp_value & ~PCA_CONFIG_WORD, =3D=3D, 0x55AA);
+}
+
+static void test_set_output(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+    uint8_t value;
+    uint16_t qmp_value;
+    /* configure pins to be outputs */
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_0, 0);
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_1, 0);
+
+    qmp_pca_gpio_set(TEST_ID, "gpio_output", 0xBB55);
+    value =3D i2c_get8(i2cdev, PCA6416_OUTPUT_PORT_0);
+    g_assert_cmphex(value, =3D=3D, 0x55);
+    value =3D i2c_get8(i2cdev, PCA6416_OUTPUT_PORT_1);
+    g_assert_cmphex(value, =3D=3D, 0xBB);
+
+    qmp_value =3D qmp_pca_gpio_get(TEST_ID, "gpio_output");
+    g_assert_cmphex(qmp_value, =3D=3D, 0xBB55);
+}
+
+static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+    uint8_t value;
+
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_0, 0xFF);
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_1, 0xFF);
+    i2c_set8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_0, 0);
+    i2c_set8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_1, 0);
+
+    value =3D i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_0);
+    g_assert_cmphex(value, =3D=3D, 0xFF);
+
+    value =3D i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_1);
+    g_assert_cmphex(value, =3D=3D, 0xFF);
+
+    value =3D i2c_get8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_0);
+    g_assert_cmphex(value, =3D=3D, 0);
+
+    value =3D i2c_get8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_1);
+    g_assert_cmphex(value, =3D=3D, 0);
+
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_0, 0xAB);
+    value =3D i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_0);
+    g_assert_cmphex(value, =3D=3D, 0xAB);
+
+    i2c_set8(i2cdev, PCA6416_CONFIGURATION_PORT_1, 0xBC);
+    value =3D i2c_get8(i2cdev, PCA6416_CONFIGURATION_PORT_1);
+    g_assert_cmphex(value, =3D=3D, 0xBC);
+
+    i2c_set8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_0, 0xAB);
+    value =3D i2c_get8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_0);
+    g_assert_cmphex(value, =3D=3D, 0xAB);
+
+    i2c_set8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_1, 0x7C);
+    value =3D i2c_get8(i2cdev, PCA6416_POLARITY_INVERSION_PORT_1);
+    g_assert_cmphex(value, =3D=3D, 0x7C);
+
+}
+
+static void pca_i2c_gpio_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts =3D {
+        .extra_device_opts =3D "id=3D" TEST_ID ",address=3D0x78"
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
--=20
2.40.0.rc1.284.g88254d51c5-goog


