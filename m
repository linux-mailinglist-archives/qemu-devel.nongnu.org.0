Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896513BACC7
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 13:01:08 +0200 (CEST)
Received: from localhost ([::1]:47778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzzs3-00089U-Hf
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 07:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lzzo6-0001GK-BJ; Sun, 04 Jul 2021 06:57:02 -0400
Received: from mout.web.de ([212.227.17.11]:44205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lzzo4-0000cl-GZ; Sun, 04 Jul 2021 06:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625396213;
 bh=LWZpvcyNiB/NCEQ8HKotDfB9ZuFpZ+fgsxafrubFGVk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=TOBaLaCsndKKtNC+d72wjqFG1mRfGHaHqc12G98wiDwdNxD5i+jCVGmi7/7cTEbOQ
 J1yQF5kJK1+CNFwZFgO8u9IpRjlKCxSbjmkBShFixsUyiIXtgRNIMz/SDAmHbCWrG1
 AB6hjAirbLAZhiY0Nn2/XUZhi1A0Z9ndV+kxF3sk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.115]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MbTGt-1lSanU2gKP-00bqpp; Sun, 04
 Jul 2021 12:56:53 +0200
Date: Sun, 4 Jul 2021 12:56:43 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH resend] nbd: register yank function earlier
Message-ID: <20210704125643.69f303ca@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BiWKE9.wHOytr_fK6sa7Y2x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:TPYqI6FmA6TggCp6TzvctWZyfs346Mr90vpj/rbjaC7i9TAmDym
 pKKtMvUmwae2IXHi7B8QqSBGXhK8EkC1VbgtjCDGuaEzn28KI15mAHONl7V5Qzo/FhWb/Qn
 nJ7DJPu8uBMcXXWXkduziuiVbCJABtzEYzZqM2Fq+Sm9L4BxXsFOOCCnLpnc2q9k8kGAOfO
 Hn1zDNAiwN+vi3YF9RjIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WL417Bk2ff4=:8u31tosR86/azTr39N2gpG
 /o4dVssjawDCoIyYDw84GmFgun0bA2n12dOdL6uY1JBc7HSw1KNjfrpy/d0c9tC1C1BiGsgdc
 tCoJTki3wFYtQsMhTR3uKgdGxWVTNz84Qhor/pbHvtPlsTeG2cPE8pohy78SkzF12Wk9JOLRP
 3Xkec0Jqb3/fNwyrEvjSshWZc8CJe3ko16Sxg3BltzG00ZNnUg+/U4KVB3/fP1uoofPUqYXAo
 IAOn1xQpOm+M9kV2DhXLOTGpg652TxJQTQgzkStg/5TaXQpJViY/3doArKM9iFpiNr4OdcUua
 qteMUN2uxnLMEwyoLw810cMxYCdCeOisRR9G/4P37mJStpLftz2E3T+2kKhFb+lmVuY1EUre6
 Eju29y3gIrIXEHyLUpuENKXaU6ikO6mqqCgpUf7AmQEsIogEl+Yv+erj4rUd2MmU97CBsmr93
 +fKuWyLWYLpsxMSdtt3yAmUKQBl7kAA199VSo2OGF8dGOmI9xawZ1EMmAmUHshzIYIlDHCXtT
 EdCXCxhZis+kjQXd5puDqWFwLnzb3mz1VXZD3vm6j+0qgt/gNaqbGKyVVdV9wdwU+sIz9QGzf
 FT2ekaxtZKK/ROOleiVdqm9w4bDngxKWoH8v/93jvoV7Z/8CpdT0rjonJI1Q/Vtm74u8Jn0Fu
 PnfQym3E6TColT3RSYMGveUrPW2yw8I2SM1t1cAoc9c51UjjsWZLmsUem/Tx9ciAMr+eSyLR3
 QmGtMwSIzJu6xce18rntDsx3IgVmcCnGqjgujWUypCVkpalSqFRjycLv5ddTIvDx1k5kSG5Bm
 RCATJ5OeOlfwhpnbGdBBCTCcP1BgnDpbR466wSa88sYNOEEZsY6Z3Rci2hIMBsCxMhoujG25R
 4aWnnCmjnExLYMqo5fn/a53IF2xjfAKyZVbimVCo8jrV1Hlf/2g/vK9kz/Edy8G8LauCLZNIi
 Rm9qUN4M5/vSSCcm4lkYOSVGj3cwi3EO3Dcv5aNE4JXUTuFdNVC2amjUQReR3tQY8QnMPgy4T
 LTnE5kN94WJV0SXePEy/iMERGG7WrKWJJFRpJWywvuTLDjYi06jVltHKHboDU/a4wxt3K6P6K
 z/RBjJMuU6pLPKe7E1ZUK3f/nEJRzdpc9OQkJxoWe6fHAgs0aC5YOxZ1Q==
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/BiWKE9.wHOytr_fK6sa7Y2x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Although unlikely, qemu might hang in nbd_send_request().

