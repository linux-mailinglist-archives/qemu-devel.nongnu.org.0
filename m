Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FA22D8CE9
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 12:56:32 +0100 (CET)
Received: from localhost ([::1]:36322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koPzL-0002ps-G8
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 06:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPrc-0005Yy-Fh; Sun, 13 Dec 2020 06:48:34 -0500
Received: from mout.web.de ([217.72.192.78]:37807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPrY-0002LP-Pe; Sun, 13 Dec 2020 06:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1607860102;
 bh=6DbTaw2VwDiRnD4UDckkIgL0bd5JpZKh2v4ftCcY5Yc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=i45z+I2QWBy9oWzABVCDoqax0S5qUApWhP/8PW3u3eiA1jGxyFDUzl4OZXocLQ5GG
 UXeISN4NJSgepi+K+ZGvER5wwjxIS0iLbWES3Ok4b+T/Y+TUqRyCLtxoov+YRT63CY
 NVKU3ug8siVawN5IrnB89DYtfVDS0gjLzFSWUiHU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.131]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1McZjb-1kFtKF2xe1-00cwzh; Sun, 13
 Dec 2020 12:48:22 +0100
Date: Sun, 13 Dec 2020 12:48:20 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v12 3/7] chardev/char-socket.c: Add yank feature
Message-ID: <59d7fbce1687606de93cc69b7755ac80ae6b2eaa.1607858747.git.lukasstraub2@web.de>
In-Reply-To: <cover.1607858747.git.lukasstraub2@web.de>
References: <cover.1607858747.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hyfVtZ+ZL47UfVBeLXa4c46";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:i+89IbMWfHLeMgXxLRdMfPielK4eugir5vwoir3zh0Fn/gcrJ/L
 H/6tapW6WZomlQcBbRiypzOoJubuTfGH1Lm+1bbz2zKTj/xva/lHYlo8hg9sJf95ATKh9NS
 x856YLtg7YnSic/6zl59zyt1Fv6PgPoVXOMamgRV1PntQlyTfakXuviFj/CnXCBpNW3dWhE
 Z7EitcWg9BZMaMBoAl9gw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0zH/XOmHgpc=:Dhr9XqPDaZokElNgcF+l7J
 0aFLLs2KT03f3hy7DYa+OpiyqNf4/RdjafsSmeybNXcbf5JV+ytoS+upeP2Oi6CFEVCwbByhb
 iR9dLWfYcB+q1Gx504XVGF14R+kRKMJ6d/qwgETThEAf6b+2stddApTxRN5FWYwK5HdrWm9BX
 e2Kt0d41Pan2AIFhONq5F2J5+3Qba76k7gGzR5rS2ppIHt5EDo06YZzuEf+0yNlDCD55yiqAQ
 lZRfiovyMINxJ6afC7xhODUQfm6cxWHmfZ31vQW56pP7bXNZyS3qEUT/4nWu069+iVnAYY1wQ
 nj9X3c5gsZ5/AMdwyb2tQ/e0yPS6aGYDVCmgTOATWFkoYNZQmRfwMmm9fgObYaOPdBWbtJEyb
 mLfKv/DddMueWrCSy++6qXDpw9mvSxTPhodb3pOaxTD2Hj6ACQEZHygKw2pNy3KFNCxTL3sr3
 vgf8HHsXUlIPRPNqexJWAG7yjk+gyF2b+S7mQ3dSpGwDLDC5jsjBbEDBMBMN0czFwdWdClezX
 umrZbamQYrgn27mU5NxkCIG4+gvh7Ow+KizIHVIMEsGkQAz/Opi9b572UQV9cGwdtFlpiRAPj
 Y1/Tc0MH60Mr0mxtLUIZEzVkVhH4GSzPrGntGv2RIpx6IK/h1rJOpCv4lUwMkHZiHnYM8k7LO
 wDcy0soKnAzQBQSuMDHAfgx8cLvmhFfrLF4QL4kxfBsrbaq+QL5zg6I3Rn11hqbAxY4aYRjuM
 cLmEF49L0Ib+oY98LcAWf3j0SwMY+mA5/i6lEhGjD0mA29Ki1j+uv/VQBQHqpX5Ml0yNIO3Yx
 9QtCPqcr4GPYDXajqeOzEImfthu/FsOeC4cbdeW+46ZvWySKhSIRlWE8OZEzuCC43wDN+WvNt
 uXzBUFq28DMmewv6Vh/bNacb51NEFAact4aUSP2vw=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
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
 =?UTF-8?B?TWFyYy1B?= =?UTF-8?B?bmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/hyfVtZ+ZL47UfVBeLXa4c46
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Register a yank function to shutdown the socket on yank.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 chardev/char-socket.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 213a4c8dd0..7f2ee9a338 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -34,6 +34,7 @@
 #include "qapi/error.h"
 #include "qapi/clone-visitor.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qemu/yank.h"

 #include "chardev/char-io.h"
 #include "qom/object.h"
