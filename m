Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1720941646D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 19:29:29 +0200 (CEST)
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTSXI-0000sE-4N
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 13:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTSLL-0001nD-14
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:17:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTSLJ-0002KK-8e
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:17:06 -0400
Received: by mail-wr1-x429.google.com with SMTP id w17so19154192wrv.10
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=IcxOE6A+hEpX81wNcK2l45Key6ikm0db4+PnQOrmOuE=;
 b=f2KKnf45BMyY8GLdKxa6DYU+FivBkQhEekEpUErqaiW8Mq6x8cEih0ITvTK4KxbxUX
 RFSAwfyiyYWsgvB6NI0CpGaL4UfTDqCkm8OpZJ+ZdfcRbrBc9B0sjVE1ICr/jBq2Dvf2
 6UBEejQuMQohqG5Xo8ATYEGozyhtiZ0ot11aGH19JnJ1Itp8r+BRlNGF+i4L1agE/JaO
 RJzefaPU4mV90xHt/NA29p381niCbn05JyqRqIEIVnvFydwNJMulSJdJ+B0y3e+GbqMi
 kV3DsGbl6SfTvt/NuPw8vCznBnkIn39R9uM2SJE78S8tUPP+TYoDkyt3Sc/Pp8jx0dLf
 AD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=IcxOE6A+hEpX81wNcK2l45Key6ikm0db4+PnQOrmOuE=;
 b=nUIlco4/ljpHfu3drE1+EOAiYyHFu5CjtzU8yFl/uzXFRUwuWOXgupelnvnJ/2C6SH
 OQFshTzoI3T5X4+JbXMTk8RTzDfDozGPNThMLjfzwc+TLvnAcvftuM93ULDRgie6ZD1x
 HV+rbCiDlBLvfZ4NpQYp44qQZptGWuU1hHP2hHtjskzJxayK4Kl78K1BNx0sxqIMAuDg
 VGkJ/jUd8EJYbNG6zF3ZiGBrAHjajPf/aGxnnwD+N3rgvrJOJzQfkXIf+eUyXYYXwFtg
 Oi2bbbB23f2Vg/3ejDOtm8jr9HS9X2iN7PBQvFP8bykzR+ckPv1GD+Ts7BX16DgalgPB
 kXnw==
X-Gm-Message-State: AOAM531Nsm2dodWxQzjRDOLB7RZfh49JQMnRRjRuQhSN1HH0gxlRy7xV
 dLuwdzW/QmMaNZt66Q3hcns=
X-Google-Smtp-Source: ABdhPJzm2rutpTEqldTa53c+Onhs5jd1P37XBSu3VQudD1C3rrvm1OKwQgLjGgKl/OAY8rsALsgkBw==
X-Received: by 2002:a5d:664c:: with SMTP id f12mr6574834wrw.213.1632417422685; 
 Thu, 23 Sep 2021 10:17:02 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id h125sm6090305wmh.9.2021.09.23.10.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 10:17:02 -0700 (PDT)
Message-ID: <45484122-fbea-434d-2edf-70a587b39cc3@amsat.org>
Date: Thu, 23 Sep 2021 19:17:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 01/31] target/arm: Implement arm_v7m_cpu_has_work()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-2-f4bug@amsat.org>
 <CAFEAcA_UfuKjXamxH-Y-4rs2mu+JM=7p8tGc2QixzPzDqZxcWg@mail.gmail.com>
 <90d882ac-968e-26f0-e5a4-8a2a401119cc@amsat.org>
In-Reply-To: <90d882ac-968e-26f0-e5a4-8a2a401119cc@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Michael Davidsaver <mdavidsaver@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 9/21/21 11:45, Philippe Mathieu-Daudé wrote:
> On 9/21/21 11:34, Peter Maydell wrote:
>> On Mon, 20 Sept 2021 at 22:44, Philippe Mathieu-Daudé 
>> <f4bug@amsat.org> wrote:
>>>
>>> Implement SysemuCPUOps::has_work() handler for the ARM v7M CPU.
>>>
>>> See the comments added in commit 7ecdaa4a963 ("armv7m: Fix
>>> condition check for taking exceptions") which eventually
>>> forgot to implement this has_work() handler:
>>
>> Huh? M-profile and A-profile share the same arm_cpu_has_work()
>> function. Some of the checks the code there does are perhaps
>> unnecessary for M-profile, but they're harmless.

A v7M core is registered as (example for Cortex-M0):

static const ARMCPUInfo arm_tcg_cpus[] = {
     ...
     { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
                              .class_init = arm_v7m_class_init },


static void arm_tcg_cpu_register_types(void)
{
     ...
     for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
         arm_cpu_register(&arm_tcg_cpus[i]);


void arm_cpu_register(const ARMCPUInfo *info)
{
     TypeInfo type_info = {
         .parent = TYPE_ARM_CPU,
         .instance_size = sizeof(ARMCPU),
         .instance_align = __alignof__(ARMCPU),
         .instance_init = arm_cpu_instance_init,
         .class_size = sizeof(ARMCPUClass),
         .class_init = info->class_init ?: cpu_register_class_init,
         .class_data = (void *)info,
     };

Since we provide info->class_init as arm_v7m_class_init(), only
tcg_ops and gdb_core_xml_file from CPUClass are set:

static void arm_v7m_class_init(ObjectClass *oc, void *data)
{
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);

     acc->info = data;
#ifdef CONFIG_TCG
     cc->tcg_ops = &arm_v7m_tcg_ops;
#endif /* CONFIG_TCG */

     cc->gdb_core_xml_file = "arm-m-profile.xml";
}

Thus v7M cores end calling cpu_common_has_work() registered by
cpu_class_init(), which is:

static bool cpu_common_has_work(CPUState *cs)
{
     return false;
}

What am I missing?

>>
>>>    * ARMv7-M interrupt masking works differently than -A or -R.
>>>    * There is no FIQ/IRQ distinction.
>>>
>>> The NVIC signal any pending interrupt by raising ARM_CPU_IRQ
>>> (see commit 56b7c66f498: "armv7m: QOMify the armv7m container")
>>> which ends setting the CPU_INTERRUPT_HARD bit in interrupt_request.
>>>
>>> Thus arm_v7m_cpu_has_work() implementation is thus quite trivial,
>>> we simply need to check for this bit.
>>>
>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>> Cc: Michael Davidsaver <mdavidsaver@gmail.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   target/arm/cpu_tcg.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
>>> index 0d5adccf1a7..da348938407 100644
>>> --- a/target/arm/cpu_tcg.c
>>> +++ b/target/arm/cpu_tcg.c
>>> @@ -23,6 +23,11 @@
>>>   #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>>>
>>>   #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>>> +static bool arm_v7m_cpu_has_work(CPUState *cs)
>>> +{
>>> +    return cs->interrupt_request & CPU_INTERRUPT_HARD;
>>> +}
>>
>> This seems to be missing at least the check on
>> cpu->power_state and the CPU_INTERRUPT_EXITTB test.
>>
>> Is there any reason why we shouldn't just continue to
>> share the same function between A and M profile, and avoid
>> the extra function and the ifdefs ?
> 
> The only reason I can think of is I should have been resting
> instead of posting this patch :/ I'll re-use arm_cpu_has_work()
> which is, as you said, harmless and safer.
> 

