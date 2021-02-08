Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B862F314464
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:58:43 +0100 (CET)
Received: from localhost ([::1]:39882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GQU-0006fE-Kb
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Bmy-0002yb-Hg; Mon, 08 Feb 2021 14:01:36 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:45107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Bmk-0004rX-Gg; Mon, 08 Feb 2021 14:01:34 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id E3AE85800F0;
 Mon,  8 Feb 2021 14:01:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 08 Feb 2021 14:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=OIiTNIH7SyEyGYRZ2nw9PUbZabc
 ASsCo87Us79Lhk1M=; b=t9dByYtd6n3IuHGuByLnTely+5idC/ri62lpIvz0zsY
 DTIVyBsdxOYWM+PxiZ9yCx+rH/FacHGwhN+x+aLMI7GJP24QHL8HLBr1WT37jG+N
 b+A178Z/2IAiqIV62Jye6Pf30B6yvrjEkRRhqsr95iyoxvXgnRlqHu+onSVHP5Vx
 A2FP7eKzs6LuThZlgYXk3y3mKbdM2Cdb1EhfAnYZP3dlcxQpY+ewMhuNx5gDIbvr
 NWSkayA1KRuDNqmqfxGMGpmAZoHbicBqqsa5iHofWYs03I58QBHqqvX58lhS3OQz
 FaL4zggsOkgE+jnIUsQO+vU+Koe9+/qJL0KhaDTDuIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OIiTNI
 H7SyEyGYRZ2nw9PUbZabcASsCo87Us79Lhk1M=; b=vTcPUaVn434Etr/w6JgI4O
 3bkE05f2gLWPoefKRW4ZDMkMEH17ouG8/ktHw4AZIS+8F1dCyuVC/Yd/0qsaeUGj
 EqYsu63CLi2UFaml7CfYXKU484mhpFGClNgC1/ec/9/F+2ZnBsytjinI3q9NpsSM
 46pixmx25F3eaIdoS6aFFBTtO6vi5jiWh0IlcH8MVSrq1T/VS2ZGpKtqpR4w7FNJ
 bvFnv6PTDzKdbOQ2r+YHxlI9kV7smNcca1FWW6p2g5KEndl0CSGJbA+H8yOgfzjf
 fHSijQXbotm+3LC360MY1i1cE02AjNoA62KTurRN7WWd6z1B/gbpXhjUw62eIuUA
 ==
X-ME-Sender: <xms:foohYDQf62th5ygXIcH7jsGqEeoxKCxOOdcXjFrsX5HQP1gwCM9gUQ>
 <xme:foohYEuCinWEznjn-KT8z0MXp6WfgK1tbg3me58d0VjxaYm87LObbD-OuerUSTZw6
 rftBc5M427O85OltZ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuueffiefhgffgteehjeeiveeludfhteffhfehiefgheetjeeitedvtdegvdeh
 tdenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:foohYFvRUUWl5MaESvmmOrsD9VMwcKmMvPoaKRip2JOgNkWJbVUE-Q>
 <xmx:foohYKzSfLGrIE9_Ww2kOY53sOTXKQwQz4DyZzs3b5iMVGSyudaNyA>
 <xmx:foohYLhE-yTx_A4uMO94VMT28Tn2-PGvDbTiLRvnL61x1Dk_og5Bkw>
 <xmx:f4ohYAoD0Aw7WmIa3NtFeMKXCKM1-z1qZHtOZdUpRVsy69mmCTzzNQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 468CC1080068;
 Mon,  8 Feb 2021 14:01:17 -0500 (EST)
Date: Mon, 8 Feb 2021 20:01:14 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] hw/block/nvme: use locally assigned QEMU IEEE OUI
Message-ID: <YCGKeroQWGoXKMTL@apples.localdomain>
References: <20210208141012.377500-1-its@irrelevant.dk>
 <20210208141012.377500-2-its@irrelevant.dk>
 <d8538da5-ee8c-909c-bf1b-c8dc042bf243@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VgXWs2J0CcZuKxMu"
Content-Disposition: inline
In-Reply-To: <d8538da5-ee8c-909c-bf1b-c8dc042bf243@redhat.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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


--VgXWs2J0CcZuKxMu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  8 19:56, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/8/21 3:10 PM, Klaus Jensen wrote:
> > From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> >=20
> > Commit 6eb7a071292a ("hw/block/nvme: change controller pci id") changed
> > the controller to use a Red Hat assigned PCI Device and Vendor ID, but
> > did not change the IEEE OUI away from the Intel IEEE OUI.
> >=20
> > Fix that and use the locally assigned QEMU IEEE OUI instead.
> >=20
> > Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index c2f0c88fbf39..547a3073ef1b 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -4686,8 +4686,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice=
 *pci_dev)
> > =20
> >      id->rab =3D 6;
> >      id->ieee[0] =3D 0x00;
> > -    id->ieee[1] =3D 0x02;
> > -    id->ieee[2] =3D 0xb3;
> > +    id->ieee[1] =3D 0x54;
> > +    id->ieee[2] =3D 0x52;
>=20
> Shouldn't this be conditional on 'use-intel-id'?
>=20

It definitely should! Thanks!

> >      id->mdts =3D n->params.mdts;
> >      id->ver =3D cpu_to_le32(NVME_SPEC_VER);
> >      id->oacs =3D cpu_to_le16(0);
> >=20
>=20

--VgXWs2J0CcZuKxMu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAhinkACgkQTeGvMW1P
Deks2AgAnGr3vTf8tESFatHbuUN4u7zfMBIs63aR8hvnuLJlZ0I0Ofb2ItNd/w2/
5v72f79pTN4j3g4w5qvWDGeHFPJeo7luXRd4wYNUW3xGENuq2hMUpGKebLNQChEn
YCG3+2pvih3Zx9nUcWck7MvhMMR17lnmzz7rr948cJZ4gtSDHFqnCzW7gwLGRVJ9
vD5IudWnDHOVOHG5b+msgH8VvMniJkc/KROkcwpJ+nA9WbJyWa6dmifsx7m6ZmU6
7GHkv+84wvyMveBaYUtSKeHRiTL+sOli5UrKVbbHsidonul/1RkHvZRmGeAu3WvB
4h0AZJ+BSuWWb3CectYXcZOC4qa0dQ==
=ZtBL
-----END PGP SIGNATURE-----

--VgXWs2J0CcZuKxMu--

