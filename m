Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5291066470A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:09:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHl2-0004dk-EX; Tue, 10 Jan 2023 11:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkw-0004am-Qe
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:46 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHku-0006Rp-I1
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:46 -0500
Received: by mail-wr1-x42b.google.com with SMTP id z5so11374621wrt.6
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KlIENfxWIvMy7wAsOeIIVwXs5j0fqcu2I9CG7fH4FsA=;
 b=XFoA25AFQNh3XcyQ5WsxQthXlIJZSkkHXnUhiCizmCZitac3oUgajjdv3doVfLbaQl
 iu9FnmlYQulIvoxere8d3r3kDw4sOl5y3B4xdeZOTbLD2Bdd18OAYNBW/zMkKJbaSVAN
 QALwi0iLaVhrsf/rjwZimt/1n2qVG51Zt2S4IL8c+N896jS5pUvv/8JV5qNGV7v5xiX/
 /AKszZ3sCbT3kDmkJM+dn40lNnG5zSkB4CWjWWcYVrhibeTQuOp0KCtVNjgvTjBCdrRr
 JpCsB/Kw9IZzAphlXPdW35k/DmlNnU1Fy9sYzIPDXdkmZQhxv0Drmp79PeA6WtL+R/OF
 9FoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KlIENfxWIvMy7wAsOeIIVwXs5j0fqcu2I9CG7fH4FsA=;
 b=mT0MmrcOLLXGp4QSeDA4UPGKevVZk2UuoPMDOCJLM0rxZ/m/7E+UIcdV1aJeh4zQWy
 hWG4EQnhDitXZrVcT9JZrH4bvYIWhfkVSe9VQXaCqpDdVKyzhtKZewxzxfsth3ChHDFR
 aUEUP5LhwVcCaFCkyxZ/+zm8evw9GyP9XQo2NrRb44eX7SCL4y8kkEb1UGJ4gZP54knt
 05ojOzLn+B+7JF06ErA89jGpj8/1bzrX5lbzcqTZyxOYKBpcpJYOq7vNpHIW71uykLCO
 cagS/OB718wROhgaKZc4p1lxfp7ZwKnUxrRv9OVS8CvJcK1ctXo3XQ9NLOXQTk71KLQ9
 9ztw==
X-Gm-Message-State: AFqh2kozZgUP4N1/zNCC9RBdogTbfbc18u+fEF5XKbW9SGLMKMOvomas
 pQ8MEXL0u53vHBUF6fJOrJV17jN8hZXuEHjI
X-Google-Smtp-Source: AMrXdXtxNFtIt6qWNNkhF+OU0z776JO5J5i8j+/7U+ZvyFyQKf1E89J7CQGZ733UHBQJ6NiDqHjFOg==
X-Received: by 2002:a5d:4150:0:b0:286:2b9e:f549 with SMTP id
 c16-20020a5d4150000000b002862b9ef549mr29669219wrq.66.1673369143506; 
 Tue, 10 Jan 2023 08:45:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a5d608a000000b0027cfd9463d7sm11722252wrt.110.2023.01.10.08.45.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:45:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 17/18] hw/arm/fsl-imx6: Replace object_initialize(ARMCPU) by
 object_new()
