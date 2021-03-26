Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F6934A2BA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 08:53:51 +0100 (CET)
Received: from localhost ([::1]:52874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhHy-0007ZP-NF
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 03:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhDI-0002hS-LS
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:49:00 -0400
Received: from mout.web.de ([212.227.15.14]:34079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhDG-0002a5-DA
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616744933;
 bh=tc4nSX2K/imwhglfrGy7FYN+BVhiobPCL8qKCjYXJjo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=cwgxOv9UDI5wKtbup5aFMkSa+Zumyb6ZVMgDZ2EUHZo2gRx2eHLhToFXoE8z/cc+n
 eNr31BzbRvVuA9MyRvQOdPOXYT66zKKuSg+JFtS2RFn6nItgIpzOMwi66qr6ED7jFL
 uJ0zWvTnAFE+FYxOpDKzy8OTH7WObmT8kpZi1hV0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M8zRF-1lUxzt3LC9-00CTI4; Fri, 26
 Mar 2021 08:48:52 +0100
Date: Fri, 26 Mar 2021 08:48:51 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 3/4] chardev: Fix yank with the chardev-change case
Message-ID: <0b9928d84f1a63b25b668cc1e117772b089c5381.1616744509.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616744509.git.lukasstraub2@web.de>
References: <cover.1616744509.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G0z_KU8Oiymw54vxHI47ZW6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:nwTzPfZA8Tf2kUIZIVUhcMqcn1SGW7xdwEeWsLg+ya8Q69AhsmD
 HjRrkSaQ9MYKoOs/wh5edfSwJdYCpXwZPXup50YrQIwlNXGKweaD2kwZHzXbRmJaU5QDpfQ
 CASCnpS463b9Z/obAiANB9KLEHe1Ms66HAwifapy/ZB3HD+c2jcNo3xs1r3fDIcOe4Yir6J
 Nz4612tVQdfBfQzAEoLkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:79dSHfIF1BI=:oCz75s6VFWfqBPJmM2tUtV
 vXMuXrotCtJLOFZQMJfIwomc0RcJW15Khp8iSLOdPMrIIBd1OupeGC1XUrCPgo1nuwNutNhu9
 41YxaNs+aHknEXbfO2tIqf83lvMe76u64llTctOXCTVn4qLOI1Om7sMV6c59gE5UVFGqhArSE
 g1f7QvOVt7Ni+ud95vHPXyNHpp1ex9nc65wW19Qr07M9+27CmPOMsms3VSvw79VLYDd3AJ9hv
 Xj49enB6WXz/aaBP9ZC3TVXt16d21DYBVuCT3x9b0pKH8i4tBvJxp3g1cQMX5y0edXpODRZ++
 LeGwGvWSanSH6SY9ercej1nSm/bI2paE5wCllyqB4fgrx7QcXTTBxuFopPzYsWc9+DoRk4sSt
 2hkAW2rBboTU0tQaeRARV65j/pKlw2HkJubEHBe5AI/cCIwlc2MIXZh/S6lnqB1LdqNY085NI
 oNQACFd5ZbgMlscJXgpCJXLKDce5oGk815TyO7E/eZTOneRH46kTPvP81vCTgrM5d5kDqVvO5
 arbwXUjB1TRBRcwLQ8BvZncwVnajAN2jmZwnRuMfCtupHmAtekM2mm7Vq2sobP9Fu8CsMKc2i
 rOriixjXfmN9bcEJSonWj0BadwjrNeKp5OOgSlrofhBP0vSst659dWVgGXrXGOqCF78WIKPKd
 O1KDYm1z1Q/vwVeHy8vdhZG1dyzsVia7QmiCjDn3oh2qtdLwskckTfPfgIXEJtYXURgc0YJtA
 +A0kBCoCX2lK6f8KzvsSarziYmUNWC48P8/ZV1TitSVLsoHUbUrcSgefFarNLZIh2EIbxzwju
 /BRkdNXUNwTdDNYpLY+oAU46F2gOMGXKcBw24SqWjIYDBLaVnpp6wf822CsD5kQIVebnW1mml
 ybyjfRHW/DzevFptxLpsTtBQqsgSmwc6B9rpaOPB+kpdMV9U/mSgwY7xktTQsrg+VpJVBSV6S
 CGuSPsiwI16tpz/gOe0spWt4K/kzgTjVd/MDWlriwX+pqTs8SdF8n8AiNcFifvmxo9ZOa/1W2
 pUj9AoEiOAYyhtjEHz9W/sSdxvcy/qpdiBo0LjK7v3LF9vwv4e+dhHORtM1QlWmWPfv4alqwU
 0bckDOkqmjNGpcSQwN4H2dbcZbMsvc2xcOoANlzabfWq9bI7BRHacER+ydG8pTCgl5j2+Vg1f
 R7Cr0fyp6tVZH1TCe7JuJqPl8qiYDuwm3ng8ngLZ7XzmsI/Z3xnu2YwJb2RWrDI521enU=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/G0z_KU8Oiymw54vxHI47ZW6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

When changing from chardev-socket (which supports yank) to
chardev-socket again, it fails, because the new chardev attempts
to register a new yank instance. This in turn fails, as there
still is the yank instance from the current chardev. Also,
the old chardev shouldn't unregister the yank instance when it
is freed.

To fix this, now the new chardev only registers a yank instance if
the current chardev doesn't support yank and thus hasn't registered
one already. Also, when the old chardev is freed, it now only
unregisters the yank instance if the new chardev doesn't need it.

If the initialization of the new chardev fails, it still has
chr->handover_yank_instance set and won't unregister the yank
instance when it is freed.

s->registered_yank is always true here, as chardev-change only works
on user-visible chardevs and those are guraranteed to register a
yank instance as they are initialized via
chardev_new()
 qemu_char_open()
  cc->open() (qmp_chardev_open_socket()).

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 chardev/char-socket.c  | 20 +++++++++++++++++---
 chardev/char.c         | 35 ++++++++++++++++++++++++++++-------
 include/chardev/char.h |  3 +++
 3 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 1d455ecca4..daa89fe5d1 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1126,7 +1126,13 @@ static void char_socket_finalize(Object *obj)
     }
     g_free(s->tls_authz);
     if (s->registered_yank) {
-        yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
+        /*
+         * In the chardev-change special-case, we shouldn't unregister the=
 yank
+         * instance, as it still may be needed.
+         */
+        if (!chr->handover_yank_instance) {
+            yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
+        }
     }

     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
