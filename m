Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811F040AEBF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:18:02 +0200 (CEST)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8K1-0002sw-HQ
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQ88h-0006YN-HH
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:06:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQ88f-0002Sj-3O
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631624775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vgx4S/4MhRw6Y7Prcf5zUZwS6ARNpQYfJ8gLGLW4pqY=;
 b=Tzj6GlVr4K04VFtzNKXxf1JYJKMmdmHNIF7YSV9qMQOTfrvLhVj4uzXOX+YP8sLtmvBKxB
 2J+TV7sQ7Zr3CMQ3N/nDIpGWZSs5fxj8AmXnTaXgtmrXZ/l802/5a8vcR3nvy/pa5+A7vx
 wXeGhDvNHLPamvGMnx2Fol0Pc3YIV10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-JtROzLf3MlCuYz_d-znDmg-1; Tue, 14 Sep 2021 09:06:14 -0400
X-MC-Unique: JtROzLf3MlCuYz_d-znDmg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E10719253C0;
 Tue, 14 Sep 2021 13:06:12 +0000 (UTC)
Received: from localhost (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9CB75D9CA;
 Tue, 14 Sep 2021 13:06:08 +0000 (UTC)
Date: Tue, 14 Sep 2021 14:06:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Message-ID: <YUCeP3jGesiv0Xf5@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
 <YST++FLqV02TlusW@stefanha-x1.localdomain>
 <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
 <YTdnT27fLn4nwp2n@stefanha-x1.localdomain>
 <22CBE2AD-14EB-4162-9E97-FB7D279480AA@oracle.com>
 <YTmpu6BQ8NNrl8gk@stefanha-x1.localdomain>
 <9F0B3728-7F6C-4FBB-BF4C-49F29324F1F5@oracle.com>
 <B1D64D41-DC76-42A2-85C2-85D6DF9D973A@oracle.com>
MIME-Version: 1.0
In-Reply-To: <B1D64D41-DC76-42A2-85C2-85D6DF9D973A@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i0OVKvlOGSTYaquq"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--i0OVKvlOGSTYaquq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 05:23:33PM +0000, John Johnson wrote:
> >> On Sep 9, 2021, at 10:25 PM, John Johnson <john.g.johnson@oracle.com> =
wrote:
> >>> On Sep 8, 2021, at 11:29 PM, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >>> On Thu, Sep 09, 2021 at 05:11:49AM +0000, John Johnson wrote:
> >>>> =09I did look at coroutines, but they seemed to work when the sender
> >>>> is triggering the coroutine on send, not when request packets are ar=
riving
> >>>> asynchronously to the sends.
> >>>=20
> >>> This can be done with a receiver coroutine. Its job is to be the only
> >>> thing that reads vfio-user messages from the socket. A receiver
> >>> coroutine reads messages from the socket and wakes up the waiting
> >>> coroutine that yielded from vfio_user_send_recv() or
> >>> vfio_user_pci_process_req().
> >>>=20
> >>> (Although vfio_user_pci_process_req() could be called directly from t=
he
> >>> receiver coroutine, it seems safer to have a separate coroutine that
> >>> processes requests so that the receiver isn't blocked in case
> >>> vfio_user_pci_process_req() yields while processing a request.)
> >>>=20
> >>> Going back to what you mentioned above, the receiver coroutine does
> >>> something like this:
> >>>=20
> >>> if it's a reply
> >>>     reply =3D find_reply(...)
> >>>     qemu_coroutine_enter(reply->co) // instead of signalling reply->c=
v
> >>> else
> >>>     QSIMPLEQ_INSERT_TAIL(&pending_reqs, request, next);
> >>>     if (pending_reqs_was_empty) {
> >>>         qemu_coroutine_enter(process_request_co);
> >>>     }
> >>>=20
> >>> The pending_reqs queue holds incoming requests that the
> >>> process_request_co coroutine processes.
> >>>=20
> >>=20
> >>=20
> >> =09How do coroutines work across threads?  There can be multiple vCPU
> >> threads waiting for replies, and I think the receiver coroutine will b=
e
> >> running in the main loop thread.  Where would a vCPU block waiting for
> >> a reply?  I think coroutine_yield() returns to its coroutine_enter() c=
aller
> >=20
> >=20
> >=20
> > A vCPU thread holding the BQL can iterate the event loop if it has
> > reached a synchronous point that needs to wait for a reply before
> > returning. I think we have this situation when a MemoryRegion is
> > accessed on the proxy device.
> >=20
> > For example, block/block-backend.c:blk_prw() kicks off a coroutine and
> > then runs the event loop until the coroutine finishes:
> >=20
> >   Coroutine *co =3D qemu_coroutine_create(co_entry, &rwco);
> >   bdrv_coroutine_enter(blk_bs(blk), co);
> >   BDRV_POLL_WHILE(blk_bs(blk), rwco.ret =3D=3D NOT_DONE);
> >=20
> > BDRV_POLL_WHILE() boils down to a loop like this:
> >=20
> >   while ((cond)) {
> >     aio_poll(ctx, true);
> >   }
> >=20
>=20
> =09I think that would make vCPUs sending requests and the
> receiver coroutine all poll on the same socket.  If the =E2=80=9Cwrong=E2=
=80=9D
> routine reads the message, I=E2=80=99d need a second level of synchroniza=
tion
> to pass the message to the =E2=80=9Cright=E2=80=9D one.  e.g., if the vCP=
U coroutine
> reads a request, it needs to pass it to the receiver; if the receiver
> coroutine reads a reply, it needs to pass it to a vCPU.
>=20
> =09Avoiding this complexity is one of the reasons I went with
> a separate thread that only reads the socket over the mp-qemu model,
> which does have the sender poll, but doesn=E2=80=99t need to handle incom=
ing
> requests.

Only one coroutine reads from the socket, the "receiver" coroutine. In a
previous reply I sketched what the receiver does:

  if it's a reply
      reply =3D find_reply(...)
      qemu_coroutine_enter(reply->co) // instead of signalling reply->cv
  else
      QSIMPLEQ_INSERT_TAIL(&pending_reqs, request, next);
      if (pending_reqs_was_empty) {
          qemu_coroutine_enter(process_request_co);
      }

The qemu_coroutine_enter(reply->co) call re-enters the coroutine that
was created by the vCPU thread. Is this the "second level of
synchronization" that you described? It's very similar to signalling
reply->cv in the existing patch.

Now I'm actually thinking about whether this can be improved by keeping
the condvar so that the vCPU thread doesn't need to call aio_poll()
(which is awkward because it doesn't drop the BQL and therefore blocks
other vCPUs from making progress). That approach wouldn't require a
dedicated thread for vfio-user.

> > I also want to check that I understand the scenarios in which the
> > vfio-user communication code is used:
> >=20
> > 1. vhost-user-server
> >=20
> > The vfio-user communication code should run in a given AioContext (it
> > will be the main loop by default but maybe the user will be able to
> > configure a specific IOThread in the future).
> >=20
>=20
> =09Jag would know more, but I believe it runs off the main loop.
> Running it in an iothread doesn=E2=80=99t gain much, since it needs BQL t=
o
> run the device emulation code.
>=20
>=20
> > 2. vCPU thread vfio-user clients
> >=20
> > The vfio-user communication code is called from the vCPU thread where
> > the proxy device executes. The MemoryRegion->read()/write() callbacks
> > are synchronous, so the thread needs to wait for a vfio-user reply
> > before it can return.
> >=20
> > Is this what you had in mind?
>=20
> =09The client is also called from the main thread - the GET_*
> messages from vfio_user_pci_realize() as well as MAP/DEMAP messages
> from guest address space change transactions.  It is also called by
> the migration thread, which is a separate thread that does not run
> holding BQL.

Thanks for mentioning those additional cases.

Stefan

--i0OVKvlOGSTYaquq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFAnj8ACgkQnKSrs4Gr
c8jZBQf+JdD8R9oLDUIy4X6tFC0yfvdSshrL4KWw+XujVttQ5kl1Wi003h13/KmH
aPvteIGOXL68zH2Yjp1byLiX2QDT/w7QWf5ZcVKvv2kSFHHQZzgvP2sTF7yCuxG8
RdnaAMKpvL/QdM0wRBorVxB6MMTF2xYjCj/bIneyoIsEHSjFjxwR3iWtB2RwbFjG
pPgzIfSZ1fk5kbEYZmA24wNYxI1oQ5S8rCaS9p7fZ65fV9XAdd2JLAeAy8ypJL8h
qWywk9TlIBlrakelXVyx8UmUcwxh8H/QhomF7VjItXxtaGfe8xMWDwTt8x5AR5hA
FNU7D483gDbxzhYXma1MDghDGECdug==
=jZqJ
-----END PGP SIGNATURE-----

--i0OVKvlOGSTYaquq--


