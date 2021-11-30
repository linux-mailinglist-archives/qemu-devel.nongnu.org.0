Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F1462A2E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 03:07:04 +0100 (CET)
Received: from localhost ([::1]:32872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrsXv-0004g0-VF
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 21:07:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mrsNi-0008AO-8W; Mon, 29 Nov 2021 20:56:30 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=47189
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mrsNd-0006az-Tn; Mon, 29 Nov 2021 20:56:29 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J35101KWrz4xR9; Tue, 30 Nov 2021 12:56:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638237380;
 bh=c638xwwQ8sX4TUZjbr4uWPyHFTnYNQbzGTk8ELONd5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b28ZMQrZgCbh97/CKdLYvVGbFd/dHruKYwTyEUB/efeQ9fcTKxdiStqcf9fvc4d43
 vM6ktQYjTbEvgOsAtPA/r0dhyFic56oswfwwNrVa6df4+r2uHOiIsoU0qF7IwgdXiR
 rsFN/hZkUzy32pcavZfSTm8lxVRr4MNM+tH2eeYQ=
Date: Tue, 30 Nov 2021 11:14:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] ppc/pnv.c: add a friendly warning when accel=kvm is
 used
Message-ID: <YaVs7GcbGgrJ6xOQ@yekko>
References: <20211125224202.632658-1-danielhb413@gmail.com>
 <YaA0SIVnltlrarQZ@yekko>
 <077efeac-3672-8b8f-dbe4-901c47c23eda@kaod.org>
 <YaG+ue4IWkXpu0oJ@yekko>
 <4ec67484-d328-7a8d-fb77-c43b151da80c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Wqn6RNi/NLXrDXht"
Content-Disposition: inline
In-Reply-To: <4ec67484-d328-7a8d-fb77-c43b151da80c@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Wqn6RNi/NLXrDXht
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 06:09:41PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 11/27/21 02:14, David Gibson wrote:
> > On Fri, Nov 26, 2021 at 06:51:38PM +0100, C=E9dric le Goater wrote:
> > > On 11/26/21 02:11, David Gibson wrote:
> > > > On Thu, Nov 25, 2021 at 07:42:02PM -0300, Daniel Henrique Barboza w=
rote:
> > > > > If one tries to use -machine powernv9,accel=3Dkvm in a Power9 hos=
t, a
> > > > > cryptic error will be shown:
> > > > >=20
> > > > > qemu-system-ppc64: Register sync failed... If you're using kvm-hv=
=2Eko, only "-cpu host" is possible
> > > > > qemu-system-ppc64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): =
Invalid argument
> > > > >=20
> > > > > Appending '-cpu host' will throw another error:
> > > > >=20
> > > > > qemu-system-ppc64: invalid chip model 'host' for powernv9 machine
> > > > >=20
> > > > > The root cause is that in IBM PowerPC we have different specs for=
 the bare-metal
> > > > > and the guests. The bare-metal follows OPAL, the guests follow PA=
PR. The kernel
> > > > > KVM modules presented in the ppc kernels implements PAPR. This me=
ans that we
> > > > > can't use KVM accel when using the powernv machine, which is the =
emulation of
> > > > > the bare-metal host.
> > > > >=20
> > > > > All that said, let's give a more informative error in this case.
> > > > >=20
> > > > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > > > ---
> > > > >    hw/ppc/pnv.c | 5 +++++
> > > > >    1 file changed, 5 insertions(+)
> > > > >=20
> > > > > diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> > > > > index 71e45515f1..e5b87e8730 100644
> > > > > --- a/hw/ppc/pnv.c
> > > > > +++ b/hw/ppc/pnv.c
> > > > > @@ -742,6 +742,11 @@ static void pnv_init(MachineState *machine)
> > > > >        DriveInfo *pnor =3D drive_get(IF_MTD, 0, 0);
> > > > >        DeviceState *dev;
> > > > > +    if (kvm_enabled()) {
> > > > > +        error_report("The powernv machine does not work with KVM=
 acceleration");
> > > > > +        exit(EXIT_FAILURE);
> > > > > +    }
> > > >=20
> > > >=20
> > > > Hmm.. my only concern here is that powernv could, at least
> > > > theoretically, work with KVM PR.  I don't think it does right now,
> > > > though.
> > >=20
> > > At the same time, it is nice to not let the user think that it could =
work
> > > in its current state. Don't you think so ?
> >=20
> > Right, I'm thinking of the implication if you have an old qemu but a
> > new KVM which let it work.  Chances of KVM actually implementing this
> > probably aren't good though, so requiring the qemu update if we ever
> > do is probably the better deal.
>=20
>=20
> If the KVM module implements powernv accel support in the future, I would=
n't
> take my the chances with the powernv machine working out of the box with =
it.
>=20
> Most likely, if an endeavor of supporting KVM accel for powernv ever takes
> place, we'll need QEMU changes to go with it. And when that happens we can
> revert this patch and make the other necessary changes/fixes.
>=20
> All that said, perhaps it's useful to add a note in docs/system/ppc/power=
nv.rst
> explaining the the rationale for what we're doing here.

Yeah, makes sense to me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Wqn6RNi/NLXrDXht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGlbOwACgkQbDjKyiDZ
s5KJ0A/+NV6oKK0xjnyrS+FEnsSiIvtx4qxTCbEXjEo5okXEPNQ7KLikGknEsms7
NbILDnGa1+enxb1P7XYSG42txD8kW8HoRtU8VCsL1EL7yG7Ud13gU5Azv/IFWEFI
SUlk/KZImpK6UagH/L7yAtzPUjCE3ajeKCKyPra2fgOf1cpL51UKKDHeI4ASTPHk
vJDr18vHlOwZcB/NM7rJPsBWXdPoqHML+2zgbxbcQ2ycuSoEzjb9OkYdG+k+4qxq
drCQrdtvR0nCbPL3C4s+4gNVr3czHxJmEHh/yMv0DXmfDfCPu8PyDxbkhNrtBxAO
mWwmgADOCVSu2Tj44/JS6Lcb7pQkt/lHxmjbvx8GcEl4+A7HzG7NwPOavv6ude7c
5eVE/CfSD/PkJBa02JbyM4VIUCfYV93geJOh31d3jFaOFBN7Dt860EAVAtUGi//T
kWGV1yVTf4CspgJAi6Fzkc//rmo3sa7YtJ4OJAudQu3d736sycfIk3xYBCWe80gW
ElbJmVbnY2m8hNsfToIkST3f53UHUpBvCWJNmzXAeL9DaK3isEHKUu4s4fQwwO84
TrByQix3CneBD7EIaewZeDvBfc/bKUauddXxNCL4KwkcCSX49fOHTCUDDOMKN/HC
0FC56ZK2IsIex76pvgMDGX5lvLbrxoxjKaLW4MyZ8uvKGK+81/o=
=P83p
-----END PGP SIGNATURE-----

--Wqn6RNi/NLXrDXht--

