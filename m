Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E17B5B3481
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 11:54:34 +0200 (CEST)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWaiW-0006ug-Gh
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 05:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oWaV6-0007wS-Jj; Fri, 09 Sep 2022 05:40:40 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:35583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oWaV4-0000sI-HR; Fri, 09 Sep 2022 05:40:40 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4CB865C010F;
 Fri,  9 Sep 2022 05:40:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 09 Sep 2022 05:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1662716435; x=1662802835; bh=/L
 pUnIyUQwtqbVOndloPn52uo/HbpAAGEgm5S1WZ0XY=; b=Mhp4tDTwZ8uqGLhE0B
 2jIowH7BBLUxaVJznhW5hgYdpjCli7pqikL3NJ3XK5ZFzO7ZPMseK/opaQkVRHij
 rCUEZOJW060hLDMsguJNTIHgvH6XUxcAbZZ6nUbUDMlCnyeVvgVN/q6cd696IS+8
 Dm+FwO1pvoBCNorvIsaduYrCACyjpZ2O8HIEvpNMSU7zkon1Aev+Vie0s6MWFwNa
 gvAVCVTNEwRXpzibUNQZ7JzHWBBGsdoN+I9W1dZcXc6rcE9x7WHlqWbw5r4H1gq0
 9SrEohHvLiaRqHcxmy0DaAA0S0DnM3qwMEbhRPp9y/JAH3jWneSN1jeB3sSDcsAn
 8T0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662716435; x=1662802835; bh=/LpUnIyUQwtqbVOndloPn52uo/Hb
 pAAGEgm5S1WZ0XY=; b=Q/spCBsxDNDq1QafeLnZESjzgQIfCgZBuHFlWLMvOa5X
 x1xKV4h3SMPbVZAZ5S9GCj+IxjjrKb9/1+2zKgFJ5STfBz+VZogsOmlz5tRmj+oB
 yDbVUsWuNIEk/Y13R1JH3deL6T9R0IIdmXf5jm0wNqBY1DPANS2D1HnRCnpaXX93
 gZYYlIISChnw62Am6qMUJSpRTBLjD8j8bQUtsCmMWbyFRCWZlAvMsmaPPtBssc/f
 Ika8kVDOT7UZHLAOhamMcg+tve0oMH3PM096k0uNMNYfjouMWFofF2AKKGT44IL3
 F+neHRKxnWTIXBwI+kSHIFs6eVCyguQiaqG/L249vg==
X-ME-Sender: <xms:EgobY2cUGOnaxJw2CrNOLBB_ZOW4CUPfS6C-z3aS8a1BAJWkWgd7Xw>
 <xme:EgobYwNWf0p1knefP_-qyYVhNUBtU3B-SYPT6-ahZkUG-QqAMHPAKXvtPWvGZteIR
 aLSz2H0t9Fdqk-dm6M>
X-ME-Received: <xmr:EgobY3ipovt6p3L2IUUt6prugUChHvnvkv7JlAAHpAxrnH-Evj-KMkiNYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepvefhheeuveegkeekueefteejhfelhfetgeeigeehudelhfeuffetuddvheeh
 udejnecuffhomhgrihhnpehnvhhmvgigphhrvghsshdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghn
 thdrughk
X-ME-Proxy: <xmx:EgobYz9kB9jPOLd6E6L31JEsHmL9bhCkLZdjmTwFCNN6WWoRBuSTTg>
 <xmx:EgobYysNjuecjZyqtrAOVcVcmJypfBb6nBUFzsh4YuBD6WayWczWGg>
 <xmx:EgobY6HZ2iUmgVs6D2Gen4cGOoNxnROsvUYxyXv369EkgVmHkdD56w>
 <xmx:EwobY2JyTif2qkKp7TV_DRnkoj8Nb5Wx2kVTsjJOh5YcN2GEAoK_yg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 05:40:33 -0400 (EDT)
Date: Fri, 9 Sep 2022 11:40:31 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: kbusch@kernel.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/nvme: remove param zoned.auto_transition
Message-ID: <YxsKD7SJNd0aiJXi@apples>
References: <20220812110137.1011659-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L2YVUQ4Cf1eHUwd8"
Content-Disposition: inline
In-Reply-To: <20220812110137.1011659-1-niklas.cassel@wdc.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
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


