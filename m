Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BD152FA06
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 10:32:05 +0200 (CEST)
Received: from localhost ([::1]:46760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsKWp-0005YU-Sr
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 04:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKSO-0004YE-Il; Sat, 21 May 2022 04:27:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKSM-0002vB-EE; Sat, 21 May 2022 04:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=prrCHIfuRyn6PU3oRShSKo3ZLXnchbRe12m/T4u3d94=; b=SSe5Z0fZgJZzWcoyfAF7qAiaMU
 dSP8Ga7rQ6lm6IMGCX/ZzjWlRFM8sjHPAPPuTN+phslVAVflUzgXvYGfyFzw6JLGnENof+UW96pzt
 Ax8sot9DujH7ok85HcrUkDP21xWIVQbUiO3Ws1W3/oVwySxjTOCTNVdBqkd2w3+ehSmSi8mPL4SFN
 qVcITYOKCc9uuAw+A/dT3PfvmHTWUvjk/NY7BkGoJcLTl6ZqvisbySaeDeXB/xw0MSRx3QfZJwyo8
 qVaiRglgFAloAVNHDr15rNKUnnCi+UUHXRQknIZpjYs5qsYObIP1TciGx4AE3hZ9JU2UD+M7gENX2
 kguYUzTSDd9v0IhQr8VFZ2dtxX1CkcK06eB4A55Zobd9ATG0XNsp8OweRAmuv4vGqO0hTCEMkyyA6
 9yRSyHtYVF4nQNs+c1gNMexchw/BYX2AoklM5bHkxYFnhtOqhXYBp9kk1WRrdtLcexl5bAcd9BHQZ
 Y7YmjuEtdu+yiQuGRJ0N2NZkc9NTa8vkO/gCqPl76Eb+Rnnjqd9US4QpbH69B2DQxfFifa9Wi0a/D
 GQO7zkagp7GdqNDEJRM8+cpN1YmGn+0rBhqTlbqfq+NILT/OvYnS+vc7l6oaLuu8/JBjfDUgCR8PD
 Rk7tqRvWGQWhtEZXuCjVFeHFrZ8u+etm557HeT9R4=;
Received: from host86-135-55-247.range86-135.btcentralplus.com
 ([86.135.55.247] helo=[192.168.50.176])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKRI-000AAy-2k; Sat, 21 May 2022 09:26:24 +0100
Message-ID: <d4fecb8f-f764-f6ab-1a0b-851d4b15e0a4@ilande.co.uk>
Date: Sat, 21 May 2022 09:27:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20220513175445.89616-1-shentey@gmail.com>
 <20220513175445.89616-4-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220513175445.89616-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.135.55.247
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 3/6] hw/isa/piix{3,4}: QOM'ify PCI device creation and
 wiring
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

On 13/05/2022 18:54, Bernhard Beschow wrote:

> PCI interrupt wiring and device creation (piix4 only) were performed
> in create() functions which are obsolete. Move these tasks into QOM
> functions to modernize the code.
> 
> In order to avoid duplicate checking for xen_enabled() the piix3 realize
> methods are now split.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c | 67 +++++++++++++++++++++++++++++++++-----------------
>   hw/isa/piix4.c | 20 +++++++++------
>   2 files changed, 57 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index 7d69420967..d15117a7c7 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -24,6 +24,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/range.h"
> +#include "qapi/error.h"
>   #include "hw/southbridge/piix.h"
>   #include "hw/irq.h"
>   #include "hw/isa/isa.h"
> @@ -280,7 +281,7 @@ static const MemoryRegionOps rcr_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN
>   };
>   
> -static void piix3_realize(PCIDevice *dev, Error **errp)
> +static void pci_piix3_realize(PCIDevice *dev, Error **errp)
>   {
>       PIIX3State *d = PIIX3_PCI_DEVICE(dev);
>   
> @@ -305,7 +306,6 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
>       dc->desc        = "ISA bridge";
>       dc->vmsd        = &vmstate_piix3;
>       dc->hotpluggable   = false;
> -    k->realize      = piix3_realize;
>       k->vendor_id    = PCI_VENDOR_ID_INTEL;
>       /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>       k->device_id    = PCI_DEVICE_ID_INTEL_82371SB_0;
> @@ -329,11 +329,28 @@ static const TypeInfo piix3_pci_type_info = {
>       },
>   };
>   
> +static void piix3_realize(PCIDevice *dev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
> +    PCIBus *pci_bus = pci_get_bus(dev);
> +
> +    pci_piix3_realize(dev, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
> +                 piix3, PIIX_NUM_PIRQS);
> +    pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
> +};
> +