@@ -1424,8 +1430,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }

-    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)) {
-        return;
+    /*
+     * In the chardev-change special-case, we shouldn't register a new yank
+     * instance, as there already may be one.
+     */
+    if (!chr->handover_yank_instance) {
+        if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), err=
p)) {
+            return;
+        }
     }
     s->registered_yank =3D true;

@@ -1567,6 +1579,8 @@ static void char_socket_class_init(ObjectClass *oc, v=
oid *data)
 {
     ChardevClass *cc =3D CHARDEV_CLASS(oc);

+    cc->supports_yank =3D true;
+
     cc->parse =3D qemu_chr_parse_socket;
     cc->open =3D qmp_chardev_open_socket;
     cc->chr_wait_connected =3D tcp_chr_wait_connected;
diff --git a/chardev/char.c b/chardev/char.c
index 75993f903f..398f09df19 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -39,6 +39,7 @@
 #include "qemu/option.h"
 #include "qemu/id.h"
 #include "qemu/coroutine.h"
+#include "qemu/yank.h"

 #include "chardev-internal.h"

@@ -266,6 +267,7 @@ static void char_init(Object *obj)
 {
     Chardev *chr =3D CHARDEV(obj);

+    chr->handover_yank_instance =3D false;
     chr->logfd =3D -1;
     qemu_mutex_init(&chr->chr_write_lock);

@@ -959,6 +961,7 @@ void qemu_chr_set_feature(Chardev *chr,
 static Chardev *chardev_new(const char *id, const char *typename,
                             ChardevBackend *backend,
                             GMainContext *gcontext,
+                            bool handover_yank_instance,
                             Error **errp)
 {
     Object *obj;
@@ -971,6 +974,7 @@ static Chardev *chardev_new(const char *id, const char =
*typename,

     obj =3D object_new(typename);
     chr =3D CHARDEV(obj);
+    chr->handover_yank_instance =3D handover_yank_instance;
     chr->label =3D g_strdup(id);
     chr->gcontext =3D gcontext;

@@ -1004,7 +1008,7 @@ Chardev *qemu_chardev_new(const char *id, const char =
*typename,
         id =3D genid;
     }

-    chr =3D chardev_new(id, typename, backend, gcontext, errp);
+    chr =3D chardev_new(id, typename, backend, gcontext, false, errp);
     if (!chr) {
         return NULL;
     }
@@ -1032,7 +1036,7 @@ ChardevReturn *qmp_chardev_add(const char *id, Charde=
vBackend *backend,
     }

     chr =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                      backend, NULL, errp);
+                      backend, NULL, false, errp);
     if (!chr) {
         return NULL;
     }
@@ -1057,9 +1061,10 @@ ChardevReturn *qmp_chardev_change(const char *id, Ch=
ardevBackend *backend,
                                   Error **errp)
 {
     CharBackend *be;
-    const ChardevClass *cc;
+    const ChardevClass *cc, *cc_new;
     Chardev *chr, *chr_new;
     bool closed_sent =3D false;
+    bool handover_yank_instance;
     ChardevReturn *ret;

     chr =3D qemu_chr_find(id);
@@ -1091,13 +1096,20 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
hardevBackend *backend,
         return NULL;
     }

-    cc =3D char_get_class(ChardevBackendKind_str(backend->type), errp);
-    if (!cc) {
+    cc =3D CHARDEV_GET_CLASS(chr);
+    cc_new =3D char_get_class(ChardevBackendKind_str(backend->type), errp);
+    if (!cc_new) {
         return NULL;
     }

-    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                          backend, chr->gcontext, errp);
+    /*
+     * The new chardev should not register a yank instance if the current
+     * chardev has registered one already.
+     */
+    handover_yank_instance =3D cc->supports_yank && cc_new->supports_yank;
+
+    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc_new)=
),
+                          backend, chr->gcontext, handover_yank_instance, =
errp);
     if (!chr_new) {
         return NULL;
     }
