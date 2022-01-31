Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04064A527F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 23:39:22 +0100 (CET)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEfKT-0006pT-TP
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 17:39:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <35GL4YQcKCqEWFOUVSFHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--venture.bounces.google.com>)
 id 1nEfIi-0005QZ-NU
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 17:37:32 -0500
Received: from [2607:f8b0:4864:20::94a] (port=39818
 helo=mail-ua1-x94a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <35GL4YQcKCqEWFOUVSFHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--venture.bounces.google.com>)
 id 1nEfIf-0000zh-Ut
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 17:37:32 -0500
Received: by mail-ua1-x94a.google.com with SMTP id
 e22-20020ab031d6000000b0030525c25702so8132294uan.6
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 14:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=tSqnzdRyvcaZNuXfT6/oBX8FmD/wIUueIItuLDzFvag=;
 b=sO+UQAfIMb8oZ8nLzQlbhpLhqnsbrTDiaJvBn5eilxkrdm4NmqR/SgwwXMRuvvw9t0
 cIMqb76f1jkSgEdVRCCrfgCFP4hOJ/C6yV0ZgYp55TBkElrybMUbYjCgvoCNXaRcX6nR
 FvDCwzg5FUhODlY9z4jOdl/SRMfeh2vnHfJdKoXQD1OpUu73f4baCeTh3VY635mFgJn3
 rnvT8iUHq1BbwKt3ch2PoRs05vf/nj/uI7jLmM60bHxVqxjIuhUWXYzPIDfS+yrsOuA3
 1ZzRgR0aqXhsdpGoCTPOvqjt9fNEJuRN0gpSBeWxx1MqWXmgnCXG9y1lQwEOeOhO1Rar
 SosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=tSqnzdRyvcaZNuXfT6/oBX8FmD/wIUueIItuLDzFvag=;
 b=2Av6DW99yS9Q6nGWXyNIv0qLrhr+UxMHDEn9UG7gXB0d4gtSnnRuvgbJx83SvfjLwo
 PG6/6uYgla9m7O8nyQFVTUElVPri+IvTPm1z5oQaJ/i6Q6U+PK0Qm4gVMzMOpFh+Nom2
 RzhyuRCJ+nyDbAQTpJvO5I8nv5pybLaK3SmydlhEDTqaUHtS3cb+P7qcTd/A9RbXQa9E
 LWe7qloahCoLxc+3vD9R2tDYOsDKrGA4ju61Bi4YxtcjrfHRfLHxaHPapztZD3WFMnWw
 dvGUbc26Wxt66t50f4arHcUfp3aBsRMj7DwxVcp5M984j+BvBfp21loHxjyAhZTudwGl
 WALg==
X-Gm-Message-State: AOAM532wTPO0+TgyHK9ZBwd6zQ/i62H30PDRsXKFKxR6H0RoV/HcjBy9
 +XJK59oJK4ipqB1oXDO47D96Fa6DZI5I
X-Google-Smtp-Source: ABdhPJx8nJ5s786211aAcPmELVLP33pjhZPKH2HxdiWsYUUWkCbVuQ935R/qHIRFUt1dpbDviVAlMvWibj9p
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5780:bdf0:5f14:9c50])
 (user=venture job=sendgmr) by 2002:a05:6902:100f:: with SMTP id
 w15mr34859962ybt.321.1643668196504; Mon, 31 Jan 2022 14:29:56 -0800 (PST)
Date: Mon, 31 Jan 2022 14:29:47 -0800
In-Reply-To: <20220131222948.496588-1-venture@google.com>
Message-Id: <20220131222948.496588-2-venture@google.com>
Mime-Version: 1.0
References: <20220131222948.496588-1-venture@google.com>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH v4 1/2] hw/sensor: Add SB-TSI Temperature Sensor Interface
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, thuth@redhat.com, lvivier@redhat.com, 
 pbonzini@redhat.com, f4bug@amsat.org
Cc: qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, 
 Patrick Venture <venture@google.com>, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::94a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::94a;
 envelope-from=35GL4YQcKCqEWFOUVSFHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--venture.bounces.google.com;
 helo=mail-ua1-x94a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Doug Evans <dje@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
