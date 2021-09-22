Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB241509A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:43:30 +0200 (CEST)
Received: from localhost ([::1]:37574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT89R-00019Z-KG
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mT87E-0006ec-Ou; Wed, 22 Sep 2021 15:41:13 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:33471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mT87C-0007Yd-8e; Wed, 22 Sep 2021 15:41:12 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id a9so2795412qvf.0;
 Wed, 22 Sep 2021 12:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BwNwTxv8bE4tvbd5vOo/coq/puh1jsNAu8D2wwqyWKM=;
 b=WVk7EH06OReAIk7Ily4aysbZP7JgQsyS3m9q7QdPs1O5KFRgjmmFt64V1Q3f/AIqKo
 muo0vXKvWBpkINjrx8wlsANwS4UeMMiTO+UEIkpX/HJ6/9QaoftTZ6dTmKjAFbSQusvK
 qyzubT42Z4GapbaJt9GLhZQuxh0ZcGvE6CnANrunvupp90gTTN4OkO1Uz3ZKQqxYbpGp
 g2Br9Xu99nb4T8LxoPWBRkr0vG8VRieVthVnj1hKBeLPoH93YTqe9LUNeXH3WQtGGTZv
 WrihzA6YAMhuuR7DAvnhDMoZ4M+yJW3cIarV/NxxHS2RPahsn+R/KGYDcPl5bZhDCL0d
 TW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BwNwTxv8bE4tvbd5vOo/coq/puh1jsNAu8D2wwqyWKM=;
 b=yDmKRombgWiEbaDALXgy5uPMN7t1V30WSrFSO7UTE2UU3gyszcc7v3dgYOjF3SxAU/
 aLIkjQGcA5zyouP9PvPJMe/7Y6GvAwdjl8FQBq1itloUwK9IImdCNxi7wmx/FVWr7i1Y
 t9qRbt7PTsCxiT942TBa46s4SedAgigjg5SYJB6VimTnQcnkrtcpfDLC4WjWUosr1E5B
 sb/ZTA+cTOv6kqKZ3UNgGsIPESfVNZ39jzVfHyp4Q8WAW5vnH+26eNT+DSSlqFRhQlrW
 EhfO1VwQuqhkgZ71CmKCRcI83i+Mu1QAI7bCg2cW4XNnda6MAU/mS7C5fAWwdYcSylU4
 Teig==
X-Gm-Message-State: AOAM530sbu9jOHPFlqRHro7oGRCyzOs1c91qDrveHGaUyJj52xEu3FYp
 e514l15uDh6q2A8F4GR+U9M=
X-Google-Smtp-Source: ABdhPJyHtgJh17Plena57wfcOkln8TvqrhG4560rIzGYw/iAT4ygveX6FwbIn80yc5i553qke6EEbA==
X-Received: by 2002:a05:6214:40d:: with SMTP id
 z13mr591012qvx.38.1632339668846; 
 Wed, 22 Sep 2021 12:41:08 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id b14sm1880470qtk.64.2021.09.22.12.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 12:41:08 -0700 (PDT)
Message-ID: <7c28e504-f3d8-44ed-caa3-d3eb8422e5b7@gmail.com>
Date: Wed, 22 Sep 2021 16:41:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 08/15] PPC64/TCG: Implement 'rfebb' instruction
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-9-danielhb413@gmail.com>
 <7baa1efb-f8e2-fdfb-8ade-9794bff914a0@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <7baa1efb-f8e2-fdfb-8ade-9794bff914a0@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.039,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: richard.henderson@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/9/21 08:47, Matheus K. Ferst wrote:
