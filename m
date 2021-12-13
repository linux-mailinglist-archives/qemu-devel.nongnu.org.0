Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCCD47303B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:16:04 +0100 (CET)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwn3a-0003Ni-Ny
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:16:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwn25-0002fL-M2
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:14:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwn22-0005dA-1V
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639408465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v+AXTNmQWi/WXWeVI6wYza/tOU3R57jbnoM+rbQnH5g=;
 b=guLvx6w9EeZVloRh5njnye0mS6CgWpT0c4zuifLqcCZCmEAj7S6ZbaJmPfy71jG+jPQ2rr
 NWJln3nUqmVDl+pgVVkxxXBQtOk3Csc8yQdBsr4ibLVx0R3GQuF85ei1P8wu5BkHiUasxx
 xgoC1WZVS012H+BXEU7R/AS8Kdu8psc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-r0Dv3LnPMQyTzFMOIbOaPw-1; Mon, 13 Dec 2021 10:14:19 -0500
X-MC-Unique: r0Dv3LnPMQyTzFMOIbOaPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52E3081433B;
 Mon, 13 Dec 2021 15:14:18 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A66FB101E692;
 Mon, 13 Dec 2021 15:14:14 +0000 (UTC)
Date: Mon, 13 Dec 2021 15:14:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <YbdjRRcfrNjHjfko@stefanha-x1.localdomain>
References: <20211208052010.1719-1-longpeng2@huawei.com>
 <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
 <721bbc1c27f545babdfbd17e1461e9f2@huawei.com>
 <20211212042818-mutt-send-email-mst@kernel.org>
 <CACGkMEs_99AsAfxCJurJtBOQELD7pnc6RAqJDoO9yseVJDy9tA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEs_99AsAfxCJurJtBOQELD7pnc6RAqJDoO9yseVJDy9tA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ivl4wGr12FGbrJ/i"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "parav@nvidia.com" <parav@nvidia.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ivl4wGr12FGbrJ/i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2021 at 10:47:00AM +0800, Jason Wang wrote:
