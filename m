Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6752D2592
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:18:14 +0100 (CET)
Received: from localhost ([::1]:57428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYCK-0001Ri-Pf
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:18:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmY60-0007Ed-0o; Tue, 08 Dec 2020 03:11:40 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:33071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmY5v-0007CN-Cf; Tue, 08 Dec 2020 03:11:39 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 918FC2C9;
 Tue,  8 Dec 2020 03:11:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 08 Dec 2020 03:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=jvPj3hK/hLnNUn04EftjTq/UZKP
 moQ7jU5+VKGYvXKg=; b=b0gkJCy2tt46EuWnSZTYawPgwPM0MR8pGKDfawwe9xV
 5LrWt5LQCkDQhV1TxtuLgwkBbcQLn9V6i7Pc+ab8VyQWZkfQ4uypoB4uuUfk0yQQ
 DreOyfaJvEio5b3la23N7dF3/0TSvOWEJlMMHXyLJCO8GKSSUAQHVSJj+WO+XelS
 Bch64CY4qiUtaGUCE7MNlRbgRB9knL2mbuiVIy7akyTJmtNOxsZnfE0xnTvyARFd
 ReurL1eby/s3vEIeHGBfHrXUCavc+g09xMYhbL0syr2ilEKTZwNN7oIoT5YyeWVf
 hBNGJIEnfMUMWkcT/SI3Ue7WEpsjM/yMWGlT+gpmieQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jvPj3h
 K/hLnNUn04EftjTq/UZKPmoQ7jU5+VKGYvXKg=; b=B+JJGi6sNNIi6hwViHMpdg
 riKgO2qCcWrb4Z+4IiO2qlfzzBLAyZOc5c/Yb84k2lOKsDATFL2fvB2UujPwmMfE
 r8d3tjAWyuNQw9WYoNh9nlHliuR3Hp4o1nKfjkE+RyCdIw5gy+HXgTabG5uUC1ID
 Piv7+I14H6dNH119iCUdB86RMWcJW4RJVbVvZZVyi3q3DWwbzheAej51KILBoogU
 KC+jAtD8v59gIMLMshgmKWjIKYdnTRhJFv5HVbMkHCvmcpMq5pRoIvYdwYJ5bVa/
 nYFQ3cyU1hkX7p7aAUSFm8hJ77RSTbXdb2GT3jdiuI+cQvDypaCqJiAi5cr1hotw
 ==
X-ME-Sender: <xms:LTXPX7whDZAVYG-0wm6Av0p5ynFUMkhpTcsAgtFJ7hvUEV3nK6iQpg>
 <xme:LTXPXzRhLIv_VrLjqjXvm52eDxjRjV-OELCqa8B7y_-xxg9x1FSFC2K3dLwwOywoJ
 5LVRiyd4VQuHPIbRcY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejhedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:LTXPX1VzisxAR_uIoOWRKl4RUg3gWJcIF2ks9pGx-zJpbSSqRVgfvw>
 <xmx:LTXPX1jl0MfSGXKKZO5SjJoyC6ITzIa5PWdUftUt-rEXY5dTgICWHA>
 <xmx:LTXPX9B6YrseAw4xES7PaQtunw_sNThJ3vbCL6qywdlOgLmHaKhZlg>
 <xmx:LjXPX_1tNiIWmLZVJO9MJhhrMYZGqSweiBk18KORqAR2l9k8D7LaBg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 299EF108005B;
 Tue,  8 Dec 2020 03:11:23 -0500 (EST)
Date: Tue, 8 Dec 2020 09:11:20 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v2] hw/block/nvme: add compare command
Message-ID: <X881KPFtT/Ibecdq@apples.localdomain>
References: <20201126185605.539311-1-its@irrelevant.dk>
 <CAA7jztcYwDm3-T4mhbWYOsPn+5-ko6j4Qd2ge7DVLgAf7GfKAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GdL32WNeYiwNuqZY"
Content-Disposition: inline
In-Reply-To: <CAA7jztcYwDm3-T4mhbWYOsPn+5-ko6j4Qd2ge7DVLgAf7GfKAw@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GdL32WNeYiwNuqZY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 27 07:21, Minwoo Im wrote:
> Hello,
>=20
> On Fri, Nov 27, 2020 at 3:56 AM Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> >
> > Add the Compare command.
> >
> > This implementation uses a bounce buffer to read in the data from
> > storage and then compare with the host supplied buffer.
> >
> > Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > [k.jensen: rebased]
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
>=20
> Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
>=20

Thanks, applied to nvme-next.

--GdL32WNeYiwNuqZY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/PNSEACgkQTeGvMW1P
DelSlggAtkVE8UEi39HVEmxuF3gZp/qNpmradI2w+905aLg6Zs/oRXILVs3SVQDj
TkK3QRbtZ+CtSGV0AYwtJ+ieaEKtNk0hAHLrIxzFVvCyG7+as4jGWxcz74fbR5YS
jHLX+rnEU/yZOAVyGcv3LB07Fi0uskgzcpEiptQg7QrtCOYFOmWq4aa5dpVYM5ms
EpXtJZatzBGHAYEK5ZnuXIWRpUgJckFOtDRj0K+Y62RaXENqxwyVF1+fTs891iXA
7huXsjlfS2GKPuLUQpbXyLH/J3ny5/nCDRsKvFshNP2o//ulDSnSFbAsjBS2Epxy
/tUQGuqwztQD99pY0RTuvA69WCGyEQ==
=zIu2
-----END PGP SIGNATURE-----

--GdL32WNeYiwNuqZY--

