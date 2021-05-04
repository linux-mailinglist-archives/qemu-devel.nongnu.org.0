Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D4372E32
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:43:17 +0200 (CEST)
Received: from localhost ([::1]:59778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldy8i-0005kI-88
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3dHaRYAYKCrEkZkljiXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--titusr.bounces.google.com>)
 id 1ldxvg-0006un-V5
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:29:48 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:48682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3dHaRYAYKCrEkZkljiXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--titusr.bounces.google.com>)
 id 1ldxva-0004K1-9j
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:29:48 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 l9-20020a5b0b890000b02904f7fb53ca12so5315991ybq.15
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 09:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ckwCWD0HnaY5YR2Sjqw2qsYqk5YNYPwfEWwAb6NhqM8=;
 b=tymCts1HcdQw7SZqRi742qLOgPuU3+bsERnw/icfsCpClfu5qWY0bQkf+Z55hRQFdd
 ewVs2g4TZEdQBmEtrm+DOIekDQfuvOnBWnExu/4YjiPhfn2CvkUtgxczczr4wwEjhjwM
 DvsakqmKVbKucm5IApm5G5fPCopvVl89fGTw7CufLTF1NUiOrPhtoZQKZQRbeKwOj/RW
 0vaQ0NSXQn6AMVp6fshHO37k00CU99COX2Eq7yJoM0IR4A82zvyQ02U488U9g3k9lZop
 cn1EW4ukkhTD1LNQDHxEkHS19k04TvveM2UsR9svCwhVbox6oS+bUY45ayYBjp+3mBab
 BwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ckwCWD0HnaY5YR2Sjqw2qsYqk5YNYPwfEWwAb6NhqM8=;
 b=lCZrVuIHXu6mhRCnSrgbuw4Mu3FF9TbaoOWGVT8WLhzggM9XhxS4vyMVFb1aRjjTbZ
 2e5Hc5HJDY4eMUGTd5vcaI7AsnIrWU4xMd4d/FpCx1PrzmWy9Pye7I7fQh/3dZydi7OE
 O/T978QdUOHDTgi+9nFnExzP95y4HpA2o8+KCyiUAz3nRHFE3DsmUXwhrIlimW/1PZra
 bVRooFgdMV+rTUqubJAB+wnKY/+IzyR32shYOIh59aYzjgvN6PfelZikDAtNCWewykES
 qV+F0+b+QuBL33dX+4jgCrpysAohLPgh1/5AOD67k9DXmIP9e9sgqKWGYUAay/betdRf
 EnjQ==
X-Gm-Message-State: AOAM530jIeNLv7+EBC2yQDbKPdlUcA/RSTRWhJMp8I2jB6a+Jr34W22I
 npso25jo8wPG3etR48uWuRCOWhagpw8=
X-Google-Smtp-Source: ABdhPJwCViDJa0uNoIK5Gh1R3cLiFhkSgxERFzHArGWBgzpNp40rWqVDA1OCunP403KxH9jaRPqq8xOUCh4=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:85f8:a1ce:1113:b790])
 (user=titusr job=sendgmr) by 2002:a25:254b:: with SMTP id
 l72mr34263646ybl.439.1620145780743; 
 Tue, 04 May 2021 09:29:40 -0700 (PDT)
Date: Tue,  4 May 2021 09:28:40 -0700
In-Reply-To: <20210504162841.2884846-1-titusr@google.com>
Message-Id: <20210504162841.2884846-3-titusr@google.com>
Mime-Version: 1.0
References: <20210504162841.2884846-1-titusr@google.com>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [PATCH 2/3] hw/misc: add ADM1272 device
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3dHaRYAYKCrEkZkljiXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

The ADM1272 is a PMBus compliant Hot Swap Controller and Digital Power
Monitor by Analog Devices.

This commit adds support for interfacing with it, and support for
setting and monitoring sensor limits.

Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ADM1272.pdf

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/arm/Kconfig             |   1 +
 hw/misc/Kconfig            |   4 +
 hw/misc/adm1272.c          | 551 +++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build        |   1 +
 tests/qtest/adm1272-test.c | 453 ++++++++++++++++++++++++++++++
 tests/qtest/meson.build    |   1 +
 6 files changed, 1011 insertions(+)
 create mode 100644 hw/misc/adm1272.c
 create mode 100644 tests/qtest/adm1272-test.c

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8c9ae17efd..41e8c573a2 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -370,6 +370,7 @@ config XLNX_VERSAL
 config NPCM7XX
     bool
     select A9MPCORE
+    select ADM1272
     select ARM_GIC
     select AT24C  # EEPROM
     select PL310  # cache controller
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index c71ed25820..0774c1f70c 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -14,6 +14,10 @@ config ARMSSE_CPU_PWRCTRL
 config MAX111X
     bool
 
+config ADM1272
+    bool
+    depends on I2C
+
 config TMP105
     bool
     depends on I2C
