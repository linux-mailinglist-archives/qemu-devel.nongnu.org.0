Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B33514A6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:59:34 +0200 (CEST)
Received: from localhost ([::1]:56440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvz3-0001MP-Nx
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvvs-0004pY-Ru
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvvq-0002ID-Fv
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617278173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEGTyoFwwAC+Bak9zPPVghB4pUU5qnHSMEsHSpO/GZM=;
 b=fqnjWfoUbjuzX1BmH3ssbzDrjQW+TTNXTa/NdbdJ/NQXo3F5+5dJaShl6BGaoAQ7VAxWqP
 3Qk+qDH2xav3fjLRRn8PWZIersfWBrHAq3Vf3ueWatneU/Q66S/DNj0+pexD4a2jw2WosI
 a/7SUf6q8VRcbGYFJ9o3c0j6S8/2ptk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-qYeCR77OP5-Oe65Xs9hZKw-1; Thu, 01 Apr 2021 07:56:12 -0400
X-MC-Unique: qYeCR77OP5-Oe65Xs9hZKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FC96101962B;
 Thu,  1 Apr 2021 11:56:11 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B476319C44;
 Thu,  1 Apr 2021 11:56:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 4/9] yank: Remove dependency on qiochannel
Date: Thu,  1 Apr 2021 15:55:27 +0400
Message-Id: <20210401115532.430961-5-marcandre.lureau@redhat.com>
In-Reply-To: <20210401115532.430961-1-marcandre.lureau@redhat.com>
References: <20210401115532.430961-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

Remove dependency on qiochannel by removing yank_generic_iochannel and
letting migration and chardev use their own yank function for
iochannel.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20ff143fc2db23e27cd41d38043e481376c9cec1.1616521341.git.lukasstraub2@web.de>
---
 include/qemu/yank.h           | 10 ----------
 migration/yank_functions.h    | 17 +++++++++++++++++
 chardev/char-socket.c         | 21 ++++++++++++++-------
 migration/channel.c           |  6 ++++--
 migration/multifd.c           |  3 ++-
 migration/qemu-file-channel.c |  3 ++-
 migration/yank_functions.c    | 20 ++++++++++++++++++++
 stubs/yank.c                  |  6 ------
 util/yank.c                   |  8 --------
 MAINTAINERS                   |  1 +
 migration/meson.build         |  1 +
 11 files changed, 61 insertions(+), 35 deletions(-)
 create mode 100644 migration/yank_functions.h
 create mode 100644 migration/yank_functions.c

diff --git a/include/qemu/yank.h b/include/qemu/yank.h
index 5b93c70cbf..5375a1f195 100644
--- a/include/qemu/yank.h
+++ b/include/qemu/yank.h
@@ -73,16 +73,6 @@ void yank_unregister_function(const YankInstance *instance,
                               YankFn *func,
                               void *opaque);
 
-/**
- * yank_generic_iochannel: Generic yank function for iochannel
- *
- * This is a generic yank function which will call qio_channel_shutdown on the
- * provided QIOChannel.
- *
- * @opaque: QIOChannel to shutdown
- */
-void yank_generic_iochannel(void *opaque);
-
 #define BLOCKDEV_YANK_INSTANCE(the_node_name) (&(YankInstance) { \
         .type = YANK_INSTANCE_TYPE_BLOCK_NODE, \
         .u.block_node.node_name = (the_node_name) })
diff --git a/migration/yank_functions.h b/migration/yank_functions.h
new file mode 100644
index 0000000000..055ea22523
--- /dev/null
+++ b/migration/yank_functions.h
@@ -0,0 +1,17 @@
+/*
+ * migration yank functions
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+/**
+ * migration_yank_iochannel: yank function for iochannel
+ *
+ * This yank function will call qio_channel_shutdown on the provided QIOChannel.
+ *
+ * @opaque: QIOChannel to shutdown
+ */
+void migration_yank_iochannel(void *opaque);
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index f618bdec28..1d455ecca4 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -402,6 +402,13 @@ static void remove_hup_source(SocketChardev *s)
     }
 }
 
