Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB3444BE47
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:09:27 +0100 (CET)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkXm-0002Hr-Hf
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:09:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mkkW1-0001Wc-UG
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:07:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mkkVw-00021Y-8a
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636538851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hap6m+lNi64CHP69ykTtAsmX2qOGLis8eTfxstHKV6o=;
 b=gR/WWaXB7bZ116B9a+ZyhcOef0saTiK4U4c7woMdxLuhb5BChAsHWXfGBlLq6YFTjyPQnL
 fXFVKQsXbNrCXu2pNZtt4jxqiiAyzmU8RYCXghShHtoop8+5p9Lb032EfUij7qZJADNEjc
 RewIqOlZLL/OJTZTynAbCkq/lz9w0Pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-4AzMKL4ZNJqRVLb23iiDCQ-1; Wed, 10 Nov 2021 05:07:27 -0500
X-MC-Unique: 4AzMKL4ZNJqRVLb23iiDCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FDDC1926DD3;
 Wed, 10 Nov 2021 10:07:24 +0000 (UTC)
Received: from localhost (unknown [10.39.193.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69DCF10016F2;
 Wed, 10 Nov 2021 10:05:51 +0000 (UTC)
Date: Wed, 10 Nov 2021 10:05:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Message-ID: <YYuZfkfbxcX0JDRN@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <10421947.PG2v2feK4y@silver>
 <YYpT4ybSiaon19UP@stefanha-x1.localdomain>
 <25571471.tMsSMU6axZ@silver>
MIME-Version: 1.0
In-Reply-To: <25571471.tMsSMU6axZ@silver>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eestfZp/R6WSRbB0"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--eestfZp/R6WSRbB0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 02:09:59PM +0100, Christian Schoenebeck wrote:
> On Dienstag, 9. November 2021 11:56:35 CET Stefan Hajnoczi wrote:
> > On Thu, Nov 04, 2021 at 03:41:23PM +0100, Christian Schoenebeck wrote:
> > > On Mittwoch, 3. November 2021 12:33:33 CET Stefan Hajnoczi wrote:
> > > > On Mon, Nov 01, 2021 at 09:29:26PM +0100, Christian Schoenebeck wro=
te:
> > > > > On Donnerstag, 28. Oktober 2021 11:00:48 CET Stefan Hajnoczi wrot=
e:
> > > > > > On Mon, Oct 25, 2021 at 05:03:25PM +0200, Christian Schoenebeck=
=20
> wrote:
> > > > > > > On Montag, 25. Oktober 2021 12:30:41 CEST Stefan Hajnoczi wro=
te:
> > > > > > > > On Thu, Oct 21, 2021 at 05:39:28PM +0200, Christian Schoene=
beck=20
> wrote:
> > > > > > > > > On Freitag, 8. Oktober 2021 18:08:48 CEST Christian=20
> Schoenebeck wrote:
> > > > > > > > > > On Freitag, 8. Oktober 2021 16:24:42 CEST Christian=20
> Schoenebeck wrote:
> > > > > > > > > > > On Freitag, 8. Oktober 2021 09:25:33 CEST Greg Kurz w=
rote:
> > > > > > > > > > > > On Thu, 7 Oct 2021 16:42:49 +0100
> > > > > > > > > > > >=20
> > > > > > > > > > > > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > > > > > > > > > > > On Thu, Oct 07, 2021 at 02:51:55PM +0200, Christi=
an=20
> Schoenebeck wrote:
> > > > > > > > > > > > > > On Donnerstag, 7. Oktober 2021 07:23:59 CEST St=
efan=20
> Hajnoczi wrote:
> > > > > > > > > > > > > > > On Mon, Oct 04, 2021 at 09:38:00PM +0200,
> > > > > > > > > > > > > > > Christian
> > > > > > > > > > > > > > > Schoenebeck
> > > > > > > > > >=20
> > > > > > > > > > wrote:
> > > > > > > > > > > > > > > > At the moment the maximum transfer size wit=
h
> > > > > > > > > > > > > > > > virtio
> > > > > > > > > > > > > > > > is
> > > > > > > > > > > > > > > > limited
> > > > > > > > > > > > > > > > to
> > > > > > > > > > > > > > > > 4M
> > > > > > > > > > > > > > > > (1024 * PAGE_SIZE). This series raises this
> > > > > > > > > > > > > > > > limit to
> > > > > > > > > > > > > > > > its
> > > > > > > > > > > > > > > > maximum
> > > > > > > > > > > > > > > > theoretical possible transfer size of 128M =
(32k
> > > > > > > > > > > > > > > > pages)
> > > > > > > > > > > > > > > > according
> > > > > > > > > > > > > > > > to
> > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > virtio specs:
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > https://docs.oasis-open.org/virtio/virtio/v=
1.1/c
> > > > > > > > > > > > > > > > s01/
> > > > > > > > > > > > > > > > virt
> > > > > > > > > > > > > > > > io-v
> > > > > > > > > > > > > > > > 1.1-
> > > > > > > > > > > > > > > > cs
> > > > > > > > > > > > > > > > 01
> > > > > > > > > > > > > > > > .html#
> > > > > > > > > > > > > > > > x1-240006
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > Hi Christian,
> > > > > > > > > > > >=20
> > > > > > > > > > > > > > > I took a quick look at the code:
> > > > > > > > > > > > Hi,
> > > > > > > > > > > >=20
> > > > > > > > > > > > Thanks Stefan for sharing virtio expertise and help=
ing
> > > > > > > > > > > > Christian
> > > > > > > > > > > > !
> > > > > > > > > > > >=20
> > > > > > > > > > > > > > > - The Linux 9p driver restricts descriptor ch=
ains
> > > > > > > > > > > > > > > to
> > > > > > > > > > > > > > > 128
> > > > > > > > > > > > > > > elements
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > >   (net/9p/trans_virtio.c:VIRTQUEUE_NUM)
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Yes, that's the limitation that I am about to r=
emove
> > > > > > > > > > > > > > (WIP);
> > > > > > > > > > > > > > current
> > > > > > > > > > > > > > kernel
> > > > > > > > > > > > > > patches:
> > > > > > > > > > > > > > https://lore.kernel.org/netdev/cover.1632327421=
.git.
> > > > > > > > > > > > > > linu
> > > > > > > > > > > > > > x_os
> > > > > > > > > > > > > > s@cr
> > > > > > > > > > > > > > udeb
> > > > > > > > > > > > > > yt
> > > > > > > > > > > > > > e.
> > > > > > > > > > > > > > com/>
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > I haven't read the patches yet but I'm concerned =
that
> > > > > > > > > > > > > today
> > > > > > > > > > > > > the
> > > > > > > > > > > > > driver
> > > > > > > > > > > > > is pretty well-behaved and this new patch series
> > > > > > > > > > > > > introduces a
> > > > > > > > > > > > > spec
> > > > > > > > > > > > > violation. Not fixing existing spec violations is
> > > > > > > > > > > > > okay,
> > > > > > > > > > > > > but
> > > > > > > > > > > > > adding
> > > > > > > > > > > > > new
> > > > > > > > > > > > > ones is a red flag. I think we need to figure out=
 a
> > > > > > > > > > > > > clean
> > > > > > > > > > > > > solution.
> > > > > > > > > > >=20
> > > > > > > > > > > Nobody has reviewed the kernel patches yet. My main
> > > > > > > > > > > concern
> > > > > > > > > > > therefore
> > > > > > > > > > > actually is that the kernel patches are already too
> > > > > > > > > > > complex,
> > > > > > > > > > > because
> > > > > > > > > > > the
> > > > > > > > > > > current situation is that only Dominique is handling =
9p
> > > > > > > > > > > patches on
> > > > > > > > > > > kernel
> > > > > > > > > > > side, and he barely has time for 9p anymore.
> > > > > > > > > > >=20
> > > > > > > > > > > Another reason for me to catch up on reading current
> > > > > > > > > > > kernel
> > > > > > > > > > > code
> > > > > > > > > > > and
> > > > > > > > > > > stepping in as reviewer of 9p on kernel side ASAP,
> > > > > > > > > > > independent
> > > > > > > > > > > of
> > > > > > > > > > > this
> > > > > > > > > > > issue.
> > > > > > > > > > >=20
> > > > > > > > > > > As for current kernel patches' complexity: I can cert=
ainly
> > > > > > > > > > > drop
> > > > > > > > > > > patch
> > > > > > > > > > > 7
> > > > > > > > > > > entirely as it is probably just overkill. Patch 4 is =
then
> > > > > > > > > > > the
> > > > > > > > > > > biggest
> > > > > > > > > > > chunk, I have to see if I can simplify it, and whethe=
r it
> > > > > > > > > > > would
> > > > > > > > > > > make
> > > > > > > > > > > sense to squash with patch 3.
> > > > > > > > > > >=20
> > > > > > > > > > > > > > > - The QEMU 9pfs code passes iovecs directly t=
o
> > > > > > > > > > > > > > > preadv(2)
> > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > will
> > > > > > > > > > > > > > > fail
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > >   with EINVAL when called with more than IOV_=
MAX
> > > > > > > > > > > > > > >   iovecs
> > > > > > > > > > > > > > >   (hw/9pfs/9p.c:v9fs_read())
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Hmm, which makes me wonder why I never encounte=
red
> > > > > > > > > > > > > > this
> > > > > > > > > > > > > > error
> > > > > > > > > > > > > > during
> > > > > > > > > > > > > > testing.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Most people will use the 9p qemu 'local' fs dri=
ver
> > > > > > > > > > > > > > backend
> > > > > > > > > > > > > > in
> > > > > > > > > > > > > > practice,
> > > > > > > > > > > > > > so
> > > > > > > > > > > > > > that v9fs_read() call would translate for most
> > > > > > > > > > > > > > people to
> > > > > > > > > > > > > > this
> > > > > > > > > > > > > > implementation on QEMU side (hw/9p/9p-local.c):
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > static ssize_t local_preadv(FsContext *ctx,
> > > > > > > > > > > > > > V9fsFidOpenState
> > > > > > > > > > > > > > *fs,
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > >                             const struct iovec =
*iov,
> > > > > > > > > > > > > >                             int iovcnt, off_t
> > > > > > > > > > > > > >                             offset)
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > {
> > > > > > > > > > > > > > #ifdef CONFIG_PREADV
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > >     return preadv(fs->fd, iov, iovcnt, offset);
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > #else
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > >     int err =3D lseek(fs->fd, offset, SEEK_SET)=
;
> > > > > > > > > > > > > >     if (err =3D=3D -1) {
> > > > > > > > > > > > > >    =20
> > > > > > > > > > > > > >         return err;
> > > > > > > > > > > > > >    =20
> > > > > > > > > > > > > >     } else {
> > > > > > > > > > > > > >    =20
> > > > > > > > > > > > > >         return readv(fs->fd, iov, iovcnt);
> > > > > > > > > > > > > >    =20
> > > > > > > > > > > > > >     }
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > #endif
> > > > > > > > > > > > > > }
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > Unless I misunderstood the code, neither side=
 can
> > > > > > > > > > > > > > > take
> > > > > > > > > > > > > > > advantage
> > > > > > > > > > > > > > > of
> > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > new 32k descriptor chain limit?
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > Thanks,
> > > > > > > > > > > > > > > Stefan
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > I need to check that when I have some more time=
. One
> > > > > > > > > > > > > > possible
> > > > > > > > > > > > > > explanation
> > > > > > > > > > > > > > might be that preadv() already has this wrapped=
 into
> > > > > > > > > > > > > > a
> > > > > > > > > > > > > > loop
> > > > > > > > > > > > > > in
> > > > > > > > > > > > > > its
> > > > > > > > > > > > > > implementation to circumvent a limit like IOV_M=
AX.
> > > > > > > > > > > > > > It
> > > > > > > > > > > > > > might
> > > > > > > > > > > > > > be
> > > > > > > > > > > > > > another
> > > > > > > > > > > > > > "it
> > > > > > > > > > > > > > works, but not portable" issue, but not sure.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > There are still a bunch of other issues I have =
to
> > > > > > > > > > > > > > resolve.
> > > > > > > > > > > > > > If
> > > > > > > > > > > > > > you
> > > > > > > > > > > > > > look
> > > > > > > > > > > > > > at
> > > > > > > > > > > > > > net/9p/client.c on kernel side, you'll notice t=
hat
> > > > > > > > > > > > > > it
> > > > > > > > > > > > > > basically
> > > > > > > > > > > > > > does
> > > > > > > > > > > > > > this ATM> >
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > >     kmalloc(msize);
> > > > > > > > > > > >=20
> > > > > > > > > > > > Note that this is done twice : once for the T messa=
ge
> > > > > > > > > > > > (client
> > > > > > > > > > > > request)
> > > > > > > > > > > > and
> > > > > > > > > > > > once for the R message (server answer). The 9p driv=
er
> > > > > > > > > > > > could
> > > > > > > > > > > > adjust
> > > > > > > > > > > > the
> > > > > > > > > > > > size
> > > > > > > > > > > > of the T message to what's really needed instead of
> > > > > > > > > > > > allocating
> > > > > > > > > > > > the
> > > > > > > > > > > > full
> > > > > > > > > > > > msize. R message size is not known though.
> > > > > > > > > > >=20
> > > > > > > > > > > Would it make sense adding a second virtio ring, dedi=
cated
> > > > > > > > > > > to
> > > > > > > > > > > server
> > > > > > > > > > > responses to solve this? IIRC 9p server already calcu=
lates
> > > > > > > > > > > appropriate
> > > > > > > > > > > exact sizes for each response type. So server could j=
ust
> > > > > > > > > > > push
> > > > > > > > > > > space
> > > > > > > > > > > that's
> > > > > > > > > > > really needed for its responses.
> > > > > > > > > > >=20
> > > > > > > > > > > > > > for every 9p request. So not only does it alloc=
ate
> > > > > > > > > > > > > > much
> > > > > > > > > > > > > > more
> > > > > > > > > > > > > > memory
> > > > > > > > > > > > > > for
> > > > > > > > > > > > > > every request than actually required (i.e. say =
9pfs
> > > > > > > > > > > > > > was
> > > > > > > > > > > > > > mounted
> > > > > > > > > > > > > > with
> > > > > > > > > > > > > > msize=3D8M, then a 9p request that actually wou=
ld just
> > > > > > > > > > > > > > need 1k
> > > > > > > > > > > > > > would
> > > > > > > > > > > > > > nevertheless allocate 8M), but also it allocate=
s >
> > > > > > > > > > > > > > PAGE_SIZE,
> > > > > > > > > > > > > > which
> > > > > > > > > > > > > > obviously may fail at any time.>
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > The PAGE_SIZE limitation sounds like a kmalloc() =
vs
> > > > > > > > > > > > > vmalloc()
> > > > > > > > > > > > > situation.
> > > > > > > > > > >=20
> > > > > > > > > > > Hu, I didn't even consider vmalloc(). I just tried th=
e
> > > > > > > > > > > kvmalloc()
> > > > > > > > > > > wrapper
> > > > > > > > > > > as a quick & dirty test, but it crashed in the same w=
ay as
> > > > > > > > > > > kmalloc()
> > > > > > > > > > > with
> > > > > > > > > > > large msize values immediately on mounting:
> > > > > > > > > > >=20
> > > > > > > > > > > diff --git a/net/9p/client.c b/net/9p/client.c
> > > > > > > > > > > index a75034fa249b..cfe300a4b6ca 100644
> > > > > > > > > > > --- a/net/9p/client.c
> > > > > > > > > > > +++ b/net/9p/client.c
> > > > > > > > > > > @@ -227,15 +227,18 @@ static int parse_opts(char *opt=
s,
> > > > > > > > > > > struct
> > > > > > > > > > > p9_client
> > > > > > > > > > > *clnt)
> > > > > > > > > > >=20
> > > > > > > > > > >  static int p9_fcall_init(struct p9_client *c, struct
> > > > > > > > > > >  p9_fcall
> > > > > > > > > > >  *fc,
> > > > > > > > > > > =20
> > > > > > > > > > >                          int alloc_msize)
> > > > > > > > > > > =20
> > > > > > > > > > >  {
> > > > > > > > > > >=20
> > > > > > > > > > > -       if (likely(c->fcall_cache) && alloc_msize =3D=
=3D
> > > > > > > > > > > c->msize)
> > > > > > > > > > > {
> > > > > > > > > > > +       //if (likely(c->fcall_cache) && alloc_msize =
=3D=3D
> > > > > > > > > > > c->msize) {
> > > > > > > > > > > +       if (false) {
> > > > > > > > > > >=20
> > > > > > > > > > >                 fc->sdata =3D
> > > > > > > > > > >                 kmem_cache_alloc(c->fcall_cache,
> > > > > > > > > > >                 GFP_NOFS);
> > > > > > > > > > >                 fc->cache =3D c->fcall_cache;
> > > > > > > > > > >        =20
> > > > > > > > > > >         } else {
> > > > > > > > > > >=20
> > > > > > > > > > > -               fc->sdata =3D kmalloc(alloc_msize,
> > > > > > > > > > > GFP_NOFS);
> > > > > > > > > > > +               fc->sdata =3D kvmalloc(alloc_msize,
> > > > > > > > > > > GFP_NOFS);
> > > > > > > > > >=20
> > > > > > > > > > Ok, GFP_NOFS -> GFP_KERNEL did the trick.
> > > > > > > > > >=20
> > > > > > > > > > Now I get:
> > > > > > > > > >    virtio: bogus descriptor or out of resources
> > > > > > > > > >=20
> > > > > > > > > > So, still some work ahead on both ends.
> > > > > > > > >=20
> > > > > > > > > Few hacks later (only changes on 9p client side) I got th=
is
> > > > > > > > > running
> > > > > > > > > stable
> > > > > > > > > now. The reason for the virtio error above was that kvmal=
loc()
> > > > > > > > > returns
> > > > > > > > > a
> > > > > > > > > non-logical kernel address for any kvmalloc(>4M), i.e. an
> > > > > > > > > address
> > > > > > > > > that
> > > > > > > > > is
> > > > > > > > > inaccessible from host side, hence that "bogus descriptor=
"
> > > > > > > > > message
> > > > > > > > > by
> > > > > > > > > QEMU.
> > > > > > > > > So I had to split those linear 9p client buffers into spa=
rse
> > > > > > > > > ones
> > > > > > > > > (set
> > > > > > > > > of
> > > > > > > > > individual pages).
> > > > > > > > >=20
> > > > > > > > > I tested this for some days with various virtio transmiss=
ion
> > > > > > > > > sizes
> > > > > > > > > and
> > > > > > > > > it
> > > > > > > > > works as expected up to 128 MB (more precisely: 128 MB re=
ad
> > > > > > > > > space
> > > > > > > > > +
> > > > > > > > > 128 MB
> > > > > > > > > write space per virtio round trip message).
> > > > > > > > >=20
> > > > > > > > > I did not encounter a show stopper for large virtio
> > > > > > > > > transmission
> > > > > > > > > sizes
> > > > > > > > > (4 MB ... 128 MB) on virtio level, neither as a result of
> > > > > > > > > testing,
> > > > > > > > > nor
> > > > > > > > > after reviewing the existing code.
> > > > > > > > >=20
> > > > > > > > > About IOV_MAX: that's apparently not an issue on virtio l=
evel.
> > > > > > > > > Most of
> > > > > > > > > the
> > > > > > > > > iovec code, both on Linux kernel side and on QEMU side do=
 not
> > > > > > > > > have
> > > > > > > > > this
> > > > > > > > > limitation. It is apparently however indeed a limitation =
for
> > > > > > > > > userland
> > > > > > > > > apps
> > > > > > > > > calling the Linux kernel's syscalls yet.
> > > > > > > > >=20
> > > > > > > > > Stefan, as it stands now, I am even more convinced that t=
he
> > > > > > > > > upper
> > > > > > > > > virtio
> > > > > > > > > transmission size limit should not be squeezed into the q=
ueue
> > > > > > > > > size
> > > > > > > > > argument of virtio_add_queue(). Not because of the previo=
us
> > > > > > > > > argument
> > > > > > > > > that
> > > > > > > > > it would waste space (~1MB), but rather because they are =
two
> > > > > > > > > different
> > > > > > > > > things. To outline this, just a quick recap of what happe=
ns
> > > > > > > > > exactly
> > > > > > > > > when
> > > > > > > > > a bulk message is pushed over the virtio wire (assuming v=
irtio
> > > > > > > > > "split"
> > > > > > > > > layout here):
> > > > > > > > >=20
> > > > > > > > > ---------- [recap-start] ----------
> > > > > > > > >=20
> > > > > > > > > For each bulk message sent guest <-> host, exactly *one* =
of
> > > > > > > > > the
> > > > > > > > > pre-allocated descriptors is taken and placed (subsequent=
ly)
> > > > > > > > > into
> > > > > > > > > exactly
> > > > > > > > > *one* position of the two available/used ring buffers. Th=
e
> > > > > > > > > actual
> > > > > > > > > descriptor table though, containing all the DMA addresses=
 of
> > > > > > > > > the
> > > > > > > > > message
> > > > > > > > > bulk data, is allocated just in time for each round trip
> > > > > > > > > message.
> > > > > > > > > Say,
> > > > > > > > > it
> > > > > > > > > is the first message sent, it yields in the following
> > > > > > > > > structure:
> > > > > > > > >=20
> > > > > > > > > Ring Buffer   Descriptor Table      Bulk Data Pages
> > > > > > > > >=20
> > > > > > > > >    +-+              +-+           +-----------------+
> > > > > > > > >   =20
> > > > > > > > >    |D|------------->|d|---------->| Bulk data block |
> > > > > > > > >   =20
> > > > > > > > >    +-+              |d|--------+  +-----------------+
> > > > > > > > >   =20
> > > > > > > > >    | |              |d|------+ |
> > > > > > > > >   =20
> > > > > > > > >    +-+               .       | |  +-----------------+
> > > > > > > > >   =20
> > > > > > > > >    | |               .       | +->| Bulk data block |
> > > > > > > > >    =20
> > > > > > > > >     .                .       |    +-----------------+
> > > > > > > > >     .               |d|-+    |
> > > > > > > > >     .               +-+ |    |    +-----------------+
> > > > > > > > >    =20
> > > > > > > > >    | |                  |    +--->| Bulk data block |
> > > > > > > > >   =20
> > > > > > > > >    +-+                  |         +-----------------+
> > > > > > > > >   =20
> > > > > > > > >    | |                  |                 .
> > > > > > > > >   =20
> > > > > > > > >    +-+                  |                 .
> > > > > > > > >   =20
> > > > > > > > >                         |                 .
> > > > > > > > >                         |        =20
> > > > > > > > >                         |         +-----------------+
> > > > > > > > >                        =20
> > > > > > > > >                         +-------->| Bulk data block |
> > > > > > > > >                        =20
> > > > > > > > >                                   +-----------------+
> > > > > > > > >=20
> > > > > > > > > Legend:
> > > > > > > > > D: pre-allocated descriptor
> > > > > > > > > d: just in time allocated descriptor
> > > > > > > > > -->: memory pointer (DMA)
> > > > > > > > >=20
> > > > > > > > > The bulk data blocks are allocated by the respective devi=
ce
> > > > > > > > > driver
> > > > > > > > > above
> > > > > > > > > virtio subsystem level (guest side).
> > > > > > > > >=20
> > > > > > > > > There are exactly as many descriptors pre-allocated (D) a=
s the
> > > > > > > > > size of
> > > > > > > > > a
> > > > > > > > > ring buffer.
> > > > > > > > >=20
> > > > > > > > > A "descriptor" is more or less just a chainable DMA memor=
y
> > > > > > > > > pointer;
> > > > > > > > > defined
> > > > > > > > > as:
> > > > > > > > >=20
> > > > > > > > > /* Virtio ring descriptors: 16 bytes.  These can chain
> > > > > > > > > together
> > > > > > > > > via
> > > > > > > > > "next". */ struct vring_desc {
> > > > > > > > >=20
> > > > > > > > > =09/* Address (guest-physical). */
> > > > > > > > > =09__virtio64 addr;
> > > > > > > > > =09/* Length. */
> > > > > > > > > =09__virtio32 len;
> > > > > > > > > =09/* The flags as indicated above. */
> > > > > > > > > =09__virtio16 flags;
> > > > > > > > > =09/* We chain unused descriptors via this, too */
> > > > > > > > > =09__virtio16 next;
> > > > > > > > >=20
> > > > > > > > > };
> > > > > > > > >=20
> > > > > > > > > There are 2 ring buffers; the "available" ring buffer is =
for
> > > > > > > > > sending a
> > > > > > > > > message guest->host (which will transmit DMA addresses of
> > > > > > > > > guest
> > > > > > > > > allocated
> > > > > > > > > bulk data blocks that are used for data sent to device, a=
nd
> > > > > > > > > separate
> > > > > > > > > guest allocated bulk data blocks that will be used by hos=
t
> > > > > > > > > side to
> > > > > > > > > place
> > > > > > > > > its response bulk data), and the "used" ring buffer is fo=
r
> > > > > > > > > sending
> > > > > > > > > host->guest to let guest know about host's response and t=
hat
> > > > > > > > > it
> > > > > > > > > could
> > > > > > > > > now
> > > > > > > > > safely consume and then deallocate the bulk data blocks
> > > > > > > > > subsequently.
> > > > > > > > >=20
> > > > > > > > > ---------- [recap-end] ----------
> > > > > > > > >=20
> > > > > > > > > So the "queue size" actually defines the ringbuffer size.=
 It
> > > > > > > > > does
> > > > > > > > > not
> > > > > > > > > define the maximum amount of descriptors. The "queue size=
"
> > > > > > > > > rather
> > > > > > > > > defines
> > > > > > > > > how many pending messages can be pushed into either one
> > > > > > > > > ringbuffer
> > > > > > > > > before
> > > > > > > > > the other side would need to wait until the counter side =
would
> > > > > > > > > step up
> > > > > > > > > (i.e. ring buffer full).
> > > > > > > > >=20
> > > > > > > > > The maximum amount of descriptors (what VIRTQUEUE_MAX_SIZ=
E
> > > > > > > > > actually
> > > > > > > > > is)
> > > > > > > > > OTOH defines the max. bulk data size that could be transm=
itted
> > > > > > > > > with
> > > > > > > > > each
> > > > > > > > > virtio round trip message.
> > > > > > > > >=20
> > > > > > > > > And in fact, 9p currently handles the virtio "queue size"=
 as
> > > > > > > > > directly
> > > > > > > > > associative with its maximum amount of active 9p requests=
 the
> > > > > > > > > server
> > > > > > > > > could
> > > > > > > > >=20
> > > > > > > > > handle simultaniously:
> > > > > > > > >   hw/9pfs/9p.h:#define MAX_REQ         128
> > > > > > > > >   hw/9pfs/9p.h:    V9fsPDU pdus[MAX_REQ];
> > > > > > > > >   hw/9pfs/virtio-9p-device.c:    v->vq =3D
> > > > > > > > >   virtio_add_queue(vdev,
> > > > > > > > >   MAX_REQ,
> > > > > > > > >  =20
> > > > > > > > >                                  handle_9p_output);
> > > > > > > > >=20
> > > > > > > > > So if I would change it like this, just for the purpose t=
o
> > > > > > > > > increase
> > > > > > > > > the
> > > > > > > > > max. virtio transmission size:
> > > > > > > > >=20
> > > > > > > > > --- a/hw/9pfs/virtio-9p-device.c
> > > > > > > > > +++ b/hw/9pfs/virtio-9p-device.c
> > > > > > > > > @@ -218,7 +218,7 @@ static void
> > > > > > > > > virtio_9p_device_realize(DeviceState
> > > > > > > > > *dev,
> > > > > > > > > Error **errp)>
> > > > > > > > >=20
> > > > > > > > >      v->config_size =3D sizeof(struct virtio_9p_config) +
> > > > > > > > >      strlen(s->fsconf.tag);
> > > > > > > > >      virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P,
> > > > > > > > >      v->config_size,
> > > > > > > > >     =20
> > > > > > > > >                  VIRTQUEUE_MAX_SIZE);
> > > > > > > > >=20
> > > > > > > > > -    v->vq =3D virtio_add_queue(vdev, MAX_REQ,
> > > > > > > > > handle_9p_output);
> > > > > > > > > +    v->vq =3D virtio_add_queue(vdev, 32*1024,
> > > > > > > > > handle_9p_output);
> > > > > > > > >=20
> > > > > > > > >  }
> > > > > > > > >=20
> > > > > > > > > Then it would require additional synchronization code on =
both
> > > > > > > > > ends
> > > > > > > > > and
> > > > > > > > > therefore unnecessary complexity, because it would now be
> > > > > > > > > possible
> > > > > > > > > that
> > > > > > > > > more requests are pushed into the ringbuffer than server =
could
> > > > > > > > > handle.
> > > > > > > > >=20
> > > > > > > > > There is one potential issue though that probably did jus=
tify
> > > > > > > > > the
> > > > > > > > > "don't
> > > > > > > > > exceed the queue size" rule:
> > > > > > > > >=20
> > > > > > > > > ATM the descriptor table is allocated (just in time) as *=
one*
> > > > > > > > > continuous
> > > > > > > > > buffer via kmalloc_array():
> > > > > > > > > https://github.com/torvalds/linux/blob/2f111a6fd5b5297b4e=
92f53
> > > > > > > > > 798c
> > > > > > > > > a086
> > > > > > > > > f7c7
> > > > > > > > > d33a4/drivers/virtio/virtio_ring.c#L440
> > > > > > > > >=20
> > > > > > > > > So assuming transmission size of 2 * 128 MB that
> > > > > > > > > kmalloc_array()
> > > > > > > > > call
> > > > > > > > > would
> > > > > > > > > yield in kmalloc(1M) and the latter might fail if guest h=
ad
> > > > > > > > > highly
> > > > > > > > > fragmented physical memory. For such kind of error case t=
here
> > > > > > > > > is
> > > > > > > > > currently a fallback path in virtqueue_add_split() that w=
ould
> > > > > > > > > then
> > > > > > > > > use
> > > > > > > > > the required amount of pre-allocated descriptors instead:
> > > > > > > > > https://github.com/torvalds/linux/blob/2f111a6fd5b5297b4e=
92f53
> > > > > > > > > 798c
> > > > > > > > > a086
> > > > > > > > > f7c7
> > > > > > > > > d33a4/drivers/virtio/virtio_ring.c#L525
> > > > > > > > >=20
> > > > > > > > > That fallback recovery path would no longer be viable if =
the
> > > > > > > > > queue
> > > > > > > > > size
> > > > > > > > > was
> > > > > > > > > exceeded. There would be alternatives though, e.g. by all=
owing
> > > > > > > > > to
> > > > > > > > > chain
> > > > > > > > > indirect descriptor tables (currently prohibited by the v=
irtio
> > > > > > > > > specs).
> > > > > > > >=20
> > > > > > > > Making the maximum number of descriptors independent of the
> > > > > > > > queue
> > > > > > > > size
> > > > > > > > requires a change to the VIRTIO spec since the two values a=
re
> > > > > > > > currently
> > > > > > > > explicitly tied together by the spec.
> > > > > > >=20
> > > > > > > Yes, that's what the virtio specs say. But they don't say why=
, nor
> > > > > > > did
> > > > > > > I
> > > > > > > hear a reason in this dicussion.
> > > > > > >=20
> > > > > > > That's why I invested time reviewing current virtio implement=
ation
> > > > > > > and
> > > > > > > specs, as well as actually testing exceeding that limit. And =
as I
> > > > > > > outlined in detail in my previous email, I only found one
> > > > > > > theoretical
> > > > > > > issue that could be addressed though.
> > > > > >=20
> > > > > > I agree that there is a limitation in the VIRTIO spec, but viol=
ating
> > > > > > the
> > > > > > spec isn't an acceptable solution:
> > > > > >=20
> > > > > > 1. QEMU and Linux aren't the only components that implement VIR=
TIO.
> > > > > > You
> > > > > >=20
> > > > > >    cannot make assumptions about their implementations because =
it
> > > > > >    may
> > > > > >    break spec-compliant implementations that you haven't looked=
 at.
> > > > > >   =20
> > > > > >    Your patches weren't able to increase Queue Size because som=
e
> > > > > >    device
> > > > > >    implementations break when descriptor chains are too long. T=
his
> > > > > >    shows
> > > > > >    there is a practical issue even in QEMU.
> > > > > >=20
> > > > > > 2. The specific spec violation that we discussed creates the pr=
oblem
> > > > > >=20
> > > > > >    that drivers can no longer determine the maximum description
> > > > > >    chain
> > > > > >    length. This in turn will lead to more implementation-specif=
ic
> > > > > >    assumptions being baked into drivers and cause problems with
> > > > > >    interoperability and future changes.
> > > > > >=20
> > > > > > The spec needs to be extended instead. I included an idea for h=
ow to
> > > > > > do
> > > > > > that below.
> > > > >=20
> > > > > Sure, I just wanted to see if there was a non-neglectable "hard" =
show
> > > > > stopper per se that I probably haven't seen yet. I have not quest=
ioned
> > > > > aiming a clean solution.
> > > > >=20
> > > > > Thanks for the clarification!
> > > > >=20
> > > > > > > > Before doing that, are there benchmark results showing that=
 1 MB
> > > > > > > > vs
> > > > > > > > 128
> > > > > > > > MB produces a performance improvement? I'm asking because i=
f
> > > > > > > > performance
> > > > > > > > with 1 MB is good then you can probably do that without hav=
ing
> > > > > > > > to
> > > > > > > > change
> > > > > > > > VIRTIO and also because it's counter-intuitive that 9p need=
s 128
> > > > > > > > MB
> > > > > > > > for
> > > > > > > > good performance when it's ultimately implemented on top of=
 disk
> > > > > > > > and
> > > > > > > > network I/O that have lower size limits.
> > > > > > >=20
> > > > > > > First some numbers, linear reading a 12 GB file:
> > > > > > >=20
> > > > > > > msize    average      notes
> > > > > > >=20
> > > > > > > 8 kB     52.0 MB/s    default msize of Linux kernel <v5.15
> > > > > > > 128 kB   624.8 MB/s   default msize of Linux kernel >=3Dv5.15
> > > > > > > 512 kB   1961 MB/s    current max. msize with any Linux kerne=
l
> > > > > > > <=3Dv5.15
> > > > > > > 1 MB     2551 MB/s    this msize would already violate virtio
> > > > > > > specs
> > > > > > > 2 MB     2521 MB/s    this msize would already violate virtio
> > > > > > > specs
> > > > > > > 4 MB     2628 MB/s    planned max. msize of my current kernel
> > > > > > > patches
> > > > > > > [1]
> > > > > >=20
> > > > > > How many descriptors are used? 4 MB can be covered by a single
> > > > > > descriptor if the data is physically contiguous in memory, so t=
his
> > > > > > data
> > > > > > doesn't demonstrate a need for more descriptors.
> > > > >=20
> > > > > No, in the last couple years there was apparently no kernel versi=
on
> > > > > that
> > > > > used just one descriptor, nor did my benchmarked version. Even th=
ough
> > > > > the
> > > > > Linux 9p client uses (yet) simple linear buffers (contiguous phys=
ical
> > > > > memory) on 9p client level, these are however split into PAGE_SIZ=
E
> > > > > chunks
> > > > > by function pack_sg_list() [1] before being fed to virtio level:
> > > > >=20
> > > > > static unsigned int rest_of_page(void *data)
> > > > > {
> > > > >=20
> > > > > =09return PAGE_SIZE - offset_in_page(data);
> > > > >=20
> > > > > }
> > > > > ...
> > > > > static int pack_sg_list(struct scatterlist *sg, int start,
> > > > >=20
> > > > > =09=09=09int limit, char *data, int count)
> > > > >=20
> > > > > {
> > > > >=20
> > > > > =09int s;
> > > > > =09int index =3D start;
> > > > > =09
> > > > > =09while (count) {
> > > > > =09
> > > > > =09=09s =3D rest_of_page(data);
> > > > > =09=09...
> > > > > =09=09sg_set_buf(&sg[index++], data, s);
> > > > > =09=09count -=3D s;
> > > > > =09=09data +=3D s;
> > > > > =09
> > > > > =09}
> > > > > =09...
> > > > >=20
> > > > > }
> > > > >=20
> > > > > [1]
> > > > > https://github.com/torvalds/linux/blob/19901165d90fdca1e57c9baa0d=
5b4c6
> > > > > 3d1
> > > > > 5c476a/net/9p/trans_virtio.c#L171
> > > > >=20
> > > > > So when sending 4MB over virtio wire, it would yield in 1k descri=
ptors
> > > > > ATM.
> > > > >=20
> > > > > I have wondered about this before, but did not question it, becau=
se
> > > > > due to
> > > > > the cross-platform nature I couldn't say for certain whether that=
's
> > > > > probably needed somewhere. I mean for the case virtio-PCI I know =
for
> > > > > sure
> > > > > that one descriptor (i.e. >PAGE_SIZE) would be fine, but I don't =
know
> > > > > if
> > > > > that applies to all buses and architectures.
> > > >=20
> > > > VIRTIO does not limit descriptor the descriptor len field to PAGE_S=
IZE,
> > > > so I don't think there is a limit at the VIRTIO level.
> > >=20
> > > So you are viewing this purely from virtio specs PoV: in the sense, i=
f it
> > > is not prohibited by the virtio specs, then it should work. Maybe.
> >=20
> > Limitations must be specified either in the 9P protocol or the VIRTIO
> > specification. Drivers and devices will not be able to operate correctl=
y
> > if there are limitations that aren't covered by the specs.
> >=20
> > Do you have something in mind that isn't covered by the specs?
>=20
> Not sure whether that's something that should be specified by the virtio=
=20
> specs, probably not. I simply do not know if there was any bus or archite=
cture=20
> that would have a limitation for max. size for a memory block passed per =
one=20
> DMA address.

Host-side limitations like that can exist. For example when a physical
storage device on the host has limits that the VIRTIO device does not
have. In this case both virtio-scsi and virtio-blk report those limits
to the guest so that the guest won't submit requests that the physical
device would reject. I guess networking MTU is kind of similar too. What
they have in common is that the limit needs to be reported to the guest,
typically using a VIRTIO Configuration Space field. It is an explicit
limit that is part of the host<->guest interface (VIRTIO spec, SCSI,
etc).

> > > > If this function coalesces adjacent pages then the descriptor chain
> > > > length issues could be reduced.
> > > >=20
> > > > > > > But again, this is not just about performance. My conclusion =
as
> > > > > > > described
> > > > > > > in my previous email is that virtio currently squeezes
> > > > > > >=20
> > > > > > > =09"max. simultanious amount of bulk messages"
> > > > > > >=20
> > > > > > > vs.
> > > > > > >=20
> > > > > > > =09"max. bulk data transmission size per bulk messaage"
> > > > > > >=20
> > > > > > > into the same configuration parameter, which is IMO inappropr=
iate
> > > > > > > and
> > > > > > > hence
> > > > > > > splitting them into 2 separate parameters when creating a que=
ue
> > > > > > > makes
> > > > > > > sense, independent of the performance benchmarks.
> > > > > > >=20
> > > > > > > [1]
> > > > > > > https://lore.kernel.org/netdev/cover.1632327421.git.linux_oss=
@crud
> > > > > > > ebyt
> > > > > > > e.c
> > > > > > > om/
> > > > > >=20
> > > > > > Some devices effectively already have this because the device
> > > > > > advertises
> > > > > > a maximum number of descriptors via device-specific mechanisms =
like
> > > > > > the
> > > > > > struct virtio_blk_config seg_max field. But today these fields =
can
> > > > > > only
> > > > > > reduce the maximum descriptor chain length because the spec sti=
ll
> > > > > > limits
> > > > > > the length to Queue Size.
> > > > > >=20
> > > > > > We can build on this approach to raise the length above Queue S=
ize.
> > > > > > This
> > > > > > approach has the advantage that the maximum number of segments =
isn't
> > > > > > per
> > > > > > device or per virtqueue, it's fine-grained. If the device suppo=
rts
> > > > > > two
> > > > > > requests types then different max descriptor chain limits could=
 be
> > > > > > given
> > > > > > for them by introducing two separate configuration space fields=
.
> > > > > >=20
> > > > > > Here are the corresponding spec changes:
> > > > > >=20
> > > > > > 1. A new feature bit called VIRTIO_RING_F_LARGE_INDIRECT_DESC i=
s
> > > > > > added
> > > > > >=20
> > > > > >    to indicate that indirect descriptor table size and maximum
> > > > > >    descriptor chain length are not limited by Queue Size value.
> > > > > >    (Maybe
> > > > > >    there still needs to be a limit like 2^15?)
> > > > >=20
> > > > > Sounds good to me!
> > > > >=20
> > > > > AFAIK it is effectively limited to 2^16 because of vring_desc->ne=
xt:
> > > > >=20
> > > > > /* Virtio ring descriptors: 16 bytes.  These can chain together v=
ia
> > > > > "next". */ struct vring_desc {
> > > > >=20
> > > > >         /* Address (guest-physical). */
> > > > >         __virtio64 addr;
> > > > >         /* Length. */
> > > > >         __virtio32 len;
> > > > >         /* The flags as indicated above. */
> > > > >         __virtio16 flags;
> > > > >         /* We chain unused descriptors via this, too */
> > > > >         __virtio16 next;
> > > > >=20
> > > > > };
> > > >=20
> > > > Yes, Split Virtqueues have a fundamental limit on indirect table si=
ze
> > > > due to the "next" field. Packed Virtqueue descriptors don't have a
> > > > "next" field so descriptor chains could be longer in theory (curren=
tly
> > > > forbidden by the spec).
> > > >=20
> > > > > > One thing that's messy is that we've been discussing the maximu=
m
> > > > > > descriptor chain length but 9p has the "msize" concept, which i=
sn't
> > > > > > aware of contiguous memory. It may be necessary to extend the 9=
p
> > > > > > driver
> > > > > > code to size requests not just according to their length in byt=
es
> > > > > > but
> > > > > > also according to the descriptor chain length. That's how the L=
inux
> > > > > > block layer deals with queue limits (struct queue_limits
> > > > > > max_segments vs
> > > > > > max_hw_sectors).
> > > > >=20
> > > > > Hmm, can't follow on that one. For what should that be needed in =
case
> > > > > of
> > > > > 9p? My plan was to limit msize by 9p client simply at session sta=
rt to
> > > > > whatever is the max. amount virtio descriptors supported by host =
and
> > > > > using PAGE_SIZE as size per descriptor, because that's what 9p cl=
ient
> > > > > actually does ATM (see above). So you think that should be change=
d to
> > > > > e.g. just one descriptor for 4MB, right?
> > > >=20
> > > > Limiting msize to the 9p transport device's maximum number of
> > > > descriptors is conservative (i.e. 128 descriptors =3D 512 KB msize)
> > > > because it doesn't take advantage of contiguous memory. I suggest
> > > > leaving msize alone, adding a separate limit at which requests are =
split
> > > > according to the maximum descriptor chain length, and tweaking
> > > > pack_sg_list() to coalesce adjacent pages.
> > > >=20
> > > > That way msize can be large without necessarily using lots of
> > > > descriptors (depending on the memory layout).
> > >=20
> > > That was actually a tempting solution. Because it would neither requi=
re
> > > changes to the virtio specs (at least for a while) and it would also =
work
> > > with older QEMU versions. And for that pack_sg_list() portion of the =
code
> > > it would work well and easy as the buffer passed to pack_sg_list() is
> > > contiguous already.
> > >=20
> > > However I just realized for the zero-copy version of the code that wo=
uld
> > > be
> > > more tricky. The ZC version already uses individual pages (struct pag=
e,
> > > hence PAGE_SIZE each) which are pinned, i.e. it uses pack_sg_list_p()=
 [1]
> > > in combination with p9_get_mapped_pages() [2]
> > >=20
> > > [1]
> > > https://github.com/torvalds/linux/blob/7ddb58cb0ecae8e8b6181d736a8766=
7cc9
> > > ab8389/net/9p/trans_virtio.c#L218 [2]
> > > https://github.com/torvalds/linux/blob/7ddb58cb0ecae8e8b6181d736a8766=
7cc9
> > > ab8389/net/9p/trans_virtio.c#L309
> > >=20
> > > So that would require much more work and code trying to sort and coal=
esce
> > > individual pages to contiguous physical memory for the sake of reduci=
ng
> > > virtio descriptors. And there is no guarantee that this is even possi=
ble.
> > > The kernel may simply return a non-contiguous set of pages which woul=
d
> > > eventually end up exceeding the virtio descriptor limit again.
> >=20
> > Order must be preserved so pages cannot be sorted by physical address.
> > How about simply coalescing when pages are adjacent?
>=20
> It would help, but not solve the issue we are talking about here: if 99% =
of=20
> the cases could successfully merge descriptors to stay below the descript=
or=20
> count limit, but in 1% of the cases it could not, then this still constru=
es a=20
> severe runtime issue that could trigger at any time.
>=20
> > > So looks like it was probably still easier and realistic to just add
> > > virtio
> > > capabilities for now for allowing to exceed current descriptor limit.
> >=20
> > I'm still not sure why virtio-net, virtio-blk, virtio-fs, etc perform
> > fine under today's limits while virtio-9p needs a much higher limit to
> > achieve good performance. Maybe there is an issue in a layer above the
> > vring that's causing the virtio-9p performance you've observed?
>=20
> Are you referring to (somewhat) recent benchmarks when saying those would=
 all=20
> still perform fine today?

I'm not referring to specific benchmark results. Just that none of those
devices needed to raise the descriptor chain length, so I'm surprised
that virtio-9p needs it because it's conceptually similar to these
devices.

> Vivek was running detailed benchmarks for virtiofs vs. 9p:
> https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg02704.html
>=20
> For the virtio aspect discussed here, only the benchmark configurations=
=20
> without cache are relevant (9p-none, vtfs-none) and under this aspect the=
=20
> situation seems to be quite similar between 9p and virtio-fs. You'll also=
 note=20
> once DAX is enabled (vtfs-none-dax) that apparently boosts virtio-fs=20
> performance significantly, which however seems to corelate to numbers whe=
n I=20
> am running 9p with msize > 300k. Note: Vivek was presumably running 9p=20
> effecively with msize=3D300k, as this was the kernel limitation at that t=
ime.

Agreed, virtio-9p and virtiofs are similar without caching.

I think we shouldn't consider DAX here since it bypasses the virtqueue.

> To bring things into relation: there are known performance aspects in 9p =
that=20
> can be improved, yes, both on Linux kernel side and on 9p server side in =
QEMU.=20
> For instance 9p server uses coroutines [1] and currently dispatches betwe=
en=20
> worker thread(s) and main thread too often per request (partly addressed=
=20
> already [2], but still WIP), which accumulates to overall latency. But Vi=
vek=20
> was actually using a 9p patch here which disabled coroutines entirely, wh=
ich=20
> suggests that the virtio transmission size limit still represents a=20
> bottleneck.

These results were collected with 4k block size. Neither msize nor the
descriptor chain length limits will be stressed, so I don't think these
results are relevant here.

Maybe a more relevant comparison would be virtio-9p, virtiofs, and
virtio-blk when block size is large (e.g. 1M). The Linux block layer in
the guest will split virtio-blk requests when they exceed the block
queue limits.

Stefan

>=20
> [1] https://wiki.qemu.org/Documentation/9p#Coroutines
> [2] https://wiki.qemu.org/Documentation/9p#Implementation_Plans
>=20
> Best regards,
> Christian Schoenebeck
>=20
>=20

--eestfZp/R6WSRbB0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGLmX4ACgkQnKSrs4Gr
c8ib+Qf/SKVx+e+woQwfvKZrZAOngttbg1kfU9RmuRPfwP2+OWFJFTfGlZAQFDr0
fwZRAZV15JXseHW1CkEwe5SUq7doi6PaVdmL5FaNHxmKJ+XwdMRmq/TVMA2KA6w2
Ny+hxinVZzRN1MDknaB6rB6qv3w2X/kkxZvKF6s7iNDYEYzITfri29w7lK6NI+6V
0xOg7ivlUqKYTJ3JIHYq73F/imKmVUR34AFGDFKAFlmSuOiGjvqltmSm3GEwbWzb
fZFp+nf0QqPG+FBtu9ixhZ7Svq2yjMy6eYYyrSRpIpOZWJNF/kP0ziSylaq2/oHp
FoA/coxSaKhMvlM4s2/upEMtxQRT2Q==
=ytbs
-----END PGP SIGNATURE-----

--eestfZp/R6WSRbB0--


