Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BEF40E1B4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:51:11 +0200 (CEST)
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQubM-0008Ux-5F
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQuI7-0001eC-Me; Thu, 16 Sep 2021 12:31:17 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:39627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQuI1-000270-MW; Thu, 16 Sep 2021 12:31:15 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 222DA320093F;
 Thu, 16 Sep 2021 12:31:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 16 Sep 2021 12:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Cd82PinYr5Fc94dMDNs1Xm7fycz
 HGDgqgVbJ+eoj5sY=; b=D0/SRw6Wz8sO3p91Slgfiy5hvr5rb9OpH4kc/xP+S+5
 6sfxbQX/A49UhlsbpRD0P+PCTHOI89UIejLcSGSbzTMnnU7f/rUTzSVLxUkYXyao
 g9s+JUUnI1n9lVesbN6Jk9fN6Oj/ARESxkfdSpMYzF9hbhYaD4QFBzuY8iw5FYBP
 7q8H3zP/OqW5Oj/XhzOL7rlnGfR3hDoczDPjpJEXPQvGdAw03HBIT+ulwSEoJFv/
 frPxlul7qqudkmW6Plwa56nWdMw869lA4b0aOECNQudPmllWXQxsX99kOQiBIuMn
 IZTsD3HgpxBl0+E5rroRj5FbRV6TmjB0a6nkNI4P52A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Cd82Pi
 nYr5Fc94dMDNs1Xm7fyczHGDgqgVbJ+eoj5sY=; b=aTsfxcgqadzW/92h8xqJZI
 eCgDyRV0LwRDpeWwgSAK5pNK1YalJ0xqssbnoxBS4pG/kylXDGgqBdyCJaFs2Fmn
 BgRwDYoCEnds1y+YbeRuVxEjESUwRhxLEO9QsnNLuvOyTmv48yWcfG9qlUMLcIVW
 nChF7yXwWPq7BwLdL5PRdYK1XzlJNgLa4/X9N+/Tukhwmv9wS1fxatNKWH6o68Jq
 9S9FdO78vlXTpXGLxu8Magr1JTagRmrRbjOsg1YziFe+L39Va+cWnb1y+SxbZxiF
 p9GftewzsgWcHiSzHrMFch42YlUBg1QZrTNPRje9StF4Smi/sqB9pFt08PZ6bIsA
 ==
X-ME-Sender: <xms:RXFDYSfvb-KBIXaH-2yRQ0R2VgrruM3p4-zyxF4z9lJCh0YjUK6HZQ>
 <xme:RXFDYcP5b4xU4CDBlI36zwpMaJr62kC5n7P_FsQu2f9YrQ_OU2EpVItwm909Lz519
 E3cLECaTWxZvpTjDT4>
X-ME-Received: <xmr:RXFDYTjiNrfC9G3aF3kRE9_sRdY8GAnWJbVmgDOhCnFhsbziW6ty_QIZXfV7YVBYNP88TLTdi7rR9S4pjuSFPv1ugwxtD057lgboZj-A8PNISWIZPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RXFDYf8NILL62gI1ZSFZ-uNuMoel1jhEBV57O9CIJ_lUhNNtD8cUIg>
 <xmx:RXFDYevTkOnXrMGlpeku990UnxtSxG2EraZfNFWyn1iwcMwYhYuBLw>
 <xmx:RXFDYWH5mTgZnOGaUFEiZrxeRrgHTbOjkgojFx33ScNhGo5dXxDCTg>
 <xmx:RnFDYcDIwqtAFGpeYzVITHq4wSsjIGSoVZP1nqVBpeFI1CGQvHNH7w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 12:30:59 -0400 (EDT)
Date: Thu, 16 Sep 2021 18:30:56 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH RFC 00/13] hw/nvme: experimental user-creatable objects
Message-ID: <YUNxQCbZSF3nMkVT@apples.localdomain>
References: <20210914203737.182571-1-its@irrelevant.dk>
 <YUM7YEQDQ2L3Qdh9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ogu5yQgKENf7ltnF"
