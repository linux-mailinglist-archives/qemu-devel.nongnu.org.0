Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A189319297
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:55:55 +0100 (CET)
Received: from localhost ([::1]:42750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAH86-0007x5-3O
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lAGml-0005oN-SP; Thu, 11 Feb 2021 13:33:51 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lAGmj-00038z-74; Thu, 11 Feb 2021 13:33:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 914D15C00EE;
 Thu, 11 Feb 2021 13:33:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 13:33:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=DTy/n7PIZZkh70ufaK0q1BSWPjf
 rG2OhVT8TtXXOtuQ=; b=YW482SU9Gc1EgRQtYwGpOxLToMmFo/853jU5uyAFfHY
 4YEDsBiYC4jyIoKwc/QoAL3PXiISNt3FFS3+B4ltMURAW3DQtBac29RVze61U4Kn
 QJeBclDVpZszGmjeh3q2VooaVnXwb7lpycEm5EdK8J0Ra45vWFXFJgUUeKnScRB4
 C61yNh2SIbT+vSt87Wxpe6Z2s/7l/YHpLIhfWkt2YV5UwjQe49npopoqwLp1s2BQ
 VJO4WUUDYLOIumJ7s9Dcyh1lhnvMhkYyh7fQ+mwW4KhVz++TwW9rgnic5Sxp/xKY
 gP817e2sFR9mnSCAv2wAXVYeZbqVqUpDDs4LBP+Hp5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DTy/n7
 PIZZkh70ufaK0q1BSWPjfrG2OhVT8TtXXOtuQ=; b=jOJUI7DuJJIjB0wlXkUVk+
 J8W+nB6JsviU4s103mz9mkRbDUrtGq7ZQYbGxs00cuNV31ikvnUyFCZoBm0xsjne
 1rrCOcxmJU9TWOGLec20/fta+kII83S9K/24OSJsk/sMWBs+31j5d/cKvIzsN1vK
 EPYpBuVmuwlR0DpAzfZffgxKbkHC4yZSuuwJubvTaSWJAuL5WDjeaT4BuZpc6UlO
 60+oOwGMerwB57AhKG81ts3nk+ujdm5O2K8wjorRIQ4y3K2TwdXDY3Dg53Thti/j
 0jmBFRssQWPhdzEMjct0cQ9/OO1aluw8NFdpXRXNH7IfaDL2NCi/+bKZbK0/ZeCw
 ==
X-ME-Sender: <xms:iXglYDfWZdCHFmZ2EjgG13nFwLM7-itZ7yBYEOkM2Nt6sKZ2IOcvYA>
 <xme:iXglYJO7e64vswrxT8shsDiv5PIcB4iZyTjt8KbMtZ07Xod06zAda5Q610sKnI8_9
 Jsn3ySlALJoPa0jtwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdduuddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:iXglYMhHGdJj8m8eJUyYEcPZUXnyHThqq22rpcfIFXhdUz6jQgOThQ>
 <xmx:iXglYE-shAyRMB42vTVSm2JG-g0wI8G5kU3YZLvm9rnOAvFA5gWJmg>
 <xmx:iXglYPsbZB5_XJsoxMX7YSZNU4_NXVOCKgIPMrqVxdV1c0cvfHaG0A>
 <xmx:i3glYI9Q51U98wKNfJryunaHSctjMTc_n8aoHjPMZ9quJ7V1jGrxWw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E50F24005B;
 Thu, 11 Feb 2021 13:33:44 -0500 (EST)
Date: Thu, 11 Feb 2021 19:33:42 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/block/nvme: add broadcast nsid support flush command
Message-ID: <YCV4htJFi8OhyLrU@apples.localdomain>
References: <20210125204231.254925-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xcVQZZGEcm5c0utR"
Content-Disposition: inline
In-Reply-To: <20210125204231.254925-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xcVQZZGEcm5c0utR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 25 21:42, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>=20
> Add support for using the broadcast nsid to issue a flush on all
> namespaces through a single command.
>=20

Applied to nvme-next.

--xcVQZZGEcm5c0utR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAleIQACgkQTeGvMW1P
DekTHgf+KOBGQ0YZB8ftEOx+1/rqS2oeDNe2ha8g1qBLV/LLp3IxLBfrUCH944E5
yqosyLGiF+2VrzSn5tOEO1zzffBDYVVTxF3l0Zm9gJpCPkUo2OzezRSZX7hjo0gm
cpb1JU+Eu9uTs4V2tQf0d88LXXtcMzr3c38dlLkuv94aFMqlYNWumv+3WYjDasn8
1EQzxhdlfx3iG+LzkaLQ/hJ6u7Z6EQnRSQ+AZPy4M83NhcHMnkxH5saOsJZ+KC6N
9qRMYefDatLkCcM2LUHA9U9OHHNxDuvPUO7jZxKvOGUkNFjC2ZASy4WG9vBUezeM
kWNfkxXH61N6UC2P5ISSM423LUFZuw==
=p7gy
-----END PGP SIGNATURE-----

--xcVQZZGEcm5c0utR--

