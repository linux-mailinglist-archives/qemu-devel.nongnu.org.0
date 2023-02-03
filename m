Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB8768A4A5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:30:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3c8-0007io-P2; Fri, 03 Feb 2023 16:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pO3c6-0007iJ-Ae; Fri, 03 Feb 2023 16:28:54 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pO3c3-0000eW-NW; Fri, 03 Feb 2023 16:28:54 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BDDDE74645F;
 Fri,  3 Feb 2023 22:26:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7463F746392; Fri,  3 Feb 2023 22:26:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 72725746377;
 Fri,  3 Feb 2023 22:26:18 +0100 (CET)
Date: Fri, 3 Feb 2023 22:26:18 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 qemu-ppc@nongnu.org, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Markus Armbruster <armbru@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 3/5] hw/ppc/ppc4xx: Set QDev properties using QDev API
In-Reply-To: <20230203211623.50930-4-philmd@linaro.org>
Message-ID: <b10263d2-60df-c993-593a-5110095546e2@eik.bme.hu>
References: <20230203211623.50930-1-philmd@linaro.org>
 <20230203211623.50930-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-512487620-1675459578=:93212"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-512487620-1675459578=:93212
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
>
> All calls use either errp=&error_abort or &error_fatal,
> so converting to the QDev API is almost a no-op (QDev
> API always uses &error_abort).
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/e500.c          | 3 +--
> hw/ppc/ppc405_boards.c | 6 ++----
> hw/ppc/ppc405_uc.c     | 6 +++---
> hw/ppc/ppc440_bamboo.c | 3 +--
> hw/ppc/ppc4xx_devs.c   | 2 +-
> hw/ppc/sam460ex.c      | 5 ++---
> 6 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 9fa1f8e6cf..083961cef5 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -943,8 +943,7 @@ void ppce500_init(MachineState *machine)
>          * Secondary CPU starts in halted state for now. Needs to change
>          * when implementing non-kernel boot.
>          */
> -        object_property_set_bool(OBJECT(cs), "start-powered-off", i != 0,
> -                                 &error_fatal);
> +        qdev_prop_set_bit(DEVICE(cs), "start-powered-off", i != 0);
>         qdev_realize_and_unref(DEVICE(cs), NULL, &error_fatal);
>
>         if (!firstenv) {
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 4092ebc1ab..67eb9ac139 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -276,10 +276,8 @@ static void ppc405_init(MachineState *machine)
>
>     object_initialize_child(OBJECT(machine), "soc", &ppc405->soc,
>                             TYPE_PPC405_SOC);
> -    object_property_set_link(OBJECT(&ppc405->soc), "dram",
> -                             OBJECT(machine->ram), &error_abort);
> -    object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
> -                             &error_abort);
> +    qdev_prop_set_link(DEVICE(&ppc405->soc), "dram", OBJECT(machine->ram));
> +    qdev_prop_set_uint32(DEVICE(&ppc405->soc), "sys-clk", 33333333);
>     qdev_realize(DEVICE(&ppc405->soc), NULL, &error_fatal);
>
>     /* allocate and load BIOS */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index c973cfb04e..b7d5cfc548 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1080,7 +1080,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>      * We use the 440 DDR SDRAM controller which has more regs and features
>      * but it's compatible enough for now
>      */
> -    object_property_set_int(OBJECT(&s->sdram), "nbanks", 2, &error_abort);
> +    qdev_prop_set_uint32(DEVICE(&s->sdram), "nbanks", 2);
>     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->sdram), &s->cpu, errp)) {
>         return;
>     }
> @@ -1147,8 +1147,8 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>     }
>
>     /* MAL */
> -    object_property_set_int(OBJECT(&s->mal), "txc-num", 4, &error_abort);
> -    object_property_set_int(OBJECT(&s->mal), "rxc-num", 2, &error_abort);
> +    qdev_prop_set_uint8(DEVICE(&s->mal), "txc-num", 4);
> +    qdev_prop_set_uint8(DEVICE(&s->mal), "rxc-num", 2);
>     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->mal), &s->cpu, errp)) {
>         return;
>     }
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 81d71adf34..3612471990 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -200,8 +200,7 @@ static void bamboo_init(MachineState *machine)
>
>     /* SDRAM controller */
>     dev = qdev_new(TYPE_PPC4xx_SDRAM_DDR);
> -    object_property_set_link(OBJECT(dev), "dram", OBJECT(machine->ram),
> -                             &error_abort);
> +    qdev_prop_set_link(dev, "dram", OBJECT(machine->ram));
>     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
>     object_unref(OBJECT(dev));
>     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index c1d111465d..1848cf5d3c 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -535,7 +535,7 @@ void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
> bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
>                         Error **errp)
> {
> -    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
> +    qdev_prop_set_link(DEVICE(dev), "cpu", OBJECT(cpu));
>     return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
> }
>
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index cf065aae0e..cb828b6d4d 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -345,13 +345,12 @@ static void sam460ex_init(MachineState *machine)
>         exit(1);
>     }
>     dev = qdev_new(TYPE_PPC4xx_SDRAM_DDR2);
> -    object_property_set_link(OBJECT(dev), "dram", OBJECT(machine->ram),
> -                             &error_abort);
> +    qdev_prop_set_link(dev, "dram", OBJECT(machine->ram));
>     /*
>      * Put all RAM on first bank because board has one slot
>      * and firmware only checks that
>      */
> -    object_property_set_int(OBJECT(dev), "nbanks", 1, &error_abort);
> +    qdev_prop_set_uint32(dev, "nbanks", 1);
>     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
>     object_unref(OBJECT(dev));
>     /* FIXME: does 460EX have ECC interrupts? */
>
--3866299591-512487620-1675459578=:93212--

