Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FC74DB1E0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:51:11 +0100 (CET)
Received: from localhost ([::1]:53644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUU3T-0006Sx-2y
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:51:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUThO-0004o1-Vo
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUThN-0004oY-A6
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647437300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S82QGWQKtZsre+M1j070gfLUVJHfRW9rZg5K7t9S18M=;
 b=hGDSC6anCUcjiNvfsHTiHzJoYOd1WBNYIKAz7I0X8anpD/MWZauuXH0zFZtxUm0wXEHunt
 fK6esk9nlEcR8oTEchtYj1H9wu9xYszXm0R9wHkgdUC5fK6c+hPEZutbyyq9bgaGawJcOQ
 9ugTZHDQ6ajEgArQ8NaucbDl1KUmYYU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-m-b3PbLLOLqfsJy4LXtxFQ-1; Wed, 16 Mar 2022 09:28:14 -0400
X-MC-Unique: m-b3PbLLOLqfsJy4LXtxFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5F041801387;
 Wed, 16 Mar 2022 13:28:13 +0000 (UTC)
Received: from localhost (unknown [10.39.193.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED41EC50941;
 Wed, 16 Mar 2022 13:28:12 +0000 (UTC)
Date: Wed, 16 Mar 2022 13:28:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: [PATCH v2 3/6] libvduse: Add VDUSE (vDPA Device in Userspace)
 library
Message-ID: <YjHl66pJYw45oKL9@stefanha-x1.localdomain>
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-4-xieyongji@bytedance.com>
 <YjBg3QnSnpY2cAdL@stefanha-x1.localdomain>
 <CACycT3s7cgHBAqmpy=RZPwPZz4uptr0REzJ9fhM1qv+G_miS1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WBeA7IhMfMgoqZA6"
Content-Disposition: inline
In-Reply-To: <CACycT3s7cgHBAqmpy=RZPwPZz4uptr0REzJ9fhM1qv+G_miS1Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WBeA7IhMfMgoqZA6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2022 at 07:38:12PM +0800, Yongji Xie wrote:
> On Tue, Mar 15, 2022 at 5:48 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Tue, Feb 15, 2022 at 06:59:40PM +0800, Xie Yongji wrote:
> > > VDUSE [1] is a linux framework that makes it possible to implement
> > > software-emulated vDPA devices in userspace. This adds a library
> > > as a subproject to help implementing VDUSE backends in QEMU.
> > >
> > > [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> > >
> > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > ---
> > >  meson.build                                 |   15 +
> > >  meson_options.txt                           |    2 +
> > >  scripts/meson-buildoptions.sh               |    3 +
> > >  subprojects/libvduse/include/atomic.h       |    1 +
> > >  subprojects/libvduse/libvduse.c             | 1152 +++++++++++++++++=
++
> > >  subprojects/libvduse/libvduse.h             |  225 ++++
> > >  subprojects/libvduse/linux-headers/linux    |    1 +
> > >  subprojects/libvduse/meson.build            |   10 +
> > >  subprojects/libvduse/standard-headers/linux |    1 +
> > >  9 files changed, 1410 insertions(+)
> > >  create mode 120000 subprojects/libvduse/include/atomic.h
> > >  create mode 100644 subprojects/libvduse/libvduse.c
> > >  create mode 100644 subprojects/libvduse/libvduse.h
> > >  create mode 120000 subprojects/libvduse/linux-headers/linux
> > >  create mode 100644 subprojects/libvduse/meson.build
> > >  create mode 120000 subprojects/libvduse/standard-headers/linux
> >
> > Please update the ./MAINTAINERS file when adding new source files.
>=20
> OK, sure. And would you mind being one of the maintainers since I'm
> not sure if I can do this job well.

You're welcome to become the maintainer. It means that you will be CCed
on patches affecting this code and sometimes people might send you
questions about VDUSE exports.

Is the issue lack of time?

Stefan

--WBeA7IhMfMgoqZA6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIx5esACgkQnKSrs4Gr
c8jUAAf+JL4IHxMe2kxLxV3Nxav0Pu+k+nzbxPYBPHkV7dlXCp5HMOL2PL0fStlq
8wN4HYwxZUFYp/ceUI2lRjp3TEGoXSrKPIy8mw/xpbexjDJirkD7GHgTTQFptyx/
pBi7q5nuXc+Yjs3Pm3IABm4QTLMYk0QGp+AzGFoiVIjtceHnWqkVXHIHOTGg72Yl
Ta9FwFv8U7Q6hr+eFcQ6FT2JUg5RxXpysSZ5rcrqrYKg3wlHFMLLSEmdVInvMI9v
pRgw+w60MGNqxjAodtHV2FYTVeGpTv3nt8afRFSGLSLA8uhgYOwlVZ1RaOvT0bls
KK9+QXcJkKixX0gfK+N2MGcnZi8kSQ==
=fcrp
-----END PGP SIGNATURE-----

--WBeA7IhMfMgoqZA6--


