Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B010D4C9ADE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 03:04:37 +0100 (CET)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPEM0-0006X0-BG
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 21:04:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3lc0eYgYKCsI1q120zowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--titusr.bounces.google.com>)
 id 1nPEH9-0002Hs-5h
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:59:35 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=43838
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3lc0eYgYKCsI1q120zowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--titusr.bounces.google.com>)
 id 1nPEH6-0008L9-Bl
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:59:34 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 m10-20020a25800a000000b0061daa5b7151so196317ybk.10
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=5DK0Am6U9VxB/2pb799x/7KWDp88VYzxvJkBczLEb94=;
 b=ZXISZRDAixGcCjg6bMbMLnEg4tql8F5Q8TkRPxHqD/I6bIKhrMkARtCJiuB+/57BRM
 8f2pRAK3/PhEnnsnL3AjwilXI9iMgQNX+lg3YgSxrwVNqzGBnVq77x7szLEBcEUMwZ7P
 oRe4PY8He1xqxo418xPFZlzbVkBT2miGa3CnAoRgRuJzBE2Qfd/fhCCS0hbFT44KDLQ+
 CjCXsTaRLt4Q+P5lwsTCKOiZBPJX/ahGkCGrbX/p5ffSrIPN5sKU+Y8hQ2ktTYwHMQr/
 FV46wIoMv0ArcJUR7QxxJq5HIP3FUC7fBxuQYIvVLlSYDdl1svjXsax40sWNso/vmNZq
 74NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=5DK0Am6U9VxB/2pb799x/7KWDp88VYzxvJkBczLEb94=;
 b=YIPtdLPZIA4DVvf9GWiOcHdYb6CGT1vGlmWqYwL0AE8jgAd7JcdTDeezXoH1qc+PNz
 wWm0m4e6zqRPEbZHkEU8XUU0QgoEVzaAE5sosnW0ZWIS7gob93rKXxY2oroyuTQua922
 5KPlep/uz0kCMXYRz7mTr/BNmSUOkEFyoUazoHz+5GAkYvrsK/rNAGKSC1ZLo1AhEotv
 zV2IllOOryAkupuxBUyC1Mhep/CZHBMzFgeAgYl5FCXuHs33OtXUYmAaeZyp7n/X1YNY
 upGe4cKwi1UqZ15k+uHEr4CN4G/mXz39D0bYLvNp5b+0rjWH+L+Wrk2omK8LaVbQ7o22
 NVxA==
X-Gm-Message-State: AOAM531umpvC1eGdHoJ9lLZPEkdrmIuGeDTcgA8WTk4ZnMxHdnblhZ3F
 bf1eGZ584BVVQVGmkf9EIO/rmjYuezw=
X-Google-Smtp-Source: ABdhPJw79xlhAfnh9/SfF6ih6B1n9dzaCsYP1OrCJWUHkS+n6dKQA9ZmRhFzn1/N18cd8JwtdbasyRJ0BNo=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:2bc5:0:b0:628:71cf:99c with SMTP id
 r188-20020a252bc5000000b0062871cf099cmr7925028ybr.553.1646185877249; Tue, 01
 Mar 2022 17:51:17 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:51 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-8-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 7/9] hw/sensor: add Intersil ISL69260 device model
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3lc0eYgYKCsI1q120zowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 MAINTAINERS                      |   3 +
 hw/arm/Kconfig                   |   1 +
 hw/sensor/Kconfig                |   5 +
 hw/sensor/isl_pmbus_vr.c         | 211 +++++++++++++++++
 hw/sensor/meson.build            |   1 +
 include/hw/sensor/isl_pmbus_vr.h |  50 ++++
 tests/qtest/isl_pmbus_vr-test.c  | 394 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build          |   1 +
 8 files changed, 666 insertions(+)
 create mode 100644 hw/sensor/isl_pmbus_vr.c
 create mode 100644 include/hw/sensor/isl_pmbus_vr.h
 create mode 100644 tests/qtest/isl_pmbus_vr-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3601984b5d..364a844045 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3140,10 +3140,13 @@ M: Titus Rwantare <titusr@google.com>
 S: Maintained
 F: hw/i2c/pmbus_device.c
 F: hw/sensor/adm1272.c
