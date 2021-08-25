Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D733F74B3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 14:01:22 +0200 (CEST)
Received: from localhost ([::1]:33382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIrar-0003wN-D3
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 08:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIrVC-00081u-N2; Wed, 25 Aug 2021 07:55:30 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:58119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIrVB-0001ZR-6p; Wed, 25 Aug 2021 07:55:30 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2B5933200ADC;
 Wed, 25 Aug 2021 07:55:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 25 Aug 2021 07:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=f7ZFK52noPoypUaj+gv4/Ft15kH
 hDsTDsDVE1UAwk1U=; b=PaS0oAF0E/7xd9OLMp41yow98eaetogsooz+1a88aKr
 4bURuwZaVoMik5X51cAK0XBrtdMJVCnIufw7NZRJU9KBJxZelTA50IhcSOOjr71O
 KUqqOZaGEC9Fwpgjd8BzDTivgpKNMidqTJbowrpT8Mp7qCTbZyjqE6srS/n2nqPr
 j6Vpkh9ibaveDqDt7Q7bLnVU8g1mkx6SFohqwQcs+oR/ux0Yteh6ZoYYuSLzD4+k
 fFIFJFszyKkwbPL8r1wa5WEB0nnvUPGjVdcEXFtgOKxG/UjoLPTyKBoEFEOysIw7
 rssOCOpY2hwZSJQDFKn5aMFl4zsLN6Szl1HLZZ5W46w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=f7ZFK5
 2noPoypUaj+gv4/Ft15kHhDsTDsDVE1UAwk1U=; b=o+45xbpZoSGjHAMZ4pz4tR
 IVRr+8XA+GlC0kPutJdbAQf4zK5yMn3qMf9JZw4wyvNgpX/3EpcDTPtFVfqXM5Or
 yDqa+J46ahb5bLDcZZ3KjoSsblKpX73XbnwlDpHBmQQTKHbJqnGFDLkY0ANmpl/4
 i4duz/vtNMc64ZfXrYmqs5n/5xB7K3Q3uC+dFw3B6gPVFnsiNKDoJejumd32CT1K
 52LnaZ6ekPPLU5s1Eh1GUY8BlFYwxbT4tOB/teNw7FFxRuQr3/ISJypRqCl1D9n7
 85I8ZevLtO7r1l/azLFHg5UAT76QGPfgPH+e86LPRHc7d6cVSSqsxqk5t34qeUpQ
 ==
X-ME-Sender: <xms:rS8mYTYwq3zPjhLoJVd6hiLJNGnp8YsxEIhOnBOVZkhDUJISrfLLZA>
 <xme:rS8mYSYn8m9Hb6vbiCxbHX8yjyf54NYgM9gU6xUNyb1bNx59eZ49rfFepqwGx0zho
 77Mwo1yNr1ep6n3Qz0>
X-ME-Received: <xmr:rS8mYV8nrzvFDXlPkm9dnOqCC8woig6zjUmrev2J6GkRNVQrB6oKK0yw_qy43WLmJXAAe_zRuYjPLBxkn5SLnpu25KLzminYWeHygMesHiMJ-mb3Ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtledggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:rS8mYZqJarlYmfKR0m6mFze1lXaxmrAY_YghBT3z0PnzcoDn6vIRBQ>
 <xmx:rS8mYeq2OEzcdNM6Rr4_QiGVCNkzK60TCu0dyYfkLLprgG8GKrRuDw>
 <xmx:rS8mYfS5GnXoe1amhCDsUyYHzpoSVktVxQh5zQN6vIyNVOn6MaPAyQ>
 <xmx:ri8mYeLGa0AoN2kAW_YlQjGpUIGPQinZZyVo-WUSU-XF0Q-yF8kBAg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Aug 2021 07:55:24 -0400 (EDT)
Date: Wed, 25 Aug 2021 13:55:22 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/9] util/vfio-helpers: Remove unreachable code in
 qemu_vfio_dma_map()
Message-ID: <YSYvqtavh4jMC/cq@apples.localdomain>
References: <20210824141142.1165291-1-philmd@redhat.com>
 <20210824141142.1165291-6-philmd@redhat.com>
 <YSYvMiYLE0wpgSSY@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iVFKZ5CgcTXF9njk"
Content-Disposition: inline
In-Reply-To: <YSYvMiYLE0wpgSSY@apples.localdomain>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iVFKZ5CgcTXF9njk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 25 13:53, Klaus Jensen wrote:
> On Aug 24 16:11, Philippe Mathieu-Daud=C3=A9 wrote:
> > qemu_vfio_add_mapping() returns a pointer to an indexed entry
> > in pre-allocated QEMUVFIOState::mappings[], thus can not be NULL.
> > Remove the pointless check.
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  util/vfio-helpers.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >=20
> > diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> > index d956866b4e9..e7909222cfd 100644
> > --- a/util/vfio-helpers.c
> > +++ b/util/vfio-helpers.c
> > @@ -751,10 +751,6 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host=
, size_t size,
> >              }
> > =20
> >              mapping =3D qemu_vfio_add_mapping(s, host, size, index + 1=
, iova0);
> > -            if (!mapping) {
> > -                ret =3D -ENOMEM;
> > -                goto out;
> > -            }
> >              assert(qemu_vfio_verify_mappings(s));
> >              ret =3D qemu_vfio_do_mapping(s, host, size, iova0);
> >              if (ret) {
> > --=20
> > 2.31.1
> >=20
> >=20
>=20
> This looks OK.
>=20
> But maybe it would be prudent to assert that index is within bounds of
> s->mappings in qemu_vfio_add_mapping? E.g.,
>=20
>    assert(index >=3D 0 && index < s->nr_mappings + 1);

It's not like `if (!mapping) {` would have cought and out-of-bounds
index value anyway, so

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--iVFKZ5CgcTXF9njk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEmL6IACgkQTeGvMW1P
DelJ/gf/Q01jDoqLMm8ZFRNSrB/6SpKJXjEsMqEgw1qtAYk8fTEzyGBCt2Ep37BF
gkZQkfvSTdoSgY9DfLh3EDoVc9BdeArakyenQzvM5uRtuKcauPoQKeLIg9IROfvU
EUIKJ/oviX8m2MZTB1sn94EfHPluc7gs08Rc3Z5ssYa6wrgI4xrEhhEnWU5dqsTQ
xBm9fq4uO4S/F3l/n6yrB57aOLY6sLiOvq1rx6HSR3ArrNCEgW56mEUAJ9t3MtSa
rYRIBUIfwxIRm1bREwn3vgjHAH5DFWUz6tGuluKIVixCx7EMaiQy/t23RQvH3HuJ
9tbKv27o4gRp37jd5zQ92SS1xgS/hg==
=FFOj
-----END PGP SIGNATURE-----

--iVFKZ5CgcTXF9njk--

