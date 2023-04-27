Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CFB6F0661
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:06:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1KA-000242-Iq; Thu, 27 Apr 2023 09:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ps1K4-00022t-Fi; Thu, 27 Apr 2023 09:06:08 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ps1Jz-0007kz-6V; Thu, 27 Apr 2023 09:06:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7258A746392;
 Thu, 27 Apr 2023 15:04:15 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2970B746346; Thu, 27 Apr 2023 15:04:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 27342746369;
 Thu, 27 Apr 2023 15:04:15 +0200 (CEST)
Date: Thu, 27 Apr 2023 15:04:15 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: Bernhard Beschow <shentey@gmail.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, 
 David Woodhouse <dwmw2@infradead.org>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 03/18] hw/i386/pc_piix: Wire PIIX3 IDE ouput IRQs to
 ISA bus IRQs 14/15
In-Reply-To: <df449cf0-c1f1-b9cb-8c9e-45b9ed7f1978@ilande.co.uk>
Message-ID: <a7c88b4d-2ffa-60b8-c37a-b993ad79ca40@eik.bme.hu>
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-4-philmd@linaro.org>
 <a233b5c7-56a6-ac94-c7c1-9fa5da9acb9c@ilande.co.uk>
 <3A39AAE9-73FC-4C56-9BD6-0DA2D78548E0@gmail.com>
 <df449cf0-c1f1-b9cb-8c9e-45b9ed7f1978@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-833733603-1682600655=:17165"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-833733603-1682600655=:17165
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 27 Apr 2023, Mark Cave-Ayland wrote:
> On 27/04/2023 08:58, Bernhard Beschow wrote:
>> Am 26. April 2023 12:50:08 UTC schrieb Mark Cave-Ayland 
>> <mark.cave-ayland@ilande.co.uk>:
>>> On 02/03/2023 22:40, Philippe Mathieu-Daudé wrote:
>>> 
>>>> Since pc_init1() has access to the ISABus*, retrieve the
>>>> ISA IRQs with isa_bus_get_irq().
>>>> 
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    hw/i386/pc_piix.c | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>> 
>>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>>> index 126b6c11df..1e90b9ff0d 100644
>>>> --- a/hw/i386/pc_piix.c
>>>> +++ b/hw/i386/pc_piix.c
>>>> @@ -277,7 +277,13 @@ static void pc_init1(MachineState *machine,
>>>>        if (pcmc->pci_enabled) {
>>>>            PCIDevice *dev;
>>>>    -        dev = pci_create_simple(pci_bus, piix3_devfn + 1, 
>>>> TYPE_PIIX3_IDE);
>>>> +        dev = pci_new_multifunction(piix3_devfn + 1, false, 
>>>> TYPE_PIIX3_IDE);
>>>> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 0,
>>>> +                                    isa_bus_get_irq(isa_bus, 14));
>>>> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 1,
>>>> +                                    isa_bus_get_irq(isa_bus, 15));
>>>> +        pci_realize_and_unref(dev, pci_bus, &error_fatal);
>>>> +
>>>>            pci_ide_create_devs(dev);
>>>>            idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
>>>>            idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
>>> 
>>> Another reason this probably isn't a good idea: you're having to call 
>>> qdev_connect_gpio_*() before realizing the device :(
>> 
>> Just curious: Resources like memory regions are assigned before 
>> realization, see e.g. i440fx or q35. Interrupts are also resources. What 
>> makes them special?
>
> I think I've covered the .instance_init() vs. realize() part in my reply to 
> Zoltan, but in terms of qdev_connect_gpio_out_named() the reasoning here is

Well, not quite I'm afaid as I still have questions as it's not clear what 
should be in init and in realize.

I've looked at i440fx and it has no init just realize which does what 
init method shoulc do anf the i440fx_init there is a legacy init function 
which should probably be realize so this does not look to be a good 
example. The q35 model is more complex and I proably don't understand it 
fully but still has a realize where most of the memory regions are created 
and an init method where some tweaks are done that are mentioned in a 
comment as needed but not the norm so it may also not be the best example 
so I'm not even getting why Bernhard's cited these in the first place.

Maybe some QOM/qdev experts could give some advice here.

Regards,
BALATON Zoltan

> that a device shouldn't change it's internal behaviour depending upon how it 
> is wired. In other words a standalone device will behave exactly the same as 
> a device connected into a machine.
>
>> I'm asking since this issue seems to be the main blocker for the piix 
>> consolidation to be merged.
>
> I did have a brief catch-up with Phil at the start of the week, and he's 
> tagged your series for review but he is really busy at the moment. As before 
> I repeat my offer to help out if needed as I think it's a good series, but 
> for now we're waiting for Phil to let us know what the next steps are...
>
>
> ATB,
>
> Mark.
>
>
--3866299591-833733603-1682600655=:17165--

