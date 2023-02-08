Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CAB68E8BA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 08:11:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPead-0004Qi-N3; Wed, 08 Feb 2023 02:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPeab-0004QB-5g
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:09:57 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPeaY-0002rC-Vw
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:09:56 -0500
Received: by mail-wm1-x329.google.com with SMTP id z13so5164851wmp.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 23:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gg+auhqgAMv70fUhrtnXtTJv4YtDRXtXA6xhvOT20XA=;
 b=NlnJmxPRq0ksC6/u59o91rgROhe3WjeCz4HyMLYfgkfG0bDWgiGiQcCvdnibCxkbBv
 E62ZCt2PMQAM4eWhHtOPeGfmUS5tB1qvQKPFLROkMvGQ/Ou7sHagSIYrgxzY6HVALNXm
 iRE3L8SW8gOaW34UMXSLTThOPcGOWiIRa76wAV7IZDAQ53wMLtRouJxjop1bSIfbP6iD
 7UEVxE+DhQ8bJQl4hW8tb6/fiHocWYA2AQN/kNDKRObLWtxZFJR/HlkoHGWcMmzOLkaq
 sZh4As4BZNWlgUT/8lpE+e5su7o55VQS+cev9ROcj4MG1KV3yVAwuUguEj7ML22u9d+r
 u3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gg+auhqgAMv70fUhrtnXtTJv4YtDRXtXA6xhvOT20XA=;
 b=M98oW8EvKJRgUxPVD5Gk7VITUWwmwz+Qqs29fTNSCAZm5WMCsC6UCvRe6PDioq97Sk
 Ifaj1HmObsw5bzyvgqmsLkGwT2vtaSugTaXrojSCGDqPQvZ7Cu35K/5hbwfjJfDpcxj1
 0oFfwzS8QqUzHzUMMP/bhltxJhInJjfpi+LEndI6oi41pw2MIfNWXtCudLPhyGUK+Bsk
 JnU8Is0UKr2+zO2q3M2FDoHdc/zwh3Pg7AQu50ZXG1ZJbNaws9EKTYkzGVGnjhvn1zzd
 RTYveh3NghU+wPjsX60sqR39dVgqreDrRbee5Qcvh3jYKaxel92u6jZvsY8cQAXqQ/2g
 jA4w==
X-Gm-Message-State: AO0yUKW2Rij8oEqGjgSNwDGLY07CX3O/MnhoVeopn9F/FzFJkMs68WqS
 /tWrbRvIRTQ7CLxNd3k4KdFLaw==
X-Google-Smtp-Source: AK7set9HuJYzlHy4imO3J9sAV8IK885TEJowquQCS0XqLKsHgqI0oaH84kedoFP3ChQbzXUG5pDf0g==
X-Received: by 2002:a05:600c:1f14:b0:3df:e659:f9d9 with SMTP id
 bd20-20020a05600c1f1400b003dfe659f9d9mr5566689wmb.34.1675840193243; 
 Tue, 07 Feb 2023 23:09:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o41-20020a05600c512900b003dc4aae4739sm1034148wms.27.2023.02.07.23.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 23:09:51 -0800 (PST)
Message-ID: <cdf3bffb-f743-a5ed-b864-5d20b8d2595a@linaro.org>
Date: Wed, 8 Feb 2023 08:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/10] hw/ide/piix: Require an ISABus only for
 user-created instances
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-8-shentey@gmail.com>
 <fb287888-c88c-60b1-20a4-1e50ddbf1daf@ilande.co.uk>
 <alpine.LMD.2.03.2302052308460.32269@eik.bme.hu>
 <935ae2a8-4327-53c6-1649-36698a00901d@ilande.co.uk>
 <00D45BF9-CA37-42FF-BDE1-F742B04F60F4@gmail.com>
 <b38987d5-5530-ecd9-2fd2-3a57e1a611dd@ilande.co.uk>
 <69A70C66-E623-437A-964F-795C464B5B10@gmail.com>
 <d16f3f47-7bfa-b691-4534-fedc789b8f1b@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d16f3f47-7bfa-b691-4534-fedc789b8f1b@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/2/23 01:43, BALATON Zoltan wrote:
> On Wed, 8 Feb 2023, Bernhard Beschow wrote:
>> Am 7. Februar 2023 20:52:02 UTC schrieb Mark Cave-Ayland 
>> <mark.cave-ayland@ilande.co.uk>:
>>> On 06/02/2023 23:40, Bernhard Beschow wrote:
>>>> Am 5. Februar 2023 22:32:03 UTC schrieb Mark Cave-Ayland 
>>>> <mark.cave-ayland@ilande.co.uk>:
>>>>> On 05/02/2023 22:21, BALATON Zoltan wrote:
>>>>>> On Sun, 5 Feb 2023, Mark Cave-Ayland wrote:
>>>>>>> On 26/01/2023 21:17, Bernhard Beschow wrote:
>>>>>>>> Internal instances now defer interrupt wiring to the caller which
>>>>>>>> decouples them from the ISABus. User-created devices still fish 
>>>>>>>> out the
>>>>>>>> ISABus from the QOM tree and the interrupt wiring remains in 
>>>>>>>> PIIX IDE.
>>>>>>>> The latter mechanism is considered a workaround and intended to be
>>>>>>>> removed once a deprecation period for user-created PIIX IDE 
>>>>>>>> devices is
>>>>>>>> over.
>>>>>>>>
>>>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>>>>> ---
>>>>>>>>    include/hw/ide/pci.h |  1 +
>>>>>>>>    hw/ide/piix.c        | 64 
>>>>>>>> ++++++++++++++++++++++++++++++++++----------
>>>>>>>>    hw/isa/piix.c        |  5 ++++
>>>>>>>>    3 files changed, 56 insertions(+), 14 deletions(-)


