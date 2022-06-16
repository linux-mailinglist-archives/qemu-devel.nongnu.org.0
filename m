Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C016754E6DC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 18:19:51 +0200 (CEST)
Received: from localhost ([::1]:47926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1sDm-0003eg-T6
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 12:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o1s35-0002Eu-EI; Thu, 16 Jun 2022 12:08:47 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:60995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o1s32-00082w-Kz; Thu, 16 Jun 2022 12:08:47 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E1AFA320091A;
 Thu, 16 Jun 2022 12:08:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 16 Jun 2022 12:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655395720; x=1655482120; bh=ZW
 t7WiGwnixuS3g5c469ZftTGsAuR5VCFWI4h6J3tv0=; b=dU1oiSHrVnAJpQkDCI
 vAeDWAtekjZ39x5UbFv7KiDVV0yG2KhwW7EmbiLSHiyOAHq3Y3NQV9CgxVh71isg
 9XuMjh2yf2iXg0w5S4FM4eQcdYwef1zCCydolr6Rg1onuuLE31h3gWwT6toNjZrf
 /rxoBS1zuptGL2S5MLD645k8GLwKeIVgLPB5KCBIQzC3fSTo/gLtEn5nxO/Qbd6N
 V61xIagtqWBPFvrUc+a99TV9aDpDqgwRRlV3CntAmlOh1HpMKozaEYqYxuPYXUiU
 YChzJcUOG48wy6k4SxVxWDz2P6ZpvhmB/+eRNVJXqIjiZ0QBhzg47apmQu7t2yZU
 YOdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655395720; x=1655482120; bh=ZWt7WiGwnixuS3g5c469ZftTGsAu
 R5VCFWI4h6J3tv0=; b=a0FZtzJ20FX+MRx4Jq94Sukfkw9mUUFC05wsj28e8iR/
 sOmzZQar+vsWGwF56owjRLBg0kDP7vNIZMCyx7H8MGTD7yFiPxPyWp1tTiwYHNhl
 kp3cmFSUsGqlpdxOUI6rjpNKuKCN/ENuzk7t6LOIpZRt3RlAKpArufOAwfnLM4D4
 UvrdWy34km81etNMFHQnbr0SSaarX5fTwlBRnSNvlUSxKMFJWjDWmXA6eZEeFPHq
 WePecP79wT4zIUbb11byByIAUCY6sxU0KHTKkOR/KwaI4+F2JRuVzN1Us2j8K1dk
 pa412hTihO3fIGHofZD0JYF2lXHPPeGvl7LSbYfOkg==
X-ME-Sender: <xms:h1WrYmn8aQpcfHf8a4NjtRP2rcKg8YD0fXe5N1uZu2frsTPQwd9hoQ>
 <xme:h1WrYt3qqK7xKJio7np17QzrF7qaHgLOl6vqHz-ynHms4jnkQWccOhFHWf3X0PNZB
 x9Jn3ks52YHMdPCW9I>
X-ME-Received: <xmr:h1WrYkrmCkIde3XcaZiteCl5YXLCAo5XVWJ0jU__YYIBvHXjvf1kNEsptCdht-n2TMeKVOrcRU1ViifPi1k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepieeludduudfgtdekleeiffeggeffteehfeduieeuvdeukefgieeileejgeei
 jefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:h1WrYqn1paZGVOcU3mL5N-WMkQA5nGXh9qD6-vw0fccERP6uxUoL2g>
 <xmx:h1WrYk0zb1EApYhH7yzZp7qYulVjOfCwhQ1P1nb-ZvRt1SKLbXfggg>
 <xmx:h1WrYhuiUiaRWANaAqKi5bqp8CUkpr3Dsmb8j9wvrrSZleyWqIsHfg>
 <xmx:iFWrYhwQ5Vu-FOW98FLPF1USq5VP4DziZyPW2zl5eO1Bt4e_XT18Tg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 12:08:38 -0400 (EDT)
Date: Thu, 16 Jun 2022 18:08:36 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 0/4] hw/nvme: add support for TP4084
Message-ID: <YqtVhPyFylccLmed@apples>
References: <20220608012850.668695-1-niklas.cassel@wdc.com>
 <YqsJKZRpNEMUhdjY@apples>
 <Yqs2x7Y/EjKGGCTg@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a+y/af7mAvGM3tFJ"
