Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23C374357
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:12:49 +0200 (CEST)
Received: from localhost ([::1]:33008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leL4q-0000Kt-JA
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Vs-SYAYKCks6v6754t11tyr.p1z3rz7-qr8ry010t07.14t@flex--titusr.bounces.google.com>)
 id 1leKtr-000694-4l
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:27 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:50930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Vs-SYAYKCks6v6754t11tyr.p1z3rz7-qr8ry010t07.14t@flex--titusr.bounces.google.com>)
 id 1leKtg-0002OQ-OG
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:26 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 o12-20020a5b050c0000b02904f4a117bd74so2971026ybp.17
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=F309V6c6dXwlfpiDKe23lYI7DoGepdEZZkf7t9tNlXc=;
 b=E4Q/Hd0w+iWizfUKdg4zvnIqXxspEe87gvvi0zMBTZvXWtf9t447opn34lNGsh3Tb0
 GRlFTTcMg7l5h2TaVl/vb4AXAxyJ83njkdD6zmbVAkdfuQw2PTSjxFuqi8bnWOoLsa3o
 lsRw+cM2D5h5n6ieICyEoal0JnZ+E9JpMM+CdPDJF2TfSrpXvV/28F2lgxknWfxQhUA0
 QTgbi4bKOgQ1RzdnBaaZC3FeKXltYWvPZm74ErzDSSzwMPXiFrOLYL6SdA8UJe0yaeMc
 320mmuiCwBk60qz5XYCjrQ/Sseq3GMMfVGHC/3eR9mvQfh0K1ZLF7IcpPh8KZu18nFNQ
 eVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=F309V6c6dXwlfpiDKe23lYI7DoGepdEZZkf7t9tNlXc=;
 b=qR/AIVFxGrcc9QFCpg5UtSerxHIRmdIf83Ed/Oiahm2SPFcVJvbVFDT/6EDqaZ/EXT
 aptho7y9Fmwal98WOn6thZd4OgswFTw1H8AbtEcxBu86oJP3TxAeAwq8ja4VR7e3HsXv
 MR8zt8c0gkCGxLrsB5FMm4PSpYuCblI7dJXx9ojMQJYRk+/MV/inhLQh0sarnnOKyuDh
 qNjxq7Sjs7GQHMKmstkMw79mRCg7K7RCyEDbu+05fDZZYaU4wznISJdaJAR8CL8Ku48K
 pwQDD0qicq+LH4rKa3Fdx2nkRWcoiqeaKb4OWT+nqH1A2KvMVM158rbSk3DYO5UHkme6
 uZHw==
X-Gm-Message-State: AOAM533Xg7JB8MWC7cL6AK17WSKupyQufFqQ/Ytf/R+B/enpNRupOflC
 SBtrE58mD7ZjmV2GhBK0KT+2FtqcMbM=
X-Google-Smtp-Source: ABdhPJxjr1mhR3a1L6Cdfu+D00nvbYk3GqDNZ5lfQ7gCae0MnFMFfHiLf7yR7XU/kXoTz1FT5YGmio4DxkY=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:aa52:9f3f:7187:bafc])
 (user=titusr job=sendgmr) by 2002:a25:8088:: with SMTP id
 n8mr39226071ybk.140.1620234070773; 
 Wed, 05 May 2021 10:01:10 -0700 (PDT)
Date: Wed,  5 May 2021 10:00:56 -0700
Message-Id: <20210505170101.3297395-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [PATCH v2 0/5] Add support for PMBus in QEMU
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3Vs-SYAYKCks6v6754t11tyr.p1z3rz7-qr8ry010t07.14t@flex--titusr.bounces.google.com;
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

Hello,

This patch series adds an interface to start supporting PMBus devices in QE=
MU.
I=E2=80=99ve included two PMBus devices: MAX34451 and ADM1272.

PMBus is a variant of SMBus meant for digital management of power supplies.
PMBus adds to the SMBus standard by defining a number of constants and comm=
ands
used by compliant devices. The specification for PMBus can be found at:

https://pmbus.org/specification-archives/

Currently, the goal for these devices is to emulate basic functionality by
reading and writing registers. Timing, and some logical operation is not
implemented. This implementation supports nearly all available registers fo=
r
PMBus including:
   - Voltage inputs and outputs
   - Current inputs and outputs
   - Temperature sensors

Unimplimented registers get passed through to the device model, and device
models can opt out of using the standard registers with flags. The included
devices make use of these fields and illustrate how to interface with the p=
mbus
class.

Datasheets for sensors:

https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
https://www.analog.com/media/en/technical-documentation/data-sheets/ADM1272=
.pdf

Since v1:
- addressed Joel's comments
- split out tests into their own patches

Thanks for reviewing,

Titus Rwantare

Titus Rwantare (5):
  hw/i2c: add support for PMBus
  hw/misc: add ADM1272 device
  tests/qtest: add tests for ADM1272 device model
  hw/misc: add MAX34451 device
  tests/qtest: add tests for MAX34451 device model

 include/hw/i2c/pmbus_device.h |  506 +++++++++++
 hw/i2c/pmbus_device.c         | 1596 +++++++++++++++++++++++++++++++++
 hw/misc/adm1272.c             |  543 +++++++++++
 hw/misc/max34451.c            |  719 +++++++++++++++
 tests/qtest/adm1272-test.c    |  445 +++++++++
 tests/qtest/max34451-test.c   |  336 +++++++
 hw/arm/Kconfig                |    3 +
 hw/i2c/Kconfig                |    4 +
 hw/i2c/meson.build            |    1 +
 hw/misc/Kconfig               |    8 +
 hw/misc/meson.build           |    2 +
 tests/qtest/meson.build       |    2 +
 12 files changed, 4165 insertions(+)
 create mode 100644 include/hw/i2c/pmbus_device.h
 create mode 100644 hw/i2c/pmbus_device.c
 create mode 100644 hw/misc/adm1272.c
 create mode 100644 hw/misc/max34451.c
 create mode 100644 tests/qtest/adm1272-test.c
 create mode 100644 tests/qtest/max34451-test.c

Range-diff against v1:
1:  b584203d74 ! 1:  cac7aa27ec hw/i2c: add support for PMBus
    @@ include/hw/i2c/pmbus_device.h (new)
     + *
     + * Copyright 2021 Google LLC
     + *
    -+ * This program is free software; you can redistribute it and/or modi=
fy it
    -+ * under the terms of the GNU General Public License as published by =
the
    -+ * Free Software Foundation; either version 2 of the License, or
    -+ * (at your option) any later version.
    -+ *
    -+ * This program is distributed in the hope that it will be useful, bu=
