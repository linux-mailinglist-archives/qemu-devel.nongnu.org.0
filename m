Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260A96639D4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF8vx-00013f-0G; Tue, 10 Jan 2023 02:20:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pF8vu-00011S-M5; Tue, 10 Jan 2023 02:20:30 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pF8vt-0003rg-1g; Tue, 10 Jan 2023 02:20:30 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 155CF3200943;
 Tue, 10 Jan 2023 02:20:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 10 Jan 2023 02:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1673335226; x=1673421626; bh=bi
 DokAJ3DfpuDt7wrz2/X3n0/a7EZ4oRy+sHCJ9IWHc=; b=Trr1gfTaLEw5FCRehy
 ibJD6hFT8Vkd0Wd8LwykH31vfDhGCZm8bysi8DM4Risvf2VtVnsSgcVyIvn2QXuS
 RQVnTqWc+NKA5L89LP+RTftfdpGd2bNX5YvzR3mdCt7BvDOnWYjf+eVVrTGY+EKQ
 7Cf3M0KshE5kWL9IkYTdJvPSXzkOVabYINSvHDNivP8R1DmDXv5mip3Np3JN9d98
 GDOI6ZLV6XdNwAKWAujyMSwkTuAfgUpLPGGol9+yg3PXMipf9jjJhc5drMai/I37
 k22LGxs3mmKLNBfLj0o4UJRD60IJwK63vMZ+7bRU4/sYjqRUttCKMVhJ9SxLkXIV
 F8uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673335226; x=1673421626; bh=biDokAJ3DfpuDt7wrz2/X3n0/a7E
 Z4oRy+sHCJ9IWHc=; b=Et6OzwNgat98Nl+ggMNGoWX77Ov45mPds2TqpJq65c1O
 BG32olgypiAImcZ9JFCbVDlDRo1ompaQI2YOtmRqqT6aDQGqlBKYtE74cBb7NyLQ
 i5A3n/coondESG5WkD02SHsWqecqf4VaTL05dMFjA0rCHZIGl3C9SofXGovvHiU1
 N8FV/XJgrhyrYObX7uKyiiTqil+5NburDoP1nozppQgttFfmNEQfNHPnmDgAKCBy
 Wkln94KxXyim8BHVRua/tcjJ23fbbiJd5vP6tkvNPAzgWPKuVOe1zRGqHmqsoKpI
 sEDQESe8u6l0PjiCOcNZw57vKh/foRmjdK5G+ElvvQ==
X-ME-Sender: <xms:uhG9Y-Ays0LWZ5_F59jQZlN7V2iXvkkPQ39S6vg_-D9JALvw7k0b_Q>
 <xme:uhG9Y4gFeNTs1XzZw7icC3Zsrg1NOecjhj2NGongBn9gsLU2DDpOu2M-B1y4C4dR4
 kx3_vKeSPd1QlNDC5g>
X-ME-Received: <xmr:uhG9Yxnj0kwJJhbEupGLY3xFkNXm1fNi5I4On88tCWl7YdBYwRAyzWKXWxYcFQMPR54C62BpeXpG9Caxv7i-e0iqNoKmVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeejgddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepleehkeffvedtudeugeeivddtheeugfehheelhfetgeekffefhffhudfhteet
 gfeinecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpihhnfhhrrgguvggrugdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhs
 sehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uhG9Y8yTwnt4AYMwWctxdkeZiC0y5qWFfPrahR9VTT2uOp6QwYg1HA>
 <xmx:uhG9YzT69ebQabG43Niu1fGStLUwAr7G0zpV5hgvGCa4iwXXy_0rog>
 <xmx:uhG9Y3bcXJa2HXhAh17_0_LJfeKfDX9YvSHis-kYCLPChvRy1CRM6g>
 <xmx:uhG9YxM3XAo-fwtfmRhSFsbA08E2A0mz2asOSu7dfpBZGLQDNcDssw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 02:20:25 -0500 (EST)
Date: Tue, 10 Jan 2023 08:20:23 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PULL 0/4] hw/nvme updates
Message-ID: <Y70Rt+y56CP//81T@cormorant.local>
References: <20230110071743.63507-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RUj7navDg104Yv2t"
Content-Disposition: inline
In-Reply-To: <20230110071743.63507-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--RUj7navDg104Yv2t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 10 08:17, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Hi,
>=20
> The following changes since commit 528d9f33cad5245c1099d77084c78bb2244d51=
43:
>=20
>   Merge tag 'pull-tcg-20230106' of https://gitlab.com/rth7680/qemu into s=
taging (2023-01-08 11:23:17 +0000)
>=20
> are available in the Git repository at:
>=20
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>=20
> for you to fetch changes up to fa5db2aa168bdc0f15c269b6212ef47632fab8ba:
>=20
>   hw/nvme: fix missing cq eventidx update (2023-01-09 08:48:46 +0100)
>=20
> ----------------------------------------------------------------
> hw/nvme updates
>=20
> ----------------------------------------------------------------
>=20
> Klaus Jensen (4):
>   hw/nvme: use QOM accessors
>   hw/nvme: rename shadow doorbell related trace events
>   hw/nvme: fix missing endian conversions for doorbell buffers
>   hw/nvme: fix missing cq eventidx update
>=20
>  hw/nvme/ctrl.c       | 121 ++++++++++++++++++++++++++-----------------
>  hw/nvme/trace-events |   8 +--
>  2 files changed, 78 insertions(+), 51 deletions(-)
>=20
> --=20
> 2.39.0
>=20

Argh. I forgot to update the pull url to something https://.

Do I need to send a new pull?

--RUj7navDg104Yv2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmO9EbcACgkQTeGvMW1P
DelBbwf9EiDNEcvcJM0xwOzHXLo5iR4c4OWudzyKlmSSczMd5pUCG/mvODKQoEv2
VyYzoQ9JqvxKpk7tfAlZ1qMDg5+F2O9v8ZSL+CvIe3hOgym2FuYw2DQR4XiRNN7s
TbriC4onvTgs5/YWHtkwCidnC7VqElywFlO3TthCxYMTaeFLi4MvIiX/eykvGSjz
q4DhV755yuMzuESB0BhWayaCGdBP4iGOrrVuaX6BKe8rOXiqENDPNq8Gz7ILp6Tg
EhnvuvFLvhzrSduxOxKUTn9fu+VxF6q4PTyCfhlJqBgSegGsWRwv4AcOl0BNRj4S
6Q/ZG74uE5ifnPVn9p1aafNfhmf7dw==
=8h/B
-----END PGP SIGNATURE-----

--RUj7navDg104Yv2t--

