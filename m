Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADFB4755DE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:09:38 +0100 (CET)
Received: from localhost ([::1]:35672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRE8-0002Y9-Nb
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:09:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxRCT-0001C0-73
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:07:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxRCQ-00078P-L9
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639562869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CjVD7pWGj6GQAQtQo1YnAJ7GCsE+05NeGplcPKwfTqg=;
 b=iscNsq7be7I3F1dwj2+AvSnTlOv4eqFtW8eRMl0/p6XIBOXrT799M7Kic8KCBv0YCpIBej
 FTbtgZL2Q04/EvKCoVD4bgRDx/twFj4vvjoQDOxLpPMSWxjmUkdFQFVbnTFv55wVT9ql5Y
 LT+b86mgDu4NnnifDyDyR6bW512TVDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-fPcRZQrtMpGcrPktESVVgQ-1; Wed, 15 Dec 2021 05:07:34 -0500
X-MC-Unique: fPcRZQrtMpGcrPktESVVgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC5AD85EE7C;
 Wed, 15 Dec 2021 10:07:31 +0000 (UTC)
Received: from localhost (unknown [10.39.195.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDCCE62721;
 Wed, 15 Dec 2021 10:07:30 +0000 (UTC)
Date: Wed, 15 Dec 2021 10:07:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <Ybm+YVQS1l73nnuU@stefanha-x1.localdomain>
References: <20211208052010.1719-1-longpeng2@huawei.com>
 <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
 <721bbc1c27f545babdfbd17e1461e9f2@huawei.com>
 <20211212042818-mutt-send-email-mst@kernel.org>
 <CACGkMEs_99AsAfxCJurJtBOQELD7pnc6RAqJDoO9yseVJDy9tA@mail.gmail.com>
 <YbdjRRcfrNjHjfko@stefanha-x1.localdomain>
 <CACGkMEt9UF2eVB6692aGoKBD2v0zPwopZG1jaG_O=mg3-cwwSA@mail.gmail.com>
 <YbiYAKIkLAgosXEH@stefanha-x1.localdomain>
 <CACGkMEsZfgDriSx1e=JOU4E8QyB5KoU+i2M2F8N12BrMbu5suQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsZfgDriSx1e=JOU4E8QyB5KoU+i2M2F8N12BrMbu5suQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ctcr1MaxYakaMUV1"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "parav@nvidia.com" <parav@nvidia.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ctcr1MaxYakaMUV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 11:18:05AM +0800, Jason Wang wrote:
> On Tue, Dec 14, 2021 at 9:11 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Tue, Dec 14, 2021 at 10:22:53AM +0800, Jason Wang wrote:
> > > On Mon, Dec 13, 2021 at 11:14 PM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
> > > >
> > > > On Mon, Dec 13, 2021 at 10:47:00AM +0800, Jason Wang wrote:
> > > > > On Sun, Dec 12, 2021 at 5:30 PM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
> > > > > >
> > > > > > On Sat, Dec 11, 2021 at 03:00:27AM +0000, Longpeng (Mike, Cloud=
 Infrastructure Service Product Dept.) wrote:
> > > > > > >
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > > > > > > > Sent: Thursday, December 9, 2021 5:17 PM
> > > > > > > > To: Longpeng (Mike, Cloud Infrastructure Service Product De=
pt.)
> > > > > > > > <longpeng2@huawei.com>
> > > > > > > > Cc: jasowang@redhat.com; mst@redhat.com; parav@nvidia.com;
> > > > > > > > xieyongji@bytedance.com; sgarzare@redhat.com; Yechuan <yech=
uan@huawei.com>;
> > > > > > > > Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-devel@nongnu=
.org
> > > > > > > > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host =
device support
> > > > > > > >
> > > > > > > > On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wr=
ote:
> > > > > > > > > From: Longpeng <longpeng2@huawei.com>
> > > > > > > > >
> > > > > > > > > Hi guys,
> > > > > > > > >
> > > > > > > > > This patch introduces vhost-vdpa-net device, which is ins=
pired
> > > > > > > > > by vhost-user-blk and the proposal of vhost-vdpa-blk devi=
ce [1].
> > > > > > > > >
> > > > > > > > > I've tested this patch on Huawei's offload card:
> > > > > > > > > ./x86_64-softmmu/qemu-system-x86_64 \
> > > > > > > > >     -device vhost-vdpa-net-pci,vdpa-dev=3D/dev/vhost-vdpa=
-0
> > > > > > > > >
> > > > > > > > > For virtio hardware offloading, the most important requir=
ement for us
> > > > > > > > > is to support live migration between offloading cards fro=
m different
> > > > > > > > > vendors, the combination of netdev and virtio-net seems t=
oo heavy, we
> > > > > > > > > prefer a lightweight way.
> > > > > > > > >
> > > > > > > > > Maybe we could support both in the future ? Such as:
> > > > > > > > >
> > > > > > > > > * Lightweight
> > > > > > > > >  Net: vhost-vdpa-net
> > > > > > > > >  Storage: vhost-vdpa-blk
> > > > > > > > >
> > > > > > > > > * Heavy but more powerful
> > > > > > > > >  Net: netdev + virtio-net + vhost-vdpa
> > > > > > > > >  Storage: bdrv + virtio-blk + vhost-vdpa
> > > > > > > > >
> > > > > > > > > [1] https://www.mail-archive.com/qemu-devel@nongnu.org/ms=
g797569.html
> > > > > > > >
> > > > > > > > Stefano presented a plan for vdpa-blk at KVM Forum 2021:
> > > > > > > > https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-=
hardware-and-sof
> > > > > > > > tware-offload-for-virtio-blk-stefano-garzarella-red-hat
> > > > > > > >
> > > > > > > > It's closer to today's virtio-net + vhost-net approach than=
 the
> > > > > > > > vhost-vdpa-blk device you have mentioned. The idea is to tr=
eat vDPA as
> > > > > > > > an offload feature rather than a completely separate code p=
ath that
> > > > > > > > needs to be maintained and tested. That way QEMU's block la=
yer features
> > > > > > > > and live migration work with vDPA devices and re-use the vi=
rtio-blk
> > > > > > > > code. The key functionality that has not been implemented y=
et is a "fast
> > > > > > > > path" mechanism that allows the QEMU virtio-blk device's vi=
rtqueue to be
> > > > > > > > offloaded to vDPA.
> > > > > > > >
> > > > > > > > The unified vdpa-blk architecture should deliver the same p=
erformance
> > > > > > > > as the vhost-vdpa-blk device you mentioned but with more fe=
atures, so I
> > > > > > > > wonder what aspects of the vhost-vdpa-blk idea are importan=
t to you?
> > > > > > > >
> > > > > > > > QEMU already has vhost-user-blk, which takes a similar appr=
oach as the
> > > > > > > > vhost-vdpa-blk device you are proposing. I'm not against th=
e
> > > > > > > > vhost-vdpa-blk approach in priciple, but would like to unde=
rstand your
> > > > > > > > requirements and see if there is a way to collaborate on on=
e vdpa-blk
> > > > > > > > implementation instead of dividing our efforts between two.
> > > > > > > >
> > > > > > >
> > > > > > > We prefer a simple way in the virtio hardware offloading case=
, it could reduce
> > > > > > > our maintenance workload, we no need to maintain the virtio-n=
et, netdev,
> > > > > > > virtio-blk, bdrv and ... any more. If we need to support othe=
r vdpa devices
> > > > > > > (such as virtio-crypto, virtio-fs) in the future, then we als=
o need to maintain
> > > > > > > the corresponding device emulation code?
> > > > > > >
> > > > > > > For the virtio hardware offloading case, we usually use the v=
fio-pci framework,
> > > > > > > it saves a lot of our maintenance work in QEMU, we don't need=
 to touch the device
> > > > > > > types. Inspired by Jason, what we really prefer is "vhost-vdp=
a-pci/mmio", use it to
> > > > > > > instead of the vfio-pci, it could provide the same performanc=
e as vfio-pci, but it's
> > > > > > > *possible* to support live migrate between offloading cards f=
rom different vendors.
> > > > > >
> > > > > > OK, so the features you are dropping would be migration between
> > > > > > a vdpa, vhost and virtio backends. I think given vhost-vdpa-blk=
 is seems
> > > > > > fair enough... What do others think?
> > > > >
> > > > > I think it should be fine, and it would be even better to make it=
 not
> > > > > specific to device type.
> > > >
> > > > That's an interesting idea. A generic vDPA VirtIODevice could expos=
ed as
> > > >
> > > >   --device vhost-vdpa-pci,
> > > >            [vhostfd=3DFD,|
> > > >             vhostpath=3D/dev/vhost-vdpa-N]
> > > >
> > > > (and for virtio-mmio and virtio-ccw too).
> > > >
> > > > I don't think this is possible yet because the vhost_vdpa ioctls ar=
e
> > > > missing some introspection functionality. Here is what I found:
> > > > - Device ID: ok, use VHOST_VDPA_GET_DEVICE_ID
> > > > - Device feature bits: ok, use VHOST_GET_BACKEND_FEATURES
> > > > - Configuration space size: missing, need ioctl for ops->get_config=
_size()
> > >
> > > Any specific reason that we need this considering we've already had
> > > VHOST_VDPA_GET_CONFIG and we do the size validation there?
> >
> > QEMU's virtio_init() takes a size_t config_size argument. We need to
> > determine the size of the vhost_vdpa's configuration space in order to
> > create the VirtIODevice in QEMU.
> >
> > Do you mean probing by checking for the VHOST_VDPA_GET_CONFIG -E2BIG
> > return value? It's hacky but I guess it's possible to do a binary searc=
h
> > that calls VHOST_VDPA_GET_CONFIG each iteration and reduces the size if
> > -E2BIG is returned or increases the size otherwise.
> >
> > Or do you mean re-writing QEMU's hw/virtio/virtio.c to allow the
> > VirtIODevice to override the size and we pass accesses through to
> > vhost_vdpa. That way it might be possible to avoid fetching the
> > configuration space size at startup, but I'm not sure this will work
> > because QEMU might depend on knowing the exact size (e.g. live
> > migration).
>=20
> Good point, so looking at virtio-blk it has:
>=20
>     virtio_blk_set_config_size(s, s->host_features);
>     virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size);
>=20
> I think here virtio-blk/net should check the vhost-vdpa features here
> and fail if they are not the same?

The vhost feature bit code in QEMU is complicated and I can't respond
without investing too much time studying it :).

> This looks better than overriding the config_size with what vhost-vdpa
> provides since it can override the features that the cli tries to
> enable.

I'm thinking about the generic --device vhost-vdpa idea. QEMU should not
require knowledge of the device feature bits in that case, so it cannot
calculate the configuration space size.

> >
> > > > - Max virtqueue size: ok, VHOST_VDPA_GET_VRING_NUM
> > > > - Number of virtqueues: probe using VHOST_GET_VRING_BASE?
> > >
> > > I'm not sure whether or not we need this and it seems not necessary
> > > since it can be deduced from the config space and features.
> >
> > It can only be deduced in a device-specific way (net, blk, etc). I can'=
t
> > think of a way to detect the number of virtqueues for an arbitrary
> > VIRTIO device from the features bits and configuration space contents.
>=20
> Yes, I'm not against this idea but it looks to me it works even without t=
his.
>=20
> Modern PCI has num_queues but we don't have things like this in MMIO
> and legacy PCI.

Even if the VIRTIO hardware interface doesn't expose this information to
the guest, QEMU's VirtIODevice API needs it. Device emulation code must
call virtio_add_queue() to expose virtqueues to the guest.

I suppose --device vhost-vdpa could probe the number of virtqueues using
VHOST_GET_VRING_BASE and then call virtio_add_queue(), but it's a little
hacky and involves unnecessary ioctl calls.

Instead I would add ioctls to fetch the configuration space size and
number of virtqueues from the vhost_vdpa device.

With these two ioctls added --device vhost-vdpa could create a
VirtIODevice that works with any QEMU VIRTIO transport (pci, mmio, ccw).
It would work with any vDPA device without device-specific knowledge.
Live migration might be possible with some additional work.

Stefan

--ctcr1MaxYakaMUV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG5vmEACgkQnKSrs4Gr
c8j4gQf/SP9RDJkRgo45N8Roi9Dt29u2Gs+etOK3/zI2dzCuQOzq5/bCeXIyfliP
AIy3Wdb0pllqWsAR1fJ9pyIRZ8pyAe3UywLDOVpHIg+TrC1qGxPOPL8VV46Qc4BU
/ozJJ4/TZ4Vd+rWVYxz6dD3kUw6fGT6JTLTwOhMZ7QZgJY/uVBbc9hkEbwSfOaW+
fDnoYvXASpKHEzCSn3lrDxoGrnnjYu/bmXHbd+LzJcyE5Wtxb9S2cG51jo++hxaw
Th/LEXgcONpXwLI0TnRgphQEeep53KOxsNl+BUKSTwNsql2fsW8lqXB+bT/hmVp9
0tDCtWdADDyeFVaJskms7w/pgK2pdQ==
=VJEe
-----END PGP SIGNATURE-----

--ctcr1MaxYakaMUV1--


