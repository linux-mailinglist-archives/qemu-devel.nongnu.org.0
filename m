Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECFA2E4146
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:05:26 +0100 (CET)
Received: from localhost ([::1]:37564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktu5N-0007yc-Tn
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttyv-0002ab-FV; Mon, 28 Dec 2020 09:58:45 -0500
Received: from mout.web.de ([212.227.15.4]:34979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttyt-0006UE-0j; Mon, 28 Dec 2020 09:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609167517;
 bh=c6FfVc+byKtb69C0CFFTeXZSrqu/gbhekO2xdI6rVjo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=I/Nspn5Pxl+zQ9w9iJyXC5QT99Il7TnnmCOd3zVw/Tj+wSstDqTjWpf8qzzcTi7zO
 vgA/7NcM7mOdZIJh9j3RQSfNzyLnpff7ZyN2HoKeSFYUQJk3j2uEPzOmIAV26pvnZ1
 ql+Z05N0eovRjIt6lrxCEzd9eq2ut5BPUdgmSsvM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MWS0g-1kW8jW3Hkg-00Xe1m; Mon, 28
 Dec 2020 15:58:36 +0100
Date: Mon, 28 Dec 2020 15:58:35 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v13 1/7] Introduce yank feature
Message-ID: <6cd43b6001d1421d59053879ffab303777dd2518.1609166587.git.lukasstraub2@web.de>
In-Reply-To: <cover.1609166587.git.lukasstraub2@web.de>
References: <cover.1609166587.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nj_kbc4gUi2ziHJ0vxwBbfp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:2tWTsCqAfa5KSq74wRLpOaKm+eGbnoS0hXuJQTiNnqhBC5OWlGD
 PowzzciY6HoIB08aQ48r1/G1r54Wwt7Y8OmHCXHqJFw1jO1W1OkyHPp8y8gKzMXTQ7j6HXb
 EO8FNJhg1QKBuci9cLRkJjhvbwPN4WN8BuNSPnz4JD/lVc5pke+1qEUnPoVoP25EiwKUqd/
 H3VYmc1hX0dS1gF8rYuiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0ScizXyWWAg=:eJFgfLXTM7oQuA5Z5mF+FQ
 MuJxMWCQ8lI3CmjM76pI8pg7AHFfmwDoU+06P64cu041hOf4sSAJTuBhaBW/YnyGyaV2zlj4D
 HKBRVKDp/1ZU5FYMqRQqEzV4C8IBdOHdz186dNy6QOHcsLs7NKNoIwP6Al/N3ZrnKxmCpQMno
 gZBHY1KdrNMOt4twTbZB/LGZyc+6q1/hB8hoIEkVOg+px/aJ5Np2uSr44xRwpxSUE+mBTv0gi
 HWsQ9K5ycAvJdtXWhiAy4JyOPRwwtNwb4CrcdIKBMkMlpoWISyZRaKH33AzYhTUVGUIij/Uco
 hOMtw4dvv8SivZSTxudg5GTZ9XvAzbp8gruSNZFM+oevO9cYeId0FkPGYhlNLqV0EavRPzc6t
 LvcVRF6/8TBGFiCfSO/f+NqkCUmRUrkjm+Q5NqcmPqMvJNLNSgE6GacyFwtRxNYd6ZwrAPj8E
 /nzVwshVhFYnfdAxEKPQXueXVQxr59tQ6rSHwKkiVhnql7RWcC5IZpkmCVZZeNfEGW/x85U5O
 Fb5OMBiCyuoh1X707o+q/sxCG31d7CLq1U2Y/RDfAQgOHUiqWFI+OZqDveUQ0yFsMI69l9aq3
 ES5pgmFnE5uSq0ptmqZ/EEHLQvIKLHSG8SOFLZk1RTw5epAKMb7xoMRJ1m6TdYWr3WgO1WZUW
 bAE1P+vhKnrse+infbE5mosI8sI8188LgU8udVIQL3DkEOy0rBeUB4Q35mE9JiI/bWSsVOugS
 Ad1TuqnkZRj01iOs6xr25NxARuu/b9wOTuf31iBsgJ9rBXvUKi0BrZ3MG/0sM6knWCIWYpL4B
 zEtOF/KxlxHQCaudERrQQH80K4wZyg6ISt/jNB4ltXaE6kGnrv07RDwmJTHfIjZAkJi/UA+FX
 3QqL2nq+n1THH1rdx8gndttJQZ2j+OaQyudx4fzIw=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=
 =?UTF-8?B?XA==?=" <berrange@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr.
 David Alan  Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/nj_kbc4gUi2ziHJ0vxwBbfp
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
 include/qemu/yank.h   |  97 ++++++++++++++++++++
 qapi/meson.build      |   1 +
 qapi/qapi-schema.json |   1 +
 qapi/yank.json        | 119 ++++++++++++++++++++++++
 util/meson.build      |   1 +
 util/yank.c           | 206 ++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 432 insertions(+)
 create mode 100644 include/qemu/yank.h
 create mode 100644 qapi/yank.json
 create mode 100644 util/yank.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e7c8f0488..f465a4045a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2716,6 +2716,13 @@ F: util/uuid.c
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
index 0000000000..5b93c70cbf
--- /dev/null
+++ b/include/qemu/yank.h
@@ -0,0 +1,97 @@
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
+ *
+ * Returns true on success or false if an error occured.
+ */
+bool yank_register_instance(const YankInstance *instance, Error **errp);
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
index 0000000000..3d5c872598
--- /dev/null
+++ b/util/yank.c
@@ -0,0 +1,206 @@
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
+#include "qemu/lockable.h"
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
+static bool yank_instance_equal(const YankInstance *a, const YankInstance =
*b)
+{
+    if (a->type !=3D b->type) {
+        return false;
+    }
+
+    switch (a->type) {
+    case YANK_INSTANCE_TYPE_BLOCK_NODE:
+        return g_str_equal(a->u.block_node.node_name, b->u.block_node.node=
_name);
+
+    case YANK_INSTANCE_TYPE_CHARDEV:
+        return g_str_equal(a->u.chardev.id, b->u.chardev.id);
+
+    case YANK_INSTANCE_TYPE_MIGRATION:
+        return true;
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
+        if (yank_instance_equal(entry->instance, instance)) {
+            return entry;
+        }
+    }
+    return NULL;
+}
+
+bool yank_register_instance(const YankInstance *instance, Error **errp)
+{
+    YankInstanceEntry *entry;
+
+    QEMU_LOCK_GUARD(&yank_lock);
+
+    if (yank_find_entry(instance)) {
+        error_setg(errp, "duplicate yank instance");
+        return false;
+    }
+
+    entry =3D g_new0(YankInstanceEntry, 1);
+    entry->instance =3D QAPI_CLONE(YankInstance, instance);
+    QLIST_INIT(&entry->yankfns);
+    QLIST_INSERT_HEAD(&yank_instance_list, entry, next);
+
+    return true;
+}
+
+void yank_unregister_instance(const YankInstance *instance)
+{
+    YankInstanceEntry *entry;
+
+    QEMU_LOCK_GUARD(&yank_lock);
+    entry =3D yank_find_entry(instance);
+    assert(entry);
+
+    assert(QLIST_EMPTY(&entry->yankfns));
+    QLIST_REMOVE(entry, next);
+    qapi_free_YankInstance(entry->instance);
+    g_free(entry);
+}
+
+void yank_register_function(const YankInstance *instance,
+                            YankFn *func,
+                            void *opaque)
+{
+    YankInstanceEntry *entry;
+    YankFuncAndParam *func_entry;
+
+    QEMU_LOCK_GUARD(&yank_lock);
+    entry =3D yank_find_entry(instance);
+    assert(entry);
+
+    func_entry =3D g_new0(YankFuncAndParam, 1);
+    func_entry->func =3D func;
+    func_entry->opaque =3D opaque;
+
+    QLIST_INSERT_HEAD(&entry->yankfns, func_entry, next);
+}
+
+void yank_unregister_function(const YankInstance *instance,
+                              YankFn *func,
+                              void *opaque)
+{
+    YankInstanceEntry *entry;
+    YankFuncAndParam *func_entry;
+
+    QEMU_LOCK_GUARD(&yank_lock);
+    entry =3D yank_find_entry(instance);
+    assert(entry);
+
+    QLIST_FOREACH(func_entry, &entry->yankfns, next) {
+        if (func_entry->func =3D=3D func && func_entry->opaque =3D=3D opaq=
ue) {
+            QLIST_REMOVE(func_entry, next);
+            g_free(func_entry);
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
+    QEMU_LOCK_GUARD(&yank_lock);
+    for (tail =3D instances; tail; tail =3D tail->next) {
+        entry =3D yank_find_entry(tail->value);
+        if (!entry) {
+            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "Instance not fo=
und");
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
+}
+
+YankInstanceList *qmp_query_yank(Error **errp)
+{
+    YankInstanceEntry *entry;
+    YankInstanceList *ret;
+
+    ret =3D NULL;
+
+    QEMU_LOCK_GUARD(&yank_lock);
+    QLIST_FOREACH(entry, &yank_instance_list, next) {
+        YankInstanceList *new_entry;
+        new_entry =3D g_new0(YankInstanceList, 1);
+        new_entry->value =3D QAPI_CLONE(YankInstance, entry->instance);
+        new_entry->next =3D ret;
+        ret =3D new_entry;
+    }
+
+    return ret;
+}
+
+static void __attribute__((__constructor__)) yank_init(void)
+{
+    qemu_mutex_init(&yank_lock);
+}
--
2.29.2


--Sig_/nj_kbc4gUi2ziHJ0vxwBbfp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p8psACgkQNasLKJxd
slgT2w/+MNnZ71nYJlVF3xhLR6tF6e7mUk7800nRcwW18iwYo+0PwL1gGamofduV
zR11WQEmmkkuQ/XYVF8zjLJXmpJ9fG+h81yV3DJ6n8sjzXtg0BsP2iVjkaXXUfUG
r4Y+thXdYpD+OPeWwgFwjJTenuLe7i4sW8Svar+kBakDxKb+SsRC2Oc4FRVpGqN7
u1z2nEi2JHjHiHOLxUOUg4N5tYXEymCPG0OLykhROuylzYEnFUH4yJQ+2Adjhoq2
YQaOzVfOXnq6P/Pf1VOfVMY22MJdlZlnKW/7+TN2bpqww2tZFgeZSN26cNmeIaxw
75EX7a7iuTiaKUna12ScM0mT3gu1c8Toolguu/iO/oreKfgJYkF6C0Aaca8wl62B
GDvZbCS5NKXiQrZqeexwVlwPKIojdHB1YLl/TJn8NWbBoovbAQ0jVCuMTp2eipMC
pIYKRHv6/t4Rh0ApZc59O/mCuwA+uUPClVjl76fMWP+LWeNwIgHbvu2+nKs5X5Ye
WVEv9pRdeFCFQnEqIgxECPYFJLfrIJolrhyIT3vCk09UjpPV4kdj3+y9bZjqwN7y
mkcxVEnUEqTDpcYit8tBEa1+TTlx7qKMguKFosNZogvqyyrlRwPD6+Ax526dW5aS
OPno2F24X//ClKKOs7IQ3reDmSERz+BgfpHryFVP382pa5eJp3s=
=BFaG
-----END PGP SIGNATURE-----

--Sig_/nj_kbc4gUi2ziHJ0vxwBbfp--

