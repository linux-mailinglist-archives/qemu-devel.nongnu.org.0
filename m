Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC0C64824E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 13:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3cMu-0005xT-VX; Fri, 09 Dec 2022 07:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p3cMs-0005wh-G1
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:20:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p3cMo-0005ey-50
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670588437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35uw4Mlq9D+5UPEftubYjd7u/jS8z1ZT/7VMOg3IG+Y=;
 b=G2/jppOJYV7rELkNlA6YyOiMbT/qP7H3yUHb8R0Qb5ELJ0cSuQHqB+cJN0YuAzpqauWQW+
 hAksFP2BzqqqpgUi/AH1JWoHJI4YmQZUbWYVz9W8nOrtTa8H5pYtnYDCIO3SQZ4pQKFCqr
 lMtQ7wwwBIVJvtRh3Catg6W73z8yAoo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-_IQBM6udOtGI3g2Cd4KCag-1; Fri, 09 Dec 2022 07:20:36 -0500
X-MC-Unique: _IQBM6udOtGI3g2Cd4KCag-1
Received: by mail-qt1-f199.google.com with SMTP id
 f4-20020a05622a114400b003a57f828277so4311485qty.22
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 04:20:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=35uw4Mlq9D+5UPEftubYjd7u/jS8z1ZT/7VMOg3IG+Y=;
 b=101CQidlZdj7YtqQ4dXdLpppMO+cfvvSLF81xYjgMg82brbhuUteO8+hrTvBJ80iD8
 QccBPxuWLHn+8qDClEDRxZWEq3nUVm90j53w8iVkUfsmtdMNfF+Yz3idkNCjzs59D0gw
 P7DG+0PJK2ts7Exn2KDX5DKh4em964yzEeWXqd0l6kPBlo6cc/uqUHMwLCYFSpjEu2jf
 aFzHMP7cwhEiOTxiBvSk3h5l8+j0qq5VyAXqp7Apfipej3LS7WBWw98mo+YDT1qkO+er
 kzdq0WsusCAz9Od8K2HwdbqPsntFeRYeZHGJGfhwvd/BSA3AoIQT+eG0aUIT9KmdRj7p
 1XLQ==
X-Gm-Message-State: ANoB5pnEWGB5hsn3b2o3nFiJVdZIRSJ59Srp9Eza5RiqFzqqpxOM7jyM
 /nZruMmB/ZoT+rqIdhVkGTDFEBn3yKVa8JinRdnpnPzY3ABprvQIi0yDDFYOPBLYKQ/msdSD8Rd
 qrUVEixUb63FyIzM=
X-Received: by 2002:a05:622a:5a13:b0:3a5:5596:5b36 with SMTP id
 fy19-20020a05622a5a1300b003a555965b36mr7762128qtb.0.1670588435623; 
 Fri, 09 Dec 2022 04:20:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6BD9YlPDbjj/QIvu9d04AimfiZZvQZGkHzw5lrEkt2cP7lujtfbChxQFkj4MY1H8GpISYwcw==
X-Received: by 2002:a05:622a:5a13:b0:3a5:5596:5b36 with SMTP id
 fy19-20020a05622a5a1300b003a555965b36mr7762107qtb.0.1670588435371; 
 Fri, 09 Dec 2022 04:20:35 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a258e00b006fefa5f7fc9sm926758qko.134.2022.12.09.04.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 04:20:34 -0800 (PST)
Message-ID: <e361e255-83ff-5628-eebf-50bf624742c4@redhat.com>
Date: Fri, 9 Dec 2022 13:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH] test-bdrv-drain: keep graph manipulations out of
 coroutines
Content-Language: en-US
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20221202132701.531048-1-pbonzini@redhat.com>
 <632abcb8-3a66-2b93-eb33-ef12953abd18@redhat.com>
 <eee6b6e6-e62c-0d87-1f98-913b4b194a1a@redhat.com>
 <Y43roVjI2RrU1PXq@redhat.com>
 <51d4cb33-7ae9-8c5b-b2ae-b5c6b71b09a8@redhat.com>
In-Reply-To: <51d4cb33-7ae9-8c5b-b2ae-b5c6b71b09a8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.159 autolearn=no autolearn_force=no
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



