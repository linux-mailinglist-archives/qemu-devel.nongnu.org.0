Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34003E507D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 03:03:07 +0200 (CEST)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDGAb-0004sp-S3
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 21:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDG6s-0003AC-F5; Mon, 09 Aug 2021 20:59:14 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:57917 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDG6p-00083B-TX; Mon, 09 Aug 2021 20:59:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkF2f1vrDz9tjw; Tue, 10 Aug 2021 10:59:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628557146;
 bh=UcxMu/iPtID5Z0Pw0L1Pm9Gqy7oONcjhrKnXH3oqr7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m+bo1FCsCD6TclJgFjhhfyrlj5VYCXkRw1fXFGs6Jh48byibyzP4+qeHcwX3AcfbR
 TWBYnMzRKN1vFsVmV3Ssh/stX2wicNzAHK7Ng2SJCHn2fj5GnkmK1V19aW5lAXNbyc
 vctI5jerizupVsljzlxRLTEZAIjtshValG4D6Q7U=
Date: Tue, 10 Aug 2021 10:56:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] xive: Remove extra '0x' prefix in trace events
Message-ID: <YRHOv3siLEqQuSBB@yekko>
References: <20210809085227.288523-1-clg@kaod.org>
 <e546f365-b941-ccda-8ba9-24aadb12da3b@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bDF+Z4T4zqQ9aqPa"
Content-Disposition: inline
In-Reply-To: <e546f365-b941-ccda-8ba9-24aadb12da3b@amsat.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-devel@nongnu.org, thuth@redhat.com, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bDF+Z4T4zqQ9aqPa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 11:39:49AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 8/9/21 10:52 AM, C=E9dric Le Goater wrote:
> > Cc: thuth@redhat.com
> > Fixes: 4e960974d4ee ("xive: Add trace events")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/519
> > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > ---
> >  hw/intc/trace-events | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> > index e56e7dd3b667..6a17d38998d9 100644
> > --- a/hw/intc/trace-events
> > +++ b/hw/intc/trace-events
> > @@ -219,14 +219,14 @@ kvm_xive_source_reset(uint32_t srcno) "IRQ 0x%x"
> >  xive_tctx_accept(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pi=
pr, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=
=3D0x%02x CPPR=3D0x%02x NSR=3D0x%02x ACK"
> >  xive_tctx_notify(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pi=
pr, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=
=3D0x%02x CPPR=3D0x%02x NSR=3D0x%02x raise !"
> >  xive_tctx_set_cppr(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t =
pipr, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=
=3D0x%02x new CPPR=3D0x%02x NSR=3D0x%02x"
> > -xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@=
0x0x%"PRIx64" IRQ 0x%x val=3D0x0x%"PRIx64
> > -xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "=
@0x0x%"PRIx64" IRQ 0x%x val=3D0x0x%"PRIx64
> > +xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@=
0x%"PRIx64" IRQ 0x%x val=3D0x%"PRIx64
> > +xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "=
@0x%"PRIx64" IRQ 0x%x val=3D0x%"PRIx64
> >  xive_router_end_notify(uint8_t end_blk, uint32_t end_idx, uint32_t end=
_data) "END 0x%02x/0x%04x -> enqueue 0x%08x"
> >  xive_router_end_escalate(uint8_t end_blk, uint32_t end_idx, uint8_t es=
c_blk, uint32_t esc_idx, uint32_t end_data) "END 0x%02x/0x%04x -> escalate =
END 0x%02x/0x%04x data 0x%08x"
> > -xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value)=
 "@0x0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
> > -xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) =
"@0x0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
> > +xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value)=
 "@0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
> > +xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) =
"@0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
> >  xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring)=
 "found NVT 0x%x/0x%x ring=3D0x%x"
> > -xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr)=
 "END 0x%x/0x%x @0x0x%"PRIx64
> > +xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr)=
 "END 0x%x/0x%x @0x%"PRIx64
> > =20
> >  # pnv_xive.c
> >  pnv_xive_ic_hw_trigger(uint64_t addr, uint64_t val) "@0x%"PRIx64" val=
=3D0x%"PRIx64
> >=20
>=20
> Acceptable for 6.1 IMHO.

Acceptable for, but also not vital for.  I've applied this to
ppc-for-6.1, but I'll probably only bother sending a PR if some more
crucial fixes come along.

>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bDF+Z4T4zqQ9aqPa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmERzr0ACgkQbDjKyiDZ
s5KZ2A/+L135wtUOiEnvAlYAWZFu4m01BZg1+Y7GgdxpaAVGwbLo4XAEOTtFCEUA
1gD23QKRNbz0BKZrbq5OtpFk7mXdI6zHIH7ienhT0YIwzFt9L6j2KvYIt9ZfBcjY
6TM7lILVzfe74BVfhhEYjlXX2wTh5mOmHiFVu1ec/gIYSbtDaj04jVIrlEIov5WY
l3iOZH50TzeA0hPiwueXXsTiAOmq9i4pNHE2/s1REEPlWOtlvdOcKiMpWmjPOJZ8
6SrsqIXdDwt7r26xOcWvcUQyhCAkVA4P/Snq+KQyt5vuvVzM4EfIGIRZXmaPmaUT
cCpVclRw19XRUekkB9QuSCMmehSzW1fl9dnT446PpY/O9ZdmLco7udI19GvQcPxI
HnU4h60jOfosi/ox5vjRkixCq9T9rfTcwnHl/4XzUk6bZm+8CIJRNGvqNffXpkMa
yXyhl8/NiK5U09Z2cOxstYFC5uht3hUm4vRrGsSvpn/UIw3h/a56AhVPmLT7LteT
E/Sv0mihwuq61ontSsDJ94aPrdi5YkS0Qto4LY7qCO+yf0Kw/TJkIYI613wd3iJO
z0CYJYkRhIGro8agJ4F/GDnCH6qNIQo6MRxBTfkjH+i+WdIpZc2lLLOaU46YaZ6k
QgAffK1Ft07QkgPPGvmVUxMu/ipwQFFTs2LHbaXUhwZ1ScStrek=
=Po6R
-----END PGP SIGNATURE-----

--bDF+Z4T4zqQ9aqPa--

