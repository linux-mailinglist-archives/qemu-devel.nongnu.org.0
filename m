Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB7E383AA4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:59:46 +0200 (CEST)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligan-0000uW-MW
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ligVi-0000LJ-Im
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:54:30 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ligVf-00074a-4U
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:54:29 -0400
Received: by mail-ed1-x52b.google.com with SMTP id df21so7753132edb.3
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qOOOA/Lay2yGrweBW6UHPmNG/LmFLNNmu2K4THXdPTY=;
 b=bIuMvFW9r6B2Mq5rCaBokc96j3QrGTjznuq2TwYSw5v6e3aBUhvVj7B9OXLdrjKSoD
 +E2lTHwcYjYc4C+3ULdB6uVyDYLqZXjuw6WAQjfhaXR+m4UVp+YwxTxQAuqbps2dAdIz
 qKMz9Z1c12uapU47Qk4JmkzP44SZ+dQIotj4/9lQxQfeXQMz8sheGUgA51ObGKhRNVrQ
 MKS1MmrSH/CYNO/ZekpUCAyQmZnSPCSO4cbnLfokSYmb9W9Bo8sFjEjgVlCLOf/ZgrfA
 kauYGOGlZMETol5v5+Ffs3C9lEvqHh8CwtrffZEezsgelGUPLaItUnv+ynvXbA3EDAoi
 UB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qOOOA/Lay2yGrweBW6UHPmNG/LmFLNNmu2K4THXdPTY=;
 b=GCXMqbmx8ZITiyq0o4YGG/H7VY7XZBSyaEXRuVvqjpQyoVlXq+xDLYS5XnpO+Yf9mb
 yeGDQw+Grzngh3mMgecpYDWBv9FgtKZDcGZR/SrhIamMq7L1z55wyIW3P0v59+6LSh8L
 5za6IbdLnzaou/hMvBUCDWJTh8qE6Byjuwxjc4y22+RmTksIZO3mcjvurAbhI8levV6J
 FvMQkR0ruKP8mSC2RFLVK6rlr4PwMN5sSF7jGUw+v4EsFZQ1LklGkVLDK60nXtS/TI1c
 gHv7dyKRWHD03Cyp4AKjKjY9N99IlPbfONPZtXeqKEru2v6GPAPBQyYE61PhTtTpSje7
 wKeA==
X-Gm-Message-State: AOAM5300eMI1//10fAxkEgtofxZjbIBk7lwieny+DOR6WdpdgeyJdnAc
 wHrHP87V7JVXQsFihV0t1LilW8qEWaSCfA==
X-Google-Smtp-Source: ABdhPJwzGRlNNz6bS3h2wmeAmXmiD3YkeNNVEF/76k4yL06GaBxVJn1UmjchV/SCwRWaaDzrcW1cxQ==
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr1170981edr.144.1621270465633; 
 Mon, 17 May 2021 09:54:25 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b9sm2676026edt.71.2021.05.17.09.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 09:54:24 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 7/7] target/xtensa: move non-HELPER functions
 to helper.c
To: Max Filippov <jcmvbkbc@gmail.com>
References: <20190114074855.16891-1-jcmvbkbc@gmail.com>
 <20190114074855.16891-8-jcmvbkbc@gmail.com>
 <CAAdtpL5NoHLoUZR6MQKMg92h=Cm-Fqyc+zJvXz-GWqbtobyu2A@mail.gmail.com>
 <CAMo8BfLotZPVu5XWZ=EKZPgW3yir1Fsddj31Q6jzGcYehhzGbQ@mail.gmail.com>
 <CAMo8Bf+zdmFgRgpq_kCi=jP0KDbHw=9+Ai_46i_Z8veek+qemg@mail.gmail.com>
 <c8189bc2-79e3-3b57-2f4a-54012ed6ebb7@amsat.org>
 <CAMo8BfKE_TQJ7FG9gYwstahO7z67voDsp9GJP8j5si=78z+1EA@mail.gmail.com>
 <CAMo8Bf+rUTKMsjyKJSi+zcmNvtwuGH+8KA5DLpdDR1=NR5hb1g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <583c9827-901f-67f1-004f-59c8310a92e5@amsat.org>
