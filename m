Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EB0537070
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 11:28:57 +0200 (CEST)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvFEH-0001TZ-1v
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 05:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvFBE-0000DA-O3; Sun, 29 May 2022 05:25:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvFBC-0007wm-UE; Sun, 29 May 2022 05:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9aA820tbaUQvHjsYfKGWg+a25ygd8aRp/OvQ7tNYSjA=; b=xhTTIuFBX+Jo5rcbQMWTcieoLB
 W11UWdFnBKxW0m+ySzs9TpWExnZxcxB0CaOhrGUbF/PzizoPjzepSNk6xQfow6Pd1WC6gnp2AR9ZW
 mLoGir5mknIIS4pWNdMLt8cEbxpnGV4XgrsnRL6A+2hTnqiRPQYRiU+gR/6afClRtaRF2kEs5HSJH
 10NQ4pTqUZ2Cw75r4DW0lgdQA+yf8i7iJu8120ScYf7Cfr9BH4aXw47CA4dd3sJPO0NOW0PpA+w7B
 OMIfnLp5or9Hlw0rRnYeRs6Dm+3by0hLhHd4soyEqJdTXyNTxSyWZc2Isfzh66shdExIrqoSwT7vq
 j0zD1HYAajAon4oRActF3JZqI8IiLChvOWbUYb8hdqRqwRCcmot2M3j7XbQ2sJ1OFzUN9w5F6+kV8
 5oLEQwZ9qTfPBTUfFE+4NAe2RWc/67ySG85Zw0XmoxY0eK1aofMs1/nms8pUziORroovyh7CzLt3v
 gFae5/lnF2jXBQ1elQQfWKsLqAU6pvQfAu2k4PinbwM3wNo9M34r0fpO+NX+7IyIiq4Q3Sq9YBgDp
 E6UsgXEyo2ArRHYQIwKFHXbSIrqB40WJlvAeSNG0EUqZ7h0izO+upwSujHn2fBr0ZD0wVm8CdbPJ5
 CrTngApnKHtpbxVoaAEz5iAwgXe1KsCIxPPN9xv2U=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvFAA-000AOr-21; Sun, 29 May 2022 10:24:42 +0100
Message-ID: <f3428e7e-f3f5-b933-a279-7da6e056dd5e@ilande.co.uk>
Date: Sun, 29 May 2022 10:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220528192057.30910-1-shentey@gmail.com>
 <20220528192057.30910-7-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220528192057.30910-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 6/7] hw/isa/piix4: QOM'ify PIIX4 PM creation
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

On 28/05/2022 20:20, Bernhard Beschow wrote:

> Just like the real hardware, create the PIIX4 ACPI controller as part of
> the PIIX4 southbridge. This also mirrors how the IDE and USB functions
> are already created.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c                | 25 ++++++++++++++-----------
>   hw/mips/malta.c               |  3 ++-
>   include/hw/southbridge/piix.h |  2 +-
>   3 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 96df21a610..217989227d 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -49,6 +49,7 @@ struct PIIX4State {
>       RTCState rtc;
>       PCIIDEState ide;
>       UHCIState uhci;
> +    PIIX4PMState pm;
>       /* Reset Control Register */
>       MemoryRegion rcr_mem;
>       uint8_t rcr;
> @@ -261,6 +262,14 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>           return;
>       }
>   
> +    /* ACPI controller */
> +    qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
> +    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
> +        return;
> +    }
> +    qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
> +    object_property_add_alias(OBJECT(s), "smbus", OBJECT(&s->pm), "i2c");

Now that the PM device is QOMified you don't actually need this alias anymore (see 
below). In general aliasing parts of contained devices onto the container isn't 
recommended, since it starts to blur the line between individual devices and then you 
find some wiring gets done to the container, some directly to the contained device 
and then it starts to get confusing quite quickly.

>       pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
>   }
>   
> @@ -271,6 +280,10 @@ static void piix4_init(Object *obj)
>       object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>       object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
>       object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
> +
> +    object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
> +    qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
> +    qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", 0);
>   }
>   
>   static void piix4_class_init(ObjectClass *klass, void *data)
> @@ -312,7 +325,7 @@ static void piix4_register_types(void)
>   
>   type_init(piix4_register_types)
>   
> -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
> +DeviceState *piix4_create(PCIBus *pci_bus)
>   {
>       PCIDevice *pci;
>       DeviceState *dev;
> @@ -322,15 +335,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
>                                             TYPE_PIIX4_PCI_DEVICE);
>       dev = DEVICE(pci);
>   
> -    if (smbus) {
> -        pci = pci_new(devfn + 3, TYPE_PIIX4_PM);
> -        qdev_prop_set_uint32(DEVICE(pci), "smb_io_base", 0x1100);
> -        qdev_prop_set_bit(DEVICE(pci), "smm-enabled", 0);
> -        pci_realize_and_unref(pci, pci_bus, &error_fatal);
> -        qdev_connect_gpio_out(DEVICE(pci), 0,
> -                              qdev_get_gpio_in_named(dev, "isa", 9));
> -        *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pci), "i2c"));
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

It should now be possible to do something like this:

     pm_dev = DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
     smbus = I2C_BUS(qdev_get_child_bus(pm_dev, "i2c"));

whereby we grab the reference to the PIIX4_PM device by resolving the "pm" child 
object and then use that to obtain the reference to smbus.

>       /* Interrupt controller */
>       qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index 0a2ef0c7b6..e1f5d6d5c8 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -70,6 +70,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>   
>   PIIX3State *piix3_create(PCIBus *pci_bus);
>   
> -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
> +DeviceState *piix4_create(PCIBus *pci_bus);
>   
>   #endif


ATB,

Mark.

