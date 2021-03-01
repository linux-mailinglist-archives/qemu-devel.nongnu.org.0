Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B1327C91
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:49:13 +0100 (CET)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGg6z-0005Q1-0M
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGfzs-0000gQ-05; Mon, 01 Mar 2021 05:41:52 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:37225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGfzp-00066Y-0k; Mon, 01 Mar 2021 05:41:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id AA10392B2C13;
 Mon,  1 Mar 2021 11:41:44 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 11:41:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004893f649b-fd80-492e-a134-f94c6a2c1084,
 79E354DF6B7F793720F6EA4F82BCB5A412373A8E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 5/5] hw/misc: Model KCS devices in the Aspeed LPC
 controller
To: Andrew Jeffery <andrew@aj.id.au>, <qemu-arm@nongnu.org>
References: <20210301010610.355702-1-andrew@aj.id.au>
 <20210301010610.355702-6-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <33aead82-c20e-503a-850c-ade71e9bbf90@kaod.org>
Date: Mon, 1 Mar 2021 11:41:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210301010610.355702-6-andrew@aj.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 907e35b7-da04-4dfa-9657-24473149ec98
X-Ovh-Tracer-Id: 14188590630299994988
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghnughrvgifsegrjhdrihgurdgruh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 f4bug@amsat.org, qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 2:06 AM, Andrew Jeffery wrote:
> Keyboard-Controller-Style devices for IPMI purposes are exposed via LPC
> IO cycles from the BMC to the host.
> 
> Expose support on the BMC side by implementing the usual MMIO
> behaviours, and expose the ability to inspect the KCS registers in
> "host" style by accessing QOM properties associated with each register.
> 
> The model caters to the IRQ style of both the AST2600 and the earlier
> SoCs (AST2400 and AST2500). The AST2600 allocates an IRQ for each LPC
> sub-device, while there is a single IRQ shared across all subdevices on
> the AST2400 and AST2500.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>  hw/arm/aspeed_ast2600.c      |  28 ++-
>  hw/arm/aspeed_soc.c          |  24 ++-
>  hw/misc/aspeed_lpc.c         | 359 ++++++++++++++++++++++++++++++++++-
>  include/hw/arm/aspeed_soc.h  |   1 +
>  include/hw/misc/aspeed_lpc.h |  17 +-
>  5 files changed, 424 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 60152de001e6..fd463775d281 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -104,7 +104,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>      [ASPEED_DEV_ETH2]      = 3,
>      [ASPEED_DEV_ETH3]      = 32,
>      [ASPEED_DEV_ETH4]      = 33,
> -
> +    [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
>  };
>  
>  static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> @@ -477,8 +477,34 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
> +
> +    /* Connect the LPC IRQ to the GIC. It is otherwise unused. */
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
>                         aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
> +
> +    /*
> +     * On the AST2600 LPC subdevice IRQs are connected straight to the GIC.
> +     *
> +     * LPC subdevice IRQ sources are offset from 1 because the LPC model caters
> +     * to the AST2400 and AST2500. SoCs before the AST2600 have one LPC IRQ
> +     * shared across the subdevices, and the shared IRQ output to the VIC is at
> +     * offset 0.
> +     */
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_1,
> +                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> +                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_1));
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_2,
> +                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> +                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_2));
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_3,
> +                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> +                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_3));
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
> +                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> +                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
>  }
>  
>  static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 4f098da437ac..057d053c8478 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -112,7 +112,6 @@ static const int aspeed_soc_ast2400_irqmap[] = {
>      [ASPEED_DEV_WDT]    = 27,
>      [ASPEED_DEV_PWM]    = 28,
>      [ASPEED_DEV_LPC]    = 8,
> -    [ASPEED_DEV_IBT]    = 8, /* LPC */
>      [ASPEED_DEV_I2C]    = 12,
>      [ASPEED_DEV_ETH1]   = 2,
>      [ASPEED_DEV_ETH2]   = 3,
> @@ -401,8 +400,31 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
> +
> +    /* Connect the LPC IRQ to the VIC */
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
>                         aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
> +
> +    /*
> +     * On the AST2400 and AST2500 the one LPC IRQ is shared between all of the
> +     * subdevices. Connect the LPC subdevice IRQs to the LPC controller IRQ (by
> +     * contrast, on the AST2600, the subdevice IRQs are connected straight to
> +     * the GIC).
> +     *
> +     * LPC subdevice IRQ sources are offset from 1 because the shared IRQ output
> +     * to the VIC is at offset 0.
> +     */
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_1,
> +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_1));
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_2,
> +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_2));
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_3,
> +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_3));
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
> +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_4));
>  }
>  static Property aspeed_soc_properties[] = {
>      DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
> diff --git a/hw/misc/aspeed_lpc.c b/hw/misc/aspeed_lpc.c
> index e668e985ff04..2dddb27c35d0 100644
> --- a/hw/misc/aspeed_lpc.c
> +++ b/hw/misc/aspeed_lpc.c
> @@ -12,20 +12,301 @@
>  #include "qemu/error-report.h"
>  #include "hw/misc/aspeed_lpc.h"
>  #include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  
>  #define TO_REG(offset) ((offset) >> 2)
>  
>  #define HICR0                TO_REG(0x00)
> +#define   HICR0_LPC3E        BIT(7)
> +#define   HICR0_LPC2E        BIT(6)
> +#define   HICR0_LPC1E        BIT(5)
>  #define HICR1                TO_REG(0x04)
>  #define HICR2                TO_REG(0x08)
> +#define   HICR2_IBFIE3       BIT(3)
> +#define   HICR2_IBFIE2       BIT(2)
> +#define   HICR2_IBFIE1       BIT(1)
>  #define HICR3                TO_REG(0x0C)
>  #define HICR4                TO_REG(0x10)
> +#define   HICR4_KCSENBL      BIT(2)
> +#define IDR1                 TO_REG(0x24)
> +#define IDR2                 TO_REG(0x28)
> +#define IDR3                 TO_REG(0x2C)
> +#define ODR1                 TO_REG(0x30)
> +#define ODR2                 TO_REG(0x34)
> +#define ODR3                 TO_REG(0x38)
> +#define STR1                 TO_REG(0x3C)
> +#define   STR_OBF            BIT(0)
> +#define   STR_IBF            BIT(1)
> +#define   STR_CMD_DATA       BIT(3)
> +#define STR2                 TO_REG(0x40)
> +#define STR3                 TO_REG(0x44)
>  #define HICR5                TO_REG(0x80)
>  #define HICR6                TO_REG(0x84)
>  #define HICR7                TO_REG(0x88)
>  #define HICR8                TO_REG(0x8C)
> +#define HICRB                TO_REG(0x100)
> +#define   HICRB_IBFIE4       BIT(1)
> +#define   HICRB_LPC4E        BIT(0)
> +#define IDR4                 TO_REG(0x114)
> +#define ODR4                 TO_REG(0x118)
> +#define STR4                 TO_REG(0x11C)
> +
> +enum aspeed_kcs_channel_id {
> +    kcs_channel_1 = 0,
> +    kcs_channel_2,
> +    kcs_channel_3,
> +    kcs_channel_4,
> +};
> +
> +static const enum aspeed_lpc_subdevice aspeed_kcs_subdevice_map[] = {
> +    [kcs_channel_1] = aspeed_lpc_kcs_1,
> +    [kcs_channel_2] = aspeed_lpc_kcs_2,
> +    [kcs_channel_3] = aspeed_lpc_kcs_3,
> +    [kcs_channel_4] = aspeed_lpc_kcs_4,
> +};
> +
> +struct aspeed_kcs_channel {
> +    enum aspeed_kcs_channel_id id;
> +
> +    int idr;
> +    int odr;
> +    int str;
> +};
> +
> +static const struct aspeed_kcs_channel aspeed_kcs_channel_map[] = {
> +    [kcs_channel_1] = {
> +        .id = kcs_channel_1,
> +        .idr = IDR1,
> +        .odr = ODR1,
> +        .str = STR1
> +    },
> +
> +    [kcs_channel_2] = {
> +        .id = kcs_channel_2,
> +        .idr = IDR2,
> +        .odr = ODR2,
> +        .str = STR2
> +    },
> +
> +    [kcs_channel_3] = {
> +        .id = kcs_channel_3,
> +        .idr = IDR3,
> +        .odr = ODR3,
> +        .str = STR3
> +    },
> +
> +    [kcs_channel_4] = {
> +        .id = kcs_channel_4,
> +        .idr = IDR4,
> +        .odr = ODR4,
> +        .str = STR4
> +    },
> +};
> +
> +struct aspeed_kcs_register_data {
> +    const char *name;
> +    int reg;
> +    const struct aspeed_kcs_channel *chan;
> +};
> +
> +static const struct aspeed_kcs_register_data aspeed_kcs_registers[] = {
> +    {
> +        .name = "idr1",
> +        .reg = IDR1,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_1],
> +    },
> +    {
> +        .name = "odr1",
> +        .reg = ODR1,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_1],
> +    },
> +    {
> +        .name = "str1",
> +        .reg = STR1,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_1],
> +    },
> +    {
> +        .name = "idr2",
> +        .reg = IDR2,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_2],
> +    },
> +    {
> +        .name = "odr2",
> +        .reg = ODR2,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_2],
> +    },
> +    {
> +        .name = "str2",
> +        .reg = STR2,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_2],
> +    },
> +    {
> +        .name = "idr3",
> +        .reg = IDR3,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_3],
> +    },
> +    {
> +        .name = "odr3",
> +        .reg = ODR3,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_3],
> +    },
> +    {
> +        .name = "str3",
> +        .reg = STR3,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_3],
> +    },
> +    {
> +        .name = "idr4",
> +        .reg = IDR4,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_4],
> +    },
> +    {
> +        .name = "odr4",
> +        .reg = ODR4,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_4],
> +    },
> +    {
> +        .name = "str4",
> +        .reg = STR4,
> +        .chan = &aspeed_kcs_channel_map[kcs_channel_4],
> +    },
> +    { },
> +};
> +
> +static const struct aspeed_kcs_register_data *
> +aspeed_kcs_get_register_data_by_name(const char *name)
> +{
> +    const struct aspeed_kcs_register_data *pos = aspeed_kcs_registers;
> +
> +    while (pos->name) {
> +        if (!strcmp(pos->name, name)) {
> +            return pos;
> +        }
> +        pos++;
> +    }
> +
> +    return NULL;
> +}
> +
> +static const struct aspeed_kcs_channel *
> +aspeed_kcs_get_channel_by_register(int reg)
> +{
> +    const struct aspeed_kcs_register_data *pos = aspeed_kcs_registers;
> +
> +    while (pos->name) {
> +        if (pos->reg == reg) {
> +            return pos->chan;
> +        }
> +        pos++;
> +    }
> +
> +    return NULL;
> +}
> +
> +static void aspeed_kcs_get_register_property(Object *obj,
> +                                             Visitor *v,
> +                                             const char *name,
> +                                             void *opaque,
> +                                             Error **errp)
> +{
> +    const struct aspeed_kcs_register_data *data;
> +    AspeedLPCState *s = ASPEED_LPC(obj);
> +    uint32_t val;
> +
> +    data = aspeed_kcs_get_register_data_by_name(name);
> +    if (!data) {
> +        return;
> +    }
> +
> +    if (!strncmp("odr", name, 3)) {
> +        s->regs[data->chan->str] &= ~STR_OBF;
> +    }
> +
> +    val = s->regs[data->reg];
> +
> +    visit_type_uint32(v, name, &val, errp);
> +}
> +
> +static bool aspeed_kcs_channel_enabled(AspeedLPCState *s,
> +                                       const struct aspeed_kcs_channel *channel)
> +{
> +    switch (channel->id) {
> +    case kcs_channel_1: return s->regs[HICR0] & HICR0_LPC1E;
> +    case kcs_channel_2: return s->regs[HICR0] & HICR0_LPC2E;
> +    case kcs_channel_3:
> +        return (s->regs[HICR0] & HICR0_LPC3E) &&
> +                    (s->regs[HICR4] & HICR4_KCSENBL);
> +    case kcs_channel_4: return s->regs[HICRB] & HICRB_LPC4E;
> +    default: return false;
> +    }
> +}
> +
> +static bool
> +aspeed_kcs_channel_ibf_irq_enabled(AspeedLPCState *s,
> +                                   const struct aspeed_kcs_channel *channel)
> +{
> +    if (!aspeed_kcs_channel_enabled(s, channel)) {
> +            return false;
> +    }
> +
> +    switch (channel->id) {
> +    case kcs_channel_1: return s->regs[HICR2] & HICR2_IBFIE1;
> +    case kcs_channel_2: return s->regs[HICR2] & HICR2_IBFIE2;
> +    case kcs_channel_3: return s->regs[HICR2] & HICR2_IBFIE3;
> +    case kcs_channel_4: return s->regs[HICRB] & HICRB_IBFIE4;
> +    default: return false;
> +    }
> +}
> +
> +static void aspeed_kcs_set_register_property(Object *obj,
> +                                             Visitor *v,
> +                                             const char *name,
> +                                             void *opaque,
> +                                             Error **errp)
> +{
> +    const struct aspeed_kcs_register_data *data;
> +    AspeedLPCState *s = ASPEED_LPC(obj);
> +    uint32_t val;
> +
> +    data = aspeed_kcs_get_register_data_by_name(name);
> +    if (!data) {
> +        return;
> +    }
> +
> +    if (!visit_type_uint32(v, name, &val, errp)) {
> +        return;
> +    }
> +
> +    if (strncmp("str", name, 3)) {
> +        s->regs[data->reg] = val;
> +    }
> +
> +    if (!strncmp("idr", name, 3)) {
> +        s->regs[data->chan->str] |= STR_IBF;
> +        if (aspeed_kcs_channel_ibf_irq_enabled(s, data->chan)) {
> +            enum aspeed_lpc_subdevice subdev;
> +
> +            subdev = aspeed_kcs_subdevice_map[data->chan->id];
> +            qemu_irq_raise(s->subdevice_irqs[subdev]);
> +        }
> +    }
> +}
> +
> +static void aspeed_lpc_set_irq(void *opaque, int irq, int level)
> +{
> +    AspeedLPCState *s = (AspeedLPCState *)opaque;
> +
> +    if (level) {
> +        s->subdevice_irqs_pending |= BIT(irq);
> +    } else {
> +        s->subdevice_irqs_pending &= ~BIT(irq);
> +    }
> +
> +    qemu_set_irq(s->irq, !!s->subdevice_irqs_pending);
> +}
>  
>  static uint64_t aspeed_lpc_read(void *opaque, hwaddr offset, unsigned size)
>  {
> @@ -39,6 +320,29 @@ static uint64_t aspeed_lpc_read(void *opaque, hwaddr offset, unsigned size)
>          return 0;
>      }
>  
> +    switch (reg) {
> +    case IDR1:
> +    case IDR2:
> +    case IDR3:
> +    case IDR4:
> +    {
> +        const struct aspeed_kcs_channel *channel;
> +
> +        channel = aspeed_kcs_get_channel_by_register(reg);
> +        if (s->regs[channel->str] & STR_IBF) {
> +            enum aspeed_lpc_subdevice subdev;
> +
> +            subdev = aspeed_kcs_subdevice_map[channel->id];
> +            qemu_irq_lower(s->subdevice_irqs[subdev]);
> +        }
> +
> +        s->regs[channel->str] &= ~STR_IBF;
> +        break;
> +    }
> +    default:
> +        break;
> +    }
> +
>      return s->regs[reg];
>  }
>  
> @@ -55,6 +359,18 @@ static void aspeed_lpc_write(void *opaque, hwaddr offset, uint64_t data,
>          return;
>      }
>  
> +
> +    switch (reg) {
> +    case ODR1:
> +    case ODR2:
> +    case ODR3:
> +    case ODR4:
> +        s->regs[aspeed_kcs_get_channel_by_register(reg)->str] |= STR_OBF;
> +        break;
> +    default:
> +        break;
> +    }
> +
>      s->regs[reg] = data;
>  }
>  
> @@ -72,6 +388,8 @@ static void aspeed_lpc_reset(DeviceState *dev)
>  {
>      struct AspeedLPCState *s = ASPEED_LPC(dev);
>  
> +    s->subdevice_irqs_pending = 0;
> +
>      memset(s->regs, 0, sizeof(s->regs));
>  
>      s->regs[HICR7] = s->hicr7;
> @@ -83,19 +401,55 @@ static void aspeed_lpc_realize(DeviceState *dev, Error **errp)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>  
>      sysbus_init_irq(sbd, &s->irq);
> +    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_1]);
> +    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_2]);
> +    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_3]);
> +    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_4]);
> +    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_ibt]);
>  
>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_lpc_ops, s,
>              TYPE_ASPEED_LPC, 0x1000);
>  
>      sysbus_init_mmio(sbd, &s->iomem);
> +
> +    qdev_init_gpio_in(dev, aspeed_lpc_set_irq, ASPEED_LPC_NR_SUBDEVS);
> +}
> +
> +static void aspeed_lpc_init(Object *obj)
> +{
> +    object_property_add(obj, "idr1", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
> +    object_property_add(obj, "odr1", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
> +    object_property_add(obj, "str1", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
> +    object_property_add(obj, "idr2", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
> +    object_property_add(obj, "odr2", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
> +    object_property_add(obj, "str2", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
> +    object_property_add(obj, "idr3", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
> +    object_property_add(obj, "odr3", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
> +    object_property_add(obj, "str3", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
> +    object_property_add(obj, "idr4", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
> +    object_property_add(obj, "odr4", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
> +    object_property_add(obj, "str4", "uint32", aspeed_kcs_get_register_property,
> +                        aspeed_kcs_set_register_property, NULL, NULL);
>  }
>  
>  static const VMStateDescription vmstate_aspeed_lpc = {
>      .name = TYPE_ASPEED_LPC,
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(regs, AspeedLPCState, ASPEED_LPC_NR_REGS),
> +        VMSTATE_UINT32(subdevice_irqs_pending, AspeedLPCState),
>          VMSTATE_END_OF_LIST(),
>      }
>  };
> @@ -121,6 +475,7 @@ static const TypeInfo aspeed_lpc_info = {
>      .parent = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(AspeedLPCState),
>      .class_init = aspeed_lpc_class_init,
> +    .instance_init = aspeed_lpc_init,
>  };
>  
>  static void aspeed_lpc_register_types(void)
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 42c64bd28ba2..9359d6da336d 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -132,6 +132,7 @@ enum {
>      ASPEED_DEV_SDRAM,
>      ASPEED_DEV_XDMA,
>      ASPEED_DEV_EMMC,
> +    ASPEED_DEV_KCS,
>  };
>  
>  #endif /* ASPEED_SOC_H */
> diff --git a/include/hw/misc/aspeed_lpc.h b/include/hw/misc/aspeed_lpc.h
> index 0fbb7f68bed2..df418cfcd36c 100644
> --- a/include/hw/misc/aspeed_lpc.h
> +++ b/include/hw/misc/aspeed_lpc.h
> @@ -12,10 +12,22 @@
>  
>  #include "hw/sysbus.h"
>  
> +#include <stdint.h>
> +
>  #define TYPE_ASPEED_LPC "aspeed.lpc"
>  #define ASPEED_LPC(obj) OBJECT_CHECK(AspeedLPCState, (obj), TYPE_ASPEED_LPC)
>  
> -#define ASPEED_LPC_NR_REGS (0x260 >> 2)
> +#define ASPEED_LPC_NR_REGS      (0x260 >> 2)
> +
> +enum aspeed_lpc_subdevice {
> +    aspeed_lpc_kcs_1 = 0,
> +    aspeed_lpc_kcs_2,
> +    aspeed_lpc_kcs_3,
> +    aspeed_lpc_kcs_4,
> +    aspeed_lpc_ibt,
> +};
> +
> +#define ASPEED_LPC_NR_SUBDEVS   5
>  
>  typedef struct AspeedLPCState {
>      /* <private> */
> @@ -25,6 +37,9 @@ typedef struct AspeedLPCState {
>      MemoryRegion iomem;
>      qemu_irq irq;
>  
> +    qemu_irq subdevice_irqs[ASPEED_LPC_NR_SUBDEVS];
> +    uint32_t subdevice_irqs_pending;
> +
>      uint32_t regs[ASPEED_LPC_NR_REGS];
>      uint32_t hicr7;
>  } AspeedLPCState;
> 