+F: hw/sensor/isl_pmbus_vr.c
 F: hw/sensor/max34451.c
 F: include/hw/i2c/pmbus_device.h
+F: include/hw/sensor/isl_pmbus_vr.h
 F: tests/qtest/adm1272-test.c
 F: tests/qtest/max34451-test.c
+F: tests/qtest/isl_pmbus_vr-test.c
=20
 Firmware schema specifications
 M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 6945330030..97f3b38019 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -400,6 +400,7 @@ config NPCM7XX
     select SMBUS
     select AT24C  # EEPROM
     select MAX34451
+    select ISL_PMBUS_VR
     select PL310  # cache controller
     select PMBUS
     select SERIAL
diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
index 215944decc..a834d2f814 100644
--- a/hw/sensor/Kconfig
+++ b/hw/sensor/Kconfig
@@ -30,3 +30,8 @@ config LSM303DLHC_MAG
     bool
     depends on I2C
     default y if I2C_DEVICES
+
+config ISL_PMBUS_VR
+    bool
+    depends on I2C
+
diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
new file mode 100644
index 0000000000..b3d24e40ab
--- /dev/null
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -0,0 +1,211 @@
+/*
+ * PMBus device for Renesas Digital Multiphase Voltage Regulators
+ *
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sensor/isl_pmbus_vr.h"
+#include "hw/qdev-properties.h"
+#include "qapi/visitor.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+static uint8_t isl_pmbus_vr_read_byte(PMBusDevice *pmdev)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: reading from unsupported register: 0x%02x\n",
+                  __func__, pmdev->code);
+    return 0xFF;
+}
+
+static int isl_pmbus_vr_write_data(PMBusDevice *pmdev, const uint8_t *buf,
+                              uint8_t len)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: write to unsupported register: 0x%02x\n",
+                  __func__, pmdev->code);
+    return 0xFF;
+}
+
+/* TODO: Implement coefficients support in pmbus_device.c for qmp */
+static void isl_pmbus_vr_get(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    visit_type_uint16(v, name, (uint16_t *)opaque, errp);
+}
+
+static void isl_pmbus_vr_set(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);
+    uint16_t *internal =3D opaque;
+    uint16_t value;
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    *internal =3D value;
+    pmbus_check_limits(pmdev);
+}
+
+static void isl_pmbus_vr_exit_reset(Object *obj)
+{
+    PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);
+
+    pmdev->page =3D 0;
+    pmdev->capability =3D ISL_CAPABILITY_DEFAULT;
+    for (int i =3D 0; i < pmdev->num_pages; i++) {
+        pmdev->pages[i].operation =3D ISL_OPERATION_DEFAULT;
+        pmdev->pages[i].on_off_config =3D ISL_ON_OFF_CONFIG_DEFAULT;
+        pmdev->pages[i].vout_mode =3D ISL_VOUT_MODE_DEFAULT;
+        pmdev->pages[i].vout_command =3D ISL_VOUT_COMMAND_DEFAULT;
+        pmdev->pages[i].vout_max =3D ISL_VOUT_MAX_DEFAULT;
+        pmdev->pages[i].vout_margin_high =3D ISL_VOUT_MARGIN_HIGH_DEFAULT;
+        pmdev->pages[i].vout_margin_low =3D ISL_VOUT_MARGIN_LOW_DEFAULT;
+        pmdev->pages[i].vout_transition_rate =3D ISL_VOUT_TRANSITION_RATE_=
DEFAULT;
+        pmdev->pages[i].vout_ov_fault_limit =3D ISL_VOUT_OV_FAULT_LIMIT_DE=
FAULT;
+        pmdev->pages[i].ot_fault_limit =3D ISL_OT_FAULT_LIMIT_DEFAULT;
+        pmdev->pages[i].ot_warn_limit =3D ISL_OT_WARN_LIMIT_DEFAULT;
+        pmdev->pages[i].vin_ov_warn_limit =3D ISL_VIN_OV_WARN_LIMIT_DEFAUL=
T;
+        pmdev->pages[i].vin_uv_warn_limit =3D ISL_VIN_UV_WARN_LIMIT_DEFAUL=
T;
+        pmdev->pages[i].iin_oc_fault_limit =3D ISL_IIN_OC_FAULT_LIMIT_DEFA=
ULT;
+        pmdev->pages[i].ton_delay =3D ISL_TON_DELAY_DEFAULT;
+        pmdev->pages[i].ton_rise =3D ISL_TON_RISE_DEFAULT;
+        pmdev->pages[i].toff_fall =3D ISL_TOFF_FALL_DEFAULT;
+        pmdev->pages[i].revision =3D ISL_REVISION_DEFAULT;
+
+        pmdev->pages[i].read_vout =3D ISL_READ_VOUT_DEFAULT;
+        pmdev->pages[i].read_iout =3D ISL_READ_IOUT_DEFAULT;
+        pmdev->pages[i].read_pout =3D ISL_READ_POUT_DEFAULT;
+        pmdev->pages[i].read_vin =3D ISL_READ_VIN_DEFAULT;
+        pmdev->pages[i].read_iin =3D ISL_READ_IIN_DEFAULT;
+        pmdev->pages[i].read_pin =3D ISL_READ_PIN_DEFAULT;
+        pmdev->pages[i].read_temperature_1 =3D ISL_READ_TEMP_DEFAULT;
+        pmdev->pages[i].read_temperature_2 =3D ISL_READ_TEMP_DEFAULT;
+        pmdev->pages[i].read_temperature_3 =3D ISL_READ_TEMP_DEFAULT;
+    }
+}
+
+static void isl_pmbus_vr_add_props(Object *obj, uint64_t *flags, uint8_t p=
ages)
+{
+    PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);
+    for (int i =3D 0; i < pages; i++) {
+        if (flags[i] & PB_HAS_VIN) {
+            object_property_add(obj, "vin[*]", "uint16",
+                                isl_pmbus_vr_get,
+                                isl_pmbus_vr_set,
+                                NULL, &pmdev->pages[i].read_vin);
+        }
+
+        if (flags[i] & PB_HAS_VOUT) {
+            object_property_add(obj, "vout[*]", "uint16",
+                                isl_pmbus_vr_get,
+                                isl_pmbus_vr_set,
+                                NULL, &pmdev->pages[i].read_vout);
+        }
+
+        if (flags[i] & PB_HAS_IIN) {
+            object_property_add(obj, "iin[*]", "uint16",
+                                isl_pmbus_vr_get,
+                                isl_pmbus_vr_set,
+                                NULL, &pmdev->pages[i].read_iin);
+        }
+
+        if (flags[i] & PB_HAS_IOUT) {
+            object_property_add(obj, "iout[*]", "uint16",
+                                isl_pmbus_vr_get,
+                                isl_pmbus_vr_set,
+                                NULL, &pmdev->pages[i].read_iout);
+        }
+
+        if (flags[i] & PB_HAS_PIN) {
+            object_property_add(obj, "pin[*]", "uint16",
+                                isl_pmbus_vr_get,
+                                isl_pmbus_vr_set,
+                                NULL, &pmdev->pages[i].read_pin);
+        }
+
+        if (flags[i] & PB_HAS_POUT) {
+            object_property_add(obj, "pout[*]", "uint16",
+                                isl_pmbus_vr_get,
+                                isl_pmbus_vr_set,
+                                NULL, &pmdev->pages[i].read_pout);
+        }
+
+        if (flags[i] & PB_HAS_TEMPERATURE) {
+            object_property_add(obj, "temp1[*]", "uint16",
+                                isl_pmbus_vr_get,
+                                isl_pmbus_vr_set,
+                                NULL, &pmdev->pages[i].read_temperature_1)=
;
+        }
+
+        if (flags[i] & PB_HAS_TEMP2) {
+            object_property_add(obj, "temp2[*]", "uint16",
+                                isl_pmbus_vr_get,
+                                isl_pmbus_vr_set,
+                                NULL, &pmdev->pages[i].read_temperature_2)=
;
+        }
+
+        if (flags[i] & PB_HAS_TEMP3) {
+            object_property_add(obj, "temp3[*]", "uint16",
+                                isl_pmbus_vr_get,
+                                isl_pmbus_vr_set,
+                                NULL, &pmdev->pages[i].read_temperature_3)=
;
+        }
+    }
+}
+
+static void raa22xx_init(Object *obj)
+{
+    PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);
+    uint64_t flags[2];
+
+    flags[0] =3D PB_HAS_VIN | PB_HAS_VOUT | PB_HAS_VOUT_MODE |
+               PB_HAS_VOUT_RATING | PB_HAS_VOUT_MARGIN | PB_HAS_IIN |
+               PB_HAS_IOUT | PB_HAS_PIN | PB_HAS_POUT | PB_HAS_TEMPERATURE=
 |
