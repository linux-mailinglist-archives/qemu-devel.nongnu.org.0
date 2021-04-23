Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8566A36907E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:44:15 +0200 (CEST)
Received: from localhost ([::1]:50502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZtIE-0003DR-11
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZtCe-0001vY-Fh; Fri, 23 Apr 2021 06:38:28 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZtCa-000864-BF; Fri, 23 Apr 2021 06:38:28 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 570C65C00EF;
 Fri, 23 Apr 2021 06:38:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 23 Apr 2021 06:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=GR81sIHIm+DqDsxSL7Z5kj7OUd3
 QTdcuVXzPgpXMRAc=; b=B5D9FEJxnzVasqQ/lj4hO3SJjx3r7ZbjIUGCTxfc0eu
 KLk4YKLPNGgO0+FP8y2gMxmx3KPGtUghqlCFCWm53EvGzGwJfMDCix6hTIhjFhiL
 bAjHEoZtVg5kdshSAjr3V5VOdg5uT0xBIONyabuNegH73wV56NXibNTXR2KOcyq9
 ShW3kWARKBucd1P442jxflhnUz8676BvnaG5nAvd1cnEVvHMKCtzrn6g+2U3Ql6v
 Nz6b6axSR3jvIQdxD9CorrbvIUGLftZP3YTeNENhzbjZ6lgv/TUiIG97nub/F/EY
 sLQB+ZRtrnwgkjCq9zYIU2C7xOP7KHFyiFgAPJZxzOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GR81sI
 HIm+DqDsxSL7Z5kj7OUd3QTdcuVXzPgpXMRAc=; b=GkJe8LjmTwd7Z2tIm80bga
 zhC3B5mYjQHk4vpQDcsQhXhC4gpHOYtVMXG89aDatllTmZcuY4w0YL37Ajpqs4TH
 LUN2WV1Kqetucp2vhpnP67PSG8W7hBDVErsEfAclJB2hels8gE+9JluREzGUyvIu
 zFcBD6cugwvydG5DWQysLrij5LdtXPZx8luIfHethmaw0f1/J6mvMYt3b07QZ3Dv
 rsknkeAulGxUgSF1rDyqwHwl5ncA3wwpqdOJF3SUMK2qzJRQ+3f2DONwEgdM0ULI
 +1I39bE6lE8geqUz+HqwXXjvb3x5uMs9lRvNGkkw0r0XusM37ZI+oIcosMorNYiA
 ==
X-ME-Sender: <xms:nKOCYGUnB426B0QnQw1TRsB5nlaWCf9IX03K4laEzV-rqNpLfVXPKQ>
 <xme:nKOCYCmggqjC-Lv6IMHK31xG3Ikg9y8CVYdboVVdrz6wvEHN-Zpycad0nKKB4qgZz
 Ju9vRXJfKZpWHERiuc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:nKOCYKZfr0Yw86S5TIS3pVZaFVi9Lh8uEa0wpPbQmqELrKLGXQeb8A>
 <xmx:nKOCYNVJhg5fA7aob2VJbn-xtHKpjdLvJwa-zr3TCq11Z1nM2ArVxQ>
 <xmx:nKOCYAmSItj4w0I-YMJ8k-kNJxckHHLUL_p3K6sAgV7V7z9xBryNqQ>
 <xmx:naOCYPui4JsnSvO0LCHDwnmXl9gXDaDIhtWKP59qqltJhebUwXx3Zg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2235624005A;
 Fri, 23 Apr 2021 06:38:19 -0400 (EDT)
Date: Fri, 23 Apr 2021 12:38:17 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.0 v2 0/2] hw/block/nvme: fix msix uninit
Message-ID: <YIKjmTAdVLo0Hz+K@apples.localdomain>
References: <20210423052127.512489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6fFGx/HTExvNtF1P"
Content-Disposition: inline
In-Reply-To: <20210423052127.512489-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6fFGx/HTExvNtF1P
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 23 07:21, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>First patch fixes a regression where msix is not correctly uninit'ed
>when an nvme device is hotplugged with device_del. When viewed in
>conjunction with the commit that introduced the bug (commit
>1901b4967c3f), I think the fix looks relatively obvious.
>
>Second patch disables hotplugging for nvme controllers that are
>connected to subsystems since the way namespaces are connected to the
>nvme controller bus is messed up by removing the device. This bug causes
>a segfault but is *not* a regression and is related to an experimental
>feature.
>
>v2:
>  - remove memory subregion as well
>  - add (possible) patch to disable hotplugging on subsystem connected
>    controllers
>
>Klaus Jensen (2):
>  hw/block/nvme: fix invalid msix exclusive uninit
>  hw/block/nvme: disable hotplugging for subsystem-linked controllers
>
> hw/block/nvme.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>--=20
>2.31.1
>
>

Peter,

I know you have a lot of crap on your plate right now, so for the=20
record, yes, this is a regression, but not release critical, right?

I am not aware of anyone depending on this unplugging functionality=20
(which according to Bug 1925496 is and have always been flaky) in=20
production. Basically, as far as I know, all known uses of this device=20
are for development and/or testing.

--6fFGx/HTExvNtF1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCCo5UACgkQTeGvMW1P
DekxjAgAjQVnrF/4xVem32s2ts0GUW38j9uOO8urK+tpjr8uAY2xFNCTDHWmTnfx
C2YA2wVcDd9syir4HFAmwayvqFQki1GeqGtRukDgPxGge/XZNHP8FRcbJpH6a9qt
8n9ODBbDcs9bNmJAzBEkxzqFcD2s9klyJbowbJbLc1sJzZvpTN84lj7qHzfdXmod
A5QRbFUeMy3ACmIVkWeLdiP4MzbTPgYUp1RurpeePryC7+axwLvPny1Eq8U8vLNd
klJdi2GRcVXanWx/9OZXhVMD4iBqCYcHhPjG6E6xkpBu5E0eGVwcU+quG6/WBhGt
1JbMeFtVXx0vRswUSAMyc3yAYqu5Vw==
=PJP8
-----END PGP SIGNATURE-----

--6fFGx/HTExvNtF1P--

