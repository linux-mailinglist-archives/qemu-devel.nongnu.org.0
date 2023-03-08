Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608556B063C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 12:43:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZsBe-0004Q1-Pr; Wed, 08 Mar 2023 06:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZsBc-0004PS-SV
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 06:42:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZsBa-0001n8-VN
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 06:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678275739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4+A6s9h/lya7NW+eol9hhQ4Dl9sPZ4HTlcSevYbKyaQ=;
 b=iG1G0tIOUEGJhx2ZzB/2aV6k/LM3hZ69MG9iciROSejgRdumKIn17A0hv3XHn3/Vtk2Nzu
 e99Bv/q+kagf8uzlykX0bh0D093zSeS9GCelxsRRxF61UlHa3u6gTo9VE1bd854GnuJvFr
 gYYhWkXLNQM7U4TfcziC62WrnkEl++o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-bn9_F2gFM4yVQIAJgHZbAQ-1; Wed, 08 Mar 2023 06:42:16 -0500
X-MC-Unique: bn9_F2gFM4yVQIAJgHZbAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8734B18A6461;
 Wed,  8 Mar 2023 11:42:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D867F2026D4B;
 Wed,  8 Mar 2023 11:42:12 +0000 (UTC)
Date: Wed, 8 Mar 2023 12:42:11 +0100
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
Message-ID: <ZAh0k8xbUIQqELMi@redhat.com>
References: <20230203131731.851116-1-eesposit@redhat.com>
 <20230203131731.851116-2-eesposit@redhat.com>
 <Y/96WsnkiZEb0+kf@fedora> <ZAb6c+Nz7jVvNylN@redhat.com>
 <20230307141806.GB124259@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IrkTR2Dolztik21/"
Content-Disposition: inline
In-Reply-To: <20230307141806.GB124259@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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


--IrkTR2Dolztik21/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 07.03.2023 um 15:18 hat Stefan Hajnoczi geschrieben:
> On Tue, Mar 07, 2023 at 09:48:51AM +0100, Kevin Wolf wrote:
> > Am 01.03.2023 um 17:16 hat Stefan Hajnoczi geschrieben:
> > > On Fri, Feb 03, 2023 at 08:17:28AM -0500, Emanuele Giuseppe Esposito =
wrote:
> > > > Remove usage of aio_context_acquire by always submitting asynchrono=
us
> > > > AIO to the current thread's LinuxAioState.
> > > >=20
> > > > In order to prevent mistakes from the caller side, avoid passing Li=
nuxAioState
> > > > in laio_io_{plug/unplug} and laio_co_submit, and document the funct=
ions
> > > > to make clear that they work in the current thread's AioContext.
> > > >=20
> > > > Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > > > ---
> > > >  include/block/aio.h               |  4 ----
> > > >  include/block/raw-aio.h           | 18 ++++++++++++------
> > > >  include/sysemu/block-backend-io.h |  6 ++++++
> > > >  block/file-posix.c                | 10 +++-------
> > > >  block/linux-aio.c                 | 29 +++++++++++++++++----------=
--
> > > >  5 files changed, 38 insertions(+), 29 deletions(-)
> > > >=20
> > > > diff --git a/include/block/aio.h b/include/block/aio.h
> > > > index 8fba6a3584..b6b396cfcb 100644
> > > > --- a/include/block/aio.h
> > > > +++ b/include/block/aio.h
> > > > @@ -208,10 +208,6 @@ struct AioContext {
> > > >      struct ThreadPool *thread_pool;
> > > > =20
> > > >  #ifdef CONFIG_LINUX_AIO
> > > > -    /*
> > > > -     * State for native Linux AIO.  Uses aio_context_acquire/relea=
se for
> > > > -     * locking.
> > > > -     */
> > > >      struct LinuxAioState *linux_aio;
> > > >  #endif
> > > >  #ifdef CONFIG_LINUX_IO_URING
> > > > diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> > > > index f8cda9df91..db614472e6 100644
> > > > --- a/include/block/raw-aio.h
> > > > +++ b/include/block/raw-aio.h
> > > > @@ -49,14 +49,20 @@
> > > >  typedef struct LinuxAioState LinuxAioState;
> > > >  LinuxAioState *laio_init(Error **errp);
> > > >  void laio_cleanup(LinuxAioState *s);
> > > > -int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioStat=
e *s, int fd,
> > > > -                                uint64_t offset, QEMUIOVector *qio=
v, int type,
> > > > -                                uint64_t dev_max_batch);
> > > > +
> > > > +/* laio_co_submit: submit I/O requests in the thread's current Aio=
Context. */
> > > > +int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOVec=
tor *qiov,
> > > > +                                int type, uint64_t dev_max_batch);
> > > > +
> > > >  void laio_detach_aio_context(LinuxAioState *s, AioContext *old_con=
text);
> > > >  void laio_attach_aio_context(LinuxAioState *s, AioContext *new_con=
text);
> > > > -void laio_io_plug(BlockDriverState *bs, LinuxAioState *s);
> > > > -void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
> > > > -                    uint64_t dev_max_batch);
> > > > +
> > > > +/*
> > > > + * laio_io_plug/unplug work in the thread's current AioContext, th=
erefore the
> > > > + * caller must ensure that they are paired in the same IOThread.
> > > > + */
> > > > +void laio_io_plug(void);
> > > > +void laio_io_unplug(uint64_t dev_max_batch);
> > > >  #endif
> > > >  /* io_uring.c - Linux io_uring implementation */
> > > >  #ifdef CONFIG_LINUX_IO_URING
> > > > diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/blo=
ck-backend-io.h
> > > > index 031a27ba10..d41698ccc5 100644
> > > > --- a/include/sysemu/block-backend-io.h
> > > > +++ b/include/sysemu/block-backend-io.h
> > > > @@ -74,8 +74,14 @@ void blk_iostatus_set_err(BlockBackend *blk, int=
 error);
