Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E833CE93
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 08:24:35 +0100 (CET)
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM44A-0006Ab-Js
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 03:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lM3z7-0003gm-4n; Tue, 16 Mar 2021 03:19:21 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:52039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lM3z0-0007XE-I7; Tue, 16 Mar 2021 03:19:20 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 28DB3580707;
 Tue, 16 Mar 2021 03:19:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 16 Mar 2021 03:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ei3UNUpWC1+URBKsUxdt1liv3eT
 hVRBFjc4YpLVHKLM=; b=1JTpWUdIcPkX4ly5EbyXYotc7Nqe7KDx7MQiawYq6mX
 4X2Uo1KLFRwzyafHbDJp2W2juLlQOMyvHaNAP7e4+AUcAYTRaWnastUmvdrQbby+
 OljsamrVmyy36+FdaKZBmlmTsGZjvaaAII0Gr9cyxJNRc/0h6138gxrLPdZFMsup
 2l7cr/MV7iaLkuKZ5oJApAp6+Ana9IpJX8PMaZkl2N4P/D5ObdP0mgQWbKQsFvDW
 L04TjpLE7U0QDbi/w/YNbdYsa/hs0vyR3AFdevoeW/LqrF/XY3+f/RsGDlmwnHoz
 MIjOnmUA5OQTSwgc4PW0jaIj3B6Z3k+9Ih0iN+2n2rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ei3UNU
 pWC1+URBKsUxdt1liv3eThVRBFjc4YpLVHKLM=; b=hfpYkQf0a+x2+YdrH880Pu
 2RkinXwjvGynJhvmFn0RyJcP2Z/5CmO0FrZf7MjxeBngnr1dawgzjTSCwNSCyZJl
 wxo3GkR8OaY0Cq1+QSgtlYf/iH/80zTh8NjjA+uXZwwOXF0tSqzj5gONArB2tIPr
 kNGrPs7U2eO1hWPC9IehbTFcu3aPyY+SzfpZBz/5Ia98SsdthTDYU7/h/dZgOSrh
 Ixj5PVSwat6/VNeLGtUt/AobhOs4rEY2gGyI68EGK68DLEuT/qrJ0BpLDOjiZU4s
 JqvZGorcyjzUggifjFu4MwRT1bxVvp4AG449VAsycFh4rY6rAkZyG0OzsCbzhQWA
 ==
X-ME-Sender: <xms:71tQYP5nfeFbmxaJcEmfzxqb-em8p9sLoI_fJH2NnPB8UY40GxfNTA>
 <xme:71tQYE6X8ReaVRpAfgcE8Pq2Dvw6dpyoH1AAXpZtEuUQVOe-Bwtsc1GWjLWtkuZAF
 ybPra028dgSzwpdQaI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:71tQYGfYFVfcF3wRbxN8dobD5Zd720vv0J-XLC4J9_6g_8gc4Znn_w>
 <xmx:71tQYAIakcoyHyeV3-p0Cb_bMurtic78f63XX-P7VB5mikvkxfdDvw>
 <xmx:71tQYDKjQY_CIYeP8ZSERzhCxzN6j-7QwWtgGFcAwgA-28cM6IsZOg>
 <xmx:8FtQYK-oly474XTt2Hkc2gTdhmcv3l7XfdKza9WomVlBgGwsAzBW1A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D531A24005D;
 Tue, 16 Mar 2021 03:19:09 -0400 (EDT)
Date: Tue, 16 Mar 2021 08:19:08 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v5 09/13] hw/block/nvme: parameterize nvme_ns_nlbas
Message-ID: <YFBb7NdIrbzkftIc@apples.localdomain>
References: <20210310095347.682395-1-its@irrelevant.dk>
 <20210310095347.682395-10-its@irrelevant.dk>
 <20210316065301.GC23761@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="E3eVljpntNNa5fox"
Content-Disposition: inline
In-Reply-To: <20210316065301.GC23761@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--E3eVljpntNNa5fox
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 16 15:53, Minwoo Im wrote:
> On 21-03-10 10:53:43, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Provide a more flexible nlbas helper.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme-ns.h | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> > index 07e16880801d..34f9474a1cd1 100644
> > --- a/hw/block/nvme-ns.h
> > +++ b/hw/block/nvme-ns.h
> > @@ -136,12 +136,18 @@ static inline bool nvme_ns_ext(NvmeNamespace *ns)
> >  }
> > =20
> >  /* calculate the number of LBAs that the namespace can accomodate */
> > +static inline uint64_t __nvme_nlbas(size_t size, uint8_t lbads, uint16=
_t ms)
> > +{
> > +    if (ms) {
> > +        return size / ((1 << lbads) + ms);
> > +    }
> > +
> > +    return size >> lbads;
> > +}
> > +
> >  static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
> >  {
> > -    if (nvme_msize(ns)) {
> > -        return ns->size / (nvme_lsize(ns) + nvme_msize(ns));
> > -    }
> > -    return ns->size >> nvme_ns_lbads(ns);
> > +    return __nvme_nlbas(ns->size, nvme_ns_lbads(ns), nvme_msize(ns));
> >  }
>=20
> Hmm.. I think it looks like __nvme_nlbas does the same with the
> nvme_ns_nlbas, but flexible argument attributes.  But I think those
> three attributes are all for ns-specific fields which is not that
> generic so that I don't think we are going to take the helper from much
> more general perspective with __nvme_nlbas.
>=20

This patch should be moved two patches forward in the series - it is
used in [12/13] to check the zone geometry before the values are set on
the namespace proper. This is also used in Format NVM to verify the
format before formatting ("commiting" the values on the NvmeNamespace
structure).

--E3eVljpntNNa5fox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBQW+oACgkQTeGvMW1P
DekqFggAq7X54c2ZpWMfFOZ+b7sqs+A17CY2Igc7hvHfLUyrZERhsmZh47RXUfbH
gEmsF5+kNEKqK1fLAOTdJNrP9oiuAQ5oopvUHl1o+BsPhE7/Usv85Dit4739WHPl
y+Lp5fyMVqVGK1UNg67779n1KpQW27cWVBOVYEB+tozfdaTcnRTFckPcA0fDQA9A
sQxlRCphvzVE92y8P8IYAg/FsYVieVJhJAdQChVP8w+aoHQNjm+5ogiGcA1mbMYJ
0gvdYeffqclh4BKng/h6oAO1ICxO3lj1/d+/Qc/t8vPv8k679CXZPfGUCIX813ui
C5caWIgJ2jiMyJ7bQ8Cxac8S2L0Uyg==
=WuYv
-----END PGP SIGNATURE-----

--E3eVljpntNNa5fox--

