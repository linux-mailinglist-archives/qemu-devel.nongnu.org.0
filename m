Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A27151359E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 15:46:59 +0200 (CEST)
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4Tx-0001Zt-Nz
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 09:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk4SV-000875-CH
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:45:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk4SR-0003fC-US
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651153522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B1mY4HpzRIQjT/z3GkhDMFsXKgkVlmvq9RObuVbZhts=;
 b=B3wYEylqllI47BMXKR1VPTH0xKI6S8+Kl/smWp7IjdfRPWLvMFg8keGvnZW1NzQQQTGhf1
 UwXt/tnJ0diG4bynUZFHe6IkfYbOHR23D3UDvOyMMKq2GbToAywXbiuy/yt9czsp5d2vWq
 fcCK6BvAwTXCGB3hl0jn6vZv2n48ma0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-PmfaAowePWOabWTonKhJYw-1; Thu, 28 Apr 2022 09:45:18 -0400
X-MC-Unique: PmfaAowePWOabWTonKhJYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF15C1C04B5E;
 Thu, 28 Apr 2022 13:45:17 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1958D4010A1A;
 Thu, 28 Apr 2022 13:45:16 +0000 (UTC)
Date: Thu, 28 Apr 2022 14:45:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 3/8] block: introduce a lock to protect graph
 operations
Message-ID: <Ymqaa1dDUZau9rdS@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-4-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UroFvPiCKJbaiZvZ"
Content-Disposition: inline
In-Reply-To: <20220426085114.199647-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UroFvPiCKJbaiZvZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 04:51:09AM -0400, Emanuele Giuseppe Esposito wrote:
> block layer graph operations are always run under BQL in the
> main loop. This is proved by the assertion qemu_in_main_thread()
> and its wrapper macro GLOBAL_STATE_CODE.
> However, there are also concurrent coroutines running in other
> iothreads that always try to traverse the graph.
> Currently this is protected (among various other things) by
> the AioContext lock, but once this is removed we need to make
> sure that reads do not happen while modifying the graph.
>=20
> We distinguish between writer (main loop, under BQL) that modifies the
> graph, and readers (all other coroutines running in various AioContext),
> that go through the graph edges, reading ->parents and->children.
>=20
> The writer (main loop)  has an "exclusive" access, so it first waits for
> current read to finish, and then prevents incoming ones from
> entering while it has the exclusive access.
>=20
> The readers (coroutines in multiple AioContext) are free to
> access the graph as long the writer is not modifying the graph.
> In case it is, they go in a CoQueue and sleep until the writer
> is done.
>=20
> If a coroutine changes AioContext, the counter in the original and new
> AioContext are left intact, since the writer does not care where is the
> reader, but only if there is one.
> If instead the original AioContext gets deleted, we need to transfer the
> current amount of readers in a global shared counter, so that the writer
> is always aware of all readers.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/graph-lock.c         | 216 +++++++++++++++++++++++++++++++++++++
>  block/meson.build          |   1 +
>  include/block/aio.h        |   9 ++
>  include/block/block_int.h  |   1 +
>  include/block/graph-lock.h |  56 ++++++++++
>  5 files changed, 283 insertions(+)
>  create mode 100644 block/graph-lock.c
>  create mode 100644 include/block/graph-lock.h
>=20
> diff --git a/block/graph-lock.c b/block/graph-lock.c
> new file mode 100644
> index 0000000000..a2904ff6d8
> --- /dev/null
> +++ b/block/graph-lock.c
> @@ -0,0 +1,216 @@
> +/*
> + * CPU thread main loop - common bits for user and system mode emulation

This needs to be updated for graph-lock.c.

> + *
> + *  Copyright (c) 2003-2005 Fabrice Bellard
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "block/graph-lock.h"
> +#include "block/block.h"
> +#include "block/block_int.h"
> +
> +/* Protects the list of aiocontext and global_reader_count */
> +static QemuMutex aio_context_list_lock;
> +
> +/* Written under aio_context_list_lock, read with atomic operations. */

This comment seems to be outdated. It's written and read with atomics.

> +static int has_writer;

bool?

> +
> +/*
> + * A reader coroutine could move from an AioContext to another.
> + * If this happens, there is no problem from the point of view of
> + * counters. The problem is when the original AioContext where it
> + * took the rdlock gets deleted. We can't lose the counter of
> + * readers that are still running, so transfer it to this
> + * global variable.
> + * Protected by aio_context_list_lock.
> + */
> +static uint32_t global_reader_count;

orphaned_reader_count? It's not really the global count, just a count of
readers that no longer have an AioContext.

> +
> +/* Queue of readers waiting for the writer to finish */
> +static CoQueue exclusive_resume;

Since the terms shared/exclusive aren't really used here the name is a
bit unexpected. Maybe just reader_queue?