+static void char_socket_yank_iochannel(void *opaque)
+{
+    QIOChannel *ioc = QIO_CHANNEL(opaque);
+
+    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+}
+
 static void tcp_chr_free_connection(Chardev *chr)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
@@ -424,7 +431,7 @@ static void tcp_chr_free_connection(Chardev *chr)
         (s->state == TCP_CHARDEV_STATE_CONNECTING
         || s->state == TCP_CHARDEV_STATE_CONNECTED)) {
         yank_unregister_function(CHARDEV_YANK_INSTANCE(chr->label),
-                                 yank_generic_iochannel,
+                                 char_socket_yank_iochannel,
                                  QIO_CHANNEL(s->sioc));
     }
     object_unref(OBJECT(s->sioc));
@@ -946,7 +953,7 @@ static int tcp_chr_add_client(Chardev *chr, int fd)
     tcp_chr_set_client_ioc_name(chr, sioc);
     if (s->registered_yank) {
         yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                               yank_generic_iochannel,
+                               char_socket_yank_iochannel,
                                QIO_CHANNEL(sioc));
     }
     ret = tcp_chr_new_client(chr, sioc);
@@ -965,7 +972,7 @@ static void tcp_chr_accept(QIONetListener *listener,
     tcp_chr_set_client_ioc_name(chr, cioc);
     if (s->registered_yank) {
         yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                               yank_generic_iochannel,
+                               char_socket_yank_iochannel,
                                QIO_CHANNEL(cioc));
     }
     tcp_chr_new_client(chr, cioc);
@@ -985,7 +992,7 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Error **errp)
     }
     if (s->registered_yank) {
         yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                               yank_generic_iochannel,
+                               char_socket_yank_iochannel,
                                QIO_CHANNEL(sioc));
     }
     tcp_chr_new_client(chr, sioc);
@@ -1005,7 +1012,7 @@ static void tcp_chr_accept_server_sync(Chardev *chr)
     tcp_chr_set_client_ioc_name(chr, sioc);
     if (s->registered_yank) {
         yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                               yank_generic_iochannel,
+                               char_socket_yank_iochannel,
                                QIO_CHANNEL(sioc));
     }
     tcp_chr_new_client(chr, sioc);
@@ -1138,7 +1145,7 @@ static void qemu_chr_socket_connected(QIOTask *task, void *opaque)
         tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
         if (s->registered_yank) {
             yank_unregister_function(CHARDEV_YANK_INSTANCE(chr->label),
-                                     yank_generic_iochannel,
+                                     char_socket_yank_iochannel,
                                      QIO_CHANNEL(sioc));
         }
         check_report_connect_error(chr, err);
@@ -1176,7 +1183,7 @@ static void tcp_chr_connect_client_async(Chardev *chr)
     tcp_chr_set_client_ioc_name(chr, sioc);
     if (s->registered_yank) {
         yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                               yank_generic_iochannel,
+                               char_socket_yank_iochannel,
                                QIO_CHANNEL(sioc));
     }
     /*
diff --git a/migration/channel.c b/migration/channel.c
index 35fe234e9c..c9ee902021 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -20,6 +20,7 @@
 #include "io/channel-tls.h"
 #include "io/channel-socket.h"
 #include "qemu/yank.h"
+#include "yank_functions.h"
 
 /**
  * @migration_channel_process_incoming - Create new incoming migration channel
@@ -38,7 +39,8 @@ void migration_channel_process_incoming(QIOChannel *ioc)
         ioc, object_get_typename(OBJECT(ioc)));
 
     if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
-        yank_register_function(MIGRATION_YANK_INSTANCE, yank_generic_iochannel,
+        yank_register_function(MIGRATION_YANK_INSTANCE,
+                               migration_yank_iochannel,
                                QIO_CHANNEL(ioc));
     }
 
@@ -76,7 +78,7 @@ void migration_channel_connect(MigrationState *s,
     if (!error) {
         if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
             yank_register_function(MIGRATION_YANK_INSTANCE,
-                                   yank_generic_iochannel,
+                                   migration_yank_iochannel,
                                    QIO_CHANNEL(ioc));
         }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 03527c564c..a6677c45c8 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -27,6 +27,7 @@
 
 #include "qemu/yank.h"
 #include "io/channel-socket.h"
+#include "yank_functions.h"
 
 /* Multiple fd's */
 
