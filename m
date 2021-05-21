Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DBC38C9D3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:12:01 +0200 (CEST)
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6oi-0003yt-1I
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk6nE-0002UX-R7
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:10:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk6nC-0004am-Bw
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621609825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Msm8AnfEfpRK8I9IIS6RjDGEtqcAokfwrtvyDA4g8mU=;
 b=YsLE1BzGW0Nx1tF1pQlGzve1sVq7OzUUT2ELPQOhVZ+eFJshkWAlL8L71BKzAYT59frWCs
 c6WNZuAOwQZLIBcCaBAn6Pb1Awq1sQI5FH9Wrv1ua3p3dHUm5pvpua5RrJtUX7rtb6oB3+
 8WsagYn9+692qo3Gpx74nWBUK91X49g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-wJ1SC_ClNT2IllCgSkIbsg-1; Fri, 21 May 2021 11:10:22 -0400
X-MC-Unique: wJ1SC_ClNT2IllCgSkIbsg-1
Received: by mail-ed1-f70.google.com with SMTP id
 n6-20020a0564020606b029038cdc241890so11466812edv.20
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 08:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Msm8AnfEfpRK8I9IIS6RjDGEtqcAokfwrtvyDA4g8mU=;
 b=sn4FOnmuZT6bgL7g5aBgXWPeneMFbpo/7vC9sl1VMzwP0vYfqQaY8Z8WU5RJV0uyuz
 yusU7QTp01Tfm1UD7PJv6+BqYSycHsF00rw/sn/GnkaUbNC6VEA1Ngnkc92/T69MIk7Y
 3AwVw5DOqOQfl0Ebo5zXD1xXHjb9jknFQJ22q1DJmedn8L3k1eOE5FX8Mv0XI6i7FVCw
 YfYhJB58VpHibcgNeM4yECdhcw+4ISM2v0c6glKBoklDJXY7mmX2paw+WGX56lNFFQp+
 PqrRRivDriQViwX1QScoU9a/OnFNjI7oJ9JtNrEVokyScldvzzhRAIvfiax9iBCn38rH
 0F4g==
X-Gm-Message-State: AOAM533J+FeEIbg7QwVlNB/Ji3/sIlilFFjXy3rekB1QicmL25Hk7xSG
 /beu+PD/Xs2Boor1gAL3MHADhvu2hFrv7BIMa3AAWnfI8xUCU6kUZn8j4IZqcWNnUF8qI0ZSVtK
 /81ggoNfE4/EOJM0/pMhb73Ai1tboXP4myO6ONcK9Nz7fTQipE0VYakcI+EE1wx3zDyQ=
X-Received: by 2002:aa7:c3d6:: with SMTP id l22mr11683154edr.21.1621609820715; 
 Fri, 21 May 2021 08:10:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5oe/scdYRnsp6iJ4XxW+1nBHumHibuDrGbHpCGEAZIhptQE+4jQef5maAVDKpTgo3gF2vaQ==
X-Received: by 2002:aa7:c3d6:: with SMTP id l22mr11683114edr.21.1621609820270; 
 Fri, 21 May 2021 08:10:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l25sm3774338ejk.100.2021.05.21.08.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 08:10:19 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] block-copy: streamline choice of copy_range vs.
 read/write
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-2-eesposit@redhat.com>
 <f5069a9d-cd23-26cf-c1cb-6f4f5774e48d@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5a4cc9ae-f419-ab40-cd7a-d30e39f91e54@redhat.com>
Date: Fri, 21 May 2021 17:10:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f5069a9d-cd23-26cf-c1cb-6f4f5774e48d@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/21 16:42, Vladimir Sementsov-Ogievskiy wrote:
> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Put the logic to determine the copy size in a separate function, so
>> that there is a simple state machine for the possible methods of
>> copying data from one BlockDriverState to the other.
> 
> Honestly, for me 4-state state-maching + function to determine copy-size 
> doesn't seem better than two simple variables copy_size and use_copy_range.

There were six states before (2 for s->use_copy_range, three for s->copy_size),
of which two were unused.  The heuristics for going between copy and read/write
were quite illegible.

