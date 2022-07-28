Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A2A583FF5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:30:18 +0200 (CEST)
Received: from localhost ([::1]:48294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3aj-0005a4-TN
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH3Xp-0003hs-Vm; Thu, 28 Jul 2022 09:27:18 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH3Xn-0002Hb-J2; Thu, 28 Jul 2022 09:27:17 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 y10-20020a9d634a000000b006167f7ce0c5so1192550otk.0; 
 Thu, 28 Jul 2022 06:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ElDEQk+U8+EMH8rbV08JPjoT5oA2amdh53XxRShLrT8=;
 b=YR1A0SbYrQHsg2RiO0VnvuLT6NbPnwbH71fy7pFKGvLFB1sB0rXjA4KuAaLutyYFrv
 bV7GN+cR/lbAS/LE2rXd+nWhWOQoE319ewOI2dsOW8KqMuuCeZmTTuDfMX0mr4IiTr9z
 Ua4LWH9YndVcsuTuwjutbVSO5WnLCsmZSaclmY88tjH0o8pTKFjUIVz3J1WfkZdGAyB5
 UVNIR4XeGBsC04zQxbdihQR5TDFK02iOLxthWEywIJTulu0Cf4rX8dNOgYCUUZmSn4/1
 jausnFFGnWniIePckwutoklhsFjNiWxrzuzhWgQv73OU3paA83mqrkjnD/oLHz7jtDJj
 BTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ElDEQk+U8+EMH8rbV08JPjoT5oA2amdh53XxRShLrT8=;
 b=Si2v7hkp5hvNUMtJJtRYq4H2exCiVJrQjvFba/RjXwZINIkrjyIrYU4W2WjvQXAyuB
 l/aiU7laygPjBJZPoKUG5s3pMy+1eLzKimnBhlhdoQaD1BLWwj9VGpxYK5lXRo+VGHUW
 xRNFmfJdQoJdyuieo+cNNjt4vD4WBCVoc0SdwsfxQpO1nitTZUBcIl7lnZnHlNvY+8T6
 DxaUsZxdbe0+Acew7cdfIc5++IDEtVi86/COVBYooIInVR7KCl2DCp+QkIPe1JW6uRne
 mHAooxjjviccQfb2k50x28j4b3eYXYSagoAt88hu2HmNk4vMTdsOCoC20HxEgrrUCam8
 ZIRA==
X-Gm-Message-State: AJIora9QfQuixqfi40WnLQ61MW8oTxY59vK1axdRJWWmcEh8AFH5Pngt
 /vUjle+gR6Xqb8w5+JKp1GU=
X-Google-Smtp-Source: AGRyM1u0bA7Z03oTfHToyEFmMR+YSfFYxjWH0LJkuiVSJLbtYmcbZH6ttezeFI/SNHAf68U7P3/VXQ==
X-Received: by 2002:a05:6830:f:b0:61c:9bb4:5516 with SMTP id
 c15-20020a056830000f00b0061c9bb45516mr9834433otp.373.1659014832713; 
 Thu, 28 Jul 2022 06:27:12 -0700 (PDT)
Received: from [192.168.10.102] ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 e37-20020a056820062500b004288e69cac2sm349321oow.23.2022.07.28.06.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 06:27:12 -0700 (PDT)
Message-ID: <28a880b2-bdbc-f17b-a37d-5b2943079c49@gmail.com>
Date: Thu, 28 Jul 2022 10:27:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] target/ppc: Implement new wait variants
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
References: <20220720133352.904263-1-npiggin@gmail.com>
 <5df2f253-7b74-1553-348c-370b78876c33@gmail.com>
 <CACPK8XeZm2_Thk7cJEWCEvVFGdpqr+VpMcrQ8DykGMRRnbozdw@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CACPK8XeZm2_Thk7cJEWCEvVFGdpqr+VpMcrQ8DykGMRRnbozdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/28/22 02:29, Joel Stanley wrote:
