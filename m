Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D7D4504EE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 14:06:34 +0100 (CET)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmbgu-0006QB-Jz
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 08:06:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmbfW-0005P0-U4
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:05:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmbfH-0007C5-LZ
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:04:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636981489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXvqtQNLqH6St0bjZDnV4pPMlNTSk+M5HGqXJ7FPsR0=;
 b=OsBzrqkS2EDqgkQCooZNimECwsOmKOatEXIsqeTnIL38CDdAyTN9Ad7APEa0D54I5RGNmm
 Q4AnbkR5WsLoWOLrO/AUCzSEJKl5ZYUfjMDk51U9S5WfakO9p5VaA5iMi8DnDcJ7Xf3i+7
 X1/SibeS6pxOElD1iiOIAc735zu2vM4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-0pLmgzICP4Slwx-N81l4-A-1; Mon, 15 Nov 2021 08:04:48 -0500
X-MC-Unique: 0pLmgzICP4Slwx-N81l4-A-1
Received: by mail-wr1-f70.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso3523675wrj.12
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 05:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qXvqtQNLqH6St0bjZDnV4pPMlNTSk+M5HGqXJ7FPsR0=;
 b=qKjwcXCUlyt7VsdbeLC/A3ToWOph0vljUAB2/zN7rXWgNZraCQI9v9kFQa4FfogUEn
 vjKzNcStoqBmkQ9RNBJG/nG6+WHft0Do9EeU0Vh5TOGm+Qbg5ZSxtizQvwGqXwHdbiiH
 COqKI2J0uI4xbJOLp8dKU24dP3YHfzY03RR2xEVdG8N3JhHmFvFXW7+/9ggqhBGaXNPs
 XjXyk4WsV2HVLglqgOWZNP08+SnV+ePrFBR309h79eP0GE2RLUqMJSZb82TAYzFOXThu
 fgxSo+z93skfXjY0ChHXm0Jhr7NwBmvNHqRPk8GypmeVLoehET9lB/Id6YK1udXLcHgj
 LWhA==
X-Gm-Message-State: AOAM5339cruM+ZE9o4D2F7R3iNsNmbDKg50FKHKS/lDwBGVmBByYrzzB
 0cFkA/w2qzAnv4Mq7UdVAVxage0DpUuEkgaxf4pqL8hdwxEqiRxj99QtyprZrGcXls6INbdjYJd
 h5IPzAygDWnTp49k=
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr61076915wms.44.1636981486624; 
 Mon, 15 Nov 2021 05:04:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyVOt6z+N8qhibm9/5SuvqA7Fj9PV4D9y54Lgukigk5zX3H2+SyQENuC+W1cQqjZ2OQijzFA==
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr61076855wms.44.1636981486283; 
 Mon, 15 Nov 2021 05:04:46 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id g13sm13393742wmk.37.2021.11.15.05.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 05:04:45 -0800 (PST)
Message-ID: <74992b21-77cc-5d34-6ccb-d5a4fa5fc59f@redhat.com>
Date: Mon, 15 Nov 2021 14:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 09/10] block: Let replace_child_noperm free children
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211111120829.81329-1-hreitz@redhat.com>
 <20211111120829.81329-10-hreitz@redhat.com>
 <c631468b-2e2d-f5d9-6afb-6868ce00d2f9@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <c631468b-2e2d-f5d9-6afb-6868ce00d2f9@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.11.21 17:10, Vladimir Sementsov-Ogievskiy wrote:
