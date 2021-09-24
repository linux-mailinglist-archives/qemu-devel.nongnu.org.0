Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E3E417AAC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:12:41 +0200 (CEST)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpgd-0006Ij-RH
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTpFw-0006y8-W3
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:45:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTpFt-0002uJ-KE
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632505500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ue4nn1vWqfzyHOdXqX9LrGJ899LUaiWmVTf0eWmAyoQ=;
 b=MPtUBI7lrQG//jEMUpnc6ViDRHHrZ+raOdmC9c6eehPetTEo1gVZhUwZX/sHWAMPZevgZF
 Lgu9Y6LLg7Nu/3HohpCCHRAf0ORU77ez6KSovlzsytIyRKVoVbouALdhYhXFhlSXvOoZbm
 VMz/kFWwnES5Zn0lu6RlA7Rqu/66+zQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-Pd7IL1FuPvmpcWDG6URKsw-1; Fri, 24 Sep 2021 13:44:56 -0400
X-MC-Unique: Pd7IL1FuPvmpcWDG6URKsw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D85D79F92A;
 Fri, 24 Sep 2021 17:44:54 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55B1860C04;
 Fri, 24 Sep 2021 17:44:41 +0000 (UTC)
Date: Fri, 24 Sep 2021 12:44:39 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 4/5] block/nbd: drop connection_co
Message-ID: <20210924174439.jphzecreh7usmecj@redhat.com>
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
 <20210902103805.25686-5-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210902103805.25686-5-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, rkagan@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 01:38:04PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> OK, that's a big rewrite of the logic.

And a time-consuming review on my part!

> 
> Pre-patch we have an always running coroutine - connection_co. It does
> reply receiving and reconnecting. And it leads to a lot of difficult
> and unobvious code around drained sections and context switch. We also
> abuse bs->in_flight counter which is increased for connection_co and
> temporary decreased in points where we want to allow drained section to
> begin. One of these place is in another file: in nbd_read_eof() in
> nbd/client.c.
> 
> We also cancel reconnect and requests waiting for reconnect on drained
> begin which is not correct. And this patch fixes that.
> 
> Let's finally drop this always running coroutine and go another way:
> do both reconnect and receiving in request coroutines.
> 
> The detailed list of changes below (in the sequence of diff hunks).

Well, depending on the git order file in use ;)

> 
> 1. receiving coroutines are woken directly from nbd_channel_error, when
>    we change s->state
> 
> 2. nbd_co_establish_connection_cancel(): we don't have drain_begin now,
>    and in nbd_teardown_connection() all requests should already be
>    finished (and reconnect is done from request). So
>    nbd_co_establish_connection_cancel() is called from
>    nbd_cancel_in_flight() (to cancel the request that is doing
>    nbd_co_establish_connection()) and from reconnect_delay_timer_cb()
>    (previously we didn't need it, as reconnect delay only should cancel
>    active requests not the reconnection itself. But now reconnection

Missing )

>    itself is done in the separate thread (we now call
>    nbd_client_connection_enable_retry() in nbd_open()), and we need to
>    cancel the requests that waits in nbd_co_establish_connection()

Singular/plural disagreement. I think the intended meaning is
'requests that wait' and not 'request that waits'.

>    now).
> 
> 2. We do receive headers in request coroutine. But we also should

Second point 2; I'll call it 2A below, because it looks related to
point 8.

>    dispatch replies for another pending requests. So,

s/another/other/

>    nbd_connection_entry() is turned into nbd_receive_replies(), which
>    does reply dispatching until it receive another request headers, and

s/until/while/, s/another/other/

>    returns when it receive the requested header.

receives

> 
> 3. All old staff around drained sections and context switch is dropped.
>    In details:
>    - we don't need to move connection_co to new aio context, as we
>      don't have connection_co anymore
>    - we don't have a fake "request" of connection_co (extra increasing
>      in_flight), so don't care with it in drain_begin/end
>    - we don't stop reconnection during drained section anymore. This
>      means that drain_begin may wait for a long time (up to
>      reconnect_delay). But that's an improvement and more correct
>      behavior see below[*]
> 
> 4. In nbd_teardown_connection() we don't have to wait for
>    connection_co, as it is dropped. And cleanup for s->ioc and nbd_yank
>    is moved here from removed connection_co.
> 
> 5. In nbd_co_do_establish_connection() we now should handle
>    NBD_CLIENT_CONNECTING_NOWAIT: if new request comes when we are in
>    NBD_CLIENT_CONNECTING_NOWAIT, it still should call
>    nbd_co_establish_connection() (who knows, maybe connection already
>    established by thread in background). But we shouldn't wait: if

