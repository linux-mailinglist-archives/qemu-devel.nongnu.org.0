Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBA24F3D5D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 21:39:17 +0200 (CEST)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbp1I-0001RP-9b
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 15:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nbozY-0000GB-6h; Tue, 05 Apr 2022 15:37:28 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:38822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nbozW-0000JJ-Ck; Tue, 05 Apr 2022 15:37:27 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 88-20020a9d0ee1000000b005d0ae4e126fso238993otj.5; 
 Tue, 05 Apr 2022 12:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a7pfyIUGYw2Noev/qPFdyT2u6YXxXpOmwpkdefB+a3g=;
 b=BK/+VIjcoyvSCtCYw+0jrNM3bS5oDLWj55ktVT9C4jJFLX3QzdSUSBqJbqros1HyrU
 NZySEg5PTlYlv47ICtdiSwosxyNo4ESJk6NTzZwr9AzwyN3bS6Cr3p22WNZpVtq8Ztvo
 hySm0cp36n2U5y5IF/eRI8S1zzs1m3KPNQtrq/wxVUGlXLoVhEdkZZHdK//Whuq1Mf65
 H9zClKSArXqyvuTvQ/Zh1Ib7j85b9zUPSFzRMlT0tVczc5roc+Mf0MKveqXxBkxKINrc
 1z6vgGjyP/v4wBt+X70BFDNtQPJLFD7S67JC7z/ecWzI79kn8HRgNysZ5/lJSxRiMPDH
 lDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a7pfyIUGYw2Noev/qPFdyT2u6YXxXpOmwpkdefB+a3g=;
 b=wpgMv/ZoiAZMVLaeUhf6oJdOfhGxfJ1Z+rUgi/EtnnfterNB8CiSW4u2ySwq28f/sn
 eHtjdwGtkWi4PWz7NBnnuB//L4I9ee92dTIdkgSHmg5euElKus6SUmi93hcq3mhMhLcP
 MLm5aNwzq0K4y7+FQDqbbNPSkbklCxPmv2wBtG3q1YtIddU4VcoqNUT3Eip8qftekLHG
 JeJ2f89VNJd9EuX7j3DA/h2bmTAcGFMI7fCK2djnREhEcN1iuDDO84STLWTSuGoqX1fM
 fT5/MNnhjf/o3x+f873foPA3vNvpobzwknQnvySfn/I6GxUjgduJijrc0epzT6huqVUa
 FuAA==
X-Gm-Message-State: AOAM532Eyw0SsRqoR0nosYlMopV/kblC2euGmZXl3IZDHXyBETABwaej
 lhLKWmW1BVFHWKMtuct2+bE=
X-Google-Smtp-Source: ABdhPJyVyt53wW6GBYV1ih/LqTM70E1FHVbgbAy/W0lVK/ZCCUxIw/n/8WDS7xzmXNhwHjqVcVHz/Q==
X-Received: by 2002:a05:6830:1418:b0:5cd:8cd1:11ca with SMTP id
 v24-20020a056830141800b005cd8cd111camr1860939otp.310.1649187434704; 
 Tue, 05 Apr 2022 12:37:14 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:7ee3:afd9:f010:3a9:fd23?
 ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a9d2903000000b005cda765f578sm6011861otb.0.2022.04.05.12.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 12:37:14 -0700 (PDT)
Message-ID: <73b8f910-ada4-b084-1808-588b8747da18@gmail.com>
Date: Tue, 5 Apr 2022 16:37:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/4] target/ppc: init 'lpcr' in
 kvmppc_enable_cap_large_decr()
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20220331001717.616938-1-danielhb413@gmail.com>
 <20220331001717.616938-3-danielhb413@gmail.com> <YkUDCdUsjjmzFgJr@yekko>
 <d5b622c6-81b4-9d3f-9777-5233fe5a2be4@gmail.com>
 <5e48daaf-d881-2588-c323-30a9bc95a75f@linaro.org>
 <b292e516-80dc-9e5c-991b-49c77c0fe044@gmail.com> <YkZ0OGtA8mVk1Q0p@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YkZ0OGtA8mVk1Q0p@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/1/22 00:40, David Gibson wrote:
