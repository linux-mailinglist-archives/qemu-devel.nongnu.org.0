Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E92C6EF32C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:16:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prd6t-0001Fj-IA; Wed, 26 Apr 2023 07:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prd6d-0001E3-GR; Wed, 26 Apr 2023 07:14:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prd6b-0001TH-F3; Wed, 26 Apr 2023 07:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DGkWIKGSKKb2uFXjSjILQf+NFhDDShBUL5d/CkLCZxc=; b=g9JnBVrE5z3QFFUIVYrD+UNw0t
 mr4ZAFRrnyJJzN3+KJgMe7wHZRxCcSN7wpfOLG4xZ2XMvzJ/9edOJEEhDqikT+36rQvXgwZ4Ve1qk
 XJWOWD7hiW5VQwKdb+c5ijh4SZVSujJAyRhudnqD4d7Uyxt6+jsZG7VVICyuEDdWBaTcBdXJaQZlD
 XG3Goo6ZIQw6VZGYfA0v5qDVIXgzsAI+OE4CQIJQhSPDnDquz235MgnCc9tO7xluoOwda1I/a2lWK
 7STpIn/5oVdgRXTIvRp0yKqWSV1VRVYI5MhgRs5zX/cQZneDaZ2fQeok8fsttPs5meYdD6LFPG1Rc
 0YslEuxWIIZcqZGKuFToDA+XylrVdHr2af6IYSss8B3GdXsVO8x4viNHqVLzuD+uyWJE/Yhkd0IMI
 hvTf1HKn5toClwgzQnEpcHp/W0WFQ5NtqT5xxfdoTVhKD1X1YMwNSFLkyrADGtRn0miUjE1AtGXYV
 Jj6CnOSI8EaixlFbKxwMdu59Bu0qo6364XBPwUhhpQrwCzqmc1NoEKpRWiJli2PLS5m3RHVIz1YpY
 A7F9w/IgApI0BvugGiABJKFWUFt9SQk4OqNXmvG77OMd9Exrdq+N9pnF1oTVvD8g164ln9hUmxvG4
 4dwG1SioKOTS3p4VEPVOFm8Rp/X4zyMfukKEPVz/Y=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prd5a-0001x9-BP; Wed, 26 Apr 2023 12:13:38 +0100
Message-ID: <cef5ddb5-993b-b87b-7ee7-8b6f80c2b9c4@ilande.co.uk>
Date: Wed, 26 Apr 2023 12:14:25 +0100
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
 <20230422150728.176512-7-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230422150728.176512-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 06/13] hw/ide: Extract bmdma_init_ops()
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

