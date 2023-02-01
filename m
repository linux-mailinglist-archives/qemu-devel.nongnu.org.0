Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2621468712E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 23:46:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNLqh-0006xU-GE; Wed, 01 Feb 2023 17:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNLqc-0006x8-55; Wed, 01 Feb 2023 17:44:58 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNLqa-0000U8-Cl; Wed, 01 Feb 2023 17:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YTGSBf85BmIRgx4px/ouZXQ81PYr8iXeQ5xnTf/0M7k=; b=p1fXZC0ucZSQi8NYCvvtKmoG/o
 ok6DlZhz4WwS9Op4I3z/Dlt0y69/0WhnXLtTLyXDqZU3D0yIAGfI4UdHPndBZe4H86oYHHfcOrCZI
 5kaxuYy2ns9HpMYLgubWmMQ959E7UIx9byvVT1IuR6RobGlxfde0AipRUXJBlrkktDliWABuFpwcU
 eHaOfHgyTPViMZyp5q4hXje8MFI4DVFPFS4x6naD3r3f7TBynZnMXvBRpvYZKPXbzhgdPEBcXrSRB
 Fl+aF8Y2wfUCJn7X3ZhQjkPa6yZhtTH8+3jJVZg55oHEyMwvwaQc76c2VUCiOQ8cptROgntX8CdiG
 qSBYLdrePoFIkdJ8lrGOSabGcfuBga1KLr2XyFCRAgKE1bds9Rqt4IU1lkGIfWohM5oYFH/FkFx77
 Z5FZoNjYPj+CcxhLa7Y9PhaTqxMqVIex3p1npQwDyGbuInPSwHSy/5FN1ZcscyMvEjmi00HTuoUBO
 Kd9XveQzyqlh/Tw2DDE0xPG/lFQHccEsks4F9MerE0loOSxOP7u7iTH+QKR5ejqdZQh0En7OK/ga+
 dwf3jVm+TMHQuDCzV/so/05LUPKsQSgiDrFqy4L+Ts2fqD2Cd3blca5hiZW4XykYsJ7mxY6uZNOT3
 ob7ARHzAownOVSPRhbXsKo5aOrbRdlUI+D5qWoy8M=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNLq0-0005Ta-P0; Wed, 01 Feb 2023 22:44:24 +0000
Message-ID: <4b311eb7-4dc8-2a44-0c2c-8bc40131f9eb@ilande.co.uk>
Date: Wed, 1 Feb 2023 22:44:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1674001241.git.balaton@eik.bme.hu>
 <bfce0751e82b031f5e6fb3c32cfbce6325434400.1674001242.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <bfce0751e82b031f5e6fb3c32cfbce6325434400.1674001242.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 4/4] hw/misc/macio: Return bool from functions taking errp
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

