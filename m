Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E71343E74
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:53:52 +0100 (CET)
Received: from localhost ([::1]:54476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIBz-0003py-TR
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOI9u-0002bR-Jk
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOI9s-0002us-KK
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616410299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VEy/Ye4i5eRJcFSJCAJSKiatYNBBfFwAO5ms8tBEIdo=;
 b=Z7vG2JjTk5w83HVEDnlQ86Djyib1Dn6B3yyi6O1EA0W3zpFPHjHrfb/hKHDYmdrjcVrPKT
 Fi96xNzwNDVKNvXswgA6sQzKUJr50lMT6TK8GmxMxcuTQwZY4Jwc+R0OQOTb47gAeRrSiV
 yF+ZdBR+G3OMRMwCIeZvgeQ8qXEYFj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-Mai2JD7uMkiuh6sqUZ16JA-1; Mon, 22 Mar 2021 06:51:37 -0400
X-MC-Unique: Mai2JD7uMkiuh6sqUZ16JA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F2E78189C6
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:51:36 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05C8160BE5;
 Mon, 22 Mar 2021 10:51:35 +0000 (UTC)
Date: Mon, 22 Mar 2021 10:51:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC PATCH 13/27] vhost: Send buffers to device
Message-ID: <YFh2tpwBdedgrwLE@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-14-eperezma@redhat.com>
 <20201208081621.GR203660@stefanha-x1.localdomain>
 <CAJaqyWf13ta5MtzmTUz2N5XnQ+ebqFPYAivdggL64LEQAf=y+A@mail.gmail.com>
 <20201210115547.GH416119@stefanha-x1.localdomain>
 <CAJaqyWe3EKiHHxgtabeZ8d7TS3LKP_BsCvHjt3YUDGLxy-Egjg@mail.gmail.com>
 <CAJaqyWdNeaboGaSsXPA8r=mUsbctFLzACFKLX55yRQpTvjqxJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdNeaboGaSsXPA8r=mUsbctFLzACFKLX55yRQpTvjqxJw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Hax29pa3SUMeUY64"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Hax29pa3SUMeUY64
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 07:53:53PM +0100, Eugenio Perez Martin wrote:
> On Fri, Jan 22, 2021 at 7:18 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Thu, Dec 10, 2020 at 12:55 PM Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
> > >
> > > On Wed, Dec 09, 2020 at 07:41:23PM +0100, Eugenio Perez Martin wrote:
> > > > On Tue, Dec 8, 2020 at 9:16 AM Stefan Hajnoczi <stefanha@gmail.com>=
 wrote:
> > > > > On Fri, Nov 20, 2020 at 07:50:51PM +0100, Eugenio P=E9rez wrote:
> > > > > > +        while (true) {
> > > > > > +            int r;
> > > > > > +            if (virtio_queue_full(vq)) {
> > > > > > +                break;
> > > > > > +            }
> > > > >
> > > > > Why is this check necessary? The guest cannot provide more descri=
ptors
> > > > > than there is ring space. If that happens somehow then it's a dri=
ver
> > > > > error that is already reported in virtqueue_pop() below.
> > > > >
> > > >
> > > > It's just checked because virtqueue_pop prints an error on that cas=
e,
> > > > and there is no way to tell the difference between a regular error =
and
> > > > another caused by other causes. Maybe the right thing to do is just=
 to
> > > > not to print that error? Caller should do the error printing in tha=
t
> > > > case. Should we return an error code?
> > >
> > > The reason an error is printed today is because it's a guest error th=
at
> > > never happens with correct guest drivers. Something is broken and the
> > > user should know about it.
> > >
> > > Why is "virtio_queue_full" (I already forgot what that actually means=
,
> > > it's not clear whether this is referring to avail elements or used
> > > elements) a condition that should be silently ignored in shadow vqs?
> > >
> >
> > TL;DR: It can be changed to a check of the number of available
> > descriptors in shadow vq, instead of returning as a regular operation.
> > However, I think that making it a special return of virtqueue_pop
> > could help in devices that run to completion, avoiding having to
> > duplicate the count logic in them.
> >
> > The function virtio_queue_empty checks if the vq has all descriptors
> > available, so the device has no more work to do until the driver makes
> > another descriptor available. I can see how it can be a bad name
> > choice, but virtio_queue_full means the opposite: device has pop()
> > every descriptor available, and it has not returned any, so the driver
> > cannot progress until the device marks some descriptors as used.
> >
> > As I understand, if vq->in_use >vq->num would mean we have a bug in
> > the device vq code, not in the driver. virtio_queue_full could even be
> > changed to "assert(vq->inuse <=3D vq->vring.num); return vq->inuse =3D=
=3D
> > vq->vring.num", as long as vq->in_use is operated right.
> >
> > If we hit vq->in_use =3D=3D vq->num in virtqueue_pop it means the devic=
e
> > tried to pop() one more buffer after having all of them available and
> > pop'ed. This would be invalid if the device is counting right the
> > number of in_use descriptors, but then we are duplicating that logic
> > in the device and the vq.

Devices call virtqueue_pop() until it returns NULL. They don't need to
count virtqueue buffers explicitly. It returns NULL when vq->num
virtqueue buffers have already been popped (either because
virtio_queue_empty() is true or because an invalid driver state is
detected by checking vq->num in virtqueue_pop()).

> > In shadow vq this situation happens with the correct guest network
> > driver, since the rx queue is filled for the device to write. Network
> > device in qemu fetch descriptors on demand, but shadow vq fetch all
> > available in batching. If the driver just happens to fill the queue of
> > available descriptors, the log will raise, so we need to check in
> > handle_sw_lm_vq before calling pop(). Of course the shadow vq can
> > duplicate guest_vq->in_use instead of checking virtio_queue_full, but
> > then it needs to check two things for every virtqueue_pop() [1].

I don't understand this scenario. It sounds like you are saying the
guest and shadow rx vq are not in sync so there is a case where
vq->in_use > vq->num is triggered? I'm not sure how that can happen
since both vqs have equal vq->num. Maybe you can explain the scenario in
more detail?

Stefan

--Hax29pa3SUMeUY64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBYdrYACgkQnKSrs4Gr
c8ivXggAsJm/hTj2ycBiS00G7qqTkGc+T9Y1fPQXmZvlUHDWb8XmwjmF2U8mPta+
DW3Mjl4a3YYETHrmLZFwCpf/TJwlgv4MZgY1khLiTT+5XO7wAecYPn1aoqeh5src
LSkh6SxAj6H3bx+dZDHPbBAuWo4pNMPZGZokXjOZqmPnDzEro6lUxhQ7zmtrpz1u
ttEpRVVMgzCTXlFN+QWW0yOWtUyTCFgTPmsw3TBk7/gbpSTEIHIHfGqk5tB1yb+Y
LcqZBwnnXnPyZ/Z+PBZaF0CtXeUR257zLmH1tymcBhnaEuoaZuXcXb5UdMvtwTf0
2NQCUB1RcrINauyz2JvQnwJA1Tr5lQ==
=e2w5
-----END PGP SIGNATURE-----

--Hax29pa3SUMeUY64--