Date: Mon, 17 May 2021 18:54:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMo8Bf+rUTKMsjyKJSi+zcmNvtwuGH+8KA5DLpdDR1=NR5hb1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 5:35 PM, Max Filippov wrote:
> On Mon, May 17, 2021 at 8:25 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>>
>> On Mon, May 17, 2021 at 6:10 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> On 5/17/21 2:11 PM, Max Filippov wrote:
>>>> On Mon, May 17, 2021 at 4:50 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>>>>>
>>>>> Hi Philippe,
>>>>>
>>>>> On Sun, May 16, 2021 at 10:05 PM Philippe Mathieu-Daudé
>>>>> <philippe@mathieu-daude.net> wrote:
>>>>>>
>>>>>> Hi Max,
>>>>>>
>>>>>> On Mon, Jan 14, 2019 at 8:52 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>>>>>>>
>>>>>>> Move remaining non-HELPER functions from op_helper.c to helper.c.
>>>>>>> No functional changes.
>>>>>>>
>>>>>>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>>>>>>> ---
>>>>>>>  target/xtensa/helper.c    | 61 ++++++++++++++++++++++++++++++++++++++++++++---
>>>>>>>  target/xtensa/op_helper.c | 56 -------------------------------------------
>>>>>>>  2 files changed, 58 insertions(+), 59 deletions(-)
>>>>>>
>>>>>>> +void xtensa_cpu_do_unaligned_access(CPUState *cs,
>>>>>>> +                                    vaddr addr, MMUAccessType access_type,
>>>>>>> +                                    int mmu_idx, uintptr_t retaddr)
>>>>>>> +{
>>>>>>> +    XtensaCPU *cpu = XTENSA_CPU(cs);
>>>>>>> +    CPUXtensaState *env = &cpu->env;
>>>>>>> +
>>>>>>> +    if (xtensa_option_enabled(env->config, XTENSA_OPTION_UNALIGNED_EXCEPTION) &&
>>>>>>> +        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT)) {
>>>>>>
>>>>>> I know this is a simple code movement, but I wonder, what should
>>>>>> happen when there is
>>>>>> an unaligned fault and the options are disabled? Is this an impossible
>>>>>> case (unreachable)?
>>>>>
>>>>> It should be unreachable when XTENSA_OPTION_UNALIGNED_EXCEPTION
>>>>> is disabled. In that case the translation code generates access on aligned
>>>>> addresses according to the xtensa ISA, see the function
>>>>> gen_load_store_alignment in target/xtensa/translate.c
>>>>
>>>> There's also a case when both options are enabled, i.e. the
>>>> xtensa core has support for transparent unaligned access.
>>>> In that case the helper does nothing and the generic TCG
>>>> code is supposed to deal with the unaligned access correctly,
>>>
>>> IIRC we can simplify as:
>>>
>>> -- >8 --
>>> diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
>>> index eeffee297d1..6e8a6cdc99e 100644
>>> --- a/target/xtensa/helper.c
>>> +++ b/target/xtensa/helper.c
>>> @@ -270,13 +270,14 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
>>>      XtensaCPU *cpu = XTENSA_CPU(cs);
>>>      CPUXtensaState *env = &cpu->env;
>>>
>>> -    if (xtensa_option_enabled(env->config,
>>> XTENSA_OPTION_UNALIGNED_EXCEPTION) &&
>>> -        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT)) {
>>> -        cpu_restore_state(CPU(cpu), retaddr, true);
>>> -        HELPER(exception_cause_vaddr)(env,
>>> -                                      env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
>>> -                                      addr);
>>> -    }
>>> +    assert(xtensa_option_enabled(env->config,
>>> +                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));
>>
>> This part -- yes.
>>
>>> +    assert(!xtensa_option_enabled(env->config,
>>> XTENSA_OPTION_HW_ALIGNMENT));
>>
>> This part -- no, because the call to the TCGCPUOps::do_unaligned_access
>> is unconditional
> 
> Oh, I've checked get_alignment_bits and now I see that it's conditional.
> This change can be done then, but the translation part also needs to be changed
> to put MO_UNALN on cores with XTENSA_OPTION_HW_ALIGNMENT.

If you don't mind writing the patch, I'd prefer you do it because
you have a better understanding and will likely get it right, otherwise
I'll add it to my TODO and come back to it when other of my in-flight
series get merged :)

Regards,

Phil.