> 11.11.2021 15:08, Hanna Reitz wrote:
>> In most of the block layer, especially when traversing down from other
>> BlockDriverStates, we assume that BdrvChild.bs can never be NULL.  When
>> it becomes NULL, it is expected that the corresponding BdrvChild pointer
>> also becomes NULL and the BdrvChild object is freed.
>>
>> Therefore, once bdrv_replace_child_noperm() sets the BdrvChild.bs
>> pointer to NULL, it should also immediately set the corresponding
>> BdrvChild pointer (like bs->file or bs->backing) to NULL.
>>
>> In that context, it also makes sense for this function to free the
>> child.  Sometimes we cannot do so, though, because it is called in a
>> transactional context where the caller might still want to reinstate the
>> child in the abort branch (and free it only on commit), so this behavior
>> has to remain optional.
>>
>> In bdrv_replace_child_tran()'s abort handler, we now rely on the fact
>> that the BdrvChild passed to bdrv_replace_child_tran() must have had a
>> non-NULL .bs pointer initially.  Make a note of that and assert it.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   block.c | 102 +++++++++++++++++++++++++++++++++++++++++++-------------
>>   1 file changed, 79 insertions(+), 23 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index a40027161c..0ac5b163d2 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -87,8 +87,10 @@ static BlockDriverState *bdrv_open_inherit(const 
>> char *filename,
>>   static bool bdrv_recurse_has_child(BlockDriverState *bs,
>>                                      BlockDriverState *child);
>>   +static void bdrv_child_free(BdrvChild *child);
>>   static void bdrv_replace_child_noperm(BdrvChild **child,
>> -                                      BlockDriverState *new_bs);
>> +                                      BlockDriverState *new_bs,
>> +                                      bool free_empty_child);
>>   static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
>>                                                 BdrvChild *child,
>>                                                 Transaction *tran);
>> @@ -2256,12 +2258,16 @@ typedef struct BdrvReplaceChildState {
>>       BdrvChild *child;
>>       BdrvChild **childp;
>>       BlockDriverState *old_bs;
>> +    bool free_empty_child;
>>   } BdrvReplaceChildState;
>>     static void bdrv_replace_child_commit(void *opaque)
>>   {
>>       BdrvReplaceChildState *s = opaque;
>>   +    if (s->free_empty_child && !s->child->bs) {
>> +        bdrv_child_free(s->child);
>> +    }
>>       bdrv_unref(s->old_bs);
>>   }
>>   @@ -2278,22 +2284,26 @@ static void bdrv_replace_child_abort(void 
>> *opaque)
>>        *     modify the BdrvChild * pointer we indirectly pass to it, 
>> i.e. it
>>        *     will not modify s->child.  From that perspective, it 
>> does not matter
>>        *     whether we pass s->childp or &s->child.
>> -     *     (TODO: Right now, bdrv_replace_child_noperm() never 
>> modifies that
>> -     *     pointer anyway (though it will in the future), so at this 
>> point it
>> -     *     absolutely does not matter whether we pass s->childp or 
>> &s->child.)
>>        * (2) If new_bs is not NULL, s->childp will be NULL. We then 
>> cannot use
>>        *     it here.
>>        * (3) If new_bs is NULL, *s->childp will have been NULLed by
>>        *     bdrv_replace_child_tran()'s bdrv_replace_child_noperm() 
>> call, and we
>>        *     must not pass a NULL *s->childp here.
>> -     *     (TODO: In its current state, bdrv_replace_child_noperm() 
>> will not
>> -     *     have NULLed *s->childp, so this does not apply yet.  It 
>> will in the
>> -     *     future.)
>
> What I don't like about this patch is that it does two different 
> things: zeroing the pointer and clearing the object. And if we look at 
> the latter in separate, it seems that it's not needed:
>
> Look: bdrv_replace_child_tran(): new parameter is set to true in two 
> places, in both of them we are sure (and do assertion and comment) 
> that new bs is not NULL and nothing will be freed.
>
> Similarly, bdrv_replace_child_noperm() is called with true in two 
> places where we sure that new bs is not NULL.
>
> and only one place where new parameter set to true really do something:
>
>> @@ -2960,8 +3013,7 @@ static void bdrv_detach_child(BdrvChild **childp)
>>   {
>>       BlockDriverState *old_bs = (*childp)->bs;
>>   -    bdrv_replace_child_noperm(childp, NULL);
>> -    bdrv_child_free(*childp);
>> +    bdrv_replace_child_noperm(childp, NULL, true);
>>         if (old_bs) {
>>           /*
>
> And it doesn't worth the whole complexity of new parameters for two 
> functions.
>
> In this place we can simply do something like
>
> BdrvChild *child = *childp;
>
> bdrv_replace_child_noperm(childp, NULL);
>
> bdrv_child_free(child);
>
>
> I understand the idea: it seems good and intuitive to do zeroing the 
> pointer and clearing the object in one shot. But this patch itself 
> shows that we just can't do it in 90% of cases. So, I think better is 
> not do it and live with only "zeroing the pointer" part of this patch.

I see your point, but I don’t find it too complex.  Passing `true` is 
the default and then calling the function is easy.  Passing `false` 
means there’s a catch, and then the caller is already complex anyway, so 
it doesn’t really make things worse.

I find the condition on when to pass `true` and when to pass `false` 
simple: Always pass true, unless the child cannot be deleted yet.

There are two reasons why I’d rather keep the parameter:
(1) That’s how it’s already merged, and I’m biased against respinning 
given that Kevin will be on PTO beginning tomorrow, and that we’re in 
freeze, so I’d rather not miss an RC.
(2) I really dislike a function that takes a pointer, NULLs it, and then 
doesn’t free the object it belongs to.  I find that a bad interface.  
Unfortunately we sometimes need this behavior, though, hence the 
additional parameter.  And this parameter basically asks the caller 
whether they want the reasonable interface (`true`) or the weird one 
where the pointer is NULLed but the object isn’t freed (`false`).  I 
find this makes the interface palatable to me.

>
> Another idea that come to my mind while reviewing this series: did you 
> consider zeroing bs->file / bs->backing in .detach, like you do with 
> bs->children list at start of the series?  We can argue the same way 
> that file and backing pointers are property of parent, and they should 
> be zeroed in .detach, where element is removed from bs->children.

Yes, I did.  The problem is that to make this right, .attach() would 
symmetrically need to put the child into bs->file or bs->backing (e.g. 
when the removal transaction is aborted).  That would not only be more 
invasive (we’d have to deal with and modify the places where bs->file or 
bs->backing is set), you’re then also facing the problem of giving 
.attach() this information.

Perhaps we could let .detach() clear the pointer and not set it in 
.attach(), but that seemed sufficiently wrong to me that I didn’t 
consider it further.

Hanna


