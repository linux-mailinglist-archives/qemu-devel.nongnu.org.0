Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF25664AC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:02:44 +0200 (CEST)
Received: from localhost ([::1]:45980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dW8-0002sD-1f
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8dSP-0001A0-KR; Tue, 05 Jul 2022 03:58:54 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:43709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8dSJ-0006ZX-7n; Tue, 05 Jul 2022 03:58:53 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 9CD402B05950;
 Tue,  5 Jul 2022 03:58:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 05 Jul 2022 03:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657007924; x=
 1657011524; bh=UPLQcbn7cs+U2CUyLFHeHmGYlAQ7n4zVGDasNdAocMc=; b=S
 fS6mdJTK5iL+ffy977ElWz9Ro7w0eZ6Yn66vgVyfs+L/wsO4u3lJO6KEfHwMDq3M
 LbOMW+AJUPt8bE4ehCn1KswwqKCJE7TMyhilRv/1bp39aOuPMF6qFPh1iciqL7YE
 RrTS6M20ugleDzaEwZ8cYtx+MIWc2bb5nL6n0V/ORGV0uMI/6iOFSW/mnVchz3DO
 +qE7fc/re1iz/C+Qob0I7lVZW4JUHpxo/unNOckRjzYBEe9j4DCils3J+ebnB+0R
 9+ZB/o0gFeIepFPHH2X5z9K76fQ5w1sZUkY4jxHpIFT18QtLhGYytHGPGur0ynO5
 6H+zhJ4Axz3XRRthpRNQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1657007924; x=1657011524; bh=UPLQcbn7cs+U2CUyLFHeHmGYlAQ7n4zVGDa
 sNdAocMc=; b=fOqUSiRIHFDRem6ytbIwMlvzLdFTlo+aj11yR/g2LOE+bNwKMYm
 rEMFTlJo69D+ih8dcVX1bCTS9Atf/8oxjDt1WtcKHSFQDe33AoMwiP4svIjqE0yv
 YWMHmcxMAQX2WG4VG61ayStNN9koxCrlV9eOmFoIlyt16ARHIiXADw/VPi5PzxPe
 gKDP14QB2inFMSvndqS1cO5Imayv4snb0U77GLdcyBsU2c18lnlcGTsjr+OX5SNO
 NrzR/HzrhSgAd0khIrDAiNlhZQ0f7sZF64MgsCmE/H1YPrjX5y6cztBckyboVA30
 +y2H3fr/ZlWPmKY1Ao7fSYlLWY/IN4t1e6w==
X-ME-Sender: <xms:M-_DYqNrGwFqEwtPpAdhSB7uEokghQ8fTJM76j43GtuzwsDJrl9WVA>
 <xme:M-_DYo9im_dE9ceJk6VCK9_qNIfVMuHpwSjz-tETGCBiPhmhMPjQ3cS9BfmJeR-5K
 1nFaztcSqmImmjHbSg>
X-ME-Received: <xmr:M-_DYhTJ6dxXtleOjp7xHdqv5WrXYjBl0zPdmCsvxLxjhxEkw0H0_ToHPflKZjl2sypDyLChgOsc7mTT4_2_RkFfmPBKsYs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitddguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfeltdejhfdvudehgfdutefgfeduhfevffefveehteelteelgfdtvedv
 tdfgveeunecuffhomhgrihhnpehmvghtrgdrtghomhdpohhpvghntghomhhpuhhtvgdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 vghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:M-_DYqsBhhVTF-M7bKSudUJ-KA0yB4mCmj4Of12xkK3t9mbT_gD2rA>
 <xmx:M-_DYiccdp_v0VRahw3FnHdpo2K6u_u88rKzwKkHPmjs3tc4tdJfUA>
 <xmx:M-_DYu2ib0mnE77ithEnInW-ceII-hFS67tgkF3illIlkelpf0TAcg>
 <xmx:M-_DYh4sgnCEcFgCRgaE4l39DX4d1HGXYzkGjsg7Le9pAcRKFLFaj0qMpW0>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 03:58:42 -0400 (EDT)
Date: Tue, 5 Jul 2022 00:58:41 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Joel Stanley <joel@jms.id.au>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH 5/8] aspeed: Add fby35 skeleton
Message-ID: <YsPvMUfG6CzK9LSz@pdel-mbp>
References: <20220704215457.38332-1-peter@pjd.dev>
 <20220704215457.38332-5-peter@pjd.dev>
 <CACPK8XfcZM+9sk4f=fCtW2zVioN0sgoT=o+dF62U=AMZuUsL6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACPK8XfcZM+9sk4f=fCtW2zVioN0sgoT=o+dF62U=AMZuUsL6g@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.26; envelope-from=peter@pjd.dev;
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

