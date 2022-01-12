Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB648BBD5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:28:00 +0100 (CET)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7RUc-00030u-RF
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:27:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38B_eYQYKCr0wlwxvujrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--titusr.bounces.google.com>)
 id 1n7RS9-0000df-Ml
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:25:25 -0500
Received: from [2607:f8b0:4864:20::f4a] (port=50102
 helo=mail-qv1-xf4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38B_eYQYKCr0wlwxvujrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--titusr.bounces.google.com>)
 id 1n7RS7-00043n-4b
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:25:25 -0500
Received: by mail-qv1-xf4a.google.com with SMTP id
 ib7-20020a0562141c8700b0040812bc4425so964851qvb.16
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 16:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=yWMx+LMabLb35/PnHqiFgc3r2nxGjHK//PP35SZBxKo=;
 b=EV5YlcG4psmeuIcRdpwMpFNY8e3/omQb0WOiNV51TIPSn45xYtvJZE7uhTL23CVg/2
 exLP8y/rs6EXCHKAMuxF96wdAwwArTSUO85r/GKBx5I2V225afU9JKnsNHfSkDLSTkog
 3SC8EGDRO4QEVgVHT1uQSczdq3O73MXxI9QKqghXG1UXGft3M8oXVYujvyggLJ0g0y4N
 Ldu1aD1B0ceCytf2BDRj8cQlR3m8wP72xFD81ahaS2BBiisq4tXdZo6hQg+jo2j7T/2+
 fwpo8aNzNDZ5TQzJcpjyx0P4dCqDbTEnphzZyZzKroMt6lFp3GIBAkUakb5n4lN0Acqe
 /jIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=yWMx+LMabLb35/PnHqiFgc3r2nxGjHK//PP35SZBxKo=;
 b=xILteVfPhq9yjStU0Hf/3AXVcCoqdEsajJPXmBMUieNcDO5+sijjtEoHur6X4EUe1K
 eRNoR0Jl5nS5BvUZgQpMgpd/pSfX+Ksuj3vy4n4i8/Frljz4jHuokdi8wQmk1qxkfF9K
 VUB8/ac3SPX9jU40nMhy0OfpShcJR/gspNDQ06XrsRy6bo4GfFxDi7UMvgy97ObugmzO
 mZeIVoej0nZVKdo3zTIfsoPsOqgtVY3cdRAWmqMedaQNbZteI06qXlskijiKrRfTz/2O
 VHdq/8wEfC9W7KYOVGsCywDY0iGPSk7hOBEiEuEmpnRYKmfco7gKD8Pv99L60WY+tgbR
 Z2qQ==
X-Gm-Message-State: AOAM5324J+P8E3AA0aK1Y+ZYkQywsSXpqHj7+DF5+8o26UmMC7qnNtQ4
 xlZYHk2PJjjU71kDeST8Fs4XGrfXizM=
X-Google-Smtp-Source: ABdhPJwWv6L4/zN6p3/yWDqgmgSuDIQrHVECboiPa+0SBT4LGNNQppXxH9NDVsQUjVFsgD9AkL6mDT8YjS0=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:622a:651:: with SMTP id
 a17mr5814884qtb.383.1641947120952; Tue, 11 Jan 2022 16:25:20 -0800 (PST)
Date: Wed, 12 Jan 2022 00:25:13 +0000
Message-Id: <20220112002515.3991540-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH 1/3] hw/sensor: add MAX31790 fan controller
From: Titus Rwantare <titusr@google.com>
To: minyard@acm.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 venture@google.com, Titus Rwantare <titusr@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=38B_eYQYKCr0wlwxvujrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--titusr.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
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

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 MAINTAINERS                           |   8 +-
 hw/arm/Kconfig                        |   1 +
 hw/sensor/Kconfig                     |   4 +
 hw/sensor/max31790_fan_ctrl.c         | 454 ++++++++++++++++++++++++++
 hw/sensor/meson.build                 |   1 +
 include/hw/sensor/max31790_fan_ctrl.h |  93 ++++++
 6 files changed, 560 insertions(+), 1 deletion(-)
 create mode 100644 hw/sensor/max31790_fan_ctrl.c
 create mode 100644 include/hw/sensor/max31790_fan_ctrl.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c98a61caee..0791b6be42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2304,6 +2304,12 @@ F: hw/timer/mips_gictimer.c
 F: include/hw/intc/mips_gic.h
 F: include/hw/timer/mips_gictimer.h
