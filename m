Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4C56591B2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 21:44:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAzjE-0001r3-On; Thu, 29 Dec 2022 15:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzjC-0001qJ-48; Thu, 29 Dec 2022 15:42:14 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzjA-0003hq-0I; Thu, 29 Dec 2022 15:42:13 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A6945C0056;
 Thu, 29 Dec 2022 15:42:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 29 Dec 2022 15:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672346526; x=
 1672432926; bh=lWHyWaZO9a53DXDhTshumqOOSq2IQjKhkT1X0IuJ/3Q=; b=J
 /K+upFfQyo+q1kRz/f5wQ3HMCyYXDvsQYY+r164x8ErFvmlEhBfAu8vujDApLTfx
 rXKKOyAxXOXAhyOr85PuZNN7ynvi7g3IIzgrNSV8mTR/UkQLG3bqeERwJYqtM6p5
 hZ3oe+TubN3ewLGgycW9yfI0RT323ak7yKbaBwzGctvt4Ii/nq+SHgrP1TEmnx72
 O8xwVcafpGjg6hTmu0R55sItRxUnt6zrJeNVN6vHMFw54LWN3exe6Q4rmjWHflGr
 ziW0P7vATauDutSZSw3cI1bkwTrTcBO8O4iJvPklRBPSKaJwNrr3alq7jFWa4n7/
 probjrN9OdwoTCGrj3Uwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672346526; x=
 1672432926; bh=lWHyWaZO9a53DXDhTshumqOOSq2IQjKhkT1X0IuJ/3Q=; b=I
 hJD0xrR+ecmWjuYlPr5MAHHmtDNmfU6iQje74Cv6rEEBIYOvGvR4Cl04q34EwZBo
 ZS/EUc0nSNVoXnPPgJyLbTFErLlJpAXc0JbW5y63zGFjPIPiBx+QpXAk3MWw5f+X
 DXixjp68zYcs3VxD31FhTwvPogp4s525wZlzBDhcP/T6klZf9FRCgzShxyybLPe6
 m2qaxW2g9X57B4HcbTzeXhj0TdNcSvoqg0PamrM0nG8QOqzxxzr6ofbk4/+bXc5h
 6wwqZO79GwG/GiqNlGigh8BrJ83DPDl5mZuB0oXXgjSE3QaBJmlriwJJTmWed4lX
 R7jEwqGhAreT0qFrrr7PA==
X-ME-Sender: <xms:nvutY-gUbnuMLzMocVFaz3COYZVYQfPnjcaFDffHvAVLpSCJxzDVFg>
 <xme:nvutY_ByfTIUVR7KaXF3K5V2LSwEiPLmjvFupfJGsh1_mNKgRIPapZBjX1Mrs7LVQ
 tfAy6x_FdCC5hO8DPQ>
X-ME-Received: <xmr:nvutY2HoTUE1wJVO-2-zamrMp38VaTpSGFKzDVX8HGI5G5okuKMeuV3Au7_2NjF7QjwZBCu5xABdc8LLqXTT_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefgueekffdtueetgfehteffledtueehgfehgeelfedujeefhfffteekvddt
 feetteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:nvutY3SDQmnOlzvHsopppnXezTr-mHVs1TeAKfatX0z7snVinWQ5pQ>
 <xmx:nvutY7z0n5at2UimNR51k3My9fA6XYNYligUD09_n_Vy0ygYb9tmvg>
 <xmx:nvutY164Mv6m2sk4UyJgpcBnhEo3tEJwD8LEL3vtUsZL4sCLaK8cWQ>
 <xmx:nvutYzgb2_KwOxEd6ELoRUYEE7dI4UrbZEjixU6XPVZCGtYd4Asejg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 15:42:04 -0500 (EST)
Date: Thu, 29 Dec 2022 12:42:02 -0800
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
Subject: Re: [PATCH 1/9] hw/watchdog/wdt_aspeed: Map the whole MMIO range
Message-ID: <Y637mlYosU4ULh9b@pdel-mbp.dhcp.thefacebook.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221229152325.32041-2-philmd@linaro.org>
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

