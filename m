Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F138A67112C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 03:31:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHyDj-00013e-1U; Tue, 17 Jan 2023 21:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHyDe-00012s-6O; Tue, 17 Jan 2023 21:30:30 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHyDb-000586-LI; Tue, 17 Jan 2023 21:30:29 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C08D5C017F;
 Tue, 17 Jan 2023 21:30:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 17 Jan 2023 21:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674009025; x=1674095425; bh=msXScG2Zpi
 pz0xqWyIn0ilne3yLiNGyXO8DiH1oEO70=; b=nzsUNGbdvgM1ul/Vgeip3rogrr
 apBavgVLKvBf7yzC3vH23kFQCIAKJc52KBVw4jVu17fZWG1cimk/2fkCjQNubC3F
 Harxb1OZvZnI+rXiPn/4i/JDIDUBga2KN+nDqe3rj4/EwYqkJlVkhCeBRG3iFksY
 S28vHN27l07UhQHS+OWNVb12jc6VUC8VVzVq0fvUJnzE3Em5p7FUBU+pykLIjf9H
 VOCglgZDGGROP6jqFc1kPuJJ1edm6qTRzR7rFHE6MgyjeTz3N1vpA9TuyJRPnBOT
 Xel7qFgT2WTYDMwf6HAGIRjGDccuvtEZtmfdrQKyHviK+qYhQ5FMHUgsR/bA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674009025; x=1674095425; bh=msXScG2Zpipz0xqWyIn0ilne3yLi
 NGyXO8DiH1oEO70=; b=YxIF+u/zygspAKK4TgurBhaietw3/7FnvDMxc52WKyeg
 bHCXzXjGzwTQArJqFtYfPdlQJKifg3zlBUMJ7G8jG9OFI3RI+dPrGryMqdPulpZM
 RiCRY8B1Rg+9EKqJlm45MMJslJBkqneKRlUSaRUb6dEcL4fPucngPLrHUrk39XB4
 XRO9zNt+v/og3sWlsJi8qPNxFebsmW3TTVWcjUXfceb5hsqTNB3rWwE3/gilK+lQ
 F7z+K/afwbg2uqSNegPNxKtG5XzKQwqJOkgZyoNXWvDsEDDWFtE+aGni8dCoK63H
 0HAVjQeFpuvPzOamwqvGGflMmDrTqObuQbwlgEHM3A==
X-ME-Sender: <xms:wFnHY9ydbv6LGt6xAuY_a_F72TO7e4Nbq4D0aBXuAYIrIqNHwOaAIQ>
 <xme:wFnHY9T6sk0iUluPuadVeY26YBT2ylDC3h_VGu8Z9Rp2-9MhlmNrOkCm7Dfk7hLeH
 N5xCkTeLLWhnQKo4HI>
X-ME-Received: <xmr:wFnHY3WcX-0Ml5ui3FYRKsHyWtP8Ck5UtGj9vxILVdooHCcDO7ueJkPbic4_JxYtGy4P1ruZfHNTiVMLeDFlAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepudetiefhffelueevkeegudfgfeefhedtgeeuffffhfelhefgudeujeejkeef
 ueeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
 gvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:wFnHY_gnBu-QxGqxw1wk2pnel9wIRP7kN4GIOT3uRXHDl4UWRp7cBA>
 <xmx:wFnHY_CYa3LP1CQicBZr4n0n-ZX7vk6epBoFq7IEyoIjvE4vCttxYg>
 <xmx:wFnHY4JaXgFrUsCxyhVJ9975kiPXl1Dqa8c-FHpc97zs8X-KfWkukQ>
 <xmx:wVnHYxDi4DqJxsMOWcBTUa6kSu5YNMrFLM31Shgay85uqUdcQOnPQA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 21:30:23 -0500 (EST)
Date: Tue, 17 Jan 2023 18:30:20 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Joel Stanley <joel@jms.id.au>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v3 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Message-ID: <Y8dZvCOBbbGAiVFK@pdel-mbp.dhcp.thefacebook.com>
References: <20230117232427.74496-1-peter@pjd.dev>
 <20230117232427.74496-4-peter@pjd.dev>
 <CACPK8XefPV=TwomysZqzSLyQk77mBiWqz_+F3Vh5og7E179tyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XefPV=TwomysZqzSLyQk77mBiWqz_+F3Vh5og7E179tyg@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=peter@pjd.dev;
 helo=out2-smtp.messagingengine.com
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

