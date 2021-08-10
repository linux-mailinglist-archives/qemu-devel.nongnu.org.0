Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAD93E83EF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 21:50:35 +0200 (CEST)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDXlh-0001Xc-GK
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 15:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDXkI-0000HG-7Y; Tue, 10 Aug 2021 15:49:06 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDXkG-0001bp-Ee; Tue, 10 Aug 2021 15:49:06 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so5827763pjr.1; 
 Tue, 10 Aug 2021 12:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sFNJIv3wx7hiIW0tVwPoNyM+Tj7XFRrWlIuJMy+7r7c=;
 b=cfzsXoAGGLS3yzesCkswZOOFCz8W0R3QYdFPsmdWy8hT770sWh/BbjrDtl3Fctd/WU
 +MVmKyaFEYFZnJhYOjD0QjAKCAVqMTt7b4FRz/Kp9I0/aR1MEV8H7y7LbMrkTuF9q5d2
 qVDGFeaba/pVQ411DDUflX5loqXtQ7I6Y/IA3kfKx0672TF2aXSYWFpKeN+tWalzbYk+
 QGsuWHd2QWuuavY6exPrkepxOfkiZcEikKHjfpbVeDFBlZgMQLPZfi/RQinlovgcanFQ
 KYh8yQ5lZP9NizE2X8dsl4pyr91KvKyRvU2X7bDBnA4qkswYnmUZ+GqYYjYy6z182s+f
 qfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sFNJIv3wx7hiIW0tVwPoNyM+Tj7XFRrWlIuJMy+7r7c=;
 b=V09nLasH769wwv0IfuyuimI3VR6pY2xz95z2rFXFf7inszOvepvNHVPeza4Vfz4rOb
 KVbYnvJ5OKkVeNUsBUL6kbVyHPAr8nLclpS5nNn3F8sVoLUQGcXYcUGWwZeOobdS9V1/
 9QkSk9D9J4k7fCWIq2HwKo/Zt/qRzadVgbYzGxInSFswpHvghZtXVl9hZV2WVbLP1uK0
 9j41Vzl7FMHUFvTmx1AOpo/EQYDKKYZISeIhzCNhW3lviDVDuhOxvcmMyo8So8xs0u7y
 +oV2thT4JQl9LgQXdwlvhrzXqcU96q8bfCXW8HejJpseLtCy1ypFNE+o52NvKiYai3iy
 8otQ==
X-Gm-Message-State: AOAM532ScZmTXeYt/7iCw0W2S+95APBQzScf+eS9ySLfv/ldmtAF7XFj
 /vdVnxTIJCzON4jwNGP/J0A=
X-Google-Smtp-Source: ABdhPJzQFEoZkRYmhC2Mfj3u2whQFdwIhNtWz29NugVtDiM2YA12cWcHeZRnGa/TFP5bPKPJUmOiPA==
X-Received: by 2002:a17:902:d2d1:b029:12c:4a35:324b with SMTP id
 n17-20020a170902d2d1b029012c4a35324bmr1145281plc.52.1628624942749; 
 Tue, 10 Aug 2021 12:49:02 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id z15sm29025257pgc.13.2021.08.10.12.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 12:49:02 -0700 (PDT)
