Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29514687AE1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:52:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXCZ-0005SL-EX; Thu, 02 Feb 2023 05:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNXCX-0005S0-Gx
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:52:21 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNXCV-0002t4-NS
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:52:21 -0500
Received: by mail-wm1-x32f.google.com with SMTP id bg26so1078911wmb.0
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I0MdncSDh0IwYNDefPb6O401HrgFsHjCyY3qSaJ1NFA=;
 b=fNaello4oCx/ZxIKBzfJ1w900VW8hpC8EI5t/pCxVp2IIyqgGxK/DQsxA01/zQGW4X
 vRb4m0s4AdOdTY/juv5YH0E+EFIqY5nhIoCJwTU+I/ie23Tx8KrUqh/lymNx3rxrBZPS
 yI3LDgL9aDOOeG2BnFBrgt99V5pkNSlaLUWea6JjGSsPD/i+9nAT0y1Z4JAD61Ciacpk
 cGNlthDsrWvMWoVeZXwNw0JFPS1sJqxEYKsbVEQlGuGb18F+Uha46kvYcxCHnKaZih0l
 09ga4VkjGgXhLmVR5RjOpMW15q7SXoXE3p1ZHUNRLiqmcfuO7r2S6pdH6rVCrgadmmVo
 ULGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I0MdncSDh0IwYNDefPb6O401HrgFsHjCyY3qSaJ1NFA=;
 b=PjYMcUtKJ2lxX4jj+4vbVtRPoyOMusLEyuQUyEgEc42IWInJEgL4hGWh8tuZ5nrrKp
 4FPgKtj7D3BjkYqVV6bQlAIkZrpq71itaQTqFpjXw8s7lN29OZwzw7KwA+Rl2dk4reT4
 w6/UEuykSC5KX7YbtXni3tGs5+Pkwke5PGgwApXIT4UuQ8nzUy3amoDx1lI460n0W2bV
 MsEvxHvKnJeD+7Kxxvak2k5YPppswhNI61Yx3kH92NAPuwvYY8YAWQ2QOSgs/BBMr2nG
 +am/RwsvHgPvwFsmBphVfqvwCZQEO91V08FbrOiiJRRmHSepFt+hNOOjBgiVe3rNID4m
 MhGg==
X-Gm-Message-State: AO0yUKVsVhAAYc87iZxHGhYa8w+a7gajvR0hKO8kry3ERY2wuBC59Krg
 0YMPq78SerOOW6tn8XSmdPxkTCLwRlyW4nJc
X-Google-Smtp-Source: AK7set8oneR+rm4kmTraxyzqU0PvZogUWRMrwSg8vgsd7kXofK0rQWnoAv/vIeTfXw6UN7s8dDCwuw==
X-Received: by 2002:a05:600c:3489:b0:3d2:2d2a:d581 with SMTP id
 a9-20020a05600c348900b003d22d2ad581mr5525713wmq.30.1675335138157; 
 Thu, 02 Feb 2023 02:52:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c1c2100b003db0ad636d1sm5414398wms.28.2023.02.02.02.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 02:52:17 -0800 (PST)
Message-ID: <74cbaf9c-34f1-3aaa-0759-51982d057473@linaro.org>
Date: Thu, 2 Feb 2023 11:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 08/34] hw/arm/virt: Let the virtio-iommu bypass MSIs
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20200703165405.17672-1-peter.maydell@linaro.org>
 <20200703165405.17672-9-peter.maydell@linaro.org>
 <7592c27c-0c98-d52c-fecc-ac2b261ecbb3@linaro.org>
In-Reply-To: <7592c27c-0c98-d52c-fecc-ac2b261ecbb3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/2/23 11:47, Philippe Mathieu-Daudé wrote:
> Hi Eric,
> 
> On 3/7/20 17:53, Peter Maydell wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> At the moment the virtio-iommu translates MSI transactions.
>> This behavior is inherited from ARM SMMU. The virt machine
>> code knows where the guest MSI doorbells are so we can easily
>> declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
>> setting the guest will not map MSIs through the IOMMU and those
>> transactions will be simply bypassed.
>>
>> Depending on which MSI controller is in use (ITS or GICV2M),
>> we declare either:
>> - the ITS interrupt translation space (ITS_base + 0x10000),
>>    containing the GITS_TRANSLATOR or
>> - The GICV2M single frame, containing the MSI_SETSP_NS register.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Message-id: 20200629070404.10969-6-eric.auger@redhat.com
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   include/hw/arm/virt.h |  7 +++++++
>>   hw/arm/virt.c         | 30 ++++++++++++++++++++++++++++++
>>   2 files changed, 37 insertions(+)
> 
> 
>>   static void create_gic(VirtMachineState *vms)
>> @@ -2198,8 +2200,36 @@ out:
>>   static void virt_machine_device_pre_plug_cb(HotplugHandler 
>> *hotplug_dev,
>>                                               DeviceState *dev, Error 
>> **errp)
>>   {
>> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>> +
>>       if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>           virt_memory_pre_plug(hotplug_dev, dev, errp);
>> +    } else if (object_dynamic_cast(OBJECT(dev), 
>> TYPE_VIRTIO_IOMMU_PCI)) {
>> +        hwaddr db_start = 0, db_end = 0;
>> +        char *resv_prop_str;
>> +
>> +        switch (vms->msi_controller) {
>> +        case VIRT_MSI_CTRL_NONE:
>> +            return;
>> +        case VIRT_MSI_CTRL_ITS:
>> +            /* GITS_TRANSLATER page */
>> +            db_start = base_memmap[VIRT_GIC_ITS].base + 0x10000;
>> +            db_end = base_memmap[VIRT_GIC_ITS].base +
>> +                     base_memmap[VIRT_GIC_ITS].size - 1;
>> +            break;
>> +        case VIRT_MSI_CTRL_GICV2M:
>> +            /* MSI_SETSPI_NS page */
>> +            db_start = base_memmap[VIRT_GIC_V2M].base;
>> +            db_end = db_start + base_memmap[VIRT_GIC_V2M].size - 1;
>> +            break;
>> +        }
>> +        resv_prop_str = g_strdup_printf("0x%"PRIx64":0x%"PRIx64":%u",
>> +                                        db_start, db_end,
>> +                                        VIRTIO_IOMMU_RESV_MEM_T_MSI);
>> +
>> +        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> 
> Where is "len-reserved-regions" declared?
> 
> Since qdev_prop_set_uint32() uses &error_abort, isn't this call
> aborting the process? I am confused how this code path is exercised,
> what am I missing?

The call path is:

   qdev_prop_set_uint32 ->
     object_property_set_int ->
       object_property_set_qobject ->
         object_property_set ->
           object_property_find_err

So QEMU should abort displaying:

"Property 'virtio-iommu-pci.len-reserved-regions' not found".

>> +        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
>> +        g_free(resv_prop_str);
>>       }
>>   }


