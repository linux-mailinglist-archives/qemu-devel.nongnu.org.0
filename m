Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B6366CC36
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:23:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTCc-0008PO-Gq; Mon, 16 Jan 2023 12:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHTCZ-0008Ox-SQ; Mon, 16 Jan 2023 12:23:19 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHTCT-00035H-2Y; Mon, 16 Jan 2023 12:23:16 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4CF3C320090F;
 Mon, 16 Jan 2023 12:23:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 16 Jan 2023 12:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673889788; x=
 1673976188; bh=ennun2qqqXCfU/CBtnAyBjRAVIOvL8V5uwS5AIXTy78=; b=N
 XzmPAZIac9xoU3zAKNYRWuQmigXa26ftrxvQDYvmwiL9uXYOz7hoetuvwxjaHjpZ
 PiEvG1uOkRl03R2JXxbHQ1IrhItsEhFUpZ7vyE3hqE18YzBk/kw6FIPO2hBPc8VI
 lkWdDdHnD6WUiKWx65UuqNkSu0PqSoetHSFDMuiHNjDg3fLnK8PK/3014awhET5i
 Y9etL/peGr2NHb+g0XZTX4dBxOmBNNeS9+GAWO4V1s8d2LggxhEtNaE/DuPGMt7f
 t1Ox/gVMgMyt1bbqSooFd4yjDeFsgFOXR/m+xpcL18yJB4OdL7JlAaIXPABgVyTg
 khp/Rl/lp5davRi+wKZ2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673889788; x=
 1673976188; bh=ennun2qqqXCfU/CBtnAyBjRAVIOvL8V5uwS5AIXTy78=; b=E
 4EaeSwT6vZaZxSNWPjGyirl0QPphpfOhVXeMOmeaPvfGy0XfvTJN6MD4BvVfZJaB
 mJ/9FFs2v+Flwqut9HEVXkjpV5mY9BE7uIRlShET8/lIEPpwOA21NEaJRe9C5YRt
 bc5pXZFzjvYjyAl5EJtra6rnDvx7krvzSCf+cH/8p4SX5G/2Il+A2zPjf3IugbIL
 WH0Odbt5eG4voBnlT9vZCuWNCgcB9LckDZQAlZVJX9FUxzv7CjMuizSXnG38gapo
 AZ/sypvtHw0cWsVhz9QgQR1PReoBOKT7+pftyqUPNgqLTk7RzKKIazrGtAsffrTU
 jCAURkyarvn36ihCY57AQ==
X-ME-Sender: <xms:_IfFY_MzoYBmMgMHGiQFYFqVnhnv6NEbuxpltL2ruSwzuCgDHhyy6Q>
 <xme:_IfFY5-MSX8_71DHDUDbCuPrtqIpAtH1iVimP3k6sRgtCoozI6fvl6IKbFExeZTpy
 i1WfzjFFnpEJMHq3dI>
X-ME-Received: <xmr:_IfFY-QRnMJD8XpYaXoGOvrJ0jLLT6TwN97RFg3id8eYxNegzjo8tAWtWtVfZUkE8SbHWcOkcV4S7iHVFYg5Su0LFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtgedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:_IfFYzvimY8s8K-h1vc_zKsuGYGWW9B-JzEaQperKWzn-t7DYSrXyw>
 <xmx:_IfFY3cZblqOz9vCCZy8uSD34C3dJiIebI56TmHDTtcFmq8WRW9BBA>
 <xmx:_IfFY_1dXJgmvIiVko5oQSIU6GCEU0nf_bTg4Snr3lJ9GMNtmpyX_Q>
 <xmx:_IfFY2w7w3Tb1GPUmR5AF6O75pvnkDw47NA-kxFHfOk_NoOTkRAIkQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 12:23:07 -0500 (EST)
Date: Mon, 16 Jan 2023 09:23:05 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 6/6] hw/arm/aspeed: Init fby35 BMC FRUID EEPROM
Message-ID: <Y8WH+aneXr/JkEXp@pdel-mbp>
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-7-peter@pjd.dev>
 <0ef1b0e3-7df0-e611-0335-bf0a24690a90@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ef1b0e3-7df0-e611-0335-bf0a24690a90@linaro.org>
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

On Mon, Jan 16, 2023 at 01:30:19PM +0100, Philippe Mathieu-Daudé wrote:
> On 14/1/23 18:01, Peter Delevoryas wrote:
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 49 insertions(+)
> > 
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index c929c61d582a..4ac8ff11a835 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -922,6 +922,52 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
> >       i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
> >   }
> > +static const uint8_t fby35_bmc_fruid[] = {
> [...]
> 
> > +};
> > +
> >   static void fby35_i2c_init(AspeedMachineState *bmc)
> >   {
> >       AspeedSoCState *soc = &bmc->soc;
> > @@ -1363,6 +1409,9 @@ static void fby35_reset(MachineState *state, ShutdownCause reason)
> >       object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
> >       object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
> >       object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
> > +
> > +    at24c_eeprom_write(aspeed_i2c_get_bus(&bmc->soc.i2c, 11),
> > +                       0x54, 0, fby35_bmc_fruid, sizeof(fby35_bmc_fruid));
> 
> Why transfer the prom content on the i2c bus at each reset?
> 
> In particular this looks wrong if the prom is initialized with a 'drive'
> block backend (using -global).

Yeah, it looks like this might not be the right way to model it. I'm going
to try Cedric's suggestions.

> 
> >   }
> 
> 

