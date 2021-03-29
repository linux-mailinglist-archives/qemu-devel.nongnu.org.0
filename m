Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633E134D7B1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 21:00:27 +0200 (CEST)
Received: from localhost ([::1]:32842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQx7i-0007rc-Cm
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 15:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQx3b-00047q-PO
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:56:11 -0400
Received: from mout.web.de ([212.227.15.3]:46089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQx3K-0001Wx-9a
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617044150;
 bh=XE/hPgaLWkL1KNO6Xt3is37V6Zr1ybJs0A2eQp9QpGA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=S9aQxfZf3Bpwo1YOKxDS2zkualaxHp7lNohOWnvVAK2YMPKDevHjM3CRDPwjJlP1J
 IMA+DjitspozX3SgEx/ArbU9QXG1nHPBliE3nmDvrWVES94dXFdw/8jVymDxE6SDLO
 5q1rwM4awlxkKT9Qmd1xncZO/Cz8NOCBUlAAe9nE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MS1xS-1l2FBs0Hk2-00T9fY; Mon, 29
 Mar 2021 20:55:50 +0200
Date: Mon, 29 Mar 2021 20:55:48 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v7 2/4] chardev/char.c: Always pass id to chardev_new
Message-ID: <3e669b6c160aa7278e37c4d95e0445574f96c7b7.1617043998.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617043998.git.lukasstraub2@web.de>
References: <cover.1617043998.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/grzVZpCZus86LE_RQqMimSk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:xJJ5NnVLqYC+0075Tq8mhZmpHEO8Op46JdWjLwO/iEaRvTsh9fD
 Baf1YUdAy+pEC/4kjhqS2WHBe4ItyDdf12j5bfjh3SxbGm7P8KN+I3OI6PcugUo0GS+BiD9
 4nnOV2iJNkYlUrSm635MZBnJVIRHpwXkmv2uOHdDHOCUckSFjytqatRAnWzVmceJLwigq59
 KUS457ormFhcLikEYeRVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KgHUdfjLTfs=:Y0ticQJCafAon/HtTpr36W
 J5VikKX307SC0Csbw3+IIVs6x6AKGWD03EDP9YgxuH+fvgMJXXdoFvIoOO6+03finy9wiwXD2
 4VBhbe8Kjd0Vdg9DMF2hPjZdLP2TQzT4NwB+b5KRvKPnjAlopVLe5tsaHhVCzjdPWzGCFzcxA
 YVTlbL7KfJVqwjcR/zehm7pIQ+xkR1y47SYU9hOT6qurEB2Tc1HO+0hbqs9JMelOtxt1Hz6Sh
 s8BFxyrP4Q7S8J8R1UeV1RuiyWUqKnOeOxCY9v2ntBK6yCI+7IhtNwhBjCSC0U2YbB/anDe7N
 PPqga4VZoFyMSHs37hASuuh4jLgSgFgZGKi99QamdzOqZCbKmklg3/DldslTwD1d1EU988uxg
 2hMcUxkLBFopBpoviVz/eCygeRQ/JTuCan6W9NpPFJeIeWXtsbKQQ7YZN8MLdJSAx7ulqNT+A
 CpRBVGF9nV9BvsMNquPesvvWCNPZysvvry8Y6JFBx9mv0IrpG35h65soxg1+Stw8XR5neT0A2
 YlfHEQQJDUITbu8/ybn1S4pHMoC9a6M7L9glDsr5DvbQuXGdrI0jONKVBb5un+vcknIY9x0rP
 4+l+3E6ZH9aIFn0rvB89A8dPbKbjGoC2H3sMWhnPj+UvVPQe/hfHzTvT53/TXk87TPau6MLe9
 mPjhs4jaec2X+EPtTAWafSi9hjw+Xj6rOIN4xNfnutWHjYGQGYvzS3WqJ6QdCPMq8+nOt5fj4
 DEqCUi9SmvaePxa4T4ij9dMUuUArxau2vG1KvU2gdyEo5iIBS1Y2VowOP7oKumcys5fW51JBk
 +gX19cqU3FVdtIEJl1XQGich5765UnnUU9myOBTM0w4kpVy1FI+fBhO+K4/isbjQUHnbwhL2c
 oPbmPA9pR2AHZNUx2mxE2VmF1WbLL6YG6MRiPssOn3IlUmcSdYfNqOZ0ONySCT1mxcXceqC3Z
 MSGNBFXl8bRCje0/nRg1Nd9Nojr7lGgQZTnOKR0AXSlrHoC0vq9BEYJ7PQZFUuxETH0EYKwAR
 QnZWV5v5yV5JCB/EZLUVN9+yMvu4Uyb2U2bxfpF3K7eccEEm1CSCUFXj7dLRSfXIw1ycanhKC
 quFf8K3rFgCSfriRopSTP2NYRv97nEp3lOgOSp+Cv4O8i3f1R1GI9PYjB6mbnZ6Kw/028r1od
 RKg2xqJtfgVcoI80d5MIPxgE6YHy2tmTRlLWx/9sr2Wgwu+MDOCOCBBbwcg5Smd84x+MI=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--Sig_/grzVZpCZus86LE_RQqMimSk
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


--Sig_/grzVZpCZus86LE_RQqMimSk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBiIrQACgkQNasLKJxd
slgemQ//exZ1NYzrDZ1GgFU4hCEd5fPBIbmcMZi/VfvACpntQ4eliXXO7CPsNPG+
27B/SsuXly+FbUukwI6yQVq7914dVqYK8FO7qJ/G66Hj81dNVPV5HR3lL2v0gwwm
D5Y+STIjNWaKeIlgWEKNcPRZyadNTv5OYmnAuzFgqMBdJEuiAGJYxSkX+4BAGgCd
gxAa+E46+slVotAm7fD6DYiFwuzyHrbqWHQIJNDctqS3o8M7TAJse+u5/DF/BWcz
iqpzIZ/wxpZ2D2Znc8V62Gn25IC/QCcmTRpQ2O376aMx/ZSx77OVR+4CXqyI6Gig
PMg4k7IRKwil0+WSficrN8Y8iNvMpty3WPMB49fzitYlvLctk7S7BMraMmOpKlPB
zWa4v9khyBewzYOxyHT9yePkvQUhlhSHozy9In0X+f2ZKFLGvI1JHtKsjtzL41FZ
3aXzO9sUqD4iZF9IsGE8+O3/DqGWNFLchGfFHIADPnLn3aGYZHaj0/UDtCoIvNZx
w8KhItHLqyLaCWRNG8axAxA5zkxByrmBgvjRKpA61zLG2dHV4Sc2e9Xajf2eJC0H
gEs8A8SlOrdRsMovpyZ8MQWr/aNoBNftsrqm5hYfUsBaY2p7oF+GZoyzs5MURhH8
oryvEXMf8E4j/5EG2B21D0q8euPfI63z/FhxSnggUY+a+7DGPII=
=T3q8
-----END PGP SIGNATURE-----

--Sig_/grzVZpCZus86LE_RQqMimSk--

