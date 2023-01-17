Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D9E66E60A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:32:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqlA-0000Uz-W8; Tue, 17 Jan 2023 13:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqkw-0000II-O4; Tue, 17 Jan 2023 13:32:24 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqkv-0007Yl-AD; Tue, 17 Jan 2023 13:32:22 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B3A25C0132;
 Tue, 17 Jan 2023 13:32:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 17 Jan 2023 13:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673980340; x=
 1674066740; bh=TDl0pSXtjsTf+N3SYnRhOJHop3ICupx9F2jTeBtNGEo=; b=o
 xFoUxe1DlY5sp2nsLdUIWXgbS5H/t4VzxEb4ms8HIogTMfemVooU7yO8zT33R4C8
 6Wt87nnQKiy3+wP+K6v7vTa2xNzmcgCOqf2NNCmnxUmH1ghVlKePhIoOquGJKFgU
 b1b2ZRSRRfMHVWi9QQLY9ZMVa/z6ilosfJle2kfD9D6wsFzjg11PIn1X1YrEvHr1
 p5RQn9Xu423Zl4R0Nzp9x2rgGWXWWmMb+UjhNb2zc4TBO8jdAI9nJn7/alAwvHJK
 JQzU1nXCufHqxdTM7Hj0t9vagtZxv0fYmyWQrK42wsKA48pzVCgRgcI+pn58Zn95
 xHYd5SVq2tUsnv3qagM3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673980340; x=
 1674066740; bh=TDl0pSXtjsTf+N3SYnRhOJHop3ICupx9F2jTeBtNGEo=; b=F
 JSp1/wnakhlRRHspQj1jZG0hcTGox3TRxqS5L1ZqSUtUFROMF/lR7ogjvJXkfsEh
 fyAeTAx08D2iA+tBibQi52xGlrWIqlxHlksXi5m+XsAdOxsMjWMpVoGXhI3B7Vij
 D2J1XzZVXQoz7iSo06YAFJWFDL4TRzRLt3OmDIcPAcmCIG0WkVBslqehAEsG9XbX
 fQbOdhC4khD4ZXYmowgkdFck7I5Cg/aHI67e9nblzOV8zGTJtA0PvvXsjd0+XkMD
 LC5vBgjdmQKaO16Aflx8F4cRLyEamTkLldfr7HWzeH8HhY8ayf+iiT+TvOwZJAkC
 CfNEtzn1akrd59uA4cP0w==
X-ME-Sender: <xms:s-nGY72WTtZCmU4i2IF5vxTf2dRaMcelIVIvWfHOFzpvP-oa_INLnw>
 <xme:s-nGY6EYFv9GiWkMl6I3rjjoa2kuNfGBTPjdtrO5Ro2r-EQbP8555XodLRS0BVoIW
 SRFjRBh8OcPQdtMhI8>
X-ME-Received: <xmr:s-nGY756VcDU0Ur1RRlqwft98BT-9KRo4ZpFd21_XD6mpf9oJ9TNYoeksHsh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:s-nGYw1jt-C3-Rg0be3U1Bs3TUOol6jz3TCV49MF30Ux8cIHX1zqLw>
 <xmx:s-nGY-GeUkOqYj5r8QbL_45r64PCv6P7fFHjjgvelinb9-mWnm2QZw>
 <xmx:s-nGYx9oPvsQ0D0qWFtofDgs3OtoSVEcfcze9OjbqYq2dfROzTgxzQ>
 <xmx:tOnGYx0NK2xprWtsReGq0AQSvSL-_2DPSfVm6CpgHpVwBOqj09LN4Q>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 13:32:18 -0500 (EST)
Date: Tue, 17 Jan 2023 10:32:15 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/5] hw/arm: Extract at24c_eeprom_init helper from
 Aspeed and Nuvoton boards
Message-ID: <Y8bprzjwzIRXej60@pdel-mbp>
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-2-peter@pjd.dev>
 <961515e6-65ad-ec7f-f51e-a862424f574d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <961515e6-65ad-ec7f-f51e-a862424f574d@linaro.org>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=peter@pjd.dev;
 helo=out3-smtp.messagingengine.com
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

On Tue, Jan 17, 2023 at 09:00:34AM +0100, Philippe Mathieu-Daudé wrote:
> On 17/1/23 00:56, Peter Delevoryas wrote:
> > This helper is useful in board initialization because lets users initialize and
> > realize an EEPROM on an I2C bus with a single function call.
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   hw/arm/aspeed.c                 | 10 +---------
> >   hw/arm/npcm7xx_boards.c         | 20 +++++---------------
> >   hw/nvram/eeprom_at24c.c         | 12 ++++++++++++
> >   include/hw/nvram/eeprom_at24c.h | 10 ++++++++++
> >   4 files changed, 28 insertions(+), 24 deletions(-)
> >   create mode 100644 include/hw/nvram/eeprom_at24c.h
> 
> > diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> > new file mode 100644
> > index 000000000000..79a36b53ca87
> > --- /dev/null
> > +++ b/include/hw/nvram/eeprom_at24c.h
> > @@ -0,0 +1,10 @@
> > +/* Copyright (c) Meta Platforms, Inc. and affiliates. */
> 
> What license for this copyright?

Erg, yeah, thanks for calling this out, I did this wrong. Meta has some new
licensing guidelines and I misinterpreted them. Contributors are just supposed
to use whatever license the open-source project has, so I'll just change this
to say it's under GPL2, like the one I used in hw/arm/fby35.c

> 
> > +#ifndef EEPROM_AT24C_H
> > +#define EEPROM_AT24C_H
> > +
> > +#include "hw/i2c/i2c.h"
> 
>  /**
>   * Create and realize an AT24C EEPROM device on the heap.
>   * @bus: I2C bus to put it on
>   * @addr: I2C address of the EEPROM slave when put on a bus
>   * @rom_size: size of the EEPROM
>   *
>   * Create the device state structure, initialize it, put it on
>   * the specified @bus, and drop the reference to it (the device
>   * is realized).
>   */
>  I2CSlave *at24c_eeprom_create_simple(I2CBus *bus, uint8_t addr,
>                                       size_t rom_size);

+1, I'll include this comment

> 
> > +I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
> > +
> > +#endif
> 

