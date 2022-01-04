Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D14B484908
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 20:58:17 +0100 (CET)
Received: from localhost ([::1]:47974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4pwl-000124-Kq
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 14:58:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4pum-0007iZ-HW; Tue, 04 Jan 2022 14:56:12 -0500
Received: from [2607:f8b0:4864:20::730] (port=43776
 helo=mail-qk1-x730.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4puk-0000Tp-IF; Tue, 04 Jan 2022 14:56:12 -0500
Received: by mail-qk1-x730.google.com with SMTP id f138so35938789qke.10;
 Tue, 04 Jan 2022 11:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hafsEJfMxFPS4MFMmIHjMn/kFX6/c5BraufvbaJmW6Y=;
 b=mvh2It0nb0AwXsYpDvDGSukhZZzBSCqBngZu2EEga30w3XeUYL9XyJA0YS6Pkx+Rjt
 B2RSg5CA2K/sH2TEOalHL50+liEtxDcKfezqZAXhqWiCnAsy3wL52c0zd31wygPMpSPQ
 34DgPr+8Jh2kJ1Jm+SS8lMOA0SaTJRC7cDkRXcVaQqw51Ydx826tEel3CSvz9o1KP3l7
 2TWuNDT7H45hJJ0VNgyy4vDAtFumYPvQgrsRarL/uDBSimHbsFZAbla/MnYPerg92ogJ
 e6hlgqJs7oAl6Z3x8np1BuaZSXKYU49Jc0m+2iJ/e+WXLaErKqyM4L0fyeHv81qlAn8E
 Jjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hafsEJfMxFPS4MFMmIHjMn/kFX6/c5BraufvbaJmW6Y=;
 b=3se/juhb4lKWwrX5Fyr9saJxzcnI4rHi2Q3vM/ekG58y3i70lPs0hHKyf7uGjraQ1M
 lVo9LRGVHxxwgIqy92L3MZmwCsGXxB4mpsNqDONKM4GVbj6znhMAsBNnJ59dkxqdb1Bq
 gSXsA7LHGKPHL3+6K69gaqr4ve7aKFPYuVvLrpUF7xxpvhISPUfegvAbEdPZpci7xDww
 xPCGinildEKPhYHZTq9LbqZS9K11+BOjGOO5arpX/pZIMaQnC8TNbYkdbu28deis0Vk9
 ExpWpu69j54yk9QPbh/+mMaPfd0ukLhTg8IZ9GypaXSsZijCiE4YWzt1wVqDcKemYmID
 kXfg==
X-Gm-Message-State: AOAM5303jdPsrHbKJZR1rkKH7Rqjq5xSpkhwmA984yByTcbEW3K66KUu
 e/OVaf/CU/8tYNuqt9vAxvI=
X-Google-Smtp-Source: ABdhPJxflWoncQHR0bMjE4EuxK3l/xLFZdZSnw+MrDRg9TWn4lwwKpFOX4iLALltrX8YyfDZCurXWA==
X-Received: by 2002:a05:620a:15ec:: with SMTP id
 p12mr76017qkm.489.1641326169287; 
 Tue, 04 Jan 2022 11:56:09 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id i6sm32872720qkn.26.2022.01.04.11.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 11:56:09 -0800 (PST)
Message-ID: <fc7a604b-ca56-510d-e0c9-ec6dee4d0261@gmail.com>
Date: Tue, 4 Jan 2022 16:56:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/3] Reorg ppc64 pmu insn counting
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
 <1b988844-075d-beb3-7fd1-a26f30e9f5dc@gmail.com> <87fsq4dfck.fsf@linaro.org>
 <328302bb-b916-8d13-70e6-e6f88b0745db@gmail.com> <875yqzn56l.fsf@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <875yqzn56l.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::730
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/4/22 07:32, Alex Bennée wrote:
> 
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> On 1/3/22 12:07, Alex Bennée wrote:
>>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>>
>>>> On 12/23/21 00:01, Richard Henderson wrote:
>>>>> In contrast to Daniel's version, the code stays in power8-pmu.c,
>>>>> but is better organized to not take so much overhead.
>>>>> Before:
>>>>>        32.97%  qemu-system-ppc  qemu-system-ppc64   [.] pmc_get_event
>>>>>        20.22%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc
>>>>>         4.52%  qemu-system-ppc  qemu-system-ppc64   [.] hreg_compute_hflags_value
>>>>>         3.30%  qemu-system-ppc  qemu-system-ppc64   [.] helper_lookup_tb_ptr
>>>>>         2.68%  qemu-system-ppc  qemu-system-ppc64   [.] tcg_gen_code
>>>>>         2.28%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
>>>>>         1.84%  qemu-system-ppc  qemu-system-ppc64   [.] pmu_insn_cnt_enabled
>>>>> After:
>>>>>         8.42%  qemu-system-ppc  qemu-system-ppc64   [.]
>>>>> hreg_compute_hflags_value
>>>>>         6.65%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
>>>>>         6.63%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc
>>>>>
>>>>
>>>> Thanks for looking this up. I had no idea the original C code was that slow.
>>>>
>>> <snip>
>>>>
>>>> With that in mind I decided to post a new version of my TCG rework, with less repetition and
>>>> a bit more concise, to have an alternative that can be used upstream to fix the Avocado tests.
>>>> Meanwhile I'll see if I can get your reorg working with all EBB tests we need. All things
>>>> equal - similar performance, all EBB tests passing - I'd rather stay with your C code than my
>>>> TCG rework since yours doesn't rely on TCG Ops knowledge to maintain
>>>> it.
>>> Reading this series did make me wonder if we need a more generic
>>> service
>>> from the TCG for helping with "internal" instrumentation needed for
>>> things like decent PMU emulation. We haven't gone as much for it in ARM
>>> yet but it would be nice to. It would be even nicer if such a facility
>>> could be used by stuff like icount as well so we don't end up doing the
>>> same thing twice.
>>
>> Back in May 2021 when I first starting working on this code I tried to base myself in the
>> ARM PMU code. In fact, the cycle and insn calculation done in the very first version of
>> this work was based on what ARM does in target/arm/helper.c, cycles_get_count() and
>> instructions_get_count(). The cycle calculation got simplified because our PPC64 CPU
>> has a 1Ghz clock so it's easier to just consider 1ns = 1 cycle.
>>
>> For instruction count, aside from my 2-3 weeks of spectacular failures trying to count
>> instructions inside translate.c, I also looked into how TCG plugins work and tried to do
>> something similar to what plugin_gen_tb_end() does at the end of the translator_loop()
>> in accel/tcg/translator.c. For some reason I wasn't able to replicate the same behavior
>> that I would have if I used the TCG plugin framework in the
>> 'canonical' way.
> 
> plugin_gen_tb_end is probably overkill because we should already know
> how many instructions there are in a translated block on account of the
> insn_start and insn_end ops that mark them. In fact see gen_tb_end()
> which is where icount updates the value used in the decrement at the
> start of each block. Assuming no synchronous exceptions occur you could
> just increment a counter at the end of the block as no async IRQs will
> occur until we have executed all of those instructions.
> 
> Of course it's never quite so simple and when running in full icount
> mode we have to take into account exceptions that can be triggered by IO
> accesses. This involves doing a re-translation to ensures the IO
> instruction is always the last we execute.
> 
> I'm guessing for PMU counters to be somewhat correct we would want to
> ensure updates throughout the block (before each memory op and helper
> call). This would hopefully avoid the cost of "full" icount support
> which is only single threaded. However this is the opposite to icount's
> budget and pre-decrement approach which feels messier than it could be.


What about cycle counting without icount? With icount is a rather simple matter
of making some assumptions about the CPU freq and relying on the shift parameter
to have a somewhat good precision. Without icount the cycle count, at least in
the current implementation in the ppc64 PMU, is erratic.

The problem is that, at least as far as I've read pSeries and powernv code (guest
and bare metal IBM Power emulation), the CPU freq is a 1Ghz that we write in
the FDT and do nothing else with it. We do not enforce (or throttle) the CPU freq
in the emulation. A quick look into ARM code also seems to do similar assumptions:


