Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8953C1906
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:12:03 +0200 (CEST)
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YVG-0003ll-BP
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38zPnYAYKCgYzoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com>)
 id 1m1Xhq-0008H5-2c
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:20:58 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:54922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38zPnYAYKCgYzoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com>)
 id 1m1Xhl-00043g-Dt
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:20:57 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 h1-20020a255f410000b02905585436b530so7798223ybm.21
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=KvsKxBC2eFp+A8VE08VcTsZfKu+zoDoj6NmU2NUSpaI=;
 b=rpTZgNXUCysfSRnNPfnaOmjcanhURbeZHNDswVaaOauq/uRUI/P93QP+4Oloua/I3C
 KDJfdyapIO3Kpc0+8mOIkMHy0KSP6umgJP7kKccV3s4Deteoaxqt9p9fFNFDvflUjAyh
 hi4/XMnHBNx8FkchgQRnlwWzUBr1bfeo9rquSxikFtz+DAWR8DTfuwYTGq0RTFIj0YnW
 oudpJVyPAsU+YzuAOlLH9VCTGJ+B7FB+mXB8IV9kG2JwNSyPMqWJudl8TwSMzWLcc55f
 q97HxD7ABt4/qFsDsC/e80cGezAmsA1nafn7+Ul+vQhiaxLv9u2xmuGJV2f/NRDlP3dh
 yddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=KvsKxBC2eFp+A8VE08VcTsZfKu+zoDoj6NmU2NUSpaI=;
 b=Tr97wP6Ajudc4Cju1xv2d17Ht0uctulgrYPBO2VuXHEKPFuzfJGqhbkADnagzijAzd
 CF4Pz/Yt7hM2LVla7hpEp+V+M8n8q6TqvjA1EiTFElRLdiqfm8skaYXbCX9zsOdToUBx
 5Rf/b1nc9YH171e1VEIaRKC8DfTCVzHB7EuHXrBOfxukIcjVBiB3eg/zT7+LirWvmkZo
 5NRNUTeZqDXBv80k3J40Pw7kKS3Dua41HfPYoiZBjLVLSX8KtntH0lWyYHR5KAYENuJg
 ptCUcM0HnVYQ0SMog6mHxVOfh7AdO3nHr13NaQlUSedyHrlH9+1zxkaqyzKsFJsBarXF
 UNQw==
X-Gm-Message-State: AOAM531yakMTx3CubdtMPogV3C5lqXm6kFwXnkZ1B/DNWGexvey0BaTe
 wb13/xBNurisnd2Pevx9ceT+rwKG/Fk=
X-Google-Smtp-Source: ABdhPJwe5jd+i1Xzc1BOhQia9XBT1qqxcMBvXftOy/BFTueAM2O/ehsFQJuxwoe0yuEZ2j6dolcwNYShQm0=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:6b42:285b:df15:bf])
 (user=titusr job=sendgmr) by 2002:a25:df06:: with SMTP id
 w6mr42368407ybg.361.1625764851339; 
 Thu, 08 Jul 2021 10:20:51 -0700 (PDT)
Date: Thu,  8 Jul 2021 10:20:16 -0700
In-Reply-To: <20210708172017.1865352-1-titusr@google.com>
Message-Id: <20210708172017.1865352-5-titusr@google.com>
Mime-Version: 1.0
References: <20210708172017.1865352-1-titusr@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH v5 4/5] hw/misc: add MAX34451 device
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=38zPnYAYKCgYzoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.5,
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

The MAX34451 is a Maxim power-supply system manager that can monitor up to =
16 voltage rails or currents. It also contains a temperature sensor and sup=
ports up to four external temperature sensors.

This commit adds support for interfacing with it, and setting limits on the=
 supported sensors.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/misc/max34451.c  | 775 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/Kconfig      |   1 +
 hw/misc/Kconfig     |   4 +
 hw/misc/meson.build |   1 +
 4 files changed, 781 insertions(+)
 create mode 100644 hw/misc/max34451.c

