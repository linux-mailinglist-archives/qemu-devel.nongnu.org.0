Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77F66CC1C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTBO-0007Wl-Ae; Mon, 16 Jan 2023 12:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHTBH-0007Vk-OB; Mon, 16 Jan 2023 12:21:59 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHTBG-0002qw-C2; Mon, 16 Jan 2023 12:21:59 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 28CFC3200922;
 Mon, 16 Jan 2023 12:21:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 16 Jan 2023 12:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673889715; x=
 1673976115; bh=kTa26oSJu85ii62fKpjIHRdBUYyGpGvnlndRcUnHM2Q=; b=o
 izbbvM5Fu6biIQBlfwjkJFTy5yg/ASbXgFLKZ0Hj7rsN7XGOMTUeU39+Rt17/Dw1
 XeXYlom4AwOKGKEKd2Qp6Gl75GcrmNeZga5/I7Nzd5tOhXqiEuTIbgat3O64YXrb
 jJi9b6zJq76CtAgVnIMXI2EZD7FXA0S6tAdxhlJ5K673iY6j29BlF2DnPlHi3Ff7
 8/VLTW5KJ1x/AY9Dj2dYaRX9fYdybZTWdw3ZNtO/jEMYFdRb20m4jpWG34twjED1
 SDxeP9HJCgyZ5Vll5h8oxDxQxLRVnRl74uqw5ZeNbCh2zMThwI/yXyY6FQX5YxBs
 vm64sFPN+2mwrO6KsGQ3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673889715; x=
 1673976115; bh=kTa26oSJu85ii62fKpjIHRdBUYyGpGvnlndRcUnHM2Q=; b=g
 q4USP2jrC0s79+EgnWHvKF+E6EsVNISYJ9m40cNzpx484WFQ14Yw3aMfJIsvgvL4
 +DhGW2kFiVa2WMUF2rchZG5AFP2VqlXgv4b2+ZIEKWK+sOmHLyeD8NJRMYNeHYkU
 EAESMn3KAYc5QVyjwiHyUL4kz+HmtlwoO5sfUIVt63ulhxd1P5pbM8Y11gP3WiMo
 bI/8Ojpgv6JuJyUSYMrVlaUGLxUTZAeHDIei3mg9JD4SaqNbTsT7L8A4gT1yrQer
 JTvudocta9t0huQP2Ot/AHURNWanl1UdPwX/j0iNfNgKMIDtJxXw8HLl21l8ffPQ
 v7YUrE5GcyPCbEdMLyCDQ==
X-ME-Sender: <xms:s4fFYyWs4pQh-zJ6zTWFGMeWQ86fUPjE4rKtOmHRcNOMNHLsN2bwUQ>
 <xme:s4fFY-mlPhu_aG5Tgs2_0YQFbQo2ZIyK2RAyndUaD4tQjPCNxNobytQKTNfjdBetA
 Jwz97ruYHpL9wvzUp4>
X-ME-Received: <xmr:s4fFY2ZS6NoU9mLrWDQymeQ9Z0hv3Q9UKUEm1tZfKJja4OuZbZD9_x8JPy0a2c9n3JRP6M9dRajWMyOEs3FK8n0jjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtgedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:s4fFY5Ul3p3PsB9RQ81iWIbhGkaiYoFu_zLMSAoYcSTcjKqOWCm7ew>
 <xmx:s4fFY8mi-eTxyisl694bn6xOEIhFMEAo2goF4dn9b0nyavAWdnmCzQ>
 <xmx:s4fFY-eBvab2fiNxQZR4xEMD6Ju9fBGCP5XLYU9JLh56sYxVCQIsyw>
 <xmx:s4fFY26giDNtDE7NkM2BmUS52XS__AQLP4qkwn2AY6VCQyToNbpeCA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 12:21:54 -0500 (EST)
Date: Mon, 16 Jan 2023 09:21:52 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/6] hw/arm/aspeed: Remove local copy of at24c_eeprom_init
Message-ID: <Y8WHsOIACiCojs7V@pdel-mbp>
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-3-peter@pjd.dev>
 <a11752e3-b777-649d-9dae-bb4816029d99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a11752e3-b777-649d-9dae-bb4816029d99@linaro.org>
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

On Mon, Jan 16, 2023 at 01:24:36PM +0100, Philippe Mathieu-Daudé wrote:
> On 14/1/23 18:01, Peter Delevoryas wrote:
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   hw/arm/aspeed.c | 10 +---------
> >   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> > -static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> > -{
> > -    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> > -    DeviceState *dev = DEVICE(i2c_dev);
> > -
> > -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> > -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> > -}
> 
> Why not squash in previous commit as 'extract helper' change?

+1, I'll squash this.

> 
> Anyhow,
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> 

