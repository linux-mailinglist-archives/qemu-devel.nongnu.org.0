Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376B742653A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 09:29:53 +0200 (CEST)
Received: from localhost ([::1]:54588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYkKG-0008Ul-A6
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 03:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mYkHb-0006Kp-5I
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 03:27:07 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:60633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mYkHY-0005ED-5J
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 03:27:06 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-CZ0CE6uIPWasgl4vUNuhdw-1; Fri, 08 Oct 2021 03:26:49 -0400
X-MC-Unique: CZ0CE6uIPWasgl4vUNuhdw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 089931006AA7;
 Fri,  8 Oct 2021 07:26:48 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E9AA5C1CF;
 Fri,  8 Oct 2021 07:25:34 +0000 (UTC)
Date: Fri, 8 Oct 2021 09:25:33 +0200
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Message-ID: <20211008092533.376b568b@bahia.huguette>
In-Reply-To: <YV8VeaWiwD8DRFtz@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <YV6EbwMFmcIEC+za@stefanha-x1.localdomain>
 <2233456.PtHKNz60go@silver>
 <YV8VeaWiwD8DRFtz@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PwqkGmH=B9xsrqUY1mTMXrp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/PwqkGmH=B9xsrqUY1mTMXrp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Oct 2021 16:42:49 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Oct 07, 2021 at 02:51:55PM +0200, Christian Schoenebeck wrote:
> > On Donnerstag, 7. Oktober 2021 07:23:59 CEST Stefan Hajnoczi wrote:
> > > On Mon, Oct 04, 2021 at 09:38:00PM +0200, Christian Schoenebeck wrote:
> > > > At the moment the maximum transfer size with virtio is limited to 4M
> > > > (1024 * PAGE_SIZE). This series raises this limit to its maximum
> > > > theoretical possible transfer size of 128M (32k pages) according to=
 the
> > > > virtio specs:
> > > >=20
> > > > https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs0=
1.html#
> > > > x1-240006
> > > Hi Christian,
> > > I took a quick look at the code:
> > >=20


Hi,

Thanks Stefan for sharing virtio expertise and helping Christian !

> > > - The Linux 9p driver restricts descriptor chains to 128 elements
> > >   (net/9p/trans_virtio.c:VIRTQUEUE_NUM)
> >=20
> > Yes, that's the limitation that I am about to remove (WIP); current ker=
nel=20
> > patches:
> > https://lore.kernel.org/netdev/cover.1632327421.git.linux_oss@crudebyte=
.com/
>=20
> I haven't read the patches yet but I'm concerned that today the driver
> is pretty well-behaved and this new patch series introduces a spec
> violation. Not fixing existing spec violations is okay, but adding new
> ones is a red flag. I think we need to figure out a clean solution.
>=20
> > > - The QEMU 9pfs code passes iovecs directly to preadv(2) and will fail
> > >   with EINVAL when called with more than IOV_MAX iovecs
> > >   (hw/9pfs/9p.c:v9fs_read())
> >=20
> > Hmm, which makes me wonder why I never encountered this error during te=
sting.
> >=20
> > Most people will use the 9p qemu 'local' fs driver backend in practice,=
 so=20
> > that v9fs_read() call would translate for most people to this implement=
ation=20
> > on QEMU side (hw/9p/9p-local.c):
> >=20
> > static ssize_t local_preadv(FsContext *ctx, V9fsFidOpenState *fs,
> >                             const struct iovec *iov,
> >                             int iovcnt, off_t offset)
> > {
> > #ifdef CONFIG_PREADV
> >     return preadv(fs->fd, iov, iovcnt, offset);
> > #else
> >     int err =3D lseek(fs->fd, offset, SEEK_SET);
> >     if (err =3D=3D -1) {
> >         return err;
> >     } else {
> >         return readv(fs->fd, iov, iovcnt);
> >     }
> > #endif
> > }
> >=20
> > > Unless I misunderstood the code, neither side can take advantage of t=
he
> > > new 32k descriptor chain limit?
> > >=20
> > > Thanks,
> > > Stefan
> >=20
> > I need to check that when I have some more time. One possible explanati=
on=20
> > might be that preadv() already has this wrapped into a loop in its=20
> > implementation to circumvent a limit like IOV_MAX. It might be another =
"it=20
> > works, but not portable" issue, but not sure.
> >
> > There are still a bunch of other issues I have to resolve. If you look =
at
> > net/9p/client.c on kernel side, you'll notice that it basically does th=
is ATM
> >=20
> >     kmalloc(msize);
> >=20

Note that this is done twice : once for the T message (client request) and =
once
for the R message (server answer). The 9p driver could adjust the size of t=
he T
message to what's really needed instead of allocating the full msize. R mes=
sage
size is not known though.

> > for every 9p request. So not only does it allocate much more memory for=
 every=20
> > request than actually required (i.e. say 9pfs was mounted with msize=3D=
8M, then=20
> > a 9p request that actually would just need 1k would nevertheless alloca=
te 8M),=20
> > but also it allocates > PAGE_SIZE, which obviously may fail at any time.
>=20
> The PAGE_SIZE limitation sounds like a kmalloc() vs vmalloc() situation.
>=20
> I saw zerocopy code in the 9p guest driver but didn't investigate when
> it's used. Maybe that should be used for large requests (file
> reads/writes)?

