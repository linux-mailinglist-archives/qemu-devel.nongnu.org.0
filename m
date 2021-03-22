Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B354343E82
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:55:30 +0100 (CET)
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIDZ-0003If-2A
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOI6z-0007oK-CG; Mon, 22 Mar 2021 06:48:43 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:51041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOI6v-0000s6-Ee; Mon, 22 Mar 2021 06:48:41 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4C32A1614;
 Mon, 22 Mar 2021 06:48:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 22 Mar 2021 06:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=mIHhhQ7ziEo3c/HBxt/z280Jc+Q
 67lYaliY8mT6A68c=; b=lcIP6u9R+l8j8wjZnLW7fvwgck+OthE1+kvo8Ts1hS5
 iX6Kni+xzW1u2iwqp93Elf+aZHhbFNmLaSxSw7yRf4TOB44xlfukHJhr61suQA4e
 WEtecpFvlPKQhuGVTejRiVYa9xzeOgCTcasM6Qco984XvCkcbJ/3GtksH4YCZJ2U
 KIH6g8cBAvnPJxCt+YOKDgFhmQyoHj4ySBoMoE/FLSIXZRuGWjUdaO3m7/B4xjV1
 F6AvwFi5bHKni4cb+2t1S3KFcWclsrIIX6VwtV+q2sjYSU8aGwEDCn79RccG86Zo
 eDtxJsEfVTB8WiAceVOetNHLEnBLUHwXwiYaBlFlINQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mIHhhQ
 7ziEo3c/HBxt/z280Jc+Q67lYaliY8mT6A68c=; b=cVKFM8bM82X/htlVCCFhVl
 b2rWQVtRQjuwW/7VJmeSF37g7qezCsFpPlBoUvfRf3bcbnub0EqM2O1epNeadBV0
 kBF1rilsFWXHGGKIeDzv8ul6NYdslUArnyg3ZRMWh6IMihV/IPmz/9TiWZlJ0vbn
 EC0UIDz4a4LcDkEP/lrXkrSWEH03mD4tII9Ftpal4rZVyt1GUbaqeVURTjmOW5ON
 h1OWYdGZJsz5K7+scQ2t/5sLgXcyKx4F72uFJ5RV0fOQKQugu7hcaa/YrRF0Apbg
 /eJ2M4Vhufe/UVdZS0yLvtOwRfx1TEtFheLxFFBzHl9ce1kvhKogPWGIXrmOvL1w
 ==
X-ME-Sender: <xms:_nVYYL5t1LXQDUcgzViiY9GwiTt3n1XjtMsvfJhPPlF8JVnMzd8kGA>
 <xme:_nVYYGSBHr0GWcvoh4SIgRT2IBLJyBnY8Jd1ZXPjez0BWijx5GP8WZOLaJB8hXVNw
 o_Nc0LEDyWUI4o2Cls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedugeefveegfeduhfeuledugfeufeetheeuhfeuffejgeelgffgtdeffeduvddt
 veenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeektddrudeijedrleekrd
 duledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_nVYYCrWmQkKioFkcgtgflg7l1WqZ6GBWfWsya-IovOEG8gR5-SaFQ>
 <xmx:_nVYYMJ-tMo6W_9CAqe8L3NkVGtDXWwrpfCNFx8s6gHV7IXeCXPEww>
 <xmx:_nVYYNpuNRXJkNoOFm5vc3PUPz-IsblWrJv0WIaRu71DBJ1JUIt45A>
 <xmx:_nVYYCYa6FFd2HXunHSfChQFXYQYQFaOpzIWb-Z4dY-OGYGjwY95DA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 72B581080067;
 Mon, 22 Mar 2021 06:48:29 -0400 (EDT)
Date: Mon, 22 Mar 2021 11:48:26 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 2/2] hw/block/nvme: fix resource leak in nvme_format_ns
Message-ID: <YFh1+nY5Tih9j+df@apples.localdomain>
References: <20210322061951.186748-1-its@irrelevant.dk>
 <20210322061951.186748-3-its@irrelevant.dk>
 <75eb366b-32d9-ba67-971b-e5993f5ae192@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CtBVtkC+WVfZYLJ4"
Content-Disposition: inline
In-Reply-To: <75eb366b-32d9-ba67-971b-e5993f5ae192@redhat.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CtBVtkC+WVfZYLJ4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 22 11:02, Max Reitz wrote:
> On 22.03.21 07:19, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > In nvme_format_ns(), if the namespace is of zero size (which might be
> > useless, but not invalid), the `count` variable will leak. Fix this by
> > returning early in that case.
>=20
> When looking at the Coverity report, something else caught my eye: As far=
 as
> I=E2=80=99m aware, blk_aio_pwrite_zeroes() may invoke the CB before retur=
ning (if
> blk_do_pwritev_part() returns without yielding).  I don=E2=80=99t think t=
hat will
> happen with real hardware (who knows, though), but it should be possible =
to
> see with the null-co block driver.
>=20
> nvme_format_ns() doesn=E2=80=99t quite look like it takes that into accou=
nt. For
> example, because *count starts at 1 and is decremented after the while (l=
en)
> loop, all nvme_aio_format_cb() invocations (if they are invoked before th=
eir
> blk_aio_pwrite_zeroes() returns) will see
> *count =3D=3D 2, and thus not free it, or call nvme_enqueue_req_completio=
n().
>=20
> I don=E2=80=99t know whether the latter is problematic, but not freeing `=
count`
> doesn=E2=80=99t seem right.  Perhaps this could be addressed by adding a =
condition
> to the `(*count)--` to see whether `(*count)-- =3D=3D 1` (or rather `--(*=
count)
> =3D=3D 0`), which would indicate that there are no AIO functions still in
> flight?

Hi Max,

Thanks for glossing over this.

And, yeah, you are right, nice catch. The reference counting is exactly
to guard against pwrite_zeroes invoking the CB before returning, but if
it happens it is not correctly handling it anyway :(

This stuff is exactly why I proposed converting all this into the
"proper" BlockAIOCB approach (see [1]), but it need a little more work.

I'll v2 this with a fix for this! Thanks!


  [1]: https://lore.kernel.org/qemu-devel/20210302111040.289244-1-its@irrel=
evant.dk/

--CtBVtkC+WVfZYLJ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBYdfkACgkQTeGvMW1P
DemGDwf/aksRsmjugDeFwyc6CSAE4DfEFBZPaI/aoy+sFIXSFOx0Zx44RGwoepED
R4U81LuSA7qnbWAwrnSaRWrQ/cBFDByWoxc/o0iE/vAxrX9S0RXCftqsHi/PG1R6
J4vpkrPcs+EN74Nb20Kg+XM2acffAV03q3mIwVkBXUB6+J22xtELrcngBb932C5K
R/FhetU3OTvkMk3wCN9j2LeTl7cTV7vvk1Zwu2Z/pyHEt3elW7m3U9Iww7PmzVCr
IXb7nrETXvoZ8f7vD3IPUiys04drleDSeOUAcxfAeYbxkYbq/rxh2BQtxA2e0GKb
0+AIznl2qqR4nWU9WAde54ahkOkbcg==
=cKKP
-----END PGP SIGNATURE-----

--CtBVtkC+WVfZYLJ4--

