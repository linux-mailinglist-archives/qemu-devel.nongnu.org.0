Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC362193F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 17:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osRKU-0003cW-B4; Tue, 08 Nov 2022 11:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osRKQ-0003bE-AG; Tue, 08 Nov 2022 11:19:59 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osRKA-00036j-1n; Tue, 08 Nov 2022 11:19:57 -0500
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 58B6060D99;
 Tue,  8 Nov 2022 19:19:21 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 DdGUctjk9u-JJN8UnIB; Tue, 08 Nov 2022 19:19:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667924360; bh=+bEudbmIFY7bScFV+sIGBVBq2VgL3IjuA874bznjPrI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=IT5ZfBYdCWQuGZYZtVZ9VkRDRRI+dKCaoBuweSiuGQp1ktjKbZ7RrIU6B3bMy6e7P
 Om1NFRgF/uoaa2b5Vn4Hk+z5Ya0q/2KG4m5STOm9AtaHZPEN8N5gxKdmkMkunOcEFa
 mJ6zzy6ncqKPPxmTQDSGnybxxK1tAMH2lHvcG3+Q=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <711f6d68-888e-bca0-972e-a05503a039c5@yandex-team.ru>
Date: Tue, 8 Nov 2022 19:19:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-3-eesposit@redhat.com>
 <197f2a27-4c3f-a62b-535c-d1db9ba22a32@yandex-team.ru>
 <88f02d19-84d8-d1a7-4250-416fd32f1435@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <88f02d19-84d8-d1a7-4250-416fd32f1435@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

[add Stefan]


On 11/8/22 18:09, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 08/11/2022 um 15:48 schrieb Vladimir Sementsov-Ogievskiy:
>> On 11/4/22 12:56, Emanuele Giuseppe Esposito wrote:
>>> These functions end up calling bdrv_common_block_status_above(), a
>>> generated_co_wrapper function.
>>
>> generated_co_wrapper is not a coroutine_fn. Сonversely it's a function
>> that do a class coroutine wrapping - start a coroutine and do POLL to
>> wait for the coroutine to finish.
>>
>>> In addition, they also happen to be always called in coroutine context,
>>> meaning all callers are coroutine_fn.
>>
>> That's also not a reason for marking them coroutine_fn. "coroutine_fn"
>> means that the function can be called only from coroutine context.
>>
>>> This means that the g_c_w function will enter the qemu_in_coroutine()
>>> case and eventually suspend (or in other words call
>>> qemu_coroutine_yield()).
>>> Therefore we need to mark such functions coroutine_fn too.
>>
>> I don't think so. Moreover, this breaks the concept, as your new
>> coroutine_fn functions will call generated_co_wrapper functions which
>> are not marked coroutine_fn and never was.
> 
> Theoretically not, 

Agree, I was wrong in this point

> because marking it coroutine_fn we know that we are
> going in the if(qemu_in_coroutine()) branch of the g_c_w, so we could
> directly replace it with the actual function. Because it's a pain to do
> it with hand, and at some point I/someone should use Alberto static
> analyzer to get rid of that, I decided to leave g_c_w there.
> 
> As I understand it, it seems that you and Paolo have a different
> understanding on what coroutine_fn means and where it should be used.

Looks so...

But we have a documentation in coroutine.h, let's check:

  * Mark a function that executes in coroutine context
  *
  * Functions that execute in coroutine context cannot be called directly from
  * normal functions.  In the future it would be nice to enable compiler or
  * static checker support for catching such errors.  This annotation might make
  * it possible and in the meantime it serves as documentation.

Not very clear, but still it say:

  coroutine_fn = "function that executes in coroutine context"
  "functions that execute in coroutine context"  =  "cannot be called directly from normal functions"

So, IMHO that corresponds to my point of view: we shouldn't mark by coroutine_fn functions that can be called from both coroutine context and not.

If we want to change the concept, we should start with rewriting this documentation.

> Honestly I don't understand your point, as you said
> 
>> "coroutine_fn"
>> means that the function can be called only from coroutine context.
> 
> which is the case for these functions. So could you please clarify?
> 
> What I do know is that it's extremely confusing to understand if a
> function that is *not* marked as coroutine_fn is actually being called
> also from coroutines or not.
> 
> Which complicates A LOT whatever change or operation I want to perform
> on the BlockDriver callbacks or any other function in the block layer,
> because in the current approach for the AioContext lock removal (which
> you are not aware of, I understand) we need to distinguish between
> functions running in coroutine context and not, and throwing g_c_w
> functions everywhere makes my work much harder that it already is.

OK, I understand the problem.

Hmm. Formally marking by "coroutine_fn" a function that theoretically can be called from any context doesn't break things. We just say that since that moment we don't allow to call this function from non-coroutine context.

OK, I tend to agree that you are on the right way, sorry for my skepticism)

PS: you recently introduced a lot of IO_CODE() / GLOBAL_STATE_CODE() marks, which (will be/already) turned into assertions.

This is a lot better than our "coroutine_fn" sign, which actually do no check (and can't do). Don't you plan to swap a "coroutine_fn" noop marker with more meaningful IN_COROUTINE(); (or something like this, which just do assert(qemu_in_coroutine())) at start of the function? It would be a lot safer.


> 
> Thank you,
> Emanuele
> 
>>
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>    block/block-copy.c | 15 +++++++++------
>>>    1 file changed, 9 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>> index bb947afdda..f33ab1d0b6 100644
>>> --- a/block/block-copy.c
>>> +++ b/block/block-copy.c
>>> @@ -577,8 +577,9 @@ static coroutine_fn int
>>> block_copy_task_entry(AioTask *task)
>>>        return ret;
>>>    }
>>>    -static int block_copy_block_status(BlockCopyState *s, int64_t offset,
>>> -                                   int64_t bytes, int64_t *pnum)
>>> +static coroutine_fn int block_copy_block_status(BlockCopyState *s,
>>> +                                                int64_t offset,
>>> +                                                int64_t bytes,
>>> int64_t *pnum)
>>>    {
>>>        int64_t num;
>>>        BlockDriverState *base;
>>> @@ -613,8 +614,9 @@ static int block_copy_block_status(BlockCopyState
>>> *s, int64_t offset,
>>>     * Check if the cluster starting at offset is allocated or not.
>>>     * return via pnum the number of contiguous clusters sharing this
>>> allocation.
>>>     */
>>> -static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t
>>> offset,
>>> -                                           int64_t *pnum)
>>> +static int coroutine_fn
>>> block_copy_is_cluster_allocated(BlockCopyState *s,
>>> +                                                        int64_t offset,
>>> +                                                        int64_t *pnum)
>>>    {
>>>        BlockDriverState *bs = s->source->bs;
>>>        int64_t count, total_count = 0;
>>> @@ -669,8 +671,9 @@ void block_copy_reset(BlockCopyState *s, int64_t
>>> offset, int64_t bytes)
>>>     * @return 0 when the cluster at @offset was unallocated,
>>>     *         1 otherwise, and -ret on error.
>>>     */
>>> -int64_t block_copy_reset_unallocated(BlockCopyState *s,
>>> -                                     int64_t offset, int64_t *count)
>>> +int64_t coroutine_fn block_copy_reset_unallocated(BlockCopyState *s,
>>> +                                                  int64_t offset,
>>> +                                                  int64_t *count)
>>>    {
>>>        int ret;
>>>        int64_t clusters, bytes;
>>
> 

-- 
Best regards,
Vladimir


