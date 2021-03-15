Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9264633B115
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:29:29 +0100 (CET)
Received: from localhost ([::1]:41750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlPc-0007eC-HH
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLlL8-0006qS-Bp; Mon, 15 Mar 2021 07:24:50 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:42927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLlL5-0001dI-9W; Mon, 15 Mar 2021 07:24:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AFCCAEBD;
 Mon, 15 Mar 2021 07:24:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Mar 2021 07:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=tJXlSls+v/eA96TkiatdpSUS4LR
 9cnbrUKBUT5plcL8=; b=Oqpv+9mNHKGFIwrwKVIbB0BZNjvhJOmBHNgi5FweXUZ
 XmR8CCcznZ99jM10aSFNoF45fPOJEtft402236eqDSTYungOqBaI3T0Gx760F/sS
 5GUgL15DtLEnENjZ03/bRWXYQ/eUfrvcA6ccWZNcw2dFaXBgM7Pppbe7D4uYomRp
 rYvSlQeMRrK770QzxGVpgGQbHoUDkKnRYztbAfGO0A6Geh6UxmTI59tqDcsLTkYE
 bk4a824w8+DrQ1kxTc2wAEyI7OgbFl99XiuhAgDB/xSl1PSnEYHGME4g/KYFsT7Y
 WiQD0LMQWHnE0irhlNBbEp2LPRa4EBWPJqDjuJTOx3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tJXlSl
 s+v/eA96TkiatdpSUS4LR9cnbrUKBUT5plcL8=; b=bXBWsqYXBLDSsG1a7fBKNr
 HKjK6j1c7qnYJKE9FQoEG3zvu1EhI3hGpu3tFbJUdDiPLFLbHyZCWYaCPoEaOTNX
 yS4O0BOk2Poxwr/WCR1lFQS0xcSAzVOBDCMHor0BJ8XAOD6VB5XYsF6V5HpqX8uj
 zPZk8YX+TMBFA+WS4BRHEByMUCdOT8cpQ1OGpAnCK9EzU6diD83S+qQeF+FsyRH1
 F+gE5C0KddY331Tnz/2cO5mpXg7hRwzEJ5lzkkHJQTCWTX7Zv9doiUkRJw9h9RSl
 z0ZjsULNMlOVjgOMBm/Rck74kIwX4/tTM7u6hTiHRpLi6HQ7UarBzMHYQD2KR0Tw
 ==
X-ME-Sender: <xms:-kNPYDYh6vaFSNQ-fvaHMz09sgz0CJMxn7H_y1rFX1yyq1cq9h56KQ>
 <xme:-kNPYILwmiAmjkCJba8BjMA-6VYZVAHeSexxh0Ft1bmNYlCaUywO1Yg6ipNGyt-fa
 jaikYklPLVbF_AsHKI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:-kNPYECC6GWTzt2tXyXpHeAJdgLaj9vuxWGXOntYRgeoQ1VreZqhUg>
 <xmx:-kNPYEPcGOVmGxg7nT6tMbTRi508A-krttt_29SJL2cvqH38Zk7r8Q>
 <xmx:-kNPYJXksFw3jG68QaU1-4v9iSrMNRV7_WvEVmPb3_7kp7bhc0CeZw>
 <xmx:-0NPYEmqYEv-oWsFg116Hf_3GFCHEe8SIsUrFqMKXmEXrR8ZZZzb2Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E43224005D;
 Mon, 15 Mar 2021 07:24:41 -0400 (EDT)
Date: Mon, 15 Mar 2021 12:24:39 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] hw/block/nvme: assert namespaces array indices
Message-ID: <YE9D9+dsbn0DDPGT@apples.localdomain>
References: <20210315110359.51450-1-its@irrelevant.dk>
 <20210315110359.51450-3-its@irrelevant.dk>
 <edd50e76-76bd-0d74-878a-0e7c02544e9f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dlFEony/uLoI+LYa"
