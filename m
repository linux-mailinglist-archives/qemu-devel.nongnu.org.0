Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE8EB0478
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 21:12:57 +0200 (CEST)
Received: from localhost ([::1]:55680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i882y-00023o-U0
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 15:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54695)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rafaeldtinoco@kernelpath.com>) id 1i87zg-0007ad-P6
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:09:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rafaeldtinoco@kernelpath.com>) id 1i87zf-00087b-FD
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:09:32 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:35693)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rafaeldtinoco@kernelpath.com>)
 id 1i87zf-000873-AJ
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:09:31 -0400
Received: by mail-qk1-f193.google.com with SMTP id d26so22028730qkk.2
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 12:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KfuwWigjPRZem6JotdzFJTTZJTNKqoFUake8sG+uIL0=;
 b=Ieb/y5NVLggcEY0nBBm1nC320sFG0/GLEEDaqYZp8uzBsNOydUi++KARIQXFZxwqZi
 bO6p1GPAELrMZtsG1wUhOm62lRYRi/snhpgrD+b1Go4TI63v10F13XrP5A3nCXoAfK0v
 3j9e3nlfzOe6QJTKGkLtRJSwXlmezjq7N63FtoshBrleVflv5hJFr7g34mDQ2N25nRu1
 YR/JlfTpI3nWKt2qrov69MnfjYrUGpkt6tg6IdpH8H8Rvbh9t1CVXXjtDvgtGIkc6hOK
 ae1yJ1tuXm+3hbHZ+CLe13yLB4G6fiOjXRGqu5ty2xdALAIiaz821LfS+dUJnGaJNTus
 sq+Q==
X-Gm-Message-State: APjAAAUqoWI0Xr0H6yxmPJtbAATRgXEH12r8pSwqViwZRFjcF7GD72Gd
 diW11lviD9jS/lVchC4DvBQBhQ==
X-Google-Smtp-Source: APXvYqw4nTSBPc8VSOJfXPTxkb27PEP/lCwlF2bEsvmS3yw+PZGTPwyGj0U5WLKOQkaoQWJO1cwAlg==
X-Received: by 2002:a37:f517:: with SMTP id l23mr5017301qkk.287.1568228969904; 
 Wed, 11 Sep 2019 12:09:29 -0700 (PDT)
Received: from [192.168.100.24] ([191.177.180.119])
 by smtp.gmail.com with ESMTPSA id v68sm10736413qkd.109.2019.09.11.12.09.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 12:09:29 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>
References: <cbe46ad6-ef6c-d155-e79a-672182c725ad@ubuntu.com>
 <d94f18f1-986f-ec19-02c0-e83e5e7af3d0@redhat.com>
From: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
Openpgp: preference=signencrypt
Autocrypt: addr=rafaeldtinoco@ubuntu.com; keydata=
 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
 m+Bc0IpWoGZLnE2VPg==
Message-ID: <1864070a-2f84-1d98-341e-f01ddf74ec4b@ubuntu.com>
Date: Wed, 11 Sep 2019 16:09:25 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d94f18f1-986f-ec19-02c0-e83e5e7af3d0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.222.193
Subject: Re: [Qemu-devel] qemu_futex_wait() lockups in ARM64: 2 possible
 issues
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
Cc: Bug 1805256 <1805256@bugs.launchpad.net>,
 QEMU Developers - ARM <qemu-arm@nongnu.org>, lizhengui <lizhengui@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Zhengui's theory that notify_me doesn't work properly on ARM is more
> promising, but he couldn't provide a clear explanation of why he thought
> notify_me is involved.  In particular, I would have expected notify_me to
> be wrong if the qemu_poll_ns call came from aio_ctx_dispatch, for example:
> 
> 
>     glib_pollfds_fill
>       g_main_context_prepare
>         aio_ctx_prepare
>           atomic_or(&ctx->notify_me, 1)
>     qemu_poll_ns
>     glib_pollfds_poll
>       g_main_context_check
>         aio_ctx_check
>           atomic_and(&ctx->notify_me, ~1)
>       g_main_context_dispatch
>         aio_ctx_dispatch
>           /* do something for event */
>             qemu_poll_ns 
> 

Paolo,

I tried confining execution in a single NUMA domain (cpu & mem) and
still faced the issue, then, I added a mutex "ctx->notify_me_lcktest"
into context to protect "ctx->notify_me", like showed bellow, and it
seems to have either fixed or mitigated it.

I was able to cause the hung once every 3 or 4 runs. I have already ran
qemu-img convert more than 30 times now and couldn't reproduce it again.

Next step is to play with the barriers and check why existing ones
aren't enough for ordering access to ctx->notify_me ... or should I
try/do something else in your opinion ?

This arch/machine (Huawei D06):

