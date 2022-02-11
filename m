Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF8F4B1FFC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 09:17:09 +0100 (CET)
Received: from localhost ([::1]:47844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIR75-0005wK-Sv
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 03:17:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nIQpI-000340-6R; Fri, 11 Feb 2022 02:58:44 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nIQpG-0002rw-8M; Fri, 11 Feb 2022 02:58:43 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F32E5C0079;
 Fri, 11 Feb 2022 02:58:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 11 Feb 2022 02:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=5KpSKwzMHEa+KKNNDZfPUJ1A0g80ua
 bnwn5irRCPedw=; b=F+/Kr3SHi1Ciz0LSLASGuW2Y3wjEwS4vX1aU9a+s9eTbQp
 GmBd01d8JLFY2q14rXRzwjR1kcs1NuwQRUW6xghxs7dMlZOIQ3nQfcyn420hRSNv
 L/mQE0EsuJw6Jpk3nIplNd4ezBFEcVLGjs2Wu02X0c0+9jD47gWgYtg/POzIOEit
 xjWNtSDt7ieD146mtHuM/MdFwts4qSnXObbvmDh0qKhJMUgP4SFfZq3TLzLw8Q5a
 MUDvZUeoP/f3yVavpZlo7Mmk+7CkHgnZ001JGabiLUEv2zhIGjsaP+k5IF2SvskA
 AKmqmlvge5VKP6AYJVgrs5/vRS00bzR2byisGD4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5KpSKwzMHEa+KKNND
 ZfPUJ1A0g80uabnwn5irRCPedw=; b=Rg15k0QlSnVCcMz4hD8rDkDvKEO+/i63h
 Htxmj3eGNEihOWDXwEd0ueK2QMG35Rsm14LJzY+ZmF0Sy8yod+ifyCaDHVY5TUvp
 RnEVTjFG/w6GSD29Rqqfm2wuTLLxvLAh8gRY0stsf0ffySpAn3hJLZm0ZXwtBd8O
 TvMBY3VwNZppjNETtXQHg4tCkE6sWxnseW34AL2bynY4ADNNrr9/sLS+2ij6JWgr
 YrgK4EDY0HBe/oKK250LvvhD12dsMD/7NktefofMykhmwozPsBHxVCBXuUjvG67s
 o4UJililXg42L8mxPAZgb8tVy9Z6LeFbbaHRTxmGtLccjRJtXHIxw==
X-ME-Sender: <xms:MRcGYgrDkbkUQejame4zCdfsqxYeMbav1SB-h5WX-DrPXdJHLhWd2g>
 <xme:MRcGYmojeblZ-p59aB9etUuAgPNJ_Yqrm6s8R0-UJHZf6lvEqlshiOl9stAsRqzrP
 IDNY5MXGYP1sJ0n4gw>
X-ME-Received: <xmr:MRcGYlOofVdnzHOk1Q7Hoq9rsgR4IxzBKsw0L1qgcibl1k0uuLyI0-1idmZUv4rZKnCIATmngbOc43Zw6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedvgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:MRcGYn6pIpHsQtLpoUGGOL-hugQn2g3I-8qmn4SJ_sid5-wDiBKQjg>
 <xmx:MRcGYv4idbCeuxLU1IvrYJo_W8uRQCldd-m3gynIuxScUEVYmLR6yA>
 <xmx:MRcGYni2XmYhpvHt-rs0LHEqspzPzYOA8jVkYpU_24yI4fyu_Hl1KQ>
 <xmx:MRcGYi0X-6ljkXrUv9f-ZcdChP9YyrV2bVXkaqdr1Jn1iFtbar0Onw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 02:58:39 -0500 (EST)
Date: Fri, 11 Feb 2022 08:58:38 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v4 11/15] hw/nvme: Calculate BAR attributes in a function
Message-ID: <YgYXLptY2kFTKM3A@apples>
References: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
 <20220126171120.2939152-12-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="afSGYeoVFlFditoO"
Content-Disposition: inline
In-Reply-To: <20220126171120.2939152-12-lukasz.maniak@linux.intel.com>
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


