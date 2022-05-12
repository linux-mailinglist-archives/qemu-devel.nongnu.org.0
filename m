Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA3524987
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 11:55:29 +0200 (CEST)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np5XZ-0000xX-Am
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 05:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1np56X-0005Xe-6K; Thu, 12 May 2022 05:27:32 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:34987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1np56U-0006iK-HZ; Thu, 12 May 2022 05:27:28 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2F5A83200708;
 Thu, 12 May 2022 05:27:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 12 May 2022 05:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1652347642; x=1652434042; bh=zY
 4I17e5c+texzsDc1sHDSC4NZ+kTdtrwiYBwLqKjv8=; b=Vs3WT0ASYij/HtzHAT
 cPGIkQqCfFjpW6BypVyKVVNCoptpWxlZ2dXzruKx0uE5IUyI/8mCzjhwGqKX7usX
 iAniXvYN9jCeOGexvp3pRtn+Dq1YXpsUM2xSQ3/r53XrD7XQlwBgiE85uWytUtW6
 P48bFVn0sJiQHwHkoUqnF/XOKUkhdQqauFCLt6ugsVjgEIuELBd4oYDheXjFGznY
 RlSsVU0rUxBbb8OhTCSUg6kgOLf/PBGNL8NZ0e50YTwu0R9gEORd7KfvY7xB1RXz
 JRW+Es9+sZfnU3ZzqqF21Ad3tBEKTbIDR9ypVRWb+VwyE0vWi1lRlqM/+cSdRNlS
 CqEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652347642; x=
 1652434042; bh=zY4I17e5c+texzsDc1sHDSC4NZ+kTdtrwiYBwLqKjv8=; b=P
 6SmYeDIB/AJwSpnfRF+85kg2rUGMK/LMKrt52vStklZ3EkdFRuvCojgt6khQfG3t
 R3WRlgutr5qEHZRPWjf9DRH3qriCtgCgmPfdpAyigvv6WjZNsHgmSK+6jBf4UcqI
 yI36IhNqdKG6E4vl5TmUNyfhhUC4z48Mdy7Rr3TdflBgjj2bOnOogNqgLo5UMGYf
 xnOdOTG5KuZ3clp5HZ1Jq8Wr/wb7rHn8Isp6mjkaL1qnMwJxxVLgGRPky/eGx7S/
 oJ+ItXIt0qCBAA4R0Q2ZN9UBor+/t1kZkxfbtV7EA97OnZTD48iSE0zHfdbzR5NH
 ikpMxTbkIQCnCBZMhxG4g==
X-ME-Sender: <xms:-dJ8YqHxwFrjW5rpzk1mD0pMRPpFOsvONgf14DlylkXvp5v3P9hgcA>
 <xme:-dJ8YrWjn6PKTx0K51BUQA-jymioPH20dQSc4COiU7iXh2BQsq_wlWRRE6-NPapIL
 yKJ8AJsUEj5-sB9plk>
X-ME-Received: <xmr:-dJ8YkKqSfBP_-l-iOAvCf6ycISCOzyILiCokpS-vppoiaO74ocGA6TVss20yP0hdfC2FcTuwCUa5j9TJoo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeffuddvhfehjedugfeijeeuieelgeevuddvlefhkefhgfettefftddvkeevieel
 feenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:-dJ8YkE2EPSjvUaawtfSUPqHitIM1otuyaJsNvdM7Z9zgSjRvioXMw>
 <xmx:-dJ8YgVE1RndoL0p7XhZIpyU55fdcRBwHTdQKUOffeUDS7sLzbS8-A>
 <xmx:-dJ8YnMQbSZ7MFHRE1in3arFNFOgqd6rCozioTB1NPSQEgGjECC9pA>
 <xmx:-tJ8YkRpEytao5bsqleCN5TnaP9AOouj07RCJqMZd9JSeOX3IuHj2g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 05:27:20 -0400 (EDT)
Date: Thu, 12 May 2022 11:27:18 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Christoph Hellwig <hch@lst.de>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v2 0/5] hw/nvme: fix namespace identifiers
Message-ID: <YnzS9hyxr1I0Se5t@apples>
References: <20220429083336.2201286-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9cMN429V4juiapds"
Content-Disposition: inline
In-Reply-To: <20220429083336.2201286-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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


--9cMN429V4juiapds
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 29 10:33, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> The namespace identifiers reported by the controller is kind of a mess.
> See [1,2].
>=20
> This series should fix this for both the `-device nvme,drive=3D...` and
> `-device nvme-ns,...` cases.
>=20
>   [1]: https://lore.kernel.org/linux-nvme/20220224192845.1097602-1-hch@ls=
t.de/
>   [2]: https://lore.kernel.org/linux-nvme/20220413044905.376785-1-hch@lst=
=2Ede/
>=20
> Changes since v1:
>  - Revert auto-generation of eui64 (Christoph)
>    User should set it explicitly.
>=20
> Klaus Jensen (5):
>   hw/nvme: enforce common serial per subsystem
>   hw/nvme: do not auto-generate eui64
>   hw/nvme: do not auto-generate uuid
>   hw/nvme: do not report null uuid
>   hw/nvme: bump firmware revision
>=20
>  docs/about/deprecated.rst |  7 +++++++
>  hw/core/machine.c         |  4 +++-
>  hw/nvme/ctrl.c            | 19 ++++++++-----------
>  hw/nvme/ns.c              |  4 ++--
>  hw/nvme/nvme.h            |  1 +
>  hw/nvme/subsys.c          |  7 +++++++
>  6 files changed, 28 insertions(+), 14 deletions(-)
>=20
> --=20
> 2.35.1
>=20

Thanks for the reviews! Applied to nvme-next.

--9cMN429V4juiapds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJ80vQACgkQTeGvMW1P
DekzpAf/f6G6vTlcEUvIaZgsmD62YhbYjLTz23KhnlIm0bGfdB6dx1vL5neJ5dlz
qYREudrNsme/i4z2+YwKbUYI9qpKi2j9scMCQES5idPgrPPL/lVr+6VTXY6Im4tJ
44X6nr5wOEj0fqBO/LaThsGTU81Fae6X32flRYOI2uaFmFeqjm+9RNE+NYZVV/0C
8YPR6maQhsVWz5Qs90J1vVJYcjKADS7dVxqTqjqgUIWOp+P+/6tDsCea4fr9jhBS
+YO/WGgvDlNZ4D8PECVY+RzDyryvp5dH+dSwhjy+z3uXPkK7nHg3NNP3DqPwifOA
MtdMpSumDuZkXu70i7dUrugMSJBWzA==
=RCyV
-----END PGP SIGNATURE-----

--9cMN429V4juiapds--

