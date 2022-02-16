Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12BE4B9591
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 02:39:53 +0100 (CET)
Received: from localhost ([::1]:49388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKVlw-00056M-8s
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 20:39:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVe9-0002c6-TV; Wed, 16 Feb 2022 20:31:50 -0500
Received: from [2404:9400:2221:ea00::3] (port=44793 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVe6-0002QI-G4; Wed, 16 Feb 2022 20:31:49 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jzck42cPQz4xn3; Thu, 17 Feb 2022 12:31:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1645061500;
 bh=OHDCt9guNI9YA0jknvNWyNTMz7540taes3wkxbtIIEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cv1Q9Uo6m1931sVF0YyDRXQ25VG8byLdWuX1kA2JVrz0lFqcpllVW9S2mvmpQ8d8X
 izj/pbnZ1we/TRs3zR5JMi1SvMHM2lf4VLft4O14apBjAD7MyqSxqRTTHlt0wv16I/
 e/qQkiiqj+nVv894mAbKplwoB3eAf8tCQ1i2qFHk=
Date: Thu, 17 Feb 2022 10:41:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 22/27] target/ppc: cpu_init: Rename register_ne_601_sprs
Message-ID: <Yg2Lj+8LrMHQFNVU@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-23-farosas@linux.ibm.com>
 <Ygxog9Ngz0bvn8gO@yekko> <87a6erx82b.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MlZa9vjdr+sDe9um"
Content-Disposition: inline
In-Reply-To: <87a6erx82b.fsf@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MlZa9vjdr+sDe9um
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 10:19:40AM -0300, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Tue, Feb 15, 2022 at 06:41:43PM -0300, Fabiano Rosas wrote:
> >> The important part of this function is that it applies to non-embedded
> >> CPUs, not that it also applies to the 601. We removed support for the
> >> 601 anyway, so rename this function.
> >>=20
> >> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> >
> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> >
> > Although, I wonder if "books_common" or something might be a better
> > name, though.  Admittedly, I don't think the "BookS" terminology
> > existed at the time of most of these earlier CPUs.  However, these
> > days the majority of 7xx chips are probably in embedded applications,
> > even if they weren't designed for an embedded chip line.
>=20
> The 'ne' in the original name was probably meant to signify
> not-BookE. So non_booke perhaps would work? The thing with calling it
> books_common is that we're using BookS only for the 970 and upwards and
> this function applies to 6xx, 7xx, 74xx as well.

So, an informal server / embedded split is older than the "Book S"
vs. "Book E" terminology, so it's a question of whether we want to
apply the newer terminology to the older systems.  As you say, that's
arguably problematic for BookS, but it's equally troublesome for "not
BookE": 40x and possibly 44x as well also predate the "Book E"
terminology (and certainly don't meet even the earliest version of the
Book E spec).  However they are from the "embedded" branch of cpu
models, and do not have the registers that the ne_601 function
creates.

Naming things is hard :/.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MlZa9vjdr+sDe9um
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmINi4gACgkQgypY4gEw
YSLsCxAAyhb+ysvXRbtvnN1DNJGfLoQr+fJ//Ip/Z5lKqI1CihqiidyWjeACAFcn
du5jFiH8D6dLiZGd+lkieyy7oPrB2nf7tZ7RaJZN9F4Sr2s/NzKbZSCSpSwjWzwW
Kp6uhBU6fn9FwKKT9lRpZ/ohNUm/ZfgBezFIrBnn7Vvv23q1eIeQk7y34QOqPAcO
NUj/eotTat+M9Kp1uw1zhckXA/42hiO9TXKzmrcIOhg2AkWmK2sPjormpLUC5Y1v
xA8ZM8j8XgyvHFymSzbXXpXU+3/gGsJnuvken5fRUbRa/YneFklThaQCd4+uxz9+
0Xa8Pn4Pfm4B4B9PKVy122hIf51NXIif/Vv5Zn5WrqZg/7mWdkClYt19gvzZRIyS
w+BD+6+b4BgIEfddXwocVP5z5RO8LNW0ChbiO1kNjoc1R/lbbLbXgUNkppKKe93U
c4yKYEtFXBOWTv4zxR3y2O2l7TFGRFWcNEDqfzKCxk7zpuPUifXMQF0FlT8opBer
EUyuXAWz2fI9Z+ra0te+yj3T6CPJcShj5VPqRnJh4WVJIAdOT5hiF+b2N/rH6km8
1aVVebAMLXxi5OZx1iTJOfHVPZnDJiXURPyoM2Dmi6xP2+H9ucOS0IdnpyVJS2lw
3GGUPdFioVbHeShBhmQlDeFW7s7/s5cDIztehYG3EEwzmkJIO3Q=
=t7Xn
-----END PGP SIGNATURE-----

--MlZa9vjdr+sDe9um--