> On Sun, Dec 12, 2021 at 5:30 PM Michael S. Tsirkin <mst@redhat.com> wrote=
:
> >
> > On Sat, Dec 11, 2021 at 03:00:27AM +0000, Longpeng (Mike, Cloud Infrast=
ructure Service Product Dept.) wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > > > Sent: Thursday, December 9, 2021 5:17 PM
> > > > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > > > <longpeng2@huawei.com>
> > > > Cc: jasowang@redhat.com; mst@redhat.com; parav@nvidia.com;
> > > > xieyongji@bytedance.com; sgarzare@redhat.com; Yechuan <yechuan@huaw=
ei.com>;
> > > > Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-devel@nongnu.org
> > > > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device s=
upport
> > > >
> > > > On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wrote:
> > > > > From: Longpeng <longpeng2@huawei.com>
> > > > >
> > > > > Hi guys,
> > > > >
> > > > > This patch introduces vhost-vdpa-net device, which is inspired
> > > > > by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
> > > > >
> > > > > I've tested this patch on Huawei's offload card:
> > > > > ./x86_64-softmmu/qemu-system-x86_64 \
> > > > >     -device vhost-vdpa-net-pci,vdpa-dev=3D/dev/vhost-vdpa-0
> > > > >
> > > > > For virtio hardware offloading, the most important requirement fo=
r us
> > > > > is to support live migration between offloading cards from differ=
ent
> > > > > vendors, the combination of netdev and virtio-net seems too heavy=
, we
> > > > > prefer a lightweight way.
> > > > >
> > > > > Maybe we could support both in the future ? Such as:
> > > > >
> > > > > * Lightweight
> > > > >  Net: vhost-vdpa-net
> > > > >  Storage: vhost-vdpa-blk
> > > > >
> > > > > * Heavy but more powerful
> > > > >  Net: netdev + virtio-net + vhost-vdpa
> > > > >  Storage: bdrv + virtio-blk + vhost-vdpa
> > > > >
> > > > > [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.=
html
> > > >
> > > > Stefano presented a plan for vdpa-blk at KVM Forum 2021:
> > > > https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware=
-and-sof
> > > > tware-offload-for-virtio-blk-stefano-garzarella-red-hat
> > > >
> > > > It's closer to today's virtio-net + vhost-net approach than the
> > > > vhost-vdpa-blk device you have mentioned. The idea is to treat vDPA=
 as
> > > > an offload feature rather than a completely separate code path that
> > > > needs to be maintained and tested. That way QEMU's block layer feat=
ures
> > > > and live migration work with vDPA devices and re-use the virtio-blk
> > > > code. The key functionality that has not been implemented yet is a =
"fast
> > > > path" mechanism that allows the QEMU virtio-blk device's virtqueue =
to be
> > > > offloaded to vDPA.
> > > >
> > > > The unified vdpa-blk architecture should deliver the same performan=
ce
> > > > as the vhost-vdpa-blk device you mentioned but with more features, =
so I
> > > > wonder what aspects of the vhost-vdpa-blk idea are important to you=
?
> > > >
> > > > QEMU already has vhost-user-blk, which takes a similar approach as =
the
> > > > vhost-vdpa-blk device you are proposing. I'm not against the
> > > > vhost-vdpa-blk approach in priciple, but would like to understand y=
our
> > > > requirements and see if there is a way to collaborate on one vdpa-b=
lk
> > > > implementation instead of dividing our efforts between two.
> > > >
> > >
> > > We prefer a simple way in the virtio hardware offloading case, it cou=
ld reduce
> > > our maintenance workload, we no need to maintain the virtio-net, netd=
ev,
> > > virtio-blk, bdrv and ... any more. If we need to support other vdpa d=
evices
> > > (such as virtio-crypto, virtio-fs) in the future, then we also need t=
o maintain
> > > the corresponding device emulation code?
> > >
> > > For the virtio hardware offloading case, we usually use the vfio-pci =
framework,
> > > it saves a lot of our maintenance work in QEMU, we don't need to touc=
h the device
> > > types. Inspired by Jason, what we really prefer is "vhost-vdpa-pci/mm=
io", use it to
> > > instead of the vfio-pci, it could provide the same performance as vfi=
o-pci, but it's
> > > *possible* to support live migrate between offloading cards from diff=
erent vendors.
> >
> > OK, so the features you are dropping would be migration between
> > a vdpa, vhost and virtio backends. I think given vhost-vdpa-blk is seem=
s
> > fair enough... What do others think?
>=20
> I think it should be fine, and it would be even better to make it not
> specific to device type.

That's an interesting idea. A generic vDPA VirtIODevice could exposed as

  --device vhost-vdpa-pci,
           [vhostfd=3DFD,|
=09    vhostpath=3D/dev/vhost-vdpa-N]

(and for virtio-mmio and virtio-ccw too).

I don't think this is possible yet because the vhost_vdpa ioctls are
missing some introspection functionality. Here is what I found:
- Device ID: ok, use VHOST_VDPA_GET_DEVICE_ID
- Device feature bits: ok, use VHOST_GET_BACKEND_FEATURES
- Configuration space size: missing, need ioctl for ops->get_config_size()
- Max virtqueue size: ok, VHOST_VDPA_GET_VRING_NUM
- Number of virtqueues: probe using VHOST_GET_VRING_BASE?

I think it's worth adding the missing introspection so that VMMs like
QEMU can implement a generic vDPA device.

Stefan

--ivl4wGr12FGbrJ/i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3Y0UACgkQnKSrs4Gr
c8g64gf+JLg4InwAq4d//krKJJuiUnKmJi5VX6dc82fpy/KceK/S8w9lCslDukQ1
lwZA+zSCrZoyUXN1M1Mk8mj54JccK2Hwsv0itZkbpc4NTbf5cN6UR5vot2NV82t2
ENJUrPqdHuM0pA8NCKtptNk7Tyc3dLQe2WVk6K2RJLOukh/7/lXlF9fD+pDcA/DU
tJA7XiW1w2fCuZvCZHmSao95Lu1KzMgjzjfe8xf/g0WmbGhj+NA/GI3mGhEcNOxI
MqybW+EkIvVPw2Yw49vxttZoUgyb59kfCGkpohAEPS9imxjGTfAwbffMKPnDY3fS
9gD7KgWpVeO/TEXfE8UXppM42B/2sQ==
=Vwi/
-----END PGP SIGNATURE-----

--ivl4wGr12FGbrJ/i--


