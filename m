Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD48327527
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:17:15 +0100 (CET)
Received: from localhost ([::1]:51368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVJK-00046f-1U
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGVHJ-00037q-W1; Sun, 28 Feb 2021 18:15:10 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:37889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGVHH-0004Ak-2z; Sun, 28 Feb 2021 18:15:09 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 371B55C0071;
 Sun, 28 Feb 2021 18:15:06 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 28 Feb 2021 18:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=SMUyp
 D6Ci/9Y+MgUwE1r0+9ST5FDZAAzCfjQ1khu6Wo=; b=rP/8FykPKFe2ee03pHvFZ
 WzjdLIHpnWPfbzpXLvupOZsyyrKxIy9RbxSS83yo73EYjXC3QNNfpO+Wb9M8eYGp
 Me2Tj7pUq4hW/Q0//TJ7eG8HQT8YgdthkY8tpMfF7Rvi0issdhIh7TxGtCFLQQHD
 sDP2g8HD3kmXdstfjs7/prbFwRkQA96OThU9KkUK/w0vd0W8JxVGjAUVYbPpYTpW
 4bXJy73nIG3Ka7nYqmCq1uRe1N9RYx7NoXLUYClnvASndSD6A3cx1XzX3DE9UHiA
 uuel7lJtQ0SOmCJSRDjTRZhALoTvm2DLXYszavJK8R5lYyfyd70A4Qm1oOVcaBSs
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=SMUypD6Ci/9Y+MgUwE1r0+9ST5FDZAAzCfjQ1khu6
 Wo=; b=Jfu6tarCLq0iN4HRARfv+UBCoNg5aJ+BD9ijowjlADR+HzxNiNJrK4Ssq
 jLjGEVjDq9GraRJ06YM/dysrlVGLpabZWrQVuNjXh29v1tAF1OyN96TkI+ieGmXQ
 smGd7L9+xCiJKPu7c7nu2+JcNn0FdvsyCMVr3voQG3phy9v6kLaEcTTInZRoBSp5
 954uB8Nyv97jdqLl+zpbQhaMEykn2wbFmoIyMkmVnQZT6ru43ByxzT38OrJhMjYe
 v7FDtgMuSP+1cf8vpAFd23DtbZPc1VJwYNtVkwkTQR5DfniLSHgt4qMORw28DISt
 qZRKV0qZ3IIVYVPt0G4ujEutVCn5A==
X-ME-Sender: <xms:-CM8YNNA5oBPIit7lkFwMXa-ymeBOqWbU0TTqgeVIv_EQlnYtjCasg>
 <xme:-CM8YP9HwcTGAEuqpUTcnnRdZNj0ay0AZtqGvho_ayp6UwQD_31EwDLyCDcKC4wKi
 FU6WxaQuQLboyFxDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleejgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:-CM8YMQZb-V0I3ObJfRjT7Z7CHEYazvg2g6uTH6Z6TIIgBHesg_fXg>
 <xmx:-CM8YJt8B39_2w_GDj0iJznjOX287xHQd_a7t1SDXwly9h2wGpV7ig>
 <xmx:-CM8YFcUS1WFYi-WVHI8r8JZwzM0fDqdLCi_V13QjuJuL4od41L_PQ>
 <xmx:-iM8YM6dFYr-aMlQB_DkSWP6iXh5yCzLG4Su2-BlzBSmzrYNi2gXog>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B65C6A00064; Sun, 28 Feb 2021 18:15:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <b4c15450-8a7e-4ad1-a987-152c10663b65@www.fastmail.com>
In-Reply-To: <4f43d303-3859-90e7-0a94-2fe08a2aefa0@kaod.org>
References: <20210226065758.547824-1-andrew@aj.id.au>
 <20210226065758.547824-5-andrew@aj.id.au>
 <4f43d303-3859-90e7-0a94-2fe08a2aefa0@kaod.org>
Date: Mon, 01 Mar 2021 09:44:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Subject: =?UTF-8?Q?Re:_[PATCH_4/4]_hw/misc:_Model_KCS_devices_in_the_Aspeed_LPC_c?=
 =?UTF-8?Q?ontroller?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Corey Minyard <minyard@acm.org>, Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 26 Feb 2021, at 20:21, C=C3=A9dric Le Goater wrote:
> On 2/26/21 7:57 AM, Andrew Jeffery wrote:
> > Keyboard-Controller-Style devices for IPMI purposes are exposed via =
LPC
> > IO cycles from the BMC to the host.
> >=20
> > Expose support on the BMC side by implementing the usual MMIO
> > behaviours, and expose the ability to inspect the KCS registers in
> > "host" style by accessing QOM properties associated with each regist=
er.
> >=20
> > The model caters to the IRQ style of both the AST2600 and the earlie=
r
> > SoCs (AST2400 and AST2500). The AST2600 allocates an IRQ for each LP=
C
> > sub-device, while there is a single IRQ shared across all subdevices=
 on
> > the AST2400 and AST2500.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  hw/arm/aspeed_ast2600.c      |  28 ++-
> >  hw/arm/aspeed_soc.c          |  24 ++-
> >  hw/misc/aspeed_lpc.c         | 354 ++++++++++++++++++++++++++++++++=
+++
> >  include/hw/arm/aspeed_soc.h  |   1 +
> >  include/hw/misc/aspeed_lpc.h |  17 +-
> >  5 files changed, 421 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index 60152de001e6..fd463775d281 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -104,7 +104,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D=
 {
> >      [ASPEED_DEV_ETH2]      =3D 3,
> >      [ASPEED_DEV_ETH3]      =3D 32,
> >      [ASPEED_DEV_ETH4]      =3D 33,
> > -
> > +    [ASPEED_DEV_KCS]       =3D 138,   /* 138 -> 142 */
> >  };
> > =20
> >  static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> > @@ -477,8 +477,34 @@ static void aspeed_soc_ast2600_realize(DeviceSt=
ate *dev, Error **errp)
> >          return;
> >      }
> >      sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_D=
EV_LPC]);
> > +
> > +    /* Connect the LPC IRQ to the GIC. It is otherwise unused. */
> >      sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
> >                         aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
> > +
> > +    /*
> > +     * On the AST2600 LPC subdevice IRQs are connected straight to =
the GIC.
> > +     *
> > +     * LPC subdevice IRQ sources are offset from 1 because the LPC =
model caters
> > +     * to the AST2400 and AST2500. SoCs before the AST2600 have one=
 LPC IRQ
> > +     * shared across the subdevices, and the shared IRQ output to t=
he VIC is at
> > +     * offset 0.
> > +     */
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_=
1,
> > +                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> > +                                sc->irqmap[ASPEED_DEV_KCS] + aspeed=
_lpc_kcs_1));
> > +
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_=
2,
> > +                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> > +                                sc->irqmap[ASPEED_DEV_KCS] + aspeed=
_lpc_kcs_2));
> > +
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_=
3,
> > +                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> > +                                sc->irqmap[ASPEED_DEV_KCS] + aspeed=
_lpc_kcs_3));
> > +
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_=
4,
> > +                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> > +                                sc->irqmap[ASPEED_DEV_KCS] + aspeed=
_lpc_kcs_4));
> >  }
> > =20
> >  static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *da=
ta)
> > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > index 4f098da437ac..057d053c8478 100644
> > --- a/hw/arm/aspeed_soc.c
> > +++ b/hw/arm/aspeed_soc.c
> > @@ -112,7 +112,6 @@ static const int aspeed_soc_ast2400_irqmap[] =3D=
 {
> >      [ASPEED_DEV_WDT]    =3D 27,
> >      [ASPEED_DEV_PWM]    =3D 28,
> >      [ASPEED_DEV_LPC]    =3D 8,
> > -    [ASPEED_DEV_IBT]    =3D 8, /* LPC */
> >      [ASPEED_DEV_I2C]    =3D 12,
> >      [ASPEED_DEV_ETH1]   =3D 2,
> >      [ASPEED_DEV_ETH2]   =3D 3,
> > @@ -401,8 +400,31 @@ static void aspeed_soc_realize(DeviceState *dev=
, Error **errp)
> >          return;
> >      }
> >      sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_D=
EV_LPC]);
> > +
> > +    /* Connect the LPC IRQ to the VIC */
> >      sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
> >                         aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
> > +
> > +    /*
> > +     * On the AST2400 and AST2500 the one LPC IRQ is shared between=
 all of the
> > +     * subdevices. Connect the LPC subdevice IRQs to the LPC contro=
ller IRQ (by
> > +     * contrast, on the AST2600, the subdevice IRQs are connected s=
traight to
> > +     * the GIC).
> > +     *
> > +     * LPC subdevice IRQ sources are offset from 1 because the shar=
ed IRQ output
> > +     * to the VIC is at offset 0.
> > +     */
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_=
1,
> > +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc=
_kcs_1));
> > +
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_=
2,
> > +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc=
_kcs_2));
> > +
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_=
3,
> > +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc=
_kcs_3));
> > +
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_=
4,
> > +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc=
_kcs_4));
> >  }
> >  static Property aspeed_soc_properties[] =3D {
> >      DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_R=
EGION,
> > diff --git a/hw/misc/aspeed_lpc.c b/hw/misc/aspeed_lpc.c
> > index e668e985ff04..672131209dfa 100644
> > --- a/hw/misc/aspeed_lpc.c
> > +++ b/hw/misc/aspeed_lpc.c
> > @@ -12,20 +12,301 @@
> >  #include "qemu/error-report.h"
> >  #include "hw/misc/aspeed_lpc.h"
> >  #include "qapi/error.h"
> > +#include "qapi/visitor.h"
> > +#include "hw/irq.h"
> >  #include "hw/qdev-properties.h"
> >  #include "migration/vmstate.h"
> > =20
> >  #define TO_REG(offset) ((offset) >> 2)
> > =20
> >  #define HICR0                TO_REG(0x00)
> > +#define   HICR0_LPC3E        BIT(7)
> > +#define   HICR0_LPC2E        BIT(6)
> > +#define   HICR0_LPC1E        BIT(5)
> >  #define HICR1                TO_REG(0x04)
> >  #define HICR2                TO_REG(0x08)
> > +#define   HICR2_IBFIE3       BIT(3)
> > +#define   HICR2_IBFIE2       BIT(2)
> > +#define   HICR2_IBFIE1       BIT(1)
> >  #define HICR3                TO_REG(0x0C)
> >  #define HICR4                TO_REG(0x10)
> > +#define   HICR4_KCSENBL      BIT(2)
> > +#define IDR1                 TO_REG(0x24)
> > +#define IDR2                 TO_REG(0x28)
> > +#define IDR3                 TO_REG(0x2C)
> > +#define ODR1                 TO_REG(0x30)
> > +#define ODR2                 TO_REG(0x34)
> > +#define ODR3                 TO_REG(0x38)
> > +#define STR1                 TO_REG(0x3C)
> > +#define   STR_OBF            BIT(0)
> > +#define   STR_IBF            BIT(1)
> > +#define   STR_CMD_DATA       BIT(3)
> > +#define STR2                 TO_REG(0x40)
> > +#define STR3                 TO_REG(0x44)
> >  #define HICR5                TO_REG(0x80)
> >  #define HICR6                TO_REG(0x84)
> >  #define HICR7                TO_REG(0x88)
> >  #define HICR8                TO_REG(0x8C)
> > +#define HICRB                TO_REG(0x100)
> > +#define   HICRB_IBFIE4       BIT(1)
> > +#define   HICRB_LPC4E        BIT(0)
> > +#define IDR4                 TO_REG(0x114)
> > +#define ODR4                 TO_REG(0x118)
> > +#define STR4                 TO_REG(0x11C)
> > +
> > +enum aspeed_kcs_channel_id {
> > +    kcs_channel_1 =3D 0,
> > +    kcs_channel_2,
> > +    kcs_channel_3,
> > +    kcs_channel_4,
> > +};
> > +
> > +static const enum aspeed_lpc_subdevice aspeed_kcs_subdevice_map[] =3D=
 {
> > +    [kcs_channel_1] =3D aspeed_lpc_kcs_1,
> > +    [kcs_channel_2] =3D aspeed_lpc_kcs_2,
> > +    [kcs_channel_3] =3D aspeed_lpc_kcs_3,
> > +    [kcs_channel_4] =3D aspeed_lpc_kcs_4,
> > +};
> > +
> > +struct aspeed_kcs_channel {
> > +    enum aspeed_kcs_channel_id id;
> > +
> > +    int idr;
> > +    int odr;
> > +    int str;
> > +};
> > +
> > +static const struct aspeed_kcs_channel aspeed_kcs_channel_map[] =3D=
 {
> > +    [kcs_channel_1] =3D {
> > +        .id =3D kcs_channel_1,
> > +        .idr =3D IDR1,
> > +        .odr =3D ODR1,
> > +        .str =3D STR1
> > +    },
> > +
> > +    [kcs_channel_2] =3D {
> > +        .id =3D kcs_channel_2,
> > +        .idr =3D IDR2,
> > +        .odr =3D ODR2,
> > +        .str =3D STR2
> > +    },
> > +
> > +    [kcs_channel_3] =3D {
> > +        .id =3D kcs_channel_3,
> > +        .idr =3D IDR3,
> > +        .odr =3D ODR3,
> > +        .str =3D STR3
> > +    },
> > +
> > +    [kcs_channel_4] =3D {
> > +        .id =3D kcs_channel_4,
> > +        .idr =3D IDR4,
> > +        .odr =3D ODR4,
> > +        .str =3D STR4
> > +    },
> > +};
> > +
> > +struct aspeed_kcs_register_data {
> > +    const char *name;
> > +    int reg;
> > +    const struct aspeed_kcs_channel *chan;
> > +};
> > +
> > +static const struct aspeed_kcs_register_data aspeed_kcs_registers[]=
 =3D {
> > +    {
> > +        .name =3D "idr1",
> > +        .reg =3D IDR1,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_1],
> > +    },
> > +    {
> > +        .name =3D "odr1",
> > +        .reg =3D ODR1,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_1],
> > +    },
> > +    {
> > +        .name =3D "str1",
> > +        .reg =3D STR1,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_1],
> > +    },
> > +    {
> > +        .name =3D "idr2",
> > +        .reg =3D IDR2,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_2],
> > +    },
> > +    {
> > +        .name =3D "odr2",
> > +        .reg =3D ODR2,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_2],
> > +    },
> > +    {
> > +        .name =3D "str2",
> > +        .reg =3D STR2,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_2],
> > +    },
> > +    {
> > +        .name =3D "idr3",
> > +        .reg =3D IDR3,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_3],
> > +    },
> > +    {
> > +        .name =3D "odr3",
> > +        .reg =3D ODR3,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_3],
> > +    },
> > +    {
> > +        .name =3D "str3",
> > +        .reg =3D STR3,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_3],
> > +    },
> > +    {
> > +        .name =3D "idr4",
> > +        .reg =3D IDR4,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_4],
> > +    },
> > +    {
> > +        .name =3D "odr4",
> > +        .reg =3D ODR4,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_4],
> > +    },
> > +    {
> > +        .name =3D "str4",
> > +        .reg =3D STR4,
> > +        .chan =3D &aspeed_kcs_channel_map[kcs_channel_4],
> > +    },
> > +    { },
> > +};
> > +
> > +static const struct aspeed_kcs_register_data *
> > +aspeed_kcs_get_register_data_by_name(const char *name)
> > +{
> > +    const struct aspeed_kcs_register_data *pos =3D aspeed_kcs_regis=
ters;
> > +
> > +    while (pos->name) {
> > +        if (!strcmp(pos->name, name)) {
> > +            return pos;
> > +        }
> > +        pos++;
> > +    }
> > +
> > +    return NULL;
> > +}
> > +
> > +static const struct aspeed_kcs_channel *
> > +aspeed_kcs_get_channel_by_register(int reg)
> > +{
> > +    const struct aspeed_kcs_register_data *pos =3D aspeed_kcs_regis=
ters;
> > +
> > +    while (pos->name) {
> > +        if (pos->reg =3D=3D reg) {
> > +            return pos->chan;
> > +        }
> > +        pos++;
> > +    }
> > +
> > +    return NULL;
> > +}
> > +
> > +static void aspeed_kcs_get_register_property(Object *obj,
> > +                                             Visitor *v,
> > +                                             const char *name,
> > +                                             void *opaque,
> > +                                             Error **errp)
> > +{
> > +    const struct aspeed_kcs_register_data *data;
> > +    AspeedLPCState *s =3D ASPEED_LPC(obj);
> > +    uint32_t val;
> > +
> > +    data =3D aspeed_kcs_get_register_data_by_name(name);
> > +    if (!data) {
> > +        return;
> > +    }
> > +
> > +    if (!strncmp("odr", name, 3)) {
> > +        s->regs[data->chan->str] &=3D ~STR_OBF;
> > +    }
> > +
> > +    val =3D s->regs[data->reg];
> > +
> > +    visit_type_uint32(v, name, &val, errp);
> > +}
> > +
> > +static bool aspeed_kcs_channel_enabled(AspeedLPCState *s,
> > +                                       const struct aspeed_kcs_chan=
nel *channel)
> > +{
> > +    switch (channel->id) {
> > +    case kcs_channel_1: return s->regs[HICR0] & HICR0_LPC1E;
> > +    case kcs_channel_2: return s->regs[HICR0] & HICR0_LPC2E;
> > +    case kcs_channel_3:
> > +        return (s->regs[HICR0] & HICR0_LPC3E) &&
> > +                    (s->regs[HICR4] & HICR4_KCSENBL);
> > +    case kcs_channel_4: return s->regs[HICRB] & HICRB_LPC4E;
> > +    default: return false;
> > +    }
> > +}
> > +
> > +static bool
> > +aspeed_kcs_channel_ibf_irq_enabled(AspeedLPCState *s,
> > +                                   const struct aspeed_kcs_channel =
*channel)
> > +{
> > +    if (!aspeed_kcs_channel_enabled(s, channel)) {
> > +            return false;
> > +    }
> > +
> > +    switch (channel->id) {
> > +    case kcs_channel_1: return s->regs[HICR2] & HICR2_IBFIE1;
> > +    case kcs_channel_2: return s->regs[HICR2] & HICR2_IBFIE2;
> > +    case kcs_channel_3: return s->regs[HICR2] & HICR2_IBFIE3;
> > +    case kcs_channel_4: return s->regs[HICRB] & HICRB_IBFIE4;
> > +    default: return false;
> > +    }
> > +}
> > +
> > +static void aspeed_kcs_set_register_property(Object *obj,
> > +                                             Visitor *v,
> > +                                             const char *name,
> > +                                             void *opaque,
> > +                                             Error **errp)
> > +{
> > +    const struct aspeed_kcs_register_data *data;
> > +    AspeedLPCState *s =3D ASPEED_LPC(obj);
> > +    uint32_t val;
> > +
> > +    data =3D aspeed_kcs_get_register_data_by_name(name);
> > +    if (!data) {
> > +        return;
> > +    }
> > +
> > +    if (!visit_type_uint32(v, name, &val, errp)) {
> > +        return;
> > +    }
> > +
> > +    if (strncmp("str", name, 3)) {
> > +        s->regs[data->reg] =3D val;
> > +    }
> > +
> > +    if (!strncmp("idr", name, 3)) {
> > +        s->regs[data->chan->str] |=3D STR_IBF;
> > +        if (aspeed_kcs_channel_ibf_irq_enabled(s, data->chan)) {
> > +            enum aspeed_lpc_subdevice subdev;
> > +
> > +            subdev =3D aspeed_kcs_subdevice_map[data->chan->id];
> > +            qemu_irq_raise(s->subdevice_irqs[subdev]);
> > +        }
> > +    }
> > +}
> > +
> > +static void aspeed_lpc_set_irq(void *opaque, int irq, int level)
> > +{
> > +    AspeedLPCState *s =3D (AspeedLPCState *)opaque;
> > +
> > +    if (level) {
> > +        s->subdevice_irqs_pending |=3D BIT(irq);
> > +    } else {
> > +        s->subdevice_irqs_pending &=3D ~BIT(irq);
> > +    }
> > +
> > +    qemu_set_irq(s->irq, !!s->subdevice_irqs_pending);
> > +}
>=20
>=20
> Nice !

