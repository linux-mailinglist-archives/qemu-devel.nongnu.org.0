Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941C341A390
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 01:07:17 +0200 (CEST)
Received: from localhost ([::1]:35592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUziO-00023S-5Z
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 19:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mUzgh-00011Q-Q4; Mon, 27 Sep 2021 19:05:31 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:44697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mUzgf-00073N-Q2; Mon, 27 Sep 2021 19:05:31 -0400
Received: by mail-qt1-x835.google.com with SMTP id r16so18216857qtw.11;
 Mon, 27 Sep 2021 16:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8WVElGmTY+erCtTAqmg/BYaHRVSdqNo1i5zkkInpyl0=;
 b=dS6dyNt2TEUx1y4/nTRHGeqU11S17JvORT1T0VVJBVAKgc55xCKjCEV4OSeEXq/UfG
 B+puoGx32kuAUXOdqGIunKfD9fJwjN0DvBmQgGOIXRD6k6C/L8p9HHSIkLTC0vessCET
 VsTtSWF6kjOq661hpX5ng3f1X57jGEQug0UogpIyZIgOcRQmxNgHdLgOWQ1P9TiVMmp2
 ZZSlEvx12P4AoSn+7nDc8Mgywjbhi/4TCpsPtvRoxh/I545CPFKBSGe91rRA9WIOcOVB
 mcogcK60Pjmj9bf+gYib0Cfew1qQ25DSSgGbQItsPY4ZkYI+oQIfLOkLC+hbKzxSSv3q
 QMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8WVElGmTY+erCtTAqmg/BYaHRVSdqNo1i5zkkInpyl0=;
 b=6BRuOZRxsoT7+mh7IrGEHP9DeOkcjNGWEPO/MUQYLETU6oy2gpVMXbmmiszlPbnRXS
 NHdul08hH2EPLQEiTPWa01rYt4I45TK1/vNUBMK+dfTB10dcAv5i4Q1UmX+sfUMVspkc
 I8rU+H+3OWMWfh+2wujGZUsk6d4PZucYdDE5jD6xUP3WyDD9Q0H0X+1D4y4lMrpC9/J0
 9/BYmOn6nJvnRnlXwV+8Rmm6p0G2beF5FFmEpGvtQNa60MPifZWp3HTFvUJwQmYGX7xJ
 zwzykBOpgTDhONzFE8foMO9tHv0J2fyYmL3ZDr3vDgjZmarbjHoFYMwWb66+7JIhV1ZO
 hfqg==
X-Gm-Message-State: AOAM533tZ8Aij3Jn7eMUyv7IL1s+keeT0Vodn3icqMAjHVI0fOeksfB8
 0jO/I3NGe3fJ5XoSdQBozqo=
X-Google-Smtp-Source: ABdhPJw54Cta5HXFqKlCYDu2lAsvjACvwmx7me4/Mik2Ma+DbSOhj0KJt9cVZ4VWqeq+XEttXwcfIw==
X-Received: by 2002:a05:622a:1111:: with SMTP id
 e17mr2448712qty.185.1632783926925; 
 Mon, 27 Sep 2021 16:05:26 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.40.88])
 by smtp.gmail.com with ESMTPSA id h2sm10285248qkk.10.2021.09.27.16.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 16:05:26 -0700 (PDT)
Message-ID: <2cdfcc63-df5d-5f50-acd0-89c00bf13732@gmail.com>
Date: Mon, 27 Sep 2021 20:05:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 02/15] target/ppc: add user write access control for
 PMU SPRs
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-3-danielhb413@gmail.com> <YTbCnSz86hsUAF/+@yekko>
 <587d197b-25a4-c5c2-3c3c-4132ac4cdf6b@gmail.com> <YVFR0kOUJ2yA6+hg@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YVFR0kOUJ2yA6+hg@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.136,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/27/21 02:08, David Gibson wrote:
