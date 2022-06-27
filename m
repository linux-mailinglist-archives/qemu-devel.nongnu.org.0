Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826AA55BF2E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:40:31 +0200 (CEST)
Received: from localhost ([::1]:47306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65pm-0006RL-I5
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o655x-000224-Vn
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:53:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o655t-0007BM-Hy
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656399184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b290Ec9ZTD0SbYLQ7X+ZQRezxYuCdlMSGysI1oYRCsg=;
 b=isb1Nd8pUl6VP5//RouA7F1OtmWf8m7t+EPNayz9Z4r94jVaiFYis1t/IlQPUtc5CgBNug
 j/sd0qPlR/TYz/62851mE67yv7HvXvAlyKHEq5wFEgc00TMYFBB0dh5ojQCAIW/I+Ae9SW
 UaMLW2PhCVbzZY9qW3Jt9CuEre23YUs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629--CCvMsl3Pnad2zbQUrM8Xw-1; Tue, 28 Jun 2022 02:52:47 -0400
X-MC-Unique: -CCvMsl3Pnad2zbQUrM8Xw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C7233833280;
 Tue, 28 Jun 2022 06:52:47 +0000 (UTC)
Received: from localhost (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78ACF40F9D40;
 Tue, 28 Jun 2022 06:52:45 +0000 (UTC)
Date: Mon, 27 Jun 2022 15:15:36 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org
Subject: Re: [RFC v3 1/5] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
Message-ID: <Yrm7iNLdIJjOjQmR@stefanha-x1.localdomain>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-2-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WL3zi9vIwBbjkOvU"
Content-Disposition: inline
In-Reply-To: <20220627001917.9417-2-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WL3zi9vIwBbjkOvU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 08:19:13AM +0800, Sam Li wrote:
> diff --git a/block/block-backend.c b/block/block-backend.c
> index e0e1aff4b1..786f964d02 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1810,6 +1810,62 @@ int blk_flush(BlockBackend *blk)
>      return ret;
>  }
> =20
> +/*
> + * Return zone_report from BlockDriver. Offset can be any number within
> + * the zone size. No alignment for offset and len.

What is the purpose of len? Is it the maximum number of zones to return
in nr_zones[]?

How does the caller know how many zones were returned?

> + */
> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> +                       int64_t len, int64_t *nr_zones,
> +                       BlockZoneDescriptor *zones)
> +{
> +    int ret;
> +    BlockDriverState *bs;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk); /* increase before waiting */
> +    blk_wait_while_drained(blk);
> +    bs =3D blk_bs(blk);
> +
> +    ret =3D blk_check_byte_request(blk, offset, len);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    bdrv_inc_in_flight(bs);

The bdrv_inc/dec_in_flight() call should be inside
bdrv_co_zone_report(). See bdrv_co_ioctl() for an example.

> +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, len,
> +                              nr_zones, zones);
> +    bdrv_dec_in_flight(bs);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
> +/*
> + * Return zone_mgmt from BlockDriver.

Maybe this should be:

  Send a zone management command.

> @@ -216,6 +217,11 @@ typedef struct RawPosixAIOData {
>              PreallocMode prealloc;
>              Error **errp;
>          } truncate;
> +        struct {
> +            int64_t *nr_zones;
> +            BlockZoneDescriptor *zones;
> +        } zone_report;
> +        zone_op op;

It's cleaner to put op inside a struct zone_mgmt so its purpose is
self-explanatory:

  struct {
      zone_op op;
  } zone_mgmt;

> +static int handle_aiocb_zone_report(void *opaque) {
> +    RawPosixAIOData *aiocb =3D opaque;
> +    int fd =3D aiocb->aio_fildes;
> +    int64_t *nr_zones =3D aiocb->zone_report.nr_zones;
> +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
> +    int64_t offset =3D aiocb->aio_offset;
> +    int64_t len =3D aiocb->aio_nbytes;
> +
> +    struct blk_zone *blkz;
> +    int64_t rep_size, nrz;
> +    int ret, n =3D 0, i =3D 0;
> +
> +    nrz =3D *nr_zones;
> +    if (len =3D=3D -1) {
> +        return -errno;

Where is errno set? Should this be an errno constant instead like
-EINVAL?

> +    }
> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct bl=
k_zone);
> +    g_autofree struct blk_zone_report *rep =3D g_new(struct blk_zone_rep=
ort, nrz);

g_new() looks incorrect. There should be 1 struct blk_zone_report
followed by nrz struct blk_zone structs. Please use g_malloc(rep_size)
instead.

> +    offset =3D offset / 512; /* get the unit of the start sector: sector=
 size is 512 bytes. */
