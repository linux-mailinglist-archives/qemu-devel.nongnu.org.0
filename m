Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780894B1F7A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 08:42:50 +0100 (CET)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIQZp-00030t-Bo
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 02:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nIQK0-0000LN-1H; Fri, 11 Feb 2022 02:26:25 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:41495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nIQJv-0005AP-C2; Fri, 11 Feb 2022 02:26:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 290A65C005B;
 Fri, 11 Feb 2022 02:26:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 11 Feb 2022 02:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=lZT/AoIj1cx5RAAdTS+T59D2QOXjDN
 3Vfi9RAJaZtSU=; b=RYPec9Y4FyzCVkQniNJRveqoE+zM/SdV5D1qi0baxFqpbH
 SNGr4IYJfRwr+aNPXzcUt6bIo0/vAKkVrTH31xidvHvigJDE2jhiCHHZ5yojALYD
 prCgGl0p40e0z409d8e8nL8A4vGP22GPn/0Ok2G7RK+/ZQ7GcsvIbxw/c1P0z3qO
 EINGyJfxvvXPjZg6DnUOsB0f/TsELUD5z4kD9VS3DrsWlOUup9lLM0l0LbpM3864
 K+qWR+iugJ2Cy17pQPtfwJL4d+CP0st61FZBmKe+4tFcqj3xZbZEKbJQ+5sM5tRJ
 E0zH5zaqorz9BNj6YNgNCjHOb7bGRFcOjJ6/WZxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lZT/AoIj1cx5RAAdT
 S+T59D2QOXjDN3Vfi9RAJaZtSU=; b=g/0zmIQNZ/2RnBRRwQ3MF2FYMfKPGkqMX
 7NUrdpHrPMxWvfA2yif2K+gGjtaJ0GdT/c3GD26qMCxjtcWf/ikWC1cNMmlIvaYn
 cTm2lpAyQfYh2rLhoocRy097NTPaa3zXnhf+GRD7cbgFvT6/eaoaiAlsSI6Z6pqn
 KcwwoViAhbQYohBWCy6mu23QQmvEvh6icW8h268U4Mr4khMeTmQq7qX4+6O519KY
 91mnOGfRpid/mKhuQrn2KA5fJIVKLInJ1wvaungBfLrypwM7gDoP2hu2SoB75o0g
 5S7nIBe8vbd0PUdarAAaJGWPsaBwa4EBwu8cq4PKvHbp/xM0C6WpA==
X-ME-Sender: <xms:lQ8GYhdjLxtxX4mhq3BAlAqinWllH4uLf4DOnRoaoYI2KEQfHE9h5A>
 <xme:lQ8GYvP2XblUht6IU00a7KO8Bv-SMpVuhZ9aUEK4IajVXiz1KGJpXrspSU4wAHUTc
 84uPcRr7a9r0EvbEqY>
X-ME-Received: <xmr:lQ8GYqjPRLKSYzBWyeDKCdQuqWBS7GfCaoD1pwaAhoK-SeJ1TyMVvHWEcppVSTBVocetq022RwUPYWlc9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedvgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:lQ8GYq_GoB0cR3h1uLBuBupHFr_XUa9lAnQNVyEqeLTBVRAVKcjXQQ>
 <xmx:lQ8GYtuWjTd2Lwx9oralg_Fh7W93Gn9DZaDaQu6h54Cg-oelL5Ae8g>
 <xmx:lQ8GYpGZnFlABcLk07QQ_LuLsPWb5J6cNoVWCihe4XZB5yChy8XiJA>
 <xmx:lg8GYnKupgyVmmua-rk9VuOfULIme_pLrxdeg6m_MDzdjWfcXq51jQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 02:26:12 -0500 (EST)
Date: Fri, 11 Feb 2022 08:26:10 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v4 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YgYPkql6nbIZCxLT@apples>
References: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f00PE9R7YXUOwHq5"
Content-Disposition: inline
In-Reply-To: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
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


