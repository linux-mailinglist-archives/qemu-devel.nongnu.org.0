Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD55FA362
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:31:43 +0200 (CEST)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxYz-0001l3-PA
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcI-00032Q-KP
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcF-00077t-E6
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9cxJb1dEd33VM9QAxxhn0l0rb0p7kiIaB1Wpir2Wp88=;
 b=PrCXwqiX9Rljy7UBYhsaAgO8CivfbUIxG9rFK2/5EdaE+vjSUq9ZRr04nEd9LTjlv53kY0
 /WlxWIqqc8p0II7dGY504KWfjzyULoQVdx1XmsuxoLW2hQ2/vNUTPxH8lN9oc9JPmzZVu/
 heh+bPyOlK8sq5xEFIcSzgzjbxeAyBM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-07nYwWn1NVKd2KjnaFqPMw-1; Mon, 10 Oct 2022 13:30:57 -0400
X-MC-Unique: 07nYwWn1NVKd2KjnaFqPMw-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so5820246wmb.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9cxJb1dEd33VM9QAxxhn0l0rb0p7kiIaB1Wpir2Wp88=;
 b=muINlgus5P7i80GqQ/IDVXgwKgKaYJyKMYjS+ghHtxade8aB0pehUDcWpw1Rh7uuOQ
 ekDuOuI9XZznESex2apOZuiNEa9k0lYAfLKJqUX+LbJnLvl5G3cJ/3iZUbs8SlYxvkZ2
 zoFnBLEttAYA1mTKA09pDqVolFLu0kXnOXBm+oW8fPbO14TiSnyaP56q6D7I6YZVqLBk
 Ot08+d2g3y+vc+/+XM6PHW7ID93A0wsn01UIZP2s2B2idUlCSvOIogW8oBszblDBt8AO
 VT3OlvRcGvMMMTKG9IHVM2hBY4oB+e8IalYJHQ4XHEbWqBIKYeF/bjX+AWleRNz2vP4p
 hPHw==
X-Gm-Message-State: ACrzQf0qdiWwEN66gun+0o8pJ21UqVyq58/ZgQnxqwPUumf/m2zHCYw+
 apvxxhPfdPGR6Gov3Ysizq1BEGdgTVbVYOvuiXuiBwbt+OzKaBpdFYvHfaTcHAvaJuxktHP7xvZ
 mi3jePE6ZCpdqvz5UMm2c8YOgk+8U19ZnYucuIKBvAt1s/8quDJrduWN23pCt
X-Received: by 2002:adf:f301:0:b0:22e:4479:c1ba with SMTP id
 i1-20020adff301000000b0022e4479c1bamr12285802wro.133.1665423056442; 
 Mon, 10 Oct 2022 10:30:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4R3/inZPYzzlITQIwVg/mfR6zFaSY6WX3hoPyfn8Xr1MBgnTd0mYvtwSD8YG0cJRmvIrwYjg==
X-Received: by 2002:adf:f301:0:b0:22e:4479:c1ba with SMTP id
 i1-20020adff301000000b0022e4479c1bamr12285774wro.133.1665423056034; 
 Mon, 10 Oct 2022 10:30:56 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b003a1980d55c4sm919540wms.47.2022.10.10.10.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:55 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Jonah Palmer <jonah.palmer@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 30/55] qmp: add QMP command x-query-virtio
Message-ID: <20221010172813.204597-31-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command lists all the instances of VirtIODevices with
their canonical QOM path and name.

[Jonah: @virtio_list duplicates information that already exists in
 the QOM composition tree. However, extracting necessary information
 from this tree seems to be a bit convoluted.

 Instead, we still create our own list of realized virtio devices
 but use @qmp_qom_get with the device's canonical QOM path to confirm
 that the device exists and is realized. If the device exists but
 is actually not realized, then we remove it from our list (for
 synchronicity to the QOM composition tree).

 Also, the QMP command @x-query-virtio is redundant as @qom-list
 and @qom-get are sufficient to search '/machine/' for realized
 virtio devices. However, @x-query-virtio is much more convenient
 in listing realized virtio devices.]

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
Message-Id: <1660220684-24909-2-git-send-email-jonah.palmer@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 hw/virtio/virtio-stub.c    | 14 ++++++++
 hw/virtio/virtio.c         | 44 ++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 hw/virtio/meson.build      |  2 ++
 qapi/meson.build           |  1 +
 8 files changed, 132 insertions(+)
 create mode 100644 qapi/virtio.json
 create mode 100644 hw/virtio/virtio-stub.c

diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 92d7ecc52c..f000b90744 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -94,3 +94,4 @@
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
 { 'include': 'stats.json' }
+{ 'include': 'virtio.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000000..03896e423f
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,68 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = Virtio devices
+##
+
+##
+# @VirtioInfo:
+#
+# Basic information about a given VirtIODevice
+#
+# @path: The VirtIODevice's canonical QOM path
+#
+# @name: Name of the VirtIODevice
+#
+# Since: 7.1
+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': { 'path': 'str',
+            'name': 'str' } }
+
+##
+# @x-query-virtio:
+#
+# Returns a list of all realized VirtIODevices
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: List of gathered VirtIODevices
+#
+# Since: 7.1
+#
+# Example:
+#
+# -> { "execute": "x-query-virtio" }
+# <- { "return": [
+#          {
+#              "name": "virtio-input",
+#              "path": "/machine/peripheral-anon/device[4]/virtio-backend"
+#          },
+#          {
+#              "name": "virtio-crypto",
+#              "path": "/machine/peripheral/crypto0/virtio-backend"
+#          },
+#          {
+#              "name": "virtio-scsi",
+#              "path": "/machine/peripheral-anon/device[2]/virtio-backend"
+#          },
+#          {
+#              "name": "virtio-net",
+#              "path": "/machine/peripheral-anon/device[1]/virtio-backend"
+#          },
+#          {
+#              "name": "virtio-serial",
+#              "path": "/machine/peripheral-anon/device[0]/virtio-backend"
+#          }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio',
+  'returns': [ 'VirtioInfo' ],
+  'features': [ 'unstable' ] }
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index cecfb7c552..9eeb958e39 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -122,6 +122,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
 
 struct VirtioDeviceClass {
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
new file mode 100644
index 0000000000..05a81edc92
--- /dev/null
+++ b/hw/virtio/virtio-stub.c
@@ -0,0 +1,14 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+
+static void *qmp_virtio_unsupported(Error **errp)
+{
+    error_setg(errp, "Virtio is disabled");
+    return NULL;
+}
+
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 2cc1d7d24a..4fc7c80d3f 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,12 +13,18 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-commands-qom.h"
+#include "qapi/qapi-visit-virtio.h"
+#include "qapi/qmp/qjson.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "qom/object_interfaces.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/atomic.h"
@@ -29,6 +35,9 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+/* QAPI list of realized VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3707,6 +3716,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
     vdev->listener.commit = virtio_memory_listener_commit;
     vdev->listener.name = "virtio";
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3721,6 +3731,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3894,6 +3905,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3904,6 +3917,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
 
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        Error *err = NULL;
+        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
+
+        if (err == NULL) {
+            GString *is_realized = qobject_to_json_pretty(obj, true);
+            /* virtio device is NOT realized, remove it from list */
+            if (!strncmp(is_realized->str, "false", 4)) {
+                QTAILQ_REMOVE(&virtio_list, vdev, next);
+            } else {
+                node = g_new0(VirtioInfoList, 1);
+                node->value = g_new(VirtioInfo, 1);
+                node->value->path = g_strdup(dev->canonical_path);
+                node->value->name = g_strdup(vdev->name);
+                QAPI_LIST_PREPEND(list, node->value);
+            }
+           g_string_free(is_realized, true);
+        }
+        qobject_unref(obj);
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index af00712458..897e4e937b 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -103,6 +103,7 @@ static bool query_is_ignored(const char *cmd)
         "query-gic-capabilities", /* arm */
         /* Success depends on target-specific build configuration: */
         "query-pci",              /* CONFIG_PCI */
+        "x-query-virtio",         /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         "query-sev-launch-measure",
         /* Success depends on Host or Hypervisor SEV support */
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index c14e3db10a..dfed1e7af5 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -62,4 +62,6 @@ virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: virtio_ss)
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
diff --git a/qapi/meson.build b/qapi/meson.build
index 840f1b0e19..9a36c15c04 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -49,6 +49,7 @@ qapi_all_modules = [
   'stats',
   'trace',
   'transaction',
+  'virtio',
   'yank',
 ]
 if have_system
-- 
MST