--afSGYeoVFlFditoO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 26 18:11, Lukasz Maniak wrote:
> From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
>=20
> An NVMe device with SR-IOV capability calculates the BAR size
> differently for PF and VF, so it makes sense to extract the common code
> to a separate function.
>=20
> Signed-off-by: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
> ---
>  hw/nvme/ctrl.c | 45 +++++++++++++++++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 40eb6bd1a8..e101cb7d7c 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6431,6 +6431,34 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *=
pci_dev)
>      memory_region_set_enabled(&n->pmr.dev->mr, false);
>  }
> =20
> +static uint64_t nvme_bar_size(unsigned total_queues, unsigned total_irqs,
> +                              unsigned *msix_table_offset,
> +                              unsigned *msix_pba_offset)
> +{
> +    uint64_t bar_size, msix_table_size, msix_pba_size;
> +
> +    bar_size =3D sizeof(NvmeBar) + 2 * total_queues * NVME_DB_SIZE;
> +    bar_size =3D QEMU_ALIGN_UP(bar_size, 4 * KiB);
> +
> +    if (msix_table_offset) {
> +        *msix_table_offset =3D bar_size;
> +    }
> +
> +    msix_table_size =3D PCI_MSIX_ENTRY_SIZE * total_irqs;
> +    bar_size +=3D msix_table_size;
> +    bar_size =3D QEMU_ALIGN_UP(bar_size, 4 * KiB);
> +
> +    if (msix_pba_offset) {
> +        *msix_pba_offset =3D bar_size;
> +    }
> +
> +    msix_pba_size =3D QEMU_ALIGN_UP(total_irqs, 64) / 8;
> +    bar_size +=3D msix_pba_size;
> +
> +    bar_size =3D pow2ceil(bar_size);
> +    return bar_size;
> +}
> +
>  static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t of=
fset,
>                              uint64_t bar_size)
>  {
> @@ -6470,7 +6498,7 @@ static int nvme_add_pm_capability(PCIDevice *pci_de=
v, uint8_t offset)
>  static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
>  {
>      uint8_t *pci_conf =3D pci_dev->config;
> -    uint64_t bar_size, msix_table_size, msix_pba_size;
> +    uint64_t bar_size;
>      unsigned msix_table_offset, msix_pba_offset;
>      int ret;
> =20
> @@ -6496,19 +6524,8 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *p=
ci_dev, Error **errp)
>      }
> =20
>      /* add one to max_ioqpairs to account for the admin queue pair */
> -    bar_size =3D sizeof(NvmeBar) +
> -               2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE;
> -    bar_size =3D QEMU_ALIGN_UP(bar_size, 4 * KiB);
> -    msix_table_offset =3D bar_size;
> -    msix_table_size =3D PCI_MSIX_ENTRY_SIZE * n->params.msix_qsize;
> -
> -    bar_size +=3D msix_table_size;
> -    bar_size =3D QEMU_ALIGN_UP(bar_size, 4 * KiB);
> -    msix_pba_offset =3D bar_size;
> -    msix_pba_size =3D QEMU_ALIGN_UP(n->params.msix_qsize, 64) / 8;
> -
> -    bar_size +=3D msix_pba_size;
> -    bar_size =3D pow2ceil(bar_size);
> +    bar_size =3D nvme_bar_size(n->params.max_ioqpairs + 1, n->params.msi=
x_qsize,
> +                             &msix_table_offset, &msix_pba_offset);
> =20
>      memory_region_init(&n->bar0, OBJECT(n), "nvme-bar0", bar_size);
>      memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n, "nvme=
",
> --=20
> 2.25.1
>=20

Looks good,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--afSGYeoVFlFditoO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIGFywACgkQTeGvMW1P
Denf8QgApRvh3ZsmwEceRJiL/thV1T9V7um1wDaqU8PV+yCzZsiSQ8bJ+PhrLiBR
gOfAvkpdT/MV8eCnT/pCQQwCgrBHTOV5pwNqev9d8qA2tJOQ/KVbJuQsENH0v+OS
5H0tEifx6PII8h9EjkdgZbrBikmSv9PGslNvtxZSHG/Cltv5z5AA+ElUWWhIZkOA
BSFqDDKBtrwuqKtbtYVFK6ubfpvE0lYuAThV9lRtU7roB3Dcx9BatBmR6brnLV1s
mwfZ62+F9xChXM1ama/DQE/XoljF7WWbtYuxwmxqWCAJjcTN/ylRmMQ9zNE6VIa7
Lkd6OqpInenB1i0tsMOL8DdvmBEc1g==
=mKkP
-----END PGP SIGNATURE-----

--afSGYeoVFlFditoO--

