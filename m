Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66326EF4AC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 14:50:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1preZu-0007H8-Nz; Wed, 26 Apr 2023 08:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1preZo-0007Fc-6i; Wed, 26 Apr 2023 08:48:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1preZm-00038s-CH; Wed, 26 Apr 2023 08:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qhUSqnd6vTgXpv1DbA6Ycqu4xbrfL8Y3qD0DYKL8HVk=; b=C3USw5FiNuatHqPBFTuEiphwat
 zZju7TygK6tNzOMzGIA+gsj5P9Sw+ICzFVKOVEEcvnL6peei+YrQ2phETSJ70rkVBPGegu7UEjpL5
 gquVIH+oSFlzOvbEfhxpRhm4/AmIvJt3nOq6G7qJHUm8R9qslUCuBtF+hHqK8s/6B2O2rhSTLIO4d
 x1jjYaP0VNmVjrySIaa1nqd1BdcXTEwSXWe0DB8lYnqgn/uQd2iVjKXK4/Gx3zHajY9X8oBSnsAwx
 iE/LTWuOVU/aMM+m6lmJ0VCDJhdLGnicVdLxop++OndvFkvl+8kz+siI76qQKl7GqxBE9OwWFuVbG
 DxbbXLxQkC6U5d18tlkmb89Ehj9qNGloSAe4dgx/yBtIwLJrPLg/DA17zJfGcjiWSCAvg4Phywjjs
 wnc3kcWTiE2+rVJB9pzcVBHFjRiYwPG4M3hxL+Mn9E8Ur5y5TY4ujrk8zasWN35IKwLHJFCHVBfoo
 VCHslOJrtM+D3p7FP+4OkmyIIB5COu9pl4HrbQ/0gEh+Kty2jT//8BzjuWmGQXTHi3AH3+5BmHRK+
 ZEQOxghkihp1/Nz8JqCOfiAzVfeuOtOLoEkTl3+hLlbKcwgRYTWXbB2EObgd0Jd+CtG3kz5JZrMi+
 icv08rv7x5mFj3zpD2TjwDv56vdOrAqVEVHTAwVqQ=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1preYa-0002SV-O7; Wed, 26 Apr 2023 13:47:44 +0100
Message-ID: <3e9e828b-7954-0b02-26be-40df6d2762b8@ilande.co.uk>
Date: Wed, 26 Apr 2023 13:48:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org, qemu-block@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-3-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 02/18] hw/ide/piix: Allow using PIIX3-IDE as standalone
 PCI function
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

On 02/03/2023 22:40, Philippe Mathieu-Daudé wrote:

> In order to allow Frankenstein uses such plugging a PIIX3
> IDE function on a ICH9 chipset (which already exposes AHCI
> ports...) as:
> 
>    $ qemu-system-x86_64 -M q35 -device piix3-ide
> 
> add a kludge to automatically wires the IDE IRQs on an ISA
> bus exposed by a PCI-to-ISA bridge (usually function #0).
> Restrict this kludge to the PIIX3.
> 
> Reported-by: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> TODO: describe why this configuration is broken (multiple
> output IRQs wired to the same input IRQ can lead to various
> IRQ level changed in the iothread, thus missed by the vCPUs).
> ---
>   hw/ide/piix.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index a36dac8469..7cb96ef67f 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -170,6 +170,18 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>   
>       vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
>   
> +    if (!d->isa_irq[0] && !d->isa_irq[1]
> +                       && DEVICE_GET_CLASS(d)->user_creatable) {
> +        /* kludge specific to TYPE_PIIX3_IDE */
> +        Object *isabus = object_resolve_path_type("", TYPE_ISA_BUS, NULL);
> +
> +        if (!isabus) {
> +            error_setg(errp, "Unable to find a single ISA bus");
> +            return;
> +        }
> +        d->isa_irq[0] = isa_bus_get_irq(ISA_BUS(isabus), 14);
> +        d->isa_irq[1] = isa_bus_get_irq(ISA_BUS(isabus), 15);
> +    }
>       for (unsigned i = 0; i < ARRAY_SIZE(d->isa_irq); i++) {
>           if (!pci_piix_init_bus(d, i, errp)) {
>               return;
> @@ -202,6 +214,13 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
>       k->class_id = PCI_CLASS_STORAGE_IDE;
>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>       dc->hotpluggable = false;
> +    /*
> +     * This function is part of a Super I/O chip and shouldn't be user
> +     * creatable. However QEMU accepts impossible hardware setups such
> +     * plugging a PIIX IDE function on a ICH ISA bridge.
> +     * Keep this Frankenstein (ab)use working.
> +     */
> +    dc->user_creatable = true;
>   }
>   
>   static const TypeInfo piix3_ide_info = {
> @@ -225,6 +244,8 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
>       k->class_id = PCI_CLASS_STORAGE_IDE;
>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>       dc->hotpluggable = false;
> +    /* Reason: Part of a Super I/O chip */
> +    dc->user_creatable = false;
>   }
>   
>   static const TypeInfo piix4_ide_info = {

Heh. Do we really want to support this configuration? :O  If PIIX is hard-wired to 
use legacy IRQs then our options are limited, since the device will always require 
separate routing to an ISABus which can only be present in the PIIX's own PCI-ISA 
bridge (i.e. it cannot exist standalone).

Having said that, it should be possible to do this with the VIA IDE since that can 
simply be switched to native mode.


ATB,

Mark.

