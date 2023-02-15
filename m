Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3715669859C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:36:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOUO-0001f3-LO; Wed, 15 Feb 2023 15:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pSOUM-0001cO-Bk; Wed, 15 Feb 2023 15:34:50 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pSOUK-0001hQ-F4; Wed, 15 Feb 2023 15:34:50 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E59E25C0132;
 Wed, 15 Feb 2023 15:34:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 15 Feb 2023 15:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1676493286; x=
 1676579686; bh=USDSgozEdX7QvSl5rs4issypdyi0ooiVUqtCV4heGVQ=; b=w
 KO6tWOysuzsyEOT5OxmLn2+r28TiaO4UpzU8lCnSx+ec04zYLinsYkpGK4etcL5v
 mXCZS1mb8gQTisVCu4yhHhb7DK4+ImlsF3mlJGUGpy8dp6aPIH5BuBS3cKPpslth
 SzUFPXCnkTIZ4eEwwvX9sgJgjaeERGuej0MreW53pBJZ1CSHl/oqAafzTYOUhH7+
 uIT1ALMiKC/3OHuTXMbm/ADWQwIS57dQ8Y/CllZqqlKXRBlKOOg6g/e0ErM5R88l
 HFa8X+lugpLwyP2jXd97nwQ5KtfFwtwCLsIXjl7UbPoRooVQ3U/Rs38fN129pxqx
 hPdMIqe0nRfY8DbfqOdIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676493286; x=
 1676579686; bh=USDSgozEdX7QvSl5rs4issypdyi0ooiVUqtCV4heGVQ=; b=H
 YKjgQ/DuyR46MbLb/fkd5MYVIL98/oCXZr0Kn2gheESE8HkrujI7TwE38+YrO/vs
 3eJb7593aKE4P0q63/I0o2D8l70mf9L8zVo4fwORDWGNCT0Tu4HVvYeUfPILH6Ny
 syX7fT9Hoqwihuf2QI9Br2YMaxW7rn+kQSvC5mnH7cjcUWn2KX8gmgXLVBwTggI9
 7k+QlodW3q70zcRaC2lsT/rxFOlSltwvx/01gxJzQXdwnR7X2WZJZn5PtYWKJeHv
 0HRVxQC7dSZTsRgITftvhjokm6ejamvMdPS/g7VqdG7AvhY++JtC9FO3lnF42WsM
 SLJ2SXNiYbWUJJXekOPiA==
X-ME-Sender: <xms:5kHtY0njoSgeMJSUZJ02lUTXrFNX2XqcUMmWxmwxncABnln0CJ9ieQ>
 <xme:5kHtYz14Y9zER29Mt5e7OvSm2DzCS9ez_PJ5JjqIJK0xU0SVgL5tTspzdp_giRFdD
 iw9n-4DQL_44_xFy-w>
X-ME-Received: <xmr:5kHtYypY_emV6JlQ0e9ee5jCuDVWb5nxlfa91MxOXe2Y4q258PJVr_HHzhJRH_plSgh3-51PtWrxtqCJwMQltiZK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeihedgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjse
 htkeertddttddunecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvght
 vghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpefhgeffvedufeevteegkeetie
 ejhffhudeujedvgedvheffheejveethffhffefueenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:5kHtYwmyrzVJRNjsMry_MWpEls9ZdGgKVLG08ZWeC8K5sg5XpCtWiA>
 <xmx:5kHtYy2oUuDxYidlK3iLXrIWBATQqTk8R4C8xQAguzKDGCoXzPBajw>
 <xmx:5kHtY3ulrFbIX2_HfrNFVBCB3_Pr2eG6Ia-kQMXDs3vjMTFjsZdkSQ>
 <xmx:5kHtY1RvUvJG2MLRNOz841GVCVJh94w-AZcH74KYMJ4ucKLRO7jdhA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Feb 2023 15:34:45 -0500 (EST)
Date: Wed, 15 Feb 2023 12:34:43 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: ~ssinprem <ssinprem@celestica.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, srikanth@celestica.com, kgengan@celestica.com
Subject: Re: [PATCH qemu 2/2] aspeed/fuji : correct the eeprom size
Message-ID: <Y+1B43hQU4Zi/ABz@pdel-mbp.dhcp.thefacebook.com>
References: <167636845806.2107.2382940753543768501-2@git.sr.ht>
 <9a5b9e5a-ed67-e2b3-ddda-56220e40c00a@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a5b9e5a-ed67-e2b3-ddda-56220e40c00a@kaod.org>
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

On Tue, Feb 14, 2023 at 03:28:58PM +0100, Cédric Le Goater wrote:
> Hello,
> 
> Adding Peter since he contributed the fuji machine,
> 
> On 2/14/23 10:06, ~ssinprem wrote:
> > From: Sittisak Sinprem <ssinprem@celestca.com>
> > 
> > Device 24C64 the size is 64 kilobits
> > Device 24C02 the size is 2 kilobits
> 
> Could you please specify the size in bytes ?
> 
> You will need to add a Signed-off-by tag.
> 
> Thanks,
> 
> C.

Thanks Cedric,

Sittisak, thanks for this fix, I didn't realize the size was in bits (oops lol,
I'm pretty new to embedded systems)

I agree with Cedric though, instead of adding "/ 8", could we just replace 64 *
KiB / 8 with 8 * KiB, and 2 * KiB / 8 with 256?

- Peter

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> 
> > ---
> >   hw/arm/aspeed.c | 32 ++++++++++++++++----------------
> >   1 file changed, 16 insertions(+), 16 deletions(-)
> > 
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 55f114ef72..8e6a1579e4 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -846,42 +846,42 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
> >       i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
> >       i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
> > -    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
> > -    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
> > +    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB / 8);
> >       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
> >       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
> >       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
> >       i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
> > -    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
> > +    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB / 8);
> >       i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
> >       i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
> > -    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
> > +    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB / 8);
> >       i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
> >       i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
> >       i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
> >       i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
> > -    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
> > +    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB / 8);
> >       i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
> >       i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
> > -    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
> > +    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB / 8);
> > -    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
> > +    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB / 8);
> >       i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
> >       i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
> > -    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
> > -    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
> > +    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB / 8);
> > +    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB / 8);
> >       for (int i = 0; i < 8; i++) {
> >           aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
> 

