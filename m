Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B96AD2F3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 00:43:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZKTw-0006bU-5l; Mon, 06 Mar 2023 18:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZKTu-0006Zf-3l; Mon, 06 Mar 2023 18:43:02 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZKTs-0007Yd-7H; Mon, 06 Mar 2023 18:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VPiFLdgoU9LDSytgqBYKnZH6X4DxLbwYYUV1tWbzhaA=; b=hkcdTBkv0d1p3u2EDuxUliAdsB
 Ij4YoLoa4jgrl+BNrqcW7HCDhJmlk7C/SRjmGsDzRYhdLrxzgW6TvmeAdgT3Hf1YOMEWePpQafinl
 21vfv739g5JstDEZztITXo8xy7noiKEm2F22R0lEfeTI3uXMO1QNfUMuUIPeon+Wm1pW+D6TYEo+f
 e6X0OQqm5KK+7zc+FsEI3WedwRrlwFfQe6LjkJ2Ef2suLc++ktWN90nqWoIuw1FA892UJl+oW5kdW
 wbWt5xrV6XsOpV7CXKDWtr/PAWLLuSd4dOgaqYNjO55puUzRo472e/NSHzzDPpuPYj1C+RpCHNtnC
 8T468GR9RFGWT/naYdvbNUIUOcBMLYjQoJxl2AThW/WU6nL+OiytCxqXPB/rd6lFn0ZeolS89lOB0
 NxFmD1vlpM+t9HqbyW8zyux8KaaV8ePk/bU4zv5f1EZ2V1ydqrIJVeF/UIS54wJYQTzrvUqnfqYZO
 128La00Umqh2IwIFt/s3jNiRIDafmTxuAac4YFbMMvOSvKIDs6NSoxCN6XVW+2qbqEYnCod7ie835
 KpBePPvVxy4orUJOaE3+djDWpDaS9nIf0DuiTtf0Weo84xDDA8Ag5AW2fYWNlzU3siz7jtGIAjRp1
 31vpbWLbUMqQ7A4l0kSlWNi8pBzH6M0L3AyiNIfxI=;
Received: from [2a00:23c4:8bab:d400:2a4f:fc6b:227:2848]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZKT8-0000sK-T6; Mon, 06 Mar 2023 23:42:19 +0000
Message-ID: <0ca8d3d3-2e42-a8c0-ed59-bc543e4149bd@ilande.co.uk>
Date: Mon, 6 Mar 2023 23:42:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
References: <cover.1678105081.git.balaton@eik.bme.hu>
 <23370610213adb60877c3751f954b203fe2fa775.1678105081.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <23370610213adb60877c3751f954b203fe2fa775.1678105081.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bab:d400:2a4f:fc6b:227:2848
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v8 3/6] hw/isa/vt82c686: Implement PCI IRQ routing
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 06/03/2023 12:33, BALATON Zoltan wrote:

> The real VIA south bridges implement a PCI IRQ router which is configured
> by the BIOS or the OS. In order to respect these configurations, QEMU
> needs to implement it as well. The real chip may allow routing IRQs from
> internal functions independently of PCI interrupts but since guests
> usually configute it to a single shared interrupt we don't model that
> here for simplicity.
> 
> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.
> 
> Suggested-by: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Tested-by: Rene Engel <ReneEngel80@emailn.de>
> ---
>   hw/isa/vt82c686.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 8900d87f59..3383ab7e2d 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -600,6 +600,46 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
>       qemu_set_irq(s->isa_irqs_in[n], level);
>   }
>   
> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
> +{
> +    switch (irq_num) {
> +    case 0:
> +        return s->dev.config[0x55] >> 4;
> +    case 1:
> +        return s->dev.config[0x56] & 0xf;
> +    case 2:
> +        return s->dev.config[0x56] >> 4;
> +    case 3:
> +        return s->dev.config[0x57] >> 4;
> +    }
> +    return 0;
> +}
> +
> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
> +{
> +    ViaISAState *s = opaque;
> +    PCIBus *bus = pci_get_bus(&s->dev);
> +    int i, pic_level, pic_irq = via_isa_get_pci_irq(s, irq_num);
> +
> +    /* IRQ 0: disabled, IRQ 2,8,13: reserved */
> +    if (!pic_irq) {
> +        return;
> +    }
> +    if (unlikely(pic_irq == 2 || pic_irq == 8 || pic_irq == 13)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid ISA IRQ routing");
> +    }
> +
> +    /* The pic level is the logical OR of all the PCI irqs mapped to it. */
> +    pic_level = 0;
> +    for (i = 0; i < PCI_NUM_PINS; i++) {
> +        if (pic_irq == via_isa_get_pci_irq(s, i)) {
> +            pic_level |= pci_bus_get_irq_level(bus, i);
> +        }
> +    }
> +    /* Now we change the pic irq level according to the via irq mappings. */
> +    qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
> +}
> +
>   static void via_isa_realize(PCIDevice *d, Error **errp)
>   {
>       ViaISAState *s = VIA_ISA(d);
> @@ -620,6 +660,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>       i8254_pit_init(isa_bus, 0x40, 0, NULL);
>       i8257_dma_init(isa_bus, 0);
>   
> +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PINS);
> +
>       /* RTC */
>       qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>       if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {

Writing my previous response where I asked about the additional PCI interrupt 
connections to the MV64361, I realised that if you forget about the Northbridge 
component for a moment then things start to make a bit more sense.

At the moment we have 3 different scenarios:

    1) ISA IRQ -> 8259 for all ISA devices

    2) ISA IRQ -> 8259 *OR*
       PCI IRQ -> PCI IRQ router -> 8259 for the PCI-IDE device

    3) PCI IRQ -> PCI IRQ router -> 8259 for PCI devices

When you look at it this way it is easy to see for case 3 that the PCI IRQ routing 
mechanism is handled by *_set_irq() and *_map_irq() callbacks. And so with that in 
mind, re-reading the VIA datasheet I came up with the following PoC for discussion: 
https://github.com/mcayland/qemu/commits/via-poc.

It needs a bit of work, but at first glance it ticks all the boxes in that the PCI 
bus IRQs are all internal to the VIA southbridge (no global via_isa_set_irq() 
function and no overriding of PCI bus IRQs), there are separate legacy and PCI IRQs 
for the via-ide device, and the PCI IRQ routing bears at least a passing resemblance 
to the datasheet.


ATB,

Mark.

