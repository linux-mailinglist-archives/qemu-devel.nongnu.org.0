Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E95331EBA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 06:34:54 +0100 (CET)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJV1B-0007Le-QR
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 00:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJV00-0006mQ-5Q; Tue, 09 Mar 2021 00:33:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52829 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJUzx-0004EA-Kv; Tue, 09 Mar 2021 00:33:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DvkQL6ZHfz9sW5; Tue,  9 Mar 2021 16:33:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615268010;
 bh=YCLi+jK4LJikwbZBvibhaI2Dy0WKFPojCAJ0sAt0AJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HWpCsv1uuED+drQ2TVAbeh2FpmO+tc9ECinO/3s+3uh4Bs0MMN7ge6uptBiagZBtN
 3cIKNslEfJKAfGQI+mFX7ebGYhqVZ+GZ4+Pu+2RvCyVmw60NH2Yxlw6AhxmmQn7EcZ
 7/BJkSQqJ3GKMMFCVg8LHjxdJb0maPKCr1f533qo=
Date: Tue, 9 Mar 2021 16:33:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v14] spapr: Implement Open Firmware client interface
Message-ID: <YEcIpeA/MfvKfwwZ@yekko.fritz.box>
References: <20210224054130.4540-1-aik@ozlabs.ru>
 <YD2yd42dv/7/m94f@yekko.fritz.box>
 <08781378-b4ba-12bf-2ae8-f3da9db9342c@ozlabs.ru>
 <8bb2465d-9353-ca99-d98a-d91416d7f527@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QC6JoDAXpXMG9Z0y"
Content-Disposition: inline
In-Reply-To: <8bb2465d-9353-ca99-d98a-d91416d7f527@eik.bme.hu>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QC6JoDAXpXMG9Z0y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 10:37:59AM +0100, BALATON Zoltan wrote:
> On Tue, 2 Mar 2021, Alexey Kardashevskiy wrote:
> > On 02/03/2021 14:35, David Gibson wrote:
> > > Alexey or Zoltan, any thoughts on how non-PAPR versions of this would
> > > call into qemu to get the non-guest parts of VOF to execute?
> >=20
> > Non-PAPR could do it as we do it for soft breakpoints in KVM - some
> > predefined illegal instruction which KVM knows that it is used for soft
> > breakpoints.
>=20
> So far I've thought I'd need to implement TYPE_PPC_VIRTUAL_HYPERVISOR
> interface in the machine for the code in target/ppc/excp_helper.c to forw=
ard
> client syscalls to QEMU where I could handle the VOF related calls but not
> sure this is the best way.

I'm not sure that will work on its own.  VIRTUAL_HYPERVISOR just traps
the "sc 1" (hypecall instruction).  If that's an illegal instruction
for CPU, we can theoretically still use it, but I suspect TCG will
flag it as an illegal instruction and trap before we even get to the
VIRTUAL_HYPERVISOR dispatch point.  You'll need to investigate.

> This could be OK for the initial boot when
> nothing else should use syscalls yet but with RTAS this may not work as t=
he
> guest OS could also use syscalls so to avoid conflicts we may need to shut
> down the virtual hypervisor on quiesce

Uh.. no.  VIRTUAL_HYPERVISOR doesn't intercept normal system calls,
only "level 1" system calls which are explicitly designated for
hypercalls.

> which means I may need a minimal
> guest only rtas for pegasos2 (which would be OK as I think it's only used
> for shutdown/reboot anyway). Also may need some changes to allow empty
> callbacks in vhyp to be ignored when I only want to implement hypercall
> method but that's just adding checks to only call non-NULL callbacks in
> PPCVirtualHypervisorClass.
>=20
> There's also an old patch from Benjamin Herrenschmidt to add MOL OSI which
> is a similar hypercall interface:
> https://github.com/ozbenh/qemu/commit/6dc8803641e323030ffd01ad8ce0dcf0818=
96698
> This might also be useful later to use MOL paravirtual drivers to speed up
> MacOSX emulation. but I haven't looked at the details yet.
>=20
> Any other ideas?
>=20
> Regards,
> BALATON Zoltan
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QC6JoDAXpXMG9Z0y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBHCKUACgkQbDjKyiDZ
s5JUeQ//cl7CrxDYNuOzSV8YmURZBTI6FlTgyRoByucpkM8zz1mz0fzVW/0dx5mZ
QOUkWswiL0SSeYmD6El1ZaXZK93CAl1RYs5uBHs05ZfIhC34gM5sda5WLGlw0Z3N
d9kBwTvFauqct6G9nJ+YP1XZJXh1H3ADGHYSRgDULtwoJIPNSoyc3SdXJ1965NL9
s0mOOJyJ952BpDMe7LaXUCkjs+D6MHCCVR6Tg3S96T4WI1etUZHWGt39UCzK/Xgn
oNUVmVjAG2TF4wUzStcsEE1UuJOfHrFEvlxmdiTgMovGt/Rp7b2gebQituY2qYoJ
x/sFJJbBV2XwOZCxTQFMrXCHpV1jZbZwS+wPOvGpjyeVeV8ejMIgtiHgnshgGyab
j+yUF1G4d1tJJapq/ZknvlL4AdqkD3eWCN1grCrDka3Avv80/SZ7Ptv0U80tczOS
QuxpSqDsFzrrH0ipXOmWtskpUUs/dXezncFrDziyT0I6T67PKwQic3dbjsUbipUJ
bG3bo/wpyI+9/iJioNzLcA1ZWQf7+R153IETqLsNICpaQIXK4c0+5tnyBRY8nT3n
UewPyV+x3n4TbwnGushUUMvXiQa4i/WgN13YADqirjQnCsYpfOIzhWUnLPl/x0jd
t9GqhpodRiAvd0ZeAjaE44vAmYqMEIepYwZ+pwl/f8fOyJKmOBc=
=qFsM
-----END PGP SIGNATURE-----

--QC6JoDAXpXMG9Z0y--

