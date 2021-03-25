Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166423486C5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:02:53 +0100 (CET)
Received: from localhost ([::1]:53084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPFKm-00056D-4x
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPFIm-0003iH-BI; Wed, 24 Mar 2021 22:00:48 -0400
Received: from ozlabs.org ([203.11.71.1]:41213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPFIk-0003CE-DG; Wed, 24 Mar 2021 22:00:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F5SxQ0yLvz9sWS; Thu, 25 Mar 2021 13:00:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616637642;
 bh=1F7Gmfmu5IkHBP6WzMO0br3YHiL8j3PWBnCDKlLsa1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nZDEISFaqyEzfBMyecYZQpr0hd+2W4ZmsbvvQnME67Y85Amqh+RhiIMOYfO+yM6Qt
 xEi6cQ+nU0uDM7oDM9p9C2fKviqrxXafspNZxbzbFlu9Om4crClKSS3fSSEi7vy6r1
 JhM8x8cJzb8GTorXANb7D0W6tRupXm5JtyluAdpc=
Date: Thu, 25 Mar 2021 12:56:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v10 6/7] hw/pci-host: Add emulation of Marvell MV64361
 PPC system controller
Message-ID: <YFvtwv4XzwdvtsNi@yekko.fritz.box>
References: <cover.1615943871.git.balaton@eik.bme.hu>
 <ed5661ffa159546a8f9816316345906f33b12b2d.1615943871.git.balaton@eik.bme.hu>
 <YFk5GcVCLGKDSHyQ@yekko.fritz.box>
 <265d13b0-6f3e-fa51-30fb-36a88188cb3@eik.bme.hu>
 <YFqah3YX0rbZFkEO@yekko.fritz.box>
 <bdd91d23-53e5-5335-63ab-ce8b6dcd8d4@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UFs1GWDpCOjTvkDO"
Content-Disposition: inline
In-Reply-To: <bdd91d23-53e5-5335-63ab-ce8b6dcd8d4@eik.bme.hu>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UFs1GWDpCOjTvkDO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 12:11:50PM +0100, BALATON Zoltan wrote:
> On Wed, 24 Mar 2021, David Gibson wrote:
> > On Tue, Mar 23, 2021 at 02:31:07PM +0100, BALATON Zoltan wrote:
> > > On Tue, 23 Mar 2021, David Gibson wrote:
> > > > On Wed, Mar 17, 2021 at 02:17:51AM +0100, BALATON Zoltan wrote:
> > [snip]
> > > > > +static void setup_mem_windows(MV64361State *s, uint32_t val)
> > > > > +{
> > > > > +    MV64361PCIState *p;
> > > > > +    MemoryRegion *mr;
> > > > > +    uint32_t mask;
> > > > > +    int i;
> > > > > +
> > > > > +    val &=3D 0x1fffff;
> > > > > +    for (mask =3D 1, i =3D 0; i < 21; i++, mask <<=3D 1) {
> > > >=20
> > > > Having a loop, where nearly the entire body is a switch over the lo=
op
> > > > variable seems a rather odd choice to me, compared to just unrolling
> > > > the whole thing.  Or alternatively, maybe more can be be factored o=
ut
> > > > of the switch into common body code.
> > >=20
> > > The loop is really over the bits in val that say which memory regions=
 to
> >=20
> > I see that, but it doesn't change the point.
> >=20
> > > enable so depending on this we need to touch different mem regions. F=
or
> > > selecting those memory regions and what to do with them a switch seem=
s to be
> > > obvious choice. I probably can't factor out anything as these lines in
> > > switch cases are similar but all differ in some little details (like =
which
> > > PCI bus, name of the region, etc.). Unrolling could be possible but w=
ould
> > > just add lines between cases that's now in the loop head so I really =
don't
> >=20
> > I see only 2 common lines, which basically balances about the case and
> > break lines in every switchcase.
>=20
> Not sure what you mean by that. To me that means that these cannot be
> factored out as they are in the middle so can't put them neither before n=
or
> after the switch (without adding more local variables that would just make
> the result longer than it is now).

I'm saying that I don't think unrolling would actually make things
longer, because the small amount of duplication would balanced by
removing the switch boilerplate.

> Does that mean you prefer this to be unrolled then (written without a for
> just repeating the if ((val & mask) !=3D (s->base_addr_enable & mask)) at
> every case)? That would also be longer by about 20 lines as we also log
> regions that are not in the switch that would need their enable bits chec=
ked
> separately if it's unrolled. Basically the trace is the common part of the
> loop and handling of the individual regions are branching out from the
> switch as they are different enough that factoring out the common parts is
> not shorter than this way due to then needing local variables to hold the
> different parts (name, address, size, base) the assigning of which are as
> many or more lines than the map_pci_region call that could be factored out
> that way.
>=20
> I don't see why it is a problem to have a switch in a loop. If you insist=
 I
> can try to turn the switch into if else but I don't see how would that be
> any better. Please explain a bit more what would you prefer here as I'm n=
ot
> sure what to do with this. To me this is the shortest and simplest way to
> write this.

Hmm... you know, it still seems kinda weird to me, but I am getting
too hung up on details here.  It's good enough, go with it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UFs1GWDpCOjTvkDO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBb7cIACgkQbDjKyiDZ
s5I5UxAA1cc/+Tsl5hjPLzv4f45svM8hvZJkYNGShyZhUrpbYU+Dw+oV8kgloGlH
pCw5OYDki0SAH6yiOHM9eKZ22gWZPYbRvtDxoRQY3cDQFrvnLc35NCVyTIpl6zUj
iaGNu5J1VKdva9JEuA3bBHR0TC7VMY2U+ymAlHA36mR4vSanBri8p5fahftV/ZJz
1bTQobL8im/sACfUqHzjyWlwxH1sAWHVVP++/RgSL7xvZCrv7X4ghat6GkdSjiF3
fKQ3TrqwijtoH3SP2TSFyNcNbbsXBJi4VGQg3Ogh+z99o4Z6eyI0+KnMGqNUDg1s
L9p2HVhjZ765xSyVdQVOxQIuenpdlHxFd/QA+kh3nzRR6HvcxdmkJWXqGvs3Kgyj
Y0oCUTzbdCnwY0cj3pLi1mXJjQ4VJH7MO1aSOBFLGCX0z94HU320RfTFABbhQSWs
ERizgPWp08B6xK3eY+n67DjDqiwpZN+jlaFX/CoFWgHFR0kXADLrcqcCyRRFfCp6
i4ly2zbKmdH6VLi9il9latfgT9ttkJ6v8P1ONgBXruWWk45NlkBbsnwmjUMHzABm
z22OSA5elrHVWh0Z+RVR/heMbpTjWJw3//a4NmtaJqrRYYdbrPpQG4j65HDabq7x
+Dw4bEVhm5gKrmU3VWtKE5r6RbmdD77XK3RiirZdpI86VOp63k8=
=uVWx
-----END PGP SIGNATURE-----

--UFs1GWDpCOjTvkDO--