Content-Disposition: inline
In-Reply-To: <Yqs2x7Y/EjKGGCTg@kbusch-mbp.dhcp.thefacebook.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--a+y/af7mAvGM3tFJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 16 07:57, Keith Busch wrote:
> On Thu, Jun 16, 2022 at 12:42:49PM +0200, Klaus Jensen wrote:
> > On Jun  8 03:28, Niklas Cassel via wrote:
> > > Hello there,
> > >=20
> > > considering that Linux v5.19-rc1 is out which includes support for
> > > NVMe TP4084:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/drivers/nvme/host/core.c?id=3D354201c53e61e493017b15327294b0c8ab522d69
> > >=20
> > > I thought that it might be nice to have QEMU support for the same.
> > >=20
> > > TP4084 adds a new mode, CC.CRIME, that can be used to mark a namespace
> > > as ready independently from the controller.
> > >=20
> > > When CC.CRIME is 0 (default), things behave as before, all namespaces
> > > are ready when CSTS.RDY gets set to 1.
> > >=20
> > > Add a new "ready_delay" namespace device parameter, in order to emula=
te
> > > different ready latencies for namespaces when CC.CRIME is 1.
> > >=20
> > > The patch series also adds a "crwmt" controller parameter, in order to
> > > be able to expose the worst case timeout that the host should wait for
> > > all namespaces to become ready.
> > >=20
> > >=20
> > > Example qemu cmd line for the new options:
> > >=20
> > > # delay in s (20s)
> > > NS1_DELAY_S=3D20
> > > # convert to units of 500ms
> > > NS1_DELAY=3D$((NS1_DELAY_S*2))
> > >=20
> > > # delay in s (60s)
> > > NS2_DELAY_S=3D60
> > > # convert to units of 500ms
> > > NS2_DELAY=3D$((NS2_DELAY_S*2))
> > >=20
> > > # timeout in s (120s)
> > > CRWMT_S=3D120
> > > # convert to units of 500ms
> > > CRWMT=3D$((CRWMT_S*2))
> > >=20
> > >              -device nvme,serial=3Ddeadbeef,crwmt=3D$CRWMT \
> > >              -drive file=3D$NS1_DATA,id=3Dnvm-1,format=3Draw,if=3Dnon=
e \
> > >              -device nvme-ns,drive=3Dnvm-1,ready_delay=3D$NS1_DELAY \
> > >              -drive file=3D$NS2_DATA,id=3Dnvm-2,format=3Draw,if=3Dnon=
e \
> > >              -device nvme-ns,drive=3Dnvm-2,ready_delay=3D$NS2_DELAY \
> > >=20
> > >=20
> > > Niklas Cassel (4):
> > >   hw/nvme: claim NVMe 2.0 compliance
> > >   hw/nvme: store a pointer to the NvmeSubsystem in the NvmeNamespace
> > >   hw/nvme: add support for ratified TP4084
> > >   hw/nvme: add new never_ready parameter to test the DNR bit
> > >=20
> > >  hw/nvme/ctrl.c       | 151 +++++++++++++++++++++++++++++++++++++++++=
--
> > >  hw/nvme/ns.c         |  17 +++++
> > >  hw/nvme/nvme.h       |   9 +++
> > >  hw/nvme/trace-events |   1 +
> > >  include/block/nvme.h |  60 ++++++++++++++++-
> > >  5 files changed, 233 insertions(+), 5 deletions(-)
> > >=20
> > > --=20
> > > 2.36.1
> > >=20
> > >=20
> >=20
> > Hi Niklas,
> >=20
> > I've been going back and forth on my position on this.
> >=20
> > I'm not straight up against it, but this only seems useful as a one-off
> > patch to test the kernel support for this. Considering the limitations
> > you state and the limited use case, I fear this is a little bloaty to
> > carry upstream.
> >=20
> > But I totally acknowledge that this is a horrible complicated behavior
> > to implement on the driver side, so I guess we might all benefit from
> > this.
> >=20
> > Keith, do you have an opinion on this?
>=20
> There are drivers utilizing the capability, so I think supporting it is f=
ine
> despite this environment not having any inherent time-to-ready delays.
>=20
> This will probably be another knob that gets lots of use for initial driv=
er
> validation, then largely forgotten. But maybe it will be useful for drive=
r unit
> and regression testing in the future.

Alright, sounds good. I'll give it a proper review :)

--a+y/af7mAvGM3tFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKrVYMACgkQTeGvMW1P
DekPJwgAqazCZGabR37R+ybccMMOqyDsXRr89n5g413DiTRfTcRG1g1IMjdkG8Ze
/iCgbmGOsULEwN6s9g7dKagmFC5hfDP/RtY4t46GCPGMDusDPDNrA28qMU/5y7Ty
l0eBTNQvJ7x9pLqdxHwuZ3T75yDnnhA2wfm/IXQkyOU/iUoIP9K06WLRZgpdnAs/
nWp/kREglYtn4EzTFi2QeGFlSmHLCBm95z0iLrwKf6mZYEXvsWaNo7wq6zVauxOT
DxFNcD2T46u2Qb1jIOldUFts3iNLqKZ/hHbFSTAE+l1sgR5wyBYM9yMsiU7rWOzR
Q18m1QRI13pIOpwaGlg31UoOQ4ceEQ==
=lDRb
-----END PGP SIGNATURE-----

--a+y/af7mAvGM3tFJ--

