Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26703659B65
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 19:32:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBKA5-0003VD-Vc; Fri, 30 Dec 2022 13:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pBKA2-0003UH-AU; Fri, 30 Dec 2022 13:31:18 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pBKA0-0006Te-K9; Fri, 30 Dec 2022 13:31:18 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D62305C005B;
 Fri, 30 Dec 2022 13:31:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Dec 2022 13:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672425075; x=
 1672511475; bh=oOFHL1BfsU1pGVmeFsEa7F4Q+jsTCvY9ymZnHa7zgmA=; b=M
 O4ga8+Epu9+yAeWM3s9jvNBQrKBAugpa5jLSvu9FkZVPZ/h63HLf8f4SDEOIh2Wi
 4VdhvcX/4NYdREN/uGlxMuTbyBANwtTVfsHb0CQQIHaaxVxJ8Px32R0VNKt529Hp
 mlY/UqwrIe9ebn3vJQ6NFKC/S9LNiAVln6aQCbjEbtT033tgUXOl/yFZyAauL4vF
 kt15HorfkRgfYDWuplwJzeNhZke+dnoPXknWjm+5XY5jpP3k6cJhI2BBFy58iaiJ
 AC23vt/T8ZHTT1FbDy2zxQzpPXvKZqU/Bb/4Zj3tCuZ2J4ZEz2pUUvG+VW0TUz80
 Y8ysdaON/r6y6BDyqI+xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672425075; x=
 1672511475; bh=oOFHL1BfsU1pGVmeFsEa7F4Q+jsTCvY9ymZnHa7zgmA=; b=u
 o/GBY28KFeiU48uBXvwd/bu+udSMJC/XpFsdaa0GFiF++zqw06NyIHirOfySGV1l
 N5Jk8vGWJH1pCzkbJMQmDbri3QNOX1u7q7OLuOn49e/OhokFlhFDPgkPhYgnZwIl
 K70Qub3HWqgQcJ3ZHbi+xgcAih7IV8y1u6qqXtHZiZTezgYKuL3+p9yqe+W9vPnJ
 mYuWBdoO5/+0z+6WZisYqrjmKM/pZ3Nz7VjcNe4nX8LYnlC1SFA4mCEsBBPBnkmc
 MhqWzkESfJp5OvZ1Z5MCnb5gig9ne8QY3LmLYf2312dFNcFaOX8Xq5fgMmsa7W4Q
 sqVAWgOKRwfx14ONLWU1A==
X-ME-Sender: <xms:cy6vY_GWpSnWxj0gnSgfoM1KuUAE2mrBbCUWnUMf_yKDUkzw7aG05A>
 <xme:cy6vY8XmP-2DP_jWLPgc5aucDAv9lptYZgR9bHxJy3E6AH0_xK0_aWVQ2-Gxm7V5i
 YGRTC1KCStb7cRt1ac>
X-ME-Received: <xmr:cy6vYxKYhvhKMduMlGf1ol8dnT7bkhcCuXO0pgFdzgrprt5pRAvdGvali2x8C4mPXju3A8SRErDPF2WS89BvBQ10XA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeigdduuddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefgueekffdtueetgfehteffledtueehgfehgeelfedujeefhfffteekvddt
 feetteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:cy6vY9FXas9yq4YXm8_tYGfpBBRpYxqMreFe4Y711q7Gw970WNYvhw>
 <xmx:cy6vY1XuHEodT2nSO_Dfs24CLhpP0Xs-6dCn5MawaGL1NYBA7KrPwQ>
 <xmx:cy6vY4N0tHm2b-EkuWUjxoSLrXCmjsDBTFrxKRcDI3gTezxZUzyyeA>
 <xmx:cy6vY2uehz6jWCbr2iWjaNviLZ7bshzKi1bJ1W8_5mu7YdM9ZHXk9Q>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Dec 2022 13:31:13 -0500 (EST)
Date: Fri, 30 Dec 2022 10:31:11 -0800
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
Subject: Re: [PATCH v2 02/11] hw/watchdog/wdt_aspeed: Extend MMIO range to
 cover more registers
Message-ID: <Y68ub4aZSRPtiBXq@pdel-mbp>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-3-philmd@linaro.org>
 <90de6d57-25e1-d20f-15e3-069e06ef2f00@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90de6d57-25e1-d20f-15e3-069e06ef2f00@linaro.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=peter@pjd.dev;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Dec 30, 2022 at 01:31:35PM +0100, Philippe Mathieu-Daudé wrote:
