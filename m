Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32A5906E1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 21:12:24 +0200 (CEST)
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMDbT-0006wG-IY
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 15:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oMDZF-0003Oj-U7
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 15:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oMDZD-0001Aw-UX
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 15:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660245003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rDfv+8GgVRJAU021J5fi2MP03MTmpRcw+d8Q3GXn2m4=;
 b=WgNyzfwNQ4zBjvQZErw7Ecwk51ZBKyym1fGIXaBM/RKF1WAB+0exSqjV2M4W0tdZnYLbqS
 Yo9F8DCww1nKOsO6xo6an0ldSo1Rzj1z4BJ5jsBu5ULYzAweEBK8/nXRbmDkwceUBR4L7s
 iJdRj/LOj5dOwtQ7rPyeDMuXlzrMZ3E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-Rv5FofBVPn6xm7VxMlK0kg-1; Thu, 11 Aug 2022 15:09:59 -0400
X-MC-Unique: Rv5FofBVPn6xm7VxMlK0kg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49E5A3817A6F;
 Thu, 11 Aug 2022 19:09:59 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD530492C3B;
 Thu, 11 Aug 2022 19:09:58 +0000 (UTC)
Date: Thu, 11 Aug 2022 15:09:57 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>, pkrempa@redhat.com
Subject: Re: [RFC v3 1/8] blkio: add io_uring block driver using libblkio
Message-ID: <YvVUBVQnuaZPiPxZ@fedora>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-2-stefanha@redhat.com>
 <YuGTFJ3r7+MMAxhR@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+o9vgjHY/9JccPpf"
Content-Disposition: inline
In-Reply-To: <YuGTFJ3r7+MMAxhR@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--+o9vgjHY/9JccPpf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2022 at 09:33:40PM +0200, Kevin Wolf wrote:
> Am 08.07.2022 um 06:17 hat Stefan Hajnoczi geschrieben:
> > libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> > high-performance disk I/O. It currently supports io_uring and
> > virtio-blk-vhost-vdpa with additional drivers under development.
> >=20
> > One of the reasons for developing libblkio is that other applications
> > besides QEMU can use it. This will be particularly useful for
> > vhost-user-blk which applications may wish to use for connecting to
> > qemu-storage-daemon.
> >=20
> > libblkio also gives us an opportunity to develop in Rust behind a C API
> > that is easy to consume from QEMU.
> >=20
> > This commit adds io_uring and virtio-blk-vhost-vdpa BlockDrivers to QEMU
> > using libblkio. It will be easy to add other libblkio drivers since they
> > will share the majority of code.
> >=20
> > For now I/O buffers are copied through bounce buffers if the libblkio
> > driver requires it. Later commits add an optimization for
> > pre-registering guest RAM to avoid bounce buffers.
> >=20
> > The syntax is:
> >=20
> >   --blockdev io_uring,node-name=3Ddrive0,filename=3Dtest.img,readonly=
=3Don|off,cache.direct=3Don|off
> >=20
> > and:
> >=20
> >   --blockdev virtio-blk-vhost-vdpa,node-name=3Ddrive0,path=3D/dev/vdpa.=
=2E.,readonly=3Don|off
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> The subject line implies only io_uring, but you actually add vhost-vdpa
> support, too. I think the subject line should be changed.
>=20
> I think it would also make sense to already implement support for
> vhost-user-blk on the QEMU side even if support isn't compiled in
> libblkio by default and opening vhost-user-blk images would therefore
> always fail with a default build.
>=20
> But then you could run QEMU with a custom build of libblkio to make use
> of it without patching QEMU. This is probably useful for getting libvirt
> support for using a storage daemon implemented without having to wait
> for another QEMU release. (Peter, do you have any opinion on this?)

vhost-user-blk is now supported in all builds of libblkio. I'll add it.

Stefan

--+o9vgjHY/9JccPpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL1VAUACgkQnKSrs4Gr
c8jRPwgAtygtCZJA+ehKG3Cj9WM9Zsg9hU6wNkV2/zThXpZeoYlNXZlJ8Xe7Ed2d
NotW/aiNvIfoxdoAMnvu/FoiS/4p1JlMGL9hYbIeCzMit0ujtG1F5QFLD/4Jwd/k
Ug0jOBnyXgU6atcaSrgu4k3SL3eTotM0xch/bPaFHGgoXf7MnRE0TFQYqD5Mhv4A
V4onWXk6T02czNUOa8GfhMVbKjQEWaT5Z5pDJROQt1r47hK4AIHHmOXlw2dgWwLp
rgBahMg2B+SZE9ZpkuQo6KJN8oo7mC9GaMC32nqxBoehU934MePh7gpgUaHenxdJ
1aNlck0XKsTxD8zpBwciILMhp4rf4Q==
=OJCF
-----END PGP SIGNATURE-----

--+o9vgjHY/9JccPpf--


