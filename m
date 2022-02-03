Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E9A4A9030
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 22:49:16 +0100 (CET)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFjyd-0007ut-94
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 16:49:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nFj3e-0000a3-48; Thu, 03 Feb 2022 15:50:23 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:37909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nFj3a-0007y0-3n; Thu, 03 Feb 2022 15:50:21 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id D09962B0021D;
 Thu,  3 Feb 2022 15:50:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 03 Feb 2022 15:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=KWPwi6hjfKOr10LRfNzY8ZIT/DGKLh
 iJh9xKrN70kY4=; b=kkCvAUAbxlozHSmFVfsGVa4OdAmrfIt27ZYCZCuW8V3fYq
 +HF6rTvq4/TD5JFst9Aeo/KdvxEYqTVQzTwDTNq7WnYrUX5FQZfD8/qErTnmBQVT
 khzlDjJUFuWdv/yKeybQGSYk9reFos4F8bTRPldLnl7EF8OybTNH1106tZrARqI6
 aZrQTZDRxxogw/eWpP3LenKXy29H7toAn7iSYILkWsd4k5BVqrckFiRV+Xd8Nar/
 K+Qsx/KLL+OTw1s5uA0DeXu9MyojgJRWu6E3edK4rDPODV8Y+Azgio4S3OdTDEoC
 jnXh7JIgoLB1uRdSaq1TJN61GYOy1pb3GGioyPkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KWPwi6hjfKOr10LRf
 NzY8ZIT/DGKLhiJh9xKrN70kY4=; b=AuCRv6Gty0dwXQbgj8e/q55GSTVVO6E/O
 5cTI1F0qCXgkUmZ6U92qEUdyviu3TKhWaokieePibN2rncE7rlXl58NtAJRNb64n
 h5cJvUYKQR/oUV5DmoufTtrLAxoL/7eEl5jtc6RgESEBLirpvDbMuLjnyT8ROpCP
 l1dDC7rmN1GTQgEmVNBGqSjNkfBORbACfLuC6jlrBWX4QLnCEVJedycOkhaCz7Bb
 kb7/3kb/wI9BKuaH+4K1rZBzQbrSaaVPoSfTlPT8Yb3LKdJi632RV3wMapowJPmt
 /JLqUUFwWQeHix3zpsz+MPG9RYkiBP0l9dzEhU/9M3Uafb5jICI8w==
X-ME-Sender: <xms:-T_8YcjCZyBtVa6gINZEsoCorKDhmewlsDVj_-NQtWW45Heprusf9g>
 <xme:-T_8YVC7g00J4d_EMqdaFkUux2GRqShYjGtiDPATGNb9O6J2ZooszVtQSfFWXWxkJ
 M3W8a1MzC6vKIarzro>
X-ME-Received: <xmr:-T_8YUH5gGCsuiMOKcTCS3RTY-rlKliK_PpU5c3QAoZ7HHKMPvWstwTKBaNhenrO3haHPwH9hbzJECCc9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:-T_8YdTyqWFJCJUdkZoZjiKYIinlNByT4ifUfn0IfH56b058Xz8BUg>
 <xmx:-T_8YZygOjXVSW3FAW4o9G_vV3fGz1CqJMAffOu4U7EF3pBM83X6Rw>
 <xmx:-T_8Yb4m-S6JwzCEEMlzk1dhot763EU5vXDRlBYZLe0i4lvTOvPYuQ>
 <xmx:-z_8YZdwMcVGVh4zMWA6tkssYlQRfYTSdg2SlWoU1E9JkjDRbxFCqNbBV8Y>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 15:50:00 -0500 (EST)
Date: Thu, 3 Feb 2022 21:49:58 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v2 0/3] hw/nvme: zoned random write area
Message-ID: <Yfw/9lM0Q+vSnv4Q@apples>
References: <20220127081950.953572-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H4LU+37p4x3p+BFN"
Content-Disposition: inline
In-Reply-To: <20220127081950.953572-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--H4LU+37p4x3p+BFN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 27 09:19, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> This series adds support for a zoned random write area as standardized
> in TP 4076 ("Zoned Random Write Area").
>=20
> v2:
>   * fixed rsvd member in NvmeZoneSendCmd (Keith)
>   * dropped patch 2 ("hw/nvme: add zone attribute get/set helpers")
>   * amended patch 4 to open code the helpers removed from patch 2
>=20
> Klaus Jensen (3):
>   hw/nvme: add struct for zone management send
>   hw/nvme: add ozcs enum
>   hw/nvme: add support for zoned random write area
>=20
>  hw/nvme/ctrl.c       | 181 +++++++++++++++++++++++++++++++++++++------
>  hw/nvme/ns.c         |  61 ++++++++++++++-
>  hw/nvme/nvme.h       |  10 +++
>  hw/nvme/trace-events |   1 +
>  include/block/nvme.h |  40 +++++++++-
>  5 files changed, 266 insertions(+), 27 deletions(-)
>=20

Applied to nvme-next.

--H4LU+37p4x3p+BFN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmH8P/QACgkQTeGvMW1P
DekanQf/VuW8CXgdmrZyR0pXQpgS+tlU+Y7obhuD8lOrcFQl5Euzn08unkElnBvo
TfgmzWye/6TgubZavnDGg4ZTz908Ts0loYgQ/9J5OmW4Q3AUzOllRZp5OttS/Wt4
7mzgYICtxFsYCzCIS688IooheVJKJMw400KA8u9ZmOZxKGDyz/d96VJ5VzlFHQrK
zLC0dlYuyxPQ5lwwwh4ZD6QgChjET/RLORLfXGSdqyUPihLpOhtWkMFcL+xkK98i
hsJiKPKMQApN6Hw74w5CXmJOnnCm/FI2xs/+vb8kn1Tsp2jOk6QbcSUv+Oae/9jX
/wFOMIUd8fwEVHODuu+VI2mS+Lw41A==
=tqHM
-----END PGP SIGNATURE-----

--H4LU+37p4x3p+BFN--

