Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DB23BEE91
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:20:00 +0200 (CEST)
Received: from localhost ([::1]:52884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1C9P-0003dn-E6
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1C5c-0005JV-EV; Wed, 07 Jul 2021 14:16:04 -0400
Received: from mout.web.de ([212.227.17.11]:58885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1C5a-0004r8-HF; Wed, 07 Jul 2021 14:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625681750;
 bh=Rx5u9MK2tSS321EcV50l/vFtq+lVgWxTO7jXhZSKIWE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=BM0T+I2aebuaF9pQLAIDmBhq7IRaTsGGzh2Loi9VA98u41kyehs3sBZDuO+iejtiP
 5ABBoWTzT7PbI6psgZnM9V3VvjYTjEe7sXDD6snUsicMF8tM7eOztQcbjpkBwOriBh
 yXG9FgadhIRYQm+bknHK5UnuELRhOfczjcSxWAII=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.194]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MSrYf-1lZJPU3eOD-00Rlx9; Wed, 07
 Jul 2021 20:15:50 +0200
Date: Wed, 7 Jul 2021 20:15:48 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 3/4] replication: Properly attach children
Message-ID: <c50f2ea294e2f08f7fc85f29182105ed944e9e7b.1625680555.git.lukasstraub2@web.de>
In-Reply-To: <cover.1625680555.git.lukasstraub2@web.de>
References: <cover.1625680555.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/stI/5VwA19fO2L7Fd1Urtpv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ikeZQw6WXgZ4UmytIpVUqFaNXHclrtJqsQ45/jypuIZRTAFzpUC
 MHpi2ouX1Njd9J6yNGlvVpzQ5gJKhcwYI/xybFLPMnXDsTVCjaiO87IKptOyWik/qafgWaG
 ur2dxekEPkPJlflH25xWlUWI+BGPDFuCbMKMnR9/Sg9sdPOdA6/j953+0VIaWLAcLqHaeZR
 0ZySo1fXt4FbDZIcLCU8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dLhuvWK5ltg=:EoYKJ6T+zynBaYs4dIC7ew
 MtignGvjv4i9ti+YvH9NdC3+LGNKtEGyHnpQC2D8JZowrLhZEbu6ZvckC0b8mGZyvxjY/5SY4
 IMKX/imrVtSl7WbET5ZQJrRrTBg0Gbhn8ESFQ43G4+tEnV/BeY4RhyP3ZtzZiQXlcalE+JSL3
 euBuyUWu7ZNXahSj0oBo6taUycze45N5Cva6ubjh/34qarGJ3al/bJ/tZYDKfwhKlvfr/DKQe
 4k9eVdxTQTDJmkKqQsnvJRJhK0iCeThO+fn7OmPaV0lldpyujjiVM8xMkoWitUa2Kb/wf8VEr
 ZUfOXDzHlJ8WSW9lNZYeFb4qrhsFGGc8442fxjqhhoaG/qWa9x9cAgVP1aBwVIDPyvDBBIE8t
 4vmMqzSyG1qy5mVk9jw1EGNorY8S0pDbUm3kcAIQFaHltkeQp9XpJPwjtzk4esCv6HAxwfxN7
 992Hf16fDnv5btT6CZd2VuJDhLDBEelNbc25oalRjWlW+NV1+Zw7SKfmvDFgREYNZQKJnLOFI
 Ilbumpxtv03xZr3gQhNJGOgvDMecqIGSlzyHZEHxtNY7pE+p8TOWvYIw1D1+AkR42/JPt7+dN
 GaL6WD3hmD19u7+3hAuagRkps66LlD7b2mbzgBEIyGeO4iciSMKebcQ9JZBB/CQkMLRwGALFy
 BXPe+FiSBL8MlvKhuHKZpX5WaeZwVfH90WC3n7RVkfH9CQuJWdGVVD3+4b/cA35sqQfENFrVX
 a/RxUMjni9Hjx4sVeBWHofhB9vHBpzsMyXvCc9g6275l8HMKJ7C5DynpX0BltThe+oRIeZmID
 a9fS8I8sthB6HzQCcLMfDdP+d4eM4/bLMlA76psVyo+BHDu/QeezDC3TLBf82MjM1S9IKxk43
 5CS2lNNbf9UD/1nxsEFM4CQXsjDJi2DcsITN6ZgCVQD3nJ/YI2tjUyUqobKQK3yCN9E3xv8Gs
 vLxixGR/3abcxEu3NkY4Fv+rEcZabd16p4us46dFtnilohvcd0OHR6CfZng303YtAhMu68t9t
 DUMewcxNqZIIAmFSqG0Wzx0CMlFSWT8Cw4UwK9mzKAUQQ/1K6tV7bHBhgJUk/Gy8FP1QUwXka
 NY/e8/3mZR3d+ZsMAbYo9nqf+nFgoJdfIpj
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
 qemu-block <qemu-block@nongnu.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/stI/5VwA19fO2L7Fd1Urtpv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The replication driver needs access to the children block-nodes of
