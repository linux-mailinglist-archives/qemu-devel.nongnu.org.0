Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0682FAB79
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 21:31:14 +0100 (CET)
Received: from localhost ([::1]:34702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1bB3-0000zs-KM
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 15:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1b5e-0007sv-Re; Mon, 18 Jan 2021 15:25:30 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1b5c-000674-9P; Mon, 18 Jan 2021 15:25:30 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1073E5C01F6;
 Mon, 18 Jan 2021 15:25:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 15:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=i9sTf2xWdhwlMou1xdRRJQ5byPP
 9OcLwXFagGPNT9d8=; b=3tyLE0+IGJ42JwqPGYaPKB3C2sZAVZ6DraZ0vA0vNzj
 EJIfB3VwYQYEyvG+ChQ3v5Zzf998fDnaJ0/+QpWyURHBBlODijG4EiiejopwgSMq
 ja8pei9A2wm9As/83KkhhOGacIGL87GH2Ms5+jPkkVgBF4nNGoKiIYv+9GpsVRwb
 yO80c0OB5/V55cez8FJ3aCP7AoL9bW2mswavAOP1JgGs9IJEZ/bogVIcE6BgDHfZ
 DS3kSb3tB9D/Zhsg0jSbEnEkZZZFyz6Tb5qoX5ygYYx1lIKDYbZt2WGer4gHiPDm
 2BxXRKhkStQQM5LFs529DGsjQ3afHQ+0i3V5ljng0mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=i9sTf2
 xWdhwlMou1xdRRJQ5byPP9OcLwXFagGPNT9d8=; b=U2h4RxW497vpDNvezMnW3d
 /PagKoeE+z0/z1TRPq9QIpgRvj2CsYaHScPnPFrNpFc+u4beVacx8a9BEu5t2VWF
 g+1Y1QDuDJnFsAfWoWFlyUX4+tggewuiTjfg7wGJLntb63sNT9tVZVRySNSDgQG6
 zko778y55IYIS4E7LJjmtgoHj4zQTbpehAPutTagIlToHhgtjm8L6wPg/dux5mLV
 6riU7GjLSMPgMeC2N2Nm8mL6sfUrkiepunpgltEZTfKB5Rq0ljsbGnzZvq9+3aYW
 pAVrwQVTyZ4cYUoVZHXsw5S7cJvl9F18xxyfQbPCsctDIualydVQVYX6B8ZD6RGQ
 ==
X-ME-Sender: <xms:tu4FYJWZ_bYLZPIQaDG0oC3fpuxZPrLJ9sM7otBby4sBSAgJ71sihQ>
 <xme:tu4FYJleSNUNThITjSclUcXaUMN-n7xuotKX6X3H2cZQ_kKsGVhRLBl0jXdxMY1oJ
 lmySq9bUS6Vp0UV0mY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddufeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:tu4FYFYVOq8bNgnqMul0-jmMCzu3Di7ITSZHXtc0onnkBhX6ztMi_w>
 <xmx:tu4FYMXFEU9B56usw0FnkmmOsVSmdfUrSqVvwIl1QaS9SjwQPJ8lQw>
 <xmx:tu4FYDn3HwbqksmjY1MJN2hVLw-KytCcbVhHoNHCNqQUiC1YRcByjA>
 <xmx:t-4FYMBkRg5tUfL6ir_1NZjdr7SR5vO-K8Tp0A6B3IV8VtGlnWRyiQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7577C24005B;
 Mon, 18 Jan 2021 15:25:25 -0500 (EST)
Date: Mon, 18 Jan 2021 21:25:23 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V2 10/11] hw/block/nvme: add NMIC enum value for
 Identify Namespace
Message-ID: <YAXusxmM1mUN4D7w@apples.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <20210117145341.23310-11-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PUZND8nT4CHtFDw5"
Content-Disposition: inline
In-Reply-To: <20210117145341.23310-11-minwoo.im.dev@gmail.com>
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PUZND8nT4CHtFDw5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 17 23:53, Minwoo Im wrote:
> Added Namespace Multi-path I/O and Namespace Sharing Capabilities (NMIC)
> field to support shared namespace from controller(s).
>=20
> This field is in Identify Namespace data structure in [30].
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  include/block/nvme.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index e83ec1e124c6..dd7b5ba9ef4c 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -1110,6 +1110,10 @@ enum NvmeNsIdentifierType {
>      NVME_NIDT_CSI               =3D 0x04,
>  };
> =20
> +enum NvmeNsNmic {
> +    NVME_NMIC_NS_SHARED         =3D 1 << 0,
> +};
> +

Let's keep convention (or should be convention...) of using NvmeIdNs
prefix for identify data structure fields on the enum.

--PUZND8nT4CHtFDw5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAF7rIACgkQTeGvMW1P
DenI2Qf9HBxMckTTquRCD6KCwOsJhQZk3BOb8ZMgM/bSw/pN0hp2nWfNFu9LAZJM
HyPFdSXL7jstbtkY3ClbUeFa6pxD+SGtu09Od0uhyG3MdY+6hIai/r3U5P+UNtTV
iBarBOszFhVFiwA5zD257MGG9zx4UDGo43yRTd1gfgnXTqWYvLtfAJLCORM5fsXF
BVx67Lv7XqizEl9nqYiptzVquMtlhMzzwn7AqbddRkmRQbfzVJNICxlmuMKQ1Odr
E48dR3/LR5g94Dzv86QXAy72ndkWOuXawW446No/nN4NLaI6u+vgdvDKJLR7VQCL
y2DE3fQzz/bMe2uQOOLutBOUv4tlJw==
=uECi
-----END PGP SIGNATURE-----

--PUZND8nT4CHtFDw5--

