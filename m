Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D55387C9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:36:19 +0200 (CEST)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlBa-0004ur-3Q
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nvl75-0003Ad-O0; Mon, 30 May 2022 15:31:40 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:37795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nvl73-0007BS-MZ; Mon, 30 May 2022 15:31:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 07E2F5C01AD;
 Mon, 30 May 2022 15:31:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 30 May 2022 15:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1653939092; x=1654025492; bh=fD
 XnaNudkg0FCqSyqoFHblaNjjzIKSyPhByQ8zNxPFo=; b=ZmYRLNXhV/MhXuQIHb
 qTAN73gF/VortcKe6SIeiGlKapWTVtB0tTLc5KxlOIyhX+iJDwLX7y37aGk8Z2v+
 rRILku8ygWJ3w54qXGILUPc38J4rgv6PPV9BF7ImrKlwg2l3KHxCWmiynnzTw2yk
 EEmB0PzSKu6o2P5nIs2edC8zaNjyY+/BVk+XZ5Wbahsy1DtdHDJ7XWHi5eBcV/O3
 1xHoi+fEKFuM/aMdo5Kr7BJCVSWrVRshZkJbzP6FdBuZB2Wj1PWTUYOJ84MxgL1C
 uBiFOEEU9G/Q/jKcq8B9HhhMr19Cj8GbG05ltxOSUkY54cHTa00zRUccxg9wA0F5
 vqJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653939092; x=1654025492; bh=fDXnaNudkg0FCqSyqoFHblaNjjzI
 KSyPhByQ8zNxPFo=; b=CY/otzmvlEdWWJRXJMzSAej159Eg3Ohmpeqiywm4a+oJ
 56uHlJXHSw2aSd4Hy+ogTYSK1yARoKx6lja28aSuG3E0Ed2oJ18dMKGDkSV8AW0L
 OVn6ZkNmzUg2ZCNKXXZ0pqI4pMkCFei1GH0s7ZCrtk5tWALK6jc+bQEwd/ktRiZs
 opE8pjcC6cDI/WjaFP2JNj4abYoZDdozCLGklI7qIFKPO+eWFLKxW6KGbfXWO1Jg
 Dz4vJbE9umk3t3WYBX1ByFunXFb2ZHHQaeoK/cWW2+SAG4kcSrIlUgItJfHkbuOv
 cTy7oWN4Mc3iVNRS/XLldk7ShT7beijJt7X4T/oYRQ==
X-ME-Sender: <xms:khuVYorZfjV4SFAGt-osEMI6EXCTSCM1w5mEyn4XOnjhyYbc0Q-gZw>
 <xme:khuVYuq3oj0UOnjT38UvFKhHQJ51Xch_kgzEUUrif_bK3mTkZ4S9TWw_UVaUcYome
 DqL2ftVGl9MBAjM6Ek>
X-ME-Received: <xmr:khuVYtPinN497sUXX9ZAYbyXYiwQ1hVrkQxXPw6sPy7LFz0HNyb5ZV9ZAbi7inJgYc73AbSFQdXJ5csypw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeeigddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:khuVYv6R_RWXCN5K1pyqF23lXqaD9M-4QyLj8CUJqP8l-_HIfHI_Tw>
 <xmx:khuVYn4hjUSeCfGnyL2aamxUXyfFjTQYRjpB_kW0E43d2496Wfp87A>
 <xmx:khuVYvgSPaExe8lNuUiIiukh22UgUkFzt5SKVY87-al0M-yo3VBOhg>
 <xmx:lBuVYtTCTrVN9QV8FmKz2YxGJJCkHagNDgafVG46OCOdATJFMkiaRg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 May 2022 15:31:29 -0400 (EDT)
Date: Mon, 30 May 2022 21:31:27 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, libvir-list@redhat.com,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] hw/nvme: deprecate the use-intel-id compatibility
 parameter
Message-ID: <YpUbj1WDrGDBFc8d@apples>
References: <20220429054149.2169473-1-its@irrelevant.dk>
 <fc24ead8-4495-f67d-6fb0-c2d11bf94684@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="awec9+3QSjqRXJOL"
Content-Disposition: inline
In-Reply-To: <fc24ead8-4495-f67d-6fb0-c2d11bf94684@amsat.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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


--awec9+3QSjqRXJOL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 30 16:37, Philippe Mathieu-Daud=C3=A9 wrote:
> On 29/4/22 07:41, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Since version 5.2 commit 6eb7a071292a ("hw/block/nvme: change controller
> > pci id"), the emulated NVMe controller has defaulted to a non-Intel PCI
> > identifier.
> >=20
> > Deprecate the compatibility parameter so we can get rid of it once and
> > for all.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   docs/about/deprecated.rst | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >=20
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 896e5a97abbd..450f945ac25f 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -356,6 +356,14 @@ contains native support for this feature and thus =
use of the option
> >   ROM approach is obsolete. The native SeaBIOS support can be activated
> >   by using ``-machine graphics=3Doff``.
> > +``-device nvme,use-intel-id=3Don|off`` (since 7.1)
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The ``nvme`` device originally used a PCI Vendor/Device Identifier com=
bination
> > +from Intel that was not properly allocated. Since version 5.2, the con=
troller
> > +has used a properly allocated identifier. Deprecate the ``use-intel-id=
``
> > +machine compatibility parameter.
> > +
> >   Block device options
> >   ''''''''''''''''''''
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks!

Applied to nvme-next.

--awec9+3QSjqRXJOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKVG3kACgkQTeGvMW1P
DenNSQf/fn677Avk9WrJ9QWHctFRqkv7TPcrnhfW1GD5gtiX0gErnQB9FxtEZTmS
gQW4ffB7kOP6Itw89NMh6E99Mz+STLl6fVfEH61oOOlh+ZGdAT1WoS9NW/uEWI/S
AZDzOLkBYLDjebjhnBd7sOTJluUb7wHu2Q+rsOPkTVFR/9O4QbQ7D4LSPtNovD/r
IzFPhVbXhQ4kNb8fHKgqKfoteM0EcnWF9B5u554Rnpt6qqAg009Qu8fwUrtbY3pq
RZv6NjUZizab4BOHArkYmGoXnK1gulSmq50RFtB4VQSFDrjAXI6LTzEWPtCKXMRF
/QnvEX9nDWhH1mvVxSqUlkaBlZdtjA==
=5Jnm
-----END PGP SIGNATURE-----

--awec9+3QSjqRXJOL--

