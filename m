Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77E66E573
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:58:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqDK-0007hs-C1; Tue, 17 Jan 2023 12:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqDI-0007Xa-3x; Tue, 17 Jan 2023 12:57:36 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqDF-0006S7-UR; Tue, 17 Jan 2023 12:57:35 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 35E5B32007F0;
 Tue, 17 Jan 2023 12:57:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 17 Jan 2023 12:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673978250; x=
 1674064650; bh=SSe3RROxRMxlwHPaOW/iYKDZdjjddXrZLRUBeCAvQ8w=; b=y
 fsM0D7SugB6bOcNiFt37RvDzt7j7r9YSpDTqMKxVUSvEe77X8McNLPpSIj5tU1NP
 g9egwG6EIYsxiUHZQ4a1XrAMnVMQVy1yBxgzqfyLVD6uv2kQA647EznFgOcnAP0B
 0UWJ8qwiYFzqLoqY4GqsrsupBre6+5y2cWHci1Idox6E9XTvdYnTS3vdMEVo7bHs
 6JdnX9vaAMlEFKIBiqZB47lNJyGZO+4bN/22CM6WWvuiireS7VegE95WGcqLR9cu
 zqCh3fMugfDQevexpU3kHeU/aXww2wXOYahGOdfn/3fnyiDAs+1RVqdzuAq0XJA4
 9G1iJQOqFsBexF2zbqT0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673978250; x=
 1674064650; bh=SSe3RROxRMxlwHPaOW/iYKDZdjjddXrZLRUBeCAvQ8w=; b=h
 +4ER1F8jFxBotgYd+zET6/z5PIuBfO/A0o1rQ5gVxxr0z501YsnIi7MffNEhk4E/
 ZZLJs1Ha8crcsT3qGXl1JJjLYnvvQMWhUUo9PGFH12j11USlHq6mwF//OEsVAH/o
 hDfpKxlC+RGR1HpbUkDl/LQS2aeZWzsLDVrXexfzItfva3Q7HbnmZ9SWhwgdkock
 /Qh1+ZSalWKz16aIVQkuegXGyW0gFLRiNqQtzhbCcp7GfsPzckqGUn9OBCxYw9M1
 XZMR1MdiOam7bf+t0hRdRj0qyEdtJWkg/s9tnfuhVC3+7+SpI8y3cRjvcoWI8VsA
 A565SN9AtbaVYdBjc1Obg==
X-ME-Sender: <xms:iuHGYzQh5KzFvTVxctjrrjMJS2TIGfZan6VTj_63DsimHIW2_49ATQ>
 <xme:iuHGY0z33I6qs18fpX3izbfXmCxo1QqeE13E0-hfCHLobH3K2qB2oNHwK6utiGrUn
 70p6LXOAFEzanirW6w>
X-ME-Received: <xmr:iuHGY43rszM3BVMC04ytVSmxB2kP89VMyv4paUrEfkVw5EBUHh4lPB4g4NjF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjse
 htkeertddttddunecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvght
 vghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpefhgeffvedufeevteegkeetie
 ejhffhudeujedvgedvheffheejveethffhffefueenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:iuHGYzBlG1ovz21B13BEr5CcMj1pAVKGV_e0wDnZRqROefdAawa_3g>
 <xmx:iuHGY8j5Fh9k5yf9SsEjGr8mDYTR48nxveJpKmkcL4VfP-xlbxJGjw>
 <xmx:iuHGY3qmeBYJp1r4psqemRu-2oX_I0V3ZeYmzTlsNnQbYR3B98PJ_w>
 <xmx:iuHGY3U7LOWWIk5scPbk41m7n-sB9_n2g9Zte8rM5FpvVGaIM0ULaQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 12:57:29 -0500 (EST)
Date: Tue, 17 Jan 2023 09:57:24 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Message-ID: <Y8bhhNnPxu8VjFaQ@pdel-mbp>
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-4-peter@pjd.dev>
 <351f520b-4690-ec08-ec90-008620fe1bee@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <351f520b-4690-ec08-ec90-008620fe1bee@kaod.org>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=peter@pjd.dev;
 helo=wout4-smtp.messagingengine.com
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

On Tue, Jan 17, 2023 at 08:35:44AM +0100, Cédric Le Goater wrote:
> On 1/17/23 00:56, Peter Delevoryas wrote:
> > Allows users to specify binary data to initialize an EEPROM, allowing users to
> > emulate data programmed at manufacturing time.
> > 
> > - Added init_rom and init_rom_size attributes to TYPE_AT24C_EE
> > - Added at24c_eeprom_init_rom helper function to initialize attributes
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   hw/nvram/eeprom_at24c.c         | 37 ++++++++++++++++++++++++++++-----
> >   include/hw/nvram/eeprom_at24c.h |  2 ++
> >   2 files changed, 34 insertions(+), 5 deletions(-)
> > 
> > diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> > index 98857e3626b9..bb9ee75864fe 100644
> > --- a/hw/nvram/eeprom_at24c.c
> > +++ b/hw/nvram/eeprom_at24c.c
> > @@ -50,6 +50,9 @@ struct EEPROMState {
> >       uint8_t *mem;
> >       BlockBackend *blk;
> > +
> > +    const uint8_t *init_rom;
> > +    uint32_t init_rom_size;
> >   };
> >   static
> > @@ -131,13 +134,26 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
> >   I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
> >   {
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
> > -    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> > -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> > +    /* TODO: Model init_rom with QOM properties. */
> 
> ok. This can be fixed with a property later when we have support.
> 
> > +    s->init_rom = init_rom;
> > +    s->init_rom_size = init_rom_size;
> > -    return i2c_dev;
> > +    i2c_slave_realize_and_unref(I2C_SLAVE(s), bus, &error_abort);
> > +
> > +    return I2C_SLAVE(s);
> >   }
> >   static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
> > @@ -162,7 +178,14 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
> >           }
> >       }
> > +    if (ee->init_rom_size > ee->rsize) {
> > +        error_setg(errp, "%s: init rom is larger than rom: %u > %u",
> > +                   TYPE_AT24C_EE, ee->init_rom_size, ee->rsize);
> > +        return;
> > +    }
> > +
> >       ee->mem = g_malloc0(ee->rsize);
> > +
> >   }
> >   static
> > @@ -185,6 +208,10 @@ void at24c_eeprom_reset(DeviceState *state)
> >           }
> >           DPRINTK("Reset read backing file\n");
> >       }
> > +
> > +    if (ee->init_rom) {
> > +        memcpy(ee->mem, ee->init_rom, MIN(ee->init_rom_size, ee->rsize));
> > +    }
> 
> I don't think we can have both an init_rom and a drive. The realize
> handler should report an error in that case.

+1, I'll include that in v3.

> 
> >   }
> >   static Property at24c_eeprom_props[] = {
> > diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> > index 79a36b53ca87..e490826ab1d0 100644
> > --- a/include/hw/nvram/eeprom_at24c.h
> > +++ b/include/hw/nvram/eeprom_at24c.h
> > @@ -6,5 +6,7 @@
> >   #include "hw/i2c/i2c.h"
> >   I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
> > +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> > +                                const uint8_t *init_rom, uint32_t init_rom_size);
> >   #endif
> 

