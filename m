Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D83037DB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 09:27:28 +0100 (CET)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Jh8-0007ex-TH
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 03:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4Jby-00071G-Sy; Tue, 26 Jan 2021 03:22:06 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:44229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4Jbw-0006po-Aj; Tue, 26 Jan 2021 03:22:06 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BC7205806E7;
 Tue, 26 Jan 2021 03:22:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Jan 2021 03:22:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=gvuxBIJ1oGS2eNBjqJpeAanbdoO
 w/pGi4jH6O+IgM+U=; b=uq0f72+m+s1xEepHh1NndBNhkFk4058WS67SYtMSZuT
 1eHHm8PMx8pDZMPeELaqFCQg0vUNnOCiMG/zI9SbKdoFRj0APxeg/w3KwwxIMfqH
 k3sYAbj3S059V1LH2O0vQI8FpoZwY/kyJFFFUv1yUw3Y0qQDBspsqr9yp1W1l+An
 hpychom6NYafHPEUabnDbn/OY+U3f6b/ZJulInlBA/hg4R5Y0TvKV1bsp2BPKtj3
 XRbjycgqfyOr2V+1X/L+EVy/+m8H+eIbbPgefjz/01d/H2aVRAlRTcsPR1V3g9la
 M0ATLTRRVI4VdZPViGra5vrC95JXGBlP1ifCJN4Aeqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gvuxBI
 J1oGS2eNBjqJpeAanbdoOw/pGi4jH6O+IgM+U=; b=LhRpLx2a8TKD1CWZzN925m
 9/hPz2Xi9+QhkJy7njuFUs++EfoyGVLeKcudBykSwm/Jm0rli/um/sbbYzDX4niZ
 TeDmCcFfA99Snexxo/DNA4AdmzSuwrCUq4mER3IVdd4HqVciEeeDVthgYwsxhEuo
 km/SJ9FaaLWE4kXTosc8XPdK37n0/S1eCsAonGwhMCx0i9Q//iAnaefhloH3Dp32
 o3Zmvw8ZmyZEC9fWVLtScNQWRwrp3OI+IWTstftRsCQzNiLysSx+3FqgnuSAUMyq
 2CBN9kaaCDH20qXzLI5fpQioNR1SCMN1NwaC8de/EfPEtTbJpkauMt73w/1FXKtA
 ==
X-ME-Sender: <xms:KdEPYJTqiacIYEBY4YiUrUR0BZ9FXKdu-PrcMeoTNOylmVd0KuD28A>
 <xme:KdEPYCz13x5Acz-L0lsKJyewqJKnE-UIz6ECuxSs12ZSouqfDikzYI59zAHcwTj2b
 4KD-RJDO5AlAp0JnAU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeggdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:KdEPYO1DkX8pj-PiGiS-GUWGYcHAbu6JeSM3OwGvZSVeIUBOwPZyGA>
 <xmx:KdEPYBBGQD0WkWXr6x6N62_CYdO-tS7SvsFF4yzIAizXR57S5jxQig>
 <xmx:KdEPYCj5U4ZlIOaQa0UOvJB-5YgTnatNk7P88BDyzeea9Xee56R3IQ>
 <xmx:KtEPYLUBfWWQPJu_t6D9-u-yEEU1Eay7-0N0sxKSqhJPwVoc2jL_WA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C0DA1080063;
 Tue, 26 Jan 2021 03:22:00 -0500 (EST)
Date: Tue, 26 Jan 2021 09:21:58 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH 0/3] Fix zone write validation
Message-ID: <YA/RJhWQMV/6jqTS@apples.localdomain>
References: <20210126050248.9077-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lah32sgvOpuhYX7Y"
Content-Disposition: inline
In-Reply-To: <20210126050248.9077-1-dmitry.fomichev@wdc.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lah32sgvOpuhYX7Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 26 14:02, Dmitry Fomichev wrote:
> These patches solve a few problems that exist in zoned Write
> ans Zone Append validation code.
>=20
> Dmitry Fomichev (3):
>   hw/block/nvme: Check for zone boundary during append
>   hw/block/nvme: Check zone state before checking boundaries
>   hw/block/nvme: Add trace events for zone boundary violations
>=20
>  hw/block/nvme.c       | 35 ++++++++++++++++++++---------------
>  hw/block/trace-events |  3 +++
>  2 files changed, 23 insertions(+), 15 deletions(-)
>=20

I don't think there are any obvious benefits to this series over my fix
and since you didn't identify any functional issues with it, I'm
thinking we go with that.

My fix additionally removes setting ALBA in the CQE for regular writes
and bundles the endianness fix by changing the related logic in
do_write.

I have a couple of series in queue that also includes zoned writes and
there is no reason they have to indirectly deal with append. It's just
cleaner to move this special case closer to where it's used.

--lah32sgvOpuhYX7Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAP0SUACgkQTeGvMW1P
Dems7ggAimDBYMLHScvKwNpQFM/lQXy0XsGYuVXpfKKGVGij8SBctLFl1DaB0Sll
Au94PJCURnS+uFZB0agHyfkuv7TFiGNsJpDu5WNErqPjascWCkwa32a7gG/K5KG5
UfwGpfjHq1kyczhVvQSx0YPpyLq3wpegtD35Me2KHQaYuwv5P33LcN0rAPFw7AOB
JDt2wPSmLDyc/AbsVUbCxdXK2iYN2WMOz8c310Rt8CpTqv4rsnCJrsEnM+FADWP1
POFdQ+j1Gv8nHbc+b9d6PKKD5dE2EO5KbXQ9FgfF+Ar0oza9R1iKOR5fqH0+iJhj
tTGkZEv7ouvQu9llrvdnAz8/0AWcWA==
=RIb9
-----END PGP SIGNATURE-----

--lah32sgvOpuhYX7Y--

