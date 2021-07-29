Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097D3DA12C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:39:13 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m93RY-00060L-HZ
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m93Qa-0005CP-0H
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:38:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m93QY-0007RP-8S
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627555089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKBJ+YV2f8aGKF8AJptxMFmRcMuyXjtkVYk6uskc7gE=;
 b=cthIpMKZ4O2pFfLUiuFrSKWLqRJEqLuYhTCgFjUEqwRVDN0njhlTO6F/TBDHAw016kESNQ
 UqT5GIZVlq40izpx6GHFGcvG4RW8koun2Xmh4P7lzdNPqM0gmUC2U7RVRkmLzk1SIz1nKf
 er80kG61wHpe/wNjeZLhE5Z6rECoQRY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-kPJzFJfeN3qVaDOUvwplxg-1; Thu, 29 Jul 2021 06:38:08 -0400
X-MC-Unique: kPJzFJfeN3qVaDOUvwplxg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s22-20020adf97960000b02901535eae4100so2095195wrb.14
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 03:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CKBJ+YV2f8aGKF8AJptxMFmRcMuyXjtkVYk6uskc7gE=;
 b=PAAxemwc1ZhifMFnLqkxeNqlRv+Mh5xwjWZdAFDvHb4+DHWDGXyE+kJtZ/AFH2CteC
 Pc7bmYTxFgwm2actgrN8NOth0TlHZVJeQnO84ivJIr8A4SREdDzmZthXbsEP9RnswnI+
 kv8Y/4pNZqI2z7DYbWf6p0U5y3DEnhFqwVu2jJ8qKm1jVPODZhao7dU4phF1tsEwrbIr
 3ZwqAY9gJ3bpqyZC1oMhujkMA0w2IbZH3gncFJ2hY2QOi71RhIjKUjaqs44C2Ll665do
 uU0dBWhupITSXY70swp18Igc2Ee5kUCx8wIIGuKCVs3PgA7o9USeQ3izssAsfwDtFV0b
 YOxQ==
X-Gm-Message-State: AOAM533nZz+79DoSdtnmr8EwEpSIOl1K4AZtRQ/hQZqBAei8v/9VSb5d
 I6Rwb5HGqt9X8dIKweW41tElDRtXCFXLU3sHGbRxqkzvT5x5nTi1kq3nsP2j9v2O/Z4TzrCGaei
 1LnZj2JtL+5kDo0A=
X-Received: by 2002:adf:f145:: with SMTP id y5mr4120885wro.102.1627555086914; 
 Thu, 29 Jul 2021 03:38:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyC7ETPyEFU8lvu9wQKrULxfKju53k+IYItXAb2ZR2TYbqbzUO3PB8tldsgZprFzbtP11ASw==
X-Received: by 2002:adf:f145:: with SMTP id y5mr4120854wro.102.1627555086686; 
 Thu, 29 Jul 2021 03:38:06 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 g15sm2620180wmh.44.2021.07.29.03.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 03:38:06 -0700 (PDT)
Subject: Re: [PATCH RFC 0/3] mirror: rework soft-cancelling READY mirror
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210727164754.62895-1-vsementsov@virtuozzo.com>
 <eb6db91e-9b6b-331e-8a8d-ee4fcf60ff2f@redhat.com>
 <19e149dc-ff1a-09b3-2d6c-2d046e9daabb@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <660d9a7b-beb9-c2a2-33eb-d894aae8b1e0@redhat.com>
Date: Thu, 29 Jul 2021 12:38:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <19e149dc-ff1a-09b3-2d6c-2d046e9daabb@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.07.21 12:02, Vladimir Sementsov-Ogievskiy wrote:
> 28.07.2021 10:00, Max Reitz wrote:
>> On 27.07.21 18:47, Vladimir Sementsov-Ogievskiy wrote:
>>> Hi all!
>>>
>>> That's an alternative to (part of) Max's
>>> "[PATCH for-6.1? v2 0/7] mirror: Handle errors after READY cancel"
>>> and shows' my idea of handling soft-cancelling READY mirror case
>>> directly in qmp_block_job_cancel. And cleanup all other job cancelling
>>> functions.
>>>
>>> That's untested draft, don't take it to heart :)
>>
>> Well, I would have preferred it if you’d rebased this on top of that 
>> series, precisely because it’s an alternative to only part of it. And 
>> if it’s just an untested draft, that would have been even better, 
>> because it would’ve given a better idea on what the cleanup looks like.
>>
>> There are also things like this series making cancel internally 
>> always a force-cancel, where I’m not sure whether we want that in the 
>> replication driver or not[1].  With my series, we add an explicit 
>> parameter, so we’re forced to think about it, and then in this series 
>> on top we can just drop the parameter for all force-cancel 
>> invocations again, and for all non-force-cancel invocations we would 
>> have to think a bit more.
>
> I now don't sure that patch 5 of your series is correct (see my last 
> answer to it), that's why I decided to not base on it.

Well, we can always take patch 5 from v1.  (Where I changed any 
job_is_cancelled() to job_cancel_requested() when it influenced the 
external interface.)

> My series has the benefit of handling soft-mirror-cancel case the 
> other way and handles mirror finalization in case of soft-cancel 
> properly.
>
>>
>> Specifically as for this series, I don’t like job_complete_ex() very 
>> much, I think the parameter should be part of job_complete() itself.
>
> That was my idea. But job_complete is passed as function pointer, so 
> changing its prototype would be more work.. But I think it's possible.
>
>>   If we think that’s too specific of a mirror parameter to include in 
>> normal job_complete(), well, then there shouldn’t be a 
>> job_complete_ex() either, and do_graph_change should be a property of 
>> the mirror job (perhaps as pivot_on_completion) that’s cleared by 
>> qmp_block_job_cancel() before invoking job_complete().
>
> This way users will lose a way to make a decision during job running..

On the contrary, it would be a precursor to letting the user change this 
property explicitly with a new QMP command.

> But probably they don't need actually. Moving the option to mirror job 
> parameter seems a good option to me.
>
>>
>> Max
>>
>> [1] Although looking at it again now, it probably wants force-cancel.
>>
>
>
> What do you think of my idea to keep old bugs as is and just deprecate 
> block-job-cancel and add a new interface for "no-graph-change mirror" 
> case?

I don’t see a reason for that.  The fix isn’t that complicated.

Also, honestly, I don’t see a good reason for deprecating anything.

Max


