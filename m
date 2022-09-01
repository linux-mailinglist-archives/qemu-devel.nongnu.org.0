Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4E85A8B3A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 04:11:15 +0200 (CEST)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTZfl-00080H-I7
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 22:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oTZcL-00052e-7S; Wed, 31 Aug 2022 22:07:41 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:60837
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oTZcH-0005IN-0F; Wed, 31 Aug 2022 22:07:40 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MJ4Dp6k0wz4x3w; Thu,  1 Sep 2022 12:07:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1661998042;
 bh=8uDD+feLaTRA04btp3PnSgp+c55t24L+5v9qZF7x9yU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=frge8dg4heU1f270dniLyforUJnwd0WC69srvHJNVD7PriDL/pGqRlH21iRtKfuzG
 63ryOMVmILfRf1UelJ1YXcHew4ygoxDQ6h+1El7NmKIxX3Q9stvnS35FB/NJwu2F6O
 hIU7GcS/tyfpYJkQ1cBckr63YYW9iwKglrQ6HjnA=
Date: Thu, 1 Sep 2022 11:57:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 alistair.francis@wdc.com,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
Subject: Re: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Message-ID: <YxARoSLvGnLcGl3M@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-11-danielhb413@gmail.com>
 <99485a63-f799-2741-8006-f4167c985e54@ozlabs.ru>
 <f2c2e6f9-0da4-443d-55cd-c214e710d0f7@gmail.com>
 <YwLyhvijapVkpgjr@yekko>
 <708e6776-5589-15ab-535a-69c5d6d5f0d0@ozlabs.ru>
 <95685b0a-42e1-b791-f3fb-a462e2b3ae6f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/KQKxgycMnT6FydI"
Content-Disposition: inline
In-Reply-To: <95685b0a-42e1-b791-f3fb-a462e2b3ae6f@gmail.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


--/KQKxgycMnT6FydI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 07:30:36AM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/22/22 00:29, Alexey Kardashevskiy wrote:
> >=20
> >=20
> > On 22/08/2022 13:05, David Gibson wrote:
> > > On Fri, Aug 19, 2022 at 06:42:34AM -0300, Daniel Henrique Barboza wro=
te:
> > > >=20
> > > >=20
> > > > On 8/18/22 23:11, Alexey Kardashevskiy wrote:
> > > > >=20
> > > > >=20
> > > > > On 05/08/2022 19:39, Daniel Henrique Barboza wrote:
> > > > > > The pSeries machine never bothered with the common machine->fdt
> > > > > > attribute. We do all the FDT related work using spapr->fdt_blob.
> > > > > >=20
> > > > > > We're going to introduce HMP commands to read and save the FDT,=
 which
> > > > > > will rely on setting machine->fdt properly to work across all m=
achine
> > > > > > archs/types.
> > > > >=20
> > > > >=20
> > > > > Out of curiosity - why new HMP command, is not QOM'ing this ms::f=
dt property enough?
> > > >=20
> > > > I tried to do the minimal changes needed for the commands to work. =
ms::fdt is
> > > > one of the few MachineState fields that hasn't been QOMified by
> > > > machine_class_init() yet. All pre-existing code that uses ms::fdt a=
re using the
> > > > pointer directly. To make a QOMified use of it would require extra =
patches
> > > > in machine.c to QOMify the property first.
> > > >=20
> > > > There's also the issue with how each machine is creating the FDT. M=
ost are using
> > > > helpers from device_tree.c, some are creating it from scratch, othe=
rs required
> > > > a .dtb file, most of them are not doing a fdt_pack() and so on. To =
really QOMify
> > > > the use of ms::fdt we would need some machine hooks that standardiz=
e all that.
> > > > I believe it's worth the trouble, but it would be too much to do
> > > > right now.
> > >=20
> > > Hmm.. I think this depends on what you mean by "QOM"ify exactly.=A0 If
> > > you're meaning make the full DT representation QOM objects, that you
> > > can look into in detail, then, yes, that's pretty complicated.
> > >=20
> > > I suspect what Alexey was suggesting though, was merely to make
> > > ms::fdt accessible as a single bytestring property on the machine QOM
> > > object.=A0 Effectively it's just "dumpdtb" but as a property get.
> >=20
> >=20
> > Yes, I meant the bytestream, as DTC can easily decompile it onto a DTS.
> >=20
> >=20
> > > I'm not 100% certain if QOM can safely represent arbitrary bytestrings
> > > as QOM properties, which would need checking.
> >=20
> > I am not sure either but rather than adding another command to HMP, I'd=
 explore this option first.
>=20
>=20
> I'm not sure what you mean by that. The HMP version of 'dumpdtb' is more =
flexible
> that the current "-machine dumpdtb", an extra machine option that would c=
ause
> the guest to exit after writing the dtb. And 'info fdt' is a new command =
that
> makes it easier to inspect specific nodes/props.
>=20
> I don't see how making ms::fdt being retrievable by object_property_get()=
 internally
> (remember that ms::fdt it's not fully QOMified, so there's no introspecti=
on of its
> value from the QEMU monitor) would make any of these new HMP commands obs=
olete.

I believe what we were thinking is if the dtb (as a single bytestring) can =
be
retrieved with a qom-get on a suitable property on the machine, that
might make things marginally simpler than adding a new command.  I'm
not certain if the JSON format of the QMP responses can safely encode
an arbitrary bytestring, though (as opoosed to a Unicode string).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/KQKxgycMnT6FydI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMQEZkACgkQgypY4gEw
YSINaQ//TnbWJaKbz3wGUAyrP6XUY1iaOigB4UU5WeY1XznQpxeXyT9xtgsIUMRx
itvgpnbtJNOclDQFLMh+8vKGCNEcAurcwHYS3eD9uaT+snpJZ7EQ5OU2sKfr46t8
xqbIdQQx5TlaIDPlL/oLuPIwC8Q1AaYj8G0mDSHvP9fFlr6XHXqyH2aTkP1+oywJ
WW9yXpiYXyrwZwSkDfSOoIQKAn7AA5Kl4hfFJ9o6IsH2nUlDRKvCSbwfSRbpfBU8
FLGuG63UcvC61GfDtpYeLhdtjINyuDvq+oDpqrIjXTQU7OkxasZ55T0uvQb3Kpbt
Kd2h7G0vkxrUHavnR1O6SJm5s5LL0+JG6ybAUJcgB4wZ4V8+lP/K6WN0DY7kuZjP
fv5qfRGzZL4r6OwroAavFz+61OXLNRLfuwsPUeFymhJQHsj08VlLDsmPmCTtRJsw
7eG/f0BQkyZqYoOUcHMbf9cYQ+79qJRjGiZ1Qng2VGIG3jFIfPq2rv508Fx34aQy
5oKcekbPmO/b2wMqCZ2WQmmHjAVmhRFmw5CERBSYhq/lY4t0xPF3y/PRymzFKMgV
/TeF8kb3273cmnfoh9En8qxZoJ44AftcToG+e2stw0mnZFoUpotZFS2PWwKqAMqG
3ZwgkxVjgaOj4ZZsWBzXUyhMZp5pXvSDTtwQYWN61w0rBQ+RKYY=
=O8e1
-----END PGP SIGNATURE-----

--/KQKxgycMnT6FydI--