On Tue, Jul 05, 2022 at 06:53:43AM +0000, Joel Stanley wrote:
> On Mon, 4 Jul 2022 at 21:55, Peter Delevoryas <peter@pjd.dev> wrote:
> >
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > Reviewed-by: Cédric Le Goater <clg@kaod.org>
> > ---
> >  MAINTAINERS        |  1 +
> >  hw/arm/fby35.c     | 39 +++++++++++++++++++++++++++++++++++++++
> >  hw/arm/meson.build |  3 ++-
> >  3 files changed, 42 insertions(+), 1 deletion(-)
> >  create mode 100644 hw/arm/fby35.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d9378511b7..147330ddd7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1067,6 +1067,7 @@ F: hw/net/ftgmac100.c
> >  F: include/hw/net/ftgmac100.h
> >  F: docs/system/arm/aspeed.rst
> >  F: tests/qtest/*aspeed*
> > +F: hw/arm/fby35.c
> >
> >  NRF51
> >  M: Joel Stanley <joel@jms.id.au>
> > diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
> > new file mode 100644
> > index 0000000000..03b458584c
> > --- /dev/null
> > +++ b/hw/arm/fby35.c
> > @@ -0,0 +1,39 @@
> > +/*
> > + * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
> 
> Can you mention what fby35 means? I keep reading your patches but can't recall.

Oh yeah sure, it means "Facebook Yosemite version 3.5". Facebook has a series
of multi-node compute server designs named Yosemite, the most recent version
was Yosemite 3:

https://www.opencompute.org/documents/ocp-yosemite-v3-platform-design-specification-1v16-pdf

Yosemite 3.5 is an iteration on this design. It's actually very similar in terms
of there being a BMC on the baseboard, and a Bridge IC (BIC) on each server
board, with room for expansion boards as well.

I'm still debugging I2C a little bit, but my goal is to be able to test BMC <->
BIC IPMB messages with the full OpenBMC firmware running on the BMC and the
OpenBIC firmware running on the BIC, and to expand this machine to include the
other 3 slot BIC's (in this patch series, I only included the BIC in the first
slot).

> 
> > + *
> > + * This code is licensed under the GPL version 2 or later. See the COPYING
> > + * file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/boards.h"
> > +
> > +#define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
> > +OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
> > +
> > +struct Fby35State {
> > +    MachineState parent_obj;
> > +};
> > +
> > +static void fby35_init(MachineState *machine)
> > +{
> > +}
> > +
> > +static void fby35_class_init(ObjectClass *oc, void *data)
> > +{
> > +    MachineClass *mc = MACHINE_CLASS(oc);
> > +
> > +    mc->desc = "Meta Platforms fby35";
> > +    mc->init = fby35_init;
> > +}
> > +
> > +static const TypeInfo fby35_types[] = {
> > +    {
> > +        .name = MACHINE_TYPE_NAME("fby35"),
> > +        .parent = TYPE_MACHINE,
> > +        .class_init = fby35_class_init,
> > +        .instance_size = sizeof(Fby35State),
> > +    },
> > +};
> > +
> > +DEFINE_TYPES(fby35_types);
> > diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> > index 2d8381339c..92f9f6e000 100644
> > --- a/hw/arm/meson.build
> > +++ b/hw/arm/meson.build
> > @@ -51,7 +51,8 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
> >    'aspeed_soc.c',
> >    'aspeed.c',
> >    'aspeed_ast2600.c',
> > -  'aspeed_ast10x0.c'))
> > +  'aspeed_ast10x0.c',
> > +  'fby35.c'))
> >  arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
> >  arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
> >  arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
> > --
> > 2.37.0
> >

