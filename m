Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA954FD312
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 10:46:22 +0200 (CEST)
Received: from localhost ([::1]:57406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neCAH-0002RJ-FX
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 04:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1neC7i-0001aG-LP
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 04:43:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1neC7e-0004CX-GL
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 04:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649753015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ceO+twxJsiMKdaGjWG0URf5LZexR32i/Un1ajVfYe1Q=;
 b=L946F9ekeNFehv6DZyBuYPQSyL9mgq0t1mP30K6qn4O1OcuDlFNBMYta9vXrraT7yNAlue
 L0eJMbvkZvHe3YRHrf91m/PS8rYkf6Pyd1vkFgONVzgxrW0X74HEqpj6b8HGyX8euXi66o
 TNXFdqOu1dvwtkvQXMUQ8w2tyxDrQZg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-eXSq_yZRMka4L03alP5lFA-1; Tue, 12 Apr 2022 04:43:31 -0400
X-MC-Unique: eXSq_yZRMka4L03alP5lFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4675483397A;
 Tue, 12 Apr 2022 08:43:31 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DBFF40D1B9B;
 Tue, 12 Apr 2022 08:43:29 +0000 (UTC)
Date: Tue, 12 Apr 2022 09:43:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC v2 1/8] blkio: add io_uring block driver using libblkio
Message-ID: <YlU7r+noKvJ8GN/u@stefanha-x1.localdomain>
References: <20220405153323.2082242-1-stefanha@redhat.com>
 <20220405153323.2082242-2-stefanha@redhat.com>
 <Yk3OlNBaEifS9bZD@redhat.com>
 <Yk6RJ2GScOVajsJD@stefanha-x1.localdomain>
 <Yk6f8K0yOVp0QoPu@redhat.com> <Yk6h/0vXTcTByXO+@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lA2qixUOfdpGvUTD"
Content-Disposition: inline
In-Reply-To: <Yk6h/0vXTcTByXO+@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Alberto Faria <afaria@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lA2qixUOfdpGvUTD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2022 at 10:34:07AM +0200, Kevin Wolf wrote:
> Am 07.04.2022 um 10:25 hat Kevin Wolf geschrieben:
> > Am 07.04.2022 um 09:22 hat Stefan Hajnoczi geschrieben:
> > > On Wed, Apr 06, 2022 at 07:32:04PM +0200, Kevin Wolf wrote:
> > > > Am 05.04.2022 um 17:33 hat Stefan Hajnoczi geschrieben:
> > > > > libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> > > > > high-performance disk I/O. It currently supports io_uring with
> > > > > additional drivers planned.
> > > > >=20
> > > > > One of the reasons for developing libblkio is that other applicat=
ions
> > > > > besides QEMU can use it. This will be particularly useful for
> > > > > vhost-user-blk which applications may wish to use for connecting =
to
> > > > > qemu-storage-daemon.
> > > > >=20
> > > > > libblkio also gives us an opportunity to develop in Rust behind a=
 C API
> > > > > that is easy to consume from QEMU.
> > > > >=20
> > > > > This commit adds an io_uring BlockDriver to QEMU using libblkio. =
For now
> > > > > I/O buffers are copied through bounce buffers if the libblkio dri=
ver
> > > > > requires it. Later commits add an optimization for pre-registerin=
g guest
> > > > > RAM to avoid bounce buffers. It will be easy to add other libblkio
> > > > > drivers since they will share the majority of code.
> > > > >=20
> > > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > >=20
> > > > > +static BlockDriver bdrv_io_uring =3D {
> > > > > +    .format_name                =3D "io_uring",
> > > > > +    .protocol_name              =3D "io_uring",
> > > > > +    .instance_size              =3D sizeof(BDRVBlkioState),
> > > > > +    .bdrv_needs_filename        =3D true,
> > > > > +    .bdrv_parse_filename        =3D blkio_parse_filename_io_urin=
g,
> > > > > +    .bdrv_file_open             =3D blkio_file_open,
> > > > > +    .bdrv_close                 =3D blkio_close,
> > > > > +    .bdrv_getlength             =3D blkio_getlength,
> > > > > +    .has_variable_length        =3D true,
> > > >=20
> > > > This one is a bad idea. It means that every request will call
> > > > blkio_getlength() first, which looks up the "capacity" property in
> > > > libblkio and then calls lseek() for the io_uring backend.
> > >=20
> > > Thanks for pointing this out. I didn't think this through. More below=
 on
> > > what I was trying to do.
> > >=20
> > > > For other backends like the vhost_user one (where I just copied your
> > > > definition and then noticed this behaviour), it involve a message o=
ver
> > > > the vhost socket, which is even worse.
> > >=20
> > > (A vhost-user-blk driver could cache the capacity field and update it
> > > when a Configuration Change Notification is received. There is no need
> > > to send a vhost-user protocol message every time.)
> >=20
> > In theory we could cache in libblkio, but then we would need a mechanism
> > to invalidate the cache so we can support resizing an image (similar to
> > what block_resize does in QEMU, except that it wouldn't set the new
> > size from a parameter, but just get the new value from the backend).
>=20
> Oh, sorry, I misread. VHOST_USER_SLAVE_CONFIG_CHANGE_MSG is probably
> what you mean, so that the backend triggers the update. It exists in the
> spec, but neither libvhost-user nor rust-vmm seem to support it
> currently. We also don't set up the backchannel yet where this message
> could even be passed.
>=20
> So it's an option, but probably only for later because it involves
> extending several places.

Agreed.

Stefan

--lA2qixUOfdpGvUTD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJVO68ACgkQnKSrs4Gr
c8gohAf/WYGXQP1Cd0aFzazCdec5FNt0U2CjzmRdvUQ6VY0lpdJ7Z2QweSt4oGeC
uoX8+lhYY5tljvA82Vuu6zfi5zuP2gD4wk3LgpiZjbxpyRirM7zIgUZjdXEFrLMn
VE8GiMplnKuc36wqn6H/Kh3ZOpcW1Zx22rJo0vvXEvdbHkWa4hws5ARSKGQ5k3Yo
sCbzT/1tkNYU5jcYf//TsSmR5KY+40vXQvPtKI+PijXPQIsdZGQUWRD2VIJvROnR
gbuQ5Kh0pk3MvhtYOskkisQyMJckSU7PXliJ7O6aCHDV54syPSriymvoldXSV2N2
LaeTSPywUFX83JC0hHwA7DBzsz+1MA==
=fZpW
-----END PGP SIGNATURE-----

--lA2qixUOfdpGvUTD--


