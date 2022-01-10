Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5F7489EB6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 18:58:58 +0100 (CET)
Received: from localhost ([::1]:58676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ywb-00061d-E5
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 12:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp5-0007HV-SI
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:11 -0500
Received: from [2a00:1450:4864:20::52b] (port=35776
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp4-00065M-3d
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:11 -0500
Received: by mail-ed1-x52b.google.com with SMTP id q25so48134126edb.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s37pAm4HQOAZRwNJTmM9aAqFUYvQliPZCH6R3Hng4k4=;
 b=JJd7Q7tDyTeC6SoIHTKmKWyPLO09P4Y4qmBs2xP5HPajMskS8tPoYxa1yap99gEKYj
 RiJ6jlltUKDer6Xe9prfgsnMxOhXMIWQZ1wiZCNSHRNg8v6RaRMgDEtCFMSUEvcoxZyA
 sYoIo14oBihOmjURfYi+1ZRM5LgDh6iOIHqVwgHdXDwtBi7F4R7RnVJOP/U1G/cZgQpr
 ziy5htp8DvZh6Pf8OaB1HO17DnHDFZom25aGqUFR2xEanOBaD5L3JLbHZW95tYq8KRgF
 QJh+YLAQMKJdDxkBhNAh/eGXQh6tgU76h41J7WI09AT/ILyWg1rd25Fb9tw8nhPSK4gs
 sUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s37pAm4HQOAZRwNJTmM9aAqFUYvQliPZCH6R3Hng4k4=;
 b=STN+58BxNY6q+KCTriBK3aInj7qn7DUcEtPgYV6unO856cLXXc9VcF/ppeR2PY5gbv
 KZIo22e1HtoVXTRNq1OJ1ZyMRV/3Ikah+e6OG15L7Q5E/hfW3ilHxl2jzyj3+aZO4+Y2
 aivfBUdToxllVKRKeM1wlnrWZm6BffXoLFGtGXESVAEfSUCqFbS0todeaD/Xz7TKdrIR
 0FdQ0AOWrne6wta6JlIvJrvgLyStqYb7X3JQ5/i/ipww4lIcDE9cX+L2y2HnvIjPuWlt
 RueDQDIZ4F9+Z6u77dZZeYOVyKTWIauTzwiN72CiQ/wlE+kaqHWJKQSGdmT3sx5b9voo
 nfnQ==
X-Gm-Message-State: AOAM531pQDt/Jr7dbGBx+4nVkUGeqcxD6W5h2O+tOWXammoyDwdIw/oy
 qQZ7/XmYqKwmTCy9TAvJ9hFokg==
X-Google-Smtp-Source: ABdhPJzDTisZ0YUsIFBExrMqm4hEjWYXVFZWh+ILYlCvG4PuHT4A/riDLCU0uuQC0Vk6zL8T5C/R2g==
X-Received: by 2002:a17:907:2d0e:: with SMTP id
 gs14mr674532ejc.472.1641837068666; 
 Mon, 10 Jan 2022 09:51:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a1sm3828963edu.17.2022.01.10.09.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:51:06 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DE8B1FFBA;
 Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/6] hw/arm: add boilerplate for machines based on the
 RP2040
Date: Mon, 10 Jan 2022 17:51:00 +0000
Message-Id: <20220110175104.2908956-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110175104.2908956-1-alex.bennee@linaro.org>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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

Currently we are only targeting the official RaspberryPi Pico although
I suspect most RP2040 based boards will look broadly the same.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configs/devices/arm-softmmu/default.mak |  1 +
 hw/arm/raspi_pico.c                     | 77 +++++++++++++++++++++++++
 hw/arm/Kconfig                          |  3 +
 hw/arm/meson.build                      |  1 +
 4 files changed, 82 insertions(+)
 create mode 100644 hw/arm/raspi_pico.c

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index dce1c39aad..7322213127 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -32,6 +32,7 @@ CONFIG_NETDUINO2=y
 CONFIG_NETDUINOPLUS2=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
+CONFIG_RASPI_PICO=y
 CONFIG_RP2040=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
diff --git a/hw/arm/raspi_pico.c b/hw/arm/raspi_pico.c
new file mode 100644
index 0000000000..9826f4d608
--- /dev/null
+++ b/hw/arm/raspi_pico.c
@@ -0,0 +1,77 @@
+/*
+ * Raspberry Pi Pico emulation
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "hw/arm/rp2040.h"
+#include "qemu/error-report.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "hw/arm/boot.h"
+#include "qom/object.h"
+
+struct PiPicoMachineState {
+    /*< private >*/
+    MachineState parent_obj;
+    /*< public >*/
+    RP2040State soc;
+};
+typedef struct PiPicoMachineState PiPicoMachineState;
+
+struct PiPicoMachineClass {
+    /*< private >*/
+    MachineClass parent_obj;
+    /*< public >*/
+};
+
+typedef struct PiPicoMachineClass PiPicoMachineClass;
+
+#define TYPE_PIPICO_MACHINE       MACHINE_TYPE_NAME("raspi-pico")
+DECLARE_OBJ_CHECKERS(PiPicoMachineState, PiPicoMachineClass,
+                     PIPICO_MACHINE, TYPE_PIPICO_MACHINE)
+
+
+static void pipico_machine_init(MachineState *machine)
+{
+    PiPicoMachineState *s = PIPICO_MACHINE(machine);
+
+    /* Setup the SOC */
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RP2040);
+    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
+}
+
+static void pipico_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = g_strdup_printf("Raspberry Pi Pico");
+    mc->init = pipico_machine_init;
+    mc->block_default_type = IF_PFLASH;
+    mc->no_parallel = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->no_sdcard = 1;
+    mc->min_cpus = 2;
+    mc->default_cpus = 2;
+    mc->max_cpus = 2;
+};
+
+
+static const TypeInfo pipico_machine_types[] = {
+    {
+        .name           = TYPE_PIPICO_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(PiPicoMachineState),
+        .class_size     = sizeof(PiPicoMachineClass),
+        .class_init     = pipico_machine_class_init,
+    }
+};
+
+DEFINE_TYPES(pipico_machine_types)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 1c5150c180..288a03f428 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -336,6 +336,9 @@ config RASPI
     select SDHCI
     select USB_DWC2
 
+config RASPI_PICO
+    bool
+
 config STM32F100_SOC
     bool
     select ARM_V7M
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 9f1b040c57..4913cd1a50 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -41,6 +41,7 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubi
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_RP2040', if_true: files('rp2040.c'))
+arm_ss.add(when: 'CONFIG_RASPI_PICO', if_true: files('raspi_pico.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
-- 
2.30.2


