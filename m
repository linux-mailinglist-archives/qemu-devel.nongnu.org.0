Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822C58A7D3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:11:39 +0200 (CEST)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsQk-0004s8-88
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oJsG6-0005XA-AZ
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:00:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oJsG2-0002Ru-7M
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659686432;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rVMkFpZolqYntAB16IACRwBZT+KaJRpzNatJXHAD/lo=;
 b=NttDyRTdSLSxCVN+FKfHrBLJ8m0XNqOw2Ui98u2zYyQYIzSO0fy0nOx7Ms4HfTkyhzC2Rj
 rvmIKE+RtZKBkp0upf4IIk52FJUdCNcacsS+KaiPhdGPrm9USWufSi01RL8WJMyuYzklTC
 8h700duCd6pCR8Zt8ihMJ7az8az0Pl8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-T_jtJyJ-OeW5kEDyZ3G-BQ-1; Fri, 05 Aug 2022 04:00:31 -0400
X-MC-Unique: T_jtJyJ-OeW5kEDyZ3G-BQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 p2-20020a05600c1d8200b003a3262d9c51so3845866wms.6
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 01:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=rVMkFpZolqYntAB16IACRwBZT+KaJRpzNatJXHAD/lo=;
 b=ny1YyAlPbGa+iNdwNbk49HR22+zrOb5FGdC9UiyOO7iEo5UsDo6lkXs89U6bD1TVBl
 IaozYGTYAsrpAmfrd1cF1v4OWBjxa4GrvO2A7BsTeUhTfEHFmst15q3maznPudq6ewP6
 A8iMeF0IbIF1B30LzuT6yLu1VUiImJfor9NTz48/gF0KdFL/iTQf9cPV06wIiKIAxTui
 1DUvTAfcbUoUzYxxOWrO4fri7sgCFtJDVTeX+LzwezjnzOc0zrOUWkA9poXaZIV01Dis
 0HPpBRo1Yj2WRbFk5JYpfo2Hqh5fXXzrtsQQvVuFsLbEpZ9WcfBdoX8YTFA834uRS5y2
 7aBA==
X-Gm-Message-State: ACgBeo1B4AsKA4x5F1H39KdENHV+jTvy745tIBA0/4osPMrXHNgqM5bZ
 D0hpGSslHAOubDVSLsknScFbm4f/hF6k5lG63HQvmeFTxpmNUaSB7ZfHWi/ADP+fSEbu2BJoQv8
 FMySuLHmNtbUkTH0=
X-Received: by 2002:a05:600c:3553:b0:3a3:2b65:299e with SMTP id
 i19-20020a05600c355300b003a32b65299emr8366650wmq.145.1659686430536; 
 Fri, 05 Aug 2022 01:00:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4m5xLKsg7OaDRB0eimz52Nz9VZOnXgJwzpVwMP118mmie66AZ/qSEv0eEk9aXCwhVudWWMhQ==
X-Received: by 2002:a05:600c:3553:b0:3a3:2b65:299e with SMTP id
 i19-20020a05600c355300b003a32b65299emr8366619wmq.145.1659686430117; 
 Fri, 05 Aug 2022 01:00:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a5d6205000000b0022059422255sm3109565wru.69.2022.08.05.01.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 01:00:29 -0700 (PDT)
Message-ID: <b6880163-d99d-b9ae-95f9-68a2c48a3fd9@redhat.com>
Date: Fri, 5 Aug 2022 10:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, Marc Zyngier <maz@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
 <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
 <9c8365c6-d27b-df76-371d-bd32ca2a26f7@redhat.com>
 <87tu6tbyk9.wl-maz@kernel.org>
 <0ed2ebc7-8d6e-7555-3af4-31eb071a584b@redhat.com>
 <bf8fd91c-2bac-35b4-1d17-78ba582760f0@redhat.com>
 <4c0e49f5-a7cc-9742-d473-e8453ab1c3e6@redhat.com>
 <2018984d-68d6-3a7e-7ee8-28cdbab8fe86@redhat.com>
 <ba3a6a41-cfce-081d-c0ec-da5128d10498@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ba3a6a41-cfce-081d-c0ec-da5128d10498@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gavin,