> On 03/09/2021 17:31, Daniel Henrique Barboza wrote:
>> An Event-Based Branch (EBB) allows applications to change the NIA when a
>> event-based exception occurs. Event-based exceptions are enabled by
>> setting the Branch Event Status and Control Register (BESCR). If the
>> event-based exception is enabled when the exception occurs, an EBB
>> happens.
>>
>> The following operations happens during an EBB:
>>
>> - Global Enable (GE) bit of BESCR is set to 0;
>> - bits 0-61 of the Event-Based Branch Return Register (EBBRR) are set
>> to the the effective address of the NIA that would have executed if the EBB
>> didn't happen;
>> - Instruction fetch and execution will continue in the effective address
>> contained in the Event-Based Branch Handler Register (EBBHR).
>>
>> The EBB Handler will process the event and then execute the Return From
>> Event-Based Branch (rfebb) instruction. rfebb sets BESCR_GE and then
>> redirects execution to the address pointed in EBBRR. This process is
>> described in the PowerISA v3.1, Book II, Chapter 6 [1].
>>
>> This patch implements the rfebb instruction. Descriptions of all
>> relevant BESCR bits are also added - this patch is only using BESCR_GE,
>> but the next patches will use the remaining bits.
>>
>> [1] https://wiki.raptorcs.com/w/images/f/f5/PowerISA_public.v3.1.pdf
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/cpu.h                       | 13 ++++++++++
>>   target/ppc/excp_helper.c               | 31 ++++++++++++++++++++++++
>>   target/ppc/helper.h                    |  1 +
>>   target/ppc/insn32.decode               |  5 ++++
>>   target/ppc/translate.c                 |  2 ++
>>   target/ppc/translate/branch-impl.c.inc | 33 ++++++++++++++++++++++++++
>>   6 files changed, 85 insertions(+)
>>   create mode 100644 target/ppc/translate/branch-impl.c.inc
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 93f4a46827..26624508fa 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -368,6 +368,19 @@ typedef struct ppc_v3_pate_t {
>>   /* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
>>   #define CTRL_RUN PPC_BIT(63)
>>
>> +/* EBB/BESCR bits */
>> +/* Global Enable */
>> +#define BESCR_GE PPC_BIT(0)
>> +/* External Event-based Exception Enable */
>> +#define BESCR_EE PPC_BIT(30)
>> +/* Performance Monitor Event-based Exception Enable */
>> +#define BESCR_PME PPC_BIT(31)
>> +/* External Event-based Exception Occurred */
>> +#define BESCR_EEO PPC_BIT(62)
>> +/* Performance Monitor Event-based Exception Occurred */
>> +#define BESCR_PMEO PPC_BIT(63)
>> +#define BESCR_INVALID PPC_BITMASK(32, 33)
>> +
>>   /* LPCR bits */
>>   #define LPCR_VPM0         PPC_BIT(0)
>>   #define LPCR_VPM1         PPC_BIT(1)
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 7b6ac16eef..22f9835383 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1281,6 +1281,37 @@ void helper_hrfid(CPUPPCState *env)
>>   }
>>   #endif
>>
>> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>> +void helper_rfebb(CPUPPCState *env, target_ulong s)
>> +{
>> +    target_ulong msr = env->msr;
>> +
>> +    /*
>> +     * Handling of BESCR bits 32:33 according to PowerISA v3.1:
>> +     *
>> +     * "If BESCR 32:33 != 0b00 the instruction is treated as if
>> +     *  the instruction form were invalid."
>> +     */
>> +    if (env->spr[SPR_BESCR] & BESCR_INVALID) {
>> +        raise_exception_err(env, POWERPC_EXCP_PROGRAM,
>> +                            POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL);
>> +    }
>> +
>> +    env->nip = env->spr[SPR_EBBRR];
>> +
>> +    /* Switching to 32-bit ? Crop the nip */
>> +    if (!msr_is_64bit(env, msr)) {
>> +        env->nip = (uint32_t)env->spr[SPR_EBBRR];
>> +    }
>> +
>> +    if (s) {
>> +        env->spr[SPR_BESCR] |= BESCR_GE;
>> +    } else {
>> +        env->spr[SPR_BESCR] &= ~BESCR_GE;
>> +    }
>> +}
>> +#endif
>> +
>>   /*****************************************************************************/
>>   /* Embedded PowerPC specific helpers */
>>   void helper_40x_rfci(CPUPPCState *env)
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index 47dbbe6da1..91a86992a5 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -18,6 +18,7 @@ DEF_HELPER_2(pminsn, void, env, i32)
>>   DEF_HELPER_1(rfid, void, env)
>>   DEF_HELPER_1(rfscv, void, env)
>>   DEF_HELPER_1(hrfid, void, env)
>> +DEF_HELPER_2(rfebb, void, env, tl)
>>   DEF_HELPER_2(store_lpcr, void, env, tl)
>>   DEF_HELPER_2(store_pcr, void, env, tl)
>>   DEF_HELPER_2(store_mmcr0, void, env, tl)
>> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
>> index 9fd8d6b817..deb7374ea4 100644
>> --- a/target/ppc/insn32.decode
>> +++ b/target/ppc/insn32.decode
>> @@ -124,3 +124,8 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
>>   ## Vector Bit Manipulation Instruction
>>
>>   VCFUGED         000100 ..... ..... ..... 10101001101    @VX
>> +
>> +### rfebb
>> +&XL_s           s:uint8_t
>> +@XL_s           ......-------------- s:1 .......... -   &XL_s
>> +RFEBB           010011-------------- .   0010010010 -   @XL_s
> 
> nit: Since the arg_fmt is now XL_s...
> 
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 866b1d2b34..7a3104ecf9 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -7636,6 +7636,8 @@ static int times_4(DisasContext *ctx, int x)
>>
>>   #include "translate/spe-impl.c.inc"
>>
>> +#include "translate/branch-impl.c.inc"
>> +
>>   /* Handles lfdp, lxsd, lxssp */
>>   static void gen_dform39(DisasContext *ctx)
>>   {
>> diff --git a/target/ppc/translate/branch-impl.c.inc b/target/ppc/translate/branch-impl.c.inc
>> new file mode 100644
>> index 0000000000..9c991d9abb
>> --- /dev/null
>> +++ b/target/ppc/translate/branch-impl.c.inc
>> @@ -0,0 +1,33 @@
>> +/*
>> + * Power ISA decode for branch instructions
>> + *
>> + *  Copyright IBM Corp. 2021
>> + *
>> + * Authors:
>> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>> +
>> +static bool trans_RFEBB(DisasContext *ctx, arg_RFEBB *arg)
> 
> I think it's a bit more readable to use arg_XL_s instead of arg_RFEBB. Anyway,


I forgot to rename the function argument together with the decode tree arg.

I'll rename it in the next version.

> 
> Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>


Thanks!


Daniel


> 
>> +{
>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
>> +
>> +    gen_icount_io_start(ctx);
>> +    gen_update_cfar(ctx, ctx->cia);
>> +    gen_helper_rfebb(cpu_env, cpu_gpr[arg->s]);
>> +
>> +    ctx->base.is_jmp = DISAS_CHAIN;
>> +
>> +    return true;
>> +}
>> +#else
>> +static bool trans_RFEBB(DisasContext *ctx, arg_RFEBB *arg)
>> +{
>> +    gen_invalid(ctx);
>> +    return true;
>> +}
>> +#endif
>> -- 
>> 2.31.1
>>
> 
> 

