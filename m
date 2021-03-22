Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C139344DA1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:42:33 +0100 (CET)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOZT-0005Hp-Tx
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOOXD-00043Z-B4
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOOXB-0003zE-2y
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616434808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8hgmU+y1n1wWV36JIVJmfVCwGBX4HFzm+zjvo7sF7IY=;
 b=W8hY4ePeVQGgC568WiePVQeGvoYLmInWqExH4yz9DwHs86/iqNyVuS9uubn7K0o4wETVDf
 Sv9JN2FDl+1o+c9teCPNqrJM44yV1Jw1XUDWHvUOScUxIkATkmDX+1Cl1l0e+ZumKc1bg9
 Bz4bsSriXz4QFqluYiUBbHdg5t6WdOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-TOUbbZ_sOgayGHhOp3yeFw-1; Mon, 22 Mar 2021 13:40:05 -0400
X-MC-Unique: TOUbbZ_sOgayGHhOp3yeFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 862FF612AE
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 17:40:04 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14F1D19D61;
 Mon, 22 Mar 2021 17:40:03 +0000 (UTC)
Date: Mon, 22 Mar 2021 17:40:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC PATCH 13/27] vhost: Send buffers to device
Message-ID: <YFjWcswhZWkyKOOR@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-14-eperezma@redhat.com>
 <20201208081621.GR203660@stefanha-x1.localdomain>
 <CAJaqyWf13ta5MtzmTUz2N5XnQ+ebqFPYAivdggL64LEQAf=y+A@mail.gmail.com>
 <20201210115547.GH416119@stefanha-x1.localdomain>
 <CAJaqyWe3EKiHHxgtabeZ8d7TS3LKP_BsCvHjt3YUDGLxy-Egjg@mail.gmail.com>
 <CAJaqyWdNeaboGaSsXPA8r=mUsbctFLzACFKLX55yRQpTvjqxJw@mail.gmail.com>
 <YFh2tpwBdedgrwLE@stefanha-x1.localdomain>
 <CAJaqyWccygCK4a8riMy9ZTf1cDepQQTyAK4vvh08cAUCX7nTYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWccygCK4a8riMy9ZTf1cDepQQTyAK4vvh08cAUCX7nTYQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B5lB2BMBvBCpdlpi"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--B5lB2BMBvBCpdlpi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 04:55:13PM +0100, Eugenio Perez Martin wrote:
