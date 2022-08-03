Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733B2588A0D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 12:02:06 +0200 (CEST)
Received: from localhost ([::1]:55686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJBCX-00030L-4c
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 06:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAxt-000459-Iu; Wed, 03 Aug 2022 05:47:02 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:45935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAxq-00084F-1n; Wed, 03 Aug 2022 05:46:56 -0400
Received: by mail-oi1-x236.google.com with SMTP id u9so19337872oiv.12;
 Wed, 03 Aug 2022 02:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=atNU8ob/QOe1O2+SgK/WYRUFLF8645/uPI3Ll6a+Eac=;
 b=JOAEyEaGAyU5fOMUKGKkPpX9okxqmrxUYzUwLcUeSzXInNyJN6J0IdZCzTBTWG0JHJ
 2KAgy5iETL+cG6xevba5WxPmyFKjFNDMVMlzGVosdnt3Gjdp/otPnbTYJM9eiBO5VlF5
 G6/2YReDLkOjCkyLlYTAoE7C4SxJptOMwnVxC1VVApt8xBdquWmMjYjM848cLEDwGy/0
 hkqdkdE7CX+857rtUKy9Z6cnbPdnLrn5hmV9icNEVP6/BaUYSqGOABQ7asbTmwQBg9k3
 8eSYol03bl+UQBqveh/yiQmtKyVRYruNDRr213k92iJNMjsXtsyARR8lE9nUi+/AjYgf
 GeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=atNU8ob/QOe1O2+SgK/WYRUFLF8645/uPI3Ll6a+Eac=;
 b=vD7RSVL2jHbDqyyzO9RFMEcsuPMzQcVbMhZfnUQ3Z9GL/Du6dQEyRnBKvaoy2WoHa7
 UEvsEz/dlOAd73NXDfP7V5IixtH3d6bihsvWLkJzzuPBUhzx6KXWc9pCW66V/kgTgP+b
 v8ORzfK3/8lTX6MaOfwemJYgbk3b3pRYqStZfVWC/rhHa6xR8GHtK9QpALChJTxqwkty
 Z44s4Eq1R7ponFIkK95ZUhNBcLHn4Tno1DJ+Sm1stJJnIkG9ACLUtk5xOiM/e7bHFIz4
 OufDkSGDKwQ7NeFAMKJNF9REaLPsCEkJh+uB6bY3b5Z706MS+rfJv6+FsVycHMt0Ea6q
 eFQQ==
X-Gm-Message-State: ACgBeo3d+hIxCfn0S+PSfLYbcjHhGQWR4vR6A1pAE0CzfdyZz1up0DgZ
 cpLlQ/2Dndec8JyxTfzb++MVh6Gyq60=
X-Google-Smtp-Source: AA6agR6Sx/g+JYFx5p976ioOBd1qST1lvG3xM7e22MoEezfwlixEdIlpaUhQqx3U6BDNL8oDjqkESw==
X-Received: by 2002:a05:6808:90e:b0:33a:7280:ba2 with SMTP id
 w14-20020a056808090e00b0033a72800ba2mr1344356oih.80.1659520012367; 
 Wed, 03 Aug 2022 02:46:52 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a4ab643000000b004357c1d1efasm3886160ooo.21.2022.08.03.02.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:46:52 -0700 (PDT)
Message-ID: <5827fe9c-e6d2-832e-372a-63a12e57e985@gmail.com>
Date: Wed, 3 Aug 2022 06:46:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 18/19] ppc/ppc405: QOM'ify UIC
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-19-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-19-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