t WITHOUT
    -+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or
    -+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se
    -+ * for more details.
    ++ * SPDX-License-Identifier: GPL-2.0-or-later
     + */
     +
     +#ifndef HW_PMBUS_DEVICE_H
    @@ include/hw/i2c/pmbus_device.h (new)
     +    uint8_t out_buf[SMBUS_DATA_MAX_LEN];
     +};
     +
    -+typedef struct PMBusBlock {
    -+    uint8_t *buf;
    -+    uint8_t len;
    -+} PMBusBlock;
    -+
     +/**
     + * Direct mode coefficients
     + * @var m - mantissa
    @@ include/hw/i2c/pmbus_device.h (new)
     + * Assumes that the bytes in the block are already ordered correctly,
     + * also assumes the length has been prepended to the block if necessa=
ry
     + *     | low_byte | ... | high_byte |
    -+ * @param pmdev - maintains state of the PMBus device
    ++ * @param state - maintains state of the PMBus device
     + * @param data - byte array to be sent by device
     + * @param len - number
     + */
    -+void pmbus_send_block(PMBusDevice *state, PMBusBlock block);
    ++void pmbus_send(PMBusDevice *state, const uint8_t *data, uint16_t len=
);
     +void pmbus_send8(PMBusDevice *state, uint8_t data);
     +void pmbus_send16(PMBusDevice *state, uint16_t data);
     +void pmbus_send32(PMBusDevice *state, uint32_t data);
    @@ include/hw/i2c/pmbus_device.h (new)
     +uint16_t pmbus_receive16(PMBusDevice *pmdev);
     +uint32_t pmbus_receive32(PMBusDevice *pmdev);
     +uint64_t pmbus_receive64(PMBusDevice *pmdev);
    -+PMBusBlock pmbus_receive_block(PMBusDevice *pmdev);
     +
     +/**
     + * PMBus page config must be called before any page is first used.
    @@ hw/i2c/pmbus_device.c (new)
     + *
     + * Copyright 2021 Google LLC
     + *
    -+ * This program is free software; you can redistribute it and/or modi=
fy it
    -+ * under the terms of the GNU General Public License as published by =
the
    -+ * Free Software Foundation; either version 2 of the License, or
    -+ * (at your option) any later version.
    -+ *
    -+ * This program is distributed in the hope that it will be useful, bu=
t WITHOUT
    -+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or
    -+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se
    -+ * for more details.
    ++ * SPDX-License-Identifier: GPL-2.0-or-later
     + */
    ++
     +#include "qemu/osdep.h"
     +#include <math.h>
     +#include <string.h>
    @@ hw/i2c/pmbus_device.c (new)
     +    return x;
     +}
     +
    -+static void pmbus_send(PMBusDevice *pmdev, const uint8_t *data, uint1=
6_t len)
    ++void pmbus_send(PMBusDevice *pmdev, const uint8_t *data, uint16_t len=
)
     +{
     +    if (pmdev->out_buf_len + len > SMBUS_DATA_MAX_LEN) {
     +        qemu_log_mask(LOG_GUEST_ERROR,
    @@ hw/i2c/pmbus_device.c (new)
     +static void pmbus_send_uint(PMBusDevice *pmdev, uint64_t data, uint8_=
t size)
     +{
     +    uint8_t bytes[8];
    ++    g_assert(size <=3D 8);
    ++
     +    for (int i =3D 0; i < size; i++) {
     +        bytes[i] =3D data & 0xFF;
     +        data =3D data >> 8;
    @@ hw/i2c/pmbus_device.c (new)
     +    pmbus_send(pmdev, bytes, size);
     +}
     +
    -+void pmbus_send_block(PMBusDevice *pmdev, PMBusBlock block)
    -+{
    -+    pmbus_send(pmdev, block.buf, block.len);
    -+}
    -+
     +void pmbus_send8(PMBusDevice *pmdev, uint8_t data)
     +{
     +    pmbus_send_uint(pmdev, data, 1);
    @@ hw/i2c/pmbus_device.c (new)
     +void pmbus_send_string(PMBusDevice *pmdev, const char *data)
     +{
     +    size_t len =3D strlen(data);
    ++    g_assert(len > 0);
     +    g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
     +    pmdev->out_buf[len + pmdev->out_buf_len] =3D len;
     +
    @@ hw/i2c/pmbus_device.c (new)
     +                      "%s: length mismatch. Expected 1 byte, got %d b=
ytes\n",
     +                      __func__, pmdev->in_buf_len - 1);
     +    }
    -+    return (uint8_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_=
len);
    ++    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
     +}
     +
     +uint16_t pmbus_receive16(PMBusDevice *pmdev)
    @@ hw/i2c/pmbus_device.c (new)
     +                      "%s: length mismatch. Expected 2 bytes, got %d =
bytes\n",
     +                      __func__, pmdev->in_buf_len - 1);
     +    }
    -+    return (uint16_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf=
_len);
    ++    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
     +}
     +
     +uint32_t pmbus_receive32(PMBusDevice *pmdev)
    @@ hw/i2c/pmbus_device.c (new)
     +                      "%s: length mismatch. Expected 4 bytes, got %d =
bytes\n",
     +                      __func__, pmdev->in_buf_len - 1);
     +    }
    -+    return (uint32_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf=
_len);
    ++    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
     +}
     +
     +uint64_t pmbus_receive64(PMBusDevice *pmdev)
    @@ hw/i2c/pmbus_device.c (new)
     +                      "%s: length mismatch. Expected 8 bytes, got %d =
bytes\n",
     +                      __func__, pmdev->in_buf_len - 1);
     +    }
    -+    return (uint64_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf=
_len);
    -+}
    -+
    -+PMBusBlock pmbus_receive_block(PMBusDevice *pmdev)
    -+{
    -+    PMBusBlock data =3D { pmdev->in_buf, pmdev->in_buf_len };
    -+    return data;
    ++    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
     +}
     +
     +static uint8_t pmbus_out_buf_pop(PMBusDevice *pmdev)
2:  33b0608a8c ! 2:  a130a338b4 hw/misc: add ADM1272 device
    @@ hw/misc/adm1272.c (new)
     + *
     + * Copyright 2021 Google LLC
     + *
    -+ * This program is free software; you can redistribute it and/or modi=
fy it
    -+ * under the terms of the GNU General Public License as published by =
the
    -+ * Free Software Foundation; either version 2 of the License, or
    -+ * (at your option) any later version.
    -+ *
    -+ * This program is distributed in the hope that it will be useful, bu=
