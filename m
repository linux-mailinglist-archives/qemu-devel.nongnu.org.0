Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8852F2A65
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 09:55:53 +0100 (CET)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzFSx-0001xh-RU
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 03:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzFQw-0001Qz-Gc; Tue, 12 Jan 2021 03:53:47 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:49735 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzFQu-0007kQ-1A; Tue, 12 Jan 2021 03:53:46 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFPW60FVFz9sXH; Tue, 12 Jan 2021 19:53:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610441618;
 bh=+TA4eGKgi7+nqgfxxmX3Nrl1NwY20XrjYaBaNltay9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K6Ewfaq6i2wS7AE5/prxFaflhjhM5nx26gpMoFqarrOL3RVqY3zjrBjgKXrZNQpXm
 VWO/jxLfbWlt9sRAY6ZXvYSsteh3mpuR8EIcLPGVxmUiSV26EwophKt6pG+lTgNyHv
 1tUpoyrYfWJakWzTJyNdFXiravVks6xwywtMuwM8=
Date: Tue, 12 Jan 2021 19:36:46 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v6 10/13] spapr: Add PEF based confidential guest support
Message-ID: <20210112083646.GB427679@yekko.fritz.box>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
 <20210112044508.427338-11-david@gibson.dropbear.id.au>
 <7d8775df-b3fb-deff-44f2-2e41c83a67ca@de.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline
In-Reply-To: <7d8775df-b3fb-deff-44f2-2e41c83a67ca@de.ibm.com>
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
Cc: pair@us.ibm.com, Marcelo Tosatti <mtosatti@redhat.com>,
 brijesh.singh@amd.com, kvm@vger.kernel.org, david@redhat.com,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, pragyansri.pathi@intel.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 richard.henderson@linaro.org, dgilbert@redhat.com, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 08:56:53AM +0100, Christian Borntraeger wrote:
>=20
>=20
> On 12.01.21 05:45, David Gibson wrote:
> [...]
> > diff --git a/include/hw/ppc/pef.h b/include/hw/ppc/pef.h
> > new file mode 100644
> > index 0000000000..7c92391177
> > --- /dev/null
> > +++ b/include/hw/ppc/pef.h
> > @@ -0,0 +1,26 @@
> > +/*
> > + * PEF (Protected Execution Facility) for POWER support
> > + *
> > + * Copyright David Gibson, Redhat Inc. 2020
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#ifndef HW_PPC_PEF_H
> > +#define HW_PPC_PEF_H
> > +
> > +int pef_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> > +
> > +#ifdef CONFIG_KVM
> > +void kvmppc_svm_off(Error **errp);
> > +#else
> > +static inline void kvmppc_svm_off(Error **errp)
> > +{
> > +}
> > +#endif
> > +
> > +
> > +#endif /* HW_PPC_PEF_H */
> > +
>=20
> In case you do a respin,=20
>=20
> git am says
> Applying: confidential guest support: Update documentation
> Applying: spapr: Add PEF based confidential guest support
> .git/rebase-apply/patch:254: new blank line at EOF.
> +
> warning: 1 line adds whitespace errors.
> Applying: spapr: PEF: prevent migration

Oops, corrected.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/9X5wACgkQbDjKyiDZ
s5LDoA//b64TM4HncZs/IndLXBQpLjxaM1GSnhMcDx5rU4LEbjQa+jZrevP8N1aj
rLJNYdxogd5n1r0tREKWYYdil6uRw5+MfYWLFLf+fy0kqML1suUvAhq6pOgrtEAj
Ju+bfrQa9HfId1XdhlQ3jTqY+h5jE8D9Tf2nm+zcOt1Do5Gr1d2dy9gn8G3qTNqE
LFt/cEXZRU49Dagj4TFXGzs1yLZxv4bDMA4uOiekheRIwptXoKf67blahy2461qe
yY2n00WNoda4uxHRbdaVq6P5OD49AaQfA4KbY/xc1jKr4eqth65+Bujh1C1f1Lnu
QBhp1W+qNjJ1YRuBmoJGfU6wXgYWtIYF3JkiJzzQs7ubmGyGWI3i2X3766xRChk0
CEWiXBKjq+J3jgmu0oZ3L4ENvmXR2/kMYNK6GEJXRYZowcoAEfjsx4ByP1J7ePKf
NfrCuE7KXZiVoWS9ITfy6MKszSy6DYDRv/vlLUin/Of6/WF/7CIaGr3WDjHUKiMW
1C9xbzR7LBDjlL22DHC+qbuk6v5spHnC/K7Vw6jpfQCrHkEfh6eLag9rpS6TIeB/
2bmrELh/ZuAJfUvhcYZFMvXkW2zOIPVPsJ3cWlNCddekFWRbnpk8446ODYprdHlI
X6Q00lPWrVCIsQN1LTEIgPSxDw5SybFCZz1F+5817u3KepRyoSU=
=NYCn
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--

