Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A9D34ADB5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:40:29 +0100 (CET)
Received: from localhost ([::1]:38260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPqRh-0001Nb-0X
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMW-0005Gx-O4
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:08 -0400
Received: from mout.web.de ([212.227.17.12]:45159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMR-0004So-6z
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616780101;
 bh=yt0UMy2seKBXZxq/MjRn7d1+kwt5Ib7BhGGKWTAL6Bo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=YqWIyQs2ZgtvWPz6oKQyZdtHl0PKDEhcq5CNjyDfgyIOFpGdzswLS69p68kVVZhDV
 4o1mEu/Kc48HR1Kayrio2nSekGVBTDMWi9hQBrC8+JL+0IzNvXTSVk2ZK/Uxc6hh/j
 r+NUMM7Ha9JgH3GAa9VEcl5KDbIQzboF3tdpn0vU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N5lnF-1ljZz53elH-016kpB; Fri, 26
 Mar 2021 18:35:00 +0100
Date: Fri, 26 Mar 2021 18:34:59 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/6] yank: Remove dependency on qiochannel
Message-ID: <19be51edbb4a213baa1716fa79f7071475d1a9c0.1616779714.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616779714.git.lukasstraub2@web.de>
References: <cover.1616779714.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/feoX5V9sdPIrnLO49g2BSEQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:0kKx1P1WMThP/MsS3FKQez+ttLjyWvTbGULiQ6D8dRKHoS9Ytgq
 XZqlQyodV/XHD5DG6x9P51QGW5KZgcssqNQK9HRu4Y0/SU9t3Jghu+Zy5+efxdGqKb+hZvq
 AXLmubOwtoUQFjwZfumcmn5oAdVyebrl8krRDe3Z8Aq8kl4Fs3V423icstRmlk4XwnOQ9xL
 akSAoI2eckkErEt6wnHBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KXJnE9v0q4U=:0RGNqwkdXSAwwfZwktfgBg
 xNvE6wYciIRTcUoCdFLWN+bg+oPrXQGp0j1exaV5S81Wg1gV6Lb1PjLiWqrcFhvYpWG8CElp+
 7vNhfuNLW4imUtGUmwLKMgDXD1l0z30gkFZfVV54IQmAMfqgVMkb6v8W6KoWH3VW/ws5H4otG
 g8CjS2JVr07LLDYjxFHukXNt08sgHk2BDRO8WOfbXdgCOA6tiqeK9SjZnwIGRUnkzc7gKjJlO
 SQJuPbI6DWlRu4OoxiLDQ4iwuv/Mcd0D55ZjkZ9RjEotYD7xd3NSGSaAu0wiyNA89Ir8ZHTi7
 HEEsZ3YHOAmICRt/oA1Zl6i910FCdbF/N8t/XtlflJGMBV/ZSJaZLSlkiITemIWFkMUmQaagU
 UAECaBsFpUveYnwNkNSfatomMsE1sDtTzRxAmNtOyT0e8ZCiBOFli56qf6C3DTYTVumsuIig4
 NTX+IOzCEYE2ExwnlUxtw7zmUMhKUfe97311+maYE2DJkwELS58NpIZlbqHClIezbiu7zShxu
 T5WOiaoLnF6v+hHuSUA/ihHx/AQKJ+zz9EAWlMWMrJeJq0i3/0vLsEYcs8OxUYRmYj+UmEE2c
 e4kgHJereaQgj+PTahi/y+wsPGsg2IPepPSJH/oG2D5C1t/IWKYH7u3QsOtvkwKru2pkJUBj9
 WcDxFc2vG1QulAg1q0If9vMJjfA9PBlyQcTP9IiBk9JTKs7Xz3FaPNJgF10dScLOJmqgPUrbP
 f3GsWWSzi6fstYuh0tz34YoFiWZNcw5XnqPzpJxZBz4v1wLm5nKUjSrd1q3PAj8S6+eNBUj7u
 eys/BtLJmT4DJLmjccBWKddH0N0edFM35Ty65Ikl7NnDrPUN/Sakk/A2vJSqmBwbh/ZPkN90v
 feSR3NRT6T1zzERSvI+JZ9X1xRIlBXPd0+5U0LAn3cjxod4ODZVaqFrgKF69ABpc/+tyyg9u9
 PjjasBaFuiyCoy065KE2rrznvJtHDTnfAi99XfsM1lEUEOi/g1xGSO5DapjwpCiqZC69XZsvD
 /gO6Egp9rCE2fgLnE+ErrrZ7jVZ2DR75fOOYSys1YLkIyst8/141t01jfXCi7vLGt+AhFGdw1
 n7lKQkgAyz1BQSOQ2Yk2Co+nQ4kMdaPzU9BeOdDl/BVsUqMZSu+Rd+qlBBJt3pwwnLqSPwC75
 h7M9GUX+r8Uc8DzWqcXieRhfRPWnfasy8Wvc70378GaE7cJ1I3xy4VJjyJz/hYHMIe9NZdgnO
 mjASg18DKwipGuDl2
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/feoX5V9sdPIrnLO49g2BSEQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Remove dependency on qiochannel by removing yank_generic_iochannel and
letting migration and chardev use their own yank function for
iochannel.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 MAINTAINERS                   |  1 +
 chardev/char-socket.c         | 21 ++++++++++++++-------
 include/qemu/yank.h           | 10 ----------
 migration/channel.c           |  6 ++++--
 migration/meson.build         |  1 +
 migration/multifd.c           |  3 ++-
 migration/qemu-file-channel.c |  3 ++-
 migration/yank_functions.c    | 20 ++++++++++++++++++++
 migration/yank_functions.h    | 17 +++++++++++++++++
 stubs/yank.c                  |  6 ------
 util/yank.c                   |  8 --------
 11 files changed, 61 insertions(+), 35 deletions(-)
 create mode 100644 migration/yank_functions.c
 create mode 100644 migration/yank_functions.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9147e9a429..455775c4a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2821,6 +2821,7 @@ M: Lukas Straub <lukasstraub2@web.de>
 S: Odd fixes
 F: util/yank.c
 F: stubs/yank.c
+F: migration/yank_functions*
 F: include/qemu/yank.h
 F: qapi/yank.json

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index f618bdec28..1d455ecca4 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -402,6 +402,13 @@ static void remove_hup_source(SocketChardev *s)
     }
 }

