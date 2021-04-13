Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A0335D5DC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 05:27:31 +0200 (CEST)
Received: from localhost ([::1]:49560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW9i5-00052G-Kq
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 23:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lW9h2-0004UV-Vx; Mon, 12 Apr 2021 23:26:25 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lW9gy-0000Fh-IK; Mon, 12 Apr 2021 23:26:24 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FK9v355y5zlX2D;
 Tue, 13 Apr 2021 11:24:15 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 11:25:59 +0800
To: Auger Eric <eric.auger@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
 <1616656965-23328-2-git-send-email-wangxingang5@huawei.com>
 <6e6a276f-86b2-2f32-f3e0-9552f3d28a21@redhat.com>
From: Wang Xingang <wangxingang5@huawei.com>
Subject: Re: [PATCH RFC RESEND v2 1/6] hw/pci/pci_host: Add iommu property for
 pci host
Message-ID: <f4f4d975-5e9a-6677-02a4-bc0310e9e0f9@huawei.com>
Date: Tue, 13 Apr 2021 11:25:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <6e6a276f-86b2-2f32-f3e0-9552f3d28a21@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangxingang5@huawei.com; helo=szxga06-in.huawei.com
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
>> The pci host iommu property is useful to check whether
>> the iommu is enabled on the pci root bus.
>>
>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>   hw/pci/pci.c              | 18 +++++++++++++++++-
>>   hw/pci/pci_host.c         |  2 ++
>>   include/hw/pci/pci.h      |  1 +
>>   include/hw/pci/pci_host.h |  1 +
>>   4 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index ac9a24889c..e17aa9075f 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -417,6 +417,22 @@ const char *pci_root_bus_path(PCIDevice *dev)
>>       return rootbus->qbus.name;
>>   }
>>   
>> +bool pci_root_bus_has_iommu(PCIBus *bus)
> "has_iommu" is misleading as it does not mean an IOMMU is actually
> instantiated but rather that if there is any, it will translate
> transactions coming from this primary bus
> 
> I would rather inverse the logic and have a
> 
> "bypass_iommu" property defaulting to false
> 
> and this function dubbed something like pci_root_bus_bypass_iommu
>> +{
>> +    PCIBus *rootbus = bus;
>> +    PCIHostState *host_bridge;
>> +
>> +    if (!pci_bus_is_root(bus)) {
>> +        rootbus = pci_device_root_bus(bus->parent_dev);
>> +    }
>> +
>> +    host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
>> +
>> +    assert(host_bridge->bus == rootbus);
>> +
>> +    return host_bridge->iommu;
>> +}
>> +

Thanks for your advice, it is misleading, i will replace this.

>>   static void pci_root_bus_init(PCIBus *bus, DeviceState *parent,
>>                                 MemoryRegion *address_space_mem,
>>                                 MemoryRegion *address_space_io,
>> @@ -2716,7 +2732,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>>   
>>           iommu_bus = parent_bus;
>>       }
>> -    if (iommu_bus && iommu_bus->iommu_fn) {
>> +    if (pci_root_bus_has_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
>>           return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
>>       }
>>       return &address_space_memory;
>> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
>> index 8ca5fadcbd..92ce213b18 100644
>> --- a/hw/pci/pci_host.c
>> +++ b/hw/pci/pci_host.c
>> @@ -222,6 +222,8 @@ const VMStateDescription vmstate_pcihost = {
>>   static Property pci_host_properties_common[] = {
>>       DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
>>                        mig_enabled, true),
>> +    DEFINE_PROP_BOOL("pci-host-iommu-enabled", PCIHostState,
>> +                     iommu, true),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index 6be4e0c460..718b5a454a 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -480,6 +480,7 @@ void pci_for_each_bus(PCIBus *bus,
>>   
>>   PCIBus *pci_device_root_bus(const PCIDevice *d);
>>   const char *pci_root_bus_path(PCIDevice *dev);
>> +bool pci_root_bus_has_iommu(PCIBus *bus);
>>   PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn);
>>   int pci_qdev_find_device(const char *id, PCIDevice **pdev);
>>   void pci_bus_get_w64_range(PCIBus *bus, Range *range);
>> diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
>> index 52e038c019..64128e3a19 100644
>> --- a/include/hw/pci/pci_host.h
>> +++ b/include/hw/pci/pci_host.h
>> @@ -43,6 +43,7 @@ struct PCIHostState {
>>       uint32_t config_reg;
>>       bool mig_enabled;
>>       PCIBus *bus;
>> +    bool iommu;
>>   
>>       QLIST_ENTRY(PCIHostState) next;
>>   };
>>
> Thanks
> 
> Eric
> 
> .
> 

Thanks

Xingang

.

