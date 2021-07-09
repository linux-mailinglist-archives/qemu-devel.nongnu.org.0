Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26873C2757
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:12:38 +0200 (CEST)
Received: from localhost ([::1]:56622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1t7F-0004KN-BT
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4u-0001PN-M9
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:12 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4q-0000si-3w
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:11 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f17so12842032wrt.6
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ygi3D826J101WsOE6G4t2D8GAHPSSbKcuMLxJm7wYDM=;
 b=bcDFMSysOerKYckz0QhkdTHhlkuUvDwpx/ym4xLL2qk+xc1E2kTWRzU2wXFSky88/F
 N1D7WOVyvUK8/JI/HG3YRo3+1g3lTockx8+syV7sUbwsm5oXl5h7yZQuAJfWNjSaYFcu
 kpOgx7I9nL12f+9GBr9WltCRnbVctSW+EwgFuju8p8RARZzCWeVrjRlpiXB0a0pRq82L
 xkE5NTbtx4UJtipo9daiKkLLoOx/JagfGIZm0GGw0yzyw/qhDljWHBivS6PHYfE5eION
 kHlOnmFXPfPGiPicCIN6aHfH42Tr54jBHBUCWm4NElD5SQtOOe3vjQWFQtPS0O5yKzzy
 XYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ygi3D826J101WsOE6G4t2D8GAHPSSbKcuMLxJm7wYDM=;
 b=D9WxhjNk3mDB4tY+EKHTRBeQzjuKcNUePpVLCYeAeqSnfsb/62Ce/B6jQWfJT46PDO
 DFX0cf2YADKVl84KcXCXthyxd0QfruyIAn+wluJWMHWC6LiZ5HNNJYTMuIBKkBGglKc1
 BCtIunLd5vcs3SnkVoeh7h9wtS9ttGYCWo8FeQibz5QzC4fz8/koyZSp+YCn+5Y9qdFE
 kDcje1aDJ/B3dkELGJYV4ZiK6RAbcim0NpOnNfJV5oKgVBEHJaQ8GoueyBTt98WtItlc
 7TevwIuNY2WV5WRbp+3sveffq0maIBt3LW8IVJihA93PuaD7vACI8J80Lsmf9be5Njah
 jUQg==
X-Gm-Message-State: AOAM532xQyRRLlzFi063h540Gb6U76ns349xNSP4wnUvd9sT10BaL4Im
 nQmD2wwdC7QICnqQPml/q28yRJKV/oWrocRU
X-Google-Smtp-Source: ABdhPJyth3FeACeW1Ii+4VYEMGe4XwBwCLHuF9N+brOs581FwZSMOSSXhJ3601R1dQY355mSjCQLrg==
X-Received: by 2002:adf:fd4d:: with SMTP id h13mr37082544wrs.5.1625847006634; 
 Fri, 09 Jul 2021 09:10:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/17] stm32vldiscovery: Add the STM32VLDISCOVERY Machine
Date: Fri,  9 Jul 2021 17:09:48 +0100
Message-Id: <20210709161003.25874-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alexandre Iooss <erdnaxe@crans.org>

This is a Cortex-M3 based machine. Information can be found at:
https://www.st.com/en/evaluation-tools/stm32vldiscovery.html

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210617165647.2575955-3-erdnaxe@crans.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 default-configs/devices/arm-softmmu.mak |  1 +
 hw/arm/stm32vldiscovery.c               | 66 +++++++++++++++++++++++++
 MAINTAINERS                             |  6 +++
 hw/arm/Kconfig                          |  4 ++
 hw/arm/meson.build                      |  1 +
 5 files changed, 78 insertions(+)
 create mode 100644 hw/arm/stm32vldiscovery.c

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c7..cdc0e97f9d7 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -18,6 +18,7 @@ CONFIG_CHEETAH=y
 CONFIG_SX1=y
 CONFIG_NSERIES=y
 CONFIG_STELLARIS=y
+CONFIG_STM32VLDISCOVERY=y
 CONFIG_REALVIEW=y
 CONFIG_VERSATILE=y
 CONFIG_VEXPRESS=y
diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
new file mode 100644
index 00000000000..7e8191ebf5f
--- /dev/null
+++ b/hw/arm/stm32vldiscovery.c
@@ -0,0 +1,66 @@
+/*
+ * ST STM32VLDISCOVERY machine
+ *
+ * Copyright (c) 2021 Alexandre Iooss <erdnaxe@crans.org>
+ * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "hw/qdev-properties.h"
+#include "qemu/error-report.h"
+#include "hw/arm/stm32f100_soc.h"
+#include "hw/arm/boot.h"
+
+/* stm32vldiscovery implementation is derived from netduinoplus2 */
+
+/* Main SYSCLK frequency in Hz (24MHz) */
+#define SYSCLK_FRQ 24000000ULL
+
+static void stm32vldiscovery_init(MachineState *machine)
+{
+    DeviceState *dev;
+
+    /*
+     * TODO: ideally we would model the SoC RCC and let it handle
+     * system_clock_scale, including its ability to define different
+     * possible SYSCLK sources.
+     */
+    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
+
+    dev = qdev_new(TYPE_STM32F100_SOC);
+    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    armv7m_load_kernel(ARM_CPU(first_cpu),
+                       machine->kernel_filename,
+                       FLASH_SIZE);
+}
+
+static void stm32vldiscovery_machine_init(MachineClass *mc)
+{
+    mc->desc = "ST STM32VLDISCOVERY (Cortex-M3)";
+    mc->init = stm32vldiscovery_init;
+}
+
+DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 8cfed2dd2d7..f5919498af4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -893,6 +893,12 @@ F: hw/*/stellaris*
 F: include/hw/input/gamepad.h
 F: docs/system/arm/stellaris.rst
 
+STM32VLDISCOVERY
+M: Alexandre Iooss <erdnaxe@crans.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/stm32vldiscovery.c
+
 Versatile Express
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a5c2e1d9912..c5211896284 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -239,6 +239,10 @@ config STELLARIS
     select STELLARIS_ENET # ethernet
     select UNIMP
 
+config STM32VLDISCOVERY
+    bool
+    select STM32F100_SOC
+
 config STRONGARM
     bool
     select PXA2XX
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 0e637e6a9ee..721a8eb8bed 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -24,6 +24,7 @@ arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
 arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
+arm_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
 arm_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
 arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
 arm_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
-- 
2.20.1


