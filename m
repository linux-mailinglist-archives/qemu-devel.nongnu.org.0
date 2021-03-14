Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAC333A4A9
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 13:13:23 +0100 (CET)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLPcY-0005BG-AQ
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 08:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lLPal-0004db-ES
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 08:11:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lLPaj-0006cP-KX
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 08:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615723889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZnewPn8tqQo/isEe3fCNm+zNZloJ3Iz3jXQx2ZWCYD0=;
 b=Fmu+IjcBRkflRbDo5NmtjsqmJw144ldKVSbTKfbJ+OcprUmw5DLwg2jzTgNuLQkDQhO1Iv
 aVHsG3DaHtdwgjo+RwKhaSty7/MZJwd2+OkItjWJ16G+tjenqMA8GgDBNKc1xM1RZHMtpA
 5KwXdKr1yg+A5oZ9pCyliN/MkDbYSKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-e5IeIsjSOjWY3o44jKua1Q-1; Sun, 14 Mar 2021 08:11:25 -0400
X-MC-Unique: e5IeIsjSOjWY3o44jKua1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F74F8015BD;
 Sun, 14 Mar 2021 12:11:23 +0000 (UTC)
Received: from [10.36.112.254] (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E305110023BE;
 Sun, 14 Mar 2021 12:11:17 +0000 (UTC)
Subject: Re: [RFC RESEND PATCH 2/4] hw/pci: Add iommu option for pci root bus
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
 <1614414831-39712-3-git-send-email-wangxingang5@huawei.com>
 <d5cac8e3-2584-e904-0d1f-92058b45975e@redhat.com>
 <0aa15918-44fb-1b61-e520-a3ac8f6da4de@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <46e52aa9-0c69-5b13-afbe-5eba1e80fb0a@redhat.com>
Date: Sun, 14 Mar 2021 13:11:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0aa15918-44fb-1b61-e520-a3ac8f6da4de@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Xingang

On 3/11/21 1:24 PM, Wang Xingang wrote:
> Hi Eric,
> 
> On 2021/3/10 18:24, Auger Eric wrote:
>> Hi Xingang,
>>
>> On 2/27/21 9:33 AM, Wang Xingang wrote:
>>> From: Xingang Wang <wangxingang5@huawei.com>
>>>
>>> This add iommu option for pci root bus, including primary bus
>>> and pxb root bus. Default option is set to true, and the option
>>> is valid only if the iommu option for machine is properly set.
>>>
>>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>>> ---
>>>   hw/arm/virt.c                       | 29 +++++++++++++++++++++++++++++
>>>   hw/pci-bridge/pci_expander_bridge.c |  6 ++++++
>>>   hw/pci/pci.c                        |  2 +-
>>>   include/hw/arm/virt.h               |  1 +
>>>   4 files changed, 37 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 371147f3ae..0c9e549759 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -79,6 +79,7 @@
>>>   #include "hw/virtio/virtio-iommu.h"
>>>   #include "hw/char/pl011.h"
>>>   #include "qemu/guest-random.h"
>>> +#include "include/hw/pci/pci_bus.h"
>>>     #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>>       static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>>> @@ -1232,6 +1233,10 @@ static void create_smmu(const VirtMachineState
>>> *vms,
>>>         dev = qdev_new("arm-smmuv3");
>>>   +    if (vms->primary_bus_iommu) {
>>> +        bus->flags |= PCI_BUS_IOMMU;
>>> +    }
>>> +
>>>       object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>>>                                &error_abort);
>>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>> @@ -2305,6 +2310,20 @@ static void virt_set_iommu(Object *obj, const
>>> char *value, Error **errp)
>>>       }
>>>   }
>>>   +static bool virt_get_primary_bus_iommu(Object *obj, Error **errp)
>>> +{
>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>> +
>>> +    return vms->primary_bus_iommu;
>>> +}
>>> +
>>> +static void virt_set_primary_bus_iommu(Object *obj, bool value,
>>> Error **errp)
>>> +{
>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>> +
>>> +    vms->primary_bus_iommu = value;
>>> +}
>>> +
>>>   static CpuInstanceProperties
>>>   virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>>   {
>>> @@ -2629,6 +2648,13 @@ static void
>>> virt_machine_class_init(ObjectClass *oc, void *data)
>>>                                             "Set the IOMMU type. "
>>>                                             "Valid values are none
>>> and smmuv3");
>>>   +    object_class_property_add_bool(oc, "primary_bus_iommu",
>>> +                                  virt_get_primary_bus_iommu,
>>> +                                  virt_set_primary_bus_iommu);
>>> +    object_class_property_set_description(oc, "primary_bus_iommu",
>>> +                                          "Set on/off to
>>> enable/disable "
>>> +                                          "iommu for primary bus");
>>> +
>>>       object_class_property_add_bool(oc, "ras", virt_get_ras,
>>>                                      virt_set_ras);
>>>       object_class_property_set_description(oc, "ras",
>>> @@ -2696,6 +2722,9 @@ static void virt_instance_init(Object *obj)
>>>       /* Default disallows iommu instantiation */
>>>       vms->iommu = VIRT_IOMMU_NONE;
>>>   +    /* Iommu is enabled by default for primary bus */
>>> +    vms->primary_bus_iommu = true;
>>> +
>>>       /* Default disallows RAS instantiation */
>>>       vms->ras = false;
>>>   diff --git a/hw/pci-bridge/pci_expander_bridge.c
>>> b/hw/pci-bridge/pci_expander_bridge.c
>>> index aedded1064..0412656265 100644
>>> --- a/hw/pci-bridge/pci_expander_bridge.c
>>> +++ b/hw/pci-bridge/pci_expander_bridge.c
>>> @@ -57,6 +57,7 @@ struct PXBDev {
>>>         uint8_t bus_nr;
>>>       uint16_t numa_node;
>>> +    bool iommu;
>>>   };
>>>     static PXBDev *convert_to_pxb(PCIDevice *dev)
>>> @@ -254,6 +255,10 @@ static void pxb_dev_realize_common(PCIDevice
>>> *dev, bool pcie, Error **errp)
>>>       bus->address_space_io = pci_get_bus(dev)->address_space_io;
>>>       bus->map_irq = pxb_map_irq_fn;
>>>   +    if (pxb->iommu) {
>>> +        bus->flags |= PCI_BUS_IOMMU;
>>> +    }
>>> +
>>>       PCI_HOST_BRIDGE(ds)->bus = bus;
>>>         pxb_register_bus(dev, bus, &local_err);
>>> @@ -301,6 +306,7 @@ static Property pxb_dev_properties[] = {
>>>       /* Note: 0 is not a legal PXB bus number. */
>>>       DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
>>>       DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node,
>>> NUMA_NODE_UNASSIGNED),
>>> +    DEFINE_PROP_BOOL("iommu", PXBDev, iommu, true),
>> looks a bit odd to me that we have a property for the PXE-PCIe extra
>> root complex and not for the gpex device. Wouldn't it make sense to add
>> one for the GPEX too? In the positive you still could have a machine
>> option that would force the GPEX property value?
> 
> Indeed it makes sense to add one property for GPEX too.However, the
> iommu property for PXBDev only helps to add option in qemu command line.
> When it is necessary to check whether the iommu is enabled on the root
> bus, it would be better to access the bus flag. In qemu, the pxb is not
> related to GPEX currently, and i do not find proper position to add the
> iommu property for GPEX, you might have some good idea for that.

What I had in mind was to add a similar property at GPEX level. Maybe I
would instead introduce an option that disallow the iommu on its
hierarchy. You would also have a virt machine  "primary_bus_iommu"
option that would control the GPEX property through an
object_property_set_int() call

But I would be curious about others' thoughts.

Thanks

Eric
> 
>>>       DEFINE_PROP_END_OF_LIST(),
>>>   };
>>>   diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>> index a9ebef8a35..dc969989c9 100644
>>> --- a/hw/pci/pci.c
>>> +++ b/hw/pci/pci.c
>>> @@ -2712,7 +2712,7 @@ AddressSpace
>>> *pci_device_iommu_address_space(PCIDevice *dev)
>>>             iommu_bus = parent_bus;
>>>       }
>>> -    if (iommu_bus && iommu_bus->iommu_fn) {
>>> +    if (pci_bus_has_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
>>>           return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque,
>>> devfn);
>>>       }
>>>       return &address_space_memory;
>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>> index ee9a93101e..babe829486 100644
>>> --- a/include/hw/arm/virt.h
>>> +++ b/include/hw/arm/virt.h
>>> @@ -147,6 +147,7 @@ struct VirtMachineState {
>>>       OnOffAuto acpi;
>>>       VirtGICType gic_version;
>>>       VirtIOMMUType iommu;
>>> +    bool primary_bus_iommu;
>>>       VirtMSIControllerType msi_controller;
>>>       uint16_t virtio_iommu_bdf;
>>>       struct arm_boot_info bootinfo;
>>>
>> Thanks
>>
>> Eric
>>
>> .
>>
> 
> Thanks
> 
> Xingang
> 
> .
> 


