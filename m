Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EB55A2C13
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:13:46 +0200 (CEST)
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbxo-000350-P2
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRbjJ-00055S-7u; Fri, 26 Aug 2022 11:58:46 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:58995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRbjG-0004Oo-Ta; Fri, 26 Aug 2022 11:58:44 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8AD4C320085B;
 Fri, 26 Aug 2022 11:58:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 26 Aug 2022 11:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661529519; x=1661615919; bh=yI
 AS2GZFVNQPg12i+jUwrrQLBaLsYs7veA67I7Baa6o=; b=lixv20BEFIevNFYf0W
 Ei3EhCDLpDjxqZRvDLCt3+JWVb6mB7q0xThH/FTzXQ9vSjfVy5zjscL0EtD2DciC
 7Fv1UzDDP12DObmn4B6WQK2znMJNc42xawxf4AZpIBVN73dWE200LJJSijcYC634
 KcNy5m7Hv/4yGf+0GyPx1RZSHTPCnbchgXjJsL0xiiHhsrLzmdyIPUltg73TNm8n
 Dqw+3s2f4ziqGNVYT6NTWLs7s0/GobP82MTshx5sOo2ZNQOh2HLDSV5uASsW7Q/d
 f//GfXYsQwIVB23v2mZMSsv4bew+pDZYlyGaHCDdPI/IBPjmz36mv5OmWIyYcqef
 UBlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661529519; x=1661615919; bh=yIAS2GZFVNQPg12i+jUwrrQLBaLs
 Ys7veA67I7Baa6o=; b=Goq8TTNOPQGZhkcckaKc7IgBeS/FDOJmvOhTRO1qZO7p
 tYw2kll9pMihaI8jeS8A2AkLfZ930Lmi5Kc+qalPcszAY9goVZpes3nAYcLlbTlW
 LSL24YhtiRAr/YUFfAGvCHQATAX78Os4uwvNoOopvbnv+hyq4n7pQpV2dum2VfwV
 PiqvEhDFd2VeCsKYwskYdj7KXxrctcTK7zaGGdA6jriFzfeUsDZqc/wTKc1aD3kV
 rlx+qfs9GQFD1FuU+09HpGZYqiIYuh2OFXXr+rB07CM3V53svY4kmWVemjYyLmOP
 QHIjOfTO4xdgPa/nuX3mG8x7YAB2jC8VaSQjBXNHTg==
X-ME-Sender: <xms:ru0IY8jrU8jI1NPbb447KWofYxzNSBwhdekW9NPr4fxPkSS6Bfdq2w>
 <xme:ru0IY1Aw58US0xJ15EcMojXKeBNdo3zZMSuu5ptpc-QpBsoiZUymFunvhOB5NUar3
 fB9gS8_z48Jfiyq_Cg>
X-ME-Received: <xmr:ru0IY0HK99lBbtQnToTHAfyQsVvyD6PWkOfmuXRegWlDjzMJSYZfehUvpGISX4u0TvS_cC15wa1QYcqFZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ru0IY9TvBoWx2EhfXEVfuY2zz0mxt4kDuQpqN5f-bMoozjLHSVERZg>
 <xmx:ru0IY5xZIAuVJbYC_n4Cp3WnTMulHSkzMar-n4F4EFsZCF90Xv32Mg>
 <xmx:ru0IY77r_jHfvxlgJ6_-9bP8skcLuwE6ilSIxgF3v8318EcvTzDb3Q>
 <xmx:r-0IY8qYJ-naHjLuGb0MuEyC_dBxvB_FFcjykK2AkRl6NVIekQXA5Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 11:58:36 -0400 (EDT)
Date: Fri, 26 Aug 2022 17:58:29 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 stefanha@gmail.com, Klaus Jensen <k.jensen@samsung.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 2/3] hw/nvme: use KVM irqfd when available
Message-ID: <YwjtpXaf0vfZVfSi@apples>
References: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
 <20220826151206.3148942-3-fanjinhao21s@ict.ac.cn>
 <Ywjn7QOb9EyK1oJc@kbusch-mbp.dhcp.thefacebook.com>
 <YwjqkTgIEcCZJ3Be@apples>
 <YwjsuPTNd/1pOdjF@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="73yvot6fG/q1+OzF"
Content-Disposition: inline
In-Reply-To: <YwjsuPTNd/1pOdjF@kbusch-mbp.dhcp.thefacebook.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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


--73yvot6fG/q1+OzF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 26 09:54, Keith Busch wrote:
> On Fri, Aug 26, 2022 at 05:45:21PM +0200, Klaus Jensen wrote:
> > On Aug 26 09:34, Keith Busch wrote:
> > > On Fri, Aug 26, 2022 at 11:12:04PM +0800, Jinhao Fan wrote:
> > > > Use KVM's irqfd to send interrupts when possible. This approach is
> > > > thread safe. Moreover, it does not have the inter-thread communicat=
ion
> > > > overhead of plain event notifiers since handler callback are called
> > > > in the same system call as irqfd write.
> > > >=20
> > > > Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> > > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > >=20
> > > No idea what's going on here... This one is causing the following ass=
ert
> > > failure with --enable-kvm:
> > >=20
> > >   qemu-system-x86_64: ../accel/kvm/kvm-all.c:1781: kvm_irqchip_commit=
_routes: Assertion `ret =3D=3D 0' failed.
> > >=20
> > > I find it calls KVM_SET_GSI_ROUTING ioctl with gsi set to KVM_IRQ_ROU=
TING_MSI,
> > > and linux kernel returns EINVAL in that case. It's never set that way=
 without
> > > this patch. Am I the only one seeing this?
> >=20
> > Argh, sorry, I threw that patch together a bit too quickly. I was just
> > so pumped because I believed I had solved the issue hehe.
> >=20
> > Are you missing the ioeventfd=3Don and irq-eventfd=3Don parameters by a=
ny
> > chance? Without those I'm also getting an assertion, but a different one
>=20
> I had not enabled those yet. This was purely a regrsession test with my
> previously working paramaters for a sanity check.
>=20

Yeah, sorry, I just threw it out there with tunnel vision on the kvm
irq part, not doing my due diligence ;)

I'll fix it up!

> If I enable those new nvme parameters, then it is successful.

Great :)

--73yvot6fG/q1+OzF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMI7aMACgkQTeGvMW1P
Dek9CQgAtp2wbHuoneRO1fJNxv2DBoDrCv30bre49AfDUPRBJ+LoNo16aD0Vl+QZ
VUL5YUbjs6FIpLjK2pYxxwGx3kxv2P0OMFbyd6Q/YnovyDe/1TGnPzirMwI/CgMt
02q3UA6K7piaqxvfHNP28HNx/petycgeN/38dLlpcIbTCIw0i0OKqHMj7t2hADRz
kLdjtVHrbxAIPa593BOlBcMnFRVEPXuUis15UdNDxxt+MkSGV7cCO30wjR+BhUTu
LweUw976csEA3BUvxUq5cLmNW5ykluy+CyVcwsGfWvNe6A/XvB87PwOef2c2JcLT
gwIPIIMS0nPaZnpU7UUVT9yokZEFCw==
=0zdY
-----END PGP SIGNATURE-----

--73yvot6fG/q1+OzF--

