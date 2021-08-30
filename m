Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A783FBC9A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 20:43:40 +0200 (CEST)
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKmFl-0005bO-6f
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 14:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mKmE4-00046j-D3; Mon, 30 Aug 2021 14:41:44 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:34447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mKmE2-00079s-80; Mon, 30 Aug 2021 14:41:44 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id e18so8924761qvo.1;
 Mon, 30 Aug 2021 11:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vPMlF4LwPBmtIIAWFxzhgYi8QroHie9m9HtI7Fh0Pxc=;
 b=YdYPG+pWLqN53tkoXzTBIajPTDADMEhIPCx/R0siUuOBhl8NxHrtXM7glZVTJoUiIZ
 UDUj00fpw/I53Y7majqhuvsDCUck1V21O6JvUyNrvf5Z82Wi2WPQEs+hcjh3G3D8w21s
 tGcgTuNI1F5Liw2w2OVhlyhEiWQbfPgbn/y1/uPNDeHAADAzuaxGi72rizj1NNdVuYoK
 GJUCQba09k5XckUVmoxsFIP7BdCLCI00MeBseqD0z4U50G+h6mYPdYM5ZvTlJLyKB2Mw
 0g2JXFOzEuW24V5yFJZ85aPmkylZDbe3R+CNoTsKMqnYKBcmKkU+tAroHq/y9m0TwEHg
 b2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vPMlF4LwPBmtIIAWFxzhgYi8QroHie9m9HtI7Fh0Pxc=;
 b=olLOCQNMMo4f4xJeXOG4QYCj3zucRCuci6lY2ngX8X4H/7eankFLgixeKDXh418WoC
 vsOTg2doYUNZ0bRWpaO2vrEAVS5uOE6KwDcFAq9YPrHdYTMw18+4GOffWaFhg3/pGxpk
 W79W3hZQBV37vBN6jp4IfTbPV9REcLVohwFLe87u2c2pGTlkq8AzHZvbhdKjMcoRFhfz
 rjdA3bCRfentjMln6O4NmehO+l4Qn45PSjqwCoCf7UYyCf4vBF7gZwE7o42DUNBA5yfw
 h6S6coBwaFn4GHUxAl/dNJIFP1aos/wu5LWDzU8ZQNoXqMkGKecELXKkRf188UqRtJFJ
 Mn8Q==
X-Gm-Message-State: AOAM533AWwyOYjNxbfv2+SJZrg/06L6opm/VHYBT30iHFbnW8+OKQR0G
 Fy3Td/CkLwM7ng9GRP0RoUI=
X-Google-Smtp-Source: ABdhPJzan+XCpShj2NAhPfthznwzeGMQl1f1nz+ijnFKwHS2RhruR3mV9AuP4B0XcF72q/Vm2B4E7Q==
X-Received: by 2002:ad4:5bea:: with SMTP id k10mr15920076qvc.23.1630348900831; 
 Mon, 30 Aug 2021 11:41:40 -0700 (PDT)
Received: from [192.168.10.222] ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id x21sm11571873qkf.76.2021.08.30.11.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 11:41:40 -0700 (PDT)
Subject: Re: [PATCH v2 09/16] PPC64/TCG: Implement 'rfebb' instruction
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-10-danielhb413@gmail.com>
 <1445a679-2871-933c-e06f-1e7f36f3a0eb@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <d1ad53da-8b28-b73a-df90-84e2d30918a5@gmail.com>
