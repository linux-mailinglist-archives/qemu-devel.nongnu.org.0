Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3899328A1C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 19:14:54 +0100 (CET)
Received: from localhost ([::1]:47152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGn4H-0007Pm-CV
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 13:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGn2v-0006YR-K6
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGn2r-0000VW-Ks
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614622404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tz5zUEQVEF+tzS0ohi9rvFnQopXcquEyqrElgUHVQvo=;
 b=im+N67CViZVlStA0qYsZ+xDMWf54OGTdYWSgRic6gTeZoFY6y/wDofooPk4UoACbBkOKGI
 3DwUVAt5KVscyLRfq4Ag+lEo2KI3Gm6gML3gjgo4OpgKfwwEgq6mX7QF5+0N4TBQN3MbQB
 cJYPtS+0JEaOOlaQM2fBZO6EoNl0a7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-E3wacpgcMvaj4MDQTWRC1A-1; Mon, 01 Mar 2021 13:13:20 -0500
X-MC-Unique: E3wacpgcMvaj4MDQTWRC1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17034E4962;
 Mon,  1 Mar 2021 18:13:19 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F6AD60DA1;
 Mon,  1 Mar 2021 18:13:18 +0000 (UTC)
Date: Mon, 1 Mar 2021 18:13:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 3/3] hw/block/pflash: use
 memory_region_init_rom_device_from_file()
Message-ID: <YD0uvW+vzfQjBecY@stefanha-x1.localdomain>
References: <20210301115329.411762-1-philmd@redhat.com>
 <20210301115329.411762-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301115329.411762-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3+ejPJmY+VTp9d7l"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, David Edmondson <david.edmondson@oracle.com>,
 haibinzhang <haibinzhang@tencent.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3+ejPJmY+VTp9d7l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 12:53:29PM +0100, Philippe Mathieu-Daud=E9 wrote:
> If the block drive is read-only we will model a "protected" flash
> device. We can thus use memory_region_init_rom_device_from_file()
> which mmap the backing file when creating the MemoryRegion.
> If the same backing file is used by multiple QEMU instances, this
> reduces the memory footprint (this is often the case with the
> CODE flash image from OVMF and AAVMF).
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi01.c | 39 +++++++++++++++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index a5fa8d8b74a..ec290636298 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -702,6 +702,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
>      int ret;
>      uint64_t blocks_per_device, sector_len_per_device, device_len;
>      int num_devices;
> +    bool romd_mr_shared_mapped;
> =20
>      if (pfl->sector_len =3D=3D 0) {
>          error_setg(errp, "attribute \"sector-length\" not specified or z=
ero.");
> @@ -743,19 +744,41 @@ static void pflash_cfi01_realize(DeviceState *dev, =
Error **errp)
>          pfl->ro =3D 0;
>      }
> =20
> -    memory_region_init_rom_device(
> -        &pfl->mem, OBJECT(dev),
> -        &pflash_cfi01_ops,
> -        pfl,
> -        pfl->name, total_len, errp);
> -    if (*errp) {
> -        return;
> +    if (pfl->ro && pfl->blk) {
> +        BlockDriverState *bs =3D blk_bs(pfl->blk);
> +
> +        /* If "raw" driver used, try to mmap the backing file as RAM_SHA=
RED */
> +        if (bs->drv =3D=3D &bdrv_raw) { /* FIXME check offset=3D0 ? */

Bypassing the block layer is tricky because there are a lot of features
that conflict (you already pointed out the offset=3D option). Checking
bdrv_raw is not enough because the underlying protocol driver could be
GlusterFS, iSCSI, etc.

I think the goal here is to avoid changing the command-line/QMP so that
users don't need to modify their guests. Therefore changing the pflash
qdev properties is not desirable (we could have added a separate code
path that bypasses the block layer cleanly). This seems like a
worthwhile optimization that the block layer should support. I suggest
adding a new API like:

  /* Returns a filename string if @blk supports read-only mmap */
  char *blk_get_read_only_mmap_filename(BlockBackend *blk, Error **errp);

Then block/raw-format.c would forward the call to bs->file and
block/raw-posix.c would implement it by returning a new filename string
when bs->read_only is true.

FWIW this API isn't perfect because the file could be reopened with QMP
and the existing mmap would remain in place.

> +            Error *local_err =3D NULL;
> +
> +            memory_region_init_rom_device_from_file(&pfl->mem, OBJECT(de=
v),
> +                                                    &pflash_cfi01_ops, p=
fl,
> +                                                    pfl->name, total_len=
,
> +                                                    qemu_real_host_page_=
size,
> +                                                    RAM_SHARED,
> +                                                    bs->exact_filename,
> +                                                    true, &local_err);
> +            if (local_err) {
> +                error_report_err(local_err);
> +                /* fall back to memory_region_init_rom_device() */
> +            } else {
> +                romd_mr_shared_mapped =3D true;
> +            }
> +        }
> +    }
> +    if (!romd_mr_shared_mapped) {
> +        memory_region_init_rom_device(&pfl->mem, OBJECT(dev),
> +                                      &pflash_cfi01_ops, pfl,
> +                                      pfl->name, total_len, errp);
> +        if (*errp) {
> +            return;
> +        }
>      }
> =20
>      pfl->storage =3D memory_region_get_ram_ptr(&pfl->mem);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
> =20
> -    if (pfl->blk) {
> +    if (pfl->blk && !romd_mr_shared_mapped) {
>          if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_l=
en,
>                                           errp)) {
>              vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
> --=20
> 2.26.2
>=20

--3+ejPJmY+VTp9d7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA9Lr0ACgkQnKSrs4Gr
c8j8lgf+IOmDPt2ENAVAGgNpLcOZW6ZLBxJusZ8P720J5GjOE72rRf2GneIvjVSd
TzA+EGyYCh6YtfR/GKompJCoh/r8LcXqt0OuWZP2TpwYhnLnkQ8r8hbPWPGbvob1
i19qLWwN70W4pKWv4fjsyMOyMn9tgmmRW/4jfSUBfBsLNhCF8kpY547xNPDj0mEm
V9Wm/kVfPKFaHOGeDKGjg3ySHmMKWlvNn9UfMbMu1BYewhDkVeP+buCn4h1we5+U
MC3n+e1yyPddHnbDrXpx+qEKSldxZ7pDP854yqvaOLbwKFQmkhHRiKTReOMZ6n67
4xKXZO+fKLuNguDknWATwgZI3VgG4g==
=s4yN
-----END PGP SIGNATURE-----

--3+ejPJmY+VTp9d7l--


