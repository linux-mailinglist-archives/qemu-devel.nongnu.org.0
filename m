Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3732DCC54
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 07:05:01 +0100 (CET)
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpmPM-0001bk-8H
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 01:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpmLF-0000Mv-Mx; Thu, 17 Dec 2020 01:00:45 -0500
Received: from ozlabs.org ([203.11.71.1]:50445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpmL5-0001HG-8a; Thu, 17 Dec 2020 01:00:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CxLvJ0mf8z9sRR; Thu, 17 Dec 2020 17:00:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1608184828;
 bh=f053HisAC8PbxoKtjnMPlGENN+/doGlZH5baP74TMbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=goDpN05Yaa6hPcLfAQxWGknmnLRAIx9dvSty7LP942NkqwJDSbl1l1gCeaik6AVnU
 q7+W9AdIz4JdBanf8T8hEa2JNDmr00ZTTBhoY5HQNPLP15BXKfI+BkEVZ+8rhRZpiR
 xMokVghWz98FATiuUksdhbwutN4OZpJTukHfrSLI=
Date: Thu, 17 Dec 2020 16:53:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [for-6.0 v5 12/13] securable guest memory: Alter virtio default
 properties for protected guests
Message-ID: <20201217055338.GI310465@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-13-david@gibson.dropbear.id.au>
 <d739cae2-9197-76a5-1c19-057bfe832187@de.ibm.com>
 <20201204091706.4432dc1e.cohuck@redhat.com>
 <038214d1-580d-6692-cd1e-701cd41b5cf8@de.ibm.com>
 <20201204154310.158b410e.pasic@linux.ibm.com>
 <20201208015403.GB2555@yekko.fritz.box>
 <20201208112829.0f8fcdf4.pasic@linux.ibm.com>
 <20201208135005.100d56fb.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cVp8NMj01v+Em8Se"
Content-Disposition: inline
In-Reply-To: <20201208135005.100d56fb.cohuck@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, pbonzini@redhat.com, thuth@redhat.com,
 berrange@redhat.com, david@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cVp8NMj01v+Em8Se
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2020 at 01:50:05PM +0100, Cornelia Huck wrote:
> On Tue, 8 Dec 2020 11:28:29 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
>=20
> > On Tue, 8 Dec 2020 12:54:03 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >=20
> > > > > >>> +         * Virtio devices can't count on directly accessing =
guest
> > > > > >>> +         * memory, so they need iommu_platform=3Don to use n=
ormal DMA
> > > > > >>> +         * mechanisms.  That requires also disabling legacy =
virtio
> > > > > >>> +         * support for those virtio pci devices which allow =
it.
> > > > > >>> +         */
> > > > > >>> +        object_register_sugar_prop(TYPE_VIRTIO_PCI, "disable=
-legacy",
> > > > > >>> +                                   "on", true);
> > > > > >>> +        object_register_sugar_prop(TYPE_VIRTIO_DEVICE, "iomm=
u_platform",
> > > > > >>> +                                   "on", false);     =20
> > > > > >>
> > > > > >> I have not followed all the history (sorry). Should we also se=
t iommu_platform
> > > > > >> for virtio-ccw? Halil?
> > > > > >>   =20
> > > > > >=20
> > > > > > That line should add iommu_platform for all virtio devices, sho=
uldn't
> > > > > > it?   =20
> > > > >=20
> > > > > Yes, sorry. Was misreading that with the line above.=20
> > > > >    =20
> > > >=20
> > > > I believe this is the best we can get. In a sense it is still a
> > > > pessimization,   =20
> > >=20
> > > I'm not really clear on what you're getting at here. =20
> >=20
> > By pessimiziation, I mean that we are going to indicate
> > _F_PLATFORM_ACCESS even if it isn't necessary, because the guest never
> > opted in for confidential/memory protection/memory encryption. We have
> > discussed this before, and I don't see a better solution that works for
> > everybody.
>=20
> If you consider specifying the secure guest option as a way to tell
> QEMU to make everything ready for running a secure guest, I'd certainly
> consider it necessary. If you do not want to force it, you should not
> do the secure guest preparation setup.

Right, that's my feeling as well.

I'm also of the opinion that !F_PLATFORM_ACCESS is kind of a nasty
hack that has some other problems (e.g. it means an L1 can't safely
pass the device into an L2).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cVp8NMj01v+Em8Se
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/a8mIACgkQbDjKyiDZ
s5JiQxAArukILcLSGnwHWTNQEamXCCRO2x3cVi/gp2M/5nIJG1s1uvIsiG0LzGNE
awUDnvRiK72sQSaclAeXA7mf/B7GLmbdgY2zh9TaheNhOEjtSJ2gPs54s/5iaPgh
BqiwZt+O54Zec5WmloAUWB+N8mk+6TJGYWWSyenP9VUEN0pbRZs9KNs2wyPGhAQc
NPZAkZWZ4tS6U2JLxj4AN6Z6J4J2D8cPFJA+3+yPM8ECL2O5oJweI/XsKEwnDgQW
UTg970vC4eE50fhyLvZO4YW7xKx1saoHXRJ3257mo7yIPpBPGLva4b6dVpnKH4SD
Tb5KRV8DmuKh9lLMSJCcnfyBfj/hjh2EExJUIokj25Le81s0mnahbL4X1PnWyovn
MM2o+DNPEsoizEiVF129iOwSr2vOcZKT4jvvVw5pAazhmjXO8ozi6sSI96PVkqvb
NwRrMBaOp/ZfijiD5ZkJ3PUkQ0o6UfehAmvsAXfFGlh4tu495S1ZzviWy4+cTuGx
UG0pXX/8Tp0a7YSMRKWI2PD1R4L4GTqcjJnW0sbSs+TaSaysC2tKn35OJC51gRtb
2gFNvvM+a+j+CymRYu1uwE/jX6rlnARt4QQBub5AqY1M0ejulI9+FJqz7a36DbJy
0mrWyQrzeIiDd/UVG0KED6P80aBcIwqQolUCrHrUxd+9rRrbhbk=
=PR0/
-----END PGP SIGNATURE-----

--cVp8NMj01v+Em8Se--

