Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3D734B180
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 22:46:31 +0100 (CET)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPuHm-0006Hz-J8
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 17:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPuFb-00053v-W8
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:44:16 -0400
Received: from mout.web.de ([212.227.17.12]:44379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPuFa-0003EF-9G
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616795049;
 bh=44/MKfQdDpVZKOupfb/xPXiDE9fo97IkNkPIR9rO8FU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=YW6VvozJalx2YyrnZJtvJraelHS08I24yBDcqKY02FQSFMJ1t/DRSDISvRjtzImOD
 6XW6OSqFDkC9WoPewSdRWJk0QY2XqZ0vUYW/xUD8S4BFSnRHcp9fCU9Vf464huHF+Y
 4LYIjiQIIHmLLlaJTKAxnoOWiggf6nwyoVrIMlxs=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZB4F-1lCvhQ1EY5-00UwLp; Fri, 26
 Mar 2021 22:44:09 +0100
Date: Fri, 26 Mar 2021 22:44:07 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v5 1/4] chardev/char.c: Move object_property_try_add_child
 out of chardev_new
Message-ID: <b2a5092ec681737bc3a21ea16f3c00848b277521.1616794852.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616794852.git.lukasstraub2@web.de>
References: <cover.1616794852.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.9KaN7FCJhhGg4Mxke7sLrb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:B9Vh6OymGbrFmJJ/6qoVRtfGTW/QQIlZr6O+Scgt12s5C5sBX4v
 T8phI0iuSRjgzy1PKdr8IAJy2Us6bDvu5m1twWDB9h/tcdvhQwW9D9LIFBHjOUxuMdiGJu9
 KFSyNlWM4ZyxTxmPc/HXgF4kQKIZkaMabSHThOgZxP1yLezbtVC+878bA7y+nLLV6vT0Xtc
 ki6Vf+K4sXq3VN7xRoDeg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nW8I4A7RA7w=:keaGSgvvEzyZJACTMu9hCG
 gA2yA7U8yWdSWQiGo268Pydq5eLB1gxVey8U/0p2VPvIZ1kNRqJcxM2u0Zr+48Ew2wEND92Ol
 lKpihGxyJCAdYlObha8VDp7C/VArjpLlypUew+JxF/23CZoya+tMusQoKYLPqo/xUvWur0EqI
 kNlxj4uLiR0rVkLa3KaympXkZxWdZuHZL8QKNutu3kNRLQlxyn3Fqh99cMPM35/giQwsmsalk
 shhngM+C4Cabk4u/QBQPpGM4cbJO4hbylikzqEyJQHglJTX1YdAPoZvLdKTybPUZKEw58QsHn
 pyAZxDzP3VPpFQmeI0TfMF+AAwlW4V/PQwIRwDMMpXoKiDl5hNyVahmTdOnTVfa1iwOU1n3hm
 j6B3VZl+nt4ey7+tfFyWP6BbRQu77HGTdCKeS6/fc4Vs5kvHeifB9AFOEVtXXpBZ9DE+dDmI6
 bBX1e49Kh5TdIr2N68PsvykB/V0mv2dRQ9HvtpijBZpFzm/FKsIgvEslv5hihqPfwF3L3gMGw
 1M6vwaKRj65uvqOaVl1kCE+3Ma/vDg6i5jQyDEKS13Co20/CciOb/9yxr+LRb6jnycOub2c+l
 M8HhmdjYFVF9xPcrJnOpjDoeGUe2yIjdgSARdnXWYAlqtsPLvPmP3qLbrdw5SNJCYsGMXCH+A
 +Tlfq3Kt5cVWf8YN1F73WROFdQAYjXsVuSLr/o2yzW+IqRMmOGl+rDNLGGHaUE12cBNTzHX2b
 SYl/itY5ByumMKPn/Ok030NIEEIhHAR+FOvWWaT952ITIpIP7fpxEafdO5b4y82/HFs3vmcET
 wAuPsWMOffv4GvUgMMGKhFO8bDgKS0bmMj/1OF9NRmD0+wwrpPwzQ/wLmwSnGIcZwDHBmprSe
 tBjKaitGxsclQkNlauarqP5eE41mn+G42FgSVrv8TogUw7h0eaFeTMudtLGa2vzNCqaH9OMDf
 ZA+WIi7N3i/R6t9nDRvlzZ1mnNlpBCR+M4UvYlu/k6i5wM70T6Y/N7pl3MCSwlyrxKrtHBoFI
 6C5pXYukEQUr2d2uyqD+1PXY5DJshDQRq4aMA+U5QoS9i2JaSGitK9MaG/uF+B64qeWtqkCjk
 kirplosqaJuCXPXHit2r/oX4wIQRcSV4Gb7FE4brJmORxiqRoeGXVyR2VONg8V5S4KesXs/h3
 i6Vr+NqURuWpXFnCN2qf3LtRVU3SWbusI6G9Mwb5na/Ao17N+Gmik3uI2zkw3NiG//oY8=
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/.9KaN7FCJhhGg4Mxke7sLrb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Move object_property_try_add_child out of chardev_new into it's
callers. This is a preparation for the next patches to fix yank
with the chardev-change case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 chardev/char.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 140d6d9d36..48f321b3e1 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -975,7 +975,9 @@ static Chardev *chardev_new(const char *id, const char =
*typename,

     qemu_char_open(chr, backend, &be_opened, &local_err);
     if (local_err) {
-        goto end;
+        error_propagate(errp, local_err);
+        object_unref(obj);
+        return NULL;
     }

     if (!chr->filename) {
@@ -985,22 +987,6 @@ static Chardev *chardev_new(const char *id, const char=
 *typename,
         qemu_chr_be_event(chr, CHR_EVENT_OPENED);
     }

-    if (id) {
-        object_property_try_add_child(get_chardevs_root(), id, obj,
-                                      &local_err);
-        if (local_err) {
-            goto end;
-        }
-        object_unref(obj);
-    }
-
-end:
-    if (local_err) {
-        error_propagate(errp, local_err);
-        object_unref(obj);
-        return NULL;
-    }
-
     return chr;
 }

@@ -1009,6 +995,7 @@ Chardev *qemu_chardev_new(const char *id, const char *=
typename,
                           GMainContext *gcontext,
                           Error **errp)
 {
+    Chardev *chr;
     g_autofree char *genid =3D NULL;

     if (!id) {
@@ -1016,7 +1003,19 @@ Chardev *qemu_chardev_new(const char *id, const char=
 *typename,
         id =3D genid;
     }

-    return chardev_new(id, typename, backend, gcontext, errp);
+    chr =3D chardev_new(id, typename, backend, gcontext, errp);
+    if (!chr) {
+        return NULL;
+    }
+
+    if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr=
),
+                                       errp)) {
+        object_unref(OBJECT(chr));
+        return NULL;
+    }
+    object_unref(OBJECT(chr));
+
+    return chr;
 }

 ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
