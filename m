Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB7513C5A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 22:09:39 +0200 (CEST)
Received: from localhost ([::1]:39148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkASH-0008St-4o
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 16:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkAGI-0005Vi-Oy; Thu, 28 Apr 2022 15:57:15 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:47435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkAGG-0002QU-49; Thu, 28 Apr 2022 15:57:13 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1AA3432009A3;
 Thu, 28 Apr 2022 15:57:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 28 Apr 2022 15:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651175823; x=1651262223; bh=hh
 iO/JbGhk3FEbe4Di9LXVzb3b0x0FrNQ8kXekSXXhU=; b=nbyLKltifbJP0sY8I6
 5pDfhJb5JbHL8xogc8TtRO2p471pKjIIc9NQvNH8ts4wz7HX7rsit3BVynKGGx4j
 Emk4HojbPJ6Lf84igZ4eCDcSrUl5r9OhPA+b0TUvBWMoraD07cLbfqoPltZFQR2Z
 XCVlrUL0dXbvKf7CTlSNbP6W3uxJ7/FgL/oe4o327pSzSTWIhBo+Q4FIeHGdtV4J
 vvjpuFke9dMP6BfPcVnZ8wfB6Tw+XMv+Ar6VkbdkCNSRFJaUkIDYPFCtoFSektlL
 OTb75hMC8Rbo6DubmjDWwnxjsBglivM7osWz8n//KAxVDb3ir5kKjQ5XxSXaoCSh
 evZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651175823; x=
 1651262223; bh=hhiO/JbGhk3FEbe4Di9LXVzb3b0x0FrNQ8kXekSXXhU=; b=e
 3/bK3O4f3Yrf01kQbzQqie7I4KGAo/yJalVZJXLQCrIY62vP2VIDBiJwlgvD9/NB
 PbhjECI/bn4MutB3MQcM44V65NpJO0OmBfGCkGlKVq1CUwcd+N69jgew3vBGJhVF
 RK1ig2xbdq1AtMwQ2yQnChZGACcLEirowyzKE7LLyRNg1yuuBkfiMzYC8ykSZ9r8
 RjFnUkxTC5r/IPJazyBN4R15rCaO8o22MBUj7EVROIAQjHz4urBSyf2+SY1ger6t
 dk9XozUu39VMQ9aknyIfOZiwFOgD45i9bAyJiC/vth5Wbpf83ZsvtMVPm/Ki9zLa
 vsKUGbn/ICoCrjje5co1A==
X-ME-Sender: <xms:jfFqYpPd8RjhqHJ0Bx65uPx817Ulk9Z-1m_wTDceUJcdkLW4XCeXCg>
 <xme:jfFqYr-Fh_F3OMiy0GfAQXzK6c1y1NQ5kKpx-X5Or11VXEW8V65Mj7FjVQKLcXcn4
 ppryjJmdgq5LwI3lpQ>
X-ME-Received: <xmr:jfFqYoTkUX4xeXa5X_7QhPiHtCFVLOXqRUN4r2QjfKlz9MmO4nwJai9Y0uUzmtjfbIZ1AjIylcKbl0Q5dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddugeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:jfFqYltQwMKLUvfWN2_nrCM7RlvvLDQnXS2CmJz6-NJ0WmAWpPUymA>
 <xmx:jfFqYhe9O-7r2w5c_cTabSZW_eL7wVHKqDrLWhz8Xm_k2kPyhkjTqA>
 <xmx:jfFqYh3JbN_qqYz3KqL3AgjHZOq-5zFFaesHHxWZW23L1nm5K2loSA>
 <xmx:j_FqYsuVpWiC1LNQSPtMwS_w-rKRIn_ITpt-_OjjSI-BNWt4gUsO_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 15:56:59 -0400 (EDT)
Date: Thu, 28 Apr 2022 21:56:57 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v7 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YmrxiWa6fP1hZ+ub@apples>
References: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8/YICGbXgnEEi1HA"
Content-Disposition: inline
In-Reply-To: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, stefanha@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, armbru@redhat.com,
 lukasz.gieryk@linux.intel.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 kbusch@kernel.org, hreitz@redhat.com, xypron.glpk@gmx.de, k.jensen@samsung.com,
 ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8/YICGbXgnEEi1HA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 18 20:18, Lukasz Maniak wrote:
> Resubmitting v6 as v7 since Patchew got lost with my sophisticated CC of
> all maintainers just for the cover letter.
>=20
> Changes since v5:
> - Fixed PCI hotplug issue related to deleting VF twice
> - Corrected error messages for SR-IOV parameters
> - Rebased on master, patches for PCI got pulled into the tree
> - Added Reviewed-by labels
>=20
> Lukasz Maniak (4):
>   hw/nvme: Add support for SR-IOV
>   hw/nvme: Add support for Primary Controller Capabilities
>   hw/nvme: Add support for Secondary Controller List
>   docs: Add documentation for SR-IOV and Virtualization Enhancements
>=20
> =C5=81ukasz Gieryk (8):
>   hw/nvme: Implement the Function Level Reset
>   hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
>   hw/nvme: Remove reg_size variable and update BAR0 size calculation
>   hw/nvme: Calculate BAR attributes in a function
>   hw/nvme: Initialize capability structures for primary/secondary
>     controllers
>   hw/nvme: Add support for the Virtualization Management command
>   hw/nvme: Update the initalization place for the AER queue
>   hw/acpi: Make the PCI hot-plug aware of SR-IOV
>=20
>  docs/system/devices/nvme.rst |  82 +++++
>  hw/acpi/pcihp.c              |   6 +-
>  hw/nvme/ctrl.c               | 673 ++++++++++++++++++++++++++++++++---
>  hw/nvme/ns.c                 |   2 +-
>  hw/nvme/nvme.h               |  55 ++-
>  hw/nvme/subsys.c             |  75 +++-
>  hw/nvme/trace-events         |   6 +
>  include/block/nvme.h         |  65 ++++
>  include/hw/pci/pci_ids.h     |   1 +
>  9 files changed, 909 insertions(+), 56 deletions(-)
>=20

Series (hw/nvme parts) looks good.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--8/YICGbXgnEEi1HA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJq8XMACgkQTeGvMW1P
DenIWQf+P8pViaUweV5lehkpNN62ThnngSysyposDsJxmj7ehIaczp1iMwmnMk54
CWrGR+JPmj6nqxMkr4dGmV+Vtl6NRM0TYpIXQ06DSjGR7m+c0g5SKjJ9hjxIbdKH
F/TegpDMuFQQLBaUOw+UqBmUR8fiBBMdO7N9GfHdUHcXngdhIycRIz2CuaTQ1Fh4
Da9Bgj9qlf/qmGd3T6iEt+kSYRzQUfsF+gZyTXulQyjmoq7cd/JxZvbwB+GH+N6n
2NVenHbjdV1tG8XP7EPk0zNmmw5GkZZeXu0UytHytVfq7mtAFTjCAv8RmweKpTPv
Y8DcT3/tza+889+nf5oN8YjDgRKfag==
=zfqa
-----END PGP SIGNATURE-----

--8/YICGbXgnEEi1HA--

