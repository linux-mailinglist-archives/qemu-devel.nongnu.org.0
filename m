Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A010E336A08
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 03:10:15 +0100 (CET)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKAmE-00009h-75
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 21:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lKAl1-00084S-V0; Wed, 10 Mar 2021 21:08:59 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58775 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lKAkz-0004yG-2b; Wed, 10 Mar 2021 21:08:59 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwsnJ0fC0z9sWW; Thu, 11 Mar 2021 13:08:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615428532;
 bh=ObXTxr28mtjuTk5Sf3vHph23e0agD+OIYn3yofrLtyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=if0hwGXU/O8qNZWdkvvNTqk/N1bY8bLlokf9sIswRE7xUwLEwQMk2FlPPopP+GhWb
 JP9zKSW8NpSSXElw8YnwPC8ibv1TSGt9BrsxEyDB35lPAjgl04FZYjE1vmre8O2ETl
 ZDSaVJQPJxLQRnEFh47i5TCQik/+RvxKrqFek2Ls=
Date: Thu, 11 Mar 2021 12:47:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ivan Warren <ivan@vmfacility.fr>
Subject: Re: [PULL 00/20] ppc-for-6.0 queue 20210310
Message-ID: <YEl2rC3TOetSiqh8@yekko.fritz.box>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
 <503c3c5e-3dd2-adba-2d2c-2e5f8618fc3a@vmfacility.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JrTA29XVZfEQ4CAe"
Content-Disposition: inline
In-Reply-To: <503c3c5e-3dd2-adba-2d2c-2e5f8618fc3a@vmfacility.fr>
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
Cc: peter.maydell@linaro.org, qemu-ppc@nongnu.org, groug@kaod.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JrTA29XVZfEQ4CAe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 03:09:46PM +0100, Ivan Warren wrote:
> Hey there,
>=20
> Any chance the MSR[SF] mixed code issue fix gets addressed at some point ?
>=20
> (Apparently there was a fix but it was breaking some tests for some unkno=
wn
> reason)...

Sorry, I've forgotten this issue.  If you had a patch, can you resend
it please.

