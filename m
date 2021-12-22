Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE62C47D656
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:13:24 +0100 (CET)
Received: from localhost ([::1]:44470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0679-0002kt-8i
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:13:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n064S-0008MG-3Z; Wed, 22 Dec 2021 13:10:36 -0500
Received: from [2607:f8b0:4864:20::82d] (port=37497
 helo=mail-qt1-x82d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n064P-0004Be-7E; Wed, 22 Dec 2021 13:10:34 -0500
Received: by mail-qt1-x82d.google.com with SMTP id f9so2697287qtk.4;
 Wed, 22 Dec 2021 10:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iRbYjdGmPQNfJGRrPHu+YXh5SzYTknkaBZK09R7MCpY=;
 b=OUW6WNsvtyAnwFXMaGrw1YkXQ4Axbh8FI2LzpGFdhjLYeLiS+wfny2PuZplzG+jZt0
 /+7FyKXE6X8zOx1ecvUcZkaeZlIjYMBzbCmZlCS5GH4s5JRf8gQBNmZrbRH8dQSudFMT
 HBe1aAuoiG3LGEZHliX5J1oIf4A8+3FWKhjI6tPp/IgdnesqEcaJ1NeYtNR9TVEuW3u2
 kPmcv27ScbM29QaYs744F1ip6UpIeIYVtEt6CYDrbnPuXyxq6aLhM9S0FTcckNa0OeFX
 5Ttp2TGpNtRFsCdsS+fWwTFJw23hCsVP2A83qt5kpkUtAPXLdF2qCWLxPu3sJddLy8Wz
 O3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iRbYjdGmPQNfJGRrPHu+YXh5SzYTknkaBZK09R7MCpY=;
 b=5FQB+0eimS+L2CydNHIEwhqFOnZSqHYb1iNhHAZ8yAvNrNjkuuvQHYhj31xVDGaZiV
 1MW2U8VAmwBFgw6LFQQGi3ymkTv11qwaOyKP+1ZUzgwziAD27kEZzXHZZcinN/8FBuwh
 wZvjFnmqytNNl66Ur8AOr0/fADupLccmyIX6Amdw79NV/S18wK2XZ0bbd0BQ5Il00YIu
 AZJauRG/G44Y3wsE3Jdu/PXxyl26lehIlzuZUS6NoJnoqgoGE+Ss2QKR5YRMJvvixiY4
 eSPtZddlzXF/gWBondFs8tp+yBn2wHooFRWtE900WgDx7/ebGiZMFDRBXqIMe6+sv1Sw
 dFSg==
X-Gm-Message-State: AOAM532aB0Sttmcb8Yzh6I529yZfTadPiH+KEWDzlX03MUSoAe2XXIee
 y+XfAmtMQWONtHiXEP1Voag=
X-Google-Smtp-Source: ABdhPJw0wtD06CEDccr/lhPUUoQQW5YHU6N0poAM8gz7h5DCz1+e9w8VfHcsAMxt6ddCvgJTQyhU9g==
X-Received: by 2002:ac8:5b90:: with SMTP id a16mr3156185qta.300.1640196631798; 
 Wed, 22 Dec 2021 10:10:31 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:7ce4:b718:2cc0:32df:97ee?
 ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id v10sm2338236qtk.13.2021.12.22.10.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 10:10:31 -0800 (PST)
Message-ID: <8ea54a38-d1c2-bcef-8d9d-8cbbfe7b227f@gmail.com>
Date: Wed, 22 Dec 2021 15:10:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/8] target/ppc: introduce power8-pmu-insn-cnt.c.inc
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211222134520.587877-1-danielhb413@gmail.com>
 <20211222134520.587877-2-danielhb413@gmail.com>
 <1d29d20b-0c8c-68a8-cd5b-6d3780ea1b1f@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <1d29d20b-0c8c-68a8-cd5b-6d3780ea1b1f@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/22/21 15:00, Cédric Le Goater wrote:
> On 12/22/21 14:45, Daniel Henrique Barboza wrote:
>> We're going to add a significant amount of TCG ops code for
>> instruction counting, eventually getting rid of the 'helper_insn_inc'
>> helper entirely.
>>
>> Create a new file to avoid putting even more stuff on the already
>> crowded target/ppc/translate.c.
> 
> We already have a power8-pmu-regs.c.inc file. Couldn't we use it or is it
> a bad idea ?

That was my first idea. But then I thought that this code would feel out of place
in power8-pmu-regs.c.inc since, at this moment, the file only has SPR read/write
implementations that are being declared by spr_tcg.h to be used by cpu_init.c.


I guess it's a matter of taste. I'm ok putting this code in power8-pmu-regs.c.inc if
you think it's better.



Daniel

> 
> Thanks,
> 
> C.
> 
> 
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/power8-pmu-insn-cnt.c.inc | 54 ++++++++++++++++++++++++++++
>>   target/ppc/translate.c               | 44 ++---------------------
>>   2 files changed, 56 insertions(+), 42 deletions(-)
>>   create mode 100644 target/ppc/power8-pmu-insn-cnt.c.inc
>>
>> diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
>> new file mode 100644
>> index 0000000000..2febbcc27e
>> --- /dev/null
>> +++ b/target/ppc/power8-pmu-insn-cnt.c.inc
>> @@ -0,0 +1,54 @@
>> +/*
>> + * PMU instruction counting for TCG IBM POWER chips
>> + *
>> + * Copyright IBM Corp. 2021
>> + *
>> + * Authors:
>> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#if defined(TARGET_PPC64)
>> +static void pmu_count_insns(DisasContext *ctx)
>> +{
>> +    /*
>> +     * Do not bother calling the helper if the PMU isn't counting
>> +     * instructions.
>> +     */
>> +    if (!ctx->pmu_insn_cnt) {
>> +        return;
>> +    }
>> +
>> + #if !defined(CONFIG_USER_ONLY)
>> +    /*
>> +     * The PMU insns_inc() helper stops the internal PMU timer if a
>> +     * counter overflows happens. In that case, if the guest is
>> +     * running with icount and we do not handle it beforehand,
>> +     * the helper can trigger a 'bad icount read'.
>> +     */
>> +    gen_icount_io_start(ctx);
>> +
>> +    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
>> +#else
>> +    /*
>> +     * User mode can read (but not write) PMC5 and start/stop
>> +     * the PMU via MMCR0_FC. In this case just increment
>> +     * PMC5 with base.num_insns.
>> +     */
>> +    TCGv t0 = tcg_temp_new();
>> +
>> +    gen_load_spr(t0, SPR_POWER_PMC5);
>> +    tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
>> +    gen_store_spr(SPR_POWER_PMC5, t0);
>> +
>> +    tcg_temp_free(t0);
>> +#endif /* #if !defined(CONFIG_USER_ONLY) */
>> +}
>> +#else
>> +static void pmu_count_insns(DisasContext *ctx)
>> +{
>> +    return;
>> +}
>> +#endif /* #if defined(TARGET_PPC64) */
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 114456148c..44773bc6cd 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -4183,48 +4183,8 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
>>   #endif
>>   }
>> -#if defined(TARGET_PPC64)
>> -static void pmu_count_insns(DisasContext *ctx)
>> -{
>> -    /*
>> -     * Do not bother calling the helper if the PMU isn't counting
>> -     * instructions.
>> -     */
>> -    if (!ctx->pmu_insn_cnt) {
>> -        return;
>> -    }
>> -
>> - #if !defined(CONFIG_USER_ONLY)
>> -    /*
>> -     * The PMU insns_inc() helper stops the internal PMU timer if a
>> -     * counter overflows happens. In that case, if the guest is
>> -     * running with icount and we do not handle it beforehand,
>> -     * the helper can trigger a 'bad icount read'.
>> -     */
>> -    gen_icount_io_start(ctx);
>> -
>> -    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
>> -#else
>> -    /*
>> -     * User mode can read (but not write) PMC5 and start/stop
>> -     * the PMU via MMCR0_FC. In this case just increment
>> -     * PMC5 with base.num_insns.
>> -     */
>> -    TCGv t0 = tcg_temp_new();
>> -
>> -    gen_load_spr(t0, SPR_POWER_PMC5);
>> -    tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
>> -    gen_store_spr(SPR_POWER_PMC5, t0);
>> -
>> -    tcg_temp_free(t0);
>> -#endif /* #if !defined(CONFIG_USER_ONLY) */
>> -}
>> -#else
>> -static void pmu_count_insns(DisasContext *ctx)
>> -{
>> -    return;
>> -}
>> -#endif /* #if defined(TARGET_PPC64) */
>> +/* For pmu_count_insns */
>> +#include "target/ppc/power8-pmu-insn-cnt.c.inc"
>>   static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
>>   {
>>
> 

