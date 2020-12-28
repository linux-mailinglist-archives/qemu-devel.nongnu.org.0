Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6FA2E41A9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:11:44 +0100 (CET)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktuBT-0006gl-IG
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu8s-0004LY-3m; Mon, 28 Dec 2020 10:09:02 -0500
Received: from mout.web.de ([212.227.15.14]:38877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu8q-0001Da-54; Mon, 28 Dec 2020 10:09:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609168133;
 bh=2za7JJ/kLW+KjYQ6X0pvk7YEZzm+aVrV3f8jauTm5AQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=FaNISJKfKEs7PfUmS4M1WOgNkGUU4StmCh3H7aXjjXfdbF/zvUKvtl7S2S1RAeqW1
 wOP+we5HJ2kcnNMwGct4vRAhzXAILvSC1TiJLu+mUVEAiK+KOvknl4FYrcKX4/WUPf
 EX1gcezP0NNQYT3Jrq5XpPbBW3WLIvj9egfshZjg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MuFD7-1k1Wy82lLB-00u9B0; Mon, 28
 Dec 2020 16:08:53 +0100
Date: Mon, 28 Dec 2020 16:08:52 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v14 4/7] migration: Add yank feature
Message-ID: <484c6a14cc2506bebedd5a237259b91363ff8f88.1609167865.git.lukasstraub2@web.de>
In-Reply-To: <cover.1609167865.git.lukasstraub2@web.de>
References: <cover.1609167865.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xD4EVpXz3EkMTtB0Gx+ANUL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:sQwHVoZ9cVBskt2vZ42HLQ9xNbNezTeHeoCkVSyYoyYw28x61J9
 2gCCJDod/HME4j+dBI1fDhGFclShEfcLfLNIF9kIPjCfbhbv9xN8N6KUCdsI/qSopOp8Rgk
 ke93pN/P/vbi+mL3W2YzFYnXuK8pm4nyp+vfdediQQQIdKlLZv+ezHXuZlT5VZNTUJ9gegG
 cblcI2Bsk0L4Lfg/I2sTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VRRq5fmy6OM=:IAPSIZc+2NERo9UPSn9c31
 Tr9SFtY7lLXBFp5Ly4Csij2F4XeYV5lLL6+S99ckma3qDYK+cki0tP+llxIgojc335Q5tECL2
 seDUcVeCJTmwBC/ELjNQ84A8UmuGQV7pIVSFrJ3/OO62roySxeNwRAR06Gd4rGJPPbWYGKqff
 h5Y1ZedyGDw+jjjP6oO/lN3eAEtwcBjRlhHkcOEzSRIv2deR0n9WyP7uWlYioBuAk8e4IFpPo
 3BzW/kDh8os7QZbyHWm7BRv70PwtaU3pPxH2dCpkma8T/whpAV7J/NOEBug+mhNCmqeQv2w1Q
 wDTRzPaSTru0vbBosZbLfO4oHJlIUAHFE048UdmeTadAq++ujwTg59DkjRxfhptbIxJS88RMI
 eca1oHVXXkmeBppGcjFFatVUbQO7U5jJebrgex6rDiT7jjogCBKwRNbpWBroRldGDnR8d1DFJ
 mxr+fyYqkjNwrhFxWzM+q1VMoeaT+w3jiGzzhLwFVgshKppqKCzDF0XvpS7iMJMGNtXWOZgRh
 7oydv9VEJHEgOGuftqH3xKwsFWrPRl4phgQi8qcBdfm96UTs2n4F4FeUgZ+9wHUXEVagjbSl6
 EgUnk95hr2vtSbID5wfw/hfGeefO1MymSEoKSBjbgZ1/35SzzDLiUzqYzy7cQC4UhXm8oD+Rq
 WUUendl79OwUwUInBJ7geF9RurKWNolfu/Ixv9dTNzf4nJog/5+ENAtZ5nKcbojmC9B+2CkZa
 mzRyuO+Ymzp6uU97WMCXhGjGZPFm7BpL5rOMjyI9LMXXQQixyY8/oxILV6Em9Mg0zhV2eqEDC
 E2ErESODJ8wnFIpOy89EFe9zkoS+VLu7gijTL3LSOYMAhgtrIW+PvZeIPI/rlOdxlTQ5NS63h
 MVUHrLsJVQ8+J+Zr9g0JS9wEndsgw418/9NyGioEI=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--Sig_/xD4EVpXz3EkMTtB0Gx+ANUL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Register yank functions on sockets to shut them down.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/channel.c           | 13 +++++++++++++
 migration/migration.c         | 22 ++++++++++++++++++++++
 migration/multifd.c           | 10 ++++++++++
 migration/qemu-file-channel.c |  7 +++++++
 migration/savevm.c            |  5 +++++
 5 files changed, 57 insertions(+)

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
index e0dbde4091..92f7cb70b2 100644
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
@@ -418,6 +421,10 @@ static void qemu_start_incoming_migration(const char *=
uri, Error **errp)
 {
     const char *p =3D NULL;

+    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
+        return;
+    }
+
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
@@ -432,6 +439,7 @@ static void qemu_start_incoming_migration(const char *u=
ri, Error **errp)
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_incoming_migration(p, errp);
     } else {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
 }