On 8/5/22 10:36, Gavin Shan wrote:
> Hi Eric,
>
> On 8/4/22 5:19 PM, Eric Auger wrote:
>> On 8/4/22 04:47, Gavin Shan wrote:
>>> On 8/3/22 10:52 PM, Eric Auger wrote:
>>>> On 8/3/22 15:02, Gavin Shan wrote:
>>>>> On 8/3/22 5:01 PM, Marc Zyngier wrote:
>>>>>> On Wed, 03 Aug 2022 04:01:04 +0100,
>>>>>> Gavin Shan <gshan@redhat.com> wrote:
>>>>>>> On 8/2/22 7:41 PM, Eric Auger wrote:
>>>>>>>> On 8/2/22 08:45, Gavin Shan wrote:
>>>>>>>>> There are 3 highmem IO regions as below. They can be disabled in
>>>>>>>>> two situations: (a) The specific region is disabled by user. (b)
>>>>>>>>> The specific region doesn't fit in the PA space. However, the
>>>>>>>>> base
>>>>>>>>> address and highest_gpa are still updated no matter if the region
>>>>>>>>> is enabled or disabled. It's incorrectly incurring waste in
>>>>>>>>> the PA
>>>>>>>>> space.
>>>>>>>> If I am not wrong highmem_redists and highmem_mmio are not user
>>>>>>>> selectable
>>>>>>>>
>>>>>>>> Only highmem ecam depends on machine type & ACPI setup. But I
>>>>>>>> would
>>>>>>>> say
>>>>>>>> that in server use case it is always set. So is that optimization
>>>>>>>> really
>>>>>>>> needed?
>>>>>>>
>>>>>>> There are two other cases you missed.
>>>>>>>
>>>>>>> - highmem_ecam is enabled after virt-2.12, meaning it stays
>>>>>>> disabled
>>>>>>>      before that.
>>>>>>
>>>>>> I don't get this. The current behaviour is to disable
>>>>>> highmem_ecam if
>>>>>> it doesn't fit in the PA space. I can't see anything that enables it
>>>>>> if it was disabled the first place.
>>>>>>
>>>>>
>>>>> There are several places or conditions where vms->highmem_ecam can be
>>>>> disabled:
>>>>>
>>>>> - virt_instance_init() where vms->highmem_ecam is inherited from
>>>>>     !vmc->no_highmem_ecam. The option is set to true after virt-2.12
>>>>>     in virt_machine_2_12_options().
>>>>>
>>>>> - machvirt_init() where vms->highmem_ecam can be disable if we have
>>>>>     32-bits vCPUs and failure on loading firmware.
>>>>>
>>>>> - Another place is where we're talking about. It's address assignment
>>>>>     to fit the PA space.
>>>>>
>>>>>>>
>>>>>>> - The high memory region can be disabled if user is asking large
>>>>>>>      (normal) memory space through 'maxmem=' option. When the
>>>>>>> requested
>>>>>>>      memory by 'maxmem=' is large enough, the high memory
>>>>>>> regions are
>>>>>>>      disabled. It means the normal memory has higher priority than
>>>>>>> those
>>>>>>>      high memory regions. This is the case I provided in (b) of the
>>>>>>>      commit log.
>>>>>>
>>>>>> Why is that a problem? It matches the expected behaviour, as the
>>>>>> highmem IO region is floating and is pushed up by the memory region.
>>>>>>
>>>>>
>>>>> Eric thought that VIRT_HIGH_GIC_REDIST2 and VIRT_HIGH_PCIE_MMIO
>>>>> regions
>>>>> aren't user selectable. I tended to explain why it's not true.
>>>>> 'maxmem='
>>>>> can affect the outcome. When 'maxmem=' value is big enough, there
>>>>> will be
>>>>> no free area in the PA space to hold those two regions.
>>>>>
>>>>>>>
>>>>>>> In the commit log, I was supposed to say something like below for
>>>>>>> (a):
>>>>>>>
>>>>>>> - The specific high memory region can be disabled through changing
>>>>>>>      the code by user or developer. For example,
>>>>>>> 'vms->highmem_mmio'
>>>>>>>      is changed from true to false in virt_instance_init().
>>>>>>
>>>>>> Huh. By this principle, the user can change anything. Why is it
>>>>>> important?
>>>>>>
>>>>>
>>>>> Still like above. I was explaining the possible cases where those
>>>>> 3 switches can be turned on/off by users or developers. Our code
>>>>> needs to be consistent and comprehensive.
>>>>>
>>>>>     vms->highmem_redists
>>>>>     vms->highmem_ecam
>>>>>     vms->mmio
>>>>>
>>>>>>>
>>>>>>>>>
>>>>>>>>> Improve address assignment for highmem IO regions to avoid the
>>>>>>>>> waste
>>>>>>>>> in the PA space by putting the logic into virt_memmap_fits().
>>>>>>
>>>>>> I guess that this is what I understand the least. What do you
>>>>>> mean by
>>>>>> "wasted PA space"? Either the regions fit in the PA space, and
>>>>>> computing their addresses in relevant, or they fall outside of it
>>>>>> and
>>>>>> what we stick in memap[index].base is completely irrelevant.
>>>>>>
>>>>>
>>>>> It's possible that we run into the following combination. we should
>>>>> have enough PA space to enable VIRT_HIGH_PCIE_MMIO region. However,
>>>>> the region is disabled in the original implementation because
>>>>> VIRT_HIGH_{GIC_REDIST2, PCIE_ECAM} regions consumed 1GB, which is
>>>>> unecessary and waste in the PA space.
>>>> each region's base is aligned on its size.
>>>
>>> Yes.
>>>
>>>>>
>>>>>       static MemMapEntry extended_memmap[] = {
>>>>>           [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
>>>>>           [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
>>>>>           [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
>>>> so anyway MMIO is at least at 512GB. Having a 1TB IPA space does not
>>>> imply any amount of RAM. This depends on the address space.
>>>> I    };
>>>
>>> Yes. Prior to the start of system memory, there is 1GB used by
>>> various regions either.
>> yes
>>>
>>>>>
>>>>>       IPA_LIMIT           = (1UL << 40)
>>>>>       '-maxmem'           = 511GB              /* Memory starts from
>>>>> 1GB */
>>>>>       '-slots'            = 0
>>>>>       vms->highmem_rdist2 = false
>>>> How can this happen? the only reason for highmem_redists to be
>>>> reset is
>>>> if it does not fit into map_ipa. So if mmio fits, highmem_redists does
>>>> too. What do I miss?
>>>
>>> The example is having "vms->highmem_rdist2 = flase" BEFORE the address
>>> assignment, it's possible that developer changes the code to disable
>>> it intentionally. The point is the original implementation isn't
>>> comprehensive
>>> because it has the wrong assumption that vms->highmem_{rdist2, ecam,
>>> mmio} all
>>> true before the address assignment. With the wrong assumption, the
>>> base address
>>> is always increased, even the previous region is disabled, during the
>>> address assignment in virt_set_memmap().
>> Yes we currently always provision space for those functionalities,
>> independently on whether they are used. But that's true for many other
>> regions in the address map (although smaller) ;-)
>
> Yep :)
>
>>>
>>>
>>>>>       vms->highmem_ecam   = false
>>>>       vms->highmem_mmio   = true
>>>> I am still skeptic about the relevance of such optim. Isn't it
>>>> sensible
>>>> to expect the host to support large IPA if you want to use such amount
>>>> of memory.
>>>> I think we should rather better document the memory map from a user
>>>> point of view.
>>>> Besides if you change the memory map, you need to introduce yet
>>>> another
>>>> option to avoid breaking migration, no?
>>>>
>>>
>>> These 3 high memory regions consumes 513GB with alignment considered
>>> when
>>> all of them are enabled. The point is those 3 high memory regions, or
>>> part
>>> of them can be squeezed or smashed to accommodate '-maxmem' by
>>> design. I
>>> think there are two options I can think of. I personally prefer to keep
>>> the capability. With this, users gain broader range for their
>>> '-maxmem'.
>>> Please let me know your preference.
>>>
>>> - Revert the capability of squeezing or smashing those high memory
>>> regions
>>>    to accommodate '-maxmem'. It means vms->high_{redist2, ecam, mmio}
>>> can't
>>>    be disable on conflicts to the PA space.
>>>
>>> - Keep the capability, with this optimization applied to make the
>>> implementation
>>>    comprehensive.
>>>
>>> I think it's worthy to add something about this limitation in
>>> doc/system/arm/virt.rst.
>> indeed that's worth in any case.
>>>
>>> I don't think I need introduce another option to avoid migration
>>> breakage.
>>> Could you explain why I need the extra option?
>> I think you do. Before and after this patch the QEMU memory regions
>> associated to those devices won't be a the same location in the memory
>> so if you migrate from an old version to a newer one, the guest won't be
>> able to access them
>>
>> OK I have given my own opinion about those potential changes. Let's wait
>> for others' ;-)
>>
>
> Thank you for your comments. Yeah, I would hold to post v2 to collect
> more comments :)
>
> I'm still don't understand how it's affecting migration. If I understand
> correct, the changed address based doesn't affect migration, as explained
> like below. It took me while to looking the source code to figure out
> how VIRT_HIGH_{GIC_REDIST2, PCIE_ECAM} is linked to GIC and PCIe host and
> migration.
>
> For VIRTH_HIGH_GIC_REDIST2 region, it's used by TYPE_ARM_GICV3 or
> TYPE_KVM_ARM_GICV3.
> TYPE_KVM_ARM_GICV3. For both cases, we do NOT migrate the region
> directly. Instead,
> the registers are saved to GICv3CPUState. GICv3CPUState is migrate and
> the registers
> are restored from the instance.
>
> For VIRT_HIGH_PCIE_ECAM, the registers are saved to PCIDevice::config.
> The
> buffer is migrated and PCI's config space is restored from it. In
> hw/net/e1000e.c,
> e1000e_vmstate has something like below embedded:
>
>     VMSTATE_PCI_DEVICE(parent_obj, E1000EState),

