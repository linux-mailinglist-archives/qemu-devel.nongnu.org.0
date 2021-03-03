Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7529C32B980
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:38:38 +0100 (CET)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVSH-0001m2-F8
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQZ-0008QA-Kz
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:36:51 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQX-0002oy-Fd
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:36:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id f12so20800862wrx.8
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 09:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iHRfGlUF89rzuFd8QIBdIG6ipsTcEiSa/7G6DKHjb/Y=;
 b=UOi2W9Dajv94ODNf3/ndcLHC6JWe1BQOkEN2kAEHGDw5p5RBgH4uz0tXKuArDs5yN0
 nJJ+VRAVNrSSWVLHxU4qDHQLwi9/6j4lLig/7nZ4YeoSXnYZ9rGgtZbZUs/bW4Co+vBN
 suRS7evWcePgIzOxwSRZWeOlPsx6sdixObqGqan8hgtb8do8DHvh3HlEzE4vbaFeuPbo
 +tgoLte9xfzOBFARBUzx2cCEqcXd9TGmsaKsJZezRhSUoCeCGm5ZyF7De2UMhlbV62h7
 NgXjCsV1XF+pH4KxrDSeFhSxhzcHTy7rCqws0yOOZNoBUuAdUV7O9PcHay08tmSnbaNN
 oMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iHRfGlUF89rzuFd8QIBdIG6ipsTcEiSa/7G6DKHjb/Y=;
 b=hldWVAAzFcbJoG2g1euHXcH60vK5kcSVd2T0Gj/B8KA4LDuSLhAIWT9/3Rnf88cIxi
 TWsK5+nssmHVJC/6UlNYAJXCQV+ceRiGyIMVwnqSHdLBgl/+p15KbeGvn0PzqG03uT8z
 NcM+QguJYVd2OpKjcvU25Wr6vaKucYALQAApq03kqIgX4hGkq8MdITbiGnu5wY4MAkmL
 /gto5NA6YnUYbfp9Z+Yn2UDX0n5c9Eq00oQyH1H+JhHF9CXWUYe4YsrbLo+601lfJYGy
 xhrLKDV82RDcop22brH8Phlrcx3m0TOACSfyiXgVIW45pdNB/ElEckxv/ehy4xGf39LK
 9JOQ==
X-Gm-Message-State: AOAM531RUf7CYpQQxjHD0UrgBCGE1uDrfplWghRQKCuyMpntUXKKt+4t
 39K2weYhYU/pdP7wk7+j1RTkdg==
X-Google-Smtp-Source: ABdhPJzH5LNshn4liYj21qEXwr6UDgNeTa8jKYfPwDETPglDH26uQdqZqjvZV6ov7HY6Hklz3lKKNA==
X-Received: by 2002:adf:e582:: with SMTP id l2mr28610370wrm.207.1614793008181; 
 Wed, 03 Mar 2021 09:36:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h19sm6231629wmq.47.2021.03.03.09.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:36:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B07741FF90;
 Wed,  3 Mar 2021 17:36:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] hw/core: implement a guest-loader to support static
 hypervisor guests
Date: Wed,  3 Mar 2021 17:36:39 +0000
Message-Id: <20210303173642.3805-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303173642.3805-1-alex.bennee@linaro.org>
References: <20210303173642.3805-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201105175153.30489-5-alex.bennee@linaro.org>
Message-Id: <20210211171945.18313-5-alex.bennee@linaro.org>
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
index 9b2aa18e1f..a5b87d5e30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2007,6 +2007,11 @@ F: hw/core/generic-loader.c
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


