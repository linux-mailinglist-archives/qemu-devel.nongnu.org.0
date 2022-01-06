Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A657148639D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:19:34 +0100 (CET)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Qnt-0005bW-Fy
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:19:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1n5QlX-0003Nv-TQ; Thu, 06 Jan 2022 06:17:07 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1n5QlU-0002hG-J1; Thu, 06 Jan 2022 06:17:07 -0500
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JV3h457gNzbjkY;
 Thu,  6 Jan 2022 19:16:20 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Thu, 6 Jan 2022 19:16:55 +0800
Subject: Re: [RFC v2 1/2] hw/pci-host/gpex: Allow to generate preserve boot
 config DSM #5
To: <eric.auger@redhat.com>
References: <20211005085313.493858-1-eric.auger@redhat.com>
 <20211005085313.493858-2-eric.auger@redhat.com>
 <97906621-e6e1-67ec-a3a2-26e5fd07f1a6@hisilicon.com>
 <2cf469c6-2876-803d-049a-7500f067a0fb@redhat.com>
CC: <eric.auger.pro@gmail.com>, <imammedo@redhat.com>, <philmd@redhat.com>,
 <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>,
 <shameerali.kolothum.thodi@huawei.com>, <ardb@kernel.org>,
 <jean-philippe@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <drjones@redhat.com>, <gshan@redhat.com>, "linuxarm@huawei.com"
 <linuxarm@huawei.com>
Message-ID: <8aef8ea2-fb76-65e1-8f83-e1477bfbe827@hisilicon.com>
Date: Thu, 6 Jan 2022 19:16:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <2cf469c6-2876-803d-049a-7500f067a0fb@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "chenxiang (M)" <chenxiang66@hisilicon.com>
From:  "chenxiang (M)" via <qemu-devel@nongnu.org>



在 2022/1/6 19:00, Eric Auger 写道:
> Hi CHenxiangn
>
> On 12/29/21 8:13 AM, chenxiang (M) via wrote:
>> Hi Eric,
>>
>>
>> 在 2021/10/5 16:53, Eric Auger 写道:
>>> Add a 'preserve_config' field in struct GPEXConfig and
>>> if set generate the DSM #5 for preserving PCI boot configurations.
>>> The DSM presence is needed to expose RMRs.
>>>
>>> At the moment the DSM generation is not yet enabled.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>    include/hw/pci-host/gpex.h |  1 +
>>>    hw/pci-host/gpex-acpi.c    | 12 ++++++++++++
>>>    2 files changed, 13 insertions(+)
>>>
>>> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
>>> index fcf8b63820..3f8f8ec38d 100644
>>> --- a/include/hw/pci-host/gpex.h
>>> +++ b/include/hw/pci-host/gpex.h
>>> @@ -64,6 +64,7 @@ struct GPEXConfig {
>>>        MemMapEntry pio;
>>>        int         irq;
>>>        PCIBus      *bus;
>>> +    bool        preserve_config;
>>>    };
>>>      int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
>>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>>> index e7e162a00a..7dab259379 100644
>>> --- a/hw/pci-host/gpex-acpi.c
>>> +++ b/hw/pci-host/gpex-acpi.c
>>> @@ -164,6 +164,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct
>>> GPEXConfig *cfg)
>>>                    aml_append(dev, aml_name_decl("_PXM",
>>> aml_int(numa_node)));
>>>                }
>>>    +            if (cfg->preserve_config) {
>>> +                method = aml_method("_DSM", 5, AML_SERIALIZED);
>> I notice there is a ACPI BIOS Error when booting virtual machine which
>> seems be caused by this patch as I add this patchset in my branch to
>> test the function of vsmmu.
>> It seems that it requires only 4 parameter for method _DSM, but use 5
>> parameters here.
>> The error log is as following:
> Thank you for the heads up. Yes the problem was reported by Igor too in
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg842972.html.
>
> At the moment the RMRR ACPI situation has not progressed on spec side or
> kernel if I have not missed anything but sure I will take this into
> account in my next respin.

Ok, thanks.

>
> Thanks!
>
> Eric
>> [    2.355459] ACPI BIOS Error (bug): Failure creating named object
>> [\_SB.PCI0._DSM], AE_ALREADY_EXISTS (20210930/dswload2-327)
>> [    2.355467] ACPI Error: AE_ALREADY_EXISTS, During name
>> lookup/catalog (20210930/psobject-221)
>> [    2.355470] ACPI: Skipping parse of AML opcode: OpcodeName
>> unavailable (0x0014)
>> [    2.355657] ACPI: 1 ACPI AML tables successfully acquired and loaded
>> [    2.356321] ACPI: Interpreter enabled
>> [    2.356323] ACPI: Using GIC for interrupt routing
>> [    2.356333] ACPI: MCFG table detected, 1 entries
>> [    2.361359] ARMH0011:00: ttyAMA0 at MMIO 0x9000000 (irq = 16,
>> base_baud = 0) is a SBSA
>> [    2.619805] printk: console [ttyAMA0] enabled
>> [    2.622114] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
>> [    2.622788] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
>> ClockPM Segments MSI HPX-Type3]
>> [    2.623776] acpi PNP0A08:00: _OSC: platform does not support [LTR]
>> [    2.624600] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME
>> AER PCIeCapability]
>> [    2.625721] acpi PNP0A08:00: ECAM area [mem
>> 0x4010000000-0x401fffffff] reserved by PNP0C02:00
>> [    2.626645] acpi PNP0A08:00: ECAM at [mem
>> 0x4010000000-0x401fffffff] for [bus 00-ff]
>> [    2.627450] ACPI: Remapped I/O 0x000000003eff0000 to [io
>> 0x0000-0xffff window]
>> [    2.628229] ACPI BIOS Error (bug): \_SB.PCI0._DSM: Excess arguments
>> - ASL declared 5, ACPI requires 4 (20210930/nsarguments-166)
>> [    2.629576] PCI host bridge to bus 0000:00
>> [    2.630008] pci_bus 0000:00: root bus resource [mem
>> 0x10000000-0x3efeffff window]
>> [    2.630747] pci_bus 0000:00: root bus resource [io  0x0000-0xffff
>> window]
>> [    2.631405] pci_bus 0000:00: root bus resource [mem
>> 0x8000000000-0xffffffffff window]
>> [    2.632177] pci_bus 0000:00: root bus resource [bus 00-ff]
>> [    2.632731] ACPI BIOS Error (bug): \_SB.PCI0._DSM: Excess arguments
>> - ASL declared 5, ACPI requires 4 (20210930/nsarguments-166)
>>
>>
>>> +                aml_append(method, aml_return(aml_int(0)));
>>> +                aml_append(dev, method);
>>> +            }
>>> +
>>>                acpi_dsdt_add_pci_route_table(dev, cfg->irq);
>>>                  /*
>>> @@ -191,6 +197,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct
>>> GPEXConfig *cfg)
>>>        aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0
>>> Device")));
>>>        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>>>    +    if (cfg->preserve_config) {
>>> +        method = aml_method("_DSM", 5, AML_SERIALIZED);
>>> +        aml_append(method, aml_return(aml_int(0)));
>>> +        aml_append(dev, method);
>>> +    }
>>> +
>>>        acpi_dsdt_add_pci_route_table(dev, cfg->irq);
>>>          method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
>>
> .
>