With the compile fix that you mentioned fixed up:

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   hw/ppc/ppc405.h    |  3 ++-
>   hw/ppc/ppc405_uc.c | 27 ++++++++++++++-------------
>   2 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 0cbfd977aecf..c2cfccb9d106 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -27,6 +27,7 @@
>   
>   #include "qom/object.h"
>   #include "hw/ppc/ppc4xx.h"
> +#include "hw/intc/ppc-uic.h"
>   
>   #define PPC405EP_SDRAM_BASE 0x00000000
>   #define PPC405EP_NVRAM_BASE 0xF0000000
> @@ -249,7 +250,7 @@ struct Ppc405SoCState {
>       hwaddr ram_size;
>   
>       PowerPCCPU cpu;
> -    DeviceState *uic;
> +    PPCUIC uic;
>       Ppc405CpcState cpc;
>       Ppc405GptState gpt;
>       Ppc405OcmState ocm;
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index de2c3c0c747c..0336d1e08689 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1448,6 +1448,8 @@ static void ppc405_soc_instance_init(Object *obj)
>       object_initialize_child(obj, "cpu", &s->cpu,
>                               POWERPC_CPU_TYPE_NAME("405ep"));
>   
> +    object_initialize_child(obj, "uic", &s->uic, TYPE_PPC_UIC);
> +
>       object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
>       object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
>   
> @@ -1533,22 +1535,21 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->opba), 0, 0xef600600);
>   
>       /* Universal interrupt controller */
> -    s->uic = qdev_new(TYPE_PPC_UIC);
> -
> -    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(&s->cpu),
> +    object_property_set_link(OBJECT(&s->uic), "cpu", OBJECT(&s->cpu),
>                                &error_fatal);
> -    if (!sysbus_realize(SYS_BUS_DEVICE(s->uic), errp)) {
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->uic), errp)) {
>           return;
>       }
>   
> -    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_INT,
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->uic), PPCUIC_OUTPUT_INT,
>                          qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_INT));
> -    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_CINT,
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->uic), PPCUIC_OUTPUT_CINT,
>                          qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_CINT));
>   
>       /* SDRAM controller */
>       /* XXX 405EP has no ECC interrupt */
> -    ppc4xx_sdram_init(env, qdev_get_gpio_in(s->uic, 17), 2, s->ram_memories,
> +    ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 2,
> +                      s->ram_memories,
>                         s->ram_bases, s->ram_sizes, s->do_dram_init);
>   
>       /* External bus controller */
> @@ -1567,12 +1568,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   
>       for (i = 0; i < ARRAY_SIZE(s->dma.irqs); i++) {
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), i,
> -                           qdev_get_gpio_in(s->uic, 5 + i));
> +                           qdev_get_gpio_in(DEVICE(&s->uic), 5 + i));
>       }
>   
>       /* I2C controller */
>       sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
> -                         qdev_get_gpio_in(s->uic, 2));
> +                         qdev_get_gpio_in(DEVICE(&s->uic), 2));
>   
>       /* GPIO */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
> @@ -1583,13 +1584,13 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       /* Serial ports */
>       if (serial_hd(0) != NULL) {
>           serial_mm_init(get_system_memory(), 0xef600300, 0,
> -                       qdev_get_gpio_in(s->uic, 0),
> +                       qdev_get_gpio_in(DEVICE(&s->uic), 0),
>                          PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
>                          DEVICE_BIG_ENDIAN);
>       }
>       if (serial_hd(1) != NULL) {
>           serial_mm_init(get_system_memory(), 0xef600400, 0,
> -                       qdev_get_gpio_in(s->uic, 1),
> +                       qdev_get_gpio_in(DEVICE(&s->uic), 1),
>                          PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
>                          DEVICE_BIG_ENDIAN);
>       }
> @@ -1609,7 +1610,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   
>       for (i = 0; i < ARRAY_SIZE(s->gpt.irqs); i++) {
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt), i,
> -                           qdev_get_gpio_in(s->uic, 19 + i));
> +                           qdev_get_gpio_in(&s->uic, 19 + i));
>       }
>   
>       /* MAL */
> @@ -1623,7 +1624,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   
>       for (i = 0; i < ARRAY_SIZE(s->mal.irqs); i++) {
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->mal), i,
> -                           qdev_get_gpio_in(s->uic, 11 + i));
> +                           qdev_get_gpio_in(&s->uic, 11 + i));
>       }
>   
>       /* Ethernet */