--f00PE9R7YXUOwHq5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 26 18:11, Lukasz Maniak wrote:
> Changes since v3:
> - Addressed comments to review on pcie: Add support for Single Root I/O
>   Virtualization (SR/IOV)
> - Fixed issues reported by checkpatch.pl
>=20
> Knut Omang (2):
>   pcie: Add support for Single Root I/O Virtualization (SR/IOV)
>   pcie: Add some SR/IOV API documentation in docs/pcie_sriov.txt
>=20
> Lukasz Maniak (4):
>   hw/nvme: Add support for SR-IOV
>   hw/nvme: Add support for Primary Controller Capabilities
>   hw/nvme: Add support for Secondary Controller List
>   docs: Add documentation for SR-IOV and Virtualization Enhancements
>=20
> =C5=81ukasz Gieryk (9):
>   pcie: Add a helper to the SR/IOV API
>   pcie: Add 1.2 version token for the Power Management Capability
>   hw/nvme: Implement the Function Level Reset
>   hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
>   hw/nvme: Remove reg_size variable and update BAR0 size calculation
>   hw/nvme: Calculate BAR attributes in a function
>   hw/nvme: Initialize capability structures for primary/secondary
>     controllers
>   hw/nvme: Add support for the Virtualization Management command
>   hw/nvme: Update the initalization place for the AER queue
>=20
>  docs/pcie_sriov.txt          | 115 ++++++
>  docs/system/devices/nvme.rst |  36 ++
>  hw/nvme/ctrl.c               | 675 ++++++++++++++++++++++++++++++++---
>  hw/nvme/ns.c                 |   2 +-
>  hw/nvme/nvme.h               |  55 ++-
>  hw/nvme/subsys.c             |  75 +++-
>  hw/nvme/trace-events         |   6 +
>  hw/pci/meson.build           |   1 +
>  hw/pci/pci.c                 | 100 ++++--
>  hw/pci/pcie.c                |   5 +
>  hw/pci/pcie_sriov.c          | 302 ++++++++++++++++
>  hw/pci/trace-events          |   5 +
>  include/block/nvme.h         |  65 ++++
>  include/hw/pci/pci.h         |  12 +-
>  include/hw/pci/pci_ids.h     |   1 +
>  include/hw/pci/pci_regs.h    |   1 +
>  include/hw/pci/pcie.h        |   6 +
>  include/hw/pci/pcie_sriov.h  |  77 ++++
>  include/qemu/typedefs.h      |   2 +
>  19 files changed, 1460 insertions(+), 81 deletions(-)
>  create mode 100644 docs/pcie_sriov.txt
>  create mode 100644 hw/pci/pcie_sriov.c
>  create mode 100644 include/hw/pci/pcie_sriov.h
>=20
> --=20
> 2.25.1
>=20
>=20

Hi Lukasz,

Back in v3 you changed this:

- Secondary controller cannot be set online unless the corresponding VF
  is enabled (sriov_numvfs set to at least the secondary controller's VF
  number)

I'm having issues getting this to work now. As I understand it, this now
requires that sriov_numvfs is set prior to onlining the devices, i.e.:

  echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs

However, this causes the kernel to reject it:

  nvme nvme1: Device not ready; aborting initialisation, CSTS=3D0x2
  nvme nvme1: Removing after probe failure status: -19

Is this the expected behavior? Must I manually bind the device again to
the nvme driver? Prior to v3 this worked just fine since the VF was
onlined at this point.

It would be useful if you added a small "onlining for dummies" section
to the docs ;)

--f00PE9R7YXUOwHq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIGD40ACgkQTeGvMW1P
DemKQwf7BQgx5NGO7ztAVZEDrOkL3pb1m5zhh1PSUQ466E2MKvol4DozbOdBRq1g
X0pQS9Ws1MGYIi0QNguiJQwZtGkVt68uhAmwuWTKvrx7X1i59GxFTbff4Je5vDlX
uK7ryZGwx5MyqMjLuDyLLgf+V+2lB8HZNhuMgpRqV7abq3xu7kMQ6ODmBPhweLR+
ninsQiaICjnmwXV49ojVvHfgZ+VFDbLa9+EBjXQicVgYCW3askAHnET5I1WxAn0p
ukYvGrYB61d9ouon4rpPmJ/ougdJfOJ7TUlqGHQdv7JhAQ+/lpRM+gaSQQe3jF6v
9IiiPIzTdg5P5+OwCgXlq2u6cmMd7A==
=eqKH
-----END PGP SIGNATURE-----

--f00PE9R7YXUOwHq5--

