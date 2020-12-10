Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3AB2D522D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 04:57:28 +0100 (CET)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knD55-0008Sv-G6
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 22:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knD28-0006y6-0i; Wed, 09 Dec 2020 22:54:24 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:47117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knD23-0000IT-0e; Wed, 09 Dec 2020 22:54:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cs0Qs724Rz9sWC; Thu, 10 Dec 2020 14:54:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607572453;
 bh=GXmGvBt8EmfLg0rv4AHCjwDzJ0sBNLm7hogx17HnPOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MVVQC4CrpFl7bUwP+XWqL+TsRIqYGyTOUzfblV+jQMAINBiC2GA6Kxs/bobnzChtW
 DNfB4ebdYixUeYgwvPMkUKdrkwz56O4mZG3RH5r5XHP5fnBOY11TScoiiHws8M0NS2
 2MNxjbHgPYHHuhRYh4OeKdmKUZbjK+vHsCT6Yu6c=
Date: Thu, 10 Dec 2020 14:53:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 1/6] spapr: Add an "spapr" property to sPAPR CPU core
Message-ID: <20201210035302.GM2555@yekko.fritz.box>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-2-groug@kaod.org>
 <de3d6170-3e28-ce78-41a3-59eca3cb6b67@redhat.com>
 <20201209184225.1b544523@bahia.lan>
 <d0f7cde7-c550-4a6c-8730-c3422002516c@redhat.com>
 <b8474a48-5dcd-343e-ef29-531c628b2ff2@redhat.com>
 <20201209182617.GV1289986@habkost.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XlS4q8O07AKt4+K1"
Content-Disposition: inline
In-Reply-To: <20201209182617.GV1289986@habkost.net>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XlS4q8O07AKt4+K1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 01:26:17PM -0500, Eduardo Habkost wrote:
> On Wed, Dec 09, 2020 at 07:11:40PM +0100, Philippe Mathieu-Daud=E9 wrote:
> [...]
> > >>>> @@ -200,7 +199,7 @@ static void spapr_cpu_core_reset(DeviceState *=
dev)
> > >>>>      int i;
> > >>>> =20
> > >>>>      for (i =3D 0; i < cc->nr_threads; i++) {
> > >>>> -        spapr_reset_vcpu(sc->threads[i]);
> > >>>> +        spapr_reset_vcpu(sc->threads[i], sc->spapr);
> > >>>
> > >>> Why reset() needs access to the machine state, don't
> > >>> you have it in realize()?
> > >>>
> > >>
> > >> This is for the vCPU threads of the sPAPR CPU core. They don't have =
the
> > >> link to the machine state.
> > >=20
> > > They are created by spapr_create_vcpu() + spapr_realize_vcpu() in
> > > spapr_cpu_core_realize(), which has sc->spapr set... Am I missing
> > > something?
> >=20
> > Anyhow, from a QOM design point of view, resetfn() is not the correct
> > place to set a property IMHO, so Cc'ing Eduardo.
>=20
> This patch is not setting the property on resetfn(), it is
> setting it on CPU core pre_plug().

Well, also machine reset, but the point is it's not the resetfn() of
the cpu.

Basically what this is doing is machine specific (rather than just cpu
specific) initialization of the cpu state - we need that because the
pseries machine is implementing an explicitly paravirtualized platform
which starts things off in a state a bit different from the "raw" cpu
behaviour.

So, although it's working on a CPU's state, this function actually
belongs to the machine, rather than the cpu.

> This is more complex than simply using qdev_get_machine() and I
> don't see why it would be better, but I don't think it's wrong.

But, yeah, this...

I've applied some of the later patches in this series, but I'm not
convinced on this one or 2/6.  It seems like they're just replacing
one ugly (access to qdev_machine_state() as a global) with a different
ugly (duplicating something which has to equal the global machine
pointer as properties in a bunch of other objects).

Both 1/6 and 2/6 are altering explicitly spapr specific devices, they
have interactions with the overall platform model which mean they have
to sit in that environment, so I think trying to add a property here
implies an abstraction that can't actually be used in practice.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XlS4q8O07AKt4+K1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/Rm5wACgkQbDjKyiDZ
s5L6zg//UePOD3Om1YM88HyLBzZnviVD4A0Dqr29E24FIkqWfLvh7JZdo++dt55x
4Ts1SXj8nWGOX3PJP4awyAfxMvEkYJZFKuyv+J4RTxou05w4sYbmvpH8OSPB7J+G
8H+KrlglV9/DJMroJ+iCf92WJXPbYNe+D4GZL74PimwVs2UFQMc+CiDveYcqFEYr
j10qrsI7xyrwdZ+Eia+gGCISJWxLvYOoXk1SW4N7n4PZKz2LnqtqEHq6uewuzqH8
6igDekoRVsH7EKAe8ycZDggirWeB8ncvOMgM8l7+qlEEgESE7tYx8E14Qk8aTRer
QzSaZA4iCiOQr5lIhJZkD61Q5eciLQBjA5oW8HcrspSD1eNIFzQ28fSPwqhnL+PE
VezWxllCyCc5t/3CMP+qW9Ka1OHMUpsMKAsQKk6Fn7kZOUjbN7SUmteu2UfdOjsu
CkbYC5uV1uHFUZKDjD8k9h8U3oTGf5n//3xxQ0ouTRTsIDNQGPTTknWAVaLyHPu8
g+YypbmmrZLVRx4mIFgfp61hpU088FAMEirbHPSpffh0UxcT4HSJnqCPVTAQmbYH
IKepm2EXvM4lv/GvY1XFQje4u/xM0p9TgepE2urabepzwwFh3m6xFO+fkFZy+ZWt
r82vDSUptwnfj+zqip2YxgieEhAQNjpTvxtvjmKfAC5CR0Pre20=
=6Yx2
-----END PGP SIGNATURE-----

--XlS4q8O07AKt4+K1--

