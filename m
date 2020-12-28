Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A687D2E41CD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:14:13 +0100 (CET)
Received: from localhost ([::1]:58740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktuDs-0000bu-Ph
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu8n-00049Q-Cd; Mon, 28 Dec 2020 10:08:57 -0500
Received: from mout.web.de ([212.227.15.3]:46431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu8l-0001CY-LW; Mon, 28 Dec 2020 10:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609168129;
 bh=FQMRDvxICk/7cfZU8X57AG2wI/ZBvqY1J2ViguU1hAo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ktX/lLMl0bRqvJnAnZy/AvIOQxeTxPBlcW+k2qdEFrjonHZJuNZpYNwsnaaExOOLP
 rqCJGZW0qCXz8S9TSadOvntbvEsNcfIAsb1Q1rbtODFOgbf6CgGoxWx8pmJH4oPox5
 WDr0gOpP00sQGLw2gUASh+ML00piJPesR33/Siak=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MarqU-1kab8d3KP4-00KRGE; Mon, 28
 Dec 2020 16:08:49 +0100
Date: Mon, 28 Dec 2020 16:08:48 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v14 3/7] chardev/char-socket.c: Add yank feature
Message-ID: <1f4eeed1d066c6cbb8d05ffa9585f6e87b34aac6.1609167865.git.lukasstraub2@web.de>
In-Reply-To: <cover.1609167865.git.lukasstraub2@web.de>
References: <cover.1609167865.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9ntZXmlJgT.ojQcWv+pigVb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ZWBORrIdBOIQCCuVwTSrEwrPAbzX9S4/7s1Hjd9cN5cLk6HNZJo
 9k7zbtqXaYHT4ar4ZUlRB8wRQbpbr+76fj1EFd9Sxe6+jAe42tPeh/OayI4FdK5MPeXP8yo
 FrqTb1lLh/FyeZjZ6qJ7jmEH4i+n0lGVdUjuL9Acium37YOSMuj4Ao69I/EwS22Q7D5iTUR
 GIAVjrrgOruCCCiSGemAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QZdFIX+fAX4=:nqTUtJFQ+W77F5q8/0NUUX
 fzrjAi+7RjlfW6HP8gqnfwu63zPv6C4ECaywQDN5RFF9wRBmZSNt3dmIU5hFqLPHUv7DqccnY
 0KQi1l+SLaBkOMVIwoI5QdIhRSQwdwq9Jl0yAeEcfqtSXF3OLjgUMM/xaFPqYzY9u6ZmG4Ysj
 QKJ7wUFiL1oTKId16zbTALf6sU8FBa8lR/+vfQWR543VNa6WA/9RkK700fosufKg1Q5Y7AwA4
 RVR/bkhWhWzk3eFL8aB4AOdw9x+khk17jTK6twdT9uscrQjGT2GaXeiOEK8NDf+a5ZFD8KXh0
 hg4HZTAOVtVn3F361jaPWpBRzwcpERddiGNiERpw56+0TIbNYzftaPEC6FpBdqOqjH6Src/Sq
 wIwIjIarDw+2ImMvCX7jEmHmNOVYS2x9UqpK/XcNm+4YZME6/AzjdeIHmBPZZqa0ph1T6WCdD
 M/XcmSztdzpymZ8tsi7+UN+v/nNZvRCa1y2zufRGPbuUxWjvWlDcTFZ1yU1eOQGrrvT24sSko
 OmZZy6IYMPL5DvhicQ98r1F3CWPGI2UwGrNf1xfG9Mniltr8D2GQHHOF5hKhjY9gcaMknRYJd
 UkeYA+AxfzHmqxJ/u3IV8mnG9s66pFMkOfwdOtaDXVIpxbjdK84sYG/X/1/GW8uJEv6l9AVJk
 /lx4NZeyDHYLR5BNX05SZO4yV8qjZUXRz8TY6cR3VlwyNzeZG7+LZu4XV/CB1sUAdtUOjrH3N
 d7KT31vzQgUGcqCsj7ekY8ZhjuxGdNBv4rkPMYONHal4IfxUJ3GKqWzXDr3ePcM7K9898Ok2E
 32VH2fhDC0rP8qrGbytRFPuHrI825Xf3PF4cHnQSjwcExH/O1b+tUL3rIuN9tMDzMIT6BATY1
 1Xzm5myCRY4JRgbSVdFobijiE4D3EggykpK5wRkDU=
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

--Sig_/9ntZXmlJgT.ojQcWv+pigVb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Register a yank function to shutdown the socket on yank.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 chardev/char-socket.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 213a4c8dd0..8a707d766c 100644
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
@@ -1376,6 +1405,11 @@ static void qmp_chardev_open_socket(Chardev *chr,
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }

+    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)) {
+        return;
+    }
+    s->registered_yank =3D true;
+
     /* be isn't opened until we get a connection */
     *be_opened =3D false;

--
2.29.2


--Sig_/9ntZXmlJgT.ojQcWv+pigVb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p9QAACgkQNasLKJxd
slh8hhAAgt8naTUhcXADlfJ3HKI4H4HOnxsnJxTnCErTwC7ON68cEwhlAeBXc3R+
vIzh/zePL2y/U/T0zULyFfr4nA9Pw/VPciH46lhAYdcj//hSKSX9qna49ozkWf1j
FuBHpzbV4LDTInOFepcUJCojnRxXZzkaZLe3QWJLqxqI1HtkwYBfo0OO1VvDC3Cx
JlNmgXuHi3aXprRL2bvL1QnWXRpdePZvPjgwsqIFoHIsqstT3ZRyKCuBUg6mDGz4
LCKYXTdSpvTKUDBks5csrKfDCDyuuAk2d2kvmiD3+5XKxs8AQAnOXBtp8XeOb+pV
EVI7neX8bMT07LjZMHEhW0/xblr6V4zbaVOMb72TiDusRswfi1rKl7VzoM+FoT1o
BudSEnD95Fd2g7cuo5uu353+LgcU1RkXef2+5nX8uGFoyF6um6HRRtlc+sMAAzeD
UPx8punghnTvr43Tq6puzVyuEanfA90SHMG4/z6FW2J3Z5zFOITVsrQzzfcOiB17
bZbBJ89m2IGXkdwFB7AWHsdd6VaXy4JkRZuUS+nKv+R5nn9JvlQc3kar9Rpgaoke
QaV8kfev+CooLH94bYNJJGHwxuDocQ/QSobGqJ9k0+E7dGSdl6iBkeEkH9akp+wo
fZFc687qu4/PlQ9xV+ToMAetidWYyxfV3XPxZz1K3CfnaV2SzJ8=
=1IsG
-----END PGP SIGNATURE-----

--Sig_/9ntZXmlJgT.ojQcWv+pigVb--