>=20
> --Ivan
>=20
> On 3/10/2021 5:09 AM, David Gibson wrote:
> > The following changes since commit b2ae1009d7cca2701e17eae55ae2d44fd22c=
942a:
> >=20
> >    Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20210=
307' into staging (2021-03-09 13:50:35 +0000)
> >=20
> > are available in the Git repository at:
> >=20
> >    https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210310
> >=20
> > for you to fetch changes up to eb7f80fd26d73e7e1af105431da58971b1dba517:
> >=20
> >    spapr.c: send QAPI event when memory hotunplug fails (2021-03-10 09:=
07:09 +1100)
> >=20
> > ----------------------------------------------------------------
> > ppc patch queue for 2021-03-10
> >=20
> > Next batch of patches for the ppc target and machine types.  Includes:
> >   * Several cleanups for sm501 from Peter Maydell
> >   * An update to the SLOF guest firmware
> >   * Improved handling of hotplug failures in spapr, associated cleanups
> >     to the hotplug handling code
> >   * Several etsec fixes and cleanups from Bin Meng
> >   * Assorted other fixes and cleanups
> >=20
> > ----------------------------------------------------------------
> > Alexey Kardashevskiy (1):
> >        pseries: Update SLOF firmware image
> >=20
> > Bin Meng (2):
> >        hw/net: fsl_etsec: Fix build error when HEX_DUMP is on
> >        hw/ppc: e500: Add missing <ranges> in the eTSEC node
> >=20
> > C=E9dric Le Goater (1):
> >        docs/system: Extend PPC section
> >=20
> > Daniel Henrique Barboza (11):
> >        spapr_drc.c: do not call spapr_drc_detach() in drc_isolate_logic=
al()
> >        spapr_drc.c: use spapr_drc_release() in isolate_physical/set_unu=
sable
> >        spapr: rename spapr_drc_detach() to spapr_drc_unplug_request()
> >        spapr_drc.c: introduce unplug_timeout_timer
> >        spapr_drc.c: add hotunplug timeout for CPUs
> >        spapr_drc.c: use DRC reconfiguration to cleanup DIMM unplug state
> >        spapr.c: add 'unplug already in progress' message for PHB unplug
> >        spapr_pci.c: add 'unplug already in progress' message for PCI un=
plug
> >        qemu_timer.c: add timer_deadline_ms() helper
> >        spapr.c: remove duplicated assert in spapr_memory_unplug_request=
()
> >        spapr.c: send QAPI event when memory hotunplug fails
> >=20
> > Fabiano Rosas (1):
> >        target/ppc: Fix bcdsub. emulation when result overflows
> >=20
> > Peter Maydell (3):
> >        hw/display/sm501: Remove dead code for non-32-bit RGB surfaces
> >        hw/display/sm501: Expand out macros in template header
> >        hw/display/sm501: Inline template header into C file
> >=20
> > Vitaly Cheptsov (1):
> >        target/ppc: fix icount support on Book-e vms accessing SPRs
> >=20
> >   docs/system/ppc/embedded.rst      |  10 ++
> >   docs/system/ppc/powermac.rst      |  34 +++++++
> >   docs/system/ppc/powernv.rst       | 193 +++++++++++++++++++++++++++++=
+++++++++
> >   docs/system/ppc/prep.rst          |  18 ++++
> >   docs/system/ppc/pseries.rst       |  12 +++
> >   docs/system/target-ppc.rst        |  53 +++--------
> >   hw/display/sm501.c                | 160 +++++++++++++++--------------=
--
> >   hw/display/sm501_template.h       | 131 --------------------------
> >   hw/net/fsl_etsec/etsec.c          |   1 +
> >   hw/net/fsl_etsec/rings.c          |   1 +
> >   hw/ppc/e500.c                     |   1 +
> >   hw/ppc/spapr.c                    |  67 ++++++++++++-
> >   hw/ppc/spapr_drc.c                | 110 ++++++++++++++++------
> >   hw/ppc/spapr_pci.c                |   8 +-
> >   hw/ppc/trace-events               |   2 +-
> >   include/hw/ppc/spapr.h            |   1 +
> >   include/hw/ppc/spapr_drc.h        |   7 +-
> >   include/qemu/timer.h              |   8 ++
> >   pc-bios/README                    |   2 +-
> >   pc-bios/slof.bin                  | Bin 968368 -> 968888 bytes
> >   roms/SLOF                         |   2 +-
> >   target/ppc/int_helper.c           |  13 ++-
> >   target/ppc/translate_init.c.inc   |  36 +++++++
> >   tests/tcg/configure.sh            |   6 ++
> >   tests/tcg/ppc64/Makefile.target   |  13 +++
> >   tests/tcg/ppc64le/Makefile.target |  12 +++
> >   tests/tcg/ppc64le/bcdsub.c        | 130 +++++++++++++++++++++++++
> >   util/qemu-timer.c                 |  13 +++
> >   28 files changed, 751 insertions(+), 293 deletions(-)
> >   create mode 100644 docs/system/ppc/embedded.rst
> >   create mode 100644 docs/system/ppc/powermac.rst
> >   create mode 100644 docs/system/ppc/powernv.rst
> >   create mode 100644 docs/system/ppc/prep.rst
> >   create mode 100644 docs/system/ppc/pseries.rst
> >   delete mode 100644 hw/display/sm501_template.h
> >   create mode 100644 tests/tcg/ppc64/Makefile.target
> >   create mode 100644 tests/tcg/ppc64le/Makefile.target
> >   create mode 100644 tests/tcg/ppc64le/bcdsub.c
> >=20
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JrTA29XVZfEQ4CAe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBJdqoACgkQbDjKyiDZ
s5Ky/BAAqrplhcWlPyVNxTSX75XXm7I9SAgZMUWQy8da03X/kM7wmouMGakt9mGT
fgXrgrVMMFudOfUTBSGFFjhFTaiHENWcbCKyNrWo6RAMWMMKsMoKTrwRnCI+tUZl
8P6TjUMOvAH9zKiIeFlW+oGXL04hkGBDXD1OlEhQRXBFyfZ1nrR+es/Hx13txBfk
SNbn4dgtY3oj3fdJNatySrCc8dnTUVROoSqq4fUvMNrP2Wuwz7JJKRESmd4R28BJ
sibC6WhW4ld+ZMpHsG1YuM3sD31BC8GZ9ywJDxiqFiae/v+VGZOY+ewP8iO7yBh2
L2a5B9nImvaVpFekW0eXD6ohtEDWg7cYfw3IwXYJKTGo7qnD258q/DUGT3CUGRMI
AuapgqIaqFsyReDWHThid1/rNYZQNSkExom+vdbZfVVaLPgu6Zgoy1yfeGh0WZjN
cvFWl9Em/q+4+i+xxVpNElQ6XlzN4Cmn0ul25mRwRDgwrB4Ve+K1rEpF1IFWoM28
WUrIRTmLinswi56yCJmP7Imt9oMBbS+iAm862hsD9prRqBDCoM1h1MP6RdinzbJv
KMPex8K7LtfWzM/SE1WdKNM/0Q6cQ6EZ2VMAtRWWddgQxM5zw4r0iXvkHCGaB4Kn
NFkvoEiTQ7sTKdCFcIWJq2TCVbCE5DV1bKP3znBn7N2uJApgkTA=
=48kF
-----END PGP SIGNATURE-----

--JrTA29XVZfEQ4CAe--

