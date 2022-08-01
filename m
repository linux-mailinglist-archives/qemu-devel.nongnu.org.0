Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA24E586C27
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:41:38 +0200 (CEST)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVft-0004SZ-TD
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oIVIP-0006vg-IQ; Mon, 01 Aug 2022 09:17:21 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:49807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oIVIN-0008Cm-87; Mon, 01 Aug 2022 09:17:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 7861A22DF5;
 Mon,  1 Aug 2022 13:17:13 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 1 Aug 2022
 15:17:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004be149701-54ee-44b1-9775-99117ff54d63,
 66502E4E103EEE15469CB707343CF715E22A318D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.55.30.80
Message-ID: <864c728d-0359-d00e-3009-ca73944a05ab@kaod.org>
Date: Mon, 1 Aug 2022 15:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 18/19] ppc/ppc405: QOM'ify UIC
Content-Language: en-US
To: <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>, 
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-19-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220801131039.1693913-19-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 6ca5be1b-ee1d-4ec2-9731-2b82e549eddb
X-Ovh-Tracer-Id: 15157146020967910368
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvfedgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel,

On 8/1/22 15:10, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
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

There is a compile bug in this patch. If you consider applying the patchset,
please fold in the following changes. Sorry about that.

Thanks,

C.


@@ -1616,7 +1616,7 @@ static void ppc405_soc_realize(DeviceSta
  
      for (i = 0; i < ARRAY_SIZE(s->gpt.irqs); i++) {
          sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt), i,
-                           qdev_get_gpio_in(&s->uic, 19 + i));
+                           qdev_get_gpio_in(DEVICE(&s->uic), 19 + i));
      }
  
      /* MAL */
@@ -1630,7 +1630,7 @@ static void ppc405_soc_realize(DeviceSta
  
      for (i = 0; i < ARRAY_SIZE(s->mal.irqs); i++) {
          sysbus_connect_irq(SYS_BUS_DEVICE(&s->mal), i,
-                           qdev_get_gpio_in(&s->uic, 11 + i));
+                           qdev_get_gpio_in(DEVICE(&s->uic), 11 + i));
      }
  
      /* Ethernet */





