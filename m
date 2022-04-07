Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873AF4F7769
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 09:24:38 +0200 (CEST)
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncMVR-0004Uu-FM
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 03:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ncMTS-0003fx-6O
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 03:22:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ncMTP-0008Uo-Bo
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 03:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649316150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0W+MR6VYyIOa3CMNCmIE+Nk35cIq3ohT9FCThlqt8dY=;
 b=JBFeE8Za2Mx7lLD+QSD7Z2mTHS+VeupXhCOKlKktPRr4bl1b0j8llWzea9XDbfae0KqkfP
 C2gScFU0GghRGEu7mbgzf5lVS/4Z0xeQn0OhMiiGXbHI4cHeLMIzSV79uamAUVv1AJdAvK
 HQQnUEUV12fDi8Is3EUrrafPSIhv8nE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-LRLLVFaqMWiW6OE_ctrylw-1; Thu, 07 Apr 2022 03:22:26 -0400
X-MC-Unique: LRLLVFaqMWiW6OE_ctrylw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08CBA80418B;
 Thu,  7 Apr 2022 07:22:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4130C404729B;
 Thu,  7 Apr 2022 07:22:17 +0000 (UTC)
Date: Thu, 7 Apr 2022 08:22:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC v2 1/8] blkio: add io_uring block driver using libblkio
Message-ID: <Yk6RJ2GScOVajsJD@stefanha-x1.localdomain>
References: <20220405153323.2082242-1-stefanha@redhat.com>
 <20220405153323.2082242-2-stefanha@redhat.com>
 <Yk3OlNBaEifS9bZD@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EIVaJ/fNIl7YYLTF"
Content-Disposition: inline
In-Reply-To: <Yk3OlNBaEifS9bZD@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--EIVaJ/fNIl7YYLTF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2022 at 07:32:04PM +0200, Kevin Wolf wrote:
> Am 05.04.2022 um 17:33 hat Stefan Hajnoczi geschrieben:
> > libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> > high-performance disk I/O. It currently supports io_uring with
> > additional drivers planned.
> >=20
> > One of the reasons for developing libblkio is that other applications
> > besides QEMU can use it. This will be particularly useful for
> > vhost-user-blk which applications may wish to use for connecting to
> > qemu-storage-daemon.
> >=20
> > libblkio also gives us an opportunity to develop in Rust behind a C API
> > that is easy to consume from QEMU.
> >=20
> > This commit adds an io_uring BlockDriver to QEMU using libblkio. For now
> > I/O buffers are copied through bounce buffers if the libblkio driver
> > requires it. Later commits add an optimization for pre-registering guest
> > RAM to avoid bounce buffers. It will be easy to add other libblkio
> > drivers since they will share the majority of code.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> > +static BlockDriver bdrv_io_uring =3D {
> > +    .format_name                =3D "io_uring",
> > +    .protocol_name              =3D "io_uring",
> > +    .instance_size              =3D sizeof(BDRVBlkioState),
> > +    .bdrv_needs_filename        =3D true,
> > +    .bdrv_parse_filename        =3D blkio_parse_filename_io_uring,
> > +    .bdrv_file_open             =3D blkio_file_open,
> > +    .bdrv_close                 =3D blkio_close,
> > +    .bdrv_getlength             =3D blkio_getlength,
> > +    .has_variable_length        =3D true,
>=20
> This one is a bad idea. It means that every request will call
> blkio_getlength() first, which looks up the "capacity" property in
> libblkio and then calls lseek() for the io_uring backend.

Thanks for pointing this out. I didn't think this through. More below on
what I was trying to do.

> For other backends like the vhost_user one (where I just copied your
> definition and then noticed this behaviour), it involve a message over
> the vhost socket, which is even worse.

(A vhost-user-blk driver could cache the capacity field and update it
when a Configuration Change Notification is received. There is no need
to send a vhost-user protocol message every time.)

> .has_variable_length was only meant for the host_floppy/cdrom drivers
> that have to deal with media change. Everything else just requires an
> explicit block_resize monitor command to be resized.

I was trying to support devices that can be resized below QEMU (e.g.
vhost-user-blk, vhost-vdpa-blk, and virtio-blk-pci). That was
unnecessary since QEMU doesn't support that model. If an LVM volume is
resized, for example, you still need to execute a monitor command to let
QEMU know.

I'll drop .has_variable_length.

Stefan

--EIVaJ/fNIl7YYLTF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJOkScACgkQnKSrs4Gr
c8jGOQf9ELBQ5ycW9s0vuMeNILwray4ZLFl/0CWYnpKDCLZgKEsTDNYUg7QTNJ9i
0mgBgmSygMa7hhus6A60+J2X3VFF19nGCQNrrDi9fEmb+Xgd4VOvMcmTzfmOF2H3
YBzJwpSyKQmFiPHGpfCbnUrin79sbkVEDTjfnLKoFhonu++qFqNrd/LSY326vtHQ
ZGmPguiyokml9b0yMiT8rMKIN5dZaFbfjnaI4Ue0afcZkUQZhrKIGA3I2s3gZkxw
WUIMj7fYl0tv4+/hSdxKIeNiW/tGSvvc+uI91uVT+X2A62KjHW/tFGk/fMqUlmsp
Qd2plrsTw8fXWUP7vtSthC5XIa9R8Q==
=kJj1
-----END PGP SIGNATURE-----

--EIVaJ/fNIl7YYLTF--


