Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A905BBF8A
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:46:24 +0200 (CEST)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0FC-0007JI-Vw
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0D3-00059F-3O
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:44:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0D1-0007C0-GI
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dHIGhl1LLWAw/9JRKhihedXKiE7b3tys/aawgKjMmXA=; b=cbzKeDQueIITdgHqw/cAK0JV6d
 yULGlHXqDsLtv3JDLnzIutyucqgnPNk5LADzb+Uy0IB/YMhrCgG7h7uNR5vl1irEKG895kC/L6U+f
 BbicUaEbDXAvivspbOEdbxKYAoZ7zcG3UfoBpBaBiqUvbAtzIPgqXjFCa0lbvc2YPFGvM7hldjM/L
 UDejzotTqs/ergAlXdIczNVImAbHQK3XjPUBz/wm8uNr8IwsAujl6gEhi2e+1qzGtRk7izGcvy1G0
 pJyh6C22PGJvUnCIopxIBRFb+Xx6+eJFzIsLjX9KI8wUGuVeOI9FagfZ3vdZ89piH8fErxC9aT8F2
 WM3QTq392pAXPg2qD6IElJXWohoWRHEWglJ5ZIzOo+LzvQYb5vbSM646RMflME4C9MNXeJe0xeiW9
 VpYQOh21OUGPVMPOLPiH630iVx9qjGMMf55SDnU4wI/IUck/fK+fknOVn5j1RtLhy5PAMCdgFvRFM
 ig24ArF+/QQZJv2SEFe5X93fbWK2MirOxYv/md8HwH3mwrHtMrC4Pn5ynXzdLCyNuPGVk0x+BV0lK
 x63ZOkp91hm3yTDxTEHbbYTo/lBVV2GFSRYJ5nlbFzfD4yKSsdNbyACUQ8MgRzEU3Sabzr7eqIDa9
 ZBv/PmVgsOrGusruvImWI63n8E1jveXtDMfAXlV9M=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0BL-0007SF-K1; Sun, 18 Sep 2022 20:42:24 +0100
Message-ID: <ab19614f-610a-5c65-858c-29a93d4ed282@ilande.co.uk>
Date: Sun, 18 Sep 2022 20:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-15-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220901162613.6939-15-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 14/42] hw/isa/piix3: Modernize reset handling
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.657,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/09/2022 17:25, Bernhard Beschow wrote:

> Rather than registering the reset handler via a function which
> appends the handler to a global list, prefer to implement it as
> a virtual method - PIIX4 does the same already.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index c8c2dd6048..0350f70706 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -31,7 +31,6 @@
>   #include "hw/qdev-properties.h"
>   #include "hw/isa/isa.h"
>   #include "hw/xen/xen.h"
> -#include "sysemu/reset.h"
>   #include "sysemu/runstate.h"
>   #include "migration/vmstate.h"
>   #include "hw/acpi/acpi_aml_interface.h"
> @@ -156,9 +155,9 @@ static void piix3_write_config_xen(PCIDevice *dev,
>       piix3_write_config(dev, address, val, len);
>   }
>   
> -static void piix3_reset(void *opaque)
> +static void piix3_reset(DeviceState *dev)
>   {
> -    PIIX3State *d = opaque;
> +    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
>       uint8_t *pci_conf = d->dev.config;
>   
>       pci_conf[0x04] = 0x07; /* master, memory and I/O */
> @@ -321,8 +320,6 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
>       memory_region_add_subregion_overlap(pci_address_space_io(dev),
>                                           PIIX_RCR_IOPORT, &d->rcr_mem, 1);
>   
> -    qemu_register_reset(piix3_reset, d);
> -
>       i8257_dma_init(isa_bus, 0);
>   
>       /* RTC */
> @@ -397,6 +394,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
>       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>       AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
>   
> +    dc->reset       = piix3_reset;
>       dc->desc        = "ISA bridge";
>       dc->vmsd        = &vmstate_piix3;
>       dc->hotpluggable   = false;

One minor point to be aware of here is that qdev reset is a PCI bus level reset 
compared with the existing qemu_register_reset() which is a machine level reset. What 
this means is that dc->reset can also be called writing to the relevant configuration 
space register on a PCI bridge - it may not be an issue here, but worth a mention.


ATB,

Mark.

