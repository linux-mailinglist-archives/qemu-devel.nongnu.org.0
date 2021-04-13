Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9199335D5F9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 05:36:41 +0200 (CEST)
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW9qy-0008Ps-De
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 23:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lW9oh-00071u-VK; Mon, 12 Apr 2021 23:34:19 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lW9oc-00051J-9E; Mon, 12 Apr 2021 23:34:19 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FKB3s0474z18HqJ;
 Tue, 13 Apr 2021 11:31:53 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 11:34:02 +0800
To: Auger Eric <eric.auger@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
 <1616656965-23328-3-git-send-email-wangxingang5@huawei.com>
 <88a49b26-40a2-e563-14eb-126944876113@redhat.com>
From: Wang Xingang <wangxingang5@huawei.com>
Subject: Re: [PATCH RFC RESEND v2 2/6] hw/pci: Add iommu option for pci root
 bus
Message-ID: <ace43692-8345-56bb-e098-a3a10dd9569f@huawei.com>
Date: Tue, 13 Apr 2021 11:34:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <88a49b26-40a2-e563-14eb-126944876113@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangxingang5@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/4/13 1:36, Auger Eric wrote:
> Hi Wang,
> 
> On 3/25/21 8:22 AM, Wang Xingang wrote:
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> This add iommu option for pci root bus, including primary bus
>> and pxb root bus. The option is valid only if there is a virtual
>> iommu device.
>>
>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> 
> same in this patch I would prefer to inverse the logic and use something
> like bypass_iommu.
> 
> Sorry it an invasive change for you. Maybe wait for the other's feedbacks.
> 

Thanks, it is useful.

>> ---
>>   hw/arm/virt.c                       | 25 +++++++++++++++++++++++++
>>   hw/i386/pc.c                        | 19 +++++++++++++++++++
>>   hw/pci-bridge/pci_expander_bridge.c |  3 +++
>>   hw/pci-host/q35.c                   |  1 +
>>   include/hw/arm/virt.h               |  1 +
>>   include/hw/i386/pc.h                |  1 +
> Also I think this patch would need to be split into several ones (at
> least this is what I would do)
> - 1 patch for the pci_expander_bridge.c  change ("add an iommy bypass prop")
> - 1  patch for virt machine where you add a machine option to bypass the
> iommu translation for the root bus.
> - 1 patch of pc/q35
> 
> Indeed the patch title title does not reflect the machine changes and
> the pxb changes

Thanks, I will split it and change the description in the next revision.