---
 meson.build               |   1 +
 hw/sensor/trace.h         |   1 +
 include/hw/sensor/sbtsi.h |  45 +++++
 hw/sensor/tmp_sbtsi.c     | 369 ++++++++++++++++++++++++++++++++++++++
 hw/sensor/Kconfig         |   4 +
 hw/sensor/meson.build     |   1 +
 hw/sensor/trace-events    |   5 +
 7 files changed, 426 insertions(+)
 create mode 100644 hw/sensor/trace.h
 create mode 100644 include/hw/sensor/sbtsi.h
 create mode 100644 hw/sensor/tmp_sbtsi.c
 create mode 100644 hw/sensor/trace-events

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
diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h
new file mode 100644
index 0000000000..e4721560b0
--- /dev/null
+++ b/hw/sensor/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_sensor.h"
diff --git a/include/hw/sensor/sbtsi.h b/include/hw/sensor/sbtsi.h
new file mode 100644
index 0000000000..9073f76ebb
--- /dev/null
+++ b/include/hw/sensor/sbtsi.h
@@ -0,0 +1,45 @@
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
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+#ifndef QEMU_TMP_SBTSI_H
+#define QEMU_TMP_SBTSI_H
+
+/*
+ * SB-TSI registers only support SMBus byte data access. "_INT" registers =
are
+ * the integer part of a temperature value or limit, and "_DEC" registers =
are
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
diff --git a/hw/sensor/tmp_sbtsi.c b/hw/sensor/tmp_sbtsi.c
new file mode 100644
index 0000000000..d5406844ef
--- /dev/null
+++ b/hw/sensor/tmp_sbtsi.c
@@ -0,0 +1,369 @@
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
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
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
+#include "qom/object.h"
+#include "trace.h"
+
+#define TYPE_SBTSI "sbtsi"
+#define SBTSI(obj) OBJECT_CHECK(SBTSIState, (obj), TYPE_SBTSI)
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
+ * So the max temperature is (2^8-1) + (2^3-1)/8 =3D 255.875 degrees.
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
+    s->status =3D 0;
+    if (s->alert_config & SBTSI_ALARM_EN) {
+        if (s->temperature >=3D s->limit_high) {
+            s->status |=3D SBTSI_STATUS_HIGH_ALERT;
+        }
+        if (s->temperature <=3D s->limit_low) {
+            s->status |=3D SBTSI_STATUS_LOW_ALERT;
+        }
+    }
+}
+
+static void sbtsi_update_alarm(SBTSIState *s)
+{
+    sbtsi_update_status(s);
+    if (s->status !=3D 0 && !(s->config & SBTSI_CONFIG_ALERT_MASK)) {
+        qemu_irq_raise(s->alarm);
+    } else {
+        qemu_irq_lower(s->alarm);
+    }
+}
+
+static uint8_t sbtsi_read_byte(SMBusDevice *d)
+{
+    SBTSIState *s =3D SBTSI(d);
+    uint8_t data =3D 0;
+
+    switch (s->addr) {
+    case SBTSI_REG_TEMP_INT:
+        data =3D get_temp_int(s->temperature);
+        break;
+
+    case SBTSI_REG_TEMP_DEC:
+        data =3D get_temp_dec(s->temperature);
+        break;
+
+    case SBTSI_REG_TEMP_HIGH_INT:
+        data =3D get_temp_int(s->limit_high);
+        break;
+
+    case SBTSI_REG_TEMP_LOW_INT:
+        data =3D get_temp_int(s->limit_low);
+        break;
+
+    case SBTSI_REG_TEMP_HIGH_DEC:
+        data =3D get_temp_dec(s->limit_high);
+        break;
+
+    case SBTSI_REG_TEMP_LOW_DEC:
+        data =3D get_temp_dec(s->limit_low);
+        break;
+
+    case SBTSI_REG_CONFIG:
+    case SBTSI_REG_CONFIG_WR:
+        data =3D s->config;
+        break;
+
+    case SBTSI_REG_STATUS:
+        sbtsi_update_alarm(s);
+        data =3D s->status;
+        break;
+
+    case SBTSI_REG_ALERT_CONFIG:
+        data =3D s->alert_config;
+        break;
+
+    case SBTSI_REG_MAN:
+        data =3D SBTSI_MAN_DEFAULT;
+        break;
+
+    case SBTSI_REG_REV:
+        data =3D SBTSI_REV_DEFAULT;
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
+        s->config =3D data;
+        break;
+
+    case SBTSI_REG_TEMP_HIGH_INT:
+        s->limit_high =3D compute_temp_int(s->limit_high, data);
+        break;
+
+    case SBTSI_REG_TEMP_LOW_INT:
+        s->limit_low =3D compute_temp_int(s->limit_low, data);
+        break;
+
+    case SBTSI_REG_TEMP_HIGH_DEC:
+        s->limit_high =3D compute_temp_dec(s->limit_high, data);
+        break;
+
+    case SBTSI_REG_TEMP_LOW_DEC:
+        s->limit_low =3D compute_temp_dec(s->limit_low, data);
+        break;
+
+    case SBTSI_REG_ALERT_CONFIG:
+        s->alert_config =3D data;
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
+    SBTSIState *s =3D SBTSI(d);
+
+    if (len =3D=3D 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func_=
_);
+        return -1;
+    }
+
+    s->addr =3D buf[0];
+    if (len > 1) {
+        sbtsi_write(s, buf[1]);
+        if (len > 2) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: extra data at end\n", __fu=
nc__);
+        }
+    }
+    return 0;
+}
+
+/* Units are millidegrees. */
+static void sbtsi_get_temperature(Object *obj, Visitor *v, const char *nam=
e,
+                                  void *opaque, Error **errp)
+{
+    SBTSIState *s =3D SBTSI(obj);
+    uint32_t temp =3D s->temperature * SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
+
+    visit_type_uint32(v, name, &temp, errp);
+}
+
+/* Units are millidegrees. */
+static void sbtsi_set_temperature(Object *obj, Visitor *v, const char *nam=
e,
+                                  void *opaque, Error **errp)
+{
+    SBTSIState *s =3D SBTSI(obj);
+    uint32_t temp;
+
+    if (!visit_type_uint32(v, name, &temp, errp)) {
+        return;
+    }
+    if (temp > SBTSI_TEMP_MAX_IN_MILLIDEGREE) {
+        error_setg(errp, "value %" PRIu32 ".%03" PRIu32 " C is out of rang=
e",
+                   temp / 1000, temp % 1000);
+        return;
+    }
+
+    s->temperature =3D temp / SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
+    sbtsi_update_alarm(s);
+}
+
+static int sbtsi_post_load(void *opaque, int version_id)
+{
+    SBTSIState *s =3D opaque;
+
+    sbtsi_update_alarm(s);
+    return 0;
+}
+
+static const VMStateDescription vmstate_sbtsi =3D {
+    .name =3D "SBTSI",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .post_load =3D sbtsi_post_load,
+    .fields =3D (VMStateField[]) {
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
+    SBTSIState *s =3D SBTSI(obj);
+
+    s->config =3D 0;
+    s->limit_low =3D SBTSI_LIMIT_LOW_DEFAULT;
+    s->limit_high =3D SBTSI_LIMIT_HIGH_DEFAULT;
+}
+
+static void sbtsi_hold_reset(Object *obj)
+{
+    SBTSIState *s =3D SBTSI(obj);
+
+    qemu_irq_lower(s->alarm);
+}
+
+static void sbtsi_init(Object *obj)
+{
+    SBTSIState *s =3D SBTSI(obj);
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
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    SMBusDeviceClass *k =3D SMBUS_DEVICE_CLASS(klass);
+
+    dc->desc =3D "SB-TSI Temperature Sensor";
+    dc->vmsd =3D &vmstate_sbtsi;
+    k->write_data =3D sbtsi_write_data;
+    k->receive_byte =3D sbtsi_read_byte;
+    rc->phases.enter =3D sbtsi_enter_reset;
+    rc->phases.hold =3D sbtsi_hold_reset;
+}
+
+static const TypeInfo sbtsi_info =3D {
+    .name          =3D TYPE_SBTSI,
+    .parent        =3D TYPE_SMBUS_DEVICE,
+    .instance_size =3D sizeof(SBTSIState),
+    .instance_init =3D sbtsi_init,
+    .class_init    =3D sbtsi_class_init,
+};
+
+static void sbtsi_register_types(void)
+{
+    type_register_static(&sbtsi_info);
+}
+
+type_init(sbtsi_register_types)
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
@@ -4,3 +4,4 @@ softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps31=
0.c'))
 softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
 softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
+softmmu_ss.add(when: 'CONFIG_AMDSBTSI', if_true: files('tmp_sbtsi.c'))
diff --git a/hw/sensor/trace-events b/hw/sensor/trace-events
new file mode 100644
index 0000000000..21ab3809e2
--- /dev/null
+++ b/hw/sensor/trace-events
@@ -0,0 +1,5 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
+# tmp_sbtsi.c
+tmp_sbtsi_write_data(uint8_t addr, uint8_t value) "SBTSI write addr:0x%02x=
 data: 0x%02x"
+tmp_sbtsi_read_data(uint8_t addr, uint8_t value) "SBTSI read addr:0x%02x d=
ata: 0x%02x"
--=20
2.34.1.575.g55b058a8bb-goog


