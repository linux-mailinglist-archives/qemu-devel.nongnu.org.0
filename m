Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F35241527A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 23:12:02 +0200 (CEST)
Received: from localhost ([::1]:34634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT9X6-00057V-Ol
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 17:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mT9VR-0003LT-Aw; Wed, 22 Sep 2021 17:10:17 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:43869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mT9VJ-0000b6-P6; Wed, 22 Sep 2021 17:10:15 -0400
Received: by mail-qt1-x831.google.com with SMTP id a13so4132283qtw.10;
 Wed, 22 Sep 2021 14:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ccRdwO2AIV+iDY38X1o5VRZQKDWk4sMW+vd3oki8Eag=;
 b=U4HrAKYN1YdERUk3I7ve9p5r6uVYXTQSaOGwaZFqZES9pQuTwDUU0IFWRaymyaLisX
 ICOYhf5xzouxwH3Jq6ObAb9imkgga82t4oWQlGFYzWnHwpYOY+8nWX5yEid4ACb2rlRP
 wNOgOW71VAxFXcz7DMe+kXDUcRwBXo1r880eIm8WflViIbebqMnCpc3CrlvSBmkF7tqa
 G3qsZqTtwi6zuAhnn1GYC3Atvsy+POQwFXPrC5+yNlg1tSxlPU1euGrsGgQZdAFz3q8W
 wFS4N3EY132rs7Z5rFI3Rrkdpf2Mznmx4TaAV3ztPlWz49jAr70AIVnc/hidVVw4Oh43
 5x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ccRdwO2AIV+iDY38X1o5VRZQKDWk4sMW+vd3oki8Eag=;
 b=qQBpQqJ66mStLLnA3zHKBm5PPvaoHrOJ/q+6ghupdgAcXFp9lOIEkl+wMMQSLiWHoq
 e3hMUzEwieZwkmPJwAlzyPdj6oFSI02KkymNAFIMryX/C0wDuBcWKT+GA66EzpOU7yiG
 /+IoUfkBuvZTJKmyJ7oQcBPTZGql1hTR0n6SjX8LACPJ2Zp4r+tuBDGK6lwl/+3n4bpx
 6U3K6SC3OAuQyKRAcFxVor9iyI+3PyQa1qyUZB0PH0Bglk8FeCtjJkF8dNPTv+g/dyDq
 dAzal5+R0FzxHkMtz69nNTcEUDo5t+BJqvBU8CbBHn9oVmYnlqUqdOSwtFm9afY4HJuu
 mWkw==
X-Gm-Message-State: AOAM533aJeJw0gZqfMxyMQvlVp0OqZNk9V+eKgD/wyy8Ut+Q/0zAuuNH
 hTFmuxSqQ5VB5tndhxU/Rmg=
X-Google-Smtp-Source: ABdhPJw813yjxoWBbHGXKZ5sK7etrC0gsUOi+eVL9J8ay7Um/D8D5LHGud9lItsY1DM5RNPmH/NEhw==
X-Received: by 2002:ac8:5506:: with SMTP id j6mr1473449qtq.39.1632345007959;
 Wed, 22 Sep 2021 14:10:07 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id x19sm2419300qkm.115.2021.09.22.14.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 14:10:07 -0700 (PDT)
Message-ID: <ae7b1e96-5f54-db53-7dbe-a31b75a06208@gmail.com>
Date: Wed, 22 Sep 2021 18:10:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 01/15] target/ppc: add user read functions for MMCR0
 and MMCR2
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-2-danielhb413@gmail.com>
 <f628b376-8535-7297-a38f-aa243373e86b@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <f628b376-8535-7297-a38f-aa243373e86b@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x831.google.com
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>, richard.henderson@linaro.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/22/21 08:23, Matheus K. Ferst wrote:
> On 03/09/2021 17:31, Daniel Henrique Barboza wrote:
>> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
>>
>> From: Gustavo Romero <gromero@linux.ibm.com>
>>
>> We're going to add PMU support for TCG PPC64 chips, based on IBM POWER8+
>> emulation and following PowerISA v3.1.
>>
>> Let's start by handling the user read of UMMCR0 and UMMCR2. According to
>> PowerISA 3.1 these registers omit some of its bits from userspace.
>>
>> CC: Gustavo Romero <gustavo.romero@linaro.org>
>> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/cpu.h       | 10 ++++++++++
>>   target/ppc/cpu_init.c  |  4 ++--
>>   target/ppc/spr_tcg.h   |  2 ++
>>   target/ppc/translate.c | 37 +++++++++++++++++++++++++++++++++++++
>>   4 files changed, 51 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 500205229c..f68bb8d8aa 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -342,6 +342,16 @@ typedef struct ppc_v3_pate_t {
>>   #define MSR_RI   1  /* Recoverable interrupt                        1        */
>>   #define MSR_LE   0  /* Little-endian mode                           1 hflags */
>>
>> +/* PMU bits */
>> +#define MMCR0_FC    PPC_BIT(32)         /* Freeze Counters  */
>> +#define MMCR0_PMAO  PPC_BIT(56)         /* Perf Monitor Alert Ocurred */
>> +#define MMCR0_PMAE  PPC_BIT(37)         /* Perf Monitor Alert Enable */
>> +#define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable */
>> +#define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
>> +#define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
>> +/* MMCR0 userspace r/w mask */
>> +#define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
>> +
>>   /* LPCR bits */
>>   #define LPCR_VPM0         PPC_BIT(0)
>>   #define LPCR_VPM1         PPC_BIT(1)
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index ad7abc6041..9efc6c2d87 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -6867,7 +6867,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
>>   static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>>   {
>>       spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
>> -                 &spr_read_ureg, SPR_NOACCESS,
>> +                 &spr_read_MMCR0_ureg, SPR_NOACCESS,
>>                    &spr_read_ureg, &spr_write_ureg,
>>                    0x00000000);
>>       spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
>> @@ -6975,7 +6975,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
>>   static void register_power8_pmu_user_sprs(CPUPPCState *env)
>>   {
>>       spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
>> -                 &spr_read_ureg, SPR_NOACCESS,
>> +                 &spr_read_MMCR2_ureg, SPR_NOACCESS,
>>                    &spr_read_ureg, &spr_write_ureg,
>>                    0x00000000);
>>       spr_register(env, SPR_POWER_USIER, "USIER",
>> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
>> index 0be5f347d5..30cb6c3fdc 100644
>> --- a/target/ppc/spr_tcg.h
>> +++ b/target/ppc/spr_tcg.h
>> @@ -32,6 +32,8 @@ void spr_write_lr(DisasContext *ctx, int sprn, int gprn);
>>   void spr_read_ctr(DisasContext *ctx, int gprn, int sprn);
>>   void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
>>   void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
>> +void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
>> +void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn);
>>   void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
>>   void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
>>   void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 171b216e17..b2ead144d1 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -519,6 +519,43 @@ void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
>>       gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
>>   }
>>
>> +void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
>> +{
>> +    TCGv t0 = tcg_temp_new();
>> +
>> +    /*
>> +     * Filter out all bits but FC, PMAO, and PMAE, according
>> +     * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
>> +     * fourth paragraph.
>> +     */
>> +    gen_load_spr(t0, SPR_POWER_MMCR0);
>> +    tcg_gen_andi_tl(t0, t0, MMCR0_UREG_MASK);
>> +    tcg_gen_mov_tl(cpu_gpr[gprn], t0);
> 
>  From the other patches, it seems that the focus is in the MMCR0[PMCC] = 0b00 case, but I would note that the PMCC field description says that when MMCR0[PMCC] = 0b01, "Group A is not allowed to be read or written in problem state." If this case doesn't matter for this initial implementation, it'd be nice to leave a comment (XXX/TODO/etc.) saying that it's not handled. Otherwise, I think we'll need a helper or add both PMCC bits to hflags.

This is correct. The reason why PMCC = 0b00 is being handled is because a PMU
kernel selftest exercises this case expecting write failures.

The other 3 cases (all other three PMCC values) aren't being considered. For
instance, the case you just mentioned would require not just MMCR0, but all
the PMCs and MMCR2 to also have problem state read/write forbidden. PMCC 0b11
would remove PMC5 and PMC6 from the Performance Monitor altogether. All of
this is described in the ISA but it's not being used by the PMU/EBB test
case I've been using.

I'll take your advice and add a comment in the code/commit message explaining the
reasoning why PMCC 0b00 is the only case being handled. We can add additional
PMCC controls in a follow-up work of this implementation.


Thanks,


Daniel

> 
>> +
>> +    tcg_temp_free(t0);
>> +}
>> +
>> +void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn)
>> +{
>> +    TCGv t0 = tcg_temp_new();
>> +
>> +    /*
>> +     * On read, filter out all bits that are not FCnP0 bits.
>> +     * When MMCR0[PMCC] is set to 0b10 or 0b11, providing
>> +     * problem state programs read/write access to MMCR2,
>> +     * only the FCnP0 bits can be accessed. All other bits are
>> +     * not changed when mtspr is executed in problem state, and
>> +     * all other bits return 0s when mfspr is executed in problem
>> +     * state, according to ISA v3.1, section 10.4.6 Monitor Mode
>> +     * Control Register 2, p. 1316, third paragraph.
>> +     */
>> +    gen_load_spr(t0, SPR_POWER_MMCR2);
>> +    tcg_gen_andi_tl(t0, t0, 0x4020100804020000UL);
>> +    tcg_gen_mov_tl(cpu_gpr[gprn], t0);
>> +
>> +    tcg_temp_free(t0);
>> +}
>> +
>>   #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>>   void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
>>   {
>> -- 
>> 2.31.1
>>
> 
> 

