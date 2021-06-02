Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E425C3986C6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:44:34 +0200 (CEST)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOMT-00024F-Vd
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haozhong@zhan9.net>)
 id 1loOLQ-0000fU-FT
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:43:30 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haozhong@zhan9.net>)
 id 1loOLO-0001kv-C4
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:43:28 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id C95045C014E;
 Wed,  2 Jun 2021 06:43:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 02 Jun 2021 06:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhan9.net; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=CbuqNuqVHiNHLHPDuhl6dpVpjks
 JJugBpT5cJG8/IY4=; b=L3Q9F0hkhfqAlbEv6ShufieEKALrh1OOOIcbHJ2EGlO
 P8w5TcbmD5CryUYOHv8TTHuEwjB8RLwDhoPErqDMoqfRtrb28gIf3S+DBvlC5SfA
 wsfDA41iBTU3k471LbLtz4p2Sfe3IGBRrpxowbo4QT9duAsqy7rbgIiJG3rAiAu6
 lZma36p1OIIhbHwiSqf9OHw5/NAyYW0j9IS9v8m674kURCt9vkU7tVgqhKh2eeFX
 d2VtNympzPcHmQQBAxNZ2+isjfOXKTchRnDmD02WRQz50LXG0kmYHRSFLso5dE5J
 mWns9Fc89AME6gY4NzjtXfDA2bZXPJBoXuHdTuUqq/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CbuqNu
 qVHiNHLHPDuhl6dpVpjksJJugBpT5cJG8/IY4=; b=e/lKuqNH5Hcs6vrtqOha1J
 G350iHX21aqc0Trthlr0v5p9mhkXDAI7csOXzGqhcHXU6UxUFcVESvYQALTJBHGU
 tpVB2F47s2Xxc/m7V1nBy2rWixZhWvjBCQ/wdjnD+ofvPr17OwZ8mQAcn72ih7js
 v4IFNV4cJj6ZW/h0XeB4+earFoEVV0YpnvNY7jZcNr8LQxJmxiZA6dMlZ2DdWY/a
 Tfl9QtHPxO+SHbDzLkMvxgrxCMeKfHaGILpg6yAFT58c7nblw1HO+/tNIoVH1yPs
 v+tj07qp0szD0/bT+QZGaKcJ6sIq7Ppg5rrEHeALYl7Xp4qwiXgPkZfezD1FaEcg
 ==
X-ME-Sender: <xms:ymC3YLI2_b6IF71OexqXro7wotnwffrIIECLMEDjfwx1gmvx4N1vfA>
 <xme:ymC3YPJRAuFQxBNpcKv8G0FEVp90w0Nr2H2ss9mdmFmPETDkMxILjpdUA5vuI5V3t
 dcmOhwMZrqxcUBDWYA>
X-ME-Received: <xmr:ymC3YDuoFEKPuPY9Y9EQtaCQ8VmmMtl8mHFRNhnvg1Vs31lP_EIqW1G_mQGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeljedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefjrghoiihh
 ohhnghcukghhrghnghcuoehhrghoiihhohhnghesiihhrghnledrnhgvtheqnecuggftrf
 grthhtvghrnhepfeelleefheffveetudegveejudeitdfffedthfdtffetheegieevffef
 udejuddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 ephhgrohiihhhonhhgseiihhgrnhelrdhnvght
X-ME-Proxy: <xmx:ymC3YEYPODd2psVzfGvTy9G6yRgwOtt876F0Z0u4-RMFIa_-6myCVg>
 <xmx:ymC3YCYpY-W4VObnDs85TKIIzQsAnF3we4Fx3eda8FkTDAteHRJ5Aw>
 <xmx:ymC3YIBFHyaMyUzoWiBrrf0qK_VGZdoq0VyleoTq7PG1tCOV_ULs2A>
 <xmx:y2C3YBn1n3GvvT0yLxCmvPskoLYGEf8Tw4uwEDNnKjYLzDmIENMJpg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Jun 2021 06:43:21 -0400 (EDT)
