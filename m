Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4E3CA1D8
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 18:05:06 +0200 (CEST)
Received: from localhost ([::1]:37250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m43rE-0000tH-Me
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 12:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m43or-0006Vs-H7; Thu, 15 Jul 2021 12:02:37 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:40840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m43op-000106-FJ; Thu, 15 Jul 2021 12:02:37 -0400
Received: by mail-qt1-x82e.google.com with SMTP id k3so4868330qtq.7;
 Thu, 15 Jul 2021 09:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+V+2i5Mqa+E96CsqUO2dK3AS+cf6gZ5+GOdPIb1HVBA=;
 b=UfhlqfgtXhKAzBh3/Muew1c0SzGSCTjhBhqwMoNyovDnkA/+B+CGShWRQSG29gC7kh
 YKHDeX1lmmYIEb6pvzs+xPKVRwm6QzF4AurZbzY1MIthYQ4p21ZgLFCk+PpvICHb0z9D
 uPUb3nmF9JiBjQAB0beuGT8DKqFKhlcXLfFnV4EjOKLlEEFIj6yD91zYQ6ltV0DoLWaq
 ucLiDKmiqGTln0My0ic01TyWmlWe2Xr62D2RvdipEMPsAapIiAIz47OQUCZ42icyPpwP
 l0ZF1i2DHMp/LrcE2I/fSJBO7Xs7dvN1L5aleQCWJKolKeURUTJoWYCGDFqUleVK9+u3
 VvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+V+2i5Mqa+E96CsqUO2dK3AS+cf6gZ5+GOdPIb1HVBA=;
 b=rIY9Uo6lPccFvV6TC4velkH+NiZcY5oNihIvrimyExua2qoeGaTR+NjGmWJZ/tr/Ow
 RLLigWBYOcGWM+O/KiQf/lOGXe4MtdGKFSneLm+JvPw6xQDA3+JUQUPwhk/R+ngIeeBz
 Rw5zRZszlRKD4HwKVyXnVt4kKYxC3plycbPlgPWeEudhsaxYlDXKUAXnD4xqKKasKohN
 edPahrG17zmnjeFNUx8vc1LuIOdFflcGo8Z7mHqHjc5SE6vfQq5hhtxZeSzkWlnVWOOz
 8OQVeMlpw9ZGbHbo4mbm0kO2U1mtGLm9LcMLCZKJSz1jphlp5rE+8EJp3Xo7MsVckGPQ
 19og==
X-Gm-Message-State: AOAM530dYJL43BYG2SZTHVHCU9TYWzvEoN1Xd/97V2npIJ3yJTzP5hr1
 cPGzF4QOVcEMvaK45ECeJfI=
X-Google-Smtp-Source: ABdhPJwl45dO5t7fLW975CQSLYO+pwYS7vI3H/rVvtivujzJzDVz7zr94kb79w/c5u7LbtOAODAC0w==
X-Received: by 2002:a05:622a:144:: with SMTP id
 v4mr4669145qtw.220.1626364953733; 
 Thu, 15 Jul 2021 09:02:33 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id e12sm2087025qtx.73.2021.07.15.09.02.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 09:02:33 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] block/vvfat: fix: drop backing
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <20210715124853.13335-1-vsementsov@virtuozzo.com>
Date: Thu, 15 Jul 2021 12:02:32 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <962842EB-5653-4633-8DEE-E8526F55C50B@gmail.com>
References: <20210715124853.13335-1-vsementsov@virtuozzo.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, QEMU devel list <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 15, 2021, at 8:48 AM, Vladimir Sementsov-Ogievskiy =
<vsementsov@virtuozzo.com> wrote:
>=20
> Most probably this fake backing child doesn't work anyway (see notes
> about it in a8a4d15c1c34d).
>=20
> Still, since 25f78d9e2de528473d52 drivers are required to set
> .supports_backing if they want to call bdrv_set_backing_hd, so now
> vvfat just doesn't work because of this check.
>=20
> Let's finally drop this fake backing file.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>=20
> Honestly, I don't know, which scenarios may break after this patch.
> So, that's just my idea that it's more correct to drop this thing than
> set .supports_backing in vvfat driver.
>=20
> block/vvfat.c | 43 ++++---------------------------------------
> 1 file changed, 4 insertions(+), 39 deletions(-)
>=20
> diff --git a/block/vvfat.c b/block/vvfat.c
> index ae9d387da7..34bf1e3a86 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -3098,26 +3098,6 @@ static int coroutine_fn =
vvfat_co_block_status(BlockDriverState *bs,
>     return BDRV_BLOCK_DATA;
> }
>=20
> -static int coroutine_fn
> -write_target_commit(BlockDriverState *bs, uint64_t offset, uint64_t =
bytes,
> -                    QEMUIOVector *qiov, int flags)
> -{
> -    int ret;
> -
> -    BDRVVVFATState* s =3D *((BDRVVVFATState**) bs->opaque);
> -    qemu_co_mutex_lock(&s->lock);
> -    ret =3D try_commit(s);
> -    qemu_co_mutex_unlock(&s->lock);
> -
> -    return ret;
> -}
> -
> -static BlockDriver vvfat_write_target =3D {
> -    .format_name        =3D "vvfat_write_target",
> -    .instance_size      =3D sizeof(void*),
> -    .bdrv_co_pwritev    =3D write_target_commit,
> -};
> -
> static void vvfat_qcow_options(BdrvChildRole role, bool =
parent_is_format,
>                                int *child_flags, QDict *child_options,
>                                int parent_flags, QDict =
*parent_options)
> @@ -3133,7 +3113,6 @@ static int enable_write_target(BlockDriverState =
*bs, Error **errp)
> {
>     BDRVVVFATState *s =3D bs->opaque;
>     BlockDriver *bdrv_qcow =3D NULL;
> -    BlockDriverState *backing;
>     QemuOpts *opts =3D NULL;
>     int ret;
>     int size =3D sector2cluster(s, s->sector_count);
> @@ -3184,13 +3163,6 @@ static int enable_write_target(BlockDriverState =
*bs, Error **errp)
>     unlink(s->qcow_filename);
> #endif
>=20
> -    backing =3D bdrv_new_open_driver(&vvfat_write_target, NULL, =
BDRV_O_ALLOW_RDWR,
> -                                   &error_abort);
> -    *(void**) backing->opaque =3D s;
> -
> -    bdrv_set_backing_hd(s->bs, backing, &error_abort);
> -    bdrv_unref(backing);
> -
>     return 0;
>=20
> err:
> @@ -3205,17 +3177,10 @@ static void vvfat_child_perm(BlockDriverState =
*bs, BdrvChild *c,
>                              uint64_t perm, uint64_t shared,
>                              uint64_t *nperm, uint64_t *nshared)
> {
> -    if (role & BDRV_CHILD_DATA) {
> -        /* This is a private node, nobody should try to attach to it =
*/
> -        *nperm =3D BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
> -        *nshared =3D BLK_PERM_WRITE_UNCHANGED;
> -    } else {
> -        assert(role & BDRV_CHILD_COW);
> -        /* The backing file is there so 'commit' can use it. vvfat =
doesn't
> -         * access it in any way. */
> -        *nperm =3D 0;
> -        *nshared =3D BLK_PERM_ALL;
> -    }
> +    assert(role & BDRV_CHILD_DATA);
> +    /* This is a private node, nobody should try to attach to it */
> +    *nperm =3D BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
> +    *nshared =3D BLK_PERM_WRITE_UNCHANGED;
> }
>=20
> static void vvfat_close(BlockDriverState *bs)
> --=20
> 2.29.2
>=20

Tested-by: John Arbuckle <programmingkidx@gmail.com>


