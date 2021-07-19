Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FF73CD101
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:37:55 +0200 (CEST)
Received: from localhost ([::1]:58838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Pik-0004yP-0L
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5Pdt-0001Vr-6a; Mon, 19 Jul 2021 05:32:54 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:38565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5Pdq-0003bR-Jn; Mon, 19 Jul 2021 05:32:52 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EF98A580843;
 Mon, 19 Jul 2021 05:32:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 19 Jul 2021 05:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=uzyNamEkQw9g5ng5UPXkRQ0Ay9o
 iI+W/MidWHBHwDfA=; b=HpTv3O9kW/BxLdmzp1+r5wsATD4hJneo66EjsdXAAoe
 KYIWLV9q6qvzctizjcQHwZwoEvcFRoscBZ9R3wbesT6CX+g/DXikTDplaY7ysV3N
 IVAQISyadhNccQhtUg48B7mntX8Gi8LN471Q+SXquEHpymkFCU9a3VsXNU731xSH
 KGKm3bEerLw1x5WP6PoIDJ/l/wFA6jQohbjRAqGFy/0ximl5MdE/FBnq+3NqGPpp
 NDYZn78MNZf6pp/NWHzgV42IzmD3NBKIhXBQ4ofQMX0JV/DZ6uoM89nC8dy/sJga
 Tgrv/b1gxXNa2E0cOLni8lMjfrUD0ykHqZ4vUv53etg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uzyNam
 EkQw9g5ng5UPXkRQ0Ay9oiI+W/MidWHBHwDfA=; b=wdI3653PtKQ2+5Gtv8c2W6
 4qALnJLU878TYfMtnC8cZAQCoFGKY7hdFm3wEswD6bphVp/3pQk6RjUmwIAajIJn
 FEXRUCWWpiiRjpbZNAGTl2QqJXz6IMz13nGjLmpSHl1mBZIGyMbvPIxpNNaWiAAf
 uYzOht0bZVbACAhdOvPF9QTIL3+v0nApZgIOaALXPXUUO7bImopUSUthHM6TsSaR
 cU1IZQvFs156pbzHjQuxyp1ANwQSbA7s4jMsOCVVyKEdRfg5dtWesJk8tgsVPeTv
 jOXRXvKGA/DnM9RxXP4luc/Lz6mk/RP6NzwddaXVrj804oohv9xLF0XhdMhPeg0w
 ==
X-ME-Sender: <xms:vUb1YNa79aRWh32IEh6l_V5r_Ku66G01kFztqDwe9fj68vI9TwRhtQ>
 <xme:vUb1YEZaoQi0CJa9WMQBuQwRFua236kGWo0FWO7cyNmtyA00MngwenEYpT-8qmFvP
 iRh2y8_23ftomt9Zsk>
X-ME-Received: <xmr:vUb1YP-rtodqinD9tGuSqlBAS7yD-tUbLsQOs1KScvCGtU3-2IO2LMvTbMq4vE6PiylaziDNs3Lc6GPBs80y1Y29kI0LAvIPvIQGHhWC3whCB0Cq8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueeuffeihffggfetheejieevleduhfetfffhheeigfehteejieetvddtgedvhedt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:vUb1YLrBRd2wdYqmXCsaHjSsouObR_MAnc1MXr2BtBHaT5kQ1szfeA>
 <xmx:vUb1YIpcfAKPlQfZYvrNMaxrdndNL6-qHWCwkGpm2VNEolEUm3-88A>
 <xmx:vUb1YBT_NUbVBei0SNCD1uS18REMClFYsI_4SddYeEf6Ao6_gJvEEA>
 <xmx:vkb1YF6tbqFbqfAQFjdxkrZvj9EREhKMT9mUF2S-mK_eKBDC4x1rfQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 05:32:43 -0400 (EDT)
Date: Mon, 19 Jul 2021 11:32:40 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 1/5] hw/nvme: split pmrmsc register into upper and lower
Message-ID: <YPVGuGsGjFRWExzs@apples.localdomain>
References: <20210714060125.994882-1-its@irrelevant.dk>
 <20210714060125.994882-2-its@irrelevant.dk>
 <CAFEAcA8cynksH16VXGGUp5wCi_J1wsATa0CDoc9E-uRfDuzNzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oyHUmyDZC0L1Z+mP"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8cynksH16VXGGUp5wCi_J1wsATa0CDoc9E-uRfDuzNzQ@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oyHUmyDZC0L1Z+mP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 19 10:13, Peter Maydell wrote:
> On Wed, 14 Jul 2021 at 07:01, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > The specification uses a set of 32 bit PMRMSCL and PMRMSCU registers to
> > make up the 64 bit logical PMRMSC register.
> >
> > Make it so.
> >
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  include/block/nvme.h | 31 ++++++++++++++++---------------
> >  hw/nvme/ctrl.c       |  9 +++++----
> >  2 files changed, 21 insertions(+), 19 deletions(-)
>=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 2f0524e12a36..28299c6f3764 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -5916,11 +5916,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr =
offset, uint64_t data,
> >              return;
> >          }
> >
> > -        n->bar.pmrmsc =3D (n->bar.pmrmsc & ~0xffffffff) | (data & 0xff=
ffffff);
> > +        n->bar.pmrmscl =3D data & 0xffffffff;
> >          n->pmr.cmse =3D false;
> >
> > -        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
> > -            hwaddr cba =3D NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CB=
A_SHIFT;
> > +        if (NVME_PMRMSCL_CMSE(n->bar.pmrmscl)) {
> > +            hwaddr cba =3D n->bar.pmrmscu |
> > +                (NVME_PMRMSCL_CBA(n->bar.pmrmscl) << PMRMSCL_CBA_SHIFT=
);
>=20
> Don't we need to shift n->bar.pmrmscu left by 32 before we OR it in
> with the pmrmscl part?
>=20

We do indeed - thanks for catching this!

> >              if (cba + int128_get64(n->pmr.dev->mr.size) < cba) {
> >                  NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
> >                  return;
> > @@ -5936,7 +5937,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr of=
fset, uint64_t data,
> >              return;
> >          }
> >
> > -        n->bar.pmrmsc =3D (n->bar.pmrmsc & 0xffffffff) | (data << 32);
> > +        n->bar.pmrmscu =3D data & 0xffffffff;
> >          return;
>=20
> Not an issue with this patch, but why don't we need to do the
> "update cba" stuff for a write to the U register that we do for
> a write to the L register? Does the spec mandate that guests
> do the writes in the order H then L and only the L change makes
> it take effect?
>=20

Yeah, bit 1 in PMRMSCL is the "Controller Memory Space Enable" bit
(CMSE) and we only enable the address space when that bit is set. So the
driver will typically write the high register first (if needed) and then
write the lower register with or without CMSE set.

--oyHUmyDZC0L1Z+mP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmD1RrcACgkQTeGvMW1P
DemwPgf/XPhYrL/EeaiicRDBdkjEiRBA6Ah/+HzAI3MpWyX9yPtlCbT5++XKN3fM
j+nq4NrDDo9Hyf/skzTOCYCXIf8TTPp2eqO+0BFIKdbDGQj1Sz8IPgno5WFnasmk
Zbs3SIclvyA9PskB+Fs9tcd+fcfArH05BBcX2XGXvbuDGx4H36066wmby1SAFmdd
P/sejwvACwcrcWgsI9hsNwNt1/UuT/s/Y4hLkSqx0+EqLd3zykmk4pzO7DNwrJ7V
rMWhP37xGvcIfC4Hoc+tmL7kksfFe4CdfuwF9jjF8QqEFCKROWzGJ7WxYY/iCPee
KGQmfYBWbjylvxOkgYF+JWp7Sra6OQ==
=yDij
-----END PGP SIGNATURE-----

--oyHUmyDZC0L1Z+mP--

