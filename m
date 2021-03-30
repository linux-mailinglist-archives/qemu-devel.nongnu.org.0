Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF67B34F0EC
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 20:21:37 +0200 (CEST)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRIzg-0007az-Np
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 14:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRIry-00044X-JN
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:13:38 -0400
Received: from mout.web.de ([212.227.15.3]:35357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRIrv-0001rz-5X
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617128013;
 bh=xPDIAsYxOfhAIS0WEPtnmy532i2hm0fwDkYFf2Zze6E=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=dLQVQEm5Sz9cMCKLt+9ASvueFd8KCUtGBAD3BEkdAWY8Qomkj1sRA9ienx+PSLfjx
 p0QsfAR9qIjEZMduX6k89k/zdHAxhMU4KNcNRwFdgLK3EXYm9pGB1CzrRpkhJn4eLQ
 zRNdonLDjzAb04ycjQAyQN0ms3fLS547pXezBQnA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.86]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M2MZY-1lk4jp0CEm-00s6CS; Tue, 30
 Mar 2021 20:13:33 +0200
Date: Tue, 30 Mar 2021 20:13:31 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v8 3/4] chardev: Fix yank with the chardev-change case
Message-ID: <9637888d7591d2971975188478bb707299a1dc04.1617127849.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617127849.git.lukasstraub2@web.de>
References: <cover.1617127849.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kFjdpcgfIO+i4nw+r.TwE4Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:O6BdTSpJ/3LgT/3FUtPW2L5cG0mljf19j9h0si/eJHzTsxq24Xe
 dKJATwCtfsX5VycSvwDELcXjTDG2lp1rH9IHJVeCk4lqezC95hu7XyX9g+or/p0E+Mrw1N9
 faPxGm9G5NXLM5tQ8j+cpWO/o2VjbKDPLCKPfG9wPaek5K1EAcfwDmQu8m1Z3w2NIQNg/qS
 5K4l2X9W5nHxpaAF+xs6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XV/mD+NlFX8=:TwV3C5L622lDx6B5lE1cod
 1oFShM3sTlhUzQBroWIkbwtoxbGMoIFZemp8JYfXPTgtqMB5h/Ij/27OAYxAnr+g6B5YgqQ9b
 pcHy+LciwosNnwiQ0upOT87O2hT+VTKNFsTnTrLCV4oLLmmEk/R4faYaM0Vp4BFJBk3PkhIYR
 /duyGLiRno7LgronPWOtxoCtWJbJSRNCy2d4V3itKqPIzrLI7qzSzoOp0NOwMKKrhITe1EQKy
 /gPmrk6nVlzF417KPt/VwB9nrlbbmZ0/W/IaWT/iC07MMWS67dwptBW9s4W69zZHzT942iWNG
 omAl4wqBhO3fsFyl0DebPvDhVLODUjpi6Ll5nhNtI+fCTNM8Pf+o+6hreM4msItzzRSMmmxdC
 8tIr5i6FKE52e1fT7gJ3KUnTIUC0STdFPFMz/hqy9tVyTVXqbdMsVpce3hC/jQLqJ+1TCGpAC
 60WSEy/g+NVGYSfyQ7Z/c2YU1Y73Td7DrInT1/4YT6MKmVXLGbpd8ckDNTgKVa/EyaHRa6TjH
 nUm50S98cxRuyZromNQIzn8R7H+Mie0ENTh5U848kH1sCOR+x5ghxfNOf9xIHtn6yqsn8sI/K
 UvOgyUInhnhTYHwYjksr317xAiXgRyYmxKiIb1gY1hslKPIjqcsIKT10EkqplB4LrgAmnmCIj
 ncHAqJPHFAuuw3x3PQuk5O+UQpta4UTSHMmFx0S3+vZR4dUjD9cStDa3YgCjIIFseAWaJsdO1
 fyLeia34cqMvNf9NxZ0nEllSGl1fTKT6zvAMevqamv68ZNEFvbrTGDmyQuCr5FvbPh7cuTkik
 Tr5RLWTEoefaagIKTs7dRj+nSzBZ401ZGVoSDfAT+lep2+JITgKgO4zkhGw/+qjZiFlXvwJzM
 PodJpSs0U00aAnE4t+4RlGrNFoQw+K2Ky07F+jeC1u89yNZmUr8WAJV8Mv6lBmgDN+Jpj1y2t
 nVj25DtwsXf24t+DfEGYsLA6kYIZLKf8hT5oBI6ZNjAwUUN56piL37UFBWwRapdWqBe85HwF2
 6xts3Wo2oDbQQ1jsmsSbEA8PdraKGdo/k6hiQWUxUN5/Qxk02851Cm+YRc41hD1LQtp0Y0unh
 Fg+GkrFHMzl9m+idKCpV77jtKnR92xqf7+Ycpt1phaCp27NM8tskyZbXvriSDD0ZkxVgjJscg
 FhaJ0SiX2g4VEwN6G2T86bXCrwqa0ayfHmqpyvPPfbhDyRscOpruYESO7jXGjgNqPnTzg=
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

--Sig_/kFjdpcgfIO+i4nw+r.TwE4Y
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


--Sig_/kFjdpcgfIO+i4nw+r.TwE4Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBjaksACgkQNasLKJxd
slhZWRAAojIX9sR/kmMeITcdxg9ks9m/ILvTw+t0tYet1fEGXGzHYcbOpmnDxH1g
TJaK9WtOBW4TWdMyL6TYKW4or2Zc+0WVP0DiX879pfxUtmGGNHN5R2ywedXBeduj
JPeD8A8WWuexPoahtpDV5mzVNr7PzwVVCzTJqq0p/OGAxgHzyAkqcUl7LuCQ7zUP
uyjSzeEtG1+TcdMV1vQkdox8130hzUEvXYITwMDy2UA04rkpdGLCx0/7h/vKGHmE
23JFLq1dZ+VIl5rBhHzlQT0UBXi6+Ind2xa6qUkgJHrOwUrwAXqkOnxW7bHw91fE
Xxjc9vzp/e2v4L2uYHp/WmgJD3UpQfKdgHl5xCmBFSkWiVoghARHuLZOfswv30qT
8kjhiGdNqJoyyoDdxxdPtKkZZ+EjqbLldBSsa73S8mCcbpDWBM7QBHcZE6TyH0JV
uTEDbyIrqGucq6x9azXrN6UXzlsd0ryNrQHdYpNMZaK5/soob9GaPyEzUJt9EUgk
tEMeN5daIqGUexIh3y+9thqhjhdygn5Cc2j/GI6lWUPikEozgzoHnjWRzb5kuMIs
Zq0fBCOomn5Ymh9DkFMhSZONup8gfqplzPeDs6x8ae31hPLCm/Buvxjg6vgy31wx
M8iUUVMXccRf3fxGnySbhk4KRQsJyoUADW2te1U/lMtfFegGK7c=
=AHUh
-----END PGP SIGNATURE-----

--Sig_/kFjdpcgfIO+i4nw+r.TwE4Y--

