Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C504A34F0B0
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 20:16:49 +0200 (CEST)
Received: from localhost ([::1]:35402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRIv2-00057L-BS
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 14:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRIrw-00043O-HQ
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:13:36 -0400
Received: from mout.web.de ([212.227.15.4]:45577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRIrs-0001rn-Tt
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:13:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617128010;
 bh=9DpaeOdIwE7r2Ud+HU0Mtwm5YefyxWD/qpvs72RsLtM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=dE9G4xm2+Z5mnNOlAKMxyUEy9OXaGhtvMbV8eEMbn+5RplIZZjvQHqIrvTeSfVLKI
 oJS2N+3gObzGwVBZ6bruimCcHYHu9oHdiI8KPdl/N/6fvtK0EF/Gal7+pbhtuXNrdh
 nIxc/UfERy8LYOG774IytZUWtL2MCPx/+lvJF5CI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.86]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0McBct-1l9uhy3vMd-00JahA; Tue, 30
 Mar 2021 20:13:30 +0200
Date: Tue, 30 Mar 2021 20:13:28 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v8 2/4] chardev/char.c: Always pass id to chardev_new
Message-ID: <3e669b6c160aa7278e37c4d95e0445574f96c7b7.1617127849.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617127849.git.lukasstraub2@web.de>
References: <cover.1617127849.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2=xPuxFm3_nHc911sz5nd.d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:7maQWLbrNFeTRh1miM9PmrfQfI8Ytd67Ww45YhqkZJgYYYBDTGS
 Vxi7oOPziup/5TOmVulbgILqRnnlF/C5ZvU8C6rRe+R3x50j+PZBhnsEvMF5RLKbqGS0CDa
 CvxWlNBIbiTgxSKb2o5xzkXvooK7L7wxVsY1DwBO7Lldk+Yzw8Pi35/js1mAC98W3VAihrd
 pUhNfOQg1iZhQVB2yDMPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:StWw7+KhlLI=:ug/oysNNVhRzVXc+6/JXmw
 yB399LXzUttan6k7ii24N/pt6Rh8iCmzZ4Tf508gsGRdpA4yQXFdGVqNXIeJvmSxZhmetSHab
 rVTPcfNuFyWk5lZnZc21Mwjy3Ks3NMUJmdRilSafzPTnikrrdqTfmsQC2FyPPKYM0YmJZBM3e
 TTzlVRREclhEHpqWrsq6yPInSk1z+VFqPN8CKYghGwsu2+dSg1n1oyXiHe3XAjuO7ntPGnSTq
 yudxBR8FgJ0EOb4/WoLBO7cZM9sp5EhV4KZ5kAlS1zlLrzdktPPIN7pkA2HGWlYnMHOA9+I/3
 jwBLmDdCkeLRCjXXXOnJjqpUPM/usdHu+xMzzHJGCX3IiRlAnZfEQI+VKRnY43md3AjB11FJS
 6fnQGTSl3ALYlVdGoqlipFzdop3MizcJV0JXFOh4yB+GEiF/CN0ALZeko2PzkETcAKPPnlWEb
 L4YE1aERjCQ5cZ9VHT6NtCRp4kJ8rFo4Hlqp5eNCkSC/T8d3moTFnH6I7ZmPuDTQ59CSOmzhZ
 jzA+8sTTLrPTFy4mPADPpD9NC/qZmbZq2aBOeNUS50dqwmf85wE0aK3Q/yGuKinPyii7oUoVn
 FkXqCK+41SFzh/jH4sv1b89JKhwt4M6hXoSACIx9gLJKt6E0jlJkcXe0w8lvgbkDsxVaBnHfU
 OsP3lOObTfMNf5d8QI8AntTWCAY9tYg8m4ZojU1+ygvuA4baGLsigWjowUHko36cKpWB/Loxg
 4QXwdpCtb4ziWIspPtILm67jqWk0y+8HUOu2sRnt2io7EDXOVRqtqdIO3FEr2Hmvl8irz51kd
 gOPnQSNfJLUtYWXBsJIF3zi9Eu2rBAhJsH7Ec6VYu25z12inlHEcoG+ZXs4WrpDif0Dx+u0bT
 UKJC5i8XLb2SpM5ZM50VJcQh7t3NZdjHlGBzyZrYHIH2OM6IWB8EAbnikR+y6OOghymuBLkyc
 bIcQklrgzB14UOTlq7X7f0w/HcUoHmtP5nSJu90RdSelQ4rO6HAYuLiw5VR5CA569AWzUKcfB
 cCzLbDOZXIwzuIOhzjf/XQN6hcOMe/iZcz83/ICfAx+kyb53rUIAyAW6Xt0zhcDxXh540iGWt
 6+lufSV+5qLuYDmDH6Z1eMZB4ua/kP6Y0dR1YuMQlUxDW1YercVpJh+vb4ewMpIPux2aQc1el
 RBHrjnv94ccTa58uFVVyXRKURnXQuw0hsdUV3kLYTK6Bwi4FSm3TTJnyYpWKIhX2wXs98=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
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

