Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE90509F0B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:53:07 +0200 (CEST)
Received: from localhost ([::1]:40748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVMw-0001NQ-V0
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqM-0003Fz-Pl
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:28 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq8-0003XN-RR
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:14 -0400
Received: by mail-wr1-x429.google.com with SMTP id bv16so6182866wrb.9
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g+Co51E/+7lmbmTDyWaG5WQzn5vB4kGUC/Z7E1cxKEA=;
 b=CEIxTB0REDzYgul9ceihtBhXVeRfPk37c/BBdLplsKSp14Edx5ilPcLUzLC8w+O8Ru
 IE8EdaPwhc6Jk3neEXZCnv1bKrfWkJd0NWjE+5301JiUgrsfJWafyGFNA/UaJhgQqk+Z
 WAHVeggQCk/QvTQt6Gu9oBnpI0cQZDCViiXHO7Oiymta7IZWcfI5JvBTf3NNSFXmsMFN
 Xyka+RcPz1b9/KJcAYn4rBG+bxzgG0K+Jvfra0FfpvUipp5bQkeeYVUk9LHN6rhq5aOG
 917xYn8lUuBASC1XmFABGouRDuloJ3AOq1oPMTlBaiBOJVskP+rM2l1i1dEBwklauQE8
 c7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+Co51E/+7lmbmTDyWaG5WQzn5vB4kGUC/Z7E1cxKEA=;
 b=iP6mClSR/D+lKt+9Ld6Uvt8OUBkLoXOpfslwMpJNa4BFk5lclrBsxO63pv7sLBcICH
 yfw0BE+3xvBvZaHIiZ26Dv1a5jinaBZjDZ0sELE+oUXF4q4hc5jh4j1qL92v3sVyqKzZ
 zG+OXcqp/N2TYnoG/TYYYnI7qJCpBLutogzDyMJx0GRopC7t2aavmwZBN4YuWFDIct4K
 +wfE7LaM52evFPcCLcUJWHu0cbva3BJIDhm+RbEBRtMHZa7vLoUBZRocbnW/UaNg8bHk
 q0UVeJVRWY4cC6hFrc/G4W2OQL3+U0VDaj95SOVOIySqudbr7hUolp6G0gE7naRSnWON
 3gBg==
X-Gm-Message-State: AOAM531YsQe7n9K+2hsr9OoG//6+LJ4OkAiIvUw2cLAxl3cPEREdbI8/
 Aqkl4wADgOLlF+BUhzWamUieuAXWzgRdBA==
X-Google-Smtp-Source: ABdhPJxrtj+kvksjw4+Kp5NkWYpdZqtNeFty9/FrK14rnGQFGn1nKLjsEA6wpjkUInNAhl3X0/xvsg==
X-Received: by 2002:a05:6000:2cb:b0:20a:88c4:ec9f with SMTP id
 o11-20020a05600002cb00b0020a88c4ec9fmr18060482wry.43.1650539951597; 
 Thu, 21 Apr 2022 04:19:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/31] hw/arm/exynos4210: Put combiners into state struct
Date: Thu, 21 Apr 2022 12:18:39 +0100
Message-Id: <20220421111846.2011565-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Switch the creation of the combiner devices to the new-style
"embedded in state struct" approach, so we can easily refer
to the object elsewhere during realize.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-18-peter.maydell@linaro.org
---
 include/hw/arm/exynos4210.h           |  3 ++
 include/hw/intc/exynos4210_combiner.h | 57 +++++++++++++++++++++++++++
 hw/arm/exynos4210.c                   | 20 +++++-----
 hw/intc/exynos4210_combiner.c         | 31 +--------------
 4 files changed, 72 insertions(+), 39 deletions(-)
 create mode 100644 include/hw/intc/exynos4210_combiner.h

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index f24617f681d..d38be8767b3 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -28,6 +28,7 @@
 #include "hw/sysbus.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/intc/exynos4210_gic.h"
+#include "hw/intc/exynos4210_combiner.h"
 #include "hw/core/split-irq.h"
 #include "target/arm/cpu-qom.h"
 #include "qom/object.h"
@@ -105,6 +106,8 @@ struct Exynos4210State {
     qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
     A9MPPrivState a9mpcore;
     Exynos4210GicState ext_gic;
+    Exynos4210CombinerState int_combiner;
+    Exynos4210CombinerState ext_combiner;
     SplitIRQ splitter[EXYNOS4210_NUM_SPLITTERS];
 };
 