@@ -1737,6 +1745,7 @@ static void migrate_fd_cleanup(MigrationState *s)
     }
     notifier_list_notify(&migration_state_notifiers, s);
     block_cleanup_parameters(s);
+    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }

 static void migrate_fd_cleanup_schedule(MigrationState *s)
@@ -2011,6 +2020,7 @@ void qmp_migrate_recover(const char *uri, Error **err=
p)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
+    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
     qemu_start_incoming_migration(uri, errp);
 }

@@ -2148,6 +2158,12 @@ void qmp_migrate(const char *uri, bool has_blk, bool=
 blk,
         return;
     }

+    if (!(has_resume && resume)) {
+        if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
+            return;
+        }
+    }
+
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
@@ -2161,6 +2177,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool =
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
@@ -2170,6 +2189,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool =
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
index 5f937a2762..b3c29776db 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -62,6 +62,7 @@
 #include "migration/colo.h"
 #include "qemu/bitmap.h"
 #include "net/announce.h"
+#include "qemu/yank.h"

 const unsigned int postcopy_ram_discard_version;

@@ -3008,6 +3009,10 @@ int load_snapshot(const char *name, Error **errp)
     qemu_system_reset(SHUTDOWN_CAUSE_NONE);
     mis->from_src_file =3D f;

+    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
+        ret =3D -EINVAL;
+        goto err_drain;
+    }
     aio_context_acquire(aio_context);
     ret =3D qemu_loadvm_state(f);
     migration_incoming_state_destroy();
--
2.29.2


--Sig_/xD4EVpXz3EkMTtB0Gx+ANUL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p9QQACgkQNasLKJxd
slgevw/+Kjydxe6MCz+JUryToPW4MvbsOTtGWCSPV+60mWxUKeys9JwOVsXOV+3i
SnFABNJ9voQS/j71iExezgx5cOB8to0reS9Wz3k3sAhvVFznj56NJIBYn6vtJA98
YYuBnXH9Y4aMSnzmqRDiqMvdL3MLc2eUHzxfPQMNTkEg+r9noD8BRtYXUAtiOIxR
UX6eDEltFwkvXNEm4RTHjF+f0TZNwXu5mntaVbIIg02Z8PnJ+tYnegWNkO/K7GUR
RxbtiK/X13sQNzyFXzNZIB+6BIrpfTUTNb0xygmbBa6r2LHRKM58h/2IFYcZZFJ2
eCnP770RmYrzJtjtTq/sQy1zkz4FS4BJJP7KxTxT3vINR+neOR0mVvhm6oODVl3c
hc7iIEP0/rQuPHlgycpfyi+5Nazt/snCAnGF88KIKyL3lcSjHNck9JjLAZLTPOGi
iDiZuj5rUAOs49CMjsoPPXptkGAvbjZsYr4sBpLg0DuYqqWn/5iJ5ADW7DqiVCrb
+c7L23CYFxaFs8cVTNzdN/zmotlHVZkucCXVYtGWWCY7McQXHdlXTZWYfG/DzZAB
Moxw65xt0j00FIiv92enxqx/ABeVJJ8ATXhTQPuuLPp9I26ingf4QFuwtSG7JVJY
P1vsSJeSEIVW3QlwNvwjhzoZQVmP3kqv7BI5GhwJEiqutyuQNJU=
=P/CI
-----END PGP SIGNATURE-----

--Sig_/xD4EVpXz3EkMTtB0Gx+ANUL--

