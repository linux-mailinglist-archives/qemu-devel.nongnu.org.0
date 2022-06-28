Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C1855BF70
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:29:23 +0200 (CEST)
Received: from localhost ([::1]:58194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66b4-0005ru-51
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o65ph-0008UR-80
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:40:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o65pe-0005ql-Qs
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656402021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHrFEDUD2E9TQNjtYZv2SoNeWNMg6EUwk7lMcCQrwJ8=;
 b=AoXQKsPxb1QVeANypFhHRRQRpbERWrGqS9C6KuACORQbeXJAiv8kbKVOVrBBrdcxT2I32c
 WhBrY0RsEudmzPVvfyceTRWA/Gnm2fKWRbFGneEq/yQUWIVeJZVv7T+8g2MPTxCbXh8joj
 9I22gegFJfL9XDahfqH6+JTd8CA1sm8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-6JYI_vD8OU6lAcFT3Emyrw-1; Tue, 28 Jun 2022 03:40:17 -0400
X-MC-Unique: 6JYI_vD8OU6lAcFT3Emyrw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r4-20020a1c4404000000b003a02fa133ceso659965wma.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 00:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RHrFEDUD2E9TQNjtYZv2SoNeWNMg6EUwk7lMcCQrwJ8=;
 b=GPNweS5NNBhmbDYNk+GIKbVxlvWS7IvgdqxfjG2ZOulqjI1nYa5tTUVWZ7bBm5/Zz8
 C0YTUDU7Eo6UpvyGQ0vkQxzINApm/2LGdm9TxL22fC0EaNQ/ytv74PalMp2Lt1WaxNh6
 6P+Xjs76p6hbtajDZDlcQAtu4fOILxWl+3tqjZsdksRK2A7U3zcPtSFptGEhKygfxsIX
 0ThyEhxAcPpUOS+um0Jn8Q/AEEE4IV4MQiWNZiNUt32BlQIAHcRpS9ImLNXPx+fuEZ1H
 oitqhL0HoiNhwrk1v8QpUO7PRhSY3lALjnGfUe8wIAn7NQ+uV60Z2KNM9T/FsvJJBsjl
 i+SA==
X-Gm-Message-State: AJIora9FNHUesISIDF2R/UtkpuB7ncFVB4zIsxDkQACOrfYxm7rTZm1B
 hJuaZDGj6rbwjxQcetN2VSDOlsN94+yhwIvgrX3J3ylXYY0U4L9Bg+h4kyfU9DOMTS9wXtVoN4s
 yA5d0OPeAu8O8v4E=
X-Received: by 2002:a05:6000:1a8b:b0:219:ad61:f4e3 with SMTP id
 f11-20020a0560001a8b00b00219ad61f4e3mr17590918wry.190.1656402015866; 
 Tue, 28 Jun 2022 00:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t03g2jRKU3xN98kidnaXLLP41Di39MqooVhR+aUj9Er8nG6ofJ71SGcT3Y/0cSvWIA7lOpDA==
X-Received: by 2002:a05:6000:1a8b:b0:219:ad61:f4e3 with SMTP id
 f11-20020a0560001a8b00b00219ad61f4e3mr17590890wry.190.1656402015607; 
 Tue, 28 Jun 2022 00:40:15 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 q4-20020adff944000000b0021b956da1dcsm12744035wrr.113.2022.06.28.00.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 00:40:15 -0700 (PDT)
Message-ID: <8248df6b-3b48-6e09-5a5e-021cf65041dd@redhat.com>
Date: Tue, 28 Jun 2022 09:40:14 +0200
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
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <c234668d-0156-548b-e1e8-d1fda1b85ad7@yandex-team.ru>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 22/06/2022 um 20:38 schrieb Vladimir Sementsov-Ogievskiy:
> On 6/22/22 17:26, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 21/06/2022 um 19:26 schrieb Vladimir Sementsov-Ogievskiy:
>>> On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
>>>> With the*nop*  job_lock/unlock placed, rename the static
>>>> functions that are always under job_mutex, adding "_locked" suffix.
>>>>
>>>> List of functions that get this suffix:
>>>> job_txn_ref           job_txn_del_job
>>>> job_txn_apply           job_state_transition
>>>> job_should_pause       job_event_cancelled
>>>> job_event_completed       job_event_pending
>>>> job_event_ready           job_event_idle
>>>> job_do_yield           job_timer_not_pending
>>>> job_do_dismiss           job_conclude
>>>> job_update_rc           job_commit
>>>> job_abort           job_clean
>>>> job_finalize_single       job_cancel_async
>>>> job_completed_txn_abort       job_prepare
>>>> job_needs_finalize       job_do_finalize
>>>> job_transition_to_pending  job_completed_txn_success
>>>> job_completed           job_cancel_err
>>>> job_force_cancel_err
>>>>
>>>> Note that "locked" refers to the*nop*  job_lock/unlock, and not
>>>> real_job_lock/unlock.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
>>>
>>>
>>> Hmm. Maybe it was already discussed.. But for me it seems, that it would
>>> be simpler to review previous patches, that fix job_ API users to use
>>> locking properly, if this renaming go earlier.
>>>
>>> Anyway, in this series, we can't update everything at once. So patch to
>>> patch, we make the code more and more correct. (yes I remember that
>>> lock() is a noop, but I should review thinking that it real, otherwise,
>>> how to review?)
>>>
>>> So, I'm saying about formal correctness of using lock() unlock()
>>> function in connection with introduced _locked prifixes and in
>>> connection with how it should finally work.
>>>
>>> You do:
>>>
>>> 05. introduce some _locked functions, that just duplicates, and
>>> job_pause_point_locked() is formally inconsistent, as I said.
>>>
>>> 06. Update a lot of places, to give them their final form (but not
>>> final, as some functions will be renamed to _locked, some not, hard to
>>> imagine)
>>>
>>> 07,08,09. Update some more, and even more places. very hard to track
>>> formal correctness of using locks
>>>
>>> 10-...: rename APIs.
>>>
>>>
>>> What do you think about the following:
>>>
>>> 1. Introduce noop lock, and some internal _locked() versions, and keep
>>> formal consistency inside job.c, considering all public interfaces as
>>> unlocked:
>>>
>>>   at this point:
>>>    - everything correct inside job.c
>>>    - no public interfaces with _locked prefix
>>>    - all public interfaces take mutex internally
>>>    - no external user take mutex by hand
>>>
>>> We can rename all internal static functions at this step too.
>>>
>>> 2. Introduce some public _locked APIs, that we'll use in next patches
>>>
>>> 3. Now start fixing external users in several patches:
>>>      - protect by mutex direct use of job fields
>>>    - make wider locks and move to _locked APIs inside them where needed
>>>
>>>
>>> In this scenario, every updated unit becomes formally correct after
>>> update, and after all steps everything is formally correct, and we can
>>> move to turning-on the mutex.
>>>
>>
>> I don't understand your logic also here, sorry :(
>>
>> I assume you want to keep patch 1-4, then the problem is assing job_lock
>> and renaming functions in _locked.
>> So I would say the problem is in patch 5-6-10-11-12-13. All the others
>> should be self contained.
>>
>> I understand patch 5 is a little hard to follow.
>>
>> Now, I am not sure what you propose here but it seems that the end goal
>> is to just have the same result, but with additional intermediate steps
>> that are just "do this just because in the next patch will be useful".
>> I think the problem is that we are going to miss the "why we need the
>> lock" logic in the patches if we do so.
>>
>> The logic I tried to convey in this order is the following:
>> - job.h: add _locked duplicates for job API functions called with and
>> without job_mutex
>>     Just create duplicates of functions
>>
>> - jobs: protect jobs with job_lock/unlock
>>     QMP and monitor functions call APIs that assume lock is taken,
>>     drivers must take explicitly the lock
>>
>> - jobs: rename static functions called with job_mutex held
>> - job.h: rename job API functions called with job_mutex held
>> - block_job: rename block_job functions called with job_mutex held
>>     *given* that some functions are always under lock, transform
>>     them in _locked. Requires the job_lock/unlock patch
>>
>> - job.h: define unlocked functions
>>     Comments on the public functions that are not _locked
>>
>>
>> @Kevin, since you also had some feedbacks on the patch ordering, do you
>> agree with this ordering or you have some other ideas?
>>
>> Following your suggestion, we could move patches 10-11-12-13 before
>> patch 6 "jobs: protect jobs with job_lock/unlock".
>>
>> (Apologies for changing my mind, but being the second complain I am
>> starting to reconsider reordering the patches).
>>
> 
> In two words, what I mean: let's keep the following invariant from patch
> to patch:
> 
> 1. Function that has _locked() prefix is always called with lock held
> 2. Function that has _locked() prefix never calls functions that take
> lock by themselves so that would dead-lock
> 3. Function that is documented as "called with lock not held" is never
> called with lock held
> 
> That what I mean by "formal correctness": yes, we know that lock is
> noop, but still let's keep code logic to correspond function naming and
> comments that we add.
> 
> 

Ok so far I did the following:

- duplicated each public function as static {function}_locked()
- made sure all functions in job.c call only _locked() functions, since
the lock is always taken internally

Now, we need to do the same also for blockjob API in blockjob.h
The only problem is that in order to use and create functions like
block_job_get_locked(), we need:
- job_get_locked() to be public, and can't be just replacing job_get()
because it is still used everywhere
- block_job_get_locked() to be public too, since it is used in other
files like blockdev.c

so we will have:
Job *job_get()
Job *job_get_locked()

BlockJob *block_job_get(const char *id)
BlockJob *block_job_get_locked(const char *id)


Therefore with this approach I need to make all _locked() functions
public, duplicating the API. Is that what you want?

Emanuele