diff --git a/include/hw/intc/exynos4210_combiner.h b/include/hw/intc/exynos4210_combiner.h
new file mode 100644
index 00000000000..429844fed41
--- /dev/null
+++ b/include/hw/intc/exynos4210_combiner.h
@@ -0,0 +1,57 @@
+/*
+ * Samsung exynos4210 Interrupt Combiner
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
+
+#ifndef HW_INTC_EXYNOS4210_COMBINER
+#define HW_INTC_EXYNOS4210_COMBINER
+
+#include "hw/sysbus.h"
+
+/*
+ * State for each output signal of internal combiner
+ */
+typedef struct CombinerGroupState {
+    uint8_t src_mask;            /* 1 - source enabled, 0 - disabled */
+    uint8_t src_pending;        /* Pending source interrupts before masking */
+} CombinerGroupState;
+
+#define TYPE_EXYNOS4210_COMBINER "exynos4210.combiner"
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210CombinerState, EXYNOS4210_COMBINER)
+
+/* Number of groups and total number of interrupts for the internal combiner */
+#define IIC_NGRP 64
+#define IIC_NIRQ (IIC_NGRP * 8)
+#define IIC_REGSET_SIZE 0x41
+
+struct Exynos4210CombinerState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
+    struct CombinerGroupState group[IIC_NGRP];
+    uint32_t reg_set[IIC_REGSET_SIZE];
+    uint32_t icipsr[2];
+    uint32_t external;          /* 1 means that this combiner is external */
+
+    qemu_irq output_irq[IIC_NGRP];
+};
+
+#endif
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 05b28cf5905..27c6ab27123 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -624,25 +624,23 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     }
 
     /* Internal Interrupt Combiner */
-    dev = qdev_new("exynos4210.combiner");
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(busdev, &error_fatal);
+    busdev = SYS_BUS_DEVICE(&s->int_combiner);
+    sysbus_realize(busdev, &error_fatal);
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
         sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore), n));
     }
-    exynos4210_combiner_get_gpioin(&s->irqs, dev, 0);
+    exynos4210_combiner_get_gpioin(&s->irqs, DEVICE(&s->int_combiner), 0);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_INT_COMBINER_BASE_ADDR);
 
     /* External Interrupt Combiner */
-    dev = qdev_new("exynos4210.combiner");
-    qdev_prop_set_uint32(dev, "external", 1);
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(busdev, &error_fatal);
+    qdev_prop_set_uint32(DEVICE(&s->ext_combiner), "external", 1);
+    busdev = SYS_BUS_DEVICE(&s->ext_combiner);
+    sysbus_realize(busdev, &error_fatal);
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
         sysbus_connect_irq(busdev, n, qdev_get_gpio_in(DEVICE(&s->ext_gic), n));
     }
-    exynos4210_combiner_get_gpioin(&s->irqs, dev, 1);
+    exynos4210_combiner_get_gpioin(&s->irqs, DEVICE(&s->ext_combiner), 1);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_COMBINER_BASE_ADDR);
 
     /* Initialize board IRQs. */
@@ -844,6 +842,10 @@ static void exynos4210_init(Object *obj)
 
     object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
     object_initialize_child(obj, "ext-gic", &s->ext_gic, TYPE_EXYNOS4210_GIC);
+    object_initialize_child(obj, "int-combiner", &s->int_combiner,
+                            TYPE_EXYNOS4210_COMBINER);
+    object_initialize_child(obj, "ext-combiner", &s->ext_combiner,
+                            TYPE_EXYNOS4210_COMBINER);
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index 83b42b9bce1..a289510bdb8 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -31,7 +31,7 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
-
+#include "hw/intc/exynos4210_combiner.h"
 #include "hw/arm/exynos4210.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
@@ -48,36 +48,7 @@
 #define DPRINTF(fmt, ...) do {} while (0)
 #endif
 
-#define    IIC_NGRP        64            /* Internal Interrupt Combiner
-                                            Groups number */
-#define    IIC_NIRQ        (IIC_NGRP * 8)/* Internal Interrupt Combiner
-                                            Interrupts number */
 #define IIC_REGION_SIZE    0x108         /* Size of memory mapped region */
-#define IIC_REGSET_SIZE    0x41
-
-/*
- * State for each output signal of internal combiner
- */
-typedef struct CombinerGroupState {
-    uint8_t src_mask;            /* 1 - source enabled, 0 - disabled */
-    uint8_t src_pending;        /* Pending source interrupts before masking */
-} CombinerGroupState;
-
-#define TYPE_EXYNOS4210_COMBINER "exynos4210.combiner"
-OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210CombinerState, EXYNOS4210_COMBINER)
-
-struct Exynos4210CombinerState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-
-    struct CombinerGroupState group[IIC_NGRP];
-    uint32_t reg_set[IIC_REGSET_SIZE];
-    uint32_t icipsr[2];
-    uint32_t external;          /* 1 means that this combiner is external */
-
-    qemu_irq output_irq[IIC_NGRP];
-};
 
 static const VMStateDescription vmstate_exynos4210_combiner_group_state = {
     .name = "exynos4210.combiner.groupstate",
-- 
2.25.1