> On Mon, Mar 22, 2021 at 11:51 AM Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >
> > On Thu, Mar 11, 2021 at 07:53:53PM +0100, Eugenio Perez Martin wrote:
> > > On Fri, Jan 22, 2021 at 7:18 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Thu, Dec 10, 2020 at 12:55 PM Stefan Hajnoczi <stefanha@redhat.c=
om> wrote:
> > > > >
> > > > > On Wed, Dec 09, 2020 at 07:41:23PM +0100, Eugenio Perez Martin wr=
ote:
> > > > > > On Tue, Dec 8, 2020 at 9:16 AM Stefan Hajnoczi <stefanha@gmail.=
com> wrote:
> > > > > > > On Fri, Nov 20, 2020 at 07:50:51PM +0100, Eugenio P=E9rez wro=
te:
> > > > > > > > +        while (true) {
> > > > > > > > +            int r;
> > > > > > > > +            if (virtio_queue_full(vq)) {
> > > > > > > > +                break;
> > > > > > > > +            }
> > > > > > >
> > > > > > > Why is this check necessary? The guest cannot provide more de=
scriptors
> > > > > > > than there is ring space. If that happens somehow then it's a=
 driver
> > > > > > > error that is already reported in virtqueue_pop() below.
> > > > > > >
> > > > > >
> > > > > > It's just checked because virtqueue_pop prints an error on that=
 case,
> > > > > > and there is no way to tell the difference between a regular er=
ror and
> > > > > > another caused by other causes. Maybe the right thing to do is =
just to
> > > > > > not to print that error? Caller should do the error printing in=
 that
> > > > > > case. Should we return an error code?
> > > > >
> > > > > The reason an error is printed today is because it's a guest erro=
r that
> > > > > never happens with correct guest drivers. Something is broken and=
 the
> > > > > user should know about it.
> > > > >
> > > > > Why is "virtio_queue_full" (I already forgot what that actually m=
eans,
> > > > > it's not clear whether this is referring to avail elements or use=
d
> > > > > elements) a condition that should be silently ignored in shadow v=
qs?
> > > > >
> > > >
> > > > TL;DR: It can be changed to a check of the number of available
> > > > descriptors in shadow vq, instead of returning as a regular operati=
on.
> > > > However, I think that making it a special return of virtqueue_pop
> > > > could help in devices that run to completion, avoiding having to
> > > > duplicate the count logic in them.
> > > >
> > > > The function virtio_queue_empty checks if the vq has all descriptor=
s
> > > > available, so the device has no more work to do until the driver ma=
kes
> > > > another descriptor available. I can see how it can be a bad name
> > > > choice, but virtio_queue_full means the opposite: device has pop()
> > > > every descriptor available, and it has not returned any, so the dri=
ver
> > > > cannot progress until the device marks some descriptors as used.
> > > >
> > > > As I understand, if vq->in_use >vq->num would mean we have a bug in
> > > > the device vq code, not in the driver. virtio_queue_full could even=
 be
> > > > changed to "assert(vq->inuse <=3D vq->vring.num); return vq->inuse =
=3D=3D
> > > > vq->vring.num", as long as vq->in_use is operated right.
> > > >
> > > > If we hit vq->in_use =3D=3D vq->num in virtqueue_pop it means the d=
evice
> > > > tried to pop() one more buffer after having all of them available a=
nd
> > > > pop'ed. This would be invalid if the device is counting right the
> > > > number of in_use descriptors, but then we are duplicating that logi=
c
> > > > in the device and the vq.
> >
> > Devices call virtqueue_pop() until it returns NULL. They don't need to
> > count virtqueue buffers explicitly. It returns NULL when vq->num
> > virtqueue buffers have already been popped (either because
> > virtio_queue_empty() is true or because an invalid driver state is
> > detected by checking vq->num in virtqueue_pop()).
>=20
> If I understood you right, the virtio_queue_full addresses the reverse
> problem: it controls when the virtqueue is out of buffers to make
> available for the device because the latter has not consumed any, not
> when the driver does not offer more buffers to the device because it
> has no more data to offer.
>=20
> I find it easier to explain with the virtio-net rx queue (and I think
> it's the easier way to trigger this issue). You are describing it's
> regular behavior: The guest fills it (let's say 100%), and the device
> picks buffers one by one:
>=20
> virtio_net_receive_rcu:
> while (offset < size) {
>     elem =3D virtqueue_pop(q->rx_vq, sizeof(VirtQueueElement));

The lines before this loop return early when the virtqueue does not have
sufficient buffer space:

  if (!virtio_net_has_buffers(q, size + n->guest_hdr_len - n->host_hdr_len)=
) {
      return 0;
  }

When entering this loop we know that we can pop the buffers needed to
fill one rx packet.

>     if (!elem) {
>         virtio_error("unexpected empty queue");
>     }
>     /* [1] */
>     /* fill elem with rx packet */
>     virtqueue_fill(virtqueue, elem);
>     ...
>     virtqueue_flush(q->rx_vq, i);
> }
>=20
> Every device as far as I know does this buffer by buffer, there is
> just processing code in [1], and it never tries to pop more than one
> buffers/chain of buffers at the same time. In the case of a queue
> empty (no more available buffers), we hit an error, because there are
> no more buffers to write.

It's an error because we already checked that the virtqueue has buffer
space. This should never happen.

> In other devices (or tx queue), empty
> buffers means there is no more work to do, not an error.
>=20
> In the case of shadow virtqueue, we cannot limit the number of exposed
> rx buffers to 1 buffer/chain of buffers in [1], since it will affect
> batching. We have the opposite problem: All devices (but rx queue)
> want to queue "as empty as possible", or "to mark all available
> buffers empty". Net rx queue is ok as long as it has a buffer/buffer
> chain big enough to write to, but it will fetch them on demand, so
> "queue full" (as in all buffers are available) is not a problem for
> the device.
>=20
> However, the part of the shadow virtqueue that forwards the available
> buffer seeks the opposite: It wants as many buffers as possible to be
> available. That means that there is no [1] code that fills/read &
> flush/detach the buffer immediately: Shadow virtqueue wants to make
> available as many buffers as possible, but the device may not use them
> until it has more data available. To the extreme (virtio-net rx queue
> full), shadow virtqueue may make available all buffers, so in a
> while(true) loop, it will try to make them available until it hits
> that all the buffers are already available (vq->in_use =3D=3D vq->num).
>=20
> The solution is to check the number of buffers already available
> before calling virtio_queue_pop(). We could duplicate in_use in shadow
> virtqueue, of course, but everything we need is already done in
> VirtQueue code, so I think to reuse it is a better solution. Another
> solution could be to treat vq->in_use =3D=3D vq->num as an special return
> code with no printed error in virtqueue_pop, but to expose if the
> queue is full (as vq->in_use =3D=3D vq->num) sounds less invasive to me.
>
> >
> > > > In shadow vq this situation happens with the correct guest network
> > > > driver, since the rx queue is filled for the device to write. Netwo=
rk
> > > > device in qemu fetch descriptors on demand, but shadow vq fetch all
> > > > available in batching. If the driver just happens to fill the queue=
 of
> > > > available descriptors, the log will raise, so we need to check in
> > > > handle_sw_lm_vq before calling pop(). Of course the shadow vq can
> > > > duplicate guest_vq->in_use instead of checking virtio_queue_full, b=
ut
> > > > then it needs to check two things for every virtqueue_pop() [1].
> >
> > I don't understand this scenario. It sounds like you are saying the
> > guest and shadow rx vq are not in sync so there is a case where
> > vq->in_use > vq->num is triggered?
>=20
> Sorry if I explain it bad, what I meant is that there is a case where
> SVQ (as device code) will call virtqueue_pop() when vq->in_use =3D=3D
> vq->num. virtio_queue_full maintains the check as >=3D, I think it
> should be safe to even to code virtio_queue_full to:
>=20
> assert(vq->in_use > vq->num);
> return vq->inuse =3D=3D vq->num;
>=20
> Please let me know if this is not clear enough.

I don't get it. When virtqueue_split_pop() has popped all requests
virtio_queue_empty_rcu() should return true and we shouldn't reach if
(vq->inuse >=3D vq->vring.num). The guest driver cannot submit more
available buffers at this point.

I only checked split rings, not packed rings.

Can you point to the SVQ code which has this problem? It may be easier
to re-read the code than try to describe it in an email.

Stefan

--B5lB2BMBvBCpdlpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBY1nIACgkQnKSrs4Gr
c8igLQgAwnaA8iRD6CTSEz2CWktvXVXhDnSZC5P38qslaMcuaEA65JY0j5uCW8xx
CT2VYbtFvz1JgI3eW2WSCh5SxSH38UACphztKOZSNwy1qQymrkO3ihTFtgoKBEbc
A3qw5vW90aYrOJsdZqwO7FW4gRXpO7hmm+ApEDltEchIwTLlOHAfeLawmv3rphUL
XLlDPnWmSw11bQLPWqqCiIkCEVcROxYIndjQSHoFI59EmsDoquszUz1xmReMyL+Z
qlHMAUioF0ti1I2TfDrig+jBW3p1JtA9wTipRucis7qWf2mDZdMbbWhDdgtM18l/
86rJICnDIPPu8kzKEoVCjHTE84Qkpw==
=PjLj
-----END PGP SIGNATURE-----

--B5lB2BMBvBCpdlpi--


