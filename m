Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924255894CD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 01:28:25 +0200 (CEST)
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJNmp-0001NQ-Q2
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 19:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJNl3-0008Cl-Bj; Wed, 03 Aug 2022 19:26:33 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:26448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJNl0-0004lk-FG; Wed, 03 Aug 2022 19:26:32 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 65CA3747F1E;
 Thu,  4 Aug 2022 01:26:25 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 22A9E747F1B; Thu,  4 Aug 2022 01:26:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 213B0747E0F;
 Thu,  4 Aug 2022 01:26:25 +0200 (CEST)
Date: Thu, 4 Aug 2022 01:26:25 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 18/20] ppc/ppc405: QOM'ify UIC
In-Reply-To: <20220803132844.2370514-19-clg@kaod.org>
Message-ID: <e192604d-8542-5c38-5cb6-3febe3607fdd@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-19-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-750229076-1659569185=:13819"
X-Spam-Probability: 11%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-750229076-1659569185=:13819
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 3 Aug 2022, Cédric Le Goater wrote:
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc405.h    |  3 ++-
> hw/ppc/ppc405_uc.c | 26 +++++++++++++-------------
> 2 files changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 7d585a244d18..d29f738cd2d0 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -27,6 +27,7 @@
>
> #include "qom/object.h"
> #include "hw/ppc/ppc4xx.h"
> +#include "hw/intc/ppc-uic.h"
>
> #define PPC405EP_SDRAM_BASE 0x00000000
> #define PPC405EP_NVRAM_BASE 0xF0000000
> @@ -249,7 +250,7 @@ struct Ppc405SoCState {
>     hwaddr ram_size;
>
>     PowerPCCPU cpu;
> -    DeviceState *uic;
> +    PPCUIC uic;

So this patch is probably misnamed as nothing is QOMified here, the UIC is 
already a QOM object, what happens is rather embedding it in the SoC 
instead of only storing a reference. The advantage of embedding is likely 
that it does not have to be freed so we don't need an exit function but it 
adds a bunch of casts to other places. As said before you probably should 
do the casts once and store it in a local if you need it more than once or 
twice.

Regards,
BALATON Zoltan

>     Ppc405CpcState cpc;
>     Ppc405GptState gpt;
>     Ppc405OcmState ocm;
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index f39e0b44f9cc..5cd32e22b7ea 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1448,6 +1448,8 @@ static void ppc405_soc_instance_init(Object *obj)
>     object_initialize_child(obj, "cpu", &s->cpu,
>                             POWERPC_CPU_TYPE_NAME("405ep"));
>
> +    object_initialize_child(obj, "uic", &s->uic, TYPE_PPC_UIC);
> +
>     object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
>     object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
>
> @@ -1525,17 +1527,15 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>     sysbus_mmio_map(SYS_BUS_DEVICE(&s->opba), 0, 0xef600600);
>
>     /* Universal interrupt controller */
> -    s->uic = qdev_new(TYPE_PPC_UIC);
> -
> -    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(&s->cpu),
> +    object_property_set_link(OBJECT(&s->uic), "cpu", OBJECT(&s->cpu),
>                              &error_fatal);
> -    if (!sysbus_realize(SYS_BUS_DEVICE(s->uic), errp)) {
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->uic), errp)) {
>         return;
>     }
>
> -    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_INT,
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->uic), PPCUIC_OUTPUT_INT,
>                        qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_INT));
> -    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_CINT,
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->uic), PPCUIC_OUTPUT_CINT,
>                        qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_CINT));
>
>     /* SDRAM controller */
> @@ -1545,7 +1545,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>     s->ram_bases[0] = 0;
>     s->ram_sizes[0] = s->ram_size;
>
> -    ppc4xx_sdram_init(env, qdev_get_gpio_in(s->uic, 17),
> +    ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17),
>                       ARRAY_SIZE(s->ram_memories), s->ram_memories,
>                       s->ram_bases, s->ram_sizes, s->do_dram_init);
>
> @@ -1565,12 +1565,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>
>     for (i = 0; i < ARRAY_SIZE(s->dma.irqs); i++) {
>         sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), i,
> -                           qdev_get_gpio_in(s->uic, 5 + i));
> +                           qdev_get_gpio_in(DEVICE(&s->uic), 5 + i));
>     }
>
>     /* I2C controller */
>     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
> -                         qdev_get_gpio_in(s->uic, 2));
> +                         qdev_get_gpio_in(DEVICE(&s->uic), 2));
>
>     /* GPIO */
>     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
> @@ -1581,13 +1581,13 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>     /* Serial ports */
>     if (serial_hd(0) != NULL) {
>         serial_mm_init(get_system_memory(), 0xef600300, 0,
> -                       qdev_get_gpio_in(s->uic, 0),
> +                       qdev_get_gpio_in(DEVICE(&s->uic), 0),
>                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
>                        DEVICE_BIG_ENDIAN);
>     }
>     if (serial_hd(1) != NULL) {
>         serial_mm_init(get_system_memory(), 0xef600400, 0,
> -                       qdev_get_gpio_in(s->uic, 1),
> +                       qdev_get_gpio_in(DEVICE(&s->uic), 1),
>                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
>                        DEVICE_BIG_ENDIAN);
>     }
> @@ -1607,7 +1607,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>
>     for (i = 0; i < ARRAY_SIZE(s->gpt.irqs); i++) {
>         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt), i,
> -                           qdev_get_gpio_in(s->uic, 19 + i));
> +                           qdev_get_gpio_in(DEVICE(&s->uic), 19 + i));
>     }
>
>     /* MAL */
> @@ -1621,7 +1621,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>
>     for (i = 0; i < ARRAY_SIZE(s->mal.irqs); i++) {
>         sysbus_connect_irq(SYS_BUS_DEVICE(&s->mal), i,
> -                           qdev_get_gpio_in(s->uic, 11 + i));
> +                           qdev_get_gpio_in(DEVICE(&s->uic), 11 + i));
>     }
>
>     /* Ethernet */
>
--3866299591-750229076-1659569185=:13819--

