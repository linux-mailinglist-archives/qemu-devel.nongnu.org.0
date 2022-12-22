Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C510D653E5D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 11:36:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Itm-0005mk-HH; Thu, 22 Dec 2022 05:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8Itd-0005km-Kx
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:33:56 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8Ita-0004Cp-PA
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:33:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 i82-20020a1c3b55000000b003d1e906ca23so849660wma.3
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 02:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B4SJm7Gc/lXmqMonkRRpICCrmFyWg5Hr0w/smqM8o98=;
 b=TNPPN+PnYZeJsS3W3geji+yaam5TgdqqHiU80X/MhQ/9LFZboTmxrWBsT3l+5zLw+v
 ACwq6LW7lHGg5jMBJGWXjZicAlqS87juYZESUQFwn5uMs7G6/BlrQoP409x1FcosUgSG
 oUl0GwS1v0poYZNPPbsZbALbdmj1YKzpdZ3CqyL8jlj4vQY1LI7tb7oh+K2AuvaFGHg1
 HMWsO4wftdY84Adq1G9zHmY0K6mhjtY1T5T1l0lHwpOQ9PXbingyd0gqJrTCraOBXfpQ
 W4D2tdxUotw7REjBDXdi8hosscxaBHyG0b0uD5hPI5x8bQLge05CB3i3R5w4ZBg5temb
 lwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B4SJm7Gc/lXmqMonkRRpICCrmFyWg5Hr0w/smqM8o98=;
 b=aRlSidEg4z76x3RiXDw0qnnrtteBtx+/PCc6/9heClUTt1cv0LQmjfKNU0mKmF/iXB
 fiOWUMKrQGJYhrALT06KiBfO08uAGN2BPObqr7KUkkfeCFZmcDYo7kxtGXmSIVJFWQoE
 BFSUdIX69oRTuiEyI1ypsPUkWuDOa88Qb5CaPZgxLa0noL22hQRxx3vTLXZq7DTis+Yh
 7quO19cjRGgtGp9E5ieDqMoggPjlessZ3Uxmb/XMV5ZJvSALHnJe8fJVlHX+/YdVL0mj
 Wa1hdYhZ4r9gcxSQJvwnGgp7t1QWcBHScMoDfMAshYawORzRmN12gnUVyhb+mgq0AbDI
 rR5g==
X-Gm-Message-State: AFqh2koaVPBJmaj7HfchfHFr6WFScPqS2kGz9jkwEUBvrtEim8/y5J1p
 XS8x4vg20yTRoJSnpqjpQy8DAw==
X-Google-Smtp-Source: AMrXdXvia5M9uF9V6RtE9X5/iT0B92rLaWDA0KMZwHeH9qXKWhu/nz0TICnsvkrmZRwv4obIiuRnwQ==
X-Received: by 2002:a05:600c:4d22:b0:3cf:a5df:8bb0 with SMTP id
 u34-20020a05600c4d2200b003cfa5df8bb0mr3789300wmp.37.1671705229187; 
 Thu, 22 Dec 2022 02:33:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l3-20020a05600012c300b00236c1f2cecesm154461wrx.81.2022.12.22.02.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 02:33:48 -0800 (PST)
Message-ID: <d01519cc-3d11-859d-6299-c01ea3e73914@linaro.org>
Date: Thu, 22 Dec 2022 11:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: eric.auger@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 eric.auger.pro@gmail.com, richard.henderson@linaro.org, paul@nowt.org,
 qemu-devel@nongnu.org, stefanha@fmail.com, peter.maydell@linaro.org,
 sw@weilnetz.de
References: <20221221163652.1239362-1-eric.auger@redhat.com>
 <ed6d68f4-81aa-d9a1-3a71-628855e8a376@redhat.com>
 <bafaad8e-f4f7-ddeb-4fbd-cebc7b8c360e@linaro.org>
 <5045cc9a-b383-b1d3-b3fd-a9f84dd74f36@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5045cc9a-b383-b1d3-b3fd-a9f84dd74f36@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 22/12/22 11:07, Eric Auger wrote:
> Hi Philippe,
> 
> On 12/22/22 10:01, Philippe Mathieu-Daudé wrote:
>> On 22/12/22 09:18, Paolo Bonzini wrote:
>>> On 12/21/22 17:36, Eric Auger wrote:
>>>> To avoid compilation errors when -Werror=maybe-uninitialized is used,
>>>> replace 'case 3' by 'default'.
>>>>
>>>> Otherwise we get:
>>>>
>>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>      2495 |     d->Q(3) = r3;
>>>>           |     ~~~~~~~~^~~~
>>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>      2494 |     d->Q(2) = r2;
>>>>           |     ~~~~~~~~^~~~
>>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>      2493 |     d->Q(1) = r1;
>>>>           |     ~~~~~~~~^~~~
>>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>      2492 |     d->Q(0) = r0;
>>>>           |     ~~~~~~~~^~~~
>>
>> With what compiler? Is that a supported one?
> https://lore.kernel.org/qemu-devel/3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com/

Adding the compiler version in the commit description would help:

--
Using GCC 11.3.1 "cc (GCC) 11.3.1 20220421 (Red Hat 11.3.1-2)" we get:
--

>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> Suggested-by: Stefan Weil <sw@weilnetz.de>
>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>> ---
>>>>    target/i386/ops_sse.h | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
>>>> index 3cbc36a59d..c442c8c10c 100644
>>>> --- a/target/i386/ops_sse.h
>>>> +++ b/target/i386/ops_sse.h
>>>> @@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>>> *s, uint32_t order)
>>>>            r0 = s->Q(0);
>>>>            r1 = s->Q(1);
>>>>            break;
>>>> -    case 3:
>>>> +    default:
>>>>            r0 = s->Q(2);
>>>>            r1 = s->Q(3);
>>>>            break;
>>>> @@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>>> *s, uint32_t order)
>>>>            r2 = s->Q(0);
>>>>            r3 = s->Q(1);
>>>>            break;
>>>> -    case 3:
>>>> +    default:
>>>>            r2 = s->Q(2);
>>>>            r3 = s->Q(3);
>>>>            break;
>>>
>>> Queued, but this compiler sucks. :)
>>
>> Can't we simply add a dumb 'default' case? So when reviewing we don't
>> have to evaluate 'default' means 3 here.
>>
>> -- >8 --
>> --- a/target/i386/ops_sse.h
>> +++ b/target/i386/ops_sse.h
>> @@ -2470,6 +2470,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
>> uint32_t order)
>>           r0 = s->Q(2);
>>           r1 = s->Q(3);
>>           break;
>> +    default:
>> +        qemu_build_not_reached();
>>       }
>>       switch ((order >> 4) & 3) {
>>       case 0:
>> @@ -2488,6 +2490,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
>> uint32_t order)
>>           r2 = s->Q(2);
>>           r3 = s->Q(3);
>>           break;
>> +    default:
>> +        qemu_build_not_reached();
>>       }
> I guess this won't fix the fact r0, r1, r2, r3 are not initialized, will it?

Well my compiler (Apple clang version 14.0.0 (clang-1400.0.29.202))
doesn't display the warning, I don't have yours handy to test it :)

