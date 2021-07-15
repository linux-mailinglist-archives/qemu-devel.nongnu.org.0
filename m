Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE713C9895
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 07:53:51 +0200 (CEST)
Received: from localhost ([::1]:33978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3uJh-0004q5-Uy
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 01:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1m3uFE-00017o-1h
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 01:49:12 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:58123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1m3uFA-0003xH-2U
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 01:49:11 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 83AA75C01E8;
 Thu, 15 Jul 2021 01:49:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 15 Jul 2021 01:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=z3zZTrJFwyk7K17nx1gqctuWMcC
 u9GuGK7QJae8ghhg=; b=P1OaqSgjcYiPaDM3kUuqGdpt+MgGBixsZgHhVA/3Zo7
 P5sdm6iVnOHfDylRi9+maGwC7WXE/nPXpP8rfbyBculFtrotVGph2olMsh9VBgGs
 Lew90l4WMr2IafHd48or7eoFM9xgLVE0gdvlv4a4ew9y+cpcBIbk8wQew1fL1/vF
 QoyR/hsoNuC24c+4oNlCgPLXzopmvGAUyC82PN/P/ysNhZQpOSOjqTVTMlbE/foS
 fWU8ixQ72PSb3iamcM6GBUGo+3vyXQTamPr2Ce3qtd5cdbcc60g7Mk8RQO67+j33
 ecLkPmwpImqj2hGRGXt8ltF9VERo20iFTBa7peccqGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=z3zZTr
 JFwyk7K17nx1gqctuWMcCu9GuGK7QJae8ghhg=; b=wOlTgNdn9bnNfKFgeDR7mI
 HCvofq8223N/W8kH3R7bVXuhzSKz9X6yBRugEhSwJlWIvoMCmjXktONvPTLoiJtq
 pr5zCsjB7S3Gos85H06O5kVz8aA7ZLVfx6VJhQxK6h+HSHlFUhBnAoaKZhLIgasZ
 SgWHVIYmCJGavb59VsoZ284wv9Cf4aEOdb9AKkVe/LSXcCamfJhhbarGfv+DyyC1
 GRdR344DubYpvLph0O5Y3ji41c/I5U9wuQGupY3OgVljizqYBDNbcPhtou/9JA5y
 ChMXo1wBstZmxhjkVBGJZBNZxOapqcC7fZU8TqOe/Kvfhrq8tF774/VP4AkwE57A
 ==
X-ME-Sender: <xms:UczvYPPvgxiN3w90J4Altu5SO-pGvBuXQlF7tTWHirjzTRyC8yZU7g>
 <xme:UczvYJ-Yuy_rFRbnqiN2mvKnKYnx794eTLzy1qBILVsojqZjEG6VP4uNrjago7G5S
 z5VSbO9tFEz939BB5I>
X-ME-Received: <xmr:UczvYOQt82k4sIfo64JgnFD8iXJtbQ6O5t1QAsQZDww7mKelp8iyKeJKjhwitYrvyzlxxcqr_nRwCvAGIxyI5AHvJZD3iVGoX2fTWmf0V_0AObRBSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:UczvYDvO2OKovS33rZbqIgHcYWkjSzY1qs26X_3x4D8iKHuNbXLQpA>
 <xmx:UczvYHeVQOS3ERAuxPLcq9zYh8czZnHLfL-TWd4tZZQ-E_rj0bvETg>
 <xmx:UczvYP0pY7JuahGNRa3AS8aZcl6RyVIGnzA8TY4s1QTO1tNKmyPEHQ>
 <xmx:UszvYO53t57M2lNltBkVXkDV6CytHfPlQsuslHMuzc5K3W9NDUJU_Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jul 2021 01:49:04 -0400 (EDT)
Date: Thu, 15 Jul 2021 07:49:02 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 10/21] contrib/gitdm: add domain-map/group-map
 mappings for Samsung
