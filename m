Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EA16A70B0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:18:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXP89-000113-Lm; Wed, 01 Mar 2023 11:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXP87-0000wS-TJ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:16:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXP86-0006Np-2h
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677687392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vAdUUENjcrm00NwSYDTHFFvunEf4Hz2pRRqmyghg2c0=;
 b=ZzMmKrUeg1FIy3+zLXw2yJjKEZxmw/s2D9dBKaZyrUqGT7N2fT1/6FhPy4sp4YSReiERbF
 9J/b5OQmoL0Gs9HJ2KPAQHw2mkvzsLEo7J6LD3iBsm3UGFluGQTBJxq1B9MC5JrnAJTEpU
 eqR0bbe/4O7f3YwY2jVW0rLCMUyxBIU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-HZHDUGgtNWyo9QvQmFxdzA-1; Wed, 01 Mar 2023 11:16:31 -0500
X-MC-Unique: HZHDUGgtNWyo9QvQmFxdzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8350E3C0E45E;
 Wed,  1 Mar 2023 16:16:30 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94B751121318;
 Wed,  1 Mar 2023 16:16:28 +0000 (UTC)
Date: Wed, 1 Mar 2023 11:16:26 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
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
Message-ID: <Y/96WsnkiZEb0+kf@fedora>
References: <20230203131731.851116-1-eesposit@redhat.com>
 <20230203131731.851116-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="efvVWlJeZvCMCPQR"
Content-Disposition: inline
In-Reply-To: <20230203131731.851116-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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


--efvVWlJeZvCMCPQR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2023 at 08:17:28AM -0500, Emanuele Giuseppe Esposito wrote:
> Remove usage of aio_context_acquire by always submitting asynchronous
> AIO to the current thread's LinuxAioState.
>=20
> In order to prevent mistakes from the caller side, avoid passing LinuxAio=
State
> in laio_io_{plug/unplug} and laio_co_submit, and document the functions
> to make clear that they work in the current thread's AioContext.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/aio.h               |  4 ----
>  include/block/raw-aio.h           | 18 ++++++++++++------
>  include/sysemu/block-backend-io.h |  6 ++++++
>  block/file-posix.c                | 10 +++-------
>  block/linux-aio.c                 | 29 +++++++++++++++++------------
>  5 files changed, 38 insertions(+), 29 deletions(-)
>=20
> diff --git a/include/block/aio.h b/include/block/aio.h
> index 8fba6a3584..b6b396cfcb 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -208,10 +208,6 @@ struct AioContext {
>      struct ThreadPool *thread_pool;
> =20
>  #ifdef CONFIG_LINUX_AIO
> -    /*
> -     * State for native Linux AIO.  Uses aio_context_acquire/release for
> -     * locking.
> -     */
>      struct LinuxAioState *linux_aio;
>  #endif
>  #ifdef CONFIG_LINUX_IO_URING
> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> index f8cda9df91..db614472e6 100644
> --- a/include/block/raw-aio.h
> +++ b/include/block/raw-aio.h
> @@ -49,14 +49,20 @@
>  typedef struct LinuxAioState LinuxAioState;
>  LinuxAioState *laio_init(Error **errp);
>  void laio_cleanup(LinuxAioState *s);
> -int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s, =
int fd,
> -                                uint64_t offset, QEMUIOVector *qiov, int=
 type,
> -                                uint64_t dev_max_batch);
> +
> +/* laio_co_submit: submit I/O requests in the thread's current AioContex=
t. */
> +int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOVector *q=
iov,
> +                                int type, uint64_t dev_max_batch);
> +
>  void laio_detach_aio_context(LinuxAioState *s, AioContext *old_context);
>  void laio_attach_aio_context(LinuxAioState *s, AioContext *new_context);
> -void laio_io_plug(BlockDriverState *bs, LinuxAioState *s);
> -void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
> -                    uint64_t dev_max_batch);
> +
> +/*
> + * laio_io_plug/unplug work in the thread's current AioContext, therefor=
e the
> + * caller must ensure that they are paired in the same IOThread.
> + */
> +void laio_io_plug(void);
> +void laio_io_unplug(uint64_t dev_max_batch);
>  #endif
>  /* io_uring.c - Linux io_uring implementation */
>  #ifdef CONFIG_LINUX_IO_URING
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-bac=
kend-io.h
> index 031a27ba10..d41698ccc5 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -74,8 +74,14 @@ void blk_iostatus_set_err(BlockBackend *blk, int error=
);
>  int blk_get_max_iov(BlockBackend *blk);
>  int blk_get_max_hw_iov(BlockBackend *blk);
> =20
> +/*
> + * blk_io_plug/unplug are thread-local operations. This means that multi=
ple
> + * IOThreads can simultaneously call plug/unplug, but the caller must en=
sure
> + * that each unplug() is called in the same IOThread of the matching plu=
g().
> + */
>  void blk_io_plug(BlockBackend *blk);
>  void blk_io_unplug(BlockBackend *blk);
> +
>  AioContext *blk_get_aio_context(BlockBackend *blk);
>  BlockAcctStats *blk_get_stats(BlockBackend *blk);
>  void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
> diff --git a/block/file-posix.c b/block/file-posix.c
> index fa227d9d14..fa99d1c25a 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2095,10 +2095,8 @@ static int coroutine_fn raw_co_prw(BlockDriverStat=
e *bs, uint64_t offset,
>  #endif
>  #ifdef CONFIG_LINUX_AIO
>      } else if (s->use_linux_aio) {
> -        LinuxAioState *aio =3D aio_get_linux_aio(bdrv_get_aio_context(bs=
));
>          assert(qiov->size =3D=3D bytes);
> -        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
> -                              s->aio_max_batch);
> +        return laio_co_submit(s->fd, offset, qiov, type, s->aio_max_batc=
h);

