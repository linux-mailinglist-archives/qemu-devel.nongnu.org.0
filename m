Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A1367E41
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 12:01:45 +0200 (CEST)
Received: from localhost ([::1]:53288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZW9Y-0001uS-Tc
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 06:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lZW5e-0008RJ-D6
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lZW5U-00016X-L6
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619085450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4AWKiA9KjPtZB2eFqMVYTaEKBaKxZ4blwE/jVSlDgw=;
 b=OFzWnbr351EVJERI26/h8AatEYba8COttq2j9SM3fiyQAnnGaGGYDrB7xONEx/6X32pvN2
 21Yeo72EgRJjtsXDecoLwAAkGaU87Df6m5QmcBc2gDxjacLIamqPt+7u55lcAgPzUFX/EK
 xPcUHhGEvepMRj96RlHVQXiSUoSGxzc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-rL8Anxr0P6q4-HhgkhcYpw-1; Thu, 22 Apr 2021 05:57:28 -0400
X-MC-Unique: rL8Anxr0P6q4-HhgkhcYpw-1
Received: by mail-wr1-f72.google.com with SMTP id
 f15-20020adffccf0000b02901028c7339ccso13594749wrs.1
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 02:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z4AWKiA9KjPtZB2eFqMVYTaEKBaKxZ4blwE/jVSlDgw=;
 b=Pc1kzD6+5D1XiG1V1XCLXA8rP4rMgUAZjrJnMm7KN3AzZdHVLkHyGmXVN269DIkHx1
 mXgNR1DY97VThTA5TwQKxqGU+se93Fglr6jjU4381Yj7vI1AuZmfjJUG1mLnjQrKMHOF
 q/NPq2bY2TcmSf6El8aLHilOJ4fhOS1M4gKeRh5RFVmSaYc7cWSwhYi8QVFrRg+iF9rF
 xMWuHUR4gwXHZJiDlPtBMrFYmC3b6mHytCHi1h8VSrI5Dr3uPFyiE20EWlyMKB+YwpzU
 EqRUyrE2LqgihUicRVT7HaP1eBF+eyLtbLToBHJxh3+CFSelkbmQenOfYhQ2hLuGiGUX
 Bs0g==
X-Gm-Message-State: AOAM531CIzfzx5z7xwazBRF4UbjKTpKLCyPE1N/5rhEyPgkVQv/jCrfp
 J70oOb5kI0lDxJwHHfWtiQDFsmxFaE46XRg8nxBt+/xjI+Pn76k4BLtohcjZgYkWVD3q2tsMYmp
 rws5vDDGKN+tTgMI=
X-Received: by 2002:a5d:628e:: with SMTP id k14mr3065211wru.150.1619085447338; 
 Thu, 22 Apr 2021 02:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxP/ncodMwAp5h9VvvVTpbdJUIH4MUq8ln1vqF2Mb9BHQlgU05C5mcXkfSyIU45gvHySLKeTg==
X-Received: by 2002:a5d:628e:: with SMTP id k14mr3065173wru.150.1619085446942; 
 Thu, 22 Apr 2021 02:57:26 -0700 (PDT)
Received: from localhost.localdomain (mob-194-230-155-160.cgn.sunrise.net.
 [194.230.155.160])
 by smtp.gmail.com with ESMTPSA id h14sm3226498wrq.45.2021.04.22.02.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 02:57:26 -0700 (PDT)
Subject: Re: [PATCH] block: simplify write-threshold and drop write notifiers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210421220950.105017-1-vsementsov@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <f13a066b-210f-2185-cd09-37b8795d0895@redhat.com>
Date: Thu, 22 Apr 2021 11:57:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421220950.105017-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 22/04/2021 00:09, Vladimir Sementsov-Ogievskiy wrote:
> write-notifiers are used only for write-threshold. New code for such
> purpose should create filters.
> 
> Let's handle write-threshold simply in generic code and drop write
> notifiers at all.
> 
> Also move part of write-threshold API that is used only for testing to
> the test.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> I agree that this could be split into 2-3 parts and not combining
> everything into one. But I'm tired now. I can send v2 if needed, so
> consider it as RFC. Or take as is if you think it's not too much-in-one.

Thank you for this patch. Since I am reworking on v2, if you want I can 
also integrate this patch with mines and send everything together once I 
am done.

Emanuele

> 
> I also suggest this as a prepartion (and partly substitution) for
> "[PATCH v2 0/8] Block layer thread-safety, continued"
> 
>   include/block/block_int.h         | 12 -----
>   include/block/write-threshold.h   | 24 ---------
>   block.c                           |  1 -
>   block/io.c                        | 21 +++++---
>   block/write-threshold.c           | 87 ++-----------------------------
>   tests/unit/test-write-threshold.c | 38 ++++++++++++++
>   6 files changed, 54 insertions(+), 129 deletions(-)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index 88e4111939..50af58af75 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -957,12 +957,8 @@ struct BlockDriverState {
>        */
>       int64_t total_sectors;
>   
> -    /* Callback before write request is processed */
> -    NotifierWithReturnList before_write_notifiers;
> -
>       /* threshold limit for writes, in bytes. "High water mark". */
>       uint64_t write_threshold_offset;
> -    NotifierWithReturn write_threshold_notifier;
>   
>       /* Writing to the list requires the BQL _and_ the dirty_bitmap_mutex.
>        * Reading from the list can be done with either the BQL or the
> @@ -1087,14 +1083,6 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
>   bool bdrv_backing_overridden(BlockDriverState *bs);
>   
>   
> -/**
> - * bdrv_add_before_write_notifier:
> - *
> - * Register a callback that is invoked before write requests are processed but
> - * after any throttling or waiting for overlapping requests.
> - */
> -void bdrv_add_before_write_notifier(BlockDriverState *bs,
> -                                    NotifierWithReturn *notifier);
>   
>   /**
>    * bdrv_add_aio_context_notifier:
> diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
> index c646f267a4..23e1bfc123 100644
> --- a/include/block/write-threshold.h
> +++ b/include/block/write-threshold.h
> @@ -35,28 +35,4 @@ void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes);
>    */
>   uint64_t bdrv_write_threshold_get(const BlockDriverState *bs);
>   
> -/*
> - * bdrv_write_threshold_is_set
> - *
> - * Tell if a write threshold is set for a given BDS.
> - */
> -bool bdrv_write_threshold_is_set(const BlockDriverState *bs);
> -
> -/*
> - * bdrv_write_threshold_exceeded
> - *
> - * Return the extent of a write request that exceeded the threshold,
> - * or zero if the request is below the threshold.
> - * Return zero also if the threshold was not set.
> - *
> - * NOTE: here we assume the following holds for each request this code
> - * deals with:
> - *
> - * assert((req->offset + req->bytes) <= UINT64_MAX)
> - *
> - * Please not there is *not* an actual C assert().
> - */
> -uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
> -                                       const BdrvTrackedRequest *req);
> -
>   #endif
> diff --git a/block.c b/block.c
> index c5b887cec1..001453105e 100644
> --- a/block.c
> +++ b/block.c
> @@ -381,7 +381,6 @@ BlockDriverState *bdrv_new(void)
>       for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
>           QLIST_INIT(&bs->op_blockers[i]);
>       }
> -    notifier_with_return_list_init(&bs->before_write_notifiers);
>       qemu_co_mutex_init(&bs->reqs_lock);
>       qemu_mutex_init(&bs->dirty_bitmap_mutex);
>       bs->refcnt = 1;
> diff --git a/block/io.c b/block/io.c
> index ca2dca3007..e0aa775952 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -36,6 +36,8 @@
>   #include "qemu/main-loop.h"
>   #include "sysemu/replay.h"
>   
> +#include "qapi/qapi-events-block-core.h"
> +
>   /* Maximum bounce buffer for copy-on-read and write zeroes, in bytes */
>   #define MAX_BOUNCE_BUFFER (32768 << BDRV_SECTOR_BITS)
>   
> @@ -1974,6 +1976,8 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
>              child->perm & BLK_PERM_RESIZE);
>   
>       switch (req->type) {
> +        uint64_t write_threshold;
> +
>       case BDRV_TRACKED_WRITE:
>       case BDRV_TRACKED_DISCARD:
>           if (flags & BDRV_REQ_WRITE_UNCHANGED) {
> @@ -1981,8 +1985,15 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
>           } else {
>               assert(child->perm & BLK_PERM_WRITE);
>           }
> -        return notifier_with_return_list_notify(&bs->before_write_notifiers,
> -                                                req);
> +        write_threshold = qatomic_read(&bs->write_threshold_offset);
> +        if (write_threshold > 0 && offset + bytes > write_threshold) {
> +            qapi_event_send_block_write_threshold(
> +                bs->node_name,
> +                offset + bytes - write_threshold,
> +                write_threshold);
> +            qatomic_set(&bs->write_threshold_offset, 0);
> +        }
> +        return 0;
>       case BDRV_TRACKED_TRUNCATE:
>           assert(child->perm & BLK_PERM_RESIZE);
>           return 0;
> @@ -3137,12 +3148,6 @@ bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
>       return true;
>   }
>   
> -void bdrv_add_before_write_notifier(BlockDriverState *bs,
> -                                    NotifierWithReturn *notifier)
> -{
> -    notifier_with_return_list_add(&bs->before_write_notifiers, notifier);
> -}
> -
>   void bdrv_io_plug(BlockDriverState *bs)
>   {
>       BdrvChild *child;
> diff --git a/block/write-threshold.c b/block/write-threshold.c
> index 85b78dc2a9..9bf4287c6e 100644
> --- a/block/write-threshold.c
> +++ b/block/write-threshold.c
> @@ -21,104 +21,23 @@
>   
>   uint64_t bdrv_write_threshold_get(const BlockDriverState *bs)
>   {
> -    return bs->write_threshold_offset;
> -}
> -
> -bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
> -{
> -    return bs->write_threshold_offset > 0;
> -}
> -
> -static void write_threshold_disable(BlockDriverState *bs)
> -{
> -    if (bdrv_write_threshold_is_set(bs)) {
> -        notifier_with_return_remove(&bs->write_threshold_notifier);
> -        bs->write_threshold_offset = 0;
> -    }
> -}
> -
> -uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
> -                                       const BdrvTrackedRequest *req)
> -{
> -    if (bdrv_write_threshold_is_set(bs)) {
> -        if (req->offset > bs->write_threshold_offset) {
> -            return (req->offset - bs->write_threshold_offset) + req->bytes;
> -        }
> -        if ((req->offset + req->bytes) > bs->write_threshold_offset) {
> -            return (req->offset + req->bytes) - bs->write_threshold_offset;
> -        }
> -    }
> -    return 0;
> -}
> -
> -static int coroutine_fn before_write_notify(NotifierWithReturn *notifier,
> -                                            void *opaque)
> -{
> -    BdrvTrackedRequest *req = opaque;
> -    BlockDriverState *bs = req->bs;
> -    uint64_t amount = 0;
> -
> -    amount = bdrv_write_threshold_exceeded(bs, req);
> -    if (amount > 0) {
> -        qapi_event_send_block_write_threshold(
> -            bs->node_name,
> -            amount,
> -            bs->write_threshold_offset);
> -
> -        /* autodisable to avoid flooding the monitor */
> -        write_threshold_disable(bs);
> -    }
> -
> -    return 0; /* should always let other notifiers run */
> -}
> -
> -static void write_threshold_register_notifier(BlockDriverState *bs)
> -{
> -    bs->write_threshold_notifier.notify = before_write_notify;
> -    bdrv_add_before_write_notifier(bs, &bs->write_threshold_notifier);
> -}
> -
> -static void write_threshold_update(BlockDriverState *bs,
> -                                   int64_t threshold_bytes)
> -{
> -    bs->write_threshold_offset = threshold_bytes;
> +    return qatomic_read(&bs->write_threshold_offset);
>   }
>   
>   void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes)
>   {
> -    if (bdrv_write_threshold_is_set(bs)) {
> -        if (threshold_bytes > 0) {
> -            write_threshold_update(bs, threshold_bytes);
> -        } else {
> -            write_threshold_disable(bs);
> -        }
> -    } else {
> -        if (threshold_bytes > 0) {
> -            /* avoid multiple registration */
> -            write_threshold_register_notifier(bs);
> -            write_threshold_update(bs, threshold_bytes);
> -        }
> -        /* discard bogus disable request */
> -    }
> +    qatomic_set(&bs->write_threshold_offset, threshold_bytes);
>   }
>   
>   void qmp_block_set_write_threshold(const char *node_name,
>                                      uint64_t threshold_bytes,
>                                      Error **errp)
>   {
> -    BlockDriverState *bs;
> -    AioContext *aio_context;
> -
> -    bs = bdrv_find_node(node_name);
> +    BlockDriverState *bs = bdrv_find_node(node_name);
>       if (!bs) {
>           error_setg(errp, "Device '%s' not found", node_name);
>           return;
>       }
>   
> -    aio_context = bdrv_get_aio_context(bs);
> -    aio_context_acquire(aio_context);
> -
>       bdrv_write_threshold_set(bs, threshold_bytes);
> -
> -    aio_context_release(aio_context);
>   }
> diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
> index fc1c45a2eb..c2f4cd20d7 100644
> --- a/tests/unit/test-write-threshold.c
> +++ b/tests/unit/test-write-threshold.c
> @@ -12,6 +12,44 @@
>   #include "block/write-threshold.h"
>   
>   
> +/*
> + * bdrv_write_threshold_is_set
> + *
> + * Tell if a write threshold is set for a given BDS.
> + */
> +static bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
> +{
> +    return bs->write_threshold_offset > 0;
> +}
> +
> +/*
> + * bdrv_write_threshold_exceeded
> + *
> + * Return the extent of a write request that exceeded the threshold,
> + * or zero if the request is below the threshold.
> + * Return zero also if the threshold was not set.
> + *
> + * NOTE: here we assume the following holds for each request this code
> + * deals with:
> + *
> + * assert((req->offset + req->bytes) <= UINT64_MAX)
> + *
> + * Please not there is *not* an actual C assert().
> + */
> +static uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
> +                                              const BdrvTrackedRequest *req)
> +{
> +    if (bdrv_write_threshold_is_set(bs)) {
> +        if (req->offset > bs->write_threshold_offset) {
> +            return (req->offset - bs->write_threshold_offset) + req->bytes;
> +        }
> +        if ((req->offset + req->bytes) > bs->write_threshold_offset) {
> +            return (req->offset + req->bytes) - bs->write_threshold_offset;
> +        }
> +    }
> +    return 0;
> +}
> +
>   static void test_threshold_not_set_on_init(void)
>   {
>       uint64_t res;
> 


