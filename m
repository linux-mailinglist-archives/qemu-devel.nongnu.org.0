Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF48310726
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 09:54:57 +0100 (CET)
Received: from localhost ([::1]:53768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7wtE-0005SJ-Fg
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 03:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l7wpI-0004k5-WB; Fri, 05 Feb 2021 03:50:53 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:41319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l7wpC-0003R0-8A; Fri, 05 Feb 2021 03:50:52 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 3BFACB61;
 Fri,  5 Feb 2021 03:50:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 05 Feb 2021 03:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=eCxRfEJCIav0kswVWxNgeu8SbC+
 dWMe/4emvIvwQxW0=; b=DhA4ye6fTZK3jcJzngQYZXblhx3TVjH81HNq6h2Kq0y
 M/mRgGATdJXkB4wEGK95tZxjZsjcirEOWUJaWoNGBpUvIQ/QZJNbdSyU3XKB47E1
 JfGVeOqguRTEeLyMRntguE7p14QJd4y3b0R0P6fZ+Ip2uyReQv4hHZCFNRpyVm3A
 RgV4zftSmNkGYJFFi5yMk1dZn5r3xxqsTRWZi8NBs+wC6E6OYnBLnjb9uz+Sc9Jm
 kOWBt+8vlVNgEGrjLU0pvij1Be6SyCXgLxPYpckCGdayqrDohdpVhREcY9zPXwnm
 j7fd9v/iTXGseskEEthL9CifRiu95oedtsy0XZcFEDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eCxRfE
 JCIav0kswVWxNgeu8SbC+dWMe/4emvIvwQxW0=; b=T8bGYgIGrM+nLiFW5DPXd4
 G7Zs6mOFtMJIapRm4s6FDu778etTK7nqK6mfWE7NmWl93beiQl7PViC31z3e8mRh
 MwSwgPfY7T5k4vGR5RMyAoTizXcnzSHmjVbcTXwAfgppYsGQRJ0dhVDHpt3Wjzca
 W8N0jQTP/utfoW60a4RxuL2GL9q6gzvqVWY0c/dHiVun0UlfUToznzgPYHVMSlGD
 YO9Wkhz4aQFNTR26OFlcuHAVP96HtfGXiXf6Rxx4GzRP5rK9jGo01JhIqFMOaxE1
 fSbmaXewOhuO8/GJJFxAhny1JFVvTi651/xJeplSzQAd5WxN04VC5W+cDb0y3EbQ
 ==
X-ME-Sender: <xms:3gYdYJxYFY5n2GC4GgIyxp2UjgkJbFTnY5t9Q7lTFMG5gqrfkvegaQ>
 <xme:3gYdYNjXp0WHLNO_5HXe8gOQek5DuIzTQNt7t7Gaj125RwOgVnddFypnneKCaWM2W
 wVkxAqTTzUiS8UhyzI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgeehgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3gYdYOXjLYGnLTNYcAhE_Ui43DDRzZ4ba316zSbbo1G8JehLIc8-zw>
 <xmx:3gYdYP3PZPeCdC0mEEgTFre2SJ9evkB6vYcS3Mc01IqHopBJzJp76Q>
 <xmx:3gYdYEF8meSHx5ro4e13rIl68VrwZ99LSs1ZUJED9sYHYvwqx3OvpQ>
 <xmx:3wYdYA4HwUa76_kV5e6EcU-019RKRgISHxdGHDZxFfponSoecO32aw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 47780240057;
 Fri,  5 Feb 2021 03:50:37 -0500 (EST)
Date: Fri, 5 Feb 2021 09:50:34 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v5 0/5] hw/block/nvme: add simple copy command
Message-ID: <YB0G2swUkY1XHJk/@apples.localdomain>
References: <20210129091541.566330-1-its@irrelevant.dk>
 <20210203172709.GD2182779@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BaL/pJNAG9sfCpnU"
Content-Disposition: inline
In-Reply-To: <20210203172709.GD2182779@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BaL/pJNAG9sfCpnU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  3 09:27, Keith Busch wrote:
> Just had the one comment on patch 4, which is really no big deal. I need
> to integrate tooling and/or kernel support in order to properly test
> this, but just from code inspection, I think it's good.
>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>
>=20

Applied, with the small fix to patch 4.

--BaL/pJNAG9sfCpnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAdBtkACgkQTeGvMW1P
DelHagf/cswVX7HaswpaJFLORu+4NWtKdGkMOdY/B67TbZBBrboX1ZSFjRmyr+YT
D3eCsUt+Qn+D3EHBQrusd3I1o3NZTUaXjhsTPk41XEAlq4WONDp7O1UMZ81Lv2S7
b9Z7SMwbo42P4WqhXlUaRlHxUwG0pLEQn7A3o7ByAgilBl6epUukwqXmi/rFQiAp
AHsc8AylOO9O4kVQzeJ/K/L/fCPnG4uSNiIdB7LxADxIG5H2FcvgT14zchzinqX5
KQp+AzH2FUKm0zmo61OwSRjpXhUkCOFEh/HKWlq2wh5URa11SB1VZkQXbQmJUyb+
Zq+ZqXiLzWcevSXqd0otZHcPjqGFoQ==
=CmZ+
-----END PGP SIGNATURE-----

--BaL/pJNAG9sfCpnU--