Yeah, I figured this was kind of neat. All the alternatives I tried=20
were worse :)

> I have adapted the iBT model ant it works fine.

I should have mentioned that I had pushed a patch for the BT model to=20=

my tree on github, just hadn't included it in the series I've sent to=20=

the list. Anyway, good to hear it worked for you too.

>=20
> =20
> > =20
> >  static uint64_t aspeed_lpc_read(void *opaque, hwaddr offset, unsign=
ed size)
> >  {
> > @@ -39,6 +320,29 @@ static uint64_t aspeed_lpc_read(void *opaque, hw=
addr offset, unsigned size)
> >          return 0;
> >      }
> > =20
> > +    switch (reg) {
> > +    case IDR1:
> > +    case IDR2:
> > +    case IDR3:
> > +    case IDR4:
> > +    {
> > +        const struct aspeed_kcs_channel *channel;
> > +
> > +        channel =3D aspeed_kcs_get_channel_by_register(reg);
> > +        if (s->regs[channel->str] & STR_IBF) {
> > +            enum aspeed_lpc_subdevice subdev;
> > +
> > +            subdev =3D aspeed_kcs_subdevice_map[channel->id];
> > +            qemu_irq_lower(s->subdevice_irqs[subdev]);
> > +        }
> > +
> > +        s->regs[channel->str] &=3D ~STR_IBF;
> > +        break;
> > +    }
> > +    default:
> > +        break;
> > +    }
> > +
> >      return s->regs[reg];
> >  }
> > =20
> > @@ -55,6 +359,18 @@ static void aspeed_lpc_write(void *opaque, hwadd=
r offset, uint64_t data,
> >          return;
> >      }
> > =20
> > +
> > +    switch (reg) {
> > +    case ODR1:
> > +    case ODR2:
> > +    case ODR3:
> > +    case ODR4:
> > +        s->regs[aspeed_kcs_get_channel_by_register(reg)->str] |=3D =
STR_OBF;
> > +        break;
> > +    default:
> > +        break;
> > +    }
> > +
> >      s->regs[reg] =3D data;
> >  }
> > =20
> > @@ -72,6 +388,8 @@ static void aspeed_lpc_reset(DeviceState *dev)
> >  {
> >      struct AspeedLPCState *s =3D ASPEED_LPC(dev);
> > =20
> > +    s->subdevice_irqs_pending =3D 0;
> > +
> >      memset(s->regs, 0, sizeof(s->regs));
> > =20
> >      s->regs[HICR7] =3D s->hicr7;
> > @@ -83,11 +401,46 @@ static void aspeed_lpc_realize(DeviceState *dev=
, Error **errp)
> >      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> > =20
> >      sysbus_init_irq(sbd, &s->irq);
> > +    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_1]);
> > +    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_2]);
> > +    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_3]);
> > +    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_4]);
> > +    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_ibt]);
> > =20
> >      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_lpc_ops, s,=

