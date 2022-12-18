Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE464FF03
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 14:39:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6tt6-0004Dk-Be; Sun, 18 Dec 2022 08:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6tt4-0004Db-Br
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:39:30 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6tt2-0005wV-6a
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:39:29 -0500
Received: by mail-ej1-x630.google.com with SMTP id m18so16084033eji.5
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 05:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+qQE6rShetGBiuKIJLvRXhwR9jlCSdpG0a3kBYz0piU=;
 b=FWILLjyEkFcunN5lRxEIp1b6RAMxLHucBOr9r//ceWWJ+lAQvqYCOcM8SLLewmoehS
 o4viKGB17BrEXmodF5+67eZ+EwIuJ/FSvmZcvlTO1L5BYj5NAGq0uJLhfnRVqPCQRPAD
 C5rMOvA/VGdOVerJp43ynk76+uVa31WTiIZ8InViujcVZA71TsTq+GSaICGW3TVoTAe+
 6uufFLyvhJPiGVAD/uyrII/Cg49vVI2JUzHBIdRpVdSTPRY0U48QiH5H8xCkKC7etIgN
 V792rmSc4mQjxTNxNccKNUmZAFpaYTG1gQTY7y9BhKV1PmQnxpuBP+T1boS2UMV03dt4
 VXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+qQE6rShetGBiuKIJLvRXhwR9jlCSdpG0a3kBYz0piU=;
 b=mvGDGFC73oCoy+GpcpQsL1ESfhwEsoNKRCFq6fSIif5UGIYUT8tm1hOthScu/JX2b9
 pn357ZpwH0aJ4FjtyJlVUv6RMdIgI+1RMdoxmOXzEHYWbiIFyocPlNoESqqF5suPlymn
 ZiSH32XXAe9l1ayKzpsfQAgrAWfOzLm2NF/Kfw3INhrs0lZpLV795Df4ZKj8++eeodAY
 +XAS4z6d3kAlIBhFDnYuKQI8Sbxjz/Xie6hWH3C0NKmgVXS0bera7O91gxY9rWb8wVou
 MIg/ediAMMrqQ+JkhKz15YRUXi0uMqY8cDZVOHY6s5MT4nPhDAm9CEC/zQD6XW5xXvIr
 vcXg==
X-Gm-Message-State: ANoB5pnwkN+Th2JpZoypAYMqVxfrLz+UVli+urqUUU8MBBvN6EL4EarY
 HGUtz750JjtJz/t++tdPWvTFeL5AvP03ls++cUk=
X-Google-Smtp-Source: AA0mqf4iFd9afE087dTg9iUtS36VSL0x8TDye6zn88570+RDn1cgg7E+s+Mf7O65JpG11KAKWFoUFw==
X-Received: by 2002:a17:906:c418:b0:7c1:5768:5fc9 with SMTP id
 u24-20020a170906c41800b007c157685fc9mr24697604ejz.43.1671370766087; 
 Sun, 18 Dec 2022 05:39:26 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a17090631c500b007bfc5cbaee8sm3252487ejf.17.2022.12.18.05.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 05:39:25 -0800 (PST)
Message-ID: <74e5c346-8345-6070-6cb7-0de03c30363c@linaro.org>
Date: Sun, 18 Dec 2022 14:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] KVM: remove support for kernel-irqchip=off
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221218000649.686882-2-pbonzini@redhat.com>
 <d7b6874d-a825-f2d3-5cf2-1817d288138d@linaro.org>
In-Reply-To: <d7b6874d-a825-f2d3-5cf2-1817d288138d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 14:38, Philippe Mathieu-Daudé wrote:
> On 18/12/22 01:06, Paolo Bonzini wrote:
>> -machine kernel-irqchip=off is broken for many guest OSes; 
>> kernel-irqchip=split
>> is the replacement that works, so remove the deprecated support for 
>> the former.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   docs/about/deprecated.rst       |  7 -------
>>   docs/about/removed-features.rst |  7 +++++++
>>   hw/i386/amd_iommu.c             |  2 +-
>>   hw/i386/intel_iommu.c           |  4 ++--
>>   include/hw/i386/apic_internal.h |  2 +-
>>   target/i386/cpu-sysemu.c        | 15 +++++++++++----
>>   6 files changed, 22 insertions(+), 15 deletions(-)
> 
> 
>> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
>> index 725f69095b9e..bcd016f5c5a5 100644
>> --- a/hw/i386/amd_iommu.c
>> +++ b/hw/i386/amd_iommu.c
>> @@ -1368,7 +1368,7 @@ static MemTxResult amdvi_mem_ir_write(void 
>> *opaque, hwaddr addr,
>>           return MEMTX_ERROR;
>>       }
>> -    apic_get_class()->send_msi(&to);
>> +    apic_get_class(NULL)->send_msi(&to);
> 
> &error_fatal?

Eh, &error_abort instead.

>> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
>> index a08ee85edf2a..98a5c304a7d7 100644
>> --- a/hw/i386/intel_iommu.c
>> +++ b/hw/i386/intel_iommu.c
>> @@ -396,7 +396,7 @@ static void vtd_generate_interrupt(IntelIOMMUState 
>> *s, hwaddr mesg_addr_reg,
>>       trace_vtd_irq_generate(msi.address, msi.data);
>> -    apic_get_class()->send_msi(&msi);
>> +    apic_get_class(NULL)->send_msi(&msi);
>>   }
>>   /* Generate a fault event to software via MSI if conditions are met.
>> @@ -3529,7 +3529,7 @@ static MemTxResult vtd_mem_ir_write(void 
>> *opaque, hwaddr addr,
>>           return MEMTX_ERROR;
>>       }
>> -    apic_get_class()->send_msi(&to);
>> +    apic_get_class(NULL)->send_msi(&to);
>>       return MEMTX_OK;
>>   }
> 
>>   #endif /* QEMU_APIC_INTERNAL_H */
>> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
>> index fc97213a73cf..28115edf44f7 100644
>> --- a/target/i386/cpu-sysemu.c
>> +++ b/target/i386/cpu-sysemu.c
>> @@ -247,12 +247,16 @@ void x86_cpu_machine_reset_cb(void *opaque)
>>       cpu_reset(CPU(cpu));
>>   }
>> -APICCommonClass *apic_get_class(void)
>> +APICCommonClass *apic_get_class(Error **errp)
>>   {
>>       const char *apic_type = "apic";
>>       /* TODO: in-kernel irqchip for hvf */
>> -    if (kvm_apic_in_kernel()) {
>> +    if (kvm_enabled()) {
>> +        if (!kvm_apic_in_kernel()) {
>> +            error_setg(errp, "KVM does not support userspace APIC");
>> +            return NULL;
>> +        }
> 


