Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF9045B64C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:11:43 +0100 (CET)
Received: from localhost ([::1]:46460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnNU-0000oA-QY
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:11:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mpnFQ-0003Xz-JC; Wed, 24 Nov 2021 03:03:20 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mpnFM-00027M-3L; Wed, 24 Nov 2021 03:03:18 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 9F4BA3201C2D;
 Wed, 24 Nov 2021 03:03:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 24 Nov 2021 03:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=NPQsNKhGWnfCI5RDbngY1Q6pHrF
 7HONntuu2SAjTSw4=; b=aOnBor/VgQbGBW5KV+e/0SFpQQNe8dQFnCMbWvYQO+9
 6CJTAWugfxNrV3yPiL1xcZji+MtVi41hqQ9jsSceM/HjoBm9PIT4/DYvu4uNZ/FE
 SHRsBPf+EeFB43rNv4K7X5FbYsfknE56Vai+iwn0J2e7NW+tGGe2Tx2GbvgvZskX
 soyMN0jelF20Vsnkr63ArdmXjRV1WmFdsocYSPd3FQgHtueIfD1/3Wgyxs7TkU3P
 JrFiXPCl3Ccsjmo/d1BN7Cl2yIUy3YudA/fzu4dQqG4qVe8P1GLcStPaWlcmOVHh
 KoYZzipZa7CqJ6m7mIEG2b4XSi60Y3qSZfUQJlYJa6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NPQsNK
 hGWnfCI5RDbngY1Q6pHrF7HONntuu2SAjTSw4=; b=geAS1RUJW39BR7i+Dz0NAm
 lSjzG6slj0GxOa3VlOkVVkQ98oNQaVJMH8kG281sYb7AAbBtHTEIu4nIZwKh02fj
 WHuB/GJpaxF6RUBpzkgHD3jVbgKgzOw7YO+H8JDff+rtBlsrErTU66xjIe3Gh/lV
 1CJvhWuVPlvXAubYB3UjVISvryrx0stTzvocvN0cYOmR3mJT/RSLp0U8iOCD2N96
 LQrbTtd/4YQ6oBmz3YfJgS/UkT8qAi9y5F4iQgWammJGhGXqeF4BYUzFbtdQBAHu
 +DL0WDyZ/Vt8ACD4ITQq7Gy/gDUhP9jRpVt23phij9/iyoVQNboR/XiYfsJBH3Tg
 ==
X-ME-Sender: <xms:vvGdYcmiW2tFDfODbCQfgqRGGOPWVAS1B_rfuMlazIFoE03bkl4ilA>
 <xme:vvGdYb0Bh7E1VnK9KjTJrT4YTMuW-DgAit1vE6c9gMUyEmVPCJCG8Z7m37vC_xg6P
 TKlYQw_8B7RG51tZrY>
X-ME-Received: <xmr:vvGdYarjp1lEYJOlzIkvFTZ3vO_bHfhepE6ZQnrZXSEGFf_Cx_wzUEhvWy8ECRelyc3KpcUt9tx7BIEe94fmCiFzjwagIKXEk0cPxuTYkYnGWWkD3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeejgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejuddvfeffgfdvjefhleevtdevgeejteelveeiueejleeuledtueeiieetjeev
 vdenucffohhmrghinhepghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:vvGdYYkXopQ_4UEuF34KoSz2UkElnPAY5mXJNlRyiWpAAtGiXrlSow>
 <xmx:vvGdYa3fuKayOCmZrKdEmpHCfIoyeYSXySYQ7bG1AQxAyJkKBRPJCw>
 <xmx:vvGdYftGD9C9dxOIi-iguoM4RZ2nbl6YvWEaPALkScEupWPQNgTkoQ>
 <xmx:vvGdYdQiT2fzeUas2tgPI_GUGnkYkt-NQBlg8yD987KLo8WeoGBSJw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Nov 2021 03:03:09 -0500 (EST)
Date: Wed, 24 Nov 2021 09:03:06 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Subject: Re: [PATCH v2 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YZ3xurkIxozrTbqu@apples.localdomain>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mmtuI5uMd2Dp2C6O"
Content-Disposition: inline
In-Reply-To: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: kbusch@kernel.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mmtuI5uMd2Dp2C6O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

I've been through this. I have a couple of review comments, but overall
looks good for inclusion in nvme-next. Would be nice to get this in
early in the cycle so it can mature there for 7.0.

I'd like that we mark this support experimental, so we can easily do
some changes to how parameters work since I'm not sure we completely
agree on that yet.

By the way, in the future, please add me and Keith as CCs on the entire
series so we get CC'ed on replies to the cover-letter ;)

On Nov 16 16:34, =C5=81ukasz Gieryk wrote:
> This is the updated version of SR-IOV support for the NVMe device.
>=20
> Changes since v1:
>  - Dropped the "pcie: Set default and supported MaxReadReq to 512" patch.
>    The original author agrees it may be no longer needed for recent
>    kernels.
>  - Dropped the "pcie: Add callback preceding SR-IOV VFs update" patch.
>    A customized pc->config_write callback is used instead.
>  - Split the "hw/nvme: Calculate BAR attributes in a function=E2=80=9D pa=
tch into
>    cleanup and update parts.
>  - Reworked the configuration options related to SR-IOV.
>  - Fixed nvme_update_msixcap_ts() for platform without MSIX support.
>  - Updated handling of SUBSYS_SLOT_RSVD values in nvme_subsys_ctrl().
>  - Updated error codes returned from the Virtualization Management
>    command (DNR is set).
>  - Updated typedef/enum names mismatch.
>  - Few other minor tweaks and improvements.
>=20
> List of known gaps and nice-to-haves:
>=20
> 1) Interaction of secondary controllers with namespaces is not 100%
> following the spec
>=20
> The limitation: VF has to be visible on the PCI bus first, and only then
> such VF can have a namespace attached.
>=20

Looking at the spec I'm not even sure what the expected behavior is
supposed to be, can you elaborate? I rebased this on latest, and with
Hannes changes, shared namespaces will be attached by default, which
seems to be reasonable.

> The problem is that the mapping between controller and attached
> namespaces is stored in the NvmeCtrl object, and unrealized VF doesn=E2=
=80=99t
> have this object allocated. There are multiple ways to address the
> issue, but none of those we=E2=80=99ve considered so far is elegant. The =
fact,
> that the namespace-related code area is busy (pending patches, some
> rework?), doesn=E2=80=99t help either.
>=20
>=20
> 2) VFs report and support the same features as the parent PF
>=20
> Due to security reasons, user of a VF should be not allowed to interact
> with other VFs. Essentially, VFs should not announce and support:
> Namespace Management, Attachment, corresponding Identify commands, and
> maybe other features as well.
>=20

