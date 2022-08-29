Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00995A549B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 21:36:49 +0200 (CEST)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSkYx-00033o-6Y
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 15:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oSkSO-0006DE-6s
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 15:30:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oSkSL-0007MR-Hb
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 15:29:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661801396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YYz3wEajvvbxxOs5rujA4klPlapPRAwb8sbeyOuy204=;
 b=PkDHYwqdacSBGztMw5H5RqDGHn2sdklAfjtdf/0mrarz8gtpS8SRf77BKEjyGeSNB4DYcT
 aP1mTd8ZMHAhIhr0uuPm3zm2ri/AMhHpjATBBJ1G5X0YxMukmj2nE0LDxrlWEoEand2B0v
 Yy7xNzWWs1ls4eJ4Pvu/OnXtn3s4GfQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-pQYKHVdBMUeru7eaE84Xdg-1; Mon, 29 Aug 2022 15:29:52 -0400
X-MC-Unique: pQYKHVdBMUeru7eaE84Xdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C06DD8039A2;
 Mon, 29 Aug 2022 19:29:51 +0000 (UTC)
Received: from localhost (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31CD9909FF;
 Mon, 29 Aug 2022 19:29:50 +0000 (UTC)
Date: Mon, 29 Aug 2022 15:29:48 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com,
 Dmitry.Fomichev@wdc.com, hare@suse.de, qemu-block@nongnu.org,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 fam@euphon.net, kwolf@redhat.com
Subject: Re: [PATCH v8 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Message-ID: <Yw0TrFY3ImEngV6W@fedora>
References: <20220826161704.8076-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g7qIW9p+kSRDCVw8"
Content-Disposition: inline
In-Reply-To: <20220826161704.8076-1-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--g7qIW9p+kSRDCVw8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 27, 2022 at 12:17:04AM +0800, Sam Li wrote:
> +/*
> + * Send a zone_management command.
> + * op is the zone operation.
> + * offset is the starting zone specified as a sector offset.

Does "sector offset" mean "byte offset from the start of the device" or
does it mean in 512B sector units? For consistency this should be in
bytes.

> + * len is the maximum number of sectors the command should operate on. It
> + * should be aligned with the zone sector size.

Please use bytes for consistency with QEMU's block layer APIs.

> @@ -3022,6 +3183,118 @@ static void raw_account_discard(BDRVRawState *s, =
uint64_t nbytes, int ret)
>      }
>  }
> =20
> +/*
> + * zone report - Get a zone block device's information in the form
> + * of an array of zone descriptors.
> + *
> + * @param bs: passing zone block device file descriptor
> + * @param zones: an array of zone descriptors to hold zone
> + * information on reply
> + * @param offset: offset can be any byte within the zone size.

This isn't an offset within a zone, it's an offset within the entire
device, so I think "zone size" is confusing here.

> + * @param len: (not sure yet.

Please remove this and document nr_zones instead.

> + * @return 0 on success, -1 on failure
> + */
> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t=
 offset,
> +                                           unsigned int *nr_zones,
> +                                           BlockZoneDescriptor *zones) {
> +#if defined(CONFIG_BLKZONED)
> +    BDRVRawState *s =3D bs->opaque;
> +    RawPosixAIOData acb;
> +
> +    acb =3D (RawPosixAIOData) {
> +        .bs         =3D bs,
> +        .aio_fildes =3D s->fd,
> +        .aio_type   =3D QEMU_AIO_ZONE_REPORT,
> +        .aio_offset =3D offset,
> +        .zone_report    =3D {
> +                .nr_zones       =3D nr_zones,
> +                .zones          =3D zones,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
> +/*
> + * zone management operations - Execute an operation on a zone
> + */
> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZone=
Op op,
> +        int64_t offset, int64_t len) {
> +#if defined(CONFIG_BLKZONED)
> +    BDRVRawState *s =3D bs->opaque;
> +    RawPosixAIOData acb;
> +    int64_t zone_sector, zone_sector_mask;
> +    const char *ioctl_name;
> +    unsigned long zone_op;
> +    int ret;
> +
> +    struct stat st;
> +    if (fstat(s->fd, &st) < 0) {
> +        ret =3D -errno;
> +        return ret;
> +    }

st is not used and can be removed.

> +    zone_sector =3D bs->bl.zone_sectors;
> +    zone_sector_mask =3D zone_sector - 1;
> +    if (offset & zone_sector_mask) {
> +        error_report("sector offset %" PRId64 " is not aligned to zone s=
ize "
> +                     "%" PRId64 "", offset, zone_sector);
> +        return -EINVAL;
> +    }
> +
> +    if (len & zone_sector_mask) {
> +        error_report("number of sectors %" PRId64 " is not aligned to zo=
ne size"
> +                      " %" PRId64 "", len, zone_sector);
> +        return -EINVAL;
> +    }
> +
> +    switch (op) {
> +    case BLK_ZO_OPEN:
> +        ioctl_name =3D "BLKOPENZONE";
> +        zone_op =3D BLKOPENZONE;
> +        break;
> +    case BLK_ZO_CLOSE:
> +        ioctl_name =3D "BLKCLOSEZONE";
> +        zone_op =3D BLKCLOSEZONE;
> +        break;
> +    case BLK_ZO_FINISH:
> +        ioctl_name =3D "BLKFINISHZONE";
> +        zone_op =3D BLKFINISHZONE;
> +        break;
> +    case BLK_ZO_RESET:
> +        ioctl_name =3D "BLKRESETZONE";
> +        zone_op =3D BLKRESETZONE;
> +        break;
> +    default:
> +        error_report("Invalid zone operation 0x%x", op);
> +        return -EINVAL;
> +    }
> +
> +    acb =3D (RawPosixAIOData) {
> +        .bs             =3D bs,
> +        .aio_fildes     =3D s->fd,
> +        .aio_type       =3D QEMU_AIO_ZONE_MGMT,
> +        .aio_offset     =3D offset,
> +        .aio_nbytes     =3D len,
> +        .zone_mgmt  =3D {
> +                .zone_op =3D zone_op,
> +        },
> +    };
> +
> +    ret =3D raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> +    if (ret !=3D 0) {
> +        error_report("ioctl %s failed %d", ioctl_name, errno);
> +        return -errno;

ret contains a negative errno value. The errno variable is not used by
raw_thread_pool_submit().

I suggest simplifying it to:

  return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);

That's what most of the other raw_thread_pool_submit() callers.

--g7qIW9p+kSRDCVw8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMNE6wACgkQnKSrs4Gr
c8hKEwf7BQy1/AB8eHTsIb8el2N6Db3QvuQZqrd7BgRG/eJA1orYrQw1gcP5bIBF
GBTH12hLqI2582nHCFETukLlqYcv54cwD7zUXGCIL6HJYxDp3JoLSvCP4cqHS5ua
0+qjC3G632aT4CwOKKj7n5niEGR1qQH2dttJSVEK4HPPjJoz88NqC86gpx8e0s7J
EqNSWvBLHy6LltQReMRsigrphR8SxpE6bxFSq6nf93GnnTM4dmNAc3xNiQA5UpaT
okMvl7WerThusc8xR6xaRKiZHxkSybzpx2gnfDRdc/h8oX9uvlxeRUKyyKGRQUjK
m7rWJP/W1WFUw6ascZ/0GTGkB7ltQw==
=c0vO
-----END PGP SIGNATURE-----

--g7qIW9p+kSRDCVw8--


