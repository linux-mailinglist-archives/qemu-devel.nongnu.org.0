Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336802E4107
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:02:08 +0100 (CET)
Received: from localhost ([::1]:58270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktu2B-0004Ym-3s
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttz2-0002nH-2l; Mon, 28 Dec 2020 09:58:52 -0500
Received: from mout.web.de ([212.227.15.14]:49571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttz0-0006Xg-9a; Mon, 28 Dec 2020 09:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609167524;
 bh=rdd77FcqNCutE2kHAJBRJCbMv1+7m5qLzrH7zZjBrOQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=YKDAC77zs/ZEOyM72L10tE+qpy9tE9fmlUOF/2IpnbkYPfc+LzJybuKKj3nEVdYTV
 tjEV0OJm87+jRmiHhw7Rh5ftSKlu+4TmYuqC4Ygt1CH266opsAaOX6zMPUq92tM8VD
 V418M9IvZ9RC0Jtja7aVC7rczEv3i82CiFyxtK+U=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsrdM-1k0hvo18B6-00tKSk; Mon, 28
 Dec 2020 15:58:44 +0100
Date: Mon, 28 Dec 2020 15:58:42 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v13 3/7] chardev/char-socket.c: Add yank feature
Message-ID: <9db0fd19a99e1dc7fd6e612fe279716233243b14.1609166587.git.lukasstraub2@web.de>
In-Reply-To: <cover.1609166587.git.lukasstraub2@web.de>
References: <cover.1609166587.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RLan_yhHKjNO8sw.RsoZ1YH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:mNnqpqSLcVNNstD50aqEZfKE0lMAq7FVK63IGtfTl4O63IUXCJF
 780B4bM4asv3N55b2+ggMZX3rLM8a2BmhW/g6vLa4A1E4jZJqEyaSj/RMp8DG6sOqbqyG2k
 hb6RJcBe1Mgg51yzs1ruhhdkg8qC/74UDROPlvmoyX+KGsKaEY+9JtHTZbMYLjMzDvL2aSX
 +x/OZL8zL73eAFYeU+ZOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xuQM6I52PnY=:Ho4WxRMJp1UblYLT6fEPm5
 RA8gdrjj/Ku4loyGFavBP/PQhEQc0atSoxJSJk45zGVH95JJWH3C31VR08A+B1Admj6mM8j8x
 yV8r53tNbKm/TlRo1e9afyc6kvpqH6ud5quMcNsn85vW93bfbItyQkZvQyHMT2z+rozHSJFjx
 bhK7gN97H9i/YlC1LMAKHKLrzc+1V612yNqZT3ZA3ZZ9XMAq6hzcFlEyEX71txi6hQSkG3HaO
 fdZc2/X9g0lqgC/awkmsgK7+wq6Xj+TlyRWmcrjtG8CE3PGqRdzlmS84ynPNwLZWJDTstLRVQ
 2ueaR7HxYmkKKuD2pfPlDwWqOeamot1Cn5Sdt1XJIfRVZpkTAx/cPKdCj5z0QD1rSKAqn2GQm
 QmkoJIsbNeuVGt0UmuIQWagjhJY4JRlYrONnIeE+Fu9K+CNMylqdDe27zxfxwbHFDHHtCehs9
 6Xinck+50EiY6FKKLmj1jeNQBzrjPNaJSmXy07/L09yeskTjHJIKOxePFqNFMbMciuicM7Xsr
 2vuDSAfYsFWtP51ZC3ecD1shtV0/s+TDKusmTEC8ME5iGVRC8UcAsYiq4AIunyi2RYEaC/Vgv
 HgloNoOWCC+ggef4+byZ/ttq/iaz6FI/0/Fo70KUaAvB5Kw+7uqr+3clSmKdjmwFHx5HOc6NM
 LvLk89zMPONA/Wa4F4uKbaNJ9THtkkOCsIRZ0KxkSVMfl/rvlCTiUGv0eEOA6HL1c8bYydJxY
 tQoX4M0qHF0FjCVwSPjpWBiOaCVuRQ36d7x35zDLk6YwdtUSdjrx9EHssSIoqZI74GHzMhoL2
 RrKe0CGaHWMqb9J20W9En4pV/Sv3GE6/99d5yfv8rg4RRjJhzgY1B/CsCJHGrwH8audbfOGjx
 KUVIR1qBFZqLnvCPxbZjcqPlAA33QCc2a9XUrbaUA=
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

--Sig_/RLan_yhHKjNO8sw.RsoZ1YH
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


--Sig_/RLan_yhHKjNO8sw.RsoZ1YH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p8qIACgkQNasLKJxd
sljFrA/9FU2VviIBIypuyHVorTGpxE08NZ4nmyZWuVf2e508X8W1+bq9wq2xydpX
OSMDa3RD72zpLdMOk3+m11LIF0LCK+pOtIGLXS1lj427u2ukaexuHpT1cS2B8jXH
GaPvPCHRoguURGs5l4Z5qvY6OrOukn9acyY1lwQVpy/yPV0BJpjuH9beeXjCVEL6
fCC0+YofeYEdua0VW2mjqqYQ1llGypVpSYxU6ejqz/ftu8ShYdr9XT3bluLKl5ep
ddJzDJie8EG5rFPCl2rdpnU3XBuOMss+Ow+5OhRo+4K1y9gOrBklVk7JocFg3r67
fz+KceqBRrYSwuLUksZeSHpLBacLHvf5Z/MYSPhL0qp/XM+YtdJf3Zo72byoUngw
IbbqRqLVQwiHjZmjzWTZ7VZTaV/9M3/RAm4DK2sCSwR1WldpzyJ1Mhtkw24G2X/0
KJBHOc9SN2mntTFL8U76yhHrBQTGL1C5PsPuVCMFxqe4BxUYBn1uQi8g1TUWG2Ud
0HhM9lfK+d1LCyMuxe19B82erGoltTeiE279zjxswxK5ki+33OQ06lXnoeFPHzGJ
km88+1bopvDn+NMwF7oRh5TiPO535zqpbU9IqWPHE/2Lz9UtD0+VXEl6twB+bJDA
dGilzT4Dqf7okuIPKbXHo9wtNnyyyvKgwoWEQRvYFhHmEG+q/ok=
=R/1t
-----END PGP SIGNATURE-----

--Sig_/RLan_yhHKjNO8sw.RsoZ1YH--

