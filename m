Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861C55BBFC2
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:22:32 +0200 (CEST)
Received: from localhost ([::1]:47498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0o8-00028I-CR
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0n4-0000nz-HA
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:21:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0n2-0003tr-Kx
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kzj4NSunFo11w1Q+kjrxcE1BrXiJQNISidsVIVvQL+g=; b=1wBaDYZQEkvImfngoYuOQBCZfV
 Wb6tqy/Pl8NGa2bUhE+VaSy0iZeF5jpRSnyjxHbAlJ4sZAel6NYCd904qAQoliiiy36E7kEeogpDG
 CpD9GZd/y1VNCqt0GPyxHeywL89UeulZSIU5edAQbCM/pBH8Ywu3zlHEh4kK7noQ6xPiCRWBBUZ+W
 S6qETF9YB0zAMO4zvsH1JRycJ6a0gRm5DQ+WoNydtaFEIpeEQRXqyX0ouoWXxw3Ss4hH1Luq58Tyu
 jjc0bH3HgU8G0eUP9lVA5iDfbPSZGooVPvNlZN+a2I/CDkkaIxU53/kubDhIlugwExRpmH9fo7/wj
 HPFGWAN1qfLv2iBfI/nSqHWZ9ht6mX9lcFluCFbpxa1XcXpwWPWAL6LI6oRdtubgqE+nWl/5pinGA
 hObRb8AU3Ic057oUWWcxYwNCeHUppg5gcEYmwdtIY7TgqKKV4EZNb5gtYiZ8pTIpeQEVQ0ivIxv1f
 6Npk7IzPOJeqHSBY3S0ax5zn/1kytx1vkYUAKGxsMQlwvBEZVX/NLgQ9uPP2glUYYkZKhBaLpyhlJ
 wvGdFTjyV2lcL2pf5EIJBQNdqvejI7DSK+m6yixLY5LzGUulYqbxqyVjVUjFy14PZxx+wGjgMxGqS
 ESen/AqKNsmRQt2hTlfsnQRllBFNU36LhVs5qqQys=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0lI-0007YT-2H; Sun, 18 Sep 2022 21:19:32 +0100
Message-ID: <7464ed32-7dbd-b0a1-26af-4643b5daf6d6@ilande.co.uk>
Date: Sun, 18 Sep 2022 21:21:09 +0100
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
 <20220901162613.6939-40-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220901162613.6939-40-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 39/42] hw/isa/piix: Unexport PIIXState
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

On 01/09/2022 17:26, Bernhard Beschow wrote:

> The - deliberately exported - components can still be accessed
> via QOM properties.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix.c                 | 52 +++++++++++++++++++++++++++++++++
>   include/hw/southbridge/piix.h | 54 -----------------------------------
>   2 files changed, 52 insertions(+), 54 deletions(-)
> 
> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
> index e413d7e792..c503a6e836 100644
> --- a/hw/isa/piix.c
> +++ b/hw/isa/piix.c
> @@ -26,20 +26,72 @@
>   #include "qemu/osdep.h"
>   #include "qemu/range.h"
>   #include "qapi/error.h"
> +#include "qom/object.h"
> +#include "hw/acpi/piix4.h"
>   #include "hw/dma/i8257.h"
> +#include "hw/ide/pci.h"
>   #include "hw/intc/i8259.h"
>   #include "hw/southbridge/piix.h"
>   #include "hw/timer/i8254.h"
>   #include "hw/irq.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/isa/isa.h"
> +#include "hw/pci/pci.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/rtc/mc146818rtc.h"
> +#include "hw/usb/hcd-uhci.h"
>   #include "hw/xen/xen.h"
>   #include "sysemu/runstate.h"
>   #include "migration/vmstate.h"
>   #include "hw/acpi/acpi_aml_interface.h"
>   
> +#define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
>   #define XEN_PIIX_NUM_PIRQS      128ULL
>   
> +struct PIIXState {
> +    PCIDevice dev;
> +
> +    /*
> +     * bitmap to track pic levels.
> +     * The pic level is the logical OR of all the PCI irqs mapped to it
> +     * So one PIC level is tracked by PIIX_NUM_PIRQS bits.
> +     *
> +     * PIRQ is mapped to PIC pins, we track it by
> +     * PIIX_NUM_PIRQS * ISA_NUM_IRQS = 64 bits with
> +     * pic_irq * PIIX_NUM_PIRQS + pirq
> +     */
> +#if ISA_NUM_IRQS * PIIX_NUM_PIRQS > 64
> +#error "unable to encode pic state in 64bit in pic_levels."
> +#endif
> +    uint64_t pic_levels;
> +
> +    /* This member isn't used. Just for save/load compatibility */
> +    int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
> +    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
> +
> +    ISAPICState pic;
> +    RTCState rtc;
> +    PCIIDEState ide;
> +    UHCIState uhci;
> +    PIIX4PMState pm;
> +
> +    uint32_t smb_io_base;
> +
> +    /* Reset Control Register contents */
> +    uint8_t rcr;
> +
> +    /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
> +    MemoryRegion rcr_mem;
> +
> +    bool has_acpi;
> +    bool has_usb;
> +    bool smm_enabled;
> +};
> +typedef struct PIIXState PIIXState;
> +
> +DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
> +                         TYPE_PIIX3_PCI_DEVICE)
> +
>   static void piix_set_irq_pic(PIIXState *piix, int pic_irq)
>   {
>       qemu_set_irq(piix->pic.in_irqs[pic_irq],
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index c9fa0f1aa6..0edc23710c 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -12,14 +12,6 @@
>   #ifndef HW_SOUTHBRIDGE_PIIX_H
>   #define HW_SOUTHBRIDGE_PIIX_H
>   
> -#include "hw/pci/pci.h"
> -#include "qom/object.h"
> -#include "hw/acpi/piix4.h"
> -#include "hw/ide/pci.h"
> -#include "hw/intc/i8259.h"
> -#include "hw/rtc/mc146818rtc.h"
> -#include "hw/usb/hcd-uhci.h"
> -
>   /* PIRQRC[A:D]: PIRQx Route Control Registers */
>   #define PIIX_PIRQCA 0x60
>   #define PIIX_PIRQCB 0x61
> @@ -32,53 +24,7 @@
>    */
>   #define PIIX_RCR_IOPORT 0xcf9
>   
> -#define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
> -
> -struct PIIXState {
> -    PCIDevice dev;
> -
> -    /*
> -     * bitmap to track pic levels.
> -     * The pic level is the logical OR of all the PCI irqs mapped to it
> -     * So one PIC level is tracked by PIIX_NUM_PIRQS bits.
> -     *
> -     * PIRQ is mapped to PIC pins, we track it by
> -     * PIIX_NUM_PIRQS * ISA_NUM_IRQS = 64 bits with
> -     * pic_irq * PIIX_NUM_PIRQS + pirq
> -     */
> -#if ISA_NUM_IRQS * PIIX_NUM_PIRQS > 64
> -#error "unable to encode pic state in 64bit in pic_levels."
> -#endif
> -    uint64_t pic_levels;
> -
> -    /* This member isn't used. Just for save/load compatibility */
> -    int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
> -    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
> -
> -    ISAPICState pic;
> -    RTCState rtc;
> -    PCIIDEState ide;
> -    UHCIState uhci;
> -    PIIX4PMState pm;
> -
> -    uint32_t smb_io_base;
> -
> -    /* Reset Control Register contents */
> -    uint8_t rcr;
> -
> -    /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
> -    MemoryRegion rcr_mem;
> -
> -    bool has_acpi;
> -    bool has_usb;
> -    bool smm_enabled;
> -};
> -typedef struct PIIXState PIIXState;
> -
>   #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
> -DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
> -                         TYPE_PIIX3_PCI_DEVICE)
> -
>   #define TYPE_PIIX3_DEVICE "PIIX3"
>   #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"

I don't think that this is the right way to go here - whilst the definition of public 
and private can be a little vague, the general aim should be for the QOM type struct 
and macros to be in the corresponding .h file and the implementation in the .c file. 
In effect this ensures that anyone who wants to use a TYPE_FOO will include foo.h 
which helps make it easier to keep track of dependencies.

Looking at TYPE_PIIX3_PCI_DEVICE I'm wondering why this couldn't be 
OBJECT_SIMPLE_TYPE instead of DECLARE_INSTANCE_CHECKER with this series?


ATB,

Mark.

