Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE31A562014
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 18:17:57 +0200 (CEST)
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6wrc-0004A1-EO
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 12:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6wpW-0001yB-RU; Thu, 30 Jun 2022 12:15:49 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:41755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6wpS-0003cf-J3; Thu, 30 Jun 2022 12:15:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5714C2B059C8;
 Thu, 30 Jun 2022 12:15:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 30 Jun 2022 12:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656605737; x=
 1656609337; bh=/bsjIZIV7ZsS/9hKhk9NGWhid6QWsXMDPlXxbMZl7H0=; b=O
 MTXNy3QrCAWJ4MTmV7NiysfZcBd3mNF5+bbOXy3KRMxFPtl3WqNxsIKMdem5II9i
 BhcrqFgIkAZeeOq7HcJLG7Yp7H6mHdJpAO94IJJijlaQ/ygAx0Nai0abISLtKjWA
 BrnMFzQ2cW0Lr9RlTUnXqYtCSZFg7tjbxxD1B92PiM7LHTIsF4T32HjMS4/fb2uA
 RI8srPmoMilkORavePw/1W50Wtx3ZexQUYu4/KdVJorpowZXOPLu3+MwhhbnWjwi
 zTk3rc5OhUrsVQEq5ei6kGknJLp8ceFNtUYA5dUciWOQWwc7xp8Ik7Q08KBZ2Spa
 uzRsWfwexqDodSt4Hkkgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656605737; x=1656609337; bh=/bsjIZIV7ZsS/9hKhk9NGWhid6QWsXMDPlX
 xbMZl7H0=; b=DyMtMNbDzSwgAtgtXmAS0iXDKrAiM23QyOtldWscmLvvN8LZ/C5
 kx96LIFxcspDS13ugS6BgonpkcftyDdTkGWFX6/6aAcO0ojn+FTZD1toQxmV1gg6
 qzZWYPKCLleTpsAKbElLMCnIEGXfuyFIjdpB7e57UKwhqIBvjFXNhKJHey8j2Shi
 KJDVLUnBHvH6VQUFUrtFoh6Yr80K2lQLrq+yY3N4Vo4YnQTwiSmc2Hah22ij4e0R
 532Xb4l7pkg9GTZSjrBi0/sDYxRCXjhnERArfR61AhG2eiyMgUSNG7FLCsDIj8Za
 jI5cjuhyfvL42q7NDU4rZ05dy2TGlZvZRBg==
X-ME-Sender: <xms:KMy9YgUMpg5ycIMu8_seNouYvn_oAKF62xBy2wSkp1alkYEYISqgtg>
 <xme:KMy9Ykm4ER4XsGIUW97IV_2kJWjfmP1777oFpNSOhaOEhEmsO98r5KpFS3Y38dpUh
 r0mYA23m1KSfZgLI4g>
X-ME-Received: <xmr:KMy9YkZlyeGhEzntp3ktgnobzz41DYbEbi_C3rxt93IAqgsQtemrEyDqkg3JbtaKWx04tV33T53p2b5tLzocntLnmHwR0x4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvdefmdenucfjughrpeffhf
 fvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgvthgvrhcuffgvlhgv
 vhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpeffhffgte
 duveefvdehkeegfefhhfevjeevfedvvedukeetudegteehfeelteetkeenucffohhmrghi
 nhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepmhgvsehpjhgurdguvghv
X-ME-Proxy: <xmx:KMy9YvVuKGmJbJe5zm81A2Xu0AahAsgjoAiGKvNuTra6XU5ZKt0Xyg>
 <xmx:KMy9YqkgBxZzXQ6_ONy27ixaL7XCMszv1Pt5FMFyX7hdFzb4lJjZoQ>
 <xmx:KMy9YkdaE_Mbfnh5TeShadilyA-npFKFh5M-3J28ByWRj4SP5StZOg>
 <xmx:Kcy9Yk4rVEIDgSWIrsPtFtiJgoptdpA-eH7Ldci52zas8AzbHT-HbUIXzHc>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 12:15:35 -0400 (EDT)