static uint64_t cycles_get_count(CPUARMState *env)
{
#ifndef CONFIG_USER_ONLY
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
                    ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
#else
     return cpu_get_host_ticks();
#endif
}

#ifndef CONFIG_USER_ONLY
static int64_t cycles_ns_per(uint64_t cycles)
{
     return (ARM_CPU_FREQ / NANOSECONDS_PER_SECOND) * cycles;
}


$ git grep 'ARM_CPU_FREQ'
target/arm/helper.c:#define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
target/arm/helper.c:                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
target/arm/helper.c:    return (ARM_CPU_FREQ / NANOSECONDS_PER_SECOND) * cycles;


But I digress. Having a generic way of counting instruction across all the boards would
be a fine improvement. cycle calculation can wait.


> 
>> I ended up doing something similar to what instructions_get_count() from ARM does, which
>> relies on icount. Richard then aided me in figuring out that I could count instructions
>> directly by tapping into the end of each TB.
> 
> instructions_get_count will also work without icount but is affected by
> wall clock time distortions in that case.
> 
>> So, for a generic service of sorts I believe it would be nice to re-use the TCG plugins
>> API in the internal instrumentation (I tried it once, failed, not sure if I messed up
>> or it's not possible ATM). That would be a good start to try to get all this logic in a
>> generic code for internal translate code to use.
> 
> Agreed - although the plugin specific stuff is really just focused on
> our limited visibility API. Unless you are referring to
> accel/tcg/plugin-gen.c which are just helpers for manipulating the TCG
> ops after the initial translation.


TCG plug-ins came to mind because they operate like generic APIs that can be used across
multiple archs, but any way of putting generic instrumentation code that can be used internally
everywhere would do. TCG plug-ins seems to be a good candidate for that since the infrastructure
is already in place.


Thanks,


Daniel

> 

