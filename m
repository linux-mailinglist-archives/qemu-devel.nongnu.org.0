Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D562B34A6
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 12:40:43 +0100 (CET)
Received: from localhost ([::1]:33410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keGOg-0001il-Sn
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 06:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKU-0005A1-Da; Sun, 15 Nov 2020 06:36:22 -0500
Received: from mout.web.de ([212.227.15.3]:51063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKS-0008HQ-9Z; Sun, 15 Nov 2020 06:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605440174;
 bh=aOQZxDWLmA3ottt++HvQsb09XxJx64I2LDDCqr2+C3Q=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=OAqw/ZzjdvuCZ9tSBiXHSAw38C+gcz5IiFPpMNjav/t1dPIQn0onvVb02HG6r1Oc3
 42aue7wf9M4Ybri2XvI0mPqL7GvvHVp8Y/IoSw6Bw8CHgLony0GfWGjqOd+ndY1I1e
 CQlVUtOVl0pg72/kjjCoPHpHPATjb+NacVMqA9S8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MP2Sl-1kbDvV0KRz-006R2I; Sun, 15
 Nov 2020 12:36:14 +0100
Date: Sun, 15 Nov 2020 12:36:13 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v11 4/7] migration: Add yank feature
Message-ID: <483f47c06989ca8bf39ec2fd2233f429c677c5c9.1605439674.git.lukasstraub2@web.de>
In-Reply-To: <cover.1605439674.git.lukasstraub2@web.de>
References: <cover.1605439674.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0sphafSrhgVLntwwPNZcnGP";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:mWoH5/HcwcRKM0Np/7jisdUpxLgKel3/Bq2HWGoTcCiZebGz5Tp
 uvgm0fKpERkMbprrEYRTEWGXBIHUd4E2w2pPFwLJVkdCZpc0ROdRP73UrkD0I897tRGzax+
 rf73ehmMZwE/BwfcjizC63s2psBZmR8yQBBC1DgMzDluFvBcMn0PfRyfC+BzijXaiQ8ZjfV
 4bY/7bYzTyvS+RICl9+4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0ZyHuWxBLxo=:JCYFZnJgMItf++0oi9Bqss
 0G9wUwQ9d3cit890S4mi/vDiARro3Yhpzt64HM82GKfStRjkKesCO5x3I1CxL6Kke8P9trGyX
 8bluvtM0zSwcj4ewXEbIl8ex1B07tkYlXnDUA2qMZ9TpyHbcyxst0PEjSbcxPysei02RaUAdk
 zKR+oiUU+BMzIhGgm6MbnOoWZ4BiX4vUjyZV+gWBSjfZGuw2FnBccgKl4D958n7schD1E6lXM
 gxEc5dXNd/J1RsvlezhMZmoxXlDHS7ThWrfUMnJEAwlRM0DvNI5lthPuowf/11vXRacnwLKh9
 iixiWz3cHxzq77AIIJU56rCWw8V0h98pLX8gIT8m5ynIcEBIarP76Dm4ndihYNeqCPFF+jchb
 bX2zTyZUXQ8X4O876as8mq4h7PNMUK+Q/2pwn299oFDhgPsNj0M5n3+s3nhlqhA9AdNO59kxB
 9uutchKVqH6oomaIvoG8crMd/GeKOKbmFK3JHgs38WJA9+VS2gehhcuAcqQMPBhN488GJH63L
 U2dBsUW+3vhCu2vtJee8dy70sLvt+Egl83NWS+fflgcSjI19mlDS+XgjgVEeGlAtL5jmUVocp
 I0gFgVE+qokk2fsVMAAnl2ajK0ktqerbSE+wfZgLeBeOWNr15H0StdQT/fE16pQz5nD8BMYoI
 hiWT9FXfowV9rlHy+aJJguFO/07SvMkuK7CVKLIBtU9LKDiE3B5RsHMxeBvkQZkgFVZTqpgWY
 EvZUgUdM4Y9BBU9xle249Qs1TYMbQRq3P6JhUjDTy7OAjWepQ8OUmiOvYYX2pkEqxg/ng3oB2
 Q69RVd7WUzf1yvW5mRKL8FZL+GAVQE8/ODM6xZ7OSlKPDRjYgdYt1ijmD6zTgYvBnpI99/kIH
 /UBilirGGYYGmeYnV/ig==
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 06:36:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/0sphafSrhgVLntwwPNZcnGP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Register yank functions on sockets to shut them down.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/channel.c           | 13 +++++++++++++
 migration/migration.c         | 25 +++++++++++++++++++++++++
 migration/multifd.c           | 10 ++++++++++
 migration/qemu-file-channel.c |  7 +++++++
 migration/savevm.c            |  6 ++++++
 5 files changed, 61 insertions(+)

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
index 87a9b59f83..a5add9d17d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -56,6 +56,7 @@
 #include "net/announce.h"
 #include "qemu/queue.h"
 #include "multifd.h"
+#include "qemu/yank.h"

 #ifdef CONFIG_VFIO
 #include "hw/vfio/vfio-common.h"
@@ -252,6 +253,8 @@ void migration_incoming_state_destroy(void)
         qapi_free_SocketAddressList(mis->socket_address_list);
         mis->socket_address_list =3D NULL;
     }
