Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4C5F6E11
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 21:19:45 +0200 (CEST)
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogWPI-000811-Mi
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 15:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogW2h-00035R-Nu
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogW2b-0007Pr-Ly
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665082576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qfkm4jso4Y0CHa/lEEAciRnNLFyHNq6rcDz6wV97ju4=;
 b=NQM7XgDnK7KYr1SFcDNiKO9nG0/4AZcbPUXIu4gYGojDVFBEo6Qz8s86WDXM245dpD6seX
 rX68sWPJNtZM/Eo/2eiHahU8Gg9rAWfYEZ1FdxKbclkpEQjUfax6YvxUlBTMmWH/S+N3wn
 zDx7gs5d7akHYz9u6kgtNI7Xts0OakY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-ZTzsToiHOsO4Xbc6oWJnvw-1; Thu, 06 Oct 2022 14:56:13 -0400
X-MC-Unique: ZTzsToiHOsO4Xbc6oWJnvw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95C7F29324BD;
 Thu,  6 Oct 2022 18:56:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE095111DD0B;
 Thu,  6 Oct 2022 18:56:11 +0000 (UTC)
Date: Thu, 6 Oct 2022 14:56:10 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eric Blake <eblake@redhat.com>, integration@gluster.org,
 David Hildenbrand <david@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, sgarzare@redhat.com
Subject: Re: [PATCH v5 02/12] blkio: add libblkio block driver
Message-ID: <Yz8kyg1gkLuUCkPY@fedora>
References: <20220927193431.22302-1-stefanha@redhat.com>
 <20220927193431.22302-3-stefanha@redhat.com>
 <CAELaAXxC1o+MWj-Ew2CQ1UhtHQmS8weS0jSDk2Y1ObV4pqKQEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0dsmwCyK8RjKtiEp"
Content-Disposition: inline
In-Reply-To: <CAELaAXxC1o+MWj-Ew2CQ1UhtHQmS8weS0jSDk2Y1ObV4pqKQEA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--0dsmwCyK8RjKtiEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2022 at 05:41:39PM +0100, Alberto Faria wrote:
> On Tue, Sep 27, 2022 at 8:34 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > +static int blkio_virtio_blk_vhost_user_open(BlockDriverState *bs,
> > +        QDict *options, int flags, Error **errp)
> > +{
> > +    const char *path =3D qdict_get_try_str(options, "path");
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    int ret;
> > +
> > +    if (!path) {
> > +        error_setg(errp, "missing 'path' option");
> > +        return -EINVAL;
> > +    }
> > +
> > +    ret =3D blkio_set_str(s->blkio, "path", path);
> > +    qdict_del(options, "path");
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "failed to set path: %s",
> > +                         blkio_get_error_msg());
> > +        return ret;
> > +    }
> > +
> > +    if (!(flags & BDRV_O_NOCACHE)) {
> > +        error_setg(errp, "cache.direct=3Doff is not supported");
> > +        return -EINVAL;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static int blkio_virtio_blk_vhost_vdpa_open(BlockDriverState *bs,
> > +        QDict *options, int flags, Error **errp)
> > +{
> > +    const char *path =3D qdict_get_try_str(options, "path");
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    int ret;
> > +
> > +    if (!path) {
> > +        error_setg(errp, "missing 'path' option");
> > +        return -EINVAL;
> > +    }
> > +
> > +    ret =3D blkio_set_str(s->blkio, "path", path);
> > +    qdict_del(options, "path");
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "failed to set path: %s",
> > +                         blkio_get_error_msg());
> > +        return ret;
> > +    }
> > +
> > +    if (!(flags & BDRV_O_NOCACHE)) {
> > +        error_setg(errp, "cache.direct=3Doff is not supported");
> > +        return -EINVAL;
> > +    }
> > +    return 0;
> > +}
>=20
> These two functions are (currently) exact duplicates. Should we just
> have a single blkio_virtio_blk_open() function?

Will fix.

