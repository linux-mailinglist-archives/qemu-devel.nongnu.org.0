Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C4230F343
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 13:37:01 +0100 (CET)
Received: from localhost ([::1]:33408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7dsa-0006EJ-Bw
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 07:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l7drM-0005io-R3
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:35:44 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:40741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l7drK-0004Gs-ID
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:35:44 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D0A85C01B7;
 Thu,  4 Feb 2021 07:35:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 04 Feb 2021 07:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=l
 uxbUbNtvZfempCLO/nsYkm35CHRCQYT9jQspOUlBkQ=; b=M+afXbGy3baPO6n1W
 Rhc7VaKvT7fYJYN2EalcPcTO9BKLuRx67b89op26yWcHcvFiV50anSoJ4QGnR0bn
 LHEPXgUIHlpJzwQVHHjRgPgRg283ac03+ckBxIL/LELMEvaaMh9X3QiJ1AD/ex+3
 TkbdqdTmgECuv5KfpPGPYAEaApFsUhcFoMnW2EP1PkcPHD8zttsnOZLvGa0/Oizh
 XdHzVxx1VlZFZVYmJSG7lYbfov9fDlKRLM5GGgGBbgRT1YQkE2jK4A5RdLj3c3GH
 UM1D8TbNPdNQ3bknjZYM4ZOR4Abbxxlk9kNXfE3QcWY/aUqIdb9YSFomA7NbM65w
 dibTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=luxbUbNtvZfempCLO/nsYkm35CHRCQYT9jQspOUlB
 kQ=; b=j8GCHfJPxVLh9Iw8ZEuR0ka/Kza6fm1RHfCG5ewVAyCgBGN4+/c7IrhmM
 6ePnM2q91gFKQbQp34UNvJasZ30XsYNx08HSW/cg3PyWbjvVjA7rE+hgAUxNAfW7
 7GI42jHyxn3BC/gkQ+cuANxb3lm9t0k/BhPjjzlvt5Tg4mL16brafRWopHL5Qrj3
 xYZvlurV3FMHUyDGS5HOSSYDiNzrG2P9wT/K2Wu70Yj24dg0Ntjs+w07Y6xEFdPQ
 4l4XJKiz39t2QhQf+uP9xowdkDowKFPZbrtLMBOXiZvG/R4ALF0sTNfsh9ByK/oh
 XYX11oYa8ZElXaiYOH9HRaRXu5H2g==
X-ME-Sender: <xms:GuobYG0okNVcDjuXvKuvqe6HysSt8ST6Cy3ZMPjhFMNjSETIW32I2A>
 <xme:GuobYJFAJYUTT_9sAeiShBzl724hqxh97oYj_Rb-HerYHY2Zep5H3ySPJDqp8LiuA
 RO5bauigp6XTqVg9Zs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgeeggdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepfeefgfefvdegudejueekffelleeiteduhfeuhfejkedvffdugffh
 udfggeetgedtnecuffhomhgrihhnpegtohhntggvrhhnvggurdhpihhnghdpohiilhgrsg
 hsrdhorhhgnecukfhppedufeeirddujeehrddujeeirddukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfh
 hlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:GuobYO4b62PdlEZDhTOjarPuDvj3S-EphOvTfxJM4CMaokcgtySfZA>
 <xmx:GuobYH0kfi43x85WjfeMs0KR8Ms5y9ErN9c8a7ZasKVMuoCR9TxoYw>
 <xmx:GuobYJGb_WWXAof1rzgIKz91niHuRiSX2jI2DtJCy1ObaBFgb9buIA>
 <xmx:G-obYCP9ubD8t4SF7-QuKofoKagDoxhDv0bnS7vormn_-84TWJzKSQ>
Received: from [0.0.0.0] (unknown [136.175.176.187])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8BFA71080057;
 Thu,  4 Feb 2021 07:35:34 -0500 (EST)
Subject: Re: [PATCH v2 08/13] vt82c686: Move creation of ISA devices to the
 ISA bridge
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
 <f77d6471-d19d-a1c2-e447-18181d55ba86@amsat.org>
 <5c5ce8b9-f5c4-c58d-6f8a-76c47ad8db4d@eik.bme.hu>
 <2a45450d-8357-c03e-7e11-bd59bffa61ae@amsat.org>
 <1b55216e-4526-6f50-eac2-f91797a64e7@eik.bme.hu>
 <alpine.LMD.2.03.2102012101480.9444@eik.bme.hu>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <e78d15f1-13a6-d856-2801-f28b8077d97c@flygoat.com>
Date: Thu, 4 Feb 2021 20:35:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LMD.2.03.2102012101480.9444@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/2/2 上午4:04, BALATON Zoltan 写道:
> On Sun, 10 Jan 2021, BALATON Zoltan wrote:
>> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>>> +PCI experts
>>>
>>> On 1/10/21 1:43 AM, BALATON Zoltan wrote:
>>>> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>>>>> Hi Zoltan,
>>>>>
>>>>> On 1/9/21 9:16 PM, BALATON Zoltan wrote:
>>>>>> Currently the ISA devices that are part of the VIA south bridge,
>>>>>> superio chip are wired up by board code. Move creation of these ISA
>>>>>> devices to the VIA ISA bridge model so that board code does not need
>>>>>> to access ISA bus. This also allows vt82c686b-superio to be made
>>>>>> internal to vt82c686 which allows implementing its configuration via
>>>>>> registers in subseqent commits.
>>>>>
>>>>> Is this patch dependent of the VT82C686B_PM changes
>>>>> or can it be applied before them?
>>>>
>>>> I don't know but why would that be better? I thought it's clearer to
>>>> clean up pm related parts first before moving more stuff to this 
>>>> file so
>>>> that's why this patch comes after (and also because that's the order I
>>>> did it).
>>>
>>> Not any better, but easier for me to get your patches integrated,
>>> as I'm reviewing your patches slowly. Finding other reviewers
>>> would certainly help.
>>
>> No problem, I'll wait for your review. Merging parts of the series 
>> does not help much because the whole series is needed for vt8231 
>> which is prerequisite for pegasos2 so eventually all of these are 
>> needed so it does not matter if this one patch gets in earlier or later.
>>
>> Not sure who could help with review. Maybe Jiaxun or Huacai as this 
>> is used by fuloong2e so they might be interested and could have info 
>> on this chip. Most of these patches just cleaning up the vt82c686b 
>> and adding some missing features so these can be reused by the vt8231 
>> model in last 3 patches (which is very similar to 686b only some reg 
>> addresses and ids seem to be different for what we are concerned).
>
> Ping? There are still a few patches needing review:
>
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223512
>
> Jiaxun, Hiacai, or anybody else could you please help reviewing or 
> testing if this works with fuloong2e?

