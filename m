Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3F44B2030
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 09:30:08 +0100 (CET)
Received: from localhost ([::1]:56460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIRJf-0004Dl-GR
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 03:30:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nIQm6-0002MO-3R; Fri, 11 Feb 2022 02:55:26 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:37707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nIQm4-0002K3-BB; Fri, 11 Feb 2022 02:55:25 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 350F35C019D;
 Fri, 11 Feb 2022 02:55:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 11 Feb 2022 02:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=6OBwQbzypO50fEQPOCGv8oZr4penEr
 A52uZZethJKS0=; b=MnPcT/KOotland/mqiU4ngyyMM7I4tM75Sp2kb3Wl+NciG
 fa3i+h6tecjYCvxGMvtAhWmd5PkmDBfD1EFbGyLEaFsMHrdgx4BEq+9JdZQQklZd
 cm6pNPKQEidNA6iC6IHW93eq4jNiWaOlLKaFCwCDn6Ma0PigqzTIvugeH7UKq9s8
 FTdHTQKJ2tt+cOQ3Ev2TwNyX4csp3t7xwCfqP3sHxgyFRA0HxbyG62xTCYo/lual
 gn+r7y+ubEAKk2FtVJ7HAlglz/h6e9I5VnaUByELtcUtH2iWTnlz2dn0zWuihOQL
 1+b9RRAg9e6sD2E9gr1V2OC8nZZVAh3D1O2vkS/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6OBwQbzypO50fEQPO
 CGv8oZr4penErA52uZZethJKS0=; b=U1vVGiVuExPCuEJdxSXL4d7XMQ7YCGVEN
 B6gu1K7C9qktO0ByNswcU+VG04vvqmF2BvNIytSziT2YEgVienEMRdgFnziI2HVk
 R7U9+nidybq0rQsxeDp/kT9nj2Frqd5zFez/JqKebS5MfWv2Cl5uy0z1xIY2yJSs
 sC77GbHi3dBA7p66dkeGOAVKsi9YgsibylKm1VsoI6bEE+s/2v/nQNrcG2cKT4TK
 y+NF1LT63tNtanPxrd6EJTo6bg+zkETl4yoxcnI9brBdco806CK48kEzjvnP1iNl
 C3xK6rropSMHRUBpo5Afv8W44QLpPpj+AM/idYy6gYrUfT2GC5ZmQ==
X-ME-Sender: <xms:axYGYmaQVrpFRJR-_Ub6UcktaJ9gBUOQzqz-KyO5WEgM26lKYh440g>
 <xme:axYGYpY7lfahd6JjTvyeHJHNnKeM_3qaG9lDrDAaScnSjbV6V6ZHP0C0bc22GvUH-
 Dj4OTjdQiRR6Pxfw7k>
X-ME-Received: <xmr:axYGYg97uwomxmSN0M999C2mSy5wHD8fCUsmZVZ0Aa7rIvgJI6I7Bq9EhOeY0OsvoTOGcHQTKxFc9Ep9Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedvgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:axYGYopLGrsAtwD_6K2p9Crh-6IxyteRIXOjPSciRrkyPzG_PEpOhA>
 <xmx:axYGYhrqi9X6h3-G8oxOzb4hDX5UNwksSVhRSpiezSBq0FaL1GUzwg>
 <xmx:axYGYmSlxH2OeoIXEuB7E1YlJ7G4WpP1AlaptgtesyOnoW-sgFGnrg>
 <xmx:axYGYiktKW2crPLf715M24sRU3WiI3xLoRjtcSGbIzVcW9cbI1u3_A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 02:55:21 -0500 (EST)
Date: Fri, 11 Feb 2022 08:55:20 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v4 10/15] hw/nvme: Remove reg_size variable and update
 BAR0 size calculation
Message-ID: <YgYWaAkOfBuZa7nS@apples>
References: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
 <20220126171120.2939152-11-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Get4+DgDvqXD53HA"
