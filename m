Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD8956410D
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 17:33:02 +0200 (CEST)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7f7E-0006Nj-PY
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 11:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7f40-0005NF-O9; Sat, 02 Jul 2022 11:29:40 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:50127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7f3x-0002ye-P0; Sat, 02 Jul 2022 11:29:40 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 2ABBB2B04FE0;
 Sat,  2 Jul 2022 11:29:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 02 Jul 2022 11:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656775773; x=
 1656779373; bh=3lDSBZe4poQh9KI0Eg9ZCmYIvOyzCGhlO1EMCxDLx1A=; b=U
 1Kzen11Qh9lQLybD6s1BBBUmPv2L8FxIA0+CgGmFrjPAvQo5hsqb5AFWf56YiLsY
 vCAxjlWajVVXxrQ+aH+fAtVpVKj43aKUrP89nW95icM4abx9GQwQyMgRoKuRBwLd
 hiNvTSw68YO8C/5xiXSosvMx5ohXMWHeh9q+EysZont38UBMVdyBQ2F6vzpMZgu0
 2jaKxV8GnypqybGuQeKzhgUKMPLnaSTAyRBNMPJoLFWUHKZsmUn6v0sUecvwOffh
 A7LY4dghvhM5aMpnKHtbqunSpkToTV/2Q5Z3wzSS8n3k0eg86DTizce6t3uyzH3G
 xNtt40OK4vcqMCX+9WmxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656775773; x=1656779373; bh=3lDSBZe4poQh9KI0Eg9ZCmYIvOyzCGhlO1E
 MCxDLx1A=; b=xmteyvkbs+GsaWqDL24Xd/VOk0lqGKpVPXglNJ5Sv6t+tKG4Ew1
 L+aVlp0Bfr53IOWnvcfMzwtidTUOqcDSwqDDsmG7lib806f8NXXHuhjliz3lhaVG
 M+UBigpbJEsYzimrKojmoAbLcJBf/rNDGWB6akKD/Zwu3xnKmpSjW2Mh3D0h4dzn
 8I9xRCL4S5UMfkFQEGduSCqTcuxxllUWXFXgWQ2b5YSfotj9+Qc4BcnU5vCXYRi2
 Ko1+QpChD3TNxyBbuPDZMO2zH19IUHwakGQAqauOg1VEgJ4AvU7bzqPyLBCA9PwS
 mY0IO0CnMU94hE49eZuRmA30pNOHRJTd3fA==
X-ME-Sender: <xms:XWTAYhLuQQIVEr1qKhEBVtyojcjKXdiOSI0kI6XIq9RWnH_RcjUqZQ>
 <xme:XWTAYtKlhI4FXk7nA0TCwCWY-yqTOOGpWV4WtlDFtOvB6Fmoos6veHF03El6MzI5I
 LEoCSyGygTEvQDA8vQ>
X-ME-Received: <xmr:XWTAYpuebcwgom6QRbeoAVn3jRZ9E7UJrY9HzmC0dII-LJjLJkLuc11E5WkStdDwMr0yJbDeUYjqh3OTiIgYXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehhedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjgesth
 ekredttddtudenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgv
 rhesphhjugdruggvvheqnecuggftrfgrthhtvghrnhephfegffevudefveetgeekteeije
 fhhfduueejvdegvdehffehjeevtefhhffffeeunecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:XWTAYiY282w9FGY_YNFDP3d1roO1OtIsBcHnxm0yaSuP965enXx0yQ>
 <xmx:XWTAYob2fwGeM_iF-aJ6o4C74iZtakAPAbRzwe3brVsjlV_kws2p1w>
 <xmx:XWTAYmD3ZpO4UlP_OTx8hyBXIJBjwj90bJps_is_QSlMeOMo6lb1cQ>
 <xmx:XWTAYnyuc5iC5J9tFKIj0yCIqa27Sf_aHO97UQlOetYcoIs2NPRhBD6QPRk>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Jul 2022 11:29:32 -0400 (EDT)
Date: Sat, 2 Jul 2022 08:29:30 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Peter Delevoryas <me@pjd.dev>, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] aspeed: Create SRAM name from first CPU index
Message-ID: <YsBkWoTO1rW4UXjw@pdel-mbp.dhcp.thefacebook.com>
References: <20220701180603.38408-1-me@pjd.dev>
 <3b367b09-075e-a21b-8d24-3b2be091f816@kaod.org>
 <Yr/tXIpUhFAU4NDM@pdel-mbp> <Yr/1jrZIwXSc+acd@pdel-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yr/1jrZIwXSc+acd@pdel-mbp>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=peter@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
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

