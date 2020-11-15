Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8112B34A5
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 12:40:03 +0100 (CET)
Received: from localhost ([::1]:58402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keGO3-0000OG-0d
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 06:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKL-0004pk-Lh; Sun, 15 Nov 2020 06:36:13 -0500
Received: from mout.web.de ([217.72.192.78]:58141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKI-0008DK-6n; Sun, 15 Nov 2020 06:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605440163;
 bh=gvEu2P710aTKvOOzPDI2YgsK1lHUggQxU9Jsb/WaOl0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=JmGPgJPa8RgOhnfDdfPyk85JAendgH032EH/1HnYcVcwsWe7LBmtenvj+Qul9f5V3
 m5rYhtRBgm44F123vfRhv1JeUYDcaB9ylS4827s1hX1v6kmwOxLf1jhaJDmEcxyIg3
 7CIWJOmwuyViyWeq5E2q4t+vYTxvU9pSAk1v0KaY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N6sBp-1kDH360vL5-017xLl; Sun, 15
 Nov 2020 12:36:03 +0100
Date: Sun, 15 Nov 2020 12:36:01 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v11 1/7] Introduce yank feature
Message-ID: <2f88d8992faf582fc5172a8a09ec0a2df241e4f2.1605439674.git.lukasstraub2@web.de>
In-Reply-To: <cover.1605439674.git.lukasstraub2@web.de>
References: <cover.1605439674.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lGHQHFukjTCL.bXa6.QbNXb";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:Bmh8ztOTzqUx4M3qD22MidelPwobCZ3uhbthuYrRV4Gu7vRgkEZ
 oM5np8FwJfka87ve2uVFUiqXW3jnm/ExzZTQzMolurOGNmUduz7VfukbbjmKThYP/FIIa1H
 HeYXKAIXsUSm4iGUFYU7/yttXBJ/DOqasWBQ+xBIkIUxQkn62Cj6D+rkyLSWCvf3NBpZxks
 7uQJiP0585xBENkIJ8Btw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sdYEhh5+JBA=:np+ceTIF4I+9TPUFlKquiC
 U9mN/xBvdvKeT7SCFzSUJ8nM9X5uXe9TL+p4lNgWLKFcnwSslAF/m/OBG90PBs7RoNHf5pNGp
 jRG9ys1+8mvOwsBEyR2DDhowy7O6pL0Kpj4KtGEU8s9BAQAE4Zu3DZ+85G6ZpF6PehjIY/KfE
 ULafN63IJaPpdqOaTps0cHMDddcO9MQ7d7OBYlcjZJez0/an+oiRGKmAHkMR3BooffHCdWnrr
 a3s2BUT+J6sHUJMKuocTTa7PVb2Nfuz0SAzCtollUDbYuVHDd2r4PzeRwOtJQZcgKXDV//Htl
 Rsyo7BkX0k9x+zHJmPSAGDlY0mnLP8Ht8woGx9ghta4yGG7Cy7XRFNr7zdap72owJofW6htuI
 hQv4Ix5X/wl6PB2CriDe/c6z4ouVTLZo8ssztfqf3KtImxc3Blf1kW9FxgL05Q9ykITLRMv4/
 b5Hiin28jWk49aM3GaqmWmDxUeUdkqlcYZu+BluIjnik4UOnm401AyyS/H57ZJAVCLE0HZWqy
 gF8vm+1l1B3RodvEbuSmOxOoJoYd/lTreOuIothf2KOeL2tfp1OWq9IxNqx0KNkywr957OKt5
 prLRh3u5hFA34zVqLMt2cawKoRELg+jytMKqtG5OnI0r01caRBQJeXvCvtGoCHMUPAeoNGzVv
 aHKNQUDpuJBuWGCiIVHX4N8e5Un7W5/hPDsfp+S0SfGxj0lwPFJKkFlnJgN+tq1sDn2LA2t1h
 zXnr7CJLmzxK3OrhV4lGojb/ISqCiRgPIYBDFu1bc4j35NWQiiYKaXhQQTtO11YAjnWaEeqFy
 Pf3NQVnGeUgd8SDO0GOlTHj/eTEdlRmF0NOD6ridfoMnqNcg/lwvqPs7Gpgkv0mOQX4FsmEHW
 /LAiN0LENEaZVdw+DSkQ==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 05:44:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/lGHQHFukjTCL.bXa6.QbNXb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The yank feature allows to recover from hanging qemu by "yanking"
at various parts. Other qemu systems can register themselves and
multiple yank functions. Then all yank functions for selected
instances can be called by the 'yank' out-of-band qmp command.
Available instances can be queried by a 'query-yank' oob command.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS           |   7 ++
 include/qemu/yank.h   |  95 +++++++++++++++++++
 qapi/meson.build      |   1 +
 qapi/qapi-schema.json |   1 +
 qapi/yank.json        | 119 +++++++++++++++++++++++
 util/meson.build      |   1 +
 util/yank.c           | 216 ++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 440 insertions(+)
 create mode 100644 include/qemu/yank.h
 create mode 100644 qapi/yank.json
 create mode 100644 util/yank.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e018a0c1d..46ff468b13 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2688,6 +2688,13 @@ F: util/uuid.c
 F: include/qemu/uuid.h
 F: tests/test-uuid.c

+Yank feature
+M: Lukas Straub <lukasstraub2@web.de>
+S: Odd fixes
+F: util/yank.c
+F: include/qemu/yank.h
+F: qapi/yank.json
+
 COLO Framework
 M: zhanghailiang <zhang.zhanghailiang@huawei.com>
 S: Maintained
diff --git a/include/qemu/yank.h b/include/qemu/yank.h
new file mode 100644
index 0000000000..96f5b2626f
--- /dev/null
+++ b/include/qemu/yank.h
@@ -0,0 +1,95 @@
+/*
+ * QEMU yank feature
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef YANK_H
+#define YANK_H
+
+#include "qapi/qapi-types-yank.h"
+
+typedef void (YankFn)(void *opaque);
+
+/**
+ * yank_register_instance: Register a new instance.
+ *
+ * This registers a new instance for yanking. Must be called before any ya=
nk
+ * function is registered for this instance.
+ *
+ * This function is thread-safe.
+ *
+ * @instance: The instance.
+ * @errp: Error object.
+ */
+void yank_register_instance(const YankInstance *instance, Error **errp);
+
+/**
+ * yank_unregister_instance: Unregister a instance.
+ *
+ * This unregisters a instance. Must be called only after every yank funct=
ion
+ * of the instance has been unregistered.
+ *
+ * This function is thread-safe.
+ *
+ * @instance: The instance.
+ */
+void yank_unregister_instance(const YankInstance *instance);
+
+/**
+ * yank_register_function: Register a yank function
+ *
+ * This registers a yank function. All limitations of qmp oob commands app=
ly
+ * to the yank function as well. See docs/devel/qapi-code-gen.txt under
+ * "An OOB-capable command handler must satisfy the following conditions".
+ *
+ * This function is thread-safe.
+ *
+ * @instance: The instance.
+ * @func: The yank function.
+ * @opaque: Will be passed to the yank function.
+ */
+void yank_register_function(const YankInstance *instance,
+                            YankFn *func,
+                            void *opaque);
+
+/**
+ * yank_unregister_function: Unregister a yank function
+ *
+ * This unregisters a yank function.
+ *
+ * This function is thread-safe.
+ *
+ * @instance: The instance.
+ * @func: func that was passed to yank_register_function.
+ * @opaque: opaque that was passed to yank_register_function.
+ */
+void yank_unregister_function(const YankInstance *instance,
+                              YankFn *func,
+                              void *opaque);
+
+/**
+ * yank_generic_iochannel: Generic yank function for iochannel
+ *
+ * This is a generic yank function which will call qio_channel_shutdown on=
 the
+ * provided QIOChannel.
+ *
+ * @opaque: QIOChannel to shutdown
+ */
+void yank_generic_iochannel(void *opaque);
+
+#define BLOCKDEV_YANK_INSTANCE(the_node_name) (&(YankInstance) { \
+        .type =3D YANK_INSTANCE_TYPE_BLOCK_NODE, \
+        .u.block_node.node_name =3D (the_node_name) })
+
+#define CHARDEV_YANK_INSTANCE(the_id) (&(YankInstance) { \
+        .type =3D YANK_INSTANCE_TYPE_CHARDEV, \
+        .u.chardev.id =3D (the_id) })
+
+#define MIGRATION_YANK_INSTANCE (&(YankInstance) { \
+        .type =3D YANK_INSTANCE_TYPE_MIGRATION })
+
+#endif
diff --git a/qapi/meson.build b/qapi/meson.build
index 0e98146f1f..ab68e7900e 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -47,6 +47,7 @@ qapi_all_modules =3D [
   'trace',
   'transaction',
   'ui',
+  'yank',
 ]

 qapi_storage_daemon_modules =3D [
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 0b444b76d2..3441c9a9ae 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -86,6 +86,7 @@
 { 'include': 'machine.json' }
 { 'include': 'machine-target.json' }
 { 'include': 'replay.json' }
+{ 'include': 'yank.json' }
 { 'include': 'misc.json' }
 { 'include': 'misc-target.json' }
 { 'include': 'audio.json' }
diff --git a/qapi/yank.json b/qapi/yank.json
new file mode 100644
index 0000000000..167a775594
--- /dev/null
+++ b/qapi/yank.json
@@ -0,0 +1,119 @@
+# -*- Mode: Python -*-
+# vim: filetype=3Dpython
+#
+
+##
+# =3D Yank feature
+##
+
+##
+# @YankInstanceType:
+#
+# An enumeration of yank instance types. See @YankInstance for more
+# information.
+#
+# Since: 6.0
+##
+{ 'enum': 'YankInstanceType',
+  'data': [ 'block-node', 'chardev', 'migration' ] }
+
+##
+# @YankInstanceBlockNode:
+#
+# Specifies which block graph node to yank. See @YankInstance for more
+# information.
+#
+# @node-name: the name of the block graph node
+#
+# Since: 6.0
+##
+{ 'struct': 'YankInstanceBlockNode',
+  'data': { 'node-name': 'str' } }
+
+##
+# @YankInstanceChardev:
+#
+# Specifies which character device to yank. See @YankInstance for more
+# information.
+#
+# @id: the chardev's ID
+#
+# Since: 6.0
+##
+{ 'struct': 'YankInstanceChardev',
+  'data': { 'id': 'str' } }
+
+##
+# @YankInstance:
+#
+# A yank instance can be yanked with the @yank qmp command to recover from=
 a
+# hanging QEMU.
+#
+# Currently implemented yank instances:
+#  - nbd block device:
+#    Yanking it will shut down the connection to the nbd server without
+#    attempting to reconnect.
+#  - socket chardev:
+#    Yanking it will shut down the connected socket.
+#  - migration:
+#    Yanking it will shut down all migration connections. Unlike
+#    @migrate_cancel, it will not notify the migration process, so migrati=
on
+#    will go into @failed state, instead of @cancelled state. @yank should=
 be
+#    used to recover from hangs.
+#
+# Since: 6.0
+##
+{ 'union': 'YankInstance',
+  'base': { 'type': 'YankInstanceType' },
+  'discriminator': 'type',
+  'data': {
+      'block-node': 'YankInstanceBlockNode',
+      'chardev': 'YankInstanceChardev' } }
+
+##
+# @yank:
+#
+# Try to recover from hanging QEMU by yanking the specified instances. See
+# @YankInstance for more information.
+#
+# Takes a list of @YankInstance as argument.
+#
+# Returns: - Nothing on success
+#          - @DeviceNotFound error, if any of the YankInstances doesn't ex=
ist
+#
+# Example:
+#
+# -> { "execute": "yank",
+#      "arguments": {
+#          "instances": [
+#               { "type": "block-node",
+#                 "node-name": "nbd0" }
+#          ] } }
+# <- { "return": {} }
+#
+# Since: 6.0
+##
+{ 'command': 'yank',
+  'data': { 'instances': ['YankInstance'] },
+  'allow-oob': true }
+
+##
+# @query-yank:
+#
+# Query yank instances. See @YankInstance for more information.
+#
+# Returns: list of @YankInstance
+#
+# Example:
+#
+# -> { "execute": "query-yank" }
+# <- { "return": [
+#          { "type": "block-node",
+#            "node-name": "nbd0" }
+#      ] }
+#
+# Since: 6.0
+##
+{ 'command': 'query-yank',
+  'returns': ['YankInstance'],
+  'allow-oob': true }
diff --git a/util/meson.build b/util/meson.build
index f359af0d46..f7c67344e1 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -50,6 +50,7 @@ endif

 if have_system
   util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
+  util_ss.add(files('yank.c'))
 endif

 if have_block
diff --git a/util/yank.c b/util/yank.c
new file mode 100644
index 0000000000..4a0f538359
--- /dev/null
+++ b/util/yank.c
@@ -0,0 +1,216 @@
+/*
+ * QEMU yank feature
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/thread.h"
+#include "qemu/queue.h"
+#include "qapi/qapi-commands-yank.h"
+#include "qapi/qapi-visit-yank.h"
+#include "qapi/clone-visitor.h"
+#include "io/channel.h"
+#include "qemu/yank.h"
+
+struct YankFuncAndParam {
+    YankFn *func;
+    void *opaque;
+    QLIST_ENTRY(YankFuncAndParam) next;
+};
+
+struct YankInstanceEntry {
+    YankInstance *instance;
+    QLIST_HEAD(, YankFuncAndParam) yankfns;
+    QLIST_ENTRY(YankInstanceEntry) next;
+};
+
+typedef struct YankFuncAndParam YankFuncAndParam;
+typedef struct YankInstanceEntry YankInstanceEntry;
+
+/*
+ * This lock protects the yank_instance_list below. Because it's taken by
+ * OOB-capable commands, it must be "fast", i.e. it may only be held for a
+ * bounded, short time. See docs/devel/qapi-code-gen.txt for additional
+ * information.
+ */
+static QemuMutex yank_lock;
+
+static QLIST_HEAD(, YankInstanceEntry) yank_instance_list
+    =3D QLIST_HEAD_INITIALIZER(yank_instance_list);
+
+static bool yank_compare_instances(const YankInstance *a, const YankInstan=
ce *b)
+{
+    if (a->type !=3D b->type) {
+        return false;
+    }
+
+    switch (a->type) {
+    case YANK_INSTANCE_TYPE_BLOCK_NODE:
+        return !strcmp(a->u.block_node.node_name, b->u.block_node.node_nam=
e);
+    break;
+
+    case YANK_INSTANCE_TYPE_CHARDEV:
+        return !strcmp(a->u.chardev.id, b->u.chardev.id);
+    break;
+
+    case YANK_INSTANCE_TYPE_MIGRATION:
+        return true;
+    break;
+
+    default:
+        abort();
+    }
+}
+
+static YankInstanceEntry *yank_find_entry(const YankInstance *instance)
+{
+    YankInstanceEntry *entry;
+
+    QLIST_FOREACH(entry, &yank_instance_list, next) {
+        if (yank_compare_instances(entry->instance, instance)) {
+            return entry;
+        }
+    }
+    return NULL;
+}
+
+void yank_register_instance(const YankInstance *instance, Error **errp)
+{
+    YankInstanceEntry *entry;
+
+    qemu_mutex_lock(&yank_lock);
+
+    if (yank_find_entry(instance)) {
+        error_setg(errp, "duplicate yank instance");
+        qemu_mutex_unlock(&yank_lock);
+        return;
+    }
+
+    entry =3D g_slice_new(YankInstanceEntry);
+    entry->instance =3D QAPI_CLONE(YankInstance, instance);
+    QLIST_INIT(&entry->yankfns);
+    QLIST_INSERT_HEAD(&yank_instance_list, entry, next);
+
+    qemu_mutex_unlock(&yank_lock);
+}
+
+void yank_unregister_instance(const YankInstance *instance)
+{
+    YankInstanceEntry *entry;
+
+    qemu_mutex_lock(&yank_lock);
+    entry =3D yank_find_entry(instance);
+    assert(entry);
+
+    assert(QLIST_EMPTY(&entry->yankfns));
+    QLIST_REMOVE(entry, next);
+    qapi_free_YankInstance(entry->instance);
+    g_slice_free(YankInstanceEntry, entry);
+
+    qemu_mutex_unlock(&yank_lock);
+}
+
+void yank_register_function(const YankInstance *instance,
+                            YankFn *func,
+                            void *opaque)
+{
+    YankInstanceEntry *entry;
+    YankFuncAndParam *func_entry;
+
+    qemu_mutex_lock(&yank_lock);
+    entry =3D yank_find_entry(instance);
+    assert(entry);
+
+    func_entry =3D g_slice_new(YankFuncAndParam);
+    func_entry->func =3D func;
+    func_entry->opaque =3D opaque;
+
+    QLIST_INSERT_HEAD(&entry->yankfns, func_entry, next);
+    qemu_mutex_unlock(&yank_lock);
+}
+
+void yank_unregister_function(const YankInstance *instance,
+                              YankFn *func,
+                              void *opaque)
+{
+    YankInstanceEntry *entry;
+    YankFuncAndParam *func_entry;
+
+    qemu_mutex_lock(&yank_lock);
+    entry =3D yank_find_entry(instance);
+    assert(entry);
+
+    QLIST_FOREACH(func_entry, &entry->yankfns, next) {
+        if (func_entry->func =3D=3D func && func_entry->opaque =3D=3D opaq=
ue) {
+            QLIST_REMOVE(func_entry, next);
+            g_slice_free(YankFuncAndParam, func_entry);
+            qemu_mutex_unlock(&yank_lock);
+            return;
+        }
+    }
+
+    abort();
+}
+
+void yank_generic_iochannel(void *opaque)
+{
+    QIOChannel *ioc =3D QIO_CHANNEL(opaque);
+
+    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+}
+
+void qmp_yank(YankInstanceList *instances,
+              Error **errp)
+{
+    YankInstanceList *tail;
+    YankInstanceEntry *entry;
+    YankFuncAndParam *func_entry;
+
+    qemu_mutex_lock(&yank_lock);
+    for (tail =3D instances; tail; tail =3D tail->next) {
+        entry =3D yank_find_entry(tail->value);
+        if (!entry) {
+            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "Instance not fo=
und");
+            qemu_mutex_unlock(&yank_lock);
+            return;
+        }
+    }
+    for (tail =3D instances; tail; tail =3D tail->next) {
+        entry =3D yank_find_entry(tail->value);
+        assert(entry);
+        QLIST_FOREACH(func_entry, &entry->yankfns, next) {
+            func_entry->func(func_entry->opaque);
+        }
+    }
+    qemu_mutex_unlock(&yank_lock);
+}
+
+YankInstanceList *qmp_query_yank(Error **errp)
+{
+    YankInstanceEntry *entry;
+    YankInstanceList *ret;
+
+    ret =3D NULL;
+
+    qemu_mutex_lock(&yank_lock);
+    QLIST_FOREACH(entry, &yank_instance_list, next) {
+        YankInstanceList *new_entry;
+        new_entry =3D g_new0(YankInstanceList, 1);
+        new_entry->value =3D QAPI_CLONE(YankInstance, entry->instance);
+        new_entry->next =3D ret;
+        ret =3D new_entry;
+    }
+    qemu_mutex_unlock(&yank_lock);
+
+    return ret;
+}
+
+static void __attribute__((__constructor__)) yank_init(void)
+{
+    qemu_mutex_init(&yank_lock);
+}
--
2.20.1


--Sig_/lGHQHFukjTCL.bXa6.QbNXb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+xEqEACgkQNasLKJxd
slhgeQ//UxeVy9ZzWC0wKGQJ7sFoL2AOsRgpz+zhgGSLg2JDTz+aa2YW6u1PIpOd
QU6jbE2yuAEfoh18+4JJHBRyvULq97RQ6dISel5SGX2zE8E4//PcTcsX6HtRV/7V
G/kN5haIP1yCEgmiJ/R9l2r9+OkZOwzd/NKtR9w1AsAZuLTRckqt4MjQsU5GgXLz
7HFXWBF9SL7rODDfdBEmQFvQFeJadyLBeHAa4q+b6iO159FKu/tZOHQPT4mmjTSI
x0saH0gEoWJ6VPXJSc2GBeHT6zxsGSeA6IZ/t4NSYfK5/Tc6J/LMawhD0dYxUHYw
22NvSfOBdTRmxNdN62R8WrtFfpYu5YrTK8cId4RwHkGgzX9k2ktx2EP2pC0RJYBx
0z+uXYtdtD1C6L/6Ta919oUQEqBcuCA4SSuuzatK+BzQztUz0grxnfWzR8jwQmnQ
bGp3aCVUprys0msu6lf6SytMw5YuibtYlKJXpilQ7CoCh0XbW3urkTVwZxFPGMGQ
39bBUVqq25IesoYI1/TDletytNLxN9BSSIIZ74vMV27BolRTTi8cOle8PTed1O/M
Y9I3h9iBw6oY9H+R1up1M7HmusBI43wUaXar4Uzwoy5CdUkUJZqll/Py24+yyluV
ZYxf3HLFTAOpSmiGdBkAFmwHfgeVToyVor58hs51oQMonDpmDt8=
=WNSN
-----END PGP SIGNATURE-----

--Sig_/lGHQHFukjTCL.bXa6.QbNXb--

