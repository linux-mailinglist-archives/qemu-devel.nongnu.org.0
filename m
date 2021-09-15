Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142ED40C5EF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 15:08:15 +0200 (CEST)
Received: from localhost ([::1]:46688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQUe5-0002oG-Te
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 09:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQUaM-0000lO-JI
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQUaH-0004Oq-Ns
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631711056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Z412RezdLef5y0Yu29j5bF7U5vh4t6pGfSkwbaIgBc=;
 b=WvE6Qsw74jOtFG4WFdaI5LdHJvRZTgUgkda+0ymlO7NkEtxiy7I+Q+zgvTVFPqmjus6LAL
 /25LPPPqMDip8Ary8WMqUzGz7P9cscL1FPGfTMhJwOPEPO/cXea0xP2IgPPCw9sC1iU+lG
 BFAgfLGpO6mNZ7G1cD2NZXR2poH6AU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-iD9Ba_M3NnCoGfKHMMpiiw-1; Wed, 15 Sep 2021 09:04:15 -0400
X-MC-Unique: iD9Ba_M3NnCoGfKHMMpiiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38D171006AA0;
 Wed, 15 Sep 2021 13:04:14 +0000 (UTC)
Received: from localhost (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7E6B19736;
 Wed, 15 Sep 2021 13:04:09 +0000 (UTC)
Date: Wed, 15 Sep 2021 14:04:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Message-ID: <YUHvSJ8yY/CXWn4Z@stefanha-x1.localdomain>
References: <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
 <YST++FLqV02TlusW@stefanha-x1.localdomain>
 <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
 <YTdnT27fLn4nwp2n@stefanha-x1.localdomain>
 <22CBE2AD-14EB-4162-9E97-FB7D279480AA@oracle.com>
 <YTmpu6BQ8NNrl8gk@stefanha-x1.localdomain>
 <9F0B3728-7F6C-4FBB-BF4C-49F29324F1F5@oracle.com>
 <B1D64D41-DC76-42A2-85C2-85D6DF9D973A@oracle.com>
 <YUCeP3jGesiv0Xf5@stefanha-x1.localdomain>
 <F156C9C7-7AAB-4FCB-83AF-AC25F3AB9562@oracle.com>
MIME-Version: 1.0
In-Reply-To: <F156C9C7-7AAB-4FCB-83AF-AC25F3AB9562@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w0Hjyv9svWw9yOWr"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

--w0Hjyv9svWw9yOWr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 12:21:10AM +0000, John Johnson wrote:
>=20
>=20
> > On Sep 14, 2021, at 6:06 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Mon, Sep 13, 2021 at 05:23:33PM +0000, John Johnson wrote:
> >>>> On Sep 9, 2021, at 10:25 PM, John Johnson <john.g.johnson@oracle.com=
> wrote:
> >>>>> On Sep 8, 2021, at 11:29 PM, Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
> >>>>> On Thu, Sep 09, 2021 at 05:11:49AM +0000, John Johnson wrote:
> >>>>>> =09I did look at coroutines, but they seemed to work when the send=
er
> >>>>>> is triggering the coroutine on send, not when request packets are =
arriving
> >>>>>> asynchronously to the sends.
> >>>>>=20
> >>>>> This can be done with a receiver coroutine. Its job is to be the on=
ly
> >>>>> thing that reads vfio-user messages from the socket. A receiver
> >>>>> coroutine reads messages from the socket and wakes up the waiting
> >>>>> coroutine that yielded from vfio_user_send_recv() or
> >>>>> vfio_user_pci_process_req().
> >>>>>=20
> >>>>> (Although vfio_user_pci_process_req() could be called directly from=
 the
> >>>>> receiver coroutine, it seems safer to have a separate coroutine tha=
t
> >>>>> processes requests so that the receiver isn't blocked in case
> >>>>> vfio_user_pci_process_req() yields while processing a request.)
> >>>>>=20
> >>>>> Going back to what you mentioned above, the receiver coroutine does
> >>>>> something like this:
> >>>>>=20
> >>>>> if it's a reply
> >>>>>    reply =3D find_reply(...)
> >>>>>    qemu_coroutine_enter(reply->co) // instead of signalling reply->=
cv
> >>>>> else
> >>>>>    QSIMPLEQ_INSERT_TAIL(&pending_reqs, request, next);
> >>>>>    if (pending_reqs_was_empty) {
> >>>>>        qemu_coroutine_enter(process_request_co);
> >>>>>    }
> >>>>>=20
> >>>>> The pending_reqs queue holds incoming requests that the
> >>>>> process_request_co coroutine processes.
> >>>>>=20
> >>>>=20
> >>>>=20
> >>>> =09How do coroutines work across threads?  There can be multiple vCP=
U
> >>>> threads waiting for replies, and I think the receiver coroutine will=
 be
> >>>> running in the main loop thread.  Where would a vCPU block waiting f=
or
> >>>> a reply?  I think coroutine_yield() returns to its coroutine_enter()=
 caller
> >>>=20
> >>>=20
> >>>=20
> >>> A vCPU thread holding the BQL can iterate the event loop if it has
> >>> reached a synchronous point that needs to wait for a reply before
> >>> returning. I think we have this situation when a MemoryRegion is
> >>> accessed on the proxy device.
> >>>=20
> >>> For example, block/block-backend.c:blk_prw() kicks off a coroutine an=
d
> >>> then runs the event loop until the coroutine finishes:
> >>>=20
> >>>  Coroutine *co =3D qemu_coroutine_create(co_entry, &rwco);
> >>>  bdrv_coroutine_enter(blk_bs(blk), co);
> >>>  BDRV_POLL_WHILE(blk_bs(blk), rwco.ret =3D=3D NOT_DONE);
> >>>=20
> >>> BDRV_POLL_WHILE() boils down to a loop like this:
> >>>=20
> >>>  while ((cond)) {
> >>>    aio_poll(ctx, true);
> >>>  }
> >>>=20
> >>=20
> >> =09I think that would make vCPUs sending requests and the
> >> receiver coroutine all poll on the same socket.  If the =E2=80=9Cwrong=
=E2=80=9D
> >> routine reads the message, I=E2=80=99d need a second level of synchron=
ization
> >> to pass the message to the =E2=80=9Cright=E2=80=9D one.  e.g., if the =
vCPU coroutine
> >> reads a request, it needs to pass it to the receiver; if the receiver
> >> coroutine reads a reply, it needs to pass it to a vCPU.
> >>=20
> >> =09Avoiding this complexity is one of the reasons I went with
> >> a separate thread that only reads the socket over the mp-qemu model,
> >> which does have the sender poll, but doesn=E2=80=99t need to handle in=
coming
> >> requests.
> >=20
> > Only one coroutine reads from the socket, the "receiver" coroutine. In =
a
> > previous reply I sketched what the receiver does:
> >=20
> >  if it's a reply
> >      reply =3D find_reply(...)
> >      qemu_coroutine_enter(reply->co) // instead of signalling reply->cv
> >  else
> >      QSIMPLEQ_INSERT_TAIL(&pending_reqs, request, next);
> >      if (pending_reqs_was_empty) {
> >          qemu_coroutine_enter(process_request_co);
> >      }
> >=20
>=20
> =09Sorry, I was assuming when you said the coroutine will block with
> aio_poll(), you implied it would also read messages from the socket.

The vCPU thread calls aio_poll() outside the coroutine, similar to the
block/block-backend.c:blk_prw() example I posted above:

  Coroutine *co =3D qemu_coroutine_create(co_entry, &rwco);
  bdrv_coroutine_enter(blk_bs(blk), co);
  BDRV_POLL_WHILE(blk_bs(blk), rwco.ret =3D=3D NOT_DONE);

(BDRV_POLL_WHILE() is a aio_poll() loop.)

The coroutine isn't aware of aio_poll(), it just yields when it needs to
wait.

> > The qemu_coroutine_enter(reply->co) call re-enters the coroutine that
> > was created by the vCPU thread. Is this the "second level of
> > synchronization" that you described? It's very similar to signalling
> > reply->cv in the existing patch.
> >=20
>=20
> =09Yes, the only difference is it would be woken on each message,
> even though it doesn=E2=80=99t read them.  Which is what I think you=E2=
=80=99re addressing
> below.
>
> > Now I'm actually thinking about whether this can be improved by keeping
> > the condvar so that the vCPU thread doesn't need to call aio_poll()
> > (which is awkward because it doesn't drop the BQL and therefore blocks
> > other vCPUs from making progress). That approach wouldn't require a
> > dedicated thread for vfio-user.
> >=20
>=20
> =09Wouldn=E2=80=99t you need to acquire BQL twice for every vCPU reply: o=
nce to
> run the receiver coroutine, and once when the vCPU thread wakes up and wa=
nts
> to return to the VFIO code.  The migration thread would also add a BQL
> dependency, where it didn=E2=80=99t have one before.

If aio_poll() is used then the vCPU thread doesn't drop the BQL at all.
The vCPU thread sends the message and waits for the reply while other
BQL threads are locked out.

If a condvar or similar mechanism is used then the vCPU sends the
message, drops the BQL, and waits on the condvar. The main loop thread
runs the receiver coroutine and re-enters the coroutine, which signals
the condvar. The vCPU then re-acquires the BQL.

> =09Is your objection with using an iothread, or using a separate thread?
> I can change to using qemu_thread_create() and running aio_poll() from th=
e
> thread routine, instead of creating an iothread.

The vfio-user communication code shouldn't need to worry about threads
or locks. The code can be written in terms of AioContext so the caller
can use it from various environments without hardcoding details of the
BQL or threads into the communication code. This makes it easier to
understand and less tightly coupled.

I'll try to sketch how that could work:

The main concept is VFIOProxy, which has a QIOChannel (the socket
connection) and its main API is:

  void coroutine_fn vfio_user_co_send_recv(VFIOProxy *proxy,
          VFIOUserHdr *msg, VFIOUserFDs *fds, int rsize, int flags);

There is also a request callback for processing incoming requests:

  void coroutine_fn (*request)(void *opaque, char *buf,
                              VFIOUserFDs *fds);

The main loop thread can either use vfio_user_co_send_recv() from
coroutine context or use this blocking wrapper:

  typedef struct {
      VFIOProxy *proxy;
      VFIOUserHdr *msg;
      VFIOUserFDs *fds;
      int rsize;
      int flags;
      bool done;
  } VFIOUserSendRecvData;

  static void coroutine_fn vfu_send_recv_co(void *opaque)
  {
      VFIOUserSendRecvData *data =3D opaque;
      vfio_user_co_send_recv(data->proxy, data->msg, data->fds,
                             data->rsize, data->flags);
      data->done =3D true;
  }

  /* A blocking version of vfio_user_co_send_recv() */
  void vfio_user_send_recv(VFIOProxy *proxy, VFIOUserHdr *msg,
                           VFIOUserFDs *fds, int rsize, int flags)
  {
      VFIOUserSendRecvData data =3D {
          .proxy =3D proxy,
=09  .msg =3D msg,
=09  .fds =3D fds,
=09  .rsize =3D rsize,
=09  .flags =3D flags,
      };
      Coroutine *co =3D qemu_coroutine_create(vfu_send_recv_co, &data);
      qemu_coroutine_enter(co);
      while (!data.done) {
          aio_poll(proxy->ioc->ctx, true);
      }
  }

The vCPU thread can use vfio_user_send_recv() if it wants, although the
BQL will be held, preventing other threads from making progress. That
can be avoided by writing a similar wrapper that uses a QemuSemaphore:

  typedef struct {
      VFIOProxy *proxy;
      VFIOUserHdr *msg;
      VFIOUserFDs *fds;
      int rsize;
      int flags;
      QemuSemaphore sem;
  } VFIOUserSendRecvData;

  static void coroutine_fn vfu_send_recv_co(void *opaque)
  {
      VFIOUserSendRecvData *data =3D opaque;
      vfio_user_co_send_recv(data->proxy, data->msg, data->fds,
                             data->rsize, data->flags);
      qemu_sem_post(&data->sem);
  }

  /*
   * A blocking version of vfio_user_co_send_recv() that relies on
   * another thread to run the event loop. This can be used from vCPU
   * threads to avoid hogging the BQL.
   */
  void vfio_user_vcpu_send_recv(VFIOProxy *proxy, VFIOUserHdr *msg,
                                VFIOUserFDs *fds, int rsize, int flags)
  {
      VFIOUserSendRecvData data =3D {
          .proxy =3D proxy,
=09  .msg =3D msg,
=09  .fds =3D fds,
=09  .rsize =3D rsize,
=09  .flags =3D flags,
      };
      Coroutine *co =3D qemu_coroutine_create(vfu_vcpu_send_recv_co, &data)=
;

      qemu_sem_init(&data.sem, 0);

      qemu_coroutine_enter(co);

      qemu_mutex_unlock_iothread();
      qemu_sem_wait(&data.sem);
      qemu_mutex_lock_iothread();

      qemu_sem_destroy(&data.sem);
  }

With vfio_user_vcpu_send_recv() the vCPU thread doesn't call aio_poll()
itself but instead relies on the main loop thread to run the event loop.

By writing coroutines that run in proxy->ioc->ctx we keep the threading
model and locking in the caller. The communication code isn't aware of
or tied to specific threads. It's possible to drop proxy->lock because
state is only changed from within the AioContext, not multiple threads
that may run in parallel. I think this makes the communication code
simpler and cleaner.

It's possible to use IOThreads with this approach: set the QIOChannel's
AioContext to the IOThread AioContext. However, I don't think we can do
this in the vhost-user server yet because QEMU's device models expect to
run with the BQL and not in an IOThread.

I didn't go into detail about how vfio_user_co_send_recv() is
implemented. Please let me know if you want me to share ideas about
that, but it's what we've already discussed with a "receiver" coroutine
that re-enters the reply coroutines or calls ->request(). A CoMutex is
needed to around qio_channel_write_all() to ensure that coroutines
sending messages don't interleave partial writes if the socket sndbuf is
exhausted.

> =09On a related subject:
>=20
> On Aug 24, 2021, at 8:14 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> >> +    ret =3D qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numfds=
,
> >> +                                 &local_err);
> >=20
> > This is a blocking call. My understanding is that the IOThread is share=
d
> > by all vfio-user devices, so other devices will have to wait if one of
> > them is acting up (e.g. the device emulation process sent less than
> > sizeof(msg) bytes).
>=20
>=20
> =09This shouldn=E2=80=99t block if the emulation process sends less than =
sizeof(msg)
> bytes.  qio_channel_readv() will eventually call recvmsg(), which only bl=
ocks a
> short read if MSG_WAITALL is set, and it=E2=80=99s not set in this case. =
 recvmsg() will
> return the data available, and vfio_user_recv() will treat a short read a=
s an error.

That's true but vfio_user_recv() can still block layer on: if only
sizeof(msg) bytes are available and msg.size > sizeof(msg) then the
second call blocks.

  msgleft =3D msg.size - sizeof(msg);
  if (msgleft !=3D 0) {
      ret =3D qio_channel_read(proxy->ioc, data, msgleft, &local_err);

I think either code should be non-blocking or it shouldn't be. Writing
code that is partially non-blocking is asking for trouble because it's
not obvious where it can block and misbehaving or malicious programs can
cause it to block.

Stefan

--w0Hjyv9svWw9yOWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFB70gACgkQnKSrs4Gr
c8iHHAgAnZsJY2f0AMlVGfsb29BCSwAkLhubS2rqSmaW+9pfV5KOWeCND3BPqEUf
yIynP/wH3tO9DE5QXaisn7kkRfWiuJl+de/NyGks26W0QJ3KXW4wbPtQUY1ySGFa
kS4U1CLG4EsLnrmTdxGWlvsgoKCh15RAq45WFjVxM4ofrG76D8dECdwPjEteg6A2
t3wddchgxfYNUCIK4TA6KD2UGRPudw91zGgNBSq46buMppcick0g/1hdKYfcO+bz
/BYskxBXTTVd+XhOuU6suKhh1A3QiN22mStHi1cPFrhAEPy9Mu9umgq+mwIwpe0D
bMqdBvICUPleUXUZ/C2QDPywVEA30w==
=87Kq
-----END PGP SIGNATURE-----

--w0Hjyv9svWw9yOWr--


