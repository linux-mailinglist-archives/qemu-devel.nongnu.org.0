Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206516AD98E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 09:50:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZT0L-000778-DS; Tue, 07 Mar 2023 03:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZT0I-00076I-SV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:49:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZT0H-0004Cu-3f
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:49:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678178939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4o8Z3sHuwTtx8prePtJoV3k2Hn+d3pREWZFBnTNLXdk=;
 b=iyMH+yKwHmZXQsIHReagBCiF38dJQzGz+q6paKMsYjAFpU/ztfbsJ5i6UkjdC26EnVKoRm
 HqmwrzVlJRcSmX78FRKQF+qUn0SW6pQvADSJ6aqrV1T3gL4M84OlxpPhnExlPzozBPH7a1
 h341qAzAWSsyFdC0UGoxyZy31RxnHCw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-KGqDzuNoOP2cGVkCORkgaw-1; Tue, 07 Mar 2023 03:48:56 -0500
X-MC-Unique: KGqDzuNoOP2cGVkCORkgaw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0971800B23;
 Tue,  7 Mar 2023 08:48:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E1CE492C14;
 Tue,  7 Mar 2023 08:48:52 +0000 (UTC)
Date: Tue, 7 Mar 2023 09:48:51 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v5 1/4] linux-aio: use LinuxAioState from the running
 thread
Message-ID: <ZAb6c+Nz7jVvNylN@redhat.com>
References: <20230203131731.851116-1-eesposit@redhat.com>
 <20230203131731.851116-2-eesposit@redhat.com>
 <Y/96WsnkiZEb0+kf@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M6J8iEGIJTXqqXLM"
Content-Disposition: inline
In-Reply-To: <Y/96WsnkiZEb0+kf@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--M6J8iEGIJTXqqXLM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 01.03.2023 um 17:16 hat Stefan Hajnoczi geschrieben:
> On Fri, Feb 03, 2023 at 08:17:28AM -0500, Emanuele Giuseppe Esposito wrot=
e:
> > Remove usage of aio_context_acquire by always submitting asynchronous
> > AIO to the current thread's LinuxAioState.
> >=20
> > In order to prevent mistakes from the caller side, avoid passing LinuxA=
ioState
> > in laio_io_{plug/unplug} and laio_co_submit, and document the functions
> > to make clear that they work in the current thread's AioContext.
> >=20
> > Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > ---
> >  include/block/aio.h               |  4 ----
> >  include/block/raw-aio.h           | 18 ++++++++++++------
> >  include/sysemu/block-backend-io.h |  6 ++++++
> >  block/file-posix.c                | 10 +++-------
> >  block/linux-aio.c                 | 29 +++++++++++++++++------------
> >  5 files changed, 38 insertions(+), 29 deletions(-)
> >=20
> > diff --git a/include/block/aio.h b/include/block/aio.h
> > index 8fba6a3584..b6b396cfcb 100644
> > --- a/include/block/aio.h
> > +++ b/include/block/aio.h
> > @@ -208,10 +208,6 @@ struct AioContext {
> >      struct ThreadPool *thread_pool;
> > =20
> >  #ifdef CONFIG_LINUX_AIO
> > -    /*
> > -     * State for native Linux AIO.  Uses aio_context_acquire/release f=
or
> > -     * locking.
> > -     */
> >      struct LinuxAioState *linux_aio;
> >  #endif
> >  #ifdef CONFIG_LINUX_IO_URING
> > diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> > index f8cda9df91..db614472e6 100644
> > --- a/include/block/raw-aio.h
> > +++ b/include/block/raw-aio.h
> > @@ -49,14 +49,20 @@
> >  typedef struct LinuxAioState LinuxAioState;
> >  LinuxAioState *laio_init(Error **errp);
> >  void laio_cleanup(LinuxAioState *s);
> > -int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s=
, int fd,
> > -                                uint64_t offset, QEMUIOVector *qiov, i=
nt type,
> > -                                uint64_t dev_max_batch);
> > +
> > +/* laio_co_submit: submit I/O requests in the thread's current AioCont=
ext. */
> > +int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOVector =
*qiov,
> > +                                int type, uint64_t dev_max_batch);
> > +
> >  void laio_detach_aio_context(LinuxAioState *s, AioContext *old_context=
);
> >  void laio_attach_aio_context(LinuxAioState *s, AioContext *new_context=
);
> > -void laio_io_plug(BlockDriverState *bs, LinuxAioState *s);
> > -void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
> > -                    uint64_t dev_max_batch);
> > +
> > +/*
> > + * laio_io_plug/unplug work in the thread's current AioContext, theref=
ore the
> > + * caller must ensure that they are paired in the same IOThread.
> > + */
> > +void laio_io_plug(void);
> > +void laio_io_unplug(uint64_t dev_max_batch);
> >  #endif
> >  /* io_uring.c - Linux io_uring implementation */
> >  #ifdef CONFIG_LINUX_IO_URING
> > diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-b=
ackend-io.h
> > index 031a27ba10..d41698ccc5 100644
> > --- a/include/sysemu/block-backend-io.h
> > +++ b/include/sysemu/block-backend-io.h
> > @@ -74,8 +74,14 @@ void blk_iostatus_set_err(BlockBackend *blk, int err=
or);
> >  int blk_get_max_iov(BlockBackend *blk);
> >  int blk_get_max_hw_iov(BlockBackend *blk);
> > =20
> > +/*
> > + * blk_io_plug/unplug are thread-local operations. This means that mul=
tiple
> > + * IOThreads can simultaneously call plug/unplug, but the caller must =
ensure
> > + * that each unplug() is called in the same IOThread of the matching p=
lug().
> > + */
> >  void blk_io_plug(BlockBackend *blk);
> >  void blk_io_unplug(BlockBackend *blk);
> > +
> >  AioContext *blk_get_aio_context(BlockBackend *blk);
> >  BlockAcctStats *blk_get_stats(BlockBackend *blk);
> >  void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index fa227d9d14..fa99d1c25a 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -2095,10 +2095,8 @@ static int coroutine_fn raw_co_prw(BlockDriverSt=
ate *bs, uint64_t offset,
> >  #endif
> >  #ifdef CONFIG_LINUX_AIO
> >      } else if (s->use_linux_aio) {
> > -        LinuxAioState *aio =3D aio_get_linux_aio(bdrv_get_aio_context(=
bs));
> >          assert(qiov->size =3D=3D bytes);
> > -        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
> > -                              s->aio_max_batch);
> > +        return laio_co_submit(s->fd, offset, qiov, type, s->aio_max_ba=
tch);
>=20
> I'm having second thoughts here. This is correct in an IOThread today,
> but the main loop thread case concerns me:
>=20
> This patch changes behavior when the main loop or vCPU thread submits
> I/O. Before, the IOThread's LinuxAioState would be used. Now the main
> loop's LinuxAioState will be used instead and aio callbacks will be
> invoked in the main loop thread instead of the IOThread.

