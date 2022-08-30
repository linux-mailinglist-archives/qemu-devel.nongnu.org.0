Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6019A5A6FB2
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 23:50:38 +0200 (CEST)
Received: from localhost ([::1]:57706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT980-0005kw-Ue
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 17:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT94g-0003TQ-C9; Tue, 30 Aug 2022 17:47:11 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT94a-0001JB-DM; Tue, 30 Aug 2022 17:47:08 -0400
Received: by mail-pl1-x632.google.com with SMTP id v5so6161268plo.9;
 Tue, 30 Aug 2022 14:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=dqnLut5namHZD74eIATKZw8djbDbQNUsrtlzssd1Drg=;
 b=pEq5JTXnswQOPREP6QVaMNGn0l81l6Ij72ptjT0ALVBeTeuKKTV/WHqX1tiZZouLOO
 7Wlilc+qZcmeWuunseHIx+G5Z2jxTIq1WpIPbyeiRGfjvyHIICU2439QsrtrBdmIIxBK
 9GxQm4r3UOXykFJUH4MFkFJuDj0FEHVI2mh0YnH71ARrWPZudjxoD1Pg216We8rfHshf
 AOOXc7JnuSmGetAIIOu4JvfqK9ZkwvcsAPIJia4up0ssoNnLqOKrekKWJDTwlJsRbejv
 6WOy+pT38NSohOA47HHe++atCeDbyK4KEeWsGwaPJRKq6Ko2ZWct3+/a0dYqUClViC3m
 gNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=dqnLut5namHZD74eIATKZw8djbDbQNUsrtlzssd1Drg=;
 b=DCWRQet+yBm5TbBYE1TB7CTLwJi5pRajiUOe8NbUfpmEQDRdPNMYQlWGEvdsKLB+KR
 1IYpkxSkYraXjHRcq8DPrjdk7URTB5ri86t+lU9e6jMuiSPojn23r1wEjBt+3hTJQTpZ
 uVxwcJF93y6tUKVOPED2BKJG1y/ZlK7dEd95TaqprsvwiSlYgQDQ22m3DB6c8xrNZlzt
 tr04+a2zSWJsmcmUkGFPr2Y+rIWGElK58lAiXMwK5r0fFumRRCTkBy3JwL7xF7hzWATz
 muyxDrDXiwi37dZDfGB6X7Ujpai0AFHDjXVUTpQnvjz/zSWUkaI+LvghgS4pGIIjFFzm
 htSg==
X-Gm-Message-State: ACgBeo24i6SRQ+i0EdxzE3q5PW/lIkHFBA3FqnsTDbj2ph4cp2qdxC1m
 33a+06ua0FmWxOtpLDF2O0s=
X-Google-Smtp-Source: AA6agR6cRWICO54vSZgGpAPwvaSN9RmL/s5C2+d88Mii91kH7eiasggB9X8y43IaLKCbpglmrnn8Ug==
X-Received: by 2002:a17:903:110e:b0:171:3afa:e68c with SMTP id
 n14-20020a170903110e00b001713afae68cmr22727487plh.12.1661896022643; 
 Tue, 30 Aug 2022 14:47:02 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090322c300b0016c4f0065b4sm10454048plg.84.2022.08.30.14.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 14:47:02 -0700 (PDT)
Message-ID: <113d22be-283c-ebe5-8db3-e622447c7bf5@amsat.org>
Date: Tue, 30 Aug 2022 23:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 10/10] hw/isa/vt82c686: Create rtc-time alias in boards
 instead
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220830190048.67448-1-shentey@gmail.com>
 <20220830190048.67448-11-shentey@gmail.com>
In-Reply-To: <20220830190048.67448-11-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 30/8/22 21:00, Bernhard Beschow wrote:
> According to good QOM practice, an object should only deal with objects
> of its own sub tree. Having devices create an alias on the machine
> object doesn't respect this good practice. To resolve this, create the
> alias in the machine's code.

IIUC, this is only true for Pegasos II, not (yet) for the Fuloong 2E.

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/vt82c686.c   | 2 --
>   hw/mips/fuloong2e.c | 4 ++++
>   hw/ppc/pegasos2.c   | 4 ++++
>   3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 0ef9446374..a23ffbb3ff 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -631,8 +631,6 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>       if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>           return;
>       }
> -    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
> -                              "date");
>       isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
>   
>       for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 2d8723ab74..0f4cfe1188 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -203,6 +203,10 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>   
>       via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
>                                             TYPE_VT82C686B_ISA);
> +    object_property_add_alias(qdev_get_machine(), "rtc-time",
> +                              object_resolve_path_component(OBJECT(via),
> +                                                            "rtc"),
> +                              "date");
>       qdev_connect_gpio_out(DEVICE(via), 0, intc);
>   
>       dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 09fdb7557f..f50e1d8b3f 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -161,6 +161,10 @@ static void pegasos2_init(MachineState *machine)
>       /* VIA VT8231 South Bridge (multifunction PCI device) */
>       via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
>                                             TYPE_VT8231_ISA);
> +    object_property_add_alias(qdev_get_machine(), "rtc-time",

We already have a 'machine' pointer.

> +                              object_resolve_path_component(OBJECT(via),
> +                                                            "rtc"),
> +                              "date");
>       qdev_connect_gpio_out(DEVICE(via), 0,
>                             qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>   


