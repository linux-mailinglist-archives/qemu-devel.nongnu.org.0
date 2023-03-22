Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2596C454A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 09:48:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peu8J-0006JM-RA; Wed, 22 Mar 2023 04:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peu8H-0006HS-3U
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:47:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peu8F-0005rE-7k
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:47:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o7so16157802wrg.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679474861;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=991knHG4feXqMyFgNTiA8aLw0dZR77JQC6BIemg4KW0=;
 b=mMubAquzs4PT28TOwTgXNwtyMI1RK+Y8J5vsyCIhvw6Qcl3JUaGrFHIJ9NoEow0FhK
 1md5e/CtNxqDfxa0wUCHrylOkBgRnWt2+7HRDi8M0UPpJTzcamTmhwfsJ1nsJRfcc9Nn
 ZfAxm5sr+RGeYivwWEozz68nNZKjjLxqi9rVlLSCEUvQIRpP48w3adRP5JRKsVgSknxF
 mDN5AfU/fA7hThzgdgEx9T4DRy6GF7y0VD7ubvY/+0bjgSAqXl4syihnM4P8kZ8CF85O
 ildCnXdiJ3DQ6zkFZVkgPkVylCvm9hyLoBD7umYKgyS/nZFseXRum2OeE8OwQ8R6qvxa
 9FHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679474861;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=991knHG4feXqMyFgNTiA8aLw0dZR77JQC6BIemg4KW0=;
 b=skBTD7bfswxPFv5xRVHgR1/aeUz0sMNw0EYIL6Z2tyAyPLS9EA5RSsNpXgRZYvoV5d
 ZOovG72qcNWtTJ48aD0b4pfFyiCExGb7oF9/QmFhiwGlkh59h5i28Hjqa/Eg7/DDEgQ3
 X2nlvAfAt3vOZffT9L8KXfb7DkoXCKHp7Oc4k2Y/iqhg/AHW1VHxtLvsjbk4TwmfZOFH
 teyMWyS8frsouthdyF+UeEr3tXDn9Q/dqknaRKYBDOXUYZk6aRgmu/EdS/SUaSlN6I7o
 TRTZCmj3eu38TDpo1Mw39kUuX5qI/6dRwxPea0T+PsrM8tZYqChYG+l1iHR6WixGFbb+
 Hnww==
X-Gm-Message-State: AO0yUKV56LNkMBKYEJToP7afdNbRa4I+YTuFhWI+7aREmlGze8a0sT61
 LOQWQCj1WTeCcKQ/S+r/DHznUQ==
X-Google-Smtp-Source: AK7set96QkYhwYgqrSrphPNm8zVLwftrSgm9pioi+av2byXzW6s46zKx9mUOFzukLOqU2dHjONXQ4Q==
X-Received: by 2002:adf:fa0b:0:b0:2d9:16f9:aee3 with SMTP id
 m11-20020adffa0b000000b002d916f9aee3mr3626382wrr.14.1679474861751; 
 Wed, 22 Mar 2023 01:47:41 -0700 (PDT)
Received: from [192.168.18.115] ([91.219.21.246])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d4889000000b002c559843748sm13337235wrq.10.2023.03.22.01.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 01:47:41 -0700 (PDT)
Message-ID: <24d45c41-2f62-76a2-4294-fcfa346c9683@linaro.org>
Date: Wed, 22 Mar 2023 09:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 v2 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-2-clg@kaod.org>
 <14e4785e-6d3c-0891-1d59-3be4cbd700cd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <14e4785e-6d3c-0891-1d59-3be4cbd700cd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 22/3/23 08:11, Thomas Huth wrote:
> On 21/03/2023 17.16, Cédric Le Goater wrote:
>> From: Cédric Le Goater <clg@redhat.com>
>>
>> GCC13 reports an error :
>>
>> ../util/async.c: In function ‘aio_bh_poll’:
>> include/qemu/queue.h:303:22: error: storing the address of local 
>> variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ 
>> [-Werror=dangling-pointer=]
>>    303 |     (head)->sqh_last = 
>> &(elm)->field.sqe_next;                          \
>>        |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
>> ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
>>    169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>>        |     ^~~~~~~~~~~~~~~~~~~~
>> ../util/async.c:161:17: note: ‘slice’ declared here
>>    161 |     BHListSlice slice;
>>        |                 ^~~~~
>> ../util/async.c:161:17: note: ‘ctx’ declared here
>>
>> But the local variable 'slice' is removed from the global context list
>> in following loop of the same routine. Add a pragma to silent GCC.
>>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   util/async.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/util/async.c b/util/async.c
>> index 21016a1ac7..de9b431236 100644
>> --- a/util/async.c
>> +++ b/util/async.c
>> @@ -164,7 +164,20 @@ int aio_bh_poll(AioContext *ctx)
>>       /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in 
>> aio_bh_enqueue().  */
>>       QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
>> +
>> +    /*
>> +     * GCC13 [-Werror=dangling-pointer=] complains that the local 
>> variable
>> +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but 
>> the
>> +     * list is emptied before this function returns.
>> +     */
>> +#if !defined(__clang__)
>> +#pragma GCC diagnostic push
>> +#pragma GCC diagnostic ignored "-Wdangling-pointer="
> 
> That warning parameter looks like a new one in GCC 13 ?
> ... so you have to check whether it's available before disabling
> it, otherwise this will fail with older versions of GCC. I just
> gave it a try with my GCC 8.5 and got this:
> 
> ../../devel/qemu/util/async.c: In function ‘aio_bh_poll’:
> ../../devel/qemu/util/async.c:175:32: error: unknown option after 
> ‘#pragma GCC diagnostic’ kind [-Werror=pragmas]
>   #pragma GCC diagnostic ignored "-Wdangling-pointer="
>                                  ^~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors

Just curious, does this work? (I don't have a GCC 8.5 handy)

   #pragma GCC diagnostic push
   #pragma GCC diagnostic ignored "-Wpragmas"
   #pragma GCC diagnostic ignored "-Wdangling-pointer="


