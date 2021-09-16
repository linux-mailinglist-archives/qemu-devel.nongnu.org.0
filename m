Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E097A40D90F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 13:50:56 +0200 (CEST)
Received: from localhost ([::1]:54688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQpun-0004aE-LH
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 07:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQptG-0003uU-WC
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 07:49:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQptD-0007KF-Jd
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 07:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631792955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=19L6zLo7uPB2O5OtRUIlMuTITVJPWAk3L7n0azsECvE=;
 b=ZToNWtQt4azlhU/JjHDM9ts/AnvCOqU1z3ptEjYnP3xGvjWxKyaRo/iAlG0+9F0gG6Udkx
 zwuBl48F8/tyVqQIHDgN1evmGpzbNjKdpOjzfOzJcwsU+f0xYs4syp3GxjwnFwwGe7Tt9e
 +5ChY/ERbDp6odlgOM78TwU+guzr7es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-k9aJLbUqNJyG14Z9f6pHlw-1; Thu, 16 Sep 2021 07:49:13 -0400
X-MC-Unique: k9aJLbUqNJyG14Z9f6pHlw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CB728145E5;
 Thu, 16 Sep 2021 11:49:12 +0000 (UTC)
Received: from localhost (unknown [10.39.192.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DC6A104B4C2;
 Thu, 16 Sep 2021 11:49:07 +0000 (UTC)
Date: Thu, 16 Sep 2021 12:49:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Message-ID: <YUMvMlEhDIV35Rnr@stefanha-x1.localdomain>
References: <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
 <YTdnT27fLn4nwp2n@stefanha-x1.localdomain>
 <22CBE2AD-14EB-4162-9E97-FB7D279480AA@oracle.com>
 <YTmpu6BQ8NNrl8gk@stefanha-x1.localdomain>
 <9F0B3728-7F6C-4FBB-BF4C-49F29324F1F5@oracle.com>
 <B1D64D41-DC76-42A2-85C2-85D6DF9D973A@oracle.com>
 <YUCeP3jGesiv0Xf5@stefanha-x1.localdomain>
 <F156C9C7-7AAB-4FCB-83AF-AC25F3AB9562@oracle.com>
 <YUHvSJ8yY/CXWn4Z@stefanha-x1.localdomain>
 <5DC1BC61-EDEA-4807-B95A-72F803A3C68A@oracle.com>
MIME-Version: 1.0
In-Reply-To: <5DC1BC61-EDEA-4807-B95A-72F803A3C68A@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XjTWglGh5YooiQhC"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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

--XjTWglGh5YooiQhC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 07:14:30PM +0000, John Johnson wrote:
>=20
>=20
> > On Sep 15, 2021, at 6:04 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Wed, Sep 15, 2021 at 12:21:10AM +0000, John Johnson wrote:
> >>=20
> >>=20
> >>> On Sep 14, 2021, at 6:06 AM, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >>>=20
> >>> On Mon, Sep 13, 2021 at 05:23:33PM +0000, John Johnson wrote:
> >>>>>> On Sep 9, 2021, at 10:25 PM, John Johnson <john.g.johnson@oracle.c=
om> wrote:
> >>>>>>> On Sep 8, 2021, at 11:29 PM, Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
> >>>>>>> On Thu, Sep 09, 2021 at 05:11:49AM +0000, John Johnson wrote:
> >>>>>>>> =09I did look at coroutines, but they seemed to work when the se=
nder
> >>>>>>>> is triggering the coroutine on send, not when request packets ar=
e arriving
> >>>>>>>> asynchronously to the sends.
> >>>>>>>=20
> >>>>>>> This can be done with a receiver coroutine. Its job is to be the =
only
> >>>>>>> thing that reads vfio-user messages from the socket. A receiver
> >>>>>>> coroutine reads messages from the socket and wakes up the waiting
> >>>>>>> coroutine that yielded from vfio_user_send_recv() or
> >>>>>>> vfio_user_pci_process_req().
> >>>>>>>=20
> >>>>>>> (Although vfio_user_pci_process_req() could be called directly fr=
om the
> >>>>>>> receiver coroutine, it seems safer to have a separate coroutine t=
hat
> >>>>>>> processes requests so that the receiver isn't blocked in case
> >>>>>>> vfio_user_pci_process_req() yields while processing a request.)
> >>>>>>>=20
> >>>>>>> Going back to what you mentioned above, the receiver coroutine do=
es
> >>>>>>> something like this:
> >>>>>>>=20
> >>>>>>> if it's a reply
> >>>>>>>   reply =3D find_reply(...)
> >>>>>>>   qemu_coroutine_enter(reply->co) // instead of signalling reply-=
>cv
> >>>>>>> else
> >>>>>>>   QSIMPLEQ_INSERT_TAIL(&pending_reqs, request, next);
> >>>>>>>   if (pending_reqs_was_empty) {
> >>>>>>>       qemu_coroutine_enter(process_request_co);
> >>>>>>>   }
> >>>>>>>=20
> >>>>>>> The pending_reqs queue holds incoming requests that the
> >>>>>>> process_request_co coroutine processes.
> >>>>>>>=20
> >>>>>>=20
> >>>>>>=20
> >>>>>> =09How do coroutines work across threads?  There can be multiple v=
CPU
> >>>>>> threads waiting for replies, and I think the receiver coroutine wi=
ll be
> >>>>>> running in the main loop thread.  Where would a vCPU block waiting=
 for
> >>>>>> a reply?  I think coroutine_yield() returns to its coroutine_enter=
() caller
> >>>>>=20
> >>>>>=20
> >>>>>=20
> >>>>> A vCPU thread holding the BQL can iterate the event loop if it has
> >>>>> reached a synchronous point that needs to wait for a reply before
> >>>>> returning. I think we have this situation when a MemoryRegion is
> >>>>> accessed on the proxy device.
> >>>>>=20
> >>>>> For example, block/block-backend.c:blk_prw() kicks off a coroutine =
and
> >>>>> then runs the event loop until the coroutine finishes:
> >>>>>=20
> >>>>> Coroutine *co =3D qemu_coroutine_create(co_entry, &rwco);
> >>>>> bdrv_coroutine_enter(blk_bs(blk), co);
> >>>>> BDRV_POLL_WHILE(blk_bs(blk), rwco.ret =3D=3D NOT_DONE);
> >>>>>=20
> >>>>> BDRV_POLL_WHILE() boils down to a loop like this:
> >>>>>=20
> >>>>> while ((cond)) {
> >>>>>   aio_poll(ctx, true);
> >>>>> }
> >>>>>=20
> >>>>=20
> >>>> =09I think that would make vCPUs sending requests and the
> >>>> receiver coroutine all poll on the same socket.  If the =E2=80=9Cwro=
ng=E2=80=9D
> >>>> routine reads the message, I=E2=80=99d need a second level of synchr=
onization
> >>>> to pass the message to the =E2=80=9Cright=E2=80=9D one.  e.g., if th=
e vCPU coroutine
> >>>> reads a request, it needs to pass it to the receiver; if the receive=
r
> >>>> coroutine reads a reply, it needs to pass it to a vCPU.
> >>>>=20
> >>>> =09Avoiding this complexity is one of the reasons I went with
> >>>> a separate thread that only reads the socket over the mp-qemu model,
> >>>> which does have the sender poll, but doesn=E2=80=99t need to handle =
incoming
> >>>> requests.
> >>>=20
> >>> Only one coroutine reads from the socket, the "receiver" coroutine. I=
n a
> >>> previous reply I sketched what the receiver does:
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
> >>=20
> >> =09Sorry, I was assuming when you said the coroutine will block with
> >> aio_poll(), you implied it would also read messages from the socket.
> >=20
> > The vCPU thread calls aio_poll() outside the coroutine, similar to the
> > block/block-backend.c:blk_prw() example I posted above:
> >=20
> >  Coroutine *co =3D qemu_coroutine_create(co_entry, &rwco);
> >  bdrv_coroutine_enter(blk_bs(blk), co);
> >  BDRV_POLL_WHILE(blk_bs(blk), rwco.ret =3D=3D NOT_DONE);
> >=20
> > (BDRV_POLL_WHILE() is a aio_poll() loop.)
> >=20
> > The coroutine isn't aware of aio_poll(), it just yields when it needs t=
o
> > wait.
> >=20
> >>> The qemu_coroutine_enter(reply->co) call re-enters the coroutine that
> >>> was created by the vCPU thread. Is this the "second level of
> >>> synchronization" that you described? It's very similar to signalling
> >>> reply->cv in the existing patch.
> >>>=20
> >>=20
> >> =09Yes, the only difference is it would be woken on each message,
> >> even though it doesn=E2=80=99t read them.  Which is what I think you=
=E2=80=99re addressing
> >> below.
> >>=20
> >>> Now I'm actually thinking about whether this can be improved by keepi=
ng
> >>> the condvar so that the vCPU thread doesn't need to call aio_poll()
> >>> (which is awkward because it doesn't drop the BQL and therefore block=
s
> >>> other vCPUs from making progress). That approach wouldn't require a
> >>> dedicated thread for vfio-user.
> >>>=20
> >>=20
> >> =09Wouldn=E2=80=99t you need to acquire BQL twice for every vCPU reply=
: once to
> >> run the receiver coroutine, and once when the vCPU thread wakes up and=
 wants
> >> to return to the VFIO code.  The migration thread would also add a BQL
> >> dependency, where it didn=E2=80=99t have one before.
> >=20
> > If aio_poll() is used then the vCPU thread doesn't drop the BQL at all.
> > The vCPU thread sends the message and waits for the reply while other
> > BQL threads are locked out.
> >=20
> > If a condvar or similar mechanism is used then the vCPU sends the
> > message, drops the BQL, and waits on the condvar. The main loop thread
> > runs the receiver coroutine and re-enters the coroutine, which signals
> > the condvar. The vCPU then re-acquires the BQL.
> >=20
>=20
> =09I understand this.  The point I was trying to make was you'd need
> to acquire BQL twice for every reply: once by the main loop before it run=
s
> the receiver coroutine and once after the vCPU wakes up.  That would seem
> to increase latency over the iothread model.

Yes, but if minimizing latency is critical then you can use the
aio_poll() approach. It's fastest since it doesn't context switch or
drop the BQL.

Regarding vfio-user performance in general, devices should use ioeventfd
and/or mmap regions to avoid going through the VMM in
performance-critical code paths.

> >> =09Is your objection with using an iothread, or using a separate threa=
d?
> >> I can change to using qemu_thread_create() and running aio_poll() from=
 the
> >> thread routine, instead of creating an iothread.
> >=20
> > The vfio-user communication code shouldn't need to worry about threads
> > or locks. The code can be written in terms of AioContext so the caller
> > can use it from various environments without hardcoding details of the
> > BQL or threads into the communication code. This makes it easier to
> > understand and less tightly coupled.
> >=20
> > I'll try to sketch how that could work:
> >=20
> > The main concept is VFIOProxy, which has a QIOChannel (the socket
> > connection) and its main API is:
> >=20
> >  void coroutine_fn vfio_user_co_send_recv(VFIOProxy *proxy,
> >          VFIOUserHdr *msg, VFIOUserFDs *fds, int rsize, int flags);
> >=20
> > There is also a request callback for processing incoming requests:
> >=20
> >  void coroutine_fn (*request)(void *opaque, char *buf,
> >                              VFIOUserFDs *fds);
> >=20
> > The main loop thread can either use vfio_user_co_send_recv() from
> > coroutine context or use this blocking wrapper:
> >=20
> >  typedef struct {
> >      VFIOProxy *proxy;
> >      VFIOUserHdr *msg;
> >      VFIOUserFDs *fds;
> >      int rsize;
> >      int flags;
> >      bool done;
> >  } VFIOUserSendRecvData;
> >=20
> >  static void coroutine_fn vfu_send_recv_co(void *opaque)
> >  {
> >      VFIOUserSendRecvData *data =3D opaque;
> >      vfio_user_co_send_recv(data->proxy, data->msg, data->fds,
> >                             data->rsize, data->flags);
> >      data->done =3D true;
> >  }
> >=20
> >  /* A blocking version of vfio_user_co_send_recv() */
> >  void vfio_user_send_recv(VFIOProxy *proxy, VFIOUserHdr *msg,
> >                           VFIOUserFDs *fds, int rsize, int flags)
> >  {
> >      VFIOUserSendRecvData data =3D {
> >          .proxy =3D proxy,
> > =09  .msg =3D msg,
> > =09  .fds =3D fds,
> > =09  .rsize =3D rsize,
> > =09  .flags =3D flags,
> >      };
> >      Coroutine *co =3D qemu_coroutine_create(vfu_send_recv_co, &data);
> >      qemu_coroutine_enter(co);
> >      while (!data.done) {
> >          aio_poll(proxy->ioc->ctx, true);
> >      }
> >  }
> >=20
> > The vCPU thread can use vfio_user_send_recv() if it wants, although the
> > BQL will be held, preventing other threads from making progress. That
> > can be avoided by writing a similar wrapper that uses a QemuSemaphore:
> >=20
> >  typedef struct {
> >      VFIOProxy *proxy;
> >      VFIOUserHdr *msg;
> >      VFIOUserFDs *fds;
> >      int rsize;
> >      int flags;
> >      QemuSemaphore sem;
> >  } VFIOUserSendRecvData;
> >=20
> >  static void coroutine_fn vfu_send_recv_co(void *opaque)
> >  {
> >      VFIOUserSendRecvData *data =3D opaque;
> >      vfio_user_co_send_recv(data->proxy, data->msg, data->fds,
> >                             data->rsize, data->flags);
> >      qemu_sem_post(&data->sem);
> >  }
> >=20
> >  /*
> >   * A blocking version of vfio_user_co_send_recv() that relies on
> >   * another thread to run the event loop. This can be used from vCPU
> >   * threads to avoid hogging the BQL.
> >   */
> >  void vfio_user_vcpu_send_recv(VFIOProxy *proxy, VFIOUserHdr *msg,
> >                                VFIOUserFDs *fds, int rsize, int flags)
> >  {
> >      VFIOUserSendRecvData data =3D {
> >          .proxy =3D proxy,
> > =09  .msg =3D msg,
> > =09  .fds =3D fds,
> > =09  .rsize =3D rsize,
> > =09  .flags =3D flags,
> >      };
> >      Coroutine *co =3D qemu_coroutine_create(vfu_vcpu_send_recv_co, &da=
ta);
> >=20
> >      qemu_sem_init(&data.sem, 0);
> >=20
> >      qemu_coroutine_enter(co);
> >=20
> >      qemu_mutex_unlock_iothread();
> >      qemu_sem_wait(&data.sem);
> >      qemu_mutex_lock_iothread();
> >=20
> >      qemu_sem_destroy(&data.sem);
> >  }
> >=20
> > With vfio_user_vcpu_send_recv() the vCPU thread doesn't call aio_poll()
> > itself but instead relies on the main loop thread to run the event loop=
.
> >=20
>=20
> =09I think this means I need 2 send algorithms: one for when called
> from the main loop, and another for when called outside the main loop
> (vCPU or migration).  I can=E2=80=99t use the semaphore version from the =
main
> loop, since blocking the main loop would prevent the receiver routine
> from being scheduled, so I=E2=80=99d want to use aio_poll() there.
>
> =09Some vfio_user calls can come from either place (e.g., realize
> uses REGION_READ to read the device config space, and vCPU uses it
> on a guest load to the device), so I=E2=80=99d need to detect which threa=
d I=E2=80=99m
> running in to choose the right sender.

The semaphore version is not really necessary, although it allows other
BQL threads to make progress while we wait for a reply (but is slower,
as you pointed out).

The aio_poll() approach can be used from either thread.

> > By writing coroutines that run in proxy->ioc->ctx we keep the threading
> > model and locking in the caller. The communication code isn't aware of
> > or tied to specific threads. It's possible to drop proxy->lock because
> > state is only changed from within the AioContext, not multiple threads
> > that may run in parallel. I think this makes the communication code
> > simpler and cleaner.
> >=20
> > It's possible to use IOThreads with this approach: set the QIOChannel's
> > AioContext to the IOThread AioContext. However, I don't think we can do
> > this in the vhost-user server yet because QEMU's device models expect t=
o
> > run with the BQL and not in an IOThread.
> >=20
> > I didn't go into detail about how vfio_user_co_send_recv() is
> > implemented. Please let me know if you want me to share ideas about
> > that, but it's what we've already discussed with a "receiver" coroutine
> > that re-enters the reply coroutines or calls ->request(). A CoMutex is
> > needed to around qio_channel_write_all() to ensure that coroutines
> > sending messages don't interleave partial writes if the socket sndbuf i=
s
> > exhausted.
> >=20
>=20
> =09Here is where I questioned how coroutines work across threads.
> When the reply waiter is not the main loop, would the receiver coroutine
> re-enter the reply coroutine or signal the condvar it is waiting on?

The global AioContext (qemu_get_aio_context()) is shared by multiple
thread and mutual exclusion is provided by the BQL. Any of the threads
can run the coroutines and during a coroutine's lifetime it can run in
multiple threads (but never simultaneously in multiple threads).

The vfu_send_recv_co() coroutine above starts in the vCPU thread but
then yields and is re-entered from the main loop thread. The receiver
coroutine re-enters vfu_send_recv_co() in the main loop thread where it
calls qemu_sem_post() to wake up the vCPU thread.

(IOThread AioContexts are not shared by multiple threads, so in that
case we don't need to worry about threads since everything is done in
the IOThread.)

> >> =09On a related subject:
> >>=20
> >> On Aug 24, 2021, at 8:14 AM, Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >>=20
> >>>> +    ret =3D qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numf=
ds,
> >>>> +                                 &local_err);
> >>>=20
> >>> This is a blocking call. My understanding is that the IOThread is sha=
red
> >>> by all vfio-user devices, so other devices will have to wait if one o=
f
> >>> them is acting up (e.g. the device emulation process sent less than
> >>> sizeof(msg) bytes).
> >>=20
> >>=20
> >> =09This shouldn=E2=80=99t block if the emulation process sends less th=
an sizeof(msg)
> >> bytes.  qio_channel_readv() will eventually call recvmsg(), which only=
 blocks a
> >> short read if MSG_WAITALL is set, and it=E2=80=99s not set in this cas=
e.  recvmsg() will
> >> return the data available, and vfio_user_recv() will treat a short rea=
d as an error.
> >=20
> > That's true but vfio_user_recv() can still block layer on: if only
> > sizeof(msg) bytes are available and msg.size > sizeof(msg) then the
> > second call blocks.
> >=20
> >  msgleft =3D msg.size - sizeof(msg);
> >  if (msgleft !=3D 0) {
> >      ret =3D qio_channel_read(proxy->ioc, data, msgleft, &local_err);
> >=20
> > I think either code should be non-blocking or it shouldn't be. Writing
> > code that is partially non-blocking is asking for trouble because it's
> > not obvious where it can block and misbehaving or malicious programs ca=
n
> > cause it to block.
> >=20
>=20
> =09I wonder if I should just go fully non-blocking, and have the
> senders queue messages for the sending routine, and have the receiving
> routine either signal a reply waiter or schedule a request handling
> routine.

That sounds good.

If messages are sent from coroutine context rather than plain functions
then a separate sender isn't needed, they can use a CoMutex for mutual
exclusion/queuing instead of an explicit send queue and sender routine.

Stefan

--XjTWglGh5YooiQhC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFDLzIACgkQnKSrs4Gr
c8j8mwf+KGVG0tc/BNUzEDRxkt3QYeAVotxbIV4KWisWE/YkeFJdkWHCpP3dGA17
7Y+OkKJnqpvnzSdZ5z9ez3gOdAKMz9tKpGSBxUaqCWwjx/uxALWMF+yBo6FEBg7r
PINRi3ufxU/odrcpjGPSJuvrxWE+OdNMCNiSWCCmtnxcTkEJciI/RrmbJgJQvp49
Hn7GRLGJoYBVU8xq7pqfyl/z8avTbClxU/Cd0uThxWe+WSwVcpxgoRI9ZoeqrMI1
NA5tdgBR2ZZL2mjtSlQDu2TsLU7Mk7NVzdfhYSTTFlyLjHWxxiMhN/fcrfEmk7y2
evE2h5UP/WmjEJ+1ZiCJyCPaVCm/FA==
=IkJz
-----END PGP SIGNATURE-----

--XjTWglGh5YooiQhC--


