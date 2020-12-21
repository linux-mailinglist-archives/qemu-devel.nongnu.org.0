Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37C92DFD79
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:25:35 +0100 (CET)
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krN3y-0004aG-PC
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1krMw9-0008Fn-Pa
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:17:26 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1krMw3-0001Ob-B3
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:17:25 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DA6995C01E5;
 Mon, 21 Dec 2020 10:17:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 21 Dec 2020 10:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Epq3EQwJgZ5c/dOkaJef0AxChoI
 N4oN/F5bNe0juSek=; b=eAoygY6MTcaihh3toLpbgXmOpCLDkxuh7P9fPjcX6X2
 U2BHcoZaEFd012y6CaJpMQvnw+vGnRZKP48WPw16cNfKql+M5BBrK8WdICfRYAq5
 1IfXZTrk/AdxJOvkDFuS5L3eH7T/ee/OjF7zqm0aBT/Ju3UnnP0Bj4JGSr+LccRJ
 fJ7vCXAWBiNZB3bR1Eofs3ph/NxKbhL6OnJCWXWFs8a53iserCiZY00jyo/suWfL
 f/Da12xe80610vyylH2qz7CSg01ILBjm2wUvid1d9EmJSS9UYKAtHbj/0AvT0kFV
 uWimebSs4EB2PCPbt41QEDGoIiHhR0/GESu/ObpWt6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Epq3EQ
 wJgZ5c/dOkaJef0AxChoIN4oN/F5bNe0juSek=; b=cakk9asaZnzbapeAbvEUE+
 1dhpaBAoX8LzvtVH7GsMUtJc2Vop5sMMPZh2SXA2yJejg23aJnwNRoNsHxElsmsz
 e56ClNHsCLOFR7z+L0yZ/npiILY2aIsOumkqBghViVuz2/TEzBXwCe5D+4vAKbey
 FBM/OMH8nMkqx+pZKDAy0TQwRqX/tcmgprr9Aqhn3anXOal8tZQoKh7k/MtyGc4g
 pr5SJkApIi3sxwcQAUu0NpUUAr8DF96JyelZIauQ1QLpgiUMnTHAZRH+iYO8UPYj
 1s1cCPtAka3z7m97Qdk8szBl07MLxM68plDHo4nOAbXyeSUWGQxPlBtqhhVGawxw
 ==
X-ME-Sender: <xms:ebzgX1WosWfWb_kErNeDTVmDCb5Hk6ohET6AMc0NRTB-AZsS7wRujA>
 <xme:ebzgX1kmM_Dt0dTKvBOi8jJEkBjMDyTYSN345aIuqRsnxEUHYwXvzlwifm1kareZc
 FnbQQiBz0a9C4skRO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtvddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ebzgXxaip7lH0wd4PRLnze_9t1SoPNk1Mh-7dz-B7C2IBFdooFhRYQ>
 <xmx:ebzgX4UzK21qm4UeINDYcbq6GPaoqN1wRgj9kK7RN4_65MuyYTrK_A>
 <xmx:ebzgX_kxjlyZmqL4uEvx0-nx44Dwo6SreFVnSPOjzaoJ7htJ1r_wiA>
 <xmx:erzgX9gyz1rcHxq5hZaFZKzylHqWBLXM-vcJJvwlF4YJds9acENeBQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1609824005C;
 Mon, 21 Dec 2020 10:17:12 -0500 (EST)
Date: Mon, 21 Dec 2020 16:17:10 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: Dropped/disabled NVME support in qemu
Message-ID: <X+C8dpngmpVsy0Q3@apples.localdomain>
References: <bcf1a98d-e86b-7b34-e384-b4b7e0e22747@roeck-us.net>
 <77d714a6-9922-1541-9f32-6ccb6ff9ea0f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kxUr1jeybEQABEQH"
Content-Disposition: inline
In-Reply-To: <77d714a6-9922-1541-9f32-6ccb6ff9ea0f@redhat.com>
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
 QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kxUr1jeybEQABEQH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 21 15:11, Philippe Mathieu-Daud=C3=A9 wrote:
> Cc'ing NVMe emulation maintainers.
>=20
> On 12/21/20 6:12 AM, Guenter Roeck wrote:
> > Hi all,
> >=20
> > since qemu v5.1, nvme support has been dropped from several architectur=
es.
> > Well, it was not exactly dropped, but disabled.
> >=20
> > On those architectures, trying to boot from an nvme drive now results
> > in the following or a similar error message.
> >=20
> > qemu-system-alpha: -device nvme,serial=3Dfoo,drive=3Dd0: MSI-X is not s=
upported by interrupt controller
> >=20
> > This is the result of the following two commits.
> >=20
> > fbf2e5375e ("hw/block/nvme: Verify msix_vector_use() returned value")
> > 1c0c2163aa ("hw/block/nvme: verify msix_init_exclusive_bar() return val=
ue")
> >=20
> > Affected architectures are alpha, parisc, ppc, sh, and sparc, and every=
 other
> > architecture/platform where the interrupt controller does not support M=
SI-X.
> > After reverting above patches, I can boot from nvme again.
> >=20
> > This does not really matter for me - I run my own versions of qemu anyw=
ay,
> > and don't mind carrying reverts if I have to. However, for my education,
> > I would like to understand why nvme support was disabled, especially si=
nce
> > it seemed to work for me just fine for years. Can someone please explai=
n ?
> >=20
> > Thanks,
> > Guenter
> >=20
>=20

Hi Guenter,

Thanks for reporting this. My apologies - this is an unintended
regression. I'll get a revert staged.

I'll of course also look into why this was not picked up doing testing.
There is an nvme QTest that should have picked this up, but it obviously
was not run for these architectures.

--kxUr1jeybEQABEQH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/gvHMACgkQTeGvMW1P
DekpTQgAtFw4zjx3QzkgWJtpWIhtgG+H9z+4MEkfHyzakyYcE45ALrXNFNztqbFC
Rn3Ana/8n40xJNhz0erFlY2YyxaeM1y1pN8oSDnor7aFpu5YUqT7BFZyhjyg/6Zq
wRXxUyODuo912mzQ2ttugAf407WZkKrdZx10xBms3TxCjtm81UvHtobytxT88y09
9FH4qlkCFLMPXDxD/4orI7bPAPROKCVZx0D0jdO7AZkszd5ZXqQoBe4s/2bXW5wM
zVywSgEbSNa3U4OIZzCAkba1LpK0N86riwQp5UV6nzCq1Rgg7gQU5JMvGLDr+AYR
iXTFt+5q9xn5uN5X1Hjjkqprg4wMJw==
=3dwJ
-----END PGP SIGNATURE-----

--kxUr1jeybEQABEQH--

