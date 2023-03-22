Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC866C52AC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:39:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2R2-00037C-G3; Wed, 22 Mar 2023 13:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf2Qw-00033k-OV
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:39:35 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf2Qu-0003ol-OM
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:39:34 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 a23-20020a4ad5d7000000b005250867d3d9so3124243oot.10
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679506771;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o5SGHt2pNVBSG4O9B41KYK7FkKF8/pLqu6XCpz2C7+M=;
 b=gyBd7oQR/d0A61jMHOl4ajWl/tNoTDaf2tcsDlMu/rpH4FLxx6nJboyIY+2d2lRPBP
 VHh+kfDLtHUQptlj0Jq0bpQ1vlMjJvGRa4e5efos/b4MU/U4i84tLGb2t9nQBtopUL46
 3/lmfhPOamGYXdLk8yAY+4teO4DOQ4iOC+L0Cbe2mAHtfIaFeMlp9S4KPFPyVmn0jisC
 PbolmV5rDSAsmuUFnXcn1RWeaXyHdSXO62qoScrebn9l6ZgChxQr9Jbd1rxQ0/1wxYo6
 LO7NNokYBFCXJ3N9pEucbVJQcpt78ImftKcOx8oOxqPEYSGZuOzSiuLE93H1XgLWcISG
 uPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679506771;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o5SGHt2pNVBSG4O9B41KYK7FkKF8/pLqu6XCpz2C7+M=;
 b=gjXJoQZKNyEnizuyTCOm3QOTC/LFu4l+USRk8T10mJgHjthqGVB1WLsEisdCBZ8Npb
 UE3PR2rHpx3dsJM+umK0H8Zid+L+/54dIYyuaqWTXrXZY/thezYtC2VmW+fBXR+rA5U+
 lCoxEuxqc+5BEpPtVYowUhiuJQLB4Sn3uyqeVsaqbCrkt5uuMo5EvbkEt6sd2wNcF3js
 wwwf3E0aNPm/jb4p8PWRDaIGSdUxerYpKNJWJ4LWBSAXEZjJrXea+ulB51cc5Ol6P4dn
 RmjEsQMPR2b7kKixWqDiqclTcA85myotkg5VSdhWEm5eOo5qDwiFGYR7xA+7XPcWQvBD
 XzlA==
X-Gm-Message-State: AO0yUKXaBnskC4MLiIY1zWnx9JxYBuAIJRtYENy8h1Vwo4rsbsPzHX+O
 jCk9wzfeZHTMwu0/Zh5om2cZIQ==
X-Google-Smtp-Source: AK7set89Nlk5V1aEZDKteL0LaWfkL8giyVcN9LmefmvEergHubirByF3EqjweriHSNnHvddKSRrQUw==
X-Received: by 2002:a4a:94a1:0:b0:538:b486:3414 with SMTP id
 k30-20020a4a94a1000000b00538b4863414mr1651141ooi.6.1679506770930; 
 Wed, 22 Mar 2023 10:39:30 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 129-20020a4a1887000000b005252d376caesm6311410ooo.22.2023.03.22.10.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 10:39:30 -0700 (PDT)
Message-ID: <ac803957-8283-058b-e5b3-17d8f4edc8b5@ventanamicro.com>
Date: Wed, 22 Mar 2023 14:39:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 v3 26/26] target/riscv: allow write_misa() to
 enable RVV
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
 <20230318200436.299464-27-dbarboza@ventanamicro.com>
 <c8f3683c-24b8-ef46-b074-aabeee98e0ec@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <c8f3683c-24b8-ef46-b074-aabeee98e0ec@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
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



