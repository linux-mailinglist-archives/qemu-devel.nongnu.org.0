Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E9477CF5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:02:43 +0100 (CET)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxwxd-0001I4-Uu
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:02:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mxwr7-000857-41; Thu, 16 Dec 2021 14:55:57 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:52355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mxwr4-0008Df-Uy; Thu, 16 Dec 2021 14:55:56 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 293035804D2;
 Thu, 16 Dec 2021 14:55:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 16 Dec 2021 14:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=zrZe5S+RMPNMt/il5iy+oIQ+3C0
 /qgZcq+jSQo4l+wk=; b=Bsd0krCAqBKOenxB0+T3Xh6dHhM2hdFrsRtuec/xAps
 UG13rAaLDaN6UEcqFM94mSKV6lnuGrPFhO+rHmHWjlHiHVV1Lez2nHLmPuyDrSkQ
 +IJ6V2EnKXoXPd/QMmCpwHXI3ryomrFdWIZk1qqNbo/XifDEqLg2g6nfQpmvFHnQ
 GA5fcsv+oYtYuMoMTJ8+Ne/5//Z+yK27eeBnfGRZCaRianQ5N3SGNzh+lige3fXi
 9s8TlX6YS1NbZemssm2+ra4urIajf9t4VDg+ekvzlIIz6OGv7ChBatMIv1NwDAxR
 OAW52BxM+JkKZuDABUkg1kX1CPn5AFXEaT1OTU8wllw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zrZe5S
 +RMPNMt/il5iy+oIQ+3C0/qgZcq+jSQo4l+wk=; b=fP9+bpVf0/T7lz5E1wn3db
 3OEaMwlh1Jl1FY5fzsXLcjLpMLvmiNv4PRVeACFeL8tEVt1v1+m1r1amFZHZfjVH
 JfYidp2t8B8ipOoDbX+LhsEl2W0hWQv7r8rkyqeCef1wnUGHCcFUxcPFbAuR8sMT
 u0fvVgfYGsYvleE/sCjrx1TklYtrO5DN3Q3lSp1dy9sv0kVZM5xLTzdF3OvbcdGk
 sBRhiaYSK4WdvvV1W3O4+FjfmXNImOMGh5i45Y+K5tW3XubO0SK1abB9IidL++BN
 Ywslpl0cApn268y008YrPUwm9/6k8yrjP5Bv3gEAInsgX2nPGtODybJ+sSgn21RA
 ==
X-ME-Sender: <xms:x5m7YcqLC7FGm001k-tqt6s-qXOgSqFcnABoxgE7jHaK6m0vn6wUrg>
 <xme:x5m7YSodsBP_2ZM6rSf288EpcnbfJiuAc_B0ItCN-9tiDUyZXtc7YF4E31T1ccMIC
 _17olmzaUs_cp4UR44>
X-ME-Received: <xmr:x5m7YRN_SOL3Vbk0EO6nQtyA3JTTNvIen63Xy8-gekEKQQqHqQmPkrmbp9y1hvg53dpf3mMUkoAcvxrYNL7Fjp9eN6BPREjc3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeggddufeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedugeefveegfeduhfeuledugfeufeetheeuhfeuffejgeelgffgtdeffeduvddt
 veenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:x5m7YT6ZcF_7uC4aLl-iH4fjOr6-RWQH5KR63fdKFQJAOnY8dwcKsA>
 <xmx:x5m7Yb63ChIUwRFoYfXx6MPW9RDFLRnXMEoQ0MV7FaR6kd-g_7ozIg>
 <xmx:x5m7YTiMs_cvWXWVdSas90KADmqkrdpZ9W1VRNr59nO_BJw2bWQ51g>
 <xmx:yJm7YaroURoZZRRqDIhSHq9ZODZhiqyn0_EwtdyckV4ur4IWyiUzDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Dec 2021 14:55:49 -0500 (EST)
Date: Thu, 16 Dec 2021 20:55:47 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/2] hw/nvme: Fix CVE-2021-3929 (DMA re-entrancy
 exploitation)
Message-ID: <YbuZw3vTaNuqAISS@apples>
References: <20211216175510.884749-1-philmd@redhat.com>
 <YbuP4/rLTlCVBRi7@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0P8xAr2hwVef10qh"
Content-Disposition: inline
In-Reply-To: <YbuP4/rLTlCVBRi7@apples>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0P8xAr2hwVef10qh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 16 20:13, Klaus Jensen wrote:
> On Dec 16 18:55, Philippe Mathieu-Daud=C3=A9 wrote:
> > Now that the DMA API allow passing MemTxAttrs argument and
> > returning MemTxResult (with MEMTX_BUS_ERROR in particular),
> > we can restrict the NVMe controller to memories (prohibitting
> > accesses by the DMA engine to devices) and block yet another
> > DMA re-entrancy attack.
> >=20
> > I'll will try to get a reproducer (and authorization to commit
> > it as qtest) from the reporter.
> >=20
> > Based-on: <20211216123558.799425-1-philmd@redhat.com>
> > "hw: Have DMA API take MemTxAttrs arg & propagate MemTxResult (part 2)"
> > https://lore.kernel.org/qemu-devel/20211216123558.799425-1-philmd@redha=
t.com/
> >=20
> > Philippe Mathieu-Daud=C3=A9 (2):
> >   hw/nvme/ctrl: Do not ignore DMA access errors
> >   hw/nvme/ctrl: Prohibit DMA accesses to devices (CVE-2021-3929)
> >=20
> >  hw/nvme/ctrl.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >=20
>=20
> LGTM.
>=20
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

Ugh. Jumped the gun here.

This all looked fine, but since this prohibits DMA to other devices it
breaks DMA'ing to a controller memory buffer on another device, which is
a used feature of some setups.

I think we need to fix this like e1000 did?

--0P8xAr2hwVef10qh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmG7mcEACgkQTeGvMW1P
DemvrQf+L9/N7EsRd6er3qeNhS/Dn/Nuv7kJmAKeeiLdp4Kyg6vRZ7gGhvfiLCmX
CAVzaY1Z0P7amuWQuxK1/vc5fuc6CT04hi6vTmsLTZctK2ki3zBKmvXWYSvX03GJ
cuX8dJ0BxCTiZxID8m82xXQ/48BMO2+GWK/vs5w0xLoF8jRcGFMMvMAJXuwKX85M
qBPqNi1GwdmOax854t5WQ3y2Ljnwi4Wqu1TLwYePmIguzKczTNf3DJezVs23BvS1
aGTXomJN4H8JKFhtIU+kA8o9UsUEnG59EtLTiHxxTM24SKTLkOhzQ12opgUZA1yj
OF9ComFLQhIokinat3GQXPNoYXh1wA==
=TPns
-----END PGP SIGNATURE-----

--0P8xAr2hwVef10qh--

