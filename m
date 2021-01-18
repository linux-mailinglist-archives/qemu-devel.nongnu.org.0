Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4F2FAB26
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 21:14:24 +0100 (CET)
Received: from localhost ([::1]:50096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1aus-0002xE-SI
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 15:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1alh-0000Pt-EN; Mon, 18 Jan 2021 15:04:54 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1alZ-0007Bs-Uz; Mon, 18 Jan 2021 15:04:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 647375C01ED;
 Mon, 18 Jan 2021 15:04:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 15:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=K992nmaJLyDCCPd0vd3xrJFg6WG
 AfytJNrB4py4HAEg=; b=HnyKOyBWzoDN0YeF/WliyEAiFlrEqr0tv0dK6GPvQhq
 FiWqBXC0BK+3vvajTn4cMxxleS+32XlJBzt/zfe8RFgl7HpKSEfV4BXxZqbMlGwc
 5Xam7RTUH1+fhFNeOsp2w+iH9YMt6PC0Zh2N+NlMTes+gQUWjX9PxzllmBntxXU/
 XycvGpDydffdIV8m/Eviasg6fGhZqymLXUoAhAjiJ6knmNdcUZf+3BWDB2hm++//
 ouw2yEbJN9VhBbjwI0Hgtv4qe2mDUWR7THb+eoNLUSY+C8DthOc/TkTLZ8S6GBu1
 kGyz++YRFw6C7UqG9ADAuPdqbmjhcfDlHY3qX4soI+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=K992nm
 aJLyDCCPd0vd3xrJFg6WGAfytJNrB4py4HAEg=; b=SmpKn6aTzhJZPEU4dPQBN5
 Ooqwmb0HFHqgvT7B8CJUBg93ZqdmqEwKchTuffBr8fJVEzN5hYjJ4qzohvKKJS57
 Kj0NqzWzT+j7zN9OFUqPcnZEUfplwBTUVeMZsPRl6aB3W8FpPMRhbBvjv6v42Qks
 bha+SWYXCjRpeC/AFOBUaOkhyRWHpXDsPW1rCVhIzcIR7Zfo5i7CpqTK8jswYkQ2
 T7C3NN5eAtQrP4Unxb2fZwGmtyzyEDNYAqlbEnOjLHhsa1JkRlmUEXfFObivqNS9
 JQZfuY1/nahUEjwCfSdDlr/QuapUibrdgd8PcLczW/9B+ilg4mFCPZyQ7Pb9WPzA
 ==
X-ME-Sender: <xms:3OkFYInYall16O4It_jKDkrnHNR1w7JIYC5mQQmQqcjxCPXJpv2W0Q>
 <xme:3OkFYH1kS8V8wgA4E7HyWpxkH0CzM0lUkDU6oX_SfCR2XPgNlroaBvq79Fu7VhVOE
 uwuhAq-QQYeO88JETg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddufeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3OkFYGpv_r2udHxOO6lTSSv-Sy2kH7pdk29g2BkfyVN2E4lGNjmiJw>
 <xmx:3OkFYEkYCmRVVBMrSNwS9RUoIiFiv6UqWUrkHVEzKMjP35OvYYvYjA>
 <xmx:3OkFYG2xrZdEv91JcSsJQjBW9l-hkmGlHNlB_i4-Ebyp_GrOYrskAQ>
 <xmx:3OkFYJTia39XNVySeFniVLbN5tdrXQbRtGrbZgjoABI-0ZkcRugdNg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 11CA71080067;
 Mon, 18 Jan 2021 15:04:42 -0500 (EST)
Date: Mon, 18 Jan 2021 21:04:40 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V2 02/11] hw/block/nvme: open code for volatile write
 cache
Message-ID: <YAXp2IPV9hFWzIJd@apples.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <20210117145341.23310-3-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1HjJAJbkrBWkeJLN"
Content-Disposition: inline
In-Reply-To: <20210117145341.23310-3-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1HjJAJbkrBWkeJLN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 17 23:53, Minwoo Im wrote:
> Volatile Write Cache(VWC) feature is set in nvme_ns_setup() in the
> initial time.  This feature is related to block device backed,  but this
> feature is controlled in controller level via Set/Get Features command.
>=20
> This patch removed dependency between nvme and nvme-ns to manage the VWC
> flag value.  Also, it open coded the Get Features for VWC to check all
> namespaces attached to the controller, and if false detected, return
> directly false.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>

The VWC feature really should be namespace specific. I wonder why they
didn't fix that when they added an NSID to the Flush command...

Anyway, this is much better.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--1HjJAJbkrBWkeJLN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAF6dQACgkQTeGvMW1P
DemxHQgAmQ016aXoWnCBEicAN5yVDehV5foNWKVEFouoxk97hBgn/bpG51rspm61
TtdLWXFJB1h7oIa6XCtVF07zjv1U4qOTCwgRU4xsXzzvZlZ8hAZ2Y1SY/sTj4JTH
ubM87AJNZnku9O4dhuPjUlhx0jRMfmDFfC/fjd30e6kM5cgkS2DExOLER0YD9P/W
2Si+73o5HDSazHQHBd+nf2mqhPHYPoPLaFrNAikbHiIIGDe/dHo+RItkB/v7x/jh
tCgKQyyqk+G5oERBWh0YkI5G+BYU+yU2teHTQ4XSZZZ7rbYSVtljHKfKGWVpzV28
keyBMX7he5RlE+lLTgAkYki/kyPeZw==
=wfNy
-----END PGP SIGNATURE-----

--1HjJAJbkrBWkeJLN--