Content-Disposition: inline
In-Reply-To: <20220126171120.2939152-11-lukasz.maniak@linux.intel.com>
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Get4+DgDvqXD53HA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 26 18:11, Lukasz Maniak wrote:
> From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
>=20
> The n->reg_size parameter unnecessarily splits the BAR0 size calculation
> in two phases; removed to simplify the code.
>=20
> With all the calculations done in one place, it seems the pow2ceil,
> applied originally to reg_size, is unnecessary. The rounding should
> happen as the last step, when BAR size includes Nvme registers, queue
> registers, and MSIX-related space.
>=20
> Finally, the size of the mmio memory region is extended to cover the 1st
> 4KiB padding (see the map below). Access to this range is handled as
> interaction with a non-existing queue and generates an error trace, so
> actually nothing changes, while the reg_size variable is no longer needed.
>=20
>     --------------------
>     |      BAR0        |
>     --------------------
>     [Nvme Registers    ]
>     [Queues            ]
>     [power-of-2 padding] - removed in this patch
>     [4KiB padding (1)  ]
>     [MSIX TABLE        ]
>     [4KiB padding (2)  ]
>     [MSIX PBA          ]
>     [power-of-2 padding]
>=20
> Signed-off-by: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
> ---
>  hw/nvme/ctrl.c | 10 +++++-----
>  hw/nvme/nvme.h |  1 -
>  2 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 426507ca8a..40eb6bd1a8 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6372,9 +6372,6 @@ static void nvme_init_state(NvmeCtrl *n)
>      n->conf_ioqpairs =3D n->params.max_ioqpairs;
>      n->conf_msix_qsize =3D n->params.msix_qsize;
> =20
> -    /* add one to max_ioqpairs to account for the admin queue pair */
> -    n->reg_size =3D pow2ceil(sizeof(NvmeBar) +
> -                           2 * (n->params.max_ioqpairs + 1) * NVME_DB_SI=
ZE);
>      n->sq =3D g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
>      n->cq =3D g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
>      n->temperature =3D NVME_TEMPERATURE;
> @@ -6498,7 +6495,10 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *p=
ci_dev, Error **errp)
>          pcie_ari_init(pci_dev, 0x100, 1);
>      }
> =20
> -    bar_size =3D QEMU_ALIGN_UP(n->reg_size, 4 * KiB);
> +    /* add one to max_ioqpairs to account for the admin queue pair */
> +    bar_size =3D sizeof(NvmeBar) +
> +               2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE;
> +    bar_size =3D QEMU_ALIGN_UP(bar_size, 4 * KiB);
>      msix_table_offset =3D bar_size;
>      msix_table_size =3D PCI_MSIX_ENTRY_SIZE * n->params.msix_qsize;
> =20
> @@ -6512,7 +6512,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pc=
i_dev, Error **errp)
> =20
>      memory_region_init(&n->bar0, OBJECT(n), "nvme-bar0", bar_size);
>      memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n, "nvme=
",
> -                          n->reg_size);
> +                          msix_table_offset);
>      memory_region_add_subregion(&n->bar0, 0, &n->iomem);
> =20
>      if (pci_is_vf(pci_dev)) {
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 927890b490..1401ac3904 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -414,7 +414,6 @@ typedef struct NvmeCtrl {
>      uint16_t    max_prp_ents;
>      uint16_t    cqe_size;
>      uint16_t    sqe_size;
> -    uint32_t    reg_size;
>      uint32_t    max_q_ents;
>      uint8_t     outstanding_aers;
>      uint32_t    irq_status;
> --=20
> 2.25.1
>=20

Nice catch.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--Get4+DgDvqXD53HA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIGFmUACgkQTeGvMW1P
Demu2Qf/U59YuJ10qA0Oss/bIYaL7gX8tfTyGO1M8e4hKJIY3nlyXoIVJaz6jD6P
75QROycGtRVsUS57Nty8HTx3SiOLuqd4a6K+6y8yj4xiTKfjbVeF0uH7pm5+J0Jz
R2zNaRHP1th5xk7UKSJfNoK5n4eMkon92vYkkjVzCbRHFdJulwHrsNT1IvzJ+4Vd
MgqCgpIIonW/9fpEKvPTuDSXiZojRptHuv9BodCrhRFCG6CIdAIRrNoLF+M2rUvF
wBVlPVo9nzEMJCU5pLuA75ickHJ4WCIAuoISd8oc94PO6m7lu4TvUDDRgV7QjaR5
WAJZyLnnG7qwpjF92hjCfDN3cSaffw==
=3zkv
-----END PGP SIGNATURE-----

--Get4+DgDvqXD53HA--

