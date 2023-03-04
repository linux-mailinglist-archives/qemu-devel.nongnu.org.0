Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D94B6AAA57
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 15:12:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYSbJ-0001V7-Sd; Sat, 04 Mar 2023 09:11:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pYSbI-0001Us-3H
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:11:04 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pYSbG-000401-C6
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:11:03 -0500
Received: by mail-pl1-x636.google.com with SMTP id a9so5588076plh.11
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 06:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677939060;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QAhbs9J0BYIWq0pB92VFIQ/ihobOfBkJ7O8nbefTO5s=;
 b=q0QFHx0HfFbJzgJW+WaAFkKVAeJt+XWDOqlRT0Q6ppfnAsJieofPzaL+NNjtSU/PV1
 qjxDjeez/sOr6oXPMJqF11SbqxTxxZJc5LZe/tbPENfTZpVusg3lEiVIie1CLsPD4m4d
 4kfi1S/quHD1AsG3Vy52P23GwfaN+cCDc3Y5aB53prmtOpmSa52/Z4mQdiuRORbO2sy9
 2icZcMXPxKw293cCfgZX1kY12Ro2LIuU1SutRIrRXXI+ADuUbtXwFvlIwvOsOL7oYGXZ
 AnjdPmpCk9Pkko5QM188JAal3GK2fxppOllYH4+kzIXaa4e4PQ1PIMKJ9WyHtzl2JEex
 Va/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677939060;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QAhbs9J0BYIWq0pB92VFIQ/ihobOfBkJ7O8nbefTO5s=;
 b=j1RJVfPo5my8q5RAjpqMYkNHMO5ifJX2bpfEtRjCy2Ui9LDFKpG0vCqv6BxySyn9ZQ
 GaryhdRpNd6Urq+znXKaBdJ3Aq6Ap7k0ZQbg0KrDXkRglNCvxlzoDl1LAKGdtrwCmDEu
 lsWOahpwGyNCnzudVXsx0obPD/kXuIuxjGXukPX2JOQ060/rSizjkp+CfcMarV7CL8f3
 lI7a3PS9aoIHUWW8x/YQ0hE1B/x2R2JUqE9woOAecQMUmw8KQAQwwgGp9go0VnVO9EsK
 pS0OOq0p2hjrbcc72srOAhyQ1az26E51u2jPJDt+FiEQd37Rvje0766H5JL0T8i+D8lY
 Of1A==
X-Gm-Message-State: AO0yUKWD06DG7CPxSjnHLk7IWcuO1S9+4x1H29H2acyYfn05qLmTn3RI
 eeIOOD/flJcAG3ZAy5ZMzDrwvcouOmuj7g==
X-Google-Smtp-Source: AK7set8fo83di/WTebBz5zvdsTCENs74lcpCsr4hTq6Tvvl6CCuLwahA1EWW+e/GTCUJUZlEiYpBnA==
X-Received: by 2002:a17:90a:fe8c:b0:237:64dc:4b65 with SMTP id
 co12-20020a17090afe8c00b0023764dc4b65mr5460743pjb.21.1677939060371; 
 Sat, 04 Mar 2023 06:11:00 -0800 (PST)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090a4e4a00b002371e2ac56csm3090655pjl.32.2023.03.04.06.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 06:10:59 -0800 (PST)
Message-ID: <71d9e801-80b2-d5ed-4c02-b328f0b175d4@gmail.com>
Date: Sat, 4 Mar 2023 21:10:54 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] apic: add support for x2APIC mode
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
 <20230221160500.30336-2-minhquangbui99@gmail.com>
 <20230224152932.1de436cb@imammedo.users.ipa.redhat.com>
 <ee3d42c1-9e52-57f9-eba8-a5dc3a45d14f@gmail.com>
 <20230227170759.12297901@imammedo.users.ipa.redhat.com>
 <f24683be-f3a7-34fe-279a-11d01e696bbc@gmail.com>
 <20230228173954.6a7b6c4f@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <20230228173954.6a7b6c4f@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.089,
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

