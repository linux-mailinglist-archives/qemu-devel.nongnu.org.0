Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A609C473045
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:17:51 +0100 (CET)
Received: from localhost ([::1]:38376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwn5K-0004wy-Gy
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:17:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwn3v-0004BX-9Z
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:16:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwn3s-0006Qe-9U
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639408579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R1Ggp8bhke+Bs7SRlu5BuQdHTYGS+iHUv3n1VchDjik=;
 b=TepiCrqTqITtEz+5DhQ0dpJJJKobClIfZtFBOzr+zSRrtPxVoXHQSpLc7RzHq54RjburSI
 8wtmZm7Zgo/k3ZKfRWiwe059xnNYrIf69w4RkhuK4U4VKjp8YQCLskGyIYgjorP9qHdPEI
 avJvOa4RAwFsng4lBFBolVWMArUYLH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-289-eOUE7fGnOGO4EzlSCGLopA-1; Mon, 13 Dec 2021 10:16:16 -0500
X-MC-Unique: eOUE7fGnOGO4EzlSCGLopA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D78BB1023F50;
 Mon, 13 Dec 2021 15:16:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79C17608BA;
 Mon, 13 Dec 2021 15:16:14 +0000 (UTC)
Date: Mon, 13 Dec 2021 15:16:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <YbdjvVvR+mo7nGM6@stefanha-x1.localdomain>
References: <20211208052010.1719-1-longpeng2@huawei.com>
 <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
 <20211209155522.ysgig3bshwtykoxr@steredhat>
 <9615545c46e54943b40e730a3535d550@huawei.com>
MIME-Version: 1.0
In-Reply-To: <9615545c46e54943b40e730a3535d550@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pUZD/vYkFOgYKrTH"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
 "parav@nvidia.com" <parav@nvidia.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pUZD/vYkFOgYKrTH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 11, 2021 at 04:11:04AM +0000, Longpeng (Mike, Cloud Infrastruct=
ure Service Product Dept.) wrote:
>=20
>=20
> > -----Original Message-----
> > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > Sent: Thursday, December 9, 2021 11:55 PM
> > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > <longpeng2@huawei.com>
> > Cc: Stefan Hajnoczi <stefanha@redhat.com>; jasowang@redhat.com; mst@red=
hat.com;
> > parav@nvidia.com; xieyongji@bytedance.com; Yechuan <yechuan@huawei.com>=
;
> > Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-devel@nongnu.org
> > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device suppo=
rt
> >=20
> > On Thu, Dec 09, 2021 at 09:16:58AM +0000, Stefan Hajnoczi wrote:
> > >On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wrote:
> > >> From: Longpeng <longpeng2@huawei.com>
> > >>
> > >> Hi guys,
> > >>
> > >> This patch introduces vhost-vdpa-net device, which is inspired
> > >> by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
> > >>
> > >> I've tested this patch on Huawei's offload card:
> > >> ./x86_64-softmmu/qemu-system-x86_64 \
> > >>     -device vhost-vdpa-net-pci,vdpa-dev=3D/dev/vhost-vdpa-0
> > >>
> > >> For virtio hardware offloading, the most important requirement for u=
s
> > >> is to support live migration between offloading cards from different
> > >> vendors, the combination of netdev and virtio-net seems too heavy, w=
e
> > >> prefer a lightweight way.
> > >>
> > >> Maybe we could support both in the future ? Such as:
> > >>
> > >> * Lightweight
> > >>  Net: vhost-vdpa-net
> > >>  Storage: vhost-vdpa-blk
> > >>
> > >> * Heavy but more powerful
> > >>  Net: netdev + virtio-net + vhost-vdpa
> > >>  Storage: bdrv + virtio-blk + vhost-vdpa
> > >>
> > >> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.htm=
l
> > >
> > >Stefano presented a plan for vdpa-blk at KVM Forum 2021:
> > >https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware-an=
d-so
> > ftware-offload-for-virtio-blk-stefano-garzarella-red-hat
> > >
> > >It's closer to today's virtio-net + vhost-net approach than the
> > >vhost-vdpa-blk device you have mentioned. The idea is to treat vDPA as
> > >an offload feature rather than a completely separate code path that
> > >needs to be maintained and tested. That way QEMU's block layer feature=
s
> > >and live migration work with vDPA devices and re-use the virtio-blk
> > >code. The key functionality that has not been implemented yet is a "fa=
st
> > >path" mechanism that allows the QEMU virtio-blk device's virtqueue to =
be
> > >offloaded to vDPA.
> > >
> > >The unified vdpa-blk architecture should deliver the same performance
> > >as the vhost-vdpa-blk device you mentioned but with more features, so =
I
> > >wonder what aspects of the vhost-vdpa-blk idea are important to you?
> > >
> > >QEMU already has vhost-user-blk, which takes a similar approach as the
> > >vhost-vdpa-blk device you are proposing. I'm not against the
> > >vhost-vdpa-blk approach in priciple, but would like to understand your
> > >requirements and see if there is a way to collaborate on one vdpa-blk
> > >implementation instead of dividing our efforts between two.
> >=20
> > Waiting for the aspects that Stefan asked, I add some details about the
> > plan for vdpa-blk.
> >=20
> > Currently I'm working on the in-kernel software device. In the next
> > months I hope to start working on the QEMU part. Anyway that part could
> > go in parallel with the in-kernel device, so if you are interested we
> > can collaborate.
> >=20
>=20
> The work on QEMU part means supporting the vdpa in BlockDriver and virtio=
-blk?
>=20
> In fact, I wanted to support the vdpa in QEMU block layer before I sent t=
his
> RFC, because the net part uses netdev + virtio-net while the storage part=
 uses
> vhost-vdpa-blk (from Yongji) looks like a strange combination.
>=20
> But I found enable vdpa in QEMU block layer would take more time and some
> features (e.g. snapshot, IO throttling) from the QEMU block layer are not=
 needed
> in our hardware offloading case, so I turned to develop the "vhost-vdpa-n=
et",
> maybe the combination of vhost-vdpa-net and vhost-vdpa-blk is congruous.
>=20
> > Having only the unified vdpa-blk architecture would allow us to simplif=
y
> > the management layers and avoid duplicate code, but it takes more time
> > to develop compared to vhost-vdpa-blk. So if vdpa-blk support in QEMU i=
s
> > urgent, I could understand the need to add vhost-vdpa-blk now.
> >=20
>=20
> I prefer a way that can support vdpa devices (not only net and storage, b=
ut also
> other device types) quickly in hardware offloading case, maybe it would d=
ecreases
> the universalism, but it could be an alternative to some users.

If QEMU already had --blockdev vpda-blk, would you use that with
--device virtio-blk-pci or still want to implement a separate --device
vhost-vdpa-blk-pci device?

Stefan

--pUZD/vYkFOgYKrTH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3Y70ACgkQnKSrs4Gr
c8g8RQgAx8u8LDhxKQWuFLgc2LAgUjcT+WG1nXDz2oRK6vAbMmkFxVW3DCIQoYoU
Elfljj86WcG34zcrYigZkhdjU7GYkV36AEMsMXn+Z62ZbdzyWfFhmt/wGme2M226
2+w+2W9xmBkTWxIkuIQvh1yDJyZJItTTPO8GncGX123cEMCykbFKLDcKXU64DLQ8
eZJhQ0yn8v2lkaqGzpc0EqwpHypjBN3VXksRLBFfAMQJYhvgn0Cbz4YArQ1nwa0B
U040xuJuJFXa0uIvU33if8svG0oUKcCPdIECDPxPiscN0x1u5q8gUpx/pNjBTBTv
ahtsOV577i81Ag2BeUTf7t6mMwGebQ==
=IXl6
-----END PGP SIGNATURE-----

--pUZD/vYkFOgYKrTH--


