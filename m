Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58227319109
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:29:24 +0100 (CET)
Received: from localhost ([::1]:51156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFmN-0004xW-Cd
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFdH-0005dg-Hc
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:19:59 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFdA-0005Cb-LR
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:19:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id o15so4456959wmq.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=os20RBFKwCRXLNeh7G/FLoSRY+DOR032lYWTciVvsJA=;
 b=k3HhQsmMGHC7I+N35Uf/KArc3syXjbByxt0uMM6GlayIdVeBVQuQl1oXWLwXnDTZEv
 HBwA5IOgggj+wmwys5cN64BpfJoPTZUZ5E2WoAsiXomzcW4zqY4netQlpIbOovEtQ6UG
 a1R2Frvufd7DFkGrhI6jEqo214QbBM8xwNR3Q4LIfsFqURXQXcXsYmsVrO+8vr9pY1ms
 Gb6X1pX6ZUHGJVQnXEbxIKiXcN/gaO4Y54txpqFO88uBXxZVoAGYThJzz8ypF5gmgDfG
 bLM8q11yGE0zfE4MhlcrQds+nO1lsguOnTjkIQTNlA5T8jyai6BEA51C+UpL3I3tb6ai
 fFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=os20RBFKwCRXLNeh7G/FLoSRY+DOR032lYWTciVvsJA=;
 b=UT31ZFAfo/iSE0stX8CGTxTra4NModMaT1T2/DwyHFoV/8IJ+S4IaFO+G4mSauH6Gt
 yDmWHVEpOmEdco5iXa8YY53wsmPqXNuwvnzTSHRaENQDREUnEcLnPpb0vP4Lv+NT77jQ
 hlYTlm6hwrrr4/s3v7qK70fSLEtZmyQjuRtdNcvUPTfE1PbrMn48lK82x05ayGf2RA8x
 a526nToTXOI/YFT7kh6Jd+m2MIoWWtT5bhxMWVXX+YDmkORMtu7KqUPuIEd8H307jMXj
 7HWehNHqtMDSIPcX2G3C5gAUxDt1zixLz9IXcTqm8lN3KiP0qqXw+Sb18hcg3pEYxq/i
 JQuA==
X-Gm-Message-State: AOAM5303LSk2UUeb9X0aE2eLaxJBWS/4E62YhQ2VbP2e41agcMk/VTYb
 NvvCrmRQtrRg0BX7l1C0xIiy9A==
X-Google-Smtp-Source: ABdhPJx9JWVAAXbhnO9K3m5ApGIGsTFYkOy2GyhV4mJ7hU4WOVkd1hdn/X7D/n9JUnTcfI31osMGfw==
X-Received: by 2002:a7b:c150:: with SMTP id z16mr6299971wmi.30.1613063991222; 
 Thu, 11 Feb 2021 09:19:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d10sm5685321wrn.88.2021.02.11.09.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4642A1FF90;
 Thu, 11 Feb 2021 17:19:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] hw/core: implement a guest-loader to support static
 hypervisor guests
Date: Thu, 11 Feb 2021 17:19:42 +0000
Message-Id: <20210211171945.18313-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211171945.18313-1-alex.bennee@linaro.org>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hypervisors, especially type-1 ones, need the firmware/bootcode to put
their initial guest somewhere in memory and pass the information to it
via platform data. The guest-loader is modelled after the generic
loader for exactly this sort of purpose:

  $QEMU $ARGS  -kernel ~/xen.git/xen/xen \
    -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
    -device guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro console=hvc0 earlyprintk=xen" \
    -device guest-loader,addr=0x47000000,initrd=rootfs.cpio

Message-Id: <20201105175153.30489-5-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use PRIx64 format string
  - fix long lines to assuage checkpatch
  - add MAINTAINERS entry
  - use current_machine->ram_size
  - checkpatch fixes
---
 hw/core/guest-loader.h |  34 ++++++++++
 hw/core/guest-loader.c | 145 +++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |   5 ++
 hw/core/meson.build    |   2 +
 4 files changed, 186 insertions(+)
 create mode 100644 hw/core/guest-loader.h
 create mode 100644 hw/core/guest-loader.c