t WITHOUT
    -+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or
    -+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se
    -+ * for more details.
    ++ * SPDX-License-Identifier: GPL-2.0-or-later
     + */
     +
     +#include "qemu/osdep.h"
    @@ hw/misc/adm1272.c (new)
     +
     +type_init(adm1272_register_types)
    =20
    - ## tests/qtest/adm1272-test.c (new) ##
    -@@
    -+/*
    -+ * QTests for the ADM1272 hotswap controller
    -+ *
    -+ * Copyright 2021 Google LLC
    -+ *
    -+ * This program is free software; you can redistribute it and/or modi=
fy it
    -+ * under the terms of the GNU General Public License as published by =
the
    -+ * Free Software Foundation; either version 2 of the License, or
    -+ * (at your option) any later version.
    -+ *
    -+ * This program is distributed in the hope that it will be useful, bu=
t WITHOUT
    -+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or
    -+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se
    -+ * for more details.
    -+ */
    -+
    -+#include "qemu/osdep.h"
    -+#include <math.h>
    -+#include "hw/i2c/pmbus_device.h"
    -+#include "libqtest-single.h"
    -+#include "libqos/qgraph.h"
    -+#include "libqos/i2c.h"
    -+#include "qapi/qmp/qdict.h"
    -+#include "qapi/qmp/qnum.h"
    -+#include "qemu/bitops.h"
    -+
    -+#define TEST_ID "adm1272-test"
    -+#define TEST_ADDR (0x10)
    -+
    -+#define ADM1272_RESTART_TIME            0xCC
    -+#define ADM1272_MFR_PEAK_IOUT           0xD0
    -+#define ADM1272_MFR_PEAK_VIN            0xD1
    -+#define ADM1272_MFR_PEAK_VOUT           0xD2
    -+#define ADM1272_MFR_PMON_CONTROL        0xD3
    -+#define ADM1272_MFR_PMON_CONFIG         0xD4
    -+#define ADM1272_MFR_ALERT1_CONFIG       0xD5
    -+#define ADM1272_MFR_ALERT2_CONFIG       0xD6
    -+#define ADM1272_MFR_PEAK_TEMPERATURE    0xD7
    -+#define ADM1272_MFR_DEVICE_CONFIG       0xD8
    -+#define ADM1272_MFR_POWER_CYCLE         0xD9
    -+#define ADM1272_MFR_PEAK_PIN            0xDA
    -+#define ADM1272_MFR_READ_PIN_EXT        0xDB
    -+#define ADM1272_MFR_READ_EIN_EXT        0xDC
    -+
    -+#define ADM1272_HYSTERESIS_LOW          0xF2
    -+#define ADM1272_HYSTERESIS_HIGH         0xF3
    -+#define ADM1272_STATUS_HYSTERESIS       0xF4
    -+#define ADM1272_STATUS_GPIO             0xF5
    -+#define ADM1272_STRT_UP_IOUT_LIM        0xF6
    -+
    -+/* Defaults */
    -+#define ADM1272_OPERATION_DEFAULT       0x80
    -+#define ADM1272_CAPABILITY_DEFAULT      0xB0
    -+#define ADM1272_CAPABILITY_NO_PEC       0x30
    -+#define ADM1272_DIRECT_MODE             0x40
    -+#define ADM1272_HIGH_LIMIT_DEFAULT      0x0FFF
    -+#define ADM1272_PIN_OP_DEFAULT          0x7FFF
    -+#define ADM1272_PMBUS_REVISION_DEFAULT  0x22
    -+#define ADM1272_MFR_ID_DEFAULT          "ADI"
    -+#define ADM1272_MODEL_DEFAULT           "ADM1272-A1"
    -+#define ADM1272_MFR_DEFAULT_REVISION    "25"
    -+#define ADM1272_DEFAULT_DATE            "160301"
    -+#define ADM1272_RESTART_TIME_DEFAULT    0x64
    -+#define ADM1272_PMON_CONTROL_DEFAULT    0x1
    -+#define ADM1272_PMON_CONFIG_DEFAULT     0x3F35
    -+#define ADM1272_DEVICE_CONFIG_DEFAULT   0x8
    -+#define ADM1272_HYSTERESIS_HIGH_DEFAULT     0xFFFF
    -+#define ADM1272_STRT_UP_IOUT_LIM_DEFAULT    0x000F
    -+#define ADM1272_VOLT_DEFAULT            12000
    -+#define ADM1272_IOUT_DEFAULT            25000
    -+#define ADM1272_PWR_DEFAULT             300  /* 12V 25A */
    -+#define ADM1272_SHUNT                   300 /* micro-ohms */
    -+#define ADM1272_VOLTAGE_COEFF_DEFAULT   1
    -+#define ADM1272_CURRENT_COEFF_DEFAULT   3
    -+#define ADM1272_PWR_COEFF_DEFAULT       7
    -+#define ADM1272_IOUT_OFFSET             0x5000
    -+#define ADM1272_IOUT_OFFSET             0x5000
    -+
    -+static const PMBusCoefficients adm1272_coefficients[] =3D {
    -+    [0] =3D { 6770, 0, -2 },       /* voltage, vrange 60V */
    -+    [1] =3D { 4062, 0, -2 },       /* voltage, vrange 100V */
    -+    [2] =3D { 1326, 20480, -1 },   /* current, vsense range 15mV */
    -+    [3] =3D { 663, 20480, -1 },    /* current, vsense range 30mV */
    -+    [4] =3D { 3512, 0, -2 },       /* power, vrange 60V, irange 15mV =
*/
    -+    [5] =3D { 21071, 0, -3 },      /* power, vrange 100V, irange 15mV=
 */
    -+    [6] =3D { 17561, 0, -3 },      /* power, vrange 60V, irange 30mV =
*/
    -+    [7] =3D { 10535, 0, -3 },      /* power, vrange 100V, irange 30mV=
 */
    -+    [8] =3D { 42, 31871, -1 },     /* temperature */
    -+};
    -+
    -+uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value)
    -+{
    -+    /* R is usually negative to fit large readings into 16 bits */
    -+    uint16_t y =3D (c.m * value + c.b) * pow(10, c.R);
    -+    return y;
    -+}
    -+
    -+uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value)
    -+{
    -+    /* X =3D (Y * 10^-R - b) / m */
    -+    uint32_t x =3D (value / pow(10, c.R) - c.b) / c.m;
    -+    return x;
    -+}
    -+
    -+
    -+static uint16_t adm1272_millivolts_to_direct(uint32_t value)
    -+{
    -+    PMBusCoefficients c =3D adm1272_coefficients[ADM1272_VOLTAGE_COEF=
F_DEFAULT];
    -+    c.b =3D c.b * 1000;
    -+    c.R =3D c.R - 3;
    -+    return pmbus_data2direct_mode(c, value);
    -+}
    -+
    -+static uint32_t adm1272_direct_to_millivolts(uint16_t value)
    -+{
    -+    PMBusCoefficients c =3D adm1272_coefficients[ADM1272_VOLTAGE_COEF=
F_DEFAULT];
    -+    c.b =3D c.b * 1000;
    -+    c.R =3D c.R - 3;
    -+    return pmbus_direct_mode2data(c, value);
    -+}
    -+
    -+static uint16_t adm1272_milliamps_to_direct(uint32_t value)
    -+{
    -+    PMBusCoefficients c =3D adm1272_coefficients[ADM1272_CURRENT_COEF=
F_DEFAULT];
    -+    /* Y =3D (m * r_sense * x - b) * 10^R */
    -+    c.m =3D c.m * ADM1272_SHUNT / 1000; /* micro-ohms */
    -+    c.b =3D c.b * 1000;
    -+    c.R =3D c.R - 3;
    -+    return pmbus_data2direct_mode(c, value);
    -+}
    -+
    -+static uint32_t adm1272_direct_to_milliamps(uint16_t value)
    -+{
    -+    PMBusCoefficients c =3D adm1272_coefficients[ADM1272_CURRENT_COEF=
F_DEFAULT];
    -+    c.m =3D c.m * ADM1272_SHUNT / 1000;
    -+    c.b =3D c.b * 1000;
    -+    c.R =3D c.R - 3;
    -+    return pmbus_direct_mode2data(c, value);
    -+}
    -+
    -+static uint16_t adm1272_watts_to_direct(uint32_t value)
    -+{
    -+    PMBusCoefficients c =3D adm1272_coefficients[ADM1272_PWR_COEFF_DE=
FAULT];
    -+    c.m =3D c.m * ADM1272_SHUNT / 1000;
    -+    return pmbus_data2direct_mode(c, value);
    -+}
    -+
    -+static uint32_t adm1272_direct_to_watts(uint16_t value)
    -+{
    -+    PMBusCoefficients c =3D adm1272_coefficients[ADM1272_PWR_COEFF_DE=
FAULT];
    -+    c.m =3D c.m * ADM1272_SHUNT / 1000;
    -+    return pmbus_direct_mode2data(c, value);
    -+}
    -+
    -+static uint16_t qmp_adm1272_get(const char *id, const char *property)
    -+{
    -+    QDict *response;
    -+    uint64_t ret;
    -+
    -+    response =3D qmp("{ 'execute': 'qom-get', 'arguments': { 'path': =
%s, "
    -+                   "'property': %s } }", id, property);
    -+    g_assert(qdict_haskey(response, "return"));
    -+    ret =3D qnum_get_uint(qobject_to(QNum, qdict_get(response, "retur=
n")));
    -+    qobject_unref(response);
    -+    return ret;
    -+}
    -+
    -+static void qmp_adm1272_set(const char *id,
    -+                            const char *property,
    -+                            uint16_t value)
    -+{
    -+    QDict *response;
    -+
    -+    response =3D qmp("{ 'execute': 'qom-set', 'arguments': { 'path': =
%s, "
    -+                   "'property': %s, 'value': %u } }", id, property, v=
alue);
    -+    g_assert(qdict_haskey(response, "return"));
    -+    qobject_unref(response);
    -+}
    -+
    -+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is bi=
g endian */
    -+static uint16_t adm1272_i2c_get16(QI2CDevice *i2cdev, uint8_t reg)
    -+{
    -+    uint8_t resp[2];
    -+    i2c_read_block(i2cdev, reg, resp, sizeof(resp));
    -+    return (resp[1] << 8) | resp[0];
    -+}
    -+
    -+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is bi=
g endian */
    -+static void adm1272_i2c_set16(QI2CDevice *i2cdev, uint8_t reg, uint16=
_t value)
    -+{
    -+    uint8_t data[2];
    -+
    -+    data[0] =3D value & 255;
    -+    data[1] =3D value >> 8;
    -+    i2c_write_block(i2cdev, reg, data, sizeof(data));
    -+}
    -+
    -+static void test_defaults(void *obj, void *data, QGuestAllocator *all=
oc)
    -+{
    -+    uint16_t value, i2c_value;
    -+    int16_t err;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+    value =3D qmp_adm1272_get(TEST_ID, "vout");
    -+    err =3D ADM1272_VOLT_DEFAULT - value;
    -+    g_assert_cmpuint(abs(err), <, ADM1272_VOLT_DEFAULT / 20);
    -+
    -+    i2c_value =3D i2c_get8(i2cdev, PMBUS_OPERATION);
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_OPERATION_DEFAULT);
    -+
    -+    i2c_value =3D i2c_get8(i2cdev, PMBUS_VOUT_MODE);
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_DIRECT_MODE);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT)=
;
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_HIGH_LIMIT_DEFAULT);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT)=
;
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_IOUT_OC_WARN_LIMIT)=
;
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_HIGH_LIMIT_DEFAULT);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_HIGH_LIMIT_DEFAULT);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_HIGH_LIMIT_DEFAULT);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_HIGH_LIMIT_DEFAULT);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_PIN_OP_WARN_LIMIT);
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_PIN_OP_DEFAULT);
    -+
    -+    i2c_value =3D i2c_get8(i2cdev, PMBUS_REVISION);
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_PMBUS_REVISION_DEFAULT=
);
    -+
    -+    i2c_value =3D i2c_get8(i2cdev, ADM1272_MFR_PMON_CONTROL);
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_PMON_CONTROL_DEFAULT);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, ADM1272_MFR_PMON_CONFIG);
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_PMON_CONFIG_DEFAULT);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, ADM1272_MFR_DEVICE_CONFIG=
);
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_DEVICE_CONFIG_DEFAULT)=
;
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, ADM1272_HYSTERESIS_HIGH);
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_HYSTERESIS_HIGH_DEFAUL=
T);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, ADM1272_STRT_UP_IOUT_LIM)=
;
    -+    g_assert_cmphex(i2c_value, =3D=3D, ADM1272_STRT_UP_IOUT_LIM_DEFAU=
LT);
    -+}
    -+
    -+/* test qmp access */
    -+static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
    -+{
    -+    uint16_t i2c_value, value, i2c_voltage, i2c_pwr, lossy_value;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+
    -+    /* converting to direct mode is lossy - we generate the same loss=
 here */
    -+    lossy_value =3D
    -+        adm1272_direct_to_millivolts(adm1272_millivolts_to_direct(100=
0));
    -+    qmp_adm1272_set(TEST_ID, "vin", 1000);
    -+    value =3D qmp_adm1272_get(TEST_ID, "vin");
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_VIN);
    -+    i2c_voltage =3D adm1272_direct_to_millivolts(i2c_value);
    -+    g_assert_cmpuint(value, =3D=3D, i2c_voltage);
    -+    g_assert_cmpuint(i2c_voltage, =3D=3D, lossy_value);
    -+
    -+    lossy_value =3D
    -+        adm1272_direct_to_millivolts(adm1272_millivolts_to_direct(150=
0));
    -+    qmp_adm1272_set(TEST_ID, "vout", 1500);
    -+    value =3D qmp_adm1272_get(TEST_ID, "vout");
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_VOUT);
    -+    i2c_voltage =3D adm1272_direct_to_millivolts(i2c_value);
    -+    g_assert_cmpuint(value, =3D=3D, i2c_voltage);
    -+    g_assert_cmpuint(i2c_voltage, =3D=3D, lossy_value);
    -+
    -+    lossy_value =3D
    -+        adm1272_direct_to_milliamps(adm1272_milliamps_to_direct(1600)=
);
    -+    qmp_adm1272_set(TEST_ID, "iout", 1600);
    -+    value =3D qmp_adm1272_get(TEST_ID, "iout");
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_IOUT);
    -+    i2c_value =3D adm1272_direct_to_milliamps(i2c_value);
    -+    g_assert_cmphex(value, =3D=3D, i2c_value);
    -+    g_assert_cmphex(i2c_value, =3D=3D, lossy_value);
    -+
    -+    lossy_value =3D
    -+        adm1272_direct_to_watts(adm1272_watts_to_direct(320));
    -+    qmp_adm1272_set(TEST_ID, "pin", 320);
    -+    value =3D qmp_adm1272_get(TEST_ID, "pin");
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_PIN);
    -+    i2c_pwr =3D adm1272_direct_to_watts(i2c_value);
    -+    g_assert_cmphex(value, =3D=3D, i2c_pwr);
    -+    g_assert_cmphex(i2c_pwr, =3D=3D, lossy_value);
    -+}
    -+
    -+/* test r/w registers */
    -+static void test_rw_regs(void *obj, void *data, QGuestAllocator *allo=
c)
    -+{
    -+    uint16_t i2c_value;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+
    -+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT, 0xABCD);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT)=
