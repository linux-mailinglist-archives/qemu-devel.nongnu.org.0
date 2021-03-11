Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF33371EB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:02:00 +0100 (CET)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKK0t-0002TE-T2
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lKJzB-0001Nx-BU; Thu, 11 Mar 2021 07:00:13 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:3659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lKJz9-0001AK-8f; Thu, 11 Mar 2021 07:00:13 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dx6sP2cfnz8thC;
 Thu, 11 Mar 2021 19:58:17 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 11 Mar 2021 19:59:59 +0800
Subject: Re: [RFC RESEND PATCH 1/4] pci: Add PCI_BUS_IOMMU property
To: Auger Eric <eric.auger@redhat.com>, <qemu-devel@nongnu.org>
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
 <1614414831-39712-2-git-send-email-wangxingang5@huawei.com>
 <e5774084-5934-48ce-d902-f3be2070ec6e@redhat.com>
From: Wang Xingang <wangxingang5@huawei.com>
Message-ID: <07200298-9a71-92ca-9fed-776b78655451@huawei.com>
Date: Thu, 11 Mar 2021 19:59:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <e5774084-5934-48ce-d902-f3be2070ec6e@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=wangxingang5@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/3/10 18:25, Auger Eric wrote:
> Hi Xingang,
> 
> On 2/27/21 9:33 AM, Wang Xingang wrote:
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> This Property can be useful to check whether this bus is attached to iommu.
> 
> Strictly speaking this is not a Property (QEMU property) but a flag
>>
>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>   include/hw/pci/pci_bus.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
>> index 347440d42c..42109e8a06 100644
>> --- a/include/hw/pci/pci_bus.h
>> +++ b/include/hw/pci/pci_bus.h
>> @@ -24,6 +24,8 @@ enum PCIBusFlags {
>>       PCI_BUS_IS_ROOT                                         = 0x0001,
>>       /* PCIe extended configuration space is accessible on this bus */
>>       PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
>> +    /* Iommu is enabled on this bus */
> s/Iommu/IOMMU here and elsewhere
>> +    PCI_BUS_IOMMU                                           = 0x0004,
>>   };
>>   
>>   struct PCIBus {
>> @@ -63,4 +65,15 @@ static inline bool pci_bus_allows_extended_config_space(PCIBus *bus)
>>       return !!(bus->flags & PCI_BUS_EXTENDED_CONFIG_SPACE);
>>   }
>>   
>> +static inline bool pci_bus_has_iommu(PCIBus *bus)
>> +{
>> +    PCIBus *root_bus = bus;
>> +
>> +    while (root_bus && !pci_bus_is_root(root_bus)) {
>> +        root_bus = pci_get_bus(root_bus->parent_dev);
>> +    }
>> +
>> +    return !!(root_bus->flags & PCI_BUS_IOMMU);
>> +}
>> +
>>   #endif /* QEMU_PCI_BUS_H */
>>
> Eric
> 
> .
> 

Thanks, i will fix this.

Xingang

.

