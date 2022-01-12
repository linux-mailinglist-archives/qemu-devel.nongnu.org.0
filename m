Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FEC48CF23
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 00:32:50 +0100 (CET)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7n6n-0007yZ-KG
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 18:32:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3sWPfYQcKCgw7qz563qs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--venture.bounces.google.com>)
 id 1n7n11-0002l7-Ef
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 18:26:52 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=39426
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3sWPfYQcKCgw7qz563qs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--venture.bounces.google.com>)
 id 1n7n0s-0004dp-Ll
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 18:26:44 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 x12-20020a25b3cc000000b00611a2cf881cso5722139ybf.6
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 15:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=CGdu3ZuG2ZZOi8/YNX7ReJ5XCkKFmScM8ssLpVh+Iik=;
 b=tDcI76q29BSnH5tVQnoeSsk6VPfKX1jWbNLKpE3S4LmYa8dA4273baV76tH6x2XEcA
 beNLRUqGBZVu32wkrmhgvpUto9pcO7+yLpzvvoq2zi+sWrGBCdW7SoUp0A62kZSHX6oG
 Q+Sfx67nDdM22NvQLYdHCL+jj52ar/sDiINjB7/S5LpiRvXAc+/ubf/Bs1opa3XjVgZn
 hh+dPekzK0IbAoNFxq4Gxn9mQZqiNrWNZIO3vz6knWesyKdvC+InAMCHMVSFMaXmy3xU
 Ecnule8rt6If4qpIFrOJulOd06d76Mq5zEPAfxCMEbi3a/KQtgNti05icgq+HA5i8ArN
 77gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=CGdu3ZuG2ZZOi8/YNX7ReJ5XCkKFmScM8ssLpVh+Iik=;
 b=pvaM1AjhNHNzfD9ykMR+QUkkX9Io5YdqLv8nFqHlx3aSl8F7mEvSqzFlcAP9wL4SwC
 m0klYQRt7cjt1X6Si/C6bTTvqh5tIwJfxZZM5P6ryXo8ontz43qIGS6/aZIbtRXZRaAI
 xt0qrjPGTzD3c2LLxZNtnuiflMe25CQpYcthg3utlsLDOyKmxXIN9G0DKq8JYT2j9dhX
 4TAAt3OCFY1om9B6G8nZ2e12LiH7t0GI5xJ3TrBP7dNjvTq01wmeSF3rvUqpRLy2HG4P
 R1w13oJNjCa8PqchUHIq8NdRpczWYrjZv41adbQPERDAVTIRuisMRFDc+9KX3BqsI5Je
 m9Ag==
X-Gm-Message-State: AOAM530NTM3LaWU1zg4rZkDLjLmV8DW5RAgAQt9Jtqr6M9WePWiB45T9
 hglxX6nO8R++ljb57K7l5yNgkAUbOnxi
X-Google-Smtp-Source: ABdhPJxDzilcduJBchhpDfBvFFie7PVk72qZXXpurgT8ew4mWPa2tchpCDp/uaZZLj/y/VPJVE/DvBOvX8Ip
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:e211:b78e:685:a989])
 (user=venture job=sendgmr) by 2002:a25:d353:: with SMTP id
 e80mr2674971ybf.461.1642030001016; Wed, 12 Jan 2022 15:26:41 -0800 (PST)
Date: Wed, 12 Jan 2022 15:26:32 -0800
In-Reply-To: <20220112232633.1811256-1-venture@google.com>
Message-Id: <20220112232633.1811256-2-venture@google.com>
Mime-Version: 1.0
References: <20220112232633.1811256-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH v2 1/2] hw/sensor: Add SB-TSI Temperature Sensor Interface
From: Patrick Venture <venture@google.com>
To: thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3sWPfYQcKCgw7qz563qs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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

From: Hao Wu <wuhaotsh@google.com>

SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
interface that reports AMD SoC's Ttcl (normalized temperature),
and resembles a typical 8-pin remote temperature sensor's I2C interface
to BMC.

