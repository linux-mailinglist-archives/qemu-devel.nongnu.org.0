Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8A03E3E6C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 05:44:58 +0200 (CEST)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCwDh-0006Zo-Aq
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 23:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mCwAk-0004i3-Up; Sun, 08 Aug 2021 23:41:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51229 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mCwAi-0002Rl-3R; Sun, 08 Aug 2021 23:41:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gjhhg2nrnz9sWS; Mon,  9 Aug 2021 13:41:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628480499;
 bh=wJFp/ZSO2e9zwTC6Amt14yv/a2RB1vr5jdS6tK+4EU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iamw4h5Ss1+gcoxd00uB+6fh5nbaAlHr4OmIkHGNIQODXShrD4K5ptgmY1hbLL9pb
 9EKKlV+9x/In/w8j5cRa3st2OzPSlOTrHkBSngSFgyzOT+f2ZSGp9/j7eivC8ri45/
 opHKSkac6HlHghPzvs4CTM663CJxAi3qGkzNP+84=
Date: Mon, 9 Aug 2021 13:41:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-6.2 v6 7/7] memory_hotplug.c: send
 DEVICE_UNPLUG_ERROR in acpi_memory_hotplug_write()
Message-ID: <YRCj7Qo/gPz0kLhv@yekko>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-8-danielhb413@gmail.com>
 <875ywhbb2z.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kX4ObLelKr5sGnHN"
Content-Disposition: inline
In-Reply-To: <875ywhbb2z.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kX4ObLelKr5sGnHN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 07, 2021 at 04:09:40PM +0200, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>=20
> > MEM_UNPLUG_ERROR is deprecated since the introduction of
> > DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
> > MEM_UNPLUG_ERROR is pending.
> >
> > CC: Michael S. Tsirkin <mst@redhat.com>
> > CC: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >  hw/acpi/memory_hotplug.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> > index e37acb0367..a0772fe083 100644
> > --- a/hw/acpi/memory_hotplug.c
> > +++ b/hw/acpi/memory_hotplug.c
> > @@ -8,6 +8,7 @@
> >  #include "qapi/error.h"
> >  #include "qapi/qapi-events-acpi.h"
> >  #include "qapi/qapi-events-machine.h"
> > +#include "qapi/qapi-events-qdev.h"
> > =20
> >  #define MEMORY_SLOTS_NUMBER          "MDNR"
> >  #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
> > @@ -181,10 +182,19 @@ static void acpi_memory_hotplug_write(void *opaqu=
e, hwaddr addr, uint64_t data,
> > =20
> >                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> > =20
> > +                /*
> > +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
> > +                 * while the deprecation of MEM_UNPLUG_ERROR is
> > +                 * pending.
> > +                 */
> >                  if (dev->id) {
> >                      qapi_event_send_mem_unplug_error(dev->id, error_pr=
etty);
> >                  }
> > =20
> > +                qapi_event_send_device_unplug_error(!!dev->id, dev->id,
> > +                                                    dev->canonical_pat=
h,
> > +                                                    true, error_pretty=
);
> > +
> >                  error_free(local_err);
> >                  break;
> >              }
>=20
> Unlike the previous patch, "msg" is present even when !dev->id.  Makes
> me doubt the previous patch's conditional passing of "msg" some more.

Daniel, if you can address Markus' comments and send another spin,
I'll replace the draft I have in ppc-for-6.2 with the new version.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kX4ObLelKr5sGnHN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEQo+wACgkQbDjKyiDZ
s5LrmQ//R9hXZL3A8dDRZEdmns7KhvZKTYOxPQBCDkFJhsYy6MTAR8lauGd8CfL2
yRXC2w9B4sYaFZ8fSzRzfY99I/mvPEgSiSCrXZ32KaZIMvbUWAdMjmaWS+qv+IBO
3OZiOaTweHJRNUGAn0DFDgoiH1GIuoIm62n2kggSGShrpwjobcJECD5P9Uq6bMxr
eSBWJmhH7qU1mPC357Ujqpj75CJXrB16zqZraXd3FQnIwxpvjHy54YTrgpVUuy1I
PuSopgRtSbgzqUeXENysh9B29+wjCbJHBt1PT4h3lFpFbxrx4fmGvaPWDDHDPoOv
m5MSxN5eKw+Y9m8tDM5JxBntUZ/XLKLa5UXbNq0cJUfSwkLYU6pz4N8Zz7QUWOz9
7mHzQBSf+tr9Rr8xkxbqyRP7HpcvBlBofpd6/+/sGXLxUl2cwLxGiXy56cu2eiBR
akcxQU10zBWHovIUEaaflMu4lQOQaQxx4X3Q2U5h7xjwA/oMzHx2UbL7Kqaeg9Ee
1Huq6plyuuMhit0Mlp635egyycoU9CHEWY5Olw7hnhxWEarLikPMVBZMVQnZEA8N
0xmn9EuFTzZPuk7n1qw3R1OgYzBMhamgCt8vW3m2eL3nUVXHvxoRfCJMhWTnG1vP
fMevn4ikdqBQ6k8/mpDud6+293tm3nI6nln/uoK4CUVl3Ud3HKM=
=9OfW
-----END PGP SIGNATURE-----

--kX4ObLelKr5sGnHN--

