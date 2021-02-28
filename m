Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A0E327516
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:11:11 +0100 (CET)
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVDS-00025S-Jo
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGVBa-0001WF-Rg; Sun, 28 Feb 2021 18:09:14 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGVBZ-0001Xe-Ep; Sun, 28 Feb 2021 18:09:14 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9CEBE5C008C;
 Sun, 28 Feb 2021 18:09:12 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 28 Feb 2021 18:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=cFrEa
 XkFX/pufSG94aC9/XAc2CtR0GwlPR8jI683L88=; b=tVILj8rn0TpldbKjLbFRB
 JaqSmb9h4Yt1/SEkrDBBieEyEKaWfhc/uBj++LvFTuzN1TlkbuHO4SllgRe/3+0a
 GOENkVBYLy9lnV1nAEamBtcZJxxnBKVVmRra/XBK9JEHeAlQMrNYL3o/cn8Y8nQn
 riNMawVw1MYw4MjTRezfrWLWu1Wt2BA/u6ikRIvyX9Zt+Dqa+tp2D8mFgmFGBMdF
 P0+ESeS/Yj5TDbNY3/iTyuSzo0O3qrLxkVa2ag+JWivXz+Wl54J2kRT8HR5kX5cp
 AYJgnQggrDv+Nsjzwm+IGDDCgLcPFE20jKRY+OnNzuivO2ogZqHV2cjxnW6ep6we
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=cFrEaXkFX/pufSG94aC9/XAc2CtR0GwlPR8jI683L
 88=; b=RGBEnMbFOlh5S0ytCxVC9xhdF9EyrN5TQ2nj5UdKYENsY1LWB5YNUsM1x
 wEEcuhGOnPEulu9G1FZLL1MP/EOSn6/IkrCextSarNYSAwJe5mnmBlacCX1Tv656
 /nDWLMAOxn6wlwCi9RlS1KLWg8AF5T5ch81aylmfELXXeUgxV1/Qa93gOA/VNmMF
 w2vcNMPCnrKVXunzXX4Ui3X2xBzhh4ejSO6nhawHFfLnSS5LLmk5WV42HpxW/EYx
 hwp6Av7HgHdrvLAdSJzLbvhSc/oRLWdr9vSclcNpYGIyj21iRH2ORL/uOTxX7zx8
 O4JEP80freLVXpPD1izNni+oO/H8Q==
X-ME-Sender: <xms:lyI8YP8zeYbpbflAkGIHdsdfBRwJCyoVaa8Vk8Qf67JfI4OThLiw3w>
 <xme:lyI8YLtZXH8mky4wWLsFWORcpMwfCA4PU1CiXcPZd-1Bltc_mGDzpksfQzHfefOxX
 UIDRaUhyyUUj9FuAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleejgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:lyI8YNCOtAyFXPIeRi1M5xUgvT5bEp40gzFNfvEs27-EC8q_qRYNBA>
 <xmx:lyI8YLca0-0NNdyvTmLi31uf5Tjcf8xDGqTsee2D7ff5uRVqPIyBww>
 <xmx:lyI8YEOO2nsyJsXb5Ql6DixnV9f416jWMPDGZa3cN6cUMrBov0vyeg>
 <xmx:mCI8YD0-vOTMNSJ3If6FDfGS4W59C_CtX2F6qQDsDaUWprOHK1eFhw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A2019A00064; Sun, 28 Feb 2021 18:09:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <af0b09f9-daff-463e-a887-387ff6d9a132@www.fastmail.com>
In-Reply-To: <c74d23df-d90b-93e8-fe40-7de905b5af3e@amsat.org>
References: <20210226065758.547824-1-andrew@aj.id.au>
 <20210226065758.547824-3-andrew@aj.id.au>
 <c74d23df-d90b-93e8-fe40-7de905b5af3e@amsat.org>
Date: Mon, 01 Mar 2021 09:38:50 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 2/4] arm: ast2600: Fix iBT IRQ ID
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Corey Minyard <minyard@acm.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 26 Feb 2021, at 19:28, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/26/21 7:57 AM, Andrew Jeffery wrote:
> > The AST2600 allocates individual GIC IRQ lines for the LPC sub-devic=
es.
> > This is a contrast to the AST2400 and AST2500 which use one shared V=
IC
> > IRQ line for the LPC sub-devices. Switch the iBT device to use the
> > GIC IRQ ID documented in the datasheet.
>=20
> [*]
>=20
> >=20
> > While we're here, set the number of IRQs to the allocated number of =
IRQs
> > in the datasheet.
>=20
> Please do one change per patch. This would be the first change,
> and [*] is the second.

Given that I had to change the current value to support the iBT device=20=

I figured it would be fine in the same patch, but sure, I can split=20
this out in v2.

Andrew

