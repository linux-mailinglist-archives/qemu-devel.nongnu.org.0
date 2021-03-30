Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827BF34F0EF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 20:23:08 +0200 (CEST)
Received: from localhost ([::1]:39846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRJ19-00073X-B7
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 14:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lRIoy-0002vK-Po; Tue, 30 Mar 2021 14:10:34 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lRIoq-0000Y8-8H; Tue, 30 Mar 2021 14:10:32 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D47A5C00AA;
 Tue, 30 Mar 2021 14:10:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 30 Mar 2021 14:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=i/CyCpl87IBV7atvYad4cSYLSGO
 WmymNb2zfXHd4FLs=; b=KqAurFb9J3sqNMrZ7U8+x0tCTDKkSwz26n80G1Ao8x9
 wgJpSGXSJLJSkpn3gMCRLQ791krt9+IEFdyXt3vw9kDrjqO9sH5elraUjZHJlIOg
 SDc8nqQMbl0JskgMehbyp5si77yycFiJ4P0gJG7MWPUmPUK4S4bFK9w5o3A8QZQn
 Xi0iEBZFSPeFKswZDYjcrhkNlzYrg3rhCwQbCVCzGUP3ls9SKKHBJJ4+t0ksxOn+
 NGOVJVg5Bn2+zD1sCVgNuqEIHGYhyKjvx4H6+DalUIeN1Erz8AYSEK5XseHn9GGr
 1xP32wKpBDEnXa7g4b2mvVRJ4cLLfXVAFj8mLVjqOdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=i/CyCp
 l87IBV7atvYad4cSYLSGOWmymNb2zfXHd4FLs=; b=Km/TlgJTCWi1QkayyjezZ8
 /PNqZ9ypHsPez7zztWKFe7Cr7NFn+QbhiZlNybB0vIeiKSj9w3h0svFDvIUay+UO
 LcXewg49Gs0tvDScxLP/O1oG+MtsStg7dx0RzPTqseDih+baRmad4EiAWzUAf6Wy
 3oK+Ee8CvkJqGzlo3C8MRbRgLPIZCjWjZTb0/QZa1mNCv3ve0boR5djX8Z6HNX12
 xpPDt5Z6xUXJg1db1kHg4T8Bp+b9KmUnvI8hXPBTmKrihpmk232y1e5BdKbOyu+q
 dMdYxrsMJn0VKPb9UkZSdoMMxUbRufApPLZUjwUyBKpN8LeppTm0mFNvzdmVP7dA
 ==
X-ME-Sender: <xms:i2ljYFGep2Y8kQSMFnZ4BTUU5S1GfZGoOWITORAtHXqsiDbz8ENVWA>
 <xme:i2ljYMWZafoFJb_7xG-9bCmkceyzLmKxqRQzh9QeSaEPsOaJdUuHFpHELwAOizIiP
 Qd3dlOL2zwHMvp4bt8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:i2ljYAj4Ln8LKskQjKzE84pzyhQoX9o2zjdxIqsi5h7Xke_IBKBYKQ>
 <xmx:i2ljYNTAW5L4f6TpSTRpXF1AkR2F2T478SXBnKdsm20bV9aQWwZJnA>
 <xmx:i2ljYDF_ah24L03XgQEDKnBf7EhadCjO60R87hYMv0Lml-ihI_smHQ>
 <xmx:jGljYLytVA6XyiBPebyjMTfH-ff-UZykG1fr_6YYQpEZeA5es0zCWw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 129AC24005E;
 Tue, 30 Mar 2021 14:10:17 -0400 (EDT)
Date: Tue, 30 Mar 2021 20:10:15 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH] nvme: expose 'bootindex' property
Message-ID: <YGNph1nPr/fY00Nq@apples.localdomain>
References: <20210322082444.12916-1-j@getutm.app>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dwLDhkOZHSHKCmhe"
Content-Disposition: inline
In-Reply-To: <20210322082444.12916-1-j@getutm.app>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, "open list:nvme" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dwLDhkOZHSHKCmhe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 22 01:24, Joelle van Dyne wrote:
> The check for `n->namespace.blkconf.blk` always fails because
> this is in the initialization function.
>=20
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  hw/block/nvme.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 6842b01ab5..42605fc55d 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -6330,11 +6330,9 @@ static void nvme_instance_init(Object *obj)
>  {
>      NvmeCtrl *n =3D NVME(obj);
> =20
> -    if (n->namespace.blkconf.blk) {
> -        device_add_bootindex_property(obj, &n->namespace.blkconf.bootind=
ex,
> -                                      "bootindex", "/namespace@1,0",
> -                                      DEVICE(obj));
> -    }
> +    device_add_bootindex_property(obj, &n->namespace.blkconf.bootindex,
> +                                  "bootindex", "/namespace@1,0",
> +                                  DEVICE(obj));
> =20
>      object_property_add(obj, "smart_critical_warning", "uint8",
>                          nvme_get_smart_warning,
> --=20
> 2.28.0
>=20

Applied on nvme-fixes, thanks!

--dwLDhkOZHSHKCmhe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBjaYYACgkQTeGvMW1P
Dem20gf+I2XN41k94UNrX1q0Df8WQeUKUvfeX3aqmb0tHQ+q4eI89pD5z8poZ/h2
jH1GuKsyw+rZjWHFgnAmV+a4as39/sQ7A2Qnsm1lNtpRTwsAb9UZZCeCqJXKLTAt
SzjRmvggpb/Cw16GE/aHHAzw/NHV/R2SvXuLADhf+7Ou2Wibo4rfFtCokg3PzgEO
Xx61hF4YWQBvYtukBRfcxFyTudsVi7JA7Oday1ziC2LPkvsakPLnZJuXPDpanW2u
BK+hQJfM4+wlfjpAMyrsrET/fX+lH0A01A5jwojTMiRMpLFpmVPIBQahlFO7fP4J
SQByw/z5mpkOP8941w0H0x0/aZkf8w==
=i2sZ
-----END PGP SIGNATURE-----

--dwLDhkOZHSHKCmhe--

