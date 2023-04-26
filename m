Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6028B6EF53B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:13:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prewd-00008N-Fk; Wed, 26 Apr 2023 09:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prewa-00004w-OZ; Wed, 26 Apr 2023 09:12:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prewY-0000rG-KA; Wed, 26 Apr 2023 09:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5mUALpHhKZnkewQLATl5CqXnEzyekxmf23hI0c2yQ24=; b=PaPix2w/MeR5f/2mgTPfBnsbww
 I66NBe1aTaQUWJxWThIsL0yCM3UKnRpfBCAXzq5lq5ygcSalCvS7/wW5HwmtHBhZS2GB82BFTTiov
 UWRhNYJbL1k9lXFH7kvy/pd0O2wNMqDulB6nTaYRQAGRdYcj4AXBzBMnRRlQANhLZDMXqANFb1zVs
 u5LLgOvR3nq3L0KfUAZp5ZI1r82fL99tWgWQG9t0dNCz+AbI70f1VFrR/PbigJxFfw906MsCKgJnz
 Jonf8oNpiB1VlWzHRx7JjgN1SWhFk4mqMOU5TzfCfA3VbF56QA3MMyT6stKdOLAqZqHxbWP9l5BIP
 4jNxTJFrAgoPs0ntpRJ4VYVRs7FJ0sEuWle+cyOnREECPLjyxYovydCpzYa4L1lnHbdsTt2mOXXT0
 IAFOU+CYaElNb+xn3H+fyYN4C9zzf2n+5k28rKBGELRUojEEXTvBZ2V05JY0awyqdd6EgLFnzkBPW
 GPKhy0thFx40t9C9GwytDsEd0Kz+k765AfjxRVpozcwBhCVlF0c973xXuCZgpNU55bBjR5Y1iB+AL
 bPb6KCogOMFzwekp+Itfi5xBjuZE+DSD5YAROx0V/7L64qiRUy6RCQ7gi8mFPoQWze5jPTHWUw0l/
 jxh2V/216YLsmnHKwmdeoUfXiKdPtlE2fyeqcWOsU=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prevW-0002aI-Ly; Wed, 26 Apr 2023 14:11:22 +0100
Message-ID: <9e1d99cc-5bc2-61a0-75f0-e05c6cba1ddd@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-8-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 07/18] hw/isa: Deprecate isa_get_irq() in favor of
 isa_bus_get_irq()
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

> Last commit removed the last use of isa_get_irq(NULL).
> Add an assertion to ensure we won't use that hack again.
> Deprecate in favor of the BUS API: isa_bus_get_irq().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/isa/isa-bus.c     | 6 +++---
>   include/hw/isa/isa.h | 3 ++-
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index a289eccfb1..081bac18ee 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -85,10 +85,10 @@ qemu_irq isa_bus_get_irq(ISABus *bus, unsigned irqnum)
>    * This function is only for special cases such as the 'ferr', and
>    * temporary use for normal devices until they are converted to qdev.
>    */
> -qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
> +qemu_irq isa_get_irq(ISADevice *dev, unsigned irqnum)
>   {
> -    assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) == isabus);
> -    return isa_bus_get_irq(isabus, isairq);
> +    assert(dev);
> +    return isa_bus_get_irq(ISA_BUS(qdev_get_parent_bus(DEVICE(dev))), irqnum);
>   }
>   
>   void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index 40d6224a4e..75fb620782 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -87,7 +87,8 @@ ISADevice *isa_create_simple(ISABus *bus, const char *name);
>   
>   ISADevice *isa_vga_init(ISABus *bus);
>   
> -qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
> +/*  isa_get_irq() is deprecated, please use isa_bus_get_irq() instead. */
> +qemu_irq isa_get_irq(ISADevice *dev, unsigned irqnum);
>   void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
>   MemoryRegion *isa_address_space(ISADevice *dev);
>   MemoryRegion *isa_address_space_io(ISADevice *dev);

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