Allow recovery in this case by registering the yank function before
calling it.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---

Fix CC: email address so the mailing list doesn't reject it.

 block/nbd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 601fccc5ba..f6ff1c4fb4 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -369,32 +369,34 @@ int coroutine_fn nbd_co_do_establish_connection(Block=
DriverState *bs,
     s->ioc =3D nbd_co_establish_connection(s->conn, &s->info, true, errp);
     if (!s->ioc) {
         return -ECONNREFUSED;
     }
=20
+    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_y=
ank,
+                           bs);
+
     ret =3D nbd_handle_updated_info(s->bs, NULL);
     if (ret < 0) {
         /*
          * We have connected, but must fail for other reasons.
          * Send NBD_CMD_DISC as a courtesy to the server.
          */
         NBDRequest request =3D { .type =3D NBD_CMD_DISC };
=20
         nbd_send_request(s->ioc, &request);
=20
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                 nbd_yank, bs);
         object_unref(OBJECT(s->ioc));
         s->ioc =3D NULL;
=20
         return ret;
     }
=20
     qio_channel_set_blocking(s->ioc, false, NULL);
     qio_channel_attach_aio_context(s->ioc, bdrv_get_aio_context(bs));
=20
-    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_y=
ank,
-                           bs);
-
     /* successfully connected */
     s->state =3D NBD_CLIENT_CONNECTED;
     qemu_co_queue_restart_all(&s->free_sema);
=20
     return 0;
--=20
2.32.0

--Sig_/BiWKE9.wHOytr_fK6sa7Y2x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDhk+sACgkQNasLKJxd
slhOQg/+Igx9MKmfmXniWh0eCmnn0Jxwbut9HS+jRy/cCxnTSRttEclqykL/EsXE
DDPYRlQsHPp+2+QBGTBRIeh3omWIe/e12lkiMcbbbpKTZVKnJ8u91fUTsANlxSIU
kRCqT7MR7Z/QwwnvD6+3bPIfut7WPMZgnnOdGt1pZQQGrvDtX7eTsNPo62KBWp3j
NHTGm+zx65pAjMMme7bFqrEV35xUnbcUzwpJug2quOPvMKrO4hr41rk20p2OWlFH
9FskGbENocKimyep0wxoG3V/8ZJh9Vf7DtSIgJwPnxEdqoLCnMXjLWsZWkHW4zUv
iUQXqa+rskdMUpi2QTfymYrcW0vZEEi1SP17kpzdeMDPLGcWigxTkdakT4gdqpMJ
I+kyH8E6jzN8HTod6jd2boRi9A02XD0pl+TFetfIE9pd8fGWBqZSqnbv/31NQ4x0
B3zUqG/ZnsQ2UYWfUYUy9sVDrgzm1uC6ZbU0GplAoBHaxzuUKfGZGpVIm5tdfiE0
prpRtE9r+BF8VZHe+IHK541rWCeAF5g2lx2iz6F6uXBbAD6B08izRyzKP61bRmGj
nLm4E9F7419NUXBfuEs21vxjRHuIBT42ot77VvzdDHDm8hoS0JWYCV2BRhJnMhj0
cqcNjy4iEuAY6TZ3JS5vhOGjiaB8hMRNwTf+0EH3tO5nL7I3QkE=
=CVH4
-----END PGP SIGNATURE-----

--Sig_/BiWKE9.wHOytr_fK6sa7Y2x--

