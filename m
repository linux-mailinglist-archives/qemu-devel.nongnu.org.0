Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFAF489EAB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 18:55:00 +0100 (CET)
Received: from localhost ([::1]:51352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ysk-000113-Oz
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 12:54:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp5-0007GH-0S
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:11 -0500
Received: from [2a00:1450:4864:20::52e] (port=34445
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp2-00064w-8K
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:10 -0500
Received: by mail-ed1-x52e.google.com with SMTP id u25so56803601edf.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 09:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aPlRWwajZty+gYtXe8Pd0Kpsw2MjBegJ1SWvF23bN6c=;
 b=CN0E9jiHXQuhS4PXifguVJu8uLzrxw2a2n+/UfM1sjd7LLENcE0t+CAQnjw+aruWw0
 CbblcLlAb/n8cVvsAtyiSkxlSh3rF1K8C8XKke5dJ70LzKfKCMvhiZz+adrADeM+LV/9
 TVvMGSPuTolVl7+omOeh5CIrbnZ3OVb18M+FhDMQjLh29ULReEHx8PpKqvD9DvffoUoj
 QQQl0PJ48RhqRU+Df6tUadXMBQMzFc8EPd7CPc9Qp3PtY+rTIh5rp4eHiqQ4JHhGbYB5
 nwTrIczbMAILOgttznXEwIyYVRrlKQzJGWek18N/kCNOKyqWd4iUbOgtYuXh4mtTzsj2
 9+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aPlRWwajZty+gYtXe8Pd0Kpsw2MjBegJ1SWvF23bN6c=;
 b=YpK6LNB8r91xJ2gaeVCKvzQ7nWOrpIFgfk9Pg48dJK4i+jYePH0iYqUL8J9p5f/L1Y
 cwcyzs959pgJHXF/kuxylw22LDrF7MvSSIEyDm5KxM4GJeGr3HMcKhWigVQp6O57yE2B
 4DVDmzirzffjO9m+pwbrpvQfF8DYDR8B3DCOp2qh9BdVrTrQ+CaHNPTqqaDDGTK0hgFt
 zY1JLrTDPLgAkJ6tm0Iz5lcKQbB63Lr8m9X0JfY6QRWQgoUh3zPwenNGM2aHz2w3wTKX
 HMVKVkOMzhN5G0c5DwkUjXLjQb40WJqnJLzcKSDujjI6eYQC0YSeJU9gCgM1PL4xr1cE
 npWA==
X-Gm-Message-State: AOAM531cbGAduBXVcuLTzGhCpHA4izURNjIyjkabx1D4Lrr08FG4MAs1
 6okwWGdYb61aVzvWF/yiMO6ZQA==
X-Google-Smtp-Source: ABdhPJy91AruuwRoUyUg2t9G/malvQWopSSJot1YGD7HySE7H+5GGvnPtdaSsQvipaMbQnqpOYYY0g==
X-Received: by 2002:a17:907:d07:: with SMTP id
 gn7mr661622ejc.553.1641837066763; 
 Mon, 10 Jan 2022 09:51:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gn8sm2676578ejc.23.2022.01.10.09.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:51:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6044A1FFB8;
 Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  1/6] hw/arm: arm initial boilerplate for RP2040 SoC
Date: Mon, 10 Jan 2022 17:50:59 +0000
Message-Id: <20220110175104.2908956-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110175104.2908956-1-alex.bennee@linaro.org>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configs/devices/arm-softmmu/default.mak |  1 +
 include/hw/arm/rp2040.h                 | 32 ++++++++++
 hw/arm/rp2040.c                         | 79 +++++++++++++++++++++++++
 hw/arm/Kconfig                          |  3 +
 hw/arm/meson.build                      |  1 +
 5 files changed, 116 insertions(+)
 create mode 100644 include/hw/arm/rp2040.h
 create mode 100644 hw/arm/rp2040.c

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 6985a25377..dce1c39aad 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -32,6 +32,7 @@ CONFIG_NETDUINO2=y
 CONFIG_NETDUINOPLUS2=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
+CONFIG_RP2040=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
diff --git a/include/hw/arm/rp2040.h b/include/hw/arm/rp2040.h
new file mode 100644
index 0000000000..6bf4a4e57e
--- /dev/null
+++ b/include/hw/arm/rp2040.h
@@ -0,0 +1,32 @@
+/*
+ * RP2040 SoC Emulation
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _RP2040_H_
+#define _RP2040_H_
+
+#include "target/arm/cpu.h"
+#include "hw/arm/armv7m.h"
+#include "qom/object.h"
+
+#define TYPE_RP2040 "rp2040"
+OBJECT_DECLARE_TYPE(RP2040State, RP2040Class, RP2040)
+
+#define RP2040_NCPUS 2
+
+struct RP2040State {
+    /*< private >*/
+    DeviceState parent_obj;
+    /*< public >*/
+
+    ARMv7MState armv7m[RP2040_NCPUS];
+
+    MemoryRegion container;
+};
+
+
+#endif /* _RP2040_H_ */
diff --git a/hw/arm/rp2040.c b/hw/arm/rp2040.c
new file mode 100644
index 0000000000..2feedc0da8
--- /dev/null
+++ b/hw/arm/rp2040.c
@@ -0,0 +1,79 @@
+/*
+ * RP2040 SoC Emulation
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "hw/arm/armv7m.h"
+#include "hw/arm/rp2040.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
+
+typedef struct RP2040Class {
+    /*< private >*/
+    DeviceClass parent_class;
+    /*< public >*/
+    const char *name;
+    const char *cpu_type;
+} RP2040Class;
+
+#define RP2040_CLASS(klass) \
+    OBJECT_CLASS_CHECK(RP2040Class, (klass), TYPE_RP2040)
+#define RP2040_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(RP2040Class, (obj), TYPE_RP2040)
+
+static void rp2040_init(Object *obj)
+{
+    RP2040State *s = RP2040(obj);
+    int n;
+
+    for (n = 0; n < RP2040_NCPUS; n++) {
+        g_autofree char *name = g_strdup_printf("cpu[%d]", n);
+        object_initialize_child(obj, name, &s->armv7m[n], TYPE_ARMV7M);
+        qdev_prop_set_string(DEVICE(&s->armv7m[n]), "cpu-type",
+                             ARM_CPU_TYPE_NAME("cortex-m0"));
+    }
+}
+
+static void rp2040_realize(DeviceState *dev, Error **errp)
+{
+    RP2040State *s = RP2040(dev);
+    Object *obj = OBJECT(dev);
+    int n;
+
+    for (n = 0; n < RP2040_NCPUS; n++) {
+        Object *cpuobj = OBJECT(&s->armv7m[n]);
+        if (!sysbus_realize(SYS_BUS_DEVICE(cpuobj), errp)) {
+            return;
+        }
+    }
+}
+
+static void rp2040_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    RP2040Class *bc = RP2040_CLASS(oc);
+
+    bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m0");
+    dc->realize = rp2040_realize;
+    /* any props? */
+};
+
+static const TypeInfo rp2040_types[] = {
+    {
+        .name           = TYPE_RP2040,
+        /* .parent         = TYPE_SYS_BUS_DEVICE, */
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(RP2040State),
+        .instance_init  = rp2040_init,
+        .class_size     = sizeof(RP2040Class),
+        .class_init     = rp2040_class_init,
+    }
+};
+
+DEFINE_TYPES(rp2040_types)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e652590943..1c5150c180 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -203,6 +203,9 @@ config REALVIEW
     select DS1338 # I2C RTC+NVRAM
     select USB_OHCI
 
+config RP2040
+    bool
+
 config SBSA_REF
     bool
     imply PCI_DEVICES
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 721a8eb8be..9f1b040c57 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -40,6 +40,7 @@ arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
+arm_ss.add(when: 'CONFIG_RP2040', if_true: files('rp2040.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
-- 
2.30.2


