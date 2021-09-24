Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BF3417B9A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:11:53 +0200 (CEST)
Received: from localhost ([::1]:50048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqbw-0007jU-VD
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mTqW2-0005Z4-C3; Fri, 24 Sep 2021 15:05:47 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mTqW0-0003Zb-6W; Fri, 24 Sep 2021 15:05:46 -0400
Received: by mail-qk1-x72c.google.com with SMTP id 138so28852806qko.10;
 Fri, 24 Sep 2021 12:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JHwrK5hdh/Zay/mocs6ozbb9BTizQss0Xq1OSThMZ5o=;
 b=HLXn5+JANfekuYIAwDmJWaMXUEQyIwhQwLXJNDbPhBpGgdrjKFu6cin8brnU84a/vk
 qvhofsRupHqhLu6K0XHJPoNXasdf3BGDx8d7hEMeYHSHtFeh+SySmEiHTYWjPaYC3vEG
 1e7Kn2QzDcIpwgIMo8U+AaJeipQMXLfPUfRV/htz29j/s3WbCH+FobPEHTTy9YaVFdM9
 92dezpAZdFh9AVHtIRfheSLRi9JXfD0NVkjFlL5MzF/n5YSLybTFhEbX2yWvQTfRGCc4
 C3Ix2DuJ4MdwlKucKOzQ++KqKFMVJyy6kE+SBVM8n10kPJiBm6puxzw7FEJFH1AsftII
 /54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JHwrK5hdh/Zay/mocs6ozbb9BTizQss0Xq1OSThMZ5o=;
 b=sxfiHX5wqpfzqkMbrzYA2cAfqowHtTDA2p6SEcpqIHSwaw0wh0Fz+Sy60AsG4kyWkv
 t4PD5QqOv6Dif3UOSA8a623SbkyFKL+8eiZoc5AJGNGNwrzbmeqqnaXhWSl6NRmeDVAM
 Pap3a7oV0FTaJ9GtbKoyboivojcF6Yxpk0lAHaznX4CUrBg9d2i6SNhi+C12C1WzZQg0
 nNb0PeDGwSR0Dyxopk1GcBphvYgDysQVhtw7lsGcMGpW6ItPgyGFocfrNTAWiUzOyStj
 AX2/8QUqCmcIXkUZxirz/89lIaBSndNsgoJp3TbtKQlIpkRaRIM3dkyl8QYm5jlRDu7h
 XSYQ==
X-Gm-Message-State: AOAM530ganLZBHXG83FxZ+W0FwZjBBvNfKS1W+q35AqJzOs+oEFxPDuJ
 qc3Cfejqa/OlOHC69NCSiDU=
X-Google-Smtp-Source: ABdhPJwfd/T5YRJCjMR3o3auUOdsnfzd9YAWq99dLX8EjE1Svrur5SmQ84R8aA+Fd34oxLNWM8xVhw==
X-Received: by 2002:a37:58e:: with SMTP id 136mr12396759qkf.324.1632510341524; 
 Fri, 24 Sep 2021 12:05:41 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id o13sm5102104qtk.37.2021.09.24.12.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 12:05:41 -0700 (PDT)
Message-ID: <3a7f42d0-b6c6-4dd1-2647-2f6fe853db0b@gmail.com>
Date: Fri, 24 Sep 2021 16:05:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 03/15] target/ppc: PMU basic cycle count for pseries TCG
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-4-danielhb413@gmail.com>
 <fa7aa371-3fa0-e064-cf73-1c89508bba00@eldorado.org.br>
 <9497e03c-69c3-c736-283f-b95331f4b2e2@gmail.com>
 <b5d60603-6bd9-0323-1754-4eca8c9e5df0@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <b5d60603-6bd9-0323-1754-4eca8c9e5df0@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72c.google.com
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
Cc: richard.henderson@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/24/21 15:34, Matheus K. Ferst wrote:
> On 24/09/2021 11:41, Daniel Henrique Barboza wrote:
>> On 9/22/21 08:24, Matheus K. Ferst wrote:
>>> On 03/09/2021 17:31, Daniel Henrique Barboza wrote:
>>>> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
>>>>
>>>> This patch adds the barebones of the PMU logic by enabling cycle
>>>> counting, done via the performance monitor counter 6. The overall logic
>>>> goes as follows:
>>>>
>>>> - a helper is added to control the PMU state on each MMCR0 write. This
>>>> allows for the PMU to start/stop as the frozen counter bit (MMCR0_FC)
>>>> is cleared or set;
>>>>
>>>> - MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to avoid
>>>> having to spin the PMU right at system init;
>>>>
>>>> - the intended usage is to freeze the counters by setting MMCR0_FC, do
>>>> any additional setting of events to be counted via MMCR1 (not
>>>> implemented yet) and enable the PMU by zeroing MMCR0_FC. Software must
>>>> freeze counters to read the results - on the fly reading of the PMCs
>>>> will return the starting value of each one.
>>>>
>>>> Since there will be more PMU exclusive code to be added next, put the
>>>> PMU logic in its own helper to keep all in the same place. The name of
>>>> the new helper file, power8_pmu.c, is an indicative that the PMU logic
>>>> has been tested with the IBM POWER chip family, POWER8 being the oldest
>>>> version tested. This doesn't mean that this PMU logic will break with
>>>> any other PPC64 chip that implements Book3s, but since we can't assert
>>>> that this PMU will work with all available Book3s emulated processors
>>>> we're choosing to be explicit.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>
>>> <snip>
>>>
>>>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>>>> index 0babde3131..c3e2e3d329 100644
>>>> --- a/target/ppc/translate.c
>>>> +++ b/target/ppc/translate.c
>>>> @@ -401,6 +401,24 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
>>>>       spr_store_dump_spr(sprn);
>>>>   }
>>>>
>>>> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>>>> +void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
>>>> +{
>>>> +    /*
>>>> +     * helper_store_mmcr0 will make clock based operations that
>>>> +     * will cause 'bad icount read' errors if we do not execute
>>>> +     * gen_icount_io_start() beforehand.
>>>> +     */
>>>> +    gen_icount_io_start(ctx);
>>>> +    gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
>>>> +}
>>>> +#else
>>>> +void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
>>>> +{
>>>> +    spr_write_generic(ctx, sprn, gprn);
>>>> +}
>>>> +#endif
>>>> +
>>>>   #if !defined(CONFIG_USER_ONLY)
>>>>   void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
>>>>   {
>>>> @@ -596,7 +614,10 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
>>>>       tcg_gen_andi_tl(t1, t1, ~(MMCR0_UREG_MASK));
>>>>       /* Keep all other bits intact */
>>>>       tcg_gen_or_tl(t1, t1, t0);
>>>> -    gen_store_spr(SPR_POWER_MMCR0, t1);
>>>> +
>>>> +    /* Overwrite cpu_gpr[gprn] and use spr_write_MMCR0() */
>>>> +    tcg_gen_mov_tl(cpu_gpr[gprn], t1);
>>>> +    spr_write_MMCR0(ctx, sprn + 0x10, gprn);
>>>
>>> IIUC, this makes writing to MMCR0 change the GPR value and expose the unfiltered content of the SPR to problem state. It might be better to call the helper directly or create another method that takes a TCGv as an argument and call it from spr_write_MMCR0_ureg and spr_write_MMCR0.
>>
>> I'm overwriting cpu_gpr[gprn] with t1, which is filtered by MMCR0_REG_MASK
>> right before, to re-use spr_write_MMCR0() since its API requires a gprn
>> index. The reason I'm re-using spr_write_MMCR0() here is to avoid code repetition
>> in spr_write_MMCR0_ureg(), which would need to repeat the same steps as
>> spr_write_MMCR0 (calling icount_io_start(), calling the helper, and then setting
>> DISAS_EXIT_UPDATE in a later patch).
>>
>> The idea behind is that all PMU user_write() functions works the same as its
>> privileged counterparts but with some form of filtering done beforehand. Note
>> that this is kind of true in the previous patch as well - gen_store_spr() is
>> similar to the privileged function MMCR0 was using (spr_write_generic()) with
>> the exception of an optional qemu_log().
>>
>> Maybe I should've made this clear in the previous patch, using spr_write_generic()
>> and overwriting cpu_gpr[gprn] with the filtered t1 content back there.
>>
>> Speaking of which, since t1 is being filtered by MMCR0_REG_MASK before being used to
>> overwrite cpu_gpr[gprn], I'm not sure how this is exposing unfiltered content to
>> problem state. Can you elaborate?
> 
> Suppose MMCR0 has the value 0x80000001 (FC and FCH) and problem state executes an mtspr with the value 0x4000000 (unset FC and set PMAE) in the GPR. The proposed code will do the following:
> 
>  > tcg_gen_andi_tl(t0, cpu_gpr[gprn], MMCR0_UREG_MASK);
> 
> t0 = GPR & MMCR0_UREG_MASK = 0x4000000 & 0x84000080 = 0x4000000
> 
>  > gen_load_spr(t1, SPR_POWER_MMCR0);
> 
> t1 = MMCR0 = 0x80000001
> 
>  > tcg_gen_andi_tl(t1, t1, ~(MMCR0_UREG_MASK));
> 
> t1 = t1 & ~MMCR0_UREG_MASK = 0x80000001 & ~0x84000080 = 0x1
> 
>  > tcg_gen_or_tl(t1, t1, t0);
> 
> t1 = t1 | t0 = 0x4000000 | 0x1 = 0x4000001
> 
>  > tcg_gen_mov_tl(cpu_gpr[gprn], t1);
> 
> GPR = 0x4000001
> 
> Now problem state knows that FCH is set.

I see. The problem is that overwriting the GPR is exposing bits outside
of the MMCR0_UREG_MASK via GPR itself, something that wasn't happening
in the previous patch because the filtering logic wasn't visible via
userspace.

Thanks for clarifying. I'll fix it in the next version, probably by adding a
common 'write_MMCR0' method that receives a TCGv and that can be shared
for both privileged and user write() callbacks, like you suggested in your
previous reply.



Thanks,


Daniel


> 