@@ -1037,6 +1036,13 @@ ChardevReturn *qmp_chardev_add(const char *id, Chard=
evBackend *backend,
         return NULL;
     }

+    if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr=
),
+                                       errp)) {
+        object_unref(OBJECT(chr));
+        return NULL;
+    }
+    object_unref(OBJECT(chr));
+
     ret =3D g_new0(ChardevReturn, 1);
     if (CHARDEV_IS_PTY(chr)) {
         ret->pty =3D g_strdup(chr->filename + 4);
--
2.30.2


--Sig_/.9KaN7FCJhhGg4Mxke7sLrb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeVagACgkQNasLKJxd
slipEA//WjDtilWoVYL8ImwSIa2l6Y0Rwt7JdXC4+0rs/aJHHMjYe5ktUh6tjWe9
Z/q/U+oXEsy4s6V0yrkyBLS4BHCZgkAQFPC06zTc8VweB1U5Rjav2rvCeQHuzSEI
GYaVKhef9l7gbvTgMGDz4SA2FKVFthAQq2pZwLriyJV+USszruMrid0qipZHkYBo
rDsoVZruUAYFcsRwu171aBgYhXGjYx3teTLYIF8s0aW+flSuKONueEy/RmO0niad
9CNM2yYP1wxA4BSmM3dH/tKtii9eu47eLHMSiuxTWuqLlnk6L0siLvXiT2tzXGsS
ZfTKr3jPsJRHRtI00TOQmgY9EIz75Wj4gRQ3TeBlx258bqjHRw4ETNCc39vn+ozP
e9ahp/oWodcAyDfA3Ogaab3sLMniHdV3frWW0xb71Lg723YiKRNMpU3xsWwZ1yQF
oHHCVCZHcbKeQqwzwixSLA58IO1qko4EJ+h9orsx8i65+WqQ7sM6dCXRuprLqveN
9g8K24nxJgZjYat9BrOaHzpvNjC/AjCqsIu7gkFJ98YS8/y17YMMzJdxaP572Bb6
RA6C0yYw/s73UEcscLTTisYwM5ISlvNQ4QskIwts7o8JZOappaDiEjauPbnWx/l7
1NUblm5052ObnoLVHOVGGqC/N47S6qwI42eN7WM5JSEUNmIepBY=
=BGDt
-----END PGP SIGNATURE-----

--Sig_/.9KaN7FCJhhGg4Mxke7sLrb--

