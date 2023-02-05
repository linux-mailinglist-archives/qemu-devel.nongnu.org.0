Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515268AF6D
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:01:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOckh-0001Yl-6X; Sun, 05 Feb 2023 06:00:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pOcke-0001Y9-U4; Sun, 05 Feb 2023 06:00:04 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pOckc-0005Ke-J1; Sun, 05 Feb 2023 06:00:04 -0500
Received: by mail-oi1-x234.google.com with SMTP id r28so7667476oiw.3;
 Sun, 05 Feb 2023 03:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nN6AiygcIfaPKh2WxhGXW0iSiKMl+tQ0ZaWrixs8U1Q=;
 b=I81W+7XY6E+j/bfg0zlpW85jkKd1mpGVL3qVU+k72xmufKHLr61XoyhKSWKhmNMZcq
 WTyhetg+G83AlO/dWCIDtbnpwt+FPPgr63ZUZxu+3SL7Pc5ho2056Gh/esfdLzeE8Hqx
 XLIhs/NJX1CIVEeSD38+yu4sATXQND2vNYh62vT9P6uN70hGg2L83JsFVqNXcVqvyX31
 1C+hqkXkeGLoWGo00XPVDh/6IF4CDTjBpUlX7oSs4OvStjMRHD0I8UWMgppErgTCHX12
 6NvFO3Hjth4y9R1QBtHlSK2+Sm1AVhQrhiD74PVVGKUnI5BYUZOL/DDTF/vsJUQBS+VI
 tWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nN6AiygcIfaPKh2WxhGXW0iSiKMl+tQ0ZaWrixs8U1Q=;
 b=4OWQfXNNi5C7CsYY5lrTAIaVXaQSafTjw1bRJ1tElSoDrK0QdCUqGqHDHmPNfczSPR
 1yrIAfy+yhAFpvf0YmR8Cj5z35JrAFFkJErcJpNrNiR8PwkxdrFoILEdlHBS2CQmUzsP
 ZQXlADgpL3sXPNFEBpdsYg0yk118bDcLjkYGlQ+d+5XB9fcAv/N7RGbLOWudGqQZRXpn
 cJfmevvovhgv/oAGRUYEz6oMoeUcAlVRAMj4CWw3xLQ2zOekXvMxFt3reurbVFXhqAv3
 OLBfh/K5FPTttqsnPYLIq8uAWQPARicIuo8I0WGVU3CCwC3xTC+uaRpQHTDKmUp8McmQ
 73uQ==
X-Gm-Message-State: AO0yUKVUDUNUe1Sqeme+r0Z46JLokfEt1aOaOxiKJ9uQBXvQZt0bD1Ik
 +i2BodrlBLFQART1LwM+7go=
X-Google-Smtp-Source: AK7set+18VTsR3O1fVRpYk0hfeTD0JJoghkmt7+xKC8t1Xbzn7e7QjDOnjso9qnLr83+ewezVw8EWw==
X-Received: by 2002:a05:6808:d46:b0:364:5f65:952a with SMTP id
 w6-20020a0568080d4600b003645f65952amr9547521oik.27.1675594800763; 
 Sun, 05 Feb 2023 03:00:00 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 m41-20020a05683026e900b00670679748f9sm3491166otu.49.2023.02.05.02.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:00:00 -0800 (PST)
Message-ID: <e31c8fb1-ff9f-2f56-e3d1-56efdf219c14@gmail.com>
Date: Sun, 5 Feb 2023 07:59:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/5] hw/ppc/ppc4xx: Set QDev properties using QDev API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20230203211623.50930-1-philmd@linaro.org>
 <20230203211623.50930-4-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230203211623.50930-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 2/3/23 18:16, Philippe Mathieu-Daudé wrote:
> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
> 
> All calls use either errp=&error_abort or &error_fatal,
> so converting to the QDev API is almost a no-op (QDev
> API always uses &error_abort).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/e500.c          | 3 +--
>   hw/ppc/ppc405_boards.c | 6 ++----
>   hw/ppc/ppc405_uc.c     | 6 +++---
>   hw/ppc/ppc440_bamboo.c | 3 +--
>   hw/ppc/ppc4xx_devs.c   | 2 +-
>   hw/ppc/sam460ex.c      | 5 ++---
>   6 files changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 9fa1f8e6cf..083961cef5 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -943,8 +943,7 @@ void ppce500_init(MachineState *machine)
>            * Secondary CPU starts in halted state for now. Needs to change
>            * when implementing non-kernel boot.
>            */
> -        object_property_set_bool(OBJECT(cs), "start-powered-off", i != 0,
> -                                 &error_fatal);
> +        qdev_prop_set_bit(DEVICE(cs), "start-powered-off", i != 0);
>           qdev_realize_and_unref(DEVICE(cs), NULL, &error_fatal);
>   
>           if (!firstenv) {
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 4092ebc1ab..67eb9ac139 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -276,10 +276,8 @@ static void ppc405_init(MachineState *machine)
>   
>       object_initialize_child(OBJECT(machine), "soc", &ppc405->soc,
>                               TYPE_PPC405_SOC);
> -    object_property_set_link(OBJECT(&ppc405->soc), "dram",
> -                             OBJECT(machine->ram), &error_abort);
> -    object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
> -                             &error_abort);
> +    qdev_prop_set_link(DEVICE(&ppc405->soc), "dram", OBJECT(machine->ram));
> +    qdev_prop_set_uint32(DEVICE(&ppc405->soc), "sys-clk", 33333333);
>       qdev_realize(DEVICE(&ppc405->soc), NULL, &error_fatal);
>   
>       /* allocate and load BIOS */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index c973cfb04e..b7d5cfc548 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1080,7 +1080,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>        * We use the 440 DDR SDRAM controller which has more regs and features
>        * but it's compatible enough for now
>        */
> -    object_property_set_int(OBJECT(&s->sdram), "nbanks", 2, &error_abort);
> +    qdev_prop_set_uint32(DEVICE(&s->sdram), "nbanks", 2);
>       if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->sdram), &s->cpu, errp)) {
>           return;
>       }
> @@ -1147,8 +1147,8 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* MAL */
> -    object_property_set_int(OBJECT(&s->mal), "txc-num", 4, &error_abort);
> -    object_property_set_int(OBJECT(&s->mal), "rxc-num", 2, &error_abort);
> +    qdev_prop_set_uint8(DEVICE(&s->mal), "txc-num", 4);
> +    qdev_prop_set_uint8(DEVICE(&s->mal), "rxc-num", 2);
>       if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->mal), &s->cpu, errp)) {
>           return;
>       }
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 81d71adf34..3612471990 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -200,8 +200,7 @@ static void bamboo_init(MachineState *machine)
>   
>       /* SDRAM controller */
>       dev = qdev_new(TYPE_PPC4xx_SDRAM_DDR);
> -    object_property_set_link(OBJECT(dev), "dram", OBJECT(machine->ram),
> -                             &error_abort);
> +    qdev_prop_set_link(dev, "dram", OBJECT(machine->ram));
>       ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
>       object_unref(OBJECT(dev));
>       /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index c1d111465d..1848cf5d3c 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -535,7 +535,7 @@ void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
>   bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
>                           Error **errp)
>   {
> -    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
> +    qdev_prop_set_link(DEVICE(dev), "cpu", OBJECT(cpu));
>       return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
>   }
>   
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index cf065aae0e..cb828b6d4d 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -345,13 +345,12 @@ static void sam460ex_init(MachineState *machine)
>           exit(1);
>       }
>       dev = qdev_new(TYPE_PPC4xx_SDRAM_DDR2);
> -    object_property_set_link(OBJECT(dev), "dram", OBJECT(machine->ram),
> -                             &error_abort);
> +    qdev_prop_set_link(dev, "dram", OBJECT(machine->ram));
>       /*
>        * Put all RAM on first bank because board has one slot
>        * and firmware only checks that
>        */
> -    object_property_set_int(OBJECT(dev), "nbanks", 1, &error_abort);
> +    qdev_prop_set_uint32(dev, "nbanks", 1);
>       ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
>       object_unref(OBJECT(dev));
>       /* FIXME: does 460EX have ECC interrupts? */