> What's the benefit of it?

Less duplication here, for example:

+    if (s->max_transfer < cluster_size) {
           /*
            * copy_range does not respect max_transfer. We don't want to bother
            * with requests smaller than block-copy cluster size, so fallback to
            * buffered copying (read and write respect max_transfer on their
            * behalf).
            */
-        s->use_copy_range = false;
-        s->copy_size = cluster_size;
+        s->method = COPY_READ_WRITE_CLUSTER;
       } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
           /* Compression supports only cluster-size writes and no copy-range. */
-        s->use_copy_range = false;
-        s->copy_size = cluster_size;
+        s->method = COPY_READ_WRITE_CLUSTER;

and here:

               trace_block_copy_copy_range_fail(s, offset, ret);
-            s->use_copy_range = false;
-            s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
+            s->method = COPY_READ_WRITE;
...
           /*
            * We enable copy-range, but keep small copy_size, until first
            * successful copy_range (look at block_copy_do_copy).
            */
-        s->use_copy_range = use_copy_range;
-        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
+        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;

where it's not obvious that the two assignments to copy_size should be
the same (and they're suboptimal, too, since they don't obey max_transfer).

... plus...

>> While at it, store the common computation of block_copy_max_transfer
>> into a new field of BlockCopyState, and make sure that we always
>> obey max_transfer; that's more efficient even for the
>> COPY_RANGE_READ_WRITE case.

having a function makes it easier to spot slight differences that are
just bugs, such as this one.

>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   block/block-copy.c | 59 ++++++++++++++++++++++++++++++----------------
> 
> stats agree with me, that its' not a simplification.

Stats don't say everything.  Not having something like this:

                 s->copy_size =
                         MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
                             QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
                                                                     s->target),
                                             s->cluster_size));

in the inner loop is already worth the extra lines for the
function declaration, for example.

Paolo