> On Thu, Mar 31, 2022 at 03:46:57PM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 3/31/22 14:36, Richard Henderson wrote:
>>> On 3/31/22 11:17, Daniel Henrique Barboza wrote:
>>>>> Hmm... this is seeming a bit like whack-a-mole.  Could we instead use
>>>>> one of the valgrind hinting mechanisms to inform it that
>>>>> kvm_get_one_reg() writes the variable at *target?
>>>>
>>>> I didn't find a way of doing that looking in the memcheck helpers
>>>> (https://valgrind.org/docs/manual/mc-manual.html section 4.7). That would be a
>>>> good way of solving this warning because we would put stuff inside a specific
>>>> function X and all callers of X would be covered by it.
>>>>
>>>> What I did find instead is a memcheck macro called VALGRIND_MAKE_MEM_DEFINED that
>>>> tells Valgrind that the var was initialized.
>>>>
>>>> This patch would then be something as follows:
>>>>
>>>>
>>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>>> index dc93b99189..b0e22fa283 100644
>>>> --- a/target/ppc/kvm.c
>>>> +++ b/target/ppc/kvm.c
>>>> @@ -56,6 +56,10 @@
>>>>    #define DEBUG_RETURN_GUEST 0
>>>>    #define DEBUG_RETURN_GDB   1
>>>>
>>>> +#ifdef CONFIG_VALGRIND_H
>>>> +#include <valgrind/memcheck.h>
>>>> +#endif
>>>> +
>>>>    const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>>>        KVM_CAP_LAST_INFO
>>>>    };
>>>> @@ -2539,6 +2543,10 @@ int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
>>>>        CPUState *cs = CPU(cpu);
>>>>        uint64_t lpcr;
>>>>
>>>> +#ifdef CONFIG_VALGRIND_H
>>>> +    VALGRIND_MAKE_MEM_DEFINED(lpcr, sizeof(uint64_t));
>>>> +#endif
>>>> +
>>>>        kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
>>>>        /* Do we need to modify the LPCR? */
>>>>
>>>>
>>>> CONFIG_VALGRIND_H needs 'valgrind-devel´ installed.
>>>>
>>>> I agree that this "Valgrind is complaining about variable initialization" is a whack-a-mole
>>>> situation that will keep happening in the future if we keep adding this same code pattern
>>>> (passing as reference an uninitialized var). For now, given that we have only 4 instances
>>>> to fix it in ppc code (as far as I'm aware of), and we don't have a better way of telling
>>>> Valgrind that we know what we're doing, I think we're better of initializing these vars.
>>>
>>> I would instead put this annotation inside kvm_get_one_reg, so that it covers all kvm hosts.  But it's too late to do this for 7.0.
>>
>> I wasn't planning on pushing these changes for 7.0 since they aren't fixing mem
>> leaks or anything really bad. It's more of a quality of life improvement when
>> using Valgrind.
>>
>> I also tried to put this annotation in kvm_get_one_reg() and it didn't solve the
>> warning.
> 
> That's weird, I'm pretty sure that should work.  I'd double check to
> make sure you had all the parameters right (e.g. could you have marked
> the pointer itself as initialized, rather than the memory it points
> to).


You're right. I got confused with different setups here and there and thought that
it didn't work.

I sent a patch to kvm-all.c that tries to do that:


https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00507.html


As for this series, for now I'm willing to take it since it improves the situation with
simple initializations. We can reconsider it if we make good progress through the common
code. At any rate these are 7.1 patches, so we have time.



Thanks,


Daniel



> 
>> I didn't find a way of telling Valgrind "consider that every time this
>> function is called with parameter X it initializes X". That would be a good solution
>> to put in the common KVM files and fix the problem for everybody.
>>
>>
>> Daniel
>>
>>
>>
>>>
>>>
>>> r~
>>
> 