diff --git a/hw/misc/max34451.c b/hw/misc/max34451.c
new file mode 100644
index 0000000000..1e7c68271e
--- /dev/null
+++ b/hw/misc/max34451.c
@@ -0,0 +1,775 @@
+/*
+ * Maxim MAX34451 PMBus 16-Channel V/I monitor and 12-Channel Sequencer/Ma=
rginer
+ *
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i2c/pmbus_device.h"
+#include "hw/irq.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+#define TYPE_MAX34451 "max34451"
+#define MAX34451(obj) OBJECT_CHECK(MAX34451State, (obj), TYPE_MAX34451)
+
+#define MAX34451_MFR_MODE               0xD1
+#define MAX34451_MFR_PSEN_CONFIG        0xD2
+#define MAX34451_MFR_VOUT_PEAK          0xD4
+#define MAX34451_MFR_IOUT_PEAK          0xD5
+#define MAX34451_MFR_TEMPERATURE_PEAK   0xD6
+#define MAX34451_MFR_VOUT_MIN           0xD7
+#define MAX34451_MFR_NV_LOG_CONFIG      0xD8
+#define MAX34451_MFR_FAULT_RESPONSE     0xD9
+#define MAX34451_MFR_FAULT_RETRY        0xDA
+#define MAX34451_MFR_NV_FAULT_LOG       0xDC
+#define MAX34451_MFR_TIME_COUNT         0xDD
+#define MAX34451_MFR_MARGIN_CONFIG      0xDF
+#define MAX34451_MFR_FW_SERIAL          0xE0
+#define MAX34451_MFR_IOUT_AVG           0xE2
+#define MAX34451_MFR_CHANNEL_CONFIG     0xE4
+#define MAX34451_MFR_TON_SEQ_MAX        0xE6
+#define MAX34451_MFR_PWM_CONFIG         0xE7
+#define MAX34451_MFR_SEQ_CONFIG         0xE8
+#define MAX34451_MFR_STORE_ALL          0xEE
+#define MAX34451_MFR_RESTORE_ALL        0xEF
+#define MAX34451_MFR_TEMP_SENSOR_CONFIG 0xF0
+#define MAX34451_MFR_STORE_SINGLE       0xFC
+#define MAX34451_MFR_CRC                0xFE
+
+#define MAX34451_NUM_MARGINED_PSU       12
+#define MAX34451_NUM_PWR_DEVICES        16
+#define MAX34451_NUM_TEMP_DEVICES       5
+#define MAX34451_NUM_PAGES              21
+
+#define DEFAULT_OP_ON                   0x80
+#define DEFAULT_CAPABILITY              0x20
+#define DEFAULT_ON_OFF_CONFIG           0x1a
+#define DEFAULT_VOUT_MODE               0x40
+#define DEFAULT_TEMPERATURE             2500
+#define DEFAULT_SCALE                   0x7FFF
+#define DEFAULT_OV_LIMIT                0x7FFF
+#define DEFAULT_OC_LIMIT                0x7FFF
+#define DEFAULT_OT_LIMIT                0x7FFF
+#define DEFAULT_VMIN                    0x7FFF
+#define DEFAULT_TON_FAULT_LIMIT         0xFFFF
+#define DEFAULT_CHANNEL_CONFIG          0x20
+#define DEFAULT_TEXT                    0x3130313031303130
+
+/**
+ * MAX34451State:
+ * @code: The command code received
+ * @page: Each page corresponds to a device monitored by the Max 34451
+ * The page register determines the available commands depending on device
+  ________________________________________________________________________=
___
+ |   0   |  Power supply monitored by RS0, controlled by PSEN0, and       =
   |
+ |       |  margined with PWM0.                                           =
   |
+ |_______|________________________________________________________________=
___|
+ |   1   |  Power supply monitored by RS1, controlled by PSEN1, and       =
   |
+ |       |  margined with PWM1.                                           =
   |
+ |_______|________________________________________________________________=
___|
+ |   2   |  Power supply monitored by RS2, controlled by PSEN2, and       =
   |
+ |       |  margined with PWM2.                                           =
   |
+ |_______|________________________________________________________________=
___|
+ |   3   |  Power supply monitored by RS3, controlled by PSEN3, and       =
   |
+ |       |  margined with PWM3.                                           =
   |
+ |_______|________________________________________________________________=
___|
+ |   4   |  Power supply monitored by RS4, controlled by PSEN4, and       =
   |
+ |       |  margined with PWM4.                                           =
   |
+ |_______|________________________________________________________________=
___|
+ |   5   |  Power supply monitored by RS5, controlled by PSEN5, and       =
   |
+ |       |  margined with PWM5.                                           =
   |
+ |_______|________________________________________________________________=
___|
+ |   6   |  Power supply monitored by RS6, controlled by PSEN6, and       =
   |
+ |       |  margined with PWM6.                                           =
   |
+ |_______|________________________________________________________________=
___|
+ |   7   |  Power supply monitored by RS7, controlled by PSEN7, and       =
   |
+ |       |  margined with PWM7.                                           =
   |
+ |_______|________________________________________________________________=
___|
+ |   8   |  Power supply monitored by RS8, controlled by PSEN8, and       =
   |
+ |       | optionally margined by OUT0 of external DS4424 at I2C address A=
0h.|
+ |_______|________________________________________________________________=
___|
+ |   9   |  Power supply monitored by RS9, controlled by PSEN9, and       =
   |
+ |       | optionally margined by OUT1 of external DS4424 at I2C address A=
0h.|
+ |_______|________________________________________________________________=
___|
+ |   10  |  Power supply monitored by RS10, controlled by PSEN10, and     =
   |
+ |       | optionally margined by OUT2 of external DS4424 at I2C address A=
0h.|
+ |_______|________________________________________________________________=
___|
+ |   11  |  Power supply monitored by RS11, controlled by PSEN11, and     =
   |
+ |       | optionally margined by OUT3 of external DS4424 at I2C address A=
0h.|
+ |_______|________________________________________________________________=
___|
+ |   12  |  ADC channel 12 (monitors voltage or current) or GPI.          =
   |
+ |_______|________________________________________________________________=
___|
+ |   13  |  ADC channel 13 (monitors voltage or current) or GPI.          =
   |
+ |_______|________________________________________________________________=
___|
+ |   14  |  ADC channel 14 (monitors voltage or current) or GPI.          =
   |
+ |_______|________________________________________________________________=
___|
+ |   15  |  ADC channel 15 (monitors voltage or current) or GPI.          =
   |
+ |_______|________________________________________________________________=
___|
+ |   16  |  Internal temperature sensor.                                  =
   |
+ |_______|________________________________________________________________=
___|
+ |   17  |  External DS75LV temperature sensor with I2C address 90h.      =
   |
+ |_______|________________________________________________________________=
___|
+ |   18  |  External DS75LV temperature sensor with I2C address 92h.      =
   |
+ |_______|________________________________________________________________=
___|
+ |   19  |  External DS75LV temperature sensor with I2C address 94h.      =
   |
+ |_______|________________________________________________________________=
___|
+ |   20  |  External DS75LV temperature sensor with I2C address 96h.      =
   |
+ |_______|________________________________________________________________=
___|
+ | 21=E2=80=93254|  Reserved.                                             =
           |
+ |_______|________________________________________________________________=
___|
+ |   255 |  Applies to all pages.                                         =
   |
+ |_______|________________________________________________________________=
___|
+ *
+ * @operation: Turn on and off power supplies
+ * @on_off_config: Configure the power supply on and off transition behavi=
our
+ * @write_protect: protect against changes to the device's memory
+ * @vout_margin_high: the voltage when OPERATION is set to margin high
+ * @vout_margin_low: the voltage when OPERATION is set to margin low
+ * @vout_scale: scale ADC reading to actual device reading if different
+ * @iout_cal_gain: set ratio of the voltage at the ADC input to sensed cur=
rent
+ */
+typedef struct MAX34451State {
+    PMBusDevice parent;
+
+    uint16_t power_good_on[MAX34451_NUM_PWR_DEVICES];
+    uint16_t power_good_off[MAX34451_NUM_PWR_DEVICES];
+    uint16_t ton_delay[MAX34451_NUM_MARGINED_PSU];
+    uint16_t ton_max_fault_limit[MAX34451_NUM_MARGINED_PSU];
+    uint16_t toff_delay[MAX34451_NUM_MARGINED_PSU];
+    uint8_t status_mfr_specific[MAX34451_NUM_PWR_DEVICES];
+    /* Manufacturer specific function */
+    uint64_t mfr_location;
+    uint64_t mfr_date;
+    uint64_t mfr_serial;
+    uint16_t mfr_mode;
+    uint32_t psen_config[MAX34451_NUM_MARGINED_PSU];
+    uint16_t vout_peak[MAX34451_NUM_PWR_DEVICES];
+    uint16_t iout_peak[MAX34451_NUM_PWR_DEVICES];
+    uint16_t temperature_peak[MAX34451_NUM_TEMP_DEVICES];
+    uint16_t vout_min[MAX34451_NUM_PWR_DEVICES];
+    uint16_t nv_log_config;
+    uint32_t fault_response[MAX34451_NUM_PWR_DEVICES];
+    uint16_t fault_retry;
+    uint32_t fault_log;
+    uint32_t time_count;
+    uint16_t margin_config[MAX34451_NUM_MARGINED_PSU];
+    uint16_t fw_serial;
+    uint16_t iout_avg[MAX34451_NUM_PWR_DEVICES];
+    uint16_t channel_config[MAX34451_NUM_PWR_DEVICES];
+    uint16_t ton_seq_max[MAX34451_NUM_MARGINED_PSU];
+    uint32_t pwm_config[MAX34451_NUM_MARGINED_PSU];
+    uint32_t seq_config[MAX34451_NUM_MARGINED_PSU];
+    uint16_t temp_sensor_config[MAX34451_NUM_TEMP_DEVICES];
+    uint16_t store_single;
+    uint16_t crc;
+} MAX34451State;
+
+
+static void max34451_check_limits(MAX34451State *s)
+{
+    PMBusDevice *pmdev =3D PMBUS_DEVICE(s);
+
+    pmbus_check_limits(pmdev);
+
+    for (int i =3D 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
+        if (pmdev->pages[i].read_vout =3D=3D 0) { /* PSU disabled */
+            continue;
+        }
+
+        if (pmdev->pages[i].read_vout > s->vout_peak[i]) {
+            s->vout_peak[i] =3D pmdev->pages[i].read_vout;
+        }
+
+        if (pmdev->pages[i].read_vout < s->vout_min[i]) {
+            s->vout_min[i] =3D pmdev->pages[i].read_vout;
+        }
+
+        if (pmdev->pages[i].read_iout > s->iout_peak[i]) {
+            s->iout_peak[i] =3D pmdev->pages[i].read_iout;
+        }
+    }
+
+    for (int i =3D 0; i < MAX34451_NUM_TEMP_DEVICES; i++) {
+        if (pmdev->pages[i + 16].read_temperature_1 > s->temperature_peak[=
i]) {
+            s->temperature_peak[i] =3D pmdev->pages[i + 16].read_temperatu=
re_1;
+        }
+    }
+}
+
+static uint8_t max34451_read_byte(PMBusDevice *pmdev)
+{
+    MAX34451State *s =3D MAX34451(pmdev);
+    switch (pmdev->code) {
+
+    case PMBUS_POWER_GOOD_ON:
+        if (pmdev->page < 16) {
+            pmbus_send16(pmdev, s->power_good_on[pmdev->page]);
+        }
+        break;
+
+    case PMBUS_POWER_GOOD_OFF:
+        if (pmdev->page < 16) {
+            pmbus_send16(pmdev, s->power_good_off[pmdev->page]);
+        }
+        break;
+
+    case PMBUS_TON_DELAY:
+        if (pmdev->page < 12) {
+            pmbus_send16(pmdev, s->ton_delay[pmdev->page]);
+        }
+        break;
+
+    case PMBUS_TON_MAX_FAULT_LIMIT:
+        if (pmdev->page < 12) {
+            pmbus_send16(pmdev, s->ton_max_fault_limit[pmdev->page]);
+        }
+        break;
+
+    case PMBUS_TOFF_DELAY:
+        if (pmdev->page < 12) {
+            pmbus_send16(pmdev, s->toff_delay[pmdev->page]);
+        }
+        break;
+
+    case PMBUS_STATUS_MFR_SPECIFIC:
+        if (pmdev->page < 16) {
+            pmbus_send8(pmdev, s->status_mfr_specific[pmdev->page]);
+        }
+        break;
+
+    case PMBUS_MFR_ID:
+        pmbus_send8(pmdev, 0x4d); /* Maxim */
+        break;
+
+    case PMBUS_MFR_MODEL:
+        pmbus_send8(pmdev, 0x59);
+        break;
+
+    case PMBUS_MFR_LOCATION:
+        pmbus_send64(pmdev, s->mfr_location);
+        break;
+
+    case PMBUS_MFR_DATE:
+        pmbus_send64(pmdev, s->mfr_date);
+        break;
+
+    case PMBUS_MFR_SERIAL:
+        pmbus_send64(pmdev, s->mfr_serial);
+        break;
+
+    case MAX34451_MFR_MODE:
+        pmbus_send16(pmdev, s->mfr_mode);
+        break;
+
+    case MAX34451_MFR_PSEN_CONFIG:
+        if (pmdev->page < 12) {
+            pmbus_send32(pmdev, s->psen_config[pmdev->page]);
+        }
+        break;
+
+    case MAX34451_MFR_VOUT_PEAK:
+        if (pmdev->page < 16) {
+            pmbus_send16(pmdev, s->vout_peak[pmdev->page]);
+        }
+        break;
+
+    case MAX34451_MFR_IOUT_PEAK:
+        if (pmdev->page < 16) {
+            pmbus_send16(pmdev, s->iout_peak[pmdev->page]);
+        }
+        break;
+
+    case MAX34451_MFR_TEMPERATURE_PEAK:
+        if (15 < pmdev->page && pmdev->page < 21) {
+            pmbus_send16(pmdev, s->temperature_peak[pmdev->page % 16]);
+        } else {
+            pmbus_send16(pmdev, s->temperature_peak[0]);
+        }
+        break;
+
+    case MAX34451_MFR_VOUT_MIN:
+        if (pmdev->page < 16) {
+            pmbus_send16(pmdev, s->vout_min[pmdev->page]);
+        }
+        break;
+
+    case MAX34451_MFR_NV_LOG_CONFIG:
+        pmbus_send16(pmdev, s->nv_log_config);
+        break;
+
+    case MAX34451_MFR_FAULT_RESPONSE:
+        if (pmdev->page < 16) {
+            pmbus_send32(pmdev, s->fault_response[pmdev->page]);
+        }
+        break;
+
+    case MAX34451_MFR_FAULT_RETRY:
+        pmbus_send32(pmdev, s->fault_retry);
+        break;
+
+    case MAX34451_MFR_NV_FAULT_LOG:
+        pmbus_send32(pmdev, s->fault_log);
+        break;
+
+    case MAX34451_MFR_TIME_COUNT:
+        pmbus_send32(pmdev, s->time_count);
+        break;
+
+    case MAX34451_MFR_MARGIN_CONFIG:
+        if (pmdev->page < 12) {
+            pmbus_send16(pmdev, s->margin_config[pmdev->page]);
+        }
+        break;
+
+    case MAX34451_MFR_FW_SERIAL:
+        if (pmdev->page =3D=3D 255) {
+            pmbus_send16(pmdev, 1); /* Firmware revision */
+        }
+        break;
+
+    case MAX34451_MFR_IOUT_AVG:
+        if (pmdev->page < 16) {
+            pmbus_send16(pmdev, s->iout_avg[pmdev->page]);
+        }
+        break;
+
+    case MAX34451_MFR_CHANNEL_CONFIG:
+        if (pmdev->page < 16) {
+            pmbus_send16(pmdev, s->channel_config[pmdev->page]);
+        }
+        break;
+
+    case MAX34451_MFR_TON_SEQ_MAX:
+        if (pmdev->page < 12) {
+            pmbus_send16(pmdev, s->ton_seq_max[pmdev->page]);
+        }
+        break;
+
+    case MAX34451_MFR_PWM_CONFIG:
+        if (pmdev->page < 12) {
+            pmbus_send32(pmdev, s->pwm_config[pmdev->page]);
+        }
+        break;
+
+    case MAX34451_MFR_SEQ_CONFIG:
+        if (pmdev->page < 12) {
+            pmbus_send32(pmdev, s->seq_config[pmdev->page]);
+        }
+        break;
+
+    case MAX34451_MFR_TEMP_SENSOR_CONFIG:
+        if (15 < pmdev->page && pmdev->page < 21) {
+            pmbus_send32(pmdev, s->temp_sensor_config[pmdev->page % 16]);
+        }
+        break;
+
+    case MAX34451_MFR_STORE_SINGLE:
+        pmbus_send32(pmdev, s->store_single);
+        break;
+
+    case MAX34451_MFR_CRC:
+        pmbus_send32(pmdev, s->crc);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: reading from unsupported register: 0x%02x\n",
+                      __func__, pmdev->code);
+        break;
+    }
+    return 0xFF;
+}
+
+static int max34451_write_data(PMBusDevice *pmdev, const uint8_t *buf,
+                               uint8_t len)
+{
+    MAX34451State *s =3D MAX34451(pmdev);
+
+    if (len =3D=3D 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func_=
_);
+        return -1;
+    }
+
+    pmdev->code =3D buf[0]; /* PMBus command code */
+
+    if (len =3D=3D 1) {
+        return 0;
+    }
+
+    /* Exclude command code from buffer */
+    buf++;
+    len--;
+    uint8_t index =3D pmdev->page;
+
+    switch (pmdev->code) {
+    case MAX34451_MFR_STORE_ALL:
+    case MAX34451_MFR_RESTORE_ALL:
+    case MAX34451_MFR_STORE_SINGLE:
+        /*
+         * TODO: hardware behaviour is to move the contents of volatile
+         * memory to non-volatile memory.
+         */
+        break;
+
+    case PMBUS_POWER_GOOD_ON: /* R/W word */
+        if (pmdev->page < MAX34451_NUM_PWR_DEVICES) {
+            s->power_good_on[pmdev->page] =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case PMBUS_POWER_GOOD_OFF: /* R/W word */
+        if (pmdev->page < MAX34451_NUM_PWR_DEVICES) {
+            s->power_good_off[pmdev->page] =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case PMBUS_TON_DELAY: /* R/W word */
+        if (pmdev->page < 12) {
+            s->ton_delay[pmdev->page] =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case PMBUS_TON_MAX_FAULT_LIMIT: /* R/W word */
+        if (pmdev->page < 12) {
+            s->ton_max_fault_limit[pmdev->page]
+                =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case PMBUS_TOFF_DELAY: /* R/W word */
+        if (pmdev->page < 12) {
+            s->toff_delay[pmdev->page] =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case PMBUS_MFR_LOCATION: /* R/W 64 */
+        s->mfr_location =3D pmbus_receive64(pmdev);
+        break;
+
+    case PMBUS_MFR_DATE: /* R/W 64 */
+        s->mfr_date =3D pmbus_receive64(pmdev);
+        break;
+
+    case PMBUS_MFR_SERIAL: /* R/W 64 */
+        s->mfr_serial =3D pmbus_receive64(pmdev);
+        break;
+
+    case MAX34451_MFR_MODE: /* R/W word */
+         s->mfr_mode =3D pmbus_receive16(pmdev);
+        break;
+
+    case MAX34451_MFR_PSEN_CONFIG: /* R/W 32 */
+        if (pmdev->page < 12) {
+            s->psen_config[pmdev->page] =3D pmbus_receive32(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_VOUT_PEAK: /* R/W word */
+        if (pmdev->page < 16) {
+            s->vout_peak[pmdev->page] =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_IOUT_PEAK: /* R/W word */
+        if (pmdev->page < 16) {
+            s->iout_peak[pmdev->page] =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_TEMPERATURE_PEAK: /* R/W word */
+        if (15 < pmdev->page && pmdev->page < 21) {
+            s->temperature_peak[pmdev->page % 16]
+                =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_VOUT_MIN: /* R/W word */
+        if (pmdev->page < 16) {
+            s->vout_min[pmdev->page] =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_NV_LOG_CONFIG: /* R/W word */
+         s->nv_log_config =3D pmbus_receive16(pmdev);
+        break;
+
+    case MAX34451_MFR_FAULT_RESPONSE: /* R/W 32 */
+        if (pmdev->page < 16) {
+            s->fault_response[pmdev->page] =3D pmbus_receive32(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_FAULT_RETRY: /* R/W word */
+        s->fault_retry =3D pmbus_receive16(pmdev);
+        break;
+
+    case MAX34451_MFR_TIME_COUNT: /* R/W 32 */
+        s->time_count =3D pmbus_receive32(pmdev);
+        break;
+
+    case MAX34451_MFR_MARGIN_CONFIG: /* R/W word */
+        if (pmdev->page < 12) {
+            s->margin_config[pmdev->page] =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_CHANNEL_CONFIG: /* R/W word */
+        if (pmdev->page < 16) {
+            s->channel_config[pmdev->page] =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_TON_SEQ_MAX: /* R/W word */
+        if (pmdev->page < 12) {
+            s->ton_seq_max[pmdev->page] =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_PWM_CONFIG: /* R/W 32 */
+        if (pmdev->page < 12) {
+            s->pwm_config[pmdev->page] =3D pmbus_receive32(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_SEQ_CONFIG:  /* R/W 32 */
+        if (pmdev->page < 12) {
+            s->seq_config[pmdev->page] =3D pmbus_receive32(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_TEMP_SENSOR_CONFIG:  /* R/W word */
+        if (15 < pmdev->page && pmdev->page < 21) {
+            s->temp_sensor_config[pmdev->page % 16]
+                =3D pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX34451_MFR_CRC: /* R/W word */
+        s->crc =3D pmbus_receive16(pmdev);
+        break;
+
+    case MAX34451_MFR_NV_FAULT_LOG:
+    case MAX34451_MFR_FW_SERIAL:
+    case MAX34451_MFR_IOUT_AVG:
+        /* Read only commands */
+        pmdev->pages[index].status_word |=3D PMBUS_STATUS_CML;
+        pmdev->pages[index].status_cml |=3D PB_CML_FAULT_INVALID_DATA;
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: writing to read-only register 0x%02x\n",
+                      __func__, pmdev->code);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: writing to unsupported register: 0x%02x\n",
+                      __func__, pmdev->code);
+        break;
+    }
+
+    return 0;
+}
+
+static void max34451_get(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    visit_type_uint16(v, name, (uint16_t *)opaque, errp);
+}
+
+static void max34451_set(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    MAX34451State *s =3D MAX34451(obj);
+    uint16_t *internal =3D opaque;
+    uint16_t value;
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    *internal =3D value;
+    max34451_check_limits(s);
+}
+
+/* used to init uint16_t arrays */
+static inline void *memset_word(void *s, uint16_t c, size_t n)
+{
+    size_t i;
+    uint16_t *p =3D s;
+
+    for (i =3D 0; i < n; i++) {
+        p[i] =3D c;
+    }
+
+    return s;
+}
+
+static void max34451_exit_reset(Object *obj)
+{
+    PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);
+    MAX34451State *s =3D MAX34451(obj);
+    pmdev->capability =3D DEFAULT_CAPABILITY;
+
+    for (int i =3D 0; i < MAX34451_NUM_PAGES; i++) {
+        pmdev->pages[i].operation =3D DEFAULT_OP_ON;
+        pmdev->pages[i].on_off_config =3D DEFAULT_ON_OFF_CONFIG;
+        pmdev->pages[i].revision =3D 0x11;
+        pmdev->pages[i].vout_mode =3D DEFAULT_VOUT_MODE;
+    }
+
+    for (int i =3D 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
+        pmdev->pages[i].vout_scale_monitor =3D DEFAULT_SCALE;
+        pmdev->pages[i].vout_ov_fault_limit =3D DEFAULT_OV_LIMIT;
+        pmdev->pages[i].vout_ov_warn_limit =3D DEFAULT_OV_LIMIT;
+        pmdev->pages[i].iout_oc_warn_limit =3D DEFAULT_OC_LIMIT;
+        pmdev->pages[i].iout_oc_fault_limit =3D DEFAULT_OC_LIMIT;
+    }
+
+    for (int i =3D 0; i < MAX34451_NUM_MARGINED_PSU; i++) {
+        pmdev->pages[i].ton_max_fault_limit =3D DEFAULT_TON_FAULT_LIMIT;
+    }
+
+    for (int i =3D 16; i < MAX34451_NUM_TEMP_DEVICES + 16; i++) {
+        pmdev->pages[i].read_temperature_1 =3D DEFAULT_TEMPERATURE;
+        pmdev->pages[i].ot_warn_limit =3D DEFAULT_OT_LIMIT;
+        pmdev->pages[i].ot_fault_limit =3D DEFAULT_OT_LIMIT;
+    }
+
+    memset_word(s->ton_max_fault_limit, DEFAULT_TON_FAULT_LIMIT,
+                MAX34451_NUM_MARGINED_PSU);
+    memset_word(s->channel_config, DEFAULT_CHANNEL_CONFIG,
+                MAX34451_NUM_PWR_DEVICES);
+    memset_word(s->vout_min, DEFAULT_VMIN, MAX34451_NUM_PWR_DEVICES);
+
+    s->mfr_location =3D DEFAULT_TEXT;
+    s->mfr_date =3D DEFAULT_TEXT;
+    s->mfr_serial =3D DEFAULT_TEXT;
+}
+
+static const VMStateDescription vmstate_max34451 =3D {
+    .name =3D TYPE_MAX34451,
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]){
+        VMSTATE_PMBUS_DEVICE(parent, MAX34451State),
+        VMSTATE_UINT16_ARRAY(power_good_on, MAX34451State,
+                             MAX34451_NUM_PWR_DEVICES),
+        VMSTATE_UINT16_ARRAY(power_good_off, MAX34451State,
+                             MAX34451_NUM_PWR_DEVICES),
+        VMSTATE_UINT16_ARRAY(ton_delay, MAX34451State,
+                             MAX34451_NUM_MARGINED_PSU),
+        VMSTATE_UINT16_ARRAY(ton_max_fault_limit, MAX34451State,
+                             MAX34451_NUM_MARGINED_PSU),
+        VMSTATE_UINT16_ARRAY(toff_delay, MAX34451State,
+                             MAX34451_NUM_MARGINED_PSU),
+        VMSTATE_UINT8_ARRAY(status_mfr_specific, MAX34451State,
+                             MAX34451_NUM_PWR_DEVICES),
+        VMSTATE_UINT64(mfr_location, MAX34451State),
+        VMSTATE_UINT64(mfr_date, MAX34451State),
+        VMSTATE_UINT64(mfr_serial, MAX34451State),
+        VMSTATE_UINT16(mfr_mode, MAX34451State),
+        VMSTATE_UINT32_ARRAY(psen_config, MAX34451State,
+                             MAX34451_NUM_MARGINED_PSU),
+        VMSTATE_UINT16_ARRAY(vout_peak, MAX34451State,
+                             MAX34451_NUM_PWR_DEVICES),
+        VMSTATE_UINT16_ARRAY(iout_peak, MAX34451State,
+                             MAX34451_NUM_PWR_DEVICES),
+        VMSTATE_UINT16_ARRAY(temperature_peak, MAX34451State,
+                             MAX34451_NUM_TEMP_DEVICES),
+        VMSTATE_UINT16_ARRAY(vout_min, MAX34451State, MAX34451_NUM_PWR_DEV=
ICES),
+        VMSTATE_UINT16(nv_log_config, MAX34451State),
+        VMSTATE_UINT32_ARRAY(fault_response, MAX34451State,
+                             MAX34451_NUM_PWR_DEVICES),
+        VMSTATE_UINT16(fault_retry, MAX34451State),
+        VMSTATE_UINT32(fault_log, MAX34451State),
+        VMSTATE_UINT32(time_count, MAX34451State),
+        VMSTATE_UINT16_ARRAY(margin_config, MAX34451State,
+                             MAX34451_NUM_MARGINED_PSU),
+        VMSTATE_UINT16(fw_serial, MAX34451State),
+        VMSTATE_UINT16_ARRAY(iout_avg, MAX34451State, MAX34451_NUM_PWR_DEV=
ICES),
+        VMSTATE_UINT16_ARRAY(channel_config, MAX34451State,
+                             MAX34451_NUM_PWR_DEVICES),
+        VMSTATE_UINT16_ARRAY(ton_seq_max, MAX34451State,
+                             MAX34451_NUM_MARGINED_PSU),
+        VMSTATE_UINT32_ARRAY(pwm_config, MAX34451State,
+                             MAX34451_NUM_MARGINED_PSU),
+        VMSTATE_UINT32_ARRAY(seq_config, MAX34451State,
+                             MAX34451_NUM_MARGINED_PSU),
+        VMSTATE_UINT16_ARRAY(temp_sensor_config, MAX34451State,
+                             MAX34451_NUM_TEMP_DEVICES),
+        VMSTATE_UINT16(store_single, MAX34451State),
+        VMSTATE_UINT16(crc, MAX34451State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void max34451_init(Object *obj)
+{
+    PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);
+    uint64_t psu_flags =3D PB_HAS_VOUT | PB_HAS_IOUT | PB_HAS_VOUT_MODE |
+                         PB_HAS_IOUT_GAIN;
+
+    for (int i =3D 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
+        pmbus_page_config(pmdev, i, psu_flags);
+    }
+
+    for (int i =3D 0; i < MAX34451_NUM_MARGINED_PSU; i++) {
+        pmbus_page_config(pmdev, i, psu_flags | PB_HAS_VOUT_MARGIN);
+    }
+
+    for (int i =3D 16; i < MAX34451_NUM_TEMP_DEVICES + 16; i++) {
+        pmbus_page_config(pmdev, i, PB_HAS_TEMPERATURE | PB_HAS_VOUT_MODE)=
;
+    }
+
+    /* get and set the voltage in millivolts, max is 32767 mV */
+    for (int i =3D 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
+        object_property_add(obj, "vout[*]", "uint16",
+                            max34451_get,
+                            max34451_set, NULL, &pmdev->pages[i].read_vout=
);
+    }
+
+    /*
+     * get and set the temperature of the internal temperature sensor in
+     * centidegrees Celcius i.e.: 2500 -> 25.00 C, max is 327.67 C
+     */
+    for (int i =3D 0; i < MAX34451_NUM_TEMP_DEVICES; i++) {
+        object_property_add(obj, "temperature[*]", "uint16",
+                            max34451_get,
+                            max34451_set,
+                            NULL,
+                            &pmdev->pages[i + 16].read_temperature_1);
+    }
+
+}
+
+static void max34451_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    PMBusDeviceClass *k =3D PMBUS_DEVICE_CLASS(klass);
+    dc->desc =3D "Maxim MAX34451 16-Channel V/I monitor";
+    dc->vmsd =3D &vmstate_max34451;
+    k->write_data =3D max34451_write_data;
+    k->receive_byte =3D max34451_read_byte;
+    k->device_num_pages =3D MAX34451_NUM_PAGES;
+    rc->phases.exit =3D max34451_exit_reset;
+}
+
+static const TypeInfo max34451_info =3D {
+    .name =3D TYPE_MAX34451,
+    .parent =3D TYPE_PMBUS_DEVICE,
+    .instance_size =3D sizeof(MAX34451State),
+    .instance_init =3D max34451_init,
+    .class_init =3D max34451_class_init,
+};
+
+static void max34451_register_types(void)
+{
+    type_register_static(&max34451_info);
+}
+
+type_init(max34451_register_types)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e141084a79..d689941f64 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -374,6 +374,7 @@ config NPCM7XX
     select ADM1272
     select ARM_GIC
     select AT24C  # EEPROM
+    select MAX34451
     select PL310  # cache controller
     select PMBUS
     select SERIAL
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 0774c1f70c..1747667984 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -30,6 +30,10 @@ config EMC141X
     bool
     depends on I2C
=20
+config MAX34451
+    bool
+    depends on I2C
+
 config ISA_DEBUG
     bool
     depends on ISA_BUS
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 8666e9225a..b62919e1fe 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -11,6 +11,7 @@ softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp=
105.c'))
 softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
 softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
+softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
 softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
--=20
2.32.0.93.g670b81a890-goog


