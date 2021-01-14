Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47452F6084
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:50:54 +0100 (CET)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l019R-0003r0-UN
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l015Y-0000cM-2u; Thu, 14 Jan 2021 06:46:52 -0500
Received: from ozlabs.org ([203.11.71.1]:39399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l015V-0006Rb-BR; Thu, 14 Jan 2021 06:46:51 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DGjFY3GNfz9sWw; Thu, 14 Jan 2021 22:46:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610624785;
 bh=eYbuUr6qAMHUVvbrkUhI4tEKX064pL2xN4y1mwUcdkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SnB0dkdBea6XQiSw/7rTc29UoG6KVJCtdkskj9TTB9AQCaFYEwwBRY8Oy7C9cWtqx
 WdFn2amrNZAtHPSGHpLB207lZV92mD0Uc0hvbemwcy+upTtUJ0EU6MQJjhj5crxjNK
 geSWUb/+xptq1zjGiwTn18Gqy0HXkqj3KxpD6yK4=
Date: Thu, 14 Jan 2021 22:45:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v7 13/13] s390: Recognize confidential-guest-support option
Message-ID: <20210114114545.GN435587@yekko.fritz.box>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-14-david@gibson.dropbear.id.au>
 <ba08f5da-e31f-7ae2-898d-a090c5c1b1cf@de.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kUBUi7JBpjcBtem/"
Content-Disposition: inline
In-Reply-To: <ba08f5da-e31f-7ae2-898d-a090c5c1b1cf@de.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: pair@us.ibm.com, cohuck@redhat.com, brijesh.singh@amd.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, pragyansri.pathi@intel.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 berrange@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kUBUi7JBpjcBtem/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 10:10:02AM +0100, Christian Borntraeger wrote:
>=20
>=20
> On 14.01.21 00:58, David Gibson wrote:
> [...]
> > +int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp)
> > +{
> > +    if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
> > +        return 0;
> > +    }
> > +
> > +    if (!s390_has_feat(S390_FEAT_UNPACK)) {
> > +        error_setg(errp,
> > +                   "CPU model does not support Protected Virtualizatio=
n");
> > +        return -1;
> > +    }
>=20
> I am triggering this and I guess this is because the cpu model is not yet=
 initialized at
> this point in time.

Bother.  I thought I'd put the s390_pv_init() call late enough to
avoid that, but I guess not.  Any chance you can debug that?  Working
on s390 is far from easy for me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kUBUi7JBpjcBtem/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAALucACgkQbDjKyiDZ
s5JAKBAA1w2SA9W0omKgLMNME/uZ50d0y3qa9d6i6GGV5d8U4TAZOuMFN1PNq4kQ
Atzok35g1dAiEMj0c6sDdUIsf72CPUH6W4Q1E1Y/rKeNMu7M6BZfdzDEiO7P2WNr
GB9k3OWbfXSWMX2x2+upA0z7O6wwykjM2t4WZTymDlYkClVSOLZ6G5+oXvu/Tc6Y
QTJnqbROFEzEqGaY+SJNYhbZEgJW14lztltmI4Yh/iQ+ujjIHG/3E6XvHyk8sE7C
lFwrgbA/WKCx7X6icbaEYm1kfCwPfZPFVoUu6hktiP4D/5w13SRNczcz6SzaMpOR
XgjDHlGg+7wk6z/+G0D3rrpJqnUeEaOZVxst0nJJxmPSbHP/8s3aJ72XCTgBXHO3
p3c54pba4oV7/wkdV6vXEijQZvJTVR6d+DupKiLeTJXC7xuS/gOQ7u8NJK+8Qe+Y
whHZtkOUL5WJBPowVZbi7lBZqEgvlXhEiHCfmnLPY89puILY41OqRV0J23l3UGvn
xH5ZLB1eEd8N32ne/ULkElcg95cd4eZvzaFD5HPdLU5GEnf6g+1O5E58Lw0ncCx3
JazyplvuK27yIYiceCvEKUVvZ7RCLE3lC3LP2XyhChR83QLJGVIv6f4+GdkHYErC
BgKS8jrtULOaQUu7l/Q0rD7pGkUW2C6nDia7IbQ4oJLtxyD90Y8=
=xdMK
-----END PGP SIGNATURE-----

--kUBUi7JBpjcBtem/--

