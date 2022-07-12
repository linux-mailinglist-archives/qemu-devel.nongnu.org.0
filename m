Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40143570FF3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:02:31 +0200 (CEST)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5EM-0003xF-CX
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oB59z-0006kB-Eu
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 21:57:59 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:33001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oB59x-0003Lh-8P
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 21:57:58 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 26AE75809F8;
 Mon, 11 Jul 2022 21:57:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 11 Jul 2022 21:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657591075; x=
 1657594675; bh=Cs2LFVdOOqVDBRWqGliPDI07Y93G5RjeLKoGD3zyULQ=; b=z
 cdQYPplvE/1t1RvONr33XBhLXYVsMwSo9YUiSyLSdjjxQlmySv7LR+1ustA22iHH
 3Swrb8WyGGzNmh8MOW2Bh3O//tjq84eZanZTYo2QDD20d+1nFWslaf034YV9MaxT
 AmaJeKDPGZMnX5KfasrfwrNMcWMBeu5RkVcAx/6sjFoUKLJkGw2xsHf/3gw6Aupw
 P58bKjqueXwrBakMDX8wmZWQM+kKHbFaMsPX2VjGOw44iTRXU96+H2SUqORmeieD
 8k6flUq+90A6vpOxjmKFUwD08qQ2+voMgJq0CBjx9t1TvOG4PMtuXpqnbrdqmiB4
 fxDT8L933VtdZlpoO8uMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657591075; x=
 1657594675; bh=Cs2LFVdOOqVDBRWqGliPDI07Y93G5RjeLKoGD3zyULQ=; b=q
 4Aw5fOCZXgv3iqWqaJWygEAzwdmmdVGSjzrhihSxdWTdymWmB5ZXQaVjNc+zjopL
 FYv1leRCvfP5w3PC4TMqPlgMYOzEN8OMidzQ9w8GXJTLP6pf88zFhmOBokSA7iCw
 oAev9M4FBAk2OZ755KCyUx51phC1z3OZnkgAMz0W5O6jy7SYNj+mQMjhdOvYAZ1E
 9hlYa6y0Q4lb46j6p4h9nJxnSli4y0EN691U+bXBZMoIYsfctYDs3hn2ceLtGAUD
 IAKZxOlymeQAqvyFncZxBbl+qWzFgyAltnnCbVQb3HZnyeAT4cdoI/KaMf0F9LHq
 G/lMh+nVrJ4oDKDx9K0FA==
X-ME-Sender: <xms:ItXMYqa2FO6D3XV0Qjqov30fKZNHOe7pVlDmYYAzqIIGzgqRViZRIg>
 <xme:ItXMYtYE6ZcsD8IvPLx6qHOrpT994fmoHgUFuBb_kbSlJqhLG-fts0ni3D6gJVMcq
 viDjnnA5ygU2A0f7z0>
X-ME-Received: <xmr:ItXMYk-rNwmELzOCxPOf_ZApbwZHb-ig6ayOmyZ8WAQeghHHPNlblLC_RfVayCZBY3ZBafLNHu6L-dz6DxpOaUhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:ItXMYspWVKS3cnyqBrD4Jt3AGdwJs5mcp_o0PAKdXIhydwJRZqvPDQ>
 <xmx:ItXMYlo0XihS3CHRNE_-OTrW0BRIUTw_yUFygonrqh80VGhU51kTxQ>
 <xmx:ItXMYqTCA6OkzkrFgc0kZRM9ecWccVHGLih3H1A_M9nS3PjJp4qa_g>
 <xmx:ItXMYkRDS7-syGzannyD0ywAf3-QNC5EVX514zxx-x4QANHSrQU1QA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 21:57:54 -0400 (EDT)
Date: Mon, 11 Jul 2022 18:57:52 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Cameron Esfahani via <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/2] hw/gpio/aspeed: Don't let guests modify input pins
Message-ID: <YszVIJrPXFmMMZ/A@pdel-mbp.dhcp.thefacebook.com>
References: <20220707071731.34047-1-peter@pjd.dev>
 <20220707071731.34047-2-peter@pjd.dev>
 <fa52743a-5730-3b3f-f07f-99931bb66b01@kaod.org>
 <YscdtXYL5sJRSm6Z@pdel-mbp>
 <YscuKtVuZojYtqXo@pdel-mbp.dhcp.thefacebook.com>
 <23523aa1-ba81-412b-92cc-8174faba3612@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23523aa1-ba81-412b-92cc-8174faba3612@www.fastmail.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jul 11, 2022 at 10:56:08PM +0930, Andrew Jeffery wrote:
