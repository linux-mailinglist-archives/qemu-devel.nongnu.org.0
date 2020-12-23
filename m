Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D622E2048
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 19:03:24 +0100 (CET)
Received: from localhost ([::1]:38602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks8Tr-0000XQ-BI
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 13:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks8SB-0007m7-8o
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 13:01:39 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43512
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks8S8-00083W-Pw
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 13:01:39 -0500
Received: from host86-184-125-210.range86-184.btcentralplus.com
 ([86.184.125.210] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks8S0-0003CG-0N; Wed, 23 Dec 2020 18:01:31 +0000
To: Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan
 <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0c8d9c4f-cfd4-0df9-a722-14d624bfd646@ilande.co.uk>
Date: Wed, 23 Dec 2020 18:01:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.184.125.210
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Problems with irq mapping in qemu v5.2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.521,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/12/2020 17:01, Guenter Roeck wrote:

> On 12/23/20 8:09 AM, Mark Cave-Ayland wrote:
>> On 23/12/2020 15:21, Philippe Mathieu-Daudé wrote:
>>
>>> On 12/22/20 5:16 PM, Guenter Roeck wrote:
>>>> Hi,
>>>>
>>>> commit 459ca8bfa41 ("pci: Assert irqnum is between 0 and bus->nirqs in
>>>> pci_bus_change_irq_level") added sanity checks to the interrupt number passed
>>>> to pci_bus_change_irq_level(). That makes sense, given that bus->irq_count
>>>> is indexed and sized by the number of interrupts.
>>>>
>>>> However, as it turns out, the interrupt number passed to this function
>>>> is the _mapped_ interrupt number. The result in assertion failures for various
>>>> emulations.
>>>>
>>>> Examples (I don't know if there are others):
>>>>
>>>> - ppc4xx_pci_map_irq() maps the interrupt number to "slot - 1". Obviously
>>>>     that isn't a good thing to do for slot 0, and indeed results in an
>>>>     assertion as soon as slot 0 is initialized (presumably that is the root
>>>>     bridge). Changing the mapping to "slot" doesn't help because valid slots
>>>>     are 0..4, and only four interrupts are allocated.
>>>> - pci_bonito_map_irq() changes the mapping all over the place. Whatever
>>>>     it does, it returns numbers starting with 32 for slots 5..12. With
>>>>     a total number of 32 interrupts, this again results in an assertion
>>>>     failure.
>>>>
>>>> ppc4xx_pci_map_irq() is definitely buggy. I just don't know what the
>>>> correct mapping should be. slot  & 3, maybe ?
>>>>
>>>> I don't really have a good solution for pci_bonito_map_irq(). It may not
>>>> matter much - I have not been able to boot fuloong_2e since qemu v4.0,
>>>> and afaics that is the only platform using it. Maybe it is just completely
>>>> broken ?
>>>
>>> FWIW bisecting Fuloong2E starts failing here:
>>>
>>> 4ea98d317eb442c738f898f16cfdd47a18b7ca49 is the first bad commit
>>> commit 4ea98d317eb442c738f898f16cfdd47a18b7ca49
>>> Author: BALATON Zoltan <balaton@eik.bme.hu>
>>> Date:   Fri Jan 25 14:52:12 2019 -0500
>>>
>>>       ide/via: Implement and use native PCI IDE mode
>>>
>>>       This device only implemented ISA compatibility mode and native PCI IDE
>>>       mode was missing but no clients actually need ISA mode but to the
>>>       contrary, they usually want to switch to and use device in native
>>>       PCI IDE mode. Therefore implement native PCI mode and switch default
>>>       to that.
>>>
>>>       Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>       Message-id:
>>> c323f08c59b9931310c5d92503d370f77ce3a557.1548160772.git.balaton@eik.bme.hu
>>>       Signed-off-by: John Snow <jsnow@redhat.com>
>>>
>>>    hw/ide/via.c | 52 ++++++++++++++++++++++++++++++++++++++--------------
>>>    1 file changed, 38 insertions(+), 14 deletions(-)
>>
>> I think the original version of the patch broke fuloong2e, however that should have been fixed by my patchset here: https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg03936.html. It might be that there are multiple regressions located during a full bisect :/
>>
> 
> Not really. The following patch on top of qemu 5.2 results in the ide drive
> being detected and working.
> 
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index be09912b33..1bfdc422ee 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -186,11 +186,14 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
> 
>       bmdma_setup_bar(d);
> +#if 0
>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +#endif
> 
>       qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>       for (i = 0; i < 2; i++) {
>           ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
> +        ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0, i ? 0x376 : 0x3f6);
>           ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
> 
>           bmdma_init(&d->bus[i], &d->bmdma[i], d);
> 
> With the added ide_init_ioport(), the drive is detected. With the #if 0,
> it actually starts working. So there are two problems: 1) The qemu ide
> subsystem isn't informed about the io addresses, and 2) bmdma isn't working.

Interesting: that's basically disabling BMDMA and switching back to use legacy IDE 
again. Regardless of this it seems I need a better test case for this, and some input 
from people who know the hardware better :(


ATB,

Mark.

