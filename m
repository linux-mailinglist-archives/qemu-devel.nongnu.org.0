Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834C7563EDD
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 09:02:59 +0200 (CEST)
Received: from localhost ([::1]:45082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7X9e-0002tp-IB
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 03:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7X8c-000210-4T; Sat, 02 Jul 2022 03:01:54 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7X8a-00078O-7E; Sat, 02 Jul 2022 03:01:53 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 45528580A79;
 Sat,  2 Jul 2022 03:01:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 02 Jul 2022 03:01:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656745311; x=
 1656748911; bh=EgUAuH/1FrtbMicUXrC38CgSTiTOIMs4PY8WyyXoigQ=; b=D
 buVFK1ntSQZ0TpYj2dDvvo+obreTLRkvVN6nsjwwMnaEYW1JLbgqxiQYvWGFK2D1
 o3Jq7endAZD6ri0Ad1gxYcse2aNy0pjBGZUGtg2EyUz8Ku4IbUJpjcASb7ttZ1sf
 vcsWYqrRgBRMZdSS2ACNCSDgCmotSDZgKtfI0pUawGBLt2JXWE11YOHayG0hAc0H
 fZAxxe9MGtAUpTRE5bTzhunC4yxZphUyJ3y7HSXfwzSUNeWavrS0sW99cEC1nnJT
 /HQW/XEvpd/OUY5FRadxoCq41q+XdU7TFV94vdZQJkNEO6hZuGA1A6zjPTjNIL3W
 cQ8Hwtk29PWdt76D+6nfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656745311; x=1656748911; bh=EgUAuH/1FrtbMicUXrC38CgSTiTOIMs4PY8
 WyyXoigQ=; b=WUCDsM4SLOebcGFF80uPB6DAi1/B7IFboQht/PeRSI261S6P8Ei
 2GII3i6+lrX9AqjA7cPeDHk2gemdetc4CospbkbgcXHzFXi5kFA8WNySSVTN4uJz
 gsx/BKnLbiak4AXk/Mk5ZtpYMC7xiHo5NyDe9HeZ+BxUtwIedh5FdNUhQYHEAlCx
 hMHUjFopDCamE9gI+Mr9X4i2ugOnlV9DPfaCL5E/eNwN8JaXhsGC7s2gJ7/JxT8m
 D9PjliR/zmuWP5D9bHiRjDQ2+kBLpkH3ZfAfd3LWy1XNq/R5g0yODkMvigwr9Djp
 GqhnkFnSywbh3ijdafXjuMl8tbitKvJ4cTQ==
X-ME-Sender: <xms:Xu2_YkVnfd-nxD6muU6ejs_rhFqlB-360PZSmfAmZLXz1zCVGYfQXQ>
 <xme:Xu2_YokSvyQRgOQfLwZdlTmr9amKFDPJjykwLU-cMXud9r2lzWwyLfhfhT2sr75IW
 pmZ2xrYBNiQjwkstzk>
X-ME-Received: <xmr:Xu2_YoZSrivQ2_WvixgzKBi4RA7ujUImpwRl5po_G_y0oErHkHNvaxaT3ogqBIu811jdkEBk6LMpxIS8a-uz2EheWfDGUWY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjse
 htkeertddttddunecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvght
 vghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpefhgeffvedufeevteegkeetie
 ejhffhudeujedvgedvheffheejveethffhffefueenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:Xu2_YjXzyMNlR4vzuHud6OQKShKXovwgOD1Aca9sHxJI8tRhIwwX9A>
 <xmx:Xu2_YunvME7nUge6zy8-HvQGS1Iiz2PZhhihnkx6SgZA34fOqxqeeg>
 <xmx:Xu2_YocYFPzukYn26LeDi7iVetuUk2bxMXIQK9NZ5qGUO5m5atLK8Q>
 <xmx:X-2_YlsOQYTUv6XgJxHCzACynLPSBaSU5g9RBm5Yg0gAn6rZAaV5DQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Jul 2022 03:01:49 -0400 (EDT)
Date: Sat, 2 Jul 2022 00:01:48 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Peter Delevoryas <me@pjd.dev>, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] aspeed: Create SRAM name from first CPU index
Message-ID: <Yr/tXIpUhFAU4NDM@pdel-mbp>
References: <20220701180603.38408-1-me@pjd.dev>
 <3b367b09-075e-a21b-8d24-3b2be091f816@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b367b09-075e-a21b-8d24-3b2be091f816@kaod.org>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
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

