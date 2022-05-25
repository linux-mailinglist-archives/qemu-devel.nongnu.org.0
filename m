Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD435342BB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 20:13:56 +0200 (CEST)
Received: from localhost ([::1]:60372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntvW6-0007d9-FN
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 14:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntvS3-0004Ym-6O; Wed, 25 May 2022 14:09:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntvS1-000812-Fg; Wed, 25 May 2022 14:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EyAap97/H9GKPR2EyhOebq5Fj+GVqX0xGZeT2x4AeS0=; b=azXLtPdhBZxEUrzX31eKW43TTi
 u2Xs1gMAAZ1Agxu5kB6nO71DIpPCKDySamb9S3f3S9q/hf+5TkAQxrToxzAEXL8aOIYPgfjJjOY2O
 gIX2EzZ0OlOEpVl1eayT2cKwpW/la1dDLqLGr6gZh2ScBbFW5F1H2j8ZCIsLk6QwQrkoB5hyr21eG
 gslW/TCm8mZTt13qsSwQmCOl7pej2enSbfoTkJBjR3ImOmf2G5hUxsGijo1ebC7hKQAcHXyeb3TmT
 XsL8vhLUJEuHrqph1ThhLHupnLIOf1aesYG1sjOUXOPq6sSkPrmXBYNeHCEcbWuJ/N3et0+DnrRVQ
 u2X3l7teA9aPisz9nYNGvBHta4Fi9N8GUUmWZkzchBX2tLk9ke3DDC8QtofcCZmPS1F23HZgnMW53
 UBfULZEo1m0ftDz/j8q8BJ17wkh+DIYYJPrADBxlGXJqkLCzKoVazkZJG6eQUjVePp0kcafERhU8e
 pOjn8OuRqN6x3sU2v7uUA8v+IE9mtMZ78yCyXKR93SZbn9UAdsfZlUzjG/ieztfXhQTr2Yzti64pt
 6FhxkYFosbO7NGmbyjcp9aumgSFGV0//YliTWGyRuDJanSdubAA9wnZKT60UmZScrW0pi+p3bB6Uh
 MrjZif78e1rgDHBTJRgTfiMltPi/8VvC7uD+jmCAU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntvQz-0006Yg-2T; Wed, 25 May 2022 19:08:37 +0100
Message-ID: <a1f2e759-0e2c-df44-4a1b-eb2c6429298a@ilande.co.uk>
Date: Wed, 25 May 2022 19:09:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220522212431.14598-1-shentey@gmail.com>
 <20220522212431.14598-6-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522212431.14598-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 5/6] hw/isa/piix4: QOM'ify PIIX4 PM creation
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/05/2022 22:24, Bernhard Beschow wrote:

> Just like the real hardware, create the PIIX4 ACPI controller as part of
> the PIIX4 southbridge. This also mirrors how the IDE and USB functions
> are already created.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c                | 14 +++++++-------
>   hw/mips/malta.c               |  3 ++-
>   include/hw/southbridge/piix.h |  2 +-
>   3 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 4968c69da9..1645f63450 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -206,6 +206,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>       PIIX4State *s = PIIX4_PCI_DEVICE(dev);
>       PCIDevice *pci;
>       PCIBus *pci_bus = pci_get_bus(dev);
> +    I2CBus *smbus;
>       ISABus *isa_bus;
>       qemu_irq *i8259_out_irq;
>   
> @@ -252,6 +253,11 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>       /* USB */
>       pci_create_simple(pci_bus, dev->devfn + 2, "piix4-usb-uhci");
>   
> +    /* ACPI controller */
> +    smbus = piix4_pm_init(pci_bus, pci->devfn + 3, 0x1100, s->isa[9],
> +                          NULL, 0, NULL);
> +    object_property_add_const_link(OBJECT(s), "smbus", OBJECT(smbus));
> +

Interesting hack here to expose the smbus so it is available to qdev_get_child_bus(), 
but really this is still really working around the fact that piix4_pm_init() itself 
should be removed first. Once that is done, you can then use a standard QOM pattern 
to initialise the "internal" PCI devices via object_initialize_child() and realize 
them in piix4_realize() instead of using pci_create_simple().

Is that something you could take a look at? If not, I may be able to put something 
together towards the end of the week. Other than that I think the rest of the series 
looks good.

>       pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
>   }
>   
> @@ -301,7 +307,7 @@ static void piix4_register_types(void)
>   
>   type_init(piix4_register_types)
>   
> -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
> +DeviceState *piix4_create(PCIBus *pci_bus)
>   {
>       PCIDevice *pci;
>       DeviceState *dev;
> @@ -311,11 +317,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
>                                             TYPE_PIIX4_PCI_DEVICE);
>       dev = DEVICE(pci);
>   
> -    if (smbus) {
> -        *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
> -                               qdev_get_gpio_in_named(dev, "isa", 9),
> -                               NULL, 0, NULL);
> -    }
> -
>       return dev;
>   }
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index e446b25ad0..b0fc84ccbb 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1399,8 +1399,9 @@ void mips_malta_init(MachineState *machine)
>       empty_slot_init("GT64120", 0, 0x20000000);
>   
>       /* Southbridge */
> -    dev = piix4_create(pci_bus, &smbus);
> +    dev = piix4_create(pci_bus);
>       isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
> +    smbus = I2C_BUS(qdev_get_child_bus(dev, "smbus"));
>   
>       /* Interrupt controller */
>       qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index 0bec7f8ca3..2c21359efa 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -76,6 +76,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>   
>   PIIX3State *piix3_create(PCIBus *pci_bus);
>   
> -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
> +DeviceState *piix4_create(PCIBus *pci_bus);
>   
>   #endif


ATB,

Mark.