> > +static BlockDriver bdrv_io_uring =3D {
> > +    .format_name                =3D DRIVER_IO_URING,
> > +    .protocol_name              =3D DRIVER_IO_URING,
> > +    .instance_size              =3D sizeof(BDRVBlkioState),
> > +    .bdrv_needs_filename        =3D true,
> > +    .bdrv_file_open             =3D blkio_file_open,
> > +    .bdrv_close                 =3D blkio_close,
> > +    .bdrv_getlength             =3D blkio_getlength,
> > +    .bdrv_get_info              =3D blkio_get_info,
> > +    .bdrv_attach_aio_context    =3D blkio_attach_aio_context,
> > +    .bdrv_detach_aio_context    =3D blkio_detach_aio_context,
> > +    .bdrv_co_pdiscard           =3D blkio_co_pdiscard,
> > +    .bdrv_co_preadv             =3D blkio_co_preadv,
> > +    .bdrv_co_pwritev            =3D blkio_co_pwritev,
> > +    .bdrv_co_flush_to_disk      =3D blkio_co_flush,
> > +    .bdrv_co_pwrite_zeroes      =3D blkio_co_pwrite_zeroes,
> > +    .bdrv_io_unplug             =3D blkio_io_unplug,
> > +    .bdrv_refresh_limits        =3D blkio_refresh_limits,
> > +};
> > +
> > +static BlockDriver bdrv_virtio_blk_vhost_user =3D {
> > +    .format_name                =3D DRIVER_VIRTIO_BLK_VHOST_USER,
> > +    .protocol_name              =3D DRIVER_VIRTIO_BLK_VHOST_USER,
> > +    .instance_size              =3D sizeof(BDRVBlkioState),
> > +    .bdrv_file_open             =3D blkio_file_open,
> > +    .bdrv_close                 =3D blkio_close,
> > +    .bdrv_getlength             =3D blkio_getlength,
> > +    .bdrv_get_info              =3D blkio_get_info,
> > +    .bdrv_attach_aio_context    =3D blkio_attach_aio_context,
> > +    .bdrv_detach_aio_context    =3D blkio_detach_aio_context,
> > +    .bdrv_co_pdiscard           =3D blkio_co_pdiscard,
> > +    .bdrv_co_preadv             =3D blkio_co_preadv,
> > +    .bdrv_co_pwritev            =3D blkio_co_pwritev,
> > +    .bdrv_co_flush_to_disk      =3D blkio_co_flush,
> > +    .bdrv_co_pwrite_zeroes      =3D blkio_co_pwrite_zeroes,
> > +    .bdrv_io_unplug             =3D blkio_io_unplug,
> > +    .bdrv_refresh_limits        =3D blkio_refresh_limits,
> > +};
> > +
> > +static BlockDriver bdrv_virtio_blk_vhost_vdpa =3D {
> > +    .format_name                =3D DRIVER_VIRTIO_BLK_VHOST_VDPA,
> > +    .protocol_name              =3D DRIVER_VIRTIO_BLK_VHOST_VDPA,
> > +    .instance_size              =3D sizeof(BDRVBlkioState),
> > +    .bdrv_file_open             =3D blkio_file_open,
> > +    .bdrv_close                 =3D blkio_close,
> > +    .bdrv_getlength             =3D blkio_getlength,
> > +    .bdrv_get_info              =3D blkio_get_info,
> > +    .bdrv_attach_aio_context    =3D blkio_attach_aio_context,
> > +    .bdrv_detach_aio_context    =3D blkio_detach_aio_context,
> > +    .bdrv_co_pdiscard           =3D blkio_co_pdiscard,
> > +    .bdrv_co_preadv             =3D blkio_co_preadv,
> > +    .bdrv_co_pwritev            =3D blkio_co_pwritev,
> > +    .bdrv_co_flush_to_disk      =3D blkio_co_flush,
> > +    .bdrv_co_pwrite_zeroes      =3D blkio_co_pwrite_zeroes,
> > +    .bdrv_io_unplug             =3D blkio_io_unplug,
> > +    .bdrv_refresh_limits        =3D blkio_refresh_limits,
> > +};
>=20
> It's difficult to identify the fields that differ between
> BlockDrivers. Maybe we could do something like:
>=20
>     #define DRIVER(name, ...) \
>         { \
>             .format_name             =3D name, \
>             .protocol_name           =3D name, \
>             .instance_size           =3D sizeof(BDRVBlkioState), \
>             .bdrv_file_open          =3D blkio_file_open, \
>             .bdrv_close              =3D blkio_close, \
>             .bdrv_getlength          =3D blkio_getlength, \
>             .bdrv_get_info           =3D blkio_get_info, \
>             .bdrv_attach_aio_context =3D blkio_attach_aio_context, \
>             .bdrv_detach_aio_context =3D blkio_detach_aio_context, \
>             .bdrv_co_pdiscard        =3D blkio_co_pdiscard, \
>             .bdrv_co_preadv          =3D blkio_co_preadv, \
>             .bdrv_co_pwritev         =3D blkio_co_pwritev, \
>             .bdrv_co_flush_to_disk   =3D blkio_co_flush, \
>             .bdrv_co_pwrite_zeroes   =3D blkio_co_pwrite_zeroes, \
>             .bdrv_io_unplug          =3D blkio_io_unplug, \
>             .bdrv_refresh_limits     =3D blkio_refresh_limits, \
>             __VA_ARGS__
>         } \
>=20
>     static BlockDriver bdrv_io_uring =3D DRIVER(
>         DRIVER_IO_URING,
>         .bdrv_needs_filename =3D true,
>     );
>=20
>     static BlockDriver bdrv_virtio_blk_vhost_user =3D DRIVER(
>         DRIVER_VIRTIO_BLK_VHOST_USER
>     );
>=20
>     static BlockDriver bdrv_virtio_blk_vhost_vdpa =3D DRIVER(
>         DRIVER_VIRTIO_BLK_VHOST_VDPA
>     );

Makes sense to me.

Stefan

--0dsmwCyK8RjKtiEp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM/JMoACgkQnKSrs4Gr
c8iEtQf9EdIkZIhfUpnvjqm67Xt8d1a09kEStbrMKmzrHMKhN+6ict7TOcWNd7Cm
gF0YwYVr9tkK3kUh/gmQaRCPfLs8nFUJCkus8bVdEGXiUeAERL1zoGREkEAwuKHq
mkWtOaAOVIg7xl/lgaUFZFnLDmovL8j1Id5Fh5quog80q1lokYKHNwEq8FYH+ME7
PPDymYwhFJspXQjzQOv57m24Oh+7k5YFg3IvELYHTRDSXGRJbrkMY5f4yXiMXUpV
bcv5FmT+wqin4te2M2rTGPSKjVxFvsfNPEAouZoPlZhTKHlN1ZWO9gCDmQ0OCEld
Cz+XUQ2MJksoGRnvMD5PdmCoHXX0Og==
=0jDS
-----END PGP SIGNATURE-----

--0dsmwCyK8RjKtiEp--


