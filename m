Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6927A7C0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 08:41:52 +0200 (CEST)
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMmr9-0001E4-7X
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 02:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kMmmS-00009L-D7; Mon, 28 Sep 2020 02:37:00 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:55303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kMmmP-0000V2-Ji; Mon, 28 Sep 2020 02:37:00 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1E9935802E1;
 Mon, 28 Sep 2020 02:36:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 28 Sep 2020 02:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xCbi4BcIgYwAvx036YHd9kWuUQ4
 3zgSxD12XE9cnioA=; b=V4Vm1OENoRxEnCyL2MfbE7B+5IGa9oj8NutWGMTCJRB
 3LQeyO32FMic4HUqUzEM9KDa6XgNTlZeupnEt5DJYDXcd4I6QVJxbW4fzZEgHDMa
 FRxcPKpIljgLz/1LyrA4RMg57jo9eHpfxQRuuITayKqgdyTvKUz/ASNUmEO4nqN/
 ZWn0hQqF1+TdPdlMyT+6RmjaBzVxUA/AzC2sEz3RONEGau/m/cc/tUaIKIjTzrof
 tIYGGeJB/zSAz+9w8/rnPL2hfQXhuxmRr5rxIowjRrP5XarkmaymGJvMZ7Uiwlpj
 fFTCtcyQ9JY6kZY0B3rZNXHB1YdoSaDTcAsMQ+OFpMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xCbi4B
 cIgYwAvx036YHd9kWuUQ43zgSxD12XE9cnioA=; b=Z2qvu+G1svg6aTkZjjndyB
 qa8jQ2G/fV8b3bq0qcekorQnHGHTz3tJrMyQ9fNOxuQrUQVYRMfFOEoqfKwUOnlm
 4geBHXNnpcdijpSVLPCHJ8eziQq+gEGXHbWiNPQcXi6XVWrDe6He4qbZsCIuNxGJ
 1pfBUqtglhFgyDfhkcgP+Qpbg72dNm0uTiCnaBAyBr4Sz9jZgaW2cqkSWKEHarIv
 sYI65ZKsqM/R0astEBCZ6RL7RsFJbRlv3w/OrDmvjBTc4juojQF5gXJ1eoJ+Uruw
 d3+U7/n9DhjClaoL+uzK4S8pP1p48qUQdD0eyqn7oz0oRZ8jL3KsMihsqDZMduOQ
 ==
X-ME-Sender: <xms:hIRxXzwq99bXC-CiXXFV5gS7h8WqF7KKthNPla1fdWyGPnhai2YZew>
 <xme:hIRxX7T_dNZP9dFQMQAh09EAdPnj_CJRNWP3HpjUdPu-MX3I_WnAuTJJG2pE6g1Hk
 P763BFxDqrofi1iHmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehgdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedtleekfedtueejueehledtudeugfdutdeigeegieehhfdvtedtgeetfefggfdu
 keenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeektddrudeijedrleekrd
 duledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:hIRxX9Xv3DacNIpr0mfIk8UFASnodtwn5aU1NHnOn656ht1pDDmZyg>
 <xmx:hIRxX9jnyu7UVGOxIgTvETMAM4WOJ2FED13C2lWbhjhuLMc3Z6Qo2w>
 <xmx:hIRxX1CLFEAaBWZProgpemYrGEXqhDZKm1ogNEMtrgzH6e7RTmU5wQ>
 <xmx:hoRxX6L8G1-40DdgbAM7cBLI6wVkHgSVbe_yHaw52ut5XhNvP5dtCHKv-c0>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC6A9306467E;
 Mon, 28 Sep 2020 02:36:50 -0400 (EDT)
Date: Mon, 28 Sep 2020 08:36:48 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [PATCH v4 00/14] hw/block/nvme: Support Namespace Types and
 Zoned Namespace Command Set
Message-ID: <20200928063648.GA1967@apples.localdomain>
References: <20200923182021.3724-1-dmitry.fomichev@wdc.com>
 <20200924210751.GD1738917@apples.localdomain>
 <MN2PR04MB59515B1EA1238861DFF3236AE1350@MN2PR04MB5951.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <MN2PR04MB59515B1EA1238861DFF3236AE1350@MN2PR04MB5951.namprd04.prod.outlook.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 02:36:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Niklas Cassel <Niklas.Cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Matias Bjorling <Matias.Bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 28 02:33, Dmitry Fomichev wrote:
> > -----Original Message-----
> > From: Klaus Jensen <its@irrelevant.dk>
> >
> > If it really needs to be memory mapped, then I think a hostmem-based
> > approach similar to what Andrzej did for PMR is needed (I think that
> > will get rid of the CONFIG_POSIX ifdef at least, but still leave it
> > slightly tricky to get it to work on all platforms AFAIK).
>=20
> Ok, it looks that using the HostMemoryBackendFile backend will be
> more appropriate. This will remove the need for conditional compile.
>=20
> The mmap() portability is pretty decent across software platforms.
> Any poor Windows user who is forced to emulate ZNS on mingw will be
> able to do so, just without having zone state persistency. Considering
> how specialized this stuff is in first place, I estimate the number of us=
ers
> affected by this "limitation" to be exactly zero.
>=20

QEMU is a cross platform project - we should strive for portability.

Alienating developers that use a Windows platform and calling them out
as "poor" is not exactly good for the zoned ecosystem.

> > But really,
> > since we do not require memory semantics for this, then I think the
> > abstraction is fundamentally wrong.
> >=20
>=20
> Seriously, what is wrong with using mmap :) ? It is used successfully for
> similar applications, for example -
> https://github.com/open-iscsi/tcmu-runner/blob/master/file_zbc.c
>=20

There is nothing fundamentally wrong with mmap. I just think it is the
wrong abstraction here (and it limits portability for no good reason).
For PMR there is a good reason - it requires memory semantics.

> > I am, of course, blowing my own horn, since my implementation uses a
> > portable blockdev for this.
> >=20
>=20
> You are making it sound like the entire WDC series relies on this approac=
h.
> Actually, the persistency is introduced in the second to last patch in the
> series and it only adds a couple of lines of code in the i/o path to mark
> zones dirty. This is possible because of using mmap() and I find the way
> it is done to be quite elegant, not ugly :)
>=20

No, I understand that your implementation works fine without
persistance, but persistance is key. That is why my series adds it in
the first patch. Without persistence it is just a toy. And the QEMU
device is not just an "NVMe-version" of null_blk.

And I don't think I ever called the use of mmap ugly. I called out the
physical memory API shenanigans as a hack.

> > Another issue is the complete lack of endian conversions. Does it
> > matter? It depends. Will anyone ever use this on a big endian host and
> > move the meta data backing file to a little endian host? Probably not.
> > So does it really matter? Probably not, but it is cutting corners.
> >=20

After I had replied this, I considered a follow-up, because there are
probably QEMU developers that would call me out on this.

This definitely DOES matter to QEMU.

>=20
> Great point on endianness! Naturally, all file backed values are stored in
> their native endianness. This way, there is no extra overhead on big endi=
an
> hardware architectures. Portability concerns can be easily addressed by
> storing metadata endianness as a byte flag in its header. Then, during
> initialization, the metadata validation code can detect the possible
> discrepancy in endianness and automatically convert the metadata to the
> endianness of the host. This part is out of scope of this series, but I w=
ould
> be able to contribute such a solution as an enhancement in the future.
>=20

It is not out of scope. I don't see why we should merge something that
is arguably buggy.

Bottomline is that I just don't see why we should accept an
implementation that

  a) excludes some platforms (Windows) from using persistence; and
  b) contains endianness conversion issues

when there is a portable implementation posted that at least tries to
convert endianness as needed.

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl9xhHwACgkQTeGvMW1P
Demzmgf+JHlOdeiSscyGJHa/M4e4Cx/JbxfvAoqcpcYJVNOW+BWz4oh+LHpdro/U
TJ/EQ7Ki9KZYW6TKdx1H5Tz6XHsPV/whyB3zAtQ4b7oRvy+Tb7Eged+3v+oISyIu
V91JPr8jXubD3X59O2p97Lh2Y8+8WaoUkv/uivRuJ5Inbtgg5j7ew7Px9i4LZHJT
sMAIYyqeEsV11oOs811zbjSscUU9bMKdyzNyGMkIb+59oOVc+OE/j+aHdzO/IAYD
zkCScO9judfXN6mQhk5LJWUC/rrEaLCEkisgzeTb2sm0Uv19t3MoNcpl4mhBXmE/
6PhoEzj1kWiNPOKLGHxv0tfpzMAuTg==
=mxmm
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--