On Sat, Jul 02, 2022 at 08:01:14AM +0200, Cédric Le Goater wrote:
> On 7/1/22 20:06, Peter Delevoryas wrote:
> > To support multiple SoC's running simultaneously, we need a unique name for
> > each RAM region. DRAM is created by the machine, but SRAM is created by the
> > SoC, since in hardware it is part of the SoC's internals.
> > 
> > We need a way to uniquely identify each SRAM region though, for VM
> > migration. Since each of the SoC's CPU's has an index which identifies it
> > uniquely from other CPU's in the machine, we can use the index of any of the
> > CPU's in the SoC to uniquely identify differentiate the SRAM name from other
> > SoC SRAM's. In this change, I just elected to use the index of the first CPU
> > in each SoC.
> 
> hopefully the index is allocated. Did you check ?

You mean the CpuState.cpu_index? I think it's allocated at this point, I
actually had to do some debugging just to get it working cause I typo'd the
CPU(...) cast at first. I also tried it with the multi-SoC board in your
aspeed-7.1 branch:

(qemu) qom-get /machine/bmc aspeed.sram.0[0]
"/machine/bmc/aspeed.sram.0[0]"
(qemu) qom-get /machine/unattached aspeed.sram.2[0]
"/machine/unattached/aspeed.sram.2[0]"

I think the SRAM in the ast1030 is initialized without a parent object
(memory_region_init_ram(..., NULL, ...)) so that's why it's in the unattached
area. But we could fix that, maybe I should send a v2 with that too?

> 
> 
> > Signed-off-by: Peter Delevoryas <me@pjd.dev>
> > ---
> >   hw/arm/aspeed_ast10x0.c | 5 ++++-
> >   hw/arm/aspeed_ast2600.c | 5 +++--
> >   hw/arm/aspeed_soc.c     | 5 +++--
> >   3 files changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> > index 33ef331771..b6b6f0d053 100644
> > --- a/hw/arm/aspeed_ast10x0.c
> > +++ b/hw/arm/aspeed_ast10x0.c
> > @@ -159,6 +159,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
> >       DeviceState *armv7m;
> >       Error *err = NULL;
> >       int i;
> > +    char name[64];
> >       if (!clock_has_source(s->sysclk)) {
> >           error_setg(errp, "sysclk clock must be wired up by the board code");
> > @@ -183,7 +184,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
> >       sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
> >       /* Internal SRAM */
> > -    memory_region_init_ram(&s->sram, NULL, "aspeed.sram", sc->sram_size, &err);
> > +    snprintf(name, sizeof(name), "aspeed.sram.%d",
> > +             CPU(s->armv7m.cpu)->cpu_index);
> > +    memory_region_init_ram(&s->sram, NULL, name, sc->sram_size, &err);
> >       if (err != NULL) {
> >           error_propagate(errp, err);
> >           return;
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index 3f0611ac11..7efb9f888a 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -276,6 +276,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
> >       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> >       Error *err = NULL;
> >       qemu_irq irq;
> > +    char name[64];
> 
> May be ?
> 
>      g_autofree char *sram_name =
>             g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);

Hmmm yeah sure why not, I can fix the unattached AST1030 SRAM too. I always
wanted to use g_autofree some day hehe.

> 
> 
> Thanks,
> 
> C.
> 
> 
> >       /* IO space */
> >       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> > @@ -335,8 +336,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
> >       }
> >       /* SRAM */
> > -    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
> > -                           sc->sram_size, &err);
> > +    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
> > +    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
> >       if (err) {
> >           error_propagate(errp, err);
> >           return;
> > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > index 0f675e7fcd..1ddba33d2a 100644
> > --- a/hw/arm/aspeed_soc.c
> > +++ b/hw/arm/aspeed_soc.c
> > @@ -239,6 +239,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> >       AspeedSoCState *s = ASPEED_SOC(dev);
> >       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> >       Error *err = NULL;
> > +    char name[64];
> >       /* IO space */
> >       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> > @@ -259,8 +260,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> >       }
> >       /* SRAM */
> > -    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
> > -                           sc->sram_size, &err);
> > +    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
> > +    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
> >       if (err) {
> >           error_propagate(errp, err);
> >           return;
> 

