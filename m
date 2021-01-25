Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4500A30226C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 08:31:45 +0100 (CET)
Received: from localhost ([::1]:47638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3wLc-0005O3-FD
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 02:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l3wFL-0004am-VG; Mon, 25 Jan 2021 02:25:12 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l3wFJ-0006Bn-5a; Mon, 25 Jan 2021 02:25:11 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 745B75C00CE;
 Mon, 25 Jan 2021 02:25:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 25 Jan 2021 02:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=hZ3Fytq+3KnzP1ZMhRhRL8lXh4j
 vIJq7aedn99FNI6s=; b=rQY9kH53Fx0wHuL04u26tCeAtfq3it21eFVBEfHQiJq
 vFVJCdFwQxws39Pyy8CbjFaJwq0iwWhwB3ixJNjYs2sWSumAp31nTCDJniIQKeYD
 TchsSqK3WrB3U77Yjrj6wXUUH0oWm2E45x0PHGUS/l56/L78W7gmlsq1diewAFpp
 Onab/pB0yI/Hh63pCmoxhXoQx3K69uJ5BcU4Xh/JdWsLLcdUOdMcH9/S/MHva1/8
 sLPDmlXMDTDNJoz+rgTAf4sCgN4Hr2L/IdLkN1ZhpP2PtKfHc6K052HCoeYb40Ta
 7bARXOC3zzLq0qKjb6tWMjamGhjS1+2zny6AW0NtFLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hZ3Fyt
 q+3KnzP1ZMhRhRL8lXh4jvIJq7aedn99FNI6s=; b=k0s235Ri0e8ekjVrhrTeOp
 hfmB5cXHV2fxZLc1FJy5BcYv8AzWfjMjpvsYVZBolrKCYQj4zRy2NVRVFpIka3nD
 xGd6wEzZLXS/tlh0TBJqQQ/PTmXz7gu5ujDIiTzhOS0SDJ4pbfDGSEKywUDf7eof
 krN5CEnPIaCHe+JKMQ+yP0LhqrD5zAHIGPYsLmZpei6P7jcmz8Rbw++FzWI4N3Wz
 jLlQA1PXd4RzL102cBYITsnczKr00PY6wP8nrFoNvNcSsni67RsuQVW2MOEZHTZu
 ePxtDIKNQnv4LPmThMBYwMz0Z8UrRp9fsmQdo8duOh0+1lqnR5sPMbI6acyRLtjg
 ==
X-ME-Sender: <xms:UXIOYIrErNNJKKoOZDggGnH5rK-e62gAUOpZaRXHCI-eFA5nbVRCWQ>
 <xme:UXIOYOkr0ZwT758Km_GQyN9O7H6gp8h7G0Bh_HZoy3-HP_zULenxX7IcDIp3rckjP
 DNWx05fAaMHtzqVR4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:UXIOYKH9c9y_c4wiUNVncNdVu6D9Isy7Gvep6NAYKGl5N4rYgaJ3sQ>
 <xmx:UXIOYHqQWEOhUJia4fZsyU6Nld1WLKEBvnLTeGG0U_hgmOE5TRwkiA>
 <xmx:UXIOYG4p-knNLuQassRhR2loV2BZLBcjh02o-oeogIZRmIIIqAJvdA>
 <xmx:UnIOYB0d_ePcWFA_1E1bqCzQc0kY6-lrAhPkMRBwuFdVoRId4h5wGg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C6F6424005E;
 Mon, 25 Jan 2021 02:25:04 -0500 (EST)
Date: Mon, 25 Jan 2021 08:25:02 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] hw/block/nvme: zoned fixes
Message-ID: <YA5yTh/OlS4zYGOu@apples.localdomain>
References: <20210119135500.265403-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aUu36x0Xw2CSnPXA"
Content-Disposition: inline
In-Reply-To: <20210119135500.265403-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aUu36x0Xw2CSnPXA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 19 14:54, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Patch [1/2] fixes the zone append bug reported by Niklas. [2/2]
> refactors the zone write check function to return status codes in a
> different order if there are multiple zone write violations that apply.
>=20
> Klaus Jensen (2):
>   hw/block/nvme: fix zone boundary check for append
>   hw/block/nvme: refactor the logic for zone write checks
>=20
>  hw/block/nvme.c       | 89 +++++++++++++++++++++----------------------
>  hw/block/trace-events |  5 +++
>  2 files changed, 48 insertions(+), 46 deletions(-)
>=20

Pinging for a review. Dmitry maybe?

--aUu36x0Xw2CSnPXA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAOckoACgkQTeGvMW1P
DenriAf8DajsZIgS5Husxxz2wUPFufc/bZZiYNMzPPnawoxdFn0FhP4S6mPfaotY
1Tm6l9XPhfaCgWf9SktnOYS511qTxVfJ5v5mgvuJdb77KR/qcH95Rp4zRrKkEM3y
AztHyOQYCyW4YZ3dVHX9D+utgdWeVth9X1D+wlmQrsdTFqDG0P3iwNjPCMtogO/F
0KpS5brwfTwL11WDHrvZ8pkiBgjr4acx37tyX6T6Q518IfsdJK60RPX+d+oNxk1w
U6F5RrQy3ZsRZ6G3zsUoykQOnIWjZ3RTK2aC6ZGmIihln7oU0KBnkgHgrOanStkf
J3TvS/QO/FcKEXA/Qu9k+d3lv9IqWQ==
=Hh29
-----END PGP SIGNATURE-----

--aUu36x0Xw2CSnPXA--