--Sig_/2=xPuxFm3_nHc911sz5nd.d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Always pass the id to chardev_new, since it is needed to register
the yank instance for the chardev. Also, after checking that
nothing calls chardev_new with id=3DNULL, assert() that id!=3DNULL.

This fixes a crash when using chardev-change to change a chardev
to chardev-socket, which attempts to register a yank instance.
This in turn tries to dereference the NULL-pointer.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 chardev/char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 48f321b3e1..75993f903f 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -967,6 +967,7 @@ static Chardev *chardev_new(const char *id, const char =
*typename,
     bool be_opened =3D true;

     assert(g_str_has_prefix(typename, "chardev-"));
+    assert(id);

     obj =3D object_new(typename);
     chr =3D CHARDEV(obj);
@@ -1095,12 +1096,11 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
hardevBackend *backend,
         return NULL;
     }

-    chr_new =3D chardev_new(NULL, object_class_get_name(OBJECT_CLASS(cc)),
+    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
                           backend, chr->gcontext, errp);
     if (!chr_new) {
         return NULL;
     }
-    chr_new->label =3D g_strdup(id);

     if (chr->be_open && !chr_new->be_open) {
         qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
--
2.30.2


--Sig_/2=xPuxFm3_nHc911sz5nd.d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBjakgACgkQNasLKJxd
slilOw/7BQpQsTt2crn6rpS1ftYes+iDPJO0iQXo+zk4GaQlfHOHvcHF3t2/gnUE
WeSMZYNMYPc3+lFvaSX+cYEq9MttULfSJjP4pBPmbybdpYQhcu0g14bgH7McKb5s
IjSx7ScKzUjMSL+X5EUrb16VRgD68rDx0/sEq0JWhFPJ2tf6G0Uwndl32t0DCm+k
MAHJ3T/OlGbposOJRRxSFsmJk1fIEAnyjZSWSUT8SDoGGjQcqFVVX2IAzrqj9RQp
LApUb+iGEkcoO1MgtrKYEPNPQgpL7DKdMI8rGBdpF3y05PFHHtQtDobJ1lvT+eQt
2MboR1VDVz1NRSU2hl2tB3taXT6NZU9EyQ7sSTJd7fMfeHbMPEtYRXYwCzXwWwSG
xhSMkVp6TiW0BeiD7HxL2wIEGREqYdJGd641bnLeOYDWkav3/gVI891vYswOx9Q5
ClBIMWm2fMfwYKJnLZTdwTDTL6K174rmX3atwbMHXFQwjC8uKwp6lgN5FuFh218c
6Tmn4y7sEfAi69dOpSEeQ2nOB0uRrnvnQWmBcscCGrntrIsoAyxX8vmvBJ+B/vbD
NwX3Z7avWl972Id3CM40/Egb+VXfU0siiXkgeTxHolK73LlJc/NKITY7kfwfjvCF
iyAplBwqXrDb9jpaUAEMrwIOnLtOoM78dWD+jC6h+feiJmZrDnw=
=MW8m
-----END PGP SIGNATURE-----

--Sig_/2=xPuxFm3_nHc911sz5nd.d--