Oooof. So the reason this looks a bit odd is because we don't have an equivalent of 
device_class_set_parent_realize() for PCIDevice realize(). Having had a look in pci.c 
this looks like a similar approach for handling errors, execpt that here errp is 
accessed directly.

I think this is probably the best we can do for now though. Have you tried forcing 
pci_piix3_realize() to throw an error during testing to make sure this works as expected?

>   static void piix3_class_init(ObjectClass *klass, void *data)
>   {
>       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>   
>       k->config_write = piix3_write_config;
> +    k->realize = piix3_realize;
>   }
>   
>   static const TypeInfo piix3_info = {
> @@ -342,11 +359,33 @@ static const TypeInfo piix3_info = {
>       .class_init    = piix3_class_init,
>   };
>   
> +static void piix3_xen_realize(PCIDevice *dev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
> +    PCIBus *pci_bus = pci_get_bus(dev);
> +
> +    pci_piix3_realize(dev, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    /*
> +     * Xen supports additional interrupt routes from the PCI devices to
> +     * the IOAPIC: the four pins of each PCI device on the bus are also
> +     * connected to the IOAPIC directly.
> +     * These additional routes can be discovered through ACPI.
> +     */
> +    pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
> +                 piix3, XEN_PIIX_NUM_PIRQS);
> +};
> +
>   static void piix3_xen_class_init(ObjectClass *klass, void *data)
>   {
>       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>   
>       k->config_write = piix3_write_config_xen;
> +    k->realize = piix3_xen_realize;
>   };
>   
>   static const TypeInfo piix3_xen_info = {
> @@ -368,27 +407,11 @@ PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
>   {
>       PIIX3State *piix3;
>       PCIDevice *pci_dev;
> +    const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> +                                     : TYPE_PIIX3_DEVICE;
>   
> -    /*
> -     * Xen supports additional interrupt routes from the PCI devices to
> -     * the IOAPIC: the four pins of each PCI device on the bus are also
> -     * connected to the IOAPIC directly.
> -     * These additional routes can be discovered through ACPI.
> -     */
> -    if (xen_enabled()) {
> -        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
> -                                                  TYPE_PIIX3_XEN_DEVICE);
> -        piix3 = PIIX3_PCI_DEVICE(pci_dev);
> -        pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
> -                     piix3, XEN_PIIX_NUM_PIRQS);
> -    } else {
> -        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
> -                                                  TYPE_PIIX3_DEVICE);
> -        piix3 = PIIX3_PCI_DEVICE(pci_dev);
> -        pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
> -                     piix3, PIIX_NUM_PIRQS);
> -        pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
> -    }
> +    pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
> +    piix3 = PIIX3_PCI_DEVICE(pci_dev);
>       *isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
>   
>       return piix3;
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index a223b69e24..134d23aea7 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -204,6 +204,8 @@ static const MemoryRegionOps piix4_rcr_ops = {
>   static void piix4_realize(PCIDevice *dev, Error **errp)
>   {
>       PIIX4State *s = PIIX4_PCI_DEVICE(dev);
> +    PCIDevice *pci;
> +    PCIBus *pci_bus = pci_get_bus(dev);
>       ISABus *isa_bus;
>       qemu_irq *i8259_out_irq;
>   
> @@ -242,6 +244,15 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>           return;
>       }
>       s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
> +
> +    /* IDE */
> +    pci = pci_create_simple(pci_bus, dev->devfn + 1, "piix4-ide");
> +    pci_ide_create_devs(pci);
> +
> +    /* USB */
> +    pci_create_simple(pci_bus, dev->devfn + 2, "piix4-usb-uhci");
> +
> +    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
>   }
>   
>   static void piix4_init(Object *obj)
> @@ -292,7 +303,6 @@ type_init(piix4_register_types)
>   
>   DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
>   {
> -    PIIX4State *s;
>       PCIDevice *pci;
>       DeviceState *dev;
>       int devfn = PCI_DEVFN(10, 0);
> @@ -300,22 +310,16 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
>       pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
>                                             TYPE_PIIX4_PCI_DEVICE);
>       dev = DEVICE(pci);
> -    s = PIIX4_PCI_DEVICE(pci);
> +
>       if (isa_bus) {
>           *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
>       }
>   
> -    pci = pci_create_simple(pci_bus, devfn + 1, "piix4-ide");
> -    pci_ide_create_devs(pci);
> -
> -    pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
>       if (smbus) {
>           *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
>                                  qdev_get_gpio_in_named(dev, "isa", 9),
>                                  NULL, 0, NULL);
>       }
>   
> -    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
> -
>       return dev;
>   }

As long as the error handling works as required:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

