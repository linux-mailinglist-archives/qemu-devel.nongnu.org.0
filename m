Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA536744B1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:37:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcZc-0005Yd-DQ; Thu, 19 Jan 2023 16:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1pIcZZ-0005YN-BT; Thu, 19 Jan 2023 16:35:49 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1pIcZV-0001ZU-DW; Thu, 19 Jan 2023 16:35:49 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8CE1F32002F9;
 Thu, 19 Jan 2023 16:35:41 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute6.internal (MEProxy); Thu, 19 Jan 2023 16:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1674164141; x=1674250541; bh=cSsG6jGHbp
 A5EvtVUnuQ/k4rw7ch+t+8n09cSe3AS8w=; b=QI8UlsFn38tYj3O3PDGJ/Tv1L4
 DbOzfwzD5NEa/pVCeLlOqeiEn6SyVicGPrCSX8GapTtJMNYRrhOiQFbtIwqqRZlW
 GBGsvX01yqS1PmjD5lG+uPLhJlZEDc5OxF26J5CzCkDqqZyD15eFYoNImWa2LdWn
 Cnf3NqnIAYdPLD7H187hjsjIEwUEWcqXBGeJ4d99F3yvgmYjrJii+5QbdKYCgqcT
 DTEwTkTM8g+aj+eIyg2Up3vqzIrLMFsWGzEvQrnbpfBaWkB0dLi0EuJieBw1mW7j
 YYvU9sC1Zss8CB/rXWpDGuO5fPWhBTXb3k0Z/v7ggmNn8lbbP007L3pxlHjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674164141; x=1674250541; bh=cSsG6jGHbpA5EvtVUnuQ/k4rw7ch
 +t+8n09cSe3AS8w=; b=L3pCPJ59ZoJMS6vHzCHZG6cgDp4QI8h5mfpkkUuFJJIo
 UdChOKDWVm3ThxpL6KFbdRWtjofxRvp7xPeUg8MnOm8oGEZ+MTmuIwvYE+U6p01r
 IUAxCsdC9wBWx6y0+MNritm0d0H9xqXF2xzat1OCGBsGJft/vtrOdulsgkNqMdd+
 iUBru1VhVgEie8zKBq4D1xLY58C8l4eIOBKdI3ZJBe3OEJQD0/magYZie+Upamf8
 6GCCm8qhckwQa2iwKT8bDBNz/ike1ZOMX+XZfQoUQ/JiT0tNIOrSnzaa+fbNhjig
 qdMSN/hDdjM0R8NYdZBSCG6ynS/A9zHQIsXVqlmPwQ==
X-ME-Sender: <xms:rLfJY5mjwOOsoesGF54iaXyZxB8a71j3fGB2sYoaG3dq9oEks6-C1Q>
 <xme:rLfJY006A9OUIxq02_4gFD19GCxwTTxvRw2Xz5ThhNqPtVWgATV2UyHojOX5K_8Un
 kuKytxjl6PpGzDFZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddutddgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
 ftrfgrthhtvghrnhepkedvkeejkefgjeduffetteegjeekteetudevtdfftdeluddthfeh
 veefteekieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:rLfJY_pYHTsiQysI84lLAdEq2qcurVZJJKCzKnWLRxADLf5OXg9Y6g>
 <xmx:rLfJY5nqyqBnkMpdwdMwvdP4d-jWC453cKlVH-bsAEC9LJBDvfFcMw>
 <xmx:rLfJY30de_S8lLZWRiVgDqusdczAQeC3hXqk4vUWD114tpnaKz992w>
 <xmx:rbfJY1B9C557qOWX6xqS9xkGBN1fahM3Jr9o0yaHSA_BCCqGt7elAQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8CEC21700089; Thu, 19 Jan 2023 16:35:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <2c7e9943-be27-4136-8b45-7dc18aebed01@app.fastmail.com>
