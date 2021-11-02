Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C5D443131
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:02:51 +0100 (CET)
Received: from localhost ([::1]:55916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvJJ-0004i1-W1
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mhuqq-00045t-TO; Tue, 02 Nov 2021 10:33:25 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:44777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mhuqo-0003q9-BN; Tue, 02 Nov 2021 10:33:24 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AD8373201C16;
 Tue,  2 Nov 2021 10:33:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Nov 2021 10:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+LDaXwMQgw4pA7Ff61L4CvFVFHS
 +FGKrwe4njvG+9Lk=; b=dUhneUovZqM8gHERKV6pBDLkYGxH0CENw4HtTYRTvh8
 grbTzvdGi/UuHfJ+OjoIkCBwL1aIo9uUuXrE45OdJl8FWTDCMtNUHtJD9I6x0qY3
 NFSCL3dCqPKQNvIoeSY00aMVjnwb6SPv6xnZGqgeOTykw/zSNEJFeL6pIt9ALZJX
 9vCeZPk/9v4AuKSSm7Q1HzQ8MSYD3/rQkeKJeFHKmo1cNTlmikwny8b+NCgcFdHf
 WByZFWiZG91+XxFHbvMGnG1trF1rQgMJV5CsyLhq8X4AjwN7jAz5M67zxdmFauqs
 AYoz0lzt5d6Cq4GrTi9XUm6WPO0JaGLaffSkXXOhXAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+LDaXw
 MQgw4pA7Ff61L4CvFVFHS+FGKrwe4njvG+9Lk=; b=jvZqUDSLGptV3rc41ZSqq+
 yhgyXLqzTiyDjC9IqrGAaEUWI/jynz/ZmKMARUHY8/pz3OX4mdW00ZQQS63swhB5
 NqQOtquBHuq60dR6/jlauYar3HjefnWv88ayoa4sRx+867fWqe/2G1iIfgEO0Boy
 wW8LVHbNHXHlzmBkKlzEcTjOWSD/84d7W0uuZswltLsZR0aVOSEG+6hOr8VWvO78
 PoRY12YYY2qGOId5iuQK7DXNfvRnzYXA8W3U6wrh8uYRRqSoMSI1xJcUZGLJy/Y2
 VqRwf/2YgcE1wHNd4N1bsEF2O6gew36Wh+Ap468amHHGheXCvP4GCZdLP6SYMoIA
 ==
X-ME-Sender: <xms:LkyBYWER0MOYo6G6RYlUh8BWrNgv_tj6rgcSc3MyuduRORQEXdI8qQ>
 <xme:LkyBYXWolrqDLrhf6kKwy-kbGfVZvvLVGHBboyJ61PdptB4yPKmSUOiCTsJpVzERW
 OLflY-vvMjUy2AK4ZQ>
X-ME-Received: <xmr:LkyBYQIwu4aIDOsbI2DaVjHGljCCrnMJ_HoqtxjdD7JlR0QEkrgtmY-bo2mpfN7OwYIZwJQlR4EOjKMYOfeXJONZ9_7Fs-la6jGzNxPGnmFr4TKdKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:LkyBYQGpkM0EiOUcAmoeUDJFqC0Rh7LaMynA9PM3jGw8Tnxm7q38VQ>
 <xmx:LkyBYcWfnmWh7NlFKmT2K_DFwrPMqsQxyyXbIcPY_U_-dhot84ltSw>
 <xmx:LkyBYTOhl2gfEJf1ielootZRNF9rAeWZZBbMdCXqVNC571ldc_q8pw>
 <xmx:L0yBYeKQWEMRnqH6GIlZu83yDpaXU51PgBaGdvgjgE6F9IhxBMqRQQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 10:33:17 -0400 (EDT)
Date: Tue, 2 Nov 2021 15:33:15 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 05/15] hw/nvme: Add support for SR-IOV
Message-ID: <YYFMK3z1iAY52hp6@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-6-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5b5dSlPfSwsSvyht"
Content-Disposition: inline
In-Reply-To: <20211007162406.1920374-6-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5b5dSlPfSwsSvyht
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct  7 18:23, Lukasz Maniak wrote:
> This patch implements initial support for Single Root I/O Virtualization
> on an NVMe device.
>=20
> Essentially, it allows to define the maximum number of virtual functions
> supported by the NVMe controller via sriov_max_vfs parameter.
>=20
> Passing a non-zero value to sriov_max_vfs triggers reporting of SR-IOV
> capability by a physical controller and ARI capability by both the
> physical and virtual function devices.
>=20
> NVMe controllers created via virtual functions mirror functionally
> the physical controller, which may not entirely be the case, thus
> consideration would be needed on the way to limit the capabilities of
> the VF.
>=20
> NVMe subsystem is required for the use of SR-IOV.
>=20
> Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
> ---
>  hw/nvme/ctrl.c           | 74 ++++++++++++++++++++++++++++++++++++++--
>  hw/nvme/nvme.h           |  1 +
>  include/hw/pci/pci_ids.h |  1 +
>  3 files changed, 73 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 6a571d18cf..ad79ff0c00 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6361,8 +6406,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *p=
ci_dev, Error **errp)
>                            n->reg_size);
>      memory_region_add_subregion(&n->bar0, 0, &n->iomem);
> =20
> -    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
> -                     PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
> +    if (pci_is_vf(pci_dev)) {
> +        pcie_sriov_vf_register_bar(pci_dev, 0, &n->bar0);
> +    } else {
> +        pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                         PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
> +    }

I assume that the assert we are seeing means that the pci_register_bars
in nvme_init_cmb and nvme_init_pmr must be changed similarly to this.

--5b5dSlPfSwsSvyht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGBTCkACgkQTeGvMW1P
DekhfAf/c2mfHXu50NMgCmoZR7lW+J9D3qwIIFyxNCwTRCVmcexpNhwklwut17g2
KKb2LoQMz8Omj0OurnKlv83EOe1hCIOKsV8KOmiXnybxEJkrXyLyWiPFuCF+P423
fQQ+66f9ROJ1ZjspYeAgoQ8rwWYa61CCEQDUuPizgwhn+qRW4DJpJOO5tYx/piw+
bUTS4L65wX8BipUxnJVeJoDufJ2Raj8qeN2dm9ammh6EKv8QkkzeqfWA7NoZrVvr
w/EEIQeMWVq8brb09vClfR4edgNvvmcH6W6AxHD0VXS6AM8/gfm0f9HZ6/eicH1E
QmSrzv6ABXV8xY+2NbhU/0EkYWsnGw==
=aXen
-----END PGP SIGNATURE-----

--5b5dSlPfSwsSvyht--

