Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8CA34D7A7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 20:58:54 +0200 (CEST)
Received: from localhost ([::1]:55456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQx6D-0005W9-Mk
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 14:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQx3X-00046X-JV
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:56:11 -0400
Received: from mout.web.de ([212.227.15.3]:45717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQx3M-0001Xb-Bl
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617044153;
 bh=3RvPmWNdEWl1HNZ/qZ8MozvI3ECqIyCh35GWfDndBx4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=f1xgnHYG+vGzFVs4Xp8QM424qOaEJ5a+hvb4sztWl8207glCuX5VOc6dKyZysE6i6
 HwMFrJKBt9Xg4FIIZ91pkcwJFzhLtzABm/iKXzTsqrD7NnSIVz1WwoE0qFR4tvfy96
 T/Mjulz58tmquj6C0Nu+UGPo14nZmVfH6X+wpTR8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MY6lc-1l50LB0fFg-00UnUU; Mon, 29
 Mar 2021 20:55:53 +0200
Date: Mon, 29 Mar 2021 20:55:52 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v7 3/4] chardev: Fix yank with the chardev-change case
Message-ID: <9637888d7591d2971975188478bb707299a1dc04.1617043998.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617043998.git.lukasstraub2@web.de>
References: <cover.1617043998.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3mP2zPQEY74PebKkqoXkdtA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:itv9Y6VLIbq6Y/4ZJwqZT1yfywLYdiqFyZ/X/6w0p6qbtOaQP+L
 77njtAN0xSNMKwf+M9c4cTl1stL3b2c9HfgffVzVGvm2viQVYZdSLJBUiQwCXGGRFD1/V9k
 tL66WiUZD44NILH4RfQ56BYG4Qjt33nW3j0Dbvoy47nngzSpeDs1HAqkf4clVIWQlF/O6Dy
 k+xiU60hNhRERDrF/UB1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:heMqhtXJiq4=:3R7Dc9+vn624hOt7+leG04
 uBOsptbncgAp+TtEtKSHvAOnegdjC7/CaBOVka9SKui7Olbw3RMnw3pBoTKl8Mf6xpAZow2yG
 P03aviirqabzzbdnX0lZbvv58QuR+dBjaLLEEdyIsJeOQ5k98Ng4mhZ5O/ZrHxg197bXuQ/bq
 5br6AGoaufM2dGXZSOjEzHzKPD23yoeckMdG+0CLuNsnuGtruY3WYZlebHplrKD6GPenh+kIz
 jyoC2N6Hc3zzoQ9W7b3SySSXSLeJWicKBocoMoRkMD8bddkFP4o2bodUzW1I2Vp3LUM4ttoHb
 Z17FvuhYpME203y52Dgu1RPxsc8TzjWufPt8G7gMBamS/fY43fIPBEiGNmXsvUK1gY2LbiPO1
 U3KlfdQvtFRkprGDOWsa/sS/z4MAsEb1CZ/bzPuxbJD5cVgHotW4mdgg2WLkuRPw2rPMmKMvy
 fTO3BvcBGClfGwC+unGroeYKGOWE+Y1E445KGpjae5DlRpxAqbY/eTcZQtuXmV19rVlTbrcY6
 Qh5xDqwt+/xW0afohTbBlhg/q28bFspOFFGgsDETeljsfBahAm+NtGoLAmkhoPheudyobNI5B
 cpCvCXlHkHGa+5RjF8Se0MnOXwsGRycp/gcEROs0tiEVZnLnnQkM/VdWxd0xtrHIR+Uegg01G
 PS64ZadqPlOa5sN3zILuyZHhi7xbNagVya+AoZtSvmJEKZumMAscbCNWP5yLr3GZ73D0Y1x3W
 PRPKqOjkL5a7k9+rz9AZP5/vIm3fhZ1Nq3p2inCqoJFYWgLWyhc+cPo4Twy/0D3VdV+pCCtDj
 99MeKTEE00u4O8GVuXR0HIwPm6f/d8PFEZAE3UFHr2n/RVN+WQZagMuNL+oTeRfRpXZmBvgin
 3+BtAk8BpjC/Rs/v7QupvNlC3iBiG9hb/AmP1A1Z0d7HPllYCCC6K88xbh0h1Cxq6ft9xuymT
 85xrqXUngUTwuSXF0fDnsHJvZDeja2FiE+Lol4rV8ECKXe1/YGQVLrZEf1M4c0kgWEManw5LQ
 BP3xANKJxP9xuxe50NySfQJMDHJL+stie+yfih5uX569qiXJdT06v6ByT5ibH5K76UYWfTfh7
 nTFHB0diQoGjeKwETVFXv9+OPRdhoadbM8LtpN82xmF+J/qCU97YLCsj0qkWx6p5XKkACKiYQ
 ARaYE20K6r6E32488OiCPVVYLEHLp8/6O+GMJS/+Bj1Zt2b2Z0oqiZ9aR/pnSW9mP7MLQ=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
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

--Sig_/3mP2zPQEY74PebKkqoXkdtA
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


--Sig_/3mP2zPQEY74PebKkqoXkdtA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBiIrgACgkQNasLKJxd
slgcQA//Rt6DeYJ/kU3merfvsLiVdKdSDh2dHfBF32z8g2hrfYmFREydbKBC44QA
fAeXVNcxHJF/CQ5GbwHCBQsTmc+/x12iHLsRQu+NEhMdvHECexR26nCyZXnBvOM2
AmTR4I7w+7DFRuKfp+BO0lCj2oOG1AVwKk+4UDV1k+GKL/lQOEgDxokpV6kW4wm0
DB0avFW8hkglWc5GrsfT1jBz5tdhd2FU5vlXtDsM/iAqo9BeHAeICRrRdx+W8l3T
nmI0cShQmczKotSNM0Dew0YROL5NFdu7bUbRaI5Mt6V2/USj1pm19YAlaCUblxYs
G11W0BDOoj9bTyzvC9zEUMi4rgKB4a6eRykBtnyTOcr7jO33lgbZIMDiPdwvL/ib
t7vD6IieQbCehelDYS02aBJA2HCHegdI/tTFsz/CTKZc8HdQOPGptPgOdlJmD3wa
FD+2O4SOtB8NDRGQFscXWMQT4TsePw0lYdReAqR7VPnQDbCXLaKCO37Al0TGG6tv
bvUmf4EXOYivkzAcePnESh0LVyv9T9ZQJoKlLVlwWxoQ50hi8w2tfCYthbhSeta4
V/F9x4P/dMncPYLC8skCOnXsg+95GwLxekgo62aa/hARAEFQ+1wcPt1yF66p+/Wt
q0eWOCzXn0eegUsK2g6H1anAB2r9BSGU5uZGogFN0Cn++59cjRA=
=rA5h
-----END PGP SIGNATURE-----

--Sig_/3mP2zPQEY74PebKkqoXkdtA--

