Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754552D8CE7
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 12:56:25 +0100 (CET)
Received: from localhost ([::1]:36008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koPzE-0002hh-AF
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 06:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPrg-0005ZU-D1; Sun, 13 Dec 2020 06:48:36 -0500
Received: from mout.web.de ([212.227.17.11]:48159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPrd-0002MV-IJ; Sun, 13 Dec 2020 06:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1607860107;
 bh=MUK9OSiVvwFZVAxMHQYh1PT0NGvcFURN3LjkDO6tetI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=kQHeIBE3ZEapv+I7FHNv4EjXSKJ4aTwFpLJZzVh0+hlH85JLenF6pvkOYhDrY9qWg
 1JQPpp35yyGm3DTPpagKLjfmp8uOXhO81HHIMoAbZ8c/iW+FVMCNbARM90YOyFGu+f
 fcpXqUit6rSJXW8jvPN7fgPJ0DKA5qqYCNZY6IaE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.131]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LnS4I-1kCIYm3lSo-00hhLx; Sun, 13
 Dec 2020 12:48:26 +0100
Date: Sun, 13 Dec 2020 12:48:25 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v12 4/7] migration: Add yank feature
Message-ID: <b9b7ad1f69fe559cd9dd8f08461fea4b7dc9641b.1607858747.git.lukasstraub2@web.de>
In-Reply-To: <cover.1607858747.git.lukasstraub2@web.de>
References: <cover.1607858747.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SZRSqK8=qj19CLRRaj58tKI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ThafvwEs8vkLjCpp+tKT4DX/DG9QdpCak1FvleAN1Ck++01h54c
 zFaV13kKOFiHDkxOpgTABfTpRTHNm4yO8qq53gS/4bQOwbmBKtSv0KVWwSfGFHqgB/Fa4+1
 eEx3IxVqZJfp67Vdwa3OHd4FLh4gYC5VvSzlXb1EdjPViOjIwLUW2KbYyMtZPxRUkdR8PYx
 eRiUOo/hP6funGk2eDqMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1b9ln7HbW08=:wKtZCX096CKnKTlD3JJGza
 ZqK4PEvVpGE1cp6Tyw2+YA5/o1/zHvVpVy16DCiOsz1GdivRRs8X4JOXd9Jr/oA0UqVAcX/Mo
 z4ft1tYT6c6T2zzBkp4JPhBQkBnVJoRCwvBz/vXJFvdZB7RUsTbaT42qFCCxiiJxWsk0uFit7
 R3T5zCztRXLWiuYKPbc9ZByywJV59rMOnp9JApURW31QwS6Pu6+0QqjGIYe8t2VLFuVObmzDk
 5EMic9CkEUEMcKO07BP2KY/76J+iU2lbbKQd9+3BSOwDnsB1kD1QsG8vYKX1VzEWRgjR29UmO
 RzTeTtIy9FetKDzWe7ZnCIIBFWrtIwFMMUz3LPP4bAyPl710xGZ4cRgkLH3vPc6v1uQV1/oH9
 R6yCVISZBMUAxoQvo/EXHETgq2eDX6cP5dfdkTkGnArAtFttXqJTa1Ze4e/l3T2JnlEcVe4CT
 4rQuVjWfhyMHr4e0odvkzqTDqGA71FJmC3kN/hye4pca2HPd3UF/h5bSi9AJ6ipwFuTeB7CWw
 sJF6M8NN2RJfS78bwSiSceOkquk9hb+AMRA/tAmA+hp9XARIAFOeq3vn1qdCv6yTF/ZjvB82+
 sQA7qYMU971EaokvuOxYLepBC6t5/gP+4gJG9xawj0PlRZwaD757CLydB3mX24VVGJynNkf1I
 +iNdOK5wVG8IcyvesWVtgHlB3Kq2rVUFkBTRNmqOC+Lu0U7T+4lJgyMSNmqyJAmclqgPAY+SM
 80U/F2QOXapH3ox3FG/EC92vYrDd6DwPNo8JXl7ZNFWAof8dBEG+Li9JcJvaLPZTIq6P52k64
 eCzf7o06tT80emmT/YoiBEvfYVcgBFz7K6HCu125UpWPcnOtJ0YmQJZGzaAEqgQjDUGZtTO0g
 H/j9LELsgUGlgvjImSr+GnCyBvmfBvkqUBwCwGuic=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 =?UTF-8?B?TWFyYy1B?= =?UTF-8?B?bmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/SZRSqK8=qj19CLRRaj58tKI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Register yank functions on sockets to shut them down.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/channel.c           | 13 +++++++++++++
 migration/migration.c         | 24 ++++++++++++++++++++++++
 migration/multifd.c           | 10 ++++++++++
 migration/qemu-file-channel.c |  7 +++++++
 migration/savevm.c            |  6 ++++++
 5 files changed, 60 insertions(+)

