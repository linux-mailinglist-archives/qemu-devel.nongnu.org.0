Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D73656217D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 19:51:12 +0200 (CEST)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6yJr-0000Sx-2i
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 13:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6yHp-0007dz-S3; Thu, 30 Jun 2022 13:49:05 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:44461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6yHk-0003Gh-M8; Thu, 30 Jun 2022 13:49:05 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 0D2222B059E5;
 Thu, 30 Jun 2022 13:48:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 30 Jun 2022 13:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656611336; x=
 1656614936; bh=cKKTu0A6Bl0VdlGkC7Dh7N4qE0bJPaHu+S9BhepW17I=; b=S
 VVsxN/tjtwvqmU6OSue++zgrW9KlI8oFeRafLkXH3x4XTrLnkp8Te1dN4gF4efo1
 acNsWdNw4tyoIoU0MoRX4II72cftyPW2pczdYRM8Oc7vfP/y8feHe4eWkx3GvwV/
 6jXB1I8laE9oxq+YIKls1LMA+1GHGdmbfl/vYfR84O9SlWonQ0DHD/Ym6c/Mtd9f
 QqfmLIiyR7wsCiCNcs/DBlyTtnDGs/SC9Vb6FKimGro82rwrfM+Dzzr1n19MZJG7
 aL+O19fLe+IAUw1krBidWm4nfbSSXGpjNzQns4sXZgCGji3vkGjpH9Ni2PLgpRyJ
 NgXL0QkC7MmaazzeC3F6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656611336; x=1656614936; bh=cKKTu0A6Bl0VdlGkC7Dh7N4qE0bJPaHu+S9
 BhepW17I=; b=BysqetK9xbaKXmf/o+Xz9W3VC7HsiMyGk7Ih+EK6ElupyvhMKfe
 +sNAIeNJ8rygWzGhzS11rkHpmhchq5qcfvpp/MRj3tQoFRU3zkniKdel6cbK1ZBp
 5OlE5KrV4DfH8EdNXDdniW++R6KTYkrAPfGv6n2OcjsY+Xu/bPEPT1PaIye8pPJ0
 MRVE1cZfJ8a2vTAQIyIkQqFkiiVZmFYHvlokhn0O6Cj0CU6YoqzH6R9QDWkCruoM
 l8iRnZOH8PoTB6orZ1AOjv4tnCAS1955PeTqc34fU4iBdc3zxIreUsRO353oIY1a
 4ivEGQgzCbTyby+VmKCUTxF7AmDPIBse+fQ==
X-ME-Sender: <xms:B-K9YnZb9qiP9aT7uo0gH3LsQxLgNVAsKmBprTb5ehkstXuP1z2sIA>
 <xme:B-K9YmYRzzMg2UAdrob6t6AHQEmcVU1iIO-l8UpRA-zFRh4GFeloEi6mNrHcssPjZ
 hsTg3D_-atA9Vi1IhA>
X-ME-Received: <xmr:B-K9Yp9kNI4EecLTWcgk7zVqLfl2l7gGXloEpwrVKIy0KZFdeQwggS7j_fwh3N8_40YY1O8J5JAtJ8TnYWCHZuLs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddvfedmnecujfgurhepff
 fhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvghtvghrucffvghl
 vghvohhrhigrshcuoehmvgesphhjugdruggvvheqnecuggftrfgrthhtvghrnhepfffhgf
 etudevfedvheekgeefhffhveejveefvdevudektedugeetheefleetteeknecuffhomhgr
 ihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehmvgesphhjugdruggvvh
X-ME-Proxy: <xmx:B-K9YtodLYiZ7ZvIF82eeabTn0u_UDU5e574mM0miYArFuJVnQpG0w>
 <xmx:B-K9YipWQ1HmNpGwgw5GOlflA9gwTRk2KJNnj8i6FyA5KB5oH5ixWA>
 <xmx:B-K9YjQItHSgQ0e1qAB__qr-TCJlBbSINny5_T3kTDL2rB4WYqGXHA>
 <xmx:COK9YiLBV9pWBeiKPgawF7PqYeCzEova4Y_0B6IM1o20r-s3LTIYFYkUOio>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 13:48:54 -0400 (EDT)
