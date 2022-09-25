Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225905E91C4
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:10:17 +0200 (CEST)
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNeR-0006JK-Oe
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNSG-0006Ys-6Y; Sun, 25 Sep 2022 04:57:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNSE-0001Oe-DF; Sun, 25 Sep 2022 04:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JeJIpk5b/+8a625thU0sl8vJm/IkcqRtBbG2P5AAYj4=; b=Qao+9DOPFFL6q/M8oAfMvCe8ne
 X27WS/pXjtD7st+oFNNL56XQ81XFsoA75jNrQjOO6FJXkR5RAS7YDPDktkZjDISF3gb0KXwtSObNW
 DvLrzchcuT0iWSRgO1F7MiPVGXT6OIyFcR8KT19GesN+dhDThKfnFVAmOCPFbXKHBLESWOB9uFZEv
 0flO4j8HhOHevLJGWG0+j6NAse3j/+qmcKIo1DMDeSJMI+zcoengH7h/SFuVoyMy2HaAIBEeaRogB
 NfqlWWwBi+khBjPWjcfc6Ce8vK3/I7As0yL6QN9ux5JaUeIIbPLgYbWMIvlID3+k5TW3PYx6CNN2H
 jJcVIj14MWGEtXG4W2SGZM0wAzQX0BKr/FlIWwt/HGpz7z9hlmttzPC1eHK1kIGUJrRRqeQSj1f3A
 BOjb5gKCdS9p2qTqIgpE60PCeEoktdLF/g3WknIq8lay8bGF7lJSqdRRxyAQRaLrUlipTNa1Prwoi
 hredp6M0FakSuHY+uLCb8hU3Y+t8esfDInic/qM411PWbkIbQY/rGTpRZE33/DZotDc+N1mEj22iN
 faMPig/1r/krhXWZ4fzHO70GIt2PbEsWYeXK3H8eho3lfr+u5M+bGCEm1w+lHN7jKG3uu4xbO6Fh8
 OOubla80SgR/nLfhVr2PvOPV+lNOfOFj8MjJthhcw=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNQU-0006q0-Ae; Sun, 25 Sep 2022 09:55:54 +0100
Message-ID: <4b295acb-302b-657f-736b-c8c36a4bc3db@ilande.co.uk>
Date: Sun, 25 Sep 2022 09:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <29ab3c7737866916760f824547bd1beed0c6806b.1663368422.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <29ab3c7737866916760f824547bd1beed0c6806b.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 04/10] mac_newworld: Simplify creation of Uninorth devices
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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

On 17/09/2022 00:07, BALATON Zoltan wrote:

> Avoid open coding sysbus_create_simple where not necessary and
> reorganise code a bit to avoid some casts to make the code more
> readable.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 50 ++++++++++++++++---------------------------
>   1 file changed, 19 insertions(+), 31 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 6bc3bd19be..1038477793 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -228,13 +228,6 @@ static void ppc_core99_init(MachineState *machine)
>           }
>       }
>   
> -    /* UniN init */
> -    dev = qdev_new(TYPE_UNI_NORTH);
> -    s = SYS_BUS_DEVICE(dev);
> -    sysbus_realize_and_unref(s, &error_fatal);
> -    memory_region_add_subregion(get_system_memory(), 0xf8000000,
> -                                sysbus_mmio_get_region(s, 0));

Curious - is there a reason that the initialisation of UniNorth is moved to later in 
the file?

>       openpic_irqs = g_new0(IrqLines, machine->smp.cpus);
>       for (i = 0; i < machine->smp.cpus; i++) {
>           /* Mac99 IRQ connection between OpenPIC outputs pins
> @@ -275,56 +268,51 @@ static void ppc_core99_init(MachineState *machine)
>           }
>       }
>   
> +    /* UniN init */
> +    sysbus_create_simple(TYPE_UNI_NORTH, 0xf8000000, NULL);
> +

I've had a look at sysbus_create_simple() as I'm not overly familiar with it, but 
this is one to add to the legacy functions we really shouldn't be using these days.

Obvious flaws from looking at the code are i) it attempts to map/wire devices in a 
_simple() function in contrast to all the other _simple() functions and ii) it 
assumes that properties are ordered (we can't guarantee this, as per the current 
array property breakage). So please keep this as-is.

