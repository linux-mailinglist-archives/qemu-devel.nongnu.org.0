Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5848A354DCA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 09:23:06 +0200 (CEST)
Received: from localhost ([::1]:38612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTg3E-0001WT-Vk
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 03:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTfxO-0008TD-A5; Tue, 06 Apr 2021 03:17:02 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:35215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTfxK-0002Fa-Qh; Tue, 06 Apr 2021 03:17:01 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 536CC58043E;
 Tue,  6 Apr 2021 03:16:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 06 Apr 2021 03:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=oesuBYTOkQ1O177pF9q1C8TooxA
 dx0HlDYGjImTz1xc=; b=uTQUpdhwD72WXhw+eawoS86TM8TnDj5p8L7gYKMyuUM
 6Hd/WWenohHduxNnpVq5AnyofihXafEjZaTUHGqPwJFYfhEaH0vDqtA8aZLHwmZS
 KOkoMpNyCnPvODkeaXbXs9vw9104IhXFhwpYn14orvCfg2dHC5gJtT9D1zPi7hxo
 8Qg+9o8dJznRhc4IZ7LEIuUmL70ldC8l808mikaetdA8LWftnJtGB1LQaHdUuTyq
 e3sFAHfwkgRF0RcuLvkKZgIhXmkfVT5iC1FzIZO31ZGVzTZB+RO21WTCOpufd21S
 zxpOQyKQZyttMXCCRDAYibGPmn0oAd4vTZ1rYLJC60A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oesuBY
 TOkQ1O177pF9q1C8TooxAdx0HlDYGjImTz1xc=; b=pZejU/eNZ4t6UA/hxjMqs7
 SkECikvqAED/H3uMtnpzcoV/a6C5p/0cVXGWLGVDOJ2YPvd5Wfz7AnQsnf1PVFoD
 k0ZK5o/i6eNbYCnGOMH0yJ4jIcLtntXv9BxS5k+epqugLnCkdLumY0TmDhhyij6c
 pWh0qV+WHUYTSHqDY4t07U4nVNsXlWymZkHA+kbXFgDIJR9LZOctjM/5Y4lWLEJh
 g0O39xbqcG8rglTJAEPR62V9uVvocq/oi9keOM5iOeJk5yMIO4X9yTGDJgAZfVrM
 Q9FDGXBE/ODIwzwFRnsglRbtUhkoUArpniv33n/jM1sw6fgpbfpC9e3TnxfVF0tg
 ==
X-ME-Sender: <xms:5wpsYDN9rACOiY441ns2ojoZyJYjxigpYHgoKVxSKZx0bgrSLO9g3Q>
 <xme:5wpsYBpiYt6H6_335r4bfvAp817tylF-9KUj6IgiKl0oaZaP5FQWxIkiXdPQNzlaj
 67KPTfF9G9se0rTs9Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejfedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:5wpsYMF7wlgfR7DCfgBRVrCt2WvZzduqVW_fatk7SaR7Qy3o7izCOA>
 <xmx:5wpsYOqG191V1MdoKKxPeEQzJHIEAMr4a3LppAvstiGZLOxa6TRYUQ>
 <xmx:5wpsYNZ8KMr0iSNXYB2NhEp4i9gFKhnEJYq7TdKoduc9o55RZ5e7zg>
 <xmx:6QpsYDK9HhbTJ7-oxVkbRMJdgJMrsJs0Gq73uk5SlE6BI3aRu8PUXw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D71F108006C;
 Tue,  6 Apr 2021 03:16:54 -0400 (EDT)
Date: Tue, 6 Apr 2021 09:16:51 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH for-6.0 v2 3/8] hw/block/nvme: fix the nsid 'invalid' value
Message-ID: <YGwK4zjLjNXUNA+f@apples.localdomain>
References: <20210405175452.37578-1-its@irrelevant.dk>
 <20210405175452.37578-4-its@irrelevant.dk>
 <3b061ab5-573c-0c67-3990-8087aa385ddb@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PdArzzbKM13UVi9e"
Content-Disposition: inline
In-Reply-To: <3b061ab5-573c-0c67-3990-8087aa385ddb@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PdArzzbKM13UVi9e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  6 08:53, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Klaus,
>=20
> On 4/5/21 7:54 PM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > The `nvme_nsid()` function returns '-1' (FFFFFFFFh) when the given
> > namespace is NULL. Since FFFFFFFFh is actually a valid namespace
> > identifier (the "broadcast" value), change this to be '0' since that
> > actually *is* the invalid value.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > ---
> >  hw/block/nvme-ns.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> > index 9ab7894fc83e..82340c4b2574 100644
> > --- a/hw/block/nvme-ns.h
> > +++ b/hw/block/nvme-ns.h
> > @@ -96,7 +96,7 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
> >          return ns->params.nsid;
> >      }
> > =20
> > -    return -1;
> > +    return 0;
>=20
> For 6.1 can you add a NVME_NSID_INVALID definition along
> NVME_NSID_BROADCAST and use it here?
>=20

Good idea Philippe, I'll write that up, thanks!

--PdArzzbKM13UVi9e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBsCt8ACgkQTeGvMW1P
DelAGgf/VBQXzlpMpnfVak9b4lpigtPC31A/MQGW1tPXB7/gx8xTOrE66nZnTcSs
DikoBT8Jp1EJptCoJrznC14u1KGqS2zxXJkLEp2NOngv9hmef8XnO5kfJEwuve9a
zkCh6vDswUdd9QRtJgEUUQK9fZA3PV1SsQ9mfYKgQmDqc6sdG/tTZ9gVG+pF+9Ii
J0ipdyMYqHDozcu3eMaQ+sHlc0cI7RvGF2jfMnQpv5Bvz2QvKCBJZX8Ejl17bLvZ
N4R6wo6wP5kJjut2tBjC1qEcvbaadoLm3n4kiYVEFfLkQc5JY1uKhRZt2vP8Rkfx
ktyjlgmSrRO/NheXhZJnfu05SElaBg==
=D81J
-----END PGP SIGNATURE-----

--PdArzzbKM13UVi9e--