Content-Disposition: inline
In-Reply-To: <YUM7YEQDQ2L3Qdh9@redhat.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Ogu5yQgKENf7ltnF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 16 14:41, Kevin Wolf wrote:
> Am 14.09.2021 um 22:37 hat Klaus Jensen geschrieben:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Hi,
> >=20
> > This is an attempt at adressing a bunch of issues that have presented
> > themselves since we added subsystem support. It's been brewing for a
> > while now.
> >=20
> > Fundamentally, I've come to the conclusion that modeling namespaces and
> > subsystems as "devices" is wrong. They should have been user-creatable
> > objects. We've run into multiple issues with wrt. hotplugging due to how
> > namespaces hook up to the controller with a bus. The bus-based design
> > made a lot of sense when we didn't have subsystem support and it follows
> > the design of hw/scsi. But, the problem here is that the bus-based
> > design dictates a one parent relationship, and with shared namespaces,
> > that is just not true. If the namespaces are considered to have a single
> > parent, that parent is the subsystem, not any specific controller.
> >=20
> > This series adds a set of experimental user-creatable objects:
> >=20
> >   -object x-nvme-subsystem
> >   -object x-nvme-ns-nvm
> >   -object x-nvme-ns-zoned
> >=20
> > It also adds a new controller device (-device x-nvme-ctrl) that supports
> > these new objects (and gets rid of a bunch of deprecated and confusing
> > parameters). This new approach has a bunch of benefits (other than just
> > fixing the hotplugging issues properly) - we also get support for some
> > nice introspection through some new dynamic properties:
> >=20
> >   (qemu) qom-get /machine/peripheral/nvme-ctrl-1 attached-namespaces
> >   [
> >       "/objects/nvm-1",
> >       "/objects/zns-1"
> >   ]
> >=20
> >   (qemu) qom-list /objects/zns-1
> >   type (string)
> >   subsys (link<x-nvme-subsystem>)
> >   nsid (uint32)
> >   uuid (string)
> >   attached-ctrls (str)
> >   eui64 (string)
> >   blockdev (string)
> >   pi-first (bool)
> >   pi-type (NvmeProtInfoType)
> >   extended-lba (bool)
> >   metadata-size (uint16)
> >   lba-size (size)
> >   zone-descriptor-extension-size (size)
> >   zone-cross-read (bool)
> >   zone-max-open (uint32)
> >   zone-capacity (size)
> >   zone-size (size)
> >   zone-max-active (uint32)
> >=20
> >   (qemu) qom-get /objects/zns-1 pi-type
> >   "none"
> >=20
> >   (qemu) qom-get /objects/zns-1 eui64
> >   "52:54:00:17:67:a0:40:15"
> >=20
> >   (qemu) qom-get /objects/zns-1 zone-capacity
> >   12582912
> >=20
> > Currently, there are no shortcuts, so you have to define the full
> > topology to get it up and running. Notice that the topology is explicit
> > (the 'subsys' and 'attached-ctrls' links). There are no 'nvme-bus'
> > anymore.
> >=20
> >   -object x-nvme-subsystem,id=3Dsubsys0,subnqn=3Dfoo
> >   -device x-nvme-ctrl,id=3Dnvme-ctrl-0,serial=3Dfoo,subsys=3Dsubsys0
> >   -device x-nvme-ctrl,id=3Dnvme-ctrl-1,serial=3Dbar,subsys=3Dsubsys0
> >   -drive  id=3Dnvm-1,file=3Dnvm-1.img,format=3Draw,if=3Dnone,discard=3D=
unmap
> >   -object x-nvme-ns-nvm,id=3Dnvm-1,blockdev=3Dnvm-1,nsid=3D1,subsys=3Ds=
ubsys0,attached-ctrls=3Dnvme-ctrl-1
> >   -drive  id=3Dnvm-2,file=3Dnvm-2.img,format=3Draw,if=3Dnone,discard=3D=
unmap
> >   -object x-nvme-ns-nvm,id=3Dnvm-2,blockdev=3Dnvm-2,nsid=3D2,subsys=3Ds=
ubsys0,attached-ctrls=3Dnvme-ctrl-0
>=20
> I may be wrong here, but my first gut feeling when seeing this was that
> referencing the controller device in the namespace object feels
> backwards. Usually, we have objects that are created independently and
> then the devices reference them.
>=20
> Your need to use a machine_done notifier is probably related to that,
> too, because it goes against the normal initialisation order, so you
> have to wait. Error handling also isn't really possible in the notifier
> any more, so this series seems to just print something to stderr, but
> ignore the error otherwise.
>=20
> Did you consider passing a list of namespaces to the controller device
> instead?
>=20
> I guess a problem that you have with both ways is that support for
> list options isn't great in QemuOpts, which is still used both for
> -object and -device in the system emulator...
>=20

Heh. Exactly. The ability to better support lists with -object through
QAPI is why I did it like this...

Having the list of namespaces on the controller is preferable. I'll see
what I can come up with.

Thanks!

--Ogu5yQgKENf7ltnF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFDcTwACgkQTeGvMW1P
DemBYQgAn2iKNeygICiElXz5D+ZicQcAXxa8UF3GqGm9Dd/1I8Le7FHHikpftUfi
NWLdsYF1C3+fsmnFCYaAUMRqY2c7Gs7FNYEz2YbHw/YGDICM9/QyWTHk197pMoiG
eoQ0udH3whNS+VIGNnSQdUgxTTng7HzQ7llTvvGk7heyBKviLwsTYdXgLawkXJtD
+p0KIgkUr5L4VjqQ+bAcM2QAFfbIIsjLg/U0DOqTMHs+0kTa2lUdQoiwE3IT+/h1
plO7d4nyio+VmEqWy+153w/j+7aTu55JIXcAHVbVfj9cCnjyv3ECZCuvluesZw5n
RKh4V6tgxHQHHD4KeER/NGsE8qJTww==
=ogEV
-----END PGP SIGNATURE-----

--Ogu5yQgKENf7ltnF--

