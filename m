Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86F245FD1C
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 07:30:02 +0100 (CET)
Received: from localhost ([::1]:45442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqrDl-0008FN-4l
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 01:30:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqr9G-0006iT-25; Sat, 27 Nov 2021 01:25:22 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:48135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqr9B-0003Pd-RL; Sat, 27 Nov 2021 01:25:21 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J1M6b4bLvz4xcv; Sat, 27 Nov 2021 17:25:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637994311;
 bh=ICCyBx64EocI6mwWs58Xd1wyFvD7uKP0ToDo0b5GqJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T0Pmia01SIQ1f1HD4UDeQzPlYUZfoMZhplXSqcI8FDeEhBGyDqBVKrxEt0vHkgMoh
 eia28Was/8M0++6K57uyaOpO2dihVu3qV1f9pJd3BFF1hYq8H2gXJn+GKq1kGNYL3d
 ksTFn3yVFQ316QzK/2u/jMyj8r+NXXGrulOiAQdw=
Date: Sat, 27 Nov 2021 16:14:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/1] ppc/pnv.c: add a friendly warning when accel=kvm is
 used
Message-ID: <YaG+ue4IWkXpu0oJ@yekko>
References: <20211125224202.632658-1-danielhb413@gmail.com>
 <YaA0SIVnltlrarQZ@yekko>
 <077efeac-3672-8b8f-dbe4-901c47c23eda@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qXZ8/X/IL+U3T0zq"
Content-Disposition: inline
In-Reply-To: <077efeac-3672-8b8f-dbe4-901c47c23eda@kaod.org>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qXZ8/X/IL+U3T0zq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 26, 2021 at 06:51:38PM +0100, C=E9dric le Goater wrote:
> On 11/26/21 02:11, David Gibson wrote:
> > On Thu, Nov 25, 2021 at 07:42:02PM -0300, Daniel Henrique Barboza wrote:
> > > If one tries to use -machine powernv9,accel=3Dkvm in a Power9 host, a
> > > cryptic error will be shown:
> > >=20
> > > qemu-system-ppc64: Register sync failed... If you're using kvm-hv.ko,=
 only "-cpu host" is possible
> > > qemu-system-ppc64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Inva=
lid argument
> > >=20
> > > Appending '-cpu host' will throw another error:
> > >=20
> > > qemu-system-ppc64: invalid chip model 'host' for powernv9 machine
> > >=20
> > > The root cause is that in IBM PowerPC we have different specs for the=
 bare-metal
> > > and the guests. The bare-metal follows OPAL, the guests follow PAPR. =
The kernel
> > > KVM modules presented in the ppc kernels implements PAPR. This means =
that we
> > > can't use KVM accel when using the powernv machine, which is the emul=
ation of
> > > the bare-metal host.
> > >=20
> > > All that said, let's give a more informative error in this case.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   hw/ppc/pnv.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> > > index 71e45515f1..e5b87e8730 100644
> > > --- a/hw/ppc/pnv.c
> > > +++ b/hw/ppc/pnv.c
> > > @@ -742,6 +742,11 @@ static void pnv_init(MachineState *machine)
> > >       DriveInfo *pnor =3D drive_get(IF_MTD, 0, 0);
> > >       DeviceState *dev;
> > > +    if (kvm_enabled()) {
> > > +        error_report("The powernv machine does not work with KVM acc=
eleration");
> > > +        exit(EXIT_FAILURE);
> > > +    }
> >=20
> >=20
> > Hmm.. my only concern here is that powernv could, at least
> > theoretically, work with KVM PR.  I don't think it does right now,
> > though.
>=20
> At the same time, it is nice to not let the user think that it could work
> in its current state. Don't you think so ?

Right, I'm thinking of the implication if you have an old qemu but a
new KVM which let it work.  Chances of KVM actually implementing this
probably aren't good though, so requiring the qemu update if we ever
do is probably the better deal.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qXZ8/X/IL+U3T0zq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGhvrcACgkQbDjKyiDZ
s5KC+hAAjk2AbXbO9uO+qZr85kI75t2ITmjKelqkpR0oWIWmAn6J1JjONUHljsG/
hSXqVD+PMtxPJt2IE/Dlk29k7JNvZvSYkcPSyVpQoKww1x/qomr1rXvn0GQFllgT
4yqFcxEGIoYs1ugSHRr8/0geOWS39lKky2xIsd8pMWeKgo76hNrWW2H0CXvKTgXK
+6Mh5P9a7kcAn3e7IGtHv0BtX97B1o3s7JRvuBszahmrC0kLcjySO+PFPM2Bu0aH
SJ4a4VKCCgePDpg9DQV470i+MVpVBTPYeZlumFDNSWr66hHMRQDruLMQELWRsQOD
flDL0gU829jzlLBM2ML0hIc7OMQFPiymjb+xzCynMwSHCQ/7AR6fATL2b4dR4Mpq
ZFU1Oec7+6LFHs4YD4nLA66INMW/HQ6nM21NotCg34mKoDNwRohl0LpfA94Yyx8d
j4wdznq0dcn1Nt0kI0x7ATWyeE6OkWCffGF7odjtdtU6j3H2gRh0N0GONSUMMQFk
UxUO6Cf7wa6Os+0ER1ORKF5GrNN+IOMFGmqJzItjIEug9BRKqf+l/Crg5Yx8GW7b
yVQY7Euta/jSgYPZ7sYtiSc7UGp0Qqwr3bZtfsJUPM4YlO0Qz5WPG74/zHerq6l/
Wy0FL9rG/Pc4hLMfRS/yzeaWYR8JzExw7AvUQKAFb11zY2uJJNQ=
=dAON
-----END PGP SIGNATURE-----

--qXZ8/X/IL+U3T0zq--