I'm having second thoughts here. This is correct in an IOThread today,
but the main loop thread case concerns me:

This patch changes behavior when the main loop or vCPU thread submits
I/O. Before, the IOThread's LinuxAioState would be used. Now the main
loop's LinuxAioState will be used instead and aio callbacks will be
invoked in the main loop thread instead of the IOThread.

This change will be fine when QEMU block layer support is complete, but
will does it already work today?

When blk_preadv() is called from a non-coroutine in the main loop thread
then the coroutine is spawned in the IOThread today. So we avoid the
issue.

But when blk_preadv() is called from a coroutine in the main loop thread
we'll have multi-queue activity (I/O being processed in both the main
loop thread and IOThread).

I like this patch series and think it's the right thing to do, but I'm
not sure if it's safe to do this yet. We first need to be sure all aio
callbacks are thread-safe (may are already, but there are probably still
some that are not).

Stefan

--efvVWlJeZvCMCPQR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP/eloACgkQnKSrs4Gr
c8i3FggAoalX9cw+KOORsVkSAX2NI5T1FeLxQmpdZhs7x4REaAwN96cxaDMx2s6J
YuvvhJbLubhilaU6G1XbadamdctNgh08jhlX6BwMSCYbzgXWWL86LKXltWQdVlc6
uDYZXP28QopBGHiuV0xE4jHAkzhFtdAdm2IkAEvzUvQtzBrFD7DvvZZVgLj0O2Gt
owSGbyGkli+eOqI44L1WZMEyV2j8PMjpBKueq9YdO3udXJvSDSArsvvyOwL0SOL0
VhBDe/irO6cI/VQG/fq+F567RqnBswkoCG+xmKvNzwKQCnQ2wkQhEEv6CbOiskqU
4kvokb+XA9UHsDEWukcrR6J6R7hvAw==
=bH/E
-----END PGP SIGNATURE-----

--efvVWlJeZvCMCPQR--


