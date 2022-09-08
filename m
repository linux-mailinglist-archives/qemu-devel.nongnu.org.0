Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA675B19F0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:28:53 +0200 (CEST)
Received: from localhost ([::1]:51392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEmC-0004vB-29
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEfH-00015Q-AO; Thu, 08 Sep 2022 06:21:44 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:41758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEfE-0001hI-KJ; Thu, 08 Sep 2022 06:21:43 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-12803ac8113so9804912fac.8; 
 Thu, 08 Sep 2022 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=q4FIiQWAugHwfC4IV98JiRjyWowjlmW3PU2Bhult6ZA=;
 b=ErsXVCR41/mPYx3tuBrVJguSS546Ic+rlLxaFgd+jitG8rXgMxOpDwqks08TEGBflh
 zHH9uFe/VLPPKyFmDZF2Uv1TAKv2mpjdC/iJOdSRmJhOgMe5KMQxvWQqHlDRS/iFw/HX
 7V0BHjcecAyUgUu1M+aPNyU68Eyvz60CkmBqAACbAacgWevHe8t5nJiwXMRjaatKNcc6
 WVYpMuUo+AggTeWbTH5TcUPZBQ/+oYA4DrO6dzQBYELMDgkCKRLTn0WjmFxMTIgIYmGB
 kjuHt443kr4O7OCZ432VCRb36QokDUbLImMihe5zy+yT6vvFUUmPLo7idMzc5j9cD1jp
 gfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=q4FIiQWAugHwfC4IV98JiRjyWowjlmW3PU2Bhult6ZA=;
 b=cu/T7dqS97YVsdXzPkDM4nZ4yc9J7YQSXsQEXRKBikrlT8eYkibJfnxMUgNvbwO072
 gt/5NBO/EPik6eFPl2PY8c8dNmUPTfMvSiXFBGtTIm2Db8ulNBP2qqYiWm8ZFJFZzp2Q
 CJx9WBTYPzSwEAu7WxTUMeN9AYNV76Zz16wjvkAnIZUTOc+FO1keAKE0DnccebYy3KeK
 HVJHhOhivmjZ4fjXTigPTGeKCpuycRoj5ysNuBOQip6quoWWUMd8wBqSmS/rr5caAYbT
 69ZNBVgVVvyC/p7UmsspV4OckmZaQm1l/EzyVmqJR6LwtbfLcG4ffhHy/hHNUo2BQKog
 77Fg==
X-Gm-Message-State: ACgBeo2cc0fho1Qzf+gLxqDys3rRukMVwDxu1cOvELfo/7gJjKogV/Ro
 B2B4Ba02Q3lvG2Knn25iaGw=
X-Google-Smtp-Source: AA6agR5lPWkph9WRb8uG8NgPCSgb9mDOTo7S4OuxJPjeR6ecjyE2M3h0e78rBP2tXeOiurtOqUp6QQ==
X-Received: by 2002:a05:6808:120a:b0:345:c5b4:49c7 with SMTP id
 a10-20020a056808120a00b00345c5b449c7mr1136428oil.172.1662632498724; 
 Thu, 08 Sep 2022 03:21:38 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 t1-20020a4adbc1000000b004728e64dc0fsm58610oou.38.2022.09.08.03.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 03:21:38 -0700 (PDT)
Message-ID: <132db87e-2748-bb5c-b10c-4d0aedfe20aa@gmail.com>
Date: Thu, 8 Sep 2022 07:21:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 13/13] hw/isa/vt82c686: Create rtc-time alias in boards
 instead
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <20220901114127.53914-14-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901114127.53914-14-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 9/1/22 08:41, Bernhard Beschow wrote:
> According to good QOM practice, an object should only deal with objects
> of its own sub tree. Having devices create an alias on the machine
> object doesn't respect this good practice. To resolve this, create the
> alias in the machine's code.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/isa/vt82c686.c   | 2 --
>   hw/mips/fuloong2e.c | 4 ++++
>   hw/ppc/pegasos2.c   | 4 ++++
>   3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 48cd4d0036..3f9bd0c04d 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -632,8 +632,6 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>       if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>           return;
>       }
> -    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
> -                              "date");
>       isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
>   
>       for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 3c46215616..b478483706 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -295,6 +295,10 @@ static void mips_fuloong2e_init(MachineState *machine)
>       pci_dev = pci_create_simple_multifunction(pci_bus,
>                                                 PCI_DEVFN(FULOONG2E_VIA_SLOT, 0),
>                                                 true, TYPE_VT82C686B_ISA);
> +    object_property_add_alias(OBJECT(machine), "rtc-time",
> +                              object_resolve_path_component(OBJECT(pci_dev),
> +                                                            "rtc"),
> +                              "date");
>       qdev_connect_gpio_out(DEVICE(pci_dev), 0, env->irq[5]);
>   
>       dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 09fdb7557f..49b753c7cc 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -161,6 +161,10 @@ static void pegasos2_init(MachineState *machine)
>       /* VIA VT8231 South Bridge (multifunction PCI device) */
>       via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
>                                             TYPE_VT8231_ISA);
> +    object_property_add_alias(OBJECT(machine), "rtc-time",
> +                              object_resolve_path_component(OBJECT(via),
> +                                                            "rtc"),
> +                              "date");
>       qdev_connect_gpio_out(DEVICE(via), 0,
>                             qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>   