>>>>>>>>    diff --git a/hw/isa/piix.c b/hw/isa/piix.c
>>>>>>>> index 54a1246a9d..f9974c2a77 100644
>>>>>>>> --- a/hw/isa/piix.c
>>>>>>>> +++ b/hw/isa/piix.c
>>>>>>>> @@ -345,9 +345,14 @@ static void pci_piix_realize(PCIDevice 
>>>>>>>> *dev, const char *uhci_type,
>>>>>>>>          /* IDE */
>>>>>>>>        qdev_prop_set_int32(DEVICE(&d->ide), "addr", dev->devfn + 
>>>>>>>> 1);
>>>>>>>> +    qdev_prop_set_bit(DEVICE(&d->ide), "user-created", false);
>>>>>>>>        if (!qdev_realize(DEVICE(&d->ide), BUS(pci_bus), errp)) {
>>>>>>>>            return;
>>>>>>>>        }
>>>>>>>> +    qdev_connect_gpio_out(DEVICE(&d->ide), 0,
>>>>>>>> +                          qdev_get_gpio_in(DEVICE(&d->pic), 14));
>>>>>>>> +    qdev_connect_gpio_out(DEVICE(&d->ide), 1,
>>>>>>>> +                          qdev_get_gpio_in(DEVICE(&d->pic), 15));
>>>>>>>>          /* USB */
>>>>>>>>        if (d->has_usb) {
>>>>>>>
>>>>>>> I haven't checked the datasheet, but I suspect this will be 
>>>>>>> similar to the cmd646/via PCI-IDE interfaces in that there will 
>>>>>>> be a PCI configuration register that will switch between ISA 
>>>>>>> compatibility mode (and ISA irqs) and PCI mode (with PCI IRQs). 
>>>>>>> So it would be the device configuration that would specify PCI or 
>>>>>>> ISA mode, rather than the presence of an ISABus.
>>>>>>
>>>>>> I forgot about this topic already and haven't follwed this series 
>>>>>> either so what I say may not fully make sense but I think CMD646 
>>>>>> and via-ide are different. CMD646 is a PCI device and should use 
>>>>>> PCI interrupts while via-ide is part of a southbridge/superio 
>>>>>> complex and connected to the ISA PICs within that southbride, so I 
>>>>>> think via-ide always uses ISA IRQs and the ISA btidge within the 
>>>>>> same chip may convert that to PCI IRQs or not (that part is where 
>>>>>> I'm lost also because we may not actually model it that way). 
>>>>>> After a long debate we managed to find a solution back then that 
>>>>>> works for every guest we use it for now so I think we don't want 
>>>>>> to touch it now until some real need arises. It does not worth the 
>>>>>> trouble and added complexity to model something that is not used 
>>>>>> just for the sake of correctness. By the time we find a use for 
>>>>>> that, the ISA emulation may evolve so it's easier to implement the 
>>>>>> missing switching between isa and native mode or we may want to do 
>>>>>> it differently
>   (such as we do things differently now compared to what we did years 
> ago). So I think it does not worth keeping the ISA model from being 
> simplified for some theoretical uses in the future which we may not 
> actually do any time soon.

Indeed we don't want (and have the time) to model features we don't need
or will never use. However taking the time to correctly understand these
devices help us to correctly model them. In particular when design flaws
have been identified in some models.

> But I don't want to get into this again so 
> just shared my thoughts and feel free to ignore it. I don't care where 
> these patches go as long as the VIA model keeps working for me.

We certainly want to keep what we currently have working :)

>>>>> I have a vague memory that ISA compatibility mode was part of the 
>>>>> original PCI-BMDMA specification, but it has been a while since I 
>>>>> last looked.
>>>>>
>>>>> Bernhard, is there any mention of this in the PIIX datasheet(s)? 
>>>>> For reference the cmd646 datasheet specifies that ISA mode or PCI 
>>>>> mode is determined by register PROG_IF (0x9) in PCI configuration 
>>>>> space.
>>>>
>>>> I've found the following:
>>>>
>>>>    "Only PCI masters have access to the IDE port. ISA Bus masters 
>>>> cannot access the IDE I/O port addresses. Memory targeted by the IDE 
>>>> interface acting as a PCI Bus master on behalf of IDE DMA slaves 
>>>> must reside on PCI, usually main memory implemented by the 
>>>> host-to-PCI bridge."
>>>>
>>>> And:
>>>>
>>>>    "PIIX4 can act as a PCI Bus master on behalf of an IDE slave 
>>>> device."
>>>>
>>>> Does this perhaps mean that piix-ide does indeed have no ISA bus?
>>>
>>> I'd be amazed if that were the case: certainly when the first 
>>> motherboards came out with PCI and ISA slots, I'd expect the IDE 
>>> legacy mode to be enabled by default since BIOSes and OSs such as DOS 
>>> wouldn't have been PCI aware and would access the ISA ioports 
>>> directly. From memory the OF PCI specification has mention of 
>>> workarounds such as mapping the old VGA memory to PCI MMIO space for 
>>> compatibility reasons, so I'd be surprised if there wasn't something 
>>> similar for IDE.
>>>
>>> The wording above is a bit ambiguous because I can see the above 
>>> statements would be true if the PCI-IDE device were already switched 
>>> to PCI mode, and what we're looking for is whether a switch between 
>>> the two is supported or possible.
>>
>> PIIX4's description of PROG_IF (0x9):
>>  "Programming Interface (PI). 80h=Capable of IDE bus master operation."
>>
>> VT82C686B in comparison:
>>  7 Master IDE Capability...........fixed at 1 (Supported)
>>  3 Programmable Indicator - Secondary......fixed at 1 Supports both modes
>>  1 Programmable Indicator - Primary..........fixed at 1 Supports both 
>> modes
>>
>> So VT82C686B can switch modes while PIIX can't. Right?
> 
> Unless there's some other bit somewhere... These all-in-one chips can be 
> confusing.
> 
>> Furthermore, from the PIIX4 documentation of bit 2 of the bus master 
>> status register BMISX (IO):
>>
>>  "IDE Interrupt Status (IDEINTS)—R/WC. This bit, when set to a 1, 
>> indicates when an IDE device has asserted its interrupt line. When bit 
>> 2=1, all read data from the IDE device has been transferred to main 
>> memory and all write data has been transferred to the IDE device. 
>> Software sets this bit to a 0 by writing a 1 to it. IRQ14 is used for 
>> the primary channel and IRQ15 is used for the secondary channel. Note 
>> that, if the interrupt status bit is set to a 0 by writing a 1 to this 
>> bit while the interrupt line is still at the active level, this bit 
>> remains 0 until another assertion edge is detected on the interrupt 
>> line."
>>
>> So the legacy ISA IRQs seem to be used always.
>>
>> The VIA documentation offers a control register where "native" or 
>> "legacy" mode interrupt routing can be selected. I haven't found a 
>> similar register for PIIX4.
> 
> While from the docs it looks like that we have found before that on some 
> machines this does not work and even after writing some value the 
> control reg irqs remain set to legacy and software expects that. This is 
> the case on pegasos2 where the firmware does write the reg but then OSes 
> still use IRQ 14/15 for ide. Not sure about the fuloong2e but I think 
> different Linux kernels did different things on that machine. We have 
> spent a lot of time with this back then and I think found that just 
> strapping the IRQ to legacy and setting the regs on reset as we set now 
> works for all guests we tried so I'd be wary to touch this again. Out 
> cuttent model may be incomplete only modeling one mode of the chip but 
> this mode is what's used so I don't think it's worth trying to umplement 
> an unused state that will be reset by the firmware anyway so nothing 
> will use that.
> 
> (We're spamming a lot of people with this, maybe you could prune the cc 
> if this is not any more relevant to the original patch.)

Don't worry too much about that, it is easier to filter out message than
figuring you are interested and try to filter in everything. Better safe
than sorry!

>> So it seems to me that PIIX can't switch modes...
>>
>>>
>>> The cmd646 datasheet section 1.4 has a fleeting mention of a document 
>>> called "PCI IDE Controller Specification Revision 1.0" which if you 
>>> can find it, may provide more information as to whether this ability 
>>> is specific to the cmd646 or whether it is also relevant to generic 
>>> PCI-IDE controllers such as the PIIX series too.
>>
>> I used VT82C686B above instead of cmd646 if that's okay. I'd need to 
>> read the IDE controller specification still. But perhaps we're already 
>> wiser?
>>
>> Best regards,
>> Bernhard
>>
>>>
>>>
>>> ATB,
>>>
>>> Mark.
>>
>>


