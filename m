Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73666CBEF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:20:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHT99-0004sX-A0; Mon, 16 Jan 2023 12:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHT91-0004XJ-DI; Mon, 16 Jan 2023 12:19:41 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHT8y-0002Iw-SX; Mon, 16 Jan 2023 12:19:39 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id F36BF320094A;
 Mon, 16 Jan 2023 12:19:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 16 Jan 2023 12:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673889570; x=
 1673975970; bh=vtUHUbgm1Z/AOh5OqfLWhe3wl1ozKsc/IBfogveBl34=; b=Q
 qBzsXv7IXoQV9bLR6UyIrQRIwa/mhHoEixZ2F2fbXQmQYpp5uu5kyQRAqwJMWdcH
 p5c0xrANhcMrw4WzYAYStFbbXXdUkbdipl5ssBiA/p+IAby+9lZRyVtbjjQ19FCw
 XsmsUi0+u8ybKbXQi5Uu7fzniKatvgPzbmYV+izVw2pAAVaflgDL0FWKnaQ5N962
 yf4Wf8RCp6gMlneT8VlF5oOeco+cqCIyWGK0QoQhjZbaBK/rvVeaqgE4QbUS1ell
 IcZgMD11gS+sBtqa4P0Ovp5KJI4o1+JbuKLxtdQ1hVOKvw6PuSMYcLyzQkTUZGJB
 wn/UPY13K4B78fwoRHRYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673889570; x=
 1673975970; bh=vtUHUbgm1Z/AOh5OqfLWhe3wl1ozKsc/IBfogveBl34=; b=r
 we5D86D31cF7YwOKc0UXQKCSJCNQuJ88Ww+q4L5sTBDswHzyM/rROCX3b5K7KPiH
 pBQ9Pzv4sVJcVCMxBzm58pAhZZ/+Mv5jSHDQxnraSf8t2xKKLIU16YRYY68ujou8
 UuuwS4ChjdoDYWcOVBayBv19vfYHjMANwyv0FhV7UOCP4ju8SFMXUkf5egUdHWh6
 iHtPT4cxNebN5a5v2oBXgBI82/gDRioW6PjmQcL+agMSD7LMoij8QGAeXlvYShuu
 bA+wBKY1FG+1WtaO2yI2XsoYgxxaFf1rUAQd/dhG6DJylZLke1Y3p3/nojgeexs4
 8E/E2ZQN3DAy1QdivqG7A==
X-ME-Sender: <xms:IYfFY-28VV-uOnKlS6kUer8kGS_f7jeED3RVqH3Ouxqd0auPC3NHzw>
 <xme:IYfFYxF7sJcvZty-HRFoTmASUZxF15BEVMwvF1iqJ0AknYD3Sc6H6RrFz7R9f-QN-
 JCj4O1cYjNCIaQXvw0>
X-ME-Received: <xmr:IYfFY24Ewk2sIwhXqBRG9tn8aTqxn2POsdwCtlDAmsh0612PnWeplxG_F6ooXueNS7jkRcDe9JwxURJ-lryRShq6QA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtgedgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefgueekffdtueetgfehteffledtueehgfehgeelfedujeefhfffteekvddt
 feetteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:IYfFY_0i4imR6iHDaILz2IpUOB9mZMLo2ITzevb9_gDnTvRc91kfbw>
 <xmx:IYfFYxH4N-TrsOzN4m8-hKrk8wowETDJs8d_HogpG9ocv8-VkqXVog>
 <xmx:IYfFY4-BRmMrHDbCkLvujc4-S4KMqgUtGmkEAvF5Gyh6Qpds6MDRMA>
 <xmx:IofFY3bk0rvdTQZplAWcd1a2t0lnpEtawtp5qWceivS6J-on4wEFBw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 12:19:28 -0500 (EST)
Date: Mon, 16 Jan 2023 09:19:26 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: patrick@stwcx.xyz, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH 6/6] hw/arm/aspeed: Init fby35 BMC FRUID EEPROM
Message-ID: <Y8WHHrGicyqr9hzP@pdel-mbp>
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-7-peter@pjd.dev>
 <3131a986-1db0-8ab2-12cd-11aa32ea29e0@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3131a986-1db0-8ab2-12cd-11aa32ea29e0@kaod.org>
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

On Mon, Jan 16, 2023 at 01:42:48PM +0100, Cédric Le Goater wrote:
> On 1/14/23 18:01, Peter Delevoryas wrote:
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 49 insertions(+)
> > 
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index c929c61d582a..4ac8ff11a835 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -922,6 +922,52 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
> >       i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
> >   }
> > +static const uint8_t fby35_bmc_fruid[] = {
> > +    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
> > +    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
> > +    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
> > +    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
> > +    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
> > +    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x54,
> > +    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
> > +    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +};
> 
> 
> I would introduce a new aspeed_eeprom.c file for these definitions because
> each machine could have its own set of eeproms and aspeed.c is already big
> enough.

+1

> 
> >   static void fby35_i2c_init(AspeedMachineState *bmc)
> >   {
> >       AspeedSoCState *soc = &bmc->soc;
> > @@ -1363,6 +1409,9 @@ static void fby35_reset(MachineState *state, ShutdownCause reason)
> >       object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
> >       object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
> >       object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
> > +
> > +    at24c_eeprom_write(aspeed_i2c_get_bus(&bmc->soc.i2c, 11),
> > +                       0x54, 0, fby35_bmc_fruid, sizeof(fby35_bmc_fruid));
> >   }
> 
> That's one way to model the default reset values of the eeprom, we would
> loose any writes though.
> 
> I think we should have a reset_data buffer instead, which would be used
> at realize time to set the initial data, if there are no drive backend,
> and at reset if !writable. Something like smbus_eeprom_init_one() does
> without a proper property API.

I actually did it this way downstream[1], but I thought it would be controversial
without using properties, and I wasn't sure how to model it with properties.

[1] https://github.com/facebook/openbmc/blob/b98f10b7967ebce1f97e14a9a5d4c14f9f7d4c55/common/recipes-devtools/qemu/qemu/0014-hw-nvram-at24c-Add-static-memory-init-option.patch

> 
> We would need some new interface to set a property for a constant buffer
> of uint<>_t values. I don't know how complex that would be. It could be
> useful to other models to define the init state of registers.

Would DEFINE_PROP_ARRAY not work? Won't the properties be constant after
qdev_realize()?

Or if that's not preferable, DEFINE_PROP_LINK (uint8_t *reset_data) +
DEFINE_PROP_UINT32 (reset_data_size)?

Otherwise, if the property stuff is too uncertain, I'd be happy just adding an
adhoc API through the helper like smbus_eeprom_init_one does.

> 
> Thanks,
> 
> C.
> 
> >   static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)
> 

