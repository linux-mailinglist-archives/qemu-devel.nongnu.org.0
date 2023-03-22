Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EEC6C52E2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:43:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2Te-0004JL-Tl; Wed, 22 Mar 2023 13:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf2Td-0004IS-38
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:42:21 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf2Tb-0005Pw-BR
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:42:20 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 p20-20020a056830319400b0069f914e5c74so2524467ots.3
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679506938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RDyV+Y7yDfJhNrZM42Ef7vcPA4XPXVQGeUQGeCKrZhE=;
 b=JQYwPYsiSQKz0jo6xmNeTFftuMQgZ6cUSh2bjv3KddQ4ZICmHtyMIoA2Rr9j61xvEH
 iv4M7s+UsqZTrZQKvPtrSPFvbg9Q+FfCNVINvf7oXKUNrGMUGIDskHAORJK0e3Cv5oHI
 AJEPTmjR6Yvp7wAYwatWNFnZPnLkNNXRItr9Dhz8BhEWeeTWjv29/nfFpwQbpnZEq2jG
 Lm/LnCz31gn0FD+sPNgawUsfPxALHLJEs7c0G8tLr20bQFVtTnvngXEeNjP2lKvDIpB3
 FVQqjLH7k2ppG41gimqF7PVArjzXO51Gk0BLXH/oQeS57NPX5AqAsRl22o40P0XuF8bs
 caxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679506938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RDyV+Y7yDfJhNrZM42Ef7vcPA4XPXVQGeUQGeCKrZhE=;
 b=pT+kIeE8xCGMaQ7iGhhtzfwfsAZKbTKb8eUDW7Ypv/PltpovIG96VxEeu+j2mao1co
 mbL1vthYb7Gg0UKZ1CwVctarXN91E+lXy442ondMdICZyX8a7YnBxwirAhROZgfIlx2T
 thwCh4AtYpBdplDPf1djr0pL6fnvpoXMlfKsiUm0dyL9gubrN7l7HULTONXLBMpxaf2A
 ruzzFF7FRZ0WZaUT0r71rDl+WC0/5GOdG/iFybB4s7gEG0q9U+UdxRrQg1pfZYlEHn7Y
 q2EaLL6sI2/EOHuwEbsOHFAnQyl3glrtABXyZfVhI17H+rwQyJRuA6H+Xm9RUQ7PbfHw
 PJaQ==
X-Gm-Message-State: AO0yUKUu4cgiBpozVA5vZB8NAL4lnblvxPwkyeA84y0t7IJSjbNscHJE
 RNPEQJZq9ZudJ621wM2KewvqxQ==
X-Google-Smtp-Source: AK7set8wLhDBUtmVgm0GWfXr4TQB0IpLYXBtgAFgaG4f/nrahudgwGvYJ9kD5d89pIzw84MF0mD4RQ==
X-Received: by 2002:a05:6830:1411:b0:69f:3a6:dffb with SMTP id
 v17-20020a056830141100b0069f03a6dffbmr1799926otp.24.1679506938260; 
 Wed, 22 Mar 2023 10:42:18 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a056830114d00b0069dc250cb24sm934552otq.3.2023.03.22.10.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 10:42:17 -0700 (PDT)
Message-ID: <dcc3ce9a-3714-05c5-c751-ad2f8f8803ff@ventanamicro.com>
Date: Wed, 22 Mar 2023 14:42:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 v3 25/26] target/riscv: allow write_misa() to
 enable RVG
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
 <20230318200436.299464-26-dbarboza@ventanamicro.com>
 <8b219f0e-cfd8-390e-405c-2fd9b1e784b5@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <8b219f0e-cfd8-390e-405c-2fd9b1e784b5@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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



On 3/21/23 00:25, liweiwei wrote:
> 
> On 2023/3/19 04:04, Daniel Henrique Barboza wrote:
>> Allow write_misa() to enable RVG by changing riscv_cpu_enable_g()
>> slighty: instead of returning void, return the current env->misa_ext
>> value. This is then retrieved by 'val', which will add the RVG flag
>> itself, and then we'll skip validation and go right into commiting the
>> changes.
>>
>> The reason why it's ok to skip validation in this case is because we're
>> only allowing RVG (and its associated extensions/Z extensions) to be
>> enabled in the hart, and riscv_cpu_enable_g() already does its own
>> validation before enabling itself. Everything else is considered to be
>> already validated beforehand, so we don't need to repeat ourselves.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c |  7 +++++--
>>   target/riscv/cpu.h |  2 ++
>>   target/riscv/csr.c | 15 +++++++++++++++
>>   3 files changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 2d2a354af3..73a5fa46ee 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -281,7 +281,8 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
>>       return ext;
>>   }
>> -static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
>> +
>> +target_ulong riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
>>   {
>>       CPURISCVState *env = &cpu->env;
>>       RISCVCPUConfig *cfg = &cpu->cfg;
>> @@ -289,7 +290,7 @@ static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
>>       if (cpu->cfg.ext_zfinx) {
>>           error_setg(errp, "Unable to enable G: Zfinx is enabled, "
>>                            "so F can not be enabled");
>> -        return;
>> +        return 0;
>>       }
>>       if (!(cfg->ext_i && cfg->ext_m && cfg->ext_a &&
>> @@ -315,6 +316,8 @@ static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
>>           cfg->ext_icsr = true;
>>           cfg->ext_ifencei = true;
>>       }
>> +
>> +    return env->misa_ext;
>>   }
>>   static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index befc3b8fff..3ca1d4903c 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -599,6 +599,8 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
>>                                      Error **errp);
>>   void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext);
>> +target_ulong riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp);
>> +
>>   #define cpu_list riscv_cpu_list
>>   #define cpu_mmu_index riscv_cpu_mmu_index
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 839862f1a8..4335398c19 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1381,6 +1381,20 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>>           val &= RVE;
>>       }
>> +    if (val & RVG && !(env->misa_ext & RVG)) {
>> +        /*
>> +         * If the write wants to enable RVG, only RVG and
>> +         * its dependencies will be updated in the CSR.
>> +         */
>> +        val = riscv_cpu_enable_g(cpu, &local_err);
>> +        if (local_err != NULL) {
>> +            return RISCV_EXCP_NONE;
>> +        }
>> +
>> +        val |= RVG;
> 
> This assignment is not necessary, since RVG is already set in val.
> 
> By the way, RVG is still not disabled if any some of included extensions are disabled by write_misa.

I'll include this use case in v4. And I'll also treat RVG as a regular extension since
all checks were already done in realize() time.


Daniel


> 
> Regards,
> 
> Weiwei Li
> 
>> +        goto commit;
>> +    }
>> +
>>       /*
>>        * This flow is similar to what riscv_cpu_realize() does,
>>        * with the difference that we will update env->misa_ext
>> @@ -1396,6 +1410,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>>           return RISCV_EXCP_NONE;
>>       }
>> +commit:
>>       riscv_cpu_commit_cpu_cfg(cpu, val);
>>       if (!(val & RVF)) {
> 

