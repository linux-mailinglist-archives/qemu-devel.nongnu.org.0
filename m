Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493F26C4E13
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:42:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezfe-0007GP-9i; Wed, 22 Mar 2023 10:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezfc-0007Fk-R9
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:42:32 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezfa-0001ym-Vt
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:42:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so6425522wmq.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679496149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WzkXEOHmSHQXyMtrWIUQKfJPKcjWYSp3TzMSbyiK9uo=;
 b=IwrqSP+tZhS92WxxYghGpn2gshVu5KvkHbMjQ02erSZFL1fz9kGh/m/WrM1UKmlnfB
 WQlU6IFfFc72XYxJYVrrst9C48FDclX5a21kp5uSzoOP1rt4sm7CDi6Y199mhfzND/jT
 ZVlwtDaHoPTkp6JIA3qx8AxDd+NWg95jzZDd4zqJ1DKX7/q/Hxh9RMTlBJ0leDaaYnGC
 TEoxYMH4Zp8CS6IpuZdgmmoN5NkCHZ1GUynMy6TTkRaMIBsoDpeiiy5D/mGgMfTo1H6w
 8rTJI5CyU/ddU2WPY47q0ARD5bDuy40EKLa65q40GiCveVZhdQqCYF/aJWHsoC4O1KIG
 x57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679496149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WzkXEOHmSHQXyMtrWIUQKfJPKcjWYSp3TzMSbyiK9uo=;
 b=AdicOQ6IC6EFeJgTJGImboM9YmR2H/eSMUcnA6pjwijk2AKUNR/Gp+b7vhZv++FB1+
 Alo6WZfJ+qzuisO15S4sScVEEp1Z35ONcFwXVEUIwipiUX64R8wD29g2k0NsYa+wQSFc
 q61X51fTGj7I2Lu8pAseU/RkvPWCza8kUrp6itBZw9Mkw8CvRzTIZpgG2m5J01UARByE
 5FP7j6OM/BP/qntBVCKf2tbGgx+wocrGii8CWgsT1+6qo133rF8E7zZLu8GpRbnkN+sw
 QdhrcpLAp6414tqCtOjV3fF6AQXOf7t5eOcMSkNGJlrfkSZFx496HwNZUU3AkzqdjnT/
 n1dA==
X-Gm-Message-State: AO0yUKUHZpOAw+m11KbP/XJsp9pjwaR04bjWag/yhX//777a0XKjJNBn
 WzbdfgtRQAxl3GisvDcXZId8QQ==
X-Google-Smtp-Source: AK7set8f3Cx84S2TlK44u8GpFLFH7SAvp2e9ozy5nNOuJBhxbPsB47vW1OWAetArGcWJiDrtKcPAqQ==
X-Received: by 2002:a05:600c:204f:b0:3ed:70df:37 with SMTP id
 p15-20020a05600c204f00b003ed70df0037mr5465815wmg.21.1679496149510; 
 Wed, 22 Mar 2023 07:42:29 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b003ea57808179sm24057562wmq.38.2023.03.22.07.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 07:42:29 -0700 (PDT)
Message-ID: <83dc812a-9d6c-230e-8ed5-2685494c1683@linaro.org>
Date: Wed, 22 Mar 2023 15:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 v2 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-2-clg@kaod.org>
 <14e4785e-6d3c-0891-1d59-3be4cbd700cd@redhat.com>
 <20230322132717.GA1191181@fedora>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322132717.GA1191181@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22/3/23 14:27, Stefan Hajnoczi wrote:
> On Wed, Mar 22, 2023 at 08:11:37AM +0100, Thomas Huth wrote:
>> On 21/03/2023 17.16, Cédric Le Goater wrote:
>>> From: Cédric Le Goater <clg@redhat.com>
>>>
>>> GCC13 reports an error :
>>>
>>> ../util/async.c: In function ‘aio_bh_poll’:
>>> include/qemu/queue.h:303:22: error: storing the address of local variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ [-Werror=dangling-pointer=]
>>>     303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
>>>         |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
>>> ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
>>>     169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>>>         |     ^~~~~~~~~~~~~~~~~~~~
>>> ../util/async.c:161:17: note: ‘slice’ declared here
>>>     161 |     BHListSlice slice;
>>>         |                 ^~~~~
>>> ../util/async.c:161:17: note: ‘ctx’ declared here
>>>
>>> But the local variable 'slice' is removed from the global context list
>>> in following loop of the same routine. Add a pragma to silent GCC.
>>>
>>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>> ---
>>>    util/async.c | 13 +++++++++++++
>>>    1 file changed, 13 insertions(+)
>>>
>>> diff --git a/util/async.c b/util/async.c
>>> index 21016a1ac7..de9b431236 100644
>>> --- a/util/async.c
>>> +++ b/util/async.c
>>> @@ -164,7 +164,20 @@ int aio_bh_poll(AioContext *ctx)
>>>        /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
>>>        QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
>>> +
>>> +    /*
>>> +     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
>>> +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but the
>>> +     * list is emptied before this function returns.
>>> +     */
>>> +#if !defined(__clang__)
>>> +#pragma GCC diagnostic push
>>> +#pragma GCC diagnostic ignored "-Wdangling-pointer="
>>
>> That warning parameter looks like a new one in GCC 13 ?
>> ... so you have to check whether it's available before disabling
>> it, otherwise this will fail with older versions of GCC. I just
>> gave it a try with my GCC 8.5 and got this:
>>
>> ../../devel/qemu/util/async.c: In function ‘aio_bh_poll’:
>> ../../devel/qemu/util/async.c:175:32: error: unknown option after ‘#pragma GCC diagnostic’ kind [-Werror=pragmas]
>>   #pragma GCC diagnostic ignored "-Wdangling-pointer="
>>                                  ^~~~~~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>>
>>   Thomas
>>
>> What about reworking the code like this:
>>
>> diff --git a/util/async.c b/util/async.c
>> index 21016a1ac7..b236bdfbd8 100644
>> --- a/util/async.c
>> +++ b/util/async.c
>> @@ -156,15 +156,14 @@ void aio_bh_call(QEMUBH *bh)
>>   }
>>   /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
>> -int aio_bh_poll(AioContext *ctx)
>> +static int aio_bh_poll_slice(AioContext *ctx, BHListSlice *slice)
>>   {
>> -    BHListSlice slice;
>>       BHListSlice *s;
>>       int ret = 0;
>>       /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
>> -    QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
>> -    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>> +    QSLIST_MOVE_ATOMIC(&slice->bh_list, &ctx->bh_list);
>> +    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, slice, next);
>>       while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
>>           QEMUBH *bh;
>> @@ -191,6 +190,13 @@ int aio_bh_poll(AioContext *ctx)
>>       return ret;
>>   }
>> +int aio_bh_poll(AioContext *ctx)
>> +{
>> +    BHListSlice slice;
>> +
>> +    return aio_bh_poll_slice(ctx, &slice);
>> +}
>> +
>>   void qemu_bh_schedule_idle(QEMUBH *bh)
>>   {
>>       aio_bh_enqueue(bh, BH_SCHEDULED | BH_IDLE);
>>
>> Would that work with GCC 13 and be acceptable?
> 
> Fine by me. Please add a comment into aio_bh_poll() explaining that this
> wrapper function exists to silence the gcc dangling-pointer warning.
> Otherwise someone may be tempted to remove the function.

IMO by using #pragmas it is clearer this is a kludge. Also we can
revert this commit adding the pragmas/comment once the compiler
are fixed.

