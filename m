Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4962D0AF7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 08:12:51 +0100 (CET)
Received: from localhost ([::1]:50670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmAhV-00061c-PF
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 02:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmAZa-0004dx-Ps; Mon, 07 Dec 2020 02:04:40 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:46137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmAZV-0003tO-90; Mon, 07 Dec 2020 02:04:38 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E057B5C01C5;
 Mon,  7 Dec 2020 02:04:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 07 Dec 2020 02:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=w8zFsStK2NrMmwLqUI1DR9vkw2g
 VuQ4dVZ397/BZreQ=; b=zKONrN6gKYawtxhOmCeeqFCq3Ga3GyvLJsbeg1Sy0FL
 rQtEbYEJnXb1QjxwRktLVp74Tpp0IZ7eXgIX2cfx3hG0GCfn3IhVRhcupVAC/AIg
 yjVXHCDG8SJRD9cT0CkgX8cn89uwncQfywAWpdxiXuuUx+FmbDZdti5sFZna6+Zt
 1JXeMWV5TViAl7iHGv6JqmxPsJpwFR44H9x/ZPXpwSlL3YhZ2QbcE8PITuZ5pKOb
 dgqq3wjxCZRcvDZyXMc/q3LANwMHMB2K5Y1rPeNzrQrOpGGRFTKBpBrFNBnrFLAT
 Xmr03iGuSjape7KldKBLduWt8KEKVffX3wH7jMidiNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=w8zFsS
 tK2NrMmwLqUI1DR9vkw2gVuQ4dVZ397/BZreQ=; b=mqJP3HWaDTrQNzYsBn24yI
 fhc9BMgIk/ae0xe6eZIa0nvQ8uJNbUSttkVlLGoCcpkqbD2IVg6TqSEYPOOwjTAX
 5ykWAs4JTMb7VPn5yjgV+X3P5nJ2gUsblLAuhgIYiQ+g6CxpIdXXLXnP/7SR28Gp
 ihnmNX9vOJj752XysTelR3pIUUN74FBbYsZoZ1eIMo9DRugi4CeH2ywVDHEKqSSj
 WANeuhcLDtoSmTuSB4iG9GfvoHTLlOG/WMj54ZD8t4KWiLvYBUsElU033n9tV0AT
 kgXOtLoRlMCNJcFpyDZKH8vWZb4cUrPUgXNk5SkClBIEhM+qls98VDampM2b3/+A
 ==
X-ME-Sender: <xms:_NPNX-PAZ_jJSeyqUdNUJ8OpitQd8OQ3A4YVFOdW2TZElofVJ7oyog>
 <xme:_NPNXxMI4kcmWcOE7n492cla7DsTN_z6zANvqAPoQZ-QrHZzTOBNhLftGVEuZBv_4
 NofPhvf6uhb1CoLIXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejfedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedugeefveegfeduhfeuledugfeufeetheeuhfeuffejgeelgffgtdeffeduvddt
 veenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeektddrudeijedrleekrd
 duledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_dPNXwRvrVtsE-klj3wGKlwL7EsjDtJffq3kpm50mRltPiVFrbi7Vg>
 <xmx:_dPNXzDmRLkJmHRFLsM97jWV5aqEymJUUIkCIUU93B5UlMBcYOgupw>
 <xmx:_dPNX_jB-HWVZgD5q0TGdmdvVfvLTbXlQqbryJTw0oTFWBkba3jknA>
 <xmx:_dPNX4fVO1-yoliSWHSTULU_Pzht7CxOZ8zoHtmnAoaCrbEsENADxg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B54D108005C;
 Mon,  7 Dec 2020 02:04:27 -0500 (EST)
Date: Mon, 7 Dec 2020 08:04:25 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] hw/block/nvme: allow cmb and pmr to coexist
Message-ID: <X83T+W3MwFWh2pBR@apples.localdomain>
References: <20201123065927.108923-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EMfGBRTzZDscf3PX"
Content-Disposition: inline
In-Reply-To: <20201123065927.108923-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EMfGBRTzZDscf3PX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 23 07:59, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> This is a resurrection of Andrzej's series[1] from back July.
>=20
> Andrzej's main patch basically moved the the CMB from BAR 2 into an
> offset in BAR 4 (located after the MSI-X table and PBA). Having an
> offset on the CMB causes a bunch of calculations related to address
> mapping to change.
>=20
> So, since I couldn't get the patch to apply cleanly I took a stab at
> implementing the suggestion I originally came up with: simply move the
> MSI-X table and PBA from BAR 4 into BAR 0 (up-aligned to a 4 KiB
> boundary, after the main NVMe controller registers). This way we can
> keep the CMB at offset zero in its own BAR and free up BAR 4 for use by
> PMR. This makes the patch simpler and does not impact any of the
> existing address mapping code.
>=20
> Andrzej, I would prefer an Ack from you, since I pretty much voided your
> main patch.
>=20
>   [1]: https://lore.kernel.org/qemu-devel/20200729220107.37758-1-andrzej.=
jakowski@linux.intel.com/
>=20
> CC: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
>=20
> Andrzej Jakowski (1):
>   hw/block/nvme: indicate CMB support through controller capabilities
>     register
>=20
> Klaus Jensen (2):
>   hw/block/nvme: move msix table and pba to BAR 0
>   hw/block/nvme: allow cmb and pmr to coexist
>=20
>  hw/block/nvme.h      |  1 +
>  include/block/nvme.h | 10 +++++++---
>  hw/block/nvme.c      | 42 +++++++++++++++++++++++++++++++-----------
>  3 files changed, 39 insertions(+), 14 deletions(-)
>=20
> --=20
> 2.29.2
>=20
>=20

Gentle ping on this.

--EMfGBRTzZDscf3PX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/N0/UACgkQTeGvMW1P
DekvUgf/dw9hEbleRcEqjjT87XOfYrqSjNo6QMzfvqMhQIP2pcR+n/czD9zGiB4C
x21JV1pdyu+fz3Qg1WvaOdNesfUu4JIMczE8qWyJFDm7xRMU35J597Xtp6j1upLL
7Oq/Ctbb0tdYfHhrP4aULEF2PV4bSC1IP4nCP2DMnaV4uSyx323oeJ+021n0pe5r
VNj49mmQ3qenQ7ZU0b36OYGxBrU83OrM/pMkdcDOI2UwQvQPpKERVOxLEk0qlqN4
uTu9JFHNJElC9XWfU4RHcZhTtE9fP6g6gvo3IPM4YyXVlgso3eSuT562bj1x8sNk
eI2TlFh7URUZinVdZ8afBLaVZybmOg==
=Annz
-----END PGP SIGNATURE-----

--EMfGBRTzZDscf3PX--

