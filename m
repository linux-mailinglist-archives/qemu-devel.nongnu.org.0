Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B83855789E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 13:23:50 +0200 (CEST)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Kw8-0000xu-QQ
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 07:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o4KsQ-0007LX-Ct
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:20:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o4KsN-0007IA-8k
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655983193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opcLUq50gg98PJ4azTEjKAyfruWTGz723qab3r+oq6w=;
 b=H6og8u4qMjYYyqnifF4yzg1wkx3GeXo9CAM+NwTtNT8HFQ0qDI1B5Dlvt88340Ua5KyB36
 Iff74FoXGNdtNkIK6CAXA+xhY+4pBHqn1iFUobTPFCF33Lq6jtJZH8XpgW78BmwLqQPgS7
 2X+o86Ut/6B2LgF7mqNQqI0RjhHvFvg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-zkqIJIutOwK-bUy6CxkkyQ-1; Thu, 23 Jun 2022 07:19:52 -0400
X-MC-Unique: zkqIJIutOwK-bUy6CxkkyQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n15-20020a05600c4f8f00b0039c3e76d646so1272644wmq.7
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 04:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=opcLUq50gg98PJ4azTEjKAyfruWTGz723qab3r+oq6w=;
 b=nI8VW8ApSs8LYgR3AGtvllkKhmzUlChXMFKUezP9EdU42h9Cl08xuce1Ieaa/+M6Vf
 0EiPZNxQ/1mUGlgeNyPvI6p4ILg5nDrmI7wn/OaGY3o8kKGdboDMK6jLGDfZ7HyH3QU7
 mgGB9lTi2BQasaNzBNN7BRqWqZVyrf5eenuvIL/GdU/hFaj5xZeUKVZCsx36Pnbelkd9
 nHWi7/bugrYZOkFrS3JhJsVG7Le9AW56LXXF7oXt55l2CiqDj7+hvyGKn7lPzOdSw3MF
 +Mv0W94sNaaY/nXHK7SWpF4yviu35qdpCzYQ5+mdkpsW/uNm9YNCex4OXjaK0f25AXgV
 KK1w==
X-Gm-Message-State: AJIora/hcLVY+/0qk7UGwEpJDMHqJvZiLMgmFfydgdeBadizuvcTrjDo
 UOZdwBwVimNOODh0aw3vA/6QzpEcmLMeg4goXS98hXLhxGD/EVSUCd6fKGvRWLIMnhIuSIKpO61
 b11bl8qnEzbkqYVM=
X-Received: by 2002:adf:e502:0:b0:21b:8de6:7f14 with SMTP id
 j2-20020adfe502000000b0021b8de67f14mr7460043wrm.3.1655983191475; 
 Thu, 23 Jun 2022 04:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vVgmAopmvTBOMoXw0yehctjPmaN7BxhxCNJSP7QGunMlMtEXwVUJzzeoUZcm2oKraYMRfIDg==
X-Received: by 2002:adf:e502:0:b0:21b:8de6:7f14 with SMTP id
 j2-20020adfe502000000b0021b8de67f14mr7460013wrm.3.1655983191080; 
 Thu, 23 Jun 2022 04:19:51 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a05600c1c0900b0039c7f790f6asm3102780wms.30.2022.06.23.04.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 04:19:50 -0700 (PDT)
Message-ID: <b420f70a-6e69-1913-5019-05a8118a49f5@redhat.com>
Date: Thu, 23 Jun 2022 13:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 10/18] jobs: rename static functions called with
 job_mutex held
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-11-eesposit@redhat.com>
 <c0401616-f246-ce1d-2a0f-b7e23dd55ab8@yandex-team.ru>
 <0aaa344b-aecb-13de-f82f-cad27a768ba9@redhat.com>
 <c234668d-0156-548b-e1e8-d1fda1b85ad7@yandex-team.ru>
 <f59f2894-667c-8940-cc34-2407783b5699@redhat.com>
 <be74272f-f22b-f649-c299-deed65699e2f@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <be74272f-f22b-f649-c299-deed65699e2f@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 23/06/2022 um 13:10 schrieb Vladimir Sementsov-Ogievskiy:
