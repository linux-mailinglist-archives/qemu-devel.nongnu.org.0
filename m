Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE36BAA9B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 09:20:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcMLS-0003bW-5C; Wed, 15 Mar 2023 04:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcMLQ-0003XW-1v
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:18:48 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcMLO-0000kR-4f
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:18:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id m35so2411753wms.4
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 01:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678868324;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hP7UKIcczD1Gsku9J8XCiP6Jw6U+DytS/gJqxqy+XVk=;
 b=QltlaN09STyuyGg/031aEOel1W7D1zQ6siuPUDyJ9LXGitv5t4JYZbHznVSJAFnpaY
 mz2cpF6ESH4mfDhMzLvNET7Y1UOr/GTq4H/ooApg6OwkCSEBwAunqDbarlkNTsMupfGr
 NlFevfOD8N8/oC4QvF4g5SVEzY7L5SZtvw9fWgXxMzjJScccdWepvwzpxKM8YiLQHy2j
 snoi21yHhx9FMyc4fAvUMJIsG6VOIpYkVK1L4mQScqzbRNO15a+RkMKbcs/7qmUglpIa
 3lAn44Z5unnP9U8TQqII6W5LOs5ruBbSaNdV130iV54k3Oxfm4r6zPfcenT2hoziQao8
 j54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678868324;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hP7UKIcczD1Gsku9J8XCiP6Jw6U+DytS/gJqxqy+XVk=;
 b=6JlRN3W77V5Rf+IBJSdgKJElATDCSCB9agkm9Dcg6YJJwKQ/YnEBPGXIeU4PkUtulL
 1sgFesEbUHyWlr2h7us3nUtkW8gnFFBl/mVwlBzqsZStSkE6y/e6goJY01QS6Z38qRMQ
 PvZAAypnZtMhb8QXMlrvIyHQjVTLi2Uaf+ARLGi9EmSSpWd7oe2hk7/FE8e7rJdeoF/k
 YS12WWJKrhZl4QVlO45s5C1AFAAaXBIrQQIXF9Z0cxxo/fHOFf/MzMi9v7WctigSQTJF
 SPDyJqkIN4HxGMdHZ6U17AWbLlPy9YpnMhQGz24Iq0D/wbNTe5m0ytKQa8iTbxbGPLIn
 apEA==
X-Gm-Message-State: AO0yUKXSqH5zyqeJKTXUNog8NUDrCI/rEyeydyY0Gqq0c4URjf875Hke
 cuomg7LYh8bgl7XiGF0aHVnPwA==
X-Google-Smtp-Source: AK7set+djUIDvIn/LICkQ0m0VBImIHdTGUNeE5GWdsQgulaeYg5F1s56dokdNGxGVUTWoo3c/80+Hw==
X-Received: by 2002:a05:600c:4ecf:b0:3ed:3522:689a with SMTP id
 g15-20020a05600c4ecf00b003ed3522689amr566690wmq.7.1678868324332; 
 Wed, 15 Mar 2023 01:18:44 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n22-20020a7bcbd6000000b003eb395a8280sm1046603wmi.37.2023.03.15.01.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 01:18:43 -0700 (PDT)
Message-ID: <616442ce-157f-2ca2-5cf8-b0f67cdf47be@linaro.org>
Date: Wed, 15 Mar 2023 09:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user/mips: Low down switchable NaN2008 requirement
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: QEMU devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
References: <20230211173401.13902-1-jiaxun.yang@flygoat.com>
 <aca2a158-ebb6-4010-3b94-8b60026a30ac@linaro.org>
 <A26A47BA-643C-46AE-B148-2B06A1D7BDAB@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <A26A47BA-643C-46AE-B148-2B06A1D7BDAB@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/23 13:39, Jiaxun Yang wrote:
