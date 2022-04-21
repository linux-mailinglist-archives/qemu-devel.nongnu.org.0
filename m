Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34221509EDE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:45:00 +0200 (CEST)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVF5-0006AU-8N
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq1-00036r-NA
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpz-0003V2-7Z
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so5638810wma.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JyLLiVr6CM6ojc6EwZhzCmQ6kWAPOLYrRnM+QBWq57Q=;
 b=FhG83E+jrBBv6HzscjGozhqg8zyI6d/k2vicx5AaQgM+1ezyukHjwX/nLbCPV4zQDn
 zoRwTFS3Dyb7gyiesEIcPdOaAMkpPzqzyHcW72Gso120lny5ZGf2QxIFSW5G2vOVaw/K
 3su2+8oD79Al5F36osqsYYXlial1tFs4a6bwqjuaYC/X+fGYk4KaE/+X9GPOD/tE+NpU
 EMs7bSgs6zgdoX1jOx+3VtuHqDJvE76Qzh52Fk4lrBJs+2XCxlWWUPY2xbJFF8vxKT9v
 R+EAoe0dKNEWxW17mLi+yuLh6x7RnHmejCTMDVf2skUcWcUZBhUeLHL6waxPgZFh1XCM
 SRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JyLLiVr6CM6ojc6EwZhzCmQ6kWAPOLYrRnM+QBWq57Q=;
 b=R/dR1anNX1sWrsV4MQtY1sI0LrazckLGizMkjFkMDSreen9YpPip21HifQQsPQ4Dtt
 k347R6YIkSdSmkjyO2Wr5tf8MAzx+Ed/gFYAkvheSCDR4AgMsUm6SXSx/cKwssoj1TjZ
 +MyIlf6RmUjWEuGaxU78v5K8l2wS5YtR7orboesCVnax1M6T7MUimxIWV9eV5bKT2It3
 Vqy3pVQpu864VqiK4cyr7wk9HmA0MgOHuNVSx9DWEJx4WvXud7LKDWOpcXOm1PdTBqQZ
 kGa+KNNpLXyefA1MqBTJtCm5eVQ/ai0TJYSHO3z7XoA7ENUvX+FsQ7sBQE4PY38/AjUG
 vXJA==
X-Gm-Message-State: AOAM530Hyw/jW9oWgYvO1VyrJqW9kDOf8fuT8Ml954J+1xwaZfSPNhMD
 paGVRNMEXs9MW0E5isQvWQNmFj7ugRy5EA==
X-Google-Smtp-Source: ABdhPJyrPLv5JEtWYVC0f3YtClWutmT05pmegARQ8UWBd2bj9PHGJrOiUj9iHhSCKkX1tsGF2rPpxw==
X-Received: by 2002:a05:600c:1e1e:b0:38e:baaa:aae0 with SMTP id
 ay30-20020a05600c1e1e00b0038ebaaaaae0mr7852688wmb.157.1650539941786; 
 Thu, 21 Apr 2022 04:19:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/31] hw/arm/exynos4210: Put external GIC into state struct
Date: Thu, 21 Apr 2022 12:18:30 +0100
Message-Id: <20220421111846.2011565-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Switch the creation of the external GIC to the new-style "embedded in
state struct" approach, so we can easily refer to the object
elsewhere during realize.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-9-peter.maydell@linaro.org
---
 include/hw/arm/exynos4210.h      |  2 ++
 include/hw/intc/exynos4210_gic.h | 43 ++++++++++++++++++++++++++++++++
 hw/arm/exynos4210.c              | 10 ++++----
 hw/intc/exynos4210_gic.c         | 17 ++-----------
 MAINTAINERS                      |  2 +-
 5 files changed, 53 insertions(+), 21 deletions(-)
 create mode 100644 include/hw/intc/exynos4210_gic.h

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index d83e96a091e..f35ae90000f 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -27,6 +27,7 @@
 #include "hw/or-irq.h"
 #include "hw/sysbus.h"
 #include "hw/cpu/a9mpcore.h"
+#include "hw/intc/exynos4210_gic.h"
 #include "target/arm/cpu-qom.h"
 #include "qom/object.h"
 
@@ -103,6 +104,7 @@ struct Exynos4210State {
     qemu_or_irq pl330_irq_orgate[EXYNOS4210_NUM_DMA];
     qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
     A9MPPrivState a9mpcore;
+    Exynos4210GicState ext_gic;
 };
 
 #define TYPE_EXYNOS4210_SOC "exynos4210"
