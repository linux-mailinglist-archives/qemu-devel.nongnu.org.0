Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086A536CE8F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 00:25:05 +0200 (CEST)
Received: from localhost ([::1]:42760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbW8e-0008Qc-3c
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 18:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lbW7b-0007vS-Cv; Tue, 27 Apr 2021 18:24:00 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:48826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lbW7V-0004GZ-FZ; Tue, 27 Apr 2021 18:23:57 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 889E82E15C5;
 Wed, 28 Apr 2021 01:23:48 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 aLvLluRtAq-Nl00oWmi; Wed, 28 Apr 2021 01:23:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1619562228; bh=euxgyEM2QeUqXbE8KpbJAEpb022liGgk91EOA6T0bOg=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=N+ix+ZVYmTBS0RuOmdsRtHpBbAB1VJDBll4lZeXsHKNfCp47BGIb7OGe23MJ0Kqd3
 6s3A7e2iNDVNTX/1cmgSxrUq9ajnAgBpDA5tyAtm4g1wpFMTf508u6E2jaAjtJbMgP
 QHjOYS342cwF9/Z9gMXLKb2Kd9tz1sntOW4qat/8=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8308::1:4])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 LLnNWXdCQM-NloqaeRJ; Wed, 28 Apr 2021 01:23:47 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 28 Apr 2021 01:23:43 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 08/33] block/nbd: drop thr->state
Message-ID: <YIiO72OAtvRD4XBC@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-9-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416080911.83197-9-vsementsov@virtuozzo.com>
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:08:46AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We don't need all these states. The code refactored to use two boolean
> variables looks simpler.