>       if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
> +        machine_arch = ARCH_MAC99_U3;
>           /* 970 gets a U3 bus */
>           /* Uninorth AGP bus */
> -        dev = qdev_new(TYPE_U3_AGP_HOST_BRIDGE);
> -        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -        uninorth_pci = U3_AGP_HOST_BRIDGE(dev);
> -        s = SYS_BUS_DEVICE(dev);
> +        s = SYS_BUS_DEVICE(sysbus_create_simple(TYPE_U3_AGP_HOST_BRIDGE,
> +                                                0xf0800000, NULL));
> +        uninorth_pci = U3_AGP_HOST_BRIDGE(s);
> +        sysbus_mmio_map(s, 1, 0xf0c00000);
>           /* PCI hole */
>           memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
>                                       sysbus_mmio_get_region(s, 2));
>           /* Register 8 MB of ISA IO space */
>           memory_region_add_subregion(get_system_memory(), 0xf2000000,
>                                       sysbus_mmio_get_region(s, 3));
> -        sysbus_mmio_map(s, 0, 0xf0800000);
> -        sysbus_mmio_map(s, 1, 0xf0c00000);
> -
> -        machine_arch = ARCH_MAC99_U3;
>       } else {
> +        machine_arch = ARCH_MAC99;
>           /* Use values found on a real PowerMac */
>           /* Uninorth AGP bus */
> -        uninorth_agp_dev = qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
> -        s = SYS_BUS_DEVICE(uninorth_agp_dev);
> -        sysbus_realize_and_unref(s, &error_fatal);
> -        sysbus_mmio_map(s, 0, 0xf0800000);
> -        sysbus_mmio_map(s, 1, 0xf0c00000);
> +        uninorth_agp_dev = sysbus_create_simple(TYPE_UNI_NORTH_AGP_HOST_BRIDGE,
> +                                                0xf0800000, NULL);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(uninorth_agp_dev), 1, 0xf0c00000);

Yeah sysbus_create_simple() makes this uglier.

>           /* Uninorth internal bus */
> -        uninorth_internal_dev = qdev_new(
> -                                TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE);
> -        s = SYS_BUS_DEVICE(uninorth_internal_dev);
> -        sysbus_realize_and_unref(s, &error_fatal);
> -        sysbus_mmio_map(s, 0, 0xf4800000);
> -        sysbus_mmio_map(s, 1, 0xf4c00000);
> +        uninorth_internal_dev = sysbus_create_simple(
> +                                       TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE,
> +                                                     0xf4800000, NULL);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(uninorth_internal_dev), 1, 0xf4c00000);
>   
>           /* Uninorth main bus */
>           dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
>           qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
> -        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>           uninorth_pci = UNI_NORTH_PCI_HOST_BRIDGE(dev);
>           s = SYS_BUS_DEVICE(dev);
> +        sysbus_realize_and_unref(s, &error_fatal);
> +        sysbus_mmio_map(s, 0, 0xf2800000);
> +        sysbus_mmio_map(s, 1, 0xf2c00000);
>           /* PCI hole */
>           memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
>                                       sysbus_mmio_get_region(s, 2));
>           /* Register 8 MB of ISA IO space */
>           memory_region_add_subregion(get_system_memory(), 0xf2000000,
>                                       sysbus_mmio_get_region(s, 3));
> -        sysbus_mmio_map(s, 0, 0xf2800000);
> -        sysbus_mmio_map(s, 1, 0xf2c00000);
> -
> -        machine_arch = ARCH_MAC99;
>       }
>   
>       machine->usb |= defaults_enabled() && !machine->usb_disabled;

ATB,

Mark.

