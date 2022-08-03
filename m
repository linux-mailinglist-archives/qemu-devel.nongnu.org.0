Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CECD5889F9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:57:51 +0200 (CEST)
Received: from localhost ([::1]:46510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJB8Q-0004oj-5U
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAxJ-0003aH-Hf; Wed, 03 Aug 2022 05:46:21 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:45964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAxC-0007yz-GL; Wed, 03 Aug 2022 05:46:21 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 c20-20020a9d4814000000b0061cecd22af4so11811020otf.12; 
 Wed, 03 Aug 2022 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=an8Wq62yKLP1wdR0fvwpa4VtGuyK8skbazEX1xFmo4c=;
 b=nRYRxa8n2Z4vRFM1MgbTci0wZ7eBjYW52IC1Q8DLrQKBqvTBZbR+TbGsrWJGCwa3DV
 4LJpsvA2PYUuAV12D6005JUffScSbOqrdPSLl852uIBz7wFJuzNWOmtm+YBLWiv/zZKc
 /ZWQe22kMQOOoN98E5AbftTI3L4XxcNS9xo5BxdMPBB9DaKj9wEFzFZu6bJeAyGL7JUv
 cgeb12tXKuop7/1D7yfq1j/sdHOEiaSpReLrv3cuoDQfAm3DLnKTBa4Ophz7c600Nzbp
 qtEQRr2Pgs9kTqsUT6tYngNrbNw8Ro085Av1rdY6iaXWuAxRvwPWPROhE0zXZxqazD4r
 xDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=an8Wq62yKLP1wdR0fvwpa4VtGuyK8skbazEX1xFmo4c=;
 b=ZE7nOEgUlLWPLWhBg2p9wzvwgHJLQz3uuhVuL5gujJB2cOE/+Aw5hK4NYHO6ryb9xG
 PjCi8nMHwTCXfD6GxWGEEI/HO++PSI6+7kmKXAFAVLQ/vfbMrt3JcGq6u3eHt4dL7HLy
 Inn1lvtLI0jxi6f3xyqR53Xn7GWazCMTDDQ+3l5U8va1/B5S9giH2FZdbDX644wTw6v0
 lg9y8eN36xwRV4ecwdwmsdiuG/UnXx50WsT2UUHd3WIkffz8DLzLQFycZJpw+ibzOl3X
 229TvQJSDo4FRc9bK7XqqfkTLLLYoECGZYS/7d1I+o8zsvXGrH2ecbuPhNu3KoASMXEE
 RUtw==
X-Gm-Message-State: ACgBeo2QpmFNX1uHSG1xp6EfcrXfPv9xZ3jG+OObaN6wMct6nZrKBDtz
 uzu1V3tTdd+EOCeoRHd4FvyE5gwwFJs=
X-Google-Smtp-Source: AA6agR6vtjuX5mWREHQgtY8jl3XqaUVOXXS3B3bGO88yBk74J4LgHKwbcB6hW7moyG883qmdgrffDQ==
X-Received: by 2002:a05:6830:6a12:b0:631:1724:8656 with SMTP id
 cz18-20020a0568306a1200b0063117248656mr3931907otb.355.1659519971880; 
 Wed, 03 Aug 2022 02:46:11 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a4ac916000000b0042573968646sm3932340ooq.11.2022.08.03.02.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:46:11 -0700 (PDT)
Message-ID: <01b0be8c-de23-edd7-70ae-440ff1d5f253@gmail.com>
Date: Wed, 3 Aug 2022 06:46:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 19/19] ppc/ppc405: QOM'ify I2C
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-20-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-20-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 8/1/22 10:10, Cédric Le Goater wrote:
> Having an explicit I2C model object will help if one day we want to
> add I2C devices on the bus.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc405.h    |  2 ++
>   hw/ppc/ppc405_uc.c | 10 ++++++++--
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index c2cfccb9d106..0b1e15c18fe0 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -28,6 +28,7 @@
>   #include "qom/object.h"
>   #include "hw/ppc/ppc4xx.h"
>   #include "hw/intc/ppc-uic.h"
> +#include "hw/i2c/ppc4xx_i2c.h"
>   
>   #define PPC405EP_SDRAM_BASE 0x00000000
>   #define PPC405EP_NVRAM_BASE 0xF0000000
> @@ -256,6 +257,7 @@ struct Ppc405SoCState {
>       Ppc405OcmState ocm;
>       Ppc405GpioState gpio;
>       Ppc405DmaState dma;
> +    PPC4xxI2CState i2c;
>       Ppc405EbcState ebc;
>       Ppc405OpbaState opba;
>       Ppc405PobState pob;
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 0336d1e08689..5372c308c227 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1461,6 +1461,8 @@ static void ppc405_soc_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
>   
> +    object_initialize_child(obj, "i2c", &s->i2c, TYPE_PPC4xx_I2C);
> +
>       object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
>   
>       object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
> @@ -1572,8 +1574,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* I2C controller */
> -    sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
> -                         qdev_get_gpio_in(DEVICE(&s->uic), 2));
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, 0xef600500);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->uic), 2));
>   
>       /* GPIO */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {

