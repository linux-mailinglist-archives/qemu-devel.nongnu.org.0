Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF8D6B1027
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:25:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZxWQ-00019A-2H; Wed, 08 Mar 2023 12:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZxWM-00018T-RV
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:24:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZxWL-0002dC-0k
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678296248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ef6vap8sKx/PrRYnpofooh8JxMEILgV6cY8/yGlP+U=;
 b=MTrzlKXD7yMu7fqnP6OsqtK0uOKIM2s+Zzud4N37gSVLuM57Wze2i5/XOKVzVQrm1uRrfb
 9Zx8WniBfHJV5GVbPPQ+6fwnI9LNCFi5iYGE+E5FyHfnGwMUnIkBxPxK6cRj1uE0RlgvpM
 iNnUe3UMDJmlzAZFNUlTaF0OiiXc4m4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-HGYbCVYvMwufNjkSUq_NCg-1; Wed, 08 Mar 2023 12:24:04 -0500
X-MC-Unique: HGYbCVYvMwufNjkSUq_NCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8759A811E6E;
 Wed,  8 Mar 2023 17:24:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F97D2026D4B;
 Wed,  8 Mar 2023 17:24:01 +0000 (UTC)
Date: Wed, 8 Mar 2023 12:24:00 -0500
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
Message-ID: <20230308172400.GD320810@fedora>
References: <20230203131731.851116-1-eesposit@redhat.com>
 <20230203131731.851116-2-eesposit@redhat.com>
 <Y/96WsnkiZEb0+kf@fedora> <ZAb6c+Nz7jVvNylN@redhat.com>
 <20230307141806.GB124259@fedora> <ZAh0k8xbUIQqELMi@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zbmx1KBXyZb2fY/x"
Content-Disposition: inline
In-Reply-To: <ZAh0k8xbUIQqELMi@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--zbmx1KBXyZb2fY/x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 12:42:11PM +0100, Kevin Wolf wrote:
> Am 07.03.2023 um 15:18 hat Stefan Hajnoczi geschrieben:
> > On Tue, Mar 07, 2023 at 09:48:51AM +0100, Kevin Wolf wrote:
> > > Am 01.03.2023 um 17:16 hat Stefan Hajnoczi geschrieben:
> > > > On Fri, Feb 03, 2023 at 08:17:28AM -0500, Emanuele Giuseppe Esposit=
o wrote:
> > > > > Remove usage of aio_context_acquire by always submitting asynchro=
nous
> > > > > AIO to the current thread's LinuxAioState.
> > > > >=20
> > > > > In order to prevent mistakes from the caller side, avoid passing =
LinuxAioState
> > > > > in laio_io_{plug/unplug} and laio_co_submit, and document the fun=
ctions
> > > > > to make clear that they work in the current thread's AioContext.
> > > > >=20
> > > > > Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > > > > ---
> > > > >  include/block/aio.h               |  4 ----
> > > > >  include/block/raw-aio.h           | 18 ++++++++++++------
> > > > >  include/sysemu/block-backend-io.h |  6 ++++++
> > > > >  block/file-posix.c                | 10 +++-------
> > > > >  block/linux-aio.c                 | 29 +++++++++++++++++--------=
----
> > > > >  5 files changed, 38 insertions(+), 29 deletions(-)
> > > > >=20
> > > > > diff --git a/include/block/aio.h b/include/block/aio.h
> > > > > index 8fba6a3584..b6b396cfcb 100644
> > > > > --- a/include/block/aio.h
> > > > > +++ b/include/block/aio.h
> > > > > @@ -208,10 +208,6 @@ struct AioContext {
> > > > >      struct ThreadPool *thread_pool;
> > > > > =20
> > > > >  #ifdef CONFIG_LINUX_AIO
> > > > > -    /*
> > > > > -     * State for native Linux AIO.  Uses aio_context_acquire/rel=
ease for
> > > > > -     * locking.
> > > > > -     */
> > > > >      struct LinuxAioState *linux_aio;
> > > > >  #endif
> > > > >  #ifdef CONFIG_LINUX_IO_URING
> > > > > diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> > > > > index f8cda9df91..db614472e6 100644
> > > > > --- a/include/block/raw-aio.h
> > > > > +++ b/include/block/raw-aio.h
> > > > > @@ -49,14 +49,20 @@
> > > > >  typedef struct LinuxAioState LinuxAioState;
> > > > >  LinuxAioState *laio_init(Error **errp);
> > > > >  void laio_cleanup(LinuxAioState *s);
> > > > > -int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioSt=
ate *s, int fd,
> > > > > -                                uint64_t offset, QEMUIOVector *q=
iov, int type,
> > > > > -                                uint64_t dev_max_batch);
> > > > > +
> > > > > +/* laio_co_submit: submit I/O requests in the thread's current A=
ioContext. */
> > > > > +int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOV=
ector *qiov,
> > > > > +                                int type, uint64_t dev_max_batch=
);
> > > > > +
> > > > >  void laio_detach_aio_context(LinuxAioState *s, AioContext *old_c=
ontext);
> > > > >  void laio_attach_aio_context(LinuxAioState *s, AioContext *new_c=
ontext);
> > > > > -void laio_io_plug(BlockDriverState *bs, LinuxAioState *s);
> > > > > -void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
> > > > > -                    uint64_t dev_max_batch);
> > > > > +
> > > > > +/*
> > > > > + * laio_io_plug/unplug work in the thread's current AioContext, =
therefore the
> > > > > + * caller must ensure that they are paired in the same IOThread.
> > > > > + */
> > > > > +void laio_io_plug(void);
> > > > > +void laio_io_unplug(uint64_t dev_max_batch);
> > > > >  #endif
> > > > >  /* io_uring.c - Linux io_uring implementation */
> > > > >  #ifdef CONFIG_LINUX_IO_URING
> > > > > diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/b=
lock-backend-io.h
> > > > > index 031a27ba10..d41698ccc5 100644
> > > > > --- a/include/sysemu/block-backend-io.h
> > > > > +++ b/include/sysemu/block-backend-io.h
> > > > > @@ -74,8 +74,14 @@ void blk_iostatus_set_err(BlockBackend *blk, i=
nt error);
> > > > >  int blk_get_max_iov(BlockBackend *blk);
> > > > >  int blk_get_max_hw_iov(BlockBackend *blk);
> > > > > =20
> > > > > +/*
> > > > > + * blk_io_plug/unplug are thread-local operations. This means th=
at multiple
> > > > > + * IOThreads can simultaneously call plug/unplug, but the caller=
 must ensure
> > > > > + * that each unplug() is called in the same IOThread of the matc=
hing plug().
> > > > > + */
> > > > >  void blk_io_plug(BlockBackend *blk);
> > > > >  void blk_io_unplug(BlockBackend *blk);
> > > > > +
> > > > >  AioContext *blk_get_aio_context(BlockBackend *blk);
> > > > >  BlockAcctStats *blk_get_stats(BlockBackend *blk);
> > > > >  void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
> > > > > diff --git a/block/file-posix.c b/block/file-posix.c
> > > > > index fa227d9d14..fa99d1c25a 100644
> > > > > --- a/block/file-posix.c
> > > > > +++ b/block/file-posix.c
> > > > > @@ -2095,10 +2095,8 @@ static int coroutine_fn raw_co_prw(BlockDr=
iverState *bs, uint64_t offset,
> > > > >  #endif
> > > > >  #ifdef CONFIG_LINUX_AIO
> > > > >      } else if (s->use_linux_aio) {
> > > > > -        LinuxAioState *aio =3D aio_get_linux_aio(bdrv_get_aio_co=
ntext(bs));
> > > > >          assert(qiov->size =3D=3D bytes);
> > > > > -        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
> > > > > -                              s->aio_max_batch);
> > > > > +        return laio_co_submit(s->fd, offset, qiov, type, s->aio_=
max_batch);
> > > >=20
> > > > I'm having second thoughts here. This is correct in an IOThread tod=
ay,
> > > > but the main loop thread case concerns me:
> > > >=20
> > > > This patch changes behavior when the main loop or vCPU thread submi=
ts
> > > > I/O. Before, the IOThread's LinuxAioState would be used. Now the ma=
in
> > > > loop's LinuxAioState will be used instead and aio callbacks will be
> > > > invoked in the main loop thread instead of the IOThread.
> > >=20
> > > You mean we have a device that has a separate iothread, but a request=
 is
> > > submitted from the main thread? This isn't even allowed today; if a n=
ode
> > > is in an iothread, all I/O must be submitted from that iothread. Do y=
ou
> > > know any code that does submit I/O from the main thread instead?
> >=20
> > I think you're right. My mental model was outdated. Both the coroutine
> > and non-coroutine code paths schedule coroutines in the AioContext.
> >=20
> > However, I think this patch series is still risky because it could
> > reveal latent bugs. Let's merge it in the next development cycle (soft
> > freeze is today!) to avoid destabilizing 8.0.
>=20
> Makes sense, I've already started a block-next anyway.
>=20
> So is this an R-b or A-b or nothing for now?

I'm happy with it and I've read the code:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zbmx1KBXyZb2fY/x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQIxLAACgkQnKSrs4Gr
c8hL/Af/bNQJ5R5qGCs2uLfY2C8YYqDmLdI9PI3xftiQZC6h0axA+b40j5ugp9Gc
PqEgyVgW8DbLXek0qwYx8e1KLDnj6W/sbARjOuAzsNhf2aYqdF+sYN/0emugkZCj
wsDJBRGDy47Y+HMROBovHw/bDleTC7plnaDzQOqHS+/QLjcB2w5gD8wZD6KAkkWu
JhFI2rDpx2LRz401jLYeiGitriyhfdM9aU9kYOhavPZZvEw6hVfjwv3ENU+RAIPP
Dgcl7js/vNbavg9i47LUWcqxkc8IuFOY8/mn8VlMXgMZdasKvqwohFxe91CTZscd
vCv7/JSKmUSe3oqIHzGmtOcyX+9y3w==
=PwFh
-----END PGP SIGNATURE-----

--zbmx1KBXyZb2fY/x--


