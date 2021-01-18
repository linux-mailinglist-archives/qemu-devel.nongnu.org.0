Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C1A2FAABE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 20:59:11 +0100 (CET)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ag9-0006VJ-Md
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 14:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1aai-0005Vh-5K; Mon, 18 Jan 2021 14:53:32 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:58885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1aaf-0003Ei-P6; Mon, 18 Jan 2021 14:53:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EC3F5C009E;
 Mon, 18 Jan 2021 14:53:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 14:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=gSr+fez7EpE531p7263b9unywrm
 t3aazLHHZeMHwN8E=; b=L5MsQl8a3q4/xKzQ7rWGL3nWIQU0e2+DIVU3UHPu45z
 +xvRMCpewj+CeFyRmDaXiFhOY/TpFqPhX5cFLzyXnbmMH4+mfl/ggrmlVAtJAn1K
 Jr5Bh+6mHflFVy7BvFAqlnVXK0vPd2/ULkD6So0CzuoLgtscGUQUwiCF7tEiGkIC
 OG061j+qsUMmZSlA7Ear+0mTcctYvVspe5ek0s7c9AkkIY6g8DvuFV9/YZv/mkrN
 SaUSUIsrc7FS3I327+Hcx3jQfPtmKk6Uex+BiQVNf+RaFxDs6k2CtYagb3mByKAC
 +qKnPFwZDoAldv6KJjImoG/lkwLh58yrMSGtOD5LagQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gSr+fe
 z7EpE531p7263b9unywrmt3aazLHHZeMHwN8E=; b=H10ccoKlkRYpVOeLRN0sGs
 3BhfVBmgVmvzYUJh25wb3c7gew3RSm8uZFAs6uix2/rWcRpaWVOFYsOb/jA56VkU
 jwPUWDP8c3Zuezq6ZF31wEWeQhYIPbWVmABRq8EvNH0A/F9qiX9ySEcnyAsq5OQS
 Sk8Y3ODe17fALMyoOsJC9z7eY5uKagGwPMMff5EKPgDfT+R/8wT0TpIZ8kYtKzpp
 e5vsjJ7NdH2r2L6EkX5ZuUCYGplRQ8HKfbZH7ZL5bALAWz6T8ppul4Y/rwV41nPX
 lxHzlX/XzA9fWm0PI3AiuVWlNi8krr0lFzighI+zlvirP4LCGK0sGUyo9pXM8Ebg
 ==
X-ME-Sender: <xms:N-cFYNtxaE6VsASyiLtsO-jT6-rQhJy735_XHCj1xr-qhqsfrhXuEA>
 <xme:N-cFYGdYnWC11RGfA8-oaxV0xSdYd2kb95Eeva-O-RcWKAfolHjKxvVUjEQY00Em8
 5mgDGe6D9uPeaNRip4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:N-cFYAyGv0jtj-PQck9NVYjzMHX-ZxVMvNjHSDjt9Tc7MOGjzZgLyg>
 <xmx:N-cFYENH7ktq1N0NoN6VHxdjuisCGhQ1-KPRAluh-CeKitYghQF8yw>
 <xmx:N-cFYN9NgnDcG8bqqsq20lnGatPPwg6-Ltj1183jJi69nkCRm11urg>
 <xmx:OOcFYGPKuWMTy451__B6dAjOVGfAIzP_1N267F_Y-FDkrV_FqEhUiA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CAC0724005A;
 Mon, 18 Jan 2021 14:53:25 -0500 (EST)
Date: Mon, 18 Jan 2021 20:53:24 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v2 02/12] hw/block/nvme: fix 64 bit register hi/lo split
 writes
Message-ID: <YAXnNAo/Cva7gTQx@apples.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-3-its@irrelevant.dk>
 <20210118124100.GB18718@localhost.localdomain>
 <YAWE4cDhwQOoc8NT@apples.localdomain>
 <20210118125945.GI18718@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="svB2vzK65gQgD5F8"
Content-Disposition: inline
In-Reply-To: <20210118125945.GI18718@localhost.localdomain>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--svB2vzK65gQgD5F8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 21:59, Minwoo Im wrote:
> > The spec requires aligned 32 bit accesses (or the size of the register),
> > so maybe it's about time we actually ignore instead of falling through.
>=20
> Agreed.
>=20

On the other hand.

The spec just allows undefined behavior if the alignment or size
requirement is violated. So falling through is not wrong.

Keith, any thoughts on this?

--svB2vzK65gQgD5F8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAF5zEACgkQTeGvMW1P
DekOkwgAxOjpSRi6Ofn6DdjfCFYz7hwEnFm+dwfzESsIshyUAN7uTDEn5ofbIaPz
sr2Rhr6hjqEg8/KOAVp1cvBxZwjYwhPWPQvzNHEV9hUvsfnCFlBqbCt17Kz6iPbK
+ISLmBD9dyivhupCMAQ0xh03ocu+4nqZ5S+dnRaMcNqhT93ApjAaBn7Fy4NHjsdu
Fp/q44xx6SXx2nuA7KjbGw3tp9gNyuwDxr+AQZZi4nRW/DkVF9gNX7poX9Yc/nsW
/WkGGdwtlYoUGqRF5LhNhySpNF1SqsmkMZzarc5t+944eWVOiPMMleoEAbrtgwKx
W1i2JNg/3u5pkBJblHaPh/l7FVMGQg==
=KCer
-----END PGP SIGNATURE-----

--svB2vzK65gQgD5F8--

