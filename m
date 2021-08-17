Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C893EE9F2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:33:20 +0200 (CEST)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvTD-0003Rq-N6
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mFvQi-0000UY-TI; Tue, 17 Aug 2021 05:30:44 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:38434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mFvQg-0000ac-JF; Tue, 17 Aug 2021 05:30:44 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id bl13so10801540qvb.5;
 Tue, 17 Aug 2021 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JXv8U9ZxtDT92rL8b+MEwckSSJbhHXDuKLpwhcClDO0=;
 b=hKDnbZKF60EDYisXMjBLlb1vCC7F8DRs4MTjOI58tEanto9KkUujniilvwEEmxcErB
 C9ytVXPeFf9KnYwXT8J+OXwT6G9KfNjQnEAieKEOOUhhjGNXWRXgJIjrrDdeQPa3Is0o
 xhu4FivpyYsofcOOxb4H67plo8dts7EiHXxYcXLE+tdq8/I2f5xO24jZ1YyXys1ZpPjT
 aSgvHAocS9Kmkn5ubYeRFbe3hqmQbAxgzgmi2NYMAnMBl/CvC9j0LKxFAzslDuU28IKC
 Okk4WRJ4pF/7ShYgMZkVaap74fj69WQVCBsiQ25xDeYOM4icJcA5UmCU1pArtQhrWkAz
 qsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JXv8U9ZxtDT92rL8b+MEwckSSJbhHXDuKLpwhcClDO0=;
 b=RPN9PU08W3avk+b1T09R/L04dm5CDtU5zUdByzbnZ11jgOsMJ3WK6xDX7/bVvZPtWR
 XB+x9h2+v+LIFZj9r28BOfJliUQqTBnQ/qPGpeGk7mwjx+sbef/LzEeDqQXEDamhY6Aj
 pK2WnPyVoZNWX23nwxmGqLpaPkwE/1HMYewXO7mbVyZDbrMvxdVTBmFd0FIlrnRpBWf3
 Qq7xROTyUKoIz3TujSMKtQ8c8YlQq8gMIOLaKXDENx6Mm1yUeDKEKorL9L6gjg2qgiNp
 dwSS3TLJFmsesvKUaaMRy3+K1hZBxpXt58iq6G+BhffShXdqHVwQu8lErGzpfObNlfZw
 m2uQ==
X-Gm-Message-State: AOAM533G0IPZlRvh47CcENvd00F/Rk6veTAPwBeak53b4WPGz/qraCsn
 KET8kNCe0q7Iom9ppynAwAo=
X-Google-Smtp-Source: ABdhPJwzbkxYIgc7vzMQ8gUxctaF39Sj2SyEcu9NLR99uhChiUzf3KzyNAI5Y0mE5A/R5+HgyJ8Uww==
X-Received: by 2002:a0c:fad2:: with SMTP id p18mr2373974qvo.3.1629192641235;
 Tue, 17 Aug 2021 02:30:41 -0700 (PDT)
Received: from [192.168.10.222] ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id h16sm705977qtx.23.2021.08.17.02.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 02:30:40 -0700 (PDT)
Subject: Re: [PATCH 04/19] target/ppc: PMU Book3s basic insns count for
 pseries TCG
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-5-danielhb413@gmail.com> <YRH05uCNwvjS5Nws@yekko>
 <7937bc84-b516-ee7b-296d-2a38191dc056@gmail.com> <YRsmEN2C3LDInZyS@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <729ff025-ca1e-21ce-0683-5bac9d138292@gmail.com>
