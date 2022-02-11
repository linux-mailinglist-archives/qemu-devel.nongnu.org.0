Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC54B3041
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:18:31 +0100 (CET)
Received: from localhost ([::1]:39984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeFK-0008U2-C6
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:18:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeCC-0005T3-UV
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:16 -0500
Received: from [2607:f8b0:4864:20::42e] (port=38493
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeC9-0002zJ-RG
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:15:16 -0500
Received: by mail-pf1-x42e.google.com with SMTP id x15so16185121pfr.5
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v8lkpVJ8/lzhpZJxqdi8AMFNoo2dfjQmQL3y2LfyCdI=;
 b=M/4aLzF7gW6VaGsrb9lvfFCGmyvm49HLIc2ysvG0Qlqra/PGydrx4Jh55m/qeqEYBJ
 7d5qkGxqLEHMct60YUricyKY2ebPDtBP0kwJX1LXtgEiVRUHIJEWtO2OIO/GX74t6yC6
 LqH2phiVWBHe5mzZl4crYs9bClfHxzLpZVPvHcDI7XIcXnw70vVqP28A5jDRbO3FchWe
 BV579I7s3tBQgAaK2nZLlxhuq7ncp4TNxo0F588N40e24dxOuzeJD9grcJgFeuHjX28T
 FyCQvLVUYt4dToM/xIYr2RJiDRjY3+THx4rNs4JRPrK1hAhY55foRBz292svhjC/MUdC
 K48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8lkpVJ8/lzhpZJxqdi8AMFNoo2dfjQmQL3y2LfyCdI=;
 b=WM/Zfw32RRJ6n5jwqNdKR55xI2/InOYk8dJlRHXT4EbuAlMCPSxGFljOtVeG6NiQ0W
 UmCnqxk0cBG1aVfX7TMeq9XoWbrcJEmOZVeJn8KK7nrPaNVlS73ql6wPb00tWutRX3n6
 S7UIJLMuF/COb+K7t3Z8eYnv12mumMC+Sz4uwnhOH7JI/KGeMGbeFRCZ1O/skGS2M8um
 Y7Cg0r0eKbvMVA9Ox6gpg6dCe4f6Rq/DBFsodvf1RUSqOjv9sgMNwaN0yf+A/w5MTbaJ
 JQk33g/YYZrUXLw/cTPqdfgJGCMp4xFPUpRRFue+VXxQ4zVsZE7qf7U21KUOggt4duL1
 Yr8Q==
X-Gm-Message-State: AOAM532CsLDUvEeDy02pjNJrYR7MAunfdAMMbXhnAyv7IIjpucSVyQEP
 PmlewaezYFGxAS+Vc1ypEhTTO6gOdxM=
X-Google-Smtp-Source: ABdhPJzicC5POXN6V/eo2yNEZkWnetdsZBsQuHIGFSYsgOgTDfXPMK4FxB01e9TZhy7v+KMQXp/dRQ==
X-Received: by 2002:a62:506:: with SMTP id 6mr3705291pff.86.1644617712630;
 Fri, 11 Feb 2022 14:15:12 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:15:12 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 07/25] virtio-snd: Add properties for class init
Date: Sat, 12 Feb 2022 03:43:01 +0530
Message-Id: <20220211221319.193404-8-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added properties and function stubs for virtio sound device class
init.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/Kconfig      |   5 ++
 hw/audio/meson.build  |   1 +
 hw/audio/virtio-snd.c | 126 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 hw/audio/virtio-snd.c

diff --git a/hw/audio/Kconfig b/hw/audio/Kconfig
index e9c6fed826..d12df06699 100644
--- a/hw/audio/Kconfig
+++ b/hw/audio/Kconfig
@@ -50,3 +50,8 @@ config CS4231
 
 config MARVELL_88W8618
     bool
+
+config VIRTIO_SND
+    bool
+    default y
+    depends on VIRTIO
diff --git a/hw/audio/meson.build b/hw/audio/meson.build
index e48a9fc73d..455e6a1501 100644
--- a/hw/audio/meson.build
+++ b/hw/audio/meson.build
@@ -12,3 +12,4 @@ softmmu_ss.add(when: 'CONFIG_PL041', if_true: files('pl041.c', 'lm4549.c'))
 softmmu_ss.add(when: 'CONFIG_SB16', if_true: files('sb16.c'))
 softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('via-ac97.c'))
 softmmu_ss.add(when: 'CONFIG_WM8750', if_true: files('wm8750.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO_SND', if_true: files('virtio-snd.c'))
diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
new file mode 100644
index 0000000000..ae438aa7ec
--- /dev/null
+++ b/hw/audio/virtio-snd.c
@@ -0,0 +1,126 @@
+/*
+ * Virtio Sound device
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/atomic.h"
+#include "qemu/iov.h"
+#include "qemu/main-loop.h"
+#include "qemu/module.h"
+#include "hw/virtio/virtio.h"
+#include "audio/audio.h"
+#include "qemu/error-report.h"
+#include "qemu/timer.h"
+#include "qemu/option.h"
+#include "qemu/option_int.h"
+#include "qemu/config-file.h"
+#include "qapi/qmp/qdict.h"
+#include "hw/virtio/virtio-snd.h"
+#include "hw/virtio/virtio-bus.h"
+#include "qapi/error.h"
+#include "qapi/qapi-events-audio.h"
+#include "hw/qdev-properties.h"
+#include "qapi/qapi-types-migration.h"
+#include "qapi/qapi-events-migration.h"
+#include "migration/misc.h"
+#include "standard-headers/linux/ethtool.h"
+#include "sysemu/sysemu.h"
+#include "trace.h"
+#include "monitor/qdev.h"
+#include "hw/pci/pci.h"
+#include "intel-hda-defs.h"
+
+#define VIRTIO_SOUND_VM_VERSION 1
+
+#define VIRTIO_SOUND_JACK_DEFAULT 0
+#define VIRTIO_SOUND_STREAM_DEFAULT 1
+#define VIRTIO_SOUND_CHMAP_DEFAULT 0
+
+#define VIRTIO_SOUND_HDA_FN_NID_OUT 0
+#define VIRTIO_SOUND_HDA_FN_NID_IN 1
+
+static void virtio_snd_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+}
+
+static void virtio_snd_set_config(VirtIODevice *vdev, const uint8_t *config)
+{
+}
+
+static const VMStateDescription vmstate_virtio_snd_device = {
+    .name = "virtio-snd-device",
+    .version_id = VIRTIO_SOUND_VM_VERSION,
+    .minimum_version_id = VIRTIO_SOUND_VM_VERSION,
+};
+
+static const VMStateDescription vmstate_virtio_snd = {
+    .name = "virtio-sound",
+    .minimum_version_id = VIRTIO_SOUND_VM_VERSION,
+    .version_id = VIRTIO_SOUND_VM_VERSION,
+    .fields = (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static Property virtio_snd_properties[] = {
+    DEFINE_AUDIO_PROPERTIES(VirtIOSound, card),
+    DEFINE_PROP_UINT32("jacks", VirtIOSound, snd_conf.jacks,
+                       VIRTIO_SOUND_JACK_DEFAULT),
+    DEFINE_PROP_UINT32("streams", VirtIOSound, snd_conf.streams,
+                       VIRTIO_SOUND_STREAM_DEFAULT),
+    DEFINE_PROP_UINT32("chmaps", VirtIOSound, snd_conf.chmaps,
+                       VIRTIO_SOUND_CHMAP_DEFAULT),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static uint64_t virtio_snd_get_features(VirtIODevice *vdev, uint64_t features,
+                                        Error **errp)
+{
+    return vdev->host_features;
+}
+
+static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static void virtio_snd_device_unrealize(DeviceState *dev)
+{
+}
+
+static void virtio_snd_reset(VirtIODevice *vdev)
+{
+}
+
+static void virtio_snd_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, virtio_snd_properties);
+    dc->vmsd = &vmstate_virtio_snd;
+    set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
+    vdc->realize = virtio_snd_device_realize;
+    vdc->unrealize = virtio_snd_device_unrealize;
+    vdc->get_config = virtio_snd_get_config;
+    vdc->set_config = virtio_snd_set_config;
+    vdc->get_features = virtio_snd_get_features;
+    vdc->reset = virtio_snd_reset;
+    vdc->legacy_features = 0;
+    vdc->vmsd = &vmstate_virtio_snd_device;
+}
+
+
+static const TypeInfo virtio_snd_dev_info = {
+    .name = TYPE_VIRTIO_SOUND,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VirtIOSound),
+    .class_init = virtio_snd_class_init,
+};
+
+static void virtio_register_types(void)
+{
+    type_register_static(&virtio_snd_dev_info);
+}
+
+type_init(virtio_register_types)
-- 
2.31.1


