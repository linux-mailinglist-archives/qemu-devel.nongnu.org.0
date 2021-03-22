Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B1B344981
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:44:08 +0100 (CET)
Received: from localhost ([::1]:50536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMit-000296-O1
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMgg-0000Nu-9G
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:50 -0400
Received: from mout.web.de ([217.72.192.78]:48125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMgY-0005FO-3c
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616427696;
 bh=OF6dwf/LvxT6SIekZpv6byIhoBmvfTGfPJjzhen9Z3A=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=FPgyQSpWLXeEbvdC/pqT+Y9R+I0jXOpqMXVJDIKzZ5p2wDsU3B/GSPgpZ28QXnGuL
 ZcO9s8pJEGcmACnNYOC6f1a5sXLeDpBMBF9Tloqx+XcnCGGkz2XH7rUQctmdz5O4I8
 ZwJgLoIlo+0kJukSleTIh+cgRT2+vQmYAzmL+rdo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.232]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MPYNR-1lKDwn0tHN-004o0c; Mon, 22
 Mar 2021 16:41:36 +0100
Date: Mon, 22 Mar 2021 16:41:34 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v2 5/5] chardev: Fix yank with the chardev-change case
Message-ID: <9d26845c5dc18241bcfd2ef5b8c4797c35b4b178.1616427054.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616427054.git.lukasstraub2@web.de>
References: <cover.1616427054.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oblpt4EBIBb7yhv0j5oGeeT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:lXvr+MJ5KpTYUuw7HQExiNErNLCmHFMbdSxyIypPLEbU+76CQN6
 DRHEXOWPU2ImyIuQ12IslnHEpX4ogfTcuh5l+jFuyU0k0MwuboHDH3JvgpAhe1adi3CyICk
 ouFFXJrz8F3g8lv51wYLD4UVcJ68g/G0CgXmC3gOVcYBYZiF2zWzTBaoN5rMAnu8WkGxoCI
 ylBkeDjry7lw9ptBQ6A1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:skz1ysuLjlU=:vXfnpYSG18ol6FeCIC3vBh
 3RIyMP03vP2QAkfCO9Asva0G0lxQZAKTY3cCc1458W8Tpv+SR/1ruK58Es3WJTcd/BO4NAA3W
 F1Dg6aas78vS1gTPBf43614dZbtnCSgu/sD4hUol7INid1DzcElu8srW7VoyyFf9gOYlp2wUE
 95ISvgWuOT60rHKDCAcngErGL6Q7EKwK58pOhywg/vdqtoWopJr9OSLC3TKteOhN/YW/cHy+R
 8X2jRUU/D+B/tCcAsTzt24xmf8aDRWIcIBzWV5XbOlKDB/u/dYbks85rvQDOSkzYvMBvAvTJ1
 yMkHzIM/V3aWIPH14WgP6eGOHDuScHMptlEHtBEk3LQhT3RdHyw1rY0udoi2yq9er3Jjvq+cl
 Q5E8RDtJkTszQm033lr17fsXRhfqaX3N5VfXvoBVNuEZ+/m7YX1o8wFQVhCY1RAq9ArPP2cRU
 WOfSG2Ex99ydruW8bj7FZrPmQf4U8rqDl1ILYkKSaOUjRCjA/l4gbBmFKQD8NIwFu5vn9aAS4
 GO2hlv9JN7MvNhK/r/cCCc+ihfJntSB+h8rjEOuGYsGguAZXyN7DopAEByC05hcd6zghWB6Gs
 OGcEQ+TpNQ+7gcL45CfVSsib4h7RCTpybJFdz0IN9ewf8Hzr2zrARvbHooNk3HohclyIzvNn1
 UKRvXFMGVOHtRvBY4jv8ZoV2pBilipUVggwIbgM0Np/dlWHxYzxx15ghjnA4hRLR6AdXv6a2c
 fMfwY8aj1Lt9gp/GKaH4nXy6UwwvvObugkHA+H6Ba+Mw8fZvmFOEMPThLSM5bUspXyBecK/Kj
 b6BBl6waLg5kXtDWMbqQvJpQ08ejVZTGOtkMUTK3qfNiDQTR45GXBFSvdEvdiEDgM7VwPZNIh
 a2z+CBh/5jhZjieo+1oQ==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/oblpt4EBIBb7yhv0j5oGeeT
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
index c8bced76b7..0cbe91f002 100644
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
+        if (!chr->handover_yank_instance) {
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
+    if (!chr->handover_yank_instance) {
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
index ad416c0714..9d8ec81a73 100644
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

@@ -956,6 +958,7 @@ void qemu_chr_set_feature(Chardev *chr,
 static Chardev *chardev_new(const char *id, const char *typename,
                             ChardevBackend *backend,
                             GMainContext *gcontext,
+                            bool handover_yank_instance,
                             Error **errp)
 {
     Object *obj;
@@ -968,6 +971,7 @@ static Chardev *chardev_new(const char *id, const char =
*typename,

     obj =3D object_new(typename);
     chr =3D CHARDEV(obj);
+    chr->handover_yank_instance =3D handover_yank_instance;
     chr->label =3D g_strdup(id);
     chr->gcontext =3D gcontext;

@@ -1001,7 +1005,7 @@ Chardev *qemu_chardev_new(const char *id, const char =
*typename,
         id =3D genid;
     }

-    chr =3D chardev_new(id, typename, backend, gcontext, errp);
+    chr =3D chardev_new(id, typename, backend, gcontext, false, errp);
     if (!chr) {
         return NULL;
     }
@@ -1029,7 +1033,7 @@ ChardevReturn *qmp_chardev_add(const char *id, Charde=
vBackend *backend,
     }

     chr =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                      backend, NULL, errp);
+                      backend, NULL, false, errp);
     if (!chr) {
         return NULL;
     }
@@ -1054,9 +1058,10 @@ ChardevReturn *qmp_chardev_change(const char *id, Ch=
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
@@ -1118,6 +1130,15 @@ ChardevReturn *qmp_chardev_change(const char *id, Ch=
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

--Sig_/oblpt4EBIBb7yhv0j5oGeeT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBYuq4ACgkQNasLKJxd
slg1rg//csv4jjK2RJG1FcuLSWS1ZTLrkkYcfICIFpGIp/sMAJrc8sU5ySfBF9eI
nsmHjIndYtlRf6RDy1dKKLtimmHhTpyP4ASlJN8tvjNViy0yz6eRKoEFRMDGVaVb
mDTNfKgyQT3/M796qDAE2nSQwLedXL1IVrbMpEbVmHHQPUSuVj3jC7mQGWz9RFmy
fp4ovwmfyN6VNAe5DpmemtCgMrTH1Y3fV9jMqln9h6+9cxcSIWWCwp21rkRnYqKu
aGy6RJjAx+MmjfNfLn3wHtKozepUenufACEg1lloJt2CoW9vqUZbYBbnFvYFRxYI
lWbpefITIWqhpR8bSBzJ0bAuKWMa9v/a6eJx0fZECHHLKnB7sST0BKxNlzhvLUd6
+sF47wLnAw4gfxu/hLonQgz/Ol69kgFDOYMuQRHKKNRJP8tMmtFSVE0u5yYYwKHx
qeSYobASa4IbeMp4CCE01cn6tVGEZJFn6HXYg5aec+mI2D1isI5yGvnRiRR5BOVK
KAFRk282VLgJmGYkQkpqRDLf5uJ3qdmbuUdsFDk+Lz6WsiBh0YKTFSZwSwsGuxb4
mONWuvm0qPTRbKwJrEdxGIpuAFipn8VCOO2CBz6UYeiHiwIJrPEZoFFZkSMLuiC8
DQ+XRR3K4kLyDF1/2GBykGnW7b3CH0hhotiDIMeyC+YC+VDS/B4=
=ZQNk
-----END PGP SIGNATURE-----

--Sig_/oblpt4EBIBb7yhv0j5oGeeT--

