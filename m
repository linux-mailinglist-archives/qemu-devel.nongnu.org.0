Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB362C851F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:28:39 +0100 (CET)
Received: from localhost ([::1]:60632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjEL-0006HH-PD
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kjj4v-0001r3-B4; Mon, 30 Nov 2020 08:18:53 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kjj4s-0001YK-Kq; Mon, 30 Nov 2020 08:18:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1CD345C017D;
 Mon, 30 Nov 2020 08:18:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 30 Nov 2020 08:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ZvuwJAv9PZnpyR7RPWYTek6Y45J
 bHjx/DNqU8GYExjo=; b=g1/IexmcV7qa5LQeBV1gOQC4Z92VMIi1FacLEDt1CW2
 JEEenZXpuW8VIy1i5mLs9GQCIrzAtQp9M8wUp868VGnIGtjbr5KWUq08nY0GP+Y8
 iqorintXWlS8EctPbFUA0SjPGPL0+9SOuFQ61iiTeOk4QEgUo7v+yMUTiC9uZO5p
 8GwxzXBSZASAmEN2lEVIEWFoYHJsZwpD4RYTIVXgE6s5qSEpCHW9TxMBiKEzBGC2
 Ge7wAZa+Ek1oWyJ/EoGNfv6CBUwCt/k4uRKGmWhUpx0P+criQoSl+790Au8V3PRp
 +bodaXCpdG/fzyHGTif9E3FOnF7GUDBJ/DIWG9orseg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZvuwJA
 v9PZnpyR7RPWYTek6Y45JbHjx/DNqU8GYExjo=; b=M8EX6dILPJS/rlJ6qoiiVA
 JpozOsJFrScdo9OSuwuHttFoMi4HLIoS1P2yYmbVTNKspQTObWaP751h+qIsbLGt
 UE/XG4vZizXA5PEyl5YUn3FgX4NcVZxSbz36ta+nYbP28uLZYkMPXO87AU3kwA0B
 sh8zHX/u1lIzMFBKheVckR0BJgk8nUSoLZlThRqmusdwPTzm9ZTFITUx6V1Q7M6W
 FNF3/uwxsOIowelHqqaUdHMujONezXcKmG8dg8ZEY/7ju97PtRKUcjwxD8R0kqgp
 QTidsYx3IcEq89TfDzZNkxlr4Ehb2kbF+VnaRVWIx8vhO8R0HM4t+OD7ty6u8mWA
 ==
X-ME-Sender: <xms:NvHEX2YBJixvWJgv9HcCfBVZNYs3yzPYUWO80Vl9cJUI9-ezFsAFjw>
 <xme:NvHEX5ZYbvdvF_hxv9T8cFnXnx3CqWadjKvy8kD0oaeGgBUD-9YoPLlo4zw-7vP8K
 6iW3R5VN46Rpy80XZo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeitddghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:NvHEXw_UOjOTwX5y46_x6tqzWjJrF_hwhDmDIOXZgsMzs20wNdi_YQ>
 <xmx:NvHEX4owSW_hYbVQJYyw7wdyA9v4LPf-x2AdE2OQ6wy7g_hn3_bVqw>
 <xmx:NvHEXxprQcvJIDtPHugMcq4dk7SVoahv8CpkiJkR8aUJKbveyxSXOA>
 <xmx:OfHEXyeMTg-mff8gfSeAmyOueaOisPYwRuqKDRzRudLJWsKAF8EFMw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 972633064AA6;
 Mon, 30 Nov 2020 08:18:44 -0500 (EST)
Date: Mon, 30 Nov 2020 14:18:42 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v5 12/12] hw/block/nvme: add persistence for zone info
Message-ID: <X8TxMnoP/YOn7/hc@apples.localdomain>
References: <20201126234601.689714-1-its@irrelevant.dk>
 <20201126234601.689714-13-its@irrelevant.dk>
 <20201130123300.GA422962@stefanha-x1.localdomain>
 <X8TspZJE+B551qno@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zIrveY9pMlLb4CIU"
