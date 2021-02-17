Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B731D69A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 09:31:48 +0100 (CET)
Received: from localhost ([::1]:55368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCIFP-0008SS-KV
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 03:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lCIAa-0005xn-Cm; Wed, 17 Feb 2021 03:26:48 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:35847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lCIAY-0007WO-SK; Wed, 17 Feb 2021 03:26:48 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 6B60ED0F;
 Wed, 17 Feb 2021 03:26:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 17 Feb 2021 03:26:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=WTM4VsRfc6aySzUt1/mI/OFN0mo
 c7EzJTWQgvWhbx2Y=; b=UZmM+QlzvbVAaYEgCaQlTtz/fCL9ci6PgllwoibRCVK
 DXdGxN06M2JEkH/GHXcJDNdJ7N0XCqtDyr3eYsKnveZ5+fPX/i9Gm4JbTwYq0ik2
 TGYTKr/vssXtggjf+/RKSmrSuci4XvXBDFLd+8JOR5yBsUmOHA9yGZE+qaGaBioK
 kS0nVpv9HCxIDgOQ3EbG3TDByH04iDzxw5SCIUIxQVcu30N4t0oVXryFkR89kmWc
 DnEfXxKjYI4lt1f1VulXe0hYbdeQmbYtXAL1NJ5XNIFwKvf+z6v4vi29rIDKbrGL
 VSpv/NqDfh1xD0Gv9jYpcsrNnuSjw2UKWGiLfiUqnjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WTM4Vs
 Rfc6aySzUt1/mI/OFN0moc7EzJTWQgvWhbx2Y=; b=mFOuJSCaRQA5GXHWRS5/pR
 hzrpTFSUTTWBq89/Z0LRqELZ/rA21/W8KneV0U7tvcjb+AgzWjAa44MDHETPX3nj
 /Cwv+qrXHo2y529jkSLYN/yApvOloJ/kGpIDaFrrCbn+SLAk+IQr0W9pcwNYaBDG
 AqWY9SgyfcSklMZElb3094yD9RkkTUJ744uctWJr9H2ogv2/hX9RNiMjJQ7WaxdX
 IC8xl3eIwgwBddp6q0yVNYhB/2zlX4dSUb+dQXvdcIbB1W+O93TdyT7KceOcJpjk
 YacvAfFNgJEs+sZSFuKlxiGOPdZ3/ZUmjV0aT5ojkonRKCXUNlAd7C6mTsEbM9Kw
 ==
X-ME-Sender: <xms:QtMsYFgOmAy3S1vqlK9e__X_AN_G28wPuqPFjkQSTE7fBmdydY5kgA>
 <xme:QtMsYJ-sNus7SBg1lhKiezOHQTAoy7L9slJB077zSRb3BqMhtPRZkddD2-JNXAJeB
 u7IBgur5NHu8rR9Pag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjedugdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Q9MsYB9PF-tE_k3wzASAj16VvBXYmYVd7rNE6uDBjpXbPx1RZpHtHA>
 <xmx:Q9MsYCB3QZ5m4Gq4hlqwJAWKBIbBzAoSrr7-kYl_MU72Mqj6Matrqw>
 <xmx:Q9MsYByCZdPKTR-fUF1K2vkoHOCYjbiR__4UESOJA0xYgS3KB7KYjA>
 <xmx:RNMsYM55wCujDbKuz2FaAyW55qLHtxpko3xMpIY2HdNbjYKpkSEiAVopTKw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id ACF0124005A;
 Wed, 17 Feb 2021 03:26:40 -0500 (EST)
Date: Wed, 17 Feb 2021 09:26:37 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH RFC v3 12/12] hw/block/nvme: add support for the format
 nvm command
Message-ID: <YCzTPdmLgQywAtf0@apples.localdomain>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210214230240.301275-13-its@irrelevant.dk>
 <20210216231632.GG2708768@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WoEHkBq4mxlXztF7"
Content-Disposition: inline
In-Reply-To: <20210216231632.GG2708768@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WoEHkBq4mxlXztF7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 16 15:16, Keith Busch wrote:
> On Mon, Feb 15, 2021 at 12:02:40AM +0100, Klaus Jensen wrote:
> > From: Minwoo Im <minwoo.im@samsung.com>
> >=20
> > Format NVM admin command can make a namespace or namespaces to be
> > with different LBA size and metadata size with protection information
> > types.
> >=20
> > This patch introduces Format NVM command with LBA format, Metadata, and
> > Protection Information for the device. The secure erase operation things
> > are yet to be added.
> >=20
> > The parameter checks inside of this patch has been referred from
> > Keith's old branch.
>=20
> Oh, and here's the format command now, so my previous comment on patch
> 11 doesn't matter.
>=20
> > +struct nvme_aio_format_ctx {
> > +    NvmeRequest   *req;
> > +    NvmeNamespace *ns;
> > +
> > +    /* number of outstanding write zeroes for this namespace */
> > +    int *count;
>=20
> Shouldn't this count be the NvmeRequest's opaque value?

That is already occupied by `num_formats` which tracks formats of
individual namespaces. `count` is for outstanding write zeroes on one
particular namespace.

--WoEHkBq4mxlXztF7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAs0zsACgkQTeGvMW1P
Deny0AgAtvN/ZOR8X//58HIiNA4Ck8m9RwHPfvfXil96KSWN/Jt1FxmeYnhLhD5v
hz1kgKWBDjSalwWo+ItjAAYCjyVjnwevS/8rhdHJF/Hj8iyGkvJOsSnynn7iiQym
gRjO0SEh5Q/TSOTPfUI9u9rQSqJjFl1GXs55I1N7z+WuXbExQBuiu9ZtrXBjcEgO
s+rS1wk4RX46MDsfTHaFJjdic94lnpQpemb7HTKIcn4QwYI+Y2G2lgaGX02RyCeY
mv4pR1BecPTesbHmcUn1ViXMBl9MS5WDsXbBpkqDhyD2Mdr8YMiGHG4L0w/uM3Cc
A4SaXWSW1Etu5/QpCs/6Xbi0h5XUlw==
=TP8i
-----END PGP SIGNATURE-----

--WoEHkBq4mxlXztF7--

