Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CFF2D7053
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 07:46:53 +0100 (CET)
Received: from localhost ([::1]:46888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kncCa-0000Z4-CL
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 01:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1knc3n-0006Yf-NC; Fri, 11 Dec 2020 01:37:47 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:60725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1knc3l-0008Pt-3D; Fri, 11 Dec 2020 01:37:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 44F4058020B;
 Fri, 11 Dec 2020 01:37:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 11 Dec 2020 01:37:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=mdjHgxF4NVMKyAox8nI+GvgUaLa
 WQr5Pdtx6Ij6jo3g=; b=pRhIUgwS25fFIKgSocr2PX0AxP+AFrZkEhzv1ss1vs9
 zejsdy1o3mafvQaQ1xbE28BvY7H4/7Ktvxu0Mu2ghiO09t3erPkJGsHg4gAdPOjg
 tqZl7u0bIGa3TPlGtz3A5L3B7jUczinGI6OTPIefFfJ7QHomiZEXwTBu1cTcNZK8
 M5gw7M/vSU+jXWv2m/O6lzPcDoXwQV/KOx9ksbNk3jeG4GFNSbA4GTm8VKzwHU05
 6PXCkzLNBYLRMWgYamBrgFbcJ+dwoigcxk0MI+FA37q8Nna9OeBPpCTeEilLWnXX
 +2f9cQGzb+Ern+SF91XI+yIo3Xt47Mw6YfQLYjwhE3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mdjHgx
 F4NVMKyAox8nI+GvgUaLaWQr5Pdtx6Ij6jo3g=; b=kuzr33Q6JQSe7YRgSxaXDv
 i8buREWuREoxT+199mnInjigGBWiV9jR6GAvIM+IpFipbWs2BYZHtuSzyUD/BmJs
 ZJsv60M/hCc7+O04fVYRYRAtBabBLN+OnbG/9qRvdLP+5Vc84CcjHA+yd6bYZQUW
 qrf1bAVxzOU2Zr3PRlZKGdL4sfDNkQclK0tFEccozh1DLLqwVlfXsMwNbaFkhxKr
 yzucsdvd/Glbb8ULr57nMuHRa5W5P4IySu5ozEMFpiIbxvu0dgZegeGHF/Fc5k5s
 6MOaUga4qMLvWt4Th/pd06yb2qhSkFUO+nuO2fjhvf9YVZQ20m+uPSrOljvFLC/Q
 ==
X-ME-Sender: <xms:tRPTX7IQO9Z89kVsKb_nMDe9i-oIZc4SHfD-YpIVMUeOUdBhvcNFSg>
 <xme:tRPTX_IjNFCXgXDOxfi6gIS2pOqA99OYvrLn0Ws4mNl3Fei_eSK8E0zhj1KGtPQ_D
 Qj3n9o2qf7nwMsBd1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekuddgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:tRPTXzsS9_TLt6Fx1MwlRZNInFL09OYLJtLfK_wxrOHNKYxvILOL3g>
 <xmx:tRPTX0Yx24SR7fL2Eo02T9XlNU4DUpxfpHoHwWCBE0J4sU37FAdAkw>
 <xmx:tRPTXyajZNy2wJvHP0uhZBjlLiZ7iHSP5jFVGulADwXFHQGVXbDeSA>
 <xmx:thPTX0Aqb5Ejef-VZd5X28gEadRfSoLLYxH8zyuVwt2ft6ZP2YO3Fw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D54A108005C;
 Fri, 11 Dec 2020 01:37:39 -0500 (EST)
Date: Fri, 11 Dec 2020 07:37:37 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [PATCH v11 00/13] hw/block/nvme: Support Namespace Types and
 Zoned Namespace Command Set
Message-ID: <X9MTsbXZQv4l0QYj@apples.localdomain>
References: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
 <X9Cfod3RaAOM9dJP@apples.localdomain>
 <BN8PR04MB5940316D7867218AC28E0519E1CB0@BN8PR04MB5940.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bjWbwWYrzruvKnvo"
Content-Disposition: inline
In-Reply-To: <BN8PR04MB5940316D7867218AC28E0519E1CB0@BN8PR04MB5940.namprd04.prod.outlook.com>
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
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Niklas Cassel <Niklas.Cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Matias Bjorling <Matias.Bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bjWbwWYrzruvKnvo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 10 19:25, Dmitry Fomichev wrote:
> > -----Original Message-----
> > From: Klaus Jensen <its@irrelevant.dk>
> > Sent: Wednesday, December 9, 2020 4:58 AM
> > To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
> > Cc: Keith Busch <kbusch@kernel.org>; Klaus Jensen
> > <k.jensen@samsung.com>; Kevin Wolf <kwolf@redhat.com>; Philippe
> > Mathieu-Daud=C3=A9 <philmd@redhat.com>; Max Reitz <mreitz@redhat.com>;
> > Maxim Levitsky <mlevitsk@redhat.com>; Fam Zheng <fam@euphon.net>;
> > Niklas Cassel <Niklas.Cassel@wdc.com>; Damien Le Moal
> > <Damien.LeMoal@wdc.com>; qemu-block@nongnu.org; qemu-
> > devel@nongnu.org; Alistair Francis <Alistair.Francis@wdc.com>; Matias
> > Bjorling <Matias.Bjorling@wdc.com>
> > Subject: Re: [PATCH v11 00/13] hw/block/nvme: Support Namespace Types
> > and Zoned Namespace Command Set
> >=20
> > Hi Dmitry,
> >=20
> > By and large, this looks OK to me. There are still some issues here and
> > there, and some comments of mine that you did not address, but I will
> > follow up with patches to fix that. Let's get this merged.
> >=20
> > It looks like the nvme-next you rebased on is slightly old and missing
> > two commits:
> >=20
> >   "hw/block/nvme: remove superfluous NvmeCtrl parameter" and
> >   "hw/block/nvme: pull aio error handling"
> >=20
> > It caused a couple of conflicts, but nothing that I couldn't fix up.
> >=20
> > Since I didn't manage to convince anyone about the zsze and zcap
> > parameters being in terms of LBAs, I'll revert that to be
> > 'zoned.zone_size' and 'zoned.zone_capacity'.
> >=20
> > Finally, would you accept that we skip "hw/block/nvme: Add injection of
> > Offline/Read-Only zones" for now? I'd like to discuss it a bit since I
> > think the random injects feels a bit ad-hoc. Back when I did OCSSD
> > emulation with Hans, we did something like this for setting up state
> > through a descriptor text file - I think we should explore something
> > like that before we lock down the two parameters. I'll amend the final
> > documentation commit to not include those parameters.
> >=20
> > Sounds good?
>=20
> Klaus,
>=20
> Sounds great! Sure, we can leave out the injection patch. It  was made
> to increase our internal test coverage, but it is not ideal. Since the zo=
nes
> are injected randomly, there is no consistency between test runs and
> it is impossible to reliably create many specific test cases (e.g. the fi=
rst or
> the last zone is offline).

Yes, exactly.

> The descriptor input file seems like a much more
> flexible and capable approach. If you have something in works, I'll be
> happy to discuss or review.
>=20

Sure, I'll rip some stuff from OCSSD and cook up a patch.

> Thank you for your very thorough reviews!
>=20

Thanks for contributing this.

Keith, you wanna take a look an give this an Ack or so?

--bjWbwWYrzruvKnvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/TE60ACgkQTeGvMW1P
Den+hQgAgXyEn2BbCCHzMRZi4V2jGKVH2ZzwPMVzod0wb5v/icO0KeEaPd2+fBBa
Ui4pwmCZOuxWL+ggvo5AvxFVcMuFXfbr4sbXUMuMeLlugS6Sy/PQH+p8H97Dlc9n
hB3addvf4XKGFe/S6abUeaf7I1sMiT1mc0Ux9w9Lmu+0KNULqekVPaoc0YxyPSHz
dI+eVEEXGKcMpzWwDoTTt2R4MKnqSIFox7WsGas4YUx8H91BwTUykVHo2IYzMXTG
SHJYIDOOQ/E8LIRM0lT+GukYxfzCFfDOFdmMIO59Hy1ZjgmLHwOp30NEbnW8YqyN
Z+40xV82gM08UWV+StVeyHoHnU5eEw==
=851Y
-----END PGP SIGNATURE-----

--bjWbwWYrzruvKnvo--