--L2YVUQ4Cf1eHUwd8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 12 13:01, Niklas Cassel wrote:
> The intention of the Zoned Namespace Command Set Specification was
> never to make an automatic zone transition optional.
>=20
> Excerpt from the nvmexpress.org zns mailing list:
> """
> A question came up internally on the differences between ZNS and ZAC/ZBC
> that asked about when a controller should transitions a specific zone in
> the Implicitly Opened state to Closed state.
>=20
> For example, consider a ZNS SSD that supports a max of 20 active zones,
> and a max of 10 open zones, which has the following actions occur:
>=20
> First, the host writes to ten empty zones, thereby transitioning 10 zones
> to the Implicitly Opened state.
>=20
> Second, the host issues a write to an 11th empty zone.
>=20
> Given that state, my understanding of the second part is that the ZNS SSD
> chooses one of the previously 10 zones, and transition the chosen zone to
> the Closed state, and then proceeds to write to the new zone which also
> implicitly transition it from the Empty state to the Impl. Open state.
> After this, there would be 11 active zones in total, 10 in impl. Open
> state, and one in closed state.
>=20
> The above assumes that a ZNS SSD will always transition an implicitly
> opened zone to closed state when required to free up resources when
> another zone is opened. However, it isn=E2=80=99t strictly said in the ZN=
S spec.
>=20
> The paragraph that should cover it is defined in section
> 2.1.1.4.1 =E2=80=93 Managing Resources:
> The controller may transition zones in the ZSIO:Implicitly Opened state
> to the ZSC:Closed state for resource management purposes.
>=20
> However, it doesn=E2=80=99t say =E2=80=9Cwhen=E2=80=9D it should occur. T=
hus, as the text stand,
> it could be misinterpreted that the controller shouldn=E2=80=99t do close=
 a zone
> to make room for a new zone. The issue with this, is that it makes the
> point of having implicitly managed zones moot.
>=20
> The ZAC/ZBC specs is more specific and clarifies when a zone should be
> closed. I think it would be natural to the same here.
> """
>=20
> While the Zoned Namespace Command Set Specification hasn't received an
> errata yet, it is quite clear that the intention was that an automatic
> zone transition was never supposed to be optional, as then the whole
> point of having implictly open zones would be pointless. Therefore,
> remove the param zoned.auto_transition, as this was never supposed to
> be controller implementation specific.
>=20
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  hw/nvme/ctrl.c | 35 ++++++++++++-----------------------
>  hw/nvme/nvme.h |  1 -
>  2 files changed, 12 insertions(+), 24 deletions(-)
>=20

No quarrel from me, but we need to deprecate the parameter first.

However, I agree that it is a misinterpretation of the spec, so I'm ok
with removing the code using the parameter so it doesnt do anything.

Please do that, but retain the parameter and add it in
docs/about/deprecated.rst and remove the documentation related to the
option.

--L2YVUQ4Cf1eHUwd8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMbCg4ACgkQTeGvMW1P
DensFQgAv2vjwdQIoGDx3VG2IQ5dhdMtND3eUrgzQInOATBRPt1anr4mAnWwSXS/
ckHunim+ZQTIGedBHWZ+EHyxkzr5eHP0HFSSuPuWpsR9mQlGeyo8E7mPG9yXp8hB
St3pdyF4xocSn8ZBXSTY9qCFrafQqm7VZpBs8P/dC5Z0slEEfmD64pce67mw7sRF
6tv09d2rjqdKWhgmpb64LwTBZgfKH1pBokHbjYpTEpvyUn1RebxQ4suAMKZVWkdl
q2T45ZO3/DasQqBOXv2dI1RSCripPZOWNXz2TCIUVaXtYu8tC2638yKfSij6wlYB
oUFSe0jH/sHonVCILgyIHI0MwgxW+w==
=tfgE
-----END PGP SIGNATURE-----

--L2YVUQ4Cf1eHUwd8--

