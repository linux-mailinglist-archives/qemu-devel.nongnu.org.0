Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048484DAF91
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:24:34 +0100 (CET)
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUShc-000050-Hv
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:24:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUSaR-0002CU-7j
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:17:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUSaM-0007rP-U9
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647433018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q5LNcVpKB2Ray+8MCCear/34eA/aoO+HmYLkA6abvns=;
 b=CiY89Kc/iKJy9T0HBzIQ9yOMiHzi5cW1yUAT8uG9SN2H6GZS5QZfaker1xGZhYIqaV0/KO
 Vndu01pOJrkafoY/KVkDWRem01tzzlArQxx7gjinTGjSbc4zN5aLYVc5NV9hyqs1FU0BIB
 QJSG+CbcKnCVj2BO6lqo9ydPVT6HC4w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-4i8LBREDOSSNjtcoVrW8zw-1; Wed, 16 Mar 2022 08:16:54 -0400
X-MC-Unique: 4i8LBREDOSSNjtcoVrW8zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51F813800E93;
 Wed, 16 Mar 2022 12:16:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70191C33260;
 Wed, 16 Mar 2022 12:16:53 +0000 (UTC)
Date: Wed, 16 Mar 2022 12:16:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: [PATCH v2 4/6] vduse-blk: implements vduse-blk export
Message-ID: <YjHVNJZJlt+nDMPi@stefanha-x1.localdomain>
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-5-xieyongji@bytedance.com>
 <YjBzxAvvUuXBfGPn@stefanha-x1.localdomain>
 <CACycT3t-eJBLsTKWJ85Ho0hoG4KuQCHV6Hwk6=KJXTY9=eYMDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WkYneBXxp6QFLnkS"
Content-Disposition: inline
In-Reply-To: <CACycT3t-eJBLsTKWJ85Ho0hoG4KuQCHV6Hwk6=KJXTY9=eYMDA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WkYneBXxp6QFLnkS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2022 at 07:52:03PM +0800, Yongji Xie wrote:
> On Tue, Mar 15, 2022 at 7:08 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Tue, Feb 15, 2022 at 06:59:41PM +0800, Xie Yongji wrote:
> > > This implements a VDUSE block backends based on
> > > the libvduse library. We can use it to export the BDSs
> > > for both VM and container (host) usage.
> > >
> > > The new command-line syntax is:
> > >
> > > $ qemu-storage-daemon \
> > >     --blockdev file,node-name=3Ddrive0,filename=3Dtest.img \
> > >     --export vduse-blk,node-name=3Ddrive0,id=3Dvduse-export0,writable=
=3Don
> > >
> > > After the qemu-storage-daemon started, we need to use
> > > the "vdpa" command to attach the device to vDPA bus:
> > >
> > > $ vdpa dev add name vduse-export0 mgmtdev vduse
> >
> > The per-QEMU export id is used as the global vdpa device name. If this
> > becomes a problem in the future then a new --export
> > vduse-blk,vdpa-dev-name=3D option can be added.
> >
>=20
> Yes.
>=20
> > > +    case VIRTIO_BLK_T_GET_ID: {
> > > +        size_t size =3D MIN(iov_size(&elem->in_sg[0], in_num),
> > > +                          VIRTIO_BLK_ID_BYTES);
> > > +        snprintf(elem->in_sg[0].iov_base, size, "%s", vblk_exp->expo=
rt.id);
> >
> > Please use iov_from_buf(). The driver is allowed to submit as many
> > in_sg[] elements as it wants and a compliant virtio-blk device
> > implementation must support that.
> >
>=20
> Got it.
>=20
> > Here is the VIRTIO specification section that covers message framing:
> > https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.ht=
ml#x1-280004
> >
> > > +    features =3D (1ULL << VIRTIO_F_IOMMU_PLATFORM) |
> > > +               (1ULL << VIRTIO_F_VERSION_1) |
> > > +               (1ULL << VIRTIO_RING_F_EVENT_IDX) |
> > > +               (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
> > > +               (1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
> > > +               (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
> > > +               (1ULL << VIRTIO_BLK_F_SEG_MAX) |
> > > +               (1ULL << VIRTIO_BLK_F_TOPOLOGY) |
> > > +               (1ULL << VIRTIO_BLK_F_BLK_SIZE);
> >
> > The VIRTIO_F_ and VIRTIO_RING_F_ feature bits report the capabilities of
> > libvduse. They should probably be defined in libvduse. That way no
> > changes to vduse-blk.c are required when libvduse changes:
> >
> >   features =3D LIBVDUSE_VIRTIO_FEATURES |
> >              (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
> >              ...;
>=20
> It's OK to define the VIRTIO_F_* feature bits in libvduse since daemon
> might not want to disable it. But maybe not including VIRTIO_RING_F_*
> feature bits since daemon might want to disable them in some cases.

The VIRTIO_RING_F_* functionality is implemented inside libvduse and not
the device code. If the device wants to disable specific features, it
can clear those bits.

Thinking about the LIBVDUSE_VIRTIO_FEATURES idea I think it's slightly
better to make it a function so that libvduse code supports dynamic
linking. That way the device calls libvduse to query the feature bits
instead of compiling a constant from the libvduse header file into the
device executable.

So something like:

  features =3D (vdu_get_virtio_features() & ~(...features we wish to clear.=
=2E.)) |
             (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
	     ...;

Stefan

--WkYneBXxp6QFLnkS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIx1TQACgkQnKSrs4Gr
c8j+2wf9G4AIcD/L1PS+URHnui4S2khfkYjWqSpt8m2pMkS8x1BwFYmXTZXySD0y
Gc9uezYlb99a0nZSatd0vt1ScZs4jzvPELZtz1zMJgHGyqAw18X1OehhLGdN9ivk
nSBJPfV/BQ2QQwa3R9qG+phUfGUCaWuqDSOv9t0TSzB0Iv6lIX3OMik1epH4Iz/q
h8BnwT3XODQuEzCgZVdGysAcVhWkRRU3+1PWAdSOrdkJSiX0Uq20TG74CuEgGIyY
Pi271AVs0yHlKpWQBBeUKYGPmF97rRuCLHfOT9ztVz6EfOzOjj4MLZLFQ1bBTStL
PeAbVncnCVAnvqXS3NiF+Xknq8v2zQ==
=0cVY
-----END PGP SIGNATURE-----

--WkYneBXxp6QFLnkS--


