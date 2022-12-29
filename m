Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF556591BE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 21:45:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAzll-0002wP-6S; Thu, 29 Dec 2022 15:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzli-0002vX-OK; Thu, 29 Dec 2022 15:44:50 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzlh-0003vs-33; Thu, 29 Dec 2022 15:44:50 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 576215C00F3;
 Thu, 29 Dec 2022 15:44:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 29 Dec 2022 15:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672346688; x=
 1672433088; bh=6YmjZ35Vr6oKw173bF8vv6FpKv26K7ulaTwongPyvg0=; b=G
 ne+2UoZU0MQ0rDJW4rjKIiXnPwY0a5XvYyCmJKSdcndlmE0Z4fIJQKw7ktSuZ3y1
 B8He6VJglEYibjc59T6SxxRLsPcYcQwe+J2rIU0Fj/4QQuUK8Tag34R7GoDDiXv8
 0bULk9kan2jOGc1wi0vy9cVyRRvc8lojYc7YiTgLYYg8NX9l60k1FfQNl1/UaUFa
 ANspyj9G1peatPGJCUoNRwvRIg7WLGmUy10bLAZbFDmmzQbSx+gkeYeJIUkV1JQj
 9O1SIcazkxH/ye0ya3bOQzSvcBYuKciWH2GL6xG+c3VlXTTH0A2vcDrv8So8bT7c
 6zGBLi8xeRt0nQ9D0lwug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672346688; x=
 1672433088; bh=6YmjZ35Vr6oKw173bF8vv6FpKv26K7ulaTwongPyvg0=; b=b
 5jYfu5XjBgjhuEfAIzR779r13wzJmQRGIIv6Yl1j/V3qZhBk/dxqNj+JvqrJL3ul
 vnyqarEqe/maS7waWu5EGHt7CiODW8AFUhPWiMFT7d6DEtSfLooApoKH/XONUYuV
 4z/xacf+rBecaczLPVw5pumgKW0yF2+MbnReJ8u61cvfEqH4w2PR7ApLWpgRZ828
 ewbwO/0LkGBvqWWrnmCvGuNFLaUGCuoh+TqsRaLRWfnFMZoQZakPS27M6VT/6cwZ
 /wgpbjwYEN31yWZYz7HJA+LHaXSz90H1EQMZYnkkFGMtWjOEK0T93+pzmDguQJFM
 y585a9rLr4o0WFa75Z7ZA==
X-ME-Sender: <xms:QPytY3FDcNjBistNT4Z5kFjowZMBbDy3IEePzKZCzc93tntjgHcAnQ>
 <xme:QPytY0VZhnaN7xFk8Z5GAcWta4YqhLWz1K69qmLxaWL8J2MLInT_ZKh9ezU6tzzsH
 qWjM3Ysglwlg-LibUY>
X-ME-Received: <xmr:QPytY5JYZETs415iXPa7aMHeG1bWTP8jfLV4XIu8_bs7ceO5nfbeFsRBmjHpEMjvKxvvuYvFfPv-V8L-4Rivww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefgueekffdtueetgfehteffledtueehgfehgeelfedujeefhfffteekvddt
 feetteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:QPytY1FOyM3KVqytxrffS9ypY-Ep66FjIEzuousYV6sL8rFzlOfN7Q>
 <xmx:QPytY9XilUERVO0xuhiM6PtbkfxkFpT8InDdRsOx_GTlKcwyRYwGxQ>
 <xmx:QPytYwOP3-mXTnNwRiqXML5eM057TO7VMnWOpOgqVOrZRNwZP-qH0g>
 <xmx:QPytYyXc-x-pUrYBtQf6iTkVVv0sU26JOgg9uOzUSrG7Kisjg3su2Q>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 15:44:46 -0500 (EST)
Date: Thu, 29 Dec 2022 12:44:44 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 3/9] hw/arm/aspeed_ast10x0: Add various unimplemented
 peripherals
Message-ID: <Y638PCXC2eF+eUru@pdel-mbp.dhcp.thefacebook.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221229152325.32041-4-philmd@linaro.org>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=peter@pjd.dev;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

