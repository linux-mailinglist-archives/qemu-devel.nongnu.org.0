Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9E3220FF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:57:52 +0100 (CET)
Received: from localhost ([::1]:45500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEIH9-00041S-9A
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEICl-00028S-6j; Mon, 22 Feb 2021 15:53:19 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:58073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEICi-00015Y-SX; Mon, 22 Feb 2021 15:53:18 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F5275C01AA;
 Mon, 22 Feb 2021 15:53:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 15:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=1CEsP9aYyrra2B3Z2WIQ8gZ2e1Z
 GYvQdYsicSXaC7Hk=; b=kkElTVQf+kHcxpiSnRPcLO+By9sUKpJsX9luvTLrZHe
 2d6dHQYY0p7y8bVMUK2qcIJP4JH1LAtQ0oMYsmzq64AyG72/2yCDl10AJhIO3SVe
 pwVRu96HSohlriY6LdcZskkGTJJdC6yt+nNPVe0JGqfoc15MV873A4X/5lkDhNT6
 nHot0VxMCRo78AGV2n1c46x72DcDnOgT3ixpneGUMGfwxEnwFdYbMrYL7fHNMPmp
 3VJ/cjcDDfPJnQU08MEoNd6xDAELAkVy8sPw21qaBKK3+FHMeEIZCjLFwb6/HS4n
 e2OXAUY4NetRA372BXNHeb15sVz5UkIYUREx+3o8xNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1CEsP9
 aYyrra2B3Z2WIQ8gZ2e1ZGYvQdYsicSXaC7Hk=; b=dxeXOunkWmmoN2C/xAbhn0
 buesFtGOMF1wG2I3gRnDLYOwVFki9HsuwQ80pUqdJyGQ+zDS0vdNWKa2+YlB4vrv
 uLw73FwkeabhrBqMPvqzyLMWl6RWuxQhVyZE2MC5zO1G8P2cjcKD4peRoqDeaq68
 fJK2EDL8Eu5wJOMQjJ1AlATs1K9ccoMzcFa/x3BcyiDazBtQc9r+xuUKO/wAq/gR
 X8ot/wecZJ2bTQeKhSm6/L1N+MQnAQPaYpKJjvcFkVrBcatTdmdyGOmHHA9K2wty
 BbcW4/+cgx1hMTR+h4PjOYmtk9eoF2pwVRXvb9SvoNm6oU+4STa3wtKzAuycLJSg
 ==
X-ME-Sender: <xms:uhk0YLu3e56CXc0xVUi0LVmvzZriZK_QtYAeV2GtYFzc4-PDLliSqA>
 <xme:uhk0YMdYGXReO3a0I5HnRnUJotU6PFMGwT-AjQMKhErgqrlHR9AoA1yM15TY5h1ej
 xKtGP__F7GfUmHjtSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uhk0YOzuYZUOU7rmZpNHXfF4SF8UaizIwLeKthJ0Z5aNHOws8bLSdw>
 <xmx:uhk0YKMuzsW_C3d7omc7tbM7eerPR1C-NGorVz6aPKv3dKejaVDYGQ>
 <xmx:uhk0YL8ROAuQRgYBC4WWZsBU3NtEEeMNR_TqwmwVWkrrZah5-M_Qog>
 <xmx:uxk0YHbqgOV0C2briZ9911okSJRnf4K-L0UjAViwp9tC7d8PaTC08A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C82BD1080064;
 Mon, 22 Feb 2021 15:53:13 -0500 (EST)
Date: Mon, 22 Feb 2021 21:53:12 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V2 0/6] hw/block/nvme: support namespace attachment
Message-ID: <YDQZuJgdArlgtab+@apples.localdomain>
References: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2ai+7x0bc0sc6mal"
Content-Disposition: inline
In-Reply-To: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2ai+7x0bc0sc6mal
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 01:09, Minwoo Im wrote:
> Hello,
>=20
> This series supports namespace attachment: attach and detach.  This is
> the second version series with a fix a bug on choosing a controller to
> attach for a namespace in the attach command handler.
>=20
> Since V1:
>   - Fix to take 'ctrl' which is given from the command rather than 'n'.
>     (Klaus)
>   - Add a [7/7] patch to support CNS 12h Identify command (Namespace
>     Attached Controller list).
>=20

Good stuff Minwoo!

For the lot,

Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--2ai+7x0bc0sc6mal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmA0GbYACgkQTeGvMW1P
Del7+gf/RC2euMnSSc2BI9yrWhSMrQORC9kylsqBGBODM0h2efOl3FlyqjPX+K9y
zjgtgb/k9P8PoKL27Y+G1Zuqp9VFQRPVIrC373TqD+gr1b81MXqGGf6Z0ylnK1W4
VRVGVr1xMU6OSicrLSWz9LuJjpRJL5poPOeagGIQAtY4OibgJEBxnxm2k5BWOZka
qb/g5kqC82mqBvLYskyKfWVfjXnHJE0RWKx5ZkeE6dbrUsZkJe8sn71OKECIibr1
rbMNfehyiiLVTAGVtsskMgCsuZ819U1OvR907fOYBk3rbzhc3AaeSL6A/cfhaaz2
9v815T2rdXavTfLsshzenwUDMsU1Tw==
=g06h
-----END PGP SIGNATURE-----

--2ai+7x0bc0sc6mal--

