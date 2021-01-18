Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F172FA0CB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:10:35 +0100 (CET)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1UIk-0006i9-9E
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1UCi-0005Nu-Lz; Mon, 18 Jan 2021 08:04:20 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:44061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1UCe-0007se-Kh; Mon, 18 Jan 2021 08:04:20 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C84C1580724;
 Mon, 18 Jan 2021 08:04:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 18 Jan 2021 08:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=UPING0p30LKPc+tY2o09zhjDLVr
 gumKDxiB+aGwEIjs=; b=Acw0oKR7cWguruBKoK1lYKe5T0ySL6YG8WGoQ2kVz9c
 bLmPYFxEWbBhSe4vYe8ZQfkQYpgkBMFzwC8X9zV3UjCnaKInzlSZuWajbqUOYQFY
 vy0nOQ6NIEOv9VnKsiX9Q7xAGEpqpc2HEGv+dz4wpgxynLZxKe1bCWofZIctUk6n
 zblCLTfBxrdJQyzRaZ3tJDldm9hqM6rnN6Cdi5kSOGBOPHHQ/XKRt5uzFCvECnmk
 yt73P/jltMzy53/mFDPIJyXHKzkRC9KZe7KqnEv43+Ic9bRe+KSqtKfWwJbYeRIg
 Fz+QUPF3nswWfyMFrZxfij+u3n/qhih4hpkuVN6Bpjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UPING0
 p30LKPc+tY2o09zhjDLVrgumKDxiB+aGwEIjs=; b=l4L6CJx9wM2wj8bhcSMNAc
 QfUai+755YcYyWzCCoNADzsGcVIaT2RwXr8PgliDNRQ9JzjmDiEOvA3FJ0/0fkoX
 lZy5smw99fVGXBjjDslFCaVZ1Kv2d5N42iTMEZGOZMKEs56uKi/HR0fuqggCzrYz
 2VWp2WUTzs5pevUkbtOx/okhKBcPaS4XoYhGP/DDejoJ/4KLU/hryIa4AylfzYH6
 ksVjQYalhi0/mt28G8T8sNKzHxfliJahXnMUHz7649vl+d/J0+YJLzJm9b33NsvK
 mCn6Igtx21gqu3dLwysNqM11BPlEqAP5LsDeF4Nohdmp9iIM2zlD2A5+8yRIvJEQ
 ==
X-ME-Sender: <xms:TocFYM1falyqXyyeyrRFrjB7mAofNhIK_cB2flHNuPvB-VWR9cmPpw>
 <xme:TocFYHTuoTYMIQdyfKJIp7viwiaq9h9gpRm873jV6MY4sZIdApmGMY18_gkdLSaL9
 XrAWy_CeB-QYxpW--0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:TocFYGsI-VHyn6rToYleYA818pMfghUmL-VFDxsYRvQTyhlBhKlQ3Q>
 <xmx:TocFYEY1Axt8ZaENC9tYHlXOSet3obONooah1AYt656OZU6a6H8xdA>
 <xmx:TocFYDt-WtAujor_uUzKYwdqzb7n5X4iBkx1sHVGZm4gueJgslCQuw>
 <xmx:T4cFYOrbt5uBmb61R1AwqJ1eMdNt3WuAvNSfwO6rOUlHMAjh9uk1_w>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6FB651080064;
 Mon, 18 Jan 2021 08:04:12 -0500 (EST)
Date: Mon, 18 Jan 2021 14:04:09 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v2 10/12] hw/block/nvme: move cmb logic to v1.4
Message-ID: <YAWHSaXmpo64xmmp@apples.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-11-its@irrelevant.dk>
 <20210118125859.GH18718@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7pKOFcjt6uoqVOLG"
Content-Disposition: inline
In-Reply-To: <20210118125859.GH18718@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7pKOFcjt6uoqVOLG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 21:58, Minwoo Im wrote:
> Hello,
>=20
> On 21-01-18 10:47:03, Klaus Jensen wrote:
> > From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
> >=20
> > Implement v1.4 logic for configuring the Controller Memory Buffer. This
> > is not backward compatible with v1.3, so drivers that only support v1.3
> > will not be able to use the CMB anymore.
> >=20
> > Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> Yes, CMB in v1.4 is not backward-compatible, but is it okay to move onto
> the CMB v1.4 from v1.3 without supporting the v1.3 usage on this device
> model?

Next patch moves to v1.4. I wanted to split it because the "bump" patch
also adds a couple of other v1.4 requires fields. But I understand that
this is slightly wrong.

--7pKOFcjt6uoqVOLG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAFh0gACgkQTeGvMW1P
DeltnQf8DYZ5boNmPf6K70qPyC/HAmnVlrqEmTRbkXTRSJw5wOJ4bO4EDYs428xK
3vrKTfaSecm1rq4NEntCaOTb1t6CP8KYSxhpxKjFR6iuCnyferhfogaN3VmMnKzz
iTjF+7v1C8dTnkES36y5OKlEyvL3HGU1qVZbSBdFoFOVyWlCdh/ZskoQIZPGbbto
135zMBk6z+bL5/eqpsgzQ7yYmI/KOQWvTxpHr2tQTKt8Pbw2sF+WazotZ4dv34XM
SlUOz12Gj4S99S8b2l3wWG14b7ewloF91yZ0UHKvl0SqAmPvLcfiD+lWsHgN2Qbg
ZS4vWMo/Bw8rl3jx8SpCuuS6YtAmSA==
=01LJ
-----END PGP SIGNATURE-----

--7pKOFcjt6uoqVOLG--