it's child so it can issue bdrv_make_empty() and bdrv_co_pwritev()
to manage the replication. However, it does this by directly copying
the BdrvChilds, which is wrong.

Fix this by properly attaching the block-nodes with
bdrv_attach_child() and requesting the required permissions.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 block/replication.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 74adf30f54..c0d4a6c264 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -165,7 +165,12 @@ static void replication_child_perm(BlockDriverState *b=
s, BdrvChild *c,
                                    uint64_t perm, uint64_t shared,
                                    uint64_t *nperm, uint64_t *nshared)
 {
-    *nperm =3D BLK_PERM_CONSISTENT_READ;
+    if (role & BDRV_CHILD_PRIMARY) {
+        *nperm =3D BLK_PERM_CONSISTENT_READ;
+    } else {
+        *nperm =3D 0;
+    }
+
     if ((bs->open_flags & (BDRV_O_INACTIVE | BDRV_O_RDWR)) =3D=3D BDRV_O_R=
DWR) {
         *nperm |=3D BLK_PERM_WRITE;
     }
@@ -552,8 +557,25 @@ static void replication_start(ReplicationState *rs, Re=
plicationMode mode,
             return;
         }

-        s->hidden_disk =3D hidden_disk;
-        s->secondary_disk =3D secondary_disk;
+        bdrv_ref(hidden_disk->bs);
+        s->hidden_disk =3D bdrv_attach_child(bs, hidden_disk->bs, "hidden =
disk",
+                                           &child_of_bds, BDRV_CHILD_DATA,
+                                           &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            aio_context_release(aio_context);
+            return;
+        }
+
+        bdrv_ref(secondary_disk->bs);
+        s->secondary_disk =3D bdrv_attach_child(bs, secondary_disk->bs,
+                                              "secondary disk", &child_of_=
bds,
+                                              BDRV_CHILD_DATA, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            aio_context_release(aio_context);
+            return;
+        }

         /* start backup job now */
         error_setg(&s->blocker,
@@ -659,7 +681,9 @@ static void replication_done(void *opaque, int ret)
     if (ret =3D=3D 0) {
         s->stage =3D BLOCK_REPLICATION_DONE;

+        bdrv_unref_child(bs, s->secondary_disk);
         s->secondary_disk =3D NULL;
+        bdrv_unref_child(bs, s->hidden_disk);
         s->hidden_disk =3D NULL;
         s->error =3D 0;
     } else {
--
2.20.1


--Sig_/stI/5VwA19fO2L7Fd1Urtpv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDl71QACgkQNasLKJxd
sljL9hAAoaIpft95bKdTwxvLyA1o1cuUB7ddTY3J03nQzC80r+12PzLuIucmsOLk
Rw2JnMi9anSJHaeBI+0+ey1X0D0aojxYLoo98pL6qrUVnxgm3wqmnbyCueKrkkYG
VeyzFWfzDGm8wPh5DMz6YaedYLKz/T0QDEFVVyy0h2JuuWpD1t4KzMBa27aSv2LA
CTIxAt6ddDWfijb0foUOzHiqj/0uwLlZXt+hfZlADquOfkpjavxfjx1F6ZULoKl2
hHiNw8lCZieCxACsPZ2nZBMJw3rOXK+NTVqG6bKjuCaqBjH6i54e7l+vw8Wq6hSl
Kt7hO47IkGBm4rGNURjurdU3UZc+WNOYNOslz/bs025SLOofOjXOIN5APUJxjqS9
BcwK8ZkqfIpUOgat5X1a/8t+jgbvZfWgNFlFir6gSmaE9NslaQarvUsiLXm8WBI8
8j7BZD1+wDHVB5QQlH3ms2Vxu5mgm6rw8DIOgnLrb3Qxs53MWCOkAmiiX7im6j6u
4+nt3Pxuwa66l8LYOXqeoNUVua9xe4zRmfdcZVmG59labxQKXgubuCTjGr6qVX3M
aNPiK2mKDa02d2TiOXeYEv+7NmEd7TNOWValWPgBUa3kIi/RI5dY8iF5J/SiqcpH
EqoCN6c1BWoWcO2UnEKT4yJgA3L/kW6bQK0Mh9494yxo8O30cDQ=
=fG1E
-----END PGP SIGNATURE-----

--Sig_/stI/5VwA19fO2L7Fd1Urtpv--

