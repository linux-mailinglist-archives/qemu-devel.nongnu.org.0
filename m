Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11424412896
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:59:41 +0200 (CEST)
Received: from localhost ([::1]:43764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRK8-00033a-2E
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR4O-000882-7n
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:43:24 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:54099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR4M-0000BD-P2
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:43:24 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MGi2e-1mgEpe3FKs-00DpAC; Mon, 20 Sep 2021 23:43:20 +0200
Subject: Re: [PATCH v4 19/20] q800: wire up nubus IRQs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-20-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f2c217af-7883-9ed2-0ff5-4af38aadfbc3@vivier.eu>
Date: Mon, 20 Sep 2021 23:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-20-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:c9jQT/fpXMG6nqJlvy2uehVlAfw0Rt86LWSHSoKuE/8A1HG38dr
 PM4l7Ij2+22tRcY6oGR/+u9fS6Tm1kICT9CWqLLhocyp+LwuvwXyyUGINgAGzCJuavuUkeD
 AN8R4ezwzDjVYVSUarvuphRfaZyprY59eYQHQ+n9BU9ttxZJ2Td9etaK4cg0ol6Z4Vpb8nn
 pjUrtQ1vnjYCfn3ayBnsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sPvMqohUODk=:/JWDXi/RNls325W55HYfzp
 17x5EChVqkF+GyxWq0J4bxDqbDJFIQy4NPunEWxPeJRT1g07gS5bQcCSWb94adHweAQjqHnOV
 q1WjICjQHicjsB65jHZKDaCmc/x2E6iGse2586GkhKEEopjV7eDQl3omB4Xi33G7GgMee8RcW
 SzSVbV3Wx2V9bE6hAiq2lrkpBohvLfCjl8SGIIIxinPAB4J/pzneiRyOZ+WQ9xnrPM1Og4mW4
 pUWjHjufqwfAa1n0STjwQqEbRiHEv2gbt2WZVl4QIFDsuFlYIouuPYOqK3xTYo8FMq8S6NPy/
 0hL5okqYtwEywUA8c4tlhG32qFjSPEbl9qsSg08ul3qdNOzZ7bWVWAlLPKHkmXoPH75FmYxCl
 65BDuJIHwY45p1P+1NZLl/76bGDYgL1WgJfRntz5U9rk3bO+ZB9SSKLd2I6W90zeP8Dwim0Gw
 yNooY9jhKjxtek0fD2dD7jfKWXLIKPSFQ1oM/+ZjFTZWTphc7D4BYI0xjwyaf8U0q9Sl6c4vQ
 XJWOAhkKSHFXlXyEDm6pmiNx+FNVNyvTAMahXJEUX7M8nfXY6ciTagPPiAffTlFWGX6LtgTJL
 2oCtIDt+4yia5VGFyr4tSGFcbT8Q+nMgtL4fxHHJBsJfzREQLmXCuejj372aEXHz4qFJ7s6Do
 8KEvyReQHb+65U/8ci+0/PsaKZI3Elv9xU9m1akg1gvN/tf86oVTxCEx5ALIy7hSNLIc0oVIz
 89MNhGocVjMoOb/F2Ds8HwfNc6IbN+JsTbaRVQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> Nubus IRQs are routed to the CPU through the VIA2 device so wire up the IRQs
> using gpios accordingly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index e34df1a829..fbc45a301f 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -396,6 +396,11 @@ static void q800_init(MachineState *machine)
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 9 * NUBUS_SUPER_SLOT_SIZE);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
>                                              9 * NUBUS_SLOT_SIZE);
> +    for (i = 0; i < VIA2_NUBUS_IRQ_NB; i++) {
> +        qdev_connect_gpio_out(dev, 9 + i,
> +                              qdev_get_gpio_in_named(via2_dev, "nubus-irq",
> +                                                     VIA2_NUBUS_IRQ_9 + i));
> +    }
>  
>      nubus = &NUBUS_BRIDGE(dev)->bus;
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

