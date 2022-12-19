Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D759D65079E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 07:37:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p79kw-0005TR-W8; Mon, 19 Dec 2022 01:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1p79kt-0005TA-TJ; Mon, 19 Dec 2022 01:36:07 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1p79kn-0002xo-I7; Mon, 19 Dec 2022 01:36:07 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Nb92G3WTrz4xZj; Mon, 19 Dec 2022 17:35:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1671431750;
 bh=EX0x0CImKdd80LC2iuJUjAqFdwrJpRkrKIYcx3G4TII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J1L0RESnqrRxa7+6BNyXOJOuWePTdx7jR1LHEfAvRzZlsYribx4zJDA0iPBORrFxM
 YSfF9WAqAyA0sTeK/MUpYzoFO2OrZTAzu91dQmOIXnEAN9qiAqX+w0FKz4q9I0CIGJ
 xY+9980XTZe9CLLENP66g+k+c5VkuPkoXYhhWd+8=
Date: Mon, 19 Dec 2022 17:31:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowang@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
Message-ID: <Y6AFLpDEkpS+muSJ@yekko>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
 <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EHuwQJ6agEzxSn4X"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--EHuwQJ6agEzxSn4X
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2022 at 09:39:19PM +0000, Peter Maydell wrote:
> On Fri, 16 Dec 2022 at 19:11, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
> >
> >
> >
> > On 12/13/22 10:51, Peter Maydell wrote:
> > > On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daud=E9 <philmd@linaro=
=2Eorg> wrote:
> > >>
> > >> The tswap64() calls introduced in commit 4be21d561d ("pseries:
> > >> savevm support for pseries machine") are used to store the HTAB
> > >> in the migration stream (see savevm_htab_handlers) and are in
> > >> big-endian format.
> > >
> > > I think they're reading the run-time spapr->htab data structure
> > > (some of which is stuck onto the wire as a stream-of-bytes buffer
> > > and some of which is not). But either way, it's a target-endian
> > > data structure, because the code in hw/ppc/spapr_softmmu.c which
> > > reads and writes entries in it is using ldq_p() and stq_p(),
> > > and the current in-tree version of these macros is doing a
> > > "read host 64-bit and convert to/from target endianness wih tswap64".
> > >
> > >>   #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i)=
 * 2))
> > >> -#define HPTE_VALID(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE6=
4_V_VALID)
> > >> -#define HPTE_DIRTY(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE6=
4_V_HPTE_DIRTY)
> > >> -#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &=3D tswap64(~HP=
TE64_V_HPTE_DIRTY))
> > >> -#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |=3D tswap64(HPT=
E64_V_HPTE_DIRTY))
> > >> +#define HPTE_VALID(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & H=
PTE64_V_VALID)
> > >> +#define HPTE_DIRTY(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & H=
PTE64_V_HPTE_DIRTY)
> > >> +#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &=3D cpu_to_be64=
(~HPTE64_V_HPTE_DIRTY))
> > >> +#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |=3D cpu_to_be64=
(HPTE64_V_HPTE_DIRTY))
> > >
> > > This means we now have one file that's accessing this data structure
> > > as "this is target-endian", and one file that's accessing it as
> > > "this is big-endian". It happens that that ends up meaning the same
> > > thing because PPC is always TARGET_BIG_ENDIAN, but it seems a bit
> > > inconsistent.
> > >
> > > We should decide whether we're thinking of the data structure
> > > as target-endian or big-endian and change all the accessors
> > > appropriately (or none of them -- currently we're completely
> > > consistent about treating it as "target endian", I think).
> >
> > Yes, most if not all accesses are being handled as "target endian", even
> > though the target is always big endian.

So "target is always big endian" is pretty misleading for POWER.  We
always define "TARGET_BIG_ENDIAN" in qemu, but for at least 10 years
the CPUs have been capable of running in either big endian or little
endian mode (selected at runtime).  Some variants can choose
endianness on a per-page basis.  Since the creation of the ISA it's
had "byte reversed" load and store instructions that let it use little
endian for specific memory accesses.

Really the whole notion of an ISA having an "endianness" doesn't make
a lot of sense - it's an individual load or store to memory that has
an endianness which can depend on a bunch of factors.  When these
macros were created, an ISA nearly always used the same endianness,
but that's not really true any more - not just for POWER, but for a
bunch of targets.  So from that point of view, I think getting rid of
tswap() - particularly one that has compile time semantics, rather
than behaviour which can depend on cpu mode/state is a good idea.

I believe that even when running in little-endian mode, the hash page
tables are encoded in big-endian, so I think the proposed change makes
sense.

> > IIUC the idea behind Phil's cleanups is exactly to replace uses of
> > "target-something" if the endianess of the host is irrelevant, which
> > is the case for ppc64. We would then change the semantics of the code
> > gradually to make it consistent again.
>=20
> I would be happier if we just did all the functions that read and
> write this byte array at once -- there are not many of them.
>=20
> thanks
> -- PMM
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EHuwQJ6agEzxSn4X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmOgBScACgkQgypY4gEw
YSK5gBAAjCGmdukmBefpm4exjTozcWBi3AUat8xSQBv4I1pA4z84J5G2/wJo3XfG
5Q3LTWpevTFFX7vbT9Ql8jC9N/e0Tmlhxn6g3lFWXO7AVzJXncstxL8CiWOzUBWo
v1W9A6AY5WFJMuwNVXySko4kICWBi5eb5tONSiOYi2ZVTHyLqBatPqXmPxL/ZLmm
hjN5bzhsESxEVQ4HZT6WZ2gQShZX6h8YNmrkh4HFOOTHtSHnFoZcX8PBTZy30vfR
H6WD3O2hGsOnraknGA46FTxtQg2Sc6cAksRZDPWrP+NIetIdwV+YSM31zfS71hbr
KZPjoG7w9anbN6Yaw2hysa/oCf4a5NNaoyCnVglszejXSc2C7MGN6YS/L75lEnMg
IqeaMv9LOA/kHxTYd0k0H3fvDvR4IoVPgdgOVX2vHQ0k64twn5GYJltTTzQUZcX5
JqZUNj6FFZs67OHfzeB2nk0dY5qtDUl+W6nvLnBBSmO/TSWb1aPlELK3H8Zp5A7K
cGNfUd5bjSfX+iTq7nOci2jO/oSJC7lenpgRFaq5TdCQARoSddYfhMlKgOm24lvQ
23hFYSlftmGplGc6+i556WUwh1BxRqcjt3Mk/H8jSF0bvdfkl8cqfpHqNdy74O4+
+uKyM03LYrQOME+//cBJ1H6xURvVfvgom/jZVGpQgDF14WSrnlI=
=OJSU
-----END PGP SIGNATURE-----

--EHuwQJ6agEzxSn4X--