;
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0xABCD);
    -+
    -+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT, 0xCDEF);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT)=
;
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0xCDEF);
    -+
    -+    adm1272_i2c_set16(i2cdev, PMBUS_IOUT_OC_WARN_LIMIT, 0x1234);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_IOUT_OC_WARN_LIMIT)=
;
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0x1234);
    -+
    -+    adm1272_i2c_set16(i2cdev, PMBUS_OT_FAULT_LIMIT, 0x5678);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0x5678);
    -+
    -+    adm1272_i2c_set16(i2cdev, PMBUS_OT_WARN_LIMIT, 0xABDC);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0xABDC);
    -+
    -+    adm1272_i2c_set16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT, 0xCDEF);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0xCDEF);
    -+
    -+    adm1272_i2c_set16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT, 0x2345);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0x2345);
    -+
    -+    i2c_set8(i2cdev, ADM1272_RESTART_TIME, 0xF8);
    -+    i2c_value =3D i2c_get8(i2cdev, ADM1272_RESTART_TIME);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0xF8);
    -+
    -+    i2c_set8(i2cdev, ADM1272_MFR_PMON_CONTROL, 0);
    -+    i2c_value =3D i2c_get8(i2cdev, ADM1272_MFR_PMON_CONTROL);
    -+    g_assert_cmpuint(i2c_value, =3D=3D, 0);
    -+
    -+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_PMON_CONFIG, 0xDEF0);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, ADM1272_MFR_PMON_CONFIG);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0xDEF0);
    -+
    -+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_ALERT1_CONFIG, 0x0123);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, ADM1272_MFR_ALERT1_CONFIG=
);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0x0123);
    -+
    -+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_ALERT2_CONFIG, 0x9876);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, ADM1272_MFR_ALERT2_CONFIG=
);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0x9876);
    -+
    -+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_DEVICE_CONFIG, 0x3456);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, ADM1272_MFR_DEVICE_CONFIG=
);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0x3456);
    -+
    -+    adm1272_i2c_set16(i2cdev, ADM1272_HYSTERESIS_LOW, 0xCABA);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, ADM1272_HYSTERESIS_LOW);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0xCABA);
    -+
    -+    adm1272_i2c_set16(i2cdev, ADM1272_HYSTERESIS_HIGH, 0x6789);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, ADM1272_HYSTERESIS_HIGH);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0x6789);
    -+
    -+    adm1272_i2c_set16(i2cdev, ADM1272_STRT_UP_IOUT_LIM, 0x9876);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, ADM1272_STRT_UP_IOUT_LIM)=
