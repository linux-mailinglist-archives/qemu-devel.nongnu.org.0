Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330073C3F59
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:01:05 +0200 (CEST)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gZU-0005Xm-6c
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2gUj-00074U-Bf; Sun, 11 Jul 2021 16:56:09 -0400
Received: from mout.web.de ([212.227.17.12]:45719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2gUg-00059h-Qx; Sun, 11 Jul 2021 16:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626036956;
 bh=1CyQhAyjZy9LKblChQKEHzEaXA2rG7Ry5mkVRG6fGCw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=tCo10HmuGyOd3eKacU/qudTpCjIRA9NXL9CfZitw81NRLZiHDtDpZsnIUMDXGwHb6
 obXgtUQGry+O8i3XCeW03slAo2JQ6n3tvW24KF7vBP2BtM+r772jssNDMskRuFYpAL
 cHICdBPyRKYkOGfVsqNJvnB+JQwbz3HlhXpZ4VyE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.236]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnX5T-1lLgm90bw5-00jcbR; Sun, 11
 Jul 2021 22:55:56 +0200
Date: Sun, 11 Jul 2021 22:55:54 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 4/4] replication: Remove workaround
Message-ID: <97b80632101e468607e82739bf126d64f441b219.1626036515.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626036515.git.lukasstraub2@web.de>
References: <cover.1626036515.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nGLR.0jM_FROlhmbQPA=7Zl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:80lgmErf6I1MoOk14D0CtUHtRU2OFRCDiRXzIeqIp7n5iEVZ7NG
 r8upWkgoIXAppEY2AzP0jjofsxOsgLwqPG6pv2vk4AQShAgtPyEl2oa782J9keUmsr4J4il
 SUPjXPVaJ/z966Ixtnm3LPKzQ3xP1B8LBqeBni3a4qsRFL3LX8gCc0v7Z6Hq8OFotTQF1Id
 hv1/m6yrtAvDWLeAWQuHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g0yI19AgsfA=:Pq4jZWwjdMKb/q1B7A4n0J
 VNhtpsYSwHePoKrNLipCtmOGvoMp8pLemi0UIa3kuDhpqumyrsbwJCvJg8y19mMMpFyPjIAxi
 OVnZHYpSwzf0mn+2AdM/jCl8KGIq95NKTCkqP+lj6K3sYqdsum0BV6RIhuPgPiTK+aJ6XNWB/
 KrFEdIjxzK+6q7DIL8yTWtbB52UWovKJpugldW5gC075Zvfuoky1TJc2VvOJmRPmORuTdb1DI
 NR6j25q7qMZ3LXI+MqzmqdZ2wHg7BpR7+X/sVP0/awAoJcscWCwOgMC0Qhzxa0kg6EyCRm5NW
 bQL18x2S83aCju8KwGuk0s7Ue/DikRTyYgAWaiLNIgRJEJxdF2pbuqccw7M9760kcqMzPreMO
 wQvNrEedGYPfL+Gh5NY6SqL1LJUDjTH2LUNu/8jUxSPxF5h8y8639xGkE5k+P/8iojo0Av3Mt
 dtbbHr+ldMoKXMnVCI96UekCTC57nDsiRX6y251QLzCNeyMBLonL+Zn+N0o03tXVH9dgh6Ni8
 5FPWyQ1xpKNfseEJfwnMWrpGPpms3geaIu7Z+qqtZDn3jQb97q6+KJUA/WyBvWDAvbbeu/VE8
 HvXsoZcEXBPPCfPO9HMMaRqrOgGVHSNBinszTn1Hk60mT/ralfXlPT+0JPn8CprdYi9kn+ad/
 p59xu0TRELmZjWBc9uabXLyt8IuM5kFSwAWHX+cH/cMjPhllNpMqEJQX9y+h6GlzzwWVsWp6f
 NuYhWgVfFgGAxiOdX1PXjO3w0+axEUBQ+aUfRMD+7HhQbYYH7QycraiPJMQ5tzPwanqZIV8j3
 DMPAwFI6Dt8zKYRG2CUuTVMOGXHJm7vxr2C01Fk2bYF6WDbzugG07H2g0tO1SmtE4YiVkD+3o
 qonbEuUZnVaSiuoBfMaCGF2M4hvHPtewfigLKZyYHhw02prlXnrJO9uubvtAQj23wl/EJ+gvC
 7CGH93bFHp7+eLMpvrY+vFtHELdaWPUANVXAn4qC7vkyD2o4MAh+4Td3LREV9AmYr45EwDiMl
 yB5ZnqfVqVOfcXPDC5uiTeSEQALfxXqdgSeBaQyIPyqN+RmlO+Tt6bpEs23/dWwdq7XAOdWSk
 RsqT/9PqVa1tnEPiu+vKE7qNKuW09vfgDkM
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/nGLR.0jM_FROlhmbQPA=7Zl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Remove the workaround introduced in commit
6ecbc6c52672db5c13805735ca02784879ce8285
"replication: Avoid blk_make_empty() on read-only child".

