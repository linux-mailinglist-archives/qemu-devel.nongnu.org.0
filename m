Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BF349224C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:11:54 +0100 (CET)
Received: from localhost ([::1]:60060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kWv-0005dA-BM
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9kFC-0003P6-LF; Tue, 18 Jan 2022 03:53:34 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:50493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9kF9-0001Gs-It; Tue, 18 Jan 2022 03:53:34 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JdMxf0fMDz4y3q; Tue, 18 Jan 2022 19:53:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642496006;
 bh=UdwYbaUdhTWzhL7nHo5L+wTTNfAFYJcR/In2DqLvWN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bCpKhpMXuvaf3LU5TnpBXmd2pLDcFt6uOiFkG8gIWEZrTX/+WFFc3CO5tH9zJ0pq5
 z3+HeQp8gT0a6L4ptULwCoZTkz9PfKy3v+FsEKIE+YZtbcIGvzTSRYnq+f0VgOZFf0
 GzB7kuF1Q2F5Kt0oiBOCdOyPuHyPs1b033Gr7D7E=
Date: Tue, 18 Jan 2022 19:40:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 1/8] target/ppc: 405: Add missing MSR bits to msr_mask
Message-ID: <YeZ88ETiPZz9SSfr@yekko.fritz.box>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-2-farosas@linux.ibm.com>
 <87iluivzgr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f0RQhBKl7lOXnX02"
Content-Disposition: inline
In-Reply-To: <87iluivzgr.fsf@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--f0RQhBKl7lOXnX02
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2022 at 06:12:20PM -0300, Fabiano Rosas wrote:
> Fabiano Rosas <farosas@linux.ibm.com> writes:
>=20
> > Some bits described in the user manual are missing from msr_mask. Add
> > them.
> >
> > Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> > ---
> >  target/ppc/cpu_init.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
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
>=20
> This patch brings an unexpected complication:
>=20
> MSR_AP here is not correct, it is defined as:
>=20
> #define MSR_AP   23 /* Access privilege state on 602 */
>=20
> That is bit 8. While MSR_AP in the 405 is bit 6. So I would need to

Uh oh...

> introduce a new MSR_AP_405 defined as:
>=20
> #define MSR_AP_405   25 /* Auxiliar processor available on 405 */
>=20
> But 25 is the same as MSR_SPE, so it triggers this code in
> init_ppc_proc:
>=20
>     /* MSR bits & flags consistency checks */
>     if (env->msr_mask & (1 << 25)) {
>         switch (env->flags & (POWERPC_FLAG_SPE | POWERPC_FLAG_VRE)) {
>         case POWERPC_FLAG_SPE:
>         case POWERPC_FLAG_VRE:
>             break;
>         default:
>             fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>                     "Should define POWERPC_FLAG_SPE or POWERPC_FLAG_VRE\n=
");
>             exit(1);
>         }
>      ...

Ah.  Which suggests this section itself should probably be taken out
of the common path and moved to code specific to the cpu families with
SPE.

> The commit that introduced that sanity check is 25ba3a6812 ("Remove
> synonymous in PowerPC MSR bits definitions..."), which sort of assumes
> that MSR bits will not have different purposes between any of the (now
> 47) CPUs, while itself leaving other duplicated bits around.

Ah, oops.  Even in 2007 I could have told you that wasn't a safe
assumption.  Oh well.

> So my idea is to drop this patch and only include the MSR_ME that is of
> practical effect at patch 6. I think going into the rabbit hole of
> disambiguating MSR bits falls out of the scope of the exception series.

That seems fair for the time being.  I suspect splitting the exception
paths will make cleaning up MSR collisions like this easier.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--f0RQhBKl7lOXnX02
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHmfOgACgkQgypY4gEw
YSJ9JxAAolBIgEp8kAVs3RQtkqC2hDcsZFLx96Jq+/R9FRFj4n02To0sJoOZHSQ2
vcZRxAe/E7SRE9q01/xoCX+U60Bq3T0K2wo6RZ0Q8JK5R3ZrR4rXBzMI9UWHjVME
evoo8bnWOojaOBqYGP5HtPzCvYVF8vHoRKkncmrJk8qoS6I1C4hx5xgJ6veSTU4k
A550EAmL93IuRQNF2aB5m3ZURQBUhNT0p0cvYXTHWjZEX0Fczrh0CXYDHUW6e2Lf
TlRDw32NdbJbWLeoZYYL0Mj6CJfK4ITksimVnmpOoAt/VdvtsmA0JP/HcQ1MHTPf
KQSpgz6dMac2KHdFQV53ik9YezyWTBZb/z+CC9ZN17OnoOV1nlUOGqrkmcnKSCAS
hZz3e8FCM1F+uvXZ50YwsFQO68hLldSKhRtTjJti+UJHK9rpeDY37ZC4t6+LIt8p
nbQUE86Yhfk8F9L6z8RE8sjZU8CYBKhgPgOm2MzIxyB7b5BIuU9qZl50UCJ1UcdO
BUSzRAD8XzOTv7NRj0IEWzfjXsjRtZL5CBXdn5TqQI5nyBKbARhm59RMuAZQa/E0
XdOHuNdR1K1hzsaaxaj7NMHbkEdTcdLYZ+S2ICjVAeKc1anctSmOpy5Dgmnc5bPR
XtZt0klivibmaJr/XOjoA6rYUGatveJeA6fEEnk/1JgW5wWunek=
=h2cW
-----END PGP SIGNATURE-----

--f0RQhBKl7lOXnX02--