Message-ID: <YO/MTt7DJ8C1GMKQ@apples.localdomain>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
 <20210714182056.25888-11-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EWUbHS4yEyGIhPrU"
Content-Disposition: inline
In-Reply-To: <20210714182056.25888-11-alex.bennee@linaro.org>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EWUbHS4yEyGIhPrU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 14 19:20, Alex Benn=C3=A9e wrote:
> Minwoo's work from their personal address are treated as personal
> contributions.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Acked-by: Klaus Jensen <k.jensen@samsung.com>
> Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Cc: Minwoo Im <minwoo.im.dev@gmail.com>
> Message-Id: <220210714093719.21429-11-alex.bennee@linaro.org>
> ---
>  contrib/gitdm/domain-map            | 1 +
>  contrib/gitdm/group-map-individuals | 1 +
>  contrib/gitdm/group-map-samsung     | 5 +++++
>  gitdm.config                        | 1 +
>  4 files changed, 8 insertions(+)
>  create mode 100644 contrib/gitdm/group-map-samsung
>=20
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index efbbb15643..beeb24341e 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -26,6 +26,7 @@ proxmox.com     Proxmox
>  quicinc.com     Qualcomm Innovation Center
>  redhat.com      Red Hat
>  rt-rk.com       RT-RK
> +samsung.com     Samsung
>  siemens.com     Siemens
>  sifive.com      SiFive
>  suse.com        SUSE
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-ma=
p-individuals
> index 36bbb77c39..4ac2f98823 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -29,3 +29,4 @@ mrolnik@gmail.com
>  huth@tuxfamily.org
>  jhogan@kernel.org
>  atar4qemu@gmail.com
> +minwoo.im.dev@gmail.com
> diff --git a/contrib/gitdm/group-map-samsung b/contrib/gitdm/group-map-sa=
msung
> new file mode 100644
> index 0000000000..e38c7eeeac
> --- /dev/null
> +++ b/contrib/gitdm/group-map-samsung
> @@ -0,0 +1,5 @@
> +#
> +# Some Samsung contributors submit via another domain
> +#
> +
> +minwoo.im.dev@gmail.com

I'm not sure how this groupmap works, but was it intentional that you
left Minwoo in the Samsung group map?

> diff --git a/gitdm.config b/gitdm.config
> index a3542d2fc7..e7a744146e 100644
> --- a/gitdm.config
> +++ b/gitdm.config
> @@ -36,6 +36,7 @@ GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
>  GroupMap contrib/gitdm/group-map-ibm IBM
>  GroupMap contrib/gitdm/group-map-janustech Janus Technologies
>  GroupMap contrib/gitdm/group-map-redhat Red Hat +GroupMap
>  contrib/gitdm/group-map-samsung Samsung GroupMap
>  contrib/gitdm/group-map-wavecomp Wave Computing
> =20

--EWUbHS4yEyGIhPrU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDvzEwACgkQTeGvMW1P
DemMzQf8CJjJT93oII80N25gPhGU2qZuyE/UbmWMXAA/ApAz1R9saVtzfhiZ9qPE
Tr3FwkC/NG7QKMLZhejDR8136P1UNalTvN8O2AYxLGPldyhs7obMUwHc76VYCkPM
Eo5KF32l20YQdUvTIiViME5I4nQT7E6qo11u0OoqB4A+ayHU2CVaSBi/GD+6xz+D
35bhlPXdVXNW52JoSHsOHq4xCuZmRyXf2X+aTSO6AJhfi+0vCnfmXzv8rRbHGpIl
8pHbmB73Va2kqpRH/8Ee/gw26wp8NtM/AEGiUbQrW27WrMEeS+WDS4ZXOwW8v+KA
W0HZA9z73NC3iqkKSsBl85ptBJCtWg==
=tFsy
-----END PGP SIGNATURE-----

--EWUbHS4yEyGIhPrU--