In-Reply-To: <20230119124440.50243-1-joel@jms.id.au>
References: <20230119124440.50243-1-joel@jms.id.au>
Date: Fri, 20 Jan 2023 08:05:09 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Peter Maydell" <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9_via?= <qemu-arm@nongnu.org>,
 "Cameron Esfahani via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/misc: Add basic Aspeed GFX model
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.24; envelope-from=andrew@aj.id.au;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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



On Thu, 19 Jan 2023, at 23:14, Joel Stanley wrote:
> Enough model to capture the pinmux writes to enable correct operation of
> the parts of pinmux that depend on GFX registers.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  include/hw/arm/aspeed_soc.h  |   3 +
>  include/hw/misc/aspeed_gfx.h |  31 +++++++++
>  hw/arm/aspeed_ast2600.c      |  11 ++++
>  hw/arm/aspeed_soc.c          |  12 ++++
>  hw/misc/aspeed_gfx.c         | 121 +++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build          |   1 +
>  hw/misc/trace-events         |   4 ++
>  7 files changed, 183 insertions(+)
>  create mode 100644 include/hw/misc/aspeed_gfx.h
>  create mode 100644 hw/misc/aspeed_gfx.c
>
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 8389200b2d01..7084e0efeb97 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -26,6 +26,7 @@
>  #include "hw/ssi/aspeed_smc.h"
>  #include "hw/misc/aspeed_hace.h"
>  #include "hw/misc/aspeed_sbc.h"
> +#include "hw/misc/aspeed_gfx.h"
>  #include "hw/watchdog/wdt_aspeed.h"
>  #include "hw/net/ftgmac100.h"
>  #include "target/arm/cpu.h"
> @@ -81,6 +82,7 @@ struct AspeedSoCState {
>      AspeedSDHCIState emmc;
>      AspeedLPCState lpc;
>      AspeedPECIState peci;
> +    AspeedGFXState gfx;
>      SerialMM uart[ASPEED_UARTS_NUM];
>      Clock *sysclk;
>      UnimplementedDeviceState iomem;
> @@ -171,6 +173,7 @@ enum {
>      ASPEED_DEV_EMMC,
>      ASPEED_DEV_KCS,
>      ASPEED_DEV_HACE,
> +    ASPEED_DEV_GFX,
>      ASPEED_DEV_DPMCU,
>      ASPEED_DEV_DP,
>      ASPEED_DEV_I3C,
> diff --git a/include/hw/misc/aspeed_gfx.h b/include/hw/misc/aspeed_gfx.h
> new file mode 100644
> index 000000000000..b0736a53f577
> --- /dev/null
> +++ b/include/hw/misc/aspeed_gfx.h
> @@ -0,0 +1,31 @@
> +/*
> + * ASPEED GFX Controller
> + *
> + * Copyright (C) 2023 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */

Use SPDX here?

> +
> +#ifndef ASPEED_GFX_H
> +#define ASPEED_GFX_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_ASPEED_GFX "aspeed.gfx"
> +#define ASPEED_GFX(obj) OBJECT_CHECK(AspeedGFXState, (obj), TYPE_ASPEED_GFX)
> +
> +#define ASPEED_GFX_NR_REGS (0xFC >> 2)
> +
> +typedef struct AspeedGFXState {
> +    /* <private> */
> +    SysBusDevice parent;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +
> +    uint32_t regs[ASPEED_GFX_NR_REGS];
> +} AspeedGFXState;
> +
> +#endif /* _ASPEED_GFX_H_ */
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index cd75465c2bdd..10e4a13655cc 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -43,6 +43,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>      [ASPEED_DEV_HACE]      = 0x1E6D0000,
>      [ASPEED_DEV_SDMC]      = 0x1E6E0000,
>      [ASPEED_DEV_SCU]       = 0x1E6E2000,
> +    [ASPEED_DEV_GFX]       = 0x1E6E6000,
>      [ASPEED_DEV_XDMA]      = 0x1E6E7000,
>      [ASPEED_DEV_ADC]       = 0x1E6E9000,
>      [ASPEED_DEV_DP]        = 0x1E6EB000,
> @@ -255,6 +256,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
> 
>      object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
> 
> +    object_initialize_child(obj, "gfx", &s->gfx, TYPE_ASPEED_GFX);
> +
>      object_initialize_child(obj, "iomem", &s->iomem, 
> TYPE_UNIMPLEMENTED_DEVICE);
>      object_initialize_child(obj, "video", &s->video, 
> TYPE_UNIMPLEMENTED_DEVICE);
>      object_initialize_child(obj, "dpmcu", &s->dpmcu, 
> TYPE_UNIMPLEMENTED_DEVICE);
> @@ -607,6 +610,14 @@ static void aspeed_soc_ast2600_realize(DeviceState 
> *dev, Error **errp)
>          return;
>      }
>      aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, 
> sc->memmap[ASPEED_DEV_SBC]);
> +
> +    /* GFX */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gfx), errp)) {
> +        return;
> +    }
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gfx), 0, 
> sc->memmap[ASPEED_DEV_GFX]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gfx), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_GFX));