On 2/28/23 23:39, Igor Mammedov wrote:
> On Tue, 28 Feb 2023 21:34:33 +0700
> Bui Quang Minh <minhquangbui99@gmail.com> wrote:
> 
>> On 2/27/23 23:07, Igor Mammedov wrote:
>>> On Sat, 25 Feb 2023 17:15:17 +0700
>>> Bui Quang Minh <minhquangbui99@gmail.com> wrote:
>>>    
>>>> On 2/24/23 21:29, Igor Mammedov wrote:
>>>>> On Tue, 21 Feb 2023 23:04:57 +0700
>>>>> Bui Quang Minh <minhquangbui99@gmail.com> wrote:
>>>>>       
>>>>>> This commit refactors APIC registers read/write function to support both
>>>>>> MMIO read/write in xAPIC mode and MSR read/write in x2APIC mode. Also,
>>>>>> support larger APIC ID, self IPI, new IPI destination determination in
>>>>>> x2APIC mode.
>>>>>>
>>>>>> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
>>>>>> ---
>>>>>>     hw/intc/apic.c                  | 211 +++++++++++++++++++++++++-------
>>>>>>     hw/intc/apic_common.c           |   2 +-
>>>>>>     include/hw/i386/apic.h          |   5 +-
>>>>>>     include/hw/i386/apic_internal.h |   2 +-
>>>>>>     4 files changed, 172 insertions(+), 48 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
>>>>>> index 2d3e55f4e2..205d5923ec 100644
>>>>>> --- a/hw/intc/apic.c
>>>>>> +++ b/hw/intc/apic.c
>>>>>> @@ -30,6 +30,7 @@
>>>>>>     #include "hw/i386/apic-msidef.h"
>>>>>>     #include "qapi/error.h"
>>>>>>     #include "qom/object.h"
>>>>>> +#include "tcg/helper-tcg.h"
>>>>>>     
>>>>>>     #define MAX_APICS 255
>>>>>
>>>>> I'm curious how does it work without increasing ^^^?
>>>>
>>>> Hmm, my commit message is not entirely correct. In this series, some
>>>> operations (send IPI, IPI destination determination) have been updated
>>>> to support x2APIC mode. However, the emulated APIC still doesn't support
>>>> APIC ID larger than 255 because currently, we use a fixed length (255 +
>>>> 1) array to manage local APICs. So to support larger APIC ID, I think we
>>>> need to find any way to manage those, as the possible allocated APIC ID
>>>> range is large and maybe the allocated APIC ID is sparse which makes
>>>> fixed length array so wasteful.
>>> how much sparse it is?
>>
>> As far as I know, QEMU allows to set CPU's APIC ID, so user can pass a
>> very sparse APIC ID array.
> 
> I don't think that it does permit this (if it does it's a bug that should be fixed).
> 
> As far as I'm aware QEMU derives apic_id from '-smp' and possibly cpu type
> (there was some differences between Intel and AMD in how apic id was encoded
> notably AMD having threads or cores that lead to sparse apic id), though I don't
> remember current state of affairs in x86 cpu topo code.
> 
>>> benefits of simple static array is simplicity in management and O(1) access time.
>>> QEMU does know in advance max apic id so we can size array by dynamically
>>> allocating it when 1st apic is created. Or if IDs are too sparse
>>> switch to another structure to keep mapping.
>>
>> I totally agree with this.
>>
>> I admit that my main focus on this series is to make x2APIC mode
>> function correctly with TCG accelerator, so I skip the part of extending
>> the support for higher APIC ID.
> the tricky part in such half approach is making sure that the code is
> 'correct' and won't lead to exploits.
> It would be easier to review if it was completed solution instead of partial.

I looked around and found the way to dynamically allocate local_apics array

	void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
	{
		if (!kvm_irqchip_in_kernel()) {
         		apic_set_max_apic_id(x86ms->apic_id_limit);
     		}

	}

We already calculated apic_id_limit before creating CPU and local APIC 
so we can use that number to dynamically allocated local_apics.

However, there are still problems while trying to extending support to 
APIC ID larger than 255 because there are many places assume APIC ID is 
8-bit long. One of that is interrupt remapping which returns 32-bit 
destination ID but uses MSI (which has 8-bit destination) to send to 
APIC. I will look more into this.

Thanks,
Quang Minh.

