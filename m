Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB4D6EF37B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:35:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prdPH-0002Lr-B8; Wed, 26 Apr 2023 07:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prdPF-0002LK-R7; Wed, 26 Apr 2023 07:33:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prdPE-00069O-1w; Wed, 26 Apr 2023 07:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRFiPz9/5bSgwD2YtySbaqDCxkud/sVIbdPX5T9RdFc=; b=U7ToeJqpdJcDGICxcL2hz5Lv4o
 gl/3fPFqEXj57JETX6F9gdRBXwSUUHDsesBZYhpD7PGPR4NlXopsL/TmsAQVHQPXYUMXSICDLTWy7
 l1bhIQAvFugkgQOFVF+av0rYn8Z+DQ9O2ORGZr7M2mnQTfkBRc+iiJF2SDiZKLI3owKQrnHj/vvC9
 vSZVXq74nOnDz9TBBm0Gi6fyIl588Hz9tbqre59BT6A7mh3EEAUJC4G9k0pAA3iPHp+2VRzwUVPJ1
 T1s4VnXdvNNTy+5XDjBx5I1nxtW3TZKfhhUZyd4SvHM8P7tlLF7qpFRy75OM4vobuLxCzn5sDZbIF
 SqWAghUDFW1FqRHkunOuzRo0QNleNZnURNsspaOYwPhFysTPxJdN6Bj1mqN7PkJ1PN3gPUwJyOjOK
 /O++ibv2KDkVCh5yBzOqxQcXjZOFieP+d+kc865QwXz+Adi0rq7fhDWDLClUgmbYSXJua94VfZSlG
 rq6y3Kk513XlISIBwLWwIKPYYwcRolMi7+OU+IKBHrjc1nfPHCKt3p+DAWDwgxZ7/8pXR1fY+NMW2
 Gdee8Hdeqwl9QVrA86ZvS8srAoly7ks9AUP7FuINdOmkxwjp3kxivBpyshGEcqSZpGWKw5Je46QJZ
 iGDQOh/CLqYLBPfjee8Q5kds++yj1IfQj3xOK49og=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prdOD-00025X-Ea; Wed, 26 Apr 2023 12:32:53 +0100
Message-ID: <32b3425c-737f-4889-9c87-67cd852032f6@ilande.co.uk>
Date: Wed, 26 Apr 2023 12:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-10-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230422150728.176512-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 09/13] hw/ide/piix: Disuse isa_get_irq()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 22/04/2023 16:07, Bernhard Beschow wrote:

> isa_get_irq() asks for an ISADevice which piix-ide doesn't provide.
> Passing a NULL pointer works but causes the isabus global to be used
> then. By fishing out TYPE_ISA_BUS from the QOM tree it is possible to
> achieve the same as using isa_get_irq().
> 
> This is an alternative solution to commit 9405d87be25d 'hw/ide: Fix
> crash when plugging a piix3-ide device into the x-remote machine' which
> allows for cleaning up the ISA API while keeping PIIX IDE functions
> user-createable.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ide/piix.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 6942b484f9..a3a15dc7db 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -104,7 +104,8 @@ static void piix_ide_reset(DeviceState *dev)
>       pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>   }
>   
> -static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
> +static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa_bus,
> +                              Error **errp)
>   {
>       static const struct {
>           int iobase;
> @@ -124,7 +125,8 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>                            object_get_typename(OBJECT(d)), i);
>           return false;
>       }
> -    ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
> +    ide_bus_init_output_irq(&d->bus[i],
> +                            isa_bus_get_irq(isa_bus, port_info[i].isairq));

I don't think is the right solution here, since ultimately we want to move the IRQ 
routing out of the device itself and into the PCI-ISA bridge. I'd go for the same 
solution as you've done for VIA IDE in patch 2, i.e. update the PIIX interrupt 
handler to set the legacy_irqs in PCIIDEState, and then wire them up to the ISA IRQs 
14 and 15 similar to as Phil as done in his patches:

https://patchew.org/QEMU/20230302224058.43315-1-philmd@linaro.org/20230302224058.43315-4-philmd@linaro.org/

https://patchew.org/QEMU/20230302224058.43315-1-philmd@linaro.org/20230302224058.43315-5-philmd@linaro.org/

This also reminds me, given that the first patch above is doing wiring in pc_init1() 
then we are still missing part of your tidy-up series :/

>       bmdma_init(&d->bus[i], &d->bmdma[i], d);
>       ide_bus_register_restart_cb(&d->bus[i]);
> @@ -136,14 +138,29 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>   {
>       PCIIDEState *d = PCI_IDE(dev);
>       uint8_t *pci_conf = dev->config;
> +    ISABus *isa_bus;
> +    bool ambiguous;
>   
>       pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>   
>       bmdma_init_ops(d, &piix_bmdma_ops);
>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops);
>   
> +    isa_bus = ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous));
> +    if (ambiguous) {
> +        error_setg(errp,
> +                   "More than one ISA bus found while %s supports only one",
> +                   object_get_typename(OBJECT(d)));
> +        return;
> +    }
> +    if (!isa_bus) {
> +        error_setg(errp, "No ISA bus found while %s requires one",
> +                   object_get_typename(OBJECT(d)));
> +        return;
> +    }

Again I think this should go away with using PCIIDEState's legacy_irqs, since you 
simply let the board wire them up to the ISABus (or not) as required.

>       for (unsigned i = 0; i < 2; i++) {
> -        if (!pci_piix_init_bus(d, i, errp)) {
> +        if (!pci_piix_init_bus(d, i, isa_bus, errp)) {
>               return;
>           }
>       }


ATB,

Mark.