It is not needed anymore since s->hidden_disk is guaranteed to be
writable when secondary_do_checkpoint() runs. Because replication_start(),
_do_checkpoint() and _stop() are only called by COLO migration code
and COLO-migration activates all disks via bdrv_invalidate_cache_all()
before it calls these functions.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 block/replication.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index b74192f795..32444b9a8f 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -346,17 +346,7 @@ static void secondary_do_checkpoint(BlockDriverState *=
bs, Error **errp)
         return;
     }

-    BlockBackend *blk =3D blk_new(qemu_get_current_aio_context(),
-                                BLK_PERM_WRITE, BLK_PERM_ALL);
-    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        blk_unref(blk);
-        return;
-    }
-
-    ret =3D blk_make_empty(blk, errp);
-    blk_unref(blk);
+    ret =3D bdrv_make_empty(s->hidden_disk, errp);
     if (ret < 0) {
         return;
     }
--
2.20.1

--Sig_/nGLR.0jM_FROlhmbQPA=7Zl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDrWtoACgkQNasLKJxd
sljFFA//XqFOtFj0vBmofQg4y62f6Vp0llLE2+itkb9x+hWxVcnALbjEqxCgttZy
V6GQ5AprX41/DB6m47ABu2omUV5NSgBDzCB+h5zphyvCrFdrDPKFu6qVdQsrW8aC
FeKmar7AuWEjhjoNle/EtM5RtPDycs984R+gFyskwWCDJwAx7WPmbIDXCU/wJWgz
+sLPeENhcjZvxRHZU+ZO+NW+aAdyQ3TPdr6Sm0sYoQ7qEuqVk5dOzvOLCSNfwFZP
FYC69Qb+2pEs9oQyOcUnJA7scKXS5puJ/M7L9Mqh6Rsno5DhdWyJvwBkGlVuK1Pa
G1ZzupGWsa5eLvL5aiwmqQf/CueDzNtTToqKDefUpqfOSGuhPZgsWSZB8WkTavCH
n2oLU3z4TxLyVkklu4Tvs8O+fuHcYRIZD99z2jzgSg4wqI6V9N5rkiN81Yi8Q+Xh
Hhnh6JcVTYRqm0aZW0wtMvW+VUKvdFsi6BTGqvMXOpWmTkSje8zsKQIw+jsgk50Y
Q/4iu3wUqSBs/gTYQsgrJCnxVS1eiyGolZmfJ1eyWyOU0CRSoEmL1yt3m90NX5jV
si+K4P3bAZyZRM9UpZrhRkcrFPWSdN+WdVr/19YRTA3mvRRh8n8M6FhU7p4oOu7o
qM97OEn/Xce0lqvkbfY2RKVk6QDdsCSogCoJS6rnBqBuHSQkC0Y=
=ty8J
-----END PGP SIGNATURE-----

--Sig_/nGLR.0jM_FROlhmbQPA=7Zl--