> Use the convention to return bool from functions which take an error
> pointer which allows for callers to pass through their error pointer
> without needing a local.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c | 62 +++++++++++++++++--------------------------
>   1 file changed, 25 insertions(+), 37 deletions(-)
> 
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index ae2a9a960d..265c0bbd8d 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -90,13 +90,13 @@ static void macio_bar_setup(MacIOState *s)
>       macio_escc_legacy_setup(s);
>   }
>   
> -static void macio_common_realize(PCIDevice *d, Error **errp)
> +static bool macio_common_realize(PCIDevice *d, Error **errp)
>   {
>       MacIOState *s = MACIO(d);
>       SysBusDevice *sbd;
>   
>       if (!qdev_realize(DEVICE(&s->dbdma), BUS(&s->macio_bus), errp)) {
> -        return;
> +        return false;
>       }
>       sbd = SYS_BUS_DEVICE(&s->dbdma);
>       memory_region_add_subregion(&s->bar, 0x08000,
> @@ -108,14 +108,16 @@ static void macio_common_realize(PCIDevice *d, Error **errp)
>       qdev_prop_set_uint32(DEVICE(&s->escc), "chnBtype", escc_serial);
>       qdev_prop_set_uint32(DEVICE(&s->escc), "chnAtype", escc_serial);
>       if (!qdev_realize(DEVICE(&s->escc), BUS(&s->macio_bus), errp)) {
> -        return;
> +        return false;
>       }
>   
>       macio_bar_setup(s);
>       pci_register_bar(d, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->bar);
> +
> +    return true;
>   }
>   
> -static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
> +static bool macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
>                                 qemu_irq irq0, qemu_irq irq1, int dmaid,
>                                 Error **errp)
>   {
> @@ -128,7 +130,7 @@ static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
>                                &error_abort);
>       macio_ide_register_dma(ide);
>   
> -    qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
> +    return qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
>   }
>   
>   static void macio_oldworld_realize(PCIDevice *d, Error **errp)
> @@ -136,12 +138,9 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
>       MacIOState *s = MACIO(d);
>       OldWorldMacIOState *os = OLDWORLD_MACIO(d);
>       DeviceState *pic_dev = DEVICE(&os->pic);
> -    Error *err = NULL;
>       SysBusDevice *sbd;
>   
> -    macio_common_realize(d, &err);
> -    if (err) {
> -        error_propagate(errp, err);
> +    if (!macio_common_realize(d, errp)) {
>           return;
>       }
>   
> @@ -176,21 +175,17 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
>       pmac_format_nvram_partition(&os->nvram, os->nvram.size);
>   
>       /* IDE buses */
> -    macio_realize_ide(s, &os->ide[0],
> -                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_IRQ),
> -                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_DMA_IRQ),
> -                      0x16, &err);
> -    if (err) {
> -        error_propagate(errp, err);
> +    if (!macio_realize_ide(s, &os->ide[0],
> +                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_IRQ),
> +                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_DMA_IRQ),
> +                           0x16, errp)) {
>           return;
>       }
>   
> -    macio_realize_ide(s, &os->ide[1],
> -                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_IRQ),
> -                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_DMA_IRQ),
> -                      0x1a, &err);
> -    if (err) {
> -        error_propagate(errp, err);
> +    if (!macio_realize_ide(s, &os->ide[1],
> +                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_IRQ),
> +                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_DMA_IRQ),
> +                           0x1a, errp)) {
>           return;
>       }
>   }
> @@ -266,13 +261,10 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
>       MacIOState *s = MACIO(d);
>       NewWorldMacIOState *ns = NEWWORLD_MACIO(d);
>       DeviceState *pic_dev = DEVICE(&ns->pic);
> -    Error *err = NULL;
>       SysBusDevice *sbd;
>       MemoryRegion *timer_memory = NULL;
>   
> -    macio_common_realize(d, &err);
> -    if (err) {
> -        error_propagate(errp, err);
> +    if (!macio_common_realize(d, errp)) {
>           return;
>       }
>   
> @@ -288,21 +280,17 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
>       sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(pic_dev, NEWWORLD_ESCCA_IRQ));
>   
>       /* IDE buses */
> -    macio_realize_ide(s, &ns->ide[0],
> -                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_IRQ),
> -                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_DMA_IRQ),
> -                      0x16, &err);
> -    if (err) {
> -        error_propagate(errp, err);
> +    if (!macio_realize_ide(s, &ns->ide[0],
> +                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_IRQ),
> +                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_DMA_IRQ),
> +                           0x16, errp)) {
>           return;
>       }
>   
> -    macio_realize_ide(s, &ns->ide[1],
> -                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_IRQ),
> -                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_DMA_IRQ),
> -                      0x1a, &err);
> -    if (err) {
> -        error_propagate(errp, err);
> +    if (!macio_realize_ide(s, &ns->ide[1],
> +                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_IRQ),
> +                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_DMA_IRQ),
> +                           0x1a, errp)) {
>           return;
>       }

These days you would move macio_common_realize() into TYPE_MACIO, but anyway:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