maybe the connection was already established by another thread in the background

>    nbd_co_establish_connection() can't return new channel immediately
>    the request should fail (we are in NBD_CLIENT_CONNECTING_NOWAIT
>    state).
> 
> 6. nbd_reconnect_attempt() is simplified: it's now easier to wait for
>    other requests in the caller, so here we just assert that fact.
>    Also delay time is now initialized here: we can easily detect first
>    attempt and start a timer.
> 
> 7. nbd_co_reconnect_loop() is dropped, we don't need it. Reconnect
>    retries are fully handle by thread (nbd/client-connection.c), delay
>    timer we initialize in nbd_reconnect_attempt(), we don't have to
>    bother with s->drained and friends. nbd_reconnect_attempt() now
>    called from nbd_co_send_request().

A lot going on there, but it's making sense so far.

> 
> 8. nbd_connection_entry is dropped: reconnect is now handled by
>    nbd_co_send_request(), receiving reply is now handled by
>    nbd_receive_replies(): all handled from request coroutines.
> 
> 9. So, welcome new nbd_receive_replies() called from request coroutine,
>    that receives reply header instead of nbd_connection_entry().
>    Like with sending requests, only one coroutine may receive in a
>    moment. So we introduce receive_mutex, which is locked around
>    nbd_receive_reply(). It also protects some related fields. Still,
>    full audit of thread-safety in nbd driver is a separate task.

It sounds like you're more worried about auditing for which locks are
held longer than necessary, rather than expecting to find cases where
we aren't thread-safe because we are lacking locks?  At any rate, as
this patch is already easier to reason about, I'm okay deferring that
audit to later patches.

>    New function waits for a reply with specified handle being received
>    and works rather simple:
> 
>    Under mutex:
>      - if current handle is 0, do receive by hand. If another handle
>        received - switch to other request coroutine, release mutex and
>        yield. Otherwise return success
>      - if current handle == requested handle, we are done
>      - otherwise, release mutex and yield
> 
> 10: in nbd_co_send_request() we now do nbd_reconnect_attempt() if
>     needed. Also waiting in free_sema queue we now wait for one of two
>     conditions:
>     - connectED, in_flight < MAX_NBD_REQUESTS (so we can start new one)
>     - connectING, in_flight == 0, so we can call
>       nbd_reconnect_attempt()
>     And this logic is protected by s->send_mutex
> 
>     Also, on failure we don't have to care of removed s->connection_co
> 
> 11. nbd_co_do_receive_one_chunk(): now instead of yield() and wait for
>     s->connection_co we just call new nbd_receive_replies().
> 
> 12. nbd_co_receive_one_chunk(): place where s->reply.handle becomes 0,
>     which means that handling of the whole reply is finished. Here we
>     need to wake one of coroutines sleeping in nbd_receive_replies().
>     If now one sleeps - do nothing. That's another behavior change: we

s/now one sleeps/none are sleeping/

>     don't have endless recv() in the idle time. It may be considered as
>     a drawback. If so, it may be fixed later.

The case where no coroutine is waiting to receive a reply should only
happen due to a malicious server (a compliant server will only send
replies matching an existing pending request).

