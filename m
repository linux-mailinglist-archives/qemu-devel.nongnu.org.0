Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB73F34F0E1
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 20:20:05 +0200 (CEST)
Received: from localhost ([::1]:40514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRIyC-0007ME-Ta
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 14:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRIrw-00043U-NL
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:13:37 -0400
Received: from mout.web.de ([212.227.15.3]:34633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRIro-0001qW-Da
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:13:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617128006;
 bh=3XXtN6y+j6slMq4ZGt8WNHFfVhnqvqqw6X0e78KVl50=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=KccI/rcTQ6TkyoS3lEL/z/o9x6dSFwa2m8hr0oAAcMCL8MnhhD3LWtSIVetgbtsJo
 j79kC7kqP+9dtJnYv7Mbs97niODvBsbQqmY+PAEi1cPw2x3aiUAuaTXmKRV+SSIkDP
 U7xuGudE3f57LAvuHCW9af02OAoy5QznVM8rgqP0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.86]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N14ta-1lbmDU1pk2-012XRn; Tue, 30
 Mar 2021 20:13:26 +0200
Date: Tue, 30 Mar 2021 20:13:25 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v8 1/4] chardev/char.c: Move object_property_try_add_child
 out of chardev_new
Message-ID: <b2a5092ec681737bc3a21ea16f3c00848b277521.1617127849.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617127849.git.lukasstraub2@web.de>
References: <cover.1617127849.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6K8C1En++lqnwnoqdUxkZ_l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:WDQLgNJuO1D+pCjWoSUW+93+3D5XM3hJlo6V0qT0p8UhXJqdXDx
 CayZG7znBSI5khVcDcvU+Z4WPHM6lY6B+oCHJ47q7U9Q4HvwVDh1b4E+jreWOoQc+UGltRC
 dxUK7bRBa+hOAWTOSY2OBeB81bkZUHOwWHtuVkAqbIKtGpCAUUBDR6NcNfV5Tv4F/hJ4qVC
 HppzIQkj0R2HYlDCx+/sg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h30CVOOj9J0=:bUPwMFIif1qUf5qc3Opu+X
 DUpxltK1k+HZ9/IDlu6U4+QPjYYmvn9HP3VPQqtA4VX4amk5DHjneFGHlEijnmfXaaeft3BXF
 zpmNmQYN4PtlxVFwK0t+XGXXFOu/xwf3wOXtM8bXuHRh+iCfhg2YobCXw+8IPiX8ZUnzXP02c
 iH3UV80uMPVvpXWawsTMjOKD0YKTh8hxmtuPSlwCYPzjA1z6vUvZrgOB3ePF00DsaZ+MVAQmj
 PQvFZKhCu3F9n61iEfDgiY6hScyjcKpo+ybAgXzR6DRrF4UE35Dagswn98U4Qk7bLmRmAi/WJ
 IVkR5pVAKyCWToW0blola8HCzZnBU4iOPVeSRk+CQlDMs60RgLyiT86thLu32zN4ucqhOExwM
 WCsf6a6Legf6mhdJwTsRLufrTCrKxtw+GdmvD2rQFRvdKE1z+snLbnY2fp/rUrboW6lOLVQQJ
 OCe9sThBDUoh6/Xb003fuOVWJhi30f2vmRY/2YAF44pRsYufNsSc8mI1dFbWPl5hrV3CdD/Y6
 LwfqRjXuYiZvEh1rLNCeogJB+cvQf0+35NPoUICAktJzFtl6ckX3IZoAodgGB0Wy+K8G8I2Xl
 yD33z5RcWzW8oZAELH26UCrjK9ERa5oZJMPBXkFkyAK23CPCsJt15l2p2gaZyTSvzU0WCWFaO
 RE/M7eKoLRnUK9ghlzW2W6PZKJ7jbZdPfLIuACxGxgK6D3BIJJ8WDqfkdbgd8adaaBylaLKEW
 5MSYupslx/0m8HC9oO4X8kkMlNLTtQ8c0CwyOMcJERmm+Gd3eXB18WqdSMZCVJWH3vCqXpVRJ
 p3JbRuX5FYLrFd/cnXz+sdo6KucGQodE5dE2mrLuiDSf6iYE7uJnAI4UXhj4JGUMZn4HYMYYj
 Ecrf8jE5HocveNxrtkpWsektylAWvkZ9ZcD0VwHjv88WqmYwvYeOqXWn8nZv8qLxhnYgahgPA
 gVCPHpicjP9PwcoUrxZr4NitG+1FJJvX6SybJKspFRXIoqP9i2rYDmK2Ky7qqj3Z4pN5yF+rU
 aNcT1bYCXdqt0fPXXZ1HT3TUWBpoFvhxrViPkWwfaZ2xAKETYJXLvvc3K5+e7SmjP1Wgr4ioC
 hfVpbh8nsko1ONlSJSv/7Nzc9z0ooAZu8lyuLSvFx+pCelwuoW1hnKVauFLtmmiO/aMUUCVgu
 zZaKV+e0XgvPJ8O8eCm1Cg41pCXie401Ou5CsAUCGmuwky2N7Ioa54A9iRM36e5EYZmqo=
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

--Sig_/6K8C1En++lqnwnoqdUxkZ_l
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


--Sig_/6K8C1En++lqnwnoqdUxkZ_l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBjakUACgkQNasLKJxd
slh3Fw/9Ej2iWf7Z1o8eIUS9ZsIlTT8C7//UCJLavj9fOrwHa8p5j63xLyLRxMbz
sHHg2/C7wx2CpqrWD8Ak6mHz4kfiNXXq4x3CcI5E2J5/HKW02tN5cu3lRF6QQh5i
cqggM7jouLVDFA6uh+Vq9A+K2AzevuIVsiNAVAAzgAYBI09zuvWtRovqdsB1nQBB
VM4Fv8hbv4y9k6U8NloFQnYbIQ14njX558U+Ds6VUrvpT04lUh7E0BVR+oC25LNw
jESnv0N99NAB4rozYgkPj5T2m6cpc9U2x9OaX46ClEzNSt/qfnNl3yts60P7xkfM
QmtrSrUIfdhrA+XxOjBsdKn4io5Ks7Vgt2ktZ1gcGjSAg3jCSy7X/GBbz7zYN/Wl
SX5he4bZys6qnquNIQFS1Kx1VkPtdla8BzBlBPkhxKsQ0G+cEaqgRLOabtynmS1+
saPVemRT41FKED7tUViUa33ScAXa/XlXQkR7atCYhzwam2UcRMygdile/it9ABFy
yrGtKuZUF+SBS0cGJJ9Bd7TsRU8WH3OcinqcVi1Rr6Xm6d5vXt9ldGoebd0sWt6p
wJ1R5MjN5ex9MMbsdoX6HDDGi7KN1CDcnqruzqXft48QP5hcQJoLP24VlZpbU7wB
3R07/qWY59V9pZN77tL2wKe9aUCBXaKHRJmyzw2jdmdy/XcqmoY=
=qcjV
-----END PGP SIGNATURE-----

--Sig_/6K8C1En++lqnwnoqdUxkZ_l--

