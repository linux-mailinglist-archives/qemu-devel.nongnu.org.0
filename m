Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0392D3FC0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:18:30 +0100 (CET)
Received: from localhost ([::1]:48980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwYH-0001rZ-6m
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmwOR-000560-TW; Wed, 09 Dec 2020 05:08:20 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:56597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmwOP-0005Vl-SM; Wed, 09 Dec 2020 05:08:19 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B35665C0363;
 Wed,  9 Dec 2020 05:08:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 09 Dec 2020 05:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ZMjNLh7woJd0lufCPS1iP/inNoX
 rShkqWXtS4bu7ZfI=; b=gdB/1czkUstKDqJxwBOtqtBWCQFKvCsxWmgl+cXEXzr
 +HRQuCRHcuKggl4O+fOgrMq6iqaay72uvEGWr8VWA0k9OLGcrhbpj5c6zMEPj2WY
 XifAagwao7p2w1triG8HSy5mvez6cN/hXLrZOc4G2J+PcTcHdhR/D1/9TRy4ITKm
 9lEuVp6tFZjXllOyyF7+UMjuQbj0h+94X5tg0tYktYI2mrBYZsuXM3ObU3/t0kuP
 LlmIe/qS1YSPx4MSpTgmFNnUH7YrWHZPbN9iZPsGSPGlf7nOLvTc9Kqxj+Y9aL8c
 hWwNP8GHpU31t5yMIufSzxUv4X3OSAK1fOH/9u6qDjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZMjNLh
 7woJd0lufCPS1iP/inNoXrShkqWXtS4bu7ZfI=; b=fgjFB24jHCus2IK41cYM8l
 FPBghU67Oq82/4muRssttF/s7Wz8oHKZn7WYscQUYgtwgHCgbVoj9GM+W7UU7wIZ
 Ga45lBRcJAZifhJs7HZ3PHjnzqVCwsbqU4UqcnW311kS/jlTL/32r7wQbcBrFAAV
 sxert68MpPYQ3gwj6w+llT5uFC8Knpo6gVlH6ZFsjU0xpKwayKbspS4mviPxE3HZ
 MthxXiXJt5Ltp+6OZPZtkM2m6kIY0dMw+F6BgyB7E+GKJKkT+u9NMTBhwku73Ou4
 tTKPkLZ/p3FTSxn0oMQ7tCHkbpMGiApLI15zyfksrhPTD9sXIl/8qgxYo8P8ZaVg
 ==
X-ME-Sender: <xms:D6LQX4_6ViwvAEKTrZ0ofFALKetke8JgGxcwEdT13FL3DOwk81g2AA>
 <xme:D6LQXwqqbmym-a9A6o4Td1zoauz-Cwy33mGVJbzP8ccGHqOImAdZmrd9mi03SASLf
 pcn5kpCrVQ2hWI0X0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:D6LQX65XQKapO2hR5SjgMVtF5ifVAHI9mmwxTwp-HRQYWHxvaz6NDg>
 <xmx:D6LQXwOWPhLOpiy358lsq1lFj2si9I_KywU63bzxDl2kFYUBQQXPhg>
 <xmx:D6LQX8OaL_NFWL2ruBQTeIDj1qV2AaYZaYJD9z6gHAyAn9rLyRrBFQ>
 <xmx:EKLQX1xc2ALHgTeYR5_mPh4U5QjwP3txRe9kcAroKQ_iN2UCgd98Gw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3E3FE108005F;
 Wed,  9 Dec 2020 05:08:14 -0500 (EST)
Date: Wed, 9 Dec 2020 11:08:12 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v3 2/2] hw/block/nvme: add simple copy command
Message-ID: <X9CiDI0rYJ0pEBdr@apples.localdomain>
References: <20201208083339.29792-1-its@irrelevant.dk>
 <20201208083339.29792-3-its@irrelevant.dk>
 <20201208221327.GH27155@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IuOrKQReSEMix4y+"
Content-Disposition: inline
In-Reply-To: <20201208221327.GH27155@redsun51.ssa.fujisawa.hgst.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IuOrKQReSEMix4y+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec  9 07:13, Keith Busch wrote:
> On Tue, Dec 08, 2020 at 09:33:39AM +0100, Klaus Jensen wrote:
> > +static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
> > +{
>=20
> <snip>
>=20
> > +    for (i =3D 0; i < nr; i++) {
> > +        uint32_t _nlb =3D le16_to_cpu(range[i].nlb) + 1;
> > +        if (_nlb > le16_to_cpu(ns->id_ns.mssrl)) {
> > +            return NVME_CMD_SIZE_LIMIT | NVME_DNR;
> > +        }
> > +
> > +        nlb +=3D _nlb;
> > +    }
> > +
> > +    if (nlb > le32_to_cpu(ns->id_ns.mcl)) {
> > +        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
> > +    }
> > +
> > +    bounce =3D bouncep =3D g_malloc(nvme_l2b(ns, nlb));
> > +
> > +    for (i =3D 0; i < nr; i++) {
> > +        uint64_t slba =3D le64_to_cpu(range[i].slba);
> > +        uint32_t nlb =3D le16_to_cpu(range[i].nlb) + 1;
> > +
> > +        status =3D nvme_check_bounds(ns, slba, nlb);
> > +        if (status) {
> > +            trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.=
nsze);
> > +            goto free_bounce;
> > +        }
> > +
> > +        if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
> > +            status =3D nvme_check_dulbe(ns, slba, nlb);
> > +            if (status) {
> > +                goto free_bounce;
> > +            }
> > +        }
> > +    }
>=20
> Only comment I have is that these two for-loops look like they can be
> collaped into one, which also simplifies how you account for the bounce
> buffer when error'ing out.=20
>=20

Yeah. And the shadowing of nlb is not good either. I'll fix it up.

--IuOrKQReSEMix4y+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/QogkACgkQTeGvMW1P
DenK1ggAxYs3zU6ajqwIkrIshK0+qkG+ZO5mfv1xPyllBrMONo9JftrI456PTxG/
zLk83fdPWEPKsUHztnOUTrGhhlgZYOx5tYl2F8rnQynoHEEzopmVy3UC/dO9olgU
m5OamWjpjPQu76TSElIXvTuLzhS94mjybIDayJyRm1W42jmesAfosopcfXRKnSMs
s3DzMyMEPy8f8bLRIS4pc3uZ+RgpiwjCaFvkqg7LWHJtV6LgYZ568zJJMVoa3H8d
mQRbbXlW+8tpxa3x91T7oYTlsR1Qi1LeRCphlhrNitvcMwpy6FynpElOuDPyi2gd
GNWjliEcG7o76OtnOYw57MTohkbYmg==
=VhRR
-----END PGP SIGNATURE-----

--IuOrKQReSEMix4y+--

