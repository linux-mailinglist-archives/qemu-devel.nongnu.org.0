Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD67372E24
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:33:33 +0200 (CEST)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxzI-0008H7-KJ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3cnaRYAYKCq8iXijhgVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--titusr.bounces.google.com>)
 id 1ldxvd-0006pd-8l
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:29:45 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:51989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3cnaRYAYKCq8iXijhgVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--titusr.bounces.google.com>)
 id 1ldxvY-0004Ji-K1
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:29:45 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 k129-20020a2556870000b02904f825078971so1775468ybb.18
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 09:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=RI/k9akiVITEZCWKSAFiJFOW9olQLmghLdWQt9YDom8=;
 b=VrLVBzhEhVYlnFjVKlUqbEAfkFmjhIlXg6dxf0m7OzHagYrSmEyU/SXL24LW8yMEgZ
 cnovZE/jZUytbgLcEAo+PAMFtWwCjfk+oUceWoFWuuvkbcDcUM8cE9wWAaHrPWiOToBJ
 VfrOoGPLzGkuwO89A74q9ZpKseclAOeti4OBKzlpaAMhtZxTHTSJRnv62xYQlwnJQQGe
 3Utv8HwG1/rSviceM/wF1n+XN/79G69vH3aJggtXxzIlVTHpZinclNDLIhiB7qy+SlJT
 sWV0cEgJbBKukfmyeK1O5gDzhN6qWrCMjYzuiBFHNdNEH//rlPf2USXBqSuejushz0PL
 LEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=RI/k9akiVITEZCWKSAFiJFOW9olQLmghLdWQt9YDom8=;
 b=O9ANs9TgRJ3CRrqwlSbCbDHS2pNfD5JdP2HgVN5q+pl/QkjDiRr7MzWBtEC3xDbdvd
 0mx6hH8xkZh9sDwtlFNE+bMGprj7d5yEWYKEQlPtCvysNTSEe9NCd+5r8RdP4ebnQRl7
 PyJfrBu/AB2Z2riKHnuYjqUhwziQttyga3jv+uTyBdjmMN+wAzak3kWXIznLcCotOJw9
 QisnuJVdDmRGaBG+3vK/yzAFWFfnoC49I6g6nuoFiF48h25sFZcRXkuSrZyHXwHcczcL
 id0rQzf5m9OkinRmH8Y3g0uJwtyJNkrWt3xMEHszIp4B1rM/BLxcojuVAjlkL/EFGQJA
 Nx9A==
X-Gm-Message-State: AOAM531/ddOJwtO20klbM2D0VX4lLA5Qb1Ak2RHA2hBwsBBi2uU4pbAO
 EdQdvTYf4cn0cXLdOE+iqc0tB9AOdcU=
X-Google-Smtp-Source: ABdhPJxhGXmvOEVuPqS7uxEU5BCLHOo0lZuFYyocLRuBWXX9NVzQtJRPoAtIfUe6UOTQKR1y7cfcdmj5dl0=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:85f8:a1ce:1113:b790])
 (user=titusr job=sendgmr) by 2002:a25:e6d4:: with SMTP id
 d203mr3834630ybh.226.1620145778771; 
 Tue, 04 May 2021 09:29:38 -0700 (PDT)
Date: Tue,  4 May 2021 09:28:39 -0700
In-Reply-To: <20210504162841.2884846-1-titusr@google.com>
Message-Id: <20210504162841.2884846-2-titusr@google.com>
Mime-Version: 1.0
References: <20210504162841.2884846-1-titusr@google.com>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [PATCH 1/3] hw/i2c: add support for PMBus
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3cnaRYAYKCq8iXijhgVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--titusr.bounces.google.com;
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

QEMU has support for SMBus devices, and PMBus is a more specific
implementation of SMBus. The additions made in this commit makes it easier to
add new PMBus devices to QEMU.

https://pmbus.org/specification-archives/

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/arm/Kconfig                |    1 +
 hw/i2c/Kconfig                |    4 +
 hw/i2c/meson.build            |    1 +
 hw/i2c/pmbus_device.c         | 1611 +++++++++++++++++++++++++++++++++
 include/hw/i2c/pmbus_device.h |  520 +++++++++++
 5 files changed, 2137 insertions(+)
 create mode 100644 hw/i2c/pmbus_device.c
 create mode 100644 include/hw/i2c/pmbus_device.h

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8c37cf00da..8c9ae17efd 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -373,6 +373,7 @@ config NPCM7XX
     select ARM_GIC
     select AT24C  # EEPROM
     select PL310  # cache controller
+    select PMBUS
     select SERIAL
     select SSI
     select UNIMP
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 09642a6dcb..87f7004cea 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -28,3 +28,7 @@ config IMX_I2C
 config MPC_I2C
     bool
     select I2C
+
+config PMBUS
+    bool
+    select SMBUS
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index cdcd694a7f..f7e2d482b0 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -14,4 +14,5 @@ i2c_ss.add(when: 'CONFIG_SMBUS_EEPROM', if_true: files('smbus_eeprom.c'))
 i2c_ss.add(when: 'CONFIG_VERSATILE_I2C', if_true: files('versatile_i2c.c'))
 i2c_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PPC4XX', if_true: files('ppc4xx_i2c.c'))
+i2c_ss.add(when: 'CONFIG_PMBUS', if_true: files('pmbus_device.c'))
 softmmu_ss.add_all(when: 'CONFIG_I2C', if_true: i2c_ss)
diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
new file mode 100644
index 0000000000..73b944e983
--- /dev/null
+++ b/hw/i2c/pmbus_device.c
@@ -0,0 +1,1611 @@
+/*
+ * PMBus wrapper over SMBus
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
+#include "qemu/osdep.h"
+#include <math.h>
+#include <string.h>
+#include "hw/i2c/pmbus_device.h"
+#include "qemu/module.h"
+#include "qemu/log.h"
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
+static void pmbus_send(PMBusDevice *pmdev, const uint8_t *data, uint16_t len)
+{
+    if (pmdev->out_buf_len + len > SMBUS_DATA_MAX_LEN) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "PMBus device tried to send too much data");
+        len = 0;
+    }
+
+    for (int i = len - 1; i >= 0; i--) {
+        pmdev->out_buf[i + pmdev->out_buf_len] = data[len - i - 1];
+    }
+    pmdev->out_buf_len += len;
+}
+
+/* Internal only, convert unsigned ints to the little endian bus */
+static void pmbus_send_uint(PMBusDevice *pmdev, uint64_t data, uint8_t size)
+{
+    uint8_t bytes[8];
+    for (int i = 0; i < size; i++) {
+        bytes[i] = data & 0xFF;
+        data = data >> 8;
+    }
+    pmbus_send(pmdev, bytes, size);
+}
+
+void pmbus_send_block(PMBusDevice *pmdev, PMBusBlock block)
+{
+    pmbus_send(pmdev, block.buf, block.len);
+}
+
+void pmbus_send8(PMBusDevice *pmdev, uint8_t data)
+{
+    pmbus_send_uint(pmdev, data, 1);
+}
+
+void pmbus_send16(PMBusDevice *pmdev, uint16_t data)
+{
+    pmbus_send_uint(pmdev, data, 2);
+}
+
+void pmbus_send32(PMBusDevice *pmdev, uint32_t data)
+{
+    pmbus_send_uint(pmdev, data, 4);
+}
+
+void pmbus_send64(PMBusDevice *pmdev, uint64_t data)
+{
+    pmbus_send_uint(pmdev, data, 8);
+}
+
+void pmbus_send_string(PMBusDevice *pmdev, const char *data)
+{
+    size_t len = strlen(data);
+    g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
+    pmdev->out_buf[len + pmdev->out_buf_len] = len;
+
+    for (int i = len - 1; i >= 0; i--) {
+        pmdev->out_buf[i + pmdev->out_buf_len] = data[len - 1 - i];
+    }
+    pmdev->out_buf_len += len + 1;
+}
+
+
+static uint64_t pmbus_receive_uint(const uint8_t *buf, uint8_t len)
+{
+    uint64_t ret = 0;
+
+    /* Exclude command code from return value */
+    buf++;
+    len--;
+
+    for (int i = len - 1; i >= 0; i--) {
+        ret = ret << 8 | buf[i];
+    }
+    return ret;
+}
+
+uint8_t pmbus_receive8(PMBusDevice *pmdev)
+{
+    if (pmdev->in_buf_len - 1 != 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: length mismatch. Expected 1 byte, got %d bytes\n",
+                      __func__, pmdev->in_buf_len - 1);
+    }
+    return (uint8_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+}
+
+uint16_t pmbus_receive16(PMBusDevice *pmdev)
+{
+    if (pmdev->in_buf_len - 1 != 2) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: length mismatch. Expected 2 bytes, got %d bytes\n",
+                      __func__, pmdev->in_buf_len - 1);
+    }
+    return (uint16_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+}
+
+uint32_t pmbus_receive32(PMBusDevice *pmdev)
+{
+    if (pmdev->in_buf_len - 1 != 4) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: length mismatch. Expected 4 bytes, got %d bytes\n",
+                      __func__, pmdev->in_buf_len - 1);
+    }
+    return (uint32_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+}
+
+uint64_t pmbus_receive64(PMBusDevice *pmdev)
+{
+    if (pmdev->in_buf_len - 1 != 8) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: length mismatch. Expected 8 bytes, got %d bytes\n",
+                      __func__, pmdev->in_buf_len - 1);
+    }
+    return (uint64_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+}
+
+PMBusBlock pmbus_receive_block(PMBusDevice *pmdev)
+{
+    PMBusBlock data = { pmdev->in_buf, pmdev->in_buf_len };
+    return data;
+}
+
+static uint8_t pmbus_out_buf_pop(PMBusDevice *pmdev)
+{
+    if (pmdev->out_buf_len == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: tried to read from empty buffer",
+                      __func__);
+        return 0xFF;
+    }
+    uint8_t data = pmdev->out_buf[pmdev->out_buf_len - 1];
+    pmdev->out_buf_len--;
+    return data;
+}
+
+static void pmbus_quick_cmd(SMBusDevice *smd, uint8_t read)
+{
+    PMBusDevice *pmdev = PMBUS_DEVICE(smd);
+    PMBusDeviceClass *pmdc = PMBUS_DEVICE_GET_CLASS(pmdev);
+
+    if (pmdc->quick_cmd) {
+        pmdc->quick_cmd(pmdev, read);
+    }
+}
+
+static void pmbus_pages_alloc(PMBusDevice *pmdev)
+{
+    /* some PMBus devices don't use the PAGE command, so they get 1 page */
+    PMBusDeviceClass *k = PMBUS_DEVICE_GET_CLASS(pmdev);
+    if (k->device_num_pages == 0) {
+        k->device_num_pages = 1;
+    }
+    pmdev->num_pages = k->device_num_pages;
+    pmdev->pages = g_new0(PMBusPage, k->device_num_pages);
+}
+
+void pmbus_check_limits(PMBusDevice *pmdev)
+{
+    for (int i = 0; i < pmdev->num_pages; i++) {
+        if ((pmdev->pages[i].operation & PB_OP_ON) == 0) {
+            continue;   /* don't check powered off devices */
+        }
+
+        if (pmdev->pages[i].read_vout > pmdev->pages[i].vout_ov_fault_limit) {
+            pmdev->pages[i].status_word |= PB_STATUS_VOUT;
+            pmdev->pages[i].status_vout |= PB_STATUS_VOUT_OV_FAULT;
+        }
+
+        if (pmdev->pages[i].read_vout > pmdev->pages[i].vout_ov_warn_limit) {
+            pmdev->pages[i].status_word |= PB_STATUS_VOUT;
+            pmdev->pages[i].status_vout |= PB_STATUS_VOUT_OV_WARN;
+        }
+
+        if (pmdev->pages[i].read_vout < pmdev->pages[i].vout_uv_warn_limit) {
+            pmdev->pages[i].status_word |= PB_STATUS_VOUT;
+            pmdev->pages[i].status_vout |= PB_STATUS_VOUT_UV_WARN;
+        }
+
+        if (pmdev->pages[i].read_vout < pmdev->pages[i].vout_uv_fault_limit) {
+            pmdev->pages[i].status_word |= PB_STATUS_VOUT;
+            pmdev->pages[i].status_vout |= PB_STATUS_VOUT_UV_FAULT;
+        }
+
+        if (pmdev->pages[i].read_vin > pmdev->pages[i].vin_ov_warn_limit) {
+            pmdev->pages[i].status_word |= PB_STATUS_INPUT;
+            pmdev->pages[i].status_input |= PB_STATUS_INPUT_VIN_OV_WARN;
+        }
+
+        if (pmdev->pages[i].read_vin < pmdev->pages[i].vin_uv_warn_limit) {
+            pmdev->pages[i].status_word |= PB_STATUS_INPUT;
+            pmdev->pages[i].status_input |= PB_STATUS_INPUT_VIN_UV_WARN;
+        }
+
+        if (pmdev->pages[i].read_iout > pmdev->pages[i].iout_oc_warn_limit) {
+            pmdev->pages[i].status_word |= PB_STATUS_IOUT_POUT;
+            pmdev->pages[i].status_iout |= PB_STATUS_IOUT_OC_WARN;
+        }
+
+        if (pmdev->pages[i].read_iout > pmdev->pages[i].iout_oc_fault_limit) {
+            pmdev->pages[i].status_word |= PB_STATUS_IOUT_POUT;
+            pmdev->pages[i].status_iout |= PB_STATUS_IOUT_OC_FAULT;
+        }
+
+        if (pmdev->pages[i].read_pin > pmdev->pages[i].pin_op_warn_limit) {
+            pmdev->pages[i].status_word |= PB_STATUS_INPUT;
+            pmdev->pages[i].status_input |= PB_STATUS_INPUT_PIN_OP_WARN;
+        }
+
+        if (pmdev->pages[i].read_temperature_1
+                > pmdev->pages[i].ot_fault_limit) {
+            pmdev->pages[i].status_word |= PB_STATUS_TEMPERATURE;
+            pmdev->pages[i].status_temperature |= PB_STATUS_OT_FAULT;
+        }
+
+        if (pmdev->pages[i].read_temperature_1
+                > pmdev->pages[i].ot_warn_limit) {
+            pmdev->pages[i].status_word |= PB_STATUS_TEMPERATURE;
+            pmdev->pages[i].status_temperature |= PB_STATUS_OT_WARN;
+        }
+    }
+}
+
+static uint8_t pmbus_receive_byte(SMBusDevice *smd)
+{
+    PMBusDevice *pmdev = PMBUS_DEVICE(smd);
+    PMBusDeviceClass *pmdc = PMBUS_DEVICE_GET_CLASS(pmdev);
+    uint8_t ret = 0xFF;
+    uint8_t index = pmdev->page;
+
+    if (pmdev->out_buf_len != 0) {
+        ret = pmbus_out_buf_pop(pmdev);
+        return ret;
+    }
+
+    switch (pmdev->code) {
+    case PMBUS_PAGE:
+        pmbus_send8(pmdev, pmdev->page);
+        break;
+
+    case PMBUS_OPERATION:                 /* R/W byte */
+        pmbus_send8(pmdev, pmdev->pages[index].operation);
+        break;
+
+    case PMBUS_ON_OFF_CONFIG:             /* R/W byte */
+        pmbus_send8(pmdev, pmdev->pages[index].on_off_config);
+        break;
+
+    case PMBUS_PHASE:                     /* R/W byte */
+        pmbus_send8(pmdev, pmdev->pages[index].phase);
+        break;
+
+    case PMBUS_WRITE_PROTECT:             /* R/W byte */
+        pmbus_send8(pmdev, pmdev->pages[index].write_protect);
+        break;
+
+    case PMBUS_CAPABILITY:
+        pmbus_send8(pmdev, pmdev->capability);
+        break;
+
+    case PMBUS_VOUT_MODE:                 /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_MODE) {
+            pmbus_send8(pmdev, pmdev->pages[index].vout_mode);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_COMMAND:              /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_command);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_TRIM:                 /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_trim);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_CAL_OFFSET:           /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_cal_offset);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_MAX:                  /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_max);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_MARGIN_HIGH:          /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_MARGIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_margin_high);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_MARGIN_LOW:           /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_MARGIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_margin_low);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_TRANSITION_RATE:      /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_transition_rate);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_DROOP:                /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_droop);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_SCALE_LOOP:           /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_scale_loop);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_SCALE_MONITOR:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_scale_monitor);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    /* TODO: implement coefficients support */
+
+    case PMBUS_POUT_MAX:                  /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_POUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].pout_max);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VIN_ON:                    /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].vin_on);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VIN_OFF:                   /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].vin_off);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_IOUT_CAL_GAIN:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT_GAIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].iout_cal_gain);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_OV_FAULT_LIMIT:       /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_ov_fault_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_OV_FAULT_RESPONSE:    /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send8(pmdev, pmdev->pages[index].vout_ov_fault_response);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_OV_WARN_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_ov_warn_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_UV_WARN_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_uv_warn_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_UV_FAULT_LIMIT:       /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_uv_fault_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VOUT_UV_FAULT_RESPONSE:    /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send8(pmdev, pmdev->pages[index].vout_uv_fault_response);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_IOUT_OC_FAULT_LIMIT:       /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].iout_oc_fault_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_IOUT_OC_FAULT_RESPONSE:    /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmbus_send8(pmdev, pmdev->pages[index].iout_oc_fault_response);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_IOUT_OC_LV_FAULT_LIMIT:    /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].iout_oc_lv_fault_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_IOUT_OC_LV_FAULT_RESPONSE: /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmbus_send8(pmdev, pmdev->pages[index].iout_oc_lv_fault_response);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_IOUT_OC_WARN_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].iout_oc_warn_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_IOUT_UC_FAULT_LIMIT:       /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].iout_uc_fault_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_IOUT_UC_FAULT_RESPONSE:    /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmbus_send8(pmdev, pmdev->pages[index].iout_uc_fault_response);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_OT_FAULT_LIMIT:            /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmbus_send16(pmdev, pmdev->pages[index].ot_fault_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_OT_FAULT_RESPONSE:         /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmbus_send8(pmdev, pmdev->pages[index].ot_fault_response);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_OT_WARN_LIMIT:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmbus_send16(pmdev, pmdev->pages[index].ot_warn_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_UT_WARN_LIMIT:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmbus_send16(pmdev, pmdev->pages[index].ut_warn_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_UT_FAULT_LIMIT:            /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmbus_send16(pmdev, pmdev->pages[index].ut_fault_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_UT_FAULT_RESPONSE:         /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmbus_send8(pmdev, pmdev->pages[index].ut_fault_response);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VIN_OV_FAULT_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].vin_ov_fault_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VIN_OV_FAULT_RESPONSE:     /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmbus_send8(pmdev, pmdev->pages[index].vin_ov_fault_response);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VIN_OV_WARN_LIMIT:         /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].vin_ov_warn_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VIN_UV_WARN_LIMIT:         /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].vin_uv_warn_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VIN_UV_FAULT_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].vin_uv_fault_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_VIN_UV_FAULT_RESPONSE:     /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmbus_send8(pmdev, pmdev->pages[index].vin_uv_fault_response);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_IIN_OC_FAULT_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].iin_oc_fault_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_IIN_OC_FAULT_RESPONSE:     /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_IIN) {
+            pmbus_send8(pmdev, pmdev->pages[index].iin_oc_fault_response);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_IIN_OC_WARN_LIMIT:         /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].iin_oc_warn_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_POUT_OP_FAULT_LIMIT:       /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_POUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].pout_op_fault_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_POUT_OP_FAULT_RESPONSE:    /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_POUT) {
+            pmbus_send8(pmdev, pmdev->pages[index].pout_op_fault_response);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_POUT_OP_WARN_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_POUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].pout_op_warn_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_PIN_OP_WARN_LIMIT:         /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_PIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].pin_op_warn_limit);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_STATUS_BYTE:               /* R/W byte */
+        pmbus_send8(pmdev, pmdev->pages[index].status_word & 0xFF);
+        break;
+
+    case PMBUS_STATUS_WORD:               /* R/W word */
+        pmbus_send16(pmdev, pmdev->pages[index].status_word);
+        break;
+
+    case PMBUS_STATUS_VOUT:               /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send8(pmdev, pmdev->pages[index].status_vout);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_STATUS_IOUT:               /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmbus_send8(pmdev, pmdev->pages[index].status_iout);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_STATUS_INPUT:              /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN ||
+            pmdev->pages[index].page_flags & PB_HAS_IIN ||
+            pmdev->pages[index].page_flags & PB_HAS_PIN) {
+            pmbus_send8(pmdev, pmdev->pages[index].status_input);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_STATUS_TEMPERATURE:        /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmbus_send8(pmdev, pmdev->pages[index].status_temperature);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_STATUS_CML:                /* R/W byte */
+        pmbus_send8(pmdev, pmdev->pages[index].status_cml);
+        break;
+
+    case PMBUS_STATUS_OTHER:              /* R/W byte */
+        pmbus_send8(pmdev, pmdev->pages[index].status_other);
+        break;
+
+    case PMBUS_READ_EIN:                  /* Read-Only block 5 bytes */
+        if (pmdev->pages[index].page_flags & PB_HAS_EIN) {
+            pmbus_send(pmdev, pmdev->pages[index].read_ein, 5);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_EOUT:                 /* Read-Only block 5 bytes */
+        if (pmdev->pages[index].page_flags & PB_HAS_EOUT) {
+            pmbus_send(pmdev, pmdev->pages[index].read_eout, 5);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_VIN:                  /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_vin);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_IIN:                  /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_iin);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_VOUT:                 /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_vout);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_IOUT:                 /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_iout);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_TEMPERATURE_1:        /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_temperature_1);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_TEMPERATURE_2:        /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMP2) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_temperature_2);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_TEMPERATURE_3:        /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMP3) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_temperature_3);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_POUT:                 /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_POUT) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_pout);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_PIN:                  /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_PIN) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_pin);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_REVISION:                  /* Read-Only byte */
+        pmbus_send8(pmdev, pmdev->pages[index].revision);
+        break;
+
+    case PMBUS_MFR_ID:                    /* R/W block */
+        if (pmdev->pages[index].page_flags & PB_HAS_MFR_INFO) {
+            pmbus_send_string(pmdev, pmdev->pages[index].mfr_id);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_MODEL:                 /* R/W block */
+        if (pmdev->pages[index].page_flags & PB_HAS_MFR_INFO) {
+            pmbus_send_string(pmdev, pmdev->pages[index].mfr_model);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_REVISION:              /* R/W block */
+        if (pmdev->pages[index].page_flags & PB_HAS_MFR_INFO) {
+            pmbus_send_string(pmdev, pmdev->pages[index].mfr_revision);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_LOCATION:              /* R/W block */
+        if (pmdev->pages[index].page_flags & PB_HAS_MFR_INFO) {
+            pmbus_send_string(pmdev, pmdev->pages[index].mfr_location);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_VIN_MIN:               /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].mfr_vin_min);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_VIN_MAX:               /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].mfr_vin_max);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_IIN_MAX:               /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IIN_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].mfr_iin_max);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_PIN_MAX:               /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_PIN_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].mfr_pin_max);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_VOUT_MIN:              /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].mfr_vout_min);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_VOUT_MAX:              /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].mfr_vout_max);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_IOUT_MAX:              /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].mfr_iout_max);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_POUT_MAX:              /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_POUT_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].mfr_pout_max);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_MAX_TEMP_1:            /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMP_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].mfr_max_temp_1);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_MAX_TEMP_2:            /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMP_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].mfr_max_temp_2);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_MFR_MAX_TEMP_3:            /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMP_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].mfr_max_temp_3);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_CLEAR_FAULTS:              /* Send Byte */
+    case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
+    case PMBUS_STORE_DEFAULT_ALL:         /* Send Byte */
+    case PMBUS_RESTORE_DEFAULT_ALL:       /* Send Byte */
+    case PMBUS_STORE_DEFAULT_CODE:        /* Write-only Byte */
+    case PMBUS_RESTORE_DEFAULT_CODE:      /* Write-only Byte */
+    case PMBUS_STORE_USER_ALL:            /* Send Byte */
+    case PMBUS_RESTORE_USER_ALL:          /* Send Byte */
+    case PMBUS_STORE_USER_CODE:           /* Write-only Byte */
+    case PMBUS_RESTORE_USER_CODE:         /* Write-only Byte */
+    case PMBUS_QUERY:                     /* Write-Only */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: reading from write only register 0x%02x\n",
+                      __func__, pmdev->code);
+        break;
+
+passthough:
+    default:
+        /* Pass through read request if not handled */
+        if (pmdc->receive_byte) {
+            ret = pmdc->receive_byte(pmdev);
+        }
+        break;
+    }
+
+    if (pmdev->out_buf_len != 0) {
+        ret = pmbus_out_buf_pop(pmdev);
+        return ret;
+    }
+
+    return ret;
+}
+
+/*
+ * PMBus clear faults command applies to all status registers, existing faults
+ * should separately get re-asserted.
+ */
+static void pmbus_clear_faults(PMBusDevice *pmdev)
+{
+    for (uint8_t i = 0; i < pmdev->num_pages; i++) {
+        pmdev->pages[i].status_word = 0;
+        pmdev->pages[i].status_vout = 0;
+        pmdev->pages[i].status_iout = 0;
+        pmdev->pages[i].status_input = 0;
+        pmdev->pages[i].status_temperature = 0;
+        pmdev->pages[i].status_cml = 0;
+        pmdev->pages[i].status_other = 0;
+        pmdev->pages[i].status_mfr_specific = 0;
+        pmdev->pages[i].status_fans_1_2 = 0;
+        pmdev->pages[i].status_fans_3_4 = 0;
+    }
+
+}
+
+/*
+ * PMBus operation is used to turn On and Off PSUs
+ * Therefore, default value for the Operation should be PB_OP_ON or 0x80
+ */
+static void pmbus_operation(PMBusDevice *pmdev)
+{
+    uint8_t index = pmdev->page;
+    if ((pmdev->pages[index].operation & PB_OP_ON) == 0) {
+        pmdev->pages[index].read_vout = 0;
+        pmdev->pages[index].read_iout = 0;
+        pmdev->pages[index].read_pout = 0;
+        return;
+    }
+
+    if (pmdev->pages[index].operation & (PB_OP_ON | PB_OP_MARGIN_HIGH)) {
+        pmdev->pages[index].read_vout = pmdev->pages[index].vout_margin_high;
+    }
+
+    if (pmdev->pages[index].operation & (PB_OP_ON | PB_OP_MARGIN_LOW)) {
+        pmdev->pages[index].read_vout = pmdev->pages[index].vout_margin_low;
+    }
+    pmbus_check_limits(pmdev);
+}
+
+static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
+{
+    PMBusDevice *pmdev = PMBUS_DEVICE(smd);
+    PMBusDeviceClass *pmdc = PMBUS_DEVICE_GET_CLASS(pmdev);
+    int ret = 0;
+    uint8_t index;
+
+    if (len == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func__);
+        return -1;
+    }
+
+    if (!pmdev->pages) { /* allocate memory for pages on first use */
+        pmbus_pages_alloc(pmdev);
+    }
+
+    pmdev->in_buf_len = len;
+    pmdev->in_buf = buf;
+
+    pmdev->code = buf[0]; /* PMBus command code */
+    if (len == 1) { /* Single length writes are command codes only */
+        return 0;
+    }
+
+    if (pmdev->code == PMBUS_PAGE) {
+        pmdev->page = pmbus_receive8(pmdev);
+        return 0;
+    }
+    /* loop through all the pages when 0xFF is received */
+    if (pmdev->page == PB_ALL_PAGES) {
+        for (int i = 0; i < pmdev->num_pages; i++) {
+            pmdev->page = i;
+            pmbus_write_data(smd, buf, len);
+        }
+        pmdev->page = PB_ALL_PAGES;
+        return 0;
+    }
+
+    index = pmdev->page;
+
+    switch (pmdev->code) {
+    case PMBUS_OPERATION:                 /* R/W byte */
+        pmdev->pages[index].operation = pmbus_receive8(pmdev);
+        pmbus_operation(pmdev);
+        break;
+
+    case PMBUS_ON_OFF_CONFIG:             /* R/W byte */
+        pmdev->pages[index].on_off_config = pmbus_receive8(pmdev);
+        break;
+
+    case PMBUS_CLEAR_FAULTS:              /* Send Byte */
+        pmbus_clear_faults(pmdev);
+        break;
+
+    case PMBUS_PHASE:                     /* R/W byte */
+        pmdev->pages[index].phase = pmbus_receive8(pmdev);
+        break;
+
+    case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
+    case PMBUS_WRITE_PROTECT:             /* R/W byte */
+        pmdev->pages[index].write_protect = pmbus_receive8(pmdev);
+        break;
+
+    case PMBUS_VOUT_MODE:                 /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_MODE) {
+            pmdev->pages[index].vout_mode = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_COMMAND:              /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_command = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_TRIM:                 /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_trim = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_CAL_OFFSET:           /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_cal_offset = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_MAX:                  /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_max = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_MARGIN_HIGH:          /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_MARGIN) {
+            pmdev->pages[index].vout_margin_high = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_MARGIN_LOW:           /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_MARGIN) {
+            pmdev->pages[index].vout_margin_low = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_TRANSITION_RATE:      /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_transition_rate = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_DROOP:                /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_droop = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_SCALE_LOOP:           /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_scale_loop = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_SCALE_MONITOR:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_scale_monitor = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_POUT_MAX:                  /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].pout_max = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VIN_ON:                    /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmdev->pages[index].vin_on = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VIN_OFF:                   /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmdev->pages[index].vin_off = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_IOUT_CAL_GAIN:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT_GAIN) {
+            pmdev->pages[index].iout_cal_gain = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_OV_FAULT_LIMIT:       /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_ov_fault_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_OV_FAULT_RESPONSE:    /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_ov_fault_response = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_OV_WARN_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_ov_warn_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_UV_WARN_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_uv_warn_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_UV_FAULT_LIMIT:       /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_uv_fault_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VOUT_UV_FAULT_RESPONSE:    /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].vout_uv_fault_response = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_IOUT_OC_FAULT_LIMIT:       /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmdev->pages[index].iout_oc_fault_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_IOUT_OC_FAULT_RESPONSE:    /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmdev->pages[index].iout_oc_fault_response = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_IOUT_OC_LV_FAULT_LIMIT:    /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmdev->pages[index].iout_oc_lv_fault_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_IOUT_OC_LV_FAULT_RESPONSE: /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmdev->pages[index].iout_oc_lv_fault_response
+                = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_IOUT_OC_WARN_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmdev->pages[index].iout_oc_warn_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_IOUT_UC_FAULT_LIMIT:       /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmdev->pages[index].iout_uc_fault_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_IOUT_UC_FAULT_RESPONSE:    /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmdev->pages[index].iout_uc_fault_response = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_OT_FAULT_LIMIT:            /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmdev->pages[index].ot_fault_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_OT_FAULT_RESPONSE:         /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmdev->pages[index].ot_fault_response = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_OT_WARN_LIMIT:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmdev->pages[index].ot_warn_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_UT_WARN_LIMIT:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmdev->pages[index].ut_warn_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_UT_FAULT_LIMIT:            /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmdev->pages[index].ut_fault_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_UT_FAULT_RESPONSE:         /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmdev->pages[index].ut_fault_response = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VIN_OV_FAULT_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmdev->pages[index].vin_ov_fault_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VIN_OV_FAULT_RESPONSE:     /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmdev->pages[index].vin_ov_fault_response = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VIN_OV_WARN_LIMIT:         /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmdev->pages[index].vin_ov_warn_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VIN_UV_WARN_LIMIT:         /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmdev->pages[index].vin_uv_warn_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VIN_UV_FAULT_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmdev->pages[index].vin_uv_fault_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_VIN_UV_FAULT_RESPONSE:     /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VIN) {
+            pmdev->pages[index].vin_uv_fault_response = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_IIN_OC_FAULT_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IIN) {
+            pmdev->pages[index].iin_oc_fault_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_IIN_OC_FAULT_RESPONSE:     /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_IIN) {
+            pmdev->pages[index].iin_oc_fault_response = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_IIN_OC_WARN_LIMIT:         /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_IIN) {
+            pmdev->pages[index].iin_oc_warn_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_POUT_OP_FAULT_LIMIT:       /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].pout_op_fault_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_POUT_OP_FAULT_RESPONSE:    /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].pout_op_fault_response = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_POUT_OP_WARN_LIMIT:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].pout_op_warn_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_PIN_OP_WARN_LIMIT:         /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_PIN) {
+            pmdev->pages[index].pin_op_warn_limit = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_STATUS_BYTE:               /* R/W byte */
+        pmdev->pages[index].status_word = pmbus_receive8(pmdev);
+        break;
+
+    case PMBUS_STATUS_WORD:               /* R/W word */
+        pmdev->pages[index].status_word = pmbus_receive16(pmdev);
+        break;
+
+    case PMBUS_STATUS_VOUT:               /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
+            pmdev->pages[index].status_vout = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_STATUS_IOUT:               /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_IOUT) {
+            pmdev->pages[index].status_iout = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_STATUS_INPUT:              /* R/W byte */
+        pmdev->pages[index].status_input = pmbus_receive8(pmdev);
+        break;
+
+    case PMBUS_STATUS_TEMPERATURE:        /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_TEMPERATURE) {
+            pmdev->pages[index].status_temperature = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_STATUS_CML:                /* R/W byte */
+        pmdev->pages[index].status_cml = pmbus_receive8(pmdev);
+        break;
+
+    case PMBUS_STATUS_OTHER:              /* R/W byte */
+        pmdev->pages[index].status_other = pmbus_receive8(pmdev);
+        break;
+
+    case PMBUS_PAGE_PLUS_READ:            /* Block Read-only */
+    case PMBUS_CAPABILITY:                /* Read-Only byte */
+    case PMBUS_COEFFICIENTS:              /* Read-only block 5 bytes */
+    case PMBUS_READ_EIN:                  /* Read-Only block 5 bytes */
+    case PMBUS_READ_EOUT:                 /* Read-Only block 5 bytes */
+    case PMBUS_READ_VIN:                  /* Read-Only word */
+    case PMBUS_READ_IIN:                  /* Read-Only word */
+    case PMBUS_READ_VCAP:                 /* Read-Only word */
+    case PMBUS_READ_VOUT:                 /* Read-Only word */
+    case PMBUS_READ_IOUT:                 /* Read-Only word */
+    case PMBUS_READ_TEMPERATURE_1:        /* Read-Only word */
+    case PMBUS_READ_TEMPERATURE_2:        /* Read-Only word */
+    case PMBUS_READ_TEMPERATURE_3:        /* Read-Only word */
+    case PMBUS_READ_FAN_SPEED_1:          /* Read-Only word */
+    case PMBUS_READ_FAN_SPEED_2:          /* Read-Only word */
+    case PMBUS_READ_FAN_SPEED_3:          /* Read-Only word */
+    case PMBUS_READ_FAN_SPEED_4:          /* Read-Only word */
+    case PMBUS_READ_DUTY_CYCLE:           /* Read-Only word */
+    case PMBUS_READ_FREQUENCY:            /* Read-Only word */
+    case PMBUS_READ_POUT:                 /* Read-Only word */
+    case PMBUS_READ_PIN:                  /* Read-Only word */
+    case PMBUS_REVISION:                  /* Read-Only byte */
+    case PMBUS_APP_PROFILE_SUPPORT:       /* Read-Only block-read */
+    case PMBUS_MFR_VIN_MIN:               /* Read-Only word */
+    case PMBUS_MFR_VIN_MAX:               /* Read-Only word */
+    case PMBUS_MFR_IIN_MAX:               /* Read-Only word */
+    case PMBUS_MFR_PIN_MAX:               /* Read-Only word */
+    case PMBUS_MFR_VOUT_MIN:              /* Read-Only word */
+    case PMBUS_MFR_VOUT_MAX:              /* Read-Only word */
+    case PMBUS_MFR_IOUT_MAX:              /* Read-Only word */
+    case PMBUS_MFR_POUT_MAX:              /* Read-Only word */
+    case PMBUS_MFR_TAMBIENT_MAX:          /* Read-Only word */
+    case PMBUS_MFR_TAMBIENT_MIN:          /* Read-Only word */
+    case PMBUS_MFR_EFFICIENCY_LL:         /* Read-Only block 14 bytes */
+    case PMBUS_MFR_EFFICIENCY_HL:         /* Read-Only block 14 bytes */
+    case PMBUS_MFR_PIN_ACCURACY:          /* Read-Only byte */
+    case PMBUS_IC_DEVICE_ID:              /* Read-Only block-read */
+    case PMBUS_IC_DEVICE_REV:             /* Read-Only block-read */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: writing to read-only register 0x%02x\n",
+                      __func__, pmdev->code);
+        break;
+
+passthrough:
+    /* Unimplimented registers get passed to the device */
+    default:
+        if (pmdc->write_data) {
+            ret = pmdc->write_data(pmdev, buf, len);
+        }
+        break;
+    }
+    pmbus_check_limits(pmdev);
+    pmdev->in_buf_len = 0;
+    return ret;
+}
+
+int pmbus_page_config(PMBusDevice *pmdev, uint8_t index, uint64_t flags)
+{
+    if (!pmdev->pages) { /* allocate memory for pages on first use */
+        pmbus_pages_alloc(pmdev);
+    }
+
+    /* The 0xFF page is special for commands applying to all pages */
+    if (index == PB_ALL_PAGES) {
+        for (int i = 0; i < pmdev->num_pages; i++) {
+            pmdev->pages[i].page_flags = flags;
+        }
+        return 0;
+    }
+
+    if (index > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: index %u is out of range\n",
+                      __func__, index);
+        return -1;
+    }
+
+    pmdev->pages[index].page_flags = flags;
+
+    return 0;
+}
+
+static void pmbus_device_finalize(Object *obj)
+{
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+    g_free(pmdev->pages);
+}
+
+static void pmbus_device_class_init(ObjectClass *klass, void *data)
+{
+    SMBusDeviceClass *k = SMBUS_DEVICE_CLASS(klass);
+
+    k->quick_cmd = pmbus_quick_cmd;
+    k->write_data = pmbus_write_data;
+    k->receive_byte = pmbus_receive_byte;
+}
+
+static const TypeInfo pmbus_device_type_info = {
+    .name = TYPE_PMBUS_DEVICE,
+    .parent = TYPE_SMBUS_DEVICE,
+    .instance_size = sizeof(PMBusDevice),
+    .instance_finalize = pmbus_device_finalize,
+    .abstract = true,
+    .class_size = sizeof(PMBusDeviceClass),
+    .class_init = pmbus_device_class_init,
+};
+
+static void pmbus_device_register_types(void)
+{
+    type_register_static(&pmbus_device_type_info);
+}
+
+type_init(pmbus_device_register_types)
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
new file mode 100644
index 0000000000..5d36f91ec6
--- /dev/null
+++ b/include/hw/i2c/pmbus_device.h
@@ -0,0 +1,520 @@
+/*
+ * QEMU PMBus device emulation
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
+#ifndef HW_PMBUS_DEVICE_H
+#define HW_PMBUS_DEVICE_H
+
+#include "qemu/bitops.h"
+#include "hw/i2c/smbus_slave.h"
+
+enum pmbus_registers {
+    PMBUS_PAGE                      = 0x00, /* R/W byte */
+    PMBUS_OPERATION                 = 0x01, /* R/W byte */
+    PMBUS_ON_OFF_CONFIG             = 0x02, /* R/W byte */
+    PMBUS_CLEAR_FAULTS              = 0x03, /* Send Byte */
+    PMBUS_PHASE                     = 0x04, /* R/W byte */
+    PMBUS_PAGE_PLUS_WRITE           = 0x05, /* Block Write-only */
+    PMBUS_PAGE_PLUS_READ            = 0x06, /* Block Read-only */
+    PMBUS_WRITE_PROTECT             = 0x10, /* R/W byte */
+    PMBUS_STORE_DEFAULT_ALL         = 0x11, /* Send Byte */
+    PMBUS_RESTORE_DEFAULT_ALL       = 0x12, /* Send Byte */
+    PMBUS_STORE_DEFAULT_CODE        = 0x13, /* Write-only Byte */
+    PMBUS_RESTORE_DEFAULT_CODE      = 0x14, /* Write-only Byte */
+    PMBUS_STORE_USER_ALL            = 0x15, /* Send Byte */
+    PMBUS_RESTORE_USER_ALL          = 0x16, /* Send Byte */
+    PMBUS_STORE_USER_CODE           = 0x17, /* Write-only Byte */
+    PMBUS_RESTORE_USER_CODE         = 0x18, /* Write-only Byte */
+    PMBUS_CAPABILITY                = 0x19, /* Read-Only byte */
+    PMBUS_QUERY                     = 0x1A, /* Write-Only */
+    PMBUS_SMBALERT_MASK             = 0x1B, /* Block read, Word write */
+    PMBUS_VOUT_MODE                 = 0x20, /* R/W byte */
+    PMBUS_VOUT_COMMAND              = 0x21, /* R/W word */
+    PMBUS_VOUT_TRIM                 = 0x22, /* R/W word */
+    PMBUS_VOUT_CAL_OFFSET           = 0x23, /* R/W word */
+    PMBUS_VOUT_MAX                  = 0x24, /* R/W word */
+    PMBUS_VOUT_MARGIN_HIGH          = 0x25, /* R/W word */
+    PMBUS_VOUT_MARGIN_LOW           = 0x26, /* R/W word */
+    PMBUS_VOUT_TRANSITION_RATE      = 0x27, /* R/W word */
+    PMBUS_VOUT_DROOP                = 0x28, /* R/W word */
+    PMBUS_VOUT_SCALE_LOOP           = 0x29, /* R/W word */
+    PMBUS_VOUT_SCALE_MONITOR        = 0x2A, /* R/W word */
+    PMBUS_COEFFICIENTS              = 0x30, /* Read-only block 5 bytes */
+    PMBUS_POUT_MAX                  = 0x31, /* R/W word */
+    PMBUS_MAX_DUTY                  = 0x32, /* R/W word */
+    PMBUS_FREQUENCY_SWITCH          = 0x33, /* R/W word */
+    PMBUS_VIN_ON                    = 0x35, /* R/W word */
+    PMBUS_VIN_OFF                   = 0x36, /* R/W word */
+    PMBUS_INTERLEAVE                = 0x37, /* R/W word */
+    PMBUS_IOUT_CAL_GAIN             = 0x38, /* R/W word */
+    PMBUS_IOUT_CAL_OFFSET           = 0x39, /* R/W word */
+    PMBUS_FAN_CONFIG_1_2            = 0x3A, /* R/W byte */
+    PMBUS_FAN_COMMAND_1             = 0x3B, /* R/W word */
+    PMBUS_FAN_COMMAND_2             = 0x3C, /* R/W word */
+    PMBUS_FAN_CONFIG_3_4            = 0x3D, /* R/W byte */
+    PMBUS_FAN_COMMAND_3             = 0x3E, /* R/W word */
+    PMBUS_FAN_COMMAND_4             = 0x3F, /* R/W word */
+    PMBUS_VOUT_OV_FAULT_LIMIT       = 0x40, /* R/W word */
+    PMBUS_VOUT_OV_FAULT_RESPONSE    = 0x41, /* R/W byte */
+    PMBUS_VOUT_OV_WARN_LIMIT        = 0x42, /* R/W word */
+    PMBUS_VOUT_UV_WARN_LIMIT        = 0x43, /* R/W word */
+    PMBUS_VOUT_UV_FAULT_LIMIT       = 0x44, /* R/W word */
+    PMBUS_VOUT_UV_FAULT_RESPONSE    = 0x45, /* R/W byte */
+    PMBUS_IOUT_OC_FAULT_LIMIT       = 0x46, /* R/W word */
+    PMBUS_IOUT_OC_FAULT_RESPONSE    = 0x47, /* R/W byte */
+    PMBUS_IOUT_OC_LV_FAULT_LIMIT    = 0x48, /* R/W word */
+    PMBUS_IOUT_OC_LV_FAULT_RESPONSE = 0x49, /* R/W byte */
+    PMBUS_IOUT_OC_WARN_LIMIT        = 0x4A, /* R/W word */
+    PMBUS_IOUT_UC_FAULT_LIMIT       = 0x4B, /* R/W word */
+    PMBUS_IOUT_UC_FAULT_RESPONSE    = 0x4C, /* R/W byte */
+    PMBUS_OT_FAULT_LIMIT            = 0x4F, /* R/W word */
+    PMBUS_OT_FAULT_RESPONSE         = 0x50, /* R/W byte */
+    PMBUS_OT_WARN_LIMIT             = 0x51, /* R/W word */
+    PMBUS_UT_WARN_LIMIT             = 0x52, /* R/W word */
+    PMBUS_UT_FAULT_LIMIT            = 0x53, /* R/W word */
+    PMBUS_UT_FAULT_RESPONSE         = 0x54, /* R/W byte */
+    PMBUS_VIN_OV_FAULT_LIMIT        = 0x55, /* R/W word */
+    PMBUS_VIN_OV_FAULT_RESPONSE     = 0x56, /* R/W byte */
+    PMBUS_VIN_OV_WARN_LIMIT         = 0x57, /* R/W word */
+    PMBUS_VIN_UV_WARN_LIMIT         = 0x58, /* R/W word */
+    PMBUS_VIN_UV_FAULT_LIMIT        = 0x59, /* R/W word */
+    PMBUS_VIN_UV_FAULT_RESPONSE     = 0x5A, /* R/W byte */
+    PMBUS_IIN_OC_FAULT_LIMIT        = 0x5B, /* R/W word */
+    PMBUS_IIN_OC_FAULT_RESPONSE     = 0x5C, /* R/W byte */
+    PMBUS_IIN_OC_WARN_LIMIT         = 0x5D, /* R/W word */
+    PMBUS_POWER_GOOD_ON             = 0x5E, /* R/W word */
+    PMBUS_POWER_GOOD_OFF            = 0x5F, /* R/W word */
+    PMBUS_TON_DELAY                 = 0x60, /* R/W word */
+    PMBUS_TON_RISE                  = 0x61, /* R/W word */
+    PMBUS_TON_MAX_FAULT_LIMIT       = 0x62, /* R/W word */
+    PMBUS_TON_MAX_FAULT_RESPONSE    = 0x63, /* R/W byte */
+    PMBUS_TOFF_DELAY                = 0x64, /* R/W word */
+    PMBUS_TOFF_FALL                 = 0x65, /* R/W word */
+    PMBUS_TOFF_MAX_WARN_LIMIT       = 0x66, /* R/W word */
+    PMBUS_POUT_OP_FAULT_LIMIT       = 0x68, /* R/W word */
+    PMBUS_POUT_OP_FAULT_RESPONSE    = 0x69, /* R/W byte */
+    PMBUS_POUT_OP_WARN_LIMIT        = 0x6A, /* R/W word */
+    PMBUS_PIN_OP_WARN_LIMIT         = 0x6B, /* R/W word */
+    PMBUS_STATUS_BYTE               = 0x78, /* R/W byte */
+    PMBUS_STATUS_WORD               = 0x79, /* R/W word */
+    PMBUS_STATUS_VOUT               = 0x7A, /* R/W byte */
+    PMBUS_STATUS_IOUT               = 0x7B, /* R/W byte */
+    PMBUS_STATUS_INPUT              = 0x7C, /* R/W byte */
+    PMBUS_STATUS_TEMPERATURE        = 0x7D, /* R/W byte */
+    PMBUS_STATUS_CML                = 0x7E, /* R/W byte */
+    PMBUS_STATUS_OTHER              = 0x7F, /* R/W byte */
+    PMBUS_STATUS_MFR_SPECIFIC       = 0x80, /* R/W byte */
+    PMBUS_STATUS_FANS_1_2           = 0x81, /* R/W byte */
+    PMBUS_STATUS_FANS_3_4           = 0x82, /* R/W byte */
+    PMBUS_READ_EIN                  = 0x86, /* Read-Only block 5 bytes */
+    PMBUS_READ_EOUT                 = 0x87, /* Read-Only block 5 bytes */
+    PMBUS_READ_VIN                  = 0x88, /* Read-Only word */
+    PMBUS_READ_IIN                  = 0x89, /* Read-Only word */
+    PMBUS_READ_VCAP                 = 0x8A, /* Read-Only word */
+    PMBUS_READ_VOUT                 = 0x8B, /* Read-Only word */
+    PMBUS_READ_IOUT                 = 0x8C, /* Read-Only word */
+    PMBUS_READ_TEMPERATURE_1        = 0x8D, /* Read-Only word */
+    PMBUS_READ_TEMPERATURE_2        = 0x8E, /* Read-Only word */
+    PMBUS_READ_TEMPERATURE_3        = 0x8F, /* Read-Only word */
+    PMBUS_READ_FAN_SPEED_1          = 0x90, /* Read-Only word */
+    PMBUS_READ_FAN_SPEED_2          = 0x91, /* Read-Only word */
+    PMBUS_READ_FAN_SPEED_3          = 0x92, /* Read-Only word */
+    PMBUS_READ_FAN_SPEED_4          = 0x93, /* Read-Only word */
+    PMBUS_READ_DUTY_CYCLE           = 0x94, /* Read-Only word */
+    PMBUS_READ_FREQUENCY            = 0x95, /* Read-Only word */
+    PMBUS_READ_POUT                 = 0x96, /* Read-Only word */
+    PMBUS_READ_PIN                  = 0x97, /* Read-Only word */
+    PMBUS_REVISION                  = 0x98, /* Read-Only byte */
+    PMBUS_MFR_ID                    = 0x99, /* R/W block */
+    PMBUS_MFR_MODEL                 = 0x9A, /* R/W block */
+    PMBUS_MFR_REVISION              = 0x9B, /* R/W block */
+    PMBUS_MFR_LOCATION              = 0x9C, /* R/W block */
+    PMBUS_MFR_DATE                  = 0x9D, /* R/W block */
+    PMBUS_MFR_SERIAL                = 0x9E, /* R/W block */
+    PMBUS_APP_PROFILE_SUPPORT       = 0x9F, /* Read-Only block-read */
+    PMBUS_MFR_VIN_MIN               = 0xA0, /* Read-Only word */
+    PMBUS_MFR_VIN_MAX               = 0xA1, /* Read-Only word */
+    PMBUS_MFR_IIN_MAX               = 0xA2, /* Read-Only word */
+    PMBUS_MFR_PIN_MAX               = 0xA3, /* Read-Only word */
+    PMBUS_MFR_VOUT_MIN              = 0xA4, /* Read-Only word */
+    PMBUS_MFR_VOUT_MAX              = 0xA5, /* Read-Only word */
+    PMBUS_MFR_IOUT_MAX              = 0xA6, /* Read-Only word */
+    PMBUS_MFR_POUT_MAX              = 0xA7, /* Read-Only word */
+    PMBUS_MFR_TAMBIENT_MAX          = 0xA8, /* Read-Only word */
+    PMBUS_MFR_TAMBIENT_MIN          = 0xA9, /* Read-Only word */
+    PMBUS_MFR_EFFICIENCY_LL         = 0xAA, /* Read-Only block 14 bytes */
+    PMBUS_MFR_EFFICIENCY_HL         = 0xAB, /* Read-Only block 14 bytes */
+    PMBUS_MFR_PIN_ACCURACY          = 0xAC, /* Read-Only byte */
+    PMBUS_IC_DEVICE_ID              = 0xAD, /* Read-Only block-read */
+    PMBUS_IC_DEVICE_REV             = 0xAE, /* Read-Only block-read */
+    PMBUS_MFR_MAX_TEMP_1            = 0xC0, /* R/W word */
+    PMBUS_MFR_MAX_TEMP_2            = 0xC1, /* R/W word */
+    PMBUS_MFR_MAX_TEMP_3            = 0xC2, /* R/W word */
+};
+
+/* STATUS_WORD */
+#define PB_STATUS_VOUT           BIT(15)
+#define PB_STATUS_IOUT_POUT      BIT(14)
+#define PB_STATUS_INPUT          BIT(13)
+#define PB_STATUS_WORD_MFR       BIT(12)
+#define PB_STATUS_POWER_GOOD_N   BIT(11)
+#define PB_STATUS_FAN            BIT(10)
+#define PB_STATUS_OTHER          BIT(9)
+#define PB_STATUS_UNKNOWN        BIT(8)
+/* STATUS_BYTE */
+#define PB_STATUS_BUSY           BIT(7)
+#define PB_STATUS_OFF            BIT(6)
+#define PB_STATUS_VOUT_OV        BIT(5)
+#define PB_STATUS_IOUT_OC        BIT(4)
+#define PB_STATUS_VIN_UV         BIT(3)
+#define PB_STATUS_TEMPERATURE    BIT(2)
+#define PB_STATUS_CML            BIT(1)
+#define PB_STATUS_NONE_ABOVE     BIT(0)
+
+/* STATUS_VOUT */
+#define PB_STATUS_VOUT_OV_FAULT         BIT(7) /* Output Overvoltage Fault */
+#define PB_STATUS_VOUT_OV_WARN          BIT(6) /* Output Overvoltage Warning */
+#define PB_STATUS_VOUT_UV_WARN          BIT(5) /* Output Undervoltage Warning */
+#define PB_STATUS_VOUT_UV_FAULT         BIT(4) /* Output Undervoltage Fault */
+#define PB_STATUS_VOUT_MAX              BIT(3)
+#define PB_STATUS_VOUT_TON_MAX_FAULT    BIT(2)
+#define PB_STATUS_VOUT_TOFF_MAX_WARN    BIT(1)
+
+/* STATUS_IOUT */
+#define PB_STATUS_IOUT_OC_FAULT    BIT(7) /* Output Overcurrent Fault */
+#define PB_STATUS_IOUT_OC_LV_FAULT BIT(6) /* Output OC And Low Voltage Fault */
+#define PB_STATUS_IOUT_OC_WARN     BIT(5) /* Output Overcurrent Warning */
+#define PB_STATUS_IOUT_UC_FAULT    BIT(4) /* Output Undercurrent Fault */
+#define PB_STATUS_CURR_SHARE       BIT(3) /* Current Share Fault */
+#define PB_STATUS_PWR_LIM_MODE     BIT(2) /* In Power Limiting Mode */
+#define PB_STATUS_POUT_OP_FAULT    BIT(1) /* Output Overpower Fault */
+#define PB_STATUS_POUT_OP_WARN     BIT(0) /* Output Overpower Warning */
+
+/* STATUS_INPUT */
+#define PB_STATUS_INPUT_VIN_OV_FAULT    BIT(7) /* Input Overvoltage Fault */
+#define PB_STATUS_INPUT_VIN_OV_WARN     BIT(6) /* Input Overvoltage Warning */
+#define PB_STATUS_INPUT_VIN_UV_WARN     BIT(5) /* Input Undervoltage Warning */
+#define PB_STATUS_INPUT_VIN_UV_FAULT    BIT(4) /* Input Undervoltage Fault */
+#define PB_STATUS_INPUT_IIN_OC_FAULT    BIT(2) /* Input Overcurrent Fault */
+#define PB_STATUS_INPUT_IIN_OC_WARN     BIT(1) /* Input Overcurrent Warning */
+#define PB_STATUS_INPUT_PIN_OP_WARN     BIT(0) /* Input Overpower Warning */
+
+/* STATUS_TEMPERATURE */
+#define PB_STATUS_OT_FAULT              BIT(7) /* Overtemperature Fault */
+#define PB_STATUS_OT_WARN               BIT(6) /* Overtemperature Warning */
+#define PB_STATUS_UT_WARN               BIT(5) /* Undertemperature Warning */
+#define PB_STATUS_UT_FAULT              BIT(4) /* Undertemperature Fault */
+
+/* STATUS_CML */
+#define PB_CML_FAULT_INVALID_CMD     BIT(7) /* Invalid/Unsupported Command */
+#define PB_CML_FAULT_INVALID_DATA    BIT(6) /* Invalid/Unsupported Data  */
+#define PB_CML_FAULT_PEC             BIT(5) /* Packet Error Check Failed */
+#define PB_CML_FAULT_MEMORY          BIT(4) /* Memory Fault Detected */
+#define PB_CML_FAULT_PROCESSOR       BIT(3) /* Processor Fault Detected */
+#define PB_CML_FAULT_OTHER_COMM      BIT(1) /* Other communication fault */
+#define PB_CML_FAULT_OTHER_MEM_LOGIC BIT(0) /* Other Memory Or Logic Fault */
+
+/* OPERATION*/
+#define PB_OP_ON                BIT(7) /* PSU is switched on */
+#define PB_OP_MARGIN_HIGH       BIT(5) /* PSU vout is set to margin high */
+#define PB_OP_MARGIN_LOW        BIT(4) /* PSU vout is set to margin low */
+
+/* PAGES */
+#define PB_MAX_PAGES            0x1F
+#define PB_ALL_PAGES            0xFF
+
+#define TYPE_PMBUS_DEVICE "pmbus-device"
+OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
+                    PMBUS_DEVICE)
+
+/* flags */
+#define PB_HAS_COEFFICIENTS        BIT(9)
+#define PB_HAS_VIN                 BIT(10)
+#define PB_HAS_VOUT                BIT(11)
+#define PB_HAS_VOUT_MARGIN         BIT(12)
+#define PB_HAS_VIN_RATING          BIT(13)
+#define PB_HAS_VOUT_RATING         BIT(14)
+#define PB_HAS_VOUT_MODE           BIT(15)
+#define PB_HAS_IOUT                BIT(21)
+#define PB_HAS_IIN                 BIT(22)
+#define PB_HAS_IOUT_RATING         BIT(23)
+#define PB_HAS_IIN_RATING          BIT(24)
+#define PB_HAS_IOUT_GAIN           BIT(25)
+#define PB_HAS_POUT                BIT(30)
+#define PB_HAS_PIN                 BIT(31)
+#define PB_HAS_EIN                 BIT(32)
+#define PB_HAS_EOUT                BIT(33)
+#define PB_HAS_POUT_RATING         BIT(34)
+#define PB_HAS_PIN_RATING          BIT(35)
+#define PB_HAS_TEMPERATURE         BIT(40)
+#define PB_HAS_TEMP2               BIT(41)
+#define PB_HAS_TEMP3               BIT(42)
+#define PB_HAS_TEMP_RATING         BIT(43)
+#define PB_HAS_MFR_INFO            BIT(50)
+
+struct PMBusDeviceClass {
+    SMBusDeviceClass parent_class;
+    uint8_t device_num_pages;
+
+    /**
+     * Implement quick_cmd, receive byte, and write_data to support non-standard
+     * PMBus functionality
+     */
+    void (*quick_cmd)(PMBusDevice *dev, uint8_t read);
+    int (*write_data)(PMBusDevice *dev, const uint8_t *buf, uint8_t len);
+    uint8_t (*receive_byte)(PMBusDevice *dev);
+};
+
+/*
+ * According to the spec, each page may offer the full range of PMBus commands
+ * available for each output or non-PMBus device.
+ * Therefore, we can't assume that any registers will always be the same across
+ * all pages.
+ * The page 0xFF is intended for writes to all pages
+ */
+typedef struct PMBusPage {
+    uint64_t page_flags;
+
+    uint8_t page;                      /* R/W byte */
+    uint8_t operation;                 /* R/W byte */
+    uint8_t on_off_config;             /* R/W byte */
+    uint8_t write_protect;             /* R/W byte */
+    uint8_t phase;                     /* R/W byte */
+    uint8_t vout_mode;                 /* R/W byte */
+    uint16_t vout_command;             /* R/W word */
+    uint16_t vout_trim;                /* R/W word */
+    uint16_t vout_cal_offset;          /* R/W word */
+    uint16_t vout_max;                 /* R/W word */
+    uint16_t vout_margin_high;         /* R/W word */
+    uint16_t vout_margin_low;          /* R/W word */
+    uint16_t vout_transition_rate;     /* R/W word */
+    uint16_t vout_droop;               /* R/W word */
+    uint16_t vout_scale_loop;          /* R/W word */
+    uint16_t vout_scale_monitor;       /* R/W word */
+    uint8_t coefficients[5];           /* Read-only block 5 bytes */
+    uint16_t pout_max;                 /* R/W word */
+    uint16_t max_duty;                 /* R/W word */
+    uint16_t frequency_switch;         /* R/W word */
+    uint16_t vin_on;                   /* R/W word */
+    uint16_t vin_off;                  /* R/W word */
+    uint16_t iout_cal_gain;            /* R/W word */
+    uint16_t iout_cal_offset;          /* R/W word */
+    uint8_t fan_config_1_2;            /* R/W byte */
+    uint16_t fan_command_1;            /* R/W word */
+    uint16_t fan_command_2;            /* R/W word */
+    uint8_t fan_config_3_4;            /* R/W byte */
+    uint16_t fan_command_3;            /* R/W word */
+    uint16_t fan_command_4;            /* R/W word */
+    uint16_t vout_ov_fault_limit;      /* R/W word */
+    uint8_t vout_ov_fault_response;    /* R/W byte */
+    uint16_t vout_ov_warn_limit;       /* R/W word */
+    uint16_t vout_uv_warn_limit;       /* R/W word */
+    uint16_t vout_uv_fault_limit;      /* R/W word */
+    uint8_t vout_uv_fault_response;    /* R/W byte */
+    uint16_t iout_oc_fault_limit;      /* R/W word */
+    uint8_t iout_oc_fault_response;    /* R/W byte */
+    uint16_t iout_oc_lv_fault_limit;   /* R/W word */
+    uint8_t iout_oc_lv_fault_response; /* R/W byte */
+    uint16_t iout_oc_warn_limit;       /* R/W word */
+    uint16_t iout_uc_fault_limit;      /* R/W word */
+    uint8_t iout_uc_fault_response;    /* R/W byte */
+    uint16_t ot_fault_limit;           /* R/W word */
+    uint8_t ot_fault_response;         /* R/W byte */
+    uint16_t ot_warn_limit;            /* R/W word */
+    uint16_t ut_warn_limit;            /* R/W word */
+    uint16_t ut_fault_limit;           /* R/W word */
+    uint8_t ut_fault_response;         /* R/W byte */
+    uint16_t vin_ov_fault_limit;       /* R/W word */
+    uint8_t vin_ov_fault_response;     /* R/W byte */
+    uint16_t vin_ov_warn_limit;        /* R/W word */
+    uint16_t vin_uv_warn_limit;        /* R/W word */
+    uint16_t vin_uv_fault_limit;       /* R/W word */
+    uint8_t vin_uv_fault_response;     /* R/W byte */
+    uint16_t iin_oc_fault_limit;       /* R/W word */
+    uint8_t iin_oc_fault_response;     /* R/W byte */
+    uint16_t iin_oc_warn_limit;        /* R/W word */
+    uint16_t power_good_on;            /* R/W word */
+    uint16_t power_good_off;           /* R/W word */
+    uint16_t ton_delay;                /* R/W word */
+    uint16_t ton_rise;                 /* R/W word */
+    uint16_t ton_max_fault_limit;      /* R/W word */
+    uint8_t ton_max_fault_response;    /* R/W byte */
+    uint16_t toff_delay;               /* R/W word */
+    uint16_t toff_fall;                /* R/W word */
+    uint16_t toff_max_warn_limit;      /* R/W word */
+    uint16_t pout_op_fault_limit;      /* R/W word */
+    uint8_t pout_op_fault_response;    /* R/W byte */
+    uint16_t pout_op_warn_limit;       /* R/W word */
+    uint16_t pin_op_warn_limit;        /* R/W word */
+    uint16_t status_word;              /* R/W word */
+    uint8_t status_vout;               /* R/W byte */
+    uint8_t status_iout;               /* R/W byte */
+    uint8_t status_input;              /* R/W byte */
+    uint8_t status_temperature;        /* R/W byte */
+    uint8_t status_cml;                /* R/W byte */
+    uint8_t status_other;              /* R/W byte */
+    uint8_t status_mfr_specific;       /* R/W byte */
+    uint8_t status_fans_1_2;           /* R/W byte */
+    uint8_t status_fans_3_4;           /* R/W byte */
+    uint8_t read_ein[5];               /* Read-Only block 5 bytes */
+    uint8_t read_eout[5];              /* Read-Only block 5 bytes */
+    uint16_t read_vin;                 /* Read-Only word */
+    uint16_t read_iin;                 /* Read-Only word */
+    uint16_t read_vcap;                /* Read-Only word */
+    uint16_t read_vout;                /* Read-Only word */
+    uint16_t read_iout;                /* Read-Only word */
+    uint16_t read_temperature_1;       /* Read-Only word */
+    uint16_t read_temperature_2;       /* Read-Only word */
+    uint16_t read_temperature_3;       /* Read-Only word */
+    uint16_t read_fan_speed_1;         /* Read-Only word */
+    uint16_t read_fan_speed_2;         /* Read-Only word */
+    uint16_t read_fan_speed_3;         /* Read-Only word */
+    uint16_t read_fan_speed_4;         /* Read-Only word */
+    uint16_t read_duty_cycle;          /* Read-Only word */
+    uint16_t read_frequency;           /* Read-Only word */
+    uint16_t read_pout;                /* Read-Only word */
+    uint16_t read_pin;                 /* Read-Only word */
+    uint8_t revision;                  /* Read-Only byte */
+    const char *mfr_id;                /* R/W block */
+    const char *mfr_model;             /* R/W block */
+    const char *mfr_revision;          /* R/W block */
+    const char *mfr_location;          /* R/W block */
+    const char *mfr_date;              /* R/W block */
+    const char *mfr_serial;            /* R/W block */
+    const char *app_profile_support;   /* Read-Only block-read */
+    uint16_t mfr_vin_min;              /* Read-Only word */
+    uint16_t mfr_vin_max;              /* Read-Only word */
+    uint16_t mfr_iin_max;              /* Read-Only word */
+    uint16_t mfr_pin_max;              /* Read-Only word */
+    uint16_t mfr_vout_min;             /* Read-Only word */
+    uint16_t mfr_vout_max;             /* Read-Only word */
+    uint16_t mfr_iout_max;             /* Read-Only word */
+    uint16_t mfr_pout_max;             /* Read-Only word */
+    uint16_t mfr_tambient_max;         /* Read-Only word */
+    uint16_t mfr_tambient_min;         /* Read-Only word */
+    uint8_t mfr_efficiency_ll[14];     /* Read-Only block 14 bytes */
+    uint8_t mfr_efficiency_hl[14];     /* Read-Only block 14 bytes */
+    uint8_t mfr_pin_accuracy;          /* Read-Only byte */
+    uint16_t mfr_max_temp_1;           /* R/W word */
+    uint16_t mfr_max_temp_2;           /* R/W word */
+    uint16_t mfr_max_temp_3;           /* R/W word */
+} PMBusPage;
+
+/* State */
+struct PMBusDevice {
+    SMBusDevice smb;
+
+    uint8_t num_pages;
+    uint8_t code;
+    uint8_t page;
+
+    /*
+     * PMBus registers are stored in a PMBusPage structure allocated by
+     * calling pmbus_pages_alloc()
+     */
+    PMBusPage *pages;
+    uint8_t capability;
+
+
+    int32_t in_buf_len;
+    uint8_t *in_buf;
+    int32_t out_buf_len;
+    uint8_t out_buf[SMBUS_DATA_MAX_LEN];
+};
+
+typedef struct PMBusBlock {
+    uint8_t *buf;
+    uint8_t len;
+} PMBusBlock;
+
+/**
+ * Direct mode coefficients
+ * @var m - mantissa
+ * @var b - offset
+ * @var R - exponent
+ */
+typedef struct PMBusCoefficients {
+    int32_t m;     /* mantissa */
+    int64_t b;     /* offset */
+    int32_t R;     /* exponent */
+} PMBusCoefficients;
+
+/**
+ * Convert sensor values to direct mode format
+ *
+ * Y = (m * x - b) * 10^R
+ *
+ * @return uint32_t
+ */
+uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value);
+
+/**
+ * Convert direct mode formatted data into sensor reading
+ *
+ * X = (Y * 10^-R - b) / m
+ *
+ * @return uint32_t
+ */
+uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value);
+
+/**
+ * @brief Send a block of data over PMBus
+ * Assumes that the bytes in the block are already ordered correctly,
+ * also assumes the length has been prepended to the block if necessary
+ *     | low_byte | ... | high_byte |
+ * @param pmdev - maintains state of the PMBus device
+ * @param data - byte array to be sent by device
+ * @param len - number
+ */
+void pmbus_send_block(PMBusDevice *state, PMBusBlock block);
+void pmbus_send8(PMBusDevice *state, uint8_t data);
+void pmbus_send16(PMBusDevice *state, uint16_t data);
+void pmbus_send32(PMBusDevice *state, uint32_t data);
+void pmbus_send64(PMBusDevice *state, uint64_t data);
+
+/**
+ * @brief Send a string over PMBus with length prepended.
+ * Length is calculated using str_len()
+ */
+void pmbus_send_string(PMBusDevice *state, const char *data);
+
+/**
+ * @brief Receive data over PMBus
+ * These methods help track how much data is being received over PMBus
+ * Log to GUEST_ERROR if too much or too little is sent.
+ */
+uint8_t pmbus_receive8(PMBusDevice *pmdev);
+uint16_t pmbus_receive16(PMBusDevice *pmdev);
+uint32_t pmbus_receive32(PMBusDevice *pmdev);
+uint64_t pmbus_receive64(PMBusDevice *pmdev);
+PMBusBlock pmbus_receive_block(PMBusDevice *pmdev);
+
+/**
+ * PMBus page config must be called before any page is first used.
+ * It will allocate memory for all the pages if needed.
+ * Passed in flags overwrite existing flags if any.
+ * @param page_index the page to which the flags are applied, setting page_index
+ * to 0xFF applies the passed in flags to all pages.
+ * @param flags
+ */
+int pmbus_page_config(PMBusDevice *pmdev, uint8_t page_index, uint64_t flags);
+
+/**
+ * Update the status registers when sensor values change.
+ * Useful if modifying sensors through qmp, this way status registers get
+ * updated
+ */
+void pmbus_check_limits(PMBusDevice *pmdev);
+#endif
-- 
2.31.1.527.g47e6f16901-goog