Content-Disposition: inline
In-Reply-To: <X8TspZJE+B551qno@apples.localdomain>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zIrveY9pMlLb4CIU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 30 13:59, Klaus Jensen wrote:
> On Nov 30 12:33, Stefan Hajnoczi wrote:
> > On Fri, Nov 27, 2020 at 12:46:01AM +0100, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > >=20
> > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > ---
> > >  docs/specs/nvme.txt   |  15 +++
> > >  hw/block/nvme-ns.h    |  16 ++++
> > >  hw/block/nvme-ns.c    | 212 ++++++++++++++++++++++++++++++++++++++++=
+-
> > >  hw/block/nvme.c       |  87 +++++++++++++++++
> > >  hw/block/trace-events |   2 +
> > >  5 files changed, 331 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
> > > index 03bb4d9516b4..05d81c88ad4e 100644
> > > --- a/docs/specs/nvme.txt
> > > +++ b/docs/specs/nvme.txt
> > > @@ -20,6 +20,21 @@ The nvme device (-device nvme) emulates an NVM Exp=
ress Controller.
> > >    `zns.mor`; Specifies the number of open resources available. This =
is a 0s
> > >       based value.
> > > =20
> > > +  `zns.pstate`; This parameter specifies another blockdev to be used=
 for
> > > +     storing zone state persistently.
> > > +
> > > +       -drive id=3Dzns-pstate,file=3Dzns-pstate.img,format=3Draw
> > > +       -device nvme-ns,zns.pstate=3Dzns-pstate,...
> > > +
> > > +     To reset (or initialize) state, the blockdev image should be of=
 zero size:
> > > +
> > > +       qemu-img create -f raw zns-pstate.img 0
> > > +
> > > +     The image will be intialized with a file format header and trun=
cated to
> > > +     the required size. If the pstate given is of non-zero size, it =
will be
> > > +     assumed to already contain zone state information and the heade=
r will be
> > > +     checked.
> >=20
> > In principle this makes sense but at first glance it looks like the code
> > is synchronous - it blocks the vCPU if zone metadata I/O is necessary.
> > That works for test/bring-up code but can't be used in production due to
> > the performance impact.
> >=20
> > Is the expectation that the QEMU NVMe device emulation will only be used
> > for test/bring-up now and in the future?
> >=20
>=20
> Hi Stefan,
>=20
> Thanks for taking a look at this.
>=20
> I could see why someone would maybe use the core nvme emulation in
> production (but I'm not aware of anyone doing it), but the zoned
> emulation is *probably* not for production (and that is where the zone
> updates are needed). But someone could surprise me with a use case I
> guess.
>=20
> And yes, I know this is synchronous in this version. I have not
> extensively evaluated the performance impact, but crucially the blocking
> only happens when the zone changes state (i.e. every write does NOT
> trigger a blk_pwrite just to persist the updated write pointer).
>=20
> I know this can be done asynchronously (I have implemented it like so
> previously), but I wanted to get an opinion on the general stategry
> before adding that. The opposing strategy, is to use a some form of
> mmap/msync, but I, for one, pushed back against that because I'd like
> this to work on as many platforms as possible. Hence the RFC for this
> blockdev based approach.
>=20
> But if you think a blockdev approach like this is a reasonable QEMU-esce
> way of doing it, then I'll proceed to do a v2 with asynchronous updates.

Let me rephrase that I will most likely wait to do the v2 until we have
conconsus and reviews on a zoned series.

--zIrveY9pMlLb4CIU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/E8TAACgkQTeGvMW1P
DenYIQf/T9Fnr+ERzZZ7ATRe5og/dER05h7xerwF7Kb/Ws+c+3rcZEOxXR0j7WE5
wwFSci+J4ZFytFwbj42nkugyyHEDBRyl8yhb1U+Z8JXdT80SQJWC2wq2LZxdh6T9
6RnWHAMfDoQc6kAsa8JxKiCIsaewyZ1CuJRmuCWz49pGW2e0VuyRuxCqJU1zQNXg
NlTc6YI+OXJDb53h9uoZKhqIH1Z8nEYUfaZLCGdsUbg3W35XTe78O3SR5SMUN5hv
DKU2V5GM3Pd/kWcMZragLhfEoN51D6jlJUOncoREDQ9AdDKIJ9TPCF3y4rvqy0S1
c8nZi7F2VNBscCo1cTSv9bWbwnZwxw==
=GjhN
-----END PGP SIGNATURE-----

--zIrveY9pMlLb4CIU--

