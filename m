Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D432D40F256
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 08:27:44 +0200 (CEST)
Received: from localhost ([::1]:54386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR7Lb-00078H-Ik
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 02:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mR7GD-0006Eo-Al; Fri, 17 Sep 2021 02:22:09 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mR7GB-0004AF-32; Fri, 17 Sep 2021 02:22:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6116C5C016A;
 Fri, 17 Sep 2021 02:22:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 17 Sep 2021 02:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ugKhuXWT7ErLxJn6Brhbz9y7av0
 DgPPdrnxtFQLRJKM=; b=ZgWaCBpcIKeqrYKTU28azqhvnFrFD8cGo+m2MInLdM+
 71pfgds3ZQk3+OmBmxld2Uuz5nKI6TUgi2+1/nxGRZhvfk2f1GU+cZ15wXQ93T7H
 qdir0BFj/NZIrQ1Ga/Fq0CnfYCGrD6AUuAxU8w7yBABTZ3RSrcKePp4kjP0jjEiZ
 4fcQjrFSGNJbOJBszoKlr47mVchVJRL2su1razYxOVU5vRkpdDEroiNhuGU7Uy+h
 vQLEEhSf1ip7iav7d6oG3LTu5zSuRtnN4ktEyY67IBjdhgX1hGeICMY78WFR7RwD
 8fEKg34pfBumr+zbPxJJUpNW2aYVCCv0zDUPwPHUo9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ugKhuX
 WT7ErLxJn6Brhbz9y7av0DgPPdrnxtFQLRJKM=; b=n9GFs59is/KxSq2yt5bkUr
 QWZdoww0COr6s4i2yti/23rKzKouU+4TtHxjIyLIMokKjNUrRyJmLlrOFcq7hPix
 NAwc/tRMEMUcUeEZbLWvUS+nr5y8Hhdw+oN89+mlgDP4sR5T+TsNSo8eQXfzjVA9
 ys8YSf+dUYA/qMNqYjTMoG3h4Bl+yU5Dcg0KTtbPbQmeZzoBAWUr19eVr++6DXFm
 ae8B2FT6HCL9iC8cnSP/tPxWyQ6gPsQEZvEv2MgN1EqpxbC0v930DsRdYVsLmu6B
 yx8GrMK5TjFure0IYcCguxP/r6ugscBuZNTkXYaUZolj/Vbea1efJeCdQOYUTXaA
 ==
X-ME-Sender: <xms:DDREYahBO6PkczvbfujQ9ccRCL-hOZBQWLsJOhPaJPDWoSE8R44w_A>
 <xme:DDREYbAADjx_qjepv1Be1Y-NQCwHtRjjsPNTWciyrmNE5KK91nanv3DhmXA4K_S9V
 ueUQkJsrvxlB__Zhi8>
X-ME-Received: <xmr:DDREYSHDNGBxrrL6HXsAZoQiUya3J-C_44FJtuu8TcrJu8ph1ocW25hGx0SWu3gxe9UxuvWa3r4m5AWF5XsO4JVCmn-pwupuKaCUGey1HCODQdkB6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehhedguddthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:DDREYTQnFiMkAGh_HEQFafhHcBpNmLIhjGXwvEweJi3vmo-Mw5t1Uw>
 <xmx:DDREYXwt20-IWVzcSu1l45Lg1gRHprEhLDXoO8P-0hqpkhaIRpdNDQ>
 <xmx:DDREYR5iZuL0JdtbM8SqyRt-D4_y2U3rZ9QGPa5-OMJLF3jjO9vM3g>
 <xmx:DTREYem1jtkwRdsMdjw2Azavizh5KPDZqZFzM6_y1DrcWvMHHP_AbQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Sep 2021 02:22:03 -0400 (EDT)
Date: Fri, 17 Sep 2021 08:21:59 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH RFC 00/13] hw/nvme: experimental user-creatable objects
Message-ID: <YUQ0B3VQzY++MGsz@apples.localdomain>
References: <20210914203737.182571-1-its@irrelevant.dk>
 <YUM7YEQDQ2L3Qdh9@redhat.com> <YUNxQCbZSF3nMkVT@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JHakeY+Ep3Jolzn+"
