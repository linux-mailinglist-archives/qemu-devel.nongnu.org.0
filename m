Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025C23171E5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 22:05:48 +0100 (CET)
Received: from localhost ([::1]:42250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wgE-00088U-KC
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 16:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wYY-0005Ss-Gk; Wed, 10 Feb 2021 15:57:50 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wYL-0006wx-Fl; Wed, 10 Feb 2021 15:57:50 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 79A1A5C0055;
 Wed, 10 Feb 2021 15:57:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 15:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=JmxZvjjcYlTM6Rkc8m4KJKwf/BH
 uH69EYu7DKCGdvdg=; b=SQYTQhQzgAQMva5b8093AycauLTXekceMvNrSL5vcGk
 IJJUYsuv+yBhGrPZkvHSu54aCK1mhj5MIQ3VZBe/fBB3y/20xvIWbvGEPIaV/Han
 Z4m3ZCiFHZ60Z0Ns2yjFwryHk3CCulVh8UygvBr7jYKfO5+90F8FA0C0Mkykyzdh
 GZCQVTqSrxhCDqUDbXvCem9BIm7GLAXq4BtSdU5a16eJiCBUjZBhsfaNEN4aL6+G
 9/GIZeqYi14PcHttJ2A2zb3WsdLemfkZTjS9mx6iNw23LHJYr2IF7u/5XjrSFZMR
 3bgdRI3BCf01yQgHdPybPLneQf8eTYxOwGpBMTpHEgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JmxZvj
 jcYlTM6Rkc8m4KJKwf/BHuH69EYu7DKCGdvdg=; b=r8z8mOuierfmAPFRWQp9Zl
 ouQ39ZMbx6b/9sP7NqF+/qnlCFgrKwL9GouDM9FWHggM8Kw31UqDDtrUO3QzXyeL
 6pIMwy0nDalt6ljDIhCRFsssHU+jjS5wFZp/3RO9HcgjgfQ1dA0NVEDaHzISUYjx
 +jxh+OiY6R2arfGXRqAaLDX70+hM7zrJCAt79LpZizw7JB4NlX4B4rCnnYNosQYW
 B/H914RILzvtsrAssXEqJjVPFGydPqJLvRINbtlap82Pid/qmJq1PdVlMsg7bmFV
 4FONJzYNmqnlfAxQbuCrhSY1FYkAhJ8Os7wg/6go+pDSzMBGa1wWd7zenpNR5u7g
 ==
X-ME-Sender: <xms:v0gkYD5m28nKgEmFWQimWjky0ul0BCTyfElQKCso7h8edGi8LmL4Hw>
 <xme:v0gkYI5YZF2lI86t7iQ09S0m54v1ZkU8UBZKjd-YYCGWNvOHxuA3zt8hxlK6L3eks
 sWvVpboCUI7xYqMu-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:v0gkYKegkalHzKCoBffcIPmp0UYVJqAl1idN9wU7xBIagiueQYx-rA>
 <xmx:v0gkYELdLjoWrXgI6z4FLRMFmW0iYZrUgheNHEn15U73-S9Y6y19yg>
 <xmx:v0gkYHJF2VECVewQtejmbhEJnXWEz65cHyAK9ZKEP3Uxa8GEh53rwg>
 <xmx:wEgkYEoi7dH5UR1NPYbbm5oF7kFAI1X7PhqzAlpK9mSMTtp4BD1fvw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CCE124005A;
 Wed, 10 Feb 2021 15:57:33 -0500 (EST)
Date: Wed, 10 Feb 2021 21:57:32 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] hw/block/nvme: use locally assigned QEMU IEEE OUI
Message-ID: <YCRIvMhmKpyE+Xj3@apples.localdomain>
References: <20210209104520.579084-1-its@irrelevant.dk>
 <55a9c72c-f79c-5cb5-6c69-ad7008fd8e6f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GxfYovuUL9O47GUt"
Content-Disposition: inline
In-Reply-To: <55a9c72c-f79c-5cb5-6c69-ad7008fd8e6f@redhat.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Gollu Appalanaidu <anaidu.gollu@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GxfYovuUL9O47GUt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  9 12:10, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/9/21 11:45 AM, Klaus Jensen wrote:
> > From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> >=20
> > Commit 6eb7a071292a ("hw/block/nvme: change controller pci id") changed
> > the controller to use a Red Hat assigned PCI Device and Vendor ID, but
> > did not change the IEEE OUI away from the Intel IEEE OUI.
> >=20
> > Fix that and use the locally assigned QEMU IEEE OUI instead if the
> > `use-intel-id` parameter is not explicitly set. Also reverse the Intel
> > IEEE OUI bytes.
> >=20
> > Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >=20
> > v2: drop telemetry and add a check on the use_intel_id parameter.
> >=20
> >  hw/block/nvme.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index c2f0c88fbf39..870e9d8e1c17 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -4685,9 +4685,17 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevic=
e *pci_dev)
> >      id->cntlid =3D cpu_to_le16(n->cntlid);
> > =20
> >      id->rab =3D 6;
> > -    id->ieee[0] =3D 0x00;
> > -    id->ieee[1] =3D 0x02;
> > -    id->ieee[2] =3D 0xb3;
> > +
> > +    if (n->params.use_intel_id) {
> > +        id->ieee[0] =3D 0xb3;
> > +        id->ieee[1] =3D 0x02;
> > +        id->ieee[2] =3D 0x00;
> > +    } else {
> > +        id->ieee[0] =3D 0x00;
> > +        id->ieee[1] =3D 0x54;
> > +        id->ieee[2] =3D 0x52;
> > +    }
>=20
> Correct.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> Ideally we should have definitions and use them here and in
> qemu_macaddr_default_if_unset() instead of this magic values.
>=20

For MAC-addresses we seem to inject some more bytes.

And thanks! Applied to nvme-next!

--GxfYovuUL9O47GUt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAkSLoACgkQTeGvMW1P
DekdJQf/eYTQ//MIZmRijNrMl7Q63oq4GrABtRAexkNkMxncPtRMKI1h6hvK1w+g
RxyW/X67mPfpilHAvgcZGcnKsFwJtQgtZYNB00jVfBOt3gMJ33SS5OvOUAA1/+zD
TFDP8tvLH0HG9ATiwbhlvUoNtfPRCuOnQH5TD5/v5uy4/5w0oe842s6NJQwMGc1z
cS8onL67t6WHUvmJZyzDxVb9DP32sKNN6L80qFa0AviWgoELiegqpR9wmU02QiBU
s+GD5GnuOvozsUqgesIWptKj9v18B3Vh3+QXnVOG1VyYurdpxbnVxRIXyppmaJEj
zfJ3DI+SEaqZCVcSDUqhwGuJuofW9A==
=v7fE
-----END PGP SIGNATURE-----

--GxfYovuUL9O47GUt--