> 
> 
>> 2023年3月9日 12:32，Philippe Mathieu-Daudé <philmd@linaro.org> 写道：
>>
>> Hi Jiaxun,
>>
>> On 11/2/23 18:34, Jiaxun Yang wrote:
>>> Previously switchable NaN2008 requires fcsr31.nan2008 to be writable
>>> for guest. However as per MIPS arch spec this bit can never be writable.
>>> This cause NaN2008 ELF to be rejected by QEMU.
>>> NaN2008 can be enabled on R2~R5 processors, just make it available
>>> unconditionally.
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>>   linux-user/mips/cpu_loop.c | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
>>> index d5c1c7941d..b5c2ca4a3e 100644
>>> --- a/linux-user/mips/cpu_loop.c
>>> +++ b/linux-user/mips/cpu_loop.c
>>> @@ -301,8 +301,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
>>>       }
>>>       if (((info->elf_flags & EF_MIPS_NAN2008) != 0) !=
>>>           ((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) != 0)) {
>>> -        if ((env->active_fpu.fcr31_rw_bitmask &
>>> -              (1 << FCR31_NAN2008)) == 0) {
>>> +        if (!(env->insn_flags & ISA_MIPS_R2)) {
>>>               fprintf(stderr, "ELF binary's NaN mode not supported by CPU\n");
>>>               exit(1);
>>>           }
>>
>> Looking at R6.06 revision history:
>>
>>   5.03 August 21, 2013
>>
>>   • ABS2008 and NAN2008 fields of Table 5.7 “FCSR RegisterField
>>     Descriptions” were optional in release 3 and could be R/W,
>>     but as of release 5 are required, read-only, and preset by
>>     hardware.
>> So I tried with this change:
>>
>> -- >8 --
>> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
>> index 05caf54999..5f1364ffaf 100644
>> --- a/target/mips/cpu.c
>> +++ b/target/mips/cpu.c
>> @@ -243,6 +243,13 @@ static void mips_cpu_reset_hold(Object *obj)
>>      env->CP0_EBaseWG_rw_bitmask = env->cpu_model->CP0_EBaseWG_rw_bitmask;
>>      env->active_fpu.fcr0 = env->cpu_model->CP1_fcr0;
>>      env->active_fpu.fcr31_rw_bitmask = env->cpu_model->CP1_fcr31_rw_bitmask;
>> +    if (env->insn_flags & ISA_MIPS_R5) {
>> +        assert(!(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << FCR31_ABS2008)));
>> +        assert(!(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << FCR31_NAN2008)));
>> +    } else if (env->insn_flags & ISA_MIPS_R3) {
>> +        assert(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << FCR31_ABS2008));
>> +        assert(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << FCR31_NAN2008));
>> +    }
>>      env->active_fpu.fcr31 = env->cpu_model->CP1_fcr31;
>>      env->msair = env->cpu_model->MSAIR;
>>      env->insn_flags = env->cpu_model->insn_flags;
>> ---
>>
>> and got:
>>
>> $ for cpu in $(./qemu-system-mips64el -cpu help | cut -d\' -f2); do \
>>   echo -n ${cpu}...;echo q \
>>   | ./qemu-system-mips64el -accel tcg -cpu ${cpu} \
>>                            -S -monitor stdio 1> /dev/null || break; \
>>   echo OK; done
>> 4Kc...OK
>> 4Km...OK
>> 4KEcR1...OK
>> 4KEmR1...OK
>> 4KEc...OK
>> 4KEm...OK
>> 24Kc...OK
>> 24KEc...OK
>> 24Kf...OK
>> 34Kf...OK
>> 74Kf...OK
>> M14K...OK
>> M14Kc...OK
>> P5600...OK
>> mips32r6-generic...OK
>> I7200...OK
>> R4000...OK
>> VR5432...OK
>> 5Kc...OK
>> 5Kf...OK
>> 20Kc...OK
>> MIPS64R2-generic...OK
>> 5KEc...OK
>> 5KEf...OK
>> I6400...OK
>> I6500...OK
>> Loongson-2E...OK
>> Loongson-2F...OK
>> Loongson-3A1000...OK
>> Loongson-3A4000...OK
>> mips64dspr2...OK
>> Octeon68XX...OK
>> $
> 
> Well that’s because there is no CPU being marked as MIPS Release 3 in QEMU, and only
> P5600 is marked as MIPS Release 5.
> 
> In reality R3 implementations are all advertising themself as R2, and later RCs of microAptiv
> and interaptiv can all be configured as NaN2008 only. So for those CPUs we have binary compiled
> with -march=mips32r2 -mnan=2008.
> 
> Given that default CPU of mips32r2 in QEMU is 24Kf, I think the best approach to deal with such
> situation is to allow NaN2008 to be enabled for early processors for linux-user.
> 
> There is a NAN2008 Debian port for test:
> 
> http://repo.oss.cipunited.com/mipsel-nan2008/tarball/sid-mipsel-nan2008-20230309-1.tar.xz

$ qemu-mipsel -L sid-mipsel-nan2008-20230313-1/usr -cpu P5600 
usr/bin/uname  -ms
Linux mips

What about something like:

-- >8 --
--- a/linux-user/mips/target_elf.h
+++ b/linux-user/mips/target_elf.h
@@ -15,6 +15,9 @@ static inline const char *cpu_get_model(uint32_t eflags)
      if ((eflags & EF_MIPS_MACH) == EF_MIPS_MACH_5900) {
          return "R5900";
      }
+    if (eflags & EF_MIPS_NAN2008) {
+        return "P5600";
+    }
      return "24Kf";
  }
  #endif
---