Actually I was more thinking about PCI MMIO region. Effectively for
regions that are saved/restored from regs it sounds OK (RDIST).
For ECAM I do not know how migration is handled but better to double
check with PCI/migration experts.

Thanks

Eric
>
> ---
>
> I also did one experiment by having different address bases on the
> source and
> destination. Migration succeeds.
>
> address regions from source
> ---------------------------
> virt_memmap_fits: HIGH_GIC_REDIST2: [0000004000000000  0000000004000000]
> virt_memmap_fits: HIGH_GIC_ECAM:    [0000004010000000  0000000010000000]
> virt_memmap_fits: HIGH_GIC_MMIO:    [0000008000000000  0000008000000000]
>
> address regions from destination
> --------------------------------
> virt_memmap_fits: HIGH_GIC_REDIST2: [0000004040000000  0000000004000000]
> virt_memmap_fits: HIGH_GIC_ECAM:    [0000004050000000  0000000010000000]
> virt_memmap_fits: HIGH_GIC_MMIO:    [0000008000000000  0000008000000000]
>
>
>>>
>>>>>
>>>>>>>>>
>>>>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>>>>> ---
>>>>>>>>>      hw/arm/virt.c | 54
>>>>>>>>> +++++++++++++++++++++++++++++----------------------
>>>>>>>>>      1 file changed, 31 insertions(+), 23 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>>>>> index 9633f822f3..bc0cd218f9 100644
>>>>>>>>> --- a/hw/arm/virt.c
>>>>>>>>> +++ b/hw/arm/virt.c
>>>>>>>>> @@ -1688,6 +1688,34 @@ static uint64_t
>>>>>>>>> virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>>>>>>>>          return arm_cpu_mp_affinity(idx, clustersz);
>>>>>>>>>      }
>>>>>>>>>      +static void virt_memmap_fits(VirtMachineState *vms, int
>>>>>>>>> index,
>>>>>>>>> +                             bool *enabled, hwaddr *base, int
>>>>>>>>> pa_bits)
>>>>>>>>> +{
>>>>>>>>> +    hwaddr size = extended_memmap[index].size;
>>>>>>>>> +
>>>>>>>>> +    /* The region will be disabled if its size isn't given */
>>>>>>>>> +    if (!*enabled || !size) {
>>>>>>>> In which case do you have !size?
>>>>>>>
>>>>>>> Yeah, we don't have !size and the condition should be removed.
>>>>>>>
>>>>>>>>> +        *enabled = false;
>>>>>>>>> +        vms->memmap[index].base = 0;
>>>>>>>>> +        vms->memmap[index].size = 0;
>>>>>>>> It looks dangerous to me to reset the region's base and size like
>>>>>>>> that.
>>>>>>>> for instance fdt_add_gic_node() will add dummy data in the dt.
>>>>>>>
>>>>>>> I would guess you missed that the high memory regions won't be
>>>>>>> exported
>>>>>>> through device-tree if they have been disabled. We have a check
>>>>>>> there,
>>>>>>> which is "if (nb_redist_regions == 1)"
>>>>>>>
>>>>>>>>> +        return;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    /*
>>>>>>>>> +     * Check if the memory region fits in the PA space. The
>>>>>>>>> memory map
>>>>>>>>> +     * and highest_gpa are updated if it fits. Otherwise, it's
>>>>>>>>> disabled.
>>>>>>>>> +     */
>>>>>>>>> +    *enabled = (ROUND_UP(*base, size) + size <=
>>>>>>>>> BIT_ULL(pa_bits));
>>>>>>>> using a 'fits' local variable would make the code more obvious I
>>>>>>>> think
>>>>>>>
>>>>>>> Lets confirm if you're suggesting something like below?
>>>>>>>
>>>>>>>            bool fits;
>>>>>>>
>>>>>>>            fits = (ROUND_UP(*base, size) + size <=
>>>>>>> BIT_ULL(pa_bits));
>>>>>>>
>>>>>>>            if (fits) {
>>>>>>>               /* update *base, memory mapping, highest_gpa */
>>>>>>>            } else {
>>>>>>>               *enabled = false;
>>>>>>>            }
>>>>>>>
>>>>>>> I guess we can simply do
>>>>>>>
>>>>>>>            if (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits)) {
>>>>>>>               /* update *base, memory mapping, highest_gpa */
>>>>>>>            } else {
>>>>>>>               *enabled = false;
>>>>>>>            }
>>>>>>>
>>>>>>> Please let me know which one looks best to you.
>>>>>>
>>>>>> Why should the 'enabled' flag be updated by this function,
>>>>>> instead of
>>>>>> returning the value and keeping it as an assignment in the caller
>>>>>> function? It is purely stylistic though.
>>>>>>
>>>>>
>>>>> The idea to put the logic, address assignment for those 3 high memory
>>>>> regions or updating the flags (vms->high_redist2/ecam/mmio), to the
>>>>> newly introduced function, to make virt_set_memmap() a bit
>>>>> simplified.
>>>>> Eric tends to agree the changes with minor adjustments. So I'm going
>>>>> to keep it as of being, which doesn't mean the stylistic thought is
>>>>> a bad one :)
>>>>>
>>>>> Lastly, I need to rewrite the comit log completely because it seems
>>>>> causing confusions to Eric and you.
>>>>>
>>>
>
> Thanks,
> Gavin
>