Date: Wed, 2 Jun 2021 18:43:16 +0800
From: Haozhong Zhang <haozhong@zhan9.net>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] xio3130_downstream: Set the maximum link width and speed
Message-ID: <20210602104316.5wau5oe2zhvtq3cq@HZ-MBP-HOME.local>
References: <20210527170630.43458-1-haozhong@zhan9.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="smdfz3ogeistrdzh"
Content-Disposition: inline
In-Reply-To: <20210527170630.43458-1-haozhong@zhan9.net>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=haozhong@zhan9.net;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, Haozhong Zhang <zhanghaozhong@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--smdfz3ogeistrdzh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/28/21 01:06, Haozhong Zhang wrote:
> The current implementation leaves 0 in the maximum link width (MLW)
> and speed (MLS) fields of the PCI_EXP_LNKCAP register of a xio3130
> downstream port device. As a consequence, when that downstream port
> negotiates the link width and speed with its downstream device, 0 will
> be used and filled in the MLW and MLS fields of the PCI_EXP_LNKSTA
> register of that downstream port.
>=20
> Normally, such 0 MLS and MLW in PCI_EXP_LNKSTA register only make the
> guest lspci output looks weird (like "speed unknown" and "x0 width").
> However, it also fails the hot-plug of device to the xio3130
> downstream port. The guest Linux kernel complains:
>=20
>     pcieport 0000:01:00.0: pciehp: Slot(0): Cannot train link: status 0x2=
000
>=20
> because the pciehp_hpc driver expects a read of valid (non-zero) MLW
> from PCI_EXP_LNKSTA register of that downstream port.
>=20
> This patch addresses the above issue by setting MLW and MLS in
> PCI_EXP_LNKCAP of the xio3130 downstream port to values defined in its
> data manual, i.e., x1 and 2.5 GT respectively.
>=20
> Signed-off-by: Haozhong Zhang <zhanghaozhong@bytedance.com>
> ---
>  hw/pci-bridge/xio3130_downstream.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_d=
ownstream.c
> index 04aae72cd6..fbf9868ad7 100644
> --- a/hw/pci-bridge/xio3130_downstream.c
> +++ b/hw/pci-bridge/xio3130_downstream.c
> @@ -87,6 +87,13 @@ static void xio3130_downstream_realize(PCIDevice *d, E=
rror **errp)
>          goto err_bridge;
>      }
> =20
> +    /*
> +     * Following two fields must be set before calling pcie_cap_init() w=
hich
> +     * will fill them to MLS and MLW of PCI_EXP_LNKCAP register.
> +     */
> +    s->speed =3D QEMU_PCI_EXP_LNK_2_5GT;
> +    s->width =3D QEMU_PCI_EXP_LNK_X1;
> +
>      rc =3D pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_DOWNSTREAM,
>                         p->port, errp);
>      if (rc < 0) {
> --=20
> 2.31.1
>=20
>

Forgot to cc Marcel



--smdfz3ogeistrdzh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEg0qRRYSsK3+7NmVVJmP5Ya+80fwFAmC3YK4ACgkQJmP5Ya+8
0fzftw/+NPro7eEavmbgQfqKp33cbmtNRGKEDcvrVX1+8qmu0ZwKN29K3u0jtCuH
9uB2Etw6zmbC9xEXVSKanwT4p0nLVsg0/bNquPBVBoQ1lFLDkjtpCWdL0hfBSq8U
9A8bpsomQRuR34z8oWwJisiUGwCChPVy1iLRO+vKttQKHOWDJPKrY/xYeSG30Zm4
FvouDCXTHUO6LPaelvnD98uZ4s3yImr9eUGR3eiu8Sy3W16H6YHDaIMzmDf/AQUA
QXsx5/aN2ulK2wD5Mki8F10JTDG+IkbVPulHGvrOjZxwk7twbD9A6k+79YYtCUtu
7zrNnolrgWMrIF87Epq2wA5v5jMFr1N48yY5RcH+0CJdc0G+xqf6+bqqA/P7VKYO
96/d/5ATCA6e6/Xm08wh1Lhhe0stHup2MoPISfQ6Ny13WMbHg9y6X/cHbdMruTVi
/dlbomy69I7jnVrv2bP8kRsOAGSVR6wNyTs/KPqugJgvTXIIafDci81Rn7QGq/gt
DyYL4BRzsi76Xyq/dn7opFtMECkeIB5N07zkXcM8NYVBVjAoO+RXuyhamQgcnzLg
H5QUclFAvEyizb95LipmLMeEOzWSbuZ6mBIcniLbOGDYD2gRVdcEdSv2utCIj7Xw
M18czfh6p0tvqHdEB7Ygirguzljo6ZlbWMLEjaJt/aMJFcAhGXk=
=4Mhd
-----END PGP SIGNATURE-----

--smdfz3ogeistrdzh--

