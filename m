Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDED39F687
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:26:12 +0200 (CEST)
Received: from localhost ([::1]:48024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqao7-0003g9-HP
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lqamt-0002an-3Z; Tue, 08 Jun 2021 08:24:55 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lqamq-0003QV-59; Tue, 08 Jun 2021 08:24:54 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fzq770FTCz1BK10;
 Tue,  8 Jun 2021 20:19:47 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 20:24:37 +0800
Received: from [10.174.185.226] (10.174.185.226) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 20:24:37 +0800
To: Igor Mammedov <imammedo@redhat.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <20210605143238.2e52b08a@redhat.com>
From: Xingang Wang <wangxingang5@huawei.com>
Subject: Re: [PATCH v4 0/8] IOMMU: Add support for IOMMU Bypass Feature
Message-ID: <f04e5527-d9d8-953e-a572-83b91bcd05c7@huawei.com>
Date: Tue, 8 Jun 2021 20:24:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210605143238.2e52b08a@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangxingang5@huawei.com; helo=szxga08-in.huawei.com
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, ehabkost@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 2021/6/5 20:32, Igor Mammedov wrote:
> On Tue, 25 May 2021 03:49:57 +0000
> Wang Xingang <wangxingang5@huawei.com> wrote:
> 
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> These patches add support for configure bypass_iommu on/off for
>> pci root bus, including primary bus and pxb root bus. At present,
>> all root bus will go through iommu when iommu is configured,
>> which is not flexible, because in many situations the need for using
>> iommu and bypass iommu aften exists at the same time.
> 
> 'many situations' doesn't describe why bypass is needed,
> can you provide a use-cases here and what are security implications
> when bypass is allowed.
> (PS: the later probably should be documented somewhere in the docs/option description)
>   

It is possible that some devices support the iommu and some devices do 
not. When we need to pass through both kind of devices to a virtual
machine, bypass iommu would help.

E.g I have a HiSilicon network and computing encryption device(SEC),
which supports both iommu and noiommu mode. If I have to use a SEC in
noiommu mode along with another device which need iommu, then it would
need this bypass iommu feature.

Besides, bypass iommu would have less performance loss because there
might be many trap in and out using a virtual iommu.
However there might be potential security risks without iommu,
as devices might send malicious dma requests.
It would be necessary to only bypass iommu for trusted devices.

Thanks

Xingang

>> So this add option to enable/disable bypass_iommu for primary bus
>> and pxb root bus. The bypass_iommu property is set to false default,
>> meaning that devcies will go through iommu if no explicit configuration
>> is added. When bypass_iommu is enabled for the root bus, devices
>> attached to it will bypass iommu, otherwise devices will go through
>> iommu.
>>
>> This feature can be used in this manner:
>> arm: -machine virt,iommu=smmuv3,bypass_iommu=true
>> x86: -machine q35,bypass_iommu=true
>> pxb: -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,bypass_iommu=true
>>
>> History:
>>
>> v3 -> v4:
>> - simplify the logic in building the IORT idmap
>>
>> v2 -> v3:
>> - rebase on top of v6.0.0-rc4
>> - Took into account Eric's comments, replace with a bypass_iommu
>>    proerty
>> - When building the IORT idmap, cover the whole RID space
>>
>> v1 -> v2:
>> - rebase on top of v6.0.0-rc0
>> - Fix some issues
>> - Took into account Eric's comments, and remove the PCI_BUS_IOMMU flag,
>>    replace it with a property in PCIHostState.
>> - Add support for x86 iommu option
>>
>> Xingang Wang (8):
>>    hw/pci/pci_host: Allow bypass iommu for pci host
>>    hw/pxb: Add a bypass iommu property
>>    hw/arm/virt: Add a machine option to bypass iommu for primary bus
>>    hw/i386: Add a pc machine option to bypass iommu for primary bus
>>    hw/pci: Add pci_bus_range to get bus number range
>>    hw/arm/virt-acpi-build: Add explicit IORT idmap for smmuv3 node
>>    hw/i386/acpi-build: Add explicit scope in DMAR table
>>    hw/i386/acpi-build: Add bypass_iommu check when building IVRS table
>>
>>   hw/arm/virt-acpi-build.c            | 135 ++++++++++++++++++++++++----
>>   hw/arm/virt.c                       |  26 ++++++
>>   hw/i386/acpi-build.c                |  70 ++++++++++++++-
>>   hw/i386/pc.c                        |  18 ++++
>>   hw/pci-bridge/pci_expander_bridge.c |   3 +
>>   hw/pci-host/q35.c                   |   1 +
>>   hw/pci/pci.c                        |  33 ++++++-
>>   hw/pci/pci_host.c                   |   2 +
>>   include/hw/arm/virt.h               |   1 +
>>   include/hw/i386/pc.h                |   1 +
>>   include/hw/pci/pci.h                |   2 +
>>   include/hw/pci/pci_host.h           |   1 +
>>   12 files changed, 270 insertions(+), 23 deletions(-)
>>
> 
> .
> 

.

