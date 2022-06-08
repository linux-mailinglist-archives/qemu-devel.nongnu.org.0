Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E5B54298F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 10:36:22 +0200 (CEST)
Received: from localhost ([::1]:32942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyrAq-0002hq-4F
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 04:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nyr3q-0007y0-6x; Wed, 08 Jun 2022 04:29:06 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:37151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nyr3n-0004jJ-Ql; Wed, 08 Jun 2022 04:29:05 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B3D25C00F7;
 Wed,  8 Jun 2022 04:29:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 08 Jun 2022 04:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654676940; x=1654763340; bh=6A
 85av/JNgLSPYG7vAT3u8xCY3ArKIV2c9xVG804TWs=; b=hs1dLdGjLz4Q04b0sZ
 s0Yl5ViLECII0R2sjMoqwJseYV0/G6nZdX786ROrfTmFY8VOAdThtDqvmqaa6WXK
 /hSXL0UW3Dq4YHiM4ldNxaX8I940X3973xpIPc/zMIOC685eiP83Z22CIu6k+/3F
 L0+tnXb07rdXNsKlU6YQzmn3yKY8xGQbhbjOAiwsrqkrBuKR3uRQ4qjej/w0fhYR
 TMaT2+fl44lhhglO+PUhwrHwFFzR8rprVuSmqTk8S+Eg2ETsWwAiHynnvITwhYhv
 kohpGHcw8D9GoIvsD8NoV5r75qP5spt3YEUrP1Fm4btIETPga+YW2w/9IboABfw1
 6SiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654676940; x=1654763340; bh=6A85av/JNgLSPYG7vAT3u8xCY3Ar
 KIV2c9xVG804TWs=; b=PhYhFmYkfw7KLsaUVJ+IWGCh+BvEBwkqxLU0MrjWu6ID
 KRXooUQXE+gYxvDORwXofuXaA59lQZhP65xZUyMHdt2oju1Okn4afEo+XH/nj/qd
 WPMYSqtVqg6pq/5w4doFAPKxXW7ieS4VyST/RJrkjRTtkT5sFCAzxVVst5aVE64I
 SS6n8y8haqZ9GLRluDznor4ro0A1VonppTku2jmlSmiXulHmnyxDrglAiHwgwrW/
 YePBqZKIY/Ed3oe2/tKEUZMdqoXW9cvTt+srrlUWhd9nUrHzDSFSoe0sCHL88vkP
 oRMpysdjggY2XieFVoVPACj+5i6j9iEuY2wECZwdcQ==
X-ME-Sender: <xms:yl2gYjtNJCwifmlM90zbxo-aGZVXWtzJfrZ1lVl_sVjJWxfvoxtzdg>
 <xme:yl2gYkcAMg2c8ZNF1NKX5Xp2tnkXrkeGXKs-OTPBVBfnsNhoXiAd6ELDW3TRTR2oG
 -CZF7s2qXlSq2VsbDc>
X-ME-Received: <xmr:yl2gYmxAXlUHscXr97lPic7NQ-ZKiYEs-DY6_2HYmlwzWyVhHZFXn98>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtjedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:y12gYiPidVeCOkiKfNyLgwKpeWWcX4qIC0drifhpKrmSMkg6-BJ0Ew>
 <xmx:y12gYj9_5DTl41AH49jq3llI0tgFkWDynjU3be5MJ7bzavLCumm4Rw>
 <xmx:y12gYiVkl0D3USufJLOuOcMvmo4LSOrDiJ5JNwiIQajYFzdm0xYH0g>
 <xmx:zF2gYrOQGE-8woRII84r4u-FsbBhhTm6-gRFccx2-NIpvvfjJd_i-A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jun 2022 04:28:56 -0400 (EDT)
Date: Wed, 8 Jun 2022 10:28:55 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, ani@anisinha.ca,
 armbru@redhat.com, f4bug@amsat.org, fam@euphon.net,
 hreitz@redhat.com, imammedo@redhat.com, kbusch@kernel.org,
 k.jensen@samsung.com, kwolf@redhat.com,
 lukasz.gieryk@linux.intel.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, stefanha@redhat.com, xypron.glpk@gmx.de
Subject: Re: [PATCH v8 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YqBdx+ahn8rpCkn6@apples>
References: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TDXJxiNFWUm19/bd"
Content-Disposition: inline
In-Reply-To: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TDXJxiNFWUm19/bd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May  9 16:16, Lukasz Maniak wrote:
> Changes since v7:
> - Fixed description of hw/acpi: Make the PCI hot-plug aware of SR-IOV
> - Added description to docs: Add documentation for SR-IOV and
>   Virtualization Enhancements
> - Added Reviewed-by and Acked-by tags
> - Rebased on master
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
> --=20
> 2.25.1
>=20

Thanks!

Applied to nvme-next along with v3 of the CSTS fix.

--TDXJxiNFWUm19/bd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKgXbgACgkQTeGvMW1P
DenSCQgApp9IfkjpP2FOSv/IP4BwKNw0e6/MQuO+B/klolklFPkyq+dMbiOmRZb0
xHPOQJ/K9t7mccPn2wiHhsY8ftiSCERiTT8i/6PWsqzKp2bwa7M8jHnB0iLW2Adr
Fdzy39DOdlcQOpXq9Rxs/dsFAB2eHE7nKvgYwI+2n6KqBMarNuWjzrOREVNVmDq+
mOvyGsMEtkBKw7kGD/l8u2WeFAtOsi3O32dE1dJq0q4dNeUC6Caxihp3wbibydHo
adCEWuQx5asKIkt0Z01sAq4KaK7yf8IZis3K+S0EGAv51Lbr4nf5Ei/gYMBb0t7z
Qbste6zyBKkc2cwUVn5raRTv7+3C6A==
=OZs4
-----END PGP SIGNATURE-----

--TDXJxiNFWUm19/bd--

