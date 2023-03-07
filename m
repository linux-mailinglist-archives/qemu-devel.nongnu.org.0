Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E76AE209
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:19:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZY8x-0004ar-Ku; Tue, 07 Mar 2023 09:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZY8v-0004Zi-Bf
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:18:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZY8s-0004Qs-My
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678198693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=35NLfOEAp8ditN3puiNhM7IgjuOa0rHzK0wyCKjxacI=;
 b=bXDxozIrXde+Eu3CbV90z6wNYj7HfazhcVRBG/E0Y4sGab7+eAAklOJZuqbiVtvQPclp98
 7iZ/mL5X3LniF3qZrkpSPozGPRTJza0MfIpyGy6aKrmrOHsgMtmAFO5zNQmxyQHH36g/iK
 6touX0kwapQr1CIWvTm7KIvX5ZnNCSY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-MZ66owQDOjeX4gCXBi6dbA-1; Tue, 07 Mar 2023 09:18:09 -0500
X-MC-Unique: MZ66owQDOjeX4gCXBi6dbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22DBB28004E6;
 Tue,  7 Mar 2023 14:18:08 +0000 (UTC)
Received: from localhost (unknown [10.39.195.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88707C15BA0;
 Tue,  7 Mar 2023 14:18:07 +0000 (UTC)
Date: Tue, 7 Mar 2023 09:18:06 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
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
Message-ID: <20230307141806.GB124259@fedora>
References: <20230203131731.851116-1-eesposit@redhat.com>
 <20230203131731.851116-2-eesposit@redhat.com>
 <Y/96WsnkiZEb0+kf@fedora> <ZAb6c+Nz7jVvNylN@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ubEZ6eeZXwPzzy43"
Content-Disposition: inline
In-Reply-To: <ZAb6c+Nz7jVvNylN@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--ubEZ6eeZXwPzzy43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 09:48:51AM +0100, Kevin Wolf wrote:
> Am 01.03.2023 um 17:16 hat Stefan Hajnoczi geschrieben:
> > On Fri, Feb 03, 2023 at 08:17:28AM -0500, Emanuele Giuseppe Esposito wr=
ote:
> > > Remove usage of aio_context_acquire by always submitting asynchronous
> > > AIO to the current thread's LinuxAioState.
> > >=20
> > > In order to prevent mistakes from the caller side, avoid passing Linu=
xAioState
> > > in laio_io_{plug/unplug} and laio_co_submit, and document the functio=
ns
> > > to make clear that they work in the current thread's AioContext.
> > >=20
> > > Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > > ---
> > >  include/block/aio.h               |  4 ----
> > >  include/block/raw-aio.h           | 18 ++++++++++++------
> > >  include/sysemu/block-backend-io.h |  6 ++++++
> > >  block/file-posix.c                | 10 +++-------
> > >  block/linux-aio.c                 | 29 +++++++++++++++++------------
> > >  5 files changed, 38 insertions(+), 29 deletions(-)
> > >=20
> > > diff --git a/include/block/aio.h b/include/block/aio.h
> > > index 8fba6a3584..b6b396cfcb 100644
> > > --- a/include/block/aio.h
> > > +++ b/include/block/aio.h
> > > @@ -208,10 +208,6 @@ struct AioContext {
> > >      struct ThreadPool *thread_pool;
> > > =20
> > >  #ifdef CONFIG_LINUX_AIO
> > > -    /*
> > > -     * State for native Linux AIO.  Uses aio_context_acquire/release=
 for
> > > -     * locking.
> > > -     */
> > >      struct LinuxAioState *linux_aio;
> > >  #endif
> > >  #ifdef CONFIG_LINUX_IO_URING
> > > diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> > > index f8cda9df91..db614472e6 100644
> > > --- a/include/block/raw-aio.h
> > > +++ b/include/block/raw-aio.h
> > > @@ -49,14 +49,20 @@
> > >  typedef struct LinuxAioState LinuxAioState;
> > >  LinuxAioState *laio_init(Error **errp);
> > >  void laio_cleanup(LinuxAioState *s);
> > > -int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState =
*s, int fd,
> > > -                                uint64_t offset, QEMUIOVector *qiov,=
 int type,
> > > -                                uint64_t dev_max_batch);
> > > +
> > > +/* laio_co_submit: submit I/O requests in the thread's current AioCo=
ntext. */
> > > +int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOVecto=
r *qiov,
> > > +                                int type, uint64_t dev_max_batch);
> > > +
> > >  void laio_detach_aio_context(LinuxAioState *s, AioContext *old_conte=
xt);
> > >  void laio_attach_aio_context(LinuxAioState *s, AioContext *new_conte=
xt);
> > > -void laio_io_plug(BlockDriverState *bs, LinuxAioState *s);
> > > -void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
> > > -                    uint64_t dev_max_batch);
> > > +
> > > +/*
> > > + * laio_io_plug/unplug work in the thread's current AioContext, ther=
efore the
> > > + * caller must ensure that they are paired in the same IOThread.
> > > + */
> > > +void laio_io_plug(void);
> > > +void laio_io_unplug(uint64_t dev_max_batch);
> > >  #endif
> > >  /* io_uring.c - Linux io_uring implementation */
> > >  #ifdef CONFIG_LINUX_IO_URING
> > > diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block=
-backend-io.h
> > > index 031a27ba10..d41698ccc5 100644
> > > --- a/include/sysemu/block-backend-io.h
> > > +++ b/include/sysemu/block-backend-io.h
> > > @@ -74,8 +74,14 @@ void blk_iostatus_set_err(BlockBackend *blk, int e=
rror);
> > >  int blk_get_max_iov(BlockBackend *blk);
> > >  int blk_get_max_hw_iov(BlockBackend *blk);
> > > =20
> > > +/*
> > > + * blk_io_plug/unplug are thread-local operations. This means that m=
ultiple
> > > + * IOThreads can simultaneously call plug/unplug, but the caller mus=
t ensure
> > > + * that each unplug() is called in the same IOThread of the matching=
 plug().
> > > + */
> > >  void blk_io_plug(BlockBackend *blk);
> > >  void blk_io_unplug(BlockBackend *blk);
> > > +
> > >  AioContext *blk_get_aio_context(BlockBackend *blk);
> > >  BlockAcctStats *blk_get_stats(BlockBackend *blk);
> > >  void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
> > > diff --git a/block/file-posix.c b/block/file-posix.c
> > > index fa227d9d14..fa99d1c25a 100644
> > > --- a/block/file-posix.c
> > > +++ b/block/file-posix.c
> > > @@ -2095,10 +2095,8 @@ static int coroutine_fn raw_co_prw(BlockDriver=
State *bs, uint64_t offset,
> > >  #endif
> > >  #ifdef CONFIG_LINUX_AIO
> > >      } else if (s->use_linux_aio) {
> > > -        LinuxAioState *aio =3D aio_get_linux_aio(bdrv_get_aio_contex=
t(bs));
> > >          assert(qiov->size =3D=3D bytes);
> > > -        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
> > > -                              s->aio_max_batch);
> > > +        return laio_co_submit(s->fd, offset, qiov, type, s->aio_max_=
batch);
> >=20
> > I'm having second thoughts here. This is correct in an IOThread today,
> > but the main loop thread case concerns me:
> >=20
> > This patch changes behavior when the main loop or vCPU thread submits
> > I/O. Before, the IOThread's LinuxAioState would be used. Now the main
> > loop's LinuxAioState will be used instead and aio callbacks will be
> > invoked in the main loop thread instead of the IOThread.
>=20
> You mean we have a device that has a separate iothread, but a request is
> submitted from the main thread? This isn't even allowed today; if a node
> is in an iothread, all I/O must be submitted from that iothread. Do you
> know any code that does submit I/O from the main thread instead?

I think you're right. My mental model was outdated. Both the coroutine
and non-coroutine code paths schedule coroutines in the AioContext.

However, I think this patch series is still risky because it could
reveal latent bugs. Let's merge it in the next development cycle (soft
freeze is today!) to avoid destabilizing 8.0.

Stefan

--ubEZ6eeZXwPzzy43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQHR54ACgkQnKSrs4Gr
c8jHogf/VQZsUnkxFjVkh3r9/OZISt7yD1Q3jQeaUVk95+d/j7lqI06pcAW67kFa
a6Q73LIMgMVu4WMjnWJ7VFo6qrTO3hDZzvL7ubpdP9dnEuY75iYvj18Nv8WlA8yc
9ZMLvlP9Le4YZB7cMID/4lRxxSYLcNx9KuobkG7h0egtaelMqjx1zMz12VgQxM+g
dNOo9Wr3LQAtFPj0W+2E3BkSdYXaZ5SXNctaEEvjiDtdf1H2RqKUxyApurP/OuLT
tJHUe6ZN8C3n8VYGsNS90I7xxvM+YJ3MMdiu0RvrQO5OMSoW3aMCPDbgpvU5fS1Q
dTpmSnkYpS1USc70FOggp1MJ8nQyfg==
=uum1
-----END PGP SIGNATURE-----

--ubEZ6eeZXwPzzy43--