;
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0x9876);
    -+
    -+    adm1272_i2c_set16(i2cdev, PMBUS_OPERATION, 0xA);
    -+    i2c_value =3D i2c_get8(i2cdev, PMBUS_OPERATION);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0xA);
    -+}
    -+
    -+/* test read-only registers */
    -+static void test_ro_regs(void *obj, void *data, QGuestAllocator *allo=
c)
    -+{
    -+    uint16_t i2c_init_value, i2c_value;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+
    -+    i2c_init_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_VIN);
    -+    adm1272_i2c_set16(i2cdev, PMBUS_READ_VIN, 0xBEEF);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_VIN);
    -+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
    -+
    -+    i2c_init_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_VOUT);
    -+    adm1272_i2c_set16(i2cdev, PMBUS_READ_VOUT, 0x1234);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_VOUT);
    -+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
    -+
    -+    i2c_init_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_IOUT);
    -+    adm1272_i2c_set16(i2cdev, PMBUS_READ_IOUT, 0x6547);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_IOUT);
    -+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
    -+
    -+    i2c_init_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_TEMPERATU=
RE_1);
    -+    adm1272_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_1, 0x1597);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1)=
;
    -+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
    -+
    -+    i2c_init_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_PIN);
    -+    adm1272_i2c_set16(i2cdev, PMBUS_READ_PIN, 0xDEAD);
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_PIN);
    -+    g_assert_cmphex(i2c_init_value, =3D=3D, i2c_value);
    -+}
    -+
    -+/* test voltage fault handling */
    -+static void test_voltage_faults(void *obj, void *data, QGuestAllocato=
r *alloc)
    -+{
    -+    uint16_t i2c_value;
    -+    uint8_t i2c_byte;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+
    -+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT,
    -+                      adm1272_millivolts_to_direct(5000));
    -+    qmp_adm1272_set(TEST_ID, "vout", 5100);
    -+
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
    -+    i2c_byte =3D i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
    -+    g_assert_true((i2c_value & PB_STATUS_VOUT) !=3D 0);
    -+    g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_WARN) !=3D 0);
    -+
    -+    qmp_adm1272_set(TEST_ID, "vout", 4500);
    -+    i2c_set8(i2cdev, PMBUS_CLEAR_FAULTS, 0);
    -+    i2c_byte =3D i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
    -+    g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_WARN) =3D=3D 0);
    -+
    -+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT,
    -+                      adm1272_millivolts_to_direct(4600));
    -+    i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
    -+    i2c_byte =3D i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
    -+    g_assert_true((i2c_value & PB_STATUS_VOUT) !=3D 0);
    -+    g_assert_true((i2c_byte & PB_STATUS_VOUT_UV_WARN) !=3D 0);
    -+
    -+}
    -+
    -+static void adm1272_register_nodes(void)
    -+{
    -+    QOSGraphEdgeOptions opts =3D {
    -+        .extra_device_opts =3D "id=3D" TEST_ID ",address=3D0x10"
    -+    };
    -+    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
    -+
    -+    qos_node_create_driver("adm1272", i2c_device_create);
    -+    qos_node_consumes("adm1272", "i2c-bus", &opts);
    -+
    -+    qos_add_test("test_defaults", "adm1272", test_defaults, NULL);
    -+    qos_add_test("test_tx_rx", "adm1272", test_tx_rx, NULL);
    -+    qos_add_test("test_rw_regs", "adm1272", test_rw_regs, NULL);
    -+    qos_add_test("test_ro_regs", "adm1272", test_ro_regs, NULL);
    -+    qos_add_test("test_ov_faults", "adm1272", test_voltage_faults, NU=
LL);
    -+}
    -+libqos_init(adm1272_register_nodes);
    -
      ## hw/arm/Kconfig ##
     @@ hw/arm/Kconfig: config XLNX_VERSAL
      config NPCM7XX
    @@ hw/misc/meson.build: softmmu_ss.add(when: 'CONFIG_SGA', if_true: fil=
es('sga.c'))
      softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
      softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.=
