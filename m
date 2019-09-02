Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA3A52BC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 11:24:28 +0200 (CEST)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4iZX-00062t-Ch
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 05:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48110)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i4iXb-0004TP-MS
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 05:22:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i4iXa-0005aG-6M
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 05:22:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56023 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i4iXY-0005W5-Nv; Mon, 02 Sep 2019 05:22:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46MPk43wkrz9sDB; Mon,  2 Sep 2019 19:22:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1567416140;
 bh=rHcWX+gA9u27gQcsd4p1fHbfLiq5yWr+Y3Qk59lheyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IVwh7LYwDWNtryOgyY0XuCHBnVRIJT3jThJlYt+MnYfSGK0sjrOcNhtSjXspK7qbu
 Gxf3RIbG0uGjxmn62jVVXHHE8yPwNd0KZ07auBC4Yy20nl5JK9W00Nvo1ZnbcYBf34
 fkhOI/313cv6eOszAjKw/L5bnx+5V4a58L7Xh6ac=
Date: Mon, 2 Sep 2019 19:11:11 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20190902091111.GA30674@umbus.fritz.box>
References: <20190830161345.22436-1-lvivier@redhat.com>
 <20190830163413.GH4674@redhat.com>
 <20190830194543.6c1f5776@bahia.lan>
 <20190902062718.GG415@umbus.fritz.box>
 <20190902085736.GB30123@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <20190902085736.GB30123@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH] pseries: do not allow
 memory-less/cpu-less NUMA node
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 09:57:36AM +0100, Daniel P. Berrang=E9 wrote:
> On Mon, Sep 02, 2019 at 04:27:18PM +1000, David Gibson wrote:
> > On Fri, Aug 30, 2019 at 07:45:43PM +0200, Greg Kurz wrote:
> > > On Fri, 30 Aug 2019 17:34:13 +0100
> > > Daniel P. Berrang=E9 <berrange@redhat.com> wrote:
> > >=20
> > > > On Fri, Aug 30, 2019 at 06:13:45PM +0200, Laurent Vivier wrote:
> > > > > When we hotplug a CPU on memory-less/cpu-less node, the linux ker=
nel
> > > > > crashes.
> > > > >=20
> > > > > This happens because linux kernel needs to know the NUMA topology=
 at
> > > > > start to be able to initialize the distance lookup table.
> > > > >=20
> > > > > On pseries, the topology is provided by the firmware via the exis=
ting
> > > > > CPUs and memory information. Thus a node without memory and CPU c=
annot be
> > > > > discovered by the kernel.
> > > > >=20
> > > > > To avoid the kernel crash, do not allow to start pseries with emp=
ty
> > > > > nodes.
> > > >=20
> > > > This describes one possible guest OS. Is there any reasonable chance
> > > > that a non-Linux guest might be able to handle this situation corre=
ctly,
> > > > or do you expect any guest to have the same restriction ?
> >=20
> > That's... a more complicated question than you'd think.
> >=20
> > The problem here is it's not really obvious in PAPR how topology
> > information for nodes without memory should be described in the device
> > tree (which is the only way we given that information to the guest).
> >=20
> > It's possible there's some way to encode this information that would
> > make AIX happy and we just need to fix Linux to cope with that, but
> > it's not really clear what it would be.
> >=20
> > > I can try to grab an AIX image and give a try, but anyway this looks =
like
> > > a very big hammer to me... :-\
> >=20
> > I'm not really sure why everyone seems to think losing zero-memory
> > node capability is such a big deal.  It's never worked in practice on
> > POWER and we can always put it back if we figure out a sensible way to
> > do it.
>=20
> I'm not that bothered - I just wanted to double check that we were not
> intentionally breaking a non-Linux guest OS that was known to work today.

There are no non-Linux guests that are known to work today, unless you
count the kvm-unit-tests micro-OS.  AIX support is coming along, but
it's by no means established.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1s3KsACgkQbDjKyiDZ
s5Jr7RAAgIyoSw6oXICBMIINg53Zriz0IgENAhXj49k+W0qgUZ234JRfmD13YjYf
P4ao8ss+DnwGZ6AYXS5FPSG6LEXnR7NAGsNBjaeVzFjcnUP7Mr6+7uOWs9TjaTmp
jD48wovDW2ZRMYCVk0QZOAlGM+aQ9O/w/hoRPGRxyKcp+ZP9I8q+Dnkw9WOVHFNA
0wcsXJGRb/zGedvUveFnA7uQu7F8Of4YzRjS6ecs5dErBSAWMQJMFU7xi6xxkQ8X
kDUx1iOoVOci97no02WnHkLfFhuSzq0+B6V7W+io1Sf5QtZJvxG1n8lv13onJR4M
9SE4u9iCpBFXJ69muxquTqFQVO6Ob3G8rFsD2HGIvIGwCSzELGJUjvs8BLunF6kZ
MJIcj2bopMwweDRV9kkLlvrK0sDXETs0cSItGQjPKIwh6id/CgZQlwHi4goyJVub
X0y0+5hK+UDElN7pGXoJoLjJ5CmRzRSWeJFv1HZHRTRH8tUL0gqyQOea8hxESitW
P+JalkSa1PQ8xorPu9EeAfRKTNbT6QalGbJ9nskd9QB2gVQEX+kLf4CW22I0tRbG
vrkN9LzkkPBB1foJXrlJL3boaBQL9Xzwg5+djk9jpgDc3hlSKZQF5mIbhkeW+jFd
hx8VynDA5+j5TICksRi/Rr5e1FJPI54uh1AZx46Hw4zxCxb47GM=
=zXF5
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

