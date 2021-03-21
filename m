Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E573435C7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 00:34:24 +0100 (CET)
Received: from localhost ([::1]:47794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO7aR-0001kp-Aj
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 19:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7YH-0008JY-1I
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:32:09 -0400
Received: from mout.web.de ([212.227.17.11]:54165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7YE-0000Lc-E3
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616369522;
 bh=wqQ4An/TMM6FIxQ0nDBdd6hH4ru3wVj1eu+s7vxDmBQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=odZvEgvLEUT6i7run8acvREwUhUzLS3njqc8gnGLzR//bGvjgep/OvJDt4SoYjvfO
 Kl0l73LL+nZhp5UIURRSDgzoQ7gvE2CYodlwyXyiRFNd3PDjIatAYd5npI5n5xWIRT
 bI40d3+VsDsrWtTAKn3jDg9IhfIH6Ft1Mr779Rxk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.131]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MfHfy-1l3gz20B4s-00Onto; Mon, 22
 Mar 2021 00:32:02 +0100
Date: Mon, 22 Mar 2021 00:32:00 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 5/5] chardev: Fix yank with the chardev-change case
Message-ID: <dcf21a36f4b85e959a0e71776ee34bbc09d26684.1616368879.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616368879.git.lukasstraub2@web.de>
References: <cover.1616368879.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z=ntiXKo1oaCXqVW37womtB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:+IRZnfbiFq3UcLckaA+3TzYJPUKBusUva1ERotabTiz1xiBiFdK
 BIACuDqLgT5dCQxWne0z52JwqLOt0dMnwH716q68dopj6O3yA1rFR8GtLl2/W4vcDjim1Cp
 UckzjlOnKecdHdH9YvRXMo0/tXp2mHeqA8bt6fqu6pOa7JsMjPF/0ODD4fSrUrfmQ9Ybx9u
 HUiyJdCmhpltCqEaTBs0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5+YUTg2wbP4=:wEQVyDQggLzrSmy/L+o2Jw
 Sv5017iV8dQ0qSxDVrhNIfM8P30dUMt74ikqIfkB8w/tLZbevBuPWcXtjtiM/4qHrDJoqILfa
 GsLtgqVGkjXSbgH9DZhYxNK1VTzijMOPSnufBrKFCHqCjLyuqqCZAXMu+2hceEUg/+JFX9CmO
 6pu0FVSBy1yENFL23vZUnEKwC7W42S251hbpJIH9nwRHywhXa7aLk5HIjJ32TPwJ6NgyDKRIb
 drs6OFd3mhEQDoW01du6sSHZ3oW8D6y/E7knJUBNm/zOyrF3ILs+Kx+rGHhsZ4SmXXmnXUrV+
 Y+TGlTZSPuTLIUspnXbgFSCHBWLuccFdQdcFB2K4j59bC22Ovd471VRSmhSVJMGO087ja0x19
 R6Px3WSGyoF2NerIWkPi7SV92Dv14Vwsbj+x61UnBKhYwz9a0GaCaFfZG1aehEJaF6DCbuGWo
 9CSw1BgXn3MmhJhkZFkpQ2sPlCfYt9nTAWjLj/Uos0S/nLvDbviBkYiGzKjxb77nbnPf2pcVR
 eeyyUDVSTCDgzZ/SakE6DD/GrKJrCYA19b9qCFMv4qHyq9Pv0xMz1KAFl5MQVGLi0USDeVUko
 rWrVejJ5G72hnczIuLsfXaROnDAWsfK40jGY8cI0/mdm8J4aElvlZJdtgkdBePEOeG0Jo4VFj
 Vndeg5xB+D1kVbr6nPsSK3QqA0wjl249mbPuqlkkHvTTWUHho6zflp9nTqfE3aSyBri+fvIfd
 fiAGefLhq+5RUg8TbDp2qw8FsymY0BMAjP30nU3pPi5FGpM9wEm8Pu9jXRrO51EV/iuz24lfu
 cSXVThHqfKsmp4nBCNPB0YO0zY1t3L4HiHD3Q2ieySw6k3af4HKr0nSjTAYSTubI92KB2whtH
 zwyUBtPFVQqXW7ntvqz/z4csR58a4ePTH8OuEkSIfwx4jTp+Qirsf41TiSw3TzuOjC1iEvGVy
 k9vnSv1rHakU63xLEYfe1ql2CrY7H1Imvjx64zT8a0NwjoyZ8LfIhHQ4cblTkYtSWUE4UScPy
 3G3occ4APinXFbxeCRLpig+iA1CVQPVuRWdiEvNt5h7HGNnXm35wYeintz5TmqFVu4zUUbbrs
 qTdUxPhvuqmb3xs39w/P70VLjBFvKL8Sv2UOgPsk65aV7n7wA0UB3oAiCx+oDIinchP8qbJ8X
 l7qj9eO7x5xWDPcFCX8ett6DyYQCl2EjkGqLbbQuHC0pm7e9q4Aiq3JOgfFg5Vn8vzsK6nIYK
 rgGdFVPmXH2NOnanHZhrqfVmkXtVK1TiOkNohnA==
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Z=ntiXKo1oaCXqVW37womtB
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

