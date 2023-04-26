Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD666EF559
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:17:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prf0I-0001Zp-5O; Wed, 26 Apr 2023 09:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prf0E-0001Y4-CI; Wed, 26 Apr 2023 09:16:11 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prf01-0001lG-Vs; Wed, 26 Apr 2023 09:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mo4ZAkJb/xLHaO6z83fioMWaw6xwJaWjvpOV2Hpuf3c=; b=PrZx47aXpcY3hODi6PDb9PvA7A
 C4Ui0PuWsbnimKbpfjkiThk3wBiIy+580yIku5ug9RIm5qQgzcDMPxlAfCPHXUguG06m/KNJGaxFa
 BnU4rltwnKyKWN0uxAu9nJlOUh78eXIQP8wOsnnKB7CVL6CdApu3fMoW3XUDxGbEZCRng5pQQiQQX
 bSofDR3LIASFLZ/jNc6GQnklBPEx5jl7VQxepTe7JVMzX+/Rg4zEpVr1zMpjvpUamx1jIPL2L5eyU
 q2VgQ/eXjmRd2Q9e8QYaDhOvcrqgSrp9d9x4un95qErqnzsu9y6zH/SWDy+DvvHqH4hPk51MeF7GA
 RzZUKSXgs3p/adsTznGz0W4mN5zAxuBFytdoffC/t3ng7CgEGme5XGyo6uKdvCMacUmEYm1otVwgJ
 OKGHBxeMi+pO+nR/T05dbrdBTn1p+3jxN/WG3E8ONyGDgr9PYaaM3np27XE+7X7Vn3RYe8ljZQ8wd
 j8rf1mBQpqlWnHzoN47f6oU2IkGcickSZdeLm3hgAWontTdYjPL2SXxFpOtKfps8g0hVrl6lnHOcn
 G5GMEvIMPhmgIZsQcMi7bSeTn2Yd10mpZhsf4uTTR+61olJqGdeWFACyx7KptMsUwS7B8HVd0Q21W
 jcC618mnMdCKx77EgQ2qj1cmGdAYwKCK+Mhw6rhs8=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prez1-0002cY-6s; Wed, 26 Apr 2023 14:14:59 +0100
Message-ID: <ca177083-b24d-90cd-9f3c-c99653bc9a08@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-9-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 08/18] hw/ide: Introduce generic ide_init_ioport()
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

> Add ide_init_ioport() which is not restricted to the ISA bus.
> (Next commit will use it for a PCI device).
> 
> Inspired-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ide/ioport.c           | 12 ++++++++++--
>   include/hw/ide/internal.h |  2 ++
>   2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
> index d869f8018a..ed7957dbae 100644
> --- a/hw/ide/ioport.c
> +++ b/hw/ide/ioport.c
> @@ -46,8 +46,6 @@ int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
>   {
>       int ret;
>   
> -    /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
> -       bridge has been setup properly to always register with ISA.  */
>       ret = isa_register_portio_list(dev, &bus->portio_list,
>                                      iobase, ide_portio_list, bus, "ide");
>   
> @@ -58,3 +56,13 @@ int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
>   
>       return ret;
>   }
> +
> +void ide_bus_init_ioport(IDEBus *bus, Object *owner, MemoryRegion *io,
> +                         int iobase, int iobase2)
> +{
> +    portio_list_init(&bus->portio_list, owner, ide_portio_list, bus, "ide");
> +    portio_list_add(&bus->portio_list, io, iobase);
> +
> +    portio_list_init(&bus->portio2_list, owner, ide_portio2_list, bus, "ide");
> +    portio_list_add(&bus->portio_list, io, iobase2);
> +}
> diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
> index d3b7fdc504..6967ca13e0 100644
> --- a/include/hw/ide/internal.h
> +++ b/include/hw/ide/internal.h
> @@ -617,6 +617,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
>                      uint32_t cylinders, uint32_t heads, uint32_t secs,
>                      int chs_trans, Error **errp);
>   void ide_exit(IDEState *s);
> +void ide_bus_init_ioport(IDEBus *bus, Object *owner, MemoryRegion *io,
> +                         int iobase, int iobase2);
>   void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out);
>   void ide_bus_set_irq(IDEBus *bus);
>   void ide_bus_register_restart_cb(IDEBus *bus);

Since I took the opposite approach with regard to the ISA IDE ioports, I have a very 
similar patch locally except that as all the remaining users are PCIDevices, I moved 
the logic into a function called pci_ide_register_legacy_ioports() in hw/ide/pci.c 
(see https://github.com/mcayland/qemu/commit/c2aa28fd6306eeeb60b3ec21be48dd9c8841e20b).

Thoughts?


ATB,

Mark.

