Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE0A34684B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:59:52 +0100 (CET)
Received: from localhost ([::1]:33764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmFr-0000K3-Qp
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlI0-00023M-3Y
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:58:00 -0400
Received: from mout.web.de ([212.227.15.3]:40901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlHx-0004Jx-Pg
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616522273;
 bh=sjreKfuXJKhjrLHdD3bk4kmFtSJ8VoOxQGfzelxXDkc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=mcMFUGRxWC6Lyov9s6gBjMo8SYzyxAuigz5xfBq11CGs9oDX7OWTbEWjVb/33wTVO
 J9+x7KJT4ZQC2Qcd0CLuzfjTqqIBb698NVmYxWvruiGWZ1KKEFHyqDMdQXBublulcf
 xd1dn8V1AVKnYQ1o8frVD2EOL7K6ui/RLAqnRTvM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.81]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LlWVj-1lyvBf3Ecp-00bLXU; Tue, 23
 Mar 2021 18:57:52 +0100
Date: Tue, 23 Mar 2021 18:57:51 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 4/4] chardev: Fix yank with the chardev-change case
Message-ID: <209b759b2d3d06658f1c0660c47f1f8a5927ffe2.1616521487.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616521487.git.lukasstraub2@web.de>
References: <cover.1616521487.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uHcSYqU+Lk5E5HOo7OH5J+9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:/9Pbq5wQfrzhidEbtp2TPH4ws9aQQ3QKX5ggJQ0Qh3lx/xzT+8Z
 Ly+f3lnmG7/FZQmiw6mhiL5dU8EYaKBkDQFdWx6gM/ywBX7ZAahK6hERHsitF0e/VurhgPt
 LK4n3bPZlrRDM+bPAf0MgE26MH/8W0ifmJPoyODrYnWTQW3nXBdc12BCVfwnKC1B2omWs7t
 hWTyOkLQ2FLFaKJrXG4cw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d3FCeYtkNCU=:BGjkRAYPWmyP8492yW0gR1
 uSC2L7yewktciwaf/P83fgLWjsbwuCxGjK6PVCPgzaq26g9WMQGln8aEm97Pp3PFi3h8fUC5M
 HVqknLeENuJsWTU06gPq4P0UHMUyC2gwwbbE2k5Q7N1aZknPXiW9rKDpBkeKuU7PRlpOLpFrw
 qNyizWmyuW6YI0+QNljmxe7uvT8avZxgL2ct3XZ5vbKTS2qTW6vbmgEqQ7fuIoSY75KSCJaXg
 VxdkMXQhdp6Ko7uIfBl8NkCRIWCjwnUikWiq6X1EnEIvJ2YjpmmZA20Fj7W2P14L9QdIdSnCu
 bti8iv9Z4TbTci2p+tlU18mKTDVTq+3Z5kjPEne3okcDiugrReOqaI4WXc8dZeo2ENvBA6fo3
 z1Db3Jt/uibpy8YX7a48kO5YWpbO01iuJaPqqk6ZhoXwLonTaSKPZ3MtL2Z6MDuq2gFNbR84f
 XCExztcKumt+B+aip1IZ27aUA2TUQtQpvxE7jwlnfLCua2kv+QCo09weHAFpDH1+7ughBFEYC
 zbh9a5BEqajn2QAr42aihVKIiQRLH06PW1Frmm03MS/jKuHe8oJyUlUu0pvdv5jHS/b1dUJA1
 Jzw9CenfX33Muz7K3inF+XCDFOaRRKJa3yDRCqwMZtjla6Go4AskGNNhZn/fyG39FCcj2mAzb
 R7tF3JmShX7Ok6cq+QyWG6dSbf2plZs3fotaL2gIwLGMU0aoz3zoF/xnIkNmZojWYzxn+YiPe
 ZjJwHceNUvE4G918VF7mr3DGm6zwgdIkC3SnDzQ8hxk83a+0lNve8UMWtzC222qcuZRBPNzE1
 NBAW2LBSOVVPgRu6IvaHt8lSDPRqLsiwNFCMCrN4XSeE0ONRxZGn9ZRAOaINdESRTocUC8pij
 g68J+AZs8apUt5er08CRtF4xU+Hg5V5INhwH6qkLa/CVnYD2jtcUCt0Z3PCFHp7JLZ5yYeXoN
 L+G8Ex8Zj0DgQ/YSXwt4ecFErPCCMj7b4AOqoKe0ukDGAHZPpD/R9wO4z3s/SUAogckExw6m5
 mvNldzeMuAcXKveElzxUtWkn3bSIcjePnwRjOXBPhpaKQ5XOgZkgZw6vd6iOoxD9uQK4P1+nU
 uy48AEnGCJkQmsHfCrxrOIdkK64812H8GZ3PwqkMeKD+LG2ZC/912qy+rFRgj9YVSeJ2oHu9J
 qjD0dE5XxtFfebFJHqJDy6gKXIZ+kZXgQM/i3/m1kyAjWMcpvyd3j9HYLcm/3riAjVBG4=
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/uHcSYqU+Lk5E5HOo7OH5J+9
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

--Sig_/uHcSYqU+Lk5E5HOo7OH5J+9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBaLB8ACgkQNasLKJxd
slhhcw//bgS8blYRNlYYwncs55i95+VGpmGnNHo0DCHdN9jA11CRc17J8ghhUALc
nTuHlmQ9OnbkdPNhO9iSxANKqXs1Vq16isNKIUaQeGEy3sXs8CdQa7add8XpMEno
wE1mXEm8bDZwRtcIWSNvYEnunrxvQ0U85Yq/xE9G5hVTJ95CM9gWJAgEXDojKi9k
Rqa4IiE7TVypfsgkr8yf+dK4308/880dMQU4vuZSxBs5eThn0PAEHsG/UqHtVDSM
BbowM80OBIfERpnPp8qUaZoQrjFUDOStDu09BhoJjAENpBiD9uQ4QVLZW+QQDPg5
F+0/G74yJtXpqz15Y396JlKxIAQ463vY9Y5UQ23nRNtbOqsOcDl8871CufNsVo+b
mTGfDNCDDL2qCw9vAKZBWlNubbfyFCfxjvQj3VVL0JeP6cRFVs91pNl/p0Iqh5dc
7kBpPbLS48n/ta0H7fIy44YCyGuRl4/uDTbFTPwpdLqrbTwATq8LORKgZBHbIhKs
hElHvnGl4qOCFMkyeXHm1LJF6jzfyuUZi0JYVD9ocERTcDowkZTVYCUpyaor3Kox
lqqpAv/2TsxAmtGIjjworvqasxNjIESxmRUBL+w3qCgtwuC6aGlgWOuhv2kWKonp
4LysQxaOdpMsNYkr6bOSGQecHJFefRdvlcXUm0BgPdcafmTQBhI=
=qEI+
-----END PGP SIGNATURE-----

--Sig_/uHcSYqU+Lk5E5HOo7OH5J+9--

