Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A926E36EA3A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:19:49 +0200 (CEST)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5e0-0008E7-Ns
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qb-0007n7-Eg
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:58 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QU-0000SU-So
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:57 -0400
Received: by mail-pf1-x42e.google.com with SMTP id j6so6553259pfh.5
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Q6kv2VslbH0ncDkXg3ixuqMfFkJo7vcAjXCtu79UW8=;
 b=Z9wsEFweuu95U1SZpIphmqC/hgxoJgnyNVqChYqglpRRG9T0kSxvHHzYZyiQNJKcYi
 MJSiqk7WSAsy7nmMRuYo48Dt6HhaVwnmuLDpSmtiWsdPvd/rMSgLQ4+mvysm4boq3C/Q
 KKQL/2lvKMsHuWhi0jZH8yTW2Sd9apSmrYCuNvjD5jiikHTLgYaHBofAzXlFV8Un46L0
 IuwL0PfEfr9rRBLqH9X+w7XhL+QVD09u2Q7QggBQzkvWHTfxebQm+V9ovEkd6j2IRyiz
 t1nfa4p2doPAKRRgUvVoeWtFxSkn0jhmiQWzYy4VdocvDxQVeiTBKNWaUkvLzsDWjFc2
 Q5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Q6kv2VslbH0ncDkXg3ixuqMfFkJo7vcAjXCtu79UW8=;
 b=kA/VOZiGI6D5SHthClAdH1G0fquZXeqxLIt23twp5o4KgPzr9XkHyIk39Aa4IYE92S
 KeOzEDAHkaMbiA7xGG/OO+UxIi02EeiK7/RiwHL5V/Whit5hojnbSqP8WtCkGXOKNpgR
 CrSpqJzaLYc7CLMAWgQKHWTfIs4gdlONcjVShILV8Gs2k2VQKKr+3+5bB2jZYyNSY2GP
 EIzisTeubhFK8Xl4G0cY0KMFENs5tONJ/yaqqzLxPmfWgs7agyvJ1lVXe4Kn/HYEc+g9
 bAg8Sh6ukdRfIQdzoIVucxyzIXnt3O0wKzEjmyUFqL+8NLsPNR57FqCsRAkRYd0TOCJi
 dvOQ==
X-Gm-Message-State: AOAM530oAyhKwQ3xdsA04tFpB1Cp189DgvdJtGoF2+XgYUo0dZnxGeob
 MvtsVC+qI2MeUGgFb3h7TMOZrGRluUzzhQITk9Q=
X-Google-Smtp-Source: ABdhPJwqSbxYUAoXSvjoCAbJlV71dAAr+mOUHUoOWnHpqoOhcjUvMXMNYixulzeJbFhRiVqRNAKWww==
X-Received: by 2002:a63:dc49:: with SMTP id f9mr31376988pgj.361.1619697948446; 
 Thu, 29 Apr 2021 05:05:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:48 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 07/27] virtio-snd: Add properties for class init
Date: Thu, 29 Apr 2021 17:34:25 +0530
Message-Id: <20210429120445.694420-8-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
index e9c6fed826..00b4e1ca88 100644
--- a/hw/audio/Kconfig
+++ b/hw/audio/Kconfig
@@ -50,3 +50,8 @@ config CS4231
 
 config MARVELL_88W8618
     bool
+
+config VIRTIO_SND
+    bool
+    default y if PCI_DEVICES
+    depends on PCI
diff --git a/hw/audio/meson.build b/hw/audio/meson.build
index 32c42bdebe..8c7b8a1e46 100644
--- a/hw/audio/meson.build
+++ b/hw/audio/meson.build
@@ -13,3 +13,4 @@ softmmu_ss.add(when: 'CONFIG_PL041', if_true: files('pl041.c', 'lm4549.c'))
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
2.25.1


