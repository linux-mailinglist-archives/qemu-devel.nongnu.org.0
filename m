Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD54EE111
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:49:18 +0200 (CEST)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzrB-00037I-Bh
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:49:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZzpB-0001N3-Ur; Thu, 31 Mar 2022 14:47:13 -0400
Received: from [2001:4860:4864:20::2b] (port=45088
 helo=mail-oa1-x2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZzp0-0008J8-5U; Thu, 31 Mar 2022 14:47:09 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d6ca46da48so185072fac.12; 
 Thu, 31 Mar 2022 11:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Kfu3XJGCw09xIJg1m8ZIPKoghmARed45HEYyhgE/zyw=;
 b=IcXQl/+t0nSX65RG37G/PabVfz8Ug+65nYBQajycJWJ4m4Qr37dJgtyB7BPVyBghXQ
 tpJRx7rm45GEnT+tkVKQmxmIXB6KHPf2cMoA39JWN+F/hhYJFz94fqZgIXnCCoM4xa1Z
 G6qNx/QeRGwLPFjHadkXLst0aH5v6IwGRtsFD/LjcUunqnv9/vJVISwB5XXXVhQvSSfb
 pURPgXfyWOskGflYcW4PUBTsQ3eqlc0TorowmQbFGnzjk/Ya+hthGo5n0pGu8oTjFJY8
 KPvnLI4SY//GQfbwIbDHv03SJ1Ukw3slduEHOHCQZFRJhk+VVw2VN2zlF3LUV+q9zKbL
 p2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Kfu3XJGCw09xIJg1m8ZIPKoghmARed45HEYyhgE/zyw=;
 b=GkuKXfmfhdUjBSL6miuyyMcqLeqS/8sc4YS/Ppna6zl5xttThznno20N8HR80mrjqn
 XnEomNPHHcRxzHg6dgXP/wg2/QeC3BqIrDB4kNDo/3gMZVuHcVlvHT/WRXGJQpR+S44J
 qEjrOi9ErSDsu0irTOjIAVMNdvQIR6qKlBca6bKzejXsIksht24vV6G+SPZ+MaRNYCmY
 GKwvs4kcVxBbEdbZVQjGBD7Bp0DQkyoivkrTO5AbmPwtF0FO8DGGjsQsh9PkVVf+qEeX
 EdUbHKJzT8oSiQ8yXRPhvPc+62TcNGmcxJ7AtdtLqaS6Cj2YvblLUQg81yCX0ZtTRfHR
 blnw==
X-Gm-Message-State: AOAM531YQC4IlWHadqpUt7FYUKp9BmBhNYoth4HRTP2J0jAEpclAwrcD
 Vc/2KVQvChnLT5vNALB7ix8=
X-Google-Smtp-Source: ABdhPJxicLpGpZ4uz8OMASeLkp6FE1vdoBOskDx8Qf/Fm/xrLVNVwsNTTaYZc+b3ejboK818x4n3iA==
X-Received: by 2002:a05:6870:9a1b:b0:dd:bce0:b687 with SMTP id
 fo27-20020a0568709a1b00b000ddbce0b687mr3324228oab.243.1648752420573; 
 Thu, 31 Mar 2022 11:47:00 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:abe8:ed:2c78:ab0c:7946?
 ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 r129-20020acac187000000b002ef358c6e0esm73144oif.49.2022.03.31.11.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 11:47:00 -0700 (PDT)
Message-ID: <b292e516-80dc-9e5c-991b-49c77c0fe044@gmail.com>
Date: Thu, 31 Mar 2022 15:46:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/4] target/ppc: init 'lpcr' in
 kvmppc_enable_cap_large_decr()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220331001717.616938-1-danielhb413@gmail.com>
 <20220331001717.616938-3-danielhb413@gmail.com> <YkUDCdUsjjmzFgJr@yekko>
 <d5b622c6-81b4-9d3f-9777-5233fe5a2be4@gmail.com>
 <5e48daaf-d881-2588-c323-30a9bc95a75f@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <5e48daaf-d881-2588-c323-30a9bc95a75f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2b
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: clg@kaod.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/31/22 14:36, Richard Henderson wrote:
> On 3/31/22 11:17, Daniel Henrique Barboza wrote:
>>> Hmm... this is seeming a bit like whack-a-mole.  Could we instead use
>>> one of the valgrind hinting mechanisms to inform it that
>>> kvm_get_one_reg() writes the variable at *target?
>>
>> I didn't find a way of doing that looking in the memcheck helpers
>> (https://valgrind.org/docs/manual/mc-manual.html section 4.7). That would be a
>> good way of solving this warning because we would put stuff inside a specific
>> function X and all callers of X would be covered by it.
>>
>> What I did find instead is a memcheck macro called VALGRIND_MAKE_MEM_DEFINED that
>> tells Valgrind that the var was initialized.
>>
>> This patch would then be something as follows:
>>
>>
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index dc93b99189..b0e22fa283 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -56,6 +56,10 @@
>>   #define DEBUG_RETURN_GUEST 0
>>   #define DEBUG_RETURN_GDB   1
>>
>> +#ifdef CONFIG_VALGRIND_H
>> +#include <valgrind/memcheck.h>
>> +#endif
>> +
>>   const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>       KVM_CAP_LAST_INFO
>>   };
>> @@ -2539,6 +2543,10 @@ int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
>>       CPUState *cs = CPU(cpu);
>>       uint64_t lpcr;
>>
>> +#ifdef CONFIG_VALGRIND_H
>> +    VALGRIND_MAKE_MEM_DEFINED(lpcr, sizeof(uint64_t));
>> +#endif
>> +
>>       kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
>>       /* Do we need to modify the LPCR? */
>>
>>
>> CONFIG_VALGRIND_H needs 'valgrind-devel´ installed.
>>
>> I agree that this "Valgrind is complaining about variable initialization" is a whack-a-mole
>> situation that will keep happening in the future if we keep adding this same code pattern
>> (passing as reference an uninitialized var). For now, given that we have only 4 instances
>> to fix it in ppc code (as far as I'm aware of), and we don't have a better way of telling
>> Valgrind that we know what we're doing, I think we're better of initializing these vars.
> 
> I would instead put this annotation inside kvm_get_one_reg, so that it covers all kvm hosts.  But it's too late to do this for 7.0.

I wasn't planning on pushing these changes for 7.0 since they aren't fixing mem
leaks or anything really bad. It's more of a quality of life improvement when
using Valgrind.

I also tried to put this annotation in kvm_get_one_reg() and it didn't solve the
warning. I didn't find a way of telling Valgrind "consider that every time this
function is called with parameter X it initializes X". That would be a good solution
to put in the common KVM files and fix the problem for everybody.


Daniel



> 
> 
> r~

