Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8EA59E951
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 19:29:30 +0200 (CEST)
Received: from localhost ([::1]:54648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQXiT-0003bR-CY
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 13:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oQXh8-0001pJ-G3; Tue, 23 Aug 2022 13:28:06 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:32821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oQXh5-0003hv-LA; Tue, 23 Aug 2022 13:28:06 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C3F1A3200893;
 Tue, 23 Aug 2022 13:27:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 23 Aug 2022 13:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1661275677; x=1661362077; bh=VNZJx9XYg/
 NLVHymSraPF3rCK5/Eh1c8XzX2msDryVw=; b=aG4pT8WxZeBnOuWeZz4hIjYH1O
 Dqih7pzMcwQUvIH/9THSoyI0I3sNjj8yTNhcacWxFbjnk8DzXskUwKUSuTRZVk8Q
 jGOXDXKwV3Srnn3Tn/kZRMUAHrFJvUovMzjHW8qhwaHGFr4JaKqFqfJUfjU9Q1gB
 MC9IJPOVJPM+0yRFg3f0VcLR/CAtED2E9NjdUdoooSBI03zmCWYPphHzhXKNhp18
 rSDsoRqOqO3/jpSVL6RaH68U2//HrEhty9TxR9QoduYcmNAF2Box7FWfEN17oVhD
 Fc0qXDQc/z9KZcN62mwj5eEk+j0JrWZJVOprDu3p0ShLshlp+x0EBraCpM1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661275677; x=1661362077; bh=VNZJx9XYg/NLVHymSraPF3rCK5/E
 h1c8XzX2msDryVw=; b=pIOmACo0jskQL1IP+PL+IKKXEe20EhJcvldPA1ZPVkOk
 1Nm3X2X6qtrwiulLLhbqCa197xG8gYJl0o/ec83+LeRJWTJliP2a7Bk3zU/uRLMm
 FRnP3767as1OUNY62IMofPyRXuTSLmEyOWeebP9gUDZg0hggJJFdBbbQWcpt+Tt7
 cotD4N00Bnut/HtMBu4oflXcSc0J8AYwXgweOe+/LDVfZNt/9ZTONP0I+PPfTQ3N
 6H+mYlSo09l1MXHqqMWOVMJs7HrfvO2qrT6yYB8nobCuSPHd0RzapQswpL63ZrmP
 LJkoZJesIv7L5K4yplts6LAP/6qQK5SQvrA1ECza2A==
X-ME-Sender: <xms:HA4FY7y8mav2ecZdSMXi02oKuzdeCL-P_susuu1uhH1DLyViwyhpzA>
 <xme:HA4FYzRgTH2_Z0xMkc1uIJo5zca3xH7b2HnMQ1lTdGFHyXLduWlXMEdXM0OUFzYcM
 -uk8vZEyizl88gvewA>
X-ME-Received: <xmr:HA4FY1UGRLfzi52hlmH1a9lWOt1wZ4DXOvq_eR3rtgRwnlnXIoVH4Z66oTRo3T5MDV_srdIQLS2W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiledguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesth
 dtredttddtvdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgv
 rhesphhjugdruggvvheqnecuggftrfgrthhtvghrnhepfeetudffgfeuieeutdeghedtve
 etfeeuieeigedvuedugefgjeekffefhfevgfevnecuffhomhgrihhnpehkvghrnhgvlhdr
 ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:HA4FY1h85vZ1-jcyN_ribpy8kmaULo7FhcNT6nmON6ObeSrsfRa76w>
 <xmx:HA4FY9DFPWHkLy8HW9rx1sLLSEn_kEeoXyO1AMlRnfBhilXpptvDdg>
 <xmx:HA4FY-K1rCOiFPAcpSQFx2tsLDtID_ubBoxzs96JkncJjrFxIEf2_g>
 <xmx:HQ4FY3BfHnNFPvTUV-_LaR94OlX2tnZ7wJOWyk1Uts0wQsftWPbbog>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 13:27:55 -0400 (EDT)
Date: Tue, 23 Aug 2022 10:27:53 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Klaus Jensen <its@irrelevant.dk>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, dz4list@gmail.com
Subject: Re: [PATCH 1/1] hw/i2c/aspeed: Fix old reg slave receive
Message-ID: <YwUOGUfJTPtE4AzH@pdel-fedora-MJ0HJWH9>
References: <20220820225712.713209-1-peter@pjd.dev>
 <20220820225712.713209-2-peter@pjd.dev> <YwScq4fD+gBIN+3Q@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwScq4fD+gBIN+3Q@apples>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=peter@pjd.dev;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On Tue, Aug 23, 2022 at 11:23:55AM +0200, Klaus Jensen wrote:
> On Aug 20 15:57, Peter Delevoryas wrote:
> > I think when Klaus ported his slave mode changes from the original patch
> > series to the rewritten I2C module, he changed the behavior of the first
> > byte that is received by the slave device.
> > 
> > What's supposed to happen is that the AspeedI2CBus's slave device's
> > i2c_event callback should run, and if the event is "send_async", then it
> > should populate the byte buffer with the 8-bit I2C address that is being
> > sent to. Since we only support "send_async", the lowest bit should
> > always be 0 (indicating that the master is requesting to send data).
> > 
> > This is the code Klaus had previously, for reference. [1]
> > 
> >     switch (event) {
> >     case I2C_START_SEND:
> >         bus->buf = bus->dev_addr << 1;
> > 
> >         bus->buf &= I2CD_BYTE_BUF_RX_MASK;
> >         bus->buf <<= I2CD_BYTE_BUF_RX_SHIFT;
> > 
> >         bus->intr_status |= (I2CD_INTR_SLAVE_ADDR_RX_MATCH | I2CD_INTR_RX_DONE);
> >         aspeed_i2c_set_state(bus, I2CD_STXD);
> > 
> >         break;
> > 
> > [1]: https://lore.kernel.org/qemu-devel/20220331165737.1073520-4-its@irrelevant.dk/
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > Fixes: a8d48f59cd021b25 ("hw/i2c/aspeed: add slave device in old register mode")
> > ---
> >  hw/i2c/aspeed_i2c.c         | 8 +++++---
> >  include/hw/i2c/aspeed_i2c.h | 1 +
> >  2 files changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > index 42c6d69b82..c166fd20fa 100644
> > --- a/hw/i2c/aspeed_i2c.c
> > +++ b/hw/i2c/aspeed_i2c.c
> > @@ -1131,7 +1131,9 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
> >      AspeedI2CBus *bus = ASPEED_I2C_BUS(qbus->parent);
> >      uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
> >      uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
> > -    uint32_t value;
> > +    uint32_t reg_dev_addr = aspeed_i2c_bus_dev_addr_offset(bus);
> > +    uint32_t dev_addr = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_dev_addr,
> > +                                                SLAVE_DEV_ADDR1);
> >  
> >      if (aspeed_i2c_is_new_mode(bus->controller)) {
> >          return aspeed_i2c_bus_new_slave_event(bus, event);
> > @@ -1139,8 +1141,8 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
> >  
> >      switch (event) {
> >      case I2C_START_SEND_ASYNC:
> > -        value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
> > -        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, value << 1);
> > +        /* Bit[0] == 0 indicates "send". */
> > +        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, dev_addr << 1);
> >  
> >          ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
> >          SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
> > diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> > index 300a89b343..adc904d6c1 100644
> > --- a/include/hw/i2c/aspeed_i2c.h
> > +++ b/include/hw/i2c/aspeed_i2c.h
> > @@ -130,6 +130,7 @@ REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
> >      SHARED_FIELD(M_TX_CMD, 1, 1)
> >      SHARED_FIELD(M_START_CMD, 0, 1)
> >  REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
> > +    SHARED_FIELD(SLAVE_DEV_ADDR1, 0, 7)
> >  REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
> >      SHARED_FIELD(RX_COUNT, 24, 5)
> >      SHARED_FIELD(RX_SIZE, 16, 5)
> > -- 
> > 2.37.1
> > 
> 
> Nice catch Peter! I'm not sure how I messed that up like that.
> 
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

Thanks Klaus. Just realized I forgot to cc you on this, sorry about
that.