@@ -1121,6 +1133,15 @@ ChardevReturn *qmp_chardev_change(const char *id, Ch=
ardevBackend *backend,
         return NULL;
     }

+    /* change successfull, clean up */
+    chr_new->handover_yank_instance =3D false;
+
+    /*
+     * When the old chardev is freed, it should not unregister the yank
+     * instance if the new chardev needs it.
+     */
+    chr->handover_yank_instance =3D handover_yank_instance;
+
     object_unparent(OBJECT(chr));
     object_property_add_child(get_chardevs_root(), chr_new->label,
                               OBJECT(chr_new));
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 4181a2784a..7c0444f90d 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -65,6 +65,8 @@ struct Chardev {
     char *filename;
     int logfd;
     int be_open;
+    /* used to coordinate the chardev-change special-case: */
+    bool handover_yank_instance;
     GSource *gsource;
     GMainContext *gcontext;
     DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
@@ -251,6 +253,7 @@ struct ChardevClass {
     ObjectClass parent_class;

     bool internal; /* TODO: eventually use TYPE_USER_CREATABLE */
+    bool supports_yank;
     void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);

     void (*open)(Chardev *chr, ChardevBackend *backend,
--
2.30.2


--Sig_/G0z_KU8Oiymw54vxHI47ZW6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBdkeMACgkQNasLKJxd
sljQXg/+P9f28XMaIhh+jNUeTGCDPP37Rh6srV3pH7JqcRPPdW6IkBzlxCXVo+g2
bhpPV7WJnEo2lhk/F3Rq43fjfo/w0S43YPDfruuSn8I53QGN0J28MUjNAyxZ8MN9
TuFwo8b4qYo6vk8GFvABEA6wzL8xf04HqWUiU98NFl3SgffHGuIXn44awf1aVDdl
n4+P/hZYEHyHTjRzT8X5xqoHVdKQtq8kufBOWAVPFMrXqv7vjmp8BraznImrSYXm
4PT7eWPtmeqQF7t/k/VmFYegrKy/p7HnjUaoIP6OyqUeLocJ2qH64V2RiYu+UXUa
qPiXUuncXx34f3dX/4ucxcvMvcjH7k5PHr/FwqahGQkAQfq6rXtpyCK1HhIh8iLQ
nFbQZ7tf0zd48qxuMB2K4gJlJHnwxo9QGaC+kjKOTZXAP7Bo7uokGNFflv7y9hK4
tHGkIXIKNjj6MRETym1KivNW9NfIJ28u0I/8Mek3IenkQ2Y81XA2PQcx+4sNSQ+P
VfuSlhsfx2uv+XKZE9hw3JDU1RFedX9iDEnFEh1e8irxfxXD8pJtDrJpw00DwKLl
LFvZbmULQzyiuT5ewKJtzuChry1+BUuOTMJ6kdlEtrWwr53mNfmje1gzI8bZKQV5
n+eqpvfY6SR1VbFjY7O8KXfTVWff8PE9sS5PupFW5w/0ENRzGrE=
=Rnuc
-----END PGP SIGNATURE-----

--Sig_/G0z_KU8Oiymw54vxHI47ZW6--