> On 30/12/22 12:34, Philippe Mathieu-Daudé wrote:
> > When booting the Zephyr demo in [1] we get:
> > 
> >    aspeed.io: unimplemented device write (size 4, offset 0x185128, value 0x030f1ff1) <--
> >    aspeed.io: unimplemented device write (size 4, offset 0x18512c, value 0x03fffff1)
> > 
> > This corresponds to this Zephyr code [2]:
> > 
> >    static int aspeed_wdt_init(const struct device *dev)
> >    {
> >      const struct aspeed_wdt_config *config = dev->config;
> >      struct aspeed_wdt_data *const data = dev->data;
> >      uint32_t reg_val;
> > 
> >      /* disable WDT by default */
> >      reg_val = sys_read32(config->ctrl_base + WDT_CTRL_REG);
> >      reg_val &= ~WDT_CTRL_ENABLE;
> >      sys_write32(reg_val, config->ctrl_base + WDT_CTRL_REG);
> > 
> >      sys_write32(data->rst_mask1,
> >                  config->ctrl_base + WDT_SW_RESET_MASK1_REG);   <------
> >      sys_write32(data->rst_mask2,
> >                  config->ctrl_base + WDT_SW_RESET_MASK2_REG);
> > 
> >      return 0;
> >    }
> > 
> > The register definitions are [3]:
> > 
> >    #define WDT_RELOAD_VAL_REG          0x0004
> >    #define WDT_RESTART_REG             0x0008
> >    #define WDT_CTRL_REG                0x000C
> >    #define WDT_TIMEOUT_STATUS_REG      0x0010
> >    #define WDT_TIMEOUT_STATUS_CLR_REG  0x0014
> >    #define WDT_RESET_MASK1_REG         0x001C
> >    #define WDT_RESET_MASK2_REG         0x0020
> >    #define WDT_SW_RESET_MASK1_REG      0x0028   <------
> >    #define WDT_SW_RESET_MASK2_REG      0x002C
> >    #define WDT_SW_RESET_CTRL_REG       0x0024
> > 
> > Currently QEMU only cover a MMIO region of size 0x20:
> > 
> >    #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
> > 
> > Change to map the whole 'iosize' which might be bigger, covering
> > the other registers. The MemoryRegionOps read/write handlers will
> > report the accesses as out-of-bounds guest-errors, but the next
> > commit will report them as unimplemented.

Ahhhh I see, this makes perfect sense now, thanks for the detail!

> 
> I'll amend here for clarity:
> 
> ---
> 
> Memory layout before this change:
> 
>   (qemu) info mtree -f
>     ...
>     000000007e785000-000000007e78501f (prio 0, i/o): aspeed.wdt
>     000000007e785020-000000007e78507f (prio -1000, i/o): aspeed.io
> @0000000000185020
>     000000007e785080-000000007e78509f (prio 0, i/o): aspeed.wdt
>     000000007e7850a0-000000007e7850ff (prio -1000, i/o): aspeed.io
> @00000000001850a0
>     000000007e785100-000000007e78511f (prio 0, i/o): aspeed.wdt
>     000000007e785120-000000007e78517f (prio -1000, i/o): aspeed.io
> @0000000000185120
>     000000007e785180-000000007e78519f (prio 0, i/o): aspeed.wdt
>     000000007e7851a0-000000007e788fff (prio -1000, i/o): aspeed.io
> @00000000001851a0
> 
> After:
> 
>   (qemu) info mtree -f
>     ...
>     000000007e785000-000000007e78507f (prio 0, i/o): aspeed.wdt
>     000000007e785080-000000007e7850ff (prio 0, i/o): aspeed.wdt
>     000000007e785100-000000007e78517f (prio 0, i/o): aspeed.wdt
>     000000007e785180-000000007e7851ff (prio 0, i/o): aspeed.wdt
>     000000007e785200-000000007e788fff (prio -1000, i/o): aspeed.io
> @0000000000185200
> ---
> 
> > [1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
> > [2] https://github.com/AspeedTech-BMC/zephyr/commit/2e99f10ac27b
> > [3] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31
> > 
> > Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > ---
> >   hw/watchdog/wdt_aspeed.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> > index 958725a1b5..eefca31ae4 100644
> > --- a/hw/watchdog/wdt_aspeed.c
> > +++ b/hw/watchdog/wdt_aspeed.c
> > @@ -260,6 +260,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
> >   {
> >       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> >       AspeedWDTState *s = ASPEED_WDT(dev);
> > +    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(dev);
> >       assert(s->scu);
> > @@ -271,7 +272,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
> >       s->pclk_freq = PCLK_HZ;
> >       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
> > -                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
> > +                          TYPE_ASPEED_WDT, awc->iosize);
> >       sysbus_init_mmio(sbd, &s->iomem);
> >   }
> 

