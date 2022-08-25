Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AEA5A0B2D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 10:19:39 +0200 (CEST)
Received: from localhost ([::1]:33732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR85S-0005V5-NI
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 04:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oR7r8-0004tt-Qq; Thu, 25 Aug 2022 04:04:51 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:50817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oR7r6-0003qq-5O; Thu, 25 Aug 2022 04:04:50 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 869935C01A2;
 Thu, 25 Aug 2022 04:04:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 25 Aug 2022 04:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1661414685; x=
 1661501085; bh=CfvQJ6/WyHe/1OWcCMJbSjchKIgrmTkxi07s7Nqupr4=; b=D
 pbuUnG7Itus9MppMtVKofGx/RBlsuvdULmauZl7mlk0LP5X5txECeAFRxOVdOBKx
 LF2CfxBdPu+6/eGALKtT/7ZNDFGd0Hc0CBUW/dU+ltu71g1+NiY3iK/uf3lCicti
 Y2Lpa0RlRi4NewKL8eqY/zbdYQETFfz4l3Yqmb46ulrHnnZBAKeBgdYnCkpQbbTb
 j664a4LNIJlVjZ/gjPh4eniEqTQWWNo9pPM8qOzCmZ7PTkxhwRKqA318/5Qdw6kl
 WjWiLa/vosE3Qtt+2r7Ea5W7RgsNqchrpoN/2eiuyWVmh7Cwb1FgU6l9kYifuAJs
 8KPMtcKd/LnEgMmIY19lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661414685; x=
 1661501085; bh=CfvQJ6/WyHe/1OWcCMJbSjchKIgrmTkxi07s7Nqupr4=; b=Z
 TmagIRxj56vZqGcuGfu0/WD0IWtQJ0tC0PjOfCrZ3QFxWAnglriZ6drN3cPETP0R
 sg1qX6nUpr7kv1qwelGXmAtTM47I0fsW+Tw4IRtWQMoQii1UOxcd/5k+2sWOTOfF
 Zn0OspwAvT3RYIEjH27OXIPki57TgvOIOAh3Q+qXAK8YSM6QLJk8v+1JO8Hhd8fR
 bdv6TSGJ6yNlaIeD/RMXwVFyZLCEILNO9hNMSwAVcjLlg5n0GtC/DxR6l4JrFXRX
 SQmzSjcn3Pgk8Kq67OM0Uytg8325SyjBKH7QpvkM3sTiAiuGWImBM0D3YfnOx4DN
 uoaZLN2kEZdqvQIFgO7Gg==
X-ME-Sender: <xms:HS0HY4cWAcXX5-QOZ214AdPL9yVzG0yv-wypnoa1CxgiExUt6pweQw>
 <xme:HS0HY6P9HfqE1wOmkEoY_NtSI575otmKoNFLUUzP5p1pcUXbbURlp91loZFqEFZln
 KowOKYE8qISDMhteGc>
X-ME-Received: <xmr:HS0HY5jISZSBB02FesQbXHPTFI1j9SlkPtUgzP4E4mqhrGUPcMH1q-vcrid0rZz9gUEujTFiJjs3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejvddguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjse
 htkeertddttddunecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvght
 vghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpedthfeuveelueeuffehkefhhf
 ekteeijeeiteduveegtdeklefhgedufeejieekjeenucffohhmrghinhepkhgvrhhnvghl
 rdhorhhgpdhgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:HS0HY99kpm41RpbozcuCvQXMhS99Zvv4_Tmc8bfTfBYyvaAYickS0Q>
 <xmx:HS0HY0sRUTcAF7ofibRjVht2-x4kjn-CiCEWRffJreLC9GoHji7sog>
 <xmx:HS0HY0FbGN9Hh8JzP0m8pi4_gTbqvul_AlgoXmBu1OV7Xws6UhwOlg>
 <xmx:HS0HY5823r30wZoRASoPR0k3r10j1eohprpmhIiXM2q4YpGoJReRew>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 04:04:44 -0400 (EDT)
Date: Thu, 25 Aug 2022 01:04:42 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Klaus Jensen <its@irrelevant.dk>, patrick@stwcx.xyz,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, dz4list@gmail.com
Subject: Re: [PATCH 1/1] hw/i2c/aspeed: Fix old reg slave receive
Message-ID: <YwctGh2jfdCSHzlB@pdel-fedora-MJ0HJWH9>
References: <20220820225712.713209-1-peter@pjd.dev>
 <20220820225712.713209-2-peter@pjd.dev> <YwScq4fD+gBIN+3Q@apples>
 <YwUOGUfJTPtE4AzH@pdel-fedora-MJ0HJWH9>
 <65ea4c92-9dc3-bed2-c287-d4d7a4a45e3b@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65ea4c92-9dc3-bed2-c287-d4d7a4a45e3b@kaod.org>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=peter@pjd.dev;
 helo=out5-smtp.messagingengine.com
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

On Wed, Aug 24, 2022 at 04:31:50PM +0200, Cédric Le Goater wrote:
> On 8/23/22 19:27, Peter Delevoryas wrote:
> > On Tue, Aug 23, 2022 at 11:23:55AM +0200, Klaus Jensen wrote:
> > > On Aug 20 15:57, Peter Delevoryas wrote:
> > > > I think when Klaus ported his slave mode changes from the original patch
> > > > series to the rewritten I2C module, he changed the behavior of the first
> > > > byte that is received by the slave device.
> > > > 
> > > > What's supposed to happen is that the AspeedI2CBus's slave device's
> > > > i2c_event callback should run, and if the event is "send_async", then it
> > > > should populate the byte buffer with the 8-bit I2C address that is being
> > > > sent to. Since we only support "send_async", the lowest bit should
> > > > always be 0 (indicating that the master is requesting to send data).
> > > > 
> > > > This is the code Klaus had previously, for reference. [1]
> > > > 
> > > >      switch (event) {
> > > >      case I2C_START_SEND:
> > > >          bus->buf = bus->dev_addr << 1;
> > > > 
> > > >          bus->buf &= I2CD_BYTE_BUF_RX_MASK;
> > > >          bus->buf <<= I2CD_BYTE_BUF_RX_SHIFT;
> > > > 
> > > >          bus->intr_status |= (I2CD_INTR_SLAVE_ADDR_RX_MATCH | I2CD_INTR_RX_DONE);
> > > >          aspeed_i2c_set_state(bus, I2CD_STXD);
> > > > 
> > > >          break;
> > > > 
> > > > [1]: https://lore.kernel.org/qemu-devel/20220331165737.1073520-4-its@irrelevant.dk/
> > > > 
> > > > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > > > Fixes: a8d48f59cd021b25 ("hw/i2c/aspeed: add slave device in old register mode")
> > > > ---
> > > >   hw/i2c/aspeed_i2c.c         | 8 +++++---
> > > >   include/hw/i2c/aspeed_i2c.h | 1 +
> > > >   2 files changed, 6 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > > > index 42c6d69b82..c166fd20fa 100644
> > > > --- a/hw/i2c/aspeed_i2c.c
> > > > +++ b/hw/i2c/aspeed_i2c.c
> > > > @@ -1131,7 +1131,9 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
> > > >       AspeedI2CBus *bus = ASPEED_I2C_BUS(qbus->parent);
> > > >       uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
> > > >       uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
> > > > -    uint32_t value;
> > > > +    uint32_t reg_dev_addr = aspeed_i2c_bus_dev_addr_offset(bus);
> > > > +    uint32_t dev_addr = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_dev_addr,
> > > > +                                                SLAVE_DEV_ADDR1);
> > > >       if (aspeed_i2c_is_new_mode(bus->controller)) {
> > > >           return aspeed_i2c_bus_new_slave_event(bus, event);
> > > > @@ -1139,8 +1141,8 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
> > > >       switch (event) {
> > > >       case I2C_START_SEND_ASYNC:
> > > > -        value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
> > > > -        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, value << 1);
> > > > +        /* Bit[0] == 0 indicates "send". */
> > > > +        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, dev_addr << 1);
> > > >           ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
> > > >           SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
> > > > diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> > > > index 300a89b343..adc904d6c1 100644
> > > > --- a/include/hw/i2c/aspeed_i2c.h
> > > > +++ b/include/hw/i2c/aspeed_i2c.h
> > > > @@ -130,6 +130,7 @@ REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
> > > >       SHARED_FIELD(M_TX_CMD, 1, 1)
> > > >       SHARED_FIELD(M_START_CMD, 0, 1)
> > > >   REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
> > > > +    SHARED_FIELD(SLAVE_DEV_ADDR1, 0, 7)
> > > >   REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
> > > >       SHARED_FIELD(RX_COUNT, 24, 5)
> > > >       SHARED_FIELD(RX_SIZE, 16, 5)
> > > > -- 
> > > > 2.37.1
> > > > 
> > > 
> > > Nice catch Peter! I'm not sure how I messed that up like that.
> > > 
> > > Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Thanks Klaus. Just realized I forgot to cc you on this, sorry about
> > that.
> 
> Do we still have time for 7.1 ?

Is this question for me, or for Peter Maydell or someone else working on the
release? I think they might still be accepting some patches, or deciding if rc4
is necessary: I've created this issue to bring awareness to this, since that
seems like the right way to track this for the release.

https://gitlab.com/qemu-project/qemu/-/issues/1174

I don't have any special need for 7.1, since our team branches off of master and
regularly pulls in updates.

> 
> Thanks,
> 
> C.
> 
> 

