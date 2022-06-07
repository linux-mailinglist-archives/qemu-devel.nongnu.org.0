Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6B753FE7E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 14:14:25 +0200 (CEST)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyY6K-0006rO-3D
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 08:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nyXJG-0005Q5-Qd; Tue, 07 Jun 2022 07:23:47 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nyXJE-0003Kp-IF; Tue, 07 Jun 2022 07:23:42 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2746E5C00DF;
 Tue,  7 Jun 2022 07:23:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 07 Jun 2022 07:23:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654601019; x=1654687419; bh=Ra
 X1H/Vtin6ayCwrYVRiJN2owz7UGknepfbwZ6TMY5w=; b=W6CHN+2CGoRQUCYq0g
 yj/FfytV1HPyy95klhGg5871w10TD6i7JkoFlIaHPJqgAgcqdqtcG2Y0ht63m+Id
 q/cu9Z9wxp4u/bh0fodq8F+TfneC+s2LU//lpQ74VQYLUj3SkXjA4pUNEQsLLMBG
 xX9jeEuKIn9oHw27lZi3dUJZQpTC5vqHg6GpseuTbXE4XGcQPOPy99jVA9iAAfZ1
 0N3+7tm3pNUFyIx2/c0t6iX2kebXzrZriokvUE2buum+J/ghl2ZAbyBt0CU6GZMB
 NY2Eqq6Ff/QtxvELh9MsOP6wIo7jxuUTrbeRIXnR7SpIvemQIAti3Zxm7NKyPySF
 E9JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654601019; x=1654687419; bh=RaX1H/Vtin6ayCwrYVRiJN2owz7U
 GknepfbwZ6TMY5w=; b=DTUyrfNYugfp34e/l97DVwA3XjkHJIfKKafCGfpq7XOF
 tr+ycvMlfMe6LaBUz+r+XBDFPHhfSpPoJAOXunutY82nLkG+/BzTShJ95FatQD1c
 olYhHXGny91q8QoJaor6Y0LXBcc6GsSatwTSkbGjBlAy9dfk6w8OOXQRJrJTKTRk
 m1h6bUwX72DWu5z9XtwMG4eZ0WkK3M2RLsdjpTg3kmsDUPi+znstyWNsA/AHD2Iv
 nzJe9oUT8WivZeDth8kk3kcj/QJC6/SBkqoLLULoZeF+a1d1I4f9hz0agyLWzv3G
 pKOYVZNVpDx8PEyVGcpKDHjVY7pS69GX13QIw4SIlg==
X-ME-Sender: <xms:OjWfYtKBgo6fYQvgYAJun1hMoQaBd0oJaie104E9OZytRNc0Rvz0mg>
 <xme:OjWfYpIOwv_kwCxuYNdq3z0kTGR_rWZeyn1cDgJLa1lShoVYowLCypNh3nxRFcubC
 i3FmFcidEmswQKuCMo>
X-ME-Received: <xmr:OjWfYlu4r0AmpWL1CkvL7CQmbaIQMRoAHPvgUArmAJ4ig3w1sf4AgVnJGOuxODH2hYPsJUOPqGhGiNui_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:OzWfYuasOo0pERf_sh76AfUaUdhBbFVJFNdHURtHHiLkoZX5_p-GSQ>
 <xmx:OzWfYkYGnu0i4A4JSd1bXcnBya_3NwGs1UW-9Su3EpMoKSl9kV75KQ>
 <xmx:OzWfYiAsWiOM5pvtYOaL_R3cPEXtLorkmubZnYGxRXcakz4v775Cwg>
 <xmx:OzWfYjxpndAVoXHAwvqY6DtzM6brIr9NsNU-7xCorEWBSX2ps8mVkA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 07:23:37 -0400 (EDT)
Date: Tue, 7 Jun 2022 13:23:36 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Cc: Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v2] hw/nvme: clean up CC register write logic
Message-ID: <Yp81OGi3++1wBfD5@apples>
References: <20220525073524.2227333-1-its@irrelevant.dk>
 <YpdpjLHhJDpTn7kP@kzawora-mobl.ger.corp.intel.com>
 <YppuEyXp/iL06z/C@apples>
 <20220607110645.GA28312@lgieryk-VirtualBox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pf6n6sJBzEH/piMb"
Content-Disposition: inline
In-Reply-To: <20220607110645.GA28312@lgieryk-VirtualBox>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Pf6n6sJBzEH/piMb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  7 13:06, =C5=81ukasz Gieryk wrote:
> On Fri, Jun 03, 2022 at 10:24:51PM +0200, Klaus Jensen wrote:
> > On Jun  1 15:28, Lukasz Maniak wrote:
> > > On Wed, May 25, 2022 at 09:35:24AM +0200, Klaus Jensen wrote:
> > > >=20
> > > > +        stl_le_p(&n->bar.intms, 0);
> > > > +        stl_le_p(&n->bar.intmc, 0);
> > > > +        stl_le_p(&n->bar.cc, 0);
> > >=20
> > > Looks fine, though it seems the NVMe spec says the above registers
> > > should be cleared during each reset for VF as well.
> > >=20
> >=20
> > Aren't the values of all other registers than CSTS just undefined? (NVMe
> > v2.0b, Section 8.26.3)
>=20
> My 2 cents =E2=80=93
>=20
> When VF is online:
> - Both Controller Reset (CR) and PCIe Function Level Reset (FLR) can be
>   issued to given VF
> - Both resets shall return all (except specific) Nvme registers of given
>   VF to their reset values (3.7.2)
>=20
> When VF is offline:
> - CR cannot be issued (only CSTS is defined, writes to CC are dropped),
>   so doesn=E2=80=99t need an explicit IF
> - FLR is allowed as it=E2=80=99s a part of the procedure to bring VF onli=
ne
>   (mentioned in 8.26.3)
> - At least FLR shall reset the registers for VF
>=20
> So I agree with the other Lukasz's suggestion. I would also clear
> intms/intmc/cc for both: VF and PF reset paths, regardless of the actual
> reset type.
>=20

Alright thanks - sounds good.

See v3.

--Pf6n6sJBzEH/piMb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKfNTYACgkQTeGvMW1P
DemOBgf+NLERYVKh5qyVMrwkUTtZynXivbI8j7RSiVhvzbLOIPkJqkWDPRJV2Dm/
6nTTCkFWA5K/cXJEVt2yDf1vhs9F3V9yAkC1sYmnHTHjgt6uuFTtV/qqPw3woyK/
1WXha9vTit40FiZ1c35gajH0UtLH8FV30vCeptW4LlkVuY+rcDHX1m8H0WMs84u8
2c7x4ik2A4q4IOywgiTHcwPGZ8XsZCX8lXdUJDXDype6VeqeWoxItri6jWWR/Vp+
vViqV60kuhGzBNGvYJZD76ZP+sKmp1AL30EzOiHVY9B1eKHXesFfvPSgx4oP26US
U45ieafDW7l7xugmUi5eFBMcnDdZNg==
=pAKO
-----END PGP SIGNATURE-----

--Pf6n6sJBzEH/piMb--

