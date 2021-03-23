Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1A3466DB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:55:47 +0100 (CET)
Received: from localhost ([::1]:51234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlFq-00021z-NC
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlD1-0007yG-AZ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:52:51 -0400
Received: from mout.web.de ([212.227.15.4]:48047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlCy-0001AU-TW
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616521964;
 bh=ACRK7gmZ2FgQVhicMBvYq7bUwWfvOl7MAc7sS1mStJw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=kHKCL5QRwFyibE9mG9WIgSHcCDXTggFoR8cJmbEzFLL0b3YkSfbtciYEdpYgLqPHz
 LwyupPzFRdvXzzIejW4oqOfgo2ruy9zNYkyfH3IcdpXOTWjqGk3VEJt+FQOgDiKEVy
 JAUODBTql+cdB8pII2G5SiJVkmndaZVzNcbarUu4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.81]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MFt3u-1lTh9O00oQ-00EtRo; Tue, 23
 Mar 2021 18:52:44 +0100
Date: Tue, 23 Mar 2021 18:52:42 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 1/2] yank: Remove dependency on qiochannel
Message-ID: <20ff143fc2db23e27cd41d38043e481376c9cec1.1616521341.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616521341.git.lukasstraub2@web.de>
References: <cover.1616521341.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UcP4EnN1jqw9KWO8qhZMb6C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:BaWmdmOvnw9qZ8dpf9xlmIw8tDL58rrzkIrTyyAaT7iD3QkzizE
 3+IsjspjbZOZ4UdaKoA0gGqr9krSzdP0o3NmwoU0dczq+ukrJmeqokRB9R0qNp3bFq9zmrT
 dH3YShDyKLcuy603Z0JjiwiN4jsJUGPMWhG/qpCInWpY7Vz20Pk947llFVUrCYzEc5+5XPL
 iQRNqP7ermuBpTPRZ3QlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lYpwFfx4AO8=:EJAB4pBoK+1b64Kiq/f+CD
 5Sw5mFnz5cljFPwrutn3ccVUQykmDKLPDveDfgc/8O/BIxYGpkqaBh+GW9fg3llnXOYx5mC5d
 R8PbmrG1WDnFcSfJQNZdljPpmfDD+sM6KutIX8NxkMX76kiqw1MD6nqtNRI4ThrKNLotGvcZD
 GOrqean8BoOYFXoMjoDUaCazlvjZFVtxNdWSNQygp1zdkTVru0Z3uU+Xw3+qrIUseAh1e76pN
 70DH+J6I3zW969WwRFSDGnetdX7KCUfGdTo+t9iFksHm276Ynrp/FMrFV5lO0YjxsQACCxd4L
 8nh2t4kWt1TND3fzVnye1sJDjbTpvxkpv6bcsKkmo1t+lpUxeU5rYNdAwDhyI/4vqxzwvah7Q
 T4P6Qyo7M8zKhwd4mBxnHSaHbag7nncaF6+3dLLxgzys5au8qJRDcgtaDX7ruJr3aTcHg/gxB
 zHZKUq4XrwcgB8TuKXIsXtiwhX480yiP0ritpk4KeBg6SdqyZrQ7ZcTvfX70UHelb99YJoLIx
 P4ixL8AaqysS9aqcJ7Cjui9KkcFGcicWIqNqhmOvId7dsepUbn0GnsuQmUkrRssqcLhouUGWj
 0lIFW9xUKO2kfB+EQEozj+albey+smYIibhQCaCMj2ZmMzgS4k8pseN952tvIzq0kIR6d7dkb
 HorH3TGitgRLS2vj2eyNKm8gkhFhUQWJX1fyv/jdxYCp2YHqdrzCuOqZrBLs1LS5mePYRobTG
 jGkhECMw30I9GcICQE2Ln+Be/LVrM64NG0EzM0622Y/Nhmdnx6mWmvPqBxCtEYwGbpa+mSHSn
 6f84PdCqGOWBzgV4GECsml5pyPVDxBraRZ+l67+Fjf8SRtVke7vC+FBdXWIDMrkLVCPcVb7Ec
 51FTlU69v7+pe/P2hEBQ==
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/UcP4EnN1jqw9KWO8qhZMb6C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Remove dependency on qiochannel by removing yank_generic_iochannel and
letting migration and chardev use their own yank function for
iochannel.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
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


--Sig_/UcP4EnN1jqw9KWO8qhZMb6C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBaKuoACgkQNasLKJxd
slg4rA/+OrX8yfrL8/XlRXwed3eADxJHmn48mDMZeSBn97B4kl6kDrwZcnC+w00k
Qmms7roTlnsosD/28EJXodgRztC7Wwr5PU8wVWkybiUexK8ZYWtIgYpSigkuXpBD
Hn+ZWol9rMjQfiL88jtVNOBFF0eF37f83/16FQVm5B1HrRzOLIRyZAJPrvKMROnj
nplE78g23O0f47GbRcWAXXUvtClAXbNTHKJgdJ/RusqsG0qUgfFVATFQdFy9qwvZ
UC4uTWlNlL1aOQCF0EO+rVuJHu+5JCeESiVD6MhWk1AShX1S5p1+ceWyNgToNHaK
8ISCg8zcNiJ6YORFTCE708d7nwScd8k7yfjBacajRtLoRoJ8TEono9Jv3J8xd4sz
Vk/Qzc3Uae3kzlV/f9ugpmf7FogZuDLJ0eHsOx6oTvX2JzJjc6g1gsjkBUVdFKxC
NmeYZJ6eVlXr39DdNXhnVIzePfkyykkaeFdel5H/k14KOmUKWzQWcpd8uD4AmsPI
tZcRoS+Wrcf1IYBkob3fn80P3lU15yyFoRrEXlGpGl3hR1d6D46y/m28ZbjIYXFd
GTEJbPZdtstZdHOwkjPItPSgTd7b/k8RHDGurIGNw5kzJhBN3K+/NbYniY8pfAyB
r/e0k/fsFhXjvlMvZCjb8lL1ZoyydsFb69idVQf9lEM9DK/RuDA=
=x5sx
-----END PGP SIGNATURE-----

--Sig_/UcP4EnN1jqw9KWO8qhZMb6C--

