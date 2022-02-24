Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4C64C29C3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:43:24 +0100 (CET)
Received: from localhost ([::1]:43160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNBai-0005k6-Or
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:43:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nNBYj-0004tM-CU
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:41:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nNBYa-0004F3-2L
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645699259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9a+DZmQswD3yXZB6Wr6TYMZKkgSx6vRl59CR9x9ktyQ=;
 b=ShtZXPmLd6tRXcCKxTRiFVoHiNEgInx1SRmTjp/bwuEyH9o917VlgA7X2RjVDVpO78tWX9
 6A4HvyhTquy0q6B8nr/IrYG0aW9TNhiVjQ1+Mgpx3y+aRcc4ssDCmeT5EqSIC5Xl7mnw4E
 iZO0LbQF+6uAkCVQ/mKIE5CIADwm/No=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-jIidJFZuPx6bmXKdYZNGAQ-1; Thu, 24 Feb 2022 05:40:56 -0500
X-MC-Unique: jIidJFZuPx6bmXKdYZNGAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC062804311;
 Thu, 24 Feb 2022 10:40:54 +0000 (UTC)
Received: from localhost (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6F926A05F;
 Thu, 24 Feb 2022 10:40:53 +0000 (UTC)
Date: Thu, 24 Feb 2022 10:40:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH 3/3] util/event-loop: Introduce options to set the thread
 pool size
Message-ID: <YhdgtPe2FRnPp2J7@stefanha-x1.localdomain>
References: <20220221170843.849084-1-nsaenzju@redhat.com>
 <20220221170843.849084-4-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BIYVWnunRLNr7w2O"
Content-Disposition: inline
In-Reply-To: <20220221170843.849084-4-nsaenzju@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BIYVWnunRLNr7w2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 06:08:45PM +0100, Nicolas Saenz Julienne wrote:
> The thread pool regulates itself: when idle, it kills threads until
> empty, when in demand, it creates new threads until full. This behaviour
> doesn't play well with latency sensitive workloads where the price of
> creating a new thread is too high. For example, when paired with qemu's
> '-mlock', or using safety features like SafeStack, creating a new thread
> has been measured take multiple milliseconds.
>=20
> In order to mitigate this let's introduce a new 'EventLoopBackend'
> property to set the thread pool size. The threads will be created during
> the pool's initialization, remain available during its lifetime
> regardless of demand, and destroyed upon freeing it. A properly
> characterized workload will then be able to configure the pool to avoid
> any latency spike.
>=20
> Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> ---
>  include/block/aio.h | 11 +++++++++++
>  qapi/qom.json       |  4 +++-
>  util/async.c        |  3 +++
>  util/event-loop.c   | 15 ++++++++++++++-
>  util/event-loop.h   |  4 ++++
>  util/main-loop.c    | 13 +++++++++++++
>  util/thread-pool.c  | 41 +++++++++++++++++++++++++++++++++++++----
>  7 files changed, 85 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/block/aio.h b/include/block/aio.h
> index 5634173b12..331483d1d1 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -192,6 +192,8 @@ struct AioContext {
>      QSLIST_HEAD(, Coroutine) scheduled_coroutines;
>      QEMUBH *co_schedule_bh;
> =20
> +    int pool_min;
> +    int pool_max;

Are these fields protected by ThreadPool->lock? Please document. This is
a clue that maybe these fields belong in ThreadPool.

Regarding the field names: the AioContext thread pool field is called
thread_pool and the user-visible parameters are thread-pool-min/max. I
suggest calling the fields thread_pool_min/max too so it's clear which
pool we're talking about and there is a correspondence to user-visible
parameters.

> @@ -350,3 +358,28 @@ void thread_pool_free(ThreadPool *pool)
>      qemu_mutex_destroy(&pool->lock);
>      g_free(pool);
>  }
> +
> +void aio_context_set_thread_pool_params(AioContext *ctx, uint64_t min,
> +                                        uint64_t max, Error **errp)
> +{
> +    ThreadPool *pool =3D ctx->thread_pool;
> +
> +    if (min > max || !max) {

ctx->pool_min/max are int while the min/max arguments are uint64_t.
Please add an INT_MAX check to detect overflow.

> +        error_setg(errp, "bad thread-pool-min/thread-pool-max values");
> +        return;
> +    }
> +
> +    if (pool) {
> +        qemu_mutex_lock(&pool->lock);
> +    }

This code belongs in util/thread-pool.c. I guess the reason for keeping
the fields in AioContext instead of ThreadPool is because the ThreadPool
is created on demand and we'd have nowhere to store the parameter value.
I suggest we bite the bullet and keep an extra copy of the variables in
AioContext with a clean ThreadPool interface (thread_pool_set_params())
instead of letting AioContext and ThreadPool access each other's
internals.

> +
> +    ctx->pool_min =3D min;
> +    ctx->pool_max =3D max;
> +
> +    if (pool) {
> +        for (int i =3D pool->cur_threads; i < ctx->pool_min; i++) {
> +            spawn_thread(pool);
> +        }

What about the reverse: when min is lowered and there are a bunch of
idle worker threads we could wake them up so they terminate until
->pool_min is reached again?

--BIYVWnunRLNr7w2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIXYLQACgkQnKSrs4Gr
c8iGWAgAtUEOHXRk435+Rpm1lizPsWFnjgycUcI0ybz10pWRn5JXLbgJmVAHsS3u
fql52F3ZJYAoI9A6xE41AyVV2kLfmkfsQ4E9A8fvmp6xhZZiUnCVRmOUaisr6xYS
KB3S1F3ALKLghhr9sewMIMIYbPAM1DIbD++0jxrgH6/PjRVmtMpy6SRy2mcUPDR4
AwhyrQwOifDAwKm1cmas6VZEAJp3anrdVFDRp2cZyRSwRNAicdIV5XUF58FWiP96
XWLBPTgR4W3bqkykvlq79Onp0GmWMEqXmFzbyNzkranAVeqgzCyqMW43QOH55t8G
unmDk/PsBoL8YT84EjREqqEo6KVsKQ==
=zECC
-----END PGP SIGNATURE-----

--BIYVWnunRLNr7w2O--


