Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462124F79E5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 10:36:26 +0200 (CEST)
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncNcv-0008Bd-56
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 04:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ncNb0-0006TB-1p
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ncNax-00059Q-A5
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649320462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yTs4rfBAujjJ6oqqBGVxlCIFlTtK31RFEreLdCCs8MM=;
 b=gwMQlTXnHYzweJkHD7tBV+V4rTdAQEe14Ub1kHNVRhpKFTe5Widro+chEauVZuNYYyzitN
 hiSfYXe5UnczapvkTQuslecJQRW82qbWMigiI5ObU333MREIS46sZwLc6FRitKSnE1QSHT
 gT/Xo55z3SCNcaxLfC1LL43KME5uMyM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-WmcALrw0NJKnOuAXY7dBkw-1; Thu, 07 Apr 2022 04:34:18 -0400
X-MC-Unique: WmcALrw0NJKnOuAXY7dBkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20D503811A43;
 Thu,  7 Apr 2022 08:34:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8092145BA46;
 Thu,  7 Apr 2022 08:34:10 +0000 (UTC)
Date: Thu, 7 Apr 2022 10:34:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v2 1/8] blkio: add io_uring block driver using libblkio
Message-ID: <Yk6h/0vXTcTByXO+@redhat.com>
References: <20220405153323.2082242-1-stefanha@redhat.com>
 <20220405153323.2082242-2-stefanha@redhat.com>
 <Yk3OlNBaEifS9bZD@redhat.com>
 <Yk6RJ2GScOVajsJD@stefanha-x1.localdomain>
 <Yk6f8K0yOVp0QoPu@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/SzGpUyoqWH5NRlP"
Content-Disposition: inline
In-Reply-To: <Yk6f8K0yOVp0QoPu@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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


--/SzGpUyoqWH5NRlP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 07.04.2022 um 10:25 hat Kevin Wolf geschrieben:
> Am 07.04.2022 um 09:22 hat Stefan Hajnoczi geschrieben:
> > On Wed, Apr 06, 2022 at 07:32:04PM +0200, Kevin Wolf wrote:
> > > Am 05.04.2022 um 17:33 hat Stefan Hajnoczi geschrieben:
> > > > libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> > > > high-performance disk I/O. It currently supports io_uring with
> > > > additional drivers planned.
> > > >=20
> > > > One of the reasons for developing libblkio is that other applicatio=
ns
> > > > besides QEMU can use it. This will be particularly useful for
> > > > vhost-user-blk which applications may wish to use for connecting to
> > > > qemu-storage-daemon.
> > > >=20
> > > > libblkio also gives us an opportunity to develop in Rust behind a C=
 API
> > > > that is easy to consume from QEMU.
> > > >=20
> > > > This commit adds an io_uring BlockDriver to QEMU using libblkio. Fo=
r now
> > > > I/O buffers are copied through bounce buffers if the libblkio driver
> > > > requires it. Later commits add an optimization for pre-registering =
guest
> > > > RAM to avoid bounce buffers. It will be easy to add other libblkio
> > > > drivers since they will share the majority of code.
> > > >=20
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > >=20
> > > > +static BlockDriver bdrv_io_uring =3D {
> > > > +    .format_name                =3D "io_uring",
> > > > +    .protocol_name              =3D "io_uring",
> > > > +    .instance_size              =3D sizeof(BDRVBlkioState),
> > > > +    .bdrv_needs_filename        =3D true,
> > > > +    .bdrv_parse_filename        =3D blkio_parse_filename_io_uring,
> > > > +    .bdrv_file_open             =3D blkio_file_open,
> > > > +    .bdrv_close                 =3D blkio_close,
> > > > +    .bdrv_getlength             =3D blkio_getlength,
> > > > +    .has_variable_length        =3D true,
> > >=20
> > > This one is a bad idea. It means that every request will call
> > > blkio_getlength() first, which looks up the "capacity" property in
> > > libblkio and then calls lseek() for the io_uring backend.
> >=20
> > Thanks for pointing this out. I didn't think this through. More below on
> > what I was trying to do.
> >=20
> > > For other backends like the vhost_user one (where I just copied your
> > > definition and then noticed this behaviour), it involve a message over
> > > the vhost socket, which is even worse.
> >=20
> > (A vhost-user-blk driver could cache the capacity field and update it
> > when a Configuration Change Notification is received. There is no need
> > to send a vhost-user protocol message every time.)
>=20
> In theory we could cache in libblkio, but then we would need a mechanism
> to invalidate the cache so we can support resizing an image (similar to
> what block_resize does in QEMU, except that it wouldn't set the new
> size from a parameter, but just get the new value from the backend).

Oh, sorry, I misread. VHOST_USER_SLAVE_CONFIG_CHANGE_MSG is probably
what you mean, so that the backend triggers the update. It exists in the
spec, but neither libvhost-user nor rust-vmm seem to support it
currently. We also don't set up the backchannel yet where this message
could even be passed.

So it's an option, but probably only for later because it involves
extending several places.

> I think it's simpler to leave caching to the application - and QEMU
> already does this automatically if we don't set .has_variable_length =3D
> true.

I still think the application shouldn't query the capacity more often
than necessary, so optimising it is probably not very important.

Kevin

--/SzGpUyoqWH5NRlP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmJOof8ACgkQfwmycsiP
L9b+3RAAvtekNu9C/t0o59AKURrSULEIWsC0ydX4on934ppbNHH1Js/JeUR1qtsX
mkaxN36jsG3d2SdoTRYomBDzOgZ45A/eHzYl5M05LP9IkuWJgMMxjN+GUT47M9d9
6PMAoSdMZCzSVw5HIIm/qcRKYRBfwo2uDko5AGfIvPhTCAB0GkABz+2QvMEHaUU1
y8BFBGNjwpUqULxnndgoJfENKnZDEyfx+X2FDsz3Pd+NxhyW8K/GUf5Rwhyz33Ct
/asdnkOA4sAQeQvQb7Wfps/44YAXt62+HUO/07P+TlQvQW6PiZo3frBAWuC7Ik++
erqkWiXssttccEiRVm4p4v4AJqpvNVc1ymcnm1LVYOLlkd7MmXt+gDnBKZthjT07
dP0eWZDtJVLkT47WeY+WrCrmirIWkCgu3m4mcIbb5uj4gJqFtXhnNFA0y2s6cZ3p
VFECZW0nLbpTetarnxbz1F8hKq7Rkt8NkdV4pTjl0iVO3575QSAjo81WF1XKdKMx
AxJu+G4abRfbkkDRyQCYgJogkIb5aLFfWtKf8EMzKGgi0E3vG0y6G6tQ/slbH12y
GIqgAyQULGIed0wWNm0ZsRNu72gJLYYEvzo7uZ3l88vxBLATE+HddAoZuF1wlHzB
VaYUsGVyL4IHDdW5xYFxtlrgHyM+rwsAhSDn5LzcAI651j03yiE=
=RcG0
-----END PGP SIGNATURE-----

--/SzGpUyoqWH5NRlP--