:n Thu, Dec 29, 2022 at 04:23:19PM +0100, Philippe Mathieu-Daudé wrote:
> Based on booting Zephyr demo from [1] running QEMU with
> '-d unimp' and checking missing devices in [2].
> 
> [1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
> [2] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Oh cool, yeah looks good.

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> ---
>  hw/arm/aspeed_ast10x0.c     | 35 +++++++++++++++++++++++++++++++++++
>  include/hw/arm/aspeed_soc.h | 11 +++++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 3500294df7..d7dbc1a801 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -28,10 +28,15 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
>      [ASPEED_DEV_FMC]       = 0x7E620000,
>      [ASPEED_DEV_SPI1]      = 0x7E630000,
>      [ASPEED_DEV_SPI2]      = 0x7E640000,
> +    [ASPEED_DEV_UDC]       = 0x7E6A2000,
>      [ASPEED_DEV_SCU]       = 0x7E6E2000,
> +    [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
> +    [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
>      [ASPEED_DEV_ADC]       = 0x7E6E9000,
> +    [ASPEED_DEV_ESPI]      = 0x7E6EE000,
>      [ASPEED_DEV_SBC]       = 0x7E6F2000,
>      [ASPEED_DEV_GPIO]      = 0x7E780000,
> +    [ASPEED_DEV_SGPIOM]    = 0x7E780500,
>      [ASPEED_DEV_TIMER1]    = 0x7E782000,
>      [ASPEED_DEV_UART1]     = 0x7E783000,
>      [ASPEED_DEV_UART2]     = 0x7E78D000,
> @@ -79,12 +84,17 @@ static const int aspeed_soc_ast1030_irqmap[] = {
>      [ASPEED_DEV_LPC]       = 35,
>      [ASPEED_DEV_PECI]      = 38,
>      [ASPEED_DEV_FMC]       = 39,
> +    [ASPEED_DEV_ESPI]      = 42,
>      [ASPEED_DEV_PWM]       = 44,
>      [ASPEED_DEV_ADC]       = 46,
>      [ASPEED_DEV_SPI1]      = 65,
>      [ASPEED_DEV_SPI2]      = 66,
>      [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
>      [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
> +    [ASPEED_DEV_UDC]       = 9,
> +    [ASPEED_DEV_SGPIOM]    = 51,
> +    [ASPEED_DEV_JTAG0]     = 27,
> +    [ASPEED_DEV_JTAG1]     = 53,
>  };
>  
>  static qemu_irq aspeed_soc_ast1030_get_irq(AspeedSoCState *s, int dev)
> @@ -155,6 +165,15 @@ static void aspeed_soc_ast1030_init(Object *obj)
>      object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
>      object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
>                              TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "pwm", &s->pwm, TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "espi", &s->espi, TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "udc", &s->udc, TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "sgpiom", &s->sgpiom,
> +                            TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "jtag[0]", &s->jtag[0],
> +                            TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "jtag[1]", &s->jtag[1],
> +                            TYPE_UNIMPLEMENTED_DEVICE);
>  }
>  
>  static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
> @@ -337,6 +356,22 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>                      sc->memmap[ASPEED_DEV_GPIO]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
>                         aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->pwm), "aspeed.pwm",
> +                                  sc->memmap[ASPEED_DEV_PWM], 0x100);
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->espi), "aspeed.espi",
> +                                  sc->memmap[ASPEED_DEV_ESPI], 0x800);
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->udc), "aspeed.udc",
> +                                  sc->memmap[ASPEED_DEV_UDC], 0x1000);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->sgpiom), "aspeed.sgpiom",
> +                                  sc->memmap[ASPEED_DEV_SGPIOM], 0x100);
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[0]), "aspeed.jtag",
> +                                  sc->memmap[ASPEED_DEV_JTAG0], 0x20);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[1]), "aspeed.jtag",
> +                                  sc->memmap[ASPEED_DEV_JTAG1], 0x20);
>  }
>  
>  static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 8389200b2d..9a5e3c0bac 100644
> --- a/include/hw/arm/aspeed_soc.h
r +++ b/include/hw/arm/aspeed_soc.h
> @@ -44,6 +44,7 @@
>  #define ASPEED_CPUS_NUM  2
>  #define ASPEED_MACS_NUM  4
>  #define ASPEED_UARTS_NUM 13
> +#define ASPEED_JTAG_NUM  2
>  
>  struct AspeedSoCState {
>      /*< private >*/
> @@ -87,6 +88,11 @@ struct AspeedSoCState {
>      UnimplementedDeviceState video;
>      UnimplementedDeviceState emmc_boot_controller;
>      UnimplementedDeviceState dpmcu;
> +    UnimplementedDeviceState pwm;
> +    UnimplementedDeviceState espi;
> +    UnimplementedDeviceState udc;
> +    UnimplementedDeviceState sgpiom;
> +    UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
>  };
>  
>  #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -174,6 +180,11 @@ enum {
>      ASPEED_DEV_DPMCU,
>      ASPEED_DEV_DP,
>      ASPEED_DEV_I3C,
> +    ASPEED_DEV_ESPI,
> +    ASPEED_DEV_UDC,
> +    ASPEED_DEV_SGPIOM,
> +    ASPEED_DEV_JTAG0,
> +    ASPEED_DEV_JTAG1,
>  };
>  
>  qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
> -- 
> 2.38.1
> 