This patch implements a basic AMD SB-TSI sensor that is
compatible with the open-source data sheet from AMD and Linux
kernel driver.

Reference:
Linux kernel driver:
https://lkml.org/lkml/2020/12/11/968
Register Map:
https://developer.amd.com/wp-content/resources/56255_3_03.PDF
(Chapter 6)

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Doug Evans <dje@google.com>
---
 hw/sensor/Kconfig         |   4 +
 hw/sensor/meson.build     |   1 +
 hw/sensor/tmp_sbtsi.c     | 365 ++++++++++++++++++++++++++++++++++++++
 hw/sensor/trace-events    |   5 +
 hw/sensor/trace.h         |   1 +
 include/hw/sensor/sbtsi.h |  50 ++++++
 meson.build               |   1 +
 7 files changed, 427 insertions(+)
 create mode 100644 hw/sensor/tmp_sbtsi.c
 create mode 100644 hw/sensor/trace-events
 create mode 100644 hw/sensor/trace.h
 create mode 100644 include/hw/sensor/sbtsi.h

diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
index 9c8a049b06..27f6f79c84 100644
--- a/hw/sensor/Kconfig
+++ b/hw/sensor/Kconfig
@@ -21,3 +21,7 @@ config ADM1272
 config MAX34451
     bool
     depends on I2C
+
+config AMDSBTSI
+    bool
+    depends on I2C
diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
index 059c4ca935..f7b0e645eb 100644
--- a/hw/sensor/meson.build
+++ b/hw/sensor/meson.build
@@ -4,3 +4,4 @@ softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
 softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
 softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
