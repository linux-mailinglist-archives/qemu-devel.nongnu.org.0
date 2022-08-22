Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6759B7E4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 05:22:50 +0200 (CEST)
Received: from localhost ([::1]:46672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPy1Y-0007r5-OO
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 23:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oPxy8-0005ck-6R; Sun, 21 Aug 2022 23:19:16 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:35593
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oPxy0-0007nj-HE; Sun, 21 Aug 2022 23:19:15 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M9yHn6861z4x1d; Mon, 22 Aug 2022 13:18:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1661138325;
 bh=YmsOYu6XuL55+Dbi9WlQHUVdK8qzV8hXhzyIsYurjDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h1vxnughTyQoV0jRSbYtusWCoC0EpEUJ/iKrdsq3S6t2UZqCS7J4vE1l+TcEkZz7I
 FeKaX+WdOAw2yJReY15OC8t7zvfZlmTlCTe4J/4OjfzDyIh8Z5A/mF42DZwE8Ek9b+
 +hBs/DlqqPJfQy3vmO23LzznsZDuKA8dY7o5nkMI=
Date: Mon, 22 Aug 2022 13:05:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 alistair.francis@wdc.com,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
Subject: Re: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Message-ID: <YwLyhvijapVkpgjr@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-11-danielhb413@gmail.com>
 <99485a63-f799-2741-8006-f4167c985e54@ozlabs.ru>
 <f2c2e6f9-0da4-443d-55cd-c214e710d0f7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DdD2ADl01ewO9gdw"
Content-Disposition: inline
In-Reply-To: <f2c2e6f9-0da4-443d-55cd-c214e710d0f7@gmail.com>
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


--DdD2ADl01ewO9gdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2022 at 06:42:34AM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/18/22 23:11, Alexey Kardashevskiy wrote:
> >=20
> >=20
> > On 05/08/2022 19:39, Daniel Henrique Barboza wrote:
> > > The pSeries machine never bothered with the common machine->fdt
> > > attribute. We do all the FDT related work using spapr->fdt_blob.
> > >=20
> > > We're going to introduce HMP commands to read and save the FDT, which
> > > will rely on setting machine->fdt properly to work across all machine
> > > archs/types.
> >=20
> >=20
> > Out of curiosity - why new HMP command, is not QOM'ing this ms::fdt pro=
perty enough?
>=20
> I tried to do the minimal changes needed for the commands to work. ms::fd=
t is
> one of the few MachineState fields that hasn't been QOMified by
> machine_class_init() yet. All pre-existing code that uses ms::fdt are usi=
ng the
> pointer directly. To make a QOMified use of it would require extra patches
> in machine.c to QOMify the property first.
>=20
> There's also the issue with how each machine is creating the FDT. Most ar=
e using
> helpers from device_tree.c, some are creating it from scratch, others req=
uired
> a .dtb file, most of them are not doing a fdt_pack() and so on. To really=
 QOMify
> the use of ms::fdt we would need some machine hooks that standardize all =
that.
> I believe it's worth the trouble, but it would be too much to do
> right now.

Hmm.. I think this depends on what you mean by "QOM"ify exactly.  If
you're meaning make the full DT representation QOM objects, that you
can look into in detail, then, yes, that's pretty complicated.

I suspect what Alexey was suggesting though, was merely to make
ms::fdt accessible as a single bytestring property on the machine QOM
object.  Effectively it's just "dumpdtb" but as a property get.

I'm not 100% certain if QOM can safely represent arbitrary bytestrings
as QOM properties, which would need checking.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DdD2ADl01ewO9gdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMC8nIACgkQgypY4gEw
YSJ8LhAAyj9yIo13JvfOn7nnwoYgU5gJ0OlalIJ5R8WKvv+Lv2/kHJGrhTaekO+i
HP9nrqVShm9yNjZge3hDLOcJVf+OrrH2sZPgdu10uYYIY7c2Is+xSZCE6y8N/n2A
h9MOy/O6qdy6iT/WypsCUxSXtAvLzYuziUr6FfQc0uNTX1MngMWmNKoeeWh2w0hF
OnQYqEoWv/160gL79PvgfHE4H3Ui97L+KJvQScpi88CTvhVBofG81tyje3Ck2VYs
5GI6O3GPSQCDAvAcvM/kxdLnpn7CbOK6YZqPpyo+Twy8v73jykmRbCsXm5jqpoZB
GJeaej8WNJwrALXTiiqF6cWAaiT39DyFgFUQE+fsOCFLbN7qz43XwAko2XNCftfR
RbxgiJlWAjVZaFh0Xu5PVqceLcxnD1b3arOneiV5Ku9396/kWGZ09IMaUrVD7UyE
YaKLFlNdvRs3sowQgIpBO29srZTfM1zC9A2IYCL99nPYHX5eqm0P442PzOBC0Yz9
2rE5h9Ng2/uKpvaRlJT/M4MMJaBxHLpXtg0RzkF68r1/1cRIoqmkcW7bcDuTYiGQ
5fXOpf/usN4qKgG+OOdPuQskxKFCSwd+84v/1fg+hKQNIxbfRxsVC7mWNa0+5QyM
9OiUjqYTK7s7JJnRy5tioHz4EMOlCgpPifKAUkbDIzOaWasgBnE=
=xp3i
-----END PGP SIGNATURE-----

--DdD2ADl01ewO9gdw--