Am 09/12/2022 um 13:18 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 05/12/2022 um 14:01 schrieb Kevin Wolf:
>> Am 02.12.2022 um 18:22 hat Paolo Bonzini geschrieben:
>>> On 12/2/22 14:42, Emanuele Giuseppe Esposito wrote:
>>>>
>>>>
>>>> Am 02/12/2022 um 14:27 schrieb Paolo Bonzini:
>>>>> Changes to the BlockDriverState graph will have to take the
>>>>> corresponding lock for writing, and therefore cannot be done
>>>>> inside a coroutine.  Move them outside the test body.
>>>>>
>>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>>> ---
>>>>>   tests/unit/test-bdrv-drain.c | 63 ++++++++++++++++++++++++++----------
>>>>>   1 file changed, 46 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
>>>>> index 6ae44116fe79..d85083dd4f9e 100644
>>>>> --- a/tests/unit/test-bdrv-drain.c
>>>>> +++ b/tests/unit/test-bdrv-drain.c
>>>>> @@ -199,25 +199,40 @@ static void do_drain_end_unlocked(enum drain_type drain_type, BlockDriverState *
>>>>>       }
>>>>>   }
>>>>> +static BlockBackend *blk;
>>>>> +static BlockDriverState *bs, *backing;
>>>>> +
>>>>> +static void test_drv_cb_init(void)
>>>>> +{
>>>>> +    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
>>>>> +    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
>>>>> +                              &error_abort);
>>>>> +    blk_insert_bs(blk, bs, &error_abort);
>>>>> +
>>>>> +    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
>>>>> +    bdrv_set_backing_hd(bs, backing, &error_abort);
>>>>> +}
>>>>> +
>>>>> +static void test_drv_cb_fini(void)
>>>>
>>>> fini stands for "finito"? :)
>>>
>>> No, for finish :)
>>> http://ftp.math.utah.edu/u/ma/hohn/linux/misc/elf/node3.html
>>>
>>>> Anyways, an alternative solution for this is also here (probably coming
>>>> from you too):
>>>> https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03517.html
>>>
>>> Much better.  At least patches 7-8 from that series have to be salvaged,
>>> possibly 10 as well.
>>
>> I wonder if we need a more general solution for this because this test
>> is not the only place that calls this kind of functions in a coroutine.
>> The one I'm aware of in particular is all the .bdrv_co_create
>> implementations, but I'm almost sure there are more.
>>
>> Can we use a yield_to_drain()-like mechanism for these functions? Maybe
>> even something like the opposite of co_wrapper, a no_co_wrapper that
>> generates a foo_co() variant that drops out of coroutine context before
>> calling foo()?
>>
> 
> I implemented something like yield_to_drain as you suggested, but when
> thinking about it aren't we making a fix that will cost us even more
> work in the future? If we use a yield_to_drain-like function, we are
> doing something similar to g_c_w, and losing track of whether the caller
> is a coroutine or not. And the function could then be used potentially
> everywhere. Then we will realize "oh we need to get rid of this and
> split the functions differentiating the coroutine context" and
> eventually go through ALL the callers again to figure what is doing
> what, and implement the same fix of this patch or my series once again.
> 
> Instead, even though this is just a test, we have a clear separation and
> one less case to worry about in the future.
> 
At least the above is valid if the change you are proposing is the
following (tested already, works)


diff --git a/block.c b/block.c
index 6191ac1f44..8d28c1daa4 100644
--- a/block.c
+++ b/block.c
@@ -42,6 +42,7 @@
 #include "qapi/qobject-output-visitor.h"
 #include "qapi/qapi-visit-block-core.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/replay.h"
 #include "qemu/notify.h"
 #include "qemu/option.h"
 #include "qemu/coroutine.h"
@@ -2831,6 +2832,94 @@ uint64_t
bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }

+typedef struct {
+    Coroutine *co;
+    BlockDriverState *new_bs;
+    BdrvChild *child;
+    AioContext *ctx;
+    bool done;
+} BdrvCoGraphModData;
+
+static void bdrv_co_graph_mod_bh_cb(void *opaque)
+{
+    BdrvCoGraphModData *data = opaque;
+    Coroutine *co = data->co;
+    BlockDriverState *old_bs = data->child->bs;
+    BlockDriverState *new_bs = data->new_bs;
+
+    aio_context_acquire(data->ctx);
+
+     if (old_bs) {
+        bdrv_dec_in_flight(old_bs);
+    }
+
+    if (new_bs) {
+        bdrv_dec_in_flight(new_bs);
+    }
+    bdrv_replace_child_noperm(data->child, data->new_bs);
+    aio_context_release(data->ctx);
+
+    data->done = true;
+    aio_co_wake(co);
+}
+
+/*
+ * If bdrv_replace_child_noperm is called in a coroutine, defer the
work to the
+ * Main Loop by scheduling a BH.
+ */
+static void bdrv_co_yield_to_graph_mod(BdrvChild *child,
BlockDriverState *new_bs)
+{
+    BdrvCoGraphModData data;
+    Coroutine *self = qemu_coroutine_self();
+    AioContext *ctx = bdrv_get_aio_context(new_bs);
+    BlockDriverState *old_bs = child->bs;
+
+    GLOBAL_STATE_CODE();
+    assert(qemu_in_coroutine());
+
+    if (old_bs) {
+        bdrv_inc_in_flight(old_bs);
+        ctx = bdrv_get_aio_context(old_bs);
+    }
+
+    if (new_bs) {
+        bdrv_inc_in_flight(new_bs);
+    }
+
+    data = (BdrvCoGraphModData) {
+        .co = self,
+        .new_bs = new_bs,
+        .child = child,
+        .ctx = ctx,
+        .done = false,
+    };
+
+    /*
+     * Temporarily drop the lock across yield or we would get deadlocks.
+     * bdrv_co_drain_bh_cb() reaquires the lock as needed.
+     *
+     * When we yield below, the lock for the current context will be
+     * released, so if this is actually the lock that protects bs,
don't drop
+     * it a second time.
+     */
+    if (ctx != qemu_get_aio_context()) {
+        aio_context_release(ctx);
+    }
+    replay_bh_schedule_oneshot_event(ctx, bdrv_co_graph_mod_bh_cb, &data);
+
+    qemu_coroutine_yield();
+    /*
+     * If we are resumed from some other event (such as an aio
completion or a
+     * timer callback), it is a bug in the caller that should be fixed.
+     */
+    assert(data.done);
+
+    /* Reaquire the AioContext of bs if we dropped it */
+    if (ctx != qemu_get_aio_context()) {
+        aio_context_acquire(ctx);
+    }
+}
+
 /*
  * Replaces the node that a BdrvChild points to without updating
permissions.
  *
@@ -2875,6 +2964,12 @@ static void bdrv_replace_child_noperm(BdrvChild
*child,
         assert(bdrv_get_aio_context(old_bs) ==
bdrv_get_aio_context(new_bs));
     }

+    /* No graph modification is allowed in a coroutine! */
+    if (qemu_in_coroutine()) {
+        bdrv_co_yield_to_graph_mod(child, new_bs);
+        return;
+    }
+
     if (old_bs) {
         if (child->klass->detach) {
             child->klass->detach(child);