> On Thu, Sep 23, 2021 at 11:39:14AM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 9/6/21 22:38, David Gibson wrote:
>>> On Fri, Sep 03, 2021 at 05:31:03PM -0300, Daniel Henrique Barboza wrote:
>>>> The PMU needs to enable writing of its uregs to userspace, otherwise
>>>> Perf applications will not able to setup the counters correctly. This
>>>> patch enables user space writing of all PMU uregs.
>>>>
>>>> MMCR0 is a special case because its userspace writing access is controlled
>>>> by MMCR0_PMCC bits. There are 4 configurations available (0b00, 0b01,
>>>> 0b10 and 0b11) but for our purposes here we're handling only
>>>> MMCR0_PMCC = 0b00. In this case, if userspace tries to write MMCR0, a
>>>> hypervisor emulation assistance interrupt occurs.
>>>>
>>>> This is being done by adding HFLAGS_PMCCCLEAR to hflags. This flag
>>>> indicates if MMCR0_PMCC is cleared (0b00), and a new 'pmcc_clear' flag in
>>>> DisasContext allow us to use it in spr_write_MMCR0_ureg().
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>    target/ppc/cpu.h         |  1 +
>>>>    target/ppc/cpu_init.c    | 18 +++++++-------
>>>>    target/ppc/helper_regs.c |  3 +++
>>>>    target/ppc/spr_tcg.h     |  3 ++-
>>>>    target/ppc/translate.c   | 53 +++++++++++++++++++++++++++++++++++++++-
>>>>    5 files changed, 67 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>>>> index f68bb8d8aa..8dfbb62022 100644
>>>> --- a/target/ppc/cpu.h
>>>> +++ b/target/ppc/cpu.h
>>>> @@ -616,6 +616,7 @@ enum {
>>>>        HFLAGS_SE = 10,  /* MSR_SE -- from elsewhere on embedded ppc */
>>>>        HFLAGS_FP = 13,  /* MSR_FP */
>>>>        HFLAGS_PR = 14,  /* MSR_PR */
>>>> +    HFLAGS_PMCCCLEAR = 15, /* PMU MMCR0 PMCC equal to 0b00 */
>>>>        HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
>>>>        HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
>>>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>>>> index 9efc6c2d87..bb5ea04c61 100644
>>>> --- a/target/ppc/cpu_init.c
>>>> +++ b/target/ppc/cpu_init.c
>>>> @@ -6867,7 +6867,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
>>>>    static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>>>>    {
>>>>        spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
>>>> -                 &spr_read_MMCR0_ureg, SPR_NOACCESS,
>>>> +                 &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
>>>>                     &spr_read_ureg, &spr_write_ureg,
>>>>                     0x00000000);
>>>>        spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
>>>> @@ -6875,31 +6875,31 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>>>>                     &spr_read_ureg, &spr_write_ureg,
>>>>                     0x00000000);
>>>>        spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
>>>> -                 &spr_read_ureg, SPR_NOACCESS,
>>>> +                 &spr_read_ureg, &spr_write_ureg,
>>>>                     &spr_read_ureg, &spr_write_ureg,
>>>>                     0x00000000);
>>>>        spr_register(env, SPR_POWER_UPMC1, "UPMC1",
>>>> -                 &spr_read_ureg, SPR_NOACCESS,
>>>> +                 &spr_read_ureg, &spr_write_ureg,
>>>
>>> Surely this can't be write.  AFAICT spr_write_ureg() will
>>> unconditionally allow full userspace write access.  That can't be
>>> right - otherwise the OS could never safely use the PMU for itself.
>>
>> My assumption here was that the user mode SPRs (UMMCR* and UPMC*) were created to
>> allow userspace read/write of PMU regs, while the regular regs (MMCR* and PMC*)
>> are the supermode privileged SPRs that can't be written by userspace. At least this
>> is my understanding from reading commit fd51ff6328e3d98158 that introduced these
>> userspace PMC regs.
> 
> Sure, but my point is that these registers are only userspace
> accessible under certain conditions, IIUC.  spr_write_ureg() doesn't
> test for those conditions, so it will *always* allow write access.


Got it.

I guess I'll end up biting the bullet and exposing both PMCC bits and adding
proper read/write access controls for the callbacks we need. This is somewhat
out of scope of my original goal with this series, but I guess we'll all better
off by doing it right now.

I'll add all the read/write ureg functions I'll need in the first patches (the PMC
write callback functions are on the patch 14, for instance). That will, hopefully,
making it easier to review the rest of the series by going through all the access
control and read/write callbacks early on.

Thanks,


Daniel

> 
>> The reason why these are marked as SPR_NOACCESS is because we didn't bothered
>> writing into them from userspace because we had no PMU logic to work
>> with.
> 
> [snip]
>>>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>>>> index b2ead144d1..0babde3131 100644
>>>> --- a/target/ppc/translate.c
>>>> +++ b/target/ppc/translate.c
>>>> @@ -175,6 +175,7 @@ struct DisasContext {
>>>>        bool spe_enabled;
>>>>        bool tm_enabled;
>>>>        bool gtse;
>>>> +    bool pmcc_clear;
>>>>        ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
>>>>        int singlestep_enabled;
>>>>        uint32_t flags;
>>>> @@ -561,7 +562,56 @@ void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
>>>>    {
>>>>        gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
>>>>    }
>>>> -#endif
>>>> +
>>>> +void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
>>>
>>>
>>> Could you put this def in the PMU specific file, rather than the
>>> enormous translate.c?
>>
>> Moving into the existing power8_pmu.c helper is annoying because, being a helper file,
>> there is no access to the whole DisasContext declaration (that is open coded in
>> translate.c), and other internal translate.c data like cpu_grp[].
> 
> Ah, right.  We should probably make that easier someday, but it's not
> reasonbly in scope for this series.
> 
>> What I was able to do is create a new file in the target/ppc/translate/ dir,
>> power8-pmu-regs.c.impl, and moved all these declarations over there. At very least we're
>> not overloading translate.c.
> 
> Ah, nice.
> 
>> Eldorado, is that ok with you guys? I'm aware that this dir was holding new
>> decode-tree insns implementations but, in this case, it would hold old format
>> spr_read/spr_write code.
> 

