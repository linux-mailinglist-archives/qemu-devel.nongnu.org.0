Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF76F5F73
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 21:54:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puIXJ-0003VU-ON; Wed, 03 May 2023 15:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puIXC-0003Ub-3X; Wed, 03 May 2023 15:53:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puIXA-0006z1-9h; Wed, 03 May 2023 15:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zxtJ1l0C2cmJjBoRVFBBrjspDyzjkFKX79sTeruLDbI=; b=BCDZHkUQ8dVwwSPfWCLvcqOQwV
 BjC0bjvj6waEAluN2b+Wnf18PUYTSsU7Rfh4/GdoaSF/+h3XX72LT0CoPqm0ugPnJCR4S4CQkwpgR
 FYYd6XcbW7+Vy0Qrojn8gqodZ/oXq4HOHB/GYR+kdVVOp2Yy3I1JbUL5XUqHM15J4q/cYJqhkwbXw
 Z1V1OjI3+fiqt70D8iV/L+CKeizlJVDi4RYzyNl9bCq8Y3oMbBAN+thwbulKuDgR3q2yJHbOKE4vh
 lQm6XT+ed13LM/G4oO/KbqdFN9G7MO9cJh7/91BgEsb7RFKCvO0qem0Ofkf63bqkkZ3gk1ufzmpcT
 7FLiSEF8pK3A63JVYj+tXIs30FRdx3WWt2CICqk4O4gcJ2nF4/qFQ7XXjob479d0YrdcL82V7QXOa
 gDWtMa7WeD0J25YkMSKBG2UJzyyBu5cg7MPqviOz/RanIrgzY8UtdL7E2wHyJ5D9K1fFbvLcFPOsB
 CK1kdAeQilEGr4YUOZBertY2zEWtIefukFItv9c2T4sn2cVkfny25ijHREIRw/gm9aj+d+1FJ2eKK
 cNYg7+ItUGlRcO8WYy2XRSl74dgiyfMaAn4Bo1rb+/eAOi6mU0pv4/71uQRX78j+UciobCk9gYOYE
 3ZYRyuvTrL1df6pvXxYlGT6gYAWz6uFWTzuHCIT/M=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puIW0-0003hi-4A; Wed, 03 May 2023 20:51:56 +0100
Message-ID: <3d9a88eb-e9f3-4335-2a00-34d249c17289@ilande.co.uk>
Date: Wed, 3 May 2023 20:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-11-shentey@gmail.com>
 <4ed18370-3a92-3ae5-912f-1f6dafab37d1@ilande.co.uk>
 <612DFA62-40DC-44D3-88A9-797FB4EC1F48@gmail.com>
 <CD1A2767-74AD-4285-ADF8-1757B8DD7953@gmail.com>
 <698457dc-ca0a-956d-f20d-c3b353fbf0c3@ilande.co.uk>
 <6D292D6F-D82B-4425-8A03-7A51AA7791B0@gmail.com>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <6D292D6F-D82B-4425-8A03-7A51AA7791B0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 10/13] hw/ide/piix: Reuse PCIIDEState::{cmd,data}_ops
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/04/2023 19:15, Bernhard Beschow wrote:

> Am 27. April 2023 10:52:17 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>> On 26/04/2023 21:14, Bernhard Beschow wrote:
>>
>>> Am 26. April 2023 18:18:35 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>>>
>>>>
>>>> Am 26. April 2023 11:37:48 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>>>>> On 22/04/2023 16:07, Bernhard Beschow wrote:
>>>>>
>>>>>> Now that PCIIDEState::{cmd,data}_ops are initialized in the base class
>>>>>> constructor there is an opportunity for PIIX to reuse these attributes. This
>>>>>> resolves usage of ide_init_ioport() which would fall back internally to using
>>>>>> the isabus global due to NULL being passed as ISADevice by PIIX.
>>>>>>
>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>>> ---
>>>>>>     hw/ide/piix.c | 30 +++++++++++++-----------------
>>>>>>     1 file changed, 13 insertions(+), 17 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>>>>>> index a3a15dc7db..406a67fa0f 100644
>>>>>> --- a/hw/ide/piix.c
>>>>>> +++ b/hw/ide/piix.c
>>>>>> @@ -104,34 +104,32 @@ static void piix_ide_reset(DeviceState *dev)
>>>>>>         pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>>>>>>     }
>>>>>>     -static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa_bus,
>>>>>> -                              Error **errp)
>>>>>> +static void pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa_bus)
>>>>>>     {
>>>>>>         static const struct {
>>>>>>             int iobase;
>>>>>>             int iobase2;
>>>>>>             int isairq;
>>>>>>         } port_info[] = {
>>>>>> -        {0x1f0, 0x3f6, 14},
>>>>>> -        {0x170, 0x376, 15},
>>>>>> +        {0x1f0, 0x3f4, 14},
>>>>>> +        {0x170, 0x374, 15},
>>>>>>         };
>>>>>> -    int ret;
>>>>>> +    MemoryRegion *address_space_io = pci_address_space_io(PCI_DEVICE(d));
>>>>>>           ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>>>>>> -    ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
>>>>>> -                          port_info[i].iobase2);
>>>>>> -    if (ret) {
>>>>>> -        error_setg_errno(errp, -ret, "Failed to realize %s port %u",
>>>>>> -                         object_get_typename(OBJECT(d)), i);
>>>>>> -        return false;
>>>>>> -    }
>>>>>> +    memory_region_add_subregion(address_space_io, port_info[i].iobase,
>>>>>> +                                &d->data_ops[i]);
>>>>>> +    /*
>>>>>> +     * PIIX forwards the last byte of cmd_ops to ISA. Model this using a low
>>>>>> +     * prio so competing memory regions take precedence.
>>>>>> +     */
>>>>>> +    memory_region_add_subregion_overlap(address_space_io, port_info[i].iobase2,
>>>>>> +                                        &d->cmd_ops[i], -1);
>>>>>
>>>>> Interesting. Is this behaviour documented somewhere and/or used in one of your test images at all? If I'd have seen this myself, I probably thought that the addresses were a typo...
>>>>
>>>> I first  stumbled upon this and wondered why this code was working with VIA_IDE (through my pc-via branch). Then I found the correct offsets there which are confirmed in the piix datasheet, e.g.: "Secondary Control Block Offset: 0374h"
>>>
>>> In case you were wondering about the forwarding of the last byte the datasheet says: "Accesses to byte 3 of the Control Block are forwarded to ISA where the floppy disk controller responds."
>>
>> Ahhh okay okay I see what's happening here: the PIIX IDE is assuming that the legacy ioport semantics are in operation here, which as you note above is where the FDC controller is also accessed via the above byte in the IDE control block. This is also why you need to change the address above from 0x3f6/0x376 to 0x3f4/0x374 when trying to use the MemoryRegions used for the PCI BARs since the PCI IDE controller specification requires a 4 byte allocation for the Control Block - see sections 2.0 and 2.2.
> 
> Yes, PIIX assuming that might be the case. Why does it contradict the PCI IDE specification? PIIX seems to apply the apprppriate "workarounds" here.

Can you explain a bit more about where you see the contradiction? At first glance it 
looks okay to me.

>> And that's fine, because the portio_lists used in ide_init_ioport() set up the legacy IDE ioports so that FDC accesses done in this way can succeed, and the PIIX IDE is hard-coded to legacy mode. So in fact PIIX IDE should keep using ide_init_ioport() rather than trying to re-use the BAR MemoryRegions so I think this patch should just be dropped.
> 
> I was hoping to keep that patch...

Perhaps a different way to think about it is that from QEMU's perspective a BAR is a 
MemoryRegion that can be dynamically assigned/updated and cannot overlap, whereas the 
portio_list implementation also handles unaligned accesses and overlapping sparse 
accesses. Since the latter is the exact case here with the IDE/FDC then it seems the 
existing portio_list solution already does the "right thing" instead of having to 
manually emulate the overlapping dispatch.


ATB,

Mark.


