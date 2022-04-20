Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2081D50859D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:16:25 +0200 (CEST)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7Nn-0008KS-QR
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh7Kl-0006xK-OK; Wed, 20 Apr 2022 06:13:15 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:41935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh7Ki-0003ZO-9u; Wed, 20 Apr 2022 06:13:13 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A0CE33202049;
 Wed, 20 Apr 2022 06:13:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 20 Apr 2022 06:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650449588; x=1650535988; bh=rW
 i1duUorcI8bRMjqgP6o8e1d+Vt+zM/Vh+Hiv3D0To=; b=F9OmnBzQ6LEtLODeRE
 R4D8yyf6gezViiGxHqePmg5vT6uv6j6Z0RcDsixFNiF4qxuRdXnix73dG4tAa39B
 a++oozQRqWCudybqJMIi9bzhFA7Yuw7O0jzKufrz7Ipf4N3ENYLmB4UQJSUjZWfb
 Vv82vPJvg4aBM9oRBu291Nn3FI5SNXox+Rb1l1rxqtL6smz3xUZ67vU3CZMuV9kh
 /dSCfv+XIc7mGZ7j4ri6dkhw6po6EtfxBR90Q+CSFLiorCOWSDb2reuBw4bYG8bM
 4+ff0M28etdb3NsZoaDQ0ZAA7QHE/UNADxupUOdtPDoXJn47PRykSJneZxSK9YFB
 oYLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650449588; x=
 1650535988; bh=rWi1duUorcI8bRMjqgP6o8e1d+Vt+zM/Vh+Hiv3D0To=; b=v
 q9axzH/OFGA5//7TBnudwJnxA/xEYGLk/MVRabWLogs/ghyf9Wpez/Kyq91s4kol
 PxIsIw8Q1pewQsDwye+aUx7djvJ6vOgXGpvtYdQiaSlSMHBkNA2Wl6ZIpEzOL/Jj
 UazvmfdgwARI0syPJ7ar3bQ8HmU/xl+xUUvcgNlR1WnVMkfixvue8TB9ospnXw4j
 NIdXUwIkJJm9G1CDq6+9FwKDKm2ENh1RoX2gdj0hbQs2u5pafpVS1PH/8U5miv51
 +RyyB8GVULJhx3QAVV5UlcvfDbYsjPrgxS+DdVHVsdb5vXDgmRV7ouboxYtAjJUA
 ODEaOChu3MiE0d0YXXcdw==
X-ME-Sender: <xms:s9xfYvtnltIHXe-uxYdjoZJjvDoyKZ4r837ZJu7kBURUoZ6Ux4DLBw>
 <xme:s9xfYgfkz5jUj9syj3EApJDnnIJYnZkCIgwSQTYBqxF3EAskY_MlOROYPx-xbBl8V
 c8uccQtXFC-cAzjdJk>
X-ME-Received: <xmr:s9xfYiy5Nhf6emhoaRAIdzwU-361Bx0XR5t7EVClwfftJNBfkiqELQsC2FLEXWBxhc93t5odGHr0dwy7rJM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttd
 ejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghn
 thdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelheduke
 evjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:tNxfYuPLHS5wrhTtXsmOA2KMtFshyFoITXrlOuS6IuDBrLMmiZxx5Q>
 <xmx:tNxfYv-FZXMQnxz7O9b9D_oO8A2Kx0MHKi28oYdfXgxZXntsE3qeKg>
 <xmx:tNxfYuXDl4LyrSUud1m5HMAmXfqQ8kcPP_TSSezhP8hnQJCEiV_luA>
 <xmx:tNxfYqnnm0R7Wq6p77K5WUJDyRLBBR_-ukKd5SSXmCyN5AeYH0ppRg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 06:13:06 -0400 (EDT)
Date: Wed, 20 Apr 2022 12:13:05 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Subject: Re: [PATCH] hw/nvme: add new command abort case
Message-ID: <Yl/csehng+W0gfQD@apples>
References: <20220420082044.n6orslk2aukj2jai@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nhaEA6//5bkw7tW7"
Content-Disposition: inline
In-Reply-To: <20220420082044.n6orslk2aukj2jai@localhost.localdomain>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: kbusch@kernel.org, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nhaEA6//5bkw7tW7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 11:20, Dmitry Tikhov wrote:
> NVMe command set specification for end-to-end data protection formatted
> namespace states:
>=20
>     o If the Reference Tag Check bit of the PRCHK field is set to =E2=80=
=981=E2=80=99 and
>       the namespace is formatted for Type 3 protection, then the
>       controller:
>           =E2=96=AA should not compare the protection Information Referen=
ce Tag
>             field to the computed reference tag; and
>           =E2=96=AA may ignore the ILBRT and EILBRT fields. If a command =
is
>             aborted as a result of the Reference Tag Check bit of the
>             PRCHK field being set to =E2=80=981=E2=80=99, then that comma=
nd should be
>             aborted with a status code of Invalid Protection Information,
>             but may be aborted with a status code of Invalid Field in
>             Command.
>=20
> Currently qemu compares reftag in the nvme_dif_prchk function whenever
> Reference Tag Check bit is set in the command. For type 3 namespaces
> however, caller of nvme_dif_prchk - nvme_dif_check does not increment
> reftag for each subsequent logical block. That way commands incorporating
> more than one logical block for type 3 formatted namespaces with reftag
> check bit set, always fail with End-to-end Reference Tag Check Error.
> Comply with spec by handling case of set Reference Tag Check
> bit in the type 3 formatted namespace.
>=20

Note the "should" and "may" in your quote. What QEMU does right now is
compliant with v1.4. That is, the reftag must NOT be incremented
- it is the same for the first and all subsequent logical blocks.

I'm a bit hesitant to follow v2.0 here, since we do not report v2.0
compliance yet. I'm honestly also a bit perplexed as to how the NVMe TWG
ended up considering this backwards compatible. As far as I can tell
this breaks current hosts that do set the reference tag check bit,
provides a valid ILBRT/EILBRT and expects it to succeed.

--nhaEA6//5bkw7tW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJf3K0ACgkQTeGvMW1P
DelvYwf/SkGh4DrxEk9wR/FCpLkL5XtD8QsWKRfc1/gRfBHEfg8PRKm/AhyUMYd8
yrbvc9H6j4erg/IYR8Rp2BFd10vGuglsg5nN5eumMibmzecEsPsvuF9GUx4v4x9e
5KRzlhV2+/0gU8bVw+K6ka/km252E3TrTHSyCYKpyaC3jqkdeZiRuV8G9pDy+Nzp
HYA/1a7eefALIyAv2JGIgD/WY+IyAuBCF85RjX9rF+QTAO6HGOPFUrifAHmKi6Hx
LUuiD8ryq4K/tvoi+sB6ZpbOixqggZPvjUis9CQ+eoDivbD4WLLA2PP4tLQWfibL
KAq5bGhDRROw65+xKtSpeDl3o1R2wA==
=MNJO
-----END PGP SIGNATURE-----

--nhaEA6//5bkw7tW7--