Content-Disposition: inline
In-Reply-To: <YUNxQCbZSF3nMkVT@apples.localdomain>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JHakeY+Ep3Jolzn+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 16 18:30, Klaus Jensen wrote:
> On Sep 16 14:41, Kevin Wolf wrote:
> > Am 14.09.2021 um 22:37 hat Klaus Jensen geschrieben:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > >=20
> > > Hi,
> > >=20
> > > This is an attempt at adressing a bunch of issues that have presented
> > > themselves since we added subsystem support. It's been brewing for a
> > > while now.
> > >=20
> > > Fundamentally, I've come to the conclusion that modeling namespaces a=
nd
> > > subsystems as "devices" is wrong. They should have been user-creatable
> > > objects. We've run into multiple issues with wrt. hotplugging due to =
how
> > > namespaces hook up to the controller with a bus. The bus-based design
> > > made a lot of sense when we didn't have subsystem support and it foll=
ows
> > > the design of hw/scsi. But, the problem here is that the bus-based
> > > design dictates a one parent relationship, and with shared namespaces,
> > > that is just not true. If the namespaces are considered to have a sin=
gle
> > > parent, that parent is the subsystem, not any specific controller.
> > >=20
> > > This series adds a set of experimental user-creatable objects:
> > >=20
> > >   -object x-nvme-subsystem
> > >   -object x-nvme-ns-nvm
> > >   -object x-nvme-ns-zoned
> > >=20
> > > It also adds a new controller device (-device x-nvme-ctrl) that suppo=
rts
> > > these new objects (and gets rid of a bunch of deprecated and confusing
> > > parameters). This new approach has a bunch of benefits (other than ju=
st
> > > fixing the hotplugging issues properly) - we also get support for some
> > > nice introspection through some new dynamic properties:
> > >=20
> > >   (qemu) qom-get /machine/peripheral/nvme-ctrl-1 attached-namespaces
> > >   [
> > >       "/objects/nvm-1",
> > >       "/objects/zns-1"
> > >   ]
> > >=20
> > >   (qemu) qom-list /objects/zns-1
> > >   type (string)
> > >   subsys (link<x-nvme-subsystem>)
> > >   nsid (uint32)
> > >   uuid (string)
> > >   attached-ctrls (str)
> > >   eui64 (string)
> > >   blockdev (string)
> > >   pi-first (bool)
> > >   pi-type (NvmeProtInfoType)
> > >   extended-lba (bool)
> > >   metadata-size (uint16)
> > >   lba-size (size)
> > >   zone-descriptor-extension-size (size)
> > >   zone-cross-read (bool)
> > >   zone-max-open (uint32)
> > >   zone-capacity (size)
> > >   zone-size (size)
> > >   zone-max-active (uint32)
> > >=20
> > >   (qemu) qom-get /objects/zns-1 pi-type
> > >   "none"
> > >=20
> > >   (qemu) qom-get /objects/zns-1 eui64
> > >   "52:54:00:17:67:a0:40:15"
> > >=20
> > >   (qemu) qom-get /objects/zns-1 zone-capacity
> > >   12582912
> > >=20
> > > Currently, there are no shortcuts, so you have to define the full
> > > topology to get it up and running. Notice that the topology is explic=
it
> > > (the 'subsys' and 'attached-ctrls' links). There are no 'nvme-bus'
> > > anymore.
> > >=20
> > >   -object x-nvme-subsystem,id=3Dsubsys0,subnqn=3Dfoo
> > >   -device x-nvme-ctrl,id=3Dnvme-ctrl-0,serial=3Dfoo,subsys=3Dsubsys0
> > >   -device x-nvme-ctrl,id=3Dnvme-ctrl-1,serial=3Dbar,subsys=3Dsubsys0
> > >   -drive  id=3Dnvm-1,file=3Dnvm-1.img,format=3Draw,if=3Dnone,discard=
=3Dunmap
> > >   -object x-nvme-ns-nvm,id=3Dnvm-1,blockdev=3Dnvm-1,nsid=3D1,subsys=
=3Dsubsys0,attached-ctrls=3Dnvme-ctrl-1
> > >   -drive  id=3Dnvm-2,file=3Dnvm-2.img,format=3Draw,if=3Dnone,discard=
=3Dunmap
> > >   -object x-nvme-ns-nvm,id=3Dnvm-2,blockdev=3Dnvm-2,nsid=3D2,subsys=
=3Dsubsys0,attached-ctrls=3Dnvme-ctrl-0
> >=20
> > I may be wrong here, but my first gut feeling when seeing this was that
> > referencing the controller device in the namespace object feels
> > backwards. Usually, we have objects that are created independently and
> > then the devices reference them.
> >=20
> > Your need to use a machine_done notifier is probably related to that,
> > too, because it goes against the normal initialisation order, so you
> > have to wait. Error handling also isn't really possible in the notifier
> > any more, so this series seems to just print something to stderr, but
> > ignore the error otherwise.
> >=20
> > Did you consider passing a list of namespaces to the controller device
> > instead?
> >=20
> > I guess a problem that you have with both ways is that support for
> > list options isn't great in QemuOpts, which is still used both for
> > -object and -device in the system emulator...
> >=20
>=20
> Heh. Exactly. The ability to better support lists with -object through
> QAPI is why I did it like this...
>=20
> Having the list of namespaces on the controller is preferable. I'll see
> what I can come up with.
>=20

There is also the issue that the x-nvme-ns-nvm -object needs a blockdev
- and the ordering is also a problem here. That also requires the
machine done notifier.

--JHakeY+Ep3Jolzn+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFENAMACgkQTeGvMW1P
DelCUQgAk8AoNUsgIeTkZ0TETOtqvzov7XR7niT17oFU3LqmMbJ/kLB7xw7bsphk
FPp9z1wslkFwDb4LwJu/k7Cd0l8X31oLFB54bTfWN7nHql27DbLn6aPTTr/70Jvx
P5+QTXOjRwXVgOMEyU2swAxOqbAT65097EARfNxMcxkalfeuqcyw1+Sv1LzCtdkJ
7/xOBu0pfR57nI+B5GNJ664xNPqcWLP5fgOyQ6GYTvirHHdezoy2AbPCFHnr7u6X
MZk2c+ZmdDKwGn3GBV0dk1tWdNUbdO+LqMIX/c2ylyvq0YPO0kBeG09Fq9stv1CD
3CJ3Jd7PqgGENOOuXnSddPc0O5E9YA==
=Th6t
-----END PGP SIGNATURE-----

--JHakeY+Ep3Jolzn+--

