Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E434498E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:46:48 +0100 (CET)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMlT-00053Q-MC
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMge-0000Mj-3E
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:49 -0400
Received: from mout.web.de ([217.72.192.78]:40069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMgV-0005En-Hs
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616427692;
 bh=L0ltj/xPM+GfqShAW2BRzGcukYQkjtL8g+z+vrC2mSs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=F9XSbMm52JRPR96DiU92HSRFPsHG96Q7E6a8jpOx3rKpynYggSScCNBjs8M89HK0S
 outSSbzVTit7T/e7ISu5pxCSDaZzpaZo3zrDJhtJZM0ml9cK9MUXiSO3Mti2w9CCCv
 53waQ1HQa6b83YHlM3ESqMa6v2PmUNZLZWNYYirw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.232]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LqDQS-1lt0Xc326i-00djuf; Mon, 22
 Mar 2021 16:41:32 +0100
Date: Mon, 22 Mar 2021 16:41:31 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v2 4/5] chardev/char.c: Always pass id to chardev_new
Message-ID: <3ecfe359056401c1c986949a00cdb5951aab06da.1616427054.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616427054.git.lukasstraub2@web.de>
References: <cover.1616427054.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hfmc=Pst+OVZltXWVk=YOxn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:C5gVK/GUUTcEEcOA+1kHvBcsP/zVagWVo42r5nU/yQmQA428WDV
 YpSZV6/5OFvZrtXcL74/KghhW+aoNZrFwhWbn6/rdqrse8iabgYSZNxGvEWYG6YI1VPeHyP
 C4wNljXdc0A8/lgkzs+IWaTANOXYKRrzOEQB/yGfPuArJ23GSs84Ng4hwOy26wSyWNQJslx
 7XD5woGwrHVbPP+8VAcqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TUkqUaRY2H4=:odrNsvJqHeGYXiUXttlNIV
 5nINf4O6TQ5HxBzdBfS64KFHPAO781k+z9tb5lMTRtvyg7GDN1I+COt8uNOAbGCQfLiePFOw/
 Pb8K7+p59atBBOh4zeVIC6K2XDUjvx+yMt8Jd3xhfU/XNK+rdEjEyn9gCZdk+DG9ZPybRHvFy
 h2u0KpY94CcRRFSRxZoN255Xgc62+1CNUlbKS41dAqsbrLULnvMr8JCtP/Fkv7fi9hfpDv0Ep
 5LHYsyF6xCQukmVLJxbuYQB8S2KJsSNEkqOHEC9nADK051oTVJelcUV0Vr5+NJeJdGJzPFwyQ
 qTqO8jy4V8VUbQyXxOHR07jUup9ZKZIh48Gau5H0vfjsPn85fhPLghJ108bOmcldhrtlZOqzB
 nXxPLglrRMDAEHIGvP0Kovv7joN9VKpu4pYyVBksGp2dr/ETYKAohpmYBoTHyiwLZEBS66HsA
 pKX3Tcyq24dcNbRZ6OG9qDBGVxvq870q9aLJtQ0Bf5gN1KPosmHd1Wbft3TuXVVU3Ff0aKhSb
 rXNLXDLAaT9usE3Yf2Fg57hjK0v6PmOeAfU0m5gi01i/UcvaUG5OFugNmxxgL3teeawPDFN0I
 IWHPVKRt7/OdEbOzm/Huv68kk5tDrSGl3qAJSrMWn9Q5jNp2gclcTMWSDY8eef2PxQ/QPhXWZ
 mXPyX31nNay25BXB4vqDexP/Vrz3260jF3zHwH9+kjdtVylJvaVZOpzo5EGNEnkiKUoWEig+Z
 USVqZTeaRs3ZgPJXlC40j6Sb1gqBr1oyI0cUl+0o7ArF5BGaPLYRgBqGacZ6z8a2PTNQZbGj9
 6CS8L4skWbos/GkFyiMtoq1i233sMtKzeqovzi3ad68TRUMSSRe6k/BUjlb8H5rGUGZPMOpbB
 cmsEGYXsMdQKANNZ9v6A==
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

--Sig_/Hfmc=Pst+OVZltXWVk=YOxn
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
index 1584865027..ad416c0714 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -964,6 +964,7 @@ static Chardev *chardev_new(const char *id, const char =
*typename,
     bool be_opened =3D true;

     assert(g_str_has_prefix(typename, "chardev-"));
+    assert(id);

     obj =3D object_new(typename);
     chr =3D CHARDEV(obj);
@@ -1092,12 +1093,11 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
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


--Sig_/Hfmc=Pst+OVZltXWVk=YOxn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBYuqsACgkQNasLKJxd
slgL5BAAoKxzPuo1BP3t5tckgorz5SS5ql6eVDdx+pX8PtGTTLr064JnZus9PixO
Ynnceuli/9HP5PgWAxlfYWkqo3/EJAcJAmIZqW4z1tKWnDbGBt6fqD+Fz0aYfXXv
fMVpvUPNKgHNqId+K0ApHEe8cSU9Mf5S+j6pbIuMxn7w6UzYou4WUoej9st2Uwpa
aRj9lcU6gthsRNYCdLB56xS0Wvk7j/kQbRt6ovsYxYSMimM7eDsfFmxala9X67d6
OX/FMSlaYfIwi0xpFrj2G+ALm/x1R0iLMPSUEyZKj3/BovfMhjFlNTnZc+UNQOq7
1PdpJyUdzhZQCUEGhqZIBOsTdy5GjWhuwweekneKX1u55KXNK0pRW4pvWwsK9JSC
hY/2nrzjMBW86jBjNTdF/A7GyAKSWIYQfFqhSeFYWPK5cVcJ6zol6UQbQzHGx3St
ELhR5h/aeYDRjzfo34aqLU69Qnwdwn00x5U2YP+AxdS3IF86U+khyV1yk82yXO4H
AAt6/kzsDCe0gyYoir/Pw59QHihQY9LAxswCgQTm1dQKAJrRDzkeB0RUvKrkZ2oC
LKjKKlw9Wegog0JW3j2jfBmHdCFMBW8KDMSdD5EaAA6/HyjVcD5smRPzSsjSds9s
+CTRQ6LiXfZXxDkIXe0XQx0EwJEaKAJ865FaTC+UzdifV3tZHho=
=JRyi
-----END PGP SIGNATURE-----

--Sig_/Hfmc=Pst+OVZltXWVk=YOxn--

