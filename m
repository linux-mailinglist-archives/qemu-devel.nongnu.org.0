Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9736A621C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:06:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX86L-0008Bl-HU; Tue, 28 Feb 2023 17:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX86H-00088z-MR
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:05:33 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX86E-00064z-4f
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:05:31 -0500
Received: by mail-wr1-x42e.google.com with SMTP id j2so11296376wrh.9
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 14:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677621928;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hXF1iOUgEVN95oweLFdn2WN8g4vqXP5mWyREvurju1A=;
 b=X65IpZmHSVK/I35rMcpS/2dq/DZux1HBkrnPjd4uTWv33GDGHOXJtN8o4UqG7gnGT3
 HAbvwIlMiWkdA0dSoWHzquEtRGQSt519iwmuSi0WyiqvFijnMisz2azKgZB8HXoyxPSB
 3j9P1rb/zlwQiLXPpLg6vroeyAe4PYZt8XXdkWPfGIo5r5UyxIKDji5SX+lVsM7fXsEB
 BjWjGqNOemyp4xJV1HtkAIzOq3rJlKceRfoQleG3Shhzvb6/z+pXK03bHqjfAIm56rxS
 QNGaudmaPBEom6qlYGkl2/u/4NIpZMcKJIUZmgKB7CNcCOBtiYbnfQuLFKTtxq2dosu6
 UFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677621928;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hXF1iOUgEVN95oweLFdn2WN8g4vqXP5mWyREvurju1A=;
 b=oC+4FmVbv90qXcWkpWnPGQfrZVrTBIxksXDbRrVR0RVwPNpey42fKVl4q6+nvUn7ys
 V62g2AA88I33DzwKUb2TE9mFiKg7jGGKQu8Wt4SLJ2BU8qn4fg8yRVAjJ/XXOgKl847H
 b+fRKF4wI3NsfrYvnzmgkcFN0c2w1HImNfW5vPpdKXZEevrRlDWwz8K0/6/TSDeNaPOT
 SWBYEbvQx+0+s7qkob+O2ugZTSYmdtcz5PoVa0P5EZIui+nnC0EvowxDa4XsIwBFR+Tm
 wfP9BaeXjp88H6Nj+AVDHSRsZJ6DWm0aiFCMlfs3j2XoS34XhzBlUputEzS9tvNQwIgf
 NP3A==
X-Gm-Message-State: AO0yUKVgMLbZdP/zo6oZc6v2nNhrUyiiRA9rOBEOAZk77v7SLHqLD1gF
 xfduAupjnXfrkDRzxihRkFh3Uw==
X-Google-Smtp-Source: AK7set+Jna/QE8zSIBCKJEC7U3awo5ySHxeYfH/mBPnbGm7ArVG7iEh/q8+JPelRtA25HhHAxo9axg==
X-Received: by 2002:a5d:56cb:0:b0:2c7:1b3d:1fb9 with SMTP id
 m11-20020a5d56cb000000b002c71b3d1fb9mr3148111wrw.50.1677621928511; 
 Tue, 28 Feb 2023 14:05:28 -0800 (PST)
Received: from [192.168.68.175] (166.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.166]) by smtp.gmail.com with ESMTPSA id
 w11-20020adff9cb000000b002c55de1c72bsm10743546wrr.62.2023.02.28.14.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 14:05:27 -0800 (PST)
Message-ID: <708fa08e-d9f8-7d08-848b-2adafb3fac70@linaro.org>
Date: Tue, 28 Feb 2023 23:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] hw/acpi/cpu_hotplug: Convert 'Object *device' ->
 'DeviceState *parent'
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230203163021.35754-1-philmd@linaro.org>
 <20230203163021.35754-4-philmd@linaro.org>
 <20230228163949-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228163949-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 28/2/23 22:41, Michael S. Tsirkin wrote:
> On Fri, Feb 03, 2023 at 05:30:21PM +0100, Philippe Mathieu-Daudé wrote:
>> ACPI CPU hotplug parent can't be any QOM object, it must be a QDev.
>> Convert AcpiCpuHotplug::device field as QDev to enforce this.
>> Rename 'owner' and 'device' variables as 'parent'.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> 
> So instead of plain gpe->device we now have OBJECT all over
> the place. Why is this an improvement?

 From QOM PoV, in this prototype change:

   void legacy_acpi_cpu_hotplug_init(MemoryRegion *container,
- Object *owner,
+ DeviceState *parent,

we promote the parent/owner argument from generic Object to
Device, which is more restrictive.

Thus now you can not pass any QOM object, it has to be a QDev.

>> ---
>>   hw/acpi/acpi-cpu-hotplug-stub.c |  2 +-
>>   hw/acpi/cpu_hotplug.c           | 18 +++++++++---------
>>   hw/acpi/ich9.c                  |  5 +++--
>>   hw/acpi/piix4.c                 |  2 +-
>>   include/hw/acpi/cpu_hotplug.h   |  4 ++--
>>   5 files changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
>> index cbd7a6ec00..0fcc1ec8ea 100644
>> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
>> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
>> @@ -13,7 +13,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>>       return;
>>   }
>>   
>> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
>> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
>>                                     AcpiCpuHotplug *gpe, uint16_t base)
>>   {
>>       return;
>> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
>> index 636e985c50..b8c9081738 100644
>> --- a/hw/acpi/cpu_hotplug.c
>> +++ b/hw/acpi/cpu_hotplug.c
>> @@ -41,8 +41,8 @@ static void cpu_status_write(void *opaque, hwaddr addr, uint64_t data,
>>        */
>>       if (addr == 0 && data == 0) {
>>           AcpiCpuHotplug *gpe = opaque;
>> -        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
>> -                                 &error_abort);
>> +        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legacy",
>> +                                 false, &error_abort);
>>       }
>>   }
>>   
>> @@ -66,8 +66,8 @@ static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gpe, CPUState *cpu)
>>   
>>       cpu_id = k->get_arch_id(cpu);
>>       if ((cpu_id / 8) >= ACPI_GPE_PROC_LEN) {
>> -        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
>> -                                 &error_abort);
>> +        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legacy",
>> +                                 false, &error_abort);
>>           return;
>>       }
>>   
>> @@ -81,15 +81,15 @@ void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
>>       acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
>>   }
>>   
>> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
>> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
>>                                     AcpiCpuHotplug *gpe, uint16_t base)
>>   {
>>       CPUState *cpu;
>>   
>> -    memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
>> +    memory_region_init_io(&gpe->io, OBJECT(parent), &AcpiCpuHotplug_ops,
>>                             gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
>>       memory_region_add_subregion(container, base, &gpe->io);
>> -    gpe->device = owner;
>> +    gpe->parent = parent;
>>   
>>       CPU_FOREACH(cpu) {
>>           acpi_set_cpu_present_bit(gpe, cpu);
>> @@ -100,10 +100,10 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>>                                   CPUHotplugState *cpuhp_state,
>>                                   uint16_t io_port)
>>   {
>> -    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->device));
>> +    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->parent));
>>   
>>       memory_region_del_subregion(container, &gpe->io);
>> -    cpu_hotplug_hw_init(container, gpe->device, cpuhp_state, io_port);
>> +    cpu_hotplug_hw_init(container, OBJECT(gpe->parent), cpuhp_state, io_port);
>>   }
>>   
>>   void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
>> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
>> index 4f8385b894..6c9a737479 100644
>> --- a/hw/acpi/ich9.c
>> +++ b/hw/acpi/ich9.c
>> @@ -197,7 +197,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
>>   static int vmstate_cpuhp_pre_load(void *opaque)
>>   {
>>       ICH9LPCPMRegs *s = opaque;
>> -    Object *obj = OBJECT(s->gpe.device);
>> +    Object *obj = OBJECT(s->gpe.parent);
>>       object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_abort);
>>       return 0;
>>   }
>> @@ -338,7 +338,8 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
>>       qemu_register_powerdown_notifier(&pm->powerdown_notifier);
>>   
>>       legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
>> -        OBJECT(lpc_pci), &pm->gpe, ICH9_CPU_HOTPLUG_IO_BASE);
>> +                                 DEVICE(lpc_pci), &pm->gpe,
>> +                                 ICH9_CPU_HOTPLUG_IO_BASE);
>>   
>>       if (pm->acpi_memory_hotplug.is_enabled) {
>>           acpi_memory_hotplug_init(pci_address_space_io(lpc_pci), OBJECT(lpc_pci),
>> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
>> index 5595fe5be5..3a61d89f92 100644
>> --- a/hw/acpi/piix4.c
>> +++ b/hw/acpi/piix4.c
>> @@ -571,7 +571,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *container,
>>       object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
>>                                piix4_get_cpu_hotplug_legacy,
>>                                piix4_set_cpu_hotplug_legacy);
>> -    legacy_acpi_cpu_hotplug_init(container, OBJECT(s), &s->gpe,
>> +    legacy_acpi_cpu_hotplug_init(container, DEVICE(s), &s->gpe,
>>                                    PIIX4_CPU_HOTPLUG_IO_BASE);
>>   
>>       if (s->acpi_memory_hotplug.is_enabled) {
>> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
>> index 5ff24ec417..b2f990f0b8 100644
>> --- a/include/hw/acpi/cpu_hotplug.h
>> +++ b/include/hw/acpi/cpu_hotplug.h
>> @@ -20,7 +20,7 @@
>>   #include "hw/acpi/cpu.h"
>>   
>>   typedef struct AcpiCpuHotplug {
>> -    Object *device;
>> +    DeviceState *parent;
>>       MemoryRegion io;
>>       uint8_t sts[ACPI_GPE_PROC_LEN];
>>   } AcpiCpuHotplug;
>> @@ -28,7 +28,7 @@ typedef struct AcpiCpuHotplug {
>>   void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
>>                                DeviceState *dev, Error **errp);
>>   
>> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
>> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
>>                                     AcpiCpuHotplug *gpe, uint16_t base);
>>   
>>   void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>> -- 
>> 2.38.1
> 


