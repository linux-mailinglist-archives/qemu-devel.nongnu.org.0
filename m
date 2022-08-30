Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643AA5A6E68
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 22:23:46 +0200 (CEST)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT7lx-00075h-3i
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 16:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oT7hO-000482-PQ
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 16:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oT7hM-0004Z0-0v
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 16:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661890739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OnLtN/TlpoP0TdKeCUJ5aqshqha6fV5qBMpeZLj6bMg=;
 b=bGZ+ek3Seu27iH5XyWNjnO5lcg0f/4QRk7jY62ziY5ixIDSZ7GtuOWKaqPDzGZsG5HbvFd
 RSrnlsO0V7/RR7iw/LFInVYkIetQsthlO5IrdZ5a8BGOb7KQJAFhm7flUmcsBJYzZuX5rk
 cs3WWAH4ZwPkY0a3Ojifo+uh0D5cK2o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-l3n47Ok3P5aiZBbQeCvFIA-1; Tue, 30 Aug 2022 16:18:55 -0400
X-MC-Unique: l3n47Ok3P5aiZBbQeCvFIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4D702999B4C;
 Tue, 30 Aug 2022 20:18:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19E3F1121314;
 Tue, 30 Aug 2022 20:18:53 +0000 (UTC)
Date: Tue, 30 Aug 2022 16:18:52 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, integration@gluster.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, sgarzare@redhat.com,
 Alberto Faria <afaria@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Xie Changlong <xiechanglong.d@gmail.com>
Subject: Re: [RFC v4 01/11] blkio: add libblkio block driver
Message-ID: <Yw5wrI79q5wWV+KF@fedora>
References: <20220822222402.176088-1-stefanha@redhat.com>
 <20220822222402.176088-2-stefanha@redhat.com>
 <877d2qkx2v.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qWeLKRfB3sU7qG+L"
