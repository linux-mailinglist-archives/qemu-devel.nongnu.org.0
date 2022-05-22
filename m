Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C980F53068C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 00:34:01 +0200 (CEST)
Received: from localhost ([::1]:52364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsu9A-0005xg-Tm
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 18:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nsu7S-0004g2-IB; Sun, 22 May 2022 18:32:15 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:42681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nsu7P-0007QJ-Rn; Sun, 22 May 2022 18:32:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F2B92745958;
 Mon, 23 May 2022 00:32:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B940974581A; Mon, 23 May 2022 00:32:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B78D874579D;
 Mon, 23 May 2022 00:32:06 +0200 (CEST)
Date: Mon, 23 May 2022 00:32:06 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 1/6] include/hw/southbridge/piix: Aggregate all PIIX
 soughbridge type names
In-Reply-To: <20220522212431.14598-2-shentey@gmail.com>
Message-ID: <e1654d8d-53c4-d01c-1288-f74fa4fdfcfd@eik.bme.hu>
References: <20220522212431.14598-1-shentey@gmail.com>
 <20220522212431.14598-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

On Sun, 22 May 2022, Bernhard Beschow wrote:
> TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remaining
> ones, too.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> hw/isa/piix3.c                | 3 ---
> include/hw/isa/isa.h          | 2 --
> include/hw/southbridge/piix.h | 4 ++++
> 3 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index dab901c9ad..d96ce2b788 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -35,9 +35,6 @@
>
> #define XEN_PIIX_NUM_PIRQS      128ULL
>
> -#define TYPE_PIIX3_DEVICE "PIIX3"
> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> -
> static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
> {
>     qemu_set_irq(piix3->pic[pic_irq],
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index 034d706ba1..e9fa2f5cea 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -144,6 +144,4 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)
>     return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
> }
>
> -#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
> -
> #endif
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index f63f83e5c6..4d17400dfd 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -70,6 +70,10 @@ typedef struct PIIXState PIIX3State;
> DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>                          TYPE_PIIX3_PCI_DEVICE)
>
> +#define TYPE_PIIX3_DEVICE "PIIX3"
> +#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> +#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"

This naming seems to go back to 9b74b190d6c so it's not directly related 
to this series but there seems to be a bit of a confusion here that I 
wonder could be cleaned up now. We have:

#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
and
#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"

and both of these have mismatched #define and device name. These are not 
user creatable so so the device names don't appear anywhere (except maybe 
in info qtree output) but this could still be confusing as normally type 
defines should match device names. If these are the ISA bridges then maybe 
piix?-isa is a good name so maybe we should have

#define TYPE_PIIX3_ISA "piix3-isa"
#defint TYPE_PIIX4_ISA "piix4-isa"

(then also matching e.g. "via-isa") but I'm not sure changing "pci-piix3" 
to "piix3-isa" could break anything (I don't expect changing the defines 
themselces could cause any problem).

It's just something I've noticed and brought up for consideration but I 
have no strong opinion on it so up to you what you do with it.

Regards,
BALATON Zoltan

> +
> PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
>
> DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
>

