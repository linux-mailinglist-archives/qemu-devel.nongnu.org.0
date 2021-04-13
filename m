Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1312235DDDE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 13:37:32 +0200 (CEST)
Received: from localhost ([::1]:49110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHMI-0004nw-NV
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 07:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lWHKC-0003gd-4c; Tue, 13 Apr 2021 07:35:21 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lWHK6-0003cQ-BU; Tue, 13 Apr 2021 07:35:19 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FKNk66F2hzNvP5;
 Tue, 13 Apr 2021 19:32:14 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 19:35:01 +0800
To: Auger Eric <eric.auger@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
 <1616656965-23328-4-git-send-email-wangxingang5@huawei.com>
 <f0cc7d43-70bd-7a65-3cba-213f258c57b4@redhat.com>
From: Xingang Wang <wangxingang5@huawei.com>
Subject: Re: [PATCH RFC RESEND v2 3/6] hw/pci: Add pci_root_bus_max_bus
Message-ID: <a5db10ff-692f-40bd-0800-2d081069ae15@huawei.com>
Date: Tue, 13 Apr 2021 19:35:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f0cc7d43-70bd-7a65-3cba-213f258c57b4@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
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

On 2021/4/13 16:05, Auger Eric wrote:
> Hi Xingang,
> 
> On 3/25/21 8:22 AM, Wang Xingang wrote:
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> This helps to find max bus number of a root bus.
> s/max bus number of a root bus/highest bus number of a bridge hierarchy?

Thanks, I will change the description.

>>
>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>   hw/pci/pci.c         | 34 ++++++++++++++++++++++++++++++++++
>>   include/hw/pci/pci.h |  1 +
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index e17aa9075f..c7957cbf7c 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -538,6 +538,40 @@ int pci_bus_num(PCIBus *s)
>>       return PCI_BUS_GET_CLASS(s)->bus_num(s);
>>   }
>>   
>> +int pci_root_bus_max_bus(PCIBus *bus)
>> +{
>> +    PCIHostState *host;
>> +    PCIDevice *dev;
>> +    int max_bus = 0;
>> +    int type, devfn;
>> +    uint8_t subordinate;
>> +
>> +    if (!pci_bus_is_root(bus)) {
>> +        return 0;
>> +    }
>> +
>> +    host = PCI_HOST_BRIDGE(BUS(bus)->parent);
>> +    max_bus = pci_bus_num(host->bus);
>> +
>> +    for (devfn = 0; devfn < ARRAY_SIZE(host->bus->devices); devfn++) {
>> +        dev = host->bus->devices[devfn];
>> +
>> +        if (!dev) {
>> +            continue;
>> +        }
>> +
>> +        type = dev->config[PCI_HEADER_TYPE] & ~PCI_HEADER_TYPE_MULTI_FUNCTION;
> Seems there is PCI_DEVICE_GET_CLASS(dev)->is_bridge (see
> pci_root_bus_in_range). Can't that be used instead?

Thanks, I will simplify this.

>> +        if (type == PCI_HEADER_TYPE_BRIDGE) {
>> +            subordinate = dev->config[PCI_SUBORDINATE_BUS];
>> +            if (subordinate > max_bus) {
>> +                max_bus = subordinate;
> what about the secondary bus number, it is always less than the others?
> 

Thanks, the secondary bus number should be taken into account. Maybe a 
pci_root_bus_range to get [min_bus, max_bus] would be better.

> Thanks
> 
> Eric
>> +            }
>> +        }
>> +    }
>> +
>> +    return max_bus;
>> +}
>> +
>>   int pci_bus_numa_node(PCIBus *bus)
>>   {
>>       return PCI_BUS_GET_CLASS(bus)->numa_node(bus);
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index 718b5a454a..e0c69534f4 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -450,6 +450,7 @@ static inline PCIBus *pci_get_bus(const PCIDevice *dev)
>>       return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
>>   }
>>   int pci_bus_num(PCIBus *s);
>> +int pci_root_bus_max_bus(PCIBus *bus);
>>   static inline int pci_dev_bus_num(const PCIDevice *dev)
>>   {
>>       return pci_bus_num(pci_get_bus(dev));
>>
> 
> .
> 

Xingang

.

