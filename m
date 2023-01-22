Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3184F677167
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 19:16:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJesL-0005Qc-Qz; Sun, 22 Jan 2023 13:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJesJ-0005Pq-OO; Sun, 22 Jan 2023 13:15:27 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJesH-0004wa-TZ; Sun, 22 Jan 2023 13:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+GM7Snovrg9rsOZ29prdapIKGmUJwm+nnlb846/BsUo=; b=PIRoYgqEvJhwuWmaU60eua6RYM
 Byr0ef/Td3GVyGwaouSbsHFQISEWIcDSFWOPAPBdxJOr8ED8xEqzZw93KQrKNS1tLtHOfoCS+pfM4
 vH/MvvPo0fHtiw4NiPJInKBrsiF4kwuxcK/eAn3T7c1RJwQi0UTHCYjUrgE85E4PNwqXBY3lzjafs
 364Z9P04qdCynQihy5UIg3q9s+UudkNaeuxKPsZet4lgV4f6AMi9Jh2p053/z30ZCcrzi14rvjR6g
 f7+GT2V7MphKKyLG4kPVEks9DL0BNNSzHWRtXmW9SopfIB4dLNFG8hYDVRN3f7Cdnvln08MeDCw19
 N82isBaYUV85S0QNfILSyG5bN1AkuDtWBxPjlHrpADYEVFv8Fr/hw+kfLMvH9RI2e1JgH+pYtVnFO
 4MkbL6T33zxESJbx1Rvy5W3tGvtu9ZPLzwggWPQtB/IRAv1Iz+09Nq7f0MCEBxtMqr+zxxYU3joaB
 3Rq86g3DnCZtyI9Ypr4aYR1tOPMXm4pukgB5ut4SZBG8n5d7VxTUMJjvGVBcdvD0FnpmPYwdPeehf
 cr8YFVblg/Ut6LUeWpwArBYaIhaeZUaiOTna6G0UIvm+efwwSstASTDy0JKegldfVpB9pvCyYQKrX
 55BAfbGaI8UyfT2NTIsidhXpHng5BY9peHaCaS/LM=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJern-0006Ef-KI; Sun, 22 Jan 2023 18:14:59 +0000
Message-ID: <d6f87607-37b4-c5f2-4eda-161dffe1bc5b@ilande.co.uk>
Date: Sun, 22 Jan 2023 18:15:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1674001241.git.balaton@eik.bme.hu>
 <6c79d6903fc11e153f8050a374904c2b5d5db585.1674001242.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <6c79d6903fc11e153f8050a374904c2b5d5db585.1674001242.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/4] hw/misc/macio: Rename sysbus_dev to sbd for
 consistency and brevity
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

On 18/01/2023 00:32, BALATON Zoltan wrote:

