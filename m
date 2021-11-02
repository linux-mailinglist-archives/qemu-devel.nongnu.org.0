Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCC544307E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:34:54 +0100 (CET)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhusH-0005yT-Ua
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mhuXY-0007Ct-S5
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mhuXV-0005JX-0N
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635862402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNV8zmJp9qrG0oEyPZ4jt2LUW8JhH2OrvaFQOaH+uSg=;
 b=Bz8oSnPNGFhtPF1db/GJ8UqG884UKwBOfPNIZLudxW6mOD8bHwP7WZ8rN9JNVaU3PD5svI
 DjpY5L4kLluNMfs1DXfXNdApS5xJvCXlmqp8VNNsquYArm2wQsNW6pbGhRA3z7EUPaWnH7
 uH6FiGyFTZLXtHNqWk52FJ58IoGm50U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-HMwsMQssO9unq5yRwIc1dA-1; Tue, 02 Nov 2021 10:13:22 -0400
X-MC-Unique: HMwsMQssO9unq5yRwIc1dA-1
Received: by mail-ed1-f70.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso18870470edj.20
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RNV8zmJp9qrG0oEyPZ4jt2LUW8JhH2OrvaFQOaH+uSg=;
 b=mkHjUBv6rLy0hyzfA2W8KepIlJ8HSZwPR4f0EaS8CGZsY9TEOP74Xzg4HMVKl7M8lU
 fNIS8XSjD0UjmKOYXOIvtZyzOk47DkR/f8c2nRNLqL01Zgpash0kiNodtwU55Uo5iCFr
 uopX3MnH1QLKBmQkHsMDXukqRTUAfyXjsW9Lzr6gGZrksbzK1aQ+oan4jw+zNCHy1BJF
 pdK/iOmNqTl7pK9nSecdwTJP8jhNPI969LEH5gV8bxlj2AlwD/2/O9UjtUHBoLlO6kaZ
 ywavHwOBFC7BtRCoHVHVqf+h7Jp/YOVb/xY45XBQ1Mr9N3GabWeEtrmhcnn9qU1BAHia
 R5hA==
X-Gm-Message-State: AOAM533clmNcJYsCv3iN0T4Oj13vMh6qgDtf4baevgulanzM0q9mw62f
 bsVKT24I0MZ54p6+utiRhTvzyqQ0gQTKxBUxuXRkxNAd2L2Xa2mDKquNmJoTNgL0kekZFWp04B4
 287S1Rrsr/W67/CNiS8HACGHvEisABGOLYSPIW7cS9WAA51yU0OK0yT+V0J/QMU2N04E=
X-Received: by 2002:a17:906:b097:: with SMTP id
 x23mr45175768ejy.501.1635862400492; 
 Tue, 02 Nov 2021 07:13:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/y7bCZ70wO1MMHPwK7MUjISQcCOv0cuOAEdegmAHRqfhXA5zFp4XI45TCxFGipFA5NSQ7kQ==
X-Received: by 2002:a17:906:b097:: with SMTP id
 x23mr45175704ejy.501.1635862400010; 
 Tue, 02 Nov 2021 07:13:20 -0700 (PDT)
Received: from localhost.localdomain
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id d22sm8476980ejj.47.2021.11.02.07.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 07:13:19 -0700 (PDT)
Subject: Re: [RFC PATCH 00/15] job: replace AioContext lock with job_mutex
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211029163914.4044794-1-eesposit@redhat.com>
 <dd430e7e-d45c-038f-d571-9be2a0823ee2@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <4d2184cf-7e4f-97de-484d-ddc11ae5c6d8@redhat.com>
Date: Tue, 2 Nov 2021 15:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <dd430e7e-d45c-038f-d571-9be2a0823ee2@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02/11/2021 14:08, Vladimir Sementsov-Ogievskiy wrote:
> 29.10.2021 19:38, Emanuele Giuseppe Esposito wrote:
>> In this series, we want to remove the AioContext lock and instead
>> use the already existent job_mutex to protect the job structures
>> and list. This is part of the work to get rid of AioContext lock
>> usage in favour of smaller granularity locks.
>>
>> In patches 1-3-5-6-7, we split the job API in two headers:
>> job-driver.h and job-monitor.h.
>> As explained in job.c, job-monitor are the functions mainly used
>> by the monitor, and require consistency between the search of
>> a specific job (job_get) and the actual operation/action on it
>> (e.g. job_user_cancel). Therefore job-monitor API assume that
>> the job mutex lock is always held by the caller.
>>
>> job-driver, on the other side, is the collection of functions
>> that are used by the job drivers or core block layer. These
>> functions are not aware of the job mutex, and delegate the
>> locking to the callee instead.
>>
>> We also have job-common.h contains the job struct definition
>> and common functions that are not part of monitor or driver APIs.
>> job.h is left for legacy and to avoid changing all files that
>> include it.
> 
> 
> Honestly, I don't really like the idea of splitting:
> 
> 1. It's not a functional split: for some functions we have a locked 
> version in one header and unlocked in the other. But actually they are 
> the same function. I'd prefer such wrappers to live together. All the 
> declarations in the headers are about one thing: Job.

This is something I thought made sense, but I understand that it can be 
confusing. We can also have both versions in the same API. In the end, 
remember that we are talking about only 2 functions: job_is_ready_locked 
and job_early_fail_locked

> 
> I think, splitting make sense when we really split things, split objects 
> into some separate entities. But here you just use different header to 
> group functions by some criteria not related to their action. I don't 
> like it.
> 
> I think, it's enough to specify in a comment above the function, does it 
> need locking or not ("foo_locked" naming helps too), and different 
> headers doesn't help to understand code but make it more difficult.
> 

I think that having a single comment above a group of functions does not 
help, because one might forget about it (or the function is far below 
the comment) and insert a new function in the wrong category. Adding the 
same comment to each function makes it redundant IMO. And btw each of 
job-monitor functions has the following (redundant) comment:

Called between job_lock and job_unlock.

Splitting an API in two files might force people to notice that there is 
a physical separation and reason between the two APIs, other than the 
fact that it will be easier for the reviewer to notice if a function is 
added to the wrong API.

> 
> 2. I don't like file names:
> 
> "job-driver" for me sounds like something about JobDriver struct. 

Well it is actually related to the JobDriver struct. It is used by the 
files/function that implement a JobDriver, like mirror, commit, stream ...

> "job-monitor" - unclear. You define job-monitor as functions mainly used 
> by the monitor. But actually they are used by other code paths as well.. 
> Also, jobs don't directly relate to monitor, they are abstract, so no 
> reason to establish such a relation in file names.
> 

I think you got the reasoning behind those but just in case:

- job-driver.h : used by the "drivers", ie those who implement 
JobDriver/BlockJobDriver callbacks. Drivers have no knowledge of the job 
lock, so all functions acquire and release the lock internally.

Yes, in *two* cases I kind of broke this rule when I implemented custom 
job-driver functions like job_enter_not_paused and 
job_not_paused_nor_cancelled to avoid TOC/TOU, but I am not even sure 
whether they are necessary or not.

- job-monitor.h : used by the monitor API, but not only there. The main 
idea of this category is that the functions assume that the lock is 
held. Therefore they can used together in the same critical section and 
avoid TOC/TOU conditions.

Maybe job-driver and job-unlocked?
Feel free to suggest new names :)

Emanuele


