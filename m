Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698B1372873
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:08:11 +0200 (CEST)
Received: from localhost ([::1]:47628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldryM-00085g-Ec
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrtB-0002lq-32
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:49 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrt7-0003Ea-N1
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 p6-20020a05600c3586b029014131bbe5c7so887816wmq.3
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7rjRZMpfOjz06kT3DXo4AnrGU+LQX663aqbqm3FCMKI=;
 b=i8kpCZNh5jyW+cU//gwllI25YVBCQo1ToHsB8ptYIciZaMFJ9/zn4A+/9j+E5bsZ+P
 TpDyVLRgg9OhsFjEWR2QanLPcmLG816aCFuqyGFwXMmKRPWxE8zo5+/6h0X+8UXwqPDB
 bow5e+wqC6DSA5fJNv2ncJ2C/YgCWiK46s4q7ZuyOnUHfD79btmYFji28d7FaTGlDLqN
 6Oz58p5rtr409jgiPDRHGUp4Zx/iT2RvZPEZ3H4EK3Ve3SIWR7E+mIeANevRBjzE/+fh
 aGiv7efyybU6mkiBQ1Au4oqwz4QXLmue7n6NBV0zmLyvkfMBd/ye68r682Bc0rXhbLQC
 J1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rjRZMpfOjz06kT3DXo4AnrGU+LQX663aqbqm3FCMKI=;
 b=IXiK1V5sGwnIHqGaK91RatvO2LLXjj8x5yMlIjD22vMsorufcQ7JEsS8P8lq+NtzgR
 cjv6hA2Z1oBfyzVSqz5uP8Wz3fC40nam5tLK0V88MVfPRYPahBMFxggd2tfG45vNi4U5
 K0Idk3R7frr5pGuku1KjowcTRPGgcYrUXv6mv1MgZgdtKzPgGHkYw8vbsnQxWveGcLgv
 8PpULLTLU+Woe7qlOeW7Ey+59YTrL2W1oLTwspHBVHl7xBrWiJudJVxNVl8HPwPR06pj
 0Dll7L8tG6fuaMrS16IaRnvw62t19sHknNl8/CRRb8fo2sTcpIYfYK4Dx+BmxupCO3PG
 nHvQ==
X-Gm-Message-State: AOAM532kdcemokkAWBpQ8oLNxVcGnan8ZfEkEuV/lAmwg4328L3jTmr0
 xfzB31Yoi80z/O9ZuRS7ZLOTWQ==
X-Google-Smtp-Source: ABdhPJyMP58KcJ+0tSSUPYZf65uvbZAM5SQ9m61H3ljsMMTj/ZfXQ1PF4jj/0X8s/CWJIcRKJQS+GQ==
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr25917639wmc.126.1620122564276; 
 Tue, 04 May 2021 03:02:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g6sm18524588wrr.63.2021.05.04.03.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E1CD21FF9C;
 Tue,  4 May 2021 11:02:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 13/30] hw/tricore: Add testdevice for tests in tests/tcg/
Date: Tue,  4 May 2021 11:02:06 +0100
Message-Id: <20210504100223.25427-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
---
 include/hw/tricore/tricore_testdevice.h | 38 ++++++++++++
 hw/tricore/tricore_testboard.c          |  8 +++
 hw/tricore/tricore_testdevice.c         | 82 +++++++++++++++++++++++++
 hw/tricore/meson.build                  |  1 +
 4 files changed, 129 insertions(+)
 create mode 100644 include/hw/tricore/tricore_testdevice.h
 create mode 100644 hw/tricore/tricore_testdevice.c

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
index 12ea1490fd..9791986a3e 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -28,6 +28,7 @@
 #include "exec/address-spaces.h"
 #include "elf.h"
 #include "hw/tricore/tricore.h"
+#include "hw/tricore/tricore_testdevice.h"
 #include "qemu/error-report.h"
 
 
@@ -57,6 +58,7 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
 {
     TriCoreCPU *cpu;
     CPUTriCoreState *env;
+    TriCoreTestDeviceState *test_dev;
 
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *ext_cram = g_new(MemoryRegion, 1);
@@ -88,6 +90,12 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
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


