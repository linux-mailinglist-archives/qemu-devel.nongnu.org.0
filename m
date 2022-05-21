Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF1352F9F7
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 10:11:11 +0200 (CEST)
Received: from localhost ([::1]:37716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsKCc-0006ut-1u
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 04:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsK8D-00051V-4C; Sat, 21 May 2022 04:06:37 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsK8B-0008R1-0M; Sat, 21 May 2022 04:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KneofULAbAsyUtKW2b3s9I5+VrMV5EtWm9AwdsWEs/g=; b=blsiWM0AVSCdtB8EtrS1QpXDaq
 MKyKTJrx2MJ+ajr4jHfuXGp42f/2TKkrl70d507hpnqmPPQJrWm8hlZa2W1szhELbXTbJ+0lWFX4L
 PwKGp/tI38kQIQzG2rE+N3UA8NZ3dUGroboNx3/fWlS4P+NdKtW/2dhIkl1467m7+nn31GhC03nRh
 iGIeOHiX8p1BbxwNceisMzHt/TTF86VraBLtyh81Fei9rsVu5a74EXl4Wi78U3o7LJJFu18yllfFm
 fYgv7eL5hIVAbrtO4ilxj4tQvONFapNto0W9KrYInd/11mGrvKwpana92JNHS5vaFQXTnSvNFm7tA
 pk73xcK9RnFQtBcXSdwn4BsqkySJBXZE9Jgq9V50/5HwZU9gcHSmksVgh4WWSQ4pkmTGCQnMXGE7d
 VFO0GquiZtXmgWhjhfQ6TNbBJLgrzeUh+LrqGWk4G/wnE81o8jl9zlRkwk4T4XQApmIN/HoFyR4lT
 mzV8UxkNTZ1b+AGbTclZkPU5cmnxZOMWUQ7McoTe6j2+fvFt/O6zrzob4XwSy3n/W25cpwj/KeILO
 xwY1G9vJrP4CIFfLLrcXnofC+aVBJQza4np1nY2jC08/Ii+m7MsmVB2Hk/K4vU25ljub1bnz9AbNV
 NJNbT2AOSbKQBRuDWMM8HtHRHGz68HJS+ILuqdJWQ=;
Received: from host86-135-55-247.range86-135.btcentralplus.com
 ([86.135.55.247] helo=[192.168.50.176])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsK75-000A1g-29; Sat, 21 May 2022 09:05:31 +0100
Message-ID: <ae830cac-8d63-4f29-cfaf-51f947ebd523@ilande.co.uk>
Date: Sat, 21 May 2022 09:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220513175445.89616-1-shentey@gmail.com>
 <20220513175445.89616-2-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220513175445.89616-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.135.55.247
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/6] include/hw: Move TYPE_PIIX4_PCI_DEVICE to
 southbridge/piix.h
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/2022 18:54, Bernhard Beschow wrote:

> TYPE_PIIX3_PCI_DEVICE resides there as well.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/isa/isa.h          | 2 --
>   include/hw/southbridge/piix.h | 2 ++
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index 034d706ba1..e9fa2f5cea 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -144,6 +144,4 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)
>       return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
>   }
>   
> -#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
> -
>   #endif
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index f63f83e5c6..a304fc6041 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -70,6 +70,8 @@ typedef struct PIIXState PIIX3State;
>   DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>                            TYPE_PIIX3_PCI_DEVICE)
>   
> +#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
> +
>   PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
>   
>   DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

