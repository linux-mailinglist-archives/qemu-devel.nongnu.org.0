Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B127448A5B7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 03:35:47 +0100 (CET)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n770k-00015M-IH
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 21:35:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76wq-0006FD-95; Mon, 10 Jan 2022 21:31:44 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=47521
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76wk-0000yq-FE; Mon, 10 Jan 2022 21:31:42 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JXvpB18rFz4xQq; Tue, 11 Jan 2022 13:31:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641868290;
 bh=Nv/SUXOpFnT9pTsos2Ek/i7NX6oKTJJoaM8jgqdlG+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TTI/V3OrhjxMJPakd/91P5/fm66zfmh6mZ5bH0M4Tf5rLkSNpupyHayFbtuuJLPsG
 zBdaCfD/UpQn8pLfkQk23mII/bOVW09K0I+5nAbC78pHKIagLjSY7UXncGilYCjoRE
 xnZk/0nPpjGdmjmSX3NGnRYWHjRtx600K5b3HVyE=
Date: Tue, 11 Jan 2022 13:07:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 1/8] target/ppc: 405: Add missing MSR bits to msr_mask
Message-ID: <YdzmepZtTxm9Qap+@yekko>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-2-farosas@linux.ibm.com>
 <Ydzlnpk8GgUBs5ZY@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fJGEwprOIBCwjV/0"
Content-Disposition: inline
In-Reply-To: <Ydzlnpk8GgUBs5ZY@yekko>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fJGEwprOIBCwjV/0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 01:04:14PM +1100, David Gibson wrote:
> On Mon, Jan 10, 2022 at 03:15:39PM -0300, Fabiano Rosas wrote:
> > Some bits described in the user manual are missing from msr_mask. Add
> > them.
> >=20
> > Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> > ---
> >  target/ppc/cpu_init.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > index e30e86fe9d..a50ddaeaae 100644
> > --- a/target/ppc/cpu_init.c
> > +++ b/target/ppc/cpu_init.c
> > @@ -2535,15 +2535,19 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
> >                         PPC_MEM_SYNC | PPC_MEM_EIEIO |
> >                         PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
> >                         PPC_4xx_COMMON | PPC_405_MAC | PPC_40x_EXCP;
> > -    pcc->msr_mask =3D (1ull << MSR_POW) |
> > +    pcc->msr_mask =3D (1ull << MSR_AP) |
> > +                    (1ull << MSR_POW) |
>=20
> If I'm looking at things correctly, the "MSR_POW" bit on 405 is
> actually called "MSR_WE", which appears related, but not quite
> identical.  I think it would be good to introduce a new define to get
> it a name matching the user manual.

Also, it looks like this is still missing the MSR[APE] bit (in the
same place as the MSR_KEY bit on 603e).

> >                      (1ull << MSR_CE) |
> >                      (1ull << MSR_EE) |
> >                      (1ull << MSR_PR) |
> >                      (1ull << MSR_FP) |
> > +                    (1ull << MSR_ME) |
> >                      (1ull << MSR_DWE) |
> >                      (1ull << MSR_DE) |
> > +                    (1ull << MSR_FE1) |
> >                      (1ull << MSR_IR) |
> >                      (1ull << MSR_DR);
> > +
> >      pcc->mmu_model =3D POWERPC_MMU_SOFT_4xx;
> >      pcc->excp_model =3D POWERPC_EXCP_40x;
> >      pcc->bus_model =3D PPC_FLAGS_INPUT_405;
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fJGEwprOIBCwjV/0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHc5noACgkQbDjKyiDZ
s5LecQ//Qh/kShBlTN3EW+sFi67UIVw67iZuA1U+y0GAtiN5W89ePNG+1kD0M9ZB
FIbawxWvNm7QrKnFSF2RCTLPO34OYEb7PxuBo8M1qycacO6A00yIsrxuHuMvk1kd
FMrUx2i5YZQIJPh1wW/Oj5tu2kubEFr0gaH8Oo2B4BF1CXnP85JbYa0kvj2we+lZ
7j+0JdWkrPd+jRizzK3SAJWCAcUgeF87ZhY7zlWih8ZkadkF+NG/Vd3i0rIFbey3
2xxJXlujPWlPWbRUOUYbkxl6AsYKm1A7Etyr9MeJ7zrPiGL/Fpv5kcLk3tNqBF2z
Egqg8gbZnSN0rmW7GyKFgKh9M/PD6aTA5UB59oqGRRZnw3TDlmY8fWcnqKx3V7fp
CnoGrn74aEB+8xKDEz/23nyQ78pZQLGqIunY0Q8GEsTpslKG33uvn7dSP0xdP+Xi
EqdlZvG9NAUt1AUCXdrgrQ6m7bK3hTF5okgBmY9fpPCWEHWmW4uLPZFzIuY7zxWT
AywBP6J7FYiy7OSvq0VmoGg0GAoPwlTHyrjAqKD78LC9J7e9EAPqYE7a0RLPku60
08LBaMryPIgX73M3ePn9wZo/BT9z+kPE+kwmnaFNMHN22ko4szLEaaYS59jPriaG
hToqKdH943I8btTAIc4dhObBIIfKKXJ4+kUXRL4bESogL5QsTfw=
=dGbo
-----END PGP SIGNATURE-----

--fJGEwprOIBCwjV/0--