=20
+MAX31790 Fan controller
+M: Titus Rwantare <titusr@google.com>
+S: Maintained
+F: hw/sensor/max31790_fan_ctrl.c
+F: include/hw/sensor/max31790_fan_ctrl.h
+
 Subsystems
 ----------
 Overall Audio backends
@@ -2798,7 +2804,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
-R: Darren Kenny <darren.kenny@oracle.com>=20
+R: Darren Kenny <darren.kenny@oracle.com>
 R: Qiuhao Li <Qiuhao.Li@outlook.com>
 S: Maintained
 F: tests/qtest/fuzz/
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e652590943..00bfbaf1c4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -393,6 +393,7 @@ config NPCM7XX
     select SMBUS
     select AT24C  # EEPROM
     select MAX34451
+    select MAX31790
     select PL310  # cache controller
     select PMBUS
     select SERIAL
diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
index 9c8a049b06..54d269d642 100644
--- a/hw/sensor/Kconfig
+++ b/hw/sensor/Kconfig
@@ -21,3 +21,7 @@ config ADM1272
 config MAX34451
     bool
     depends on I2C
+
+config MAX31790
+    bool
+    depends on I2C
diff --git a/hw/sensor/max31790_fan_ctrl.c b/hw/sensor/max31790_fan_ctrl.c
new file mode 100644
index 0000000000..b5334c1130
--- /dev/null
+++ b/hw/sensor/max31790_fan_ctrl.c
@@ -0,0 +1,454 @@
+/*
+ * MAX31790 Fan controller
+ *
+ * Independently control 6 fans, up to 12 tachometer inputs,
+ * controlled through i2c
+ *
+ * This device model has read/write support for:
+ * - 9-bit pwm through i2c and qom/qmp
+ * - 11-bit tach_count through i2c
+ * - RPM through qom/qmp
+ *
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sensor/max31790_fan_ctrl.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qapi/visitor.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+static uint16_t max31790_get_sr(uint8_t fan_dynamics)
+{
+    uint16_t sr =3D 1 << ((fan_dynamics >> 5) & 0b111);
+    return sr > 16 ? 32 : sr;
+}
+
+static void max31790_place_bits(uint16_t *dest, uint16_t byte, uint8_t off=
set)
+{
+    uint16_t val =3D *dest;
+    val &=3D ~(0x00FF << offset);
+    val |=3D byte << offset;
+    *dest =3D val;
+}
+
+/*
+ * calculating fan speed
+ *  f_TOSC/4 is the clock, 8192Hz
+ *  NP =3D tachometer pulses per revolution (usually 2)
+ *  SR =3D number of periods(pulses) over which the clock ticks are counte=
d
+ *  TACH Count =3D SR x 8192 x 60 / (NP x RPM)
+ *  RPM =3D SR x 8192 x 60 / (NP x TACH count)
+ *
+ *  RPM mode - desired tach count is written to TACH Target Count
+ *  PWM mode - desired duty cycle is written to PWMOUT Target Duty reg
+ */
+static void max31790_calculate_tach_count(MAX31790State *ms, uint8_t id)
+{
+    uint32_t rpm;
+    uint32_t sr =3D max31790_get_sr(ms->fan_dynamics[id]);
+    ms->pwm_duty_cycle[id] =3D ms->pwmout[id] >> 7;
+    rpm =3D (ms->max_rpm[id] * ms->pwm_duty_cycle[id]) / 0x1FF;
+
+    if (rpm) {
+        ms->tach_count[id] =3D (sr * MAX31790_CLK_FREQ * 60) /
+                             (MAX31790_PULSES_PER_REV * rpm);
+    } else {
+        ms->tach_count[id] =3D 0;
+    }
+
+}
+
+static void max31790_update_tach_count(MAX31790State *ms)
+{
+    for (int i =3D 0; i < MAX31790_NUM_FANS; i++) {
+        if (ms->fan_config[i] &
+            (MAX31790_FAN_CFG_RPM_MODE | MAX31790_FAN_CFG_TACH_INPUT_EN)) =
{
+                ms->tach_count[i] =3D ms->target_count[i] >> 5;
+        } else { /* PWM mode */
+            max31790_calculate_tach_count(ms, i);
+        }
+    }
+}
+
+/* consecutive reads can increment the address up to 0xFF then wrap to 0 *=
/
+/* slave to master */
+static uint8_t max31790_recv(I2CSlave *i2c)
+{
+    MAX31790State *ms =3D MAX31790(i2c);
+    uint8_t data, index, rem;
+
+    max31790_update_tach_count(ms);
+
+    if (ms->cmd_is_new) {
+        ms->cmd_is_new =3D false;
+    } else {
+        ms->command++;
+    }
+
+    switch (ms->command) {
+    case MAX31790_REG_GLOBAL_CONFIG:
+        data =3D ms->global_config;
+        break;
+
+    case MAX31790_REG_PWM_FREQ:
+        data =3D ms->pwm_freq;
+        break;
+
+    case MAX31790_REG_FAN_CONFIG(0) ...
+         MAX31790_REG_FAN_CONFIG(MAX31790_NUM_FANS - 1):
+        data =3D ms->fan_config[ms->command - MAX31790_REG_FAN_CONFIG(0)];
+        break;
+
+    case MAX31790_REG_FAN_DYNAMICS(0) ...
+         MAX31790_REG_FAN_DYNAMICS(MAX31790_NUM_FANS - 1):
+        data =3D ms->fan_dynamics[ms->command - MAX31790_REG_FAN_DYNAMICS(=
0)];
+        break;
+
+    case MAX31790_REG_FAN_FAULT_STATUS_2:
+        data =3D ms->fan_fault_status_2;
+        break;
+
+    case MAX31790_REG_FAN_FAULT_STATUS_1:
+        data =3D ms->fan_fault_status_1;
+        break;
+
+    case MAX31790_REG_FAN_FAULT_MASK_2:
+        data =3D ms->fan_fault_mask_2;
+        break;
+
+    case MAX31790_REG_FAN_FAULT_MASK_1:
+        data =3D ms->fan_fault_mask_1;
+        break;
+
+    case MAX31790_REG_FAILED_FAN_OPTS_SEQ_STRT:
+        data =3D ms->failed_fan_opts_seq_strt;
+        break;
+
+    case MAX31790_REG_TACH_COUNT_MSB(0) ...
+         MAX31790_REG_TACH_COUNT_LSB(MAX31790_NUM_TACHS - 1):
+        index =3D (ms->command - MAX31790_REG_TACH_COUNT_MSB(0)) / 2;
+        rem =3D (ms->command - MAX31790_REG_TACH_COUNT_MSB(0)) % 2;
+        if (rem) {
+            data =3D ms->tach_count[index] << 5;
+        } else {
+            data =3D ms->tach_count[index] >> 3;
+        }
+        break;
+
+    /*
+     * PWM_DUTY_CYCLE is meant to be the current duty cycle while
+     * PWMOUT is the requested duty cycle
+     */
+    case MAX31790_REG_PWM_DUTY_CYCLE_MSB(0) ...
+         MAX31790_REG_PWM_DUTY_CYCLE_LSB(MAX31790_NUM_FANS - 1):
+        index =3D (ms->command - MAX31790_REG_PWM_DUTY_CYCLE_MSB(0)) / 2;
+        rem =3D (ms->command - MAX31790_REG_PWM_DUTY_CYCLE_MSB(0)) % 2;
+
+        if (rem) {
+            data =3D ms->pwm_duty_cycle[index] << 7;
+        } else {
+            data =3D ms->pwm_duty_cycle[index] >> 1;
+        }
+        break;
+
+    case MAX31790_REG_PWMOUT_MSB(0) ...
+         MAX31790_REG_PWMOUT_LSB(MAX31790_NUM_FANS - 1):
+        index =3D (ms->command - MAX31790_REG_PWMOUT_MSB(0)) / 2;
+        rem =3D (ms->command - MAX31790_REG_PWMOUT_MSB(0)) % 2;
+        if (rem) {
+            data =3D ms->pwmout[index];
+        } else {
+            data =3D ms->pwmout[index] >> 8;
+        }
+        break;
+
+    case MAX31790_REG_TARGET_COUNT_MSB(0) ...
+         MAX31790_REG_TARGET_COUNT_LSB(MAX31790_NUM_FANS - 1):
+        index =3D (ms->command - MAX31790_REG_TARGET_COUNT_MSB(0)) / 2;
+        rem =3D (ms->command - MAX31790_REG_TARGET_COUNT_MSB(0)) % 2;
+        if (rem) {
+            data =3D ms->target_count[index];
+        } else {
+            data =3D ms->target_count[index] >> 8;
+        }
+        break;
+
+    case MAX31790_REG_WINDOW(0) ...
+         MAX31790_REG_WINDOW(MAX31790_NUM_FANS - 1):
+        data =3D ms->window[ms->command - MAX31790_REG_WINDOW(0)];
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: reading from unsupported register 0x%02x",
+                __func__, ms->command);
+        data =3D 0xFF;
+        break;
+    }
+
+    return data;
+}
+
+/*
+ * The device=E2=80=99s control registers are organized in rows of 8 bytes=
.
+ * The I2C master can read or write individual bytes, or can read or write
+ * multiple bytes. When writing consecutive bytes, all writes are to the s=
ame
+ * row. When the final byte in the row is reached, the next byte written i=
s the
+ * row=E2=80=99s first byte.
+ * For example, a write that starts with 02h (Fan 1 Configuration) can wri=
te to
+ * 02h, 03h, 04h, 05h, 06h, and 07h. If writes continue, the next byte wri=
tten
+ * is 00h, and so on.
+ */
+/* master to slave */
+static int max31790_send(I2CSlave *i2c, uint8_t data)
+{
+    MAX31790State *ms =3D MAX31790(i2c);
+    uint8_t index, rem;
+
+    if (ms->i2c_cmd_event) {
+        ms->command =3D data;
+        ms->i2c_cmd_event =3D false;
+        ms->cmd_is_new =3D true;
+        return 0;
+    }
+
+    if (ms->cmd_is_new) {
+        ms->cmd_is_new =3D false;
+    } else {
+        if ((ms->command + 1) % 8) {
+            ms->command++;
+        } else {
+            ms->command -=3D 7;
+        }
+    }
+
+    switch (ms->command) {
+    case MAX31790_REG_GLOBAL_CONFIG:
+        ms->global_config =3D data;
+        break;
+
+    case MAX31790_REG_PWM_FREQ:
+        ms->pwm_freq =3D data;
+        break;
+
+    case MAX31790_REG_FAN_CONFIG(0) ...
+         MAX31790_REG_FAN_CONFIG(MAX31790_NUM_FANS - 1):
+        ms->fan_config[ms->command - MAX31790_REG_FAN_CONFIG(0)] =3D data;
+        break;
+
+    case MAX31790_REG_FAN_DYNAMICS(0) ...
+         MAX31790_REG_FAN_DYNAMICS(MAX31790_NUM_FANS - 1):
+        ms->fan_dynamics[ms->command - MAX31790_REG_FAN_DYNAMICS(0)] =3D d=
ata;
+        break;
+
+    case MAX31790_REG_FAN_FAULT_STATUS_2:
+        ms->fan_fault_status_2 =3D data;
+        break;
+
+    case MAX31790_REG_FAN_FAULT_STATUS_1:
+        ms->fan_fault_status_1 =3D data;
+        break;
+
+    case MAX31790_REG_FAN_FAULT_MASK_2:
+        ms->fan_fault_mask_2 =3D data;
+        break;
+
+    case MAX31790_REG_FAN_FAULT_MASK_1:
+        ms->fan_fault_mask_1 =3D data;
+        break;
+
+    case MAX31790_REG_FAILED_FAN_OPTS_SEQ_STRT:
+        ms->failed_fan_opts_seq_strt =3D data;
+        break;
+
+    case MAX31790_REG_PWMOUT_MSB(0) ...
+         MAX31790_REG_PWMOUT_LSB(MAX31790_NUM_FANS - 1):
+        index =3D (ms->command - MAX31790_REG_PWMOUT_MSB(0)) / 2;
+        rem =3D (ms->command - MAX31790_REG_PWMOUT_MSB(0)) % 2;
+        if (rem) {
+            max31790_place_bits(&ms->pwmout[index], data, 0);
+        } else {
+            max31790_place_bits(&ms->pwmout[index], data, 8);
+        }
+        break;
+
+    case MAX31790_REG_TARGET_COUNT_MSB(0) ...
+         MAX31790_REG_TARGET_COUNT_LSB(MAX31790_NUM_FANS - 1):
+        index =3D (ms->command - MAX31790_REG_TARGET_COUNT_MSB(0)) / 2;
+        rem =3D (ms->command - MAX31790_REG_TARGET_COUNT_MSB(0)) % 2;
+        if (rem) {
+            max31790_place_bits(&ms->target_count[index], data, 0);
+        } else {
+            max31790_place_bits(&ms->target_count[index], data, 8);
+        }
+        break;
+
+    case MAX31790_REG_WINDOW(0) ...
+         MAX31790_REG_WINDOW(MAX31790_NUM_FANS - 1):
+        ms->window[ms->command - MAX31790_REG_WINDOW(0)] =3D data;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: writing to unsupported register 0x%02x",
+                      __func__, ms->command);
+        return -1;
+    }
+
+    return 0;
+}
+
+static int max31790_event(I2CSlave *i2c, enum i2c_event event)
+{
+    MAX31790State *ms =3D MAX31790(i2c);
+
+    if (event =3D=3D I2C_START_SEND) {
+        ms->i2c_cmd_event =3D true;
+    }
+
+    return 0;
+}
+
+/* assumes that the fans have the same speed range (SR) */
+static void max31790_get_rpm(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    MAX31790State *ms =3D MAX31790(obj);
+    uint16_t tach_count =3D *(uint16_t *)opaque;
+    uint32_t sr =3D max31790_get_sr(ms->fan_dynamics[0]);
+    uint16_t rpm;
+
+    max31790_update_tach_count(ms);
+    tach_count >>=3D MAX31790_TACH_SHAMT;
+
+    if (tach_count) {
+        rpm =3D (sr * MAX31790_CLK_FREQ * 60) /
+              (MAX31790_PULSES_PER_REV * tach_count);
+    }
+
+    visit_type_uint16(v, name, &rpm, errp);
+}
+
+static void max31790_set_rpm(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    MAX31790State *ms =3D MAX31790(obj);
+    uint16_t *internal =3D opaque;
+    uint32_t sr =3D max31790_get_sr(ms->fan_dynamics[0]);
+    uint16_t rpm, tach_count;
+
+    if (!visit_type_uint16(v, name, &rpm, errp)) {
+        return;
+    }
+
+    if (rpm) {
+        tach_count =3D (sr * MAX31790_CLK_FREQ * 60) /
+                     (MAX31790_PULSES_PER_REV * rpm);
+    } else {
+        tach_count =3D 0;
+    }
+
+    *internal =3D tach_count << MAX31790_TACH_SHAMT;
+}
+
+static void max31790_get(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    MAX31790State *ms =3D MAX31790(obj);
+    uint16_t value;
+
+    max31790_update_tach_count(ms);
+
+    if (strncmp(name, "pwm", 3) =3D=3D 0) {
+        value =3D *(uint16_t *)opaque >> 7;
+    } else {
+        value =3D *(uint16_t *)opaque;
+    }
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static void max31790_set(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    uint16_t *internal =3D opaque;
+    uint16_t value;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    if (strncmp(name, "pwm", 3) =3D=3D 0) {
+        *internal =3D value << MAX31790_PWM_SHAMT;
+    } else {
+        *internal =3D value;
+    }
+
+}
+
+static void max31790_init(Object *obj)
+{
+    MAX31790State *ms =3D MAX31790(obj);
+
+    ms->global_config =3D MAX31790_GLOBAL_CONFIG_DEFAULT;
+    ms->pwm_freq =3D MAX31790_PWM_FREQ_DEFAULT;
+    ms->failed_fan_opts_seq_strt =3D MAX31790_FAILED_FAN_OPTS_SEQ_STRT_DEF=
AULT;
+
+    for (int i =3D 0; i < MAX31790_NUM_FANS; i++) {
+        ms->max_rpm[i] =3D MAX31790_MAX_RPM_DEFAULT;
+        ms->fan_config[i] =3D 0;
+        ms->fan_dynamics[i] =3D MAX31790_FAN_DYNAMICS_DEFAULT;
+        ms->pwmout[i] =3D MAX31790_PWMOUT_DEFAULT;
+        ms->target_count[i] =3D MAX31790_TARGET_COUNT_DEFAULT;
+    }
+
+    max31790_update_tach_count(ms);
+    for (int i =3D 0; i < MAX31790_NUM_FANS; i++) {
+        object_property_add(obj, "target_rpm[*]", "uint16",
+                            max31790_get_rpm,
+                            max31790_set_rpm, NULL, &ms->target_count[i]);
+
+        /* 9-bit PWM on this device */
+        object_property_add(obj, "pwm[*]", "uint16",
+                            max31790_get,
+                            max31790_set, NULL, &ms->pwmout[i]);
+
+        /* used to calculate rpm for a given pwm duty cycle */
+        object_property_add(obj, "max_rpm[*]", "uint16",
+                            max31790_get,
+                            max31790_set, NULL, &ms->max_rpm[i]);
+    }
+}
+
+static void max31790_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
+
+    dc->desc =3D "Maxim MAX31790 fan controller";
+
+    k->event =3D max31790_event;
+    k->recv =3D max31790_recv;
+    k->send =3D max31790_send;
+}
+
+static const TypeInfo max31790_info =3D {
+    .name =3D TYPE_MAX31790,
+    .parent =3D TYPE_I2C_SLAVE,
+    .instance_size =3D sizeof(MAX31790State),
+    .instance_init =3D max31790_init,
+    .class_init =3D max31790_class_init,
+};
+
+static void max31790_register_types(void)
+{
+    type_register_static(&max31790_info);
+}
+
+type_init(max31790_register_types)
diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
index 059c4ca935..4ce68cfc89 100644
--- a/hw/sensor/meson.build
+++ b/hw/sensor/meson.build
@@ -4,3 +4,4 @@ softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps31=
0.c'))
 softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
 softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
