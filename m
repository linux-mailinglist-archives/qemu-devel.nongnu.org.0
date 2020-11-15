Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE02B34A3
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 12:38:26 +0100 (CET)
Received: from localhost ([::1]:53306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keGMT-0006l3-Ne
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 06:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKR-00051x-2B; Sun, 15 Nov 2020 06:36:19 -0500
Received: from mout.web.de ([212.227.17.11]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKP-0008GO-2F; Sun, 15 Nov 2020 06:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605440171;
 bh=FbHZ1OXiBweTFVG2ZYn66/YFqMCzwwjYRQFr7/zvHnw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=gbWlrSeHOgqI3yv7bKb+vv77M8JGgYAmH1ZCXD2vFDMFpOpAXv6zI2qbZyZWuPhV/
 Zi7kS3MBlpGsDVfbTDx/vISIBHzJlRKmdI7QfFMuonvcnYoBMK6CSJgcrPg6aEDVmU
 Td2PIzVi8he3orQDVuOH6+ef+MLZaRWQT5FSwedY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MI63m-1ki7fw3KaU-003szT; Sun, 15
 Nov 2020 12:36:10 +0100
Date: Sun, 15 Nov 2020 12:36:09 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v11 3/7] chardev/char-socket.c: Add yank feature
Message-ID: <0c8b573bc608df476767a612f4303eb2dfc3b7bd.1605439674.git.lukasstraub2@web.de>
In-Reply-To: <cover.1605439674.git.lukasstraub2@web.de>
References: <cover.1605439674.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iRyfdbDEBPIyWdTGPeW.cJ_";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:XtcSClyQ7xHcMubuEVGRkheh4pGtJZdcCIpa1N03iLLZCPrRGZg
 6KhF2OwFCEAx2U/oigUZXWI5XO2KqD93Tfj5cRZ3DgxCQFctq/+MfBNcQI6g/9VrAD3g5AF
 4DeXiQ3eEcSW8aHWZMlOvGNxm5fbFbobWNy71Z75wQROqRwiz7dSlhRNOh4shNMpdYVysOQ
 yGU2zvD6am+BTYXc8Ijdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wN2oaNoW1ao=:F3T9i3WIVNXsspJbm+OKsz
 DVN1ScdMDc6zz1Isj4hDRgNnKkae9rzDisjQwDDwWi3IWB40PpSv1k+2ZLFqCZbFDaulI5PlY
 //VOnDwHmL0v/MB+PKL3JgCyPWOBMf9pv1u1/2vjeGuyUSd2I7itcj+FnooMCPx72I0/5MvpM
 nr+fQDxYUOlThjnp5kcajG35gvEd8H89qdNQV9hzhzzgOz7EarYnxq2mGV58Mr6emdazZ1X2m
 I4jD11DUUk0EMSwkwiR0E5GP7LnhYxbDGb57JQIJDO/ByCIcd1O4ffKs6j+ngt/BhguTDcgYP
 pLBjb1P1QSFthUWm/Uf0byE43IeSCMmKqjc6a6wW/5coFjuxBLbbS2Qa6l0HrDqRihX8q4IS2
 p+eKW25rozlBPWuo4nlFWvJvi7GNiKhvGerHx/NeItnzlMbiZbtYpXeS215kVriHv2oL5zE4R
 b3KjZwCgdtDK/bi0mqq5zqtoKeSXzZBjH5CNCu/yCF4gYIx5cBZUJaOS+0YmtRx/mQGIKpkEF
 oMWKa6t8aWopPvdQgEhKL6ifTTA/34URljHpyAxyVnnTHIS5g33uISQGscYK5M+SLfB+Xw/W+
 IhFM86rP26GP/ExVKs+IzMIsdHwlw0Sue7cZrNu3PDJD+wVcjVy8lopN3GIW6k7YLoLc92OAt
 ahZxaT+0lEsvLu9rfEFBaOvEB8ixa6wEIlVq+feFLC3Xlv09p/EAxqrB0GWO55Nr096arbXne
 8xpe5fn15JuRFxhtbyzI0Bxh4gd6xdlvJxBr3Ni0hc2mLajiStCs+2aZwpB0x5E7+MlulTSgD
 vsO7Aihi6GJSQeJC+OGNNHwDKNkE1l5ON384gUtAkwujOWH0qM/+rl+zbXe5LGzfrpCsIHGOQ
 VAAErJS1hG93VOmmzDBw==
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 06:19:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

--Sig_/iRyfdbDEBPIyWdTGPeW.cJ_
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


--Sig_/iRyfdbDEBPIyWdTGPeW.cJ_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+xEqkACgkQNasLKJxd
sljKMQ/+IiPquplTOCutYGToUw49USUYvJUbouQ6o20ltwUhkoMsL5XW/iHr+miT
j3p1pYUCv6Z3xmG0an5Fm5mGkqY091k/0SGFYp5fBMXhKBP8WUGYal6ggx8V3xAI
DLLZeGEr2oQ56SbCMsnmpewNb9LSO9Ps/BGePfnMKBVrj3q0ljglQDypKAc3WnyO
z4zv7X5YtACNEwwlGESYCf4GkPyyDZsNQQmj55IfGt83Xg6rdNavjoHaVw1dbbcT
kF2PEwKsAymif8oWBSqod7l6m5W8UV6BJfSErMCCwgiSvzpv5MyDJxmaJSgvefOU
3306n8s24gyN4/GLmN10jW01iDSPH1REu0IRIV1ty17n1PW+bqknEAuacDbTbSv7
lsJ48vAVoutzxXD86dCmp7GGooe0EuJEJIy/AMIjKyzLH+gazzJXqSCDCVIks3b7
MV0bpAYXcd/t8JKoGNGRhoG5tcPHm8L+eX2UG1Ch1c31Mso4NN7UR32qYiGxGiaU
CaEVhQbOWInmCOaYItiKR2p7q0/WIfh4ewLftT2406YGJ6tf3CkeBWUdO4R+xH/J
SGFBT+taefxEFTMqLPvxqtdBlcUp4E8gUajSrq23ZQva+cIsLFD+NVGDUQlPmvcf
D/kRkkHOZPENDBSNLwfzSsyQjNVpXyzNtPkRoJwwBDlDtd6yPpg=
=Vow4
-----END PGP SIGNATURE-----

--Sig_/iRyfdbDEBPIyWdTGPeW.cJ_--

