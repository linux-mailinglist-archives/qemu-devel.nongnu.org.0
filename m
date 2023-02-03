Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9E68998A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 14:18:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNvvK-0001PO-1g; Fri, 03 Feb 2023 08:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNvuz-0001IQ-3y
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:15:57 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNvuw-0005Ty-CJ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:15:52 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso5979304wmp.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 05:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ASDnOZzA5qXWWogItTFFN1JghCtyymOM36MuwylqLcg=;
 b=crkj232U1D0octFL8Vmge3ukGu+7iriMCvXCtOS5Cpid23qPlVhMCFiJTUu9M4263X
 KYXqXHIoRDzir8SLPTyYg+4itAH1tCLNS6lxyiCaWQWNsE32+6Pfn+5LG5tq9+ihzfHg
 ewSB1SPgZQyjFjGhxtk7SznS+Io6LQ0rtlbrM7vWi/jP02f5En+tBvD82iAI3bhvXa9Z
 T7QfaNvkIMVDeIZyT019S0OHdPNKyrPUhPh4naRtXs9tOyL1qE45QUxRy1Wcz99MtiGe
 iTV+FnSEMS4PkTbgVCQJza7FPO57giDuxyEPN5s1hXtHN5y2LrbS2oQKlNXUw6W1oP4q
 lQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ASDnOZzA5qXWWogItTFFN1JghCtyymOM36MuwylqLcg=;
 b=iMIKyddlQomBb7TtkBBKc/UQZsZVKuXsP0Vs8DPngtF5ApkCwHKD0zSDTPo6vLHBb8
 I8ITKClGBf9IrTqHZ36LEMqWhgS1ImEAfc8LoIUH6+JycyHeROm9rbyt2MY8BqgFvtJ2
 Y0vomx0tbzQ4T2dS5z+aaygE5gpLJxgDzfVHTl/W1Jl0BKBzTMJvNcIBgBc3Z7xDcuoW
 u3yvRlywWbheQJxaYxzh417sUnrTvSRHw2qtTiD+uk+satRlCTB1UfXVacHhRLvaAEaO
 xWzTfdFMjppiH899K85TYwZJ9nYPGRsbjQMRyfOLc9skHb/dEeXCyfcdDUzk5DGUshVZ
 BSow==
X-Gm-Message-State: AO0yUKWRgiqqdFdHo9E5QDq4UKkTb5z2Vs2vadmbdpo/lOv/nQOLOq39
 kqaNZ2OPrpeM+bbSrVkZkgR8VA==
X-Google-Smtp-Source: AK7set9bs/Ccl1YeTiQcWV0CZQF8/U3Lru7lDjX3wuucGDI7R7cM5mw/K50fw5hwnglQAeIgCQ/x3A==
X-Received: by 2002:a1c:4b16:0:b0:3dc:50bc:da70 with SMTP id
 y22-20020a1c4b16000000b003dc50bcda70mr9514196wma.10.1675430147906; 
 Fri, 03 Feb 2023 05:15:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r3-20020a05600c434300b003dc59081603sm2436991wme.48.2023.02.03.05.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 05:15:47 -0800 (PST)
Message-ID: <3b377013-778e-b5b4-4c40-bfbecaba8415@linaro.org>
Date: Fri, 3 Feb 2023 14:15:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/9] hw/i386/sgx: Do not open-code qdev_realize_and_unref()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-2-philmd@linaro.org> <87lelfc4l1.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87lelfc4l1.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/2/23 13:32, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/i386/sgx.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
>> index db004d17a6..5ddc5d7ea2 100644
>> --- a/hw/i386/sgx.c
>> +++ b/hw/i386/sgx.c
>> @@ -299,7 +299,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>                                   &sgx_epc->mr);
>>   
>>       for (list = x86ms->sgx_epc_list; list; list = list->next) {
>> -        obj = object_new("sgx-epc");
>> +        obj = object_new(TYPE_SGX_EPC);
> 
> I wonder why this doesn't use qdev_new().

OK.

>>           /* set the memdev link with memory backend */
>>           object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
>> @@ -307,8 +307,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>           /* set the numa node property for sgx epc object */
>>           object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
>>                                &error_fatal);
>> -        object_property_set_bool(obj, "realized", true, &error_fatal);
>> -        object_unref(obj);
>> +        qdev_realize_and_unref(DEVICE(obj), NULL, &error_fatal);
> 
> Yes, please!  Must have crept in after I converted all realizations.
> I can see two more:
> 
> hw/pci/pcie_sriov.c:        object_property_set_bool(OBJECT(vf), "realized", false, &local_err);
> linux-user/syscall.c:            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);

No: these would be qdev_UNrealize_and_unref(). Do we want it?
Maybe to avoid open-coding it, yes?

>>       }
>>   
>>       if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks!