+softmmu_ss.add(when: 'CONFIG_MAX31790', if_true: files('max31790_fan_ctrl.=
c'))
diff --git a/include/hw/sensor/max31790_fan_ctrl.h b/include/hw/sensor/max3=
1790_fan_ctrl.h
new file mode 100644
index 0000000000..74ff7bb5a0
--- /dev/null
+++ b/include/hw/sensor/max31790_fan_ctrl.h
@@ -0,0 +1,93 @@
+/*
+ * Max 31790 Fan controller
+ *
+ * Independently control 6 fans, up to 12 tachometer inputs,
+ * controlled through i2c
+ *
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef MAX31790_FAN_CTRL_H
+#define MAX31790_FAN_CTRL_H
+
+#include "hw/i2c/i2c.h"
+#include "qom/object.h"
+
+#define MAX31790_NUM_FANS 6
+#define MAX31790_NUM_TACHS 12
+
+typedef struct MAX31790State {
+    I2CSlave parent;
+
+    /* Registers */
+    uint8_t global_config;
+    uint8_t pwm_freq;
+    uint8_t fan_config[MAX31790_NUM_FANS];
+    uint8_t fan_dynamics[MAX31790_NUM_FANS];
+    uint8_t fan_fault_status_2;
+    uint8_t fan_fault_status_1;
+    uint8_t fan_fault_mask_2;
+    uint8_t fan_fault_mask_1;
+    uint8_t failed_fan_opts_seq_strt;
+    uint16_t tach_count[MAX31790_NUM_TACHS];
+    uint16_t pwm_duty_cycle[MAX31790_NUM_FANS];
+    uint16_t pwmout[MAX31790_NUM_FANS];
+    uint16_t target_count[MAX31790_NUM_FANS];
+    uint8_t window[MAX31790_NUM_FANS];
+
+    /* config */
+    uint16_t max_rpm[MAX31790_NUM_FANS];
+
+    /* i2c transaction state */
+    uint8_t command;
+    bool i2c_cmd_event;
+    bool cmd_is_new;
+} MAX31790State;
+
+#define TYPE_MAX31790 "max31790"
+#define MAX31790(obj) OBJECT_CHECK(MAX31790State, (obj), TYPE_MAX31790)
+
+#define MAX31790_REG_GLOBAL_CONFIG             0x00                 /* R/W=
 */
+#define MAX31790_REG_PWM_FREQ                  0x01                 /* R/W=
 */
+#define MAX31790_REG_FAN_CONFIG(ch)           (0x02 + (ch))         /* R/W=
 */
+#define MAX31790_REG_FAN_DYNAMICS(ch)         (0x08 + (ch))         /* R/W=
 */
+#define MAX31790_REG_FAN_FAULT_STATUS_2        0x10                 /* R/W=
 */
+#define MAX31790_REG_FAN_FAULT_STATUS_1        0x11                 /* R/W=
 */
+#define MAX31790_REG_FAN_FAULT_MASK_2          0x12                 /* R/W=
 */
+#define MAX31790_REG_FAN_FAULT_MASK_1          0x13                 /* R/W=
 */
+#define MAX31790_REG_FAILED_FAN_OPTS_SEQ_STRT  0x14                 /* R/W=
 */
+#define MAX31790_REG_TACH_COUNT_MSB(ch)       (0x18 + (ch) * 2)     /* R *=
/
+#define MAX31790_REG_TACH_COUNT_LSB(ch)       (0x19 + (ch) * 2)     /* R *=
/
+#define MAX31790_REG_PWM_DUTY_CYCLE_MSB(ch)   (0x30 + (ch) * 2)     /* R *=
/
+#define MAX31790_REG_PWM_DUTY_CYCLE_LSB(ch)   (0x31 + (ch) * 2)     /* R *=
/
+#define MAX31790_REG_PWMOUT_MSB(ch)           (0x40 + (ch) * 2)     /* R/W=
 */
+#define MAX31790_REG_PWMOUT_LSB(ch)           (0x41 + (ch) * 2)     /* R/W=
 */
+#define MAX31790_REG_TARGET_COUNT_MSB(ch)     (0x50 + (ch) * 2)     /* R/W=
 */
+#define MAX31790_REG_TARGET_COUNT_LSB(ch)     (0x51 + (ch) * 2)     /* R/W=
 */
+#define MAX31790_REG_WINDOW(ch)               (0x60 + (ch))         /* R/W=
 */
+
+#define MAX31790_GLOBAL_CONFIG_DEFAULT                0x20
+#define MAX31790_PWM_FREQ_DEFAULT                     0x44 /* 125Hz */
+#define MAX31790_FAN_DYNAMICS_DEFAULT                 0x4C
+#define MAX31790_FAILED_FAN_OPTS_SEQ_STRT_DEFAULT     0x45
+#define MAX31790_PWMOUT_DEFAULT                       (128 << 7) /* 25% */
+#define MAX31790_TARGET_COUNT_DEFAULT                 0x3D60
+
+/* Fan Config register bits */
+#define MAX31790_FAN_CFG_RPM_MODE             BIT(7)
+#define MAX31790_FAN_CFG_MONITOR_ONLY         BIT(4)
+#define MAX31790_FAN_CFG_TACH_INPUT_EN        BIT(3)
+#define MAX31790_FAN_CFG_TACH_INPUT           BIT(0)
+
+/* Tachometer calculation constants */
+#define MAX31790_PULSES_PER_REV             2
+#define MAX31790_SR_DEFAULT                 4
+#define MAX31790_CLK_FREQ                   8192
+#define MAX31790_MAX_RPM_DEFAULT            16500
+
+/* reg alignment amounts */
+#define MAX31790_PWM_SHAMT                  7
+#define MAX31790_TACH_SHAMT                 5
+#endif
--=20
2.34.1.575.g55b058a8bb-goog