@@ -989,7 +990,7 @@ int multifd_load_cleanup(Error **errp)
         if (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET)
             && OBJECT(p->c)->ref == 1) {
             yank_unregister_function(MIGRATION_YANK_INSTANCE,
-                                     yank_generic_iochannel,
+                                     migration_yank_iochannel,
                                      QIO_CHANNEL(p->c));
         }
 
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index afc3a7f642..876d05a540 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -28,6 +28,7 @@
 #include "io/channel-socket.h"
 #include "qemu/iov.h"
 #include "qemu/yank.h"
+#include "yank_functions.h"
 
 
 static ssize_t channel_writev_buffer(void *opaque,
@@ -108,7 +109,7 @@ static int channel_close(void *opaque, Error **errp)
     if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)
         && OBJECT(ioc)->ref == 1) {
         yank_unregister_function(MIGRATION_YANK_INSTANCE,
-                                 yank_generic_iochannel,
+                                 migration_yank_iochannel,
                                  QIO_CHANNEL(ioc));
     }
     object_unref(OBJECT(ioc));
diff --git a/migration/yank_functions.c b/migration/yank_functions.c
new file mode 100644
index 0000000000..96c90e17dc
--- /dev/null
+++ b/migration/yank_functions.c
@@ -0,0 +1,20 @@
+/*
+ * migration yank functions
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "io/channel.h"
+#include "yank_functions.h"
+
+void migration_yank_iochannel(void *opaque)
+{
+    QIOChannel *ioc = QIO_CHANNEL(opaque);
+
+    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+}
diff --git a/stubs/yank.c b/stubs/yank.c
index 6090416065..11b24fc057 100644
--- a/stubs/yank.c
+++ b/stubs/yank.c
@@ -21,9 +21,3 @@ void yank_unregister_function(const YankInstance *instance,
                               void *opaque)
 {
 }
-
-void yank_generic_iochannel(void *opaque)
-{
-}
-
-
diff --git a/util/yank.c b/util/yank.c
index fc08f65209..abf47c346d 100644
--- a/util/yank.c
+++ b/util/yank.c
@@ -15,7 +15,6 @@
 #include "qapi/qapi-commands-yank.h"
 #include "qapi/qapi-visit-yank.h"
 #include "qapi/clone-visitor.h"
-#include "io/channel.h"
 #include "qemu/yank.h"
 
 struct YankFuncAndParam {
@@ -151,13 +150,6 @@ void yank_unregister_function(const YankInstance *instance,
     abort();
 }
 
-void yank_generic_iochannel(void *opaque)
-{
-    QIOChannel *ioc = QIO_CHANNEL(opaque);
-
-    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-}
-
 void qmp_yank(YankInstanceList *instances,
               Error **errp)
 {
diff --git a/MAINTAINERS b/MAINTAINERS
index 554be84b32..12c28feb35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2823,6 +2823,7 @@ M: Lukas Straub <lukasstraub2@web.de>
 S: Odd fixes
 F: util/yank.c
 F: stubs/yank.c
+F: migration/yank_functions*
 F: include/qemu/yank.h
 F: qapi/yank.json
 
diff --git a/migration/meson.build b/migration/meson.build
index 9645f44005..2cfa8eed72 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -6,6 +6,7 @@ migration_files = files(
   'vmstate.c',
   'qemu-file-channel.c',
   'qemu-file.c',
+  'yank_functions.c',
 )
 softmmu_ss.add(migration_files)
 
-- 
2.29.0


