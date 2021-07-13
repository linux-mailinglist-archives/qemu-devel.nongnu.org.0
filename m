Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BB63C68A2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 04:42:44 +0200 (CEST)
Received: from localhost ([::1]:38504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m38Ne-00060V-QH
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 22:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m38Mh-00059J-9K; Mon, 12 Jul 2021 22:41:43 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m38Mf-0000tF-Cq; Mon, 12 Jul 2021 22:41:43 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id BED1832008FC;
 Mon, 12 Jul 2021 22:41:35 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 12 Jul 2021 22:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=GmPmL
 uzZOb8exTg9V/MMokFTNadVtf4wSAUb2Wfg1Zk=; b=UA2svfpbvltXG4l1bg+0h
 zK9IS6tz+Mf11+DNXQkutGtIvU3Yysi3xJfdkkHzlcpyKv9oMHrWw2/1HtZ/cfY6
 rRFa0zWdf3Im27ylrL+6CPVcYturge491Tr0CNQ1lT2wgwy6KfyEKzP4RK+mLQPF
 1NOW/R5dwbqy6tw821Yo0m2F3uSKaFzC17SfOZnPu6rLNAfJMKIbo7gR3dKC9K6Z
 oVxLpJEwa2TkP28q9AaTqVQ19NCHsgUBCx1BgO1d0EH2OAzYPQ8jO2dKQPx1AlRS
 Vsrj/9nvFiEZjeB5hzFPIMBU8cgg7AgVikvIB2s9fK4wb/J9igS4cMFmk9xPY22A
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=GmPmLuzZOb8exTg9V/MMokFTNadVtf4wSAUb2Wfg1
 Zk=; b=QH/bL3ZOWsGsx+14NxirwQKGIrQLf+LiU4wICXEKI04zdTvUFGZBynxJT
 pSwiwFPNFnwaUIFM//CiSunDKEvWQZiJylUi8U16pX94L1MDQs5h3+R0A/JIezdJ
 fk2XOUTgcRp/+RQYofyQuxooBJbQ0lh37C+UrusW2fAQsafM3IdaU3Xn0Cx1YNx9
 wi2ktxCLYrX7Y8vQL50j+iw76vX0FR9o/9yt22qzEaIH3MpC1YGGa2/Xuzc6RoXr
 LdTCjikAyFMud3IEzzim/BYTyMhWMSdRMCle7dqlayMG6GQc1tAG23bUOyguRfDZ
 CkVkbWHguJw++gTzaXZWgk9xaRPZA==
X-ME-Sender: <xms:Xv3sYN_o1vpUFH8aorAmFFFZFeTGIAwHXmL4ETIHHVxKUYbdFy4mpw>
 <xme:Xv3sYBudQzr24VEmEBdnH2l4LAJnLySdtN6G1YER3n8hxfp3iaU8l_hkAx8aShraN
 PPr1Bii33SZj7lvnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeggdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Xv3sYLB-NMSYq_0rk2o8TUo5M1Lda_tIvwRi1bzWyt4qpsUm163PzA>
 <xmx:Xv3sYBd9T2NbWB9hlSIZCau2pPG7Tx7wz57U_-nQO4rOp9qQYkkeEA>
 <xmx:Xv3sYCOxsjJnYg1aU1tofn7u2HV04kBrzwzvSDiWb83kF58yq9gk_w>
 <xmx:X_3sYPqN41JuRddXY2FtZhRn4Jz9NykwMVyovcLNYjCBkDUhnfvnVQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 274ACAC0081; Mon, 12 Jul 2021 22:41:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-533-gf73e617b8a-fm-20210712.002-gf73e617b
Mime-Version: 1.0
Message-Id: <b43af989-f4b9-4227-a84c-e0026a0f90bc@www.fastmail.com>
In-Reply-To: <d222c518-13de-f4c5-3eb6-2045d7a26fba@amsat.org>
References: <20210709053107.1829304-1-andrew@aj.id.au>
 <20210709053107.1829304-3-andrew@aj.id.au>
 <d222c518-13de-f4c5-3eb6-2045d7a26fba@amsat.org>
Date: Tue, 13 Jul 2021 12:11:13 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Cameron Esfahani via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 2/2] watchdog: aspeed: Fix sequential control writes
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.21; envelope-from=andrew@aj.id.au;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 9 Jul 2021, at 16:59, Philippe Mathieu-Daud=C3=A9 wrote:
> On 7/9/21 7:31 AM, Andrew Jeffery wrote:
> > The logic in the handling for the control register required toggling=
 the
> > enable state for writes to stick. Rework the condition chain to allo=
w
> > sequential writes that do not update the enable state.
> >=20
> > Fixes: 854123bf8d4b ("wdt: Add Aspeed watchdog device model")
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  hw/watchdog/wdt_aspeed.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> > index faa3d35fdf21..69c37af9a6e9 100644
> > --- a/hw/watchdog/wdt_aspeed.c
> > +++ b/hw/watchdog/wdt_aspeed.c
> > @@ -166,6 +166,8 @@ static void aspeed_wdt_write(void *opaque, hwadd=
r offset, uint64_t data,
> >          } else if (!enable && aspeed_wdt_is_enabled(s)) {
> >              s->regs[WDT_CTRL] =3D data;
> >              timer_del(s->timer);
> > +        } else {
> > +            s->regs[WDT_CTRL] =3D data;
>=20
> What about simplifying by moving here:
>=20
>                if (!enable && aspeed_wdt_is_enabled(s)) {
>                    timer_del(s->timer);
>                }
>=20

I don't think that works, as aspeed_wdt_is_enabled() tests the value of=20=

s->regs[WDT_CTRL]. If you set it before you test then you end up in the=20=

wrong state.

Andrew