> On 6/23/22 12:08, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 22/06/2022 um 20:38 schrieb Vladimir Sementsov-Ogievskiy:
>>> On 6/22/22 17:26, Emanuele Giuseppe Esposito wrote:
>>>>
>>>>
>>>> Am 21/06/2022 um 19:26 schrieb Vladimir Sementsov-Ogievskiy:
>>>>> On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
>>>>>> With the*nop*  job_lock/unlock placed, rename the static
>>>>>> functions that are always under job_mutex, adding "_locked" suffix.
>>>>>>
>>>>>> List of functions that get this suffix:
>>>>>> job_txn_ref           job_txn_del_job
>>>>>> job_txn_apply           job_state_transition
>>>>>> job_should_pause       job_event_cancelled
>>>>>> job_event_completed       job_event_pending
>>>>>> job_event_ready           job_event_idle
>>>>>> job_do_yield           job_timer_not_pending
>>>>>> job_do_dismiss           job_conclude
>>>>>> job_update_rc           job_commit
>>>>>> job_abort           job_clean
>>>>>> job_finalize_single       job_cancel_async
>>>>>> job_completed_txn_abort       job_prepare
>>>>>> job_needs_finalize       job_do_finalize
>>>>>> job_transition_to_pending  job_completed_txn_success
>>>>>> job_completed           job_cancel_err
>>>>>> job_force_cancel_err
>>>>>>
>>>>>> Note that "locked" refers to the*nop*  job_lock/unlock, and not
>>>>>> real_job_lock/unlock.
>>>>>>
>>>>>> No functional change intended.
>>>>>>
>>>>>> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
>>>>>
>>>>>
>>>>> Hmm. Maybe it was already discussed.. But for me it seems, that it
>>>>> would
>>>>> be simpler to review previous patches, that fix job_ API users to use
>>>>> locking properly, if this renaming go earlier.
>>>>>
>>>>> Anyway, in this series, we can't update everything at once. So
>>>>> patch to
>>>>> patch, we make the code more and more correct. (yes I remember that
>>>>> lock() is a noop, but I should review thinking that it real,
>>>>> otherwise,
>>>>> how to review?)
>>>>>
>>>>> So, I'm saying about formal correctness of using lock() unlock()
>>>>> function in connection with introduced _locked prifixes and in
>>>>> connection with how it should finally work.
>>>>>
>>>>> You do:
>>>>>
>>>>> 05. introduce some _locked functions, that just duplicates, and
>>>>> job_pause_point_locked() is formally inconsistent, as I said.
>>>>>
>>>>> 06. Update a lot of places, to give them their final form (but not
>>>>> final, as some functions will be renamed to _locked, some not, hard to
>>>>> imagine)
>>>>>
>>>>> 07,08,09. Update some more, and even more places. very hard to track
>>>>> formal correctness of using locks
>>>>>
>>>>> 10-...: rename APIs.
>>>>>
>>>>>
>>>>> What do you think about the following:
>>>>>
>>>>> 1. Introduce noop lock, and some internal _locked() versions, and keep
>>>>> formal consistency inside job.c, considering all public interfaces as
>>>>> unlocked:
>>>>>
>>>>>    at this point:
>>>>>     - everything correct inside job.c
>>>>>     - no public interfaces with _locked prefix
>>>>>     - all public interfaces take mutex internally
>>>>>     - no external user take mutex by hand
>>>>>
>>>>> We can rename all internal static functions at this step too.
>>>>>
>>>>> 2. Introduce some public _locked APIs, that we'll use in next patches
>>>>>
>>>>> 3. Now start fixing external users in several patches:
>>>>>       - protect by mutex direct use of job fields
>>>>>     - make wider locks and move to _locked APIs inside them where
>>>>> needed
>>>>>
>>>>>
>>>>> In this scenario, every updated unit becomes formally correct after
>>>>> update, and after all steps everything is formally correct, and we can
>>>>> move to turning-on the mutex.
>>>>>
>>>>
>>>> I don't understand your logic also here, sorry :(
>>>>
>>>> I assume you want to keep patch 1-4, then the problem is assing
>>>> job_lock
>>>> and renaming functions in _locked.
>>>> So I would say the problem is in patch 5-6-10-11-12-13. All the others
>>>> should be self contained.
>>>>
>>>> I understand patch 5 is a little hard to follow.
>>>>
>>>> Now, I am not sure what you propose here but it seems that the end goal
>>>> is to just have the same result, but with additional intermediate steps
>>>> that are just "do this just because in the next patch will be useful".
>>>> I think the problem is that we are going to miss the "why we need the
>>>> lock" logic in the patches if we do so.
>>>>
>>>> The logic I tried to convey in this order is the following:
>>>> - job.h: add _locked duplicates for job API functions called with and
>>>> without job_mutex
>>>>      Just create duplicates of functions
>>>>
>>>> - jobs: protect jobs with job_lock/unlock
>>>>      QMP and monitor functions call APIs that assume lock is taken,
>>>>      drivers must take explicitly the lock
>>>>
>>>> - jobs: rename static functions called with job_mutex held
>>>> - job.h: rename job API functions called with job_mutex held
>>>> - block_job: rename block_job functions called with job_mutex held
>>>>      *given* that some functions are always under lock, transform
>>>>      them in _locked. Requires the job_lock/unlock patch
>>>>
>>>> - job.h: define unlocked functions
>>>>      Comments on the public functions that are not _locked
>>>>
>>>>
>>>> @Kevin, since you also had some feedbacks on the patch ordering, do you
>>>> agree with this ordering or you have some other ideas?
>>>>
>>>> Following your suggestion, we could move patches 10-11-12-13 before
>>>> patch 6 "jobs: protect jobs with job_lock/unlock".
>>>>
>>>> (Apologies for changing my mind, but being the second complain I am
>>>> starting to reconsider reordering the patches).
>>>>
>>>
>>> In two words, what I mean: let's keep the following invariant from patch
>>> to patch:
>>>
>>> 1. Function that has _locked() prefix is always called with lock held
>>> 2. Function that has _locked() prefix never calls functions that take
>>> lock by themselves so that would dead-lock
>>> 3. Function that is documented as "called with lock not held" is never
>>> called with lock held
>>>
>>> That what I mean by "formal correctness": yes, we know that lock is
>>> noop, but still let's keep code logic to correspond function naming and
>>> comments that we add.
>>>
>>
>> Ok I get what you mean, but then we have useless changes for public
>> functions that eventually will only be _locked() like job_next_locked:
>>
>> The function is always called in a loop, so it is pointless to take the
>> lock inside. Therefore the patch would be "incorrect" on its own anyways.
>>
>> Then, we would have a patch where we add the lock guard inside, and
>> another one where we remove it and rename to _locked and take the lock
>> outside. Seems unnecessary to me.
> 
> For me it looks a bit simpler than you describe. And anyway keeping the
> correctness from patch to patch worth the complexity. I'll give an
> argument.
> 
> First what is the best practices? Best practices is when every patch is
> good and absolutely correct. So that you can apply any number of patches
> from the beginning of the series (01-NN), commit them to master and this
> will break neither compilation, nor tests, nor readability, nothing.
> This makes the review process iterable: if I'm OK with patches 01-03, I
> give them r-b and don't think about them. I don't have to keep in mind
> any tricky things. And I can review 04 several days later not rereading
> 01-03 (or at least I can consider applied 01-03 as a good correct base
> state). This way I'm sure, that if I reviewed all patches one-by-one,
> each one is correct, then the whole thing is correct.
> 
> A lot harder to review when we have only collective correctness: the
> whole series being applied make a correct thing, but we can't say it
> about intermediate states. In your series we can't be absolutely correct
> with each patch, as we have to switch from aio-context lock to mutex in
> one patch, that's why mutex is added as noop. That's a reasonable and
> (seems) unsolvable drawback. That's a thing I have to keep in mind
> during the whole review. But I'd prefer not add more such things, like
> comments and _locked suffixes that don't correspond to the code.
> 
> With the invariant that I propose, the following logic works:
> 
> If
>    1. we keep the invariant from patch to patch
>    AND
>    2. at the end we have updated all users of the internal and external
> APIs, not missed some file or function
> Then everything is correct at the end.
> 
> Without the invariant I can't prove that everything is correct at the
> end, as it is hard to follow the degree of correctness from patch to
> patch. In your way the only invariant that we have from patch to patch,
> is that mutex is noop, so all changes do nothing, and therefore they are
> correct. This way I can give an r-b to all such patches not thinking
> about details, they are noop. But when I finally have to review the
> patch that turns on the mutex, I'll have to recheck all internal and
> external API users, which is equivalent to review all the changes merged
> into one patch.
> 
> 
> 
> Consider the case with job_next. The most correct way to update it IMHO:
> 
> 1. Add lock inside job_next() and add job_next_locked() - in one patch
> with other similar changes of job.c and job.h.
> 
> At this moment we have job_next() calls in a loop, which is not good (we
> want larger critical section), but that doesn't break the invariant I
> proposed above.

The only thing I am pointing here is that this breaks "readability",
meaning if someone bisects here it will find a very weird situation
(aside from the fact that there is a noop lock).

But I guess this is fine, as long as I write it in the commit message.

And since these patch are waiting here for more than 3 months now, I
would say if the others (Kevin?) agree I will change the order with what
you proposed here.

Emanuele

> 
> 2. Update the loop: add larger critical section and switch to
> job_next_locked().
> 
> What is good here: we don't  need to unite updates of external API users
> into one patch, we can update file-by-file or subsystem-by-sybsystem.
> 
> 3. Delete unused job_next() API
> 
> 