This can be relatively easily fixed I think. I have a patch that already
does this for Administrative controller types and it should be
applicable here as well. I can follow up with that.

>=20
> 3) PMR and CMB must be disabled when SR-IOV is active
>=20
> The main concern is whether PMR/CMB should be even implemented for a
> device that supports SR-IOV. If the answer is yes, then another question
> arises: how the feature should behave? Simulation of different devices
> may require different implementation.
>=20
> It's too early to get into such details, so we=E2=80=99ve decided to disa=
llow
> both features altogether if SR-IOV is enabled.
>=20

Reasonable enough for now.

>=20
> 4) The Private Resources Mode
>=20
> The NVMe Spec defines Flexible Resources as an optional feature. VFs can
> alternatively support a fixed number of queues/interrupts.
>=20
> This SR-IOV implementation supports Flexible Resources with the
> Virtualization Management command, and a fallback to Private Resources
> is not available. Support for such fallback, if there=E2=80=99s demand, c=
an be
> implemented later.
>=20

Acceptable.

>=20
> 5) Support for Namespace Management command
>=20
> Device with virtualization enhancements must support the Namespace
> Management command. The command is not absolutely necessary to use
> SR-IOV, but for a more complete set of features you may want to
> cherry-pick this patch:
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg03107.html
> together with this fix:
> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg06734.html
>=20

I think we can live with just Namespace Attachment suppoort for now,
until the above patches are accepted.

--mmtuI5uMd2Dp2C6O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGd8bcACgkQTeGvMW1P
DekD9Qf/cMbvczCuwOiwf60miYjylpeuI/1iFx+LGJkV2A9HWdW6uNzo74223uFy
3eINrZnQCfnkkgZz+akJIzwJQzaIiDswFgNshAWNNKIHajtNUZKs/cW1lURLTnah
DcMOJH6eyIQuE9RPLGU8tNPEqCxgmlMYespWhNgNJqf6ufC8QJF1g+ZyRgS2KXL5
G6mwWzW0KWjWKfkJK23C14NxsdFqJsHC+lMTROqQ/7aKc7C/ELxMXV45bpwfhKYr
wnBmwdOPaOmbH9WoE4Wp7ydc2r44nlriGZOwLLljzlmkGAdO6qfEaat1VRt5JaGm
Dg9MVhY+aAYkqeFxg+9uE0lEju+GaA==
=nhIh
-----END PGP SIGNATURE-----

--mmtuI5uMd2Dp2C6O--

