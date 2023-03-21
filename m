Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691616C36AF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 17:15:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peed7-0005uE-Om; Tue, 21 Mar 2023 12:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peed3-0005u1-OS
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:14:29 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peed1-0007XE-MJ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:14:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id b20so28864025edd.1
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679415265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X0kWTB1iXenFk89MkLU5Vmtnk1JszIPCSdtUjAlOIaA=;
 b=pnfWcQb59EUR6e0RqSG/yiE9L06wlrIxFeKB1ch0NzmtcsGiPYGAj0xhx5nygYsiax
 XTPGiZY2MVV31rnCluOQllaaVcK/qYeNS7WCrbFCxOV3SWdjanTj1AIlw8vmI41ITLON
 XCsDrRrtKQzBZlLTw/ZFrO7xJQKsstorBLKXuCfQaJyLNkQonqjQC1fPfeXgkfZIYVj4
 WnBSPu0hPmz3KnXd5Ts2Vbb7RBacktuw7lIxdZK1YZoSoufsK2nNcuH9izv1gEkUzGPK
 md+GvvL9cX6N8LCvnggfymfk58UNldIlX6XNXs+8LoCWgFe2zD7wqE9CLcuoV76j7TdT
 2wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679415265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X0kWTB1iXenFk89MkLU5Vmtnk1JszIPCSdtUjAlOIaA=;
 b=uZzNfnJbURdHaPoBgUeNfXMafjKB7qa9q/+2+2pZADZrlX0Ygf1KhU2wiR2GAagQP7
 0SMtg8W2TAmJbYuqjukY16bjiKM6hrvEgZSI+Z7wgEF4COFF1fXFwA2Amdl/o937gSuY
 TB/SxqqrhTWDVWmPpd2izH18iI1PP0qAj+lr3Fcoc2Cb4p9VewudDs3Vg6/Fg7Q3kL1D
 YrjWMF4lu3F+u9ZwO5jTztuvs5eh1XuAW3gCe2CQ2pZh3KPjysAQ2ocMZtn+g+X0PMJX
 k5yBFd/wKpFedaNvY8eoSts/D0829uDY4QW4JNMEmnbrjGbqEgEXpacJU+oEXFyRaLU1
 9kRw==
X-Gm-Message-State: AO0yUKV2WWvtBekOCvcRkh1jXQ+rDjpfsUvE+ecttNMxkYN1E41TWKuu
 EgO2nZjBteLTZpYZY5L59yAuWg==
X-Google-Smtp-Source: AK7set8Ajdyw/E1HW5f1eguuTc8u36voaYAHaEnNTu8Wm8AB/cPgTPtwsrqAXcwsuyeaSRwIdZyg2Q==
X-Received: by 2002:a17:906:135a:b0:933:4c63:a522 with SMTP id
 x26-20020a170906135a00b009334c63a522mr3607251ejb.31.1679415265560; 
 Tue, 21 Mar 2023 09:14:25 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 u24-20020a17090657d800b00934823127c8sm2813609ejr.78.2023.03.21.09.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 09:14:24 -0700 (PDT)
Message-ID: <01b25d58-42ab-7985-75b3-effb29b92a0c@linaro.org>
Date: Tue, 21 Mar 2023 17:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] linux-user/mips: Low down switchable NaN2008 requirement
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: QEMU devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
References: <20230211173401.13902-1-jiaxun.yang@flygoat.com>
 <aca2a158-ebb6-4010-3b94-8b60026a30ac@linaro.org>
 <A26A47BA-643C-46AE-B148-2B06A1D7BDAB@flygoat.com>
 <616442ce-157f-2ca2-5cf8-b0f67cdf47be@linaro.org>
 <94E0E41A-5B77-4DE0-B45C-9561239F30B9@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <94E0E41A-5B77-4DE0-B45C-9561239F30B9@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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

On 21/3/23 10:23, Jiaxun Yang wrote:
>> 2023年3月15日 08:18，Philippe Mathieu-Daudé <philmd@linaro.org> 写道：
>> On 11/3/23 13:39, Jiaxun Yang wrote:
>>>> 2023年3月9日 12:32，Philippe Mathieu-Daudé <philmd@linaro.org> 写道：
>>>> On 11/2/23 18:34, Jiaxun Yang wrote:
>>>>> Previously switchable NaN2008 requires fcsr31.nan2008 to be writable
>>>>> for guest. However as per MIPS arch spec this bit can never be writable.
>>>>> This cause NaN2008 ELF to be rejected by QEMU.
>>>>> NaN2008 can be enabled on R2~R5 processors, just make it available
>>>>> unconditionally.
>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> ---
>>>>>   linux-user/mips/cpu_loop.c | 3 +--
>>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
>>>>> index d5c1c7941d..b5c2ca4a3e 100644
>>>>> --- a/linux-user/mips/cpu_loop.c
>>>>> +++ b/linux-user/mips/cpu_loop.c
>>>>> @@ -301,8 +301,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
>>>>>       }
>>>>>       if (((info->elf_flags & EF_MIPS_NAN2008) != 0) !=
>>>>>           ((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) != 0)) {
>>>>> -        if ((env->active_fpu.fcr31_rw_bitmask &
>>>>> -              (1 << FCR31_NAN2008)) == 0) {
>>>>> +        if (!(env->insn_flags & ISA_MIPS_R2)) {
>>>>>               fprintf(stderr, "ELF binary's NaN mode not supported by CPU\n");
>>>>>               exit(1);
>>>>>           }
>>>>
>>>> Looking at R6.06 revision history:
>>>>
>>>>   5.03 August 21, 2013
>>>>
>>>>   • ABS2008 and NAN2008 fields of Table 5.7 “FCSR RegisterField
>>>>     Descriptions” were optional in release 3 and could be R/W,
>>>>     but as of release 5 are required, read-only, and preset by
>>>>     hardware.

>>> Well that’s because there is no CPU being marked as MIPS Release 3 in QEMU, and only
>>> P5600 is marked as MIPS Release 5.
>>> In reality R3 implementations are all advertising themself as R2, and later RCs of microAptiv
>>> and interaptiv can all be configured as NaN2008 only. So for those CPUs we have binary compiled
>>> with -march=mips32r2 -mnan=2008.
>>> Given that default CPU of mips32r2 in QEMU is 24Kf, I think the best approach to deal with such
>>> situation is to allow NaN2008 to be enabled for early processors for linux-user.
>>> There is a NAN2008 Debian port for test:
>>> http://repo.oss.cipunited.com/mipsel-nan2008/tarball/sid-mipsel-nan2008-20230309-1.tar.xz
>>
>> $ qemu-mipsel -L sid-mipsel-nan2008-20230313-1/usr -cpu P5600 usr/bin/uname  -ms
>> Linux mips
>>
>> What about something like:
> 
> That would lost capability of testing NaN2008 binaries again other CPU models.

Why? cpu_get_model() is just a hint, see linux-user/main.c::main():

     if (cpu_model == NULL) {
         cpu_model = cpu_get_model(get_elf_eflags(execfd));
     }

>> -- >8 --
>> --- a/linux-user/mips/target_elf.h
>> +++ b/linux-user/mips/target_elf.h
>> @@ -15,6 +15,9 @@ static inline const char *cpu_get_model(uint32_t eflags)
>>      if ((eflags & EF_MIPS_MACH) == EF_MIPS_MACH_5900) {
>>          return "R5900";
>>      }
>> +    if (eflags & EF_MIPS_NAN2008) {
>> +        return "P5600";
>> +    }
>>      return "24Kf";
>> }
>> #endif
>> ---
> 
> 