Date: Thu, 30 Jun 2022 10:48:52 -0700
From: Peter Delevoryas <me@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com
Subject: Re: [PATCH v3 14/14] hw/arm/aspeed: Add oby35-cl machine
Message-ID: <Yr3iBHxNf0rMeJ5I@pdel-mbp.dhcp.thefacebook.com>
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-15-me@pjd.dev>
 <24f848a7-3b3e-9125-bedd-dedc1460a8f0@kaod.org>
 <Yr3I8euDuh4PI7O8@pdel-mbp.dhcp.thefacebook.com>
 <a11a443d-a97c-3e62-008d-8faa37b55875@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a11a443d-a97c-3e62-008d-8faa37b55875@kaod.org>
Received-SPF: pass client-ip=64.147.123.18; envelope-from=me@pjd.dev;
 helo=wnew4-smtp.messagingengine.com
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

On Thu, Jun 30, 2022 at 06:42:52PM +0200, Cédric Le Goater wrote:
> On 6/30/22 18:15, Peter Delevoryas wrote:
> > On Thu, Jun 30, 2022 at 01:02:54PM +0200, Cédric Le Goater wrote:
> > > On 6/30/22 06:51, Peter Delevoryas wrote:
> > > > From: Peter Delevoryas <pdel@fb.com>
> > > > 
> > > > The fby35 machine includes 4 server boards, each of which has a "bridge
> > > > interconnect" (BIC). This chip abstracts the pinout for the server board
> > > > into a single endpoint that the baseboard management controller (BMC)
> > > > can talk to using IPMB.
> > > > 
> > > > This commit adds a machine for testing the BIC on the server board. It
> > > > runs OpenBIC (https://github.com/facebook/openbic) and the server board
> > > > is called CraterLake, so the code name is oby35-cl. There's also a
> > > > variant of the baseboard that replaces the BMC with a BIC, but that
> > > > machine is not included here.
> > > > 
> > > > A test image can be built from https://github.com/facebook/openbic using
> > > > the instructions in the README.md to build the meta-facebook/yv35-cl
> > > > recipe, or retrieved from my Github:
> > > > 
> > > >       wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.17.01/Y35BCL.elf
> > > > 
> > > > And you can run this machine with the following command:
> > > > 
> > > >       qemu-system-arm -machine oby35-cl -nographic -kernel Y35BCL.elf
> > > > 
> > > > It should produce output like the following:
> > > > 
> > > >       [00:00:00.005,000] <inf> usb_dc_aspeed: select ep[0x81] as IN endpoint
> > > >       [00:00:00.006,000] <inf> usb_dc_aspeed: select ep[0x82] as IN endpoint
> > > >       [00:00:00.006,000] <wrn> usb_dc_aspeed: pre-selected ep[0x1] as IN endpoint
> > > >       [00:00:00.006,000] <wrn> usb_dc_aspeed: pre-selected ep[0x2] as IN endpoint
> > > >       [00:00:00.006,000] <inf> usb_dc_aspeed: select ep[0x3] as OUT endpoint
> > > >       *** Booting Zephyr OS build v00.01.05  ***
> > > >       Hello, welcome to yv35 craterlake 2022.25.1
> > > >       BIC class type(class-1), 1ou present status(0), 2ou present status(0), board revision(0x1)
> > > >       check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
> > > >       [init_drive_type] sensor 0x14 post sensor read failed!
> > > > 
> > > >       [init_drive_type] sensor 0x30 post sensor read failed!
> > > >       [init_drive_type] sensor 0x39 post sensor read failed!
> > > >       ipmi_init
> > > >       [set_DC_status] gpio number(15) status(0)
> > > >       [set_post_status] gpio number(1) status(1)
> > > >       uart:~$ [00:00:01.010,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44
> > > > 
> > > >       [00:00:01.016,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
> > > >       [00:00:01.016,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
> > > >       [00:00:01.010,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44
> > > > 
> > > >       [00:00:01.016,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
> > > >       [00:00:01.016,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
> > > >       uart:~$ BIC Ready
> > > > 
> > > > Signed-off-by: Peter Delevoryas <pdel@fb.com>
> > > 
> > > LGTM.
> > > 
> > > That said I would prefer to introduce the machine first and then
> > > populate with devices.
> > 
> > Ohh ok, I'll submit the machine definition separately all by itself and then
> > submit any extra devices like the CPLD or ME afterwards.
> 
> I have kept the "full system" in my tree for now :
> 
>   cb4481ae1812 aspeed: Add AST2600 (BMC) to fby35  (full system)
>   c155bf27d3e7 aspeed: Make aspeed_board_init_flashes public (trivial)
>   3f5485fa88b9 aspeed: Add fby35 skeleton  (trivial)
> 
> because the ROM vs. execute-in-place is being analyzed. Let's see if
> we can make progress and simplify the initial machine.

Yeah I saw that thread! I'm excited to see where it goes. Thanks for
taking the time to get the performance measurements and spur the
discussion.

> 
> I have also kept the latest *fby35* emulating the BIC only :
> 
>   5cfc4b68fdb8 hw/arm/aspeed: Add oby35-cl machine
>   06f21e024ee7 hw/misc/aspeed: Add intel-me
>   e96a23571599 hw/misc/aspeed: Add fby35-sb-cpld
> 
> to discuss a bit more on the names, files, IPMI, etc. Until now, we had
> Aspeed machines modeling EVBs or BMCs. BICs and multi SoC system are new.

Oh great, ok.

> 
> Having a review on the common models in 8-10 would be nice.

+1

> 
>   2a9be57901a3 hw/sensor: Add Renesas ISL69259 device model
>   85f8352e213a hw/sensor: Add IC_DEVICE_ID to ISL voltage regulators
>   aea568d56db5 hw/i2c/pmbus: Add idle state to return 0xff's
> 
> They should not be too problematic to merge. As soon as Titus has time
> to take a look we will know, and I did a comment. So this can be addressed
> in parallel with the fby35 machines.

Yeah I'm going to resubmit these three separately and cc Titus, and
I'm also going to move the IC_DEVICE_ID to a class property like you
suggested. I'm just wondering if I'll need to add an ISLClass, since
right now it's just a simple type using PMBusDeviceClass, but perhaps
if we switch to a class property it would be acceptable to add the
implementation of the IC_DEVICE_ID read command to the generic pmbus
device implementation, instead of only implementing it for the VR's?
Might need a couple more iterations on that.

> 
> Thanks,
> 
> C.
> 
> 
> 
> > 
> > > 
> > > May be it is time to introduce a new machine file. This one seems
> > > like it could go in a f35.c file, also because a larger f35-* is
> > > in plan. aspeed.c could contain the basic definitions and helpers.
> > 
> > Yes, patrick@stwcx.xyz was thinking the same thing. An f35.c (well,
> > maybe yv35.c or fby35.c would be more appropriate) would be a good
> > idea. I'll submit another patch up front to move fby35 stuff to
> > a separate file.
> > 
> > > 
> > > > ---
> > > >    hw/arm/aspeed.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> > > >    1 file changed, 48 insertions(+)
> > > > 
> > > > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > > > index a06f7c1b62..75971ef2ca 100644
> > > > --- a/hw/arm/aspeed.c
> > > > +++ b/hw/arm/aspeed.c
> > > > @@ -1429,6 +1429,50 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
> > > >        amc->macs_mask = 0;
> > > >    }
> > > > +static void oby35_cl_i2c_init(AspeedMachineState *bmc)
> > > > +{
> > > > +    AspeedSoCState *soc = &bmc->soc;
> > > > +    I2CBus *i2c[14];
> > > > +    I2CBus *ssd[8];
> > > > +    int i;
> > > > +
> > > > +    for (i = 0; i < 14; i++) {
> > > > +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> > > > +    }
> > > > +    get_pca9548_channels(i2c[1], 0x71, ssd);
> > > 
> > > We should rename to aspeed_get_pca9548_channels
> > 
> > +1
> > 
> > > 
> > > > +
> > > > +    i2c_slave_create_simple(i2c[0], "fby35-sb-cpld", 0x21);
> > > > +    i2c_slave_create_simple(i2c[1], "tmp105", 0x48);
> > > > +    i2c_slave_create_simple(i2c[1], "tmp105", 0x49);
> > > > +    i2c_slave_create_simple(i2c[1], "tmp105", 0x4a);
> > > > +    i2c_slave_create_simple(i2c[1], "adm1272", 0x40);
> > > > +    i2c_slave_create_simple(i2c[1], "tmp421", 0x4c);
> > > > +    i2c_slave_create_simple(i2c[2], "intel-me", 0x16);
> > > > +    i2c_slave_create_simple(i2c[4], "isl69259", 0x76);
> > > > +    i2c_slave_create_simple(i2c[4], "isl69259", 0x62);
> > > > +    i2c_slave_create_simple(i2c[4], "isl69259", 0x60);
> > > > +
> > > > +    for (int i = 0; i < 8; i++) {
> > > > +        i2c_slave_create_simple(ssd[i], "tmp105", 0x6a);
> > > > +    }
> > > > +
> > > > +    /*
> > > > +     * FIXME: This should actually be the BMC, but both the ME and the BMC
> > > 
> > > QEMU has an embedded IPMI BMC simulator.
> > 
> > 
> > !!! Didn't realize this, definitely going to try using it.
> > 
> > > 
> > > > +     * are IPMB endpoints, and the current ME implementation is generic
> > > > +     * enough to respond normally to some things.
> > > > +     */
> > > > +    i2c_slave_create_simple(i2c[6], "intel-me", 0x10);
> > > > +}
> > > > +
> > > > +static void aspeed_machine_oby35_cl_class_init(ObjectClass *oc, void *data)
> > > > +{
> > > > +    MachineClass *mc = MACHINE_CLASS(oc);
> > > > +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> > > > +
> > > > +    mc->desc = "Meta Platforms fby35 CraterLake BIC (Cortex-M4)";
> > > > +    amc->i2c_init = oby35_cl_i2c_init;
> > > > +}
> > > > +
> > > >    static const TypeInfo aspeed_machine_types[] = {
> > > >        {
> > > >            .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
> > > > @@ -1494,6 +1538,10 @@ static const TypeInfo aspeed_machine_types[] = {
> > > >            .name           = MACHINE_TYPE_NAME("ast1030-evb"),
> > > >            .parent         = TYPE_ASPEED_MACHINE,
> > > >            .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
> > > > +    }, {
> > > > +        .name          = MACHINE_TYPE_NAME("oby35-cl"),
> > > > +        .parent        = MACHINE_TYPE_NAME("ast1030-evb"),
> > > 
> > > hmm, so we are inheriting from the evb ?
> > 
> > Yeah, I remember this was controversial with fby35-bmc too, maybe I'll
> > change this in the follow-up. I just like inheriting from the EVB's because
> > people use the EVB's a lot for testing, most of the time I'm just trying to
> > add some extra i2c devices/etc, so I override the i2c init. But, maybe it's
> > good to decouple them.
> > 
> > > 
> > > C.
> > > 
> > > 
> > > > +        .class_init    = aspeed_machine_oby35_cl_class_init,
> > > >        }, {
> > > >            .name          = TYPE_ASPEED_MACHINE,
> > > >            .parent        = TYPE_MACHINE,
> > > 
> 