On Thu, Dec 29, 2022 at 04:23:17PM +0100, Philippe Mathieu-Daudé wrote:
> Avoid confusing two different things:
> - the WDT I/O region size ('iosize')
> - at which offset the SoC map the WDT ('offset')
> While it is often the same, we can map smaller region sizes at
> larger offsets.
> 
> Here we are interested in the I/O region size. Rename as 'iosize'
> and map the whole range, not only the first implemented registers.
> Unimplemented registers accesses are already logged as guest-errors.
> 
> Otherwise when booting the demo in [*] we get:
> 
>   aspeed.io: unimplemented device write (size 4, offset 0x1851a8, value 0x030f1ff1)
>   aspeed.io: unimplemented device write (size 4, offset 0x1851ac, value 0x03fffff1)
>   aspeed.io: unimplemented device write (size 4, offset 0x185128, value 0x030f1ff1)
>   aspeed.io: unimplemented device write (size 4, offset 0x18512c, value 0x03fffff1)
> 
> [*] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/aspeed_ast10x0.c          |  2 +-
>  hw/arm/aspeed_ast2600.c          |  2 +-
>  hw/arm/aspeed_soc.c              |  2 +-
>  hw/watchdog/wdt_aspeed.c         | 12 +++++++-----
>  include/hw/watchdog/wdt_aspeed.h |  2 +-
>  5 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 4d0b9b115f..122b3fd3f3 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -325,7 +325,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>              return;
>          }
>          aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
>      }
>  
>      /* GPIO */
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index cd75465c2b..a79e05ddbd 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -472,7 +472,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>          aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
>      }
>  
>      /* RAM */
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index b05b9dd416..2c0924d311 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -393,7 +393,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>          aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
>      }
>  
>      /* RAM  */
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index d753693a2e..c1311ce74c 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -260,6 +260,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      AspeedWDTState *s = ASPEED_WDT(dev);
> +    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(dev);
>  
>      assert(s->scu);
>  
> @@ -270,8 +271,9 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>       */
>      s->pclk_freq = PCLK_HZ;
>  
> +    assert(awc->iosize >= ASPEED_WDT_REGS_MAX * 4);
>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
> -                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
> +                          TYPE_ASPEED_WDT, awc->iosize);

Does this fix the unimplemented thing you referred to in the commit message?

I'm not sure which part of this diff actually removes the unimplemented traces.

>      sysbus_init_mmio(sbd, &s->iomem);
>  }
>  
> @@ -309,7 +311,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
>      AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>  
>      dc->desc = "ASPEED 2400 Watchdog Controller";
> -    awc->offset = 0x20;
> +    awc->iosize = 0x20;
>      awc->ext_pulse_width_mask = 0xff;
>      awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>      awc->wdt_reload = aspeed_wdt_reload;
> @@ -346,7 +348,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
>      AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>  
>      dc->desc = "ASPEED 2500 Watchdog Controller";
> -    awc->offset = 0x20;
> +    awc->iosize = 0x20;
>      awc->ext_pulse_width_mask = 0xfffff;
>      awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>      awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
> @@ -369,7 +371,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
>      AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>  
>      dc->desc = "ASPEED 2600 Watchdog Controller";
> -    awc->offset = 0x40;
> +    awc->iosize = 0x40;
>      awc->ext_pulse_width_mask = 0xfffff; /* TODO */
>      awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
>      awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
> @@ -392,7 +394,7 @@ static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
>      AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>  
>      dc->desc = "ASPEED 1030 Watchdog Controller";
> -    awc->offset = 0x80;
> +    awc->iosize = 0x80;
>      awc->ext_pulse_width_mask = 0xfffff; /* TODO */
>      awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
>      awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
> index dfa5dfa424..db91ee6b51 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -40,7 +40,7 @@ struct AspeedWDTState {
>  struct AspeedWDTClass {
>      SysBusDeviceClass parent_class;
>  
> -    uint32_t offset;
> +    uint32_t iosize;

Oh yeah, iosize is a way better name for this. +1. But to be honest, I don't
understand how this is changing the unimplemented traces?

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

>      uint32_t ext_pulse_width_mask;
>      uint32_t reset_ctrl_reg;
>      void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
> -- 
> 2.38.1
> 

