Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241353E454
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 14:21:42 +0200 (CEST)
Received: from localhost ([::1]:50700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyBjn-0007xB-A7
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 08:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyBhJ-000670-1b; Mon, 06 Jun 2022 08:19:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyBhH-0008Rr-Dc; Mon, 06 Jun 2022 08:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OrP+F/JT1CcwCfiZevyO2ifnU/JeK9YkhwK0CConis8=; b=UHXPrNjXmWnHJFcLH7AHFAByua
 8ooY5mJ/kS/Bd0W9VaTsE6CPH9GmC1jXd08VK039zdF33G/pe0Ft/IIPTa4L7GABvC/enycrY4tpt
 ZW9rYX3QPcaZQvhcwGUJyb9HmcgtyleeustNzf/6pUwGhbHqIX9f/TVR6Vn80Ng54NDXY80UPZSZA
 45xeAx75RPBVrTSzoq428LuhTJajl8hfsmvxhJ/RSHavz1VDeYRjPxeWq2XSayR7mzHu7sZ2i3OT2
 dheR0nexu39cp4HcFZ7PrEEt5id9byuAKQkog9KKAG2gtAs1aJHKB/f8O2q5eDhSjv/AsTYjV/dnp
 CGdrJhp+JehKNv0WxAklnqzCo0puM49X5BcN3Sy7mh9wNs9MCdagG+6l3TlZVEKggbfb2k4YNUhIj
 8XuI5y0lwwrFEiWZdLXH9JLp04/JjzMsQFeTeNqWrJBbZ5KrZbZAXmeXduNiQWy0CcEurvSvMhItL
 Ywrrih/O6zCHJlfe9xjF7HkkhXvyTTeGhrbBc+18hyDjTeMuj4k8X9AoEYNclGQIv55e0+d0OjoXh
 QuQT+PcPSQqa0xnCcTC3txlO9MUNczseZnRixFXfw94ve0BX/HKyymBUBRjb5x9h433hMQ/1SkuLs
 6KHEARtgZaRAgLe2QbrjQcDs1qo4LaxRI2RCQInaA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyBg7-0003qY-Ty; Mon, 06 Jun 2022 13:17:56 +0100
Message-ID: <f343e944-9223-d104-1723-0c88fc4a04ff@ilande.co.uk>
Date: Mon, 6 Jun 2022 13:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220602215351.149910-1-danielhb413@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220602215351.149910-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] ppc/pnv: fix extra indent spaces with DEFINE_PROP*
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

On 02/06/2022 22:53, Daniel Henrique Barboza wrote:

> The DEFINE_PROP* macros in pnv files are using extra spaces for no good
> reason.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb3.c     |  8 ++++----
>   hw/pci-host/pnv_phb4.c     | 10 +++++-----
>   hw/pci-host/pnv_phb4_pec.c | 10 +++++-----
>   3 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 3f03467dde..26ac9b7123 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1088,10 +1088,10 @@ static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
>   }
>   
>   static Property pnv_phb3_properties[] = {
> -        DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
> -        DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
> -        DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
> -        DEFINE_PROP_END_OF_LIST(),
> +    DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
> +    DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
> +    DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
> +    DEFINE_PROP_END_OF_LIST(),
>   };
>   
>   static void pnv_phb3_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 13ba9e45d8..6594016121 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1692,11 +1692,11 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
>   }
>   
>   static Property pnv_phb4_properties[] = {
> -        DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
> -        DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
> -        DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
> -                         PnvPhb4PecState *),
> -        DEFINE_PROP_END_OF_LIST(),
> +    DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
> +    DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
> +    DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
> +                     PnvPhb4PecState *),
> +    DEFINE_PROP_END_OF_LIST(),
>   };
>   
>   static void pnv_phb4_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 61bc0b503e..8b7e823fa5 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -215,11 +215,11 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>   }
>   
>   static Property pnv_pec_properties[] = {
> -        DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
> -        DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
> -        DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
> -                         PnvChip *),
> -        DEFINE_PROP_END_OF_LIST(),
> +    DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
> +    DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
> +    DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
> +                     PnvChip *),
> +    DEFINE_PROP_END_OF_LIST(),
>   };
>   
>   static uint32_t pnv_pec_xscom_pci_base(PnvPhb4PecState *pec)

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

