Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A386A3871FA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:35:14 +0200 (CEST)
Received: from localhost ([::1]:41398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1litJx-0004BR-MY
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1litIw-0002Xq-FG; Tue, 18 May 2021 02:34:10 -0400
Received: from mout.web.de ([212.227.17.11]:47943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1litIu-00012B-Cb; Tue, 18 May 2021 02:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1621319630;
 bh=jIWIVxVsOFeoad4WFWL771vATzXBmXUYFOByQIeFgfM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=NkOWoEmwm2DaKwyDb8XWAQ55x9mZQsHavA1HefHu/NsOuHmlfMEOyS0NKGqXngGxE
 sEXkL5pKicCxrGaDGDm0qqtBorUiBiHg4EQJ7+/8pCpd9J9kPukZ5/5KXRFkkamtZ9
 z+hVeQExOtPhUgFJytYTQ1LM+5xpBttv2JB+tVJ0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.210]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M608n-1lodWv0Eep-007XNd; Tue, 18
 May 2021 08:33:50 +0200
Date: Tue, 18 May 2021 08:33:37 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [RFC PATCH] block/io.c: Flush parent for quorum in generic code
Message-ID: <20210518083337.3308b069@gecko.fritz.box>
In-Reply-To: <20210512074957.763711-1-chen.zhang@intel.com>
References: <20210512074957.763711-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EAbKpT9=QoB0R41yo9mvxon";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:U9t0syTr3gCquzi3lzSlEe1bJ+mbhWo8W8LOEAPpi8NNBDtyU2U
 kN1VO5O4ZWjSZjge8rLWqBHksFrvwvOzNvRUfnPf0HRnVJtfqNMLGJke502wOfHmTzYA8Zm
 n5KuTfQLtp7oG2U76pxRi/UpeeqXB2TxzRlVzuQVMaYU04AYXQHnfKnA4jM84UmEEWE6wum
 KI8W1rEOBboL5J6gQ3cpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ES1w6WfFMiM=:x6lENgszqbQbUWCFXqOdAY
 x9QWGVmc/yz6u24+lfchV9JD7IhsKTFRRW++4MP6RmxF/lS6qyFQm50vLOxYn3PQB2mKeNSph
 UQDQGcbUCCk2Z+YQEBbYHnwqblOcDnjar174WTyDu8AEL1Hxqfkwz14uEmVMq9sPiXaXsvPs+
 IIGtG9/qz4Z/8R7U6q/rX095RCsGHP87yEQIE8t1hi6CORsFvf0CKZzSvETZS/4/9CnRFSc+O
 pHssxv0sIgPUtBi5nGHssQ6zBWEeATC35eeRQNpkoSadhS5EinwwVwCluKZmlWdT9bmoAmkj+
 DOP8f0o7YXbZgO0LXjP2/xxpY81nakjR3BvV8tTfJUJJV59SBVvfss4/G0w529k5MFihro1TG
 sgsaFlyc/IVrTFGSmiSN/kKS00+pNmriZMhQuqxY1gIJpzgsCAyQkyRXA2x9nZ8R7O2LwB2zP
 fvf0jC8+ECMzHvB+W0yGMe2XQAPdFWRl1H1xBKom+a15Xr4GCnR0VdjsYCaBf0k/sXBXdtM+O
 6dAoeKzvg4w5dG8Y7DrOSYMcovxwqaEW5H107ILfHWUA4jg/0uBtrb0PDuo253RT2HljcJWr1
 XdUKrs5xUkKLHcpkEKT6fcPNCIh+mcszuJh6lXQc9nxHvLXMkDXEjWLh+wzV5QiLZt+gf+eQv
 3u2mj8XGwQL+nlCivwCdFGaxc66ArEET6k8VxmHjAN4MMWHT8ZJ3DUC2pQ3REKcJxnP0YatUe
 A1X28FuOUUMqgDnoQ67IDs4kbBWjlPvVyC9PJhh/TwdVY0pMxd/BiE3/nvtmkV9m5gGeDKhWr
 SSZDru3EpobO7COg9lMlUamx+coy07D81Q0h4AvDJmb2gH7mtv+1HL8XCZw5j+r+WrqdwopLk
 QZ3v1L9QZqpjhrGm0Wn8ED3Mi/+bpwoThv7VNe0B2ohTiEjAUO9e9ovivks7kmq/Bn8oJ5mcS
 yJXTJyKmXbftBhY2pPFSxwnAiUmDdl66RocMh4VE8yqfM/RWYsWlXBd5JdKytgg3pezIQGGRp
 l/T4U5XlRZd/S2EntG1dJR+LCs4Su8uhhnoQ8vVF3YPt91blUK26aNlabjgjTJxe17xHJVMLy
 E8Hnhe7dNEkpuCshhuCyYZ/VJz52T1srmJmkLQg5CIZxoU38NCnjvYK3wXvVr99I1Tm6LS4Bu
 UVSwM5WkN9SDHq+Ng30hcYA7zoCPG05MRr/9W0ulmWimdzXLOhIikUBTWuFONJIJ0CUHY=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block <qemu-block@nongnu.org>, qemu-dev <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>, Minghao Yuan <meeho@qq.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/EAbKpT9=QoB0R41yo9mvxon
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 May 2021 15:49:57 +0800
Zhang Chen <chen.zhang@intel.com> wrote:

> Fix the issue from this patch:
> [PATCH] block: Flush all children in generic code
> From 883833e29cb800b4d92b5d4736252f4004885191
>=20
> Quorum driver do not have the primary child.
> It will caused guest block flush issue when use quorum and NBD.
> The vm guest flushes failed=EF=BC=8Cand then guest filesystem is shutdown.

Hi,
I think the problem is rather that the quorum driver provides
.bdrv_co_flush_to_disk (which predates .bdrv_co_flush) instead of
.bdrv_co_flush. Can you try with the following patch instead?

diff --git a/block/quorum.c b/block/quorum.c
index cfc1436abb..f2c0805000 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1279,7 +1279,7 @@ static BlockDriver bdrv_quorum =3D {
     .bdrv_dirname                       =3D quorum_dirname,
     .bdrv_co_block_status               =3D quorum_co_block_status,
=20
-    .bdrv_co_flush_to_disk              =3D quorum_co_flush,
+    .bdrv_co_flush                      =3D quorum_co_flush,
=20
     .bdrv_getlength                     =3D quorum_getlength,


> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> Reported-by: Minghao Yuan <meeho@qq.com>
> ---
>  block/io.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
>=20
> diff --git a/block/io.c b/block/io.c
> index 35b6c56efc..4dc1873cb9 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -2849,6 +2849,13 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *b=
s)
>      BdrvChild *child;
>      int current_gen;
>      int ret =3D 0;
> +    bool no_primary_child =3D false;
> +
> +    /* Quorum drivers do not have the primary child. */
> +    if (!primary_child) {
> +        primary_child =3D bs->file;
> +        no_primary_child =3D true;
> +    }
> =20
>      bdrv_inc_in_flight(bs);
> =20
> @@ -2886,12 +2893,12 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *=
bs)
> =20
>      /* But don't actually force it to the disk with cache=3Dunsafe */
>      if (bs->open_flags & BDRV_O_NO_FLUSH) {
> -        goto flush_children;
> +        goto flush_data;
>      }
> =20
>      /* Check if we really need to flush anything */
>      if (bs->flushed_gen =3D=3D current_gen) {
> -        goto flush_children;
> +        goto flush_data;
>      }
> =20
>      BLKDBG_EVENT(primary_child, BLKDBG_FLUSH_TO_DISK);
> @@ -2938,13 +2945,19 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *=
bs)
>      /* Now flush the underlying protocol.  It will also have BDRV_O_NO_F=
LUSH
>       * in the case of cache=3Dunsafe, so there are no useless flushes.
>       */
> -flush_children:
> -    ret =3D 0;
> -    QLIST_FOREACH(child, &bs->children, next) {
> -        if (child->perm & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) {
> -            int this_child_ret =3D bdrv_co_flush(child->bs);
> -            if (!ret) {
> -                ret =3D this_child_ret;
> +flush_data:
> +    if (no_primary_child) {
> +        /* Flush parent */
> +        ret =3D bs->file ? bdrv_co_flush(bs->file->bs) : 0;
> +    } else {
> +        /* Flush childrens */
> +        ret =3D 0;
> +        QLIST_FOREACH(child, &bs->children, next) {
> +            if (child->perm & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED=
)) {
> +                int this_child_ret =3D bdrv_co_flush(child->bs);
> +                if (!ret) {
> +                    ret =3D this_child_ret;
> +                }
>              }
>          }
>      }



--=20


--Sig_/EAbKpT9=QoB0R41yo9mvxon
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmCjX8EACgkQNasLKJxd
slgpsg/+Pj65ewlXb1vTlDD8Uq7InbeNc2eSa03EuJGpIdYDZUi31YVSzJDqAI/+
GL8oq3Mz9PvPsPWlRBW690hK5buu8BYmrJaiHN/Ro3yI/E/fqgNQvwIHA0WwI7ld
424osp9G86iHM2y0BDExxfaQ4w1wTiEIcThQfIPZT+kZFQttUu+H5O8bAgoXUQfQ
KPoQNEBcY5bRdLpAr1ApExpGX0g7PRILFv3iS2ifcaflhr74F5crbpoj7goADpFa
G/QNPMg1KRzkqyS0gd9Hmqe21ODNmzRkdHww4967KiVWUy0U3qCFiY19Zfqxwx3S
M3IqTHkgbfgGucd4cg9rXxj+2TPL/m4ggWogZy7xBIuPxlkrZvY8kQA/MjXnXf33
ZGPoGHEMLxhtW8H+RigYFPNisN9kryYBrHrsAtEY8UzXCzi1M9pmyUkraVXIWC0z
WyrRJNHMEwpYMoTAEkddKtVQh7tr4Q1gYZEHkYDVeX4/LzEUehf7hHhoh7kceF/a
Uh5DToC/HhXYTK7tNa4Ae3ZzIMejzeZnBRJ4+inYkrUuI9MqAvXM3cr8LWf40vzN
efYUYwercDCesBKpQREXz/xHOoajVCodbSOvjlhl7wthHxC13Lvf7C9t8eQD4jXs
S3PqQIXin8SNQyKmA9Lb/LTplPmv3hV3b8VkxrRHSQ15Jehc3RQ=
=yCXT
-----END PGP SIGNATURE-----

--Sig_/EAbKpT9=QoB0R41yo9mvxon--

