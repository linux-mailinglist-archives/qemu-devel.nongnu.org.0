Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BE554CFB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 16:29:12 +0200 (CEST)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o41Ly-0002i5-MH
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 10:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o41Jz-0000z6-He
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o41Jw-0005Yh-AS
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655908023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIfMyWfjCJxwF+SPvcj/Fx411zqlrkda9gKS4YCUCRA=;
 b=LbiHy1erxJTDxV87hIhIOM4pe805IG0RfGW4Zva8gU1cZIzORStJMrwUc7uDNVZOOaZzUL
 5irADw3n5EVBlwP+eFfJe4JbCX8ThnfM0Wl/07mR4n7IfHJZZforkqcW8704xePZGa4Vsm
 xO7BJcARiAdW6zEkHTscvMmMXpv8a7Y=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-BT0P0k4RMeuVQX5zaeyL1g-1; Wed, 22 Jun 2022 10:27:02 -0400
X-MC-Unique: BT0P0k4RMeuVQX5zaeyL1g-1
Received: by mail-qv1-f71.google.com with SMTP id
 t5-20020a0cb385000000b0046e63b0cef8so17386458qve.23
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 07:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RIfMyWfjCJxwF+SPvcj/Fx411zqlrkda9gKS4YCUCRA=;
 b=IpnKx/2ZarfSRsYQr12ktf8Yh+cr/QBxLES7JNd/YJXNiRULf6H+WfEAxWw7Hs6ULG
 4Eunp4ozt00B+WgR7IrOkA3I0Gbyn9Z+K7sxZ144FQlbMJNv1f06ntoxU013eB88hdb2
 iw2n8yypEQv5qre4Kn4VKXZvgkY0CRsO+RwYi/Djdd06MYkww4aD9XL51kh9oAImCYb/
 9mPVxK9bvkRlhqk9gMToaS7jkJ5Rb0Bv54c+MYFaOISJe5+ZLNyLF74J11Xnn2EXSOFl
 uhAV4SsLUm48igdUbpzafcBNd51fjYfpcZ1OD4ycNm76sgS6HxexHbFhNNw79x5Z4NQz
 4NKw==
X-Gm-Message-State: AJIora+bluzBbK7wVIqypjyBwNR/jJBLzUl4Mxa2koyMZTy91s0qhLBE
 cIoZpQlXG5ryS392PQNzYBaXe4sbCdLwlqt27LaxSQn9e3sWju24mlo21KuMQjINo11+y54T+IY
 p6HfUDT5OSGCHUQg=
X-Received: by 2002:a05:6214:27e8:b0:46e:3933:76b0 with SMTP id
 jt8-20020a05621427e800b0046e393376b0mr27651008qvb.92.1655908021823; 
 Wed, 22 Jun 2022 07:27:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t4TFwm0VthuBqg7vdY3ov0aTXpXrkmRL/dAjoSzIQOUnzk1A6s/aNUAVFngBg0mWPbVUIB/Q==
X-Received: by 2002:a05:6214:27e8:b0:46e:3933:76b0 with SMTP id
 jt8-20020a05621427e800b0046e393376b0mr27650968qvb.92.1655908021386; 
 Wed, 22 Jun 2022 07:27:01 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 g19-20020ac85813000000b00307aed25fc7sm14915439qtg.31.2022.06.22.07.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 07:27:00 -0700 (PDT)
Message-ID: <0aaa344b-aecb-13de-f82f-cad27a768ba9@redhat.com>
Date: Wed, 22 Jun 2022 16:26:57 +0200
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
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <c0401616-f246-ce1d-2a0f-b7e23dd55ab8@yandex-team.ru>
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



