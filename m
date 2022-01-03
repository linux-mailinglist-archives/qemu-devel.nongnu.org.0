Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4AD4836A6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 19:12:32 +0100 (CET)
Received: from localhost ([::1]:33438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Rot-0001gx-Oe
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 13:12:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4Riy-0003uq-Eh; Mon, 03 Jan 2022 13:06:24 -0500
Received: from [2607:f8b0:4864:20::832] (port=41925
 helo=mail-qt1-x832.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4Riw-0006Js-Ip; Mon, 03 Jan 2022 13:06:24 -0500
Received: by mail-qt1-x832.google.com with SMTP id v22so31144349qtx.8;
 Mon, 03 Jan 2022 10:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vgUk+oikDOxm67EJu9UHNmpsABAWB0ELrKC4G62glVE=;
 b=jnQ4wuc4xLN0hdWb/8/h9q+uwMaoU18FmcapRtqB6fzKQx3miDXq1IM8M/lkbFWQwZ
 siG0ML2LR03B3rC7yphgKnBu36s+C9InK3XQl0EhqatVLX5byVXzSAvTWih8/jTDADrh
 nAvc82i4MayklyJfdd15GFhuGBLDNOfatlmbN3Ox1Ar9yoPvgOYKiDLojbZX3J0XNhjm
 u9/oqbW0LlcauCNgu2VzLRrMtHAWwo0By/HKVf1rn5Ki5hMDSiyN8et/2L5jfK/ebWVU
 end2CtwIfGTZk+CvGDVCO+UrrxtS2+pPDSAVgLzPep3f1aEF/spZCM9oGhuKX7lj95kL
 VUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vgUk+oikDOxm67EJu9UHNmpsABAWB0ELrKC4G62glVE=;
 b=QH8cvBIlR9vyRT7TSNzWnePEANViTvAnrpV4zxIhjROUxhF0A0zcotSkFQzU4vv8bD
 W6GFrigrPPVnOq4HLtT6WoDTjEW3I2JEETZKcNyThNPhwC3XnDal3tfUi6oTz97L/UKt
 zTsjd0Y12T9VIeBiw0Kx5XRvQKMKWWQRLdGWnZVJYBXsQrqkGsPq0xze2pe3tMBGi2LU
 m8+JBwKfsvX3gV5H3ZkXr4iladPvD5kiNOpmLLBZsg8pDaix+fQppp5NwcPy10T6XqZo
 VbVnyc7dVmYXncsvhLTmdtjN7LuxjM+L4sFzOt53s5nsBQVRWHVnwLrmdxge9pSS3kDd
 Y+JQ==
X-Gm-Message-State: AOAM531IF8cHCngPnwUksQMYkibT960cgPe+1bKMiRogfDn0G3vv4vT1
 XzmjSJzJfzgaaXwekolF30+g/V/Yh10=
X-Google-Smtp-Source: ABdhPJxaFU2+l+k3ZZe9CzVDdkj0Ays8yghNwlP1VdQVZZy/Byl88hAOyA8mPd+Uih/LW4D78W4Sqg==
X-Received: by 2002:ac8:5842:: with SMTP id h2mr40967203qth.244.1641233181326; 
 Mon, 03 Jan 2022 10:06:21 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id i6sm29683321qkn.26.2022.01.03.10.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 10:06:21 -0800 (PST)
Message-ID: <328302bb-b916-8d13-70e6-e6f88b0745db@gmail.com>
Date: Mon, 3 Jan 2022 15:06:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/3] Reorg ppc64 pmu insn counting
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
 <1b988844-075d-beb3-7fd1-a26f30e9f5dc@gmail.com> <87fsq4dfck.fsf@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87fsq4dfck.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::832
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x832.google.com
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



On 1/3/22 12:07, Alex Bennée wrote:
> 
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> On 12/23/21 00:01, Richard Henderson wrote:
>>> In contrast to Daniel's version, the code stays in power8-pmu.c,
>>> but is better organized to not take so much overhead.
>>> Before:
>>>       32.97%  qemu-system-ppc  qemu-system-ppc64   [.] pmc_get_event
>>>       20.22%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc
>>>        4.52%  qemu-system-ppc  qemu-system-ppc64   [.] hreg_compute_hflags_value
>>>        3.30%  qemu-system-ppc  qemu-system-ppc64   [.] helper_lookup_tb_ptr
>>>        2.68%  qemu-system-ppc  qemu-system-ppc64   [.] tcg_gen_code
>>>        2.28%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
>>>        1.84%  qemu-system-ppc  qemu-system-ppc64   [.] pmu_insn_cnt_enabled
>>> After:
>>>        8.42%  qemu-system-ppc  qemu-system-ppc64   [.]
>>> hreg_compute_hflags_value
>>>        6.65%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
>>>        6.63%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc
>>>
>>
>> Thanks for looking this up. I had no idea the original C code was that slow.
>>
> <snip>
>>
>> With that in mind I decided to post a new version of my TCG rework, with less repetition and
>> a bit more concise, to have an alternative that can be used upstream to fix the Avocado tests.
>> Meanwhile I'll see if I can get your reorg working with all EBB tests we need. All things
>> equal - similar performance, all EBB tests passing - I'd rather stay with your C code than my
>> TCG rework since yours doesn't rely on TCG Ops knowledge to maintain
>> it.
> 
> Reading this series did make me wonder if we need a more generic service
> from the TCG for helping with "internal" instrumentation needed for
> things like decent PMU emulation. We haven't gone as much for it in ARM
> yet but it would be nice to. It would be even nicer if such a facility
> could be used by stuff like icount as well so we don't end up doing the
> same thing twice.

Back in May 2021 when I first starting working on this code I tried to base myself in the
ARM PMU code. In fact, the cycle and insn calculation done in the very first version of
this work was based on what ARM does in target/arm/helper.c, cycles_get_count() and
instructions_get_count(). The cycle calculation got simplified because our PPC64 CPU
has a 1Ghz clock so it's easier to just consider 1ns = 1 cycle.

For instruction count, aside from my 2-3 weeks of spectacular failures trying to count
instructions inside translate.c, I also looked into how TCG plugins work and tried to do
something similar to what plugin_gen_tb_end() does at the end of the translator_loop()
in accel/tcg/translator.c. For some reason I wasn't able to replicate the same behavior
that I would have if I used the TCG plugin framework in the 'canonical' way.

I ended up doing something similar to what instructions_get_count() from ARM does, which
relies on icount. Richard then aided me in figuring out that I could count instructions
directly by tapping into the end of each TB.

So, for a generic service of sorts I believe it would be nice to re-use the TCG plugins
API in the internal instrumentation (I tried it once, failed, not sure if I messed up
or it's not possible ATM). That would be a good start to try to get all this logic in a
generic code for internal translate code to use.



Thanks,


Daniel



> 
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>> [1] https://github.com/torvalds/linux/tree/master/tools/testing/selftests/powerpc/pmu/ebb
>> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg00073.html
>>
>>> r~
>>> Richard Henderson (3):
>>>     target/ppc: Cache per-pmc insn and cycle count settings
>>>     target/ppc: Rewrite pmu_increment_insns
>>>     target/ppc: Use env->pnc_cyc_cnt
>>>    target/ppc/cpu.h         |   3 +
>>>    target/ppc/power8-pmu.h  |  14 +--
>>>    target/ppc/cpu_init.c    |   1 +
>>>    target/ppc/helper_regs.c |   2 +-
>>>    target/ppc/machine.c     |   2 +
>>>    target/ppc/power8-pmu.c  | 230 ++++++++++++++++-----------------------
>>>    6 files changed, 108 insertions(+), 144 deletions(-)
>>>
> 
> 

