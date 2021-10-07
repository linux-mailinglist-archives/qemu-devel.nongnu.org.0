Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D5842573B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:57:03 +0200 (CEST)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYVlW-0007SM-Dm
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYVkK-0006eG-1g
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 11:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYVkE-00012s-23
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 11:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633622140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qLYAy9MMZo3MpjOyI7R0ix0C9oPtYBhum/FEyOOXtFs=;
 b=Ofb6ij/uiadtQ/RGeJFrPI72dpOnoz5gFd+Vjh5ph54EBfrBSTs7AlrxOlRgJQ+ZHc5GRe
 DuCYzlgvK2FRPJ6wKeIhCGqcv/vBrwpPiO3ZAiyZ5e//W1n4KRiStVIYgeJSxVmioRwfd4
 8Z1oGW4cqWTyG1qPEz0yRmDyREJR76o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-2kF_C-_UOXSPjyawB2JBbg-1; Thu, 07 Oct 2021 11:55:38 -0400
X-MC-Unique: 2kF_C-_UOXSPjyawB2JBbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64A23F95F60;
 Thu,  7 Oct 2021 15:42:51 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2390AC8E;
 Thu,  7 Oct 2021 15:42:50 +0000 (UTC)
Date: Thu, 7 Oct 2021 16:42:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Message-ID: <YV8VeaWiwD8DRFtz@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <YV6EbwMFmcIEC+za@stefanha-x1.localdomain>
 <2233456.PtHKNz60go@silver>
MIME-Version: 1.0
In-Reply-To: <2233456.PtHKNz60go@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="epQAIsb/jN3pWb0S"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--epQAIsb/jN3pWb0S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 07, 2021 at 02:51:55PM +0200, Christian Schoenebeck wrote:
> On Donnerstag, 7. Oktober 2021 07:23:59 CEST Stefan Hajnoczi wrote:
> > On Mon, Oct 04, 2021 at 09:38:00PM +0200, Christian Schoenebeck wrote:
> > > At the moment the maximum transfer size with virtio is limited to 4M
> > > (1024 * PAGE_SIZE). This series raises this limit to its maximum
> > > theoretical possible transfer size of 128M (32k pages) according to t=
he
> > > virtio specs:
> > >=20
> > > https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.=
html#
> > > x1-240006
> > Hi Christian,
> > I took a quick look at the code:
> >=20
> > - The Linux 9p driver restricts descriptor chains to 128 elements
> >   (net/9p/trans_virtio.c:VIRTQUEUE_NUM)
>=20
> Yes, that's the limitation that I am about to remove (WIP); current kerne=
l=20
> patches:
> https://lore.kernel.org/netdev/cover.1632327421.git.linux_oss@crudebyte.c=
om/

I haven't read the patches yet but I'm concerned that today the driver
is pretty well-behaved and this new patch series introduces a spec
violation. Not fixing existing spec violations is okay, but adding new
ones is a red flag. I think we need to figure out a clean solution.

> > - The QEMU 9pfs code passes iovecs directly to preadv(2) and will fail
> >   with EINVAL when called with more than IOV_MAX iovecs
> >   (hw/9pfs/9p.c:v9fs_read())
>=20
> Hmm, which makes me wonder why I never encountered this error during test=
ing.
>=20
> Most people will use the 9p qemu 'local' fs driver backend in practice, s=
o=20
> that v9fs_read() call would translate for most people to this implementat=
ion=20
> on QEMU side (hw/9p/9p-local.c):
>=20
> static ssize_t local_preadv(FsContext *ctx, V9fsFidOpenState *fs,
>                             const struct iovec *iov,
>                             int iovcnt, off_t offset)
> {
> #ifdef CONFIG_PREADV
>     return preadv(fs->fd, iov, iovcnt, offset);
> #else
>     int err =3D lseek(fs->fd, offset, SEEK_SET);
>     if (err =3D=3D -1) {
>         return err;
>     } else {
>         return readv(fs->fd, iov, iovcnt);
>     }
> #endif
> }
>=20
> > Unless I misunderstood the code, neither side can take advantage of the
> > new 32k descriptor chain limit?
> >=20
> > Thanks,
> > Stefan
>=20
> I need to check that when I have some more time. One possible explanation=
=20
> might be that preadv() already has this wrapped into a loop in its=20
> implementation to circumvent a limit like IOV_MAX. It might be another "i=
t=20
> works, but not portable" issue, but not sure.
>
> There are still a bunch of other issues I have to resolve. If you look at
> net/9p/client.c on kernel side, you'll notice that it basically does this=
 ATM
>=20
>     kmalloc(msize);
>=20
> for every 9p request. So not only does it allocate much more memory for e=
very=20
> request than actually required (i.e. say 9pfs was mounted with msize=3D8M=
, then=20
> a 9p request that actually would just need 1k would nevertheless allocate=
 8M),=20
> but also it allocates > PAGE_SIZE, which obviously may fail at any time.

The PAGE_SIZE limitation sounds like a kmalloc() vs vmalloc() situation.

I saw zerocopy code in the 9p guest driver but didn't investigate when
it's used. Maybe that should be used for large requests (file
reads/writes)? virtio-blk/scsi don't memcpy data into a new buffer, they
directly access page cache or O_DIRECT pinned pages.

Stefan

--epQAIsb/jN3pWb0S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfFXkACgkQnKSrs4Gr
c8iaZQf/ZVwABlkbtrQRDNCsR25aycD9AB/7q3BPym+l38aKwaAAxgsbXO3i3OV9
NU+Q7crHqo3amfDhv5Fu0MOML1gw/pDj4mYJCZ0jBrG3Fztmo17R5NehXEc1NfmK
HRs1micAV0IPyYCF/BuDe78nv1fSrfZ1zcW0LXp/dFKFotXq2NGUh0nOZHVXzIrS
ZEaD5quVWv2rBcrNY3pz9Uc671RZy4Jue9PiSI4lV7C1JoeMfi9r/FogFiC0c67w
OMZBq0wS4yK3xg2JAZipjNXLXnrqAw5t2Ymc0lewYqu6JB8VlewwxCxXyWz7P0RL
GoONVlq9EpDAttmRFTQAkoNnZxs/nA==
=NoiZ
-----END PGP SIGNATURE-----

--epQAIsb/jN3pWb0S--


