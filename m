Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957DB33EE91
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 11:45:37 +0100 (CET)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMTgG-0007rS-Lk
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 06:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>)
 id 1lMTbd-0004hk-58; Wed, 17 Mar 2021 06:40:49 -0400
Received: from forward2-smtp.messagingengine.com ([66.111.4.226]:35927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>)
 id 1lMTba-0001eE-Nd; Wed, 17 Mar 2021 06:40:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id C20981940DA4;
 Wed, 17 Mar 2021 06:40:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 17 Mar 2021 06:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mo2ib0NIXEOjfpUH2
 EvyLLNDUFZnb0O68VwTkGWPUrs=; b=Jrh9Cg0DelytQKwfWN4ig34+vwIvHt+MT
 LeEiycnvqMQlCZaxi3H+HDwga7pMh0+VS5boxsapyQ4Cg+SV9vWKJQ5k9rd4yn4H
 vCrMRTDnv44Nmh11VxUy+SIk0TvvQ5vNBMCcofkhBhYpRh4dCuIcB8sZs5aZdwVR
 eVgxp5/vi3LxS5yYRm4EJPbSUF1MiToZ/eTz4sz/kOLGByfcqCqQhsW4pYkukrmw
 KSnG46zy6t+lzup6UiOG7d4oAdrOpZK+ux789DIWaEj8dPwa0+sJSclROzgTrAUk
 ZxBr+7thTDQFGkna1Aq+QIZoIMRgsMSaBFEEq0uI0g/tS3IYiNiBQ==
X-ME-Sender: <xms:q9xRYBz7_VV8J_bZUerRQs-NAFRqibjsVKS5m0zEbNuwkyu-55iNvA>
 <xme:q9xRYBQvhdrcbjMNKaU1x9tViaQAG28C8l2xDUQefqV5yWu3E0azIiWFd4GF5OJct
 gJAzFvzwITx_8DqJJ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujgfhfffkgggtsehttdertddttddtnecuhfhrohhmpeffrghvihguucfg
 ughmohhnughsohhnuceoughmvgesughmvgdrohhrgheqnecuggftrfgrthhtvghrnhepvd
 eihfehjefgveeutdelvedtvdeiueeikefgjefggeduudfgfefgudfhjeeviefgnecukfhp
 peekuddrudekjedrvdeirddvfeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepughmvgesughmvgdrohhrgh
X-ME-Proxy: <xmx:q9xRYLVb0WiUuxWvbCBrMmaiE-jWQjmxghDlpHo3K91CRRDMvV_ggQ>
 <xmx:q9xRYDgWSH-5I5zqauILLSjPZ8q6FdeJBvuTUujXfxDeELjH7ED4bw>
 <xmx:q9xRYDCKiz0GZ_q6E2xmrc3dQh01nvquVB6xuj3E4K9eUmQmdr2zYA>
 <xmx:rNxRYKPOgqz4q3NzpxsPmqTq029iBSSpYbtXJuareSCwmuVo_XwI2g>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 721B2240057;
 Wed, 17 Mar 2021 06:40:43 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id fab71987;
 Wed, 17 Mar 2021 10:40:42 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 4/5] coroutine-lock: reimplement CoRwLock to fix
 downgrade bug
In-Reply-To: <20210316160007.135459-5-pbonzini@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Wed, 17 Mar 2021 10:40:42 +0000
Message-ID: <m2o8fidpw5.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=66.111.4.226; envelope-from=dme@dme.org;
 helo=forward2-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_NEUTRAL=0.779,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-03-16 at 17:00:06 +01, Paolo Bonzini wrote:

> A feature of the current rwlock is that if multiple coroutines hold a
> reader lock, all must be runnable. The unlock implementation relies on
> this, choosing to wake a single coroutine when the final read lock
> holder exits the critical section, assuming that it will wake a
> coroutine attempting to acquire a write lock.
>
> The downgrade implementation violates this assumption by creating a
> read lock owning coroutine that is exclusively runnable - any other
> coroutines that are waiting to acquire a read lock are *not* made
> runnable when the write lock holder converts its ownership to read
> only.
>
> To fix this, keep the queue of waiters explicitly in the CoRwLock
> instead of using CoQueue, and store for each whether it is a
> potential reader or a writer.  This way, downgrade can look at the
> first queued coroutines and wake it if it is a reader, causing
> all other readers to be released in turn.
>
> Reported-by: David Edmondson <david.edmondson@oracle.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/coroutine.h   |  10 ++-
>  util/qemu-coroutine-lock.c | 150 ++++++++++++++++++++++++-------------
>  2 files changed, 106 insertions(+), 54 deletions(-)
>
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 84eab6e3bf..ae62d4bc8d 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -237,11 +237,15 @@ bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock);
>  bool qemu_co_queue_empty(CoQueue *queue);
>  
>  
> +typedef struct CoRwTicket CoRwTicket;
>  typedef struct CoRwlock {
> -    int pending_writer;
> -    int reader;
>      CoMutex mutex;
> -    CoQueue queue;
> +
> +    /* Number of readers, of -1 if owned for writing.  */

s/, of/, or/

> +    int owner;
> +
> +    /* Waiting coroutines.  */
> +    QSIMPLEQ_HEAD(, CoRwTicket) tickets;
>  } CoRwlock;

Isn't this...

 * ... Also, @qemu_co_rwlock_upgrade
 * only overrides CoRwlock fairness if there are no concurrent readers, so
 * another writer might run while @qemu_co_rwlock_upgrade blocks.

...now incorrect?

