Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13E6A7961
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 03:15:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXYSe-0006DF-5V; Wed, 01 Mar 2023 21:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXYSb-0006Cw-W4; Wed, 01 Mar 2023 21:14:22 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXYSZ-0005aG-QW; Wed, 01 Mar 2023 21:14:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BA01B746335;
 Thu,  2 Mar 2023 03:14:13 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7A25B746324; Thu,  2 Mar 2023 03:14:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 78D6F7462DB;
 Thu,  2 Mar 2023 03:14:13 +0100 (CET)
Date: Thu, 2 Mar 2023 03:14:13 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <ae970003-6bcf-1e6b-77b0-4c1080d33161@ilande.co.uk>
Message-ID: <d3f3360e-9edc-9ee3-1524-d465d51e1d8e@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
 <F86A8AF3-8D69-497A-ADD1-688D2B4FED03@gmail.com>
 <04111f8e-e24d-2a61-d359-f20f8cd4634e@eik.bme.hu>
 <877517F9-2205-413F-A408-72D36B5142EB@gmail.com>
 <bc066c26-e801-12a0-624e-16ce9c21e00c@eik.bme.hu>
 <7368aeee-4d33-6c90-4068-1ba9c2b2c57b@eik.bme.hu>
 <c0b5ad2e-1b69-a570-b3ca-1f31339f1c8f@eik.bme.hu>
 <CAG4p6K7K7SE38EUnQ9Z3pU4bt2-Asd2AOoeivp3F6B-+RujF8A@mail.gmail.com>
 <ae970003-6bcf-1e6b-77b0-4c1080d33161@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-506288975-1677721006=:79107"
Content-ID: <9d4c6c6d-4d4c-3bab-a68f-453886f050b1@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-506288975-1677721006=:79107
Content-Type: text/plain; CHARSET=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <4ab8b933-e963-c30c-f1ec-a894c95a7d66@eik.bme.hu>

On Wed, 1 Mar 2023, Mark Cave-Ayland wrote:
> On 27/02/2023 16:52, Bernhard Beschow wrote:
>> On Mon, Feb 27, 2023 at 1:57 PM BALATON Zoltan <balaton@eik.bme.hu 
>> <mailto:balaton@eik.bme.hu>> wrote:
>> in. So if
>>      >> fuloon2e needs to do that then it should. I'll check that as I was 
>> focusing
>>      >
>>      > fuloong2e
>>
>>     I've checked fuloong2e and it still works as before. PCI bus is handled by
>>     bonito on that board so your patch would actually break it. The VIA chip
>>     is a PCIDevice. You're not supposed to replace the interrupts of the bus
>>     it's connected to from this model as that should be done by the pci-host
>>     or the board. Therefore modeling the chip's PIRQ/PINT pins as gpios which
>>     is the QDev concept for that is right and your usage of pci_set_irq here
>>     is wrong.
>> 
>> 
>> Works for me:
>> (08/84) 
>> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_mips64el_fuloong2e: 
>> PASS(2.77 s)
>
> The bonito code is interesting in that the IRQ is swizzled in 
> pci_bonito_map_irq() to the internal IRQ, and then pci_bonito_set_irq() sets 
> the output (CPU?) IRQ accordingly. This means that the routing is currently 
> fixed based upon the slot number, rather than using the VIA PCI IRQ routing. 
> This bit will need some thought as to how this interacts with pci_bus_irqs() 
> in your proposed patch, feel free to suggest a suitable approach.

I believe the fuloong2e may be similarly connected as the pegasos2. The 
Marvell Discovery II mv64361 was based on a MIPS counterpart so the 
concepts may be similar in these just the CPU arch is different.

This doc https://wiki.qemu.org/images/0/09/Bonito64-spec.pdf says the 
bonito north bridge has some GPin and GPIO pins which are connected to the 
interrupt controller (see section 5.15). Probably you can infer which pins 
PCI IRQs should come in from the map_irq function in the bonito model. I'd 
expect GPIO0-3 based on description in the table in section 6.1

On the other hand the board's firmware suggests PCI interrupt lines are 
also connected to the PIRQ pins of th 686B:

https://github.com/loongson-community/pmon/blob/master/sys/dev/pci/vt82c686_devbd2e.c

(if this is the right file to look at as there are different versions but 
dev board 2e said to inlude fuloong2e in the main README). Then in 686B 
PCI interrupts are mapped to 9.10.11.13 with the PnP IRQ routing registers 
in 686B.

This could then be modeled similarly to how I did it in this series for 
pegasos2: One could add gpio inputs in bonito to model the pins where the 
PCI interrupt lines are connected then connect these together in the board 
code just like they are wired on the real board.

Although this board does not have any PCI slots so these are only for the 
on board PCI devices: https://www.linux-mips.org/wiki/Fuloong_2E but a 
similar dev board may have 4 PCI slots.

Regards,
BALATON Zoltan
--3866299591-506288975-1677721006=:79107--

