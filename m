Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B39E2FA0C5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:08:48 +0100 (CET)
Received: from localhost ([::1]:52900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1UH1-0006LG-Ia
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1UBG-0004Nb-0a; Mon, 18 Jan 2021 08:02:50 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:56221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1UBB-0007Bf-U8; Mon, 18 Jan 2021 08:02:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B10A5C0077;
 Mon, 18 Jan 2021 08:02:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 08:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=98or9gmS2qbQo4eJdg6A8vk0dPj
 Axkck4q8O7NrQfyE=; b=Six+INojSikE7GVFk/5As/VZ7F/8vERi6eFrbqOMoe9
 iB8M/rT6pJ/ihd45r4NhR909SrVs7Gsen0UYvIVLsbOVUOb3O8wjLRhv2WA4JB52
 Ttd1otdHqehXAoxIZrUFpQhKCFe0Cb+jIk3WRz4HYVyCCjK4iLq4dYELJMBiDu6i
 W65LgiXus1FWE7kgNKHGzQTyor3z0vxcFYSjsI8Q0N2bGGQ8BF5T/z1xHYg0PL7X
 hF034BP96EGs4lSZtRREeypX2PUeyULWmmqvJ1SM8khbbFDfD3VIoSaRh8uDRFiY
 8Oofv+0aNrB+5dOzf3xhzKQFINa2pTBP4KtUqgp6tIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=98or9g
 mS2qbQo4eJdg6A8vk0dPjAxkck4q8O7NrQfyE=; b=pV43iaAmKLXKMq9M5fZNrh
 4BpZ8LRDYUUTzqXYui/6GeukMXobGTMX+FFEjPVfDDgWwCc2zbGtafptFseaEgkI
 n4OlOHu95Te51k6PZIjVufjxK2zYOkp6J8Tad++ALuIb/fg/RjUe5g3e+4GOnoEO
 PNS4pNE0ScqEl/kH/B2ffR/5DMgSabq02LvJ20kq4RR65PP2kpeLheN/ht8VMPoe
 5QIaqwXMv0ABTkffmxXR5CxGgG9bNqsWnBBSZ2I3g4VXMjCDliYwF0CYsVdjVQGQ
 ++kTPI1QQ6SLDfVPNO7N0uBWrpl94ZV5edfMvVC9ZkE9GRCr1sZnBg5A3vJsoV1g
 ==
X-ME-Sender: <xms:84YFYKRy14ttRELgR7slQiGWvj89yV0iba6Up0MOsTNinhj8uOWGsw>
 <xme:84YFYPxD4UqeTUMN9czElbDilV40cNa9Hs-AaNQINC3l9s9DvUiq_jt8ALc9lp9_5
 TFDor94FwCH1_7i1D4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:84YFYH2yrnApuoEM9ydpXrV3mnrmQhSGal2OyI2xqwZtaPX8a92H5Q>
 <xmx:84YFYGC53SQlQh6xXfw8b671219eszBKhRG57sUMN2nvbhJ1tbw_kA>
 <xmx:84YFYDjyt0eOz1tuPzKjyE5cijGn5HDSr34y3HSflU_IG-oAAsLN6A>
 <xmx:9IYFYDjFUwbUKbfJLIXFD8a_y5r4FMx_cQI8dK7JqVgq9iUd8GdBeA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id ED8DD24005E;
 Mon, 18 Jan 2021 08:02:41 -0500 (EST)
Date: Mon, 18 Jan 2021 14:02:40 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v2 07/12] hw/block/nvme: remove redundant zeroing of PMR
 registers
Message-ID: <YAWF5jb1H5Z1aee3@apples.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-8-its@irrelevant.dk>
 <20210118125529.GG18718@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nCnAB85jQWyq5etl"
Content-Disposition: inline
In-Reply-To: <20210118125529.GG18718@localhost.localdomain>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nCnAB85jQWyq5etl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 21:55, Minwoo Im wrote:
> On 21-01-18 10:47:00, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > The controller registers are initially zero. Remove the redundant
> > zeroing.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c | 35 -----------------------------------
> >  1 file changed, 35 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index f3bea582b3c0..9ee9570bb65c 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -4179,43 +4179,8 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice=
 *pci_dev)
> > =20
> >  static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
> >  {
> > -    /* PMR Capabities register */
> > -    n->bar.pmrcap =3D 0;
> > -    NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
> > -    NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 0);
> >      NVME_PMRCAP_SET_BIR(n->bar.pmrcap, NVME_PMR_BIR);
> > -    NVME_PMRCAP_SET_PMRTU(n->bar.pmrcap, 0);
> > -    /* Turn on bit 1 support */
>=20
> This comment says that PMRWBM [1]th bit is set to PMRCAP below :).
>=20

Thanks!


--nCnAB85jQWyq5etl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAFhu0ACgkQTeGvMW1P
Dem1wQgAutoQKuD1W5E2Ubb6tM35ANpoucwA76Sm5iToSBu0FDZWurimd2KLVfFZ
bakL7kJKSJXDjDOtHQCqAyE8rQvCnL4CGqyVUsmssjzqnwp7fWPLSSyf876IB8L7
5HuyeNn6RlmAuvvGQRpT7K6UXt39EqBwpnsIQjinLzS175t5RKGTTiBl8/6KyA26
ck4wHuaojeAbICkML7kRJNzWrGGYAPjphTfHVHAOzDFNKMyqfyx6+Y9AfQ2LDOca
2jegsMYnyCHjFyNQlc9cgjCti7x1VXx6Ms3o8vzuHO5um1sTu+QZ20uOkRy4r0PH
8ndcyKxOxoAUYx+h3K8nw+wYe+W7JA==
=JBCp
-----END PGP SIGNATURE-----

--nCnAB85jQWyq5etl--