@@ -70,6 +71,7 @@ struct SocketChardev {
     size_t read_msgfds_num;
     int *write_msgfds;
     size_t write_msgfds_num;
+    bool registered_yank;

     SocketAddress *addr;
     bool is_listen;
@@ -415,6 +417,12 @@ static void tcp_chr_free_connection(Chardev *chr)

     tcp_set_msgfds(chr, NULL, 0);
     remove_fd_in_watch(chr);
+    if (s->state =3D=3D TCP_CHARDEV_STATE_CONNECTING
+        || s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED) {
+        yank_unregister_function(CHARDEV_YANK_INSTANCE(chr->label),
+                                 yank_generic_iochannel,
+                                 QIO_CHANNEL(s->sioc));
+    }
     object_unref(OBJECT(s->sioc));
     s->sioc =3D NULL;
     object_unref(OBJECT(s->ioc));
@@ -932,6 +940,9 @@ static int tcp_chr_add_client(Chardev *chr, int fd)
     }
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     tcp_chr_set_client_ioc_name(chr, sioc);
+    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
+                           yank_generic_iochannel,
+                           QIO_CHANNEL(sioc));
     ret =3D tcp_chr_new_client(chr, sioc);
     object_unref(OBJECT(sioc));
     return ret;
@@ -946,6 +957,9 @@ static void tcp_chr_accept(QIONetListener *listener,

     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     tcp_chr_set_client_ioc_name(chr, cioc);
+    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
+                           yank_generic_iochannel,
+                           QIO_CHANNEL(cioc));
     tcp_chr_new_client(chr, cioc);
 }

@@ -961,6 +975,9 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Er=
ror **errp)
         object_unref(OBJECT(sioc));
         return -1;
     }
+    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
+                           yank_generic_iochannel,
+                           QIO_CHANNEL(sioc));
     tcp_chr_new_client(chr, sioc);
     object_unref(OBJECT(sioc));
     return 0;
@@ -976,6 +993,9 @@ static void tcp_chr_accept_server_sync(Chardev *chr)
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     sioc =3D qio_net_listener_wait_client(s->listener);
     tcp_chr_set_client_ioc_name(chr, sioc);
+    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
+                           yank_generic_iochannel,
+                           QIO_CHANNEL(sioc));
     tcp_chr_new_client(chr, sioc);
     object_unref(OBJECT(sioc));
 }
@@ -1086,6 +1106,9 @@ static void char_socket_finalize(Object *obj)
         object_unref(OBJECT(s->tls_creds));
     }
     g_free(s->tls_authz);
+    if (s->registered_yank) {
+        yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
+    }

     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
 }
@@ -1101,6 +1124,9 @@ static void qemu_chr_socket_connected(QIOTask *task, =
void *opaque)

     if (qio_task_propagate_error(task, &err)) {
         tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
+        yank_unregister_function(CHARDEV_YANK_INSTANCE(chr->label),
+                                 yank_generic_iochannel,
+                                 QIO_CHANNEL(sioc));
         check_report_connect_error(chr, err);
         goto cleanup;
     }
@@ -1134,6 +1160,9 @@ static void tcp_chr_connect_client_async(Chardev *chr)
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     sioc =3D qio_channel_socket_new();
     tcp_chr_set_client_ioc_name(chr, sioc);
+    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
+                           yank_generic_iochannel,
+                           QIO_CHANNEL(sioc));
     /*
      * Normally code would use the qio_channel_socket_connect_async
      * method which uses a QIOTask + qio_task_set_error internally
@@ -1376,6 +1405,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }

+    yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp);
+    if (*errp) {
+        return;
+    }
+    s->registered_yank =3D true;
+
     /* be isn't opened until we get a connection */
     *be_opened =3D false;

--
2.20.1


--Sig_/hyfVtZ+ZL47UfVBeLXa4c46
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/V/4UACgkQNasLKJxd
sljA3Q//dAynw2xidgX7ieLrClplvwm74ShGQeX4w6MNV9OWCNb0CQA8zCuY46DZ
wQq+ctkAE60Ny7TEaxGH394LIMKVl185eAsVxtaaT4QGxaqimtwJb17lXA86HsR5
fTOvtzqJSndfA7EZXoNi+LIRUM1wVW6QE+HTBYtlLKBrG8GLNT1pYfUBfGZtgD8Q
q9hpQm9ducOXA6JGFuVkfGKh2kLCFravM23Zs+Bj06YQtqxW9sdP0JecR45xMC7m
eAVxyFwCjayK+3wClpIzFHBXnyRRF2tlkKrPC7MyOrRRazAGubjCKDtpWfajt+up
XzRq4BB5UKl5a4fM0F5b5bgi/ToadF879R21Pikd6FuxdvuIGjT5/eLwPC6g5nI9
0YM9f10nZNPgwipnfK2O8kgByaKYWujMgqCLL+6Am7BVj2Hs9FNrtka3DW4tvAMG
LuL/sucZl+ojT0sZdhuum3xvZWTihv0IgaPz/ni0D+xfpARN3X//rr0Mr2gfqYm8
94Zh2tgxZntPgHca00zbIgo8618UKrN3kFSNfQXK7M51/WoF3fSeUnJIxTSZhH2H
X9mgBlYuMvhuve1CCAcJGU2aNpFEMcb4CI4MRugDygV30z1BH+yEsb+PtmQOCvEU
tPU0h7bhkGR+9b/KCFewGFUuFbhrpN/+YRwxyIvkCchbqbkSdUE=
=bE8a
-----END PGP SIGNATURE-----

--Sig_/hyfVtZ+ZL47UfVBeLXa4c46--