c'))
      softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
    -
    - ## tests/qtest/meson.build ##
    -@@ tests/qtest/meson.build: qtests_s390x =3D \
    - qos_test_ss =3D ss.source_set()
    - qos_test_ss.add(
    -   'ac97-test.c',
    -+  'adm1272-test.c',
    -   'ds1338-test.c',
    -   'e1000-test.c',
    -   'e1000e-test.c',
-:  ---------- > 3:  7d6d55d65e tests/qtest: add tests for ADM1272 device m=
odel
3:  7bf96fed69 ! 4:  5d69decd3a hw/misc: add MAX34451 device
    @@ hw/misc/max34451.c (new)
     + *
     + * Copyright 2021 Google LLC
     + *
    -+ * This program is free software; you can redistribute it and/or modi=
fy it
    -+ * under the terms of the GNU General Public License as published by =
the
    -+ * Free Software Foundation; either version 2 of the License, or
    -+ * (at your option) any later version.
    -+ *
    -+ * This program is distributed in the hope that it will be useful, bu=
t WITHOUT
    -+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or
    -+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se
    -+ * for more details.
    ++ * SPDX-License-Identifier: GPL-2.0-or-later
     + */
     +
     +#include "qemu/osdep.h"
    @@ hw/misc/max34451.c (new)
     +
     +type_init(max34451_register_types)
    =20
    - ## tests/qtest/max34451-test.c (new) ##
    -@@
    -+/*
    -+ * QTests for the MAX34451 device
    -+ *
    -+ * Copyright 2021 Google LLC
    -+ *
    -+ * This program is free software; you can redistribute it and/or modi=
fy it
    -+ * under the terms of the GNU General Public License as published by =
the
    -+ * Free Software Foundation; either version 2 of the License, or
    -+ * (at your option) any later version.
    -+ *
    -+ * This program is distributed in the hope that it will be useful, bu=
t WITHOUT
    -+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or
    -+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se
    -+ * for more details.
    -+ */
    -+
    -+#include "qemu/osdep.h"
    -+#include "hw/i2c/pmbus_device.h"
    -+#include "libqtest-single.h"
    -+#include "libqos/qgraph.h"
    -+#include "libqos/i2c.h"
    -+#include "qapi/qmp/qdict.h"
    -+#include "qapi/qmp/qnum.h"
    -+#include "qemu/bitops.h"
    -+
    -+#define TEST_ID "max34451-test"
    -+#define TEST_ADDR (0x4e)
    -+
    -+#define MAX34451_MFR_VOUT_PEAK          0xD4
    -+#define MAX34451_MFR_IOUT_PEAK          0xD5
    -+#define MAX34451_MFR_TEMPERATURE_PEAK   0xD6
    -+#define MAX34451_MFR_VOUT_MIN           0xD7
    -+
    -+#define DEFAULT_VOUT                    0
    -+#define DEFAULT_UV_LIMIT                0
    -+#define DEFAULT_TEMPERATURE             2500
    -+#define DEFAULT_SCALE                   0x7FFF
    -+#define DEFAULT_OV_LIMIT                0x7FFF
    -+#define DEFAULT_OC_LIMIT                0x7FFF
    -+#define DEFAULT_OT_LIMIT                0x7FFF
    -+#define DEFAULT_VMIN                    0x7FFF
    -+#define DEFAULT_TON_FAULT_LIMIT         0xFFFF
    -+#define DEFAULT_CHANNEL_CONFIG          0x20
    -+#define DEFAULT_TEXT                    0x20
    -+
    -+#define MAX34451_NUM_PWR_DEVICES        16
    -+#define MAX34451_NUM_TEMP_DEVICES       5
    -+
    -+
    -+static uint16_t qmp_max34451_get(const char *id, const char *property=
)
    -+{
    -+    QDict *response;
    -+    uint16_t ret;
    -+    response =3D qmp("{ 'execute': 'qom-get', 'arguments': { 'path': =
%s, "
    -+                   "'property': %s } }", id, property);
    -+    g_assert(qdict_haskey(response, "return"));
    -+    ret =3D qnum_get_uint(qobject_to(QNum, qdict_get(response, "retur=
n")));
    -+    qobject_unref(response);
    -+    return ret;
    -+}
    -+
    -+static void qmp_max34451_set(const char *id,
    -+                             const char *property,
    -+                             uint16_t value)
    -+{
    -+    QDict *response;
    -+
    -+    response =3D qmp("{ 'execute': 'qom-set', 'arguments': { 'path': =
%s, "
    -+                   "'property': %s, 'value': %u } }",
    -+                   id, property, value);
    -+    g_assert(qdict_haskey(response, "return"));
    -+    qobject_unref(response);
    -+}
    -+
    -+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is bi=
g endian */
    -+static uint16_t max34451_i2c_get16(QI2CDevice *i2cdev, uint8_t reg)
    -+{
    -+    uint8_t resp[2];
    -+    i2c_read_block(i2cdev, reg, resp, sizeof(resp));
    -+    return (resp[1] << 8) | resp[0];
    -+}
    -+
    -+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is bi=
g endian */
    -+static void max34451_i2c_set16(QI2CDevice *i2cdev, uint8_t reg, uint1=
6_t value)
    -+{
    -+    uint8_t data[2];
    -+
    -+    data[0] =3D value & 255;
    -+    data[1] =3D value >> 8;
    -+    i2c_write_block(i2cdev, reg, data, sizeof(data));
    -+}
    -+
    -+/* Test default values */
    -+static void test_defaults(void *obj, void *data, QGuestAllocator *all=
oc)
    -+{
    -+    uint16_t value, i2c_value;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+    char *path;
    -+
    -+    /* Default temperatures and temperature fault limits */
    -+    for (int i =3D 0; i < MAX34451_NUM_TEMP_DEVICES; i++) {
    -+        path =3D g_strdup_printf("temperature[%d]", i);
    -+        value =3D qmp_max34451_get(TEST_ID, path);
    -+        g_assert_cmpuint(value, =3D=3D, DEFAULT_TEMPERATURE);
    -+        g_free(path);
    -+
    -+        /* Temperature sensors start on page 16 */
    -+        i2c_set8(i2cdev, PMBUS_PAGE, i + 16);
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_READ_TEMPERATU=
RE_1);
    -+        g_assert_cmpuint(i2c_value, =3D=3D, DEFAULT_TEMPERATURE);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT=
);
    -+        g_assert_cmpuint(i2c_value, =3D=3D, DEFAULT_OT_LIMIT);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT)=
;
    -+        g_assert_cmpuint(i2c_value, =3D=3D, DEFAULT_OT_LIMIT);
    -+    }
    -+
    -+    /* Default voltages and fault limits */
    -+    for (int i =3D 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
    -+        path =3D g_strdup_printf("vout[%d]", i);
    -+        value =3D qmp_max34451_get(TEST_ID, path);
    -+        g_assert_cmpuint(value, =3D=3D, DEFAULT_VOUT);
    -+        g_free(path);
    -+
    -+        i2c_set8(i2cdev, PMBUS_PAGE, i);
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_READ_VOUT);
    -+        g_assert_cmpuint(i2c_value, =3D=3D, DEFAULT_VOUT);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_=
LIMIT);
    -+        g_assert_cmpuint(i2c_value, =3D=3D, DEFAULT_OV_LIMIT);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_VOUT_OV_WARN_L=
IMIT);
    -+        g_assert_cmpuint(i2c_value, =3D=3D, DEFAULT_OV_LIMIT);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_VOUT_UV_WARN_L=