> > > >  int blk_get_max_iov(BlockBackend *blk);
> > > >  int blk_get_max_hw_iov(BlockBackend *blk);
> > > > =20
> > > > +/*
> > > > + * blk_io_plug/unplug are thread-local operations. This means that=
 multiple
> > > > + * IOThreads can simultaneously call plug/unplug, but the caller m=
ust ensure
> > > > + * that each unplug() is called in the same IOThread of the matchi=
ng plug().
> > > > + */
> > > >  void blk_io_plug(BlockBackend *blk);
> > > >  void blk_io_unplug(BlockBackend *blk);
> > > > +
> > > >  AioContext *blk_get_aio_context(BlockBackend *blk);
> > > >  BlockAcctStats *blk_get_stats(BlockBackend *blk);
> > > >  void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
> > > > diff --git a/block/file-posix.c b/block/file-posix.c
> > > > index fa227d9d14..fa99d1c25a 100644
> > > > --- a/block/file-posix.c
> > > > +++ b/block/file-posix.c
> > > > @@ -2095,10 +2095,8 @@ static int coroutine_fn raw_co_prw(BlockDriv=
erState *bs, uint64_t offset,
> > > >  #endif
> > > >  #ifdef CONFIG_LINUX_AIO
> > > >      } else if (s->use_linux_aio) {
> > > > -        LinuxAioState *aio =3D aio_get_linux_aio(bdrv_get_aio_cont=
ext(bs));
> > > >          assert(qiov->size =3D=3D bytes);
> > > > -        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
> > > > -                              s->aio_max_batch);
> > > > +        return laio_co_submit(s->fd, offset, qiov, type, s->aio_ma=
x_batch);
> > >=20
> > > I'm having second thoughts here. This is correct in an IOThread today,
> > > but the main loop thread case concerns me:
> > >=20
> > > This patch changes behavior when the main loop or vCPU thread submits
> > > I/O. Before, the IOThread's LinuxAioState would be used. Now the main
> > > loop's LinuxAioState will be used instead and aio callbacks will be
> > > invoked in the main loop thread instead of the IOThread.
> >=20
> > You mean we have a device that has a separate iothread, but a request is
> > submitted from the main thread? This isn't even allowed today; if a node
> > is in an iothread, all I/O must be submitted from that iothread. Do you
> > know any code that does submit I/O from the main thread instead?
>=20
> I think you're right. My mental model was outdated. Both the coroutine
> and non-coroutine code paths schedule coroutines in the AioContext.
>=20
> However, I think this patch series is still risky because it could
> reveal latent bugs. Let's merge it in the next development cycle (soft
> freeze is today!) to avoid destabilizing 8.0.

Makes sense, I've already started a block-next anyway.

So is this an R-b or A-b or nothing for now?

Kevin

--IrkTR2Dolztik21/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmQIdJMACgkQfwmycsiP
L9aeAg/8DTYQZFOc4qfZMTJoLlZQg/u+yaggoODf2fesXk0OZ5FISN8CyoUoY+lQ
YJ7wLvzURCJapvsQ25IDLfpBdUmfQhh6uuerfwOOMKU46T48+20z/om1Q1AdGcMQ
nJQjHHQzDod3gFPA3mD9Ek+TyW4Rgh43OAN4EdCDt6pu2wjJEu1p/lv0PlI/krZJ
veTD92x3A5ABw+MaedSLrOr7OIjPSfB3d6T4YIEtyX9+qAdF/aESRfR8ZIyvPWza
TWW5N/nnYMHArW97eDZYWWyKOyeFTu64lguk098GbchE+zAK9hapOpTob+MFbUhv
U1tCb9zIRYkAuAqVngO6oQlOx88NReZ3kPNzsGYIFcoIASUzUZxA63M9pEmVWYoL
kaQw3GvZf+wyUKMBnJEC6XSzmIXIc7WhH8jLhna8JgF3yA5jwiCi5Dv1pV0gjNzr
gOBJZasI9qaV9Qgc0HWeeH4RjEzFs+IDxU8kfbAgK3fMITP9MN+RbJH08pIShLAK
I905hEx60ueSO06SbbH51iEhEumPrnAM0bbSXYjzbfQWYdeo5s2E2Sn+uVBqEEPP
MZDvrmiJ262rIbjofKobsv9uXc20UzLDy6vd4NS4OK238CFgoVyNle17CerHQyZi
iWkKoxeejr3xjNXR5zf3wc/A3ujM0icL/+POYHUmr79vd0imALc=
=e/Gn
-----END PGP SIGNATURE-----

--IrkTR2Dolztik21/--


