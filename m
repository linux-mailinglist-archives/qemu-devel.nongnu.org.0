Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198BE67F4D5
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 06:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLdNa-0002U5-7n; Sat, 28 Jan 2023 00:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pLdNX-0002Ta-IN; Sat, 28 Jan 2023 00:03:51 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pLdNV-0006QI-QY; Sat, 28 Jan 2023 00:03:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 12CEB5C06B1;
 Sat, 28 Jan 2023 00:03:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 28 Jan 2023 00:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674882227; x=
 1674968627; bh=U8MxqB7Mh6dx8dUyfYs7VXbLoKImqkYd8hZs8FVw2UY=; b=I
 B+IoE/0zkJEooM4PAYyNjDzUV4TIQbhdOlksQt9iBqkoSRanmcUZAXTvfq+JQHda
 t/QLfZO5hYGpiTCnp56U3Nt4pednCa3pETBKR1JcfAChcpc9/gSjSawwuBbLzuKH
 Apasx7r4imRq/6rqTRc7OgbhO4Ry6kvfvF8V5f4d9on5j5x/b3c3qk6MHo91gBzQ
 qUkHL4E6fSHbnKHc7O4lIyN+5Ebfp0BJ3o9S5nhv7Ni/NJMk2G34e50aNV47xubg
 PLk+v6VDPGPzRrbtjL4Ub7kiJ48lI5iLay/NOaJumFW00hdQM2B287cxo850kzS1
 Gh7yOymhDcOh5BxhgJUWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674882227; x=
 1674968627; bh=U8MxqB7Mh6dx8dUyfYs7VXbLoKImqkYd8hZs8FVw2UY=; b=a
 CVqRscYghIybpgXHEBRk/GfRawnNXjSinf4RAY6knWr2svklWsaB9kIFtz9i+Pr+
 dKV1A3nSq2FG2wc1P03Lv3no/IExnuSa0hbK74u5c+drY3fda80daz38AHryBW1h
 DTUSVvewhWk+r+jaSvgLbMnttz/FDYUm7AEngMmnWiEmlP2gTM/z7kUKKjvO8R4C
 Wv9pxzFH7VA+QqiBT604uZ5MQf0q64U73jL3b+xclAzDY58rd/mGgINkrOgQhevo
 Ujc5PxwM3X4TGBI25+0Zt0uhh7G9ly8XdLbim+qBRLWFPaOLHuqZZDV3/+uESqPf
 KQVkWwRra5U4qC7VS+/Gg==
X-ME-Sender: <xms:sqzUYyb-A4XUTgMIcm0b6jUTbf4fx2tLsLY9xjg5agfg8xMHWwJ7Mw>
 <xme:sqzUY1Z2B8CVDTwdlggDYRyiWXy8JAuqA3Sw2u-UdvKzm4PM_EF5uFlCZo_3EqOz7
 cAvwchNrYfODJVXy9U>
X-ME-Received: <xmr:sqzUY8_-JhrUVva1YEy9-0BJuYxCQfGaY6Dy9StQyfphXCWB6822ozT4dPbRPAMND7ZcN0hp6qJFEPsNhUFrvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvjedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:sqzUY0rkP9mHFewaWpBUkKH9mydBffg7fvhlxFuT1L2tbsLIHeH4mw>
 <xmx:sqzUY9pzysP5uEAaHFDTlcb6xazlUvEfK0jo3YNWgoU7y5l7uUn0Iw>
 <xmx:sqzUYyTMJ5uRDD0ewDRfUtmud6sfFgEfyOAxjtXG3iix3tyWLJwwMQ>
 <xmx:s6zUYxc5Xz_lMdEbEujDHeTmrauECmmpPXpftSfQ8Ku7bamxCEHa7Q>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jan 2023 00:03:44 -0500 (EST)
Date: Fri, 27 Jan 2023 21:03:38 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Corey Minyard <minyard@acm.org>, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 philmd@linaro.org
Subject: Re: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Message-ID: <Y9SsquT1kNVJLesl@pdel-mbp.dhcp.thefacebook.com>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-4-peter@pjd.dev>
 <Y9Gg15hBJ/aQgd3e@minyard.net>
 <Y9Gn5iLM87MKycMn@pdel-mbp.dhcp.thefacebook.com>
 <b10fb5c2-5d3c-e4c0-431c-0842f0b00bb8@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b10fb5c2-5d3c-e4c0-431c-0842f0b00bb8@kaod.org>
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

On Fri, Jan 27, 2023 at 08:42:40AM +0100, Cédric Le Goater wrote:
> > > >   I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
> > > >   {
> > > > -    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
> > > > -    DeviceState *dev = DEVICE(i2c_dev);
> > > > +    return at24c_eeprom_init_rom(bus, address, rom_size, NULL, 0);
> > > > +}
> > > > +
> > > > +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> > > > +                                const uint8_t *init_rom, uint32_t init_rom_size)
> > > > +{
> > > > +    EEPROMState *s;
> > > > +
> > > > +    s = AT24C_EE(qdev_new(TYPE_AT24C_EE));
> > > > +
> > > > +    qdev_prop_set_uint8(DEVICE(s), "address", address);
> > > 
> > > Why did you switch from using i2c_slave_new()?  Using it is more
> > > documentation and future-proofing than convenience.
> > 
> > Oh, yeah that's my bad. I was probably doing it so that all the qdev_prop_set
> > calls to the object are in the same place, but I probably should have just kept
> > i2c_slave_new() and initialized only the at24c-eeprom properties here, instead
> > of initializing the I2CSlave ones too.
> 
> Will you send a v5 ?

Oh! Yeah sure: I thought I had already missed the boat because I thought you
sent a pull request, but I see that it hasn't been pulled yet.

- Peter

> 
> Thanks,
> 
> C.