Content-Disposition: inline
In-Reply-To: <edd50e76-76bd-0d74-878a-0e7c02544e9f@redhat.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dlFEony/uLoI+LYa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 15 12:19, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/15/21 12:03 PM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Coverity complains about a possible memory corruption in the
> > nvme_ns_attach and _detach functions. While we should not (famous last
> > words) be able to reach this function without nsid having previously
> > been validated, this is still an open door for future misuse.
> >=20
> > Make Coverity and maintainers happy by asserting that the index into the
> > array is valid. Also, while not detected by Coverity (yet), add an
> > assert in nvme_subsys_ns and nvme_subsys_register_ns as well since a
> > similar issue is exists there.
> >=20
> > Fixes: 037953b5b299 ("hw/block/nvme: support namespace detach")
> > Fixes: CID 1450757
> > Fixes: CID 1450758
> > Cc: Minwoo Im <minwoo.im.dev@gmail.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme-subsys.h |  2 ++
> >  hw/block/nvme.h        | 10 ++++++++--
> >  hw/block/nvme-subsys.c |  7 +++++--
> >  3 files changed, 15 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
> > index fb66ae752ad5..aafa04b84829 100644
> > --- a/hw/block/nvme-subsys.h
> > +++ b/hw/block/nvme-subsys.h
> > @@ -54,6 +54,8 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsy=
stem *subsys,
> >          return NULL;
> >      }
> > =20
> > +    assert(nsid && nsid <=3D NVME_SUBSYS_MAX_NAMESPACES);
> > +
> >      return subsys->namespaces[nsid];
> >  }
> > =20
> > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > index 4955d649c7d4..45ba9dbc2131 100644
> > --- a/hw/block/nvme.h
> > +++ b/hw/block/nvme.h
> > @@ -236,12 +236,18 @@ static inline bool nvme_ns_is_attached(NvmeCtrl *=
n, NvmeNamespace *ns)
> > =20
> >  static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
> >  {
> > -    n->namespaces[nvme_nsid(ns) - 1] =3D ns;
> > +    uint32_t nsid =3D ns->params.nsid;
>=20
> Why not keep using nvme_nsid(ns)?
>=20
> > +    assert(nsid && nsid <=3D NVME_MAX_NAMESPACES);
> > +
> > +    n->namespaces[nsid - 1] =3D ns;
> >  }
> > =20
> >  static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
> >  {
> > -    n->namespaces[nvme_nsid(ns) - 1] =3D NULL;
> > +    uint32_t nsid =3D ns->params.nsid;
>=20
> Ditto.
>=20
> > +    assert(nsid && nsid <=3D NVME_MAX_NAMESPACES);
> > +
> > +    n->namespaces[nsid - 1] =3D NULL;
> >  }
> > =20
> >  static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
> > diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
> > index af4804a819ee..2f6d3b47bacf 100644
> > --- a/hw/block/nvme-subsys.c
> > +++ b/hw/block/nvme-subsys.c
> > @@ -47,15 +47,18 @@ int nvme_subsys_register_ns(NvmeNamespace *ns, Erro=
r **errp)
> >  {
> >      NvmeSubsystem *subsys =3D ns->subsys;
> >      NvmeCtrl *n;
> > +    uint32_t nsid =3D ns->params.nsid;
>=20
> Ditto.
>=20
> Preferably using nvme_nsid():
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20

You are right. I'll switch it back. Thanks!

> >      int i;
> > =20
> > -    if (subsys->namespaces[nvme_nsid(ns)]) {
> > +    assert(nsid && nsid <=3D NVME_SUBSYS_MAX_NAMESPACES);
> > +
> > +    if (subsys->namespaces[nsid]) {
> >          error_setg(errp, "namespace %d already registerd to subsy %s",
> >                     nvme_nsid(ns), subsys->parent_obj.id);
> >          return -1;
> >      }
> > =20
> > -    subsys->namespaces[nvme_nsid(ns)] =3D ns;
> > +    subsys->namespaces[nsid] =3D ns;
> > =20
> >      for (i =3D 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
> >          n =3D subsys->ctrls[i];
> >=20
>=20

--dlFEony/uLoI+LYa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBPQ/YACgkQTeGvMW1P
Dek+fQf9HBYRaCpsmdWNV9ECgsEu1PqA9gCLYZa1O5VMIfPoZEuihnE5CQzAE2/w
U+HVo6oStn9GMPdUJL0IHQpBiu6wRPEYsBLg3Rb+FqSUTdMaJqdPDBjvZBBjWttA
1cqBw/aet8njEE3GeFMG1NlfY0lCPOKBiK/5fjKsuL4YmJ54JeloZF7dlWHCg/R+
dsj5uBk9HQGMbL31j0KyCLfhRvLyvoGXJ/5nQTl2EqOu4hYg/FvQxbpgvOXqMViI
41tK8V/vrWYTK09h8UZJCPdXzjGw94W8/uMX1bYQhFzfjpu9o4/J3CUvAQL2eRgM
PJua3fpxeKHYGXYCv2tiRwYCF2+NnA==
=CtYS
-----END PGP SIGNATURE-----

--dlFEony/uLoI+LYa--