diff --git a/migration/channel.c b/migration/channel.c
index 8a783baa0b..35fe234e9c 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -18,6 +18,8 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "io/channel-tls.h"
+#include "io/channel-socket.h"
+#include "qemu/yank.h"

 /**
  * @migration_channel_process_incoming - Create new incoming migration cha=
nnel
@@ -35,6 +37,11 @@ void migration_channel_process_incoming(QIOChannel *ioc)
     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));

+    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
+        yank_register_function(MIGRATION_YANK_INSTANCE, yank_generic_iocha=
nnel,
+                               QIO_CHANNEL(ioc));
+    }
+
     if (s->parameters.tls_creds &&
         *s->parameters.tls_creds &&
         !object_dynamic_cast(OBJECT(ioc),
@@ -67,6 +74,12 @@ void migration_channel_connect(MigrationState *s,
         ioc, object_get_typename(OBJECT(ioc)), hostname, error);

     if (!error) {
+        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
+            yank_register_function(MIGRATION_YANK_INSTANCE,
+                                   yank_generic_iochannel,
+                                   QIO_CHANNEL(ioc));
+        }
+
         if (s->parameters.tls_creds &&
             *s->parameters.tls_creds &&
             !object_dynamic_cast(OBJECT(ioc),
diff --git a/migration/migration.c b/migration/migration.c
index e0dbde4091..dc520a721b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -56,6 +56,7 @@
 #include "net/announce.h"
 #include "qemu/queue.h"
 #include "multifd.h"
+#include "qemu/yank.h"

 #ifdef CONFIG_VFIO
 #include "hw/vfio/vfio-common.h"
@@ -254,6 +255,8 @@ void migration_incoming_state_destroy(void)
         qapi_free_SocketAddressList(mis->socket_address_list);
         mis->socket_address_list =3D NULL;
     }
+
+    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }

 static void migrate_generate_event(int new_state)
@@ -418,6 +421,11 @@ static void qemu_start_incoming_migration(const char *=
uri, Error **errp)
 {
     const char *p =3D NULL;

+    yank_register_instance(MIGRATION_YANK_INSTANCE, errp);
+    if (*errp) {
+        return;
+    }
+
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
@@ -432,6 +440,7 @@ static void qemu_start_incoming_migration(const char *u=
ri, Error **errp)
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_incoming_migration(p, errp);
     } else {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
 }
@@ -1737,6 +1746,7 @@ static void migrate_fd_cleanup(MigrationState *s)
     }
     notifier_list_notify(&migration_state_notifiers, s);
     block_cleanup_parameters(s);
+    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }

 static void migrate_fd_cleanup_schedule(MigrationState *s)
@@ -2011,6 +2021,7 @@ void qmp_migrate_recover(const char *uri, Error **err=
p)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
+    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
     qemu_start_incoming_migration(uri, errp);
 }

@@ -2148,6 +2159,13 @@ void qmp_migrate(const char *uri, bool has_blk, bool=
 blk,
         return;
     }

+    if (!(has_resume && resume)) {
+        yank_register_instance(MIGRATION_YANK_INSTANCE, errp);
+        if (*errp) {
+            return;
+        }
+    }
+
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
@@ -2161,6 +2179,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool =
blk,
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_outgoing_migration(s, p, &local_err);
     } else {
+        if (!(has_resume && resume)) {
+            yank_unregister_instance(MIGRATION_YANK_INSTANCE);
+        }
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "uri",
                    "a valid migration protocol");
         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
@@ -2170,6 +2191,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool =
blk,
     }

     if (local_err) {
+        if (!(has_resume && resume)) {
+            yank_unregister_instance(MIGRATION_YANK_INSTANCE);
+        }
         migrate_fd_error(s, local_err);
         error_propagate(errp, local_err);
         return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 45c690aa11..1a1e589064 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -25,6 +25,9 @@
 #include "trace.h"
 #include "multifd.h"

+#include "qemu/yank.h"
+#include "io/channel-socket.h"
+
 /* Multiple fd's */

 #define MULTIFD_MAGIC 0x11223344U