diff --git a/hw/misc/adm1272.c b/hw/misc/adm1272.c
new file mode 100644
index 0000000000..8c9b139eda
--- /dev/null
+++ b/hw/misc/adm1272.c
@@ -0,0 +1,551 @@
+/*
+ * Analog Devices ADM1272 High Voltage Positive Hot Swap Controller and Digital
+ * Power Monitor with PMBus
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
+#include <string.h>
+#include "hw/i2c/pmbus_device.h"
+#include "hw/irq.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "trace.h"
+
+#define TYPE_ADM1272 "adm1272"
+#define ADM1272(obj) OBJECT_CHECK(ADM1272State, (obj), TYPE_ADM1272)
+
+#define ADM1272_RESTART_TIME            0xCC
+#define ADM1272_MFR_PEAK_IOUT           0xD0
+#define ADM1272_MFR_PEAK_VIN            0xD1
+#define ADM1272_MFR_PEAK_VOUT           0xD2
+#define ADM1272_MFR_PMON_CONTROL        0xD3
+#define ADM1272_MFR_PMON_CONFIG         0xD4
+#define ADM1272_MFR_ALERT1_CONFIG       0xD5
+#define ADM1272_MFR_ALERT2_CONFIG       0xD6
+#define ADM1272_MFR_PEAK_TEMPERATURE    0xD7
+#define ADM1272_MFR_DEVICE_CONFIG       0xD8
+#define ADM1272_MFR_POWER_CYCLE         0xD9
+#define ADM1272_MFR_PEAK_PIN            0xDA
+#define ADM1272_MFR_READ_PIN_EXT        0xDB
+#define ADM1272_MFR_READ_EIN_EXT        0xDC
+
+#define ADM1272_HYSTERESIS_LOW          0xF2
+#define ADM1272_HYSTERESIS_HIGH         0xF3
+#define ADM1272_STATUS_HYSTERESIS       0xF4
+#define ADM1272_STATUS_GPIO             0xF5
+#define ADM1272_STRT_UP_IOUT_LIM        0xF6
+
+/* Defaults */
+#define ADM1272_OPERATION_DEFAULT       0x80
+#define ADM1272_CAPABILITY_DEFAULT      0xB0
+#define ADM1272_CAPABILITY_NO_PEC       0x30
+#define ADM1272_DIRECT_MODE             0x40
+#define ADM1272_HIGH_LIMIT_DEFAULT      0x0FFF
+#define ADM1272_PIN_OP_DEFAULT          0x7FFF
+#define ADM1272_PMBUS_REVISION_DEFAULT  0x22
+#define ADM1272_MFR_ID_DEFAULT          "ADI"
+#define ADM1272_MODEL_DEFAULT           "ADM1272-A1"
+#define ADM1272_MFR_DEFAULT_REVISION    "25"
+#define ADM1272_DEFAULT_DATE            "160301"
+#define ADM1272_RESTART_TIME_DEFAULT    0x64
+#define ADM1272_PMON_CONTROL_DEFAULT    0x1
+#define ADM1272_PMON_CONFIG_DEFAULT     0x3F35
+#define ADM1272_DEVICE_CONFIG_DEFAULT   0x8
+#define ADM1272_HYSTERESIS_HIGH_DEFAULT     0xFFFF
+#define ADM1272_STRT_UP_IOUT_LIM_DEFAULT    0x000F
+#define ADM1272_VOLT_DEFAULT            12000
+#define ADM1272_IOUT_DEFAULT            25000
+#define ADM1272_PWR_DEFAULT             300  /* 12V 25A */
+#define ADM1272_SHUNT                   300 /* micro-ohms */
+#define ADM1272_VOLTAGE_COEFF_DEFAULT   1
+#define ADM1272_CURRENT_COEFF_DEFAULT   3
+#define ADM1272_PWR_COEFF_DEFAULT       7
+#define ADM1272_IOUT_OFFSET             0x5000
+#define ADM1272_IOUT_OFFSET             0x5000
+
+
+typedef struct ADM1272State {
+    PMBusDevice parent;
+
+    uint64_t ein_ext;
+    uint32_t pin_ext;
+    uint8_t restart_time;
+
+    uint16_t peak_vin;
+    uint16_t peak_vout;
+    uint16_t peak_iout;
+    uint16_t peak_temperature;
+    uint16_t peak_pin;
+
+    uint8_t pmon_control;
+    uint16_t pmon_config;
+    uint16_t alert1_config;
+    uint16_t alert2_config;
+    uint16_t device_config;
+
+    uint16_t hysteresis_low;
+    uint16_t hysteresis_high;
+    uint8_t status_hysteresis;
+    uint8_t status_gpio;
+
+    uint16_t strt_up_iout_lim;
+
+} ADM1272State;
+
+static const PMBusCoefficients adm1272_coefficients[] = {
+    [0] = { 6770, 0, -2 },        /* voltage, vrange 60V */
+    [1] = { 4062, 0, -2 },        /* voltage, vrange 100V */
+    [2] = { 1326, 20480, -1 },    /* current, vsense range 15mV */
+    [3] = { 663, 20480, -1 },     /* current, vsense range 30mV */
+    [4] = { 3512, 0, -2 },        /* power, vrange 60V, irange 15mV */
+    [5] = { 21071, 0, -3 },       /* power, vrange 100V, irange 15mV */
+    [6] = { 17561, 0, -3 },       /* power, vrange 60V, irange 30mV */
+    [7] = { 10535, 0, -3 },       /* power, vrange 100V, irange 30mV */
+    [8] = { 42, 31871, -1 },      /* temperature */
+};
+
+static void adm1272_check_limits(ADM1272State *s)
+{
+    PMBusDevice *pmdev = PMBUS_DEVICE(s);
+
+    pmbus_check_limits(pmdev);
+
+    if (pmdev->pages[0].read_vout > s->peak_vout) {
+        s->peak_vout = pmdev->pages[0].read_vout;
+    }
+
+    if (pmdev->pages[0].read_vin > s->peak_vin) {
+        s->peak_vin = pmdev->pages[0].read_vin;
+    }
+
+    if (pmdev->pages[0].read_iout > s->peak_iout) {
+        s->peak_iout = pmdev->pages[0].read_iout;
+    }
+
+    if (pmdev->pages[0].read_temperature_1 > s->peak_temperature) {
+        s->peak_temperature = pmdev->pages[0].read_temperature_1;
+    }
+
+    if (pmdev->pages[0].read_pin > s->peak_pin) {
+        s->peak_pin = pmdev->pages[0].read_pin;
+    }
+}
+
+static uint16_t adm1272_millivolts_to_direct(uint32_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_VOLTAGE_COEFF_DEFAULT];
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_data2direct_mode(c, value);
+}
+
+static uint32_t adm1272_direct_to_millivolts(uint16_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_VOLTAGE_COEFF_DEFAULT];
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_direct_mode2data(c, value);
+}
+
+static uint16_t adm1272_milliamps_to_direct(uint32_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_CURRENT_COEFF_DEFAULT];
+    /* Y = (m * r_sense * x - b) * 10^R */
+    c.m = c.m * ADM1272_SHUNT / 1000; /* micro-ohms */
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_data2direct_mode(c, value);
+}
+
+static uint32_t adm1272_direct_to_milliamps(uint16_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_CURRENT_COEFF_DEFAULT];
+    c.m = c.m * ADM1272_SHUNT / 1000;
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_direct_mode2data(c, value);
+}
+
+static uint16_t adm1272_watts_to_direct(uint32_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_PWR_COEFF_DEFAULT];
+    c.m = c.m * ADM1272_SHUNT / 1000;
+    return pmbus_data2direct_mode(c, value);
+}
+
+static uint32_t adm1272_direct_to_watts(uint16_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_PWR_COEFF_DEFAULT];
+    c.m = c.m * ADM1272_SHUNT / 1000;
+    return pmbus_direct_mode2data(c, value);
+}
+
+static void adm1272_exit_reset(Object *obj)
+{
+    ADM1272State *s = ADM1272(obj);
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+
+    pmdev->page = 0;
+    pmdev->pages[0].operation = ADM1272_OPERATION_DEFAULT;
+
+
+    pmdev->capability = ADM1272_CAPABILITY_NO_PEC;
+    pmdev->pages[0].revision = ADM1272_PMBUS_REVISION_DEFAULT;
+    pmdev->pages[0].vout_mode = ADM1272_DIRECT_MODE;
+    pmdev->pages[0].vout_ov_warn_limit = ADM1272_HIGH_LIMIT_DEFAULT;
+    pmdev->pages[0].vout_uv_warn_limit = 0;
+    pmdev->pages[0].iout_oc_warn_limit = ADM1272_HIGH_LIMIT_DEFAULT;
+    pmdev->pages[0].ot_fault_limit = ADM1272_HIGH_LIMIT_DEFAULT;
+    pmdev->pages[0].ot_warn_limit = ADM1272_HIGH_LIMIT_DEFAULT;
+    pmdev->pages[0].vin_ov_warn_limit = ADM1272_HIGH_LIMIT_DEFAULT;
+    pmdev->pages[0].vin_uv_warn_limit = 0;
+    pmdev->pages[0].pin_op_warn_limit = ADM1272_PIN_OP_DEFAULT;
+
+    pmdev->pages[0].status_word = 0;
+    pmdev->pages[0].status_vout = 0;
+    pmdev->pages[0].status_iout = 0;
+    pmdev->pages[0].status_input = 0;
+    pmdev->pages[0].status_temperature = 0;
+    pmdev->pages[0].status_mfr_specific = 0;
+
+    pmdev->pages[0].read_vin
+        = adm1272_millivolts_to_direct(ADM1272_VOLT_DEFAULT);
+    pmdev->pages[0].read_vout
+        = adm1272_millivolts_to_direct(ADM1272_VOLT_DEFAULT);
+    pmdev->pages[0].read_iout
+        = adm1272_milliamps_to_direct(ADM1272_IOUT_DEFAULT);
+    pmdev->pages[0].read_temperature_1 = 0;
+    pmdev->pages[0].read_pin = adm1272_watts_to_direct(ADM1272_PWR_DEFAULT);
+    pmdev->pages[0].revision = ADM1272_PMBUS_REVISION_DEFAULT;
+    pmdev->pages[0].mfr_id = ADM1272_MFR_ID_DEFAULT;
+    pmdev->pages[0].mfr_model = ADM1272_MODEL_DEFAULT;
+    pmdev->pages[0].mfr_revision = ADM1272_MFR_DEFAULT_REVISION;
+    pmdev->pages[0].mfr_date = ADM1272_DEFAULT_DATE;
+
+    s->pin_ext = 0;
+    s->ein_ext = 0;
+    s->restart_time = ADM1272_RESTART_TIME_DEFAULT;
+
+    s->peak_vin = 0;
+    s->peak_vout = 0;
+    s->peak_iout = 0;
+    s->peak_temperature = 0;
+    s->peak_pin = 0;
+
+    s->pmon_control = ADM1272_PMON_CONTROL_DEFAULT;
+    s->pmon_config = ADM1272_PMON_CONFIG_DEFAULT;
+    s->alert1_config = 0;
+    s->alert2_config = 0;
+    s->device_config = ADM1272_DEVICE_CONFIG_DEFAULT;
+
+    s->hysteresis_low = 0;
+    s->hysteresis_high = ADM1272_HYSTERESIS_HIGH_DEFAULT;
+    s->status_hysteresis = 0;
+    s->status_gpio = 0;
+
+    s->strt_up_iout_lim = ADM1272_STRT_UP_IOUT_LIM_DEFAULT;
+}
+
+static uint8_t adm1272_read_byte(PMBusDevice *pmdev)
+{
+    ADM1272State *s = ADM1272(pmdev);
+
+    switch (pmdev->code) {
+    case ADM1272_RESTART_TIME:
+        pmbus_send8(pmdev, s->restart_time);
+        break;
+
+    case ADM1272_MFR_PEAK_IOUT:
+        pmbus_send16(pmdev, s->peak_iout);
+        break;
+
+    case ADM1272_MFR_PEAK_VIN:
+        pmbus_send16(pmdev, s->peak_vin);
+        break;
+
+    case ADM1272_MFR_PEAK_VOUT:
+        pmbus_send16(pmdev, s->peak_vout);
+        break;
+
+    case ADM1272_MFR_PMON_CONTROL:
+        pmbus_send8(pmdev, s->pmon_control);
+        break;
+
+    case ADM1272_MFR_PMON_CONFIG:
+        pmbus_send16(pmdev, s->pmon_config);
+        break;
+
+    case ADM1272_MFR_ALERT1_CONFIG:
+        pmbus_send16(pmdev, s->alert1_config);
+        break;
+
+    case ADM1272_MFR_ALERT2_CONFIG:
+        pmbus_send16(pmdev, s->alert2_config);
+        break;
+
+    case ADM1272_MFR_PEAK_TEMPERATURE:
+        pmbus_send16(pmdev, s->peak_temperature);
+        break;
+
+    case ADM1272_MFR_DEVICE_CONFIG:
+        pmbus_send16(pmdev, s->device_config);
+        break;
+
+    case ADM1272_MFR_PEAK_PIN:
+        pmbus_send16(pmdev, s->peak_pin);
+        break;
+
+    case ADM1272_MFR_READ_PIN_EXT:
+        pmbus_send32(pmdev, s->pin_ext);
+        break;
+
+    case ADM1272_MFR_READ_EIN_EXT:
+        pmbus_send64(pmdev, s->ein_ext);
+        break;
+
+    case ADM1272_HYSTERESIS_LOW:
+        pmbus_send16(pmdev, s->hysteresis_low);
+        break;
+
+    case ADM1272_HYSTERESIS_HIGH:
+        pmbus_send16(pmdev, s->hysteresis_high);
+        break;
+
+    case ADM1272_STATUS_HYSTERESIS:
+        pmbus_send16(pmdev, s->status_hysteresis);
+        break;
+
+    case ADM1272_STATUS_GPIO:
+        pmbus_send16(pmdev, s->status_gpio);
+        break;
+
+    case ADM1272_STRT_UP_IOUT_LIM:
+        pmbus_send16(pmdev, s->strt_up_iout_lim);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: reading from unsupported register: 0x%02x\n",
+                      __func__, pmdev->code);
+        return 0xFF;
+        break;
+    }
+
+    return 0;
+}
+
+static int adm1272_write_data(PMBusDevice *pmdev, const uint8_t *buf,
+                              uint8_t len)
+{
+    ADM1272State *s = ADM1272(pmdev);
+
+    if (len == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func__);
+        return -1;
+    }
+
+    pmdev->code = buf[0]; /* PMBus command code */
+
+    if (len == 1) {
+        return 0;
+    }
+
+    /* Exclude command code from buffer */
+    buf++;
+    len--;
+
+    switch (pmdev->code) {
+
+    case ADM1272_RESTART_TIME:
+        s->restart_time = pmbus_receive8(pmdev);
+        break;
+
+    case ADM1272_MFR_PMON_CONTROL:
+        s->pmon_control = pmbus_receive8(pmdev);
+        break;
+
+    case ADM1272_MFR_PMON_CONFIG:
+        s->pmon_config = pmbus_receive16(pmdev);
+        break;
+
+    case ADM1272_MFR_ALERT1_CONFIG:
+        s->alert1_config = pmbus_receive16(pmdev);
+        break;
+
+    case ADM1272_MFR_ALERT2_CONFIG:
+        s->alert2_config = pmbus_receive16(pmdev);
+        break;
+
+    case ADM1272_MFR_DEVICE_CONFIG:
+        s->device_config = pmbus_receive16(pmdev);
+        break;
+
+    case ADM1272_MFR_POWER_CYCLE:
+        adm1272_exit_reset((Object *)s);
+        break;
+
+    case ADM1272_HYSTERESIS_LOW:
+        s->hysteresis_low = pmbus_receive16(pmdev);
+        break;
+
+    case ADM1272_HYSTERESIS_HIGH:
+        s->hysteresis_high = pmbus_receive16(pmdev);
+        break;
+
+    case ADM1272_STRT_UP_IOUT_LIM:
+        s->strt_up_iout_lim = pmbus_receive16(pmdev);
+        adm1272_check_limits(s);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: writing to unsupported register: 0x%02x\n",
+                      __func__, pmdev->code);
+        break;
+    }
+    return 0;
+}
+
+static void adm1272_get(Object *obj, Visitor *v, const char *name, void *opaque,
+                        Error **errp)
+{
+    uint16_t value;
+
+    if (strcmp(name, "vin") == 0 || strcmp(name, "vout") == 0) {
+        value = adm1272_direct_to_millivolts(*(uint16_t *)opaque);
+    } else if (strcmp(name, "iout") == 0) {
+        value = adm1272_direct_to_milliamps(*(uint16_t *)opaque);
+    } else if (strcmp(name, "pin") == 0) {
+        value = adm1272_direct_to_watts(*(uint16_t *)opaque);
+    } else {
+        value = *(uint16_t *)opaque;
+    }
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static void adm1272_set(Object *obj, Visitor *v, const char *name, void *opaque,
+                        Error **errp)
+{
+    ADM1272State *s = ADM1272(obj);
+    uint16_t *internal = opaque;
+    uint16_t value;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    if (strcmp(name, "vin") == 0 || strcmp(name, "vout") == 0) {
+        *internal = adm1272_millivolts_to_direct(value);
+    } else if (strcmp(name, "iout") == 0) {
+        *internal = adm1272_milliamps_to_direct(value);
+    } else if (strcmp(name, "pin") == 0) {
+        *internal = adm1272_watts_to_direct(value);
+    } else {
+        *internal = value;
+    }
+
+    adm1272_check_limits(s);
+}
+
+static const VMStateDescription vmstate_adm1272 = {
+    .name = "ADM1272",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]){
+        VMSTATE_UINT64(ein_ext, ADM1272State),
+        VMSTATE_UINT32(pin_ext, ADM1272State),
+        VMSTATE_UINT8(restart_time, ADM1272State),
+
+        VMSTATE_UINT16(peak_vin, ADM1272State),
+        VMSTATE_UINT16(peak_vout, ADM1272State),
+        VMSTATE_UINT16(peak_iout, ADM1272State),
+        VMSTATE_UINT16(peak_temperature, ADM1272State),
+        VMSTATE_UINT16(peak_pin, ADM1272State),
+
+        VMSTATE_UINT8(pmon_control, ADM1272State),
+        VMSTATE_UINT16(pmon_config, ADM1272State),
+        VMSTATE_UINT16(alert1_config, ADM1272State),
+        VMSTATE_UINT16(alert2_config, ADM1272State),
+        VMSTATE_UINT16(device_config, ADM1272State),
+
+        VMSTATE_UINT16(hysteresis_low, ADM1272State),
+        VMSTATE_UINT16(hysteresis_high, ADM1272State),
+        VMSTATE_UINT8(status_hysteresis, ADM1272State),
+        VMSTATE_UINT8(status_gpio, ADM1272State),
+
+        VMSTATE_UINT16(strt_up_iout_lim, ADM1272State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void adm1272_init(Object *obj)
+{
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+    uint64_t flags = PB_HAS_VOUT_MODE | PB_HAS_VOUT | PB_HAS_VIN | PB_HAS_IOUT |
+                     PB_HAS_PIN | PB_HAS_TEMPERATURE | PB_HAS_MFR_INFO;
+
+    pmbus_page_config(pmdev, 0, flags);
+
+    object_property_add(obj, "vin", "uint16",
+                        adm1272_get,
+                        adm1272_set, NULL, &pmdev->pages[0].read_vin);
+
+    object_property_add(obj, "vout", "uint16",
+                        adm1272_get,
+                        adm1272_set, NULL, &pmdev->pages[0].read_vout);
+
+    object_property_add(obj, "iout", "uint16",
+                        adm1272_get,
+                        adm1272_set, NULL, &pmdev->pages[0].read_iout);
+
+    object_property_add(obj, "pin", "uint16",
+                        adm1272_get,
+                        adm1272_set, NULL, &pmdev->pages[0].read_pin);
+
+}
+
+static void adm1272_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
+
+    dc->desc = "Analog Devices ADM1272 Hot Swap controller";
+    dc->vmsd = &vmstate_adm1272;
+    k->write_data = adm1272_write_data;
+    k->receive_byte = adm1272_read_byte;
+    k->device_num_pages = 1;
+
+    rc->phases.exit = adm1272_exit_reset;
+}
+
+static const TypeInfo adm1272_info = {
+    .name = TYPE_ADM1272,
+    .parent = TYPE_PMBUS_DEVICE,
+    .instance_size = sizeof(ADM1272State),
+    .instance_init = adm1272_init,
+    .class_init = adm1272_class_init,
+};
+
+static void adm1272_register_types(void)
+{
+    type_register_static(&adm1272_info);
+}
+
+type_init(adm1272_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 21034dc60a..c5367c95af 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -10,6 +10,7 @@ softmmu_ss.add(when: 'CONFIG_SGA', if_true: files('sga.c'))
 softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
 softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
 softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
+softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
 softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
diff --git a/tests/qtest/adm1272-test.c b/tests/qtest/adm1272-test.c
new file mode 100644
index 0000000000..0ce04abdb5
--- /dev/null
+++ b/tests/qtest/adm1272-test.c
@@ -0,0 +1,453 @@
+/*
+ * QTests for the ADM1272 hotswap controller
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
+#include <math.h>
+#include "hw/i2c/pmbus_device.h"
+#include "libqtest-single.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+#include "qemu/bitops.h"
+
+#define TEST_ID "adm1272-test"
+#define TEST_ADDR (0x10)
+
+#define ADM1272_RESTART_TIME            0xCC
+#define ADM1272_MFR_PEAK_IOUT           0xD0
+#define ADM1272_MFR_PEAK_VIN            0xD1
+#define ADM1272_MFR_PEAK_VOUT           0xD2
+#define ADM1272_MFR_PMON_CONTROL        0xD3
+#define ADM1272_MFR_PMON_CONFIG         0xD4
+#define ADM1272_MFR_ALERT1_CONFIG       0xD5
+#define ADM1272_MFR_ALERT2_CONFIG       0xD6
+#define ADM1272_MFR_PEAK_TEMPERATURE    0xD7
+#define ADM1272_MFR_DEVICE_CONFIG       0xD8
+#define ADM1272_MFR_POWER_CYCLE         0xD9
+#define ADM1272_MFR_PEAK_PIN            0xDA
+#define ADM1272_MFR_READ_PIN_EXT        0xDB
+#define ADM1272_MFR_READ_EIN_EXT        0xDC
+
+#define ADM1272_HYSTERESIS_LOW          0xF2
+#define ADM1272_HYSTERESIS_HIGH         0xF3
+#define ADM1272_STATUS_HYSTERESIS       0xF4
+#define ADM1272_STATUS_GPIO             0xF5
+#define ADM1272_STRT_UP_IOUT_LIM        0xF6
+
+/* Defaults */
+#define ADM1272_OPERATION_DEFAULT       0x80
+#define ADM1272_CAPABILITY_DEFAULT      0xB0
+#define ADM1272_CAPABILITY_NO_PEC       0x30
+#define ADM1272_DIRECT_MODE             0x40
+#define ADM1272_HIGH_LIMIT_DEFAULT      0x0FFF
+#define ADM1272_PIN_OP_DEFAULT          0x7FFF
+#define ADM1272_PMBUS_REVISION_DEFAULT  0x22
+#define ADM1272_MFR_ID_DEFAULT          "ADI"
+#define ADM1272_MODEL_DEFAULT           "ADM1272-A1"
+#define ADM1272_MFR_DEFAULT_REVISION    "25"
+#define ADM1272_DEFAULT_DATE            "160301"
+#define ADM1272_RESTART_TIME_DEFAULT    0x64
+#define ADM1272_PMON_CONTROL_DEFAULT    0x1
+#define ADM1272_PMON_CONFIG_DEFAULT     0x3F35
+#define ADM1272_DEVICE_CONFIG_DEFAULT   0x8
+#define ADM1272_HYSTERESIS_HIGH_DEFAULT     0xFFFF
+#define ADM1272_STRT_UP_IOUT_LIM_DEFAULT    0x000F
+#define ADM1272_VOLT_DEFAULT            12000
+#define ADM1272_IOUT_DEFAULT            25000
+#define ADM1272_PWR_DEFAULT             300  /* 12V 25A */
+#define ADM1272_SHUNT                   300 /* micro-ohms */
+#define ADM1272_VOLTAGE_COEFF_DEFAULT   1
+#define ADM1272_CURRENT_COEFF_DEFAULT   3
+#define ADM1272_PWR_COEFF_DEFAULT       7
+#define ADM1272_IOUT_OFFSET             0x5000
+#define ADM1272_IOUT_OFFSET             0x5000
+
+static const PMBusCoefficients adm1272_coefficients[] = {
+    [0] = { 6770, 0, -2 },       /* voltage, vrange 60V */
+    [1] = { 4062, 0, -2 },       /* voltage, vrange 100V */
+    [2] = { 1326, 20480, -1 },   /* current, vsense range 15mV */
+    [3] = { 663, 20480, -1 },    /* current, vsense range 30mV */
+    [4] = { 3512, 0, -2 },       /* power, vrange 60V, irange 15mV */
+    [5] = { 21071, 0, -3 },      /* power, vrange 100V, irange 15mV */
+    [6] = { 17561, 0, -3 },      /* power, vrange 60V, irange 30mV */
+    [7] = { 10535, 0, -3 },      /* power, vrange 100V, irange 30mV */
+    [8] = { 42, 31871, -1 },     /* temperature */
+};
+
+uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value)
+{
+    /* R is usually negative to fit large readings into 16 bits */
+    uint16_t y = (c.m * value + c.b) * pow(10, c.R);
+    return y;
+}
+
+uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value)
+{
+    /* X = (Y * 10^-R - b) / m */
+    uint32_t x = (value / pow(10, c.R) - c.b) / c.m;
+    return x;
+}
+
+
+static uint16_t adm1272_millivolts_to_direct(uint32_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_VOLTAGE_COEFF_DEFAULT];
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_data2direct_mode(c, value);
+}
+
+static uint32_t adm1272_direct_to_millivolts(uint16_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_VOLTAGE_COEFF_DEFAULT];
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_direct_mode2data(c, value);
+}
+
+static uint16_t adm1272_milliamps_to_direct(uint32_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_CURRENT_COEFF_DEFAULT];
+    /* Y = (m * r_sense * x - b) * 10^R */
+    c.m = c.m * ADM1272_SHUNT / 1000; /* micro-ohms */
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_data2direct_mode(c, value);
+}
+
+static uint32_t adm1272_direct_to_milliamps(uint16_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_CURRENT_COEFF_DEFAULT];
+    c.m = c.m * ADM1272_SHUNT / 1000;
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_direct_mode2data(c, value);
+}
+
+static uint16_t adm1272_watts_to_direct(uint32_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_PWR_COEFF_DEFAULT];
+    c.m = c.m * ADM1272_SHUNT / 1000;
+    return pmbus_data2direct_mode(c, value);
+}
+
+static uint32_t adm1272_direct_to_watts(uint16_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_PWR_COEFF_DEFAULT];
+    c.m = c.m * ADM1272_SHUNT / 1000;
+    return pmbus_direct_mode2data(c, value);
+}
+
+static uint16_t qmp_adm1272_get(const char *id, const char *property)
+{
+    QDict *response;
+    uint64_t ret;
+
+    response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
+                   "'property': %s } }", id, property);
+    g_assert(qdict_haskey(response, "return"));
+    ret = qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")));
+    qobject_unref(response);
+    return ret;
+}
+
+static void qmp_adm1272_set(const char *id,
+                            const char *property,
+                            uint16_t value)
+{
+    QDict *response;
+
+    response = qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %s, "
+                   "'property': %s, 'value': %u } }", id, property, value);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is big endian */
+static uint16_t adm1272_i2c_get16(QI2CDevice *i2cdev, uint8_t reg)
+{
+    uint8_t resp[2];
+    i2c_read_block(i2cdev, reg, resp, sizeof(resp));
+    return (resp[1] << 8) | resp[0];
+}
+
+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is big endian */
+static void adm1272_i2c_set16(QI2CDevice *i2cdev, uint8_t reg, uint16_t value)
+{
+    uint8_t data[2];
+
+    data[0] = value & 255;
+    data[1] = value >> 8;
+    i2c_write_block(i2cdev, reg, data, sizeof(data));
+}
+
+static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t value, i2c_value;
+    int16_t err;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    value = qmp_adm1272_get(TEST_ID, "vout");
+    err = ADM1272_VOLT_DEFAULT - value;
+    g_assert_cmpuint(abs(err), <, ADM1272_VOLT_DEFAULT / 20);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, ==, ADM1272_OPERATION_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_VOUT_MODE);
+    g_assert_cmphex(i2c_value, ==, ADM1272_DIRECT_MODE);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HIGH_LIMIT_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_IOUT_OC_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HIGH_LIMIT_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HIGH_LIMIT_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HIGH_LIMIT_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HIGH_LIMIT_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_PIN_OP_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_PIN_OP_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
+    g_assert_cmphex(i2c_value, ==, ADM1272_PMBUS_REVISION_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, ADM1272_MFR_PMON_CONTROL);
+    g_assert_cmphex(i2c_value, ==, ADM1272_PMON_CONTROL_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_PMON_CONFIG);
+    g_assert_cmphex(i2c_value, ==, ADM1272_PMON_CONFIG_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_DEVICE_CONFIG);
+    g_assert_cmphex(i2c_value, ==, ADM1272_DEVICE_CONFIG_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_HYSTERESIS_HIGH);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HYSTERESIS_HIGH_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_STRT_UP_IOUT_LIM);
+    g_assert_cmphex(i2c_value, ==, ADM1272_STRT_UP_IOUT_LIM_DEFAULT);
+}
+
+/* test qmp access */
+static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value, value, i2c_voltage, i2c_pwr, lossy_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    /* converting to direct mode is lossy - we generate the same loss here */
+    lossy_value =
+        adm1272_direct_to_millivolts(adm1272_millivolts_to_direct(1000));
+    qmp_adm1272_set(TEST_ID, "vin", 1000);
+    value = qmp_adm1272_get(TEST_ID, "vin");
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VIN);
+    i2c_voltage = adm1272_direct_to_millivolts(i2c_value);
+    g_assert_cmpuint(value, ==, i2c_voltage);
+    g_assert_cmpuint(i2c_voltage, ==, lossy_value);
+
+    lossy_value =
+        adm1272_direct_to_millivolts(adm1272_millivolts_to_direct(1500));
+    qmp_adm1272_set(TEST_ID, "vout", 1500);
+    value = qmp_adm1272_get(TEST_ID, "vout");
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+    i2c_voltage = adm1272_direct_to_millivolts(i2c_value);
+    g_assert_cmpuint(value, ==, i2c_voltage);
+    g_assert_cmpuint(i2c_voltage, ==, lossy_value);
+
+    lossy_value =
+        adm1272_direct_to_milliamps(adm1272_milliamps_to_direct(1600));
+    qmp_adm1272_set(TEST_ID, "iout", 1600);
+    value = qmp_adm1272_get(TEST_ID, "iout");
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    i2c_value = adm1272_direct_to_milliamps(i2c_value);
+    g_assert_cmphex(value, ==, i2c_value);
+    g_assert_cmphex(i2c_value, ==, lossy_value);
+
+    lossy_value =
+        adm1272_direct_to_watts(adm1272_watts_to_direct(320));
+    qmp_adm1272_set(TEST_ID, "pin", 320);
+    value = qmp_adm1272_get(TEST_ID, "pin");
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_PIN);
+    i2c_pwr = adm1272_direct_to_watts(i2c_value);
+    g_assert_cmphex(value, ==, i2c_pwr);
+    g_assert_cmphex(i2c_pwr, ==, lossy_value);
+}
+
+/* test r/w registers */
+static void test_rw_regs(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT, 0xABCD);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0xABCD);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT, 0xCDEF);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0xCDEF);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_IOUT_OC_WARN_LIMIT, 0x1234);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_IOUT_OC_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0x1234);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_OT_FAULT_LIMIT, 0x5678);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0x5678);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_OT_WARN_LIMIT, 0xABDC);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0xABDC);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT, 0xCDEF);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0xCDEF);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT, 0x2345);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0x2345);
+
+    i2c_set8(i2cdev, ADM1272_RESTART_TIME, 0xF8);
+    i2c_value = i2c_get8(i2cdev, ADM1272_RESTART_TIME);
+    g_assert_cmphex(i2c_value, ==, 0xF8);
+
+    i2c_set8(i2cdev, ADM1272_MFR_PMON_CONTROL, 0);
+    i2c_value = i2c_get8(i2cdev, ADM1272_MFR_PMON_CONTROL);
+    g_assert_cmpuint(i2c_value, ==, 0);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_PMON_CONFIG, 0xDEF0);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_PMON_CONFIG);
+    g_assert_cmphex(i2c_value, ==, 0xDEF0);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_ALERT1_CONFIG, 0x0123);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_ALERT1_CONFIG);
+    g_assert_cmphex(i2c_value, ==, 0x0123);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_ALERT2_CONFIG, 0x9876);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_ALERT2_CONFIG);
+    g_assert_cmphex(i2c_value, ==, 0x9876);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_DEVICE_CONFIG, 0x3456);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_DEVICE_CONFIG);
+    g_assert_cmphex(i2c_value, ==, 0x3456);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_HYSTERESIS_LOW, 0xCABA);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_HYSTERESIS_LOW);
+    g_assert_cmphex(i2c_value, ==, 0xCABA);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_HYSTERESIS_HIGH, 0x6789);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_HYSTERESIS_HIGH);
+    g_assert_cmphex(i2c_value, ==, 0x6789);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_STRT_UP_IOUT_LIM, 0x9876);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_STRT_UP_IOUT_LIM);
+    g_assert_cmphex(i2c_value, ==, 0x9876);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_OPERATION, 0xA);
+    i2c_value = i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, ==, 0xA);
+}
+
+/* test read-only registers */
+static void test_ro_regs(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_init_value, i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_init_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VIN);
+    adm1272_i2c_set16(i2cdev, PMBUS_READ_VIN, 0xBEEF);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VIN);
+    g_assert_cmphex(i2c_init_value, ==, i2c_value);
+
+    i2c_init_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+    adm1272_i2c_set16(i2cdev, PMBUS_READ_VOUT, 0x1234);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+    g_assert_cmphex(i2c_init_value, ==, i2c_value);
+
+    i2c_init_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    adm1272_i2c_set16(i2cdev, PMBUS_READ_IOUT, 0x6547);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    g_assert_cmphex(i2c_init_value, ==, i2c_value);
+
+    i2c_init_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
+    adm1272_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_1, 0x1597);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
+    g_assert_cmphex(i2c_init_value, ==, i2c_value);
+
+    i2c_init_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_PIN);
+    adm1272_i2c_set16(i2cdev, PMBUS_READ_PIN, 0xDEAD);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_PIN);
+    g_assert_cmphex(i2c_init_value, ==, i2c_value);
+}
+
+/* test voltage fault handling */
+static void test_voltage_faults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    uint8_t i2c_byte;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT,
+                      adm1272_millivolts_to_direct(5000));
+    qmp_adm1272_set(TEST_ID, "vout", 5100);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
+    i2c_byte = i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
+    g_assert_true((i2c_value & PB_STATUS_VOUT) != 0);
+    g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_WARN) != 0);
+
+    qmp_adm1272_set(TEST_ID, "vout", 4500);
+    i2c_set8(i2cdev, PMBUS_CLEAR_FAULTS, 0);
+    i2c_byte = i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
+    g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_WARN) == 0);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT,
+                      adm1272_millivolts_to_direct(4600));
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
+    i2c_byte = i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
+    g_assert_true((i2c_value & PB_STATUS_VOUT) != 0);
+    g_assert_true((i2c_byte & PB_STATUS_VOUT_UV_WARN) != 0);
+
+}
+
+static void adm1272_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" TEST_ID ",address=0x10"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
+
+    qos_node_create_driver("adm1272", i2c_device_create);
+    qos_node_consumes("adm1272", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "adm1272", test_defaults, NULL);
+    qos_add_test("test_tx_rx", "adm1272", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "adm1272", test_rw_regs, NULL);
+    qos_add_test("test_ro_regs", "adm1272", test_ro_regs, NULL);
+    qos_add_test("test_ov_faults", "adm1272", test_voltage_faults, NULL);
+}
+libqos_init(adm1272_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c76738921..30255dce0c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -200,6 +200,7 @@ qtests_s390x = \
 qos_test_ss = ss.source_set()
 qos_test_ss.add(
   'ac97-test.c',
+  'adm1272-test.c',
   'ds1338-test.c',
   'e1000-test.c',
   'e1000e-test.c',
-- 
2.31.1.527.g47e6f16901-goog


