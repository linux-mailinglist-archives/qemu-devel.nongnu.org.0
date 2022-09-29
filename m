Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE7D5EF048
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:22:26 +0200 (CEST)
Received: from localhost ([::1]:36474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odooL-0006H1-On
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odo8r-0003lp-CT; Thu, 29 Sep 2022 03:39:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odo8p-0007Sl-Me; Thu, 29 Sep 2022 03:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UGkz0tDBiR7v4VTYPIl9NbqXb6odMR264V7ozhtPATo=; b=RQCyC0hHapwY9cz4ZnFHnk5j5f
 g1hxSJy0j6yAoXBcrXdtCqbWz5MJYIEXOnogeiIKwce/QQygvVsl5lfJ6gsc8o33pIEoJ1fp3DVoG
 PC8fC6I21a05nHxGPRDoMVjF+rqJZZc4jTmKYQV6Nd9ceGfDhyUnegAeu0L0IpxgoustJw150bGev
 +DvOzgsA+2ITyJAhnAdQW13ego60nWx6aBjmIrk4/aQsTfnEHYdcDN+VKEsWN9JVZDcCLTGLaPFgA
 gN7028Q2UClO77icMZjfNA4S6ks58CbRTQyzAhAU5IYsCfqfQMkGy0h1HrnKvi5elmr++I7c2kl9B
 27cU330GuaT95cZiijcX8y5tBn584DazjVQuXWZLmLMF8LssjB5TrdH8V4zrX+lJb8DMjTMg2FvCC
 DfQ6JHwMH71aZl5lwHcwlVJZsbz62iC4doEDTXhSz0Cv50CnLUSMVShx7kw+Bo/13LA9YAVNYEGoQ
 an6Y7E+WcUs4moU09fZ+yx7ST0Lb+qlxX9Is2iMIuCbiDQH7CaNd9hkIUAbWnNfpky5r0nY8jwMNm
 LNzTEXkmAhrIAwT8rNJSoVYbiszX78ibZIXYxYpSMbaJ6jW0FdR1QZtX/uBK0uRtbgHC0kzDqK0YR
 wpnVTLm2ZZ6tvuPWk56hhCwh7DII470IRjMJm/Jn0=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odo71-000BfY-Rq; Thu, 29 Sep 2022 08:37:44 +0100
Message-ID: <fbb38c03-6092-78e2-c1af-e37f1674bad4@ilande.co.uk>
Date: Thu, 29 Sep 2022 08:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <4a039abeeddcc6c987065ca526c6fa0457784615.1664108862.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <4a039abeeddcc6c987065ca526c6fa0457784615.1664108862.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 06/13] mac_newworld: Simplify creation of Uninorth
 devices
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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

On 25/09/2022 13:38, BALATON Zoltan wrote:

> Avoid open coding sysbus_mmio_map() and map regions in ascending
> otder. Reorganise code a bit to avoid some casts.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 42 +++++++++++++++++-------------------------
>   1 file changed, 17 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 6bc3bd19be..b4ad43cc05 100644
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
> -
>       openpic_irqs = g_new0(IrqLines, machine->smp.cpus);
>       for (i = 0; i < machine->smp.cpus; i++) {
>           /* Mac99 IRQ connection between OpenPIC outputs pins
> @@ -275,24 +268,27 @@ static void ppc_core99_init(MachineState *machine)
>           }
>       }
>   
> +    /* UniN init */
> +    s = SYS_BUS_DEVICE(qdev_new(TYPE_UNI_NORTH));
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    sysbus_mmio_map(s, 0, 0xf8000000);
> +
>       if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
> +        machine_arch = ARCH_MAC99_U3;
>           /* 970 gets a U3 bus */
>           /* Uninorth AGP bus */
>           dev = qdev_new(TYPE_U3_AGP_HOST_BRIDGE);
> -        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>           uninorth_pci = U3_AGP_HOST_BRIDGE(dev);
>           s = SYS_BUS_DEVICE(dev);
> -        /* PCI hole */
> -        memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
> -                                    sysbus_mmio_get_region(s, 2));
> -        /* Register 8 MB of ISA IO space */
> -        memory_region_add_subregion(get_system_memory(), 0xf2000000,
> -                                    sysbus_mmio_get_region(s, 3));
> +        sysbus_realize_and_unref(s, &error_fatal);
>           sysbus_mmio_map(s, 0, 0xf0800000);
>           sysbus_mmio_map(s, 1, 0xf0c00000);
> -
> -        machine_arch = ARCH_MAC99_U3;
> +        /* PCI hole */
> +        sysbus_mmio_map(s, 2, 0x80000000);
> +        /* Register 8 MB of ISA IO space */
> +        sysbus_mmio_map(s, 3, 0xf2000000);
>       } else {
> +        machine_arch = ARCH_MAC99;
>           /* Use values found on a real PowerMac */
>           /* Uninorth AGP bus */
>           uninorth_agp_dev = qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
> @@ -312,19 +308,15 @@ static void ppc_core99_init(MachineState *machine)
>           /* Uninorth main bus */
>           dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
>           qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
> -        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>           uninorth_pci = UNI_NORTH_PCI_HOST_BRIDGE(dev);
>           s = SYS_BUS_DEVICE(dev);
> -        /* PCI hole */
> -        memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
> -                                    sysbus_mmio_get_region(s, 2));
> -        /* Register 8 MB of ISA IO space */
> -        memory_region_add_subregion(get_system_memory(), 0xf2000000,
> -                                    sysbus_mmio_get_region(s, 3));
> +        sysbus_realize_and_unref(s, &error_fatal);
>           sysbus_mmio_map(s, 0, 0xf2800000);
>           sysbus_mmio_map(s, 1, 0xf2c00000);
> -
> -        machine_arch = ARCH_MAC99;
> +        /* PCI hole */
> +        sysbus_mmio_map(s, 2, 0x80000000);
> +        /* Register 8 MB of ISA IO space */
> +        sysbus_mmio_map(s, 3, 0xf2000000);
>       }
>   
>       machine->usb |= defaults_enabled() && !machine->usb_disabled;

Same comment here re: sysbus. Also the patch seems correct here, but it is worth 
noting that the PCI bus initialisation is order sensitive: the last bus created is 
the one that becomes the default PCI bus for -device, so changing this would break 
quite a few command lines...


ATB,

Mark.