+softmmu_ss.add(when: 'CONFIG_AMDSBTSI', if_true: files('tmp_sbtsi.c'))
diff --git a/hw/sensor/tmp_sbtsi.c b/hw/sensor/tmp_sbtsi.c
new file mode 100644
index 0000000000..7090f69fa1
--- /dev/null
+++ b/hw/sensor/tmp_sbtsi.c
@@ -0,0 +1,365 @@
+/*
+ * AMD SBI Temperature Sensor Interface (SB-TSI)
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
+#include "hw/i2c/smbus_slave.h"
+#include "hw/sensor/sbtsi.h"
+#include "hw/irq.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "trace.h"
+
+/**
+ * SBTSIState:
+ * temperatures are in units of 0.125 degrees
+ * @temperature: Temperature
+ * @limit_low: Lowest temperature
+ * @limit_high: Highest temperature
+ * @status: The status register
+ * @config: The config register
+ * @alert_config: The config for alarm_l output.
+ * @addr: The address to read/write for the next cmd.
+ * @alarm: The alarm_l output pin (GPIO)
+ */
+typedef struct SBTSIState {
+    SMBusDevice parent;
+
+    uint32_t temperature;
+    uint32_t limit_low;
+    uint32_t limit_high;
+    uint8_t status;
+    uint8_t config;
+    uint8_t alert_config;
+    uint8_t addr;
+    qemu_irq alarm;
+} SBTSIState;
+
+#define SBTSI_LIMIT_LOW_DEFAULT (0)
+#define SBTSI_LIMIT_HIGH_DEFAULT (560)
+#define SBTSI_MAN_DEFAULT (0)
+#define SBTSI_REV_DEFAULT (4)
+#define SBTSI_ALARM_L "alarm_l"
+
+/*
+ * The integer part and decimal of the temperature both 8 bits.
+ * Only the top 3 bits of the decimal parts are used.
+ * So the max temperature is (2^8-1) + (2^3-1)/8 = 255.875 degrees.
+ */
+#define SBTSI_TEMP_MAX_IN_MILLIDEGREE 255875
+
+/* The integer part of the temperature in terms of 0.125 degrees. */
+static uint8_t get_temp_int(uint32_t temp)
+{
+    return temp >> 3;
+}
+
+/*
+ * The decimal part of the temperature, in terms of 0.125 degrees.
+ * H/W store it in the top 3 bits so we shift it by 5.
+ */
+static uint8_t get_temp_dec(uint32_t temp)
+{
+    return (temp & 0x7) << 5;
+}
+
+/*
+ * Compute the temperature using the integer and decimal part,
+ * in terms of 0.125 degrees. The decimal part are only the top 3 bits
+ * so we shift it by 5 here.
+ */
+static uint32_t compute_temp(uint8_t integer, uint8_t decimal)
+{
+    return (integer << 3) + (decimal >> 5);
+}
+
+/* Compute new temp with new int part of the temperature. */
+static uint32_t compute_temp_int(uint32_t temp, uint8_t integer)
+{
+    return compute_temp(integer, get_temp_dec(temp));
+}
+
+/* Compute new temp with new dec part of the temperature. */
+static uint32_t compute_temp_dec(uint32_t temp, uint8_t decimal)
+{
+    return compute_temp(get_temp_int(temp), decimal);
+}
+
+/* The integer part of the temperature. */
+static void sbtsi_update_status(SBTSIState *s)
+{
+    s->status = 0;
+    if (s->alert_config & SBTSI_ALARM_EN) {
+        if (s->temperature >= s->limit_high) {
+            s->status |= SBTSI_STATUS_HIGH_ALERT;
+        }
+        if (s->temperature <= s->limit_low) {
+            s->status |= SBTSI_STATUS_LOW_ALERT;
+        }
+    }
+}
+
+static void sbtsi_update_alarm(SBTSIState *s)
+{
+    sbtsi_update_status(s);
+    if (s->status != 0 && !(s->config & SBTSI_CONFIG_ALERT_MASK)) {
+        qemu_irq_raise(s->alarm);
+    } else {
+        qemu_irq_lower(s->alarm);
+    }
+}
+
+static uint8_t sbtsi_read_byte(SMBusDevice *d)
+{
+    SBTSIState *s = SBTSI(d);
+    uint8_t data = 0;
+
+    switch (s->addr) {
+    case SBTSI_REG_TEMP_INT:
+        data = get_temp_int(s->temperature);
+        break;
+
+    case SBTSI_REG_TEMP_DEC:
+        data = get_temp_dec(s->temperature);
+        break;
+
+    case SBTSI_REG_TEMP_HIGH_INT:
+        data = get_temp_int(s->limit_high);
+        break;
+
+    case SBTSI_REG_TEMP_LOW_INT:
+        data = get_temp_int(s->limit_low);
+        break;
+
+    case SBTSI_REG_TEMP_HIGH_DEC:
+        data = get_temp_dec(s->limit_high);
+        break;
+
+    case SBTSI_REG_TEMP_LOW_DEC:
+        data = get_temp_dec(s->limit_low);
+        break;
+
+    case SBTSI_REG_CONFIG:
+    case SBTSI_REG_CONFIG_WR:
+        data = s->config;
+        break;
+
+    case SBTSI_REG_STATUS:
+        sbtsi_update_alarm(s);
+        data = s->status;
+        break;
+
+    case SBTSI_REG_ALERT_CONFIG:
+        data = s->alert_config;
+        break;
+
+    case SBTSI_REG_MAN:
+        data = SBTSI_MAN_DEFAULT;
+        break;
+
+    case SBTSI_REG_REV:
+        data = SBTSI_REV_DEFAULT;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: reading from invalid reg: 0x%02x\n",
+                __func__, s->addr);
+        break;
+    }
+
+    trace_tmp_sbtsi_read_data(s->addr, data);
+    return data;
+}
+
+static void sbtsi_write(SBTSIState *s, uint8_t data)
+{
+    trace_tmp_sbtsi_write_data(s->addr, data);
+    switch (s->addr) {
+    case SBTSI_REG_CONFIG_WR:
+        s->config = data;
+        break;
+
+    case SBTSI_REG_TEMP_HIGH_INT:
+        s->limit_high = compute_temp_int(s->limit_high, data);
+        break;
+
+    case SBTSI_REG_TEMP_LOW_INT:
+        s->limit_low = compute_temp_int(s->limit_low, data);
+        break;
+
+    case SBTSI_REG_TEMP_HIGH_DEC:
+        s->limit_high = compute_temp_dec(s->limit_high, data);
+        break;
+
+    case SBTSI_REG_TEMP_LOW_DEC:
+        s->limit_low = compute_temp_dec(s->limit_low, data);
+        break;
+
+    case SBTSI_REG_ALERT_CONFIG:
+        s->alert_config = data;
+        break;
+
+    case SBTSI_REG_TEMP_INT:
+    case SBTSI_REG_TEMP_DEC:
+    case SBTSI_REG_CONFIG:
+    case SBTSI_REG_STATUS:
+    case SBTSI_REG_MAN:
+    case SBTSI_REG_REV:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: writing to read only reg: 0x%02x data: 0x%02x\n",
+                __func__, s->addr, data);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: writing to invalid reg: 0x%02x data: 0x%02x\n",
+                __func__, s->addr, data);
+        break;
+    }
+    sbtsi_update_alarm(s);
+}
+
+static int sbtsi_write_data(SMBusDevice *d, uint8_t *buf, uint8_t len)
+{
+    SBTSIState *s = SBTSI(d);
+
+    if (len == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func__);
+        return -1;
+    }
+
+    s->addr = buf[0];
+    if (len > 1) {
+        sbtsi_write(s, buf[1]);
+        if (len > 2) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: extra data at end\n", __func__);
+        }
+    }
+    return 0;
+}
+
+/* Units are millidegrees. */
+static void sbtsi_get_temperature(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    SBTSIState *s = SBTSI(obj);
+    uint32_t temp = s->temperature * SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
+
+    visit_type_uint32(v, name, &temp, errp);
+}
+
+/* Units are millidegrees. */
+static void sbtsi_set_temperature(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    SBTSIState *s = SBTSI(obj);
+    uint32_t temp;
+
+    if (!visit_type_uint32(v, name, &temp, errp)) {
+        return;
+    }
+    if (temp > SBTSI_TEMP_MAX_IN_MILLIDEGREE) {
+        error_setg(errp, "value %" PRIu32 ".%03" PRIu32 " C is out of range",
+                   temp / 1000, temp % 1000);
+        return;
+    }
+
+    s->temperature = temp / SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
+    sbtsi_update_alarm(s);
+}
+
+static int sbtsi_post_load(void *opaque, int version_id)
+{
+    SBTSIState *s = opaque;
+
+    sbtsi_update_alarm(s);
+    return 0;
+}
+
+static const VMStateDescription vmstate_sbtsi = {
+    .name = "SBTSI",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .post_load = sbtsi_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(temperature, SBTSIState),
+        VMSTATE_UINT32(limit_low, SBTSIState),
+        VMSTATE_UINT32(limit_high, SBTSIState),
+        VMSTATE_UINT8(config, SBTSIState),
+        VMSTATE_UINT8(status, SBTSIState),
+        VMSTATE_UINT8(addr, SBTSIState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void sbtsi_enter_reset(Object *obj, ResetType type)
+{
+    SBTSIState *s = SBTSI(obj);
+
+    s->config = 0;
+    s->limit_low = SBTSI_LIMIT_LOW_DEFAULT;
+    s->limit_high = SBTSI_LIMIT_HIGH_DEFAULT;
+}
+
+static void sbtsi_hold_reset(Object *obj)
+{
+    SBTSIState *s = SBTSI(obj);
+
+    qemu_irq_lower(s->alarm);
+}
+
+static void sbtsi_init(Object *obj)
+{
+    SBTSIState *s = SBTSI(obj);
+
+    /* Current temperature in millidegrees. */
+    object_property_add(obj, "temperature", "uint32",
+                        sbtsi_get_temperature, sbtsi_set_temperature,
+                        NULL, NULL);
+    qdev_init_gpio_out_named(DEVICE(obj), &s->alarm, SBTSI_ALARM_L, 0);
+}
+
+static void sbtsi_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SMBusDeviceClass *k = SMBUS_DEVICE_CLASS(klass);
+
+    dc->desc = "SB-TSI Temperature Sensor";
+    dc->vmsd = &vmstate_sbtsi;
+    k->write_data = sbtsi_write_data;
+    k->receive_byte = sbtsi_read_byte;
+    rc->phases.enter = sbtsi_enter_reset;
+    rc->phases.hold = sbtsi_hold_reset;
+}
+
+static const TypeInfo sbtsi_info = {
+    .name          = TYPE_SBTSI,
+    .parent        = TYPE_SMBUS_DEVICE,
+    .instance_size = sizeof(SBTSIState),
+    .instance_init = sbtsi_init,
+    .class_init    = sbtsi_class_init,
+};
+
+static void sbtsi_register_types(void)
+{
+    type_register_static(&sbtsi_info);
+}
+
+type_init(sbtsi_register_types)
diff --git a/hw/sensor/trace-events b/hw/sensor/trace-events
new file mode 100644
index 0000000000..21ab3809e2
--- /dev/null
+++ b/hw/sensor/trace-events
@@ -0,0 +1,5 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
+# tmp_sbtsi.c
+tmp_sbtsi_write_data(uint8_t addr, uint8_t value) "SBTSI write addr:0x%02x data: 0x%02x"
+tmp_sbtsi_read_data(uint8_t addr, uint8_t value) "SBTSI read addr:0x%02x data: 0x%02x"
diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h
new file mode 100644
index 0000000000..e4721560b0
--- /dev/null
+++ b/hw/sensor/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_sensor.h"
diff --git a/include/hw/sensor/sbtsi.h b/include/hw/sensor/sbtsi.h
new file mode 100644
index 0000000000..841891e89e
--- /dev/null
+++ b/include/hw/sensor/sbtsi.h
@@ -0,0 +1,50 @@
+/*
+ * AMD SBI Temperature Sensor Interface (SB-TSI)
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
+#ifndef QEMU_TMP_SBTSI_H
+#define QEMU_TMP_SBTSI_H
+
+#include "qom/object.h"
+
+#define TYPE_SBTSI "sbtsi"
+#define SBTSI(obj) OBJECT_CHECK(SBTSIState, (obj), TYPE_SBTSI)
+
+/*
+ * SB-TSI registers only support SMBus byte data access. "_INT" registers are
+ * the integer part of a temperature value or limit, and "_DEC" registers are
+ * corresponding decimal parts.
+ */
+#define SBTSI_REG_TEMP_INT      0x01 /* RO */
+#define SBTSI_REG_STATUS        0x02 /* RO */
+#define SBTSI_REG_CONFIG        0x03 /* RO */
+#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */
+#define SBTSI_REG_TEMP_LOW_INT  0x08 /* RW */
+#define SBTSI_REG_CONFIG_WR     0x09 /* RW */
+#define SBTSI_REG_TEMP_DEC      0x10 /* RO */
+#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */
+#define SBTSI_REG_TEMP_LOW_DEC  0x14 /* RW */
+#define SBTSI_REG_ALERT_CONFIG  0xBF /* RW */
+#define SBTSI_REG_MAN           0xFE /* RO */
+#define SBTSI_REG_REV           0xFF /* RO */
+
+#define SBTSI_STATUS_HIGH_ALERT BIT(4)
+#define SBTSI_STATUS_LOW_ALERT  BIT(3)
+#define SBTSI_CONFIG_ALERT_MASK BIT(7)
+#define SBTSI_ALARM_EN          BIT(0)
+
+/* The temperature we stored are in units of 0.125 degrees. */
+#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125
+
+#endif
diff --git a/meson.build b/meson.build
index c1b1db1e28..3634214546 100644
--- a/meson.build
+++ b/meson.build
@@ -2494,6 +2494,7 @@ if have_system
     'hw/rtc',
     'hw/s390x',
     'hw/scsi',
+    'hw/sensor',
     'hw/sd',
     'hw/sh4',
     'hw/sparc',
-- 
2.34.1.575.g55b058a8bb-goog


