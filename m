Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255CA56AB8D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:11:27 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9WuL-0003FW-Sf
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9WnR-0008R0-8h; Thu, 07 Jul 2022 15:04:17 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:43593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9WnP-0005E1-1T; Thu, 07 Jul 2022 15:04:16 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AFC0F5808BA;
 Thu,  7 Jul 2022 15:04:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 07 Jul 2022 15:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657220653; x=
 1657224253; bh=eYUc0MV2RVzG1/C7GW0kta5P2CfB8nCHdmDPuX9jZg4=; b=W
 zmF6dY3zUeLFwDZlcBBI4yqUKvJm+JxbkhLUBuJa/Wo2H5zs63NjVpbHUzJC8sBh
 8ZTxZMKOvrJaEOf3xM8pmI+pqVQk7C4HngEnB9AN7FVrJ0bo9MWsgRYOOCi6D19q
 k7HiXrnP1Og5PIuxZ6np4vhPS0Q5dcxsPyFeMfD/8gke5/Jhw31pc1nInE0+gC5E
 j+/xRigIz66dA3g93keK4wztJIkPjdKk6eXTl/UNCZphTJzgAtQkWBM8Go4wOL9T
 yQTQKFmvheMv+4TOiJ7sRa+earhcZLlcml8txak98Hz3jFW3/ilF1VfkDMyojEeO
 JHdTHw3944ep75Snf/zNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657220653; x=
 1657224253; bh=eYUc0MV2RVzG1/C7GW0kta5P2CfB8nCHdmDPuX9jZg4=; b=u
 Seb8Rr/yz2suH+PU1kvH+OSu8GkxRs7tZM/FVd/4I7ifXEWv0L+2X3ruHgBVlJbH
 Inju1pmFds1tkq0wTmD1hSm4FfPX7j9dnOaiWcWS/DZR00mQ2cAtCdGF83kLfVnu
 OpzgnGObDMajBNhWyHkWE0zanZZsVXTF1XuvDP7/8KIeoX1PED9Iis4MvXVkWPB4
 A+Jdw5587wV65VMbg+cmSuSPWP6/xqgxMYpGQiTVUTrho7IYQFliVUlFas//ArHy
 glduTs/FztP58wmPJ8a5My5LGTIltkxv3IzexZe2/bHEl0e4OkYX1xamGpGENBMw
 4QcIBmFSuAFXilD2LPYaw==
X-ME-Sender: <xms:LC7HYjJJqpWdzPQxngl9tIz2a1YDx6B5bGceOFH1z3vtPogSkkzNLQ>
 <xme:LC7HYnIyUtUgOpCBh4YIwdPfRkbEYedpQ5mhuaPbRuefmptxaOPM1MybHBuJh1KQv
 FA9IFFgxz0KYgXqwe8>
X-ME-Received: <xmr:LC7HYrs-ygGROJVp2ksc0PF1JQDXHiYWKsbJIxG3B6reMlWjfmhi0CyYrITkHTYiEgdjsrwUCyYJvk7XjVMyvvNC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeihedgudefgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekrodttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepffeiuddthfeifedtleektedvtdellefgffeujeehjeejiefhffduveeg
 leeiledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:LC7HYsYjwLp5xFI8qxV8izE4bJRv7N96k7kfre5JC9Kp0RQ0fS1gHg>
 <xmx:LC7HYqbjvg6i1sO0U4M3fDD8HUsODhokxHRNGlb3vOV_7GWH6Kcopg>
 <xmx:LC7HYgCuvBle7VrA44B-b0_rtZ58r7PGsXLSfYZ9F2nBTqv3OZZ9KA>
 <xmx:LS7HYhVhmCOUvr2Ic5RuFKiaK1gJ7WKjDYQMVCr_VOblYPCq6m7CHA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Jul 2022 15:04:12 -0400 (EDT)
Date: Thu, 7 Jul 2022 12:04:10 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/gpio/aspeed: Don't let guests modify input pins
Message-ID: <YscuKtVuZojYtqXo@pdel-mbp.dhcp.thefacebook.com>
References: <20220707071731.34047-1-peter@pjd.dev>
 <20220707071731.34047-2-peter@pjd.dev>
 <fa52743a-5730-3b3f-f07f-99931bb66b01@kaod.org>
 <YscdtXYL5sJRSm6Z@pdel-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YscdtXYL5sJRSm6Z@pdel-mbp>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=peter@pjd.dev;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 07, 2022 at 10:53:57AM -0700, Peter Delevoryas wrote:
> On Thu, Jul 07, 2022 at 10:56:02AM +0200, Cédric Le Goater wrote:
> > On 7/7/22 09:17, Peter Delevoryas wrote:
> > > It seems that aspeed_gpio_update is allowing the value for input pins to be
> > > modified through register writes and QOM property modification.
> > > 
> > > The QOM property modification is fine, but modifying the value through
> > > register writes from the guest OS seems wrong if the pin's direction is set
> > > to input.
> > > 
> > > The datasheet specifies that "0" bits in the direction register select input
> > > mode, and "1" selects output mode.
> > > 
> > > OpenBMC userspace code is accidentally writing 0's to the GPIO data
> > > registers somewhere (or perhaps the driver is doing it through a reset or
> > > something), and this is overwriting GPIO FRU information (board ID, slot
> > > presence pins) that is initialized in Aspeed machine reset code (see
> > > fby35_reset() in hw/arm/aspeed.c).
> > 
> > It might be good to log a GUEST_ERROR in that case, when writing to an
> > input GPIO and when reading from an output GPIO.
> 
> Good idea, I'll include a GUEST_ERROR for writing to an input GPIO.
> 
> I'm actually not totally certain about emitting an error when reading from an
> output GPIO, because the driver can only do 8-bit reads at the finest
> granularity, and if 1 of the 8 pins' direction is output, then it will be
> reading the value of an output pin. But, that's not really bad, because
> presumably the value will be ignored. Maybe I can go test this out on
> hardware and figure out what happens though.

Did a small experiment, I was looking at some of the most significant
bits:

root@dhcp-100-96-192-133:~# devmem 0x1e780000
0x3CFF303E
root@dhcp-100-96-192-133:~# devmem 0x1e780004
0x2800000C
root@dhcp-100-96-192-133:~# devmem 0x1e780000 32 0xffffffff
root@dhcp-100-96-192-133:~# devmem 0x1e780004
0x2800000C
root@dhcp-100-96-192-133:~# devmem 0x1e780000
0x3CFF303E
root@dhcp-100-96-192-133:~# devmem 0x1e780000
0x3CFF303E
root@dhcp-100-96-192-133:~# devmem 0x1e780000 32 0
root@dhcp-100-96-192-133:~# devmem 0x1e780000
0x14FF303A

Seems like the output pin 0x20000000 was initially high, and the input
pin right next to it 0x10000000 was also high. After writing 0 to the
data register, the value in the data register changed for the output
pin, but not the input pin.  Which matches what we're planning on doing
in the controller.

So yeah, I'll add GUEST_ERROR for writes to input pins but not output
pins.  The driver should probably be doing a read-modify-update.
Although...if it's not, that technically wouldn't matter, behavior
wise...maybe GUEST_ERROR isn't appropriate for writes to input pins
either, for the same reason as I mentioned with reads of output pins.
I'll let you guys comment on what you think we should do.

> 
> Thanks,
> Peter
> 
> > 
> > Thanks,
> > 
> > C.
> > 
> > > 
> > > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > > Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
> > > ---
> > >   hw/gpio/aspeed_gpio.c | 22 ++++++++++++----------
> > >   1 file changed, 12 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> > > index a62a673857..2eae427201 100644
> > > --- a/hw/gpio/aspeed_gpio.c
> > > +++ b/hw/gpio/aspeed_gpio.c
> > > @@ -268,7 +268,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
> > >   }
> > >   static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
> > > -                               uint32_t value)
> > > +                               uint32_t value, bool force)
> > >   {
> > >       uint32_t input_mask = regs->input_mask;
> > >       uint32_t direction = regs->direction;
> > > @@ -293,10 +293,12 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
> > >               }
> > >               /* ...then update the state. */
> > > -            if (mask & new) {
> > > -                regs->data_value |= mask;
> > > -            } else {
> > > -                regs->data_value &= ~mask;
> > > +            if (direction & mask || force) {
> > > +                if (mask & new) {
> > > +                    regs->data_value |= mask;
> > > +                } else {
> > > +                    regs->data_value &= ~mask;
> > > +                }
> > >               }
> > >               /* If the gpio is set to output... */
> > > @@ -339,7 +341,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
> > >           value &= ~pin_mask;
> > >       }
> > > -    aspeed_gpio_update(s, &s->sets[set_idx], value);
> > > +    aspeed_gpio_update(s, &s->sets[set_idx], value, true);
> > >   }
> > >   /*
> > > @@ -653,7 +655,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
> > >           reg_value = update_value_control_source(set, set->data_value,
> > >                                                   reg_value);
> > >           set->data_read = reg_value;
> > > -        aspeed_gpio_update(s, set, reg_value);
> > > +        aspeed_gpio_update(s, set, reg_value, false);
> > >           return;
> > >       case gpio_reg_idx_direction:
> > >           reg_value = set->direction;
> > > @@ -753,7 +755,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
> > >               __func__, offset, data, reg_idx_type);
> > >           return;
> > >       }
> > > -    aspeed_gpio_update(s, set, set->data_value);
> > > +    aspeed_gpio_update(s, set, set->data_value, false);
> > >       return;
> > >   }
> > > @@ -799,7 +801,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
> > >           data &= props->output;
> > >           data = update_value_control_source(set, set->data_value, data);
> > >           set->data_read = data;
> > > -        aspeed_gpio_update(s, set, data);
> > > +        aspeed_gpio_update(s, set, data, false);
> > >           return;
> > >       case gpio_reg_direction:
> > >           /*
> > > @@ -875,7 +877,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
> > >                         PRIx64"\n", __func__, offset);
> > >           return;
> > >       }
> > > -    aspeed_gpio_update(s, set, set->data_value);
> > > +    aspeed_gpio_update(s, set, set->data_value, false);
> > >       return;
> > >   }
> > 
> 

