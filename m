Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD031402F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:18:02 +0100 (CET)
Received: from localhost ([::1]:55282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Cyv-0003ho-HP
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l98lC-0000f9-PM; Mon, 08 Feb 2021 10:47:36 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:58189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l98l8-0002wx-Pn; Mon, 08 Feb 2021 10:47:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EC4D19AF;
 Mon,  8 Feb 2021 10:47:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Feb 2021 10:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Ef9ohPC12ThdZL865dNiM6MKLye
 scVXZkfkelyXFBnc=; b=2tSngQMZI/cXc5inL0MdURJFEprtuzn95TM5YVUqreB
 5iUS1YSEK57gO/Yx0ejU8XvUzPq/Wu3rcp9G/fZKGV9g3GQZlQ7w2bl88vdpOdLg
 BwHxjLKqAVJx6KUG+2vB5eRO4I4eRuVVhnVbdziDdTCFdyFb1omXvBc4ZRyYYFA+
 MGCqsSU7twAnNvGJPOMHQhcRaVp/VOWD11gtKkC2U+qYtdLGyha8vyTVPzdtRbr9
 12nghDX34Z7/kTZTINNIICmzlcs9+jYGilsWqAzKJa7BZNr39gwj7E0rJf2DLoQL
 8lJXa0prK+bmICNRd/MZGB1h1siTD4Enq5WUOBB4WJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ef9ohP
 C12ThdZL865dNiM6MKLyescVXZkfkelyXFBnc=; b=VYZ64D5XPOfNsQhz/jT7uW
 nEYoMoxpkBQsbVIQu1+z4sYbn0cf6OY5q4EHRuk9bkMe9vtCehbiHD16Gxs0DBQ2
 BROlfIMnpMSYyUYRYFhmjuisLza5NQkfSQ4RtUGBi6wjsyC25eNzXSNvh/LeQ4ow
 Iv6/AZJeiPhKzbMbPG+66ezL0hlGrYqnybmGDKn65q0XrZgC72qQU0LD3mX7Pldw
 5597amb/2/DG5URmJA0R3t7imIDT5P9z93tNqnUiyDLcMT92IsdShSoWPhLT+4Sl
 MY6V6y+UzLFBr9wb23NdPyhluCsDmTUavJkA4weaCF60hN3TSz08IcABsL58CsdA
 ==
X-ME-Sender: <xms:DV0hYP5UsHmMEQfXhKWP3D3AL0i1lq944TsbLyvWFcMRLo7Q946sgQ>
 <xme:DV0hYE6AjiIaaZekPzZlEgVMQqRyG8aK1g9hKGDNHOrMZ_z_3B_pCRdrEMFNcwY6J
 dXalK_LE9A0QKEwH1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:DV0hYGcNO6E9YClVNSsqWLf2TGfcD8Sw9lsTQgx0HoIWI3CsNJq9ng>
 <xmx:DV0hYAKrBqawtPjNfk9ByUvcdjtg8wvmVOBWhD83g12j2WWDZyzA-A>
 <xmx:DV0hYDJglkxtOupuTpNPgn1Y7gxEucbozUrsCAF9rVWQOXVXdmFJOw>
 <xmx:D10hYAq68DhOdf-rOXhuTxpfN17iwFeokdjNib7KuzW63Bbg_E4GtQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9018E1080067;
 Mon,  8 Feb 2021 10:47:24 -0500 (EST)
Date: Mon, 8 Feb 2021 16:47:22 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH RFC v2 4/8] hw/block/nvme: try to deal with the iov/qsg
 duality
Message-ID: <YCFdClU7SrrHU6TU@apples.localdomain>
References: <20210207214940.281889-1-its@irrelevant.dk>
 <20210207214940.281889-5-its@irrelevant.dk>
 <20210208154515.GC16360@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1/mhmlX8JaCPjboK"
Content-Disposition: inline
In-Reply-To: <20210208154515.GC16360@redsun51.ssa.fujisawa.hgst.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1/mhmlX8JaCPjboK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  9 00:45, Keith Busch wrote:
> On Sun, Feb 07, 2021 at 10:49:36PM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Introduce NvmeSg and try to deal with that pesky qsg/iov duality that
> > haunts all the memory-related functions.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.h |   8 ++-
> >  hw/block/nvme.c | 171 ++++++++++++++++++++++++------------------------
> >  2 files changed, 90 insertions(+), 89 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > index cb2b5175f1a1..0e4fbd6990ad 100644
> > --- a/hw/block/nvme.h
> > +++ b/hw/block/nvme.h
> > @@ -29,6 +29,11 @@ typedef struct NvmeAsyncEvent {
> >      NvmeAerResult result;
> >  } NvmeAsyncEvent;
> > =20
> > +typedef struct NvmeSg {
> > +    QEMUSGList   qsg;
> > +    QEMUIOVector iov;
> > +} NvmeSg;
>=20
> It's always one or the other, right? If so, this could be a 'union'
> type, and then you'd just need an indicator field to say which type it
> is. There may be a meaninful memory savings that way since we
> potentially allocate thousands of these.

Yes, that's true.

I'll do that for v3!

--1/mhmlX8JaCPjboK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAhXQkACgkQTeGvMW1P
Delt+Qf/TXI2ojJbYKBXp956/rh97wf8h1me703AetbGYwfafsNWUYAGykvavWr4
H7GjSePq7b7a/9AmobkLNNsp1OKC006hD7tX82U66yAE/QB+QMTLZgSc3il0ItqB
e5lSIiWPNH6/J4HFYEtW5WZL7rTPlHtO6ZnhTVrB3/fSvL7vZy19zlJRXdvQrnA7
f0xUfOIW96vrsTqddx7u+VRz7a8GWVg0DQDrwQn0idBqRIrLp2mE9/fNzYqfpX50
0AqUZvXCYNzGK0hbtI7J00rKqA3oN3DTQO5vwZsqGRtCiigQDKxbndxUWGKx62lI
yZHXe/33Ar9vin1ZGgfZVAUEZb8M8Q==
=Qx8R
-----END PGP SIGNATURE-----

--1/mhmlX8JaCPjboK--

