Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939FD37BA5C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:28:32 +0200 (CEST)
Received: from localhost ([::1]:51558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgm6R-0003x7-HV
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzP-0003wh-K8
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:15 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzM-0003j0-B0
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l14so23048415wrx.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ci7dPAMJyayfYNj3hZaWT3hefWzNQwgkwFzrMvlg9Tw=;
 b=wjGXFKQiONlWrNse72AnFaY8Xj3EW/pUeX/sE+GqlbN0/DrOnbjV1ZLSOTnnEA00j0
 jRStMNr3MOKWR/itQBE4g13hmlPp9O2gHFxNPvPNNBZHNdK8PaW6yYxO/+1IXRKF9zlw
 TbK/57UsiqffEck13efWt7Q8ZqxR4G9D2++YL0AYElT9wI0NKNyeo4CHXvT7COIcjgsZ
 lhIqMxd7oThCq3Qi7YJDFXsa4GLHYrMTH4q9necZy3k22kHpHAY8+9FgS5IgaUKqaHBI
 /jezt8MDpnUZPbQZUDTJvyJ9YcigDgVmD7PNusAH8aMHKDjDt9LEoxvrzTGnEC8WT2hl
 WbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ci7dPAMJyayfYNj3hZaWT3hefWzNQwgkwFzrMvlg9Tw=;
 b=i2LNr0QWtpCkwP/JyyDV0p2+wOJhjaZjXbrr1YPBUkMnvUWomUMkPoo3Pto+VGHXMn
 BHXEdsnZgbzBmUdT37vMJbAzz1OYY2KwcHcfSzdPjySa3XJeCf4xiehK3Oli8s3GHy+T
 7hOtX2AmnApzwoObpAcoN+3ijps938TGOjyU+PytFR+AMlVERZp0F/h9cTdvEkup23es
 we/FpxlgEv0tCdXgsjpBJZiOIHRSW6D4AeBcb1eEhw7p7Lv4sF49uq91kcVxPAE1CEN8
 jYYt3Az7TFmKxUcu3yzOMAh/PwiTzJfSSCkKNEukYzSvQloSuTj++Ybjw7+3nWFBK3qV
 K7QQ==
X-Gm-Message-State: AOAM531WtdDpTW4EbCQ3jmcUIxB2OUvI4Q/v/s8vBOSYaHptsZ4B/Mlt
 c8gcvku3GV5QS8JZacb8DWmghw==
X-Google-Smtp-Source: ABdhPJyWOs7NLS7cjcfjaPbcs5jlbBZqOzW3hegM1Rp9mFTzV+Ex606xuONxmaHWis6pMquColwOCw==
X-Received: by 2002:adf:e707:: with SMTP id c7mr2271441wrm.137.1620814870985; 
 Wed, 12 May 2021 03:21:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z19sm5675472wmf.47.2021.05.12.03.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:21:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C4BB1FF9C;
 Wed, 12 May 2021 11:20:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 13/31] hw/tricore: Add testdevice for tests in tests/tcg/
Date: Wed, 12 May 2021 11:20:33 +0100
Message-Id: <20210512102051.12134-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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