>>   6 files changed, 50 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index aa2bbd14e0..446b3b867f 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1366,6 +1366,7 @@ static void create_pcie(VirtMachineState *vms)
>>       }
>>   
>>       pci = PCI_HOST_BRIDGE(dev);
>> +    pci->iommu = vms->primary_bus_iommu;
>>       vms->bus = pci->bus;
>>       if (vms->bus) {
>>           for (i = 0; i < nb_nics; i++) {
>> @@ -2319,6 +2320,20 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>>       }
>>   }
> 
>>   
>> +static bool virt_get_primary_bus_iommu(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    return vms->primary_bus_iommu;
>> +}
>> +
>> +static void virt_set_primary_bus_iommu(Object *obj, bool value, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    vms->primary_bus_iommu = value;
>> +}
>> +
>>   static CpuInstanceProperties
>>   virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>   {
>> @@ -2652,6 +2667,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>                                             "Set the IOMMU type. "
>>                                             "Valid values are none and smmuv3");
>>   
>> +    object_class_property_add_bool(oc, "primary_bus_iommu",
>> +                                  virt_get_primary_bus_iommu,
>> +                                  virt_set_primary_bus_iommu);
>> +    object_class_property_set_description(oc, "primary_bus_iommu",
>> +                                          "Set on/off to enable/disable "
>> +                                          "iommu for primary bus");
>> +
>>       object_class_property_add_bool(oc, "ras", virt_get_ras,
>>                                      virt_set_ras);
>>       object_class_property_set_description(oc, "ras",
>> @@ -2719,6 +2741,9 @@ static void virt_instance_init(Object *obj)
>>       /* Default disallows iommu instantiation */
>>       vms->iommu = VIRT_IOMMU_NONE;
>>   
>> +    /* The primary bus is attached to iommu by default */
>> +    vms->primary_bus_iommu = true;
>> +
>>       /* Default disallows RAS instantiation */
>>       vms->ras = false;
>>   
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 8a84b25a03..b64e4bb7f2 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1529,6 +1529,21 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
>>       pcms->hpet_enabled = value;
>>   }
>>   
>> +static bool pc_machine_get_primary_bus_iommu(Object *obj, Error **errp)
>> +{
>> +    PCMachineState *pcms = PC_MACHINE(obj);
>> +
>> +    return pcms->primary_bus_iommu;
>> +}
>> +
>> +static void pc_machine_set_primary_bus_iommu(Object *obj, bool value,
>> +                                             Error **errp)
>> +{
>> +    PCMachineState *pcms = PC_MACHINE(obj);
>> +
>> +    pcms->primary_bus_iommu = value;
>> +}
>> +
>>   static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
>>                                               const char *name, void *opaque,
>>                                               Error **errp)
>> @@ -1628,6 +1643,7 @@ static void pc_machine_initfn(Object *obj)
>>   #ifdef CONFIG_HPET
>>       pcms->hpet_enabled = true;
>>   #endif
>> +    pcms->primary_bus_iommu = true;
>>   
>>       pc_system_flash_create(pcms);
>>       pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
>> @@ -1752,6 +1768,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>>       object_class_property_add_bool(oc, "hpet",
>>           pc_machine_get_hpet, pc_machine_set_hpet);
>>   
>> +    object_class_property_add_bool(oc, "primary_bus_iommu",
>> +        pc_machine_get_primary_bus_iommu, pc_machine_set_primary_bus_iommu);
>> +
>>       object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
>>           pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
>>           NULL, NULL);
>> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
>> index aedded1064..f1a0eadc03 100644
>> --- a/hw/pci-bridge/pci_expander_bridge.c
>> +++ b/hw/pci-bridge/pci_expander_bridge.c
>> @@ -57,6 +57,7 @@ struct PXBDev {
>>   
>>       uint8_t bus_nr;
>>       uint16_t numa_node;
>> +    bool iommu;
>>   };
>>   
>>   static PXBDev *convert_to_pxb(PCIDevice *dev)
>> @@ -255,6 +256,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
>>       bus->map_irq = pxb_map_irq_fn;
>>   
>>       PCI_HOST_BRIDGE(ds)->bus = bus;
>> +    PCI_HOST_BRIDGE(ds)->iommu = pxb->iommu;
>>   
>>       pxb_register_bus(dev, bus, &local_err);
>>       if (local_err) {
>> @@ -301,6 +303,7 @@ static Property pxb_dev_properties[] = {
>>       /* Note: 0 is not a legal PXB bus number. */
>>       DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
>>       DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
>> +    DEFINE_PROP_BOOL("iommu", PXBDev, iommu, true),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
>> index 2eb729dff5..3b23fd0975 100644
>> --- a/hw/pci-host/q35.c
>> +++ b/hw/pci-host/q35.c
>> @@ -64,6 +64,7 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
>>                                   s->mch.address_space_io,
>>                                   0, TYPE_PCIE_BUS);
>>       PC_MACHINE(qdev_get_machine())->bus = pci->bus;
>> +    pci->iommu = PC_MACHINE(qdev_get_machine())->primary_bus_iommu;
>>       qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
>>   }
>>   
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 921416f918..1fbb19710f 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -147,6 +147,7 @@ struct VirtMachineState {
>>       OnOffAuto acpi;
>>       VirtGICType gic_version;
>>       VirtIOMMUType iommu;
>> +    bool primary_bus_iommu;
>>       VirtMSIControllerType msi_controller;
>>       uint16_t virtio_iommu_bdf;
>>       struct arm_boot_info bootinfo;
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index dcf060b791..07b08b3ac6 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -45,6 +45,7 @@ typedef struct PCMachineState {
>>       bool sata_enabled;
>>       bool pit_enabled;
>>       bool hpet_enabled;
>> +    bool primary_bus_iommu;
>>       uint64_t max_fw_size;
>>   
>>       /* NUMA information: */
>>
> 
> Thanks
> 
> Eric
> 
> .
> 

Thanks

Xingang

.