> 
> 13. nbd_reply_chunk_iter_receive(): don't care about removed
>     connection_co, just ping in_flight waiters.
> 
> 14. Don't create connection_co, enable retry in the connection thread
>     (we don't have own reconnect loop anymore)
> 
> 15. We need now nbd_co_establish_connection_cancel() call in
>     nbd_cancel_in_flight(), to cancel the request that doing connection
>     attempt.

s/need now/now need to add a/
s/request that doing/request that is doing a/

> 
> [*], ok, now we don't cancel reconnect on drain begin. That's correct:
>     reconnect feature leads to possibility of long-running requests (up
>     to reconnect delay). Still, drain begin is not a reason to kill
>     long requests. We should wait for them.
> 
>     This also means, that we can again reproduce a dead-lock, described
>     in 8c517de24a8a1dcbeb54e7e12b5b0fda42a90ace.
>     Why we are OK with it:
>     1. Now this is not absolutely-dead dead-lock: the vm is unfrozen
>        after reconnect delay. Actually 8c517de24a8a1dc fixed a bug in
>        NBD logic, that was not described in 8c517de24a8a1dc and led to
>        forever dead-lock. The problem was that nobody woken free_sema

s/woken/woke the/

>        queue, but drain_begin can't finish until there is a request in
>        free_sema queue. Now we have a reconnect delay timer that works
>        well.
>     2. It's not a problem of NBD driver, it's a problem of ide code,
>        that does drain_begin under global mutex

I agree that this point means that it is appropriate to address that
in a separate patch series.  Hopefully someone tackles it before 6.2,
but even if not, I agree that the worst that happens is that we have a
command stalled waiting on a long timeout, rather than actual
deadlock.

>     3. That doesn't reproduce if chose scsi instead of ide.

Seems like this sentence fragment fits better as the tail of 2, rather
than as a separate bullet 3?  I'll reword as:

...it's a problem of the ide code, because it does drain_begin under
the global mutex; the problem doesn't reproduce when using scsi
instead of ide.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c  | 374 ++++++++++++++-------------------------------------
>  nbd/client.c |   2 -
>  2 files changed, 99 insertions(+), 277 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 52b0733684..170a8c8eeb 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -57,7 +57,7 @@
>  typedef struct {
>      Coroutine *coroutine;
>      uint64_t offset;        /* original offset of the request */
> -    bool receiving;         /* waiting for connection_co? */
> +    bool receiving;         /* sleeping in the yield in nbd_receive_replies */
>  } NBDClientRequest;
>  
>  typedef enum NBDClientState {
> @@ -73,14 +73,10 @@ typedef struct BDRVNBDState {
>  
>      CoMutex send_mutex;
>      CoQueue free_sema;
> -    Coroutine *connection_co;
> -    Coroutine *teardown_co;
> -    QemuCoSleep reconnect_sleep;
> -    bool drained;
> -    bool wait_drained_end;
> +
> +    CoMutex receive_mutex;
>      int in_flight;
>      NBDClientState state;
> -    bool wait_in_flight;

Lots of struct rework, not quite sure which point(s) it falls under.

>  
>      QEMUTimer *reconnect_delay_timer;
>  
> @@ -163,6 +159,8 @@ static void nbd_channel_error(BDRVNBDState *s, int ret)
>      } else {
>          s->state = NBD_CLIENT_QUIT;
>      }
> +
> +    nbd_recv_coroutines_wake(s, true);
>  }

Matches point 1.

>  
>  static void reconnect_delay_timer_del(BDRVNBDState *s)
> @@ -179,6 +177,7 @@ static void reconnect_delay_timer_cb(void *opaque)
>  
>      if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
>          s->state = NBD_CLIENT_CONNECTING_NOWAIT;
> +        nbd_co_establish_connection_cancel(s->conn);
>          while (qemu_co_enter_next(&s->free_sema, NULL)) {
>              /* Resume all queued requests */
>          }

Matches point 2.

> @@ -201,113 +200,21 @@ static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
>      timer_mod(s->reconnect_delay_timer, expire_time_ns);
>  }
>  
> -static void nbd_client_detach_aio_context(BlockDriverState *bs)
> -{

> -static void nbd_client_attach_aio_context_bh(void *opaque)
> -{

> -static void nbd_client_attach_aio_context(BlockDriverState *bs,
> -                                          AioContext *new_context)

> -static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
> -{

> -static void coroutine_fn nbd_client_co_drain_end(BlockDriverState *bs)
> -{

Matches point 3.

>  static void nbd_teardown_connection(BlockDriverState *bs)
>  {
>      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>  
> +    assert(!s->in_flight);
> +
>      if (s->ioc) {
> -        /* finish any pending coroutines */
>          qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
> +                                 nbd_yank, s->bs);
> +        object_unref(OBJECT(s->ioc));
> +        s->ioc = NULL;
>      }
>  
>      s->state = NBD_CLIENT_QUIT;
> -    if (s->connection_co) {
> -        qemu_co_sleep_wake(&s->reconnect_sleep);
> -        nbd_co_establish_connection_cancel(s->conn);
> -    }
> -    if (qemu_in_coroutine()) {
> -        s->teardown_co = qemu_coroutine_self();
> -        /* connection_co resumes us when it terminates */
> -        qemu_coroutine_yield();
> -        s->teardown_co = NULL;
> -    } else {
> -        BDRV_POLL_WHILE(bs, s->connection_co);
> -    }
> -    assert(!s->connection_co);
>  }

Matches point 4.

>  
>  static bool nbd_client_connecting(BDRVNBDState *s)
> @@ -372,10 +279,11 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
>  {
>      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>      int ret;
> +    bool blocking = nbd_client_connecting_wait(s);
>  
>      assert(!s->ioc);
>  
> -    s->ioc = nbd_co_establish_connection(s->conn, &s->info, true, errp);
> +    s->ioc = nbd_co_establish_connection(s->conn, &s->info, blocking, errp);
>      if (!s->ioc) {
>          return -ECONNREFUSED;
>      }

Point 5, although the details about NBD_CLIENT_CONNECTING_NOWAIT are
hidden beneath the helper functions used here.

> @@ -411,29 +319,22 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
>      return 0;
>  }
>  
> +/* called under s->send_mutex */
>  static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>  {
> -    if (!nbd_client_connecting(s)) {
> -        return;
> -    }
> +    assert(nbd_client_connecting(s));
> +    assert(s->in_flight == 0);
>  
> -    /* Wait for completion of all in-flight requests */
> -
> -    qemu_co_mutex_lock(&s->send_mutex);
> -
> -    while (s->in_flight > 0) {
> -        qemu_co_mutex_unlock(&s->send_mutex);
> -        nbd_recv_coroutines_wake(s, true);
> -        s->wait_in_flight = true;
> -        qemu_coroutine_yield();
> -        s->wait_in_flight = false;
> -        qemu_co_mutex_lock(&s->send_mutex);
> -    }
> -
> -    qemu_co_mutex_unlock(&s->send_mutex);
> -
> -    if (!nbd_client_connecting(s)) {
> -        return;
> +    if (nbd_client_connecting_wait(s) && s->reconnect_delay &&
> +        !s->reconnect_delay_timer)
> +    {
> +        /*
> +         * It's first reconnect attempt after switching to
> +         * NBD_CLIENT_CONNECTING_WAIT
> +         */
> +        reconnect_delay_timer_init(s,
> +            qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
> +            s->reconnect_delay * NANOSECONDS_PER_SECOND);
>      }
>  
>      /*

Matches point 6.

> @@ -453,135 +354,79 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>      nbd_co_do_establish_connection(s->bs, NULL);
>  }
>  
> -static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
> +static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)

The diff gets a bit harder to read at this point (deleting one
function, renaming another, but portions get interleaved in), but it's
not impossible.

>  {
> -    uint64_t timeout = 1 * NANOSECONDS_PER_SECOND;
> -    uint64_t max_timeout = 16 * NANOSECONDS_PER_SECOND;
> +    int ret;
> +    uint64_t ind = HANDLE_TO_INDEX(s, handle), ind2;
> +    QEMU_LOCK_GUARD(&s->receive_mutex);
>  
> -    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
> -        reconnect_delay_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
> -                                   s->reconnect_delay * NANOSECONDS_PER_SECOND);
> -    }
> -
> -    nbd_reconnect_attempt(s);
> -
> -    while (nbd_client_connecting(s)) {
> -        if (s->drained) {
> -            bdrv_dec_in_flight(s->bs);
> -            s->wait_drained_end = true;
> -            while (s->drained) {
> -                /*
> -                 * We may be entered once from nbd_client_attach_aio_context_bh
> -                 * and then from nbd_client_co_drain_end. So here is a loop.
> -                 */
> -                qemu_coroutine_yield();
> -            }
> -            bdrv_inc_in_flight(s->bs);
> -        } else {
> -            qemu_co_sleep_ns_wakeable(&s->reconnect_sleep,
> -                                      QEMU_CLOCK_REALTIME, timeout);
> -            if (s->drained) {
> -                continue;
> -            }
> -            if (timeout < max_timeout) {
> -                timeout *= 2;
> -            }

The deletion of nbd_co_reconnect_loop matches point 7.

> +    while (true) {
> +        if (s->reply.handle == handle) {
> +            /* We are done */
> +            return 0;
>          }
>  
> -        nbd_reconnect_attempt(s);
> -    }
> -
> -    reconnect_delay_timer_del(s);
> -}
> +        if (!nbd_client_connected(s)) {
> +            return -EIO;
> +        }
>  
> -static coroutine_fn void nbd_connection_entry(void *opaque)

The renaming of nbd_connection_entry into nbd_receive_replies matches
points 2A and 8.

> -{
> -    BDRVNBDState *s = opaque;
> -    uint64_t i;
> -    int ret = 0;
> -    Error *local_err = NULL;
> +        if (s->reply.handle != 0) {
> +            /*
> +             * Some other request is being handling now. It should already be
> +             * woken by thous who set s->reply.handle (or never wait in this

s/thous who/whoever/

> +             * yield). So, we should not wake it here.
> +             */
> +            ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
> +            assert(!s->requests[ind2].receiving);
>  
> -    while (qatomic_load_acquire(&s->state) != NBD_CLIENT_QUIT) {
> -        /*
> -         * The NBD client can only really be considered idle when it has
> -         * yielded from qio_channel_readv_all_eof(), waiting for data. This is
> -         * the point where the additional scheduled coroutine entry happens
> -         * after nbd_client_attach_aio_context().
> -         *
> -         * Therefore we keep an additional in_flight reference all the time and
> -         * only drop it temporarily here.
> -         */
> +            s->requests[ind].receiving = true;
> +            qemu_co_mutex_unlock(&s->receive_mutex);
>  
> -        if (nbd_client_connecting(s)) {
> -            nbd_co_reconnect_loop(s);
> -        }
> +            qemu_coroutine_yield();
> +            /*
> +             * We may be woken for 3 reasons:
> +             * 1. From this function, executing in parallel coroutine, when our
> +             *    handle received.

handle is received

> +             * 2. From nbd_channel_error(), when connection is lost.
> +             * 3. From nbd_co_receive_one_chunk(), when previous request is
> +             *    finished and s->reply.handle set to 0.
> +             * Anyway, it's OK to lock the mutex and go to the next iteration.
> +             */
>  
> -        if (!nbd_client_connected(s)) {
> +            qemu_co_mutex_lock(&s->receive_mutex);
> +            assert(!s->requests[ind].receiving);
>              continue;
>          }

Matches point 9.

>  
> +        /* We are under mutex and handle is 0. We have to do the dirty work. */
>          assert(s->reply.handle == 0);
> -        ret = nbd_receive_reply(s->bs, s->ioc, &s->reply, &local_err);
> -
> -        if (local_err) {
> -            trace_nbd_read_reply_entry_fail(ret, error_get_pretty(local_err));
> -            error_free(local_err);
> -            local_err = NULL;
> -        }
> +        ret = nbd_receive_reply(s->bs, s->ioc, &s->reply, NULL);
>          if (ret <= 0) {
> -            nbd_channel_error(s, ret ? ret : -EIO);
> -            continue;
> +            ret = ret ? ret : -EIO;
> +            nbd_channel_error(s, ret);
> +            return ret;
>          }
> -
> -        /*
> -         * There's no need for a mutex on the receive side, because the
> -         * handler acts as a synchronization point and ensures that only
> -         * one coroutine is called until the reply finishes.
> -         */
> -        i = HANDLE_TO_INDEX(s, s->reply.handle);
> -        if (i >= MAX_NBD_REQUESTS ||
> -            !s->requests[i].coroutine ||
> -            !s->requests[i].receiving ||
> -            (nbd_reply_is_structured(&s->reply) && !s->info.structured_reply))
> -        {
> +        if (nbd_reply_is_structured(&s->reply) && !s->info.structured_reply) {
>              nbd_channel_error(s, -EINVAL);
> -            continue;
> +            return -EINVAL;
>          }
> -
> -        /*
> -         * We're woken up again by the request itself.  Note that there
> -         * is no race between yielding and reentering connection_co.  This
> -         * is because:
> -         *
> -         * - if the request runs on the same AioContext, it is only
> -         *   entered after we yield
> -         *
> -         * - if the request runs on a different AioContext, reentering
> -         *   connection_co happens through a bottom half, which can only
> -         *   run after we yield.
> -         */
> -        s->requests[i].receiving = false;
> -        aio_co_wake(s->requests[i].coroutine);
> -        qemu_coroutine_yield();
> -    }
> -
> -    qemu_co_queue_restart_all(&s->free_sema);
> -    nbd_recv_coroutines_wake(s, true);
> -    bdrv_dec_in_flight(s->bs);
> -
> -    s->connection_co = NULL;
> -    if (s->ioc) {
> -        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
> -        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
> -                                 nbd_yank, s->bs);
> -        object_unref(OBJECT(s->ioc));
> -        s->ioc = NULL;
> -    }
> -
> -    if (s->teardown_co) {
> -        aio_co_wake(s->teardown_co);
> +        if (s->reply.handle == handle) {
> +            /* We are done */
> +            return 0;
> +        }
> +        ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
> +        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].coroutine) {
> +            /*
> +             * We only check that ind2 request exists. But don't check is it now

s/is it/whether it is/

> +             * waiting for the reply header or not. We can't just check
> +             * s->requests[ind2].receiving: ind2 request may wait in trying to
> +             * lock receive_mutex. So that's a TODO.
> +             */
> +            nbd_channel_error(s, -EINVAL);
> +            return -EINVAL;

For the record, the kernel folks are currently debating a patch series
to fix a use-after-free bug in nbd.ko when the server sends an
unexpected reply.  I'm so glad that qemu has already been handling
unexpected replies gracefully.
https://lists.debian.org/nbd/2021/09/msg00136.html

I hope your TODO doesn't represent some sort of CVE in qemu talking to
a malicious server.

> +        }
> +        nbd_recv_coroutine_wake_one(&s->requests[ind2]);
>      }
> -    aio_wait_kick();
>  }
>  
>  static int nbd_co_send_request(BlockDriverState *bs,
> @@ -592,10 +437,17 @@ static int nbd_co_send_request(BlockDriverState *bs,
>      int rc, i = -1;
>  
>      qemu_co_mutex_lock(&s->send_mutex);
> -    while (s->in_flight == MAX_NBD_REQUESTS || nbd_client_connecting_wait(s)) {
> +
> +    while (s->in_flight == MAX_NBD_REQUESTS ||
> +           (!nbd_client_connected(s) && s->in_flight > 0))
> +    {
>          qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
>      }
>  
> +    if (nbd_client_connecting(s)) {
> +        nbd_reconnect_attempt(s);
> +    }
> +
>      if (!nbd_client_connected(s)) {
>          rc = -EIO;
>          goto err;
> @@ -642,10 +494,6 @@ err:
>          if (i != -1) {
>              s->requests[i].coroutine = NULL;
>              s->in_flight--;
> -        }
> -        if (s->in_flight == 0 && s->wait_in_flight) {
> -            aio_co_wake(s->connection_co);
> -        } else {
>              qemu_co_queue_next(&s->free_sema);
>          }
>      }

Matches point 10.

> @@ -944,10 +792,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
>      }
>      *request_ret = 0;
>  
> -    /* Wait until we're woken up by nbd_connection_entry.  */
> -    s->requests[i].receiving = true;
> -    qemu_coroutine_yield();
> -    assert(!s->requests[i].receiving);
> +    nbd_receive_replies(s, handle);
>      if (!nbd_client_connected(s)) {
>          error_setg(errp, "Connection closed");
>          return -EIO;

Matches point 11.

> @@ -1040,14 +885,7 @@ static coroutine_fn int nbd_co_receive_one_chunk(
>      }
>      s->reply.handle = 0;
>  
> -    if (s->connection_co && !s->wait_in_flight) {
> -        /*
> -         * We must check s->wait_in_flight, because we may entered by
> -         * nbd_recv_coroutines_wake(), in this case we should not
> -         * wake connection_co here, it will woken by last request.
> -         */
> -        aio_co_wake(s->connection_co);
> -    }
> +    nbd_recv_coroutines_wake(s, false);
>  
>      return ret;
>  }

Matches point 12.

> @@ -1158,11 +996,7 @@ break_loop:
>  
>      qemu_co_mutex_lock(&s->send_mutex);
>      s->in_flight--;
> -    if (s->in_flight == 0 && s->wait_in_flight) {
> -        aio_co_wake(s->connection_co);
> -    } else {
> -        qemu_co_queue_next(&s->free_sema);
> -    }
> +    qemu_co_queue_next(&s->free_sema);
>      qemu_co_mutex_unlock(&s->send_mutex);
>  
>      return false;

Matches point 13.

> @@ -1978,6 +1812,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>      s->bs = bs;
>      qemu_co_mutex_init(&s->send_mutex);
>      qemu_co_queue_init(&s->free_sema);
> +    qemu_co_mutex_init(&s->receive_mutex);
>  
>      if (!yank_register_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name), errp)) {
>          return -EEXIST;
> @@ -1992,14 +1827,13 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>                                          s->x_dirty_bitmap, s->tlscreds);
>  
>      /* TODO: Configurable retry-until-timeout behaviour. */
> +    s->state = NBD_CLIENT_CONNECTING_WAIT;
>      ret = nbd_do_establish_connection(bs, errp);
>      if (ret < 0) {
>          goto fail;
>      }
>  
> -    s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
> -    bdrv_inc_in_flight(bs);
> -    aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
> +    nbd_client_connection_enable_retry(s->conn);
>  
>      return 0;
>

Matches point 14.

> @@ -2153,6 +1987,8 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
>          s->state = NBD_CLIENT_CONNECTING_NOWAIT;
>          qemu_co_queue_restart_all(&s->free_sema);
>      }
> +
> +    nbd_co_establish_connection_cancel(s->conn);
>  }
>

