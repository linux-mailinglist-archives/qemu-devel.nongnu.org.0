Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68A147432B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:07:28 +0100 (CET)
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7Wh-00081P-Ff
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:07:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mx7TA-0006Sj-Vt
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:03:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mx7T8-00083O-1B
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639487024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c1wskDCAhHNTkdUHRJPELFs5W5ZAJ5Nv2snoveg/5PA=;
 b=OV3YCx8fx3Mrct2befce2PHMiMQrToN133iR5fR+Pske5jF0pcezQdd9YNIv1seDHZ90Im
 R8D7fEnpAwLEZTmFk/04CGyCx2kYaFGiEtJ9fdtuqPtXlI0AATNp9esXRMtWcEzicey2k9
 NprCAPYiaLK462qViq+eNm3Jv6ZqjpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-3WMXbHB7Nri3VW3r15oZMA-1; Tue, 14 Dec 2021 08:03:41 -0500
X-MC-Unique: 3WMXbHB7Nri3VW3r15oZMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 066441019985;
 Tue, 14 Dec 2021 13:03:40 +0000 (UTC)
Received: from localhost (unknown [10.39.195.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A903196F8;
 Tue, 14 Dec 2021 13:03:39 +0000 (UTC)
Date: Tue, 14 Dec 2021 13:03:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <YbiWJPC9vFQwBNsl@stefanha-x1.localdomain>
References: <20211208052010.1719-1-longpeng2@huawei.com>
 <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
 <20211209155522.ysgig3bshwtykoxr@steredhat>
 <9615545c46e54943b40e730a3535d550@huawei.com>
 <YbdjvVvR+mo7nGM6@stefanha-x1.localdomain>
 <bf42a6e1a60747a09b16f0ec085c560e@huawei.com>
MIME-Version: 1.0
In-Reply-To: <bf42a6e1a60747a09b16f0ec085c560e@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7IA9xGir0KZC+eVI"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "parav@nvidia.com" <parav@nvidia.com>, Huangzhichao <huangzhichao@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7IA9xGir0KZC+eVI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2021 at 01:44:46AM +0000, Longpeng (Mike, Cloud Infrastruct=
ure Service Product Dept.) wrote:
>=20
>=20
> > -----Original Message-----
> > From: Qemu-devel [mailto:qemu-devel-bounces+longpeng2=3Dhuawei.com@nong=
nu.org]
> > On Behalf Of Stefan Hajnoczi
> > Sent: Monday, December 13, 2021 11:16 PM
> > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > <longpeng2@huawei.com>
> > Cc: mst@redhat.com; jasowang@redhat.com; qemu-devel@nongnu.org; Yechuan
> > <yechuan@huawei.com>; xieyongji@bytedance.com; Gonglei (Arei)
> > <arei.gonglei@huawei.com>; parav@nvidia.com; Stefano Garzarella
> > <sgarzare@redhat.com>
> > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device suppo=
rt
> >=20
> > On Sat, Dec 11, 2021 at 04:11:04AM +0000, Longpeng (Mike, Cloud Infrast=
ructure
> > Service Product Dept.) wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > > > Sent: Thursday, December 9, 2021 11:55 PM
> > > > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > > > <longpeng2@huawei.com>
> > > > Cc: Stefan Hajnoczi <stefanha@redhat.com>; jasowang@redhat.com;
> > mst@redhat.com;
> > > > parav@nvidia.com; xieyongji@bytedance.com; Yechuan <yechuan@huawei.=
com>;
> > > > Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-devel@nongnu.org
> > > > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device s=
upport
> > > >
> > > > On Thu, Dec 09, 2021 at 09:16:58AM +0000, Stefan Hajnoczi wrote:
> > > > >On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wrote:
> > > > >> From: Longpeng <longpeng2@huawei.com>
> > > > >>
> > > > >> Hi guys,
> > > > >>
> > > > >> This patch introduces vhost-vdpa-net device, which is inspired
> > > > >> by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
> > > > >>
> > > > >> I've tested this patch on Huawei's offload card:
> > > > >> ./x86_64-softmmu/qemu-system-x86_64 \
> > > > >>     -device vhost-vdpa-net-pci,vdpa-dev=3D/dev/vhost-vdpa-0
> > > > >>
> > > > >> For virtio hardware offloading, the most important requirement f=
or us
> > > > >> is to support live migration between offloading cards from diffe=
rent
> > > > >> vendors, the combination of netdev and virtio-net seems too heav=
y, we
> > > > >> prefer a lightweight way.
> > > > >>
> > > > >> Maybe we could support both in the future ? Such as:
> > > > >>
> > > > >> * Lightweight
> > > > >>  Net: vhost-vdpa-net
> > > > >>  Storage: vhost-vdpa-blk
> > > > >>
> > > > >> * Heavy but more powerful
> > > > >>  Net: netdev + virtio-net + vhost-vdpa
> > > > >>  Storage: bdrv + virtio-blk + vhost-vdpa
> > > > >>
> > > > >> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569=
.html
> > > > >
> > > > >Stefano presented a plan for vdpa-blk at KVM Forum 2021:
> > > > >https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardwar=
e-an
> > d-so
> > > > ftware-offload-for-virtio-blk-stefano-garzarella-red-hat
> > > > >
> > > > >It's closer to today's virtio-net + vhost-net approach than the
> > > > >vhost-vdpa-blk device you have mentioned. The idea is to treat vDP=
A as
> > > > >an offload feature rather than a completely separate code path tha=
t
> > > > >needs to be maintained and tested. That way QEMU's block layer fea=
tures
> > > > >and live migration work with vDPA devices and re-use the virtio-bl=
k
> > > > >code. The key functionality that has not been implemented yet is a=
 "fast
> > > > >path" mechanism that allows the QEMU virtio-blk device's virtqueue=
 to be
> > > > >offloaded to vDPA.
> > > > >
> > > > >The unified vdpa-blk architecture should deliver the same performa=
nce
> > > > >as the vhost-vdpa-blk device you mentioned but with more features,=
 so I
> > > > >wonder what aspects of the vhost-vdpa-blk idea are important to yo=
u?
> > > > >
> > > > >QEMU already has vhost-user-blk, which takes a similar approach as=
 the
> > > > >vhost-vdpa-blk device you are proposing. I'm not against the
> > > > >vhost-vdpa-blk approach in priciple, but would like to understand =
your
> > > > >requirements and see if there is a way to collaborate on one vdpa-=
blk
> > > > >implementation instead of dividing our efforts between two.
> > > >
> > > > Waiting for the aspects that Stefan asked, I add some details about=
 the
> > > > plan for vdpa-blk.
> > > >
> > > > Currently I'm working on the in-kernel software device. In the next
> > > > months I hope to start working on the QEMU part. Anyway that part c=
ould
> > > > go in parallel with the in-kernel device, so if you are interested =
we
> > > > can collaborate.
> > > >
> > >
> > > The work on QEMU part means supporting the vdpa in BlockDriver and vi=
rtio-blk?
> > >
> > > In fact, I wanted to support the vdpa in QEMU block layer before I se=
nt this
> > > RFC, because the net part uses netdev + virtio-net while the storage =
part uses
> > > vhost-vdpa-blk (from Yongji) looks like a strange combination.
> > >
> > > But I found enable vdpa in QEMU block layer would take more time and =
some
> > > features (e.g. snapshot, IO throttling) from the QEMU block layer are=
 not needed
> > > in our hardware offloading case, so I turned to develop the "vhost-vd=
pa-net",
> > > maybe the combination of vhost-vdpa-net and vhost-vdpa-blk is congruo=
us.
> > >
> > > > Having only the unified vdpa-blk architecture would allow us to sim=
plify
> > > > the management layers and avoid duplicate code, but it takes more t=
ime
> > > > to develop compared to vhost-vdpa-blk. So if vdpa-blk support in QE=
MU is
> > > > urgent, I could understand the need to add vhost-vdpa-blk now.
> > > >
> > >
> > > I prefer a way that can support vdpa devices (not only net and storag=
e, but
> > also
> > > other device types) quickly in hardware offloading case, maybe it wou=
ld
> > decreases
> > > the universalism, but it could be an alternative to some users.
> >=20
> > If QEMU already had --blockdev vpda-blk, would you use that with
> > --device virtio-blk-pci or still want to implement a separate --device
> > vhost-vdpa-blk-pci device?
> >=20
>=20
> vhost-vdpa-blk/net seems no need now, but a generic vdpa device may be st=
ill
> needed.
>=20
> We are still in the research stage, so I cannot decide to use vdpa-blk or=
 the
> generic device for the storage devices now.
>=20
> If we need to migrate the legacy non-offloading instances to the offloadi=
ng
> instances, then we have no choice but to use vdpa-blk. However, migrating=
 from
> non-offloading to offloading is a complex project, not only the virtualiz=
ation
> layer needs to support but also other layers, so it's hard to say whether=
 this
> is possible in practical reality.
>=20
> So maybe a good choice for us is :
>   Net: -netdev type=3Dvhost-vdpa
>   Storage: -blockdev vpda-blk
>   Others (e.g. fs, crypto): generic vdpa device

I see, thanks!

Stefan

--7IA9xGir0KZC+eVI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG4liQACgkQnKSrs4Gr
c8hiuAf+LlXQvdWk8eyYEdcOZmOK/CfBw6OM0KKm0YnTHa5KJ6zdafGBPhSYM7lt
NjOCDw3lWXv54bEvcKz/F9dYhQ3hPw5rGumZTXOQcF6s7IqhH1S8/wx4DelyPQkP
niV9l/EohKdyrO+YzKPHOF1QW3s7OdgtYdx3MF++garI2usYkxqQ2D9e/COjo8Aw
iQbtaZcxOBxdSp67p5gw2yB4ZDGo816fNmHidbb8fLuWx4Hsq8GhpFbYwrtBRAcG
PwWTnP9OmWZBhyLLkPEGwwJuJVcRDVf5iUlIQyGjIVPqjoaMxjSDzKMe2CBU/kKj
R3TRAUSJUoDo5KiSCeOEm8nfu7ZkJg==
=p2U2
-----END PGP SIGNATURE-----

--7IA9xGir0KZC+eVI--


