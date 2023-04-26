Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C186EF589
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:30:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prfEJ-0002Gg-SL; Wed, 26 Apr 2023 09:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfEH-0002Ex-01; Wed, 26 Apr 2023 09:30:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfEF-0004s1-2o; Wed, 26 Apr 2023 09:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7TD/kOmNMMT2jtI2d0/nxCuqQqXpnDeYdrRYLzqs9wA=; b=G5a3oZGrDgBPKAD7607PqP8Ie4
 mn8wI46CsuWTOFAxBDICzgTJhsq6aPE5qiKhQ8A72XksMAhezcpb+2Mjp7A3y0va+VobwMeH/3ZMw
 Ob4ixSmpFVpwVwRB8xqE0nqe8xuFN7EbGIPCBlVgsb35uZBmucGUI1BnIoBILxPdS9u1ELh7/SMFt
 2ucu4jqyQaVAQPmslwcE91TpMQwt5SsqOz8qdnJXeKtwE9f5s0+DG4EbgXuhVtj3JPc4CCBmFazQ6
 LiLywc6vj/WsqD+nWb71ENiAls8mhZv+F2KPhlpIgvthQu4HkeBfcRKCLtP+uRnwYWJWuajVjPez4
 DMoJlVCKLmz/s/jz4CYice0sskW3WRBhBXnW2UkJg74R+mprBmoNvuYqXzOcjaF6/kMrLideV7KeN
 ewwuh3D2kzh/Rbvmr0WxOPPnVKc+YeB3TdG4Jsj+p2poWsfSmiSXoa4UG5GJr+Enw6YH+E75Al0c/
 vaWnJfjJ+AKcomuNVB68bmCLO7TItYJRDtTHSrSSrRFmVNUgpvGXn9f25jHJ49VZPYKMT7lNbF5dQ
 SGgit/f+t6XQQ+sbDzgzz1ephVxbfC9fPK/shhlBPE3TzKphTGHXYaiAVb2TmgtzyMLWoUr7ex/UI
 7I3MYR11zBrWEoPm+Wq1mt5wpcYLoHeTBH6b3RX/M=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfDF-0002oe-2L; Wed, 26 Apr 2023 14:29:41 +0100
Message-ID: <18a054bb-c48f-b87e-da92-ea732d59417f@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-17-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 16/18] hw/isa/piix: Batch register QOM types using
 DEFINE_TYPES() macro
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

> See rationale in commit 38b5d79b2e ("qom: add helper
> macro DEFINE_TYPES()").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/isa/piix3.c | 53 +++++++++++++++++++++-----------------------------
>   1 file changed, 22 insertions(+), 31 deletions(-)
> 
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index a9cb39bf21..0ee94a2313 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -346,19 +346,6 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
>       adevc->build_dev_aml = build_pci_isa_aml;
>   }
>   
> -static const TypeInfo piix3_pci_type_info = {
> -    .name = TYPE_PIIX3_PCI_DEVICE,
> -    .parent = TYPE_PCI_DEVICE,
> -    .instance_size = sizeof(PIIX3State),
> -    .abstract = true,
> -    .class_init = pci_piix3_class_init,
> -    .interfaces = (InterfaceInfo[]) {
> -        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> -        { TYPE_ACPI_DEV_AML_IF },
> -        { },
> -    },
> -};
> -
>   static void piix3_realize(PCIDevice *dev, Error **errp)
>   {
>       ERRP_GUARD();
> @@ -382,12 +369,6 @@ static void piix3_class_init(ObjectClass *klass, void *data)
>       k->realize = piix3_realize;
>   }
>   
> -static const TypeInfo piix3_info = {
> -    .name          = TYPE_PIIX3_DEVICE,
> -    .parent        = TYPE_PIIX3_PCI_DEVICE,
> -    .class_init    = piix3_class_init,
> -};
> -
>   static void piix3_xen_realize(PCIDevice *dev, Error **errp)
>   {
>       ERRP_GUARD();
> @@ -416,17 +397,27 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
>       k->realize = piix3_xen_realize;
>   }
>   
> -static const TypeInfo piix3_xen_info = {
> -    .name          = TYPE_PIIX3_XEN_DEVICE,
> -    .parent        = TYPE_PIIX3_PCI_DEVICE,
> -    .class_init    = piix3_xen_class_init,
> +static const TypeInfo piix_isa_types[] = {
> +    {
> +        .name           = TYPE_PIIX3_PCI_DEVICE,
> +        .parent         = TYPE_PCI_DEVICE,
> +        .instance_size  = sizeof(PIIX3State),
> +        .class_init     = pci_piix3_class_init,
> +        .abstract       = true,
> +        .interfaces = (InterfaceInfo[]) {
> +            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +            { TYPE_ACPI_DEV_AML_IF },
> +            { },
> +        },
> +    }, {
> +        .name           = TYPE_PIIX3_DEVICE,
> +        .parent         = TYPE_PIIX3_PCI_DEVICE,
> +        .class_init     = piix3_class_init,
> +    }, {
> +        .name           = TYPE_PIIX3_XEN_DEVICE,
> +        .parent         = TYPE_PIIX3_PCI_DEVICE,
> +        .class_init     = piix3_xen_class_init,
> +    }
>   };
>   
> -static void piix3_register_types(void)
> -{
> -    type_register_static(&piix3_pci_type_info);
> -    type_register_static(&piix3_info);
> -    type_register_static(&piix3_xen_info);
> -}
> -
> -type_init(piix3_register_types)
> +DEFINE_TYPES(piix_isa_types)

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

