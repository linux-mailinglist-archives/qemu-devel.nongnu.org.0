Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770736BD980
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 20:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pctYo-0006so-Uc; Thu, 16 Mar 2023 15:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pctYm-0006p4-LG
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 15:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pctYk-00087m-Vm
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 15:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678996006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yp/GRKRwEzWrirAra124/v8KiJYnySIk59rj+TG6E1E=;
 b=MRVn8CSpOX3moSP8OSJDSawpSpbJOJemroyjaciilcrNpMOoH2qkdOpKBaL/z9RfC6ekd4
 g9jSEwOlsYN7hDmFxmIcSKsrJPFDGis3NY0IKZs+IJBnyXeK/YzOtu5S7+OEEzOM/Gy8bN
 CwikxgHd1WAqlNga3Y1dnkld2wowfM4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-eu63GCovPCGvg2jMH5aFPQ-1; Thu, 16 Mar 2023 15:46:42 -0400
X-MC-Unique: eu63GCovPCGvg2jMH5aFPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3CF585A5B1;
 Thu, 16 Mar 2023 19:46:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78D6C2027040;
 Thu, 16 Mar 2023 19:46:41 +0000 (UTC)
Date: Thu, 16 Mar 2023 14:56:21 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, hare@suse.de, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Subject: Re: [PATCH v6 2/4] block: introduce zone append write for zoned
 devices
Message-ID: <20230316185621.GC63600@fedora>
References: <20230310103106.62124-1-faithilikerun@gmail.com>
 <20230310103106.62124-3-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RsCVsgQkfIDpRaro"
Content-Disposition: inline
In-Reply-To: <20230310103106.62124-3-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--RsCVsgQkfIDpRaro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 06:31:04PM +0800, Sam Li wrote:
> A zone append command is a write operation that specifies the first
> logical block of a zone as the write position. When writing to a zoned
> block device using zone append, the byte offset of writes is pointing
> to the write pointer of that zone. Upon completion the device will
> respond with the position the data has been written in the zone.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/block-backend.c             | 60 +++++++++++++++++++++++++++++++
>  block/file-posix.c                | 54 +++++++++++++++++++++++++---
>  block/io.c                        | 21 +++++++++++
>  block/io_uring.c                  |  4 +++
>  block/linux-aio.c                 |  3 ++
>  block/raw-format.c                |  8 +++++
>  include/block/block-io.h          |  4 +++
>  include/block/block_int-common.h  |  5 +++
>  include/block/raw-aio.h           |  4 ++-
>  include/sysemu/block-backend-io.h |  9 +++++
>  10 files changed, 166 insertions(+), 6 deletions(-)
>=20
> diff --git a/block/block-backend.c b/block/block-backend.c
> index f70b08e3f6..28e8f5d778 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1888,6 +1888,45 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, B=
lockZoneOp op,
>      return &acb->common;
>  }
> =20
> +static void coroutine_fn blk_aio_zone_append_entry(void *opaque)
> +{
> +    BlkAioEmAIOCB *acb =3D opaque;
> +    BlkRwCo *rwco =3D &acb->rwco;
> +
> +    rwco->ret =3D blk_co_zone_append(rwco->blk, &acb->bytes,
> +                                   rwco->iobuf, rwco->flags);
> +    blk_aio_complete(acb);
> +}
> +
> +BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
> +                                QEMUIOVector *qiov, BdrvRequestFlags fla=
gs,
> +                                BlockCompletionFunc *cb, void *opaque) {
> +    BlkAioEmAIOCB *acb;
> +    Coroutine *co;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk);
> +    acb =3D blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> +    acb->rwco =3D (BlkRwCo) {
> +        .blk    =3D blk,
> +        .ret    =3D NOT_DONE,
> +        .flags  =3D flags,
> +        .iobuf  =3D qiov,
> +    };
> +    acb->bytes =3D *offset;
> +    acb->has_returned =3D false;
> +
> +    co =3D qemu_coroutine_create(blk_aio_zone_append_entry, acb);
> +    aio_co_enter(blk_get_aio_context(blk), co);
> +    acb->has_returned =3D true;
> +    if (acb->rwco.ret !=3D NOT_DONE) {
> +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
> +                                         blk_aio_complete_bh, acb);
> +    }
> +
> +    return &acb->common;
> +}

How is the resulting offset value communicated back to the caller? I
see offset being read (dereferenced) but there is no write (assignment).
Maybe this function should pass through acb->bytes =3D (int64_t)offset
instead so that blk_co_zone_append() can modify the offset?

--RsCVsgQkfIDpRaro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQTZlUACgkQnKSrs4Gr
c8icXQf/dBnuKnnOirKq0fzbPWFrTowOthw2axr/E3HfyJlFkkpc/OyMENPOWKxu
DreUvAUoxj9O8TTrtpEDEnRCvQCd7pNFXUnfRVotvsmUPMf1Xf7dB/jo52dhpI6u
wZW1Jy9IRK1UTrYptqYtiCtIoYe5jQqA1bmmVLFUDw5p27Uw1EsDfXH9hEJ+2DUL
Mm3BBuFl5jqutArA39QEvd3Ce13mKkK8BiSV8Fs9LLRQIbB9+EAb13Oo3Udmy0tV
ZwSHyR+KN9coeaV/Q+s/AsyFFL/HbN5ccM169w0Cjcik0XUwyIS/rFOQGciPnMhn
6gZZygr7bZo+IS77Pu/vIolERjPpjQ==
=BsY+
-----END PGP SIGNATURE-----

--RsCVsgQkfIDpRaro--