>  /**
> diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
> index eb73cf11dc..655634d185 100644
> --- a/util/qemu-coroutine-lock.c
> +++ b/util/qemu-coroutine-lock.c
> @@ -327,11 +327,70 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
>      trace_qemu_co_mutex_unlock_return(mutex, self);
>  }
>  
> +struct CoRwTicket {
> +    bool read;
> +    Coroutine *co;
> +    QSIMPLEQ_ENTRY(CoRwTicket) next;
> +};
> +
>  void qemu_co_rwlock_init(CoRwlock *lock)
>  {
> -    memset(lock, 0, sizeof(*lock));
> -    qemu_co_queue_init(&lock->queue);
>      qemu_co_mutex_init(&lock->mutex);
> +    lock->owner = 0;
> +    QSIMPLEQ_INIT(&lock->tickets);
> +}
> +
> +/* Releases the internal CoMutex.  */
> +static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
> +{
> +    CoRwTicket *tkt = QSIMPLEQ_FIRST(&lock->tickets);
> +    Coroutine *co = NULL;
> +
> +    /*
> +     * Setting lock->owner here prevents rdlock and wrlock from
> +     * sneaking in between unlock and wake.
> +     */
> +
> +    if (tkt) {
> +        if (tkt->read) {
> +            if (lock->owner >= 0) {
> +                lock->owner++;
> +                co = tkt->co;
> +            }
> +        } else {
> +            if (lock->owner == 0) {
> +                lock->owner = -1;
> +                co = tkt->co;
> +            }
> +        }
> +    }
> +
> +    if (co) {
> +        QSIMPLEQ_REMOVE_HEAD(&lock->tickets, next);
> +        qemu_co_mutex_unlock(&lock->mutex);
> +        aio_co_wake(co);
> +    } else {
> +        qemu_co_mutex_unlock(&lock->mutex);
> +    }
> +}
> +
> +/* Releases the internal CoMutex.  */
> +static void qemu_co_rwlock_sleep(bool read, CoRwlock *lock)
> +{
> +    CoRwTicket my_ticket = { read, qemu_coroutine_self() };
> +
> +    QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
> +    qemu_co_mutex_unlock(&lock->mutex);
> +    qemu_coroutine_yield();
> +
> +    if (read) {
> +        /* Possibly wake another reader, which will wake the next in line.  */
> +        assert(lock->owner >= 1);
> +        qemu_co_mutex_lock(&lock->mutex);
> +        qemu_co_rwlock_maybe_wake_one(lock);
> +    } else {
> +        assert(lock->owner == -1);
> +    }
>  }
>  
>  void qemu_co_rwlock_rdlock(CoRwlock *lock)
> @@ -339,13 +398,13 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock)
>  
>      qemu_co_mutex_lock(&lock->mutex);
>      /* For fairness, wait if a writer is in line.  */
> -    while (lock->pending_writer) {
> -        qemu_co_queue_wait(&lock->queue, &lock->mutex);
> +    if (lock->owner == 0 || (lock->owner > 0 && QSIMPLEQ_EMPTY(&lock->tickets))) {
> +        lock->owner++;
> +        qemu_co_mutex_unlock(&lock->mutex);
> +    } else {
> +        qemu_co_rwlock_sleep(true, lock);
>      }
> -    lock->reader++;
> -    qemu_co_mutex_unlock(&lock->mutex);
>  
> -    /* The rest of the read-side critical section is run without the mutex.  */
>      self->locks_held++;
>  }
>  
> @@ -355,69 +413,58 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
>      Coroutine *self = qemu_coroutine_self();
>  
>      assert(qemu_in_coroutine());
> -    if (!lock->reader) {
> -        /* The critical section started in qemu_co_rwlock_wrlock.  */
> -        qemu_co_queue_restart_all(&lock->queue);
> +    self->locks_held--;
> +
> +    qemu_co_mutex_lock(&lock->mutex);
> +    if (lock->owner == -1) {
> +        lock->owner = 0;
>      } else {
> -        self->locks_held--;
> +        lock->owner--;
> +    }
>  
> -        qemu_co_mutex_lock(&lock->mutex);
> -        lock->reader--;
> -        assert(lock->reader >= 0);
> -        /* Wakeup only one waiting writer */
> -        if (!lock->reader) {
> -            qemu_co_queue_next(&lock->queue);
> -        }
> +    if (lock->owner == 0) {
> +        qemu_co_rwlock_maybe_wake_one(lock);
> +    } else {
> +        qemu_co_mutex_unlock(&lock->mutex);
>      }
> -    qemu_co_mutex_unlock(&lock->mutex);
>  }
>  
>  void qemu_co_rwlock_downgrade(CoRwlock *lock)
>  {
> -    Coroutine *self = qemu_coroutine_self();
> -
> -    /* lock->mutex critical section started in qemu_co_rwlock_wrlock or
> -     * qemu_co_rwlock_upgrade.
> -     */
> -    assert(lock->reader == 0);
> -    lock->reader++;
> -    qemu_co_mutex_unlock(&lock->mutex);
> +    qemu_co_mutex_lock(&lock->mutex);
> +    assert(lock->owner == -1);
> +    lock->owner = 1;
>  
> -    /* The rest of the read-side critical section is run without the mutex.  */
> -    self->locks_held++;
> +    /* Possibly wake another reader, which will wake the next in line.  */
> +    qemu_co_rwlock_maybe_wake_one(lock);
>  }
>  
>  void qemu_co_rwlock_wrlock(CoRwlock *lock)
>  {
> +    Coroutine *self = qemu_coroutine_self();
> +
>      qemu_co_mutex_lock(&lock->mutex);
> -    lock->pending_writer++;
> -    while (lock->reader) {
> -        qemu_co_queue_wait(&lock->queue, &lock->mutex);
> +    if (lock->owner == 0) {
> +        lock->owner = -1;
> +        qemu_co_mutex_unlock(&lock->mutex);
> +    } else {
> +        qemu_co_rwlock_sleep(false, lock);
>      }
> -    lock->pending_writer--;
>  
> -    /* The rest of the write-side critical section is run with
> -     * the mutex taken, so that lock->reader remains zero.
> -     * There is no need to update self->locks_held.
> -     */
> +    self->locks_held++;
>  }
>  
>  void qemu_co_rwlock_upgrade(CoRwlock *lock)
>  {
> -    Coroutine *self = qemu_coroutine_self();
> -
>      qemu_co_mutex_lock(&lock->mutex);
> -    assert(lock->reader > 0);
> -    lock->reader--;
> -    lock->pending_writer++;
> -    while (lock->reader) {
> -        qemu_co_queue_wait(&lock->queue, &lock->mutex);
> +    assert(lock->owner > 0);
> +    /* For fairness, wait if a writer is in line.  */
> +    if (lock->owner == 1 && QSIMPLEQ_EMPTY(&lock->tickets)) {
> +        lock->owner = -1;
> +        qemu_co_mutex_unlock(&lock->mutex);
> +    } else {
> +        lock->owner--;
> +        qemu_co_rwlock_sleep(false, lock);

Doesn't this need something for the case where lock->owner hits 0?

If not, how is two readers both attempting to upgrade ever resolved?

It feels like it should jump into the second half of
qemu_co_rwlock_wrlock().

>      }
> -    lock->pending_writer--;
>  
> -    /* The rest of the write-side critical section is run with
> -     * the mutex taken, similar to qemu_co_rwlock_wrlock.  Do
> -     * not account for the lock twice in self->locks_held.
> -     */
> -    self->locks_held--;
>  }
> -- 
> 2.29.2

dme.
-- 
And you're standing here beside me, I love the passing of time.

