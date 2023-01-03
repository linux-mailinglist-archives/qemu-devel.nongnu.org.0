Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCF965C2F5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 16:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCjAI-0008Kt-2d; Tue, 03 Jan 2023 10:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pCjAE-0008K4-8T; Tue, 03 Jan 2023 10:25:18 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pCjAC-0001BX-0E; Tue, 03 Jan 2023 10:25:17 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 112913200929;
 Tue,  3 Jan 2023 10:25:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 03 Jan 2023 10:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1672759509; x=
 1672845909; bh=vkP6LtOJECEH6f0QAUHFNTwYSWZrcia0nRaOk9QKXKc=; b=y
 M2U4fY2JFqT0D10tJE3fZK2SFJV7S8znFccA5/WVEBeMCKupENXHhVR2NU0LmisJ
 mJHHHdSLyfCXxSQVZH/0rf0AX8mPFgRNOJwYnj/BZjbF+do+l+NRVZVAVuufx9fV
 hYR9usCZvzdN23YkDrYAitvH6SCBqmRPFq9dLFoWXhu9LEtDdmVEX9qap41vfzk+
 o6De6kN+wOW9lc31rl1ubPXUpwqJt+QhgpRPnHlA9FHbQ8N892bL2laohF+3ir+2
 QcADgJCisi7M3aumlqqeVpZ/k36Yt39j1Nhr1tGkuaHB4mp1CGft6aVOeH9h9a2z
 39J1eAfnTyBuki75PEoEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672759509; x=
 1672845909; bh=vkP6LtOJECEH6f0QAUHFNTwYSWZrcia0nRaOk9QKXKc=; b=D
 Ry/AHyH48ZgeGuhVnGdJ3dRWlx69YHOzk6aP3pwcS4nNAsxA4ZYQYWoVPJNVIfgi
 rX2tf55+odgI0YBMkX/Lg/0UcDG6bx/fmUkC9YgyubtjldFYRXJeserXgprIhAAe
 fLD4pyn5N1KWnKDKJdYqJDDC55DzmLVru39gQl3pEr4AkH0c89A4wWeiOR2sJ1i6
 /DZMkIc0AERnZXUw2CHxIipvzz3iinhzjqc9Y/OiUz4pLCiFNWcoYPO2TUkqqGse
 YV9xBQR/sSIvHGe5Rga0hskmT3o3O0C46Npa0gX/Z8ClzS50JmQK5AFRgkHteOX3
 Im7ntdVESuxQ0DdNUAPBQ==
X-ME-Sender: <xms:1Ui0YwZ6qeqYTuadAndqHAZ-GlnMEMEOQvf5eLyMu18mjTvhWDAE_w>
 <xme:1Ui0Y7Z0SCexDRLndS18R_7iGA06xv7fsR5p5Ob4ggnicLouK-VBgDFiymwWktzYz
 asF6JwLdx8J878mny4>
X-ME-Received: <xmr:1Ui0Y6-N3TWbp4wAEcr9JLcOBWqOxOTXws2TBPU9NUn4iPBP44tyYlYPT7LytNv5urF4PPQWK_ONJLbP9cn0zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepgfeukefftdeutefgheetffeltdeuhefgheegleefudejfefhffetkedvtdef
 teetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:1Ui0Y6r516Cts8gH2f2vPSkflq6hoy2e1XC0NQccS6DT0U2luN8Y2Q>
 <xmx:1Ui0Y7rNP1fFovUtt26pf4KxvToIn01D-xSB9rUkHubpoyz_ZA0Zag>
 <xmx:1Ui0Y4RQXu1LqENOTWCV8IfcSdhYe3p6iTH0rf7-vnuCIN_jdm1QDA>
 <xmx:1Ui0Y2CGlCRlwztK0r4ZBpSkDUk4QKoBwUoxLVKbmBgg4hzZ3ZOJdA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 10:25:07 -0500 (EST)
Date: Tue, 3 Jan 2023 07:25:04 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Beraldo Leal <bleal@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Delevoryas <pdel@fb.com>, Peter Delevoryas <pdel@meta.com>,
 qemu-arm@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 01/11] hw/watchdog/wdt_aspeed: Rename MMIO region size
 as 'iosize'
Message-ID: <Y7RI0PvaUkur524e@pdel-mbp.dhcp.thefacebook.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221230113504.37032-2-philmd@linaro.org>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=peter@pjd.dev;
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

On Fri, Dec 30, 2022 at 12:34:54PM +0100, Philippe Mathieu-Daudé wrote:
> Avoid confusing two different things:
> - the WDT I/O region size ('iosize')
> - at which offset the SoC map the WDT ('offset')
> While it is often the same, we can map smaller region sizes
> at larger offsets.
> 
> Here we are interested in the I/O region size, so rename as
> 'iosize'.
> 
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/aspeed_ast10x0.c          | 2 +-
>  hw/arm/aspeed_ast2600.c          | 2 +-
>  hw/arm/aspeed_soc.c              | 2 +-
>  hw/watchdog/wdt_aspeed.c         | 8 ++++----
>  include/hw/watchdog/wdt_aspeed.h | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
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
> index d753693a2e..958725a1b5 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -309,7 +309,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
>      AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>  
>      dc->desc = "ASPEED 2400 Watchdog Controller";
> -    awc->offset = 0x20;
> +    awc->iosize = 0x20;
>      awc->ext_pulse_width_mask = 0xff;
>      awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>      awc->wdt_reload = aspeed_wdt_reload;
> @@ -346,7 +346,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
>      AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>  
>      dc->desc = "ASPEED 2500 Watchdog Controller";
> -    awc->offset = 0x20;
> +    awc->iosize = 0x20;
>      awc->ext_pulse_width_mask = 0xfffff;
>      awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>      awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
> @@ -369,7 +369,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
>      AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>  
>      dc->desc = "ASPEED 2600 Watchdog Controller";
> -    awc->offset = 0x40;
> +    awc->iosize = 0x40;
>      awc->ext_pulse_width_mask = 0xfffff; /* TODO */
>      awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
>      awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
> @@ -392,7 +392,7 @@ static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
>      AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>  
>      dc->desc = "ASPEED 1030 Watchdog Controller";
> -    awc->offset = 0x80;
> +    awc->iosize = 0x80;

Just noticed, the offset/iosize for the AST1030 seems to be incorrect. It
should be 0x40, not 0x80.

It should have the same value as the AST2600, since they should be the exact
same peripheral.

This is not your fault, just a bug report from me.

This seems to be an error in the original patch from Steven Lee, but also a bug in the AspeedSDK
Zephyr kernel driver?

e259e01ecb ("aspeed/wdt: Add AST1030 support")
https://github.com/AspeedTech-BMC/zephyr/blob/1b9764a854abbea8b38445f1d5de9f4441e29c3b/drivers/watchdog/wdt_aspeed.c#L21

The only other explanation is that the datasheet I have is old and wrong. I'm
referencing the AST1030 A0 v0.5 datasheet from February 2021.

Sorry for not noticing this earlier!

So to be clear:

Chip: Watchdog[N] Iosize
AST2400: 0x20
AST2500: 0x20
AST2600: 0x40
AST1030: 0x40

Chip: Watchdog[N] WDT_REGS_MAX
AST2400: 0x18
AST2500: 0x1C (Added "Reset Mask" register)
AST2600: 0x30 (Added even more reset control and mask registers)
AST1030: 0x30

Thanks,
Peter

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
>      uint32_t ext_pulse_width_mask;
>      uint32_t reset_ctrl_reg;
>      void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
> -- 
> 2.38.1
> 
> 

