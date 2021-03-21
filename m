Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F553435C9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 00:36:05 +0100 (CET)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO7c4-0003LH-Uz
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 19:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7YC-0008BO-GK
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:32:04 -0400
Received: from mout.web.de ([212.227.17.11]:57431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7YA-0000KC-S2
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616369518;
 bh=/CQzRMKhJDxrhta8zXxxjDrA9hXcSEfYPXhsm1MQFlc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Mce/Ua3qGFBT0DShy0fvB8jH3M1B78hvnZBralvGKBvco/3CGqbd/h5osSqjnDhpX
 fFzLLXeHoi5CYQgSCudAVgu9mGcMsN9BhsCpXy9wXUvf/DcXeNE9LElKNcrE+vHqLq
 bJozCVi6pnLcgbTkdpMcBHBYjGe0//YVaw+OjEe8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.131]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Le4Po-1m2hcY1lng-00pvEv; Mon, 22
 Mar 2021 00:31:58 +0100
Date: Mon, 22 Mar 2021 00:31:57 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 4/5] chardev/char.c: Always pass id to chardev_new
Message-ID: <a378d9426980c97a5cbbf2e72815f366c158ef71.1616368879.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616368879.git.lukasstraub2@web.de>
References: <cover.1616368879.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nRBaFJWbg3e0zv2H3M=H/n_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:N4LwLlL46OHDs6JuU8sO7Mw9Sn67CdlyRTUo3coUcSVo1lzyoLR
 J9IKeTnLVkqoeuNPlnrNDtIUuSFCFuhsLkAwCd603GnuXM/QNfvSTs4uYU4iEu/6oFj/0s3
 ETzSDK6NAFmIkuYlMqMse0JBzTKHERXuUJ0cRMqmPeGm4qN++rQlk3N14TERKXA6f8OSVG0
 FpFor3pH1ORYbyH/HasTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KaivfXGRMLU=:VSHuqhj4JGCKT//wfhssI2
 YDU+7TLyauC0rPkgr82H8fAXy8SFJO0Ggbt7xljzjq3dM81n2GZfpxfjRWUK8MmkgwrjierQp
 tMTwXdQok3fA9ED1Iz6fvrd6Z51K0t1NVHmZjC83OQ1Z57aME+WPeMlyfLjg6CvwORpgwVGl1
 TPvRDJjxmUFevmyEvDz/SH5mgVi+Jz4k9+tHlRENPzP+UyxjsqZy9lKzU9pxrkO1I/Uj+rpzh
 0IebtwYLeT2H/bMwRZtC3TVjyJ1FAgknUUFt2hHHStHI0eWd0KrS7a/Bp1RYRCq89bnjNqOrZ
 Q1JGSnJm4Jb2rznjQ9VbMPCitoPNNK3fJTHs/c7dwV8HNawQTgcJ4/FGs5U/F1lpNzPp0o9pV
 BMB+jQdaPWHDolhWIcVn8krPdVYF6yA3MWz4/9Xd/ZjEB4yQ/jBynow4IQahsFafKiG3tsepl
 Z7a7cjf9wV0mZr0Dn193OjEdVKJ6Eiv5NDs/SLVQdtvO8c57H6vj4BsuNwCENcMrJZFqFVc6D
 i15U/h/ed3BdDNkTWo9cKVAesZG6F3rJ7sgN0Ui9iotkcVLQzK2x2KwKW7BMJUtTx43tZhFNs
 UXQLBJBCh1cBt9bo7MpXA2hhF3l/evKRTZm1kUMFMKKJxPl5cxl0EsCJjRc5/A5OuKqo4ileW
 KmLByFebXMAINzQEVp4cMEIsFckD2Qhit0VMcpPxNAQfoblKq2wnTBaRkQ/pFO89qiRuLewjc
 JmVUiPnK4fl3wVYdiOgly5Wv5dn05VipccCmgE76vB5hCheHVnL1+OZaTqZ9XmojZ0eVUfqbd
 6wkq9yNGjJmr523drbTrupNDY1OQ5nnr1PdyiEov0PR2CB0bEnmTQwsAYl09g0Wd4W94MwxLp
 92EFQNoF0CjE7dq+fdMDDseV3UMEMJA9yvFoMbFLuV0Eh01066vdEApSqI+Xxrjes8tFFjh9T
 sXauzyVwH6CkdC062Ac7BRGmXBmKmpK1YpdU4VT3QCVmc05BJ9SUDDfLkVNZ2Drqo33KoR/AB
 oSALj5ZK2BwsMUir2Al+jPj9p4C/9ZVHg+d8UF4XfpD7TPoYYWEonT4gzU1bgKkdG1cBY/LC1
 vnKlqs65JGUnH44R67Bae0yTku+9eg7vxxGM320/ngP5IIx8DgBQUzjzWxmoCWt9WhcndDjY1
 ZcClqU6IhNd6A1i+MbDNNBmWMBsGf1AoVO+UOX0iki2mttCqU4xOBsmBdDkVd2zE5BT2oouaZ
 7fWkTciK6YfSbzmpr3g0KY97aswBCN/Tv2c4spA==
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

--Sig_/nRBaFJWbg3e0zv2H3M=H/n_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Always pass the id to chardev_new, since it is needed to register
the yank instance for the chardev. Also, after checking that
nothing calls chardev_new with id=3DNULL, assert() that id!=3DNULL.

This fixes a crash when using chardev-change to change a chardev
to chardev-socket, which attempts to register a yank instance.
This in turn tries to dereference the NULL-pointer.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
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


--Sig_/nRBaFJWbg3e0zv2H3M=H/n_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBX120ACgkQNasLKJxd
sli+Mw/+P+01gQTG7dNYqTdEQ7qzL/cEcENavhDgsBDwm6o2GJivwViyZF9+v9TT
BME9+gxAOTMYlfmW2+yrzLLwxyJr2FJ+PwQYA3sKyHFCJR1aDR/dn0dPraHSy5i6
gDsnEMxKaibZPZpJe1HcNvcHKrYTwF5Y1QGrvviH1Kt/2r63GJFOJzEOsO6hJA7E
RJFfBHEg69CLPKplcGY06nZ0nnhFc3cT189FEPTZ3wtfsaYy8y7jviGbeT2U4Er5
zOLyeeMIz5RDLej9iX/pZJB11hOpaNI7UVi7VHVuAj/7t+r4rgUHOseoqfYo0aiE
8FpCcRpmADENn45HoIB9mJb+hW+D2Hj3p2u2mKMTM41SQiIjparHek8t8oryFKXA
KC/4RgrkfNrG6HImq+ImYHPFdvZKjqd9Nr46Lj3uVnFUUIbBdH0DwmeUlxm4mtHN
/Uro2K5S3uHh93uW62be8jFj/xx7YAuGsmhvg+lxpgmv6uzEWgYmpDMRsdcZdIW7
05az6+UcaY61c0UAYH9SVZBmDKbQpg0PyHzjXQfgN709ZadvXXMxIdgxS7H4GKAD
NlQWtfuXjROQzboeiCGfi/xLvYXa2+AMs9Sm9sgsd9IcTz8eL8BAIvRNzjvLa8IL
h7ERO5WvuevOGHoORS8le5DqaMd32AQWdpa3Osh+mE7p/HnCl9g=
=DtBq
-----END PGP SIGNATURE-----

--Sig_/nRBaFJWbg3e0zv2H3M=H/n_--

