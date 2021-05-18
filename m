Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8E93874FD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:23:51 +0200 (CEST)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livx8-0008Qd-Lj
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhY-0008DU-5t
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:48 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhR-0005XW-Sa
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:43 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 h3-20020a05600c3503b0290176f13c7715so1037646wmq.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8I2LQNseKoGPZewhMtDjK2bewdbq9EHrD7Ih+hewKo=;
 b=WIBfawg2xQoOhPkSSFR9WNNt8eFkEdh3jIMo/blk9yXARgLzih+Kc1yieVdsmRvSyZ
 oXsHL+m5qxcbTGFoFQlB5DTcsdmtZdeUOWR3FB4k9APMrnuEi5DC0E2gPFcFnP/783HV
 yFOKRab/2Dw55Ke+0Kcs3L1XHya7uiG/7sRC5d0AIe+/CFbnXUK97kBz7u6wN8SGC5kb
 4b3Txmw7mmVSEa4DG5yIeL1HWkTKHdOxsBfAu/hot40WDKTafODVLnEBwobivO5Xg5QA
 xbgC497SO6q/6QIYpfogydnIq4sd6ETC6U6BIuCIljiFWG3L/t16SY/8dyDm+RgdTMi+
 fU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8I2LQNseKoGPZewhMtDjK2bewdbq9EHrD7Ih+hewKo=;
 b=mO/oALqXukqIEismN7ChuxeV1LEb312ZHU0uPxva0TesZXX+B0SlXviAgBEKW5AQ9Y
 B37uU8tuztWB8xZ85OfIWphRc7zfHgsBqYHHo7gkNhqojarGtog0WIvUK3oG8dNMwmqH
 3AjTE071O1kL95u7LDUsuAZu1I3D+GP3efCLbJILyd1udaISoZy3qELsyKdjuqJlLSAk
 ppe6UP/Q70fkYuWlkyWkR7N8z7+vlsljxPNYQ5IL4QfP44vtz4Q3M9QSRveUtmdX7jN8
 ODPnr+qZTOdMeODjxoHyB2Ua7kxso2iLmIAlfouy/uRb0DolflR1nOlblO1OikCJItjH
 nHHA==
X-Gm-Message-State: AOAM531dPlG/UMnH1Fk2fBR8bpHCcA3EGgoAl3AsWDh9h6BdsR/IoUYC
 0sihFs8EX/+vogWRbANUcJxOaA==
X-Google-Smtp-Source: ABdhPJw5Ser2wL07y9M2+uynJzswNT+mW8MhiEbKFgkQUZEgR/kPVj1NORowOe4+u2Bv7f3EIUgncw==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr4331855wmc.90.1621328856469; 
 Tue, 18 May 2021 02:07:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s199sm1965381wme.43.2021.05.18.02.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11B831FF9B;
 Tue, 18 May 2021 10:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 12/29] hw/tricore: Add testdevice for tests in tests/tcg/
Date: Tue, 18 May 2021 10:07:03 +0100
Message-Id: <20210518090720.21915-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

this device is used to verify the correctness of regression tests by
allowing guests to write their exit status to this device. This is then
used by qemu to exit using the written status.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-4-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-14-alex.bennee@linaro.org>

diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
new file mode 100644
index 0000000000..2c56c51bcb
--- /dev/null
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -0,0 +1,38 @@
+/*
+ *  Copyright (c) 2018-2021  Bastian Koppelmann Paderborn University
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+
+#ifndef HW_TRICORE_TESTDEV_H
+#define HW_TRICORE_TESTDEV_H
+
+#include "hw/sysbus.h"
+#include "hw/hw.h"
+
+#define TYPE_TRICORE_TESTDEVICE "tricore_testdevice"
+#define TRICORE_TESTDEVICE(obj) \
+    OBJECT_CHECK(TriCoreTestDeviceState, (obj), TYPE_TRICORE_TESTDEVICE)
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion iomem;
+
+} TriCoreTestDeviceState;
+
+#endif
diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index 51658d9e37..b6810e3be0 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -27,6 +27,7 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "hw/tricore/tricore.h"
+#include "hw/tricore/tricore_testdevice.h"
 #include "qemu/error-report.h"
 
 
@@ -56,6 +57,7 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
 {
     TriCoreCPU *cpu;
     CPUTriCoreState *env;
+    TriCoreTestDeviceState *test_dev;
 
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *ext_cram = g_new(MemoryRegion, 1);
@@ -87,6 +89,12 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
     memory_region_add_subregion(sysmem, 0xf0050000, pcp_data);
     memory_region_add_subregion(sysmem, 0xf0060000, pcp_text);
 
+    test_dev = g_new(TriCoreTestDeviceState, 1);
+    object_initialize(test_dev, sizeof(TriCoreTestDeviceState),
+                      TYPE_TRICORE_TESTDEVICE);
+    memory_region_add_subregion(sysmem, 0xf0000000, &test_dev->iomem);
+
+
     tricoretb_binfo.ram_size = machine->ram_size;
     tricoretb_binfo.kernel_filename = machine->kernel_filename;
 
diff --git a/hw/tricore/tricore_testdevice.c b/hw/tricore/tricore_testdevice.c
new file mode 100644
index 0000000000..a1563aa568
--- /dev/null
+++ b/hw/tricore/tricore_testdevice.c
@@ -0,0 +1,82 @@
+/*
+ *  Copyright (c) 2018-2021 Bastian Koppelmann Paderborn University
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
+#include "hw/tricore/tricore_testdevice.h"
+
+static void tricore_testdevice_write(void *opaque, hwaddr offset,
+                                      uint64_t value, unsigned size)
+{
+    exit(value);
+}
+
+static uint64_t tricore_testdevice_read(void *opaque, hwaddr offset,
+                                         unsigned size)
+{
+    return 0xdeadbeef;
+}
+
+static void tricore_testdevice_reset(DeviceState *dev)
+{
+}
+
+static const MemoryRegionOps tricore_testdevice_ops = {
+    .read = tricore_testdevice_read,
+    .write = tricore_testdevice_write,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void tricore_testdevice_init(Object *obj)
+{
+    TriCoreTestDeviceState *s = TRICORE_TESTDEVICE(obj);
+   /* map memory */
+    memory_region_init_io(&s->iomem, OBJECT(s), &tricore_testdevice_ops, s,
+                          "tricore_testdevice", 0x4);
+}
+
+static Property tricore_testdevice_properties[] = {
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void tricore_testdevice_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, tricore_testdevice_properties);
+    dc->reset = tricore_testdevice_reset;
+}
+
+static const TypeInfo tricore_testdevice_info = {
+    .name          = TYPE_TRICORE_TESTDEVICE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(TriCoreTestDeviceState),
+    .instance_init = tricore_testdevice_init,
+    .class_init    = tricore_testdevice_class_init,
+};
+
+static void tricore_testdevice_register_types(void)
+{
+    type_register_static(&tricore_testdevice_info);
+}
+
+type_init(tricore_testdevice_register_types)
diff --git a/hw/tricore/meson.build b/hw/tricore/meson.build
index 77ff6fd137..47e36bb077 100644
--- a/hw/tricore/meson.build
+++ b/hw/tricore/meson.build
@@ -1,5 +1,6 @@
 tricore_ss = ss.source_set()
 tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testboard.c'))
+tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testdevice.c'))
 tricore_ss.add(when: 'CONFIG_TRIBOARD', if_true: files('triboard.c'))
 tricore_ss.add(when: 'CONFIG_TC27X_SOC', if_true: files('tc27x_soc.c'))
 
-- 
2.20.1