You mean we have a device that has a separate iothread, but a request is
submitted from the main thread? This isn't even allowed today; if a node
is in an iothread, all I/O must be submitted from that iothread. Do you
know any code that does submit I/O from the main thread instead?

> This change will be fine when QEMU block layer support is complete, but
> will does it already work today?
>=20
> When blk_preadv() is called from a non-coroutine in the main loop thread
> then the coroutine is spawned in the IOThread today. So we avoid the
> issue.
>=20
> But when blk_preadv() is called from a coroutine in the main loop thread
> we'll have multi-queue activity (I/O being processed in both the main
> loop thread and IOThread).

That's a bug then. But calling blk_*() from coroutine context should be
quite rare anyway in the current code. I can think of .run in the block
jobs and possible some exports.

Actually, we may have a bug in the export code. blk_exp_add() enables
support for changing iothreads only depending on whether the user
requested it, but doesn't check if the export driver actually supports
it. Most do, but FUSE just ignores AioContext changes (it does use the
initial iothread of the node, though, not always the main thread).

> I like this patch series and think it's the right thing to do, but I'm
> not sure if it's safe to do this yet. We first need to be sure all aio
> callbacks are thread-safe (may are already, but there are probably
> still some that are not).

I would argue that if we do have buggy code like this, the new code is
probably better than the old one because getting callbacks scheduled in
a different thread is the more surprising behaviour. It's probably done
by code that doesn't expect to ever run in iothreads, so staying in the
main loop certainly feels safer.

Kevin

--M6J8iEGIJTXqqXLM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmQG+nIACgkQfwmycsiP
L9ZEwA//X12BTkk8sHnsd34+6abo8qwu+3hWMQqZ9t2W7GINa4m8F++OEITloEka
6ilWCPnWli4b0Ue3n9gy38G2f0odBlrK1XoA6YwPF91e6h4UuNBqeuA03F6BMF8C
WHOKi7q6D6wWB6taQypBdNUH3OzOoJReVsdQ9lBK8FUw27+02rRs7KDFUwpHd/lD
A6aM9cBlCH6hyHB3h69jf52YAftSCbvZZtAHMv8tZQgpFwX8z5mxMbG9Kj3YWM//
+QPOJp1OG6Gm4KjfrTLYko3dHKyqvKW4HMYmo7uHCrGIssuMRgzxmY3MDSNbJMXL
b6wFyLPQFfp/f7OIEM0AcoNfCUV/SxaJ4Sa0rqNELCaoqC7kFOy4F8gIYxZ7sgYT
axqu9D0IEAjeG6MS+bahWOcH7KUatjOLj1j1PxAJgDgSZ2QfZ8Mc3z7iBVwCdJZD
21s4oc3i4AmdoorYNSFmaudnWSzJR+1K9jAL09O0a2XvVs/YbkFeLDTvv1VU8yJV
f93eAV5ZRR+zcTalAjiK+ghpeY9buY/5SuSdo5zZ14YSU6fd0J6vSm4EOIbnyNCG
2BQVTsjmnlQPwM0NMk3CwSvW/9Sb/usHCgDMQVmTvR1XPCHGWBughXnoMRdil7qg
ldDfUUaoaRrh0WIS8rFhGgWib3Mflbi+Sd9O5F3Toch+Zas8mk0=
=IG+6
-----END PGP SIGNATURE-----

--M6J8iEGIJTXqqXLM--