+               PB_HAS_TEMP2 | PB_HAS_TEMP3 | PB_HAS_STATUS_MFR_SPECIFIC;
+    flags[1] =3D PB_HAS_IIN | PB_HAS_PIN | PB_HAS_TEMPERATURE | PB_HAS_TEM=
P3 |
+               PB_HAS_VOUT | PB_HAS_VOUT_MODE | PB_HAS_VOUT_MARGIN |
+               PB_HAS_VOUT_RATING | PB_HAS_IOUT | PB_HAS_POUT |
+               PB_HAS_STATUS_MFR_SPECIFIC;
+
+    pmbus_page_config(pmdev, 0, flags[0]);
+    pmbus_page_config(pmdev, 1, flags[1]);
+    isl_pmbus_vr_add_props(obj, flags, 2);
+}
+
+static void isl_pmbus_vr_class_init(ObjectClass *klass, void *data,
+                                    uint8_t pages)
+{
+    PMBusDeviceClass *k =3D PMBUS_DEVICE_CLASS(klass);
+    k->write_data =3D isl_pmbus_vr_write_data;
+    k->receive_byte =3D isl_pmbus_vr_read_byte;
+    k->device_num_pages =3D pages;
+}
+
+static void isl69260_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->desc =3D "Renesas ISL69260 Digital Multiphase Voltage Regulator";
+    rc->phases.exit =3D isl_pmbus_vr_exit_reset;
+    isl_pmbus_vr_class_init(klass, data, 2);
+}
+
+static const TypeInfo isl69260_info =3D {
+    .name =3D TYPE_ISL69260,
+    .parent =3D TYPE_PMBUS_DEVICE,
+    .instance_size =3D sizeof(ISLState),
+    .instance_init =3D raa22xx_init,
+    .class_init =3D isl69260_class_init,
+};
+
+static void isl_pmbus_vr_register_types(void)
+{
+    type_register_static(&isl69260_info);
+}
+
+type_init(isl_pmbus_vr_register_types)
diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
index d1bba290da..12b6992bc8 100644
--- a/hw/sensor/meson.build
+++ b/hw/sensor/meson.build
@@ -5,3 +5,4 @@ softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc1=
41x.c'))
 softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
 softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
 softmmu_ss.add(when: 'CONFIG_LSM303DLHC_MAG', if_true: files('lsm303dlhc_m=
ag.c'))
+softmmu_ss.add(when: 'CONFIG_ISL_PMBUS_VR', if_true: files('isl_pmbus_vr.c=
'))
diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus=
_vr.h
new file mode 100644
index 0000000000..4e12e95efb
--- /dev/null
+++ b/include/hw/sensor/isl_pmbus_vr.h
@@ -0,0 +1,50 @@
+/*
+ * PMBus device for Renesas Digital Multiphase Voltage Regulators
+ *
+ * Copyright 2022 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_MISC_ISL_PMBUS_VR_H
+#define HW_MISC_ISL_PMBUS_VR_H
+
+#include "hw/i2c/pmbus_device.h"
+#include "qom/object.h"
+
+#define TYPE_ISL69260   "isl69260"
+
+struct ISLState {
+    PMBusDevice parent;
+};
+
+OBJECT_DECLARE_SIMPLE_TYPE(ISLState, ISL69260)
+
+#define ISL_CAPABILITY_DEFAULT                 0x40
+#define ISL_OPERATION_DEFAULT                  0x80
+#define ISL_ON_OFF_CONFIG_DEFAULT              0x16
+#define ISL_VOUT_MODE_DEFAULT                  0x40
+#define ISL_VOUT_COMMAND_DEFAULT               0x0384
+#define ISL_VOUT_MAX_DEFAULT                   0x08FC
+#define ISL_VOUT_MARGIN_HIGH_DEFAULT           0x0640
+#define ISL_VOUT_MARGIN_LOW_DEFAULT            0xFA
+#define ISL_VOUT_TRANSITION_RATE_DEFAULT       0x64
+#define ISL_VOUT_OV_FAULT_LIMIT_DEFAULT        0x076C
+#define ISL_OT_FAULT_LIMIT_DEFAULT             0x7D
+#define ISL_OT_WARN_LIMIT_DEFAULT              0x07D0
+#define ISL_VIN_OV_WARN_LIMIT_DEFAULT          0x36B0
+#define ISL_VIN_UV_WARN_LIMIT_DEFAULT          0x1F40
+#define ISL_IIN_OC_FAULT_LIMIT_DEFAULT         0x32
+#define ISL_TON_DELAY_DEFAULT                  0x14
+#define ISL_TON_RISE_DEFAULT                   0x01F4
+#define ISL_TOFF_FALL_DEFAULT                  0x01F4
+#define ISL_REVISION_DEFAULT                   0x33
+#define ISL_READ_VOUT_DEFAULT                  1000
+#define ISL_READ_IOUT_DEFAULT                  40
+#define ISL_READ_POUT_DEFAULT                  4
+#define ISL_READ_TEMP_DEFAULT                  25
+#define ISL_READ_VIN_DEFAULT                   1100
+#define ISL_READ_IIN_DEFAULT                   40
+#define ISL_READ_PIN_DEFAULT                   4
+
+#endif
diff --git a/tests/qtest/isl_pmbus_vr-test.c b/tests/qtest/isl_pmbus_vr-tes=
t.c
new file mode 100644
index 0000000000..f77732ae96
--- /dev/null
+++ b/tests/qtest/isl_pmbus_vr-test.c
@@ -0,0 +1,394 @@
+/*
+ * QTests for the ISL_PMBUS digital voltage regulators
+ *
+ * Copyright 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include <math.h>
+#include "hw/i2c/pmbus_device.h"
+#include "hw/sensor/isl_pmbus_vr.h"
+#include "libqtest-single.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+#include "qemu/bitops.h"
+
+#define TEST_ID "isl_pmbus_vr-test"
+#define TEST_ADDR (0x43)
+
+static uint16_t qmp_isl_pmbus_vr_get(const char *id, const char *property)
+{
+    QDict *response;
+    uint64_t ret;
+
+    response =3D qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
+                   "'property': %s } }", id, property);
+    g_assert(qdict_haskey(response, "return"));
+    ret =3D qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")))=
;
+    qobject_unref(response);
+    return ret;
+}
+
+static void qmp_isl_pmbus_vr_set(const char *id,
+                            const char *property,
+                            uint16_t value)
+{
+    QDict *response;
+
+    response =3D qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %s, "
+                   "'property': %s, 'value': %u } }", id, property, value)=
;
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is big end=
ian */
+static uint16_t isl_pmbus_vr_i2c_get16(QI2CDevice *i2cdev, uint8_t reg)
+{
+    uint8_t resp[2];
+    i2c_read_block(i2cdev, reg, resp, sizeof(resp));
+    return (resp[1] << 8) | resp[0];
+}
+
+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is big end=
ian */
+static void isl_pmbus_vr_i2c_set16(QI2CDevice *i2cdev, uint8_t reg,
+                                   uint16_t value)
+{
+    uint8_t data[2];
+
+    data[0] =3D value & 255;
+    data[1] =3D value >> 8;
+    i2c_write_block(i2cdev, reg, data, sizeof(data));
+}
+
+static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t value, i2c_value;
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "vout[0]");
+    g_assert_cmpuint(value, =3D=3D, ISL_READ_VOUT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    g_assert_cmpuint(i2c_value, =3D=3D, ISL_READ_IOUT_DEFAULT);
+
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "pout[0]");
+    g_assert_cmpuint(value, =3D=3D, ISL_READ_POUT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VIN);
+    g_assert_cmpuint(i2c_value, =3D=3D, ISL_READ_VIN_DEFAULT);
+
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "iin[0]");
+    g_assert_cmpuint(value, =3D=3D, ISL_READ_IIN_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_PIN);
+    g_assert_cmpuint(i2c_value, =3D=3D, ISL_READ_PIN_DEFAULT);
+
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "temp1[0]");
+    g_assert_cmpuint(value, =3D=3D, ISL_READ_TEMP_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_2)=
;
+    g_assert_cmpuint(i2c_value, =3D=3D, ISL_READ_TEMP_DEFAULT);
+
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_CAPABILITY);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_CAPABILITY_DEFAULT);
+
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_OPERATION_DEFAULT);
+
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_ON_OFF_CONFIG);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_ON_OFF_CONFIG_DEFAULT);
+
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_VOUT_MODE);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_MODE_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_COMMAND_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_MAX_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_MARGIN_HIGH_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_MARGIN_LOW_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RAT=
E);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_TRANSITION_RATE_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT=
);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_OV_FAULT_LIMIT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_OT_FAULT_LIMIT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_OT_WARN_LIMIT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VIN_OV_WARN_LIMIT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VIN_UV_WARN_LIMIT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT)=
;
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_IIN_OC_FAULT_LIMIT_DEFAULT);
+
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_REVISION);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_REVISION_DEFAULT);
+}
+
+/* test qmp access */
+static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value, value;
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+
+    qmp_isl_pmbus_vr_set(TEST_ID, "vin[0]", 200);
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "vin[0]");
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VIN);
+    g_assert_cmpuint(value, =3D=3D, i2c_value);
+
+    qmp_isl_pmbus_vr_set(TEST_ID, "vout[0]", 2500);
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "vout[0]");
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+    g_assert_cmpuint(value, =3D=3D, i2c_value);
+
+    qmp_isl_pmbus_vr_set(TEST_ID, "iin[0]", 300);
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "iin[0]");
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IIN);
+    g_assert_cmpuint(value, =3D=3D, i2c_value);
+
+    qmp_isl_pmbus_vr_set(TEST_ID, "iout[0]", 310);
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "iout[0]");
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    g_assert_cmpuint(value, =3D=3D, i2c_value);
+
+    qmp_isl_pmbus_vr_set(TEST_ID, "pin[0]", 100);
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "pin[0]");
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_PIN);
+    g_assert_cmpuint(value, =3D=3D, i2c_value);
+
+    qmp_isl_pmbus_vr_set(TEST_ID, "pout[0]", 95);
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "pout[0]");
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_POUT);
+    g_assert_cmpuint(value, =3D=3D, i2c_value);
+
+    qmp_isl_pmbus_vr_set(TEST_ID, "temp1[0]", 26);
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "temp1[0]");
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1)=
;
+    g_assert_cmpuint(value, =3D=3D, i2c_value);
+
+    qmp_isl_pmbus_vr_set(TEST_ID, "temp2[0]", 27);
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "temp2[0]");
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_2)=
;
+    g_assert_cmpuint(value, =3D=3D, i2c_value);
+
+    qmp_isl_pmbus_vr_set(TEST_ID, "temp3[0]", 28);
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "temp3[0]");
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_3)=
;
+    g_assert_cmpuint(value, =3D=3D, i2c_value);
+
+}
+
+/* test r/w registers */
+static void test_rw_regs(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_COMMAND, 0x1234);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
+    g_assert_cmphex(i2c_value, =3D=3D, 0x1234);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_TRIM, 0x4567);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_TRIM);
+    g_assert_cmphex(i2c_value, =3D=3D, 0x4567);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_MAX, 0x9876);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
+    g_assert_cmphex(i2c_value, =3D=3D, 0x9876);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_MARGIN_HIGH, 0xABCD);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
+    g_assert_cmphex(i2c_value, =3D=3D, 0xABCD);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_MARGIN_LOW, 0xA1B2);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
+    g_assert_cmphex(i2c_value, =3D=3D, 0xA1B2);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_TRANSITION_RATE, 0xDEF1);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RAT=
E);
+    g_assert_cmphex(i2c_value, =3D=3D, 0xDEF1);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_DROOP, 0x5678);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_DROOP);
+    g_assert_cmphex(i2c_value, =3D=3D, 0x5678);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_MIN, 0x1234);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MIN);
+    g_assert_cmphex(i2c_value, =3D=3D, 0x1234);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT, 0x2345);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT=
);
+    g_assert_cmphex(i2c_value, =3D=3D, 0x2345);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_UV_FAULT_LIMIT, 0xFA12);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_UV_FAULT_LIMIT=
);
+    g_assert_cmphex(i2c_value, =3D=3D, 0xFA12);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_OT_FAULT_LIMIT, 0xF077);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, =3D=3D, 0xF077);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_OT_WARN_LIMIT, 0x7137);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, =3D=3D, 0x7137);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VIN_OV_FAULT_LIMIT, 0x3456);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_OV_FAULT_LIMIT)=
;
+    g_assert_cmphex(i2c_value, =3D=3D, 0x3456);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VIN_UV_FAULT_LIMIT, 0xBADA);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_UV_FAULT_LIMIT)=
;
+    g_assert_cmphex(i2c_value, =3D=3D, 0xBADA);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT, 0xB1B0);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT)=
;
+    g_assert_cmphex(i2c_value, =3D=3D, 0xB1B0);
+
+    i2c_set8(i2cdev, PMBUS_OPERATION, 0xA);
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, =3D=3D, 0xA);
+
+    i2c_set8(i2cdev, PMBUS_ON_OFF_CONFIG, 0x42);
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_ON_OFF_CONFIG);
+    g_assert_cmphex(i2c_value, =3D=3D, 0x42);
+}
+
+/* test that devices with multiple pages can switch between them */
+static void test_pages_rw(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, PMBUS_PAGE, 1);
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_PAGE);
+    g_assert_cmphex(i2c_value, =3D=3D, 1);
+
+    i2c_set8(i2cdev, PMBUS_PAGE, 0);
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_PAGE);
+    g_assert_cmphex(i2c_value, =3D=3D, 0);
+}
+
+/* test read-only registers */
+static void test_ro_regs(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_init_value, i2c_value;
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+
+    i2c_init_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VIN);
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_VIN, 0xBEEF);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VIN);
+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
+
+    i2c_init_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IIN);
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_IIN, 0xB00F);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IIN);
+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
+
+    i2c_init_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_VOUT, 0x1234);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
+
+    i2c_init_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_IOUT, 0x6547);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
+
+    i2c_init_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATU=
RE_1);
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_1, 0x1597);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1)=
;
+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
+
+    i2c_init_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATU=
RE_2);
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_2, 0x1897);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_2)=
;
+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
+
+    i2c_init_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATU=
RE_3);
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_3, 0x1007);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_3)=
;
+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
+
+    i2c_init_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_PIN);
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_PIN, 0xDEAD);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_PIN);
+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
+
+    i2c_init_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_POUT);
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_POUT, 0xD00D);
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_POUT);
+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
+}
+
+/* test voltage fault handling */
+static void test_voltage_faults(void *obj, void *data, QGuestAllocator *al=
loc)
+{
+    uint16_t i2c_value;
+    uint8_t i2c_byte;
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT, 5000);
+    qmp_isl_pmbus_vr_set(TEST_ID, "vout[0]", 5100);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
+    i2c_byte =3D i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
+    g_assert_true((i2c_value & PB_STATUS_VOUT) !=3D 0);
+    g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_WARN) !=3D 0);
+
+    qmp_isl_pmbus_vr_set(TEST_ID, "vout[0]", 4500);
+    i2c_set8(i2cdev, PMBUS_CLEAR_FAULTS, 0);
+    i2c_byte =3D i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
+    g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_WARN) =3D=3D 0);
+
+    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT, 4600);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
+    i2c_byte =3D i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
+    g_assert_true((i2c_value & PB_STATUS_VOUT) !=3D 0);
+    g_assert_true((i2c_byte & PB_STATUS_VOUT_UV_WARN) !=3D 0);
+
+}
+
+static void isl_pmbus_vr_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts =3D {
+        .extra_device_opts =3D "id=3D" TEST_ID ",address=3D0x43"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
+
+    qos_node_create_driver("isl69260", i2c_device_create);
+    qos_node_consumes("isl69260", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "isl69260", test_defaults, NULL);
+    qos_add_test("test_tx_rx", "isl69260", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "isl69260", test_rw_regs, NULL);
+    qos_add_test("test_pages_rw", "isl69260", test_pages_rw, NULL);
+    qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
+    qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
+}
+libqos_init(isl_pmbus_vr_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f33d84d19b..98b5969a38 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -244,6 +244,7 @@ qos_test_ss.add(
   'es1370-test.c',
   'ipoctal232-test.c',
   'lsm303dlhc-mag-test.c',
+  'isl_pmbus_vr-test.c',
   'max34451-test.c',
   'megasas-test.c',
   'ne2000-test.c',
--=20
2.35.1.616.g0bdcbb4464-goog


