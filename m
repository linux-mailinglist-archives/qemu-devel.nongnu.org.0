Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E583541D4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 13:47:07 +0200 (CEST)
Received: from localhost ([::1]:51342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTNhC-0004jG-2S
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 07:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTNca-00042Q-Fv; Mon, 05 Apr 2021 07:42:20 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:44399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTNcW-000233-85; Mon, 05 Apr 2021 07:42:20 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C7A8D17B2;
 Mon,  5 Apr 2021 07:42:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 07:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=TLudYZubH7o1L6ekT64+jahHIup
 avVcwiasDUUnjZMI=; b=jUakeQeSLQantqBKoTzTsqvDLHVv1V/jZd2knnXP27f
 nQCwJ/mAfep5TfIJeMRX1lhaOVqBvPePuq3pcRJ9JOnRFfPvbHKFfDQOc/3lf9TH
 Pr3hEaQRcCoY/Qp2z+8HccICELhZANUvPZMMHQFQjbN+nNxPPzCkDbQZubbhAL+J
 6R9LXhV90e7u6fdQC0rtkn86fvBVgB7B5G+WM9Cdf3k+S3lLFSeZpW2bBBVNSbFD
 DzL2oCZ+/t/cc+kh9kGYmoLg+JbZAtnICYw9IKdtP8s28+d4VDZeSVSQ7SDGsxtG
 hE2sDJSna/WJsoogJ0108AoNFYUnbNXSLHBbdL7/4lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TLudYZ
 ubH7o1L6ekT64+jahHIupavVcwiasDUUnjZMI=; b=T4fd3zomrYg0P3SUBZpWUK
 74Sm1O7sjieqRyE+fLn5KXdtXIlUMonxqvdUemaOzERJr3aRX4nFbndtihNa2OKY
 77jNlfyTFqkxAWwwSk++s5FXjotD+n+5kFJjDabNP96CdKnG3SVIaLcmkclrWy+s
 PReLXmfLOM2nTkPBeku6nm6ZDpzXe6a7a1Tm2GrfqmDLRX1UMXFJD+Vz8vfzpfoy
 DA9fzH3R282pWTlbG611wFTITnY6eOVaG5v5+HeUzw6LRNGNZkTFr+ThkxgkswWm
 0rhVuKn1HIhqn5uM86sYnkAi9jmqhNSPQzbEZ8PJ4CV28OW6RDBsoMRl4Ve8zuLw
 ==
X-ME-Sender: <xms:i_dqYC7fqRGqu6Q2RLZtZ8MMI99DjtcmfDeyvltUnPTpzaa_tCs6Ow>
 <xme:i_dqYL52NQ7Q9bsPdF8ef-V68F9aq_dSWUAnMjC1mTNKviZy33K7--lUW2nM2TnXj
 haXEJQOg24UFSF0m2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:i_dqYBeb-kfKqDTUPtq5eROLPRxRnhKFCI_gQZ7-dtoJVQOmaogfhQ>
 <xmx:i_dqYPIeIv30B9mh3_z3QELW9DqxM3DRlRi1r43VCjE6c1-EBgkmUg>
 <xmx:i_dqYGJdsA65SiXiPzViFMMUcfDwMYQqdnLoFXwe6i1scsQB05FHcg>
 <xmx:jfdqYHosAgevYBtpAsXnEUCLM0lMkvcCXlRfIUmX9oGGA4POQ0xC0g>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8BFB524005C;
 Mon,  5 Apr 2021 07:42:01 -0400 (EDT)
Date: Mon, 5 Apr 2021 13:41:58 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.0 0/7] hw/block/nvme: misc fixes
Message-ID: <YGr3hjKtnCjzOhrh@apples.localdomain>
References: <20210324200907.408996-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Vpve2yeULZ5IiQc4"
Content-Disposition: inline
In-Reply-To: <20210324200907.408996-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Vpve2yeULZ5IiQc4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 24 21:09, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Various fixes for 6.0.
>=20
> Klaus Jensen (7):
>   hw/block/nvme: fix pi constraint check
>   hw/block/nvme: fix missing string representation for ns attachment
>   hw/block/nvme: fix the nsid 'invalid' value
>   hw/block/nvme: fix controller namespaces array indexing
>   hw/block/nvme: fix warning about legacy namespace configuration
>   hw/block/nvme: update dmsrl limit on namespace detachment
>   hw/block/nvme: fix handling of private namespaces
>=20
>  hw/block/nvme-ns.h     |  12 ++--
>  hw/block/nvme-subsys.h |   7 +--
>  hw/block/nvme.h        |  45 ++------------
>  include/block/nvme.h   |   1 +
>  hw/block/nvme-ns.c     |  76 ++++++++++++++++++++----
>  hw/block/nvme-subsys.c |  28 ---------
>  hw/block/nvme.c        | 131 ++++++++++++++++-------------------------
>  hw/block/trace-events  |   1 -
>  8 files changed, 129 insertions(+), 172 deletions(-)
>=20

Ping on patches [3,4,7/7] :)

--Vpve2yeULZ5IiQc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBq93kACgkQTeGvMW1P
DekzgAf+OqfEUOmdoII99XJi0pQHeBoyXDEAB7SYh9dL2FM12QmmkiSRUqyCk+A0
mRZwsQujFUVdMyWjmMmgQEWTTVA8QTnvvXud9loAvq5TMZ09nTnM+j3RZUBV9Cj9
PKtFnw457WBGhcoJeX9qioEcjkemVVekmMKX4gHO0jlmZge/AE9iEIMTNihXi3cZ
TZQWuprAOUQ7asiBUgpvpi0mE88lfHG0qq6AoNfidoZsBUr/Lu4M9mwGcPjVDQcd
zuR+c3o8sowRQOJdDMJgp0KCbauIWNpZaPFOE9eRi897yLuCv2LRYaVFo218ZS1N
jXEhhPG77dCgIYoXYXFKB5k2PW/RWQ==
=C9AW
-----END PGP SIGNATURE-----

--Vpve2yeULZ5IiQc4--

