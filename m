Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF72516124
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 03:05:31 +0200 (CEST)
Received: from localhost ([::1]:46606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nky1i-0008IB-Gv
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 21:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkxzh-0007Nt-DY
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 21:03:25 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:39774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkxzf-0006tk-Gb
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 21:03:24 -0400
Received: by mail-pg1-x531.google.com with SMTP id i62so9250967pgd.6
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 18:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=73ZHjYmg1P9xTYhkEMQpxG8zt+tF0DsE6K5m5iuqI5o=;
 b=dBAnLjT5Y+mRDmXck+AOxRpCExVUEMW9f/POYQjU9TkRkzK3n1L/C5XQjy9oRmI+bz
 uQRP9lFf7LarikI9f6CTDWwZ6HNciJjiDSg5uKEKy+WpvnUro8waJwzqKcrDtmHZ1BVO
 2qFMsLy5NYNM0N4OZ13lAfmi57SCwnCx/tYnlpFOT7dFyiNBNIvPn/2vVPVRiZiqxx6T
 YbIynnVLzkfFXC3w/y7Icx4wEqMzOJkq82Kjenzh0YQuyrdM5lnIpNezsy+Jx3MgBByI
 /kozixY6p8ydCzimqw79UrVkIH+jIHrMCUc0fZGtry87SGb/kqaRHkNn3Wkut5HwSCGE
 Mn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=73ZHjYmg1P9xTYhkEMQpxG8zt+tF0DsE6K5m5iuqI5o=;
 b=J39Z/o1rgUBQQ+4ahHvTk9cjj0aU832KE66bUdH6mZNr/kA7MifxCkhnLsLwSoauBy
 UojYRCJ5OJj7uovzOlATMt9H0aY98sF8eYeXf/3sdH3DolOU9ELDW3ouKzofjk/qQjLa
 6MehP5g/Soa08ev/8KFYEH4RsXwV61dSnzgzvhpkIMtRpNUQG+I7xNYJWRRwUwOzqNPd
 D/CSrqyxR9Xn+GvHgi63XSj90RKFIWgzQkhyE8AzIB5YOrvsYp0BhViYZkVujMCjxVy5
 1vzH/6LwoZjTlgiUHBOfN5VishiyweZZwmrKuwQZnZNnDwSdSX25/IxytS+BRrrRXMiJ
 XdRg==
X-Gm-Message-State: AOAM5304nfN0t4eFSfOfTw5xtBpd/LmBqvnWF0r7N1ZDDSwEMvDQHTi2
 qyPhGgGMGyTvKJVZ67iR9IJbzw==
X-Google-Smtp-Source: ABdhPJxW8qHmzta+NHpZVbEn6ZI+EEYJeyYX9e5iTDNZ6uoCkFD7lZgBC9GODQdGNf0ObZbDZo5yaw==
X-Received: by 2002:a05:6a00:2310:b0:4fa:7eb1:e855 with SMTP id
 h16-20020a056a00231000b004fa7eb1e855mr5262091pfh.14.1651367001761; 
 Sat, 30 Apr 2022 18:03:21 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a63df53000000b003c14af50634sm8992466pgj.76.2022.04.30.18.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 18:03:21 -0700 (PDT)
Message-ID: <04c8d2c6-4c34-c38e-720f-8d80113597d5@linaro.org>
Date: Sat, 30 Apr 2022 18:03:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 32/60] target/arm: Update sysreg fields when
 redirecting for E2H
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-33-richard.henderson@linaro.org>
 <CAFEAcA8ZFuyKO0jsMHX=Pg6grvmzWCgCpnt7EBWtRjTKne=tnw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8ZFuyKO0jsMHX=Pg6grvmzWCgCpnt7EBWtRjTKne=tnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 03:39, Peter Maydell wrote:
> On Sun, 17 Apr 2022 at 19:07, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The new_key is always non-zero during redirection,
>> so remove the if.  Update opc0 et al from the new key.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper.c | 35 +++++++++++++++++++++++------------
>>   1 file changed, 23 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 7c569a569a..aee195400b 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -5915,7 +5915,9 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
>>
>>       for (i = 0; i < ARRAY_SIZE(aliases); i++) {
>>           const struct E2HAlias *a = &aliases[i];
>> -        ARMCPRegInfo *src_reg, *dst_reg;
>> +        ARMCPRegInfo *src_reg, *dst_reg, *new_reg;
>> +        uint32_t *new_key;
>> +        bool ok;
>>
>>           if (a->feature && !a->feature(&cpu->isar)) {
>>               continue;
>> @@ -5934,19 +5936,28 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
>>           g_assert(src_reg->opaque == NULL);
>>
>>           /* Create alias before redirection so we dup the right data. */
>> -        if (a->new_key) {
>> -            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
>> -            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
>> -            bool ok;
>> +        new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
>> +        new_key = g_memdup(&a->new_key, sizeof(uint32_t));
>>
>> -            new_reg->name = a->new_name;
>> -            new_reg->type |= ARM_CP_ALIAS;
>> -            /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
>> -            new_reg->access &= PL2_RW | PL3_RW;
>> +        new_reg->name = a->new_name;
>> +        new_reg->type |= ARM_CP_ALIAS;
>> +        /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
>> +        new_reg->access &= PL2_RW;
>>
>> -            ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
>> -            g_assert(ok);
>> -        }
>> +#define E(X, N) \
>> +    ((X & CP_REG_ARM64_SYSREG_##N##_MASK) >> CP_REG_ARM64_SYSREG_##N##_SHIFT)
>> +
>> +        /* Update the sysreg fields */
>> +        new_reg->opc0 = E(a->new_key, OP0);
>> +        new_reg->opc1 = E(a->new_key, OP1);
>> +        new_reg->crn = E(a->new_key, CRN);
>> +        new_reg->crm = E(a->new_key, CRM);
>> +        new_reg->opc2 = E(a->new_key, OP2);
>> +
>> +#undef E
>> +
>> +        ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
>> +        g_assert(ok);
> 
> So is setting the new_reg opc etc fields here fixing a bug
> (or otherwise changing behaviour)?
> 
> The effect is that read/write callbacks now get an ARMCPRegInfo*
> that has the opc &c for the alias, rather than for the thing being
> aliased. That's good if the read/write callbacks have a need to
> distinguish the alias access from a normal one (do they anywhere?).
> On the other hand it's bad if we have existing code that thinks it
> can distinguish FOO_EL1 from FOO_EL2 by looking at the opc &c
> values and now might get confused.
> 
> Overall, unless we have a definite reason why we want the
> callback functions to be able to tell the alias from the normal
> access, I'm inclined to say we should just comment that we
> deliberately leave the sysreg fields alone. (Put another way,
> I don't really want to have to work through all the aliased
> registers here checking whether they have read/write functions
> that look at the opc fields and whether any of them would
> end up doing the wrong thing when handed the alias reginfo.)

I don't recall what I was thinking here, it's definitely wrong.

> The "remove the if()" part is fine if you wanted to do that
> as its own patch.

Yeah, I'll do that, since it's always true.


r~

