Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C222E4108
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:02:58 +0100 (CET)
Received: from localhost ([::1]:32824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktu2z-0005xv-Ag
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttz7-0002yU-3r; Mon, 28 Dec 2020 09:58:57 -0500
Received: from mout.web.de ([212.227.15.3]:60253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttz4-0006ZG-S9; Mon, 28 Dec 2020 09:58:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609167528;
 bh=gnqP+PjsQ+2XVKsqF0NL/y9CLxmi5xk6iZ+6W4OvvWU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=J0Inf82Zrhl/uijAgU8lY0SBYPtRhO1qYlUvezaBKUWePHwugYkyZuy0dtpjg3FCC
 h51p2OATpdcvab/z6m7vbsmMB5sXxQ1obVDeKgu/xhMasnNQouJ9wTO6tdSSFBzjLn
 jGrpnOlUvcxEvtcxDBI+KX7aPvrr3zk92inGIFeI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LbImQ-1kA5Z40g8I-00kvWP; Mon, 28
 Dec 2020 15:58:48 +0100
Date: Mon, 28 Dec 2020 15:58:46 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v13 4/7] migration: Add yank feature
Message-ID: <fc7ba197e62d27cbc8ba0b53738b8e07eb441a92.1609166587.git.lukasstraub2@web.de>
In-Reply-To: <cover.1609166587.git.lukasstraub2@web.de>
References: <cover.1609166587.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k.lJhpPiy6YPDGyIX/lZlos";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:p7VzboNkqcyJ6k+MN6He5G4OAo97kBTf9xTZHcKbTA7gFcbK62v
 OEZJyXsMup76ITN9UakzAFfmjZSSu9MHkN1dC6ob8YqcSizvzDuFtFjnW9D3TOvQDWuTal4
 s4P6v/ijeiwB9RjJO0ync3b09Jw6jrgOv8DJL6ldyPDlrPzym8yY4y7ADf5MR7uOVHCl/xh
 zkIXFKaPy5+aocMfTX11Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tkpxx+039F8=:vrgMBZ2gCN4JWdKXD2j8zi
 bRRKB1UcA+8fw1ODQx78vodtymki86g8qqPXSh7xplpiEibMdIoH4at5n3QxKpkhkodbXeRgI
 vpzLQXGVDhZ9aewNKWo2k8ti8afFafKj6LK75Bma0eOd8g2a7+S1+WSxeuynYS6YpcU4uysBq
 Kh22fMV30mjF2Rucsrl/z0UDwJhaHtRdVbrO9/ZYToxWROjwh4edZXi7LT9O7ZZYwFmP9ZcMU
 swVP47pTy17DSS2bZyoUiRSFheMC+wsIxBlxVqlNyP1MPcwY2v2vikRUGY+NB0gqWpImczVdl
 oAOupJ0BLuLnBm1n3M6LIYL8NNOL7His+g5zYOZ+YU9fqTYlezOEzux4I5jMQ11Wk8EnIedgG
 JOfu5sUGkQ9sfIWbcbsk0ALTbrH3HNUDdykyqjVsIHALXRGUPjbV03LVrP2sPnKBPEsf8cgQh
 0ddkM1Xq8PndUfNMeikqo6xYL5SBSOrzSaaejCkS833ItD1LCNnn2dv3yJmneNjCtTSJ2KanE
 gfBWsYT4wxODYH56uqcyWhYkYeabEZ+9qB2BNEVZaaRG07CQGj19F8apWCMFu4J3Y6vyC6OiV
 7q0Pl7Dqx/TYXXmXzxUrT4T5lh46A2E2YO+0/IFOcih+LuVBPO8+P2Sa+iEsMs03gs2p2vyO1
 RrwKiLqG4CD4/Bxafcyr6X44iaaUdaJ9szfB7ucAGKh+aLifNjd8NAkodbupVZcXnKI60+KT1
 yxXL2x+4prpZZ+itdYJazrIlSt5EfS7hP35n7Ah/5zaEgBUCJv3EuR4fLdnEZI/kjhs/SXW2J
 f+Rxr7IelBxR2qj/y5nJ73oPJe0TJiPw6TrOR7baF6DYeEoOZ/hnUAXNmAp2MR/DMdGrRkTGU
 ppXIRMNqLlRTYbD+ggl0F+gWC9edwVchUcBSFTn6M=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
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

--Sig_/k.lJhpPiy6YPDGyIX/lZlos
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


--Sig_/k.lJhpPiy6YPDGyIX/lZlos
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p8qYACgkQNasLKJxd
sliKoBAAmSklPTThfY9rstMAEwK+ErtMC9GTTsQ/A/Ea8yBdW8HcBVn6GC4DCdgz
zwC1QPdUUDVm7TkI0UXs6TzIiQzdF1fKoC8hotvYlpIIvaykbhxdbGpo0uWFtgJF
m+1g1WHBuut3J86J0WUd4s1TUsNdDY8p3+M+lKJoZOJSnRrHtHR2RKMM68p5saD6
7pLm1IAKtkkFIWM14V2avCqUSXyHU7fCJp2CkT9Eo6kbZJ53/0JUiZquWVKNhr0N
0qz7z9QIUDjcHH+YocDdWu8d4fyjc25T9HS84EiJjRHAlk0kTuu4ylGQ6LxkPHzn
ickrd0O5MPo0B7HhUlCLF6zo+8bAiee4RdQ+ntrmuWRQiof4w5EFZEaXFH1x0QT2
Gfu5hqDInJl92VwNqnQvxxIhSY3+ldlxkDAJZ4RuvEGezgCe+SS7wZ1GOCaBULuU
miu/kCUEVBjzl620+mpPiCTQc3UJAn77Wz2KSJoLRFYbByf28Fb8oCwR6a31YWfw
Tz/Ti5YNMPC3rlCI1btmW+3k3V2JP19e4p80m6xis39uJ9PCuFKVqb1pSserJCZC
m0owELDU744JQd/vlzLbpJVCXLjqiej3xAlMjr1IdQ9wfW3ul5zWYn3YzO4tQZlv
dwLyN50Gilu685Rnrh1b6g+pFlEK1eafJ1AR9uR6FGeVz0EOknI=
=T7mT
-----END PGP SIGNATURE-----

--Sig_/k.lJhpPiy6YPDGyIX/lZlos--