On 3/21/23 00:41, liweiwei wrote:
> 
> On 2023/3/19 04:04, Daniel Henrique Barboza wrote:
>> Allow write_misa() to enable RVV like we did with RVG. We'll need a
>> riscv_cpu_enable_v() to enable all related misa bits and Z extensions.
>> This new helper validates the existing 'env' conf by using the existing
>> riscv_cpu_validate_v(). We'll also check if we'll be able to enable 'F'
>> by checking for ext_zfinx.
>>
>> As with RVG, enabling RVV is considered to be a standalone operation in
>> write_misa(). This means that we'll guarantee that we're not being
>> inconsistent in riscv_cpu_enable_v() and that we're okay with skipping
>> regular validation.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 35 +++++++++++++++++++++++++++++++++++
>>   target/riscv/cpu.h |  1 +
>>   target/riscv/csr.c | 14 ++++++++++++++
>>   3 files changed, 50 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 73a5fa46ee..9c16b29f27 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -983,6 +983,41 @@ static void riscv_cpu_validate_v(CPURISCVState *env,
>>       env->vext_ver = vext_version;
>>   }
>> +target_ulong riscv_cpu_enable_v(RISCVCPU *cpu, Error **errp)
>> +{
>> +    CPURISCVState *env = &cpu->env;
>> +    RISCVCPUConfig *cfg = &cpu->cfg;
>> +    Error *local_err = NULL;
>> +
>> +    riscv_cpu_validate_v(env, cfg, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return 0;
>> +    }
> 
> This check is not necessary, we call this function only when we enable v by write_misa, which also have a prerequisite:
> 
> V is enabled at the very first. So this check will always be true, since the parameter for vector cannot be changed dynamically.
> 
> Similar to following check.
> 
>> +
>> +    if (cpu->cfg.ext_zfinx) {
>> +        error_setg(errp, "Unable to enable V: Zfinx is enabled, "
>> +                         "so F can not be enabled");
>> +        return 0;
>> +    }
>> +
>> +    cfg->ext_f = true;
>> +    env->misa_ext |= RVF;
>> +
>> +    cfg->ext_d = true;
>> +    env->misa_ext |= RVD;
> 
> We do check V against F/D at first. Why we do this when enable V?
> 
> And if we do this,  whether we should also enable F when enable D?
> 
> 
>> +
>> +    /*
>> +     * The V vector extension depends on the
>> +     *  Zve32f, Zve64f and Zve64d extensions.
>> +     */
>> +    cpu->cfg.ext_zve64d = true;
>> +    cpu->cfg.ext_zve64f = true;
>> +    cpu->cfg.ext_zve32f = true;
> 
> This is right, but not necessary in current implementation, since they will not be disabled when we disable V.
> 
> So we needn't enable them when we re-enable V.
> 
>> +
>> +    return env->misa_ext;
>> +}
>> +
>>   static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
>>   {
>>       CPURISCVState *env = &cpu->env;
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 3ca1d4903c..45e801d926 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -600,6 +600,7 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
>>   void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext);
>>   target_ulong riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp);
>> +target_ulong riscv_cpu_enable_v(RISCVCPU *cpu, Error **errp);
>>   #define cpu_list riscv_cpu_list
>>   #define cpu_mmu_index riscv_cpu_mmu_index
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 4335398c19..e9e1afc57e 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1395,6 +1395,20 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>>           goto commit;
>>       }
>> +    if (val & RVV && !(env->misa_ext & RVV)) {
>> +        /*
>> +         * If the write wants to enable RVV, only RVV and
>> +         * its dependencies will be updated in the CSR.
>> +         */
>> +        val = riscv_cpu_enable_v(cpu, &local_err);
>> +        if (local_err != NULL) {
>> +            return RISCV_EXCP_NONE;
>> +        }
>> +
>> +        val |= RVV;
>> +        goto commit;
>> +    }
>> +
> 
> So, I think we can just treat V as common extension, and do nothing additionally for disabling/re-enabling it.

In fact I think the same can be said about RVG, since both extensions - and in fact,
all extensions - would have to be enabled once during cpu_init() anyway. If not,
env->misa_ext_mask wouldn't allow it be enabled in write_misa() time later on.

I believe I've over-complicated things a bit in these last patches. I'll simplify
things in v4.


Thanks,


Daniel

> 
> Regards,
> 
> Weiwei Li
> 
>>       /*
>>        * This flow is similar to what riscv_cpu_realize() does,
>>        * with the difference that we will update env->misa_ext
> 

