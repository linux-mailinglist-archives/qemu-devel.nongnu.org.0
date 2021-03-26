Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2360834ADB2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:37:15 +0100 (CET)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPqOY-00075S-6S
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMa-0005MU-UZ
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:12 -0400
Received: from mout.web.de ([217.72.192.78]:43363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMY-0004Vc-LJ
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616780108;
 bh=vQYFwkbpc8+2YYoeTKCpOW2UyebRy3eTS6c7OI7RdYs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QmOsYLe7V1uyKlaDFdHX6XC8o5IiBv/Ql5y2cUTeZSVMKhG3qYhUejiDSoMaS27Zb
 HkAon4sHGiDGvv/SyC88a3G+BoL5KrIf/eRHDUry62JvALtmf/Udg6yM6CR5h6dtY1
 bXmagD+3IdhVlp2mNBf1pjfCtbcvuui4mzFHwlr0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MdO9K-1lzBBE1jWK-00ZLda; Fri, 26
 Mar 2021 18:35:08 +0100
Date: Fri, 26 Mar 2021 18:35:07 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/6] chardev/char.c: Move object_property_try_add_child out
 of chardev_new
Message-ID: <b2a5092ec681737bc3a21ea16f3c00848b277521.1616779714.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616779714.git.lukasstraub2@web.de>
References: <cover.1616779714.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/baHpMfy+tjdsQyJUtWu=k=E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:5ySW/GtLcD0oM5IEFM9MHBt9OZA1PAEG/w22NOngsltmCtPQHIe
 hd2PeqDaERyluTR69URA8dQV7y2ZrdXxMOlUcsqSTNV1xxtsdSUxMXRRh+eXarUtBy+qNbR
 fkSjIcSjuHIxYsfgiJVVPhP+jClH83OSdlJcvizRFXo+BEef2BiOWQ3D8qDBZy0bFDk4Fd1
 fsIVV2Q1WvcfwTWoFyhBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YQL1E45nSE4=:0tRmhQwXUu67r7Kl2Ieh3a
 w0p9E7jiHO9tC5du1F0/YgjjZ6D/JVB8Y4VaFj46QZ0UO4GybuY38iKfMK/5U3Okhwxs2x3O1
 aB723mNhSdUNbK5bt5IXXhbNQwhu+8dWx76uWIcEabk6Rp9nTup2zI3WoOT6onfM3vFd/Z8Tg
 MKD+Y9AzCjm5sXpgW/37NviIopScV8y7RNrh1752IZjNA+G1fmuMtrEM+DG4M3hg3gFVB4VRw
 6CVdth4Kl4Wq2YakVZYX8lQxcMiGvxbTDVcl4IxNSz0eLeBz7CPn+Undcm5IifbqJvDD6PcxB
 Je28vSrBtPTX/DU0DD+2DUK3UtTxODiNYLSw66Pv/VutSSLFHfjdIn+4gbhDz+LNw0TWVKB5D
 9eHs2IwM67cTV2SoeUOaX6Qb+j9kzcplOrnMJbxeGEz1GGklq2tffiZ9dLVrGoAPG+F4GrLrR
 wcn1ATmvwpTsNELsRcHIhVSp5MZOTHGbHTqOx5lcP6IVMpbDBb3UzO2gY9i65MHOAQea5Vy4f
 05OGSkP8QQEsEGymr0d7fo131Jx6TfUOaQWrt5qfbWrfl5QyHihKxcTwhfDC2oC6FyEBWjKLz
 PrZfdX2c+qij+p+jYmswyzASdfVz9D2hY5pSpkuVs5OAGO455hiNY9Fxt+iHshc0Nwfidpzy/
 zfnDuU36OtYPAAyy4hrmjABlZ1R7Z/KicFz5SBxhVhTccznXXXKwjeDxrr/Pv+IYmPLWZMoLD
 Psx6FvFABDUBX4F1zlg+CvQW5ba7pdz7lSZVJWxUHyITOXyL91m2YqyVe2VYE6IU7q40qyuQa
 +JxaDIIqMEEF6oYOtKYLzBnq+JVjY7EETXwpn79kJzPTJYeOqqFgMEoW1rkUB/Pr4aJaiMrH9
 YN+W8uHV7nNq5oT7lWBgOvBoRUwXlYLCBOHanV6qHoJX85kF9L4e3xEjq1QR5ZplPWs7ad2Ar
 N6moySC6oBJysCXqioN69Om63pW/y567gUpPWdEBmArYH6k2xqVWVFAFHdKozlvtjpqRlgvGg
 Vdtkvc5RbPxoVHVyuDqSIsvKut1CSmoLx2RPHqjmAvbL/DIf6PX/LhWcXxh+LO15QnZtB14gG
 oFSGLJNDqcRmH/kYRb7A4TebEE7qPpKTkoQb6RhcMEErsW8Pw+IQZ5MloF/OCGmR0F7Ssu9o4
 MmDhwKBq1LzPzVv3mlBfSVwbMAXDJysbl0QXM61YSr0mPR6QJXPlx5n6eKjIakWp1mMqw=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
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

--Sig_/baHpMfy+tjdsQyJUtWu=k=E
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


--Sig_/baHpMfy+tjdsQyJUtWu=k=E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeG0sACgkQNasLKJxd
slgMjg/+ORNC3kLnsPSHYrAr0NZpqh4nIx2KMkrqh6UVHEsllj5JRdgroJmt3/B9
I3fYRuRHk7Y8HjRSFMCkRiq4IM7Gq9pc+jVg4rr4SawfqHY+jT5f+ozCn+2ONUcJ
tynvIBH4kQEbWmby9nJUu8VjII8iLKJiS3skPhpP/LDncn2f/9laBB1cf76vluHY
FF+TXkmC0LtbkI6yQ2QOVJWUpS8t6EreMmKLPg2aYiomR6oe3Si2xCcqjF9105vD
fITtZ1KqU/bABFKWYwvpeb0QKeY8DbNDkqJs+Ap8BP4IFuN2d8KJa/jZ/imfksda
KIyXua4/TsgV9pzVIuXznDr6PLPSK1nt3YzSsG2VxVaAkzeKjQmqUfGGPKQCbjDL
imtYXsDuvpl3SDPtfssRhVCUWOP9PC78IP+kMx76IAThl/5hMuOXninFvyqHu0Pa
WckbdiDIVkvBxEd9vzBLEW17l5XTuU3Ffr565Z31kFpKz2aWerYLwDtpLeQzUsgF
fHdFIsMF84bIKeSA9H8CdtnwQ5cSuX9RInbXNPbEWq7W79IBDDzLVWzMg9lurFHJ
OOQ+WRVeVQJcjXye2g9qyhR0w6TNNtoNH3Rp0a36997dlNbNWyA5uz4sESx8BQkQ
vrikH89WREhjmITSQI9hsLDgVoQxGvpyn41HhEKp/HGUTtrwKEY=
=OEEv
-----END PGP SIGNATURE-----

--Sig_/baHpMfy+tjdsQyJUtWu=k=E--