>>   1 file changed, 39 insertions(+), 20 deletions(-)
>>
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index 37c8e8504b..10ce51a244 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -28,6 +28,13 @@
>>   #define BLOCK_COPY_MAX_WORKERS 64
>>   #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
>> +typedef enum {
>> +    COPY_READ_WRITE_CLUSTER,
>> +    COPY_READ_WRITE,
>> +    COPY_RANGE_SMALL,
>> +    COPY_RANGE_FULL
>> +} BlockCopyMethod;
>> +
>>   static coroutine_fn int block_copy_task_entry(AioTask *task);
>>   typedef struct BlockCopyCallState {
>> @@ -85,8 +92,8 @@ typedef struct BlockCopyState {
>>       BdrvDirtyBitmap *copy_bitmap;
>>       int64_t in_flight_bytes;
>>       int64_t cluster_size;
>> -    bool use_copy_range;
>> -    int64_t copy_size;
>> +    BlockCopyMethod method;
>> +    int64_t max_transfer;
>>       uint64_t len;
>>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all 
>> block-copy calls */
>>       QLIST_HEAD(, BlockCopyCallState) calls;
>> @@ -148,6 +155,23 @@ static bool coroutine_fn 
>> block_copy_wait_one(BlockCopyState *s, int64_t offset,
>>       return true;
>>   }
>> +static inline int64_t block_copy_chunk_size(BlockCopyState *s)
> 
> "inline" word does nothing in static definitions in c files. Compiler 
> make a decision independently of it.
> 
>> +{
>> +    switch (s->method) {
>> +    case COPY_READ_WRITE_CLUSTER:
>> +        return s->cluster_size;
>> +    case COPY_READ_WRITE:
>> +    case COPY_RANGE_SMALL:
>> +        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER),
>> +                   s->max_transfer);
>> +    case COPY_RANGE_FULL:
>> +        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
>> +                   s->max_transfer);
>> +    default:
>> +        abort();
>> +    }
>> +}
>> +
>>   /*
>>    * Search for the first dirty area in offset/bytes range and create 
>> task at
>>    * the beginning of it.
>> @@ -157,8 +181,9 @@ static BlockCopyTask 
>> *block_copy_task_create(BlockCopyState *s,
>>                                                int64_t offset, int64_t 
>> bytes)
>>   {
>>       BlockCopyTask *task;
>> -    int64_t max_chunk = MIN_NON_ZERO(s->copy_size, 
>> call_state->max_chunk);
>> +    int64_t max_chunk = block_copy_chunk_size(s);
>> +    max_chunk = MIN_NON_ZERO(max_chunk, call_state->max_chunk);
>>       if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
>>                                              offset, offset + bytes,
>>                                              max_chunk, &offset, &bytes))
>> @@ -265,28 +290,27 @@ BlockCopyState *block_copy_state_new(BdrvChild 
>> *source, BdrvChild *target,
>>           .len = bdrv_dirty_bitmap_size(copy_bitmap),
>>           .write_flags = write_flags,
>>           .mem = shres_create(BLOCK_COPY_MAX_MEM),
>> +        .max_transfer = 
>> QEMU_ALIGN_DOWN(block_copy_max_transfer(source, target)
>> +                                        , cluster_size),
>>       };
>> -    if (block_copy_max_transfer(source, target) < cluster_size) {
>> +    if (s->max_transfer < cluster_size) {
>>           /*
>>            * copy_range does not respect max_transfer. We don't want 
>> to bother
>>            * with requests smaller than block-copy cluster size, so 
>> fallback to
>>            * buffered copying (read and write respect max_transfer on 
>> their
>>            * behalf).
>>            */
>> -        s->use_copy_range = false;
>> -        s->copy_size = cluster_size;
>> +        s->method = COPY_READ_WRITE_CLUSTER;
>>       } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
>>           /* Compression supports only cluster-size writes and no 
>> copy-range. */
>> -        s->use_copy_range = false;
>> -        s->copy_size = cluster_size;
>> +        s->method = COPY_READ_WRITE_CLUSTER;
>>       } else {
>>           /*
>>            * We enable copy-range, but keep small copy_size, until first
>>            * successful copy_range (look at block_copy_do_copy).
>>            */
>> -        s->use_copy_range = use_copy_range;
>> -        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
>> +        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
>>       }
>>       ratelimit_init(&s->rate_limit);
>> @@ -369,30 +393,25 @@ static int coroutine_fn 
>> block_copy_do_copy(BlockCopyState *s,
>>           return ret;
>>       }
>> -    if (s->use_copy_range) {
>> +    if (s->method >= COPY_RANGE_SMALL) {
> 
> I don't like such condition:
> 1. it forces me to go to enum definition to understand the logic
> 2. it's error prone: it's very possibly to forget to update it, when 
> updating the enum, and logic will be broken.
> 
> No, I don't like moving to state machine for this simple thing.
> 
>>           ret = bdrv_co_copy_range(s->source, offset, s->target, 
>> offset, nbytes,
>>                                    0, s->write_flags);
>>           if (ret < 0) {
>>               trace_block_copy_copy_range_fail(s, offset, ret);
>> -            s->use_copy_range = false;
>> -            s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
>> +            s->method = COPY_READ_WRITE;
>>               /* Fallback to read+write with allocated buffer */
>>           } else {
>> -            if (s->use_copy_range) {
>> +            if (s->method == COPY_RANGE_SMALL) {
>>                   /*
>>                    * Successful copy-range. Now increase copy_size.  
>> copy_range
>>                    * does not respect max_transfer (it's a TODO), so 
>> we factor
>>                    * that in here.
>>                    *
>> -                 * Note: we double-check s->use_copy_range for the 
>> case when
>> +                 * Note: we double-check s->method for the case when
>>                    * parallel block-copy request unsets it during 
>> previous
>>                    * bdrv_co_copy_range call.
>>                    */
>> -                s->copy_size =
>> -                        MIN(MAX(s->cluster_size, 
>> BLOCK_COPY_MAX_COPY_RANGE),
>> -                            
>> QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
>> -                                                                    
>> s->target),
>> -                                            s->cluster_size));
>> +                s->method = COPY_RANGE_FULL;
>>               }
>>               goto out;
>>           }
>>
> 
> 