Date: Mon, 30 Aug 2021 15:41:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1445a679-2871-933c-e06f-1e7f36f3a0eb@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.932,
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
Cc: gustavo.romero@linaro.org, richard.henderson@linaro.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/30/21 9:12 AM, Matheus K. Ferst wrote:
> On 24/08/2021 13:30, Daniel Henrique Barboza wrote:
>> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
>>
>> An Event-Based Branch (EBB) allows applications to change the NIA when a
>> event-based exception occurs. Event-based exceptions are enabled by
>> setting the Branch Event Status and Control Register (BESCR). If the
>> event-based exception is enabled when the exception occurs, an EBB
>> happens.
>>
>> The EBB will:
>>
>> - set the Global Enable (GE) bit of BESCR to 0;
>> - set bits 0-61 of the Event-Based Branch Return Register (EBBRR) to the
>>    effective address of the NIA that would have executed if the EBB
>>    didn't happen;
>> - Instruction fetch and execution will continue in the effective address
>>    contained in the Event-Based Branch Handler Register (EBBHR).
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
>>   target/ppc/cpu.h                       | 13 +++++++++++
>>   target/ppc/excp_helper.c               | 24 +++++++++++++++++++
>>   target/ppc/helper.h                    |  1 +
>>   target/ppc/insn32.decode               |  5 ++++
>>   target/ppc/translate.c                 |  2 ++
>>   target/ppc/translate/branch-impl.c.inc | 32 ++++++++++++++++++++++++++
>>   6 files changed, 77 insertions(+)
>>   create mode 100644 target/ppc/translate/branch-impl.c.inc
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 105ee75a01..9d5eb9ead4 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -363,6 +363,19 @@ typedef struct ppc_v3_pate_t {
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
>> index 7b6ac16eef..058b063d8a 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1281,6 +1281,30 @@ void helper_hrfid(CPUPPCState *env)
>>   }
>>   #endif
>>
>> +#ifdef CONFIG_TCG
>> +void helper_rfebb(CPUPPCState *env, target_ulong s)
>> +{
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
> 
> Hi Daniel,
> 
> Should we check msr_is_64bit and crop EBBRR here? Also, I believe this helper should be inside a #if defined(TARGET_PPC64) ...

Good catch. Yes, we need. PowerISA mentions:

"If there are no pending event-based exceptions, then
the next instruction is fetched from the address
EBBRR 0:61 || 0b00 (when MSR SF =1) or 32 0 ||
EBBRR 32:61 || 0b00 (when MSR SF =0)."


I'll fix it in the next spin, together with the 'if defined(TARGET_PPC64)' you also mentioned.


> 
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
> 
> ... as its DEF_HELPER is.
> 
>>   DEF_HELPER_2(store_lpcr, void, env, tl)
>>   DEF_HELPER_2(store_pcr, void, env, tl)
>>   DEF_HELPER_2(store_mmcr0, void, env, tl)
>> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
>> index 9fd8d6b817..bd0b88b0b6 100644
>> --- a/target/ppc/insn32.decode
>> +++ b/target/ppc/insn32.decode
>> @@ -124,3 +124,8 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
>>   ## Vector Bit Manipulation Instruction
>>
>>   VCFUGED         000100 ..... ..... ..... 10101001101    @VX
>> +
>> +### rfebb
>> +&RFEBB          s:uint8_t
>> +@RFEBB          ......-------------- s:1 .......... -   &RFEBB
>> +RFEBB           010011-------------- .   0010010010 -   @RFEBB
> 
> Maybe it only makes sense with Book I instructions, but we've been naming fmt_def/arg_def according to the instruction format, so I'd suggest naming it @XL/&XL or @XL_s/&XL_s.

Alright.

> 
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index d45ce79a3e..d4cfc567cf 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -7643,6 +7643,8 @@ static int times_4(DisasContext *ctx, int x)
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
>> index 0000000000..2e309e9889
>> --- /dev/null
>> +++ b/target/ppc/translate/branch-impl.c.inc
>> @@ -0,0 +1,32 @@
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
>> +    return true;
> 
> That would be a no-op for !TARGET_PPC64, I think it's more appropriate to call gen_invalid(ctx) or let REQUIRE_INSNS_FLAGS2 handle this. I'm not sure what should be done in the CONFIG_USER_ONLY case.


I'll use 'gen_invalid(ctx)' since this is what is being done in fixedpoint-impl.c.inc
(albeit for a different reason I guess).


Thanks,


Daniel

> 
>> +}
>> +#endif
>> -- 
>> 2.31.1
>>
>>
> 

