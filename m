Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B865436D25B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 08:44:38 +0200 (CEST)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbdw5-00041A-QX
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 02:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbduf-0003TO-0N; Wed, 28 Apr 2021 02:43:09 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbduc-000110-1m; Wed, 28 Apr 2021 02:43:08 -0400
Received: from dggeml763-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FVTXq3TSmzYbYB;
 Wed, 28 Apr 2021 14:40:43 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml763-chm.china.huawei.com (10.1.199.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 28 Apr 2021 14:43:00 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 14:42:59 +0800
Subject: Re: [RFC PATCH v2 3/6] hw/arm/virt-acpi-build: Distinguish possible
 and present cpus
To: Andrew Jones <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-4-wangyanan55@huawei.com>
 <20210427131822.l6l26tegd44njp2t@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <9f1c62c5-52dc-7ae2-4797-67db8b1bdaba@huawei.com>
Date: Wed, 28 Apr 2021 14:42:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210427131822.l6l26tegd44njp2t@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Alistair
 Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, Ying Fang <fangying1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/4/27 21:18, Andrew Jones wrote:
> On Tue, Apr 13, 2021 at 04:07:42PM +0800, Yanan Wang wrote:
>> From: Ying Fang <fangying1@huawei.com>
>>
>> When building ACPI tables regarding CPUs we should always build
>> them for the number of possible CPUs, not the number of present
>> CPUs. We then ensure only the present CPUs are enabled in MADT.
>> Furthermore, it is also needed if we are going to support CPU
>> hotplug in the future.
>>
>> This patch is a rework based on Andrew Jones's contribution at
>> https://lists.gnu.org/archive/html/qemu-arm/2018-07/msg00076.html
>>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 14 ++++++++++----
>>   hw/arm/virt.c            |  3 +++
>>   2 files changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index f5a2b2d4cb..2ad5dad1bf 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -61,13 +61,16 @@
>>   
>>   static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
>>   {
>> -    MachineState *ms = MACHINE(vms);
>> +    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
>>       uint16_t i;
>>   
>> -    for (i = 0; i < ms->smp.cpus; i++) {
>> +    for (i = 0; i < possible_cpus->len; i++) {
>>           Aml *dev = aml_device("C%.03X", i);
>>           aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
>>           aml_append(dev, aml_name_decl("_UID", aml_int(i)));
>> +        if (possible_cpus->cpus[i].cpu == NULL) {
>> +            aml_append(dev, aml_name_decl("_STA", aml_int(0)));
>> +        }
>>           aml_append(scope, dev);
>>       }
>>   }
>> @@ -479,6 +482,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       const int *irqmap = vms->irqmap;
>>       AcpiMadtGenericDistributor *gicd;
>>       AcpiMadtGenericMsiFrame *gic_msi;
>> +    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
>>       int i;
>>   
>>       acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
>> @@ -489,7 +493,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>>       gicd->version = vms->gic_version;
>>   
>> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
>> +    for (i = 0; i < possible_cpus->len; i++) {
>>           AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>>                                                              sizeof(*gicc));
>>           ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
>> @@ -504,7 +508,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>           gicc->cpu_interface_number = cpu_to_le32(i);
>>           gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
>>           gicc->uid = cpu_to_le32(i);
>> -        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>> +        if (possible_cpus->cpus[i].cpu != NULL) {
>> +            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>> +        }
>>   
>>           if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>>               gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index f4ae60ded9..3e5d9b6f26 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2063,6 +2063,9 @@ static void machvirt_init(MachineState *machine)
>>           }
>>   
>>           qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
>> +
>> +        /* Initialize cpu member here since cpu hotplug is not supported yet */
>> +        machine->possible_cpus->cpus[n].cpu = cpuobj;
> Can drop the 'machine->' as possible_cpus is already set to the pointer.
Right, I will drop it.

Thanks,
Yanan
>>           object_unref(cpuobj);
>>       }
>>       fdt_add_timer_nodes(vms);
>> -- 
>> 2.19.1
>>
> Thanks,
> drew
>
>
> .

