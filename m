Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EAA39A16A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:48:56 +0200 (CEST)
Received: from localhost ([::1]:59878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lommM-0006yg-Tj
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lomlG-00063i-Fl; Thu, 03 Jun 2021 08:47:46 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lomlD-0007LP-Ut; Thu, 03 Jun 2021 08:47:46 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fwlw56p5Bz6tys;
 Thu,  3 Jun 2021 20:44:37 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:47:36 +0800
Received: from [10.174.185.226] (10.174.185.226) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:47:35 +0800
To: <eric.auger@redhat.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-4-git-send-email-wangxingang5@huawei.com>
 <b1f26e3a-d678-aa50-4e82-71c76c9775b8@redhat.com>
From: Xingang Wang <wangxingang5@huawei.com>
Subject: Re: [PATCH v4 3/8] hw/arm/virt: Add a machine option to bypass iommu
 for primary bus
Message-ID: <104b0951-87de-c880-0ff9-e8bbbc19b72d@huawei.com>
Date: Thu, 3 Jun 2021 20:47:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <b1f26e3a-d678-aa50-4e82-71c76c9775b8@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangxingang5@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.603,
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
Cc: xieyingtai@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/6/2 20:25, Eric Auger wrote:
> Hi Xingang,
> 
> On 5/25/21 5:50 AM, Wang Xingang wrote:
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> This add a bypass_iommu option for arm virt machine,
>> the option can be used in this manner:
>> qemu -machine virt,iommu=smmuv3,bypass_iommu=true
> This still looks confusing to me. On one hand we say that for the virt
> machine the iommu is set to smmuv3 and we say bypass_iommu=true on the
> virt machine option line
> It is not straightforward that the bypass_iommu only relates to devices
> plugged onto the "default" root bus.
> 
> At least the name of the property should reflect that I think
> 

Thanks, maybe I should replace the name to "default_rootbus_bypass_iommu".
I just considered that the name might be too long,
anyway, explicitness is important, I will fix this.


>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>> ---
>>   hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
>>   include/hw/arm/virt.h |  1 +
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 840758666d..49d8a801ed 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1364,6 +1364,7 @@ static void create_pcie(VirtMachineState *vms)
>>       }
>>   
>>       pci = PCI_HOST_BRIDGE(dev);
>> +    pci->bypass_iommu = vms->bypass_iommu;
>>       vms->bus = pci->bus;
>>       if (vms->bus) {
>>           for (i = 0; i < nb_nics; i++) {
>> @@ -2319,6 +2320,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>>       }
>>   }
>>   
>> +static bool virt_get_bypass_iommu(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    return vms->bypass_iommu;
>> +}
>> +
>> +static void virt_set_bypass_iommu(Object *obj, bool value,
>> +                                              Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    vms->bypass_iommu = value;
>> +}
>> +
>>   static CpuInstanceProperties
>>   virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>   {
>> @@ -2656,6 +2672,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>                                             "Set the IOMMU type. "
>>                                             "Valid values are none and smmuv3");
>>   
>> +    object_class_property_add_bool(oc, "bypass_iommu",
>> +                                   virt_get_bypass_iommu,
>> +                                   virt_set_bypass_iommu);
>> +    object_class_property_set_description(oc, "bypass_iommu",
>> +                                          "Set on/off to enable/disable "
>> +                                          "bypass_iommu for primary bus");
>> +
>>       object_class_property_add_bool(oc, "ras", virt_get_ras,
>>                                      virt_set_ras);
>>       object_class_property_set_description(oc, "ras",
>> @@ -2723,6 +2746,9 @@ static void virt_instance_init(Object *obj)
>>       /* Default disallows iommu instantiation */
>>       vms->iommu = VIRT_IOMMU_NONE;
>>   
>> +    /* The primary bus is attached to iommu by default */
>> +    vms->bypass_iommu = false;
> I don't fully master the PCI topology but I think you should clarify
> which primary bus we talk about. AFAIU PXB's bus also is a primary bus.
> 
> Thanks
> 
> Eric

Thanks, I will make this annotation clearer.

>> +
>>       /* Default disallows RAS instantiation */
>>       vms->ras = false;
>>   
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 921416f918..82bceadb82 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -147,6 +147,7 @@ struct VirtMachineState {
>>       OnOffAuto acpi;
>>       VirtGICType gic_version;
>>       VirtIOMMUType iommu;
>> +    bool bypass_iommu;
>>       VirtMSIControllerType msi_controller;
>>       uint16_t virtio_iommu_bdf;
>>       struct arm_boot_info bootinfo;
> 
> .
> 

Xingang

.

