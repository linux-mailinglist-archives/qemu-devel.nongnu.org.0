Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3756612AB
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 00:58:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEJ5A-0006OO-MM; Sat, 07 Jan 2023 18:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEJ57-0006ME-5Z; Sat, 07 Jan 2023 18:58:33 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEJ55-0004Jm-N4; Sat, 07 Jan 2023 18:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJAhY3OpKhKc6x88+d/UMK5yhpD/vS//UaHSm1AYYf8=; b=lyVwc0/xyPTIvcypGfX5vBcep0
 7sn2XRzPHxfC1BqvNWkc2ZBGFXIKc0B5lJ+4j4xBYjSF5wzANw6A3F64yVhHyuau46ZPAiYm98rYp
 RbalQLWeSS/RE1tI6VB+GhcVNw6l2BtTqBothhIqpu2VsEgWxCUaW1p0ZwsHA7OWjfl2w/s+mCk1k
 hZHpU2AuROAmdgXFhkA+ibqCTMNLB3bcN68/BDYLxS5aLR6xFitnxR+XW0XlKV5mwaxgFia4SGHO6
 sDA8i3ahQUrPTutNpc35+uRGRJeeqEsmYIhjXF30X/7rn1MNdj7kHd9qPA+oBZTkeoCQeXSNZFIRt
 W3waK2phlxoXogZ9br1zmx3jUROc5B0uK9dLBuDK3QSd6YNZJsPKhz2G8kLOcnT5Ufl5JQ729IWEk
 h0kJ5lyypeis8P3iVfz61Jpw2gvBbESQnlI9cGmLK24VgRU7DjAgf2i8tnC/XBOHOHwinlafubpjc
 A60RWEM5iv3vXBrNZzZHPu0z2zD5DimQkWLOJOS9dDKONuJXCoFGsm95QbPUwFB2pEW0Behqz4i6Y
 iLjMx+vB8OGOOBcWCP6hu/YFQr49EedZmVGkTA2K7gWjzUwhj6rtgnzdcekLWFJRYZ39pnlkSLQMX
 fcpmvDRUGuq4SXQh/tZVloaN7fwkJcj3dX1EAa/eM=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEJ4f-000BN1-BC; Sat, 07 Jan 2023 23:58:09 +0000
Message-ID: <ca770961-dac9-925e-6b1b-fe8db98ac128@ilande.co.uk>
Date: Sat, 7 Jan 2023 23:58:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230105144142.51990-1-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230105144142.51990-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] hw/pci-host: Use register definitions from PCI standard
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.114,
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

On 05/01/2023 14:41, Philippe Mathieu-Daudé wrote:

> No need to document magic values when the definition names
> from "standard-headers/linux/pci_regs.h" are self-explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci-host/grackle.c  |  2 +-
>   hw/pci-host/raven.c    |  6 +++---
>   hw/pci-host/uninorth.c | 30 +++++++++++-------------------
>   3 files changed, 15 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
> index 95945ac0f4..2a45cc13c3 100644
> --- a/hw/pci-host/grackle.c
> +++ b/hw/pci-host/grackle.c
> @@ -91,7 +91,7 @@ static void grackle_init(Object *obj)
>   
>   static void grackle_pci_realize(PCIDevice *d, Error **errp)
>   {
> -    d->config[0x09] = 0x01;
> +    d->config[PCI_CLASS_PROG] = 0x01;
>   }
>   
>   static void grackle_pci_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
> index 7a105e4a63..c47259a851 100644
> --- a/hw/pci-host/raven.c
> +++ b/hw/pci-host/raven.c
> @@ -329,9 +329,9 @@ static void raven_realize(PCIDevice *d, Error **errp)
>       char *filename;
>       int bios_size = -1;
>   
> -    d->config[0x0C] = 0x08; // cache_line_size
> -    d->config[0x0D] = 0x10; // latency_timer
> -    d->config[0x34] = 0x00; // capabilities_pointer
> +    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
> +    d->config[PCI_LATENCY_TIMER] = 0x10;
> +    d->config[PCI_CAPABILITY_LIST] = 0x00;
>   
>       memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZE,
>                                        &error_fatal);
> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
> index 8396c91d59..342baff12a 100644
> --- a/hw/pci-host/uninorth.c
> +++ b/hw/pci-host/uninorth.c
> @@ -277,11 +277,11 @@ static void pci_unin_internal_init(Object *obj)
>   static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
>   {
>       /* cache_line_size */
> -    d->config[0x0C] = 0x08;
> +    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
>       /* latency_timer */
> -    d->config[0x0D] = 0x10;
> +    d->config[PCI_LATENCY_TIMER] = 0x10;
>       /* capabilities_pointer */
> -    d->config[0x34] = 0x00;
> +    d->config[PCI_CAPABILITY_LIST] = 0x00;
>   
>       /*
>        * Set kMacRISCPCIAddressSelect (0x48) register to indicate PCI
> @@ -296,30 +296,22 @@ static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
>   
>   static void unin_agp_pci_host_realize(PCIDevice *d, Error **errp)
>   {
> -    /* cache_line_size */
> -    d->config[0x0C] = 0x08;
> -    /* latency_timer */
> -    d->config[0x0D] = 0x10;
> -    /* capabilities_pointer
> -    d->config[0x34] = 0x80; */
> +    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
> +    d->config[PCI_LATENCY_TIMER] = 0x10;
> +    /* d->config[PCI_CAPABILITY_LIST] = 0x80; */
>   }
>   
>   static void u3_agp_pci_host_realize(PCIDevice *d, Error **errp)
>   {
> -    /* cache line size */
> -    d->config[0x0C] = 0x08;
> -    /* latency timer */
> -    d->config[0x0D] = 0x10;
> +    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
> +    d->config[PCI_LATENCY_TIMER] = 0x10;
>   }
>   
>   static void unin_internal_pci_host_realize(PCIDevice *d, Error **errp)
>   {
> -    /* cache_line_size */
> -    d->config[0x0C] = 0x08;
> -    /* latency_timer */
> -    d->config[0x0D] = 0x10;
> -    /* capabilities_pointer */
> -    d->config[0x34] = 0x00;
> +    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
> +    d->config[PCI_LATENCY_TIMER] = 0x10;
> +    d->config[PCI_CAPABILITY_LIST] = 0x00;
>   }
>   
>   static void unin_main_pci_host_class_init(ObjectClass *klass, void *data)

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

