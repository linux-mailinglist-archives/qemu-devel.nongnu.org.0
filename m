Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B300C615D5E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:09:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq8oE-0006a3-7h; Wed, 02 Nov 2022 04:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oq8nO-0006SL-C0; Wed, 02 Nov 2022 04:08:27 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oq8nK-0003Xv-BW; Wed, 02 Nov 2022 04:08:21 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 69F1E5C00B9;
 Wed,  2 Nov 2022 04:08:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 02 Nov 2022 04:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1667376496; x=1667462896; bh=dy
 25Qo6/rANJumBclsT7UmNTzsxvrRx1j7ZNrrQlE4g=; b=oekh+H16fJzIasFU3f
 AjIRFxmXpcWXzHCM13HjepLc/GKz5DGlIynrqEDK2BZq8VJ5Wy9TyhrC10+4OqPa
 ywYEaJ/B96Hhpi4+kl1PcL05r9RV69QosWiSZFFYO0+7KJRKzByYOoeEBmH5zbXd
 yQFgaGw0vrBsL20AE1+ivcVvPRm490BwjqT5EaqG6hQbojuC9cUvR5NVxHE9oa60
 MbWTkKUGo5j6hVajxHZ7wqJsIRq4DZw9QyvLz15ale/30w/PCvSBeB7v4f/VTL2K
 AUOV1y7BbRqFUiVTNWYMEQST4vfhUmV/TGjI9qCgMsyhAaD1BRNMnizhuM3kQXvY
 SZUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667376496; x=1667462896; bh=dy25Qo6/rANJumBclsT7UmNTzsxv
 rRx1j7ZNrrQlE4g=; b=dy07WKK+qykN16bQZ1rD8wWThiRSHnVRNiuZMePoMtJi
 qhM1QfcCAfJ3X0FqOBTGra+jAouq0Cc3MrZxpaetl/WbnWjBjmwR1TYd565k2Clq
 yS6+qqos6pryBK59rzPIsbE99za84+M2bMOhfUyvXEe9yASy/mpyhRCnXDf8ZUMH
 WRRLGCNoZyNR7GQwtXC6TAf7m51/HYkeAnaA/BkUlyE0kH4U0imxsmilwL3aPhqR
 jzzoYTt/SecUMYZc1VG1b66tNURV06IjjBDdNRE0hgl8rxluLrVIoweAer8CQnx0
 Kzj85Kj0o91F8wsT0d7Zh3Mj0qW2s70rQbGvOiaLIA==
X-ME-Sender: <xms:cCViY9pSHFRCIMOp76zzHURlYgd-fxxiTYRDKTm1s1hwdhPv3zreMw>
 <xme:cCViY_o-bfffzqU9sT7PwSBRQ0hEKcOEh4QMShULqlpbYbPN6LlAeNd92V8UtlLFz
 bDiV2gCgjCr_tdupSc>
X-ME-Received: <xmr:cCViY6PE8FEOdk2ztMXtq48w3CHEYTDy97fXbKS_ArSKGNSGip7Zk1EDcrDMYOpn3Qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudeigdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:cCViY46XVRmrRjtnO8Wnvl-8kN67wenr0PNkj1kNsXSMXHL1ICCVnw>
 <xmx:cCViY87fxsbIOrILn5VofjcohWYX8dIcsHVB0voTvbbdbtDs6uAHeA>
 <xmx:cCViYwj7jsZgMt7rxuzhx4DVg9YZ2vVRK2P-H-dWq4vIp6SOyiU54w>
 <xmx:cCViY32ChNLS1t_UF1ijdY3HNZLXHQAZf63L07Sm9jIUctHMXvrpQg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Nov 2022 04:08:14 -0400 (EDT)
Date: Wed, 2 Nov 2022 09:08:12 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Francis Pravin Antony Michael Raj <francis.michael@solidigm.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kbusch@kernel.org,
 Jonathan Derrick <jonathan.derrick@solidigm.com>
Subject: Re: [PATCH] hw/nvme: Abort copy command when format is one while pif
 is zero
Message-ID: <Y2IlbDXMouJy39xD@cormorant.local>
References: <20220826025359.124312-1-francis.michael@solidigm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="C0YipVuLbYaDNC0i"
Content-Disposition: inline
In-Reply-To: <20220826025359.124312-1-francis.michael@solidigm.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--C0YipVuLbYaDNC0i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 25 22:53, Francis Pravin Antony Michael Raj wrote:
> As per the NVMe command set specification section-3.2.2,
> If:
>     i) The namespace is formatted to use 16b Guard Protection Information=
 (i.e., pif =3D 0) and
>     ii) The Descriptor Format is not cleared to 0h
> Then the copy command should be aborted with the status code of Invalid N=
amespace or Format
>=20
> Signed-off-by: Francis Pravin Antony Michael Raj <francis.michael@solidig=
m.com>
> Signed-off-by: Jonathan Derrick <jonathan.derrick@solidigm.com>
> ---
>  hw/nvme/ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 87aeba0564..cb4c0f80bc 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -3040,7 +3040,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest =
*req)
>          goto invalid;
>      }
> =20
> -    if (ns->pif && format !=3D 0x1) {
> +    if ((ns->pif =3D=3D 0x0 && format !=3D 0x0) || (ns->pif && format !=
=3D 0x1)) {
>          status =3D NVME_INVALID_FORMAT | NVME_DNR;
>          goto invalid;
>      }
> --=20
> 2.25.1
>=20

This got lost somehow.

Applied on nvme-next. Thanks!

--C0YipVuLbYaDNC0i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNiJWwACgkQTeGvMW1P
DekFbQf/Zq9VyZKZqDe5LswZNt+On+aAS6B0hNHIwENDunp26IZTCZ6SOO7QG0XK
VyHxX1HNFAaJpcpSLHNaJjlLS8DJASToAOxweha3SjWmIafT3H6DsiTPVB4MHckC
f1KTF2vh9urDHe6UIIYAmK/0GkWJZRDks0/VXeBAi0b/2eM3x7uOuwM9q135elP5
hDjYFJxqw0sNJ8qvqNhJyFGEJcTfKi3pjxCCMgoFUgcKK3LbyiUkqTJBHT0DZrst
7FH84XTkVq/IjUaw6NzMSVux9S/zFceKm05qoy9+Mc4RS6QmrLRul00bdooBJHyN
tHX/VhqGE07pmIMGQDk3HtvVuyLZyg==
=lj0M
-----END PGP SIGNATURE-----

--C0YipVuLbYaDNC0i--