+
+    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }

 static void migrate_generate_event(int new_state)
@@ -429,8 +432,14 @@ void qemu_start_incoming_migration(const char *uri, Er=
ror **errp)
 {
     const char *p =3D NULL;

+    yank_register_instance(MIGRATION_YANK_INSTANCE, errp);
+    if (*errp) {
+        return;
+    }
+
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (!strcmp(uri, "defer")) {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         deferred_incoming_migration(errp);
     } else if (strstart(uri, "tcp:", &p) ||
                strstart(uri, "unix:", NULL) ||
@@ -445,6 +454,7 @@ void qemu_start_incoming_migration(const char *uri, Err=
or **errp)
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_incoming_migration(p, errp);
     } else {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
 }
@@ -1750,6 +1760,7 @@ static void migrate_fd_cleanup(MigrationState *s)
     }
     notifier_list_notify(&migration_state_notifiers, s);
     block_cleanup_parameters(s);
+    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }

 static void migrate_fd_cleanup_schedule(MigrationState *s)
@@ -2024,6 +2035,7 @@ void qmp_migrate_recover(const char *uri, Error **err=
p)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
+    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
     qemu_start_incoming_migration(uri, errp);
 }

@@ -2161,6 +2173,13 @@ void qmp_migrate(const char *uri, bool has_blk, bool=
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
@@ -2174,6 +2193,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool =
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
@@ -2183,6 +2205,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool =
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


--Sig_/0sphafSrhgVLntwwPNZcnGP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+xEq0ACgkQNasLKJxd
slguUA/9HnNFbc4mf/ur7jUktXlnvSccmo+E0mCtm17dGkv/e+W+3UI9dF3iKiX1
MIAYpyIdg2qKZKypmi0xOpzpF+aHV44g4gIsS2heG6FbHy4vD1MqNS8bL2OHDhKh
3S2utvihzVwiQcW8/QS8wbISe3IIRV2NtEA6sF/TKH73ZcY3z7B4YSEhhMzrLBQc
tbC5uh5M0QZVTBK56SHeEu5cOMNgqmUGPccUpBC1l2kGKTvuZG6yFY8y952ReSfc
AgzJceWUnJZtxgwUiWihWPCRU3+OVNOiYTkU89TiRln9DXnJkZWYOMV/UIxgaUcB
DEClMeExBM0yhr9cPCdmFKnf4vZGx7taQj69B0e4bMTM6wRdamgKX413SZ9QIze+
Gxy4jwKMtMkhBJJ0p+rUuEq9ckVsOd+laOdu6KCvV4ubhL9kpHpnda1+cVbtAPOV
XtkKZDP4EG/d+lEaMxPFZ216k+Uz97Jm1pSipPh2WJbIdZfDbT5hprT/Jb8sB5tM
m3tMtKwRIrqpDRMZr1GZ5Zn5FapenZDuvE0iNpc/uHPQBAT4CppjiRgWZ30UH4CO
DW+7yRB2AxtLK3kA5R7PA3y0Nct+7/4gOPIpuZfi6NANhCWTi7QQhzOD3QdlLLuD
K0Rqm7QqRparEfGP1Hv/5Gr58tWDDJah4K3cLW/hQKc4MwVaVQw=
=YGNT
-----END PGP SIGNATURE-----

--Sig_/0sphafSrhgVLntwwPNZcnGP--

