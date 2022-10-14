Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDD05FEB52
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 11:08:29 +0200 (CEST)
Received: from localhost ([::1]:52022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojGg8-0007wz-Hu
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 05:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGcq-00064C-Cm; Fri, 14 Oct 2022 05:05:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGck-00035g-NF; Fri, 14 Oct 2022 05:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p8OIulqIhHz5Xx3zNWGfT7JGDKCbNmKQneu0LBNYpCE=; b=k/rxKc8EI9/xWjHhezLWShvA+R
 ueKf5GqwdgO+B4kt4Jf00wp3LhvdzP6WVdztQMcEfDKClRzZ70xUqXMTCtSeV6zEU/0FdrAgBquoK
 gaP88qekQnzVXpIGP38dgV9busndtX01+genwlBvM/c1dzcQERSrCm1oV789h7e5KXQ+6XuDz3+lR
 i68S+Bm+KL5Y5oYbPkl/yg3BxEBX3kgzPCgHksrXQ35MNwPU+qHXE8J2+G9EeHYYQCto8TQkeNsxL
 njC1Me1Cq+ahzZefsj5F/+ovCUXPjhrU/25R8z2mXc8WxlbGR0GADXBUzbgoFGo10KErkGZyobSS7
 axKk4GdSTqhPOT7EOUoP3U2V7IPzdPJkJjiGYqViXrvF3DIYdA9/ZP7f3wckGgRswvEpCMVwJc9Yg
 RUJUzHOJC58Q8oGspFmL1JIvImOk7T9ug/WcSrJ9lzVgRpg7eVjoPlpwmmwb970gyAYoUhKfoVH6e
 wUSt2dGoxhiiagMHQxSBuTL/F70ssgxfRhcEe5eOWchzbGH8jYMDDLM4/XhF85odXLMw1uOGn+X26
 UxqPXY/59TrCC9xys13KfCea8XqLZ7JGuhFmfb3GlwQy7FN+oij+7FchWDH91NwKh2sBNWyh9zVkP
 /Ova8xv+ETeXkbIu2tVasHoJvLCQVpoeYCP5aILLA=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGat-0001Ok-PV; Fri, 14 Oct 2022 10:03:07 +0100
Message-ID: <ca4fe34c-f384-195e-c2c2-273e655174be@ilande.co.uk>
Date: Fri, 14 Oct 2022 10:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1664827008.git.balaton@eik.bme.hu>
 <f3ed20267d28e7b1f91b83b9bbfae1a6f4e4c133.1664827008.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <f3ed20267d28e7b1f91b83b9bbfae1a6f4e4c133.1664827008.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 06/13] mac_newworld: Clean up creation of Uninorth
 devices
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
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

On 03/10/2022 21:13, BALATON Zoltan wrote:

> Map regions in ascending order and reorganise code a bit to avoid some
> casts and move Uninorth parts together.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 38 ++++++++++++++++++--------------------
>   1 file changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 73b01e8c6d..be2cb5f057 100644
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
> @@ -275,24 +268,31 @@ static void ppc_core99_init(MachineState *machine)
>           }
>       }
>   
> +    /* UniN init */
> +    s = SYS_BUS_DEVICE(qdev_new(TYPE_UNI_NORTH));
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    memory_region_add_subregion(get_system_memory(), 0xf8000000,
> +                                sysbus_mmio_get_region(s, 0));
> +
> +
>       if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
> +        machine_arch = ARCH_MAC99_U3;
>           /* 970 gets a U3 bus */
>           /* Uninorth AGP bus */
>           dev = qdev_new(TYPE_U3_AGP_HOST_BRIDGE);
> -        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>           uninorth_pci = U3_AGP_HOST_BRIDGE(dev);
>           s = SYS_BUS_DEVICE(dev);
> +        sysbus_realize_and_unref(s, &error_fatal);
> +        sysbus_mmio_map(s, 0, 0xf0800000);
> +        sysbus_mmio_map(s, 1, 0xf0c00000);
>           /* PCI hole */
> -        memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
> +        memory_region_add_subregion(get_system_memory(), 0x80000000,
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
>           uninorth_agp_dev = qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
> @@ -309,22 +309,20 @@ static void ppc_core99_init(MachineState *machine)
>           sysbus_mmio_map(s, 0, 0xf4800000);
>           sysbus_mmio_map(s, 1, 0xf4c00000);
>   
> -        /* Uninorth main bus */
> +        /* Uninorth main bus - this must be last to make it the default */
>           dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
>           qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
> -        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>           uninorth_pci = UNI_NORTH_PCI_HOST_BRIDGE(dev);
>           s = SYS_BUS_DEVICE(dev);
> +        sysbus_realize_and_unref(s, &error_fatal);
> +        sysbus_mmio_map(s, 0, 0xf2800000);
> +        sysbus_mmio_map(s, 1, 0xf2c00000);
>           /* PCI hole */
> -        memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
> +        memory_region_add_subregion(get_system_memory(), 0x80000000,
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

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

