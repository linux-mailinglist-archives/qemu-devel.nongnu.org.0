Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C3E216837
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 10:21:13 +0200 (CEST)
Received: from localhost ([::1]:46494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsiql-0008NB-M1
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 04:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jsipa-0007RB-Ta; Tue, 07 Jul 2020 04:19:58 -0400
Received: from ozlabs.org ([203.11.71.1]:59293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jsipV-00075m-Ri; Tue, 07 Jul 2020 04:19:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4B1FjC56hPz9sRR; Tue,  7 Jul 2020 18:19:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1594109983;
 bh=6/Il+TlqSnpwnEGOWdR7MVJ//AxF1lGVeuL5fuX7Pk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GnNfqOhw0ULaSirJ/zYhA7ofI4XS+4DRZ7wKatPUYzE/UCG8Gg/veutvaW8oDydpq
 Ua0GA64vdtQwsicBN1O+1j9PYMQej+62SYfcSVjPhYXIJXnH7rX24seNvfzfTLt77Q
 Dihqoh2EJCurokSS5XsW/E+3xVv6DtiUyN/YUbjY=
Date: Tue, 7 Jul 2020 18:19:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/2] tpm: tpm_spapr: Exit on TPM backend failures
Message-ID: <20200707081916.GA18595@umbus.fritz.box>
References: <20200707040522.4013885-1-stefanb@linux.vnet.ibm.com>
 <20200707040522.4013885-2-stefanb@linux.vnet.ibm.com>
 <aa63c5f3-308e-59e1-11ff-0e0d923658e8@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <aa63c5f3-308e-59e1-11ff-0e0d923658e8@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 04:19:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2020 at 06:20:49AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Stefan,
>=20
> On 7/7/20 6:05 AM, Stefan Berger wrote:
> > Exit on TPM backend failures in the same way as the TPM CRB and TIS dev=
ice
> > models do.
>=20
> Maybe the other models are not the best examples ;)
>=20
> >=20
> > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > ---
> >  hw/tpm/tpm_spapr.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
> > index cb4dfd1e6a..8288ab0a15 100644
> > --- a/hw/tpm/tpm_spapr.c
> > +++ b/hw/tpm/tpm_spapr.c
> > @@ -306,7 +306,10 @@ static void tpm_spapr_reset(SpaprVioDevice *dev)
> >                              TPM_SPAPR_BUFFER_MAX);
> > =20
> >      tpm_backend_reset(s->be_driver);
> > -    tpm_spapr_do_startup_tpm(s, s->be_buffer_size);
> > +
> > +    if (tpm_spapr_do_startup_tpm(s, s->be_buffer_size) < 0) {
>=20
> I don't see error reported, how users can know the cause of the exit?
>=20
> > +        exit(1);
>=20
> What about using this instead?
>=20
>            qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);

Hrm.  I'm not entirely convinced that's what we want.  But we
definitely need some sort of error reported.

>=20
> > +    }
> >  }
> > =20
> >  static enum TPMVersion tpm_spapr_get_version(TPMIf *ti)
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8EMAQACgkQbDjKyiDZ
s5LAXg/+OPtuqXVIYUe222ujcmRBcIAyCufIz7x9ak4Zk8bMWfbGnQpfLvNnaEaX
D+wKp4DiWV+EpYUbnaPYyKuuR1C6Tjy+QdxNDh8xYTQDM4yJPwqe4WE51kkH0Vlg
ItdLig/ztQ4PpsvdAyGAQMviD27PPmGTQB2QQIt0Xy9nzC+d78wtHoA0O0bjEJBg
ZYGZzsbVufUkPdCTf4ETSDKmK5dng90g1I24o4v2P6viXw/0YrvgO9bmTMUYJg3X
vd6BhPlsKFVq3xdn1xaU1UgcbMA7GeN5NJSvRpIpreWnDHd2qjXh7LVvWOJs4wOO
vJr8IYNEvmWTfkIyTLkRW00csUVj/4kdk1FypXqUd2CpMK4CWF1pzr6KJaVZrg6I
dDYgILjMmEVwEC/tWMX8l7k5j7HyncbIhOJdVjAKh1yXrM/iMJLV6sBfI0MyKKIq
+OlCS/OxU77UJcaOEVxgovPFLSdl/k0r8+pb+WenBh6Wgj8wRGrdPfaBdRevVyg2
ux2US1uB2tKgpDc1zg+2qOUJcYHrYBjWjDBbET2UL7sEKZyf81kWdjzkX3RX1q5U
87xhFtVZLYV/DwNflAEaM6Uy3SBua87XLhZ72Uz5hQjwu9cx57MSNLhAcgm8nRE0
WQnnQ8dut8ieN1CY8d5XybdX1Sl7yezOXvldv50EvpTHyRcoxsI=
=R85A
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