@@ -974,6 +977,13 @@ int multifd_load_cleanup(Error **errp)
     for (i =3D 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p =3D &multifd_recv_state->params[i];

+        if (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET)
+            && OBJECT(p->c)->ref =3D=3D 1) {
+            yank_unregister_function(MIGRATION_YANK_INSTANCE,
+                                     yank_generic_iochannel,
+                                     QIO_CHANNEL(p->c));
+        }
+
         object_unref(OBJECT(p->c));
         p->c =3D NULL;
         qemu_mutex_destroy(&p->mutex);
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index d2ce32f4b9..afc3a7f642 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -27,6 +27,7 @@
 #include "qemu-file.h"
 #include "io/channel-socket.h"
 #include "qemu/iov.h"
+#include "qemu/yank.h"


 static ssize_t channel_writev_buffer(void *opaque,
@@ -104,6 +105,12 @@ static int channel_close(void *opaque, Error **errp)
     int ret;
     QIOChannel *ioc =3D QIO_CHANNEL(opaque);
     ret =3D qio_channel_close(ioc, errp);
+    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)
+        && OBJECT(ioc)->ref =3D=3D 1) {
+        yank_unregister_function(MIGRATION_YANK_INSTANCE,
+                                 yank_generic_iochannel,
+                                 QIO_CHANNEL(ioc));
+    }
     object_unref(OBJECT(ioc));
     return ret;
 }
diff --git a/migration/savevm.c b/migration/savevm.c
index 5f937a2762..1a3808998e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -62,6 +62,7 @@
 #include "migration/colo.h"
 #include "qemu/bitmap.h"
 #include "net/announce.h"
+#include "qemu/yank.h"

 const unsigned int postcopy_ram_discard_version;

@@ -3008,6 +3009,11 @@ int load_snapshot(const char *name, Error **errp)
     qemu_system_reset(SHUTDOWN_CAUSE_NONE);
     mis->from_src_file =3D f;

+    yank_register_instance(MIGRATION_YANK_INSTANCE, errp);
+    if (*errp) {
+        ret =3D -EINVAL;
+        goto err_drain;
+    }
     aio_context_acquire(aio_context);
     ret =3D qemu_loadvm_state(f);
     migration_incoming_state_destroy();
--
2.20.1


--Sig_/SZRSqK8=qj19CLRRaj58tKI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/V/4kACgkQNasLKJxd
slin/w//WM5kxg2ZIZ9fHxHlP+kUKFbsCpYvoqc424lhohaUg4ezQQX9D193EnUv
00ZROV//IIYSLpdXnLNr3aeFh+v1r43TladR6VcusDct4deE3jkM4MJKJ8b39gM0
RRfR7TQn50rjQRFz3SuFjfgCCekeb+UBIHlwcNnkYzlodLYj8brnocJFL6YCkV+l
XRrc6rxJzoKz3Z2fUWESb1/7WjX7AlPZ83gserpft/X3TCPzMXXCovh8NMTTK4U+
l4Zn2XJ31Pu7EAMgQWXOnsuzYUo+Z5sxVLq4rlBGTbWn8h0sDdDVIBVU3lVmZ/q9
jy+TtVLGkuf/aQlhDkbWXfoE21NZ9o0+lCsjQD/mOhxLyEqAM9Qmc8J8Ksme87hN
ziA2aK3jtiyLhTzs8UZsGuyO/X9YnkQpPVqsgzP28cBFhDShG7NJjHt26AZqCRsK
o1trKQg0Y7vT4GE9dMtdILers87Rrbjvv043zGIaYTFQcigS9kDw6PH4v7pYtA61
0O2+EHYREcR0z92ksneAXy08Gtogjjx1i/gWE94GJ+9JeZ8YQTvElvJdOSMMXEOB
5MgLkx+eEcnK7RSuJBMGZ8anb+ip0oVquOVew4pKvRtsE3e50/5kp83vX/Sxffen
sXmDmh94G0Fu47YsnI6rxE3rw70BGRUIKogiJGzo8K/aMSr2234=
=zq3P
-----END PGP SIGNATURE-----

--Sig_/SZRSqK8=qj19CLRRaj58tKI--