$ lscpu
Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              96
On-line CPU(s) list: 0-95
Thread(s) per core:  1
Core(s) per socket:  48
Socket(s):           2
NUMA node(s):        4
Vendor ID:           0x48
Model:               0
Stepping:            0x0
CPU max MHz:         2000.0000
CPU min MHz:         200.0000
BogoMIPS:            200.00
L1d cache:           64K
L1i cache:           64K
L2 cache:            512K
L3 cache:            32768K
NUMA node0 CPU(s):   0-23
NUMA node1 CPU(s):   24-47
NUMA node2 CPU(s):   48-71
NUMA node3 CPU(s):   72-95
Flags:               fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics
cpuid asimdrdm dcpop

----

diff --git a/include/block/aio.h b/include/block/aio.h
index 0ca25dfec6..0724086d91 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -84,6 +84,7 @@ struct AioContext {
      * dispatch phase, hence a simple counter is enough for them.
      */
     uint32_t notify_me;
+    QemuMutex notify_me_lcktest;

     /* A lock to protect between QEMUBH and AioHandler adders and deleter,
      * and to ensure that no callbacks are removed while we're walking and
diff --git a/util/aio-posix.c b/util/aio-posix.c
index 51c41ed3c9..031d6e2997 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -529,7 +529,9 @@ static bool run_poll_handlers(AioContext *ctx,
int64_t max_ns, int64_t *timeout)
     bool progress;
     int64_t start_time, elapsed_time;

+    qemu_mutex_lock(&ctx->notify_me_lcktest);
     assert(ctx->notify_me);
+    qemu_mutex_unlock(&ctx->notify_me_lcktest);
     assert(qemu_lockcnt_count(&ctx->list_lock) > 0);

     trace_run_poll_handlers_begin(ctx, max_ns, *timeout);
@@ -601,8 +603,10 @@ bool aio_poll(AioContext *ctx, bool blocking)
      * so disable the optimization now.
      */
     if (blocking) {
+        qemu_mutex_lock(&ctx->notify_me_lcktest);
         assert(in_aio_context_home_thread(ctx));
         atomic_add(&ctx->notify_me, 2);
+        qemu_mutex_unlock(&ctx->notify_me_lcktest);
     }

     qemu_lockcnt_inc(&ctx->list_lock);
@@ -647,8 +651,10 @@ bool aio_poll(AioContext *ctx, bool blocking)
     }

     if (blocking) {
+        qemu_mutex_lock(&ctx->notify_me_lcktest);
         atomic_sub(&ctx->notify_me, 2);
         aio_notify_accept(ctx);
+        qemu_mutex_unlock(&ctx->notify_me_lcktest);
     }

     /* Adjust polling time */
diff --git a/util/async.c b/util/async.c
index c10642a385..140e1e86f5 100644
--- a/util/async.c
+++ b/util/async.c
@@ -221,7 +221,9 @@ aio_ctx_prepare(GSource *source, gint    *timeout)
 {
     AioContext *ctx = (AioContext *) source;

+    qemu_mutex_lock(&ctx->notify_me_lcktest);
     atomic_or(&ctx->notify_me, 1);
+    qemu_mutex_unlock(&ctx->notify_me_lcktest);

     /* We assume there is no timeout already supplied */
     *timeout = qemu_timeout_ns_to_ms(aio_compute_timeout(ctx));
@@ -239,8 +241,10 @@ aio_ctx_check(GSource *source)
     AioContext *ctx = (AioContext *) source;
     QEMUBH *bh;

+    qemu_mutex_lock(&ctx->notify_me_lcktest);
     atomic_and(&ctx->notify_me, ~1);
     aio_notify_accept(ctx);
+    qemu_mutex_unlock(&ctx->notify_me_lcktest);

     for (bh = ctx->first_bh; bh; bh = bh->next) {
         if (bh->scheduled) {
@@ -346,11 +350,13 @@ void aio_notify(AioContext *ctx)
     /* Write e.g. bh->scheduled before reading ctx->notify_me.  Pairs
      * with atomic_or in aio_ctx_prepare or atomic_add in aio_poll.
      */
-    smp_mb();
+    //smp_mb();
+    qemu_mutex_lock(&ctx->notify_me_lcktest);
     if (ctx->notify_me) {
         event_notifier_set(&ctx->notifier);
         atomic_mb_set(&ctx->notified, true);
     }
+    qemu_mutex_unlock(&ctx->notify_me_lcktest);
 }

 void aio_notify_accept(AioContext *ctx)
@@ -424,6 +430,8 @@ AioContext *aio_context_new(Error **errp)
     ctx->co_schedule_bh = aio_bh_new(ctx, co_schedule_bh_cb, ctx);
     QSLIST_INIT(&ctx->scheduled_coroutines);

+    qemu_rec_mutex_init(&ctx->notify_me_lcktest);
+
     aio_set_event_notifier(ctx, &ctx->notifier,
                            false,
                            (EventNotifierHandler *)

