Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EEB2F8323
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:58:04 +0100 (CET)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TMJ-0008Aa-Ll
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0TC5-00084x-W0; Fri, 15 Jan 2021 12:47:32 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0TC1-0002yu-Vv; Fri, 15 Jan 2021 12:47:29 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 37B385C01B3;
 Fri, 15 Jan 2021 12:47:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 15 Jan 2021 12:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=jYjZ9Flkuyezty6BtL3qmVim4R/
 Vsd5htSiI+x+VDQs=; b=HdnWVnnTHRNaQaCgfaYNexbD2JmCR2VIfOvSkekbdr5
 4Kze4dm4elqY4W7sqi2KH25c4BwXCnHDL/4HuKXl2aV8nxw/Yzf5qO4bnobPx5UR
 7/tKhnVFzXh/90LCOYGEbgl3oofGHLuXjIBSqj25QPaiLq4+JuLcVGamy5MV/whO
 cHEtoRq1dhdabBOe3Ji0m8ZCU/tDJcVYLk2idna4ERGKMkbBSEvYpnJ1Bzc+VWwU
 veRgEno4ztMzzHMJ+1Ee0ioUnolJE/JyhsvSXVB/XwFv37D07MGfttOZYB4lbC6f
 dpW34oGZ6r98AIIlF64p3v986zaujAY5muxHAkH8xeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jYjZ9F
 lkuyezty6BtL3qmVim4R/Vsd5htSiI+x+VDQs=; b=BJX/Wt/8xxxZqp5M3Hf6XA
 +0qEGEPJhQtxCD0o+e4Fgv7RVUZuLEmb7bjqmU4IWvMxQodENaOfxTL+goy2pKdJ
 O+zaMrYfjPIZ+kNfIsAKp1Sscib9ZwsRRXDxYmjRSmcwS1K7pmnmB64RJtpvDrpL
 s/C5we2E7IsumasjTeP5Ao+W+Jd5zGUjY243pJyS8B+8aCgVafkurSz3VO4mqryG
 t1Lf4yEchB7N+xg3AwVYh2Xu0mgtD0LdTYsUhVYHvevElGb1lZB3o87PmEF7mSFb
 xLD9+AJkRH0MRyQLb8++FB9hXSoMnuh0aNOq3hrHeQyawfvD20hub3DqJsYtpZRg
 ==
X-ME-Sender: <xms:K9UBYCvGaOBj6B2PONVWTSR67HxuyCovsfE-PYd2yaDpr1PMJL4Emw>
 <xme:K9UBYBG134O0vRBxF4gzVFbAVBuHsGhrP9yUDftaQ__RsqNKSygZUoqqj8RZzJDNd
 Tiu9qGbstVvUyuvdrc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:K9UBYNxVa36KTcbtKKH1cMl8JGDbMDnQPrpprOsbg-dLKwurpH6K1w>
 <xmx:K9UBYAg_JWaCrHVzwCTKClCwHcVAGWXBiG5abSceGDs8z7hYgGBlEA>
 <xmx:K9UBYAyKp-jCeyYh6tSvV40_cCMPgogPiau1qDZWBnigJQvqNIPDmA>
 <xmx:LNUBYFoCGOIx5sHrveXO0xKWqhJjVmlR-iPizDS0OKjm6H3Bm6zCag>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 501C91080057;
 Fri, 15 Jan 2021 12:47:22 -0500 (EST)
Date: Fri, 15 Jan 2021 18:47:20 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [RFC PATCH 0/5] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <YAHVKFOYaEO4N6I5@apples.localdomain>
References: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
 <YAGfWe+OMxiBggh3@apples.localdomain>
 <20210115173504.GH1511902@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aLGk8zn8JvYR+Fst"
Content-Disposition: inline
In-Reply-To: <20210115173504.GH1511902@dhcp-10-100-145-180.wdc.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aLGk8zn8JvYR+Fst
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 15 09:35, Keith Busch wrote:
> On Fri, Jan 15, 2021 at 02:57:45PM +0100, Klaus Jensen wrote:
> >=20
> > As you already mentioned, the problem I see with this approach is that
> > we have separate namespaces attached to separate controllers. So we are
> > faking it to the max and if I/O starts going through the other
> > controller we end up on a namespace that is unrelated (different data).
> > Havoc ensues.
> >=20
> > My approach looks a lot like yours, but I hacked around this by adding
> > extra 'ctrl-0', 'ctrl-1', ..., link-parameters to the namespace device,
> > replacing the bus. This works well because the namespace then just
> > registers with multiple controllers. But adding more parameters like
> > that just isnt nice, so I've been trying to figure out how to allow a
> > parameter to be specified multiple times, so we could just do more
> > 'ctrl'-parameters.
> >=20
> > Alas, since I started thinking about namespace sharing I have been
> > regretting that I didn't reverse the bus-mechanic for namespace
> > attachment. It would align better with the theory of operation if it was
> > the controllers that attached to namespaces, and not the other way
> > around. So what I would actually really prefer, is that we had multiple
> > 'ns' link parameters on the controller device.
>=20
> Would this work better if we introduce a new device in the nvme hierarchy:
> the nvme-subsystem? You could attach multi-path namespaces and
> controllers to that, and namespaces you don't want shared can attach
> directly to controllers like they do today. You could also auto-assign
> cntlid, and you wouldn't need to duplicate serial numbers in your
> parameters.

I kinda POC'ed that, but I think I tried to make it work with a bus and
walking it and all kinds of fancy stuff.

I think it can just be a 'link' parameter, so something like:

  -device nvme-subsys,id=3Dsubsys0
  -device nvme,id=3Dnvme0,subsys=3Dsubsys0
  -device nvme,id=3Dnvme1,subsys=3Dsubsys0
  -device nvme-ns,id=3Dshared-ns1,nsid=3D1,subsys=3Dsubsys0
  -device nvme-ns,id=3Dprivate-ns2,nsid=3D2,bus=3Dnvme0

When a controller "registers" with the subsystem it attaches to all
namespaces known, and when a namespace attaches, it attaches to all
controllers known. We can even add a 'detached' bool parameter to the
namespace and keep controllers from attaching, but allowing for later
attachment.

Cool!

Question: NSIDs must be the same on each controller for shared
namespaces, but can private namespaces "share" nsid across controllers
in the subsystem?  I don't think the spec is clear on that point.

--aLGk8zn8JvYR+Fst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAB1SYACgkQTeGvMW1P
DenUpwf9F80Wg81WxugT9ODPqCyYaB2kJm2gQe9GTJDBN2ru1pZVWknl0+TFFPZG
Sj1wFKA8qB5sKt58hOl4Vh/IuTwzRVSZCk/3QdE2Cj1DVJxjdORkwpqj1zPZi8DA
SVBf797uu/RhKIHwEuYts139wCAuD5hX+L+pIFz85uenGn3y2ZjZX2EHF/CD6oqn
ZFUd6nwHnaFYXnXx3zH2277akuoRaNpKk5peBV6UeDYe1AgWMwTI5WNMyTdM8zIx
ceTy0Kk5XpJn2y0OjdRuCskRAHJobZtL+Jhs3KwhGBTNgvURcxO812UXsaJSMSap
jsgJAbVXNenIWnp9D9CePbpjqCiNew==
=j90y
-----END PGP SIGNATURE-----

--aLGk8zn8JvYR+Fst--

