Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9312834ADB3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:37:40 +0100 (CET)
Received: from localhost ([::1]:60420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPqOr-0007MB-Vw
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMq-0005b1-Dp
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:28 -0400
Received: from mout.web.de ([212.227.17.12]:49723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMf-0004ej-Kr
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616780116;
 bh=gYwRYFW6o4co3B99P89eZBrde3j0fC+Y98Mt4RGPRqQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=lN9O67et6pFrFJE1KP3UYBsjC4Q/eKaLAJZt3NXr4dd/megfyHSZO/QaTyELuNzp/
 tw71NwdO4LrMzRUcLZKWSo3qPvmq6Ip1x6gQNoUn84ft68WLqHRXsE9GXibsgsNMp9
 mWz7/reTd/8cggCkw4HBpQrzi9saA05P7aaxQPcU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MBkLb-1lXItI3UBT-00ApOF; Fri, 26
 Mar 2021 18:35:15 +0100
Date: Fri, 26 Mar 2021 18:35:14 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/6] chardev: Fix yank with the chardev-change case
Message-ID: <9637888d7591d2971975188478bb707299a1dc04.1616779714.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616779714.git.lukasstraub2@web.de>
References: <cover.1616779714.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pwr=vHzyzWtFk7imU5smsU.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:/CVJQYUfNGZcQMy6YZqu3OOprI5FSVkFmV5xK6zcRoH+9XZmM9H
 UQRjR7PTTt4NCCpP1EzFMcL09WLELeGwtIRpd6N72/BpzZGIW1BlaLUI04NaNweKvG2PVgy
 Oh70Ib/aZKFg8gkB+xl9TMaSy1e4gTi5PAuuSR0AGIJno4qHdKKCdz/H3BUx410nWs9cOU4
 03aVXnurpzbON5yqyssng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2ItlImhborw=:+weMz5pFodhUuC97moj8un
 XKG3zaiwhZkxhAmDrqQUj8aIBxIBJNIgWy7MvYgVmkZB4W6kb2HJafQxz4aP1Vd4kgbQMB5cW
 Rhh/hnmcGHrsOV0MN3WKx0s+pWDDwrhgtnZeHyelsJxyA9euFG/UPqvShLieuIoSQ/jwhD/fH
 fzsBlQhJx+JcMUDbHyQaphvxkxw58AfZfYr+1M8NL10QQgdbf9MPehmcQ0aJYmDGqFFZq+P1A
 b8LinMEM01J8bEMr0Jbx1sD+yQvY1O4Jtm+KJVds4Y3+8whQnLOnCu8qZ+LtdxS7WE/U9J/h6
 tV5vHaztMnX4mhjfozkHaxg71+G8v2x535vRLPA3z0OkkuNOjFARKGx1IIAUCcuJ6wgthaZFD
 spP05ua084CvCK95l9ssCFcI+M1G7kS/QeGxwyBgUZkyyju5BgrCxU4kYgPvZQre50in3UqIY
 TQl7sic3e6LTVkYt0gHX/9tJvpEa4nTYzmw5PRoudndTgp7e3Z2nDsEQ6pW6BJt97jYQNatXq
 I0VYLRLvsMZBMz6krvlHuCHhiBX0vdMn9MCHUt+jpolobkeXhRfbsJbTGPxGir17ZUqCGBgNO
 Ux3CWlj4ZMltPcc35bTUiplsg3c43BFzvneWlFiPcxJSIZ1pbhvQJHaKItUkDx3Nk1sev6WJ6
 MC0dL7mXcbj23jiXZA0sRiTqUeFUbHojIQWMQvkHw5vU9VQ5GICKySPLVTBbtiiYoqLpACZrE
 adkAYg3IpiAbd38VUCvHo4E4sXvZRjMTb0vlwm2tVcBqJCx9hwgFAG9+17sUYk3CB8G7rngMR
 pTy8JqtayUclUOdxd3qd/++WVRgiC56LELsgjxuPyTDoQSEfK4cOdGRhrroLKkLUcmACSDvcK
 WbHnSB1PH0MWBVshySZucT+XhDuZXVrOfeBlOkQRvLhiDiu+Fl9l8KOmMQZ+tZ4jBsGvSH4kp
 ONbCMWZF35Ker7XskWNRhnKKfvsfZ3qZ7mO61IJ1vufhAXo/ffQwN9zPjjf39JY2+GOkbYL3W
 WlPFgURlpC4V99UPATB8owIWCz8oB6yy1nrjeufIpIdtykrdJButNwf4rGo5+TWQIF5PWFhiR
 yAw2JMQilO8syWRCdSfz93yRmirT3n8StpsH/5ghEyQIPekZPB4ysDWNUa9ZqqDPtnJKp+jCB
 CC++PrThUZI+urbrFIhIxFExuVTEkIcqejVl2zUIoDdnAkC0kXGY2mvfIYOWXzndq9yhQ=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Pwr=vHzyzWtFk7imU5smsU.
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
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


--Sig_/Pwr=vHzyzWtFk7imU5smsU.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeG1IACgkQNasLKJxd
slhpAA/9FDm24PBfLKGTu0jXKybjFl1BmOSGh7HkKu5SYMLxvKKfSqmVptvIMaEr
kah2q2HJHRipj8wap/30KisIwKSk4sNQ/+0Xp7GB7hmTnQ7aPptUs1vPbskqGPhB
d4BQ1UVlzIgIbI7EMESCMp/4IhBhGJRHCYdm34hMLYmReoW06Ci4f6G9OKukcZLk
G3CgU620qfKRNeP8gs//D/vH9EgBs0a7YMb8Hj2imhfipzPYyk9/hqpWfTlm7IXx
mPuN+DoghrD9Y+TEvS8QWsCmWV4p+VjKdRU2jqZTdn/WvG6/AWHx7YUeCXcxSuyJ
jjMnFOLM/kL5hRUQq8i+nWaCSWtDSeVtPoJ+YmF+On50jIHq6CRGIwbXzNIY7ueF
XM/GrOdXQzskmsraz+sK7+/1YhWHF0MWgcw07gR5IutsXQF3DLFgmivuyUeSNhBH
wbcrghz/iFVgEwNTSYuj+eWSCkVuRXTlhQuIl7o7jPNi8YUWhCNcQH8ScBFkDUyr
8gqbYcq5HRLhZ59/rXkf0h0fj/8+R9Hh7XkztKpsUNWyjIyL99pewgJTqj2x5zS/
/3klpPDz0MgHGtvn0uK0/1q6U4/ZsFsVWgPnVmh/bNHOsJpRVyBfG7fsxDWqujD8
dzedibSjJBA6QjrKJ6LONziAtJiEjannLTwjKoBHW/5IBQ3+04M=
=trTq
-----END PGP SIGNATURE-----

--Sig_/Pwr=vHzyzWtFk7imU5smsU.--

