Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF356664D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:41:17 +0200 (CEST)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8f3U-0000dW-N6
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o8f23-00080h-Tn; Tue, 05 Jul 2022 05:39:47 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33]:35750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o8f22-0005fL-8k; Tue, 05 Jul 2022 05:39:47 -0400
Received: by mail-vk1-xa33.google.com with SMTP id 18so69316vkz.2;
 Tue, 05 Jul 2022 02:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f55/Q0yxAXTwoeHquimUiBIYY1pNggOvt1cs/q+ug6k=;
 b=pkY5cvisztOQyixu/khV3KMsS+cwQNRbO5dRJB767CSLUmbnqjYDIWxLFfGmnUFblM
 EtjIM5h9e1baTTrl8milk8inOCDX+CHgFIEIjhnRK7KmfUyu30J9sDXKVIUB4A2gOv/x
 IbYDNCOtVhyDhTjRj+p1MvuyCwfB3qzGvolTkCCrHdvMRTrls3yDZ3J2R6mzExUL17GH
 eRPKdhCuBCOFJ0qwHOqMcqRrOsTp6LCoV8gLWKfL0KC+LezuRODUSP8jGJ6KlgfKpQ5m
 8Bw4pAHCKAkx6wAWwYXvEsbDr0AbREEUwiMgGx+TAgVqhIuL0GCr6aBvfRAar09OsCBM
 Ta1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f55/Q0yxAXTwoeHquimUiBIYY1pNggOvt1cs/q+ug6k=;
 b=3Vgqu4vRu8XHu9vaiItrLovCMnbE3GyKr+t2cO3iUIUrMfVRcEakqoQvBf+kZfmsgc
 LkTAFRvJAY5kgjISiPPTQuvoEE1KNJ+GoESzaB0iUeHCJ7w+ACCM/G9MIeZUuJVSdu13
 dI7HpquUBfhhTKLo2xCJvtLsRtpwxlMUhsqVYNYtlxtN1NceO5k2YRioYZA3RXD31y1N
 DyWjoos4O+SsdZrGN6ezT/WDNXpP9ekF//as+juzJTxJNcmM/8MpLuTmfCeFhWi5FNEl
 I3z3OUhsjBMw4YT8MkwiGE19lBebsJ/RgC4JSsMONjr+zdBivWQcr7eWwqB8kJBkM0xs
 HHGA==
X-Gm-Message-State: AJIora+3IH3heq2elNifqUXj7lefA3sR5Wm/jkm1OQY5griicHEhcxaD
 Jyf0UZSeRTbGIqSUX421ugM=
X-Google-Smtp-Source: AGRyM1uhFRG5pM1PcGurmPHReiLFnGhcXI8MvhClc2LKBACqAIqMfcB9rJTxqSwY4dMVLzMiWi5dAw==
X-Received: by 2002:a1f:6d04:0:b0:36c:125:2edf with SMTP id
 i4-20020a1f6d04000000b0036c01252edfmr18989781vkc.38.1657013984647; 
 Tue, 05 Jul 2022 02:39:44 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a1fa117000000b0035d04bf0a8csm6286977vke.1.2022.07.05.02.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 02:39:44 -0700 (PDT)
Message-ID: <38468531-5eb0-a421-f90f-2a3c67222d40@gmail.com>
Date: Tue, 5 Jul 2022 06:39:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/9] target/ppc: add errp to kvmppc_read_int_cpu_dt()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-3-danielhb413@gmail.com>
 <55014e2a-a668-4843-8338-850abeb5ff04@kaod.org>
 <47277f4f-a6a5-85dc-4806-67df8e2fc153@gmail.com>
 <6d37b1dc-5dfb-2513-f74e-3f58e84e8117@kaod.org>
 <1d2cd44f-fd61-4693-ecc0-f71c80131005@ilande.co.uk>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <1d2cd44f-fd61-4693-ecc0-f71c80131005@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 7/5/22 03:51, Mark Cave-Ayland wrote:
> On 04/07/2022 18:34, Cédric Le Goater wrote:
> 
>> On 7/2/22 15:34, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 7/2/22 03:24, Cédric Le Goater wrote:
>>>> On 6/30/22 21:42, Daniel Henrique Barboza wrote:
>>>>> The function can't just return 0 whether an error happened and call it a
>>>>> day. We must provide a way of letting callers know if the zero return is
>>>>> legitimate or due to an error.
>>>>>
>>>>> Add an Error pointer to kvmppc_read_int_cpu_dt() that will be filled
>>>>> with an appropriate error, if one occurs. Callers are then free to pass
>>>>> an Error pointer and handle it.
>>>>>
>>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>>> ---
>>>>>   target/ppc/kvm.c | 16 +++++++++-------
>>>>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>>>> index 109823136d..bc17437097 100644
>>>>> --- a/target/ppc/kvm.c
>>>>> +++ b/target/ppc/kvm.c
>>>>> @@ -1925,15 +1925,17 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
>>>>>   /*
>>>>>    * Read a CPU node property from the host device tree that's a single
>>>>> - * integer (32-bit or 64-bit).  Returns 0 if anything goes wrong
>>>>> - * (can't find or open the property, or doesn't understand the format)
>>>>> + * integer (32-bit or 64-bit).  Returns 0 and set errp if anything goes
>>>>> + * wrong (can't find or open the property, or doesn't understand the
>>>>> + * format)
>>>>>    */
>>>>> -static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>>>>> +static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
>>>>>   {
>>>>>       char buf[PATH_MAX], *tmp;
>>>>>       uint64_t val;
>>>>>       if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
>>>>> +        error_setg(errp, "Failed to read CPU property %s", propname);
>>>>>           return 0;
>>>>>       }
>>>>> @@ -1946,12 +1948,12 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>>>>>   uint64_t kvmppc_get_clockfreq(void)
>>>>>   {
>>>>> -    return kvmppc_read_int_cpu_dt("clock-frequency");
>>>>> +    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
>>>>
>>>>
>>>> This should be fatal. no ?
>>>
>>>
>>> I'm not sure. I went under the assumption that there might be some weird
>>> condition where 'clock-frequency' might be missing from the DT, and this
>>> is why we're not exiting out immediately.
>>>
>>> That said, the advantage of turning this into fatal is that we won't need
>>> all the other patches that handles error on this function. We're going to
>>> assume that if 'clock-frequency' is missing then we can't boot. I'm okay
>>> with that.
>>
>> I think so. Some machines behave badly when 'clock-frequency' is bogus,
>> division by zero, no console, etc. We could check easily with pseries
>> which is the only KVM PPC platform.
> 
> Well not quite true ;)  I haven't tested it during the last release cycle, but the Mac machines were still working fine to boot OS X with KVM-PR on my G4 Mac Mini last time I checked.


We can't just error_fatal by default then.

Each machine should be able to determine how to handle this missing DT
element. If I want to error_fatal for pseries then I can do so in patch
9/9, but other than that I'll keep the existing behavior.


Thanks,


Daniel

> 
> 
> ATB,
> 
> Mark.

