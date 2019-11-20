Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A579A1038FF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 12:43:28 +0100 (CET)
Received: from localhost ([::1]:56776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXOON-0001wh-Kz
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 06:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iXOMs-0000xf-FM
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 06:41:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iXOMp-0007GX-Pl
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 06:41:54 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42757 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iXOMo-00078x-WD; Wed, 20 Nov 2019 06:41:51 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47J14T2cTkz9sPc; Wed, 20 Nov 2019 22:41:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574250105;
 bh=xm/OD7gHeqIK4V+e5RzwnfYaJi2fQC8X9pkmZJcIJqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GUhPW766y0JWPtM9MDBSIxTN8ffRomhwEMpynGNRDG41ePqNu1n+/+M0Riw5yzCiP
 /gsyBYVP/oY+EfTu5SfwaY7HqtOrXnCz2KaN8RaTNwz+rr5LANMNXyEfexhiqYz5He
 /DLQK1hlbcc9RMEjhvk7xU1/cmYj+XNau2aiLSJQ=
Date: Wed, 20 Nov 2019 22:41:28 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] spapr: Fix VSMT mode when it is not supported by the
 kernel
Message-ID: <20191120114128.GN5582@umbus.fritz.box>
References: <20191108154035.12913-1-lvivier@redhat.com>
 <20191108174759.2d4040f1@bahia.lan>
 <20191119010012.GI5582@umbus.fritz.box>
 <caa35299-c928-a968-83b5-842d000f0242@redhat.com>
 <20191119164526.0e980a37@bahia.lan>
 <20191120043653.GG5582@umbus.fritz.box>
 <cb8f7dc7-d6db-6bd9-e825-1ade7d89cdd9@redhat.com>
 <0c1f57ac-0823-4268-429b-d1aee8f7f8d5@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L0wVL3lRYNLgmYWy"
Content-Disposition: inline
In-Reply-To: <0c1f57ac-0823-4268-429b-d1aee8f7f8d5@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--L0wVL3lRYNLgmYWy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 12:28:19PM +0100, Laurent Vivier wrote:
> On 20/11/2019 10:00, Laurent Vivier wrote:
> > On 20/11/2019 05:36, David Gibson wrote:
> >> On Tue, Nov 19, 2019 at 04:45:26PM +0100, Greg Kurz wrote:
> >>> On Tue, 19 Nov 2019 15:06:51 +0100
> >>> Laurent Vivier <lvivier@redhat.com> wrote:
> >>>
> >>>> On 19/11/2019 02:00, David Gibson wrote:
> >>>>> On Fri, Nov 08, 2019 at 05:47:59PM +0100, Greg Kurz wrote:
> >>>>>> On Fri,  8 Nov 2019 16:40:35 +0100
> >>>>>> Laurent Vivier <lvivier@redhat.com> wrote:
> >>>>>>
> >>>>>>> Commit 29cb4187497d sets by default the VSMT to smp_threads,
> >>>>>>> but older kernels (< 4.13) don't support that.
> >>>>>>>
> >>>>>>> We can reasonably restore previous behavior with this kernel
> >>>>>>> to allow to run QEMU as before.
> >>>>>>>
> >>>>>>> If VSMT is not supported, VSMT will be set to MAX(8, smp_threads)
> >>>>>>> as it is done for previous machine types (< pseries-4.2)
> >>>>>>>
> >>>>>>
> >>>>>> It is usually _bad_ to base the machine behavior on host capabilit=
ies.
> >>>>>> What happens if we migrate between an older kernel and a recent on=
e ?
> >>>>>
> >>>>> Right.  We're really trying to remove instaces of such behaviour.  =
I'd
> >>>>> prefer to completely revert Greg's original patch than to re-introd=
uce
> >>>>> host configuration dependency into the guest configuration..
> >>>>>
> >>>>>> I understand this is to fix tests/migration-test on older kernels.
> >>>>>> Couldn't this be achieved with migration-test doing some introspec=
tion
> >>>>>> and maybe pass vsmt=3D8 on the QEMU command line ?
> >>>>>
> >>>>> ..adjusting the test case like this might be a better idea, though.
> >>>>>
> >>>>> What's the test setup where we're using the old kernel?  I really o=
nly
> >>>>> applied the original patch on the guess that we didn't really care
> >>>>> about kernels that old.  The fact you've hit this in practice makes=
 me
> >>>>> doubt that assumption.
> >>>>>
> >>>>
> >>>> The way to fix the tests is to add "-smp threads=3D8" on the command=
 line
> >>>> (for all tests, so basically in qtest_init_without_qmp_handshake(), =
and
> >>>> it will impact all the machine types), and we have to check if it is
> >>>
> >>> Ohhh... it isn't possible to initialize Qtest with machine specific
> >>> properties ? That's a bit unfortunate :-\
> >>
> >> Uhh... I don't see why we can't.  Couldn't we just put either -machine
> >> vsmt=3D8 or -smp 8 into the cmd_src / cmd_dst printfs() in the
> >> strcmp(arch, "ppc64") case?
> >=20
> > Yes, but we need to do that to all other tests that fail. test-migration
> > is not the only one impacted by the problem (we have also pxe-test), so
> > it's why I thought to fix the problem in a generic place.
> >=20
> > But it seems there are only this couple of tests that are impacted so I
> > can modify both instead. I think only tests that really start CPU have
> > the problem.
> >=20
> > I'm going to send a patch to fix that.
>=20
> And again, it's a little bit more complicated than expected: setting
> vsmt to 8 works only with kvm_hv, but breaks in case of TCG or kvm_pr.
> So the test must check what is in use...

Ugh, yeah, that's getting too ugly.  I think the feasible options are
either to revert the patch, or just say that upstream qemu no longer
supports a RHEL7 host.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--L0wVL3lRYNLgmYWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3VJmYACgkQbDjKyiDZ
s5LVww/9Gsbxgu86Sx6FHj5lzp8rEFC5hNHIsaNLB8jort06k0nhzwGR/81SqaZu
mWwwSzrXYGVsCtlUy+cs30n7niktbJ62Rs7GC2hpK/Xhm/W2NTVSw8xc0Aq6R2LI
duAzsKB2rJG4n3jeM3yDwpkXYa5j0r2dYgRoXqobfaM1cNKJseuNVlXfGVnWZjZi
6dgxWNSNsQDs9gCIx2DRqbkCNvHqldYa3nNFw4N4dAJu9U5Rrty+r8BPepetmduf
NuS1rCoVX+i41JaHT4ULEtAvGG0GI8oc/qqm8x5ZORQaJYQ3kU2EAISE1IExeToO
XtXrfhFkpF8sM/r3bVaXNcTlWPvAjIZPJCzb5W7ILmh/vnDaSh9SZXejtZz+W6D6
2HFID4rZYrcmnOVe6BZOvMSZCo1m/NDl73ZDZOik8LNyTNPVYHowcz4SJYmS3Kj1
eBQBVA8JJ44/JUDjkvE8zT4r6W1dbXRih43NCNmuDGG0MuaioOrU2LjX/4BUYnc4
V9yIrRFQdeKh+YJAVWyt4FEWGddjTxGM4RfjIokQViSXLJgTyjkHJTHRYLMC8Y+P
NwNW+/ttLJc0p9hApAu7cgNUEqUQmtU4muq2Hezb8K3o3gYf1WmfwwxhrIx+oiCC
4HETOfO8rzyaPsxBiGh8y/6osGs00MhzxaFkog6++Wm82Uxvpk0=
=vx8b
-----END PGP SIGNATURE-----

--L0wVL3lRYNLgmYWy--