> +
> +/*
> + * List of AioContext. This list ensures that each AioContext
> + * can safely modify only its own counter, avoid reading/writing
> + * others and thus improving performances by avoidind cacheline bounces.

s/avoidind/avoiding/

> + */
> +static QTAILQ_HEAD(, AioContext) aio_context_list =3D
> +    QTAILQ_HEAD_INITIALIZER(aio_context_list);
> +
> +static void __attribute__((__constructor__)) bdrv_init_graph_lock(void)
> +{
> +    qemu_mutex_init(&aio_context_list_lock);
> +    qemu_co_queue_init(&exclusive_resume);
> +}
> +
> +void register_aiocontext(AioContext *ctx)
> +{
> +    QEMU_LOCK_GUARD(&aio_context_list_lock);
> +    assert(ctx->reader_count =3D=3D 0);
> +    QTAILQ_INSERT_TAIL(&aio_context_list, ctx, next_aio);
> +}
> +
> +void unregister_aiocontext(AioContext *ctx)
> +{
> +    QEMU_LOCK_GUARD(&aio_context_list_lock);
> +    global_reader_count +=3D ctx->reader_count;
> +    QTAILQ_REMOVE(&aio_context_list, ctx, next_aio);
> +}
> +
> +static uint32_t reader_count(void)
> +{
> +    AioContext *ctx;
> +    uint32_t rd;
> +
> +    QEMU_LOCK_GUARD(&aio_context_list_lock);
> +
> +    /* rd can temporarly be negative, but the will *always* >=3D 0 */

s/the will/it is/

How can rd be negative, it's uint32_t? If AioContext->reader_count can
be negative then please use a signed type.

> +    rd =3D global_reader_count;
> +    QTAILQ_FOREACH(ctx, &aio_context_list, next_aio) {
> +        rd +=3D qatomic_read(&ctx->reader_count);
> +    }
> +
> +    /* shouldn't overflow unless there are 2^31 readers */
> +    assert((int32_t)rd >=3D 0);
> +    return rd;
> +}
> +
> +/*
> + * Start an exclusive write operation.
> + * Must only be called from outside bdrv_graph_co_rdlock.

Please keep doc comments in a single location. The header file already
has them so this could be moved there.

> + */
> +void bdrv_graph_wrlock(void)
> +{
> +    GLOBAL_STATE_CODE();
> +    assert(!has_writer);

qatomic_read() for consistency?

A comment like /* recursive locking not allowed */ would help anyone
debugging the assertion failure. That way they immediately know what the
problem is and don't need to figure out what has_writer does first.

> +
> +    qatomic_set(&has_writer, 1);
> +    /* make sure all readers read has_writer =3D 1 */
> +    smp_mb();

I *think* a full barrier is needed (unless AIO_WAIT_WHILE() already does
it implicitly) but the comment does not fully explain the reason.

We want to make sure that AIO_WAIT_WHILE() only checks reader_count()
after has_writer =3D 1 is visible to other threads. That way no more
readers can sneak in after we've determined reader_count() =3D=3D 0.

> +
> +    /*
> +     * reader_count =3D=3D 0: this means writer will read has_reader as 1
> +     * reader_count >=3D 1: we don't know if writer read has_writer =3D=
=3D 0 or 1,
> +     *                    but we need to wait.
> +     * Wait by allowing other coroutine (and possible readers) to contin=
ue.
> +     */
> +    AIO_WAIT_WHILE(qemu_get_aio_context(), reader_count() >=3D 1);
> +}
> +
> +/* Finish an exclusive write operation.  */
> +void bdrv_graph_wrunlock(void)
> +{
> +    GLOBAL_STATE_CODE();
> +    QEMU_LOCK_GUARD(&aio_context_list_lock);
> +    assert(has_writer);

qatomic_read() for consistency?

> +
> +    /*
> +     * No need for memory barriers, this works in pair with
> +     * the slow path of rdlock() and both take the lock.
> +     */
> +    qatomic_store_release(&has_writer, 0);
> +
> +    /* Wake up all coroutine that are waiting to read the graph */
> +    qemu_co_queue_restart_all_lockable(&exclusive_resume,
> +                                       &aio_context_list_lock);
> +}
> +
> +/* Wait for exclusive write to finish, and begin reading graph.  */
> +void coroutine_fn bdrv_graph_co_rdlock(void)
> +{
> +    AioContext *aiocontext;
> +    aiocontext =3D qemu_get_current_aio_context();
> +
> +    for (;;) {
> +        qatomic_set(&aiocontext->reader_count,
> +                    aiocontext->reader_count + 1);
> +        /* make sure writer sees reader_count */

=2E..before we check has_writer?

> +        smp_mb();
> +
> +        /*
> +         * has_writer =3D=3D 0: this means writer will read reader_count=
 as >=3D 1
> +         * has_writer =3D=3D 1: we don't know if writer read reader_coun=
t =3D=3D 0
> +         *                  or > 0, but we need to wait anyways because
> +         *                  it will write.
> +         */
> +        if (!qatomic_read(&has_writer)) {
> +            break;
> +        }
> +
> +        /*
> +         * Synchronize access with reader_count() in bdrv_graph_wrlock().
> +         * Case 1:
> +         * If this critical section gets executed first, reader_count wi=
ll
> +         * decrease and the reader will go to sleep.
> +         * Then the writer will read reader_count that does not take into
> +         * account this reader, and if there's no other reader it will
> +         * enter the write section.
> +         * Case 2:
> +         * If reader_count() critical section gets executed first,
> +         * then writer will read reader_count >=3D 1.
> +         * It will wait in AIO_WAIT_WHILE(), but once it releases the lo=
ck
> +         * we will enter this critical section and call aio_wait_kick().
> +         */
> +        WITH_QEMU_LOCK_GUARD(&aio_context_list_lock) {
> +            /*
> +             * Additional check when we use the above lock to synchronize
> +             * with bdrv_graph_wrunlock().
> +             * Case 1:
> +             * If this gets executed first, has_writer is still 1, so we=
 reduce
> +             * reader_count and go to sleep.
> +             * Then the writer will set has_writer to 0 and wake up all =
readers,
> +             * us included.
> +             * Case 2:
> +             * If bdrv_graph_wrunlock() critical section gets executed f=
irst,
> +             * then it will set has_writer to 0 and wake up all other re=
aders.
> +             * Then we execute this critical section, and therefore must=
 check
> +             * again for has_writer, otherwise we sleep without any writ=
er
> +             * actually running.
> +             */
> +            if (!qatomic_read(&has_writer)) {
> +                return;
> +            }
> +
> +            /* slow path where reader sleeps */
> +            aiocontext->reader_count--;

No atomic ops here. This forces me to think about whether that's safe...
:(

Another thread cannot run this AioContext and therefore we don't need to
protect against races between reader_count++ and reader_count--. And
reader_count() takes the lock which we hold. It's safe.

> +            aio_wait_kick();
> +            qemu_co_queue_wait(&exclusive_resume, &aio_context_list_lock=
);

Why loop here instead of incrementing reader_count and then returning?
Readers cannot starve writers but writers can starve readers?

> +        }
> +    }
> +}
> +
> +/* Mark bs as not reading anymore, and release pending exclusive ops.  */
> +void coroutine_fn bdrv_graph_co_rdunlock(void)
> +{
> +    AioContext *aiocontext;
> +    aiocontext =3D qemu_get_current_aio_context();
> +
> +    qatomic_store_release(&aiocontext->reader_count,
> +                          aiocontext->reader_count - 1);

This is the point where reader_count can go negative if the coroutine
was created in another thread. I think the type of reader_count should
be signed.

> +    /* make sure writer sees reader_count */

=2E..before we check has_writer?

> +    smp_mb();
> +
> +    /*
> +     * has_writer =3D=3D 0: this means reader will read reader_count dec=
reased
> +     * has_writer =3D=3D 1: we don't know if writer read reader_count ol=
d or
> +     *                  new. Therefore, kick again so on next iteration
> +     *                  writer will for sure read the updated value.
> +     */
> +    if (qatomic_read(&has_writer)) {
> +        aio_wait_kick();
> +    }
> +}
> diff --git a/block/meson.build b/block/meson.build
> index e42bcb58d5..32ecf5c864 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -10,6 +10,7 @@ block_ss.add(files(
>    'blkverify.c',
>    'block-backend.c',
>    'block-copy.c',
> +  'graph-lock.c',
>    'commit.c',
>    'copy-on-read.c',
>    'preallocate.c',
> diff --git a/include/block/aio.h b/include/block/aio.h
> index 5634173b12..cb7d1f95cc 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -127,6 +127,15 @@ struct AioContext {
>      /* Used by AioContext users to protect from multi-threaded access.  =
*/
>      QemuRecMutex lock;
> =20
> +    /* How many readers in this AioContext are currently reading the gra=
ph. */
> +    uint32_t reader_count;

AioContext is (mostly) a generic event loop. "the graph" requires more
explanation here since it's a block layer concept that AioContext
doesn't know about.

The variable name should probably be changed to bdrv_graph_reader_count
or similar.

I wonder if a struct should be defined in graph-lock.h instead and then
AioContext would embed a field:

    BdrvGraphRdlock bdrv_graph_rdlock;

Something like that?

Or should the data be thread-local?

> +
> +    /*
> +     * List of AioContext kept in graph-lock.c
> +     * Protected by aio_context_list_lock
> +     */
> +    QTAILQ_ENTRY(AioContext) next_aio;

I haven't read enough of the code yet to know whether this list should
be AioContext or BdrvGraphRdlock (see above). It would be nice to
minimize the scope instead of tying stuff to AioContext.

> +
>      /* The list of registered AIO handlers.  Protected by ctx->list_lock=
=2E */
>      AioHandlerList aio_handlers;
> =20
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index 7d50b6bbd1..b35b0138ed 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -26,6 +26,7 @@
> =20
>  #include "block_int-global-state.h"
>  #include "block_int-io.h"
> +#include "block/graph-lock.h"
> =20
>  /* DO NOT ADD ANYTHING IN HERE. USE ONE OF THE HEADERS INCLUDED ABOVE */
> =20
> diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
> new file mode 100644
> index 0000000000..f171ba0527
> --- /dev/null
> +++ b/include/block/graph-lock.h
> @@ -0,0 +1,56 @@

A comment would be nice:
/* What this file does... */

An SPDX license identifier should be probably be present, although maybe
there is a default license (I don't remember the rules about this,
please check if necessary).

> +#ifndef BLOCK_LOCK_H
> +#define BLOCK_LOCK_H

The file is called graph-lock.h. Please make this consistent.

> +
> +#include "qemu/osdep.h"
> +
> +/*
> + * register_aiocontext:
> + * Add AioContext @ctx to the list of AioContext.
> + * This list is used to obtain the total number of readers
> + * currently running the graph.
> + */
> +void register_aiocontext(AioContext *ctx);
> +
> +/*
> + * unregister_aiocontext:
> + * Removes AioContext @ctx to the list of AioContext.
> + */
> +void unregister_aiocontext(AioContext *ctx);
> +
> +/*
> + * bdrv_graph_wrlock:
> + * Modify the graph. Nobody else is allowed to access the graph.

What constitutes modifying the graph? Are there specific blk_*() and
bdrv_*() APIs that should be mentioned here so it's clear when this
needs to be used? Those APIs should also be updated to mention that
bdrv_graph_wrlock() is required.

> + * Set global has_writer to 1, so that the next readers will wait
> + * that writer is done in a coroutine queue.
> + * Then keep track of the running readers by counting what is the total
> + * amount of readers (sum of all aiocontext readers), and wait until
> + * they all finish with AIO_WAIT_WHILE.
> + */

Any requirements (e.g. BQL)? Can this be called from an IOThread, etc?

> +void bdrv_graph_wrlock(void);
> +
> +/*
> + * bdrv_graph_wrunlock:
> + * Write finished, reset global has_writer to 0 and restart
> + * all readers that are waiting.
> + */
> +void bdrv_graph_wrunlock(void);
> +
> +/*
> + * bdrv_graph_co_rdlock:
> + * Read the bs graph. Increases the reader counter of the current aiocon=
text,

What constitutes reading the graph? Just looping over
BlockDriverState->parents and ->children?

> + * and if has_writer is set, it means that the writer is modifying
> + * the graph, therefore wait in a coroutine queue.
> + * The writer will then wake this coroutine once it is done.
> + */

Is recursive locking allowed?

Which threads are allowed to call this? I guess it's okay to call this
with the BQL held?

> +void coroutine_fn bdrv_graph_co_rdlock(void);
> +
> +/*
> + * bdrv_graph_rdunlock:
> + * Read terminated, decrease the count of readers in the current aiocont=
ext.
> + * If the writer is waiting for reads to finish (has_writer =3D=3D 1), s=
ignal
> + * the writer that we are done via aio_wait_kick() to let it continue.
> + */
> +void coroutine_fn bdrv_graph_co_rdunlock(void);
> +
> +#endif /* BLOCK_LOCK_H */
> +
> --=20
> 2.31.1
>=20

--UroFvPiCKJbaiZvZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqmmsACgkQnKSrs4Gr
c8hHQgf/TCUykql9KZj5jBMWYPzopBuuO+17/hwPfXEVOhhCR2Tj24wJeWYGQ4pF
EROGHvqgX9biOs8/gz7CEyyz4UEbp2/cBR03Z7TwE+xeAylWb4anEEc8NdugqqUI
8sQhKZrBVWkMSo6rPnCyqr/4BjvumEamVH+x9/gVo+i5/bYFpHN9WAXe0I5FNLWT
9em334+RUFgItUa1V2keVP76Q3wVsFU0BUxFAHZJZBcCfiM1f+X7GL6KWst/ht+N
ar0kr8sVMfBfXbQKsBEZqRBPVAelsx6tIj84aSBjqY511K9Rg6O/QaSZ/9Xb+h2k
kZ4PeUgnOcun6s9NQ9KGDNPw6unJ1Q==
=lM0f
-----END PGP SIGNATURE-----

--UroFvPiCKJbaiZvZ--


