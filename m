Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2589E3F74A0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:58:01 +0200 (CEST)
Received: from localhost ([::1]:55520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIrXb-0008Dz-Ic
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIrTJ-00055G-G2; Wed, 25 Aug 2021 07:53:33 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:38509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIrTH-000098-G4; Wed, 25 Aug 2021 07:53:33 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 59A353200AEA;
 Wed, 25 Aug 2021 07:53:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 25 Aug 2021 07:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=EJm988SYFdU7OrrAE0/4fp8OyhJ
 el03zvBNXIJzVi7M=; b=PSmoJNOv7jaTxTN2/l/Vp2oEdoB7Z3ojVxdYTf1MCHK
 jOPWGkYJf4CsEKZnQjUHO3PThTuMMNAUZUwJkyCtd7S7Fk/lHK5VcAz6NjMH8zss
 p/HTDvO3tTdSzFw1Y3rmQdzC1iVSO9Md7Q6gNH09iCbsM19nxUN1tCnoX5xbn8Ib
 R8kv+mFzv55EsHtCDZktJ3JDCj9klqO10BKQpIrPS0VavouLZhKo+74+jkFWjpIh
 gD5xX+gVhlDOBg8qU3fi1VP5IVxdObAIwY1vMPDsRNW3nmWF7ob2d4A8APnZzJan
 AR2s0JNKVH/wqJOO5hzVtCPTcA0ZIKvBU9yiRxolFqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EJm988
 SYFdU7OrrAE0/4fp8OyhJel03zvBNXIJzVi7M=; b=cbISKXQZh/oy1kGUpA3xB+
 89ntxxKScELHp3A0s8awcou+EoiTKA93ZYEWdreqfugaAhx/a/EUc+TfMXn3J06/
 58uGW1xmRHSIdHiBi9CD72vfoq3CCFEVvhOlrf21TnuarisuJ7pSNST/+nIUGoe4
 RKTPQs5qF1fn0CSKwSF7PgijnADPbOtUc2VewxwGx7t0N0rrZtuQnDSJjltPPopo
 1sZdrIGr996QnA/dh0BeG+2FaRAzdulzhds4HJ5MwmHeetvvLLlPa6sGS0E7cx0f
 9wsuXseiFoPDHp7TwktXfjtdrReAONa05NnHpr0q1GOPn1eEqIpDPE+UJZ0P2TnQ
 ==
X-ME-Sender: <xms:NS8mYcxQS5n49jafhSJtjFIf2i6GZYs6ROepFcJFgHsR5kjBgjaJwQ>
 <xme:NS8mYQTLrpslnFfdqUHE7w2XxdIIosd5y0sy2SM6fd-PrDFZrZ0-OMOeF86xZyynN
 H7VO0OnNqehmXA-ncQ>
X-ME-Received: <xmr:NS8mYeVg4uqO9zGosATQJmtfM6y-f-Lip0Re4Mzj9KRCaJK6adzihEwcnXt2Vlbeiai_oXt9qqIPyvvoF8PHT0vZEOzdtxDHaVi_6Fl9i3bwksoiyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtledggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:NS8mYahrcJPGvof6xwaHXZRFSweoVSZ1bffaGWmczSmrXQavr8TrYw>
 <xmx:NS8mYeCKuvJaIZiK-tbksFvXI7-b8FuJXe5S4g_42Q9rEnH9v6pGmQ>
 <xmx:NS8mYbL9mLm8LR2V22ZAe3OaucfZP0U1kqY-HvXe10OTKtKlthcQNw>
 <xmx:Ni8mYUAeMVVLCgbsVrbceb_4QRUymcdTIUL7Hx2wzUgqMAkRPHlQoQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Aug 2021 07:53:24 -0400 (EDT)
Date: Wed, 25 Aug 2021 13:53:22 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/9] util/vfio-helpers: Remove unreachable code in
 qemu_vfio_dma_map()
Message-ID: <YSYvMiYLE0wpgSSY@apples.localdomain>
References: <20210824141142.1165291-1-philmd@redhat.com>
 <20210824141142.1165291-6-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3W+JVKLuc52rwbM/"
Content-Disposition: inline
In-Reply-To: <20210824141142.1165291-6-philmd@redhat.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3W+JVKLuc52rwbM/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 24 16:11, Philippe Mathieu-Daud=C3=A9 wrote:
> qemu_vfio_add_mapping() returns a pointer to an indexed entry
> in pre-allocated QEMUVFIOState::mappings[], thus can not be NULL.
> Remove the pointless check.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  util/vfio-helpers.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index d956866b4e9..e7909222cfd 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -751,10 +751,6 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, =
size_t size,
>              }
> =20
>              mapping =3D qemu_vfio_add_mapping(s, host, size, index + 1, =
iova0);
> -            if (!mapping) {
> -                ret =3D -ENOMEM;
> -                goto out;
> -            }
>              assert(qemu_vfio_verify_mappings(s));
>              ret =3D qemu_vfio_do_mapping(s, host, size, iova0);
>              if (ret) {
> --=20
> 2.31.1
>=20
>=20

This looks OK.

But maybe it would be prudent to assert that index is within bounds of
s->mappings in qemu_vfio_add_mapping? E.g.,

   assert(index >=3D 0 && index < s->nr_mappings + 1);

--3W+JVKLuc52rwbM/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEmLzEACgkQTeGvMW1P
DemW4Af7BAFbnmuRcIbgMzqh4na1ONEaNF0+JxbU9IpaqhJ1uKcxIFNHjrDt4jK+
ReS+EohXRyvixBcZ+Uu7Oz2PxNP6sfxg4fjQE/SJBxMn8jk0yDSmj49p5iMsJs5I
Y3xPVLHlcvXoG6fgV4esTLncCeVZI1NlR7mbBHSU4WdYWj/+q0tArb4eJ9zXtec0
ZnDfxO9KcXlVqzQGKgAQFPirdDuSA3chF0bN0rz+PNe8YblK3lsA7K8zj1nZzPme
PPxrJ7SwgwNrIp32wehrSF9aOd6IdoRdJYEeAgirdBbSj/aC3FQhrTYMUxwbn9LV
BNGtYhxTCerQCWNiSjLJi41B3bd+Qw==
=RffN
-----END PGP SIGNATURE-----

--3W+JVKLuc52rwbM/--

