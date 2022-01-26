Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8BD49C5D4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:08:38 +0100 (CET)
Received: from localhost ([::1]:53990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCeI9-0000WZ-GE
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:08:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nCe8x-0006il-Vr; Wed, 26 Jan 2022 03:59:08 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:35953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nCe8w-0005Kz-Hd; Wed, 26 Jan 2022 03:59:07 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5B31C3200F81;
 Wed, 26 Jan 2022 03:59:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 26 Jan 2022 03:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=+W5RqyBBezVUMYZRKcPPnLRPDm1UbX
 Z89gi+u1N55yc=; b=X1dsN3JgeZi4sjSBMJFr16UwrMc15D9WwAogKFJckgxAd7
 ULzJmJE/iD/JhkePI6OSIhuRDK+/fm901yrqaW1s43L9QDqJdtZbOndHJWFrgIyP
 t+K3ShreLqW1b0wF4FFU0VusOEI6jPDtcGB78XVtGAGZLbQjYUDLzQM/YH6zdeDI
 H9oJL+9SE6XNZXYtHclUdw8/dRAB8cW/qBV97re9uxqwv1HYuUnF6dqT31lFcajC
 BI//y/JzJ7Z+IVAWQkJbAhChwKQANbiSeUbLBz8Ws0d2QG8VBa80Rd0MMyDEibMq
 riQAOTWbxB4faMR6X6jvuG1u04/O0jr2dPpW+Nhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+W5RqyBBezVUMYZRK
 cPPnLRPDm1UbXZ89gi+u1N55yc=; b=Ucl/gQNPN1jvesbFDaLJKix1vOZepd7w4
 wozkm+cXFwnirQAngU0Wjgg5AFMtZK40vXj79NvM987MM9gLtZbTUWMh70K2no/a
 vyw5SaIGUAa3zst0NuKwLErVndTGgA2N30kkcNTWqZC0rkbNjN7engeyqrTdXAIS
 LP/wi4R1yuLyWasa7/0cEjQ3tq+UKngR+B7j/uvXLBmNvYePSjSKml1gEJl/Br8b
 nKRRp3No+BXiNAET+GiMHBRzkkJPkwyKGi1A6aEJ/HjTb+veZ40D8tWUWxel1Xf0
 wyeaymTHOjy5YXnMuUXHhPnbTmljRy4hE9cci7dBs9I8uNiNW0Kmg==
X-ME-Sender: <xms:Vg3xYfKP6woB--Jp5fpWG4IiQyZtPENjZqk6JtaxUjw4QXjMwT9NiA>
 <xme:Vg3xYTLSrSD3c0vxRSCRbUNMGkeL99EiR-1L96begtzYdeAMKVUHM0ncaUtMe1crR
 K50jvuyrbM7yjUstCo>
X-ME-Received: <xmr:Vg3xYXvDUy5zETA6oIZfwJ7Wp6Y-MVDYuQgMPx1jWo-Qah7AyoLPfcVzHABjyF1gWKSyYZ6sMzKRelwIls0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfedtgdduvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Vg3xYYYpkh9SAA0DrTqLRsl-wLbQUWEwmvsD-_bZdJZfd-bXbp-2Eg>
 <xmx:Vg3xYWbWVXo8KQZj98iVuteQTmZZnd7Um8v8HmaQX5WZcDjNhU0ISA>
 <xmx:Vg3xYcCJGtCCjzAYPkajILgGgmSeZMW6q6L0K8L_sieJMjuIgoQ9yg>
 <xmx:Vg3xYcOANlZMoxYGqgEpt5BEnseh4_uXIaWhDXIZ7yeT4eii5h7fMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jan 2022 03:59:01 -0500 (EST)
Date: Wed, 26 Jan 2022 09:58:59 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH for-7.0 0/4] hw/nvme: zoned random write area
Message-ID: <YfENU6BVuYkGYhnb@apples>
References: <20211125073735.248403-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GCAGPI3FNqtagD5i"
Content-Disposition: inline
In-Reply-To: <20211125073735.248403-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <k.jensen@samsung.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GCAGPI3FNqtagD5i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 25 08:37, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> This series adds support for a zoned random write area as standardized
> in TP 4076 ("Zoned Random Write Area").
>=20
> Klaus Jensen (4):
>   hw/nvme: add struct for zone management send
>   hw/nvme: add zone attribute get/set helpers
>   hw/nvme: add ozcs enum
>   hw/nvme: add support for zoned random write area
>=20
>  hw/nvme/ctrl.c       | 185 ++++++++++++++++++++++++++++++++++++-------
>  hw/nvme/ns.c         |  61 +++++++++++++-
>  hw/nvme/nvme.h       |  10 +++
>  hw/nvme/trace-events |   1 +
>  include/block/nvme.h |  43 +++++++++-
>  5 files changed, 271 insertions(+), 29 deletions(-)
>=20
> --=20
> 2.34.0
>=20

Bzzzzz ping :)

--GCAGPI3FNqtagD5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmHxDVEACgkQTeGvMW1P
Demt+Af/ajapdWUo8EfdPMfqb7tVRK9SGfC78YJeTz/xZkweb/mlo4z48adAJiJK
V1u1q+jA7k8dPOMBbkiHZZynHIM9zb4wvl5AKwWESjz+I+69sczyq2YuY+e+LUaw
WKJhug25uJcVeXdUH1nup0U4apekM040COQsTOsNeldu5YWRU1i6KAc9RNS4aQJJ
5vQ0/6V3S1/tOge8AaOwIDibzuRWG6YazQO4tifUay3sL1aawzlg31gYJB2WfIfb
vuVlLXzjURDn6wZASlJ7++ukRPPFPN0nGlU2kAfW3MgWxMrlHVHAstuPwdVv35VM
06d37G+LTLD389oNskLg4FQHK42dOg==
=L36s
-----END PGP SIGNATURE-----

--GCAGPI3FNqtagD5i--