Am 21/06/2022 um 19:26 schrieb Vladimir Sementsov-Ogievskiy:
> On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
>> With the*nop*  job_lock/unlock placed, rename the static
>> functions that are always under job_mutex, adding "_locked" suffix.
>>
>> List of functions that get this suffix:
>> job_txn_ref           job_txn_del_job
>> job_txn_apply           job_state_transition
>> job_should_pause       job_event_cancelled
>> job_event_completed       job_event_pending
>> job_event_ready           job_event_idle
>> job_do_yield           job_timer_not_pending
>> job_do_dismiss           job_conclude
>> job_update_rc           job_commit
>> job_abort           job_clean
>> job_finalize_single       job_cancel_async
>> job_completed_txn_abort       job_prepare
>> job_needs_finalize       job_do_finalize
>> job_transition_to_pending  job_completed_txn_success
>> job_completed           job_cancel_err
>> job_force_cancel_err
>>
>> Note that "locked" refers to the*nop*  job_lock/unlock, and not
>> real_job_lock/unlock.
>>
>> No functional change intended.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> 
> 
> Hmm. Maybe it was already discussed.. But for me it seems, that it would
> be simpler to review previous patches, that fix job_ API users to use
> locking properly, if this renaming go earlier.
> 
> Anyway, in this series, we can't update everything at once. So patch to
> patch, we make the code more and more correct. (yes I remember that
> lock() is a noop, but I should review thinking that it real, otherwise,
> how to review?)
> 
> So, I'm saying about formal correctness of using lock() unlock()
> function in connection with introduced _locked prifixes and in
> connection with how it should finally work.
> 
> You do:
> 
> 05. introduce some _locked functions, that just duplicates, and
> job_pause_point_locked() is formally inconsistent, as I said.
> 
> 06. Update a lot of places, to give them their final form (but not
> final, as some functions will be renamed to _locked, some not, hard to
> imagine)
> 
> 07,08,09. Update some more, and even more places. very hard to track
> formal correctness of using locks
> 
> 10-...: rename APIs.
> 
> 
> What do you think about the following:
> 
> 1. Introduce noop lock, and some internal _locked() versions, and keep
> formal consistency inside job.c, considering all public interfaces as
> unlocked:
> 
>  at this point:
>   - everything correct inside job.c
>   - no public interfaces with _locked prefix
>   - all public interfaces take mutex internally
>   - no external user take mutex by hand
> 
> We can rename all internal static functions at this step too.
> 
> 2. Introduce some public _locked APIs, that we'll use in next patches
> 
> 3. Now start fixing external users in several patches:
>     - protect by mutex direct use of job fields
>   - make wider locks and move to _locked APIs inside them where needed
> 
> 
> In this scenario, every updated unit becomes formally correct after
> update, and after all steps everything is formally correct, and we can
> move to turning-on the mutex.
> 

I don't understand your logic also here, sorry :(

I assume you want to keep patch 1-4, then the problem is assing job_lock
and renaming functions in _locked.
So I would say the problem is in patch 5-6-10-11-12-13. All the others
should be self contained.

I understand patch 5 is a little hard to follow.

Now, I am not sure what you propose here but it seems that the end goal
is to just have the same result, but with additional intermediate steps
that are just "do this just because in the next patch will be useful".
I think the problem is that we are going to miss the "why we need the
lock" logic in the patches if we do so.

The logic I tried to convey in this order is the following:
- job.h: add _locked duplicates for job API functions called with and
without job_mutex
	Just create duplicates of functions

- jobs: protect jobs with job_lock/unlock
	QMP and monitor functions call APIs that assume lock is taken,
	drivers must take explicitly the lock

- jobs: rename static functions called with job_mutex held
- job.h: rename job API functions called with job_mutex held
- block_job: rename block_job functions called with job_mutex held
	*given* that some functions are always under lock, transform
	them in _locked. Requires the job_lock/unlock patch

- job.h: define unlocked functions
	Comments on the public functions that are not _locked


@Kevin, since you also had some feedbacks on the patch ordering, do you
agree with this ordering or you have some other ideas?

Following your suggestion, we could move patches 10-11-12-13 before
patch 6 "jobs: protect jobs with job_lock/unlock".

(Apologies for changing my mind, but being the second complain I am
starting to reconsider reordering the patches).

Thank you,
Emanuele