On Sat, Jul 02, 2022 at 12:36:46AM -0700, Peter Delevoryas wrote:
> On Sat, Jul 02, 2022 at 12:01:48AM -0700, Peter Delevoryas wrote:
> > On Sat, Jul 02, 2022 at 08:01:14AM +0200, Cédric Le Goater wrote:
> > > On 7/1/22 20:06, Peter Delevoryas wrote:
> > > > To support multiple SoC's running simultaneously, we need a unique name for
> > > > each RAM region. DRAM is created by the machine, but SRAM is created by the
> > > > SoC, since in hardware it is part of the SoC's internals.
> > > > 
> > > > We need a way to uniquely identify each SRAM region though, for VM
> > > > migration. Since each of the SoC's CPU's has an index which identifies it
> > > > uniquely from other CPU's in the machine, we can use the index of any of the
> > > > CPU's in the SoC to uniquely identify differentiate the SRAM name from other
> > > > SoC SRAM's. In this change, I just elected to use the index of the first CPU
> > > > in each SoC.
> > > 
> > > hopefully the index is allocated. Did you check ?
> > 
> > You mean the CpuState.cpu_index? I think it's allocated at this point, I
> > actually had to do some debugging just to get it working cause I typo'd the
> > CPU(...) cast at first. I also tried it with the multi-SoC board in your
> > aspeed-7.1 branch:
> > 
> > (qemu) qom-get /machine/bmc aspeed.sram.0[0]
> > "/machine/bmc/aspeed.sram.0[0]"
> > (qemu) qom-get /machine/unattached aspeed.sram.2[0]
> > "/machine/unattached/aspeed.sram.2[0]"
> > 
> > I think the SRAM in the ast1030 is initialized without a parent object
> > (memory_region_init_ram(..., NULL, ...)) so that's why it's in the unattached
> > area. But we could fix that, maybe I should send a v2 with that too?
> > 
> > > 
> > > 
> > > > Signed-off-by: Peter Delevoryas <me@pjd.dev>
> > > > ---
> > > >   hw/arm/aspeed_ast10x0.c | 5 ++++-
> > > >   hw/arm/aspeed_ast2600.c | 5 +++--
> > > >   hw/arm/aspeed_soc.c     | 5 +++--
> > > >   3 files changed, 10 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> > > > index 33ef331771..b6b6f0d053 100644
> > > > --- a/hw/arm/aspeed_ast10x0.c
> > > > +++ b/hw/arm/aspeed_ast10x0.c
> > > > @@ -159,6 +159,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
> > > >       DeviceState *armv7m;
> > > >       Error *err = NULL;
> > > >       int i;
> > > > +    char name[64];
> > > >       if (!clock_has_source(s->sysclk)) {
> > > >           error_setg(errp, "sysclk clock must be wired up by the board code");
> > > > @@ -183,7 +184,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
> > > >       sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
> > > >       /* Internal SRAM */
> > > > -    memory_region_init_ram(&s->sram, NULL, "aspeed.sram", sc->sram_size, &err);
> > > > +    snprintf(name, sizeof(name), "aspeed.sram.%d",
> > > > +             CPU(s->armv7m.cpu)->cpu_index);
> > > > +    memory_region_init_ram(&s->sram, NULL, name, sc->sram_size, &err);
> > > >       if (err != NULL) {
> > > >           error_propagate(errp, err);
> > > >           return;
> > > > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > > > index 3f0611ac11..7efb9f888a 100644
> > > > --- a/hw/arm/aspeed_ast2600.c
> > > > +++ b/hw/arm/aspeed_ast2600.c
> > > > @@ -276,6 +276,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
> > > >       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> > > >       Error *err = NULL;
> > > >       qemu_irq irq;
> > > > +    char name[64];
> > > 
> > > May be ?
> > > 
> > >      g_autofree char *sram_name =
> > >             g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
> > 
> > Hmmm yeah sure why not, I can fix the unattached AST1030 SRAM too. I always
> > wanted to use g_autofree some day hehe.
> 
> Actually, can't do this: cpu_index is _not_ initialized at this point (the start
> of the function). armv7m needs to be realized first in the ast1030, cpu[]'s need
> to be realized in other SoC's. I don't think it would be preferable to move the
> autofree statement lower because the convention is to put declarations at the
> start of the enclosing block, let me know if you have another idea though.

Disregard this comment I made, we can use autofree here, we should just
initialize the pointer later in the function. I was curious if
__attribute__((cleanup)) handles this properly, and it does, based on the macOS
"leaks" leak detector:

Without g_autofree:

    $ leaks --atExit --  ./build/qemu-system-arm -machine fby35 -drive file=fby35.mtd,format=raw,if=mtd -device loader,file=Y35B
    CL.elf,addr=0,cpu-num=2 -serial pty -serial pty -serial mon:stdio -display none -S
    char device redirected to /dev/ttys007 (label serial0)
    char device redirected to /dev/ttys009 (label serial1)
    qemu-system-arm: warning: Aspeed iBT has no chardev backend
    QEMU 7.0.50 monitor - type 'help' for more information
    (qemu) q
    Process:         qemu-system-arm [64263]
    Path:            /Users/USER/*/qemu-system-arm
    Load Address:    0x10f181000
    Identifier:      qemu-system-arm
    Version:         ???
    Code Type:       X86-64
    Platform:        macOS
    Parent Process:  leaks [64262]

    Date/Time:       2022-07-02 08:22:43.852 -0700
    Launch Time:     2022-07-02 08:22:42.125 -0700
    OS Version:      macOS 12.4 (21F79)
    Report Version:  7
    Analysis Tool:   /usr/bin/leaks

    Physical footprint:         443.5M
    Physical footprint (peak):  546.2M
    ----

    leaks Report Version: 4.0
    Process 64263: 62375 nodes malloced for 300124 KB
    Process 64263: 1 leak for 128 total leaked bytes.

        1 (128 bytes) ROOT LEAK: 0x600003b8ea00 [128]  length: 13  "aspeed.sram.2"

With g_autofree:

    $ leaks --atExit --  ./build/qemu-system-arm -machine fby35 -drive file=fby35.mtd,format=raw,if=mtd -device loader,file=Y35BCL.elf,addr=0,cpu-num=2 -serial pty -serial pty -serial mon:stdio -display none -S
    char device redirected to /dev/ttys007 (label serial0)
    char device redirected to /dev/ttys009 (label serial1)
    qemu-system-arm: warning: Aspeed iBT has no chardev backend
    QEMU 7.0.50 monitor - type 'help' for more information
    (qemu) q
    Process:         qemu-system-arm [65015]
    Path:            /Users/USER/*/qemu-system-arm
    Load Address:    0x10edf7000
    Identifier:      qemu-system-arm
    Version:         ???
    Code Type:       X86-64
    Platform:        macOS
    Parent Process:  leaks [65014]

    Date/Time:       2022-07-02 08:23:13.748 -0700
    Launch Time:     2022-07-02 08:23:12.285 -0700
    OS Version:      macOS 12.4 (21F79)
    Report Version:  7
    Analysis Tool:   /usr/bin/leaks

    Physical footprint:         438.6M
    Physical footprint (peak):  547.0M
    ----

    leaks Report Version: 4.0
    Process 65015: 62154 nodes malloced for 299904 KB
    Process 65015: 0 leaks for 0 total leaked bytes.

So I'll send a v2 using g_autofree and g_strdup_printf.

> 
> > 
> > > 
> > > 
> > > Thanks,
> > > 
> > > C.
> > > 
> > > 
> > > >       /* IO space */
> > > >       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> > > > @@ -335,8 +336,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
> > > >       }
> > > >       /* SRAM */
> > > > -    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
> > > > -                           sc->sram_size, &err);
> > > > +    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
> > > > +    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
> > > >       if (err) {
> > > >           error_propagate(errp, err);
> > > >           return;
> > > > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > > > index 0f675e7fcd..1ddba33d2a 100644
> > > > --- a/hw/arm/aspeed_soc.c
> > > > +++ b/hw/arm/aspeed_soc.c
> > > > @@ -239,6 +239,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> > > >       AspeedSoCState *s = ASPEED_SOC(dev);
> > > >       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> > > >       Error *err = NULL;
> > > > +    char name[64];
> > > >       /* IO space */
> > > >       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> > > > @@ -259,8 +260,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> > > >       }
> > > >       /* SRAM */
> > > > -    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
> > > > -                           sc->sram_size, &err);
> > > > +    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
> > > > +    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
> > > >       if (err) {
> > > >           error_propagate(errp, err);
> > > >           return;
> > > 

