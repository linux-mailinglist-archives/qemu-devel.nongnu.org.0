Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52A33C6E60
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:24:52 +0200 (CEST)
Received: from localhost ([::1]:54106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Fat-0006ys-RD
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3FVo-0003e4-N4; Tue, 13 Jul 2021 06:19:36 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:46781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3FVk-0002GF-W3; Tue, 13 Jul 2021 06:19:36 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3B6503200932;
 Tue, 13 Jul 2021 06:19:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 13 Jul 2021 06:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Di18h5KlonZit/tFXDEKN6Moi6e
 dL0b4pylpR6/17fU=; b=UqNGDHa0z76ZMtptCnhGBRRq2Bq1d7PVyiBJTjLZeYm
 SWQ3ZEm6qP0ozPPmbU+27hqIjmCAjIS255jSyYa9g6XeuOzmHtIS6IBo0pwFpv//
 7KgEd5PuUFRMO35byGo1ApHEIhpNcmMNfKZg2CcURuxSwTg8iCtFWTeQXND3XXNi
 aimS3tpf2ug/y5/yCOaewib4/retjWD1/GAoyeCzS++jD5Y329RwnqcV7xcz9ehe
 jq6HMvPsjid+dRHc22euxiKyZeEqVyQK8smoGEVipBoMMSElof0EfMqnLD3YVRky
 qCzWy8AC2kY1TAh7vM6nO35ZpKGDghJC+6/qNNNZ03g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Di18h5
 KlonZit/tFXDEKN6Moi6edL0b4pylpR6/17fU=; b=c/eZOM/ZaizsL9dJFkCibz
 NtbJXhZBEOXqeysuyc28+491iG+gGqx1HK8RXClEBpGpiCy/1BTPp4Svv539EN3F
 BS5jEMDid1e/6VX9TgSxksqb9l8VDlVd+o01BRh07F3cMnaoLUopRomM5lxJutZt
 8vAUe/+OkuRPlBqFWQeDhA7JOg8GStKW1De3eIiiUFTzKoMzKbGUUaIAGQfAWqMf
 mt/xA/IMFjOi7MH4A20lJCEYce3sa4O4SVf6v7C3WZgO9miIg+tQ8+JvyAbpRFjY
 fbjBlFFTYyu0NhvAeu/fZkFvcC2s8xv9+aNFQDteVVheDKR2/P/7T85v3lPB8nLQ
 ==
X-ME-Sender: <xms:sGjtYEIeiqRIPd3RiEjty9KkpFR_EDn76kRxLD22PMWBOGmNNzj1TQ>
 <xme:sGjtYEJKzI5s3v-x_l7HEfMnrEmFqpocPl3f-gEcSeGp5WGW7PcT1HgQa7K5mrHD_
 BaxRo6WuGDYx0TB2DE>
X-ME-Received: <xmr:sGjtYEtC6_8AA6n6T_-q_KPWrLHrKgWlBrp_cniyR0P5hYPlaTgTOKVCsG1UTQfJoc62uzpeB3QPChT4E4TyMKxX-cKQJQsGLrSNsT5Rx3C5CRG3LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:sGjtYBYIwsBR1pOpr-z9I0E8E1690_7yYHEDPeLwVo-89uNmkrt3qg>
 <xmx:sGjtYLb5bCoYNpgW5iUTXohZUbS3lkbdTgfHd9fVVn9D5kwHFlGhig>
 <xmx:sGjtYNByboFD0YZUvSq_qu7CiR1BlUm-h6EKmAIke7IDCsxctCqrDg>
 <xmx:sWjtYGzdHBrEtnu7WvXoKaP4XxndVSmjjeNKRCKSGE2cYCpJlTGbbQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 06:19:27 -0400 (EDT)
Date: Tue, 13 Jul 2021 12:19:26 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/nvme: fix mmio read
Message-ID: <YO1ori+GqpbhxARg@apples.localdomain>
References: <20210713054359.831878-1-its@irrelevant.dk>
 <CAFEAcA8Qo7xfjAHNbZmDiVUkhnL2WRrEWp7U-urxOTBnao8Oyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U5ZpXSBvN4eaJIdu"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8Qo7xfjAHNbZmDiVUkhnL2WRrEWp7U-urxOTBnao8Oyg@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--U5ZpXSBvN4eaJIdu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 13 11:07, Peter Maydell wrote:
> On Tue, 13 Jul 2021 at 06:44, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > The new PMR test unearthed a long-standing issue with MMIO reads on
> > big-endian hosts.
> >
> > Fix by using the ldn_he_p helper instead of memcpy.
> >
> > Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/nvme/ctrl.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 2f0524e12a36..dd81c3b19c7e 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -5951,7 +5951,6 @@ static uint64_t nvme_mmio_read(void *opaque, hwad=
dr addr, unsigned size)
> >  {
> >      NvmeCtrl *n =3D (NvmeCtrl *)opaque;
> >      uint8_t *ptr =3D (uint8_t *)&n->bar;
> > -    uint64_t val =3D 0;
> >
> >      trace_pci_nvme_mmio_read(addr, size);
> >
> > @@ -5977,14 +5976,15 @@ static uint64_t nvme_mmio_read(void *opaque, hw=
addr addr, unsigned size)
> >              (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
> >              memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
> >          }
> > -        memcpy(&val, ptr + addr, size);
> > -    } else {
> > -        NVME_GUEST_ERR(pci_nvme_ub_mmiord_invalid_ofs,
> > -                       "MMIO read beyond last register,"
> > -                       " offset=3D0x%"PRIx64", returning 0", addr);
> > +
> > +        return ldn_he_p(ptr + addr, size);
>=20
> I don't think this will do the right thing for accesses which aren't
> of the same width as whatever the field in NvmeBar is defined as.
> For instance, if the guest does a 32-bit access to offset 0,
> because the first field is defined as 'uint64_t cap', on a
> big-endian host they will end up reading the high 4 bytes of the
> 64-bit value, and on a little-endian host they will get the low 4 bytes.
>=20

Thanks for taking a look Peter, I wondered if I actually fixed it
correctly or not, and I obviously didnt.

I guess I can't get around handling 64 bit registers explicitly and
convert them to little endian explicitly then.

> >      }
> >
> > -    return val;
> > +    NVME_GUEST_ERR(pci_nvme_ub_mmiord_invalid_ofs,
> > +                   "MMIO read beyond last register,"
> > +                   " offset=3D0x%"PRIx64", returning 0", addr);
> > +
> > +    return 0;
> >  }
>=20
> Looking at the surrounding code, I notice that we guard this "read size b=
ytes
> from &n->bar + addr" with
>     if (addr < sizeof(n->bar)) {
>=20
> but that doesn't account for 'size', so if the guest asks to read
> 4 bytes starting at offset sizeof(n->bar)-1 then we'll still read
> 3 bytes beyond the end of the buffer...

The buffer is at least sizeof(n->bar) + 8 bytes (there are two doorbell
registers following the controller registers). It is wrong for the host
to read those, but as per the spec it is undefined behavior. I did
consider reversing the condition to `(addr > sizeof(n->bar) - size)`. I
guess that would be the proper thing to do.

--U5ZpXSBvN4eaJIdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDtaKwACgkQTeGvMW1P
Dekuzgf/ajqINqhBuMHkd6PjCyv414U3uk9bZVz7YLM7KcGbR8RzweTe8+miehqx
iK78aroLpX439sE5URDoYExYFOQN0/gqjKIs5rMMsLm0FLxwnNC1LeaU3pWDId2I
Ve4tQ5dSIlO9tl5DulvCQ9YKCWpYcb5hjQO5MqYZAdAO9phdBK9E5Z4NNbkb3nSk
U+q5LFRhmN73jX6+kpSURRqlcdGWggBSq1QWZxSdkzuH79KVVczGjqR4i09prH7L
RroutnNcWxnygoi6tWvNIAxiyrFAocgP7pmRLJVpw/CKK1QVW0JldNZLQJS0bR95
euwMrapgUVDwfEoVNLpHUEQ9KY8k8Q==
=gQ1C
-----END PGP SIGNATURE-----

--U5ZpXSBvN4eaJIdu--

