Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23922ECA46
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 06:56:45 +0100 (CET)
Received: from localhost ([::1]:37902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxOHr-0003NH-6t
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 00:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kxOG6-0002Rb-Fd
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:54:58 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kxOG1-0007Gy-2I
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:54:54 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DBFlh1ctmz15np7;
 Thu,  7 Jan 2021 13:53:36 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Thu, 7 Jan 2021 13:54:24 +0800
Subject: Re: [PATCH v3 3/8] acpi/gpex: Inform os to keep firmware resource map
To: Igor Mammedov <imammedo@redhat.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-4-cenjiahui@huawei.com>
 <20201229144142.66583852@redhat.com>
 <20201230161942-mutt-send-email-mst@kernel.org>
 <20210105013529.4addf44f@redhat.com>
 <5418be81-3b91-749d-1806-0f54e5849421@huawei.com>
 <20210106142910.5ca8b677@redhat.com>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <dca69f55-dfd1-3f97-dc3f-13eeedec5027@huawei.com>
Date: Thu, 7 Jan 2021 13:54:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210106142910.5ca8b677@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.249,
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
Cc: xieyingtai@huawei.com, Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <ard.biesheuvel@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/1/6 21:29, Igor Mammedov wrote:
> On Tue, 5 Jan 2021 09:53:49 +0800
> Jiahui Cen <cenjiahui@huawei.com> wrote:
> 
>> On 2021/1/5 8:35, Igor Mammedov wrote:
>>> On Wed, 30 Dec 2020 16:22:08 -0500
>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>   
>>>> On Tue, Dec 29, 2020 at 02:41:42PM +0100, Igor Mammedov wrote:  
>>>>> On Wed, 23 Dec 2020 17:08:31 +0800
>>>>> Jiahui Cen <cenjiahui@huawei.com> wrote:
>>>>>     
>>>>>> There may be some differences in pci resource assignment between guest os
>>>>>> and firmware.
>>>>>>
>>>>>> Eg. A Bridge with Bus [d2]
>>>>>>     -+-[0000:d2]---01.0-[d3]----01.0
>>>>>>
>>>>>>     where [d2:01.00] is a pcie-pci-bridge with BAR0 (mem, 64-bit, non-pref) [size=256]
>>>>>>           [d3:01.00] is a PCI Device with BAR0 (mem, 64-bit, pref) [size=128K]
>>>>>>                                           BAR4 (mem, 64-bit, pref) [size=64M]
>>>>>>
>>>>>>     In EDK2, the Resource Map would be:
>>>>>>         PciBus: Resource Map for Bridge [D2|01|00]
>>>>>>         Type = PMem64; Base = 0x8004000000;     Length = 0x4100000;     Alignment = 0x3FFFFFF
>>>>>>            Base = 0x8004000000; Length = 0x4000000;     Alignment = 0x3FFFFFF;  Owner = PCI [D3|01|00:20]
>>>>>>            Base = 0x8008000000; Length = 0x20000;       Alignment = 0x1FFFF;    Owner = PCI [D3|01|00:10]
>>>>>>         Type =  Mem64; Base = 0x8008100000;     Length = 0x100; Alignment = 0xFFF
>>>>>>     It would use 0x4100000 to calculate the root bus's PMem64 resource window.
>>>>>>
>>>>>>     While in Linux, kernel will use 0x1FFFFFF as the alignment to calculate
>>>>>>     the PMem64 size, which would be 0x6000000. So kernel would try to
>>>>>>     allocate 0x6000000 from the PMem64 resource window, but since the window
>>>>>>     size is 0x4100000 as assigned by EDK2, the allocation would fail.
>>>>>>
>>>>>> The diffences could result in resource assignment failure.
>>>>>>
>>>>>> Using _DSM #5 method to inform guest os not to ignore the PCI configuration
>>>>>> that firmware has done at boot time could handle the differences.    
>>>>>
>>>>> I'm not sure about this one, 
>>>>> OS should able to reconfigure PCI resources according to what and where is plugged
>>>>> (and it even more true is hotplug is taken into account)    
>>>>
>>>> spec says this:
>>>>
>>>> 0: No (The operating system must not ignore the PCI configuration that firmware has done
>>>> at boot time. However, the operating system is free to configure the devices in this hierarchy
>>>> that have not been configured by the firmware. There may be a reduced level of hot plug
>>>> capability support in this hierarchy due to resource constraints. This situation is the same as
>>>> the legacy situation where this _DSM is not provided.)
>>>> 1: Yes (The operating system may ignore the PCI configuration that the firmware has done
>>>> at boot time, and reconfigure/rebalance the resources in the hierarchy.)  
>>> I sort of convinced my self that's is just hotplug work might need to implement reconfiguration
>>> in guest kernel and maybe QEMU
>>>
>>> Though I have a question,
>>>
>>>  1. does it work for PC machine with current kernel, if so why?
>>>  2. what it would take to make it work for arm/virt?
>>>   
>>
>> 1. For x86, it generally keeps the configuration by firmware,
>> so there is nothing wrong for PC machine.
>>
>> 2. We add DSM method in DSDT to inform guest to keep
>> firmware's configuration, just like x86.
>>
>>>> and
>>>>
>>>> IMPLEMENTATION NOTE
>>>> This _DSM function provides backwards compatibility on platforms that can run legacy operating
>>>> systems.
>>>> Operating systems for two different architectures (e.g., x86 and x64) can be installed on a platform.
>>>> The firmware cannot distinguish the operating system in time to change the boot configuration of
>>>> devices. Say for instance, an x86 operating system in non-PAE mode is installed on a system. The
>>>> x86 operating system cannot access device resource space above 4 GiB. So the firmware is required
>>>> to configure devices at boot time using addresses below 4 GiB. On the other hand, if an x64
>>>> operating system is installed on this system, it can access device resources above the 4 GiB so it does
>>>> not want the firmware to constrain the resource assignment below 4 GiB that the firmware
>>>> configures at boot time. It is not possible for the firmware to change this by the time it boots the
>>>> operating system. Ignoring the configurations done by firmware at boot time will allow the
>>>> operating system to push resource assignment using addresses above 4 GiB for an x64 operating
>>>> system while constrain it to addresses below 4 GiB for an x86 operating system.
>>>>
>>>> so fundamentally, saying "1" here just means "you can ignore what
>>>> firmware configured if you like".
>>>>
>>>>
>>>> I have a different question though: our CRS etc is based on what
>>>> firmware configured. Is that ok? Or is ACPI expected to somehow
>>>> reconfigure itself when OS reconfigures devices?
>>>> Think it's ok but could not find documentation either way.  
>>>
>>> guest consume DSDT only at boot time,
>>> reconfiguration can done later by PCI subsystem without
>>> ACPI (at least it used to be so).
>>>
>>> However DSM is dynamic,
>>> and maybe evaluated at runtime,
>>> though I don't know if kernel would re-evaluate this feature bit after boot
>>>   
>>
>> Seems kernel evaluates DSM only at boot time.
> 
> Ok, lets respin this series without 5/8
> to avoid mixing unrelated changes in one series.
> 
> We can think about 5/8 some more and return to it later if it proves hard to merge.

OK, I'll split patch [5/8] from this series and
send them separately.

Thanks for the discussion.

Thanks,
Jiahui

> 
>>
>> Thanks,
>> Jiahui
>>
>>>   
>>>>
>>>>  
>>>>>>
>>>>>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>>>>>> ---
>>>>>>  hw/pci-host/gpex-acpi.c | 18 ++++++++++++++++--
>>>>>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>>>>>> index 11b3db8f71..c189306599 100644
>>>>>> --- a/hw/pci-host/gpex-acpi.c
>>>>>> +++ b/hw/pci-host/gpex-acpi.c
>>>>>> @@ -112,10 +112,24 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>>>>>>      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
>>>>>>      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>>>>>>      ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
>>>>>> -    uint8_t byte_list[1] = {1};
>>>>>> -    buf = aml_buffer(1, byte_list);
>>>>>> +    uint8_t byte_list[] = {
>>>>>> +                0x1 << 0 /* support for functions other than function 0 */ |
>>>>>> +                0x1 << 5 /* support for function 5 */
>>>>>> +                };
>>>>>> +    buf = aml_buffer(ARRAY_SIZE(byte_list), byte_list);
>>>>>>      aml_append(ifctx1, aml_return(buf));
>>>>>>      aml_append(ifctx, ifctx1);
>>>>>> +
>>>>>> +    /* PCI Firmware Specification 3.1
>>>>>> +     * 4.6.5. _DSM for Ignoring PCI Boot Configurations
>>>>>> +     */
>>>>>> +    /* Arg2: Function Index: 5 */
>>>>>> +    ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
>>>>>> +    /* 0 - The operating system must not ignore the PCI configuration that
>>>>>> +     *     firmware has done at boot time.
>>>>>> +     */
>>>>>> +    aml_append(ifctx1, aml_return(aml_int(0)));
>>>>>> +    aml_append(ifctx, ifctx1);
>>>>>>      aml_append(method, ifctx);
>>>>>>  
>>>>>>      byte_list[0] = 0;    
>>>>
>>>>  
>>>
>>> .
>>>   
>>
> 
> .
> 

