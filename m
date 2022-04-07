Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7878E4F79E3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 10:34:35 +0200 (CEST)
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncNb8-0005xO-AH
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 04:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ncNST-0008By-Dh
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:25:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ncNSR-0003AY-EZ
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649319934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6xhXUjzragZAgao/LWkqyE4XiyNZGox0ayxkJqgSziA=;
 b=Lp59SPpywxRxjCc54VYHXCtlBE2BkfcQC7vJpYKlHadSl5Y+LR9Utd3UUnTSEBztwrXAqW
 2Hwdrel1fdafcRQNArSHxCy8ryZFogdjtl40+8iwBDpd0QadMiwijIL06fKkcTPFKoDlBP
 5ncVQKmnwC+Fwn7uuD3QUWHn4Q42gHg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-0ylK49RaP1GEHbCMFYftEg-1; Thu, 07 Apr 2022 04:25:31 -0400
X-MC-Unique: 0ylK49RaP1GEHbCMFYftEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E45D803FF2;
 Thu,  7 Apr 2022 08:25:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5567D40E80E0;
 Thu,  7 Apr 2022 08:25:23 +0000 (UTC)
Date: Thu, 7 Apr 2022 10:25:20 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v2 1/8] blkio: add io_uring block driver using libblkio
Message-ID: <Yk6f8K0yOVp0QoPu@redhat.com>
References: <20220405153323.2082242-1-stefanha@redhat.com>
 <20220405153323.2082242-2-stefanha@redhat.com>
 <Yk3OlNBaEifS9bZD@redhat.com>
 <Yk6RJ2GScOVajsJD@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H5Cpb1KyD2KCXO2a"
Content-Disposition: inline
In-Reply-To: <Yk6RJ2GScOVajsJD@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Alberto Faria <afaria@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--H5Cpb1KyD2KCXO2a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 07.04.2022 um 09:22 hat Stefan Hajnoczi geschrieben:
> On Wed, Apr 06, 2022 at 07:32:04PM +0200, Kevin Wolf wrote:
> > Am 05.04.2022 um 17:33 hat Stefan Hajnoczi geschrieben:
> > > libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> > > high-performance disk I/O. It currently supports io_uring with
> > > additional drivers planned.
> > >=20
> > > One of the reasons for developing libblkio is that other applications
> > > besides QEMU can use it. This will be particularly useful for
> > > vhost-user-blk which applications may wish to use for connecting to
> > > qemu-storage-daemon.
> > >=20
> > > libblkio also gives us an opportunity to develop in Rust behind a C A=
PI
> > > that is easy to consume from QEMU.
> > >=20
> > > This commit adds an io_uring BlockDriver to QEMU using libblkio. For =
now
> > > I/O buffers are copied through bounce buffers if the libblkio driver
> > > requires it. Later commits add an optimization for pre-registering gu=
est
> > > RAM to avoid bounce buffers. It will be easy to add other libblkio
> > > drivers since they will share the majority of code.
> > >=20
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> >=20
> > > +static BlockDriver bdrv_io_uring =3D {
> > > +    .format_name                =3D "io_uring",
> > > +    .protocol_name              =3D "io_uring",
> > > +    .instance_size              =3D sizeof(BDRVBlkioState),
> > > +    .bdrv_needs_filename        =3D true,
> > > +    .bdrv_parse_filename        =3D blkio_parse_filename_io_uring,
> > > +    .bdrv_file_open             =3D blkio_file_open,
> > > +    .bdrv_close                 =3D blkio_close,
> > > +    .bdrv_getlength             =3D blkio_getlength,
> > > +    .has_variable_length        =3D true,
> >=20
> > This one is a bad idea. It means that every request will call
> > blkio_getlength() first, which looks up the "capacity" property in
> > libblkio and then calls lseek() for the io_uring backend.
>=20
> Thanks for pointing this out. I didn't think this through. More below on
> what I was trying to do.
>=20
> > For other backends like the vhost_user one (where I just copied your
> > definition and then noticed this behaviour), it involve a message over
> > the vhost socket, which is even worse.
>=20
> (A vhost-user-blk driver could cache the capacity field and update it
> when a Configuration Change Notification is received. There is no need
> to send a vhost-user protocol message every time.)

In theory we could cache in libblkio, but then we would need a mechanism
to invalidate the cache so we can support resizing an image (similar to
what block_resize does in QEMU, except that it wouldn't set the new
size from a parameter, but just get the new value from the backend).

I think it's simpler to leave caching to the application - and QEMU
already does this automatically if we don't set .has_variable_length =3D
true.

Kevin

--H5Cpb1KyD2KCXO2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmJOn/AACgkQfwmycsiP
L9YT7xAAqc9RdtAfvcOMHcQNR2qnZOb8jBwfrEgnRpEQhjq7TUmD+bo5JoK0Kk1Q
83sdqq/zJs1v9I9pZFzf1r/kLCn/83h4+9c721e7R2sRWMAa/A14SK6t6OqkXW6W
q6goJ2nLjFRiFMEbE5DKe2Y6qIvXoLCT88t7fMMk27kHgwtJ/1e+2QnmlNHfuKRB
4GXKxFOkJKPb8vQO1DgaujLOIRSXwWi2GQcb0g+Kx/YkmomsYXR3k13baOTTDE3D
QWYIIg4gbVCI7W4zf7XWDT+xLA3IvFWYGTlMSJjDgfi7IkjKUXwze1/0hSZxr9ra
Dk4xkRkrSI6nC4G2I0Kon6kneeR3QqxXJ0bWBSwH9HDvXIDPK2sNIPt6d+XgyclW
FFXRg+7d7UifshV5rAYxgPVl1d1hBaTke9ka/6W9cRRhOGUYWI0ZsIReT/1vWCUM
Lc9usT43mNcpASvpliK3JF834xQVIjihNx/NreNLRTASguI9g0F37V4tqqjSbbat
YOvJWo741csfrAVx1XyRNqvGz68TEFh5uAZr39R9+KEB+mJq44XOkSXSOFTndPeR
RE1GUYqYTh8InGcRqF1m7P64ce8qDrjNAynZzvqW6qDg98okuvkazajMSVH5/s0o
6nuJo+vmRbd6aprFSxAKVkPWCogBJqREhH5jYtP0i+v/hz6/Xqs=
=Z1bv
-----END PGP SIGNATURE-----

--H5Cpb1KyD2KCXO2a--