> +    printf("start to report zone with offset: 0x%lx\n", offset);
> +
> +    blkz =3D (struct blk_zone *)(rep + 1);
> +    while (n < nrz) {
> +        memset(rep, 0, rep_size);
> +        rep->sector =3D offset;
> +        rep->nr_zones =3D nrz;

What prevents zones[] overflowing? nrz isn't being reduced in the loop,
so maybe the rep->nr_zones return value will eventually exceed the
number of elements still available in zones[n..]?

> +static int handle_aiocb_zone_mgmt(void *opaque) {
> +    RawPosixAIOData *aiocb =3D opaque;
> +    int fd =3D aiocb->aio_fildes;
> +    int64_t offset =3D aiocb->aio_offset;
> +    int64_t len =3D aiocb->aio_nbytes;
> +    zone_op op =3D aiocb->op;
> +
> +    struct blk_zone_range range;
> +    const char *ioctl_name;
> +    unsigned long ioctl_op;
> +    int64_t zone_size;
> +    int64_t zone_size_mask;
> +    int ret;
> +
> +    ret =3D ioctl(fd, BLKGETZONESZ, &zone_size);

Can this value be stored in bs (maybe in BlockLimits) to avoid calling
ioctl(BLKGETZONESZ) each time?

> +    if (ret) {
> +        return -1;

The return value should be a negative errno. -1 is -EPERM but it's
probably not that error code you wanted. This should be:

  return -errno;

> +    }
> +
> +    zone_size_mask =3D zone_size - 1;
> +    if (offset & zone_size_mask) {
> +        error_report("offset is not the start of a zone");
> +        return -1;

return -EINVAL;

> +    }
> +
> +    if (len & zone_size_mask) {
> +        error_report("len is not aligned to zones");
> +        return -1;

return -EINVAL;

> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t=
 offset,
> +        int64_t len, int64_t *nr_zones,
> +        BlockZoneDescriptor *zones) {
> +    BDRVRawState *s =3D bs->opaque;
> +    RawPosixAIOData acb;
> +
> +    acb =3D (RawPosixAIOData) {
> +        .bs         =3D bs,
> +        .aio_fildes =3D s->fd,
> +        .aio_type   =3D QEMU_AIO_IOCTL,
> +        .aio_offset =3D offset,
> +        .aio_nbytes =3D len,
> +        .zone_report    =3D {
> +                .nr_zones       =3D nr_zones,
> +                .zones          =3D zones,
> +                },

Indentation is off here. Please use 4-space indentation.

--WL3zi9vIwBbjkOvU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmK5u4gACgkQnKSrs4Gr
c8iVoQf9GDC/wVII0mxayVlLZNFt9V1tJMQVkaEdzeUwcE75akQGVWVKVCgXiqvQ
lINJ49CLmYui5SuKc08guYLN/VwkuoGyNYmNlaR2Wev8ncg9kebq//4iv1Kg0aF3
CChtGFzo0bdFksRk9KsbwL2ZxYsOhcRHetiJy0f2wqHQO6mtssVhnjq10sUvKVkW
AtMnXYB71mFiDrGYgCipTE6En4T0FXuC6lsWz6+WIQYJ54ml0l8DGKoENc1UGbtP
YOCGwEAQRr7Yv4XX4huT+XOkOt2gAYPHCNmemYesW9PA3owcS5RGQouU7YS6oHXN
gpu5j3d4IciDu1OyZDQKoOj4O1dghQ==
=hLHu
-----END PGP SIGNATURE-----

--WL3zi9vIwBbjkOvU--