Tested the series against Fuloong2E PMON. Fuloong's kernel doesn't have 
much to do with
VIA ISA.

Which patch is pending for test or review?

Thanks.

- Jiaxun

>
> Thank you,
> BALATON Zoltan
>
>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>> ---
>>>>>>  hw/isa/vt82c686.c   | 20 ++++++++++++++++++++
>>>>>>  hw/mips/fuloong2e.c | 29 +++++------------------------
>>>>>>  2 files changed, 25 insertions(+), 24 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>>> index 58c0bba1d0..5df9be8ff4 100644
>>>>>> --- a/hw/isa/vt82c686.c
>>>>>> +++ b/hw/isa/vt82c686.c
>>>>>> @@ -16,6 +16,11 @@
>>>>>>  #include "hw/qdev-properties.h"
>>>>>>  #include "hw/isa/isa.h"
>>>>>>  #include "hw/isa/superio.h"
>>>>>> +#include "hw/intc/i8259.h"
>>>>>> +#include "hw/irq.h"
>>>>>> +#include "hw/dma/i8257.h"
>>>>>> +#include "hw/timer/i8254.h"
>>>>>> +#include "hw/rtc/mc146818rtc.h"
>>>>>>  #include "migration/vmstate.h"
>>>>>>  #include "hw/isa/apm.h"
>>>>>>  #include "hw/acpi/acpi.h"
>>>>>> @@ -307,9 +312,16 @@ OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState,
>>>>>> VT82C686B_ISA)
>>>>>>
>>>>>>  struct VT82C686BISAState {
>>>>>>      PCIDevice dev;
>>>>>> +    qemu_irq cpu_intr;
>>>>>>      SuperIOConfig superio_cfg;
>>>>>>  };
>>>>>>
>>>>>> +static void via_isa_request_i8259_irq(void *opaque, int irq, int 
>>>>>> level)
>>>>>> +{
>>>>>> +    VT82C686BISAState *s = opaque;
>>>>>> +    qemu_set_irq(s->cpu_intr, level);
>>>>>> +}
>>>>>> +
>>>>>>  static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
>>>>>>                                     uint32_t val, int len)
>>>>>>  {
>>>>>> @@ -365,10 +377,18 @@ static void vt82c686b_realize(PCIDevice *d,
>>>>>> Error **errp)
>>>>>>      VT82C686BISAState *s = VT82C686B_ISA(d);
>>>>>>      DeviceState *dev = DEVICE(d);
>>>>>>      ISABus *isa_bus;
>>>>>> +    qemu_irq *isa_irq;
>>>>>>      int i;
>>>>>>
>>>>>> +    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>>>>>
>>>>> Why not use the SysBus API?
>>>>
>>>> How? This is a PCIDevice not a SysBusDevice.
>>>
>>> Indeed :)
>>>
>>>>>> +    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>>>>>>      isa_bus = isa_bus_new(dev, get_system_memory(),
>>>>>> pci_address_space_io(d),
>>>>>>                            &error_fatal);
>>>>>
>>>>> Isn't it get_system_memory() -> pci_address_space(d)?
>>>>
>>>> I don't really know. Most other places that create an isa bus seem to
>>>> also use get_system_memory(), only piix4 uses 
>>>> pci_address_space(dev) so
>>>> I thought if those others are OK this should be too.
>>>
>>> I'm not a PCI expert but my understanding is PCI device functions are
>>> restricted to the PCI bus address space. The host bridge may map this
>>> space within the host.
>>>
>>> QEMU might be using get_system_memory() because for some host bridge
>>> the mapping is not implemented so it was easier this way?
>>
>> Maybe, also one less indirection which if not really needed is a good 
>> thing for performance so unless it's found to be needed to use 
>> another address space here I'm happy with this as it matches what 
>> other similar devices do and it seems to work. Maybe a separate 
>> address space is only really needed if we have an iommu?
>>
>> Regards,
>> BALATON Zoltan