Subject: Re: [PATCH 18/19] target/ppc/pmu_book3s_helper.c: add PM_CMPLU_STALL
 mock events
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-19-danielhb413@gmail.com> <YRH96w0+vMRHob7w@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <79d98671-0da4-bc89-aa7d-a6778e0af4da@gmail.com>
Date: Tue, 10 Aug 2021 16:48:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRH96w0+vMRHob7w@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 8/10/21 1:17 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 10:10:56AM -0300, Daniel Henrique Barboza wrote:
>> EBB powerpc kernel test 'multi_counter_test' uses PM_CMPLU_STALL events
>> that we do not support. These events are related to CPU stalled/wasted
>> cycles while waiting for resources, cache misses and so on.
>>
>> Unlike the 0xFA event added previously, there's no available equivalent
>> for us to use, and at this moment we can't sample those events as well.
>> What we can do is mock those events as if we were calculating them.
>>
>> This patch implements PM_CMPLU_STALL, PM_CMPLU_STALL_FXU,
>> PM_CMPLU_STALL_OTHER_CMPL and PM_CMPLU_STALL_THRD mock events by giving
>> them a fixed amount of the total elapsed cycles.
>>
>> The chosen sample values for these events (25% of total cycles for
>> PM_CMPLU_STALL and 5% for the other three) were chosen at random and has
>> no intention of being truthful with what a real PowerPC hardware would
>> give us. Our intention here is to make 'multi_counter_test' EBB test
>> pass.
> 
> Hmm.  I guess these mock values make sense for getting the kernel
> tests to pass, but I'm not sure if it's a good idea in general.  Would
> we be better off just reporting 0 always - that would be a strong hint
> to someone attempting to analyze results that something is fishy (in
> this case that they don't actually have a real CPU).

We can drop this patch and I'll add a note in the docs that the EBB kernel
test 'multi_counter_test' fails because the PMU does not implement STALL
events.


Thanks,


Daniel

> 
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/pmu_book3s_helper.c | 81 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 79 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
>> index ae7050cd62..32cf76b77f 100644
>> --- a/target/ppc/pmu_book3s_helper.c
>> +++ b/target/ppc/pmu_book3s_helper.c
>> @@ -92,16 +92,54 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
>>       env->spr[sprn] += get_cycles(icount_delta);
>>   }
>>   
>> +static int get_stall_ratio(uint8_t stall_event)
>> +{
>> +    int stall_ratio = 0;
>> +
>> +    switch (stall_event) {
>> +    case 0xA:
>> +        stall_ratio = 25;
>> +        break;
>> +    case 0x6:
>> +    case 0x16:
>> +    case 0x1C:
>> +        stall_ratio = 5;
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return stall_ratio;
>> +}
>> +
>> +static void update_PMC_PM_STALL(CPUPPCState *env, int sprn,
>> +                                uint64_t icount_delta,
>> +                                uint8_t stall_event)
>> +{
>> +    int stall_ratio = get_stall_ratio(stall_event);
>> +    uint64_t cycles = muldiv64(get_cycles(icount_delta), stall_ratio, 100);
>> +
>> +    env->spr[sprn] += cycles;
>> +}
>> +
>>   static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
>>                                           uint64_t icount_delta)
>>   {
>> -    switch (get_PMC_event(env, sprn)) {
>> +    uint8_t event = get_PMC_event(env, sprn);
>> +
>> +    switch (event) {
>>       case 0x2:
>>           update_PMC_PM_INST_CMPL(env, sprn, icount_delta);
>>           break;
>>       case 0x1E:
>>           update_PMC_PM_CYC(env, sprn, icount_delta);
>>           break;
>> +    case 0xA:
>> +    case 0x6:
>> +    case 0x16:
>> +    case 0x1C:
>> +        update_PMC_PM_STALL(env, sprn, icount_delta, event);
>> +        break;
>>       default:
>>           return;
>>       }
>> @@ -163,6 +201,34 @@ static int64_t get_CYC_timeout(CPUPPCState *env, int sprn)
>>       return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_FREQ);
>>   }
>>   
>> +static int64_t get_stall_timeout(CPUPPCState *env, int sprn,
>> +                                 uint8_t stall_event)
>> +{
>> +    uint64_t remaining_cyc;
>> +    int stall_multiplier;
>> +
>> +    if (env->spr[sprn] == 0) {
>> +        return icount_to_ns(COUNTER_NEGATIVE_VAL);
>> +    }
>> +
>> +    if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL) {
>> +        return 0;
>> +    }
>> +
>> +    remaining_cyc = COUNTER_NEGATIVE_VAL - env->spr[sprn];
>> +
>> +    /*
>> +     * Consider that for this stall event we'll advance the counter
>> +     * in a lower rate, thus requiring more cycles to overflow.
>> +     * E.g. for PM_CMPLU_STALL (0xA), ratio 25, it'll require
>> +     * 100/25 = 4 times the same amount of cycles to overflow.
>> +     */
>> +    stall_multiplier = 100 / get_stall_ratio(stall_event);
>> +    remaining_cyc *= stall_multiplier;
>> +
>> +    return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_FREQ);
>> +}
>> +
>>   static bool pmc_counter_negative_enabled(CPUPPCState *env, int sprn)
>>   {
>>       bool PMC14_running = !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC14);
>> @@ -191,6 +257,7 @@ static bool pmc_counter_negative_enabled(CPUPPCState *env, int sprn)
>>   static int64_t get_counter_neg_timeout(CPUPPCState *env, int sprn)
>>   {
>>       int64_t timeout = -1;
>> +    uint8_t event;
>>   
>>       if (!pmc_counter_negative_enabled(env, sprn)) {
>>           return -1;
>> @@ -205,13 +272,23 @@ static int64_t get_counter_neg_timeout(CPUPPCState *env, int sprn)
>>       case SPR_POWER_PMC2:
>>       case SPR_POWER_PMC3:
>>       case SPR_POWER_PMC4:
>> -        switch (get_PMC_event(env, sprn)) {
>> +        event = get_PMC_event(env, sprn);
>> +
>> +        switch (event) {
>>           case 0x2:
>>               timeout = get_INST_CMPL_timeout(env, sprn);
>>               break;
>>           case 0x1E:
>>               timeout = get_CYC_timeout(env, sprn);
>>               break;
>> +        case 0xA:
>> +        case 0x6:
>> +        case 0x16:
>> +        case 0x1c:
>> +            timeout = get_stall_timeout(env, sprn, event);
>> +            break;
>> +        default:
>> +            break;
>>           }
>>   
>>           break;
> 

