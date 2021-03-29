Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227D334D552
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:44:53 +0200 (CEST)
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQv0W-0006Gu-7W
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuuj-0001q0-EA
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:38:53 -0400
Received: from mout.web.de ([212.227.17.12]:58829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuuc-0007ia-FM
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617035924;
 bh=IGmvSdssENvIWp+Q/i9XD5kpAvKkHYiCDDWrv1H9WdM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=M5QfG7J9oRuRxszihJVTHx+TiHfjwOxcGqqdIHU/gJ6FGJjQT46rkgVKFrrqTZT13
 arMpQEPLHBNuhW8e3AX6B4r/6P5pkEbQe5rbHW/sN+UMKY2R9xDd7NZEeZU6+gpmwf
 rOVWKZNSdAy3aDzkvg40hD9D1tiQkfUtC1x4VtLc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVJRl-1l1Ryt1RSx-00SCp3; Mon, 29
 Mar 2021 18:38:44 +0200
Date: Mon, 29 Mar 2021 18:38:42 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 3/4] chardev: Fix yank with the chardev-change case
Message-ID: <9637888d7591d2971975188478bb707299a1dc04.1617035720.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617035720.git.lukasstraub2@web.de>
References: <cover.1617035720.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+hxmtNFk3dP881AEMbcgLjY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:vTPHHZP9b+xfiHhP8UMgOPLQ2pY1oAKdkL+vDJlZTEMkZTCQ8Yc
 QY7oH8Z7Ev88B81OV/mIug76kYLgJUnbOAs82tQ6BjpZX6I+pjXGBmj5gOfPLBG+kXTnff7
 m1TRjozve6nUv2+Z0OjAceZX1yyLZw4Flr54jct83AFamlGuOMcZPrY0QBSW8cNcGt8lTRy
 L/ZWpPPhrek5QmtuHOptw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eWNPzM0eTXI=:uqSWhnKr9C01xrfiCNsGib
 Ndu4Kcsg8U5ApTxUXsD1ipb/yqe5Zbblr/W8uy60GyWxBqjaB0ExV2T/yk3Z6LWD2RLFu5lV5
 lOJ/W0iA0r2O5sIICSIH0XRvXivsASozaJz0ZeoSBzuopjCsSreE6EQQAn0Zp4qBmX7We0E3J
 FGFS1X4JK6R1OOu86r90cRa4l+e4VB8RnBzKmI/wOiXIp/32gyA6BKCAvqUDl1XdS/oAeMGGb
 kkjNib1f8zAb6q6XnqP0zx5WD7yevKKlZYXtfHjpY3oGuMIqCgNtbAZTP3SOPGqN+zlzcfWNT
 DX0aaxjf/KDMm5L9h0IB0DuSKR3HprrpTHdD60OTMLK+y4Rlm03ousWzI3rB/pmrzxhhdCnLs
 zzNVNx/MQpLrN4tJVbxJjUHCiE07P36HIyIwDN8dU21teOOP6bajf5EnQ/GimJq+K13K95rjS
 E1kN7Bfa0RqMC99EVqHgFEnRqk157aR73nssDXn5vvLjs8IrB5TbKWpcE8+aW0r2Gau5Rile8
 5662pWbT8mp/Pzot4J2YJr1Y03Q4tic65+xytiiaK4zse5LTbQbEJ8a4vWeVqQZOJemccwKl+
 gs5XGhY38Ie3QRd6dLh3M/AoUG7XEhhCjhmnOZTPFrSdZ6em79Sqj0PDpoRvKteGsoFm6D2Jo
 HmG1PaQg7I/cWi9aeN5UxFaOUMrhERlaRvujn6Nw0mhnSxQsCgTV4w7KD9XJUEcMWdbGhEDw2
 h8Yxbed9z+w5SFpEGxYRellaqDu8FOY5ls1hHgWibdHruVoT4k11023g5sxMo9ckkpHxrWLW+
 gGhQEQqT4qx8AY5JZvKS9ktwpiKs+jyxnx5D2p+Ujt2Wcl7Tgvqcuo0EKLx3CSZzgNcOKDyb6
 d33lfvuEPTqB9foRnoDOsEcZYs3YDhEVoUatn0EvkxqpyWBXQR+N3ECQzIeJ3Z0aR7FMgHju/
 9SGIT+5w/mw37m3EPd+z8uNoVQYG8NZTGMQR5gtPP9eoV+gM18FLF2yLv/Oe3NdE7qHZIzv62
 qZvgJ9F/ySTsPmvb9NVEoKbtGOQFbKIfskx+KZRsSCkYz1NlP8STFi9qf4rVaVkwhG93sRnK7
 ew1FBnf4FNm7z9HrD0b694xJSWmD9LAu15ely98KucUSO6CtBBSLIyHotviOYHLZi4dGQJ+ys
 IzS7gTFkXKv0TkGOMIJphXZr6Roflce+HAG7U+ktwfBueT9IkB869rAP6cJeUR6uyGiM8=
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
Cc: Marc-Andre Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/+hxmtNFk3dP881AEMbcgLjY
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


--Sig_/+hxmtNFk3dP881AEMbcgLjY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBiApIACgkQNasLKJxd
slicAw/+J7/GaEtHicXcfU0usu0XvuGWHpXLpfcAZkfy/lFYUvzbEXOpqnqBvkjj
Lw3gqLsM5as+VT8rM2yNjBWmF1UgJaWSZZQ8a7okj3SrsoJjOjZFY63hOmPaR42+
CrzTr+uBqIEJ6Q1eciCd8zIcAuB8/39W4c1xKpLmlBbqz425VdujRouxfeP1Lv89
pfoKGowPSUdj7P+fJp0Fz55u1Qg/Muc0C1qxF6hTQtAwnkBRihM9WduG5CKCgzUx
kvEQ+iOOsJJF6jHsJ8mn9LJsWOYqMd9kD0vHwaIfzipyaI6JXbPLqI0B2br3jWAt
GikWav0oQvbuwmtd0ytHOMCl05P0pNNnrfmRqRVmIsD6Gk319vMXNr1S3lpMGVLk
Tr7sRyUedSc9JqkONW9tSdo/jtGFAuxcjjPYozT6QduW4+qTEX3O/N35KALcfLsf
3NVPgVKnA0b3tn7Pve0GjeCzExJpVzHkvDPf/CUr8Cd1oV+KAigTeEqVIs6uOcsJ
93tk1wy6bZDFqdsHlBFJGsv3FP4VLs4Y4Qi7048vSuZ2yItoONyjPvxNlQUUTIbm
zMj8Wwe3e76UPcWGvj7PSFxEjQ3z9d52vZewF9IvcmmRDfh/KYTs86eIu/mfwYbg
l2fOHyAwv9ZXwDzIYUOhNuL87h4+eycIsp7YKF75wr5ffKHhww0=
=KAUB
-----END PGP SIGNATURE-----

--Sig_/+hxmtNFk3dP881AEMbcgLjY--

