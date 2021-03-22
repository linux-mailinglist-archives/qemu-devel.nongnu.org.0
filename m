Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ECC345008
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:38:58 +0100 (CET)
Received: from localhost ([::1]:50946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQO9-0006XL-SJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOQDR-0007Kf-TN; Mon, 22 Mar 2021 15:27:53 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:47495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOQDO-0008CI-UG; Mon, 22 Mar 2021 15:27:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 9D22417A1;
 Mon, 22 Mar 2021 15:27:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 22 Mar 2021 15:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=YeXiC4xtl3aNh3ya5O8gCwuk57q
 tYR3PLRKUIYfy4jY=; b=Qd7uyeS1+PyQUypUdKF59zEEwqZlkHqmNYZPsgl7C+6
 r5V6mAr7sgnUGcUr4IJzilC9SXNVGBVlZIykOFFKdGyOWe2gKTS07FTOMtjVNBy1
 Ed+3KIzsK3RADXZirXIVsqJLGLBSdMiN5JRQb7PqUVwYCqTpNmD+VQvxe7GeuImN
 A7gq5jCnKsoiwX+YBYh4E/MRxKwosvvrdykkIK6tdK3BcuaZ0KItB0GB7qKX1gda
 0jpkme9JSaz6PlJNOrfTwA1RyPc9Q6xMb2Cb7cy4OXI6LgirEnTILFMXDkZsJrko
 BShLaaB0tBGvU16mCj3bR92uvfTSdfy7SRRB+ZnrugQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YeXiC4
 xtl3aNh3ya5O8gCwuk57qtYR3PLRKUIYfy4jY=; b=Gi5puIBCIWpt5FZShdVymn
 Fm47zcDb91Hj8HoEen7SdDfjS6FQOQd4waV/Qh2x1C6Tf/h8fEzpb4RyyRa2Xgrp
 SXM3s+3DFWrdAKuPUEV48yrKA6E10tAcocxBY47PGmUdpCp/KKjc74uVT3dCdw3v
 pnB6BjYM+qOQVCzfRz0ZzhIg0by7vXMOviub7ZpaXMNZzusHEQfpTxWfq+nlgKXM
 sVF8VoRIb7USXtAZVWkqQ85xtZ5fNzRu+0wBryCtWpIPduF5Up2deRJevB4izo38
 Jto3R5d8KLHpABicpQm0lNPT4KOvbtxw4t53n1uOuqg7O8J7PmG73svxerHpT2fw
 ==
X-ME-Sender: <xms:se9YYLWYsahuOunBF0Uu7nmb8MMQZlvvLn6QNllHx-98Rskr1HuJbQ>
 <xme:se9YYDm_omdCzG1EreZ93H3oZo9E4-qjHG3u1nH1I_cfyObKBQlgQFp0q539A_1Us
 S_bNPD5pwUiDXeeI-U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:se9YYHb5BAZL2eyywuolskiL_t2IYr8w-uzuxbldp6QzQQ4FbJhtLw>
 <xmx:se9YYGWn6ZksBBd2sJKQsw-sxnvxsPZc6bZ9U8YKxbAuSsNC3kqg7g>
 <xmx:se9YYFnIQJioiXJ1wsywulrMiGPeU673baN_ZMKGk0LSnKadORbZVA>
 <xmx:s-9YYH4rXRKuqz1ueP-xKCDQRQ-IdSwnSSGZFm5MhAejY-kJg65sYW0eJRc>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 871E7108005F;
 Mon, 22 Mar 2021 15:27:44 -0400 (EDT)
Date: Mon, 22 Mar 2021 20:27:42 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PULL 00/11] emulated nvme updates and fixes
Message-ID: <YFjvrqLZTPW+EVZP@apples.localdomain>
References: <20210316214753.399389-1-its@irrelevant.dk>
 <CAFEAcA8_rcfiYz4NSqY1QKA-FMPK7Hk3xcVvFbXGZnXw_HKuYA@mail.gmail.com>
 <YFM5MjqxwMiddbaB@apples.localdomain>
 <CAFEAcA9YZPbUVCgwaxsMjmkCbYN1uTv=N4P9VjUiktBD_0JRPQ@mail.gmail.com>
 <YFNBNjvRQgLh9Vh3@apples.localdomain> <YFNDfeymKdQN/XT2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JmEMa7jhBxG+t5VY"
Content-Disposition: inline
In-Reply-To: <YFNDfeymKdQN/XT2@redhat.com>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JmEMa7jhBxG+t5VY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 18 12:11, Daniel P. Berrang=C3=A9 wrote:
> On Thu, Mar 18, 2021 at 01:01:58PM +0100, Klaus Jensen wrote:
> > On Mar 18 11:28, Peter Maydell wrote:
> > > On Thu, 18 Mar 2021 at 11:27, Klaus Jensen <its@irrelevant.dk> wrote:
> > > >
> > > > On Mar 18 11:26, Peter Maydell wrote:
> > > > > On Tue, 16 Mar 2021 at 21:47, Klaus Jensen <its@irrelevant.dk> wr=
ote:
> > > > > Hi. This tag includes a submodule update which is not mentioned
> > > > > in the cover letter or listed in the cover letter diffstat:
> > > > >
> > > > >  roms/opensbi           |    2 +-
> > > > >
> > > > > so I suspect it was inadvertent. Please fix up and resend.
> > > > >
> > > >
> > > > Oh crap. Sorry!
> > >=20
> > > No worries -- git makes this a very easy mistake to make when
> > > doing rebases. That's why I have a check for it in my 'apply
> > > a pull request' scripts :-)
> > >=20
> >=20
> > Out of curiosity, are there any obvious safe guards I can implement
> > myself to stop this from happening?
>=20
> AFAICT, latest versions of git no longer add a submodule when doing
> "git add -u". You have to explicitly specify the submodule path
> to stage it. So this prevent exactly this kind of accident.
>=20

Never said thanks for that tip, so Thanks! :)

git commit -a is a pretty bad habbit and it's too bad it can't easily be
disallowed in the config file ;)

--JmEMa7jhBxG+t5VY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBY76sACgkQTeGvMW1P
DenLEAgAomll8v4my60JIMOGVGbadlDRxeGNY+S+OUCgVDXjFZHyL1HTCxIw5kgC
TppuRBNqUBfylauyRz6i75Nf/5I6UqLA9+so5/Xbx1+TaMh8n2oggcJy3f3TXumE
hnr310WW3HJund4kWfPUqqYyUPVqyGAZSNBJopmg+PkExWX1AlWOnUOWldAYOYAn
Un0hfDu26DBC+C4cTV+F0nGsOAFPwCjkzhEwX4C7KM0r6iaJCuGf6Lw0BHHQEpQI
8/y4Htv71meKbr9zztid/NamUQf7sSPEZWHuqTm6BcR7Dz1bX09sIOYYOl79Gl8Z
MP9EOxc9gqbG+OQnzpguKaM0KaqFIA==
=9XJg
-----END PGP SIGNATURE-----

--JmEMa7jhBxG+t5VY--

