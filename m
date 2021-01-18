Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F1F2FA08E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:59:25 +0100 (CET)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1U7w-0001Ao-AC
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1U2m-0007cS-Uy; Mon, 18 Jan 2021 07:54:04 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1U2k-0003Ap-1i; Mon, 18 Jan 2021 07:54:04 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 17D555C0117;
 Mon, 18 Jan 2021 07:53:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 07:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=t9CMczppE1vs/qxl/riViTt+MpZ
 XH/rQsaT0f4AD5K0=; b=keF1QbztEJz5bO9ljxRRYegDmQel3F7Qyckhi1XKTfE
 +IlPg4wwfae44AvDHNiPRQR1bR/4w4h/jvWRXCLoYbfTM1PZNoDpgsgR5bKFrHo1
 hErUODCBVh7ugygzwjmYx55BVVTOV8mzyUq6pzJyVmPTMCpt+lA/h5EP+aGD+9Jk
 T6pgxZI/THaNcZ6EDIgG+AD65+zYrFDbsNbg71R2E0cGeA5OrBCDLdpbwUhRC/I/
 1+lNq+xAgZithl6gIPWvq3nEYBrZ0QZ3uLAVxHYQE8Byqy7ABG1PhbZLp6Ktyif+
 2LHVbuMBZiD4OvlLak+mBplIPOHmE/Ze1GBOHThLrUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=t9CMcz
 ppE1vs/qxl/riViTt+MpZXH/rQsaT0f4AD5K0=; b=oazn51JPkjeHeDgDgyH8nf
 mV2uOfOr+pQ4pYAf3wrPVma50vZKFEVZBY/qJsRx1EGPhqkiQV6tkKbRIdwM0dPN
 Kw/w5kICMrHJEkBSlKqhNm93K003421FIUrOndspndp1bZS2H3nyi72iaxRRH44y
 AAK2X05ft/fF7ypb3UB4DEzbPSln7/eoqIUdeeWJ2Mu3HLV/WppCn98F4tnxG0vo
 pKUqoSubYwu5NTZxyCkHvr7ksvhqXvTrQmptOnXrBP0cVTDxcUQIbvNAAlymGlyl
 oUljUACgcJwVwVWmqJqKphFeQfZMSWV+0lcHIin2ZWjcHK2cBvDXR7BM2Z7Gv4og
 ==
X-ME-Sender: <xms:5YQFYNJ0u2Sr6ELgoOL-ZxYlgAT5j_I3nAhNSvmeDLHbM_x7tit94g>
 <xme:5YQFYJKFU2SE61buKk8WRVQZl1e33XJu5ol2VXXMxxHJbYB7de2iDUfvr9htNoyMc
 jERwRhnQqNmgGE3wb0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:5YQFYFtjiXc_t_zNZrU_cv7GlQ8PQvA_F9QSbc60oMKkq1TmFWMxhA>
 <xmx:5YQFYOZ7ihv8reYZfhJAKDBmGEL3zevah7M2811cDcZeuqzS3dAIcg>
 <xmx:5YQFYEYpkw0Jxu6NygC0TDgRBw1p08pUPBduS52HcqcwhHegodcjcg>
 <xmx:54QFYE6Y0Vgbv8fTJA_5g5jeQjupF3b54KWmAbgd6GajGeUHOUj9sQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E3D9D1080066;
 Mon, 18 Jan 2021 07:53:55 -0500 (EST)
Date: Mon, 18 Jan 2021 13:53:53 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v2 02/12] hw/block/nvme: fix 64 bit register hi/lo split
 writes
Message-ID: <YAWE4cDhwQOoc8NT@apples.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-3-its@irrelevant.dk>
 <20210118124100.GB18718@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0bZi2fgMGVYlTvNP"
Content-Disposition: inline
In-Reply-To: <20210118124100.GB18718@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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


--0bZi2fgMGVYlTvNP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 21:41, Minwoo Im wrote:
> On 21-01-18 10:46:55, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > 64 bit registers like ASQ and ACQ should be writable by both a hi/lo 32
> > bit write combination as well as a plain 64 bit write. The spec does not
> > define ordering on the hi/lo split, but the code currently assumes that
> > the low order bits are written first. Additionally, the code does not
> > consider that another address might already have been written into the
> > register, causing the OR'ing to result in a bad address.
> >=20
> > Fix this by explicitly overwriting only the low or high order bits for
> > 32 bit writes.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index bd7e258c3c26..40b9f8ccfc0e 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -3781,19 +3781,21 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr =
offset, uint64_t data,
> >          trace_pci_nvme_mmio_aqattr(data & 0xffffffff);
> >          break;
> >      case 0x28:  /* ASQ */
> > -        n->bar.asq =3D data;
> > +        n->bar.asq =3D size =3D=3D 8 ? data :
> > +            (n->bar.asq & ~0xffffffff) | (data & 0xffffffff);
>                              ^^^^^^^^^^^
> If this one is to unmask lower 32bits other than higher 32bits, then
> it should be:
>=20
> 	(n->bar.asq & ~0xffffffffULL)
>=20

Ouch. Yes, thanks!

> Also, maybe we should take care of lower than 4bytes as:
>=20
> 	.min_access_size =3D 2,
> 	.max_access_size =3D 8,
>=20
> Even we have some error messages up there with:
>=20
> 	if (unlikely(size < sizeof(uint32_t))) {
> 	    NVME_GUEST_ERR(pci_nvme_ub_mmiowr_toosmall,
> 			   "MMIO write smaller than 32-bits,"
> 			   " offset=3D0x%"PRIx64", size=3D%u",
> 			   offset, size);
> 	    /* should be ignored, fall through for now */
> 	}
>=20
> It's a fall-thru error, and that's it.  I would prefer not to have this
> error and support for 2bytes access also, OR do not support for 2bytes
> access for this MMIO area.
>=20

The spec requires aligned 32 bit accesses (or the size of the register),
so maybe it's about time we actually ignore instead of falling through.

--0bZi2fgMGVYlTvNP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAFhN4ACgkQTeGvMW1P
DenSagf9Fr2EsBhCFR1eaieGl5sF4iF/PzRP4gV0/wDuu8sqS0J4tUHbA+OWBWXT
sAUDzNBqosH9Gr2DDdH6qGdba+tOGET+UskidgLt+DVnlue/Eg/pDyQt2EzCG/GK
xufAZXLfS/h3N0R167qKGfTrb5r6dqA+Lnp2Slt1gPXwNEhcdPsKQa2X535e+zZl
wDadGY2qyPHMbEd1xh1Me5YB1UkEe7LlbA+DynXWvmCE0HFy2E5bUmOBn4YxvdRm
Pvp0ZFahK53qNuY8rBDAbZLjC8dcUDIXnK+IICgiEx1GjQcjOKeOHmJs/IlWe2yZ
24MTNwrZb3nvsnpx5Axg7JrDZvdOVA==
=bW0q
-----END PGP SIGNATURE-----

--0bZi2fgMGVYlTvNP--

