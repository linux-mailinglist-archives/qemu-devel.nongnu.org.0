Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DDA537067
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 11:08:06 +0200 (CEST)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvEu4-0003AX-NP
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 05:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvEry-0001oq-CO; Sun, 29 May 2022 05:05:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvErw-0005Cb-KT; Sun, 29 May 2022 05:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d21h+hULPY07Ye4c3rPmemr8o685mqyN99TjfXux7wQ=; b=ppv0sAIbhXcaUtgLTwKtKooRTo
 2ZZEE9NySU0j3k1Gfjdkj1u5HGq1f8caESmjgZcYbCbHs5r7pIyMS+/jUGv55WaHWPlZpD9f/rIC/
 NdnogNy64I99iULBSKnytJEHHa100nc+fVvgl1FHEH0uIllMqh96153211+WbHolsWTC1cGJ3VrEX
 S26Abv8RX3cRMKMF9cRP92TLPrB7gfiUi4ECTapcsiTCQ/Ou5IgalRkT/gd64MCAkela0mpCGf21r
 y5IWzyHBqrwpDlnRbl3s3KrH4V4rVAGq4OSmjhoBK2/Tg0/SU9Y/GZKM8+2uH6KsWDgjHO2mve+CT
 Yd9uhiilTyVbSuCGPe2ip63oASsk4H3rlmrzRQjwbo7n7ofwqa+dIqhBVOCFhufJQyrvmKoWjIOXU
 EBxWBX71oRI0O6Ljs6lY1nA0mg+csMsIkhK72aTPjlw5TI3kc63OFrDDnWCEYLXZsyYk9f2Uhvfdt
 pnB8oGc1hQqHZvtuzpsNA9MywsyZ3mscx3yKnF3+Tvh8yLtYq+RD7iOMaA5SBfk1nvGJAgtWDGDWt
 kzdG2ugnbcdysPOeWmOmOU89t3VZ6v/WNtUAkHihmxGatIf3vLhgObZkjB8Vcahh/0spijp/VV3Li
 TyxgMpgLZc4a0+As6X6MQZGxEw9KofvCUxpX67Qoo=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvEqb-000AHz-O7; Sun, 29 May 2022 10:04:33 +0100
Message-ID: <c62dad6a-9bd9-a2ef-ab24-c65912baa8bd@ilande.co.uk>
Date: Sun, 29 May 2022 10:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20220528192057.30910-1-shentey@gmail.com>
 <20220528192057.30910-2-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220528192057.30910-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 1/7] include/hw/southbridge/piix: Aggregate all PIIX
 soughbridge type names
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

On 28/05/2022 20:20, Bernhard Beschow wrote:

> TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remaining
> ones, too.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/isa/piix3.c                | 3 ---
>   include/hw/isa/isa.h          | 2 --
>   include/hw/southbridge/piix.h | 4 ++++
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index dab901c9ad..d96ce2b788 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -35,9 +35,6 @@
>   
>   #define XEN_PIIX_NUM_PIRQS      128ULL
>   
> -#define TYPE_PIIX3_DEVICE "PIIX3"
> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> -
>   static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
>   {
>       qemu_set_irq(piix3->pic[pic_irq],
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
> index 976b4da582..3b97186f75 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -64,6 +64,10 @@ typedef struct PIIXState PIIX3State;
>   DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>                            TYPE_PIIX3_PCI_DEVICE)
>   
> +#define TYPE_PIIX3_DEVICE "PIIX3"
> +#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> +#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
> +
>   PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
>   
>   DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);

One tiny nit here: there's a typo in the subject line which I missed when reviewing v2.

s/soughbridge/southbridge/


ATB,

Mark.