Date: Tue, 17 Aug 2021 06:30:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRsmEN2C3LDInZyS@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/16/21 11:59 PM, David Gibson wrote:
> On Mon, Aug 16, 2021 at 02:53:13PM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 8/10/21 12:39 AM, David Gibson wrote:
>>> On Mon, Aug 09, 2021 at 10:10:42AM -0300, Daniel Henrique Barboza wrote:
>>>> The PMCC (PMC Control) bit in the MMCR0 register controls whether the
>>>> counters PMC5 and PMC6 are being part of the performance monitor
>>>> facility in a specific time. If PMCC allows it, PMC5 and PMC6 will
>>>> always be used to measure instructions completed and cycles,
>>>> respectively.
>>>>
>>>> This patch adds the barebones of the Book3s PMU logic by enabling
>>>> instruction counting, using the icount framework, using the performance
>>>> monitor counters 5 and 6. The overall logic goes as follows:
>>>>
>>>> - a helper is added to control the PMU state on each MMCR0 write. This
>>>> allows for the PMU to start/stop as quick as possible;
>>>
>>> Um.. why does a helper accomplish that goal?
>>>
>>>>
>>>> - only PMC5 and PMC6 are being set. PMC6 (cycles) is default to 4*insns
>>>> (for cycles per instruction) for now;
>>>
>>> What's the justification for that value?  With a superscalar core, I'd
>>> expect average (median) cycles per instruction to be < 1 a lot of the
>>> time.  Mean cycles per instruction could be higher since certain
>>> instructions could take a lot.
>>>
>>>> - the intended usage is to freeze the counters by setting MMCR0_FC, do
>>>> any additional setting via MMCR1 (not implemented yet) and setting
>>>> initial counter values,  and enable the PMU by zeroing MMCR0_FC. Software
>>>> must freeze counters to read the results - on the fly reading of the PMCs
>>>> will return the starting value of each one.
>>>
>>> Is that the way hardware behaves?  Or is it just a limitation of this
>>> software implementation?  Either is fine, we should just be clear on
>>> what it is.
>>>
>>>>
>>>> Since there will be more PMU exclusive code to be added next, let's also
>>>> put the PMU logic in its own helper to keep all in the same place. The
>>>> code is also repetitive and not really extensible to add more PMCs, but
>>>> we'll handle this in the next patches.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>    target/ppc/cpu.h               |  4 ++
>>>>    target/ppc/cpu_init.c          |  4 +-
>>>>    target/ppc/helper.h            |  1 +
>>>>    target/ppc/meson.build         |  1 +
>>>>    target/ppc/pmu_book3s_helper.c | 78 ++++++++++++++++++++++++++++++++++
>>>>    target/ppc/translate.c         | 14 ++++--
>>>>    6 files changed, 97 insertions(+), 5 deletions(-)
>>>>    create mode 100644 target/ppc/pmu_book3s_helper.c
>>>>
>>>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>>>> index 4d96015f81..229abfe7ee 100644
>>>> --- a/target/ppc/cpu.h
>>>> +++ b/target/ppc/cpu.h
>>>> @@ -1175,6 +1175,10 @@ struct CPUPPCState {
>>>>        uint32_t tm_vscr;
>>>>        uint64_t tm_dscr;
>>>>        uint64_t tm_tar;
>>>> +
>>>> +    /* PMU registers icount state */
>>>> +    uint64_t pmc5_base_icount;
>>>> +    uint64_t pmc6_base_icount;
>>>>    };
>>>>    #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
>>>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>>>> index 71062809c8..fce89ee994 100644
>>>> --- a/target/ppc/cpu_init.c
>>>> +++ b/target/ppc/cpu_init.c
>>>> @@ -6822,7 +6822,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
>>>>        spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
>>>>                         SPR_NOACCESS, SPR_NOACCESS,
>>>>                         &spr_read_pmu_generic, &spr_write_pmu_generic,
>>>> -                     KVM_REG_PPC_MMCR0, 0x00000000);
>>>> +                     KVM_REG_PPC_MMCR0, 0x80000000);
>>>>        spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
>>>>                         SPR_NOACCESS, SPR_NOACCESS,
>>>>                         &spr_read_pmu_generic, &spr_write_pmu_generic,
>>>> @@ -6870,7 +6870,7 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>>>>        spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
>>>>                     &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>>>>                     &spr_read_ureg, &spr_write_ureg,
>>>> -                 0x00000000);
>>>> +                 0x80000000);
>>>>        spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
>>>>                     &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>>>>                     &spr_read_ureg, &spr_write_ureg,
>>>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>>>> index 4076aa281e..5122632784 100644
>>>> --- a/target/ppc/helper.h
>>>> +++ b/target/ppc/helper.h
>>>> @@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
>>>>    DEF_HELPER_1(hrfid, void, env)
>>>>    DEF_HELPER_2(store_lpcr, void, env, tl)
>>>>    DEF_HELPER_2(store_pcr, void, env, tl)
>>>> +DEF_HELPER_2(store_mmcr0, void, env, tl)
>>>>    #endif
>>>>    DEF_HELPER_1(check_tlb_flush_local, void, env)
>>>>    DEF_HELPER_1(check_tlb_flush_global, void, env)
>>>> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
>>>> index b85f295703..bf252ca3ac 100644
>>>> --- a/target/ppc/meson.build
>>>> +++ b/target/ppc/meson.build
>>>> @@ -14,6 +14,7 @@ ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
>>>>      'int_helper.c',
>>>>      'mem_helper.c',
>>>>      'misc_helper.c',
>>>> +  'pmu_book3s_helper.c',
>>>>      'timebase_helper.c',
>>>>      'translate.c',
>>>>    ))
>>>> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
>>>> new file mode 100644
>>>> index 0000000000..fe16fcfce0
>>>> --- /dev/null
>>>> +++ b/target/ppc/pmu_book3s_helper.c
>>>
>>> I'd prefer to call this just book3s_pmu.c.  Or better yet
>>> "powerX_pmu.c", where X is the specific PMU model you're implementing
>>> since IIRC the particulars of the PMU vary quite a lot from POWER7
>>> through to POWER10.
>>
>> I'll go with book3s_pmu.c because this PMU implementation will not go
>> deep enough to touch the differences between POWER processors.
> 
> I think you are mistaken.
> 
>> The only aspects that will be implementation specific will be 2 perf
>> events (0x2 and 0x1E) that the kernel has been using for a long time
>> and only recently migrated to architected events. We'll support all
>> architected events that are related to those events so that newer
>> kernels - and other non-IBM processors - will use the PMU without
>> the need of having to know about 0x2 and 0x1E.
> 
> So, possibly in the last few POWER chips, the only differences are the
> table of event keys.  That is definitely not the case for the whole
> POWER line though.  I remember from my time at IBM, the PMU underwent
> huge changes much deeper than the event table.  Some had different
> numbers of PMCs, different bit fields in the MMCRs, different methods
> of event selection (in some cases through insanely compplex chains of
> multiplexers).  And everything from POWER4 onwards could reasonably be
> described as "book3s".  So we definitely need a different
> name... working out what it should be is harder though.
> 
> If the modern core structure of the PMU got codified in a particular
> BookS architecture version we could name it after that version, maybe?


What about just 'pmu_helper.c'? That way we can have a file with most of
the PMU logic contained in it, without implying nothing about the support
with the filename alone. If time goes by and more specialized coded starts
to being added in there (code like "this helper implements something that
is only valid in PPC chip X") then we can split into more specific files.

Yet another alternative in line with what you suggested could be
"power9_pmu.c", perhaps even "power8_pmu.c". The chip version would mean
"the oldest IBM TCG PPC64 chip that we tested with this PMU code". I'm
testing with POWER9 most of the time, POWER10 works fine, so 'power9_pmu.c'
is viable. I can do some tests with POWER8 to see how it goes. I'm not
sure if it's worth the trouble testing with anything older than P8 though.


Thanks,


Daniel

> 