IMIT);
    -+        g_assert_cmpuint(i2c_value, =3D=3D, DEFAULT_UV_LIMIT);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_VOUT_UV_FAULT_=
LIMIT);
    -+        g_assert_cmpuint(i2c_value, =3D=3D, DEFAULT_UV_LIMIT);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, MAX34451_MFR_VOUT_MI=
N);
    -+        g_assert_cmpuint(i2c_value, =3D=3D, DEFAULT_VMIN);
    -+    }
    -+
    -+    i2c_value =3D i2c_get8(i2cdev, PMBUS_VOUT_MODE);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0x40); /* DIRECT mode */
    -+
    -+    i2c_value =3D i2c_get8(i2cdev, PMBUS_REVISION);
    -+    g_assert_cmphex(i2c_value, =3D=3D, 0x11); /* Rev 1.1 */
    -+}
    -+
    -+/* Test setting temperature */
    -+static void test_temperature(void *obj, void *data, QGuestAllocator *=
alloc)
    -+{
    -+    uint16_t value, i2c_value;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+    char *path;
    -+
    -+    for (int i =3D 0; i < MAX34451_NUM_TEMP_DEVICES; i++) {
    -+        path =3D g_strdup_printf("temperature[%d]", i);
    -+        qmp_max34451_set(TEST_ID, path, 0xBE00 + i);
    -+        value =3D qmp_max34451_get(TEST_ID, path);
    -+        g_assert_cmphex(value, =3D=3D, 0xBE00 + i);
    -+        g_free(path);
    -+    }
    -+
    -+    /* compare qmp read with i2c read separately */
    -+    for (int i =3D 0; i < MAX34451_NUM_TEMP_DEVICES; i++) {
    -+        /* temperature[0] is on page 16 */
    -+        i2c_set8(i2cdev, PMBUS_PAGE, i + 16);
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_READ_TEMPERATU=
RE_1);
    -+        g_assert_cmphex(i2c_value, =3D=3D, 0xBE00 + i);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, MAX34451_MFR_TEMPERA=
TURE_PEAK);
    -+        g_assert_cmphex(i2c_value, =3D=3D, 0xBE00 + i);
    -+    }
    -+}
    -+
    -+/* Test setting voltage */
    -+static void test_voltage(void *obj, void *data, QGuestAllocator *allo=
c)
    -+{
    -+    uint16_t value, i2c_value;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+    char *path;
    -+
    -+    for (int i =3D 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
    -+        path =3D g_strdup_printf("vout[%d]", i);
    -+        qmp_max34451_set(TEST_ID, path, 3000 + i);
    -+        value =3D qmp_max34451_get(TEST_ID, path);
    -+        g_assert_cmpuint(value, =3D=3D, 3000 + i);
    -+        g_free(path);
    -+    }
    -+
    -+    /* compare qmp read with i2c read separately */
    -+    for (int i =3D 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
    -+        i2c_set8(i2cdev, PMBUS_PAGE, i);
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_READ_VOUT);
    -+        g_assert_cmpuint(i2c_value, =3D=3D, 3000 + i);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, MAX34451_MFR_VOUT_PE=
AK);
    -+        g_assert_cmpuint(i2c_value, =3D=3D, 3000 + i);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, MAX34451_MFR_VOUT_MI=
N);
    -+        g_assert_cmpuint(i2c_value, =3D=3D, 3000 + i);
    -+    }
    -+}
    -+
    -+/* Test setting some read/write registers */
    -+static void test_rw_regs(void *obj, void *data, QGuestAllocator *allo=
c)
    -+{
    -+    uint16_t i2c_value;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+
    -+    i2c_set8(i2cdev, PMBUS_PAGE, 11);
    -+    i2c_value =3D i2c_get8(i2cdev, PMBUS_PAGE);
    -+    g_assert_cmpuint(i2c_value, =3D=3D, 11);
    -+
    -+    i2c_set8(i2cdev, PMBUS_OPERATION, 1);
    -+    i2c_value =3D i2c_get8(i2cdev, PMBUS_OPERATION);
    -+    g_assert_cmpuint(i2c_value, =3D=3D, 1);
    -+
    -+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_MARGIN_HIGH, 5000);
    -+    i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
    -+    g_assert_cmpuint(i2c_value, =3D=3D, 5000);
    -+
    -+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_MARGIN_LOW, 4000);
    -+    i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
    -+    g_assert_cmpuint(i2c_value, =3D=3D, 4000);
    -+
    -+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT, 5500);
    -+    i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMI=
