Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1116F5BA8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:58:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puEr7-0002K3-Pl; Wed, 03 May 2023 11:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1puEr4-0002J1-3D
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1puEr2-0008GX-21
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683129439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=giv0uZgctcnYPXVX7VOIByB56BQzst+q/C1VpfVPRVA=;
 b=ZNPfP+R+YIMrPvAiCucQUCUYDiyx+q3p5WofhnLhZOdL2RDrTS0l6Lyasag9QjGpqC7BL2
 H68D7ENN+HEKLoWOSTGmSIW9ns2QZZyjMKbZutMXc5I+7mOH9mqSCrLdfDk/32griJL7Gs
 zda44NBow0XELlwqWzrPidjuV2DvyaI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-L1JBkpoWP5aMKL1e2cFZQg-1; Wed, 03 May 2023 11:57:15 -0400
X-MC-Unique: L1JBkpoWP5aMKL1e2cFZQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B144A0F385;
 Wed,  3 May 2023 15:57:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A434C4020961;
 Wed,  3 May 2023 15:57:14 +0000 (UTC)
Date: Wed, 3 May 2023 09:26:18 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, jjongsma@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] block/blkio: add 'fd' option to virtio-blk-vhost-vdpa
 driver
Message-ID: <20230503132618.GD757667@fedora>
References: <20230502145050.224615-1-sgarzare@redhat.com>
 <20230502190232.GB535070@fedora>
 <2dhjygwf76syej7espfdecxcoawborvm2qqx66bz3g6ljdvg53@xo3d64wtbdeu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="11bBJhi2+JI8u9EZ"