diff --git a/hw/core/guest-loader.h b/hw/core/guest-loader.h
new file mode 100644
index 0000000000..07f4b4884b
--- /dev/null
+++ b/hw/core/guest-loader.h
@@ -0,0 +1,34 @@
+/*
+ * Guest Loader
+ *
+ * Copyright (C) 2020 Linaro
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ * (based on the generic-loader by Li Guang <lig.fnst@cn.fujitsu.com>)
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef GUEST_LOADER_H
+#define GUEST_LOADER_H
+
+#include "hw/qdev-core.h"
+#include "qom/object.h"
+
+struct GuestLoaderState {
+    /* <private> */
+    DeviceState parent_obj;
+
+    /* <public> */
+    uint64_t addr;
+    char *kernel;
+    char *args;
+    char *initrd;
+};
+
+#define TYPE_GUEST_LOADER "guest-loader"
+OBJECT_DECLARE_SIMPLE_TYPE(GuestLoaderState, GUEST_LOADER)
+
+#endif
diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
new file mode 100644
index 0000000000..bde44e27b4
--- /dev/null
+++ b/hw/core/guest-loader.c
@@ -0,0 +1,145 @@
+/*
+ * Guest Loader
+ *
+ * Copyright (C) 2020 Linaro
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ * (based on the generic-loader by Li Guang <lig.fnst@cn.fujitsu.com>)
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+/*
+ * Much like the generic-loader this is treated as a special device
+ * inside QEMU. However unlike the generic-loader this device is used
+ * to load guest images for hypervisors. As part of that process the
+ * hypervisor needs to have platform information passed to it by the
+ * lower levels of the stack (e.g. firmware/bootloader). If you boot
+ * the hypervisor directly you use the guest-loader to load the Dom0
+ * or equivalent guest images in the right place in the same way a
+ * boot loader would.
+ *
+ * This is only relevant for full system emulation.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/core/cpu.h"
+#include "hw/sysbus.h"
+#include "sysemu/dma.h"
+#include "hw/loader.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "guest-loader.h"
+#include "sysemu/device_tree.h"
+#include "hw/boards.h"
+
+/*
+ * Insert some FDT nodes for the loaded blob.
+ */
+static void loader_insert_platform_data(GuestLoaderState *s, int size,
+                                        Error **errp)
+{
+    MachineState *machine = MACHINE(qdev_get_machine());
+    void *fdt = machine->fdt;
+    g_autofree char *node = g_strdup_printf("/chosen/module@0x%08" PRIx64,
+                                            s->addr);
+    uint64_t reg_attr[2] = {cpu_to_be64(s->addr), cpu_to_be64(size)};
+
+    if (!fdt) {
+        error_setg(errp, "Cannot modify FDT fields if the machine has none");
+        return;
+    }
+
+    qemu_fdt_add_subnode(fdt, node);
+    qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
+
+    if (s->kernel) {
+        const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
+        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
+                                          (char **) &compat,
+                                          ARRAY_SIZE(compat)) < 0) {
+            error_setg(errp, "couldn't set %s/compatible", node);
+            return;
+        }
+        if (s->args) {
+            if (qemu_fdt_setprop_string(fdt, node, "bootargs", s->args) < 0) {
+                error_setg(errp, "couldn't set %s/bootargs", node);
+            }
+        }
+    } else if (s->initrd) {
+        const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
+        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
+                                          (char **) &compat,
+                                          ARRAY_SIZE(compat)) < 0) {
+            error_setg(errp, "couldn't set %s/compatible", node);
+            return;
+        }
+    }
+}
+
+static void guest_loader_realize(DeviceState *dev, Error **errp)
+{
+    GuestLoaderState *s = GUEST_LOADER(dev);
+    char *file = s->kernel ? s->kernel : s->initrd;
+    int size = 0;
+
+    /* Perform some error checking on the user's options */
+    if (s->kernel && s->initrd) {
+        error_setg(errp, "Cannot specify a kernel and initrd in same stanza");
+        return;
+    } else if (!s->kernel && !s->initrd)  {
+        error_setg(errp, "Need to specify a kernel or initrd image");
+        return;
+    } else if (!s->addr) {
+        error_setg(errp, "Need to specify the address of guest blob");
+        return;
+    } else if (s->args && !s->kernel) {
+        error_setg(errp, "Boot args only relevant to kernel blobs");
+    }
+
+    /* Default to the maximum size being the machine's ram size */
+    size = load_image_targphys_as(file, s->addr, current_machine->ram_size,
+                                  NULL);
+    if (size < 0) {
+        error_setg(errp, "Cannot load specified image %s", file);
+        return;
+    }
+
+    /* Now the image is loaded we need to update the platform data */
+    loader_insert_platform_data(s, size, errp);
+}
+
+static Property guest_loader_props[] = {
+    DEFINE_PROP_UINT64("addr", GuestLoaderState, addr, 0),
+    DEFINE_PROP_STRING("kernel", GuestLoaderState, kernel),
+    DEFINE_PROP_STRING("bootargs", GuestLoaderState, args),
+    DEFINE_PROP_STRING("initrd", GuestLoaderState, initrd),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void guest_loader_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = guest_loader_realize;
+    device_class_set_props(dc, guest_loader_props);
+    dc->desc = "Guest Loader";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static TypeInfo guest_loader_info = {
+    .name = TYPE_GUEST_LOADER,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(GuestLoaderState),
+    .class_init = guest_loader_class_init,
+};
+
+static void guest_loader_register_type(void)
+{
+    type_register_static(&guest_loader_info);
+}
+
+type_init(guest_loader_register_type)
diff --git a/MAINTAINERS b/MAINTAINERS
index a2b92f973a..ab6877dae6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1993,6 +1993,11 @@ F: hw/core/generic-loader.c
 F: include/hw/core/generic-loader.h
 F: docs/generic-loader.txt
 
+Guest Loader
+M: Alex Bennée <alex.bennee@linaro.org>
+S: Maintained
+F: hw/core/guest-loader.c
+
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
 S: Maintained
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 032576f571..9cd72edf51 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -37,6 +37,8 @@ softmmu_ss.add(files(
   'clock-vmstate.c',
 ))
 
+softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
+
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
   'machine-qmp-cmds.c',
   'numa.c',
-- 
2.20.1