+static void char_socket_yank_iochannel(void *opaque)
+{
+    QIOChannel *ioc =3D QIO_CHANNEL(opaque);
+
+    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+}
+
 static void tcp_chr_free_connection(Chardev *chr)
 {
     SocketChardev *s =3D SOCKET_CHARDEV(chr);
@@ -424,7 +431,7 @@ static void tcp_chr_free_connection(Chardev *chr)
         (s->state =3D=3D TCP_CHARDEV_STATE_CONNECTING
         || s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED)) {
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
     ret =3D tcp_chr_new_client(chr, sioc);
@@ -965,7 +972,7 @@ static void tcp_chr_accept(QIONetListener *listener,
     tcp_chr_set_client_ioc_name(chr, cioc);
     if (s->registered_yank) {
         yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                               yank_generic_iochannel,
+                               char_socket_yank_iochannel,
                                QIO_CHANNEL(cioc));
     }
     tcp_chr_new_client(chr, cioc);
@@ -985,7 +992,7 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Er=
ror **errp)
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
@@ -1138,7 +1145,7 @@ static void qemu_chr_socket_connected(QIOTask *task, =
void *opaque)
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
diff --git a/include/qemu/yank.h b/include/qemu/yank.h
index 5b93c70cbf..5375a1f195 100644
--- a/include/qemu/yank.h
+++ b/include/qemu/yank.h
@@ -73,16 +73,6 @@ void yank_unregister_function(const YankInstance *instan=
ce,
                               YankFn *func,
                               void *opaque);

