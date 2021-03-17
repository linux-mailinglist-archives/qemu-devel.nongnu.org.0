Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4A533F3EF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:20:22 +0100 (CET)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXy9-0000LW-NT
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lMXvb-00074l-Tr; Wed, 17 Mar 2021 11:17:43 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:50323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lMXvZ-0005aH-FJ; Wed, 17 Mar 2021 11:17:43 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailforward.nyi.internal (Postfix) with ESMTP id 0DECA1940A13;
 Wed, 17 Mar 2021 11:17:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Mar 2021 11:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qVavYd
 qqOAPPbC5fXvWzj9qIVERESom/MrD3BTs5EGQ=; b=VZSmA7G9LHm9ag9gnUskEm
 zG6Aqp8Pcs5Aldn5MNebqTryEez4fTgMj35BCCN/6AnX9KzlqzmdspUsU9XhzD8A
 xzsnA+qr8DljVEIoX6ht9bQOSB6Nos47YYDVSJx/IdMNIJWwbapEQ0CDCvFEhFrS
 5VlbyD6hkRCvHHQ9h7svE/Ji391rc+cxX2gn3oDEcFKHkgRF1wxBJKjadgw1HTsa
 cRtCy0yryCSKiz3MqkbMywU4idWS4FPEYuCUYwtG6xdiX25G4/xULKFR9tZY68SZ
 KoDEmc8T07aGbUyRqVP3dinjaOlxpx4neHKS9hxzHgZYwZnxFmU2JNN0B76pUiyA
 ==
X-ME-Sender: <xms:kB1SYIHmh98TbUtkVGmml4EBceLP1SEMoP9VshEJV32FCncddBhT-g>
 <xme:kB1SYFBMUpo2PGgI9OFZmifRly8e5tDaxri9Gy3nPlWaSJrItXbLnTmGcMZM34-GT
 6btwS1YF_PQHybXFRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgesthdtredttddttdenucfhrhhomhepffgrvhhiugcu
 gfgumhhonhgushhonhcuoegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvgdrtg
 homheqnecuggftrfgrthhtvghrnhepheelfeefudeiudegudelgfetgeetkeelveeuieet
 udelheejkeeileekveeukedtnecukfhppeekuddrudekjedrvdeirddvfeeknecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrvhhiugdrvggu
 mhhonhgushhonhesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:kB1SYL-4HagyG0-_GyoRUgG-IsQ3hZ8KHJzKqAQABEPcn9yu39tSIw>
 <xmx:kB1SYBCzpB6LywGq7znft8HFqzgOLh_1wMTGr667PoAA6VIfVRklEQ>
 <xmx:kB1SYARtNl7N7lxLuxiXRW6o2LmIL4mZpXX0FAY1LKmgv5P3UK9ZTw>
 <xmx:kR1SYEHchVFOac35QZWeqXUkU63r8wJ2x9yEE1rjCt3wwUcYUzyA_Q>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id A3A61240066;
 Wed, 17 Mar 2021 11:17:35 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id be1902e5;
 Wed, 17 Mar 2021 15:17:34 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 4/6] coroutine-lock: reimplement CoRwLock to fix
 downgrade bug
In-Reply-To: <20210317121641.215714-5-pbonzini@redhat.com>
References: <20210317121641.215714-1-pbonzini@redhat.com>
 <20210317121641.215714-5-pbonzini@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 17 Mar 2021 15:17:33 +0000
Message-ID: <cun5z1pvmgi.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: softfail client-ip=66.111.4.223;
 envelope-from=david.edmondson@oracle.com;
 helo=forward1-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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

On Wednesday, 2021-03-17 at 13:16:39 +01, Paolo Bonzini wrote:

> An invariant of the current rwlock is that if multiple coroutines hold a
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
> More in general, the old implementation had lots of other fairness bugs.
> The root cause of the bugs was that CoQueue would wake up readers even
> if there were pending writers, and would wake up writers even if there
> were readers.  In that case, the coroutine would go back to sleep *at
> the end* of the CoQueue, losing its place at the head of the line.
>
> To fix this, keep the queue of waiters explicitly in the CoRwLock
> instead of using CoQueue, and store for each whether it is a
> potential reader or a writer.  This way, downgrade can look at the
> first queued coroutines and wake it only if it is a reader, causing
> all other readers in line to be released in turn.
>
> Reported-by: David Edmondson <david.edmondson@oracle.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

A couple of nits below, but it looks good overall.

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
> v3->v4: clean up the code and fix upgrade logic.  Fix upgrade comment too.
>
>  include/qemu/coroutine.h   |  17 +++--
>  util/qemu-coroutine-lock.c | 148 ++++++++++++++++++++++++-------------
>  2 files changed, 106 insertions(+), 59 deletions(-)
>
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 84eab6e3bf..7919d3bb62 100644
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
> +    int owners;

s/, of/, or/