> Some functions use sysbus_dev while others sbd name for local variable
> storing a sysbus device pointer. Standardise on the shorter name to be
> consistent and make the code easier to read as short name is less
> distracting and needs less line breaks.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c | 78 +++++++++++++++++++------------------------
>   1 file changed, 35 insertions(+), 43 deletions(-)
> 
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index 0dfe372965..4d7223cc85 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -96,14 +96,14 @@ static void macio_bar_setup(MacIOState *s)
>   static void macio_common_realize(PCIDevice *d, Error **errp)
>   {
>       MacIOState *s = MACIO(d);
> -    SysBusDevice *sysbus_dev;
> +    SysBusDevice *sbd;
>   
>       if (!qdev_realize(DEVICE(&s->dbdma), BUS(&s->macio_bus), errp)) {
>           return;
>       }
> -    sysbus_dev = SYS_BUS_DEVICE(&s->dbdma);
> +    sbd = SYS_BUS_DEVICE(&s->dbdma);
>       memory_region_add_subregion(&s->bar, 0x08000,
> -                                sysbus_mmio_get_region(sysbus_dev, 0));
> +                                sysbus_mmio_get_region(sbd, 0));
>   
>       qdev_prop_set_uint32(DEVICE(&s->escc), "disabled", 0);
>       qdev_prop_set_uint32(DEVICE(&s->escc), "frequency", ESCC_CLOCK);
> @@ -122,11 +122,10 @@ static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
>                                 qemu_irq irq0, qemu_irq irq1, int dmaid,
>                                 Error **errp)
>   {
> -    SysBusDevice *sysbus_dev;
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(ide);
>   
> -    sysbus_dev = SYS_BUS_DEVICE(ide);
> -    sysbus_connect_irq(sysbus_dev, 0, irq0);
> -    sysbus_connect_irq(sysbus_dev, 1, irq1);
> +    sysbus_connect_irq(sbd, 0, irq0);
> +    sysbus_connect_irq(sbd, 1, irq1);
>       qdev_prop_set_uint32(DEVICE(ide), "channel", dmaid);
>       object_property_set_link(OBJECT(ide), "dbdma", OBJECT(&s->dbdma),
>                                &error_abort);
> @@ -141,7 +140,7 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
>       OldWorldMacIOState *os = OLDWORLD_MACIO(d);
>       DeviceState *pic_dev = DEVICE(&os->pic);
>       Error *err = NULL;
> -    SysBusDevice *sysbus_dev;
> +    SysBusDevice *sbd;
>   
>       macio_common_realize(d, &err);
>       if (err) {
> @@ -153,33 +152,30 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
>       if (!qdev_realize(DEVICE(&os->pic), BUS(&s->macio_bus), errp)) {
>           return;
>       }
> -    sysbus_dev = SYS_BUS_DEVICE(&os->pic);
> +    sbd = SYS_BUS_DEVICE(&os->pic);
>       memory_region_add_subregion(&s->bar, 0x0,
> -                                sysbus_mmio_get_region(sysbus_dev, 0));
> +                                sysbus_mmio_get_region(sbd, 0));
>   
>       qdev_prop_set_uint64(DEVICE(&s->cuda), "timebase-frequency",
>                            s->frequency);
>       if (!qdev_realize(DEVICE(&s->cuda), BUS(&s->macio_bus), errp)) {
>           return;
>       }
> -    sysbus_dev = SYS_BUS_DEVICE(&s->cuda);
> +    sbd = SYS_BUS_DEVICE(&s->cuda);
>       memory_region_add_subregion(&s->bar, 0x16000,
> -                                sysbus_mmio_get_region(sysbus_dev, 0));
> -    sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
> -                                                       OLDWORLD_CUDA_IRQ));
> +                                sysbus_mmio_get_region(sbd, 0));
> +    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(pic_dev, OLDWORLD_CUDA_IRQ));
>   
> -    sysbus_dev = SYS_BUS_DEVICE(&s->escc);
> -    sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
> -                                                       OLDWORLD_ESCCB_IRQ));
> -    sysbus_connect_irq(sysbus_dev, 1, qdev_get_gpio_in(pic_dev,
> -                                                       OLDWORLD_ESCCA_IRQ));
> +    sbd = SYS_BUS_DEVICE(&s->escc);
> +    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(pic_dev, OLDWORLD_ESCCB_IRQ));
> +    sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(pic_dev, OLDWORLD_ESCCA_IRQ));
>   
>       if (!qdev_realize(DEVICE(&os->nvram), BUS(&s->macio_bus), errp)) {
>           return;
>       }
> -    sysbus_dev = SYS_BUS_DEVICE(&os->nvram);
> +    sbd = SYS_BUS_DEVICE(&os->nvram);
>       memory_region_add_subregion(&s->bar, 0x60000,
> -                                sysbus_mmio_get_region(sysbus_dev, 0));
> +                                sysbus_mmio_get_region(sbd, 0));
>       pmac_format_nvram_partition(&os->nvram, os->nvram.size);
>   
>       /* IDE buses */
> @@ -274,7 +270,7 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
>       NewWorldMacIOState *ns = NEWWORLD_MACIO(d);
>       DeviceState *pic_dev = DEVICE(&ns->pic);
>       Error *err = NULL;
> -    SysBusDevice *sysbus_dev;
> +    SysBusDevice *sbd;
>       MemoryRegion *timer_memory = NULL;
>   
>       macio_common_realize(d, &err);
> @@ -285,16 +281,14 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
>   
>       /* OpenPIC */
>       qdev_prop_set_uint32(pic_dev, "model", OPENPIC_MODEL_KEYLARGO);
> -    sysbus_dev = SYS_BUS_DEVICE(&ns->pic);
> -    sysbus_realize_and_unref(sysbus_dev, &error_fatal);
> +    sbd = SYS_BUS_DEVICE(&ns->pic);
> +    sysbus_realize_and_unref(sbd, &error_fatal);
>       memory_region_add_subregion(&s->bar, 0x40000,
> -                                sysbus_mmio_get_region(sysbus_dev, 0));
> +                                sysbus_mmio_get_region(sbd, 0));
>   
> -    sysbus_dev = SYS_BUS_DEVICE(&s->escc);
> -    sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
> -                                                       NEWWORLD_ESCCB_IRQ));
> -    sysbus_connect_irq(sysbus_dev, 1, qdev_get_gpio_in(pic_dev,
> -                                                       NEWWORLD_ESCCA_IRQ));
> +    sbd = SYS_BUS_DEVICE(&s->escc);
> +    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(pic_dev, NEWWORLD_ESCCB_IRQ));
> +    sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(pic_dev, NEWWORLD_ESCCA_IRQ));
>   
>       /* IDE buses */
>       macio_realize_ide(s, &ns->ide[0],
> @@ -326,27 +320,26 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
>           if (!qdev_realize(DEVICE(&ns->gpio), BUS(&s->macio_bus), errp)) {
>               return;
>           }
> -        sysbus_dev = SYS_BUS_DEVICE(&ns->gpio);
> -        sysbus_connect_irq(sysbus_dev, 1, qdev_get_gpio_in(pic_dev,
> +        sbd = SYS_BUS_DEVICE(&ns->gpio);
> +        sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(pic_dev,
>                              NEWWORLD_EXTING_GPIO1));
> -        sysbus_connect_irq(sysbus_dev, 9, qdev_get_gpio_in(pic_dev,
> +        sysbus_connect_irq(sbd, 9, qdev_get_gpio_in(pic_dev,
>                              NEWWORLD_EXTING_GPIO9));
>           memory_region_add_subregion(&s->bar, 0x50,
> -                                    sysbus_mmio_get_region(sysbus_dev, 0));
> +                                    sysbus_mmio_get_region(sbd, 0));
>   
>           /* PMU */
>           object_initialize_child(OBJECT(s), "pmu", &s->pmu, TYPE_VIA_PMU);
> -        object_property_set_link(OBJECT(&s->pmu), "gpio", OBJECT(sysbus_dev),
> +        object_property_set_link(OBJECT(&s->pmu), "gpio", OBJECT(sbd),
>                                    &error_abort);
>           qdev_prop_set_bit(DEVICE(&s->pmu), "has-adb", ns->has_adb);
>           if (!qdev_realize(DEVICE(&s->pmu), BUS(&s->macio_bus), errp)) {
>               return;
>           }
> -        sysbus_dev = SYS_BUS_DEVICE(&s->pmu);
> -        sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
> -                                                           NEWWORLD_PMU_IRQ));
> +        sbd = SYS_BUS_DEVICE(&s->pmu);
> +        sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(pic_dev, NEWWORLD_PMU_IRQ));
>           memory_region_add_subregion(&s->bar, 0x16000,
> -                                    sysbus_mmio_get_region(sysbus_dev, 0));
> +                                    sysbus_mmio_get_region(sbd, 0));
>       } else {
>           object_unparent(OBJECT(&ns->gpio));
>   
> @@ -358,11 +351,10 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
>           if (!qdev_realize(DEVICE(&s->cuda), BUS(&s->macio_bus), errp)) {
>               return;
>           }
> -        sysbus_dev = SYS_BUS_DEVICE(&s->cuda);
> -        sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
> -                                                           NEWWORLD_CUDA_IRQ));
> +        sbd = SYS_BUS_DEVICE(&s->cuda);
> +        sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(pic_dev, NEWWORLD_CUDA_IRQ));
>           memory_region_add_subregion(&s->bar, 0x16000,
> -                                    sysbus_mmio_get_region(sysbus_dev, 0));
> +                                    sysbus_mmio_get_region(sbd, 0));
>       }
>   }

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