diff --git a/include/hw/intc/exynos4210_gic.h b/include/hw/intc/exynos4210_gic.h
new file mode 100644
index 00000000000..f64c4069c6d
--- /dev/null
+++ b/include/hw/intc/exynos4210_gic.h
@@ -0,0 +1,43 @@
+/*
+ * Samsung exynos4210 GIC implementation. Based on hw/arm_gic.c
+ *
+ * Copyright (c) 2000 - 2011 Samsung Electronics Co., Ltd.
+ * All rights reserved.
+ *
+ * Evgeny Voevodin <e.voevodin@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+ * See the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef HW_INTC_EXYNOS4210_GIC_H
+#define HW_INTC_EXYNOS4210_GIC_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_EXYNOS4210_GIC "exynos4210.gic"
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210GicState, EXYNOS4210_GIC)
+
+#define EXYNOS4210_GIC_NCPUS 2
+
+struct Exynos4210GicState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion cpu_container;
+    MemoryRegion dist_container;
+    MemoryRegion cpu_alias[EXYNOS4210_GIC_NCPUS];
+    MemoryRegion dist_alias[EXYNOS4210_GIC_NCPUS];
+    uint32_t num_cpu;
+    DeviceState *gic;
+};
+
+#endif
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 742666ba779..2058df9aecf 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -455,10 +455,9 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     sysbus_create_simple("l2x0", EXYNOS4210_L2X0_BASE_ADDR, NULL);
 
     /* External GIC */
-    dev = qdev_new("exynos4210.gic");
-    qdev_prop_set_uint32(dev, "num-cpu", EXYNOS4210_NCPUS);
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(busdev, &error_fatal);
+    qdev_prop_set_uint32(DEVICE(&s->ext_gic), "num-cpu", EXYNOS4210_NCPUS);
+    busdev = SYS_BUS_DEVICE(&s->ext_gic);
+    sysbus_realize(busdev, &error_fatal);
     /* Map CPU interface */
     sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_GIC_CPU_BASE_ADDR);
     /* Map Distributer interface */
@@ -468,7 +467,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
                            qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 1));
     }
     for (n = 0; n < EXYNOS4210_EXT_GIC_NIRQ; n++) {
-        s->irqs.ext_gic_irq[n] = qdev_get_gpio_in(dev, n);
+        s->irqs.ext_gic_irq[n] = qdev_get_gpio_in(DEVICE(&s->ext_gic), n);
     }
 
     /* Internal Interrupt Combiner */
@@ -686,6 +685,7 @@ static void exynos4210_init(Object *obj)
     }
 
     object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
+    object_initialize_child(obj, "ext-gic", &s->ext_gic, TYPE_EXYNOS4210_GIC);
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index d8cad537fbf..71a88c86bc1 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -27,6 +27,7 @@
 #include "qemu/module.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/intc/exynos4210_gic.h"
 #include "hw/arm/exynos4210.h"
 #include "qom/object.h"
 
@@ -44,20 +45,6 @@
 #define EXYNOS4210_GIC_CPU_REGION_SIZE  0x100
 #define EXYNOS4210_GIC_DIST_REGION_SIZE 0x1000
 
-#define TYPE_EXYNOS4210_GIC "exynos4210.gic"
-OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210GicState, EXYNOS4210_GIC)
-
-struct Exynos4210GicState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion cpu_container;
-    MemoryRegion dist_container;
-    MemoryRegion cpu_alias[EXYNOS4210_NCPUS];
-    MemoryRegion dist_alias[EXYNOS4210_NCPUS];
-    uint32_t num_cpu;
-    DeviceState *gic;
-};
-
 static void exynos4210_gic_set_irq(void *opaque, int irq, int level)
 {
     Exynos4210GicState *s = (Exynos4210GicState *)opaque;
@@ -100,7 +87,7 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
      * enough room for the cpu numbers.  gcc 9.2.1 on 32-bit x86
      * doesn't figure this out, otherwise and gives spurious warnings.
      */
-    assert(n <= EXYNOS4210_NCPUS);
+    assert(n <= EXYNOS4210_GIC_NCPUS);
     for (i = 0; i < n; i++) {
         /* Map CPU interface per SMP Core */
         sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
diff --git a/MAINTAINERS b/MAINTAINERS
index dcedfaed1f1..294c88ace9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -648,7 +648,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/*/exynos*
-F: include/hw/arm/exynos4210.h
+F: include/hw/*/exynos*
 
 Calxeda Highbank
 M: Rob Herring <robh@kernel.org>
-- 
2.25.1