This is the case already : zero-copy is only used for reads/writes/readdir
if the requested size is 1k or more.

Also you'll note that in this case, the 9p driver doesn't allocate msize
for the T/R messages but only 4k, which is largely enough to hold the
header.

	/*
	 * We allocate a inline protocol data of only 4k bytes.
	 * The actual content is passed in zero-copy fashion.
	 */
	req =3D p9_client_prepare_req(c, type, P9_ZC_HDR_SZ, fmt, ap);

and

/* size of header for zero copy read/write */
#define P9_ZC_HDR_SZ 4096

A huge msize only makes sense for Twrite, Rread and Rreaddir because
of the amount of data they convey. All other messages certainly fit
in a couple of kilobytes only (sorry, don't remember the numbers).

A first change should be to allocate MIN(XXX, msize) for the
regular non-zc case, where XXX could be a reasonable fixed
value (8k?). In the case of T messages, it is even possible
to adjust the size to what's exactly needed, ala snprintf(NULL).

> virtio-blk/scsi don't memcpy data into a new buffer, they
> directly access page cache or O_DIRECT pinned pages.
>=20
> Stefan

Cheers,

--
Greg

--Sig_/PwqkGmH=B9xsrqUY1mTMXrp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmFf8m0ACgkQcdTV5YIv
c9aU+BAAnCDtqb7h9QtDnzW5UzrvMFctYVfKaqbZHL8vHWf5AGiU3JtT4HwDsSlc
BivgjkI5oGkzuw2Q4WFufn6DK2mhOAaBKlec8Pwz/xJve3QKT6QrYuvVVA0S4PpI
tWAcqHVdO5mkCObw1khcH7JIWIyoFyQL5JU7JKY+6lwkS2w/lq7bJZVuJav09EQi
qp+t+v7gMUsIBwxzooPNFmjAPvV1rnFmp5zO6OaLYRZvL0L2ix2GO91nMm/ZmW7q
+yBIvqmQAZfFGEhTeZbG10tgzBPPze/3L0Xn0NFPnVk3wJ9P5946eU4qrXtJ90L7
slpOHMy0URg+Fms9UnFDST4ZPVT6zmBTJBzlqImMGsoKLr1qcw5WREIQ9CM8nVtS
twZ0E0P3Qfb6eSvNTxKHwHLyTYdyajeaOGubAWWlMMGgZDebvZHdGA1y37xAhTry
YZJOovfC/T1x9ILz09Fys6HnPXVC+i//DMrFeFy37aWsDc2G/AAOT7poh1Ol/raV
DewgzjjQ4aqTmApOhehZeErE6nv/UR1O/zMsBz4+gdDZN9l43Hii3lZ/4YkerdTF
6puMtH02/NQzK04K69GoGSMaHk3ARuZLbFNAl1iKFKaPx729YO7lur/Cq1mi/O/e
8fPI6ni/Iz0P3ku7K5U3o76GeQ05UuCL3nLF3WHopPmCgvuSIuM=
=+oHe
-----END PGP SIGNATURE-----

--Sig_/PwqkGmH=B9xsrqUY1mTMXrp--