Date: Thu, 30 Jun 2022 09:15:33 -0700
From: Peter Delevoryas <me@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Peter Delevoryas <me@pjd.dev>, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, cminyard@mvista.com,
 titusr@google.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 zhdaniel@fb.com
Subject: Re: [PATCH v3 14/14] hw/arm/aspeed: Add oby35-cl machine
Message-ID: <Yr3I8euDuh4PI7O8@pdel-mbp.dhcp.thefacebook.com>
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-15-me@pjd.dev>
 <24f848a7-3b3e-9125-bedd-dedc1460a8f0@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24f848a7-3b3e-9125-bedd-dedc1460a8f0@kaod.org>
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Thu, Jun 30, 2022 at 01:02:54PM +0200, Cédric Le Goater wrote:
> On 6/30/22 06:51, Peter Delevoryas wrote:
> > From: Peter Delevoryas <pdel@fb.com>
> > 
> > The fby35 machine includes 4 server boards, each of which has a "bridge
> > interconnect" (BIC). This chip abstracts the pinout for the server board
> > into a single endpoint that the baseboard management controller (BMC)
> > can talk to using IPMB.
> > 
> > This commit adds a machine for testing the BIC on the server board. It
> > runs OpenBIC (https://github.com/facebook/openbic) and the server board
> > is called CraterLake, so the code name is oby35-cl. There's also a
> > variant of the baseboard that replaces the BMC with a BIC, but that
> > machine is not included here.
> > 
> > A test image can be built from https://github.com/facebook/openbic using
> > the instructions in the README.md to build the meta-facebook/yv35-cl
> > recipe, or retrieved from my Github:
> > 
> >      wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.17.01/Y35BCL.elf
> > 
> > And you can run this machine with the following command:
> > 
> >      qemu-system-arm -machine oby35-cl -nographic -kernel Y35BCL.elf
> > 
> > It should produce output like the following:
> > 
> >      [00:00:00.005,000] <inf> usb_dc_aspeed: select ep[0x81] as IN endpoint
> >      [00:00:00.006,000] <inf> usb_dc_aspeed: select ep[0x82] as IN endpoint
> >      [00:00:00.006,000] <wrn> usb_dc_aspeed: pre-selected ep[0x1] as IN endpoint
> >      [00:00:00.006,000] <wrn> usb_dc_aspeed: pre-selected ep[0x2] as IN endpoint
> >      [00:00:00.006,000] <inf> usb_dc_aspeed: select ep[0x3] as OUT endpoint
> >      *** Booting Zephyr OS build v00.01.05  ***
> >      Hello, welcome to yv35 craterlake 2022.25.1
> >      BIC class type(class-1), 1ou present status(0), 2ou present status(0), board revision(0x1)
> >      check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> >      [init_drive_type] sensor 0x14 post sensor read failed!
> > 
> >      [init_drive_type] sensor 0x30 post sensor read failed!
> >      [init_drive_type] sensor 0x39 post sensor read failed!
> >      ipmi_init
> >      [set_DC_status] gpio number(15) status(0)
> >      [set_post_status] gpio number(1) status(1)
> >      uart:~$ [00:00:01.010,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44
> > 
> >      [00:00:01.016,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
> >      [00:00:01.016,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
> >      [00:00:01.010,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44
> > 
> >      [00:00:01.016,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
> >      [00:00:01.016,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
> >      uart:~$ BIC Ready
> > 
> > Signed-off-by: Peter Delevoryas <pdel@fb.com>
> 
> LGTM.
> 
> That said I would prefer to introduce the machine first and then
> populate with devices.

Ohh ok, I'll submit the machine definition separately all by itself and then
submit any extra devices like the CPLD or ME afterwards.

> 
> May be it is time to introduce a new machine file. This one seems
> like it could go in a f35.c file, also because a larger f35-* is
> in plan. aspeed.c could contain the basic definitions and helpers.

Yes, patrick@stwcx.xyz was thinking the same thing. An f35.c (well,
maybe yv35.c or fby35.c would be more appropriate) would be a good
idea. I'll submit another patch up front to move fby35 stuff to
a separate file.

> 
> > ---
> >   hw/arm/aspeed.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 48 insertions(+)
> > 
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index a06f7c1b62..75971ef2ca 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -1429,6 +1429,50 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
> >       amc->macs_mask = 0;
> >   }
> > +static void oby35_cl_i2c_init(AspeedMachineState *bmc)
> > +{
> > +    AspeedSoCState *soc = &bmc->soc;
> > +    I2CBus *i2c[14];
> > +    I2CBus *ssd[8];
> > +    int i;
> > +
> > +    for (i = 0; i < 14; i++) {
> > +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> > +    }
> > +    get_pca9548_channels(i2c[1], 0x71, ssd);
> 
> We should rename to aspeed_get_pca9548_channels

+1

> 
> > +
> > +    i2c_slave_create_simple(i2c[0], "fby35-sb-cpld", 0x21);
> > +    i2c_slave_create_simple(i2c[1], "tmp105", 0x48);
> > +    i2c_slave_create_simple(i2c[1], "tmp105", 0x49);
> > +    i2c_slave_create_simple(i2c[1], "tmp105", 0x4a);
> > +    i2c_slave_create_simple(i2c[1], "adm1272", 0x40);
> > +    i2c_slave_create_simple(i2c[1], "tmp421", 0x4c);
> > +    i2c_slave_create_simple(i2c[2], "intel-me", 0x16);
> > +    i2c_slave_create_simple(i2c[4], "isl69259", 0x76);
> > +    i2c_slave_create_simple(i2c[4], "isl69259", 0x62);
> > +    i2c_slave_create_simple(i2c[4], "isl69259", 0x60);
> > +
> > +    for (int i = 0; i < 8; i++) {
> > +        i2c_slave_create_simple(ssd[i], "tmp105", 0x6a);
> > +    }
> > +
> > +    /*
> > +     * FIXME: This should actually be the BMC, but both the ME and the BMC
> 
> QEMU has an embedded IPMI BMC simulator.


!!! Didn't realize this, definitely going to try using it.

> 
> > +     * are IPMB endpoints, and the current ME implementation is generic
> > +     * enough to respond normally to some things.
> > +     */
> > +    i2c_slave_create_simple(i2c[6], "intel-me", 0x10);
> > +}
> > +
> > +static void aspeed_machine_oby35_cl_class_init(ObjectClass *oc, void *data)
> > +{
> > +    MachineClass *mc = MACHINE_CLASS(oc);
> > +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> > +
> > +    mc->desc = "Meta Platforms fby35 CraterLake BIC (Cortex-M4)";
> > +    amc->i2c_init = oby35_cl_i2c_init;
> > +}
> > +
> >   static const TypeInfo aspeed_machine_types[] = {
> >       {
> >           .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
> > @@ -1494,6 +1538,10 @@ static const TypeInfo aspeed_machine_types[] = {
> >           .name           = MACHINE_TYPE_NAME("ast1030-evb"),
> >           .parent         = TYPE_ASPEED_MACHINE,
> >           .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
> > +    }, {
> > +        .name          = MACHINE_TYPE_NAME("oby35-cl"),
> > +        .parent        = MACHINE_TYPE_NAME("ast1030-evb"),
> 
> hmm, so we are inheriting from the evb ?

Yeah, I remember this was controversial with fby35-bmc too, maybe I'll
change this in the follow-up. I just like inheriting from the EVB's because
people use the EVB's a lot for testing, most of the time I'm just trying to
add some extra i2c devices/etc, so I override the i2c init. But, maybe it's
good to decouple them.

> 
> C.
> 
> 
> > +        .class_init    = aspeed_machine_oby35_cl_class_init,
> >       }, {
> >           .name          = TYPE_ASPEED_MACHINE,
> >           .parent        = TYPE_MACHINE,
> 