I think we're missing an entry for ASPEED_DEV_GFX in the irqmap array?

>  }
> 
>  static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index b05b9dd41602..053149f9ccdf 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -33,6 +33,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
>      [ASPEED_DEV_SDMC]   = 0x1E6E0000,
>      [ASPEED_DEV_SCU]    = 0x1E6E2000,
>      [ASPEED_DEV_HACE]   = 0x1E6E3000,
> +    [ASPEED_DEV_GFX]    = 0x1E6E6000,
>      [ASPEED_DEV_XDMA]   = 0x1E6E7000,
>      [ASPEED_DEV_VIDEO]  = 0x1E700000,
>      [ASPEED_DEV_ADC]    = 0x1E6E9000,
> @@ -69,6 +70,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] = {
>      [ASPEED_DEV_SDMC]   = 0x1E6E0000,
>      [ASPEED_DEV_SCU]    = 0x1E6E2000,
>      [ASPEED_DEV_HACE]   = 0x1E6E3000,
> +    [ASPEED_DEV_GFX]    = 0x1E6E6000,
>      [ASPEED_DEV_XDMA]   = 0x1E6E7000,
>      [ASPEED_DEV_ADC]    = 0x1E6E9000,
>      [ASPEED_DEV_VIDEO]  = 0x1E700000,
> @@ -233,6 +235,8 @@ static void aspeed_soc_init(Object *obj)
>      snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
>      object_initialize_child(obj, "hace", &s->hace, typename);
> 
> +    object_initialize_child(obj, "gfx", &s->gfx, TYPE_ASPEED_GFX);
> +
>      object_initialize_child(obj, "iomem", &s->iomem, 
> TYPE_UNIMPLEMENTED_DEVICE);
>      object_initialize_child(obj, "video", &s->video, 
> TYPE_UNIMPLEMENTED_DEVICE);
>  }
> @@ -482,6 +486,14 @@ static void aspeed_soc_realize(DeviceState *dev, 
> Error **errp)
>                      sc->memmap[ASPEED_DEV_HACE]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                         aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> +
> +    /* GFX */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gfx), errp)) {
> +        return;
> +    }
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gfx), 0, 
> sc->memmap[ASPEED_DEV_GFX]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gfx), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_GFX));

Again with the irqmap

>  }
>  static Property aspeed_soc_properties[] = {
>      DEFINE_PROP_LINK("memory", AspeedSoCState, memory, 
> TYPE_MEMORY_REGION,
> diff --git a/hw/misc/aspeed_gfx.c b/hw/misc/aspeed_gfx.c
> new file mode 100644
> index 000000000000..42d2167b4a59
> --- /dev/null
> +++ b/hw/misc/aspeed_gfx.c
> @@ -0,0 +1,121 @@
> +/*
> + * ASPEED GFX Controller
> + *
> + * Copyright (C) 2023 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */

SPDX again?

Cheers,

Andrew

