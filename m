Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3934D68B20C
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 22:55:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOmy3-0007sn-Dq; Sun, 05 Feb 2023 16:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOmy1-0007rT-1h; Sun, 05 Feb 2023 16:54:33 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOmxz-0000Yl-92; Sun, 05 Feb 2023 16:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B0/TqOPymnLhhU2HKEryc2uFMrqRaiIvUFa+82Wod+8=; b=Qn0LGRKOzy8KcUrUlUsrnbSS0s
 y5q1Rx+2uUJ8mSEnSEnsvvBzbOMxwSJ4I+zIObtuPLCXtxX7sQ0OZSnFAHPJOiAqet5SSnoo9odgH
 R50Xo0EhY/pJT38retPcNOZSZBH2VSKXrtOOthyYfaCrxAOtwczTrOQslRqvXUxEtGXoQYkbZX0xs
 IBydWYTMAcVeZhDuK8tzTdQQi8BdBbEPIvz2gIy71fjoaxxaBu08c1F0DkuQpAyJSXRlgp8ZSqg/R
 +5jQEfzjhFgfObM1/4YGSrHUCYWrSnLWdJ6OZ2PXuJ8WC0UXPlHzTOMOY3xk3C9NqB6WjClE0qDwm
 Y/mXLqmPZZNvIc7EMr3m6KZzGCId70ETvCdWxpE5tvCDUnojF+HmhKhd5Yvx2qOp7owCUIQBr7lay
 yETpA+7k6BtfRTtiZwYUoOrU6KeMh8uF7SchNJSZKHpVqZGJSgeJ9UU/JXGpW+jWiv4UMSu49LEnY
 OWf3QlSqeS4OYRpq6O4VI7o6q9YSL5RIXyu62fY/viqoLTjHbpedUxvAaHwkM6VnxKAWtWdyfgo0+
 lHJb8LyHl5v5S0hypBEMgiEbXIvpwxQ4bHDboGUdIpLBLO83U+RWWlZuCogKnH3/wl7eLGX5knRQ7
 aTmh5CwqD7AXAM4PwJ0brsYnDeCn9DEpl514BqbY4=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOmxJ-0007nu-MY; Sun, 05 Feb 2023 21:53:53 +0000
Message-ID: <11404103-868f-a0ca-6fda-0b0a3fe659e7@ilande.co.uk>
Date: Sun, 5 Feb 2023 21:54:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-5-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230126211740.66874-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 04/10] hw/ide/piix: Disuse isa_get_irq()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 26/01/2023 21:17, Bernhard Beschow wrote:

> isa_get_irq() asks for an ISADevice which piix-ide doesn't provide.
> Passing a NULL pointer works but causes the isabus global to be used
> then. By fishing out TYPE_ISA_BUS from the QOM tree it is possible to
> achieve the same as isa_get_irq().
> 
> This is an alternative solution to commit 9405d87be25d 'hw/ide: Fix
> crash when plugging a piix3-ide device into the x-remote machine' which
> allows for cleaning up the ISA API while keeping PIIX IDE functions
> user-createable.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ide/piix.c | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 267dbf37db..a6646d9657 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -126,7 +126,7 @@ static void piix_ide_reset(DeviceState *dev)
>       pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>   }
>   
> -static int pci_piix_init_ports(PCIIDEState *d)
> +static int pci_piix_init_ports(PCIIDEState *d, ISABus *isa_bus)
>   {
>       static const struct {
>           int iobase;
> @@ -145,7 +145,7 @@ static int pci_piix_init_ports(PCIIDEState *d)
>           if (ret) {
>               return ret;
>           }
> -        ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
> +        ide_init2(&d->bus[i], isa_bus->irqs[port_info[i].isairq]);
>   
>           bmdma_init(&d->bus[i], &d->bmdma[i], d);
>           d->bmdma[i].bus = &d->bus[i];
> @@ -159,6 +159,8 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>   {
>       PCIIDEState *d = PCI_IDE(dev);
>       uint8_t *pci_conf = dev->config;
> +    ISABus *isa_bus;
> +    bool ambiguous;
>       int rc;
>   
>       pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
> @@ -168,7 +170,20 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>   
>       vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
>   
> -    rc = pci_piix_init_ports(d);
> +    isa_bus = ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous));
> +    if (ambiguous) {
> +        error_setg(errp,
> +                   "More than one ISA bus found while %s supports only one",
> +                   object_get_typename(OBJECT(dev)));
> +        return;
> +    }
> +    if (!isa_bus) {
> +        error_setg(errp, "No ISA bus found while %s requires one",
> +                   object_get_typename(OBJECT(dev)));
> +        return;
> +    }
> +
> +    rc = pci_piix_init_ports(d, isa_bus);
>       if (rc) {
>           error_setg_errno(errp, -rc, "Failed to realize %s",
>                            object_get_typename(OBJECT(dev)));

I think the approach here to allow the PCI-ISA bridge to locate the ISABus is a good 
one, but I think it's worth keeping isa_get_irq() to avoid exposing the internals to 
devices.

For me the problem here is that isa_get_irq() accepts a NULL argument for ISADevice. 
I'd expect the function to look something like isa_bus_get_irq(ISABus *isa_bus, 
unsigned isairq) and then it is the responsibility of the caller to locate and 
specify the correct ISABus to avoid falling back to the isabus global.

In particular I can see a PCIDevice should be able to attempt a pci_get_isa_bus() or 
similar which would locate the PCI-ISA bridge and return the child ISA bus, which 
again is related to the cmd646/via compatibility mode feature.

This is along the lines of the similar approach I discussed in 
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg01443.html which is an 
evolution of the ideas discussed in the original thread a couple of years earlier at 
https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg01707.html.


ATB,

Mark.