Indeed.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 125 ++++++++++++++--------------------------------------
>  1 file changed, 34 insertions(+), 91 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index e1f39eda6c..2b26a033a4 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -66,24 +66,6 @@ typedef enum NBDClientState {
>      NBD_CLIENT_QUIT
>  } NBDClientState;
>  
> -typedef enum NBDConnectThreadState {
> -    /* No thread, no pending results */
> -    CONNECT_THREAD_NONE,
> -
> -    /* Thread is running, no results for now */
> -    CONNECT_THREAD_RUNNING,
> -
> -    /*
> -     * Thread is running, but requestor exited. Thread should close
> -     * the new socket and free the connect state on exit.
> -     */
> -    CONNECT_THREAD_RUNNING_DETACHED,
> -
> -    /* Thread finished, results are stored in a state */
> -    CONNECT_THREAD_FAIL,
> -    CONNECT_THREAD_SUCCESS
> -} NBDConnectThreadState;
> -
>  typedef struct NBDConnectThread {
>      /* Initialization constants */
>      SocketAddress *saddr; /* address to connect to */
> @@ -97,7 +79,8 @@ typedef struct NBDConnectThread {
>  
>      QemuMutex mutex;
>      /* All further fields are protected by mutex */
> -    NBDConnectThreadState state; /* current state of the thread */
> +    bool running; /* thread is running now */
> +    bool detached; /* thread is detached and should cleanup the state */
>      Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>  } NBDConnectThread;
>  
> @@ -147,17 +130,17 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
>  {
>      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>      NBDConnectThread *thr = s->connect_thread;
> -    bool thr_running;
> +    bool do_free;
>  
>      qemu_mutex_lock(&thr->mutex);
> -    thr_running = thr->state == CONNECT_THREAD_RUNNING;
> -    if (thr_running) {
> -        thr->state = CONNECT_THREAD_RUNNING_DETACHED;
> +    if (thr->running) {
> +        thr->detached = true;
>      }
> +    do_free = !thr->running && !thr->detached;

This is redundant.  You can unconditionally set ->detached and only
depend on ->running for the rest of this function.

>      qemu_mutex_unlock(&thr->mutex);
>  
>      /* the runaway thread will clean it up itself */
> -    if (!thr_running) {
> +    if (do_free) {
>          nbd_free_connect_thread(thr);
>      }
>  
> @@ -373,7 +356,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
>  
>      *s->connect_thread = (NBDConnectThread) {
>          .saddr = QAPI_CLONE(SocketAddress, s->saddr),
> -        .state = CONNECT_THREAD_NONE,
>      };
>  
>      qemu_mutex_init(&s->connect_thread->mutex);
> @@ -408,20 +390,13 @@ static void *connect_thread_func(void *opaque)
>  
>      qemu_mutex_lock(&thr->mutex);
>  
> -    switch (thr->state) {
> -    case CONNECT_THREAD_RUNNING:
> -        thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
> -        if (thr->wait_co) {
> -            aio_co_schedule(NULL, thr->wait_co);
> -            thr->wait_co = NULL;
> -        }
> -        break;
> -    case CONNECT_THREAD_RUNNING_DETACHED:
> -        do_free = true;
> -        break;
> -    default:
> -        abort();
> +    assert(thr->running);
> +    thr->running = false;
> +    if (thr->wait_co) {
> +        aio_co_schedule(NULL, thr->wait_co);
> +        thr->wait_co = NULL;
>      }
> +    do_free = thr->detached;
>  
>      qemu_mutex_unlock(&thr->mutex);
>  
> @@ -435,36 +410,24 @@ static void *connect_thread_func(void *opaque)
>  static int coroutine_fn
>  nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>  {
> -    int ret;
>      QemuThread thread;
>      BDRVNBDState *s = bs->opaque;
>      NBDConnectThread *thr = s->connect_thread;
>  
> +    assert(!s->sioc);
> +
>      qemu_mutex_lock(&thr->mutex);
>  
> -    switch (thr->state) {
> -    case CONNECT_THREAD_FAIL:
> -    case CONNECT_THREAD_NONE:
> +    if (!thr->running) {
> +        if (thr->sioc) {
> +            /* Previous attempt finally succeeded in background */
> +            goto out;
> +        }
> +        thr->running = true;
>          error_free(thr->err);
>          thr->err = NULL;
> -        thr->state = CONNECT_THREAD_RUNNING;
>          qemu_thread_create(&thread, "nbd-connect",
>                             connect_thread_func, thr, QEMU_THREAD_DETACHED);
> -        break;
> -    case CONNECT_THREAD_SUCCESS:
> -        /* Previous attempt finally succeeded in background */
> -        thr->state = CONNECT_THREAD_NONE;
> -        s->sioc = thr->sioc;
> -        thr->sioc = NULL;
> -        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
> -                               nbd_yank, bs);
> -        qemu_mutex_unlock(&thr->mutex);
> -        return 0;
> -    case CONNECT_THREAD_RUNNING:
> -        /* Already running, will wait */
> -        break;
> -    default:
> -        abort();
>      }
>  
>      thr->wait_co = qemu_coroutine_self();
> @@ -479,10 +442,15 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>  
>      qemu_mutex_lock(&thr->mutex);
>  
> -    switch (thr->state) {
> -    case CONNECT_THREAD_SUCCESS:
> -    case CONNECT_THREAD_FAIL:
> -        thr->state = CONNECT_THREAD_NONE;
> +out:
> +    if (thr->running) {
> +        /*
> +         * Obviously, drained section wants to start. Report the attempt as
> +         * failed. Still connect thread is executing in background, and its
> +         * result may be used for next connection attempt.
> +         */

I must admit this wasn't quite obvious to me when I started looking at
this code.  While you're moving this comment, can you please consider
rephrasing it?  How about this:

        /*
	 * The connection attempt was canceled and the coroutine resumed
	 * before the connection thread finished its job.  Report the
	 * attempt as failed, but leave the connection thread running,
	 * to reuse it for the next connection attempt.
	 */

> +        error_setg(errp, "Connection attempt cancelled by other operation");
> +    } else {
>          error_propagate(errp, thr->err);
>          thr->err = NULL;
>          s->sioc = thr->sioc;
> @@ -491,33 +459,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>              yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
>                                     nbd_yank, bs);
>          }
> -        ret = (s->sioc ? 0 : -1);
> -        break;
> -    case CONNECT_THREAD_RUNNING:
> -    case CONNECT_THREAD_RUNNING_DETACHED:
> -        /*
> -         * Obviously, drained section wants to start. Report the attempt as
> -         * failed. Still connect thread is executing in background, and its
> -         * result may be used for next connection attempt.
> -         */
> -        ret = -1;
> -        error_setg(errp, "Connection attempt cancelled by other operation");
> -        break;
> -
> -    case CONNECT_THREAD_NONE:
> -        /*
> -         * Impossible. We've seen this thread running. So it should be
> -         * running or at least give some results.
> -         */
> -        abort();
> -
> -    default:
> -        abort();
>      }
>  
>      qemu_mutex_unlock(&thr->mutex);
>  
> -    return ret;
> +    return s->sioc ? 0 : -1;
>  }
>  
>  /*
> @@ -532,12 +478,9 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
>  
>      qemu_mutex_lock(&thr->mutex);
>  
> -    if (thr->state == CONNECT_THREAD_RUNNING) {
> -        /* We can cancel only in running state, when bh is not yet scheduled */
> -        if (thr->wait_co) {
> -            aio_co_schedule(NULL, thr->wait_co);
> -            thr->wait_co = NULL;
> -        }
> +    if (thr->wait_co) {
> +        aio_co_schedule(NULL, thr->wait_co);
> +        thr->wait_co = NULL;

Ah, so you get rid of this redundant check in this patch.  Fine by me;
please disregard my comment on this matter to the previous patch, then.

Roman.
>      }
>  
>      qemu_mutex_unlock(&thr->mutex);
> -- 
> 2.29.2
> 

