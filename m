Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF00A6F4A14
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 21:04:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptvGt-0008T8-OX; Tue, 02 May 2023 15:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptvGr-0008Sq-VS
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptvGq-0004Up-Bm
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683054159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+z4+TjiCR4alU0c08A+lzuJazQjzDMGELTfVt5PjAoY=;
 b=hHZJ8h/6yMZEnUy0Dwuts8c5GoxF71BnXL+HRiC42VwwZdbGnVUuLM2D/Wgi9HwXwbnxzm
 Da4CC9ECuvz9Zdp717Ly7tPz4IQX2OqZ2f2EnigGw3qAUFjDz8qTiHQgS8yF2QVy/wtTUh
 3q6GJaT2dq9AoD16+UpapFt5gOsrRpk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-0xdANPblM5WZrZ3jzbLIsg-1; Tue, 02 May 2023 15:02:35 -0400
X-MC-Unique: 0xdANPblM5WZrZ3jzbLIsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACA0010AFB1F;
 Tue,  2 May 2023 19:02:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13BB163F4A;
 Tue,  2 May 2023 19:02:33 +0000 (UTC)
Date: Tue, 2 May 2023 15:02:32 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, jjongsma@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] block/blkio: add 'fd' option to virtio-blk-vhost-vdpa
 driver
Message-ID: <20230502190232.GB535070@fedora>
References: <20230502145050.224615-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bhArPqHZO6KdKK/8"
Content-Disposition: inline
In-Reply-To: <20230502145050.224615-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--bhArPqHZO6KdKK/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 04:50:50PM +0200, Stefano Garzarella wrote:
> The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the new
> 'fd' property. Let's expose this to the user, so the management layer
> can pass the file descriptor of an already opened vhost-vdpa character
> device. This is useful especially when the device can only be accessed
> with certain privileges.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>=20
> Notes:
>     As an alternative we could support passing `/dev/fdset/N` via 'path',
>     always opening the path with qemu_open() and passing the fd to the
>     libblkio driver.
>     I preferred to add a new parameter though, because the code is
>     simpler without changing how path works (alternatively we should check
>     first if fd is supported by the driver or not).
>    =20
>     What do you think?

I think the approach in this patch is fine.

>    =20
>     Thanks,
>     Stefano
>=20
>  qapi/block-core.json |  6 +++++-
>  block/blkio.c        | 45 +++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 49 insertions(+), 2 deletions(-)
>=20
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index b57978957f..9f70777d49 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -3841,10 +3841,14 @@
>  #
>  # @path: path to the vhost-vdpa character device.
>  #
> +# @fd: file descriptor of an already opened vhost-vdpa character device.
> +#      (Since 8.1)
> +#
>  # Since: 7.2
>  ##
>  { 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
> -  'data': { 'path': 'str' },
> +  'data': { '*path': 'str',
> +            '*fd': 'str' },
>    'if': 'CONFIG_BLKIO' }
> =20
>  ##
> diff --git a/block/blkio.c b/block/blkio.c
> index 0cdc99a729..98394b5745 100644
> --- a/block/blkio.c
> +++ b/block/blkio.c
> @@ -694,6 +694,49 @@ static int blkio_virtio_blk_common_open(BlockDriverS=
tate *bs,
>      return 0;
>  }
> =20
> +static int blkio_virtio_blk_vhost_vdpa_open(BlockDriverState *bs,
> +        QDict *options, int flags, Error **errp)
> +{
> +    const char *path =3D qdict_get_try_str(options, "path");
> +    const char *fd_str =3D qdict_get_try_str(options, "fd");
> +    BDRVBlkioState *s =3D bs->opaque;
> +    int ret;
> +
> +    if (path && fd_str) {
> +        error_setg(errp, "'path' and 'fd' options are mutually exclusive=
");
> +        return -EINVAL;
> +    }
> +
> +    if (!path && !fd_str) {
> +        error_setg(errp, "none of 'path' or 'fd' options was specified");
> +        return -EINVAL;
> +    }
> +
> +    if (path) {
> +        ret =3D blkio_set_str(s->blkio, "path", path);
> +        qdict_del(options, "path");
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "failed to set path: %s",
> +                             blkio_get_error_msg());
> +            return ret;
> +        }
> +    } else {
> +        ret =3D blkio_set_str(s->blkio, "fd", fd_str);

monitor_fd_param() is used by vhost-net, vhost-vsock, vhost-scsi, etc.

I think QEMU should parse the fd string and resolve it to a file
descriptor so the fd passing syntax matches the other vhost devices.

--bhArPqHZO6KdKK/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRRXkgACgkQnKSrs4Gr
c8hBXgf/fF7JWuQryC33StzRx+1AyKqxo86yjIK+J+LSAAUo6d7xbg3SWJz7ggcw
5WeaSs3LpkGJs5S/f4NTrG7oR2lgGWTSYiXMtEOzHo5KkPN4Uzt4kVVq0uunCJnM
wrksJscgY16ZhO1YmlajrvvMlV2C1L5qLsRteXnn57BqRLXTPKugW7EjqJHsVb52
QzwuGFuIoKTplKn4pFcgVZPb0oA+RaQrjjYsEf6HDottQCIcHb/FFNNLDODhC9NM
4jsbvoe4DiJE6A/mXXRPyfHa6FOCbZkEv0QHXQZ4iIn4an2yT8dDkEPPdMEpMyKB
KqNdn0gWP0Fx0IiSWZAQRphH+qw8ug==
=+vWM
-----END PGP SIGNATURE-----

--bhArPqHZO6KdKK/8--


