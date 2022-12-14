Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F964C716
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:29:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5P08-0003cD-1d; Wed, 14 Dec 2022 05:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p5P03-0003bZ-B9
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:28:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p5P00-0003TO-O1
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:28:30 -0500
Received: by mail-wr1-x429.google.com with SMTP id i7so4162820wrv.8
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 02:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=0EKtqkvg42HLbP5C2Rhh+MUdL25872DkpnqHFH2JHPI=;
 b=HUE3z2u9jQ/m5KCjrEEw97nhv3HTfZuzKdyMnUY/uVqAyK7YoX4OQmCq3FG3NWBJ/u
 nm944UH9/WnGwSa+95tpMjWzkaqTvQmcr5L8Qgiiu8SFMMcYL+/kqiGhgMXJoJQ5hd59
 FwWqdv0XCy5o2381d434Jan2iT4Q739a6u9kQ2A8IlrqprNArKr3ST6YE+zPD0ZDjzff
 /7AHMAd8ZfnaOxtrKU0j190xzZdQFyM7bw93jVRNOyJWyrOqBe7VpwD7qDeRjaX1LOlJ
 bAujIhq4Frh6OZHqTwlRWfKCiTe4ZcbyQNrD9e6IuUJEPsJxG1faqQqwPE8hJQ6SpWW7
 mZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0EKtqkvg42HLbP5C2Rhh+MUdL25872DkpnqHFH2JHPI=;
 b=fRZADM959lFClLFv7auMs3GVyRcfWDV1gK49B0cFoVs5cfdhy+NkPYtdSUgpFmpMUd
 qNMNipcXyZj3lBxo7S0VPzpEwrPtzWfa5lAffTleFuhqs6XAYHu/XUaDA9PIMCEv63IT
 8F9K0Qwf3zreOXQo54pvgiLFJteZWpegnl8N3eu5vb846j6Q1WI81MDvxw9AToZuqyAA
 kihdXXvlC14dZ0H009xZIdFRZS5n/HXZBkt8F9BcdGJx8U1mK9g5VmLovZetXUOPX2Qo
 CMnYAIyZXS0M5mQNef2u5J7j/wAAuJ4JPgrM3UqE+aSqXJBcxnGZGHjYxB1MVpfarJyv
 3atA==
X-Gm-Message-State: ANoB5pl4Cw0OEhSFA/CwohFENk439VrkbL0wH5J9m7AfhBpegO2YzhKM
 STu6ClUtf79M0CRhg6tOAJ0=
X-Google-Smtp-Source: AA0mqf79H0ydY7+XVs5Xi/CS5MHN34W0D7wLLjPlcD9/IGZDNwEbvseHymWQw7Zjc+RqguqfbC95AA==
X-Received: by 2002:adf:db02:0:b0:236:a6f4:bc4c with SMTP id
 s2-20020adfdb02000000b00236a6f4bc4cmr15318587wri.13.1671013706961; 
 Wed, 14 Dec 2022 02:28:26 -0800 (PST)
Received: from [10.95.114.11] (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id
 f7-20020adff987000000b0024242111a27sm2448483wrr.75.2022.12.14.02.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 02:28:26 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b2c05953-ad13-2396-0afa-ea88f0fa07e7@xen.org>
Date: Wed, 14 Dec 2022 10:28:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 16/22] i386/xen: handle VCPUOP_register_vcpu_info
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-17-dwmw2@infradead.org>
 <689e729a-3c5e-5380-c010-44ca37bf5497@xen.org>
 <bef87304e588ddce7753823d9a75a87a096b4ae8.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <bef87304e588ddce7753823d9a75a87a096b4ae8.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 13/12/2022 00:13, David Woodhouse wrote:
> On Mon, 2022-12-12 at 14:58 +0000, Paul Durrant wrote:
>> On 09/12/2022 09:56, David Woodhouse wrote:
>>> From: Joao Martins <
>>> joao.m.martins@oracle.com
>>>>
>>>
>>> Handle the hypercall to set a per vcpu info, and also wire up the
>>> default
>>> vcpu_info in the shared_info page for the first 32 vCPUs.
>>>
>>> To avoid deadlock within KVM a vCPU thread must set its *own*
>>> vcpu_info
>>> rather than it being set from the context in which the hypercall is
>>> invoked.
>>>
>>> Add the vcpu_info (and default) GPA to the vmstate_x86_cpu for
>>> migration,
>>> and restore it in kvm_arch_put_registers() appropriately.
>>>
>>> Signed-off-by: Joao Martins <
>>> joao.m.martins@oracle.com
>>>>
>>> Signed-off-by: David Woodhouse <
>>> dwmw@amazon.co.uk
>>>>
>>> ---
>>>    target/i386/cpu.h        |  2 ++
>>>    target/i386/kvm/kvm.c    | 19 +++++++++++
>>>    target/i386/machine.c    | 21 ++++++++++++
>>>    target/i386/trace-events |  1 +
>>>    target/i386/xen.c        | 74
>>> +++++++++++++++++++++++++++++++++++++---
>>>    target/i386/xen.h        |  1 +
>>>    6 files changed, 113 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>>> index c6c57baed5..109b2e5669 100644
>>> --- a/target/i386/cpu.h
>>> +++ b/target/i386/cpu.h
>>> @@ -1788,6 +1788,8 @@ typedef struct CPUArchState {
>>>    #endif
>>>    #if defined(CONFIG_KVM)
>>>        struct kvm_nested_state *nested_state;
>>> +    uint64_t xen_vcpu_info_gpa;
>>> +    uint64_t xen_vcpu_info_default_gpa;
>>>    #endif
>>>    #if defined(CONFIG_HVF)
>>>        HVFX86LazyFlags hvf_lflags;
>>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>>> index ebde6bc204..fa45e2f99a 100644
>>> --- a/target/i386/kvm/kvm.c
>>> +++ b/target/i386/kvm/kvm.c
>>> @@ -1811,6 +1811,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>>            has_msr_hv_hypercall = true;
>>>        }
>>>    
>>> +    env->xen_vcpu_info_gpa = UINT64_MAX;
>>> +    env->xen_vcpu_info_default_gpa = UINT64_MAX;
>>
>>
>> There was an INVALID_GPA definition for shared info. Looks like we
>> could use it here too.
> 
> There was, and I started trying to use it, but it fell foul of the "is
> this going to live in target/ or hw/ and who can include what from
> where?" and I decided to just use UINT64_MAX for now and keep typing.
> 
> That will work out in the end, I'm sure.

Hopefully 
https://lore.kernel.org/lkml/20221209023622.274715-1-yu.c.zhang@linux.intel.com/ 
will help.

> 
>> Some sanity checks wouldn't go a miss here...
>>
>> rvi.offset should:
>> a) be < TARGET_PAGE_SIZE, and
>> b) ba aligned to vcpu_info_t size
> 
> Ack.