> There are three private copies of bmdma_setup_bar() with small adaptions.
> Consolidate them into one public implementation.
> 
> While at it rename the function to bmdma_init_ops() to reflect that the memory
> regions being initialized represent BMDMA operations. The actual mapping as a
> PCI BAR is still performed separately in each device.
> 
> Note that the bmdma_bar attribute will be renamed in a separate commit.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/ide/pci.h |  1 +
>   hw/ide/cmd646.c      | 20 +-------------------
>   hw/ide/pci.c         | 16 ++++++++++++++++
>   hw/ide/piix.c        | 19 +------------------
>   hw/ide/via.c         | 19 +------------------
>   5 files changed, 20 insertions(+), 55 deletions(-)
> 
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index 7bc4e53d02..597c77c7ad 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -57,6 +57,7 @@ struct PCIIDEState {
>   };
>   
>   void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
> +void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops);
>   void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>   extern MemoryRegionOps bmdma_addr_ioport_ops;
>   void pci_ide_create_devs(PCIDevice *dev);
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index 9aabf80e52..6fd09fe74e 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -161,24 +161,6 @@ static const MemoryRegionOps cmd646_bmdma_ops = {
>       .write = bmdma_write,
>   };
>   
> -static void bmdma_setup_bar(PCIIDEState *d)
> -{
> -    BMDMAState *bm;
> -    int i;
> -
> -    memory_region_init(&d->bmdma_bar, OBJECT(d), "cmd646-bmdma", 16);
> -    for(i = 0;i < 2; i++) {
> -        bm = &d->bmdma[i];
> -        memory_region_init_io(&bm->extra_io, OBJECT(d), &cmd646_bmdma_ops, bm,
> -                              "cmd646-bmdma-bus", 4);
> -        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
> -        memory_region_init_io(&bm->addr_ioport, OBJECT(d),
> -                              &bmdma_addr_ioport_ops, bm,
> -                              "cmd646-bmdma-ioport", 4);
> -        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
> -    }
> -}
> -
>   static void cmd646_update_irq(PCIDevice *pd)
>   {
>       int pci_level;
> @@ -285,7 +267,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
>                             &d->bus[1], "cmd646-cmd1", 4);
>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>   
> -    bmdma_setup_bar(d);
> +    bmdma_init_ops(d, &cmd646_bmdma_ops);
>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>   
>       /* TODO: RST# value should be 0 */
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 8bea92e394..65ed6f7f72 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -523,6 +523,22 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
>       bm->pci_dev = d;
>   }
>   
> +void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops)
> +{
> +    size_t i;
> +
> +    memory_region_init(&d->bmdma_bar, OBJECT(d), "bmdma-container", 16);
> +    for (i = 0; i < ARRAY_SIZE(d->bmdma); i++) {
> +        BMDMAState *bm = &d->bmdma[i];
> +
> +        memory_region_init_io(&bm->extra_io, OBJECT(d), bmdma_ops, bm, "bmdma-ops", 4);
> +        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
> +        memory_region_init_io(&bm->addr_ioport, OBJECT(d), &bmdma_addr_ioport_ops, bm,
> +                              "bmdma-ioport-ops", 4);
> +        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
> +    }
> +}
> +
>   static void pci_ide_init(Object *obj)
>   {
>       PCIIDEState *d = PCI_IDE(obj);
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 4e6ca99123..5611473d37 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -86,23 +86,6 @@ static const MemoryRegionOps piix_bmdma_ops = {
>       .write = bmdma_write,
>   };
>   
> -static void bmdma_setup_bar(PCIIDEState *d)
> -{
> -    int i;
> -
> -    memory_region_init(&d->bmdma_bar, OBJECT(d), "piix-bmdma-container", 16);
> -    for(i = 0;i < 2; i++) {
> -        BMDMAState *bm = &d->bmdma[i];
> -
> -        memory_region_init_io(&bm->extra_io, OBJECT(d), &piix_bmdma_ops, bm,
> -                              "piix-bmdma", 4);
> -        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
> -        memory_region_init_io(&bm->addr_ioport, OBJECT(d),
> -                              &bmdma_addr_ioport_ops, bm, "bmdma", 4);
> -        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
> -    }
> -}
> -
>   static void piix_ide_reset(DeviceState *dev)
>   {
>       PCIIDEState *d = PCI_IDE(dev);
> @@ -156,7 +139,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>   
>       pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>   
> -    bmdma_setup_bar(d);
> +    bmdma_init_ops(d, &piix_bmdma_ops);
>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>   
>       for (unsigned i = 0; i < 2; i++) {
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 287143a005..40704e2857 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -86,23 +86,6 @@ static const MemoryRegionOps via_bmdma_ops = {
>       .write = bmdma_write,
>   };
>   
> -static void bmdma_setup_bar(PCIIDEState *d)
> -{
> -    int i;
> -
> -    memory_region_init(&d->bmdma_bar, OBJECT(d), "via-bmdma-container", 16);
> -    for (i = 0; i < ARRAY_SIZE(d->bmdma); i++) {
> -        BMDMAState *bm = &d->bmdma[i];
> -
> -        memory_region_init_io(&bm->extra_io, OBJECT(d), &via_bmdma_ops, bm,
> -                              "via-bmdma", 4);
> -        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
> -        memory_region_init_io(&bm->addr_ioport, OBJECT(d),
> -                              &bmdma_addr_ioport_ops, bm, "bmdma", 4);
> -        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
> -    }
> -}
> -
>   static void via_ide_set_irq(void *opaque, int n, int level)
>   {
>       PCIIDEState *s = opaque;
> @@ -187,7 +170,7 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>                             &d->bus[1], "via-ide1-cmd", 4);
>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>   
> -    bmdma_setup_bar(d);
> +    bmdma_init_ops(d, &via_bmdma_ops);
>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>   
>       qdev_init_gpio_in(ds, via_ide_set_irq, ARRAY_SIZE(d->bus));

Nice! In actual fact, with some more refactoring of the CMD646 device I believe you 
could remove the per-implementation ops and move everything into hw/ide/pci.c.

The main reason this is a bit difficult now is because of the "Device specific" 
registers intertwined with the BMDMA registers, but there's no reason that CMD646 
couldn't manually attach a fallback MemoryRegion to PCIIDEState::bmdma_bar and 
implement its device-specific registers there.

Unfortunately this isn't just a cut/paste job because there is also some mirroring of 
the BMDMA in PCI configuration space which will need some extra untangling: let's 
leave this as-is for now since it makes it easier for a follow-up patch to improve 
this later. On that basis:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