Matches point 15.

>  static BlockDriver bdrv_nbd = {
> @@ -2173,10 +2009,6 @@ static BlockDriver bdrv_nbd = {
>      .bdrv_refresh_limits        = nbd_refresh_limits,
>      .bdrv_co_truncate           = nbd_co_truncate,
>      .bdrv_getlength             = nbd_getlength,
> -    .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
> -    .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
> -    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
> -    .bdrv_co_drain_end          = nbd_client_co_drain_end,
>      .bdrv_refresh_filename      = nbd_refresh_filename,
>      .bdrv_co_block_status       = nbd_client_co_block_status,
>      .bdrv_dirname               = nbd_dirname,
> @@ -2202,10 +2034,6 @@ static BlockDriver bdrv_nbd_tcp = {
>      .bdrv_refresh_limits        = nbd_refresh_limits,
>      .bdrv_co_truncate           = nbd_co_truncate,
>      .bdrv_getlength             = nbd_getlength,
> -    .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
> -    .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
> -    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
> -    .bdrv_co_drain_end          = nbd_client_co_drain_end,
>      .bdrv_refresh_filename      = nbd_refresh_filename,
>      .bdrv_co_block_status       = nbd_client_co_block_status,
>      .bdrv_dirname               = nbd_dirname,
> @@ -2231,10 +2059,6 @@ static BlockDriver bdrv_nbd_unix = {
>      .bdrv_refresh_limits        = nbd_refresh_limits,
>      .bdrv_co_truncate           = nbd_co_truncate,
>      .bdrv_getlength             = nbd_getlength,
> -    .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
> -    .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
> -    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
> -    .bdrv_co_drain_end          = nbd_client_co_drain_end,

Matches point 3

>      .bdrv_refresh_filename      = nbd_refresh_filename,
>      .bdrv_co_block_status       = nbd_client_co_block_status,
>      .bdrv_dirname               = nbd_dirname,
> diff --git a/nbd/client.c b/nbd/client.c
> index 0c2db4bcba..30d5383cb1 100644
> --- a/nbd/client.c
> +++ b/nbd/client.c
> @@ -1434,9 +1434,7 @@ nbd_read_eof(BlockDriverState *bs, QIOChannel *ioc, void *buffer, size_t size,
>  
>          len = qio_channel_readv(ioc, &iov, 1, errp);
>          if (len == QIO_CHANNEL_ERR_BLOCK) {
> -            bdrv_dec_in_flight(bs);
>              qio_channel_yield(ioc, G_IO_IN);
> -            bdrv_inc_in_flight(bs);

Matches point 3.

>              continue;
>          } else if (len < 0) {
>              return -EIO;
> -- 
> 2.29.2
>

Verdict: I found some typos/grammar fixes, but I think I can touch
those up.  I'm now hammering on the patches in my NBD tree, and
barring any surprises, this will be in my next pull request Monday at
the latest.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