> On Wed, 27 Jul 2022 at 13:49, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
>>
>>
>>
>> On 7/20/22 10:33, Nicholas Piggin wrote:
>>> ISA v2.06 adds new variations of wait, specified by the WC field. These
>>> are not all compatible with the prior wait implementation, because they
>>> add additional conditions that cause the processor to resume, which can
>>> cause software to hang or run very slowly.
>>
>> So I suppose this is not a new feature, but a bug fix to remediate these hangs
>> cause by the incompatibility of the WC field  with other ISA versions. Is
>> that right?
> 
> That's the case. Nick has some kernel patches that make Linux use the
> new opcode:
> 
>   https://lore.kernel.org/all/20220720132132.903462-1-npiggin@gmail.com/
> 
> With these applied the kernel hangs during boot if more than one CPU
> is present. I was able to reproduce with ppc64le_defconfig and this
> command line:
> 
>   qemu-system-ppc64 -M pseries,x-vof=on -cpu POWER10 -smp 2 -nographic
> -kernel zImage.pseries -no-reboot
> 
> Qemu will exit (as there's no filesystem) if the test "passes", or
> hang during boot if it hits the bug.

Thanks for the explanation. I'll handle it as a bug fix then.


Also, Nick, down below:


> 
> There's a kernel here with the patches applied in case someone else
> wants to test:
> 
> https://ozlabs.org/~joel/zImage.pseries-v5.19-rc8-wait-v3
> 
> Tested-by: Joel Stanley <joel@jms.id.au>
> 
> Because of the hang it would be best if we merged the patch as a fix
> sooner rather than later.
> 
> Cheers,
> 
> Joel
> 
>> I'm explicitly asking for it because if it's a bug fix it's ok to pick it
>> during the freeze. Especially here, given that what you're doing is mostly
>> adding no-ops for conditions that we're not covering.
>>
>>>
>>> ISA v3.0 changed the wait opcode and removed the new variants (retaining
>>> the WC field but making non-zero values reserved).
>>>
>>> ISA v3.1 added new WC values to the new wait opcode, and added a PL
>>> field.
>>>
>>> This implements the new wait encoding and supports WC variants with
>>> no-op implementations, which provides basic correctness as explained in
>>> comments.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>> v3:
>>> - Add EXTRACT_HELPERs
>>> - Reserved fields should be ignored, not trap.
>>> - v3.1 defines special case of reserved PL values being treated as
>>>     a no-op when WC=2.
>>> - Change code organization to (hopefully) be easier to follow each
>>>     ISA / variation.
>>> - Tested old wait variant with Linux e6500 boot and verify that
>>>     gen_wait is called and takes the expected path.
>>>
>>> Thanks,
>>> Nick
>>>
>>>    target/ppc/internal.h  |  3 ++
>>>    target/ppc/translate.c | 96 ++++++++++++++++++++++++++++++++++++++----
>>>    2 files changed, 91 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
>>> index 2add128cd1..57c0a42a6b 100644
>>> --- a/target/ppc/internal.h
>>> +++ b/target/ppc/internal.h
>>> @@ -168,6 +168,9 @@ EXTRACT_HELPER_SPLIT_3(DX, 10, 6, 6, 5, 16, 1, 1, 0, 0)
>>>    /* darn */
>>>    EXTRACT_HELPER(L, 16, 2);
>>>    #endif
>>> +/* wait */
>>> +EXTRACT_HELPER(WC, 21, 2);
>>> +EXTRACT_HELPER(PL, 16, 2);
>>>
>>>    /***                            Jump target decoding                       ***/
>>>    /* Immediate address */
>>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>>> index 1d6daa4608..e0a835ac90 100644
>>> --- a/target/ppc/translate.c
>>> +++ b/target/ppc/translate.c
>>> @@ -4066,12 +4066,91 @@ static void gen_sync(DisasContext *ctx)
>>>    /* wait */
>>>    static void gen_wait(DisasContext *ctx)
>>>    {
>>> -    TCGv_i32 t0 = tcg_const_i32(1);
>>> -    tcg_gen_st_i32(t0, cpu_env,
>>> -                   -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
>>> -    tcg_temp_free_i32(t0);
>>> -    /* Stop translation, as the CPU is supposed to sleep from now */
>>> -    gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>>> +    uint32_t wc;
>>> +
>>> +    if (ctx->insns_flags & PPC_WAIT) {
>>> +        /* v2.03-v2.07 define an older incompatible 'wait' encoding. */
>>> +
>>> +        if (ctx->insns_flags2 & PPC2_PM_ISA206) {
>>> +            /* v2.06 introduced the WC field. WC > 0 may be treated as no-op. */
>>> +            wc = WC(ctx->opcode);
>>> +        } else {
>>> +            wc = 0;
>>> +        }
>>> +
>>> +    } else if (ctx->insns_flags2 & PPC2_ISA300) {
>>> +        /* v3.0 defines a new 'wait' encoding. */
>>> +        wc = WC(ctx->opcode);
>>
>>
>> The ISA seems to indicate that WC=3 is always reserved in both ISA300 and
>> ISA310. I believe you can check for WC=3 and gen_invalid() return right
>> off the bat at this point.


I had a change of heart about this comment. It's better to have each ISA version
handle their conditions in separate, even if they overlap, to make it easier to
extend the function later on if required.


This means that the patch LGTM, so


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>



>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>
>>> +        if (ctx->insns_flags2 & PPC2_ISA310) {
>>> +            uint32_t pl = PL(ctx->opcode);
>>> +
>>> +            /* WC 1,2 may be treated as no-op. WC 3 is reserved. */
>>> +            if (wc == 3) {
>>> +                gen_invalid(ctx);
>>> +                return;
>>> +            }
>>> +
>>> +            /* PL 1-3 are reserved. If WC=2 then the insn is treated as noop. */
>>> +            if (pl > 0 && wc != 2) {
>>> +                gen_invalid(ctx);
>>> +                return;
>>> +            }
>>> +
>>> +        } else { /* ISA300 */
>>> +            /* WC 1-3 are reserved */
>>> +            if (wc > 0) {
>>> +                gen_invalid(ctx);
>>> +                return;
>>> +            }
>>> +        }
>>> +
>>> +    } else {
>>> +        warn_report("wait instruction decoded with wrong ISA flags.");
>>> +        gen_invalid(ctx);
>>> +        return;
>>> +    }
>>> +
>>> +    /*
>>> +     * wait without WC field or with WC=0 waits for an exception / interrupt
>>> +     * to occur.
>>> +     */
>>> +    if (wc == 0) {
>>> +        TCGv_i32 t0 = tcg_const_i32(1);
>>> +        tcg_gen_st_i32(t0, cpu_env,
>>> +                       -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
>>> +        tcg_temp_free_i32(t0);
>>> +        /* Stop translation, as the CPU is supposed to sleep from now */
>>> +        gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>>> +    }
>>> +
>>> +    /*
>>> +     * Other wait types must not just wait until an exception occurs because
>>> +     * ignoring their other wake-up conditions could cause a hang.
>>> +     *
>>> +     * For v2.06 and 2.07, wc=1,2,3 are architected but may be implemented as
>>> +     * no-ops.
>>> +     *
>>> +     * wc=1 and wc=3 explicitly allow the instruction to be treated as a no-op.
>>> +     *
>>> +     * wc=2 waits for an implementation-specific condition, such could be
>>> +     * always true, so it can be implemented as a no-op.
>>> +     *
>>> +     * For v3.1, wc=1,2 are architected but may be implemented as no-ops.
>>> +     *
>>> +     * wc=1 (waitrsv) waits for an exception or a reservation to be lost.
>>> +     * Reservation-loss may have implementation-specific conditions, so it
>>> +     * can be implemented as a no-op.
>>> +     *
>>> +     * wc=2 waits for an exception or an amount of time to pass. This
>>> +     * amount is implementation-specific so it can be implemented as a
>>> +     * no-op.
>>> +     *
>>> +     * ISA v3.1 allows for execution to resume "in the rare case of
>>> +     * an implementation-dependent event", so in any case software must
>>> +     * not depend on the architected resumption condition to become
>>> +     * true, so no-op implementations should be architecturally correct
>>> +     * (if suboptimal).
>>> +     */
>>>    }
>>>
>>>    #if defined(TARGET_PPC64)
>>> @@ -6852,8 +6931,9 @@ GEN_HANDLER2(stdcx_, "stdcx.", 0x1F, 0x16, 0x06, 0x00000000, PPC_64B),
>>>    GEN_HANDLER_E(stqcx_, 0x1F, 0x16, 0x05, 0, PPC_NONE, PPC2_LSQ_ISA207),
>>>    #endif
>>>    GEN_HANDLER(sync, 0x1F, 0x16, 0x12, 0x039FF801, PPC_MEM_SYNC),
>>> -GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x03FFF801, PPC_WAIT),
>>> -GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039FF801, PPC_NONE, PPC2_ISA300),
>>> +/* ISA v3.0 changed the extended opcode from 62 to 30 */
>>> +GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x039FF801, PPC_WAIT),
>>> +GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039CF801, PPC_NONE, PPC2_ISA300),
>>>    GEN_HANDLER(b, 0x12, 0xFF, 0xFF, 0x00000000, PPC_FLOW),
>>>    GEN_HANDLER(bc, 0x10, 0xFF, 0xFF, 0x00000000, PPC_FLOW),
>>>    GEN_HANDLER(bcctr, 0x13, 0x10, 0x10, 0x00000000, PPC_FLOW),
>>

