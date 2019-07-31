Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C8C7C165
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 14:32:44 +0200 (CEST)
Received: from localhost ([::1]:40540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsnmd-0006jR-TU
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 08:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34190)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hsnm7-0006FJ-Ow
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 08:32:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hsnm6-000642-Kg
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 08:32:11 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53628)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hsnm6-00063D-F2
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 08:32:10 -0400
Received: by mail-wm1-f67.google.com with SMTP id x15so60652482wmj.3
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 05:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=piBqViNj5aiB48a8+E54EeLVhMXIbc+xWJcJdyIBVRU=;
 b=bsWw9cQm5jxAXk/5QQfljfK91VAgbWiD6ZL6/0cdXQVvBmDeY6EGd+Lgdn1BYentaf
 0glKKZ7Vm8N6zo/pWCbNe7mIBZYKMNijJnWe+at4lfyJnFZo6na6Uogcu9Iku2SwRpoN
 t7KCDjuGiSF6/yFHQfgn+VBPBeUUaYR5J+qv/FUee6uF5yWl5sxL5p/huglpyyaKLvsC
 rJZ0McHC7c7xJV6f+FUFaS9QIO1xWJZALKXVEKq7Vn03LJZYiEQIAGoVmxcD0VTWi8P5
 +32Eo69u51MNF/PtnbfT4q+Dyl1gk3DtIT0hfMjgWbQz7D3u0HsWBczdS2LYkSmFoQzp
 /A9w==
X-Gm-Message-State: APjAAAXKXnnXLqwc1Lgw5sh2rwrm73pTfw6b1A4VT45SisDHteo645p9
 aPwThr6KGTNAcjHvDsCBg0tTtA==
X-Google-Smtp-Source: APXvYqxDwbqMowdTxUGOO/zJ1b5eZ6/+R1PBgjWPGyp7OZCh+kRuXlsNV/ubjRsD+DSZFNBVLs9Lcw==
X-Received: by 2002:a1c:988a:: with SMTP id
 a132mr108312390wme.165.1564576328381; 
 Wed, 31 Jul 2019 05:32:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:91e7:65e:d8cd:fdb3?
 ([2001:b07:6468:f312:91e7:65e:d8cd:fdb3])
 by smtp.gmail.com with ESMTPSA id b8sm62042864wrr.43.2019.07.31.05.32.07
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 05:32:07 -0700 (PDT)
To: Christophe de Dinechin <dinechin@redhat.com>, qemu-devel@nongnu.org
References: <1564502498-805893-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1564502498-805893-4-git-send-email-andrey.shinkevich@virtuozzo.com>
 <7a78ef04-4120-20d9-d5f4-6572c5676344@redhat.com>
 <dc9c2e70-c2a6-838e-f191-1c2787e244f5@de.ibm.com> <m136imo9ps.fsf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <038487b3-0b39-0695-7ef7-ede1b3143ad1@redhat.com>
Date: Wed, 31 Jul 2019 14:32:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <m136imo9ps.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH 3/3] i386/kvm: initialize struct at full
 before ioctl call
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
Cc: vsementsov@virtuozzo.com, berto@igalia.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, mtosatti@redhat.com, mdroth@linux.vnet.ibm.com,
 armbru@redhat.com, kvm@vger.kernel.org, den@openvz.org,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/07/19 11:05, Christophe de Dinechin wrote:
> 
> Christian Borntraeger writes:
> 
>> On 30.07.19 18:44, Philippe Mathieu-Daudé wrote:
>>> On 7/30/19 6:01 PM, Andrey Shinkevich wrote:
>>>> Not the whole structure is initialized before passing it to the KVM.
>>>> Reduce the number of Valgrind reports.
>>>>
>>>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>>> ---
>>>>  target/i386/kvm.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
>>>> index dbbb137..ed57e31 100644
>>>> --- a/target/i386/kvm.c
>>>> +++ b/target/i386/kvm.c
>>>> @@ -190,6 +190,7 @@ static int kvm_get_tsc(CPUState *cs)
>>>>          return 0;
>>>>      }
>>>>
>>>> +    memset(&msr_data, 0, sizeof(msr_data));
>>>
>>> I wonder the overhead of this one...
>>
>> Cant we use designated initializers like in
>>
>> commit bdfc8480c50a53d91aa9a513d23a84de0d5fbc86
>> Author:     Christian Borntraeger <borntraeger@de.ibm.com>
>> AuthorDate: Thu Oct 30 09:23:41 2014 +0100
>> Commit:     Paolo Bonzini <pbonzini@redhat.com>
>> CommitDate: Mon Dec 15 12:21:01 2014 +0100
>>
>>     valgrind/i386: avoid false positives on KVM_SET_XCRS ioctl
>>
>> and others?
>>
>> This should minimize the impact.
> 
> Oh, when you talked about using designated initializers, I thought you
> were talking about fully initializing the struct, like so:

Yeah, that would be good too.  For now I'm applying Andrey's series though.

Paolo

> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index dbbb13772a..3533870c43 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -180,19 +180,20 @@ static int kvm_get_tsc(CPUState *cs)
>  {
>      X86CPU *cpu = X86_CPU(cs);
>      CPUX86State *env = &cpu->env;
> -    struct {
> -        struct kvm_msrs info;
> -        struct kvm_msr_entry entries[1];
> -    } msr_data;
>      int ret;
> 
>      if (env->tsc_valid) {
>          return 0;
>      }
> 
> -    msr_data.info.nmsrs = 1;
> -    msr_data.entries[0].index = MSR_IA32_TSC;
> -    env->tsc_valid = !runstate_is_running();
> +    struct {
> +        struct kvm_msrs info;
> +        struct kvm_msr_entry entries[1];
> +    } msr_data = {
> +        .info = { .nmsrs =  1 },
> +        .entries = { [0] = { .index = MSR_IA32_TSC } }
> +    };
> +     env->tsc_valid = !runstate_is_running();
> 
>      ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, &msr_data);
>      if (ret < 0) {
> 
> 
> This gives the compiler maximum opportunities to flag mistakes like
> initializing the same thing twice, and make it easier (read no smart
> optimizations) to initialize in one go. Moving the declaration past the
> 'if' also addresses Philippe's concern.
> 
>>>
>>>>      msr_data.info.nmsrs = 1;
>>>>      msr_data.entries[0].index = MSR_IA32_TSC;
>>>>      env->tsc_valid = !runstate_is_running();
>>>> @@ -1706,6 +1707,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>>>
>>>>      if (has_xsave) {
>>>>          env->xsave_buf = qemu_memalign(4096, sizeof(struct kvm_xsave));
>>>> +        memset(env->xsave_buf, 0, sizeof(struct kvm_xsave));
>>>
>>> OK
>>>
>>>>      }
>>>>
>>>>      max_nested_state_len = kvm_max_nested_state_length();
>>>> @@ -3477,6 +3479,7 @@ static int kvm_put_debugregs(X86CPU *cpu)
>>>>          return 0;
>>>>      }
>>>>
>>>> +    memset(&dbgregs, 0, sizeof(dbgregs));
>>>
>>> OK
>>>
>>>>      for (i = 0; i < 4; i++) {
>>>>          dbgregs.db[i] = env->dr[i];
>>>>      }
>>>
>>> We could remove 'dbgregs.flags = 0;'
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>
> 
> 
> --
> Cheers,
> Christophe de Dinechin (IRC c3d)
> 


