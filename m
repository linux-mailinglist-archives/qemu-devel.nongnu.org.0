Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A8C2C8F80
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 21:56:45 +0100 (CET)
Received: from localhost ([::1]:45108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjqDz-0004YQ-VX
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 15:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kjqAA-0003nu-Vu; Mon, 30 Nov 2020 15:52:47 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:56791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kjqA8-0004cL-LE; Mon, 30 Nov 2020 15:52:46 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AE595FF3;
 Mon, 30 Nov 2020 15:52:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 30 Nov 2020 15:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=F79go/MZkAN7Anj1eDGpuEOQXI5
 VocU5TCgeuw2aoVM=; b=tCAUufVR1RVTgpz+ufI52flmC19tZ/hEIVrGqJUePbm
 u8lrYeF9B4KrHGzU8exVrOL9eB5fBDtg7DPocZv7ijr6Md3ZjPtAfv8zlLJnzwXs
 +2raSCitn8wO/19k2P+lowrShpkv2WUK1dPvMpM8umfs/1MLd8c+nI/UcBb9Kl0l
 iORM1gZFwy3FvtsUtlVEaGzH6jyFyiux6lou+Ub+pwT0eMyln14tsSY2OD05bDoN
 n+qMhIgFs2A9PA0OfuNm9siXjfdXW62W5doN+E2apkS62z5gCB1l7KcEspSA7q5A
 jEfv69+5GJ1pjmDs0I1Qti1Z+ErL0DJlLMZTxItzBTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=F79go/
 MZkAN7Anj1eDGpuEOQXI5VocU5TCgeuw2aoVM=; b=bqOY58pYe0LV1Y6/O3MHB+
 4ehQeqx55D1sVVcCflycbuwZRJ9cxkZU52NHvc12Atg+w8TGg6LOYwUNQ2V+flWM
 w/u1ZzrDwzJKUmXp4sUaxF79kBhS7mCLhLRT81tyTGADZXSz+SW4y17BaO/iAYai
 cvEEq3P3EZ73IzF874QJD6xfKlj6c3bJSLzCHS1yxlgXmbr9KbpZJBAKBYnyP4ri
 ubQlq0pw3FEGN512PGbBQ2y6zMO6SxJs4XRDCvRhYMDsNFru0AEwuBomRUycOYyH
 XXv7dXVHqoApknWQjyx62E7zTKmV5pvfQp1TUUrHp0oNqOK78MvMhIODT7p/zgUg
 ==
X-ME-Sender: <xms:mFvFX6xktYbajnDneDrGVgM5MtMAiMUzVYnuz70SaBHfDw4kOmUg_A>
 <xme:mFvFX2SBNJKUDLFMGx0o4sQU1uVKVIc6mpd6NjiM_Poq7VOq8hANursMiaVGWgvcs
 EwOeDHxtesn0TQvz_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeitddgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mFvFX8VHK2QOf09yDZ9UAGxVIm3tKhEtZ18XF06T7x9QGmqwswVtaQ>
 <xmx:mFvFXwj5Z83vBIBQcU9ednyt8ev92dUJsVWlEJibGF9ItvpX6yxgVg>
 <xmx:mFvFX8D8pZ5mVlbrFBXj-TM7HhamhtA-4Elq1E5lkNnXFFciyYhxwg>
 <xmx:mVvFX_87s_kPnyOXa5UgyPBCNdvk-OxVfBLdS754_EOlVm59e0kgsQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0C08D3064AB0;
 Mon, 30 Nov 2020 15:52:38 -0500 (EST)
Date: Mon, 30 Nov 2020 21:52:36 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] hw/nvme: Move NVMe emulation out of hw/block/ directory
Message-ID: <X8VblCummS/6aRMf@apples.localdomain>
References: <20201130145238.2509405-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cP/ZZIHBA8WK+x4Q"
Content-Disposition: inline
In-Reply-To: <20201130145238.2509405-1-philmd@redhat.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cP/ZZIHBA8WK+x4Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 30 15:52, Philippe Mathieu-Daud=C3=A9 wrote:
> As IDE used to be, NVMe emulation is becoming an active
> subsystem. Move it into its own namespace.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Rebased after nvme-ns got merged in commit 8680d6e3646
> ---
>  meson.build                               |   1 +
>  hw/{block/nvme.h =3D> nvme/nvme-internal.h} |   4 +-
>  hw/{block =3D> nvme}/nvme-ns.h              |   0
>  hw/{block/nvme.c =3D> nvme/core.c}          |   2 +-
>  hw/{block =3D> nvme}/nvme-ns.c              |   0
>  MAINTAINERS                               |   2 +-
>  hw/Kconfig                                |   1 +
>  hw/block/Kconfig                          |   5 -
>  hw/block/meson.build                      |   1 -
>  hw/block/trace-events                     | 132 ---------------------
>  hw/meson.build                            |   1 +
>  hw/nvme/Kconfig                           |   4 +
>  hw/nvme/meson.build                       |   1 +
>  hw/nvme/trace-events                      | 133 ++++++++++++++++++++++
>  14 files changed, 145 insertions(+), 142 deletions(-)
>  rename hw/{block/nvme.h =3D> nvme/nvme-internal.h} (98%)
>  rename hw/{block =3D> nvme}/nvme-ns.h (100%)
>  rename hw/{block/nvme.c =3D> nvme/core.c} (99%)
>  rename hw/{block =3D> nvme}/nvme-ns.c (100%)

Would we want to consider renaming nvme-ns.c to namespace.c? And maybe
also follow up with consolidating nvme-ns.h into nvme-internal.h?

--cP/ZZIHBA8WK+x4Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/FW5MACgkQTeGvMW1P
Den0xAf8DFs7sYB6OUNIR3ZGrZ8DYvKqD2xkCroQGPwZEeHtq5GMP6cz97P4Acbb
WySMfXcG2PrInyS1+K20Ls/LO2SlQ8mpZegV7x4UMdBHXo97o/8at3oXhE8sX53E
9v3oHPxUYb/u1gj8spxuaeEnsowm93+E8t7t8vL8OgxLqKpQavevf0Cau01N8m95
PJdQIz0NO44vXwYCcVkUN/6YjVy6JY0vTPFqatME+fsnygz0N1N1fQidNLcCW2aA
nlSqf1w10nOnQZJWdi8DGSH+V8n8PSGKr5fOcWz3ZsR479X7hkwEMBPOgH7B2S4+
dkTnu+5na6xVhZjFbxEkQ6KcGfNbdg==
=yGI6
-----END PGP SIGNATURE-----

--cP/ZZIHBA8WK+x4Q--