Date: Tue, 10 Jan 2023 17:44:05 +0100
Message-Id: <20230110164406.94366-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Replace the ARMCPU field in FslIMX6[UL]State by a reference
to an allocated ARMCPU. Instead of initializing the field with
object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move from arm_ss[] to the more generic softmmu_ss[] the followin
units:

 - fsl-imx6.c
 - fsl-imx6ul.c
 - mcimx6ul-evk.c
 - sabrelite.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx6.c           | 14 +++++++-------
 hw/arm/fsl-imx6ul.c         |  8 ++++----
 hw/arm/mcimx6ul-evk.c       |  2 +-
 hw/arm/meson.build          |  6 +++---
 hw/arm/sabrelite.c          |  2 +-
 include/hw/arm/fsl-imx6.h   |  4 ++--
 include/hw/arm/fsl-imx6ul.h |  4 ++--
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 00dafe3f62..085cd3b1c8 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -43,8 +43,8 @@ static void fsl_imx6_init(Object *obj)
 
     for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX6_NUM_CPUS); i++) {
         snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_initialize_child(obj, name, &s->cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-a9"));
+        s->cpu[i] = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a9")));
+        object_property_add_child(obj, name, OBJECT(s->cpu[i]));
     }
 
     object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
@@ -120,17 +120,17 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
         /* On uniprocessor, the CBAR is set to 0 */
         if (smp_cpus > 1) {
-            object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
+            object_property_set_int(OBJECT(s->cpu[i]), "reset-cbar",
                                     FSL_IMX6_A9MPCORE_ADDR, &error_abort);
         }
 
         /* All CPU but CPU 0 start in power off mode */
         if (i) {
-            object_property_set_bool(OBJECT(&s->cpu[i]), "start-powered-off",
+            object_property_set_bool(OBJECT(s->cpu[i]), "start-powered-off",
                                      true, &error_abort);
         }
 
-        if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
+        if (!qdev_realize(DEVICE(s->cpu[i]), NULL, errp)) {
             return;
         }
     }
@@ -148,9 +148,9 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
     for (i = 0; i < smp_cpus; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i,
-                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_IRQ));
+                           qdev_get_gpio_in(DEVICE(s->cpu[i]), ARM_CPU_IRQ));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i + smp_cpus,
-                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_FIQ));
+                           qdev_get_gpio_in(DEVICE(s->cpu[i]), ARM_CPU_FIQ));
     }
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->ccm), errp)) {
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 568317117c..be0573a243 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -34,8 +34,8 @@ static void fsl_imx6ul_init(Object *obj)
     char name[NAME_SIZE];
     int i;
 
-    object_initialize_child(obj, "cpu0", &s->cpu,
-                            ARM_CPU_TYPE_NAME("cortex-a7"));
+    s->cpu = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a7")));
+    object_property_add_child(obj, "cpu0", OBJECT(s->cpu));
 
     /*
      * A7MPCORE
@@ -166,7 +166,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    qdev_realize(DEVICE(&s->cpu), NULL, &error_abort);
+    qdev_realize(DEVICE(s->cpu), NULL, &error_abort);
 
     /*
      * A7MPCORE
@@ -178,7 +178,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX6UL_A7MPCORE_ADDR);
 
     sbd = SYS_BUS_DEVICE(&s->a7mpcore);
-    d = DEVICE(&s->cpu);
+    d = DEVICE(s->cpu);
 
     sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(d, ARM_CPU_IRQ));
     sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(d, ARM_CPU_FIQ));
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index d83c3c380e..89a65e4c4b 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -61,7 +61,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
     }
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu, machine, &boot_info);
+        arm_load_kernel(s->cpu, machine, &boot_info);
     }
 }
 
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 53ce301cbe..a7ee21e32f 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -9,7 +9,6 @@ arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
 arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
 arm_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 arm_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xilinx_zynq.c'))
-arm_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
 
 arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
 arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
@@ -20,7 +19,6 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orange
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
 arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_soc.c',
   'aspeed.c',
@@ -28,7 +26,6 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_ast10x0.c',
   'fby35.c'))
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 
 softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
@@ -40,6 +37,8 @@ softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
+softmmu_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
+softmmu_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 softmmu_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
@@ -55,6 +54,7 @@ softmmu_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 softmmu_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+softmmu_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
 softmmu_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
 softmmu_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 41191245b8..acd1d344b9 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -98,7 +98,7 @@ static void sabrelite_init(MachineState *machine)
     sabrelite_binfo.secondary_cpu_reset_hook = sabrelite_reset_secondary;
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu[0], machine, &sabrelite_binfo);
+        arm_load_kernel(s->cpu[0], machine, &sabrelite_binfo);
     }
 }
 
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 9d24d98189..ba42047b21 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -32,8 +32,8 @@
 #include "hw/net/imx_fec.h"
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
+#include "hw/arm/cpu.h"
 #include "exec/memory.h"
-#include "target/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX6 "fsl-imx6"
@@ -55,7 +55,7 @@ struct FslIMX6State {
     DeviceState parent_obj;
 
     /*< public >*/
-    ARMCPU         cpu[FSL_IMX6_NUM_CPUS];
+    ARMCPU         *cpu[FSL_IMX6_NUM_CPUS];
     A9MPPrivState  a9mpcore;
     IMX6CCMState   ccm;
     IMX6SRCState   src;
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 4f42fe4192..f49d0c9b83 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -37,7 +37,7 @@
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX6UL "fsl-imx6ul"
@@ -66,7 +66,7 @@ struct FslIMX6ULState {
     DeviceState    parent_obj;
 
     /*< public >*/
-    ARMCPU             cpu;
+    ARMCPU             *cpu;
     A15MPPrivState     a7mpcore;
     IMXGPTState        gpt[FSL_IMX6UL_NUM_GPTS];
     IMXEPITState       epit[FSL_IMX6UL_NUM_EPITS];
-- 
2.38.1