-/**
- * yank_generic_iochannel: Generic yank function for iochannel
- *
- * This is a generic yank function which will call qio_channel_shutdown on=
 the
- * provided QIOChannel.
- *
- * @opaque: QIOChannel to shutdown
- */
-void yank_generic_iochannel(void *opaque);
-
 #define BLOCKDEV_YANK_INSTANCE(the_node_name) (&(YankInstance) { \
         .type =3D YANK_INSTANCE_TYPE_BLOCK_NODE, \
         .u.block_node.node_name =3D (the_node_name) })
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
  * @migration_channel_process_incoming - Create new incoming migration cha=
nnel
@@ -38,7 +39,8 @@ void migration_channel_process_incoming(QIOChannel *ioc)
         ioc, object_get_typename(OBJECT(ioc)));

     if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
-        yank_register_function(MIGRATION_YANK_INSTANCE, yank_generic_iocha=
nnel,
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

diff --git a/migration/meson.build b/migration/meson.build
index 9645f44005..2cfa8eed72 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -6,6 +6,7 @@ migration_files =3D files(
   'vmstate.c',
   'qemu-file-channel.c',
   'qemu-file.c',
+  'yank_functions.c',
 )
 softmmu_ss.add(migration_files)

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
             && OBJECT(p->c)->ref =3D=3D 1) {
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
         && OBJECT(ioc)->ref =3D=3D 1) {
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
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
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
+    QIOChannel *ioc =3D QIO_CHANNEL(opaque);
+
+    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+}
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
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+/**
+ * migration_yank_iochannel: yank function for iochannel
+ *
+ * This yank function will call qio_channel_shutdown on the provided QIOCh=
annel.
+ *
+ * @opaque: QIOChannel to shutdown
+ */
+void migration_yank_iochannel(void *opaque);
diff --git a/stubs/yank.c b/stubs/yank.c
index 6090416065..11b24fc057 100644
--- a/stubs/yank.c
+++ b/stubs/yank.c
@@ -21,9 +21,3 @@ void yank_unregister_function(const YankInstance *instanc=
e,
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
@@ -151,13 +150,6 @@ void yank_unregister_function(const YankInstance *inst=
ance,
     abort();
 }

-void yank_generic_iochannel(void *opaque)
-{
-    QIOChannel *ioc =3D QIO_CHANNEL(opaque);
-
-    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-}
-
 void qmp_yank(YankInstanceList *instances,
               Error **errp)
 {
--
2.30.2


--Sig_/feoX5V9sdPIrnLO49g2BSEQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeG0MACgkQNasLKJxd
slgnuQ/9EdJyPvfcEyrunEOkHrc1PcBIAKPlxU5gkZcj109fUaW5cSPciOK9wiP5
+6+zrN1wLpeGQ48khe38IXtRaDImKmBCGmrfzJCFJRKGuDVbZj57/wjQeoMCFoL+
EYPkkXKDn7JLe+Sp9VaCaYXabLvDU1QqA4ytczz5YLI16Sm5Qi3Cw9YUSHCbxRvb
nTGPv+NFI+8RJFqZdLmAvgIE1oOgYYOf5K97MsFw0rHxrmztdRvgECMnoajIOy0f
B5bfQ/CfwZv9o48oXm5VTHrgUn4fDrwsc3wAB0C/COI94ZpkwxNBOtaUBzkoIHre
+jSru6rNGaf2Lm4TcXJBzx3XurXdcLYIQxRc4W0hu4tKuOLWs7WRHdno3jJe1Um9
TrXH8WnDSA1MiltG/t7Cb2mNIldOWUNxC3YW/EPkiKr7Ztp8qmv60evzndxJv8Y2
C9zj7PQtcp/salfUCh8OznxGuAKlJcfMZhIwF6IcYeI8TErPy/MvfHc+1V+mhqrn
ciMj6iCl1/586NzE9L99PpCRluboSfEu76hXzw2LV1zBd4/kAl25AodjR/1m/qku
Dzxt+fCcg7C8PcXADQahH0zswz3f88zb/w2CA6k7qjZudI+0aG8TS9blrJcVJQzZ
HL95F08z5aAEqniXVyje8Mwk/ktE9T2vY0SC6fzxuBwbctsPOpE=
=GDsu
-----END PGP SIGNATURE-----

--Sig_/feoX5V9sdPIrnLO49g2BSEQ--

