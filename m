Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFE334920B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:31:20 +0100 (CET)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPP8x-0006qX-GM
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPP6w-00067z-UJ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:29:14 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:41482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPP6u-00073p-Nj
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:29:14 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so1720683otq.8
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HlQW8rptQ3lxwnVrvbzJd5F87X2hSyHomUDgF+cRnn4=;
 b=KUf+xtKJDtL9LW+sJcdeXFFP1mxj1SLnNPqvu3f7vtHrqhJMmYs1JtHxaUGxBBFhIa
 tVPAXLxF0acmNF7zbBC7jA4zNOng1Z7LMgUn5U/Ja/JorCRYQ4aWJvRxATb8WkIH6MyQ
 M94XLBJCqcYqwo4diGS4qbMdR3PtRZCg6zMebufdzoMZlBN/t3oXKbfQW5nxn0PCsEFl
 ReRnJWOeXL7TIbqEUE8T+3cnkJfVBz8+V1m4fp3l3wjdpJMQTIJbyYG+s4pKj6WdjKlU
 aMHzncuAITDq50lDoGPHzGJshoU81X+ay4UCWONt2vKJ10+np5i5RuW7VccSmIUFSPD8
 5wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HlQW8rptQ3lxwnVrvbzJd5F87X2hSyHomUDgF+cRnn4=;
 b=mZE2VyAefGTJDCxRAO3G592zXMJoslRPiPb6MwJccFjE0ZTTlk5+CzOwKAlmoUmRoU
 MhMoGuNs/+Rw8kc2ESPuTYHZMLu/4IjrH+9G2m8IsEd3JTJRhJ17GwkDREgwZU1AYT3m
 8kqtzJhXU2cycXFfOjx1rn5vf8m5fzCRsRjv/vAqzVVwrx5bzPtgHmbyb/L1uptHtis9
 sFqMQR/wDrD2aWVhX+5Noo1D/J+VeI4lTWxmJwowjuVz7LuUG7kA+DO1SaeGlRxPXjKJ
 xfVD+8MK4H7Eyt7KJvi32hSaLpeG4tH3GFkkI/1QJsLG+UBNdPsNQ84OZrbPhh91BQvq
 jSxA==
X-Gm-Message-State: AOAM5339+LV/j2KcLbI4/EQ5RbQT4lZI6G5uIVVqQI6Spej0yOZkMzuR
 sMceoWG1dEklcTNMVRAPiVbQCQ==
X-Google-Smtp-Source: ABdhPJwkGAtQnWcQdja129/4sTSJGuklNesSdNjBJMu/5rbroEw35gbcE8Pr+xaxp3QinfEkY65+EQ==
X-Received: by 2002:a9d:206d:: with SMTP id n100mr7530368ota.353.1616675351410; 
 Thu, 25 Mar 2021 05:29:11 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id i3sm1224057oov.2.2021.03.25.05.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 05:29:11 -0700 (PDT)
Subject: Re: [PATCH 5/6] hw/ide/via: Connect IDE function output IRQs to the
 ISA function input
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210324175438.680310-1-f4bug@amsat.org>
 <20210324175438.680310-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c397608-6ff4-716b-4973-55f49c24c0fa@linaro.org>
Date: Thu, 25 Mar 2021 06:29:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210324175438.680310-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> To avoid abusing isa_get_irq(NULL) using a hidden ISA bridge
> under the hood, let the IDE function expose 2 output IRQs,
> and connect them to the ISA function inputs when creating
> the south bridge chipset model in vt82c686b_southbridge_init.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/ide/via.c        | 19 +++++++++++++++++--
>   hw/mips/fuloong2e.c |  9 ++++++++-
>   2 files changed, 25 insertions(+), 3 deletions(-)
> 


> @@ -112,7 +124,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
>           d->config[0x70 + n * 8] &= ~0x80;
>       }
>   
> -    qemu_set_irq(isa_get_irq(NULL, 14 + n), level);
> +    qemu_set_irq(s->irq[n], level);
>   }
>   
>   static void via_ide_reset(DeviceState *dev)
...
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 931385c760f..f1c5db13b78 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -203,12 +203,19 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>                                          I2CBus **i2c_bus)
>   {
>       PCIDevice *dev;
> +    DeviceState *isa;
>   
>       dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
>                                             TYPE_VT82C686B_ISA);
> -    qdev_connect_gpio_out_named(DEVICE(dev), "intr", 0, intc);
> +    isa = DEVICE(dev);
> +    qdev_connect_gpio_out_named(isa, "intr", 0, intc);
>   
>       dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
> +    for (unsigned i = 0; i < 2; i++) {
> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", i,

                                        ^^^^^^^^^^^ isa?

> +                                    qdev_get_gpio_in_named(isa,
> +                                                           "isa-irq", 14 + i));
> +    }

It all looks a little funny, but I think I follow it, and see that it can't be 
split further, because of the movement of the +14.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


