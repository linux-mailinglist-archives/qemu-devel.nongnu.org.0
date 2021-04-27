Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627D636C7C7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:30:08 +0200 (CEST)
Received: from localhost ([::1]:37422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbOj1-0000bA-32
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbOhi-0008CC-Pl
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbOhd-0003No-8j
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619533720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Ke4S2aB9ryk3/0dNrVBYYpBYgr0mrsBUcVh3c6xeMM=;
 b=dVRdUjA5AlcL9Vegf5uVzqC0j++ySXIDnBc6+ZKawR2MG6ECRoz9UgWItR/OeKk9Wrvr53
 L7N2Qb2CeAuwd9+cS24m08DRxYgGCvoZo5rsyMWafea3xHOMC68D3Nrghr/MYAH0FrS61G
 ts+I1ulmkIdsP2ZmixhlLfAQ1sbA82Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-ku902PIrOJqgM3xfEgpuLA-1; Tue, 27 Apr 2021 10:28:35 -0400
X-MC-Unique: ku902PIrOJqgM3xfEgpuLA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 881B8804768;
 Tue, 27 Apr 2021 14:28:34 +0000 (UTC)
Received: from localhost (ovpn-115-30.ams2.redhat.com [10.36.115.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6477B5B4B2;
 Tue, 27 Apr 2021 14:28:24 +0000 (UTC)
Date: Tue, 27 Apr 2021 15:28:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: Re: [PATCH 0/3] Introduce vhost-vdpa block device
Message-ID: <YIgfh632Evrdid12@stefanha-x1.localdomain>
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <YIbdYdxD0CDcX+C2@stefanha-x1.localdomain>
 <CACycT3sU3LDnAvk_iefo=91L91=8TNRQJfKyRvOy2EOtiesBMw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACycT3sU3LDnAvk_iefo=91L91=8TNRQJfKyRvOy2EOtiesBMw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7k/PYRf+t1DDnOHB"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, mreitz@redhat.com, changpeng.liu@intel.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7k/PYRf+t1DDnOHB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 06:24:55PM +0800, Yongji Xie wrote:
> On Mon, Apr 26, 2021 at 11:34 PM Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >
> > On Thu, Apr 08, 2021 at 06:12:49PM +0800, Xie Yongji wrote:
> > > Since we already have some ways to emulate vDPA block device
> > > in kernel[1] or userspace[2]. This series tries to introduce a
> > > new vhost-vdpa block device for that. To use it, we can add
> > > something like:
> > >
> > > qemu-system-x86_64 \
> > >     -device vhost-vdpa-blk-pci,vdpa-dev=3D/dev/vhost-vdpa-0
> >
> > This device is similar to vhost-user-blk. QEMU does not see it as a
> > block device so storage migration, I/O throttling, image formats, etc
> > are not supported. Stefano Garzarella and I discussed how vdpa-blk
> > devices could integrate more deeply with QEMU's block layer. The QEMU
> > block layer could be enabled only when necessary and otherwise bypassed
> > for maximum performance.
> >
>=20
> Do you mean we can make use of the shadow virtqueue for the slow path
> (I/O will go through the block layer) and add a fast path (like what
> we do now) to bypass the block layer?

Yes.

> > This alternative approach is similar to how vhost-net is implemented in
> > QEMU. A BlockDriver would handle the vdpa-blk device and the regular
> > virtio-blk-pci device would still be present. The virtqueues could be
> > delegated to the vdpa-blk device in order to bypass the QEMU block
> > layer.
> >
> > I wanted to mention this since it's likely that this kind of vdpa-blk
> > device implementation will be posted in the future and you might be
> > interested. It makes live migration with non-shared storage possible,
> > for example.
> >
>=20
> That would be nice, I'm looking forward to it!
>=20
> So do you think whether it's necessary to continue this approach?
> Looks like we don't need a vhost-vdpa-blk device any more in the new
> approach.

There is no code for the vdpa-blk BlockDriver yet and the implementation
will be more complex than this patch series (more risk the feature could
be delayed).

If you need vdpa-blk as soon as possible then this patch series may be a
pragmatic solution. As long as it doesn't limit the vdpa-blk interface
in a way that prevents the BlockDriver implementation then I think QEMU
could support both.

In the long term the vdpa-blk BlockDriver could replace -device
vdpa-blk-pci since the performance should be identical and it supports
more use cases.

It's up to you. You're welcome to wait for the BlockDriver, work
together with Stefano on the BlockDriver, or continue with your patch
series.

> > An issue with vhost-user-blk is that the ownership of qdev properties
> > and VIRTIO Configuration Space fields was not clearly defined. Some
> > things are handled by QEMU's vhost-user-blk code, some things are
> > handled by the vhost-user device backend, and some things are negotiate=
d
> > between both entities. This patch series follows the existing
> > vhost-user-blk approach, which I think will show serious issues as the
> > device is more widely used and whenever virtio-blk or the implementatio=
n
> > is extended with new features. It is very hard to provide backwards
> > compatibility with the current approach where the ownership of qdev
> > properties and VIRTIO Configuration Space fields is ad-hoc and largely
> > undefined.
> >
> > Since vDPA has VIRTIO Configuration Space APIs, I suggest that the
> > vhost-vDPA device controls the entire configuration space. QEMU should
> > simply forward accesses between the guest and vhost-vdpa.
> >
>=20
> Does this already achieved by vhost_ops->vhost_get_config=EF=BC=9F And I =
want
> to know how to handle the endianness issue if qemu just simply does
> forwarding and doesn't care about the content of config space.

QEMU just copies bytes betwen the driver and the device via
vdpa_config_ops->get/set_config(). I don't think it needs to worry about
endianness in VIRTIO Configuration Space access code or did I miss
something?

My understanding is that vDPA currently supports same-endian Legacy and
little-endian Modern devices. Cross-endian Legacy devices are currently
not supported because there is no API to set endianness.

If such an API is added in the future, then QEMU can use it to tell the
vDPA device about guest endianness. QEMU still won't need to modify
Configuration Space data itself.

> > Regarding qdev properties, it's a little trickier because QEMU needs to
> > do the emulated VIRTIO device setup (allocating virtqueues, setting
> > their sizes, etc). Can QEMU query this information from the vDPA device=
?
> > If not, which qdev properties are read-only and must match the
> > configuration of the vDPA device and which are read-write and can
> > control the vDPA device?
> >
>=20
> Yes, that's an issue. We have to make sure the number of virtqueues
> and their size set by qemu is not greater than hardware limitation.
> Now I think we can query the max queue size, but looks like we don't
> have an interface to query the max number of virtqueues.

Okay, this is something that Jason and Stefano can discuss more. Ideally
the QEMU command-line does not need to duplicate information about the
vDPA device. The vdpa management tool
(https://github.com/shemminger/iproute2/tree/main/vdpa) and VDUSE
virtio-blk device will probably be where the main device configuration
happens.

As a starting point, can you describe how your VDUSE virtio-blk device
is configured? Does it have a command-line/config file/RPC API to set
the number of virtqueues, block size, etc?

Stefan

--7k/PYRf+t1DDnOHB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCIH4cACgkQnKSrs4Gr
c8jyvwgAtsGFMg3Q79sLVOyJVvTzEExiN8cLftyT0UtgJX1U1iBdf8heLAOiHVqv
cDFsn03PHw/VrHpG9MtFAvRuOzZklpVhlaV8KGH5eXVEPZJEdF+Sx/ZYS5sdeTKC
d7BAwCq7KfuVYykdgvyZpeWgEHwaAF/4vCVqQwIp8Gf0MpaneA6q4NJzqVecaZHb
Z0Lx4s2ppjzRFihBdsPYDCyyGXEVvQ+PRP9ZB6gmg7ZmTlVSK1cU2Gt30D6uCVUl
J3jUGryJxIyaT7C6VGH/7TX9YP4Le1wfFEeHW5+S+P/yQzqoPyJiMXxGmVavbWF/
39N5QRqCvQEO5TBmm4o4VWTA+mxvHw==
=P8Ze
-----END PGP SIGNATURE-----

--7k/PYRf+t1DDnOHB--