Content-Disposition: inline
In-Reply-To: <2dhjygwf76syej7espfdecxcoawborvm2qqx66bz3g6ljdvg53@xo3d64wtbdeu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--11bBJhi2+JI8u9EZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2023 at 11:15:56AM +0200, Stefano Garzarella wrote:
> On Tue, May 02, 2023 at 03:02:32PM -0400, Stefan Hajnoczi wrote:
> > On Tue, May 02, 2023 at 04:50:50PM +0200, Stefano Garzarella wrote:
> > > The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the new
> > > 'fd' property. Let's expose this to the user, so the management layer
> > > can pass the file descriptor of an already opened vhost-vdpa character
> > > device. This is useful especially when the device can only be accessed
> > > with certain privileges.
> > >=20
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > >=20
> > > Notes:
> > >     As an alternative we could support passing `/dev/fdset/N` via 'pa=
th',
> > >     always opening the path with qemu_open() and passing the fd to the
> > >     libblkio driver.
> > >     I preferred to add a new parameter though, because the code is
> > >     simpler without changing how path works (alternatively we should =
check
> > >     first if fd is supported by the driver or not).
> > >=20
> > >     What do you think?
> >=20
> > I think the approach in this patch is fine.
> >=20
> > >=20
> > >     Thanks,
> > >     Stefano
> > >=20
> > >  qapi/block-core.json |  6 +++++-
> > >  block/blkio.c        | 45 ++++++++++++++++++++++++++++++++++++++++++=
+-
> > >  2 files changed, 49 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > > index b57978957f..9f70777d49 100644
> > > --- a/qapi/block-core.json
> > > +++ b/qapi/block-core.json
> > > @@ -3841,10 +3841,14 @@
> > >  #
> > >  # @path: path to the vhost-vdpa character device.
> > >  #
> > > +# @fd: file descriptor of an already opened vhost-vdpa character dev=
ice.
> > > +#      (Since 8.1)
> > > +#
> > >  # Since: 7.2
> > >  ##
> > >  { 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
> > > -  'data': { 'path': 'str' },
> > > +  'data': { '*path': 'str',
> > > +            '*fd': 'str' },
> > >    'if': 'CONFIG_BLKIO' }
> > >=20
> > >  ##
> > > diff --git a/block/blkio.c b/block/blkio.c
> > > index 0cdc99a729..98394b5745 100644
> > > --- a/block/blkio.c
> > > +++ b/block/blkio.c
> > > @@ -694,6 +694,49 @@ static int blkio_virtio_blk_common_open(BlockDri=
verState *bs,
> > >      return 0;
> > >  }
> > >=20
> > > +static int blkio_virtio_blk_vhost_vdpa_open(BlockDriverState *bs,
> > > +        QDict *options, int flags, Error **errp)
> > > +{
> > > +    const char *path =3D qdict_get_try_str(options, "path");
> > > +    const char *fd_str =3D qdict_get_try_str(options, "fd");
> > > +    BDRVBlkioState *s =3D bs->opaque;
> > > +    int ret;
> > > +
> > > +    if (path && fd_str) {
> > > +        error_setg(errp, "'path' and 'fd' options are mutually exclu=
sive");
> > > +        return -EINVAL;
> > > +    }
> > > +
> > > +    if (!path && !fd_str) {
> > > +        error_setg(errp, "none of 'path' or 'fd' options was specifi=
ed");
> > > +        return -EINVAL;
> > > +    }
> > > +
> > > +    if (path) {
> > > +        ret =3D blkio_set_str(s->blkio, "path", path);
> > > +        qdict_del(options, "path");
> > > +        if (ret < 0) {
> > > +            error_setg_errno(errp, -ret, "failed to set path: %s",
> > > +                             blkio_get_error_msg());
> > > +            return ret;
> > > +        }
> > > +    } else {
> > > +        ret =3D blkio_set_str(s->blkio, "fd", fd_str);
> >=20
> > monitor_fd_param() is used by vhost-net, vhost-vsock, vhost-scsi, etc.
> >=20
> > I think QEMU should parse the fd string and resolve it to a file
> > descriptor so the fd passing syntax matches the other vhost devices.
>=20
> Okay, but I have a linker issue if I use monitor_fd_param().
> IIUC because blkio is built as a module, so what about adding
> qemu_fd_param() in libqemuutil?

Modules can access any extern function in QEMU so I don't think there is
a fundamental limitation there.

Maybe it's related to the dependencies between the blkio module and
monitor/ code. monitor_get_fd_param() is in softmmu_ss, which block
drivers don't directly depend on AFAICT.

>=20
> I mean something like this:
>=20
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 9eff0be95b..87360c983a 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -568,6 +568,7 @@ int qemu_lock_fd(int fd, int64_t start, int64_t len, =
bool exclusive);
>  int qemu_unlock_fd(int fd, int64_t start, int64_t len);
>  int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive=
);
>  bool qemu_has_ofd_lock(void);
> +int qemu_fd_param(const char *fdname, Error **errp);
>  #endif
>=20
>  #if defined(__HAIKU__) && defined(__i386__)
> diff --git a/util/osdep.c b/util/osdep.c
> index e996c4744a..ed0832810b 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -234,6 +234,11 @@ bool qemu_has_ofd_lock(void)
>  #endif
>  }
>=20
> +int qemu_fd_param(const char *fdname, Error **errp)
> +{
> +    return monitor_fd_param(monitor_cur(), fdname, errp);
> +}

I'm not sure. If it works with modules enabled/disabled,
qemu-io/qemu-img/etc, and qemu-user then I guess this solution is okay.

Sorry I don't know the answer!

Stefan

--11bBJhi2+JI8u9EZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRSYPoACgkQnKSrs4Gr
c8gE7wf9HRgiuzv0YTF5qC3p+p+a9LL5PtKdexAgmSjEoCFZeDtLYbpqblUfwN69
SISA0z6wbT5HndCaGuixy/Dm98RmJpoDWz2pVnoUgY5t+sscdxgAuX/ZIyhR8veC
zQLI9e2EMeO3q9Nd3CotuaQ3eUil8NG6XJnNwfcWV/g9LEQUOYpYVysrmdkn/ZsP
pA6dlUHJx2kXVmF1ONxQMNcs/1DZLwe0UHvQIT2b4YrjdxyGvoVgL33PywSYNKw0
zY3pxEpLQcGgfk5ub9pPr0QB0amvwXbppUXBR5Qk8Vfs3bf6TwJLmWogyPRPt6Ij
4YSeVZTLH+vdShPVX6riCY22o9nAWQ==
=1kCd
-----END PGP SIGNATURE-----

--11bBJhi2+JI8u9EZ--


