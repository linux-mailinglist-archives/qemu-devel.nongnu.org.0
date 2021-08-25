Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CBF3F76CA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:03:18 +0200 (CEST)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItUh-0005aP-JP
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mItTk-0004lH-3X; Wed, 25 Aug 2021 10:02:09 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:35701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mItTg-0007en-Pq; Wed, 25 Aug 2021 10:02:07 -0400
Received: by mail-qv1-xf36.google.com with SMTP id g11so13770978qvd.2;
 Wed, 25 Aug 2021 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1glYhnQuS7VeeQ+iaBnVNVqOthVaxq5EIsfjytolGuI=;
 b=RbLVrR+fQiOE0GoLxyjH8WU3cW/Ev287NyP3ysw5/8Euy13z5EMpjBsghdXyqLe9gN
 OIlzeptxWGD446ZnMTxhMRygMy2ilbtLKmu9hle88XQ9km4oM8eFta1yMMQkYvBQ7v9E
 7JfRgdGQBBuLIMidlcIP8TIB2Kq83FvcXhqIU8twGMBxV/WH6U8hgGBSIo16lhEHE06C
 DHEWyDKtpLTjIbQvQ+4oHt6dgK5MQI0Fj2dzCRheDJMoHIjzjqyW/S+HrnIvgmFkElG4
 ZahNRynLDnNLBcSIHcdf4HPaXpwDfyiOhgSHaB4GC8YbGzBGuHPynfWSK3F6y8RWwdET
 cFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1glYhnQuS7VeeQ+iaBnVNVqOthVaxq5EIsfjytolGuI=;
 b=AHHHo94cTW6B+5vkesdYmhFbH7SlGfif6QG+QDxlG0tch+eadvXuh7IP4+uPTxFFBv
 dwYeKj1F4HPR+MR/HVp6Z/MqHb8UiU6/6adsVbgx1A3+ZLJsDM/4jGBu6JKCWr/PxFYg
 dPer5ikMgTmpR6Y93cl6yfUutQYKwSZynJTZuh89aQYhcixZWrAIsLeqaxGb+HMXhRaO
 Q24M7hmOrvysnwYdqZVTLDMOb6tE/1erUxDZkmdZLzK28P6vVMqdVT0nnAm7+2DfRncU
 5Xvq+AJRfLxGZ62zh26wZXc0wJc1TU0LVuMtc4VMEloQBodxl1mFMKiJBGFRJXov7D1R
 bPGQ==
X-Gm-Message-State: AOAM5302EUYZkXEIunZCJPoUoEDVtevJYGGvyQzJIAqm3XgpLhzOJWp6
 5lFbwhk+I/WGXrM1N8WyQBg=
X-Google-Smtp-Source: ABdhPJzlgd8R3KULDzy7Wf+4IXHOADMISz+MqMgw9sT6TIxXPVmxc+FPTwI+jfk6XQVmX8X399LY9w==
X-Received: by 2002:a05:6214:1142:: with SMTP id
 b2mr44943959qvt.0.1629900123360; 
 Wed, 25 Aug 2021 07:02:03 -0700 (PDT)
Received: from [192.168.10.222] ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id v23sm10031289qto.55.2021.08.25.07.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 07:02:03 -0700 (PDT)
Subject: Re: [PATCH v2 03/16] target/ppc: add exclusive user write function
 for MMCR0
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-4-danielhb413@gmail.com> <YSXI+9o7T8fun0Lg@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <57775fa9-3f45-76aa-2d12-db5b52fee2d8@gmail.com>
Date: Wed, 25 Aug 2021 11:01:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSXI+9o7T8fun0Lg@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.24,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/25/21 1:37 AM, David Gibson wrote:
> On Tue, Aug 24, 2021 at 01:30:19PM -0300, Daniel Henrique Barboza wrote:
>> From: Gustavo Romero <gromero@linux.ibm.com>
>>
>> Similar to the previous patch, user write on some PowerPC
>> PMU regs, in this case, MMCR0, is limited. Create a new
>> function to handle that.
> 
> Ok.. ok, this fixes my concern on the previous patch.  Best to avoid
> the confusing interim step though.  I'm not sure there's a lot of use
> adding the general "group A" helper if you're going to replace them
> with more specific functions shortly afterwards.

Perhaps we should merge patches  2 and 3 together. I'll also take into
consideration that patch 15 will also add custom handling of more PMU
regs and, perhaps, drop patch 1 entirely since the only control left
for groupA will be MMCRA which can either be added separately or ignored
(the kernel EBB tests doesn't bother with MMCRA permissions).



Daniel

> 
>>
>> CC: Gustavo Romero <gustavo.romero@linaro.org>
>> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/cpu_init.c  |  2 +-
>>   target/ppc/spr_tcg.h   |  1 +
>>   target/ppc/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index 5510c3799f..860716da18 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -6868,7 +6868,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
>>   static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>>   {
>>       spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
>> -                 &spr_read_MMCR0_ureg, &spr_write_PMU_groupA_ureg,
>> +                 &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
>>                    &spr_read_ureg, &spr_write_ureg,
>>                    0x00000000);
>>       spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
>> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
>> index 64ef2cd089..5c383dae3d 100644
>> --- a/target/ppc/spr_tcg.h
>> +++ b/target/ppc/spr_tcg.h
>> @@ -43,6 +43,7 @@ void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
>>   void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
>>   void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
>>   void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn);
>> +void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
>>   
>>   #ifndef CONFIG_USER_ONLY
>>   void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index ec4160378d..b48eec83e3 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -592,11 +592,49 @@ void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn)
>>       }
>>       spr_write_ureg(ctx, sprn, gprn);
>>   }
>> +
>> +void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
>> +{
>> +    TCGv t0, t1;
>> +
>> +    /*
>> +     * MMCR0 is a Group A SPR. The same write access control
>> +     * done in spr_write_PMU_groupA_ureg() applies.
>> +     */
>> +    if (ctx->pmcc_clear) {
>> +        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
>> +        return;
>> +    }
>> +
>> +    t0 = tcg_temp_new();
>> +    t1 = tcg_temp_new();
>> +
>> +    /*
>> +     * Filter out all bits but FC, PMAO, and PMAE, according
>> +     * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
>> +     * fourth paragraph.
>> +     */
>> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
>> +                    MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE);
>> +    gen_load_spr(t1, SPR_POWER_MMCR0);
>> +    tcg_gen_andi_tl(t1, t1, ~(MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE));
> 
> Since you're reusing them again here, definitely want a #define for
> this mask.
> 
>> +    /* Keep all other bits intact */
>> +    tcg_gen_or_tl(t1, t1, t0);
>> +    gen_store_spr(SPR_POWER_MMCR0, t1);
>> +
>> +    tcg_temp_free(t0);
>> +    tcg_temp_free(t1);
>> +}
>>   #else
>>   void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn)
>>   {
>>       spr_noaccess(ctx, gprn, sprn);
>>   }
>> +
>> +void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
>> +{
>> +    spr_noaccess(ctx, gprn, sprn);
>> +}
>>   #endif
>>   
>>   /* SPR common to all non-embedded PowerPC */
> 