T);
    -+    g_assert_cmpuint(i2c_value, =3D=3D, 5500);
    -+
    -+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT, 5600);
    -+    i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT=
);
    -+    g_assert_cmpuint(i2c_value, =3D=3D, 5600);
    -+
    -+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_UV_FAULT_LIMIT, 5700);
    -+    i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_VOUT_UV_FAULT_LIMI=
T);
    -+    g_assert_cmpuint(i2c_value, =3D=3D, 5700);
    -+
    -+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT, 5800);
    -+    i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT=
);
    -+    g_assert_cmpuint(i2c_value, =3D=3D, 5800);
    -+
    -+    max34451_i2c_set16(i2cdev, PMBUS_POWER_GOOD_ON, 5900);
    -+    i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_POWER_GOOD_ON);
    -+    g_assert_cmpuint(i2c_value, =3D=3D, 5900);
    -+
    -+    max34451_i2c_set16(i2cdev, PMBUS_POWER_GOOD_OFF, 6100);
    -+    i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_POWER_GOOD_OFF);
    -+    g_assert_cmpuint(i2c_value, =3D=3D, 6100);
    -+}
    -+
    -+/* Test that Read only registers can't be written */
    -+static void test_ro_regs(void *obj, void *data, QGuestAllocator *allo=
c)
    -+{
    -+    uint16_t i2c_value, i2c_init_value;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+
    -+    i2c_set8(i2cdev, PMBUS_PAGE, 1); /* move to page 1 */
    -+    i2c_init_value =3D i2c_get8(i2cdev, PMBUS_CAPABILITY);
    -+    i2c_set8(i2cdev, PMBUS_CAPABILITY, 0xF9);
    -+    i2c_value =3D i2c_get8(i2cdev, PMBUS_CAPABILITY);
    -+    g_assert_cmpuint(i2c_init_value, =3D=3D, i2c_value);
    -+
    -+    i2c_init_value =3D max34451_i2c_get16(i2cdev, PMBUS_READ_VOUT);
    -+    max34451_i2c_set16(i2cdev, PMBUS_READ_VOUT, 0xDEAD);
    -+    i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_READ_VOUT);
    -+    g_assert_cmpuint(i2c_init_value, =3D=3D, i2c_value);
    -+    g_assert_cmphex(i2c_value, !=3D, 0xDEAD);
    -+
    -+    i2c_set8(i2cdev, PMBUS_PAGE, 16); /* move to page 16 */
    -+    i2c_init_value =3D max34451_i2c_get16(i2cdev, PMBUS_READ_TEMPERAT=
URE_1);
    -+    max34451_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_1, 0xABBA);
    -+    i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1=
);
    -+    g_assert_cmpuint(i2c_init_value, =3D=3D, i2c_value);
    -+    g_assert_cmphex(i2c_value, !=3D, 0xABBA);
    -+}
    -+
    -+/* test over voltage faults */
    -+static void test_ov_faults(void *obj, void *data, QGuestAllocator *al=
loc)
    -+{
    -+    uint16_t i2c_value;
    -+    uint8_t i2c_byte;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+    char *path;
    -+    /* Test ov fault reporting */
    -+    for (int i =3D 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
    -+        path =3D g_strdup_printf("vout[%d]", i);
    -+        i2c_set8(i2cdev, PMBUS_PAGE, i);
    -+        max34451_i2c_set16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT, 5000);
    -+        qmp_max34451_set(TEST_ID, path, 5100);
    -+        g_free(path);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
    -+        i2c_byte =3D i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
    -+        g_assert_true((i2c_value & PB_STATUS_VOUT) !=3D 0);
    -+        g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_FAULT) !=3D 0);
    -+    }
    -+}
    -+
    -+/* test over temperature faults */
    -+static void test_ot_faults(void *obj, void *data, QGuestAllocator *al=
loc)
    -+{
    -+    uint16_t i2c_value;
    -+    uint8_t i2c_byte;
    -+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
    -+    char *path;
    -+
    -+    for (int i =3D 0; i < MAX34451_NUM_TEMP_DEVICES; i++) {
    -+        path =3D g_strdup_printf("temperature[%d]", i);
    -+        i2c_set8(i2cdev, PMBUS_PAGE, i + 16);
    -+        max34451_i2c_set16(i2cdev, PMBUS_OT_FAULT_LIMIT, 6000);
    -+        qmp_max34451_set(TEST_ID, path, 6100);
    -+        g_free(path);
    -+
    -+        i2c_value =3D max34451_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
    -+        i2c_byte =3D i2c_get8(i2cdev, PMBUS_STATUS_TEMPERATURE);
    -+        g_assert_true((i2c_value & PB_STATUS_TEMPERATURE) !=3D 0);
    -+        g_assert_true((i2c_byte & PB_STATUS_OT_FAULT) !=3D 0);
    -+    }
    -+}
    -+
    -+static void max34451_register_nodes(void)
    -+{
    -+    QOSGraphEdgeOptions opts =3D {
    -+        .extra_device_opts =3D "id=3D" TEST_ID ",address=3D0x4e"
    -+    };
    -+    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
    -+
    -+    qos_node_create_driver("max34451", i2c_device_create);
    -+    qos_node_consumes("max34451", "i2c-bus", &opts);
    -+
    -+    qos_add_test("test_defaults", "max34451", test_defaults, NULL);
    -+    qos_add_test("test_temperature", "max34451", test_temperature, NU=
LL);
    -+    qos_add_test("test_voltage", "max34451", test_voltage, NULL);
    -+    qos_add_test("test_rw_regs", "max34451", test_rw_regs, NULL);
    -+    qos_add_test("test_ro_regs", "max34451", test_ro_regs, NULL);
    -+    qos_add_test("test_ov_faults", "max34451", test_ov_faults, NULL);
    -+    qos_add_test("test_ot_faults", "max34451", test_ot_faults, NULL);
    -+}
    -+libqos_init(max34451_register_nodes);
    -
      ## hw/arm/Kconfig ##
     @@ hw/arm/Kconfig: config NPCM7XX
          select ADM1272
    @@ hw/misc/meson.build: softmmu_ss.add(when: 'CONFIG_TMP105', if_true: =
files('tmp10
      softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
      softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.=
c'))
      softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
    -
    - ## tests/qtest/meson.build ##
    -@@ tests/qtest/meson.build: qos_test_ss.add(
    -   'eepro100-test.c',
    -   'es1370-test.c',
    -   'ipoctal232-test.c',
    -+  'max34451-test.c',
    -   'megasas-test.c',
    -   'ne2000-test.c',
    -   'tulip-test.c',
-:  ---------- > 5:  d782fc570f tests/qtest: add tests for MAX34451 device =
model
--=20
2.31.1.527.g47e6f16901-goog


