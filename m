Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4929F52F9F8
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 10:14:01 +0200 (CEST)
Received: from localhost ([::1]:41482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsKFM-0001Bn-7t
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 04:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsK9f-0006IC-DB; Sat, 21 May 2022 04:08:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsK9d-000068-Lo; Sat, 21 May 2022 04:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=phD4lVSEidEogJ/VmGrJfjM3Jv9C4aMCKAl36y3+Iu0=; b=YTjmkhY7T5lf3zr3HUp2qdXUOf
 abRGAJkm2l8TEL6PPfZXZymME2EQCJIdrVkkve71qND8AmOXoiFNaSrYvZF0Yt/YpAwO1t6KfIjDO
 3LyFR0JvTM8MDYWlZRJHHJpNb840MiJfZJU4vnPnNzf61k+liPXkHmhZ2sGoHjzIse4hp+i3cmRaX
 JtnlRKyxGxWaxoE9ao9xvdiwmOh4OGd5P0Ad1FIDBF0hR3msvMqU/zlNbOOKi9FyO0yNjeDlVwIay
 IqjDqx7LpktkwhYf+4ZjmAUZCKVaQUdhcKZ/xT7+ns2D++NBhYcMRoBOH7hHyzHVzyDLBI2LPVZJ/
 4zwP17qTNdRW8sgFTYvSKc85S+zMCIuiaqzt1wDsG/Dlg3kn2R//0xzH325Txh1WODWMIBKONGUpn
 Xr00yzcPSkuUUYOvsyZdUePq1VPW4Cjuo3r6t8Vi4Qj4i8VaPrk4uCfVMcIgyaMytAJMNqZD4K6q3
 xLTX03mk8FqS6XwFdN7qC7ImmpXSY794bfkl62p8g14eOKJB2eufoaxO2W464uG76KcFaKPfk5t5t
 vQqx2c/CMcOYFWwxRkiO7oAcXFV07U1Kn5nsaEPGRhzupnaIvuEYI3H3j8dwhF38tpwRwIrBApytv
 7i0WnR9qYVf+1TIsOcaV5tvi6vBl7TzMKpsU/FPXM=;
Received: from host86-135-55-247.range86-135.btcentralplus.com
 ([86.135.55.247] helo=[192.168.50.176])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsK8Z-000A2Q-C1; Sat, 21 May 2022 09:07:03 +0100
Message-ID: <403fbb9b-f8d9-406d-6233-559415222ae1@ilande.co.uk>
Date: Sat, 21 May 2022 09:07:58 +0100
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
 <20220513175445.89616-3-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220513175445.89616-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.135.55.247
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/6] hw/isa/piix{3, 4}: Move pci_map_irq_fn's near
 pci_set_irq_fn's
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

> The pci_map_irq_fn's were implemented below type_init() which made them
> inaccessible to QOM functions. So move them up.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c | 22 +++++++++++-----------
>   hw/isa/piix4.c | 50 +++++++++++++++++++++++++-------------------------
>   2 files changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index dab901c9ad..7d69420967 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -81,6 +81,17 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
>       piix3_set_irq_level(piix3, pirq, level);
>   }
>   
> +/*
> + * Return the global irq number corresponding to a given device irq
> + * pin. We could also use the bus number to have a more precise mapping.
> + */
> +static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
> +{
> +    int slot_addend;
> +    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
> +    return (pci_intx + slot_addend) & 3;
> +}
> +
>   static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
>   {
>       PIIX3State *piix3 = opaque;
> @@ -353,17 +364,6 @@ static void piix3_register_types(void)
>   
>   type_init(piix3_register_types)
>   
> -/*
> - * Return the global irq number corresponding to a given device irq
> - * pin. We could also use the bus number to have a more precise mapping.
> - */
> -static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
> -{
> -    int slot_addend;
> -    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
> -    return (pci_intx + slot_addend) & 3;
> -}
> -
>   PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
>   {
>       PIIX3State *piix3;
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 8607e0ac36..a223b69e24 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -73,6 +73,31 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
>       }
>   }
>   
> +static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
> +{
> +    int slot;
> +
> +    slot = PCI_SLOT(pci_dev->devfn);
> +
> +    switch (slot) {
> +    /* PIIX4 USB */
> +    case 10:
> +        return 3;
> +    /* AMD 79C973 Ethernet */
> +    case 11:
> +        return 1;
> +    /* Crystal 4281 Sound */
> +    case 12:
> +        return 2;
> +    /* PCI slot 1 to 4 */
> +    case 18 ... 21:
> +        return ((slot - 18) + irq_num) & 0x03;
> +    /* Unknown device, don't do any translation */
> +    default:
> +        return irq_num;
> +    }
> +}
> +
>   static void piix4_isa_reset(DeviceState *dev)
>   {
>       PIIX4State *d = PIIX4_PCI_DEVICE(dev);
> @@ -265,31 +290,6 @@ static void piix4_register_types(void)
>   
>   type_init(piix4_register_types)
>   
> -static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
> -{
> -    int slot;
> -
> -    slot = PCI_SLOT(pci_dev->devfn);
> -
> -    switch (slot) {
> -    /* PIIX4 USB */
> -    case 10:
> -        return 3;
> -    /* AMD 79C973 Ethernet */
> -    case 11:
> -        return 1;
> -    /* Crystal 4281 Sound */
> -    case 12:
> -        return 2;
> -    /* PCI slot 1 to 4 */
> -    case 18 ... 21:
> -        return ((slot - 18) + irq_num) & 0x03;
> -    /* Unknown device, don't do any translation */
> -    default:
> -        return irq_num;
> -    }
> -}
> -
>   DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
>   {
>       PIIX4State *s;

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