s->registered_yank is always true here, as chardev-change only works
on user-visible chardevs and those are guraranteed to register a
yank instance as they are initialized via
chardev_new()
 qemu_char_open()
  cc->open() (qmp_chardev_open_socket()).

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 chardev/char-socket.c  | 20 +++++++++++++++++---
 chardev/char.c         | 32 +++++++++++++++++++++++++-------
 include/chardev/char.h |  4 ++++
 3 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index c8bced76b7..8186b6a205 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1119,7 +1119,13 @@ static void char_socket_finalize(Object *obj)
     }
     g_free(s->tls_authz);
     if (s->registered_yank) {
-        yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
+        /*
+         * In the chardev-change special-case, we shouldn't unregister the=
 yank
+         * instance, as it still may be needed.
+         */
+        if (chr->yank_unregister_instance) {
+            yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
+        }
     }

     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
@@ -1421,8 +1427,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }

-    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)) {
-        return;
+    /*
+     * In the chardev-change special-case, we shouldn't register a new yank
+     * instance, as there already may be one.
+     */
+    if (chr->yank_register_instance) {
+        if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), err=
p)) {
+            return;
+        }
     }
     s->registered_yank =3D true;

@@ -1564,6 +1576,8 @@ static void char_socket_class_init(ObjectClass *oc, v=
oid *data)
 {
     ChardevClass *cc =3D CHARDEV_CLASS(oc);

+    cc->supports_yank =3D true;
+
     cc->parse =3D qemu_chr_parse_socket;
     cc->open =3D qmp_chardev_open_socket;
     cc->chr_wait_connected =3D tcp_chr_wait_connected;
diff --git a/chardev/char.c b/chardev/char.c
index ad416c0714..245f8be201 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -39,6 +39,7 @@
 #include "qemu/option.h"
 #include "qemu/id.h"
 #include "qemu/coroutine.h"
+#include "qemu/yank.h"

 #include "chardev-internal.h"

@@ -266,6 +267,8 @@ static void char_init(Object *obj)
 {
     Chardev *chr =3D CHARDEV(obj);

+    chr->yank_register_instance =3D true;
+    chr->yank_unregister_instance =3D true;
     chr->logfd =3D -1;
     qemu_mutex_init(&chr->chr_write_lock);

@@ -956,6 +959,7 @@ void qemu_chr_set_feature(Chardev *chr,
 static Chardev *chardev_new(const char *id, const char *typename,
                             ChardevBackend *backend,
                             GMainContext *gcontext,
+                            bool yank_register_instance,
                             Error **errp)
 {
     Object *obj;
@@ -968,6 +972,7 @@ static Chardev *chardev_new(const char *id, const char =
*typename,

     obj =3D object_new(typename);
     chr =3D CHARDEV(obj);
+    chr->yank_register_instance =3D yank_register_instance;
     chr->label =3D g_strdup(id);
     chr->gcontext =3D gcontext;

@@ -1001,7 +1006,7 @@ Chardev *qemu_chardev_new(const char *id, const char =
*typename,
         id =3D genid;
     }

-    chr =3D chardev_new(id, typename, backend, gcontext, errp);
+    chr =3D chardev_new(id, typename, backend, gcontext, true, errp);
     if (!chr) {
         return NULL;
     }
@@ -1029,7 +1034,7 @@ ChardevReturn *qmp_chardev_add(const char *id, Charde=
vBackend *backend,
     }

     chr =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                      backend, NULL, errp);
+                      backend, NULL, true, errp);
     if (!chr) {
         return NULL;
     }
@@ -1054,7 +1059,7 @@ ChardevReturn *qmp_chardev_change(const char *id, Cha=
rdevBackend *backend,
                                   Error **errp)
 {
     CharBackend *be;
-    const ChardevClass *cc;
+    const ChardevClass *cc, *cc_new;
     Chardev *chr, *chr_new;
     bool closed_sent =3D false;
     ChardevReturn *ret;
@@ -1088,13 +1093,20 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
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
+     * Only register a yank instance if the current chardev hasn't registe=
red
+     * one already.
+     */
+    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc_new)=
),
+                          backend, chr->gcontext,
+                          /* yank_register_instance =3D */ !cc->supports_y=
ank,
+                          errp);
     if (!chr_new) {
         return NULL;
     }
@@ -1118,6 +1130,12 @@ ChardevReturn *qmp_chardev_change(const char *id, Ch=
ardevBackend *backend,
         return NULL;
     }

+    /*
+     * When the old chardev is freed, it should only unregister the yank
+     * instance if the new chardev doesn't need it.
+     */
+    chr->yank_unregister_instance =3D !cc_new->supports_yank;
+
     object_unparent(OBJECT(chr));
     object_property_add_child(get_chardevs_root(), chr_new->label,
                               OBJECT(chr_new));
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 4181a2784a..ff38bb3af0 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -65,6 +65,9 @@ struct Chardev {
     char *filename;
     int logfd;
     int be_open;
+    /* used to coordinate the chardev-change special-case: */
+    bool yank_register_instance;
+    bool yank_unregister_instance;
     GSource *gsource;
     GMainContext *gcontext;
     DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
@@ -251,6 +254,7 @@ struct ChardevClass {
     ObjectClass parent_class;

     bool internal; /* TODO: eventually use TYPE_USER_CREATABLE */
+    bool supports_yank;
     void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);

     void (*open)(Chardev *chr, ChardevBackend *backend,
--
2.30.2

--Sig_/Z=ntiXKo1oaCXqVW37womtB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBX13AACgkQNasLKJxd
sljd8hAAkZkNjeu9BKi+uViMkn+RwMwnjYPsuM+Wxc4g29t2dirpvI3d+JsikwgQ
bGCEC2y5nAht/iVlSyhx1DNc63wwWaiPz/yIGAVJjXjB20sVZnxGQfMzvfb1M0gc
3StnoLzzwIB94ylDTdLS6tIpG5ZZLuKV+xD827LNBOPLBux7M0uNiPrxeoJBYKHV
owvB72chFX0Ra0DfO5g6/VXvOCfCd8DNyS9oKw66qTPLbYffwvlr0QVeklcc6Xlq
N4QKWKSNqIKF8AsAudtM7pCYiJ2Vqn1RBzgGep7ZVT5vYrpn2JwQYuaXNk3fvWfJ
VrIJdy6/zsUn1pV+DP+HP7E0lrRxyoJUfV89w7Qmf4ia5A3RbnLZkuHi1ATKtS0B
KkTZcxZ9HNNCjtw3LQnlafLZlsvdEVdeYtjrRZY7bUSJheE6YZXWTaVokZXrCLWD
rDN6Cbof85gY2eg0m7Hy3jKIW8MToh9pMrjHU1SRkMSMEPdtXF6vuntrfahN/eUU
nGB3bp+QvtcadI8x7pel982RPVgUFJDC6YDYRr6wyTNwPMLKYgli+QvsN90hlvLT
kOhOhofJY71wg8Vgj7ZqLlASKKBcCqTpNYv/1+md9xwaWEMdrnKJCyJjFZJ9ga0S
jf0mC72wlmeWILLDJXPKNqW2c8cC3y07ioZjhFco8uKtlLlAiFA=
=YDqN
-----END PGP SIGNATURE-----

--Sig_/Z=ntiXKo1oaCXqVW37womtB--