> +
> +    /* Waiting coroutines.  */
> +    QSIMPLEQ_HEAD(, CoRwTicket) tickets;
>  } CoRwlock;
>  
>  /**
> @@ -260,10 +264,9 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock);
>  /**
>   * Write Locks the CoRwlock from a reader.  This is a bit more efficient than
>   * @qemu_co_rwlock_unlock followed by a separate @qemu_co_rwlock_wrlock.
> - * However, if the lock cannot be upgraded immediately, control is transferred
> - * to the caller of the current coroutine.  Also, @qemu_co_rwlock_upgrade
> - * only overrides CoRwlock fairness if there are no concurrent readers, so
> - * another writer might run while @qemu_co_rwlock_upgrade blocks.
> + * Note that if the lock cannot be upgraded immediately, control is transferred
> + * to the caller of the current coroutine; another writer might run while
> + * @qemu_co_rwlock_upgrade blocks.

This is better, thanks.

>   */
>  void qemu_co_rwlock_upgrade(CoRwlock *lock);
>  
> diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
> index eb73cf11dc..2669403839 100644
> --- a/util/qemu-coroutine-lock.c
> +++ b/util/qemu-coroutine-lock.c
> @@ -327,11 +327,51 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
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
> +    lock->owners = 0;
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
> +     * Setting lock->owners here prevents rdlock and wrlock from
> +     * sneaking in between unlock and wake.
> +     */
> +
> +    if (tkt) {
> +        if (tkt->read) {
> +            if (lock->owners >= 0) {
> +                lock->owners++;
> +                co = tkt->co;
> +            }
> +        } else {
> +            if (lock->owners == 0) {
> +                lock->owners = -1;
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

This block could be pushed up into the earlier block, but I imagine that
the compiler will do it for you.

>  }
>  
>  void qemu_co_rwlock_rdlock(CoRwlock *lock)
> @@ -340,13 +380,22 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock)
>  
>      qemu_co_mutex_lock(&lock->mutex);
>      /* For fairness, wait if a writer is in line.  */
> -    while (lock->pending_writer) {
> -        qemu_co_queue_wait(&lock->queue, &lock->mutex);
> +    if (lock->owners == 0 || (lock->owners > 0 && QSIMPLEQ_EMPTY(&lock->tickets))) {
> +        lock->owners++;
> +        qemu_co_mutex_unlock(&lock->mutex);
> +    } else {
> +        CoRwTicket my_ticket = { true, self };
> +
> +        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
> +        qemu_co_mutex_unlock(&lock->mutex);
> +        qemu_coroutine_yield();
> +        assert(lock->owners >= 1);
> +
> +        /* Possibly wake another reader, which will wake the next in line.  */
> +        qemu_co_mutex_lock(&lock->mutex);
> +        qemu_co_rwlock_maybe_wake_one(lock);
>      }
> -    lock->reader++;
> -    qemu_co_mutex_unlock(&lock->mutex);
>  
> -    /* The rest of the read-side critical section is run without the mutex.  */
>      self->locks_held++;
>  }
>  
> @@ -355,69 +404,64 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
>      Coroutine *self = qemu_coroutine_self();
>  
>      assert(qemu_in_coroutine());
> -    if (!lock->reader) {
> -        /* The critical section started in qemu_co_rwlock_wrlock.  */
> -        qemu_co_queue_restart_all(&lock->queue);
> -    } else {
> -        self->locks_held--;
> +    self->locks_held--;
>  
> -        qemu_co_mutex_lock(&lock->mutex);
> -        lock->reader--;
> -        assert(lock->reader >= 0);
> -        /* Wakeup only one waiting writer */
> -        if (!lock->reader) {
> -            qemu_co_queue_next(&lock->queue);
> -        }
> +    qemu_co_mutex_lock(&lock->mutex);
> +    if (lock->owners > 0) {
> +        lock->owners--;
> +    } else {
> +        assert(lock->owners == -1);
> +        lock->owners = 0;
>      }
> -    qemu_co_mutex_unlock(&lock->mutex);
> +
> +    qemu_co_rwlock_maybe_wake_one(lock);
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
> +    assert(lock->owners == -1);
> +    lock->owners = 1;
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
> +    if (lock->owners == 0) {
> +        lock->owners = -1;
> +        qemu_co_mutex_unlock(&lock->mutex);
> +    } else {
> +        CoRwTicket my_ticket = { false, qemu_coroutine_self() };
> +
> +        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
> +        qemu_co_mutex_unlock(&lock->mutex);
> +        qemu_coroutine_yield();
> +        assert(lock->owners == -1);
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
> -    }
> -    lock->pending_writer--;
> +    assert(lock->owners > 0);
> +    /* For fairness, wait if a writer is in line.  */
> +    if (lock->owners == 1 && QSIMPLEQ_EMPTY(&lock->tickets)) {
> +        lock->owners = -1;
> +        qemu_co_mutex_unlock(&lock->mutex);
> +    } else {
> +        CoRwTicket my_ticket = { false, qemu_coroutine_self() };
>  
> -    /* The rest of the write-side critical section is run with
> -     * the mutex taken, similar to qemu_co_rwlock_wrlock.  Do
> -     * not account for the lock twice in self->locks_held.
> -     */
> -    self->locks_held--;
> +        lock->owners--;
> +        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
> +        qemu_co_rwlock_maybe_wake_one(lock);
> +        qemu_coroutine_yield();
> +        assert(lock->owners == -1);
> +    }
>  }
> -- 
> 2.29.2

dme.
-- 
Today is different. Today is not the same.

