Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA6A422C4A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:22:37 +0200 (CEST)
Received: from localhost ([::1]:36132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmH6-0004AX-Up
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXm5h-0003Sm-Qd
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:10:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXm5f-00079S-33
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633446646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QlzZsjUK92jSrtp2xoqj24qvnFuf083meIjggwKF15U=;
 b=WCfyZVQKB+fCcedGRuQi3vc3IyVlLuI1m9XEHb1nLX0WOvIeiNz/fL+qSXx5D8Zvyd2QS0
 VxvtkU8qkstM6nqgwuot1E2oN76GZhqvOA2jzrLlLQt87oDAGtql9DqIxiIoaWFaplW4Qe
 uHFV+5Fyj6mrfdUedvViVYdjmG8mAp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-9L4fj6qgMEegM3m0dqiK2A-1; Tue, 05 Oct 2021 11:10:44 -0400
X-MC-Unique: 9L4fj6qgMEegM3m0dqiK2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4FDE9F932;
 Tue,  5 Oct 2021 15:10:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24EB85D9D5;
 Tue,  5 Oct 2021 15:10:40 +0000 (UTC)
Date: Tue, 5 Oct 2021 16:10:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/3] virtio: turn VIRTQUEUE_MAX_SIZE into a variable
Message-ID: <YVxq8EwB8uXouiEj@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <c9dea2e27ae19b2b9a51e8f08687067bf3e47bd5.1633376313.git.qemu_oss@crudebyte.com>
 <YVxJBKqsytKlos6M@stefanha-x1.localdomain>
 <14205148.YOBg3JvQBA@silver>
MIME-Version: 1.0
In-Reply-To: <14205148.YOBg3JvQBA@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0TV9MjxZ6i5UeWtD"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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

--0TV9MjxZ6i5UeWtD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 03:15:26PM +0200, Christian Schoenebeck wrote:
> On Dienstag, 5. Oktober 2021 14:45:56 CEST Stefan Hajnoczi wrote:
> > On Mon, Oct 04, 2021 at 09:38:04PM +0200, Christian Schoenebeck wrote:
> > > Refactor VIRTQUEUE_MAX_SIZE to effectively become a runtime
> > > variable per virtio user.
> >=20
> > virtio user =3D=3D virtio device model?
>=20
> Yes
>=20
> > > Reasons:
> > >=20
> > > (1) VIRTQUEUE_MAX_SIZE should reflect the absolute theoretical
> > >=20
> > >     maximum queue size possible. Which is actually the maximum
> > >     queue size allowed by the virtio protocol. The appropriate
> > >     value for VIRTQUEUE_MAX_SIZE would therefore be 32768:
> > >    =20
> > >     https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-c=
s01.h
> > >     tml#x1-240006
> > >    =20
> > >     Apparently VIRTQUEUE_MAX_SIZE was instead defined with a
> > >     more or less arbitrary value of 1024 in the past, which
> > >     limits the maximum transfer size with virtio to 4M
> > >     (more precise: 1024 * PAGE_SIZE, with the latter typically
> > >     being 4k).
> >=20
> > Being equal to IOV_MAX is a likely reason. Buffers with more iovecs tha=
n
> > that cannot be passed to host system calls (sendmsg(2), pwritev(2),
> > etc).
>=20
> Yes, that's use case dependent. Hence the solution to opt-in if it is des=
ired=20
> and feasible.
>=20
> > > (2) Additionally the current value of 1024 poses a hidden limit,
> > >=20
> > >     invisible to guest, which causes a system hang with the
> > >     following QEMU error if guest tries to exceed it:
> > >    =20
> > >     virtio: too many write descriptors in indirect table
> >=20
> > I don't understand this point. 2.6.5 The Virtqueue Descriptor Table say=
s:
> >=20
> >   The number of descriptors in the table is defined by the queue size f=
or
> > this virtqueue: this is the maximum possible descriptor chain length.
> >=20
> > and 2.6.5.3.1 Driver Requirements: Indirect Descriptors says:
> >=20
> >   A driver MUST NOT create a descriptor chain longer than the Queue Siz=
e of
> > the device.
> >=20
> > Do you mean a broken/malicious guest driver that is violating the spec?
> > That's not a hidden limit, it's defined by the spec.
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00781.html
> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00788.html
>=20
> You can already go beyond that queue size at runtime with the indirection=
=20
> table. The only actual limit is the currently hard coded value of 1k page=
s.=20
> Hence the suggestion to turn that into a variable.

Exceeding Queue Size is a VIRTIO spec violation. Drivers that operate
outsided the spec do so at their own risk. They may not be compatible
with all device implementations.

The limit is not hidden, it's Queue Size as defined by the spec :).

If you have a driver that is exceeding the limit, then please fix the
driver.

> > > (3) Unfortunately not all virtio users in QEMU would currently
> > >=20
> > >     work correctly with the new value of 32768.
> > >=20
> > > So let's turn this hard coded global value into a runtime
> > > variable as a first step in this commit, configurable for each
> > > virtio user by passing a corresponding value with virtio_init()
> > > call.
> >=20
> > virtio_add_queue() already has an int queue_size argument, why isn't
> > that enough to deal with the maximum queue size? There's probably a goo=
d
> > reason for it, but please include it in the commit description.
> [...]
> > Can you make this value per-vq instead of per-vdev since virtqueues can
> > have different queue sizes?
> >=20
> > The same applies to the rest of this patch. Anything using
> > vdev->queue_max_size should probably use vq->vring.num instead.
>=20
> I would like to avoid that and keep it per device. The maximum size store=
d=20
> there is the maximum size supported by virtio user (or vortio device mode=
l,=20
> however you want to call it). So that's really a limit per device, not pe=
r=20
> queue, as no queue of the device would ever exceed that limit.
>
> Plus a lot more code would need to be refactored, which I think is=20
> unnecessary.

I'm against a per-device limit because it's a concept that cannot
accurately describe reality. Some devices have multiple classes of
virtqueues and they are sized differently, so a per-device limit is
insufficient. virtio-net has separate rx_queue_size and tx_queue_size
parameters (plus a control vq hardcoded to 64 descriptors).

The specification already gives us Queue Size (vring.num in QEMU). The
variable exists in QEMU and just needs to be used.

If per-vq limits require a lot of work, please describe why. I think
replacing the variable from this patch with virtio_queue_get_num()
should be fairly straightforward, but maybe I'm missing something? (If
you prefer VirtQueue *vq instead of the index-based
virtio_queue_get_num() API, you can introduce a virtqueue_get_num()
API.)

Stefan

--0TV9MjxZ6i5UeWtD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFcau8ACgkQnKSrs4Gr
c8iaYwgAmwRQZpE3jGmWAGCowPQDYDW5GPepW7Ot+FHPDs9DOdaXfBbYwxmbHvWx
d2vLlf+mjNFeNUKRH3o5AE5YIJxxLnEVqEIkT2LV9F3fO6ZUzZqsiYFENxwLVSet
pkwruBwa8wGjvHJBE7Clq6UQK+hI1t/ISr3CfpAYTGvBnsZPB4nY8jhILPO/SFvg
3FPGswWBW/FCjvpIwrL9MMPLCcvNNZXbEbbbs82Lure5dBNupQmFTaplhqM1p631
sbSCfXicHy6YgV0Sdeo3iKBlQW8Aubo6EPoHdweNuOX0RUP3PY7OP5g7wRK66TPN
zfVbFAR+eK8jmL0cctGLWxztlD7KVQ==
=WgIn
-----END PGP SIGNATURE-----

--0TV9MjxZ6i5UeWtD--