> 
> 
> On Fri, 8 Jul 2022, at 04:34, Peter Delevoryas wrote:
> > On Thu, Jul 07, 2022 at 10:53:57AM -0700, Peter Delevoryas wrote:
> >> On Thu, Jul 07, 2022 at 10:56:02AM +0200, Cédric Le Goater wrote:
> >> > On 7/7/22 09:17, Peter Delevoryas wrote:
> >> > > It seems that aspeed_gpio_update is allowing the value for input pins to be
> >> > > modified through register writes and QOM property modification.
> >> > > 
> >> > > The QOM property modification is fine, but modifying the value through
> >> > > register writes from the guest OS seems wrong if the pin's direction is set
> >> > > to input.
> >> > > 
> >> > > The datasheet specifies that "0" bits in the direction register select input
> >> > > mode, and "1" selects output mode.
> >> > > 
> >> > > OpenBMC userspace code is accidentally writing 0's to the GPIO data
> >> > > registers somewhere (or perhaps the driver is doing it through a reset or
> >> > > something), and this is overwriting GPIO FRU information (board ID, slot
> >> > > presence pins) that is initialized in Aspeed machine reset code (see
> >> > > fby35_reset() in hw/arm/aspeed.c).
> >> > 
> >> > It might be good to log a GUEST_ERROR in that case, when writing to an
> >> > input GPIO and when reading from an output GPIO.
> >> 
> >> Good idea, I'll include a GUEST_ERROR for writing to an input GPIO.
> >> 
> >> I'm actually not totally certain about emitting an error when reading from an
> >> output GPIO, because the driver can only do 8-bit reads at the finest
> >> granularity, and if 1 of the 8 pins' direction is output, then it will be
> >> reading the value of an output pin. But, that's not really bad, because
> >> presumably the value will be ignored. Maybe I can go test this out on
> >> hardware and figure out what happens though.
> >
> > Did a small experiment, I was looking at some of the most significant
> > bits:
> >
> > root@dhcp-100-96-192-133:~# devmem 0x1e780000
> > 0x3CFF303E
> > root@dhcp-100-96-192-133:~# devmem 0x1e780004
> > 0x2800000C
> > root@dhcp-100-96-192-133:~# devmem 0x1e780000 32 0xffffffff
> > root@dhcp-100-96-192-133:~# devmem 0x1e780004
> > 0x2800000C
> > root@dhcp-100-96-192-133:~# devmem 0x1e780000
> > 0x3CFF303E
> > root@dhcp-100-96-192-133:~# devmem 0x1e780000
> > 0x3CFF303E
> > root@dhcp-100-96-192-133:~# devmem 0x1e780000 32 0
> > root@dhcp-100-96-192-133:~# devmem 0x1e780000
> > 0x14FF303A
> >
> > Seems like the output pin 0x20000000 was initially high, and the input
> > pin right next to it 0x10000000 was also high. After writing 0 to the
> > data register, the value in the data register changed for the output
> > pin, but not the input pin.  Which matches what we're planning on doing
> > in the controller.
> >
> > So yeah, I'll add GUEST_ERROR for writes to input pins but not output
> > pins.  The driver should probably be doing a read-modify-update.
> > Although...if it's not, that technically wouldn't matter, behavior
> > wise...maybe GUEST_ERROR isn't appropriate for writes to input pins
> > either, for the same reason as I mentioned with reads of output pins.
> > I'll let you guys comment on what you think we should do.
> >
> 
> With the quick hack below I think I got sensible behaviour?
> 
> ```
> # devmem 0x1e780000
> 0x00000000
> # devmem 0x1e780004
> 0x00000000
> # devmem 0x1e780004 32 1
> # devmem 0x1e780000 32 1
> # devmem 0x1e780000
> 0x00000001
> # devmem 0x1e780000 32 3
> # devmem 0x1e780000
> 0x00000001
> # QEMU 7.0.0 monitor - type 'help' for more information
> (qemu) qom-set gpio gpioA1 on
> (qemu) 
> 
> # devmem 0x1e780000
> 0x00000003
> # (qemu) qom-set gpio gpioA1 off
> (qemu) 
> 
> # devmem 0x1e780000
> 0x00000001
> # (qemu) qom-set gpio gpioA0 off
> (qemu) 
> # devmem 0x1e780000
> 0x00000001
> # 
> ```
> 
> That was with the patch below. However, I think there's a deeper issue 
> with the input masking that needs to be addressed. Essentially we lack 
> modelling for the actual line state, we were proxying that with 
> register state. As it stands if we input-mask a line and use qom-set to 
> change its state the state update will go missing. However, as Joel 
> notes, I don't think we have anything configuring input masking.
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index c63634d3d3e2..a1aa6504a8d8 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -244,7 +244,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
>  }
>  
>  static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
> -                               uint32_t value)
> +                               uint32_t value, uint32_t mode_mask)
>  {
>      uint32_t input_mask = regs->input_mask;
>      uint32_t direction = regs->direction;
> @@ -253,7 +253,8 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
>      uint32_t diff;
>      int gpio;
>  
> -    diff = old ^ new;
> +    diff = (old ^ new);
> +    diff &= mode_mask;
>      if (diff) {
>          for (gpio = 0; gpio < ASPEED_GPIOS_PER_SET; gpio++) {
>              uint32_t mask = 1 << gpio;
> @@ -315,7 +316,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
>          value &= !pin_mask;
>      }
>  
> -    aspeed_gpio_update(s, &s->sets[set_idx], value);
> +    aspeed_gpio_update(s, &s->sets[set_idx], value, ~s->sets[set_idx].direction);
>  }
>  
>  /*
> @@ -607,7 +608,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>          data &= props->output;
>          data = update_value_control_source(set, set->data_value, data);
>          set->data_read = data;
> -        aspeed_gpio_update(s, set, data);
> +        aspeed_gpio_update(s, set, data, set->direction);
>          return;
>      case gpio_reg_direction:
>          /*
> @@ -683,7 +684,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>                        HWADDR_PRIx"\n", __func__, offset);
>          return;
>      }
> -    aspeed_gpio_update(s, set, set->data_value);
> +    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);

Looks great overall, but why is the mode_mask UINT32_MAX here? Shouldn't it be
set->direction? We only want to let the guest OS write to output pins, right?
Or is that not how the register works?

>      return;
>  }
>  
> 

