Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBF353D2E3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:39:46 +0200 (CEST)
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxE5A-0004jV-Tv
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDyq-000823-Cw; Fri, 03 Jun 2022 16:33:13 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:47839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDyo-0006MA-Nb; Fri, 03 Jun 2022 16:33:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C256F320092C;
 Fri,  3 Jun 2022 16:33:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 03 Jun 2022 16:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1654288388; x=1654374788; bh=47
 t6K95ZFiypHO3dap/y1iFP5a5j9i8dc9UDjpY4owQ=; b=TYXHQ+w5U4mtOiRBqR
 zwBk/uqmnzEL/AZw6/8L2BGFcwYPu53q6Op56gdJ7qlSJGD4xDdd04R4BhYV9dgM
 ib+hB5hQxJOEne2s77zOG7gCi+KE0eJYAYmbvKmgSzS+fZSK5gOmT2vi5DRWgDRo
 zIiWU5ER13GGx5E1pLQofuv11kJQ1NVYLAjBlY49wOwDU7svAva1YRHZ7Nx/Usw+
 vRyFx5Qcjy4OkJPB/1gtrbR6BIPOROueXbqME2DtxxTFhoru09yBD9mgTrRbmg0K
 V0yDHEgr75tC9OBsQb12fRFDmThqEZKHo+Ug2WKCRlzQLO6NW5XHdPYkcqfwc6Xd
 83Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654288388; x=1654374788; bh=47t6K95ZFiypHO3dap/y1iFP5a5j
 9i8dc9UDjpY4owQ=; b=KjEsoYqE8bBRj4tL52HZ52CvhSRKZzEZushr+nhVIwzt
 VQ0Of6ZlEG19gVSXdY2NhHmPd+qT+AZ2Z7IltD0NdIynwUNphxKGCvdMUEyVmsLo
 jAKtVNJdOMJ6VkhRj4aBi8EgUU491MIFORbKM18lPTFHzwkgaOYajgI8/NWK2TAf
 t2ho9UHohKFOPo7bP9vsav1Nd2uUicHelOL3fpPA2x/tRw0bQcrX6WoAhgM1NgbF
 nOPf4pDGMLSEF1Hy/u0ToRvIzPv9cWb64JDeqBtl2zOQMnlxKjV6Y4Q8H3A0F0lm
 gCo+GunZ7v0Co0uO5WlYUs8bxnx+Ua+aXWWExHPY7w==
X-ME-Sender: <xms:BHCaYo98_cKhQuEjW4Crtt36slxs48KVFW5sWiUmtKI78LC6ddsm0Q>
 <xme:BHCaYgufoOGxuISllP9MEjogCBA_m1rNrFiyS9LnNOKNi8L4U4xXR8yepHqhdSkLz
 qg56VYb7kpg1RmC7qE>
X-ME-Received: <xmr:BHCaYuDxy388Sl_iaz3Jq-aHcl343GW-50kmcaoNIBC-rh6pIsvjMrxuZZgPClQCIsYuc-eHAWSVNHq7Uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:BHCaYoeoiCS_mPmq8To5XNtBcH4AHRGdDtu9TlQwfrCbhIO131u9wg>
 <xmx:BHCaYtPPUADsMz5KuHrF_M3_vdWtGwM76-GUqAW28IaB5VzJE4nPNA>
 <xmx:BHCaYimris4jixbhqkQAWnif_YE2wWrbR0Jp0t9TbE57Ad-kIyJTaw>
 <xmx:BHCaYursw9lDYCnhqoV7kqjppNxNfgLoAA1E2QK84GZ8kVStMTssYg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 16:33:07 -0400 (EDT)
Date: Fri, 3 Jun 2022 22:33:05 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] hw/nvme: clear aen mask on reset
Message-ID: <YppwAe60M+NOYZ3v@apples>
References: <20220512093055.726022-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iSHCy4RDxSftAsfP"
Content-Disposition: inline
In-Reply-To: <20220512093055.726022-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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


--iSHCy4RDxSftAsfP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 12 11:30, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> The internally maintained AEN mask is not cleared on reset. Fix this.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 1e6e0fcad918..4c8200dfb859 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5889,6 +5889,7 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
>      }
> =20
>      n->aer_queued =3D 0;
> +    n->aer_mask =3D 0;
>      n->outstanding_aers =3D 0;
>      n->qs_created =3D false;
>  }
> --=20
> 2.36.0
>=20

Gentle bump.

--iSHCy4RDxSftAsfP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKab/8ACgkQTeGvMW1P
Dema2Qf/XL7Z0ysuEz+bFjeUU8vpV/tFP3hbbgZV5yxSjmXmAUz8ckKshTL9OiIb
nJaOunWKeqB5i2XUJgO7QQe8m9TWLbCWMPkGhfdrTbZAjwNQ+HlQkkya2ZAKNX0r
YmHikmOwW6AlOi/dMrr4KnQkuhZzgCxlONjWJfzCpxzfKMRXOCknC3nqnMlC319h
jghAwHqyuIYpimR8fAvccM63pvDPPWxL0fzU4mInocO9UU+dvCuxf6u7AtNE2+Oq
CEnNbZbQF9PUrNLFGmIupH45sI1VIkQB7Y0THHRKsmfj3N3lE+iK+8FXLGS94E/C
Oy+kpKb/JG9jYcUm6ItW75XQX+CtaA==
=apeK
-----END PGP SIGNATURE-----

--iSHCy4RDxSftAsfP--