On Wed, Jan 18, 2023 at 02:22:01AM +0000, Joel Stanley wrote:
> On Tue, 17 Jan 2023 at 23:24, Peter Delevoryas <peter@pjd.dev> wrote:
> >
> > Allows users to specify binary data to initialize an EEPROM, allowing users to
> > emulate data programmed at manufacturing time.
> 
> I like it. Is there somewhere sensible to add a description to the
> code base? Perhaps as a comment to your new function?

Actually yes, I added the comment to the wrong patch in this series. I'll
submit a v4 really quick to correct that, and include the notes you mentioned
(like the fact that we'll only copy up-to rom-size bytes from the init_rom
data).

> 
> >
> > - Added init_rom and init_rom_size attributes to TYPE_AT24C_EE
> > - Added at24c_eeprom_init_rom helper function to initialize attributes
> > - If -drive property is provided, it overrides init_rom data
> >
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks for the reviews!

> 
> > ---
> >  hw/nvram/eeprom_at24c.c         | 37 ++++++++++++++++++++++++++++-----
> >  include/hw/nvram/eeprom_at24c.h |  2 ++
> >  2 files changed, 34 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> > index 98857e3626b9..f8d751fa278d 100644
> > --- a/hw/nvram/eeprom_at24c.c
> > +++ b/hw/nvram/eeprom_at24c.c
> > @@ -50,6 +50,9 @@ struct EEPROMState {
> >      uint8_t *mem;
> >
> >      BlockBackend *blk;
> > +
> > +    const uint8_t *init_rom;
> > +    uint32_t init_rom_size;
> >  };
> >
> >  static
> > @@ -131,19 +134,38 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
> >
> >  I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
> >  {
> > -    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
> > -    DeviceState *dev = DEVICE(i2c_dev);
> > +    return at24c_eeprom_init_rom(bus, address, rom_size, NULL, 0);
> > +}
> > +
> > +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> > +                                const uint8_t *init_rom, uint32_t init_rom_size)
> > +{
> > +    EEPROMState *s;
> > +
> > +    s = AT24C_EE(qdev_new(TYPE_AT24C_EE));
> > +
> > +    qdev_prop_set_uint8(DEVICE(s), "address", address);
> > +    qdev_prop_set_uint32(DEVICE(s), "rom-size", rom_size);
> >
> > -    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> > -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> > +    /* TODO: Model init_rom with QOM properties. */
> > +    s->init_rom = init_rom;
> > +    s->init_rom_size = init_rom_size;
> >
> > -    return i2c_dev;
> > +    i2c_slave_realize_and_unref(I2C_SLAVE(s), bus, &error_abort);
> > +
> > +    return I2C_SLAVE(s);
> >  }
> >
> >  static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
> >  {
> >      EEPROMState *ee = AT24C_EE(dev);
> >
> > +    if (ee->init_rom_size > ee->rsize) {
> > +        error_setg(errp, "%s: init rom is larger than rom: %u > %u",
> > +                   TYPE_AT24C_EE, ee->init_rom_size, ee->rsize);
> > +        return;
> > +    }
> > +
> >      if (ee->blk) {
> >          int64_t len = blk_getlength(ee->blk);
> >
> > @@ -163,6 +185,7 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
> >      }
> >
> >      ee->mem = g_malloc0(ee->rsize);
> > +
> >  }
> >
> >  static
> > @@ -176,6 +199,10 @@ void at24c_eeprom_reset(DeviceState *state)
> >
> >      memset(ee->mem, 0, ee->rsize);
> >
> > +    if (ee->init_rom) {
> > +        memcpy(ee->mem, ee->init_rom, MIN(ee->init_rom_size, ee->rsize));
> 
> I like the MIN here; good usability feature. It's worth documenting too.
> 
> > +    }
> > +
> >      if (ee->blk) {
> >          int ret = blk_pread(ee->blk, 0, ee->rsize, ee->mem, 0);
> >
> > diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> > index 196db309d451..5c9149331144 100644
> > --- a/include/hw/nvram/eeprom_at24c.h
> > +++ b/include/hw/nvram/eeprom_at24c.h
> > @@ -19,5 +19,7 @@
> >   * @bus, and drop the reference to it (the device is realized).
> >   */
> >  I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
> > +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> > +                                const uint8_t *init_rom, uint32_t init_rom_size);
> >
> >  #endif
> > --
> > 2.39.0
> >