> >              TYPE_ASPEED_LPC, 0x1000);
> > =20
> >      sysbus_init_mmio(sbd, &s->iomem);
> > +
> > +    qdev_init_gpio_in(dev, aspeed_lpc_set_irq, ASPEED_LPC_NR_SUBDEV=
S);
> > +}
> > +
> > +static void aspeed_lpc_init(Object *obj)
> > +{
> > +    object_property_add(obj, "idr1", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> > +    object_property_add(obj, "odr1", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> > +    object_property_add(obj, "str1", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> > +    object_property_add(obj, "idr2", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> > +    object_property_add(obj, "odr2", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> > +    object_property_add(obj, "str2", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> > +    object_property_add(obj, "idr3", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> > +    object_property_add(obj, "odr3", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> > +    object_property_add(obj, "str3", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> > +    object_property_add(obj, "idr4", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> > +    object_property_add(obj, "odr4", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> > +    object_property_add(obj, "str4", "uint32", aspeed_kcs_get_regis=
ter_property,
> > +                        aspeed_kcs_set_register_property, NULL, NUL=
L);
> >  }
> > =20
> >  static const VMStateDescription vmstate_aspeed_lpc =3D {
> > @@ -121,6 +474,7 @@ static const TypeInfo aspeed_lpc_info =3D {
> >      .parent =3D TYPE_SYS_BUS_DEVICE,
> >      .instance_size =3D sizeof(AspeedLPCState),
> >      .class_init =3D aspeed_lpc_class_init,
> > +    .instance_init =3D aspeed_lpc_init,
> >  };
> > =20
> >  static void aspeed_lpc_register_types(void)
> > diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc=
.h
> > index 42c64bd28ba2..9359d6da336d 100644
> > --- a/include/hw/arm/aspeed_soc.h
> > +++ b/include/hw/arm/aspeed_soc.h
> > @@ -132,6 +132,7 @@ enum {
> >      ASPEED_DEV_SDRAM,
> >      ASPEED_DEV_XDMA,
> >      ASPEED_DEV_EMMC,
> > +    ASPEED_DEV_KCS,
> >  };
> > =20
> >  #endif /* ASPEED_SOC_H */
> > diff --git a/include/hw/misc/aspeed_lpc.h b/include/hw/misc/aspeed_l=
pc.h
> > index 0fbb7f68bed2..df418cfcd36c 100644
> > --- a/include/hw/misc/aspeed_lpc.h
> > +++ b/include/hw/misc/aspeed_lpc.h
> > @@ -12,10 +12,22 @@
> > =20
> >  #include "hw/sysbus.h"
> > =20
> > +#include <stdint.h>
> > +
> >  #define TYPE_ASPEED_LPC "aspeed.lpc"
> >  #define ASPEED_LPC(obj) OBJECT_CHECK(AspeedLPCState, (obj), TYPE_AS=
PEED_LPC)
> > =20
> > -#define ASPEED_LPC_NR_REGS (0x260 >> 2)
> > +#define ASPEED_LPC_NR_REGS      (0x260 >> 2)
> > +
> > +enum aspeed_lpc_subdevice {
> > +    aspeed_lpc_kcs_1 =3D 0,
> > +    aspeed_lpc_kcs_2,
> > +    aspeed_lpc_kcs_3,
> > +    aspeed_lpc_kcs_4,
> > +    aspeed_lpc_ibt,
> > +};
> > +
> > +#define ASPEED_LPC_NR_SUBDEVS   5
> > =20
> >  typedef struct AspeedLPCState {
> >      /* <private> */
> > @@ -25,6 +37,9 @@ typedef struct AspeedLPCState {
> >      MemoryRegion iomem;
> >      qemu_irq irq;
> > =20
> > +    qemu_irq subdevice_irqs[ASPEED_LPC_NR_SUBDEVS];
> > +    uint32_t subdevice_irqs_pending;
>=20
>=20
> This field should be added to the vmstate.

Ah yes, good catch. Let me do a v2 to fix this.

Andrew