Content-Disposition: inline
In-Reply-To: <877d2qkx2v.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--qWeLKRfB3sU7qG+L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2022 at 09:30:16AM +0200, Markus Armbruster wrote:
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> > high-performance disk I/O. It currently supports io_uring,
> > virtio-blk-vhost-user, and virtio-blk-vhost-vdpa with additional drivers
> > under development.
> >
> > One of the reasons for developing libblkio is that other applications
> > besides QEMU can use it. This will be particularly useful for
> > virtio-blk-vhost-user which applications may wish to use for connecting
> > to qemu-storage-daemon.
> >
> > libblkio also gives us an opportunity to develop in Rust behind a C API
> > that is easy to consume from QEMU.
> >
> > This commit adds io_uring, virtio-blk-vhost-user, and
> > virtio-blk-vhost-vdpa BlockDrivers to QEMU using libblkio. It will be
> > easy to add other libblkio drivers since they will share the majority of
> > code.
> >
> > For now I/O buffers are copied through bounce buffers if the libblkio
> > driver requires it. Later commits add an optimization for
> > pre-registering guest RAM to avoid bounce buffers.
> >
> > The syntax is:
> >
> >   --blockdev io_uring,node-name=3Ddrive0,filename=3Dtest.img,readonly=
=3Don|off,cache.direct=3Don|off
> >
> > and:
> >
> >   --blockdev virtio-blk-vhost-vdpa,node-name=3Ddrive0,path=3D/dev/vdpa.=
=2E.,readonly=3Don|off
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  MAINTAINERS                   |   6 +
> >  meson_options.txt             |   2 +
> >  qapi/block-core.json          |  53 ++-
> >  meson.build                   |   9 +
> >  block/blkio.c                 | 725 ++++++++++++++++++++++++++++++++++
> >  tests/qtest/modules-test.c    |   3 +
> >  block/meson.build             |   1 +
> >  scripts/meson-buildoptions.sh |   3 +
> >  8 files changed, 800 insertions(+), 2 deletions(-)
> >  create mode 100644 block/blkio.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5ce4227ff6..f8ccd5954c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3397,6 +3397,12 @@ L: qemu-block@nongnu.org
> >  S: Maintained
> >  F: block/vdi.c
> > =20
> > +blkio
> > +M: Stefan Hajnoczi <stefanha@redhat.com>
> > +L: qemu-block@nongnu.org
> > +S: Maintained
> > +F: block/blkio.c
> > +
> >  iSCSI
> >  M: Ronnie Sahlberg <ronniesahlberg@gmail.com>
> >  M: Paolo Bonzini <pbonzini@redhat.com>
> > diff --git a/meson_options.txt b/meson_options.txt
> > index e58e158396..67d841a8d2 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -117,6 +117,8 @@ option('bzip2', type : 'feature', value : 'auto',
> >         description: 'bzip2 support for DMG images')
> >  option('cap_ng', type : 'feature', value : 'auto',
> >         description: 'cap_ng support')
> > +option('blkio', type : 'feature', value : 'auto',
> > +       description: 'libblkio block device driver')
> >  option('bpf', type : 'feature', value : 'auto',
> >          description: 'eBPF support')
> >  option('cocoa', type : 'feature', value : 'auto',
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index 2173e7734a..c8d217b50c 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -2951,11 +2951,16 @@
> >              'file', 'snapshot-access', 'ftp', 'ftps', 'gluster',
> >              {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
> >              {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
> > -            'http', 'https', 'iscsi',
> > +            'http', 'https',
> > +            { 'name': 'io_uring', 'if': 'CONFIG_BLKIO' },
> > +            'iscsi',
> >              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'para=
llels',
> >              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'r=
bd',
> >              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> > -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ]=
 }
> > +            'ssh', 'throttle', 'vdi', 'vhdx',
> > +            { 'name': 'virtio-blk-vhost-user', 'if': 'CONFIG_BLKIO' },
> > +            { 'name': 'virtio-blk-vhost-vdpa', 'if': 'CONFIG_BLKIO' },
> > +            'vmdk', 'vpc', 'vvfat' ] }
> > =20
> >  ##
> >  # @BlockdevOptionsFile:
> > @@ -3678,6 +3683,42 @@
> >              '*debug': 'int',
> >              '*logfile': 'str' } }
> > =20
> > +##
> > +# @BlockdevOptionsIoUring:
> > +#
> > +# Driver specific block device options for the io_uring backend.
> > +#
> > +# @filename: path to the image file
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'BlockdevOptionsIoUring',
> > +  'data': { 'filename': 'str' } }
> > +
> > +##
> > +# @BlockdevOptionsVirtioBlkVhostUser:
> > +#
> > +# Driver specific block device options for the virtio-blk-vhost-user b=
ackend.
> > +#
> > +# @path: path to the vhost-user UNIX domain socket.
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'BlockdevOptionsVirtioBlkVhostUser',
> > +  'data': { 'path': 'str' } }
> > +
> > +##
> > +# @BlockdevOptionsVirtioBlkVhostVdpa:
> > +#
> > +# Driver specific block device options for the virtio-blk-vhost-vdpa b=
ackend.
> > +#
> > +# @path: path to the vhost-vdpa character device.
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
> > +  'data': { 'path': 'str' } }
> > +
>=20
> We seem to be evenly split between 'filename' and 'path'.  Before the
> patch we have four uses of 'filename' in this schema file (ImageInfo,
> ImageCheck, BlockDriverOptionsFile, BlockdevCreateOptionsFile), and
> three of 'path' (BlockdevOptionsSsh, BlockdevOptionsGluster,
> BlockdevOptionsNfs).  There's also 'backing-file', 'data-file',
> 'backing-filename', 'file', and probably more (I stopped looking).
>=20
> I dislike 'path'.  For what it's worth, POSIX calls this "pathname", and
> the components "filename".  Everyday use hardly ever distinguishes
> between the two.  Plain "path", however, is commonly used for lists of
> directories.

Yes :/

Stefan

--qWeLKRfB3sU7qG+L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMOcKwACgkQnKSrs4Gr
c8h4MAf7BlCyiiWqT4Fl2uG9+bvlVAjSWothYzSM+7WHHOXeX3q4UTlayAkIHgQ8
Id+VpFvRjuiSfD5cduysxLj2znsGZ7Q25TMszk0OAVULc2IiurgI8EPU3rXh8ePH
U5yIlnA1NGuvJt+hHfzrUvhw3xtLEVIpn1Wo+50bW7vqEzbwza5caMu4p3TDaEu1
iwWxeiyWYdt+3k+3sbmHgJT4xHDHAYmmkv5i9FtVKszhCTgfqlJbvmTdvq0AYvRV
/ZvZkGgPTi1YjHdWbY5FFgeeqMwVNhDeZzpTs0TJglDe/vbCsxTsL+HuwPB9wIKz
1Rm0F3ycRs0cc6Asm97Mag31hb0kRA==
=P99S
-----END PGP SIGNATURE-----

--qWeLKRfB3sU7qG+L--


