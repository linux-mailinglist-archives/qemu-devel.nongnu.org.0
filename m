Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5F92DCC5B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 07:10:29 +0100 (CET)
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpmUd-0004dq-DV
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 01:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpmLF-0000Mw-Nc; Thu, 17 Dec 2020 01:00:45 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:49089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpmL5-0001HH-Gm; Thu, 17 Dec 2020 01:00:40 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CxLvJ0Q6Bz9sTv; Thu, 17 Dec 2020 17:00:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1608184828;
 bh=7b/4HdUoY4KqFQN7P8s4ld6mZkyQK98LyF3YI8eIOPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZJnJYKCkxkR+I5kadzvUCg8MjNbHrxVXQe7dMa8YfCJpuatfw6nmtVC3A6Mbt+D5j
 XVSDxVqdHVx9POMeiWsNZmQ1zBpwm5xAHMk1QFUWmPgmfneGY1q7m+GlgHNTjaouNr
 PP9M4GwQiDWVW7JtahYmJYgryIsabFwG9Y0WhvoQ=
Date: Thu, 17 Dec 2020 16:47:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
Message-ID: <20201217054736.GH310465@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-12-david@gibson.dropbear.id.au>
 <20201214182240.2abd85eb.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SdvjNjn6lL3tIsv0"
Content-Disposition: inline
In-Reply-To: <20201214182240.2abd85eb.cohuck@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, berrange@redhat.com,
 thuth@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SdvjNjn6lL3tIsv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 06:22:40PM +0100, Cornelia Huck wrote:
> On Fri,  4 Dec 2020 16:44:13 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > We haven't yet implemented the fairly involved handshaking that will be
> > needed to migrate PEF protected guests.  For now, just use a migration
> > blocker so we get a meaningful error if someone attempts this (this is =
the
> > same approach used by AMD SEV).
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  hw/ppc/pef.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >=20
> > diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
> > index 3ae3059cfe..edc3e744ba 100644
> > --- a/hw/ppc/pef.c
> > +++ b/hw/ppc/pef.c
> > @@ -38,7 +38,11 @@ struct PefGuestState {
> >  };
> > =20
> >  #ifdef CONFIG_KVM
> > +static Error *pef_mig_blocker;
> > +
> >  static int kvmppc_svm_init(Error **errp)
>=20
> This looks weird?

Oops.  Not sure how that made it past even my rudimentary compile
testing.

> > +
> > +int kvmppc_svm_init(SecurableGuestMemory *sgm, Error **errp)
> >  {
> >      if (!kvm_check_extension(kvm_state, KVM_CAP_PPC_SECURABLE_GUEST)) {
> >          error_setg(errp,
> > @@ -54,6 +58,11 @@ static int kvmppc_svm_init(Error **errp)
> >          }
> >      }
> > =20
> > +    /* add migration blocker */
> > +    error_setg(&pef_mig_blocker, "PEF: Migration is not implemented");
> > +    /* NB: This can fail if --only-migratable is used */
> > +    migrate_add_blocker(pef_mig_blocker, &error_fatal);
>=20
> Just so that I understand: is PEF something that is enabled by the host
> (and the guest is either secured or doesn't start), or is it using a
> model like s390x PV where the guest initiates the transition into
> secured mode?

Like s390x PV it's initiated by the guest.

> Asking because s390x adds the migration blocker only when the
> transition is actually happening (i.e. guests that do not transition
> into secure mode remain migratable.) This has the side effect that you
> might be able to start a machine with --only-migratable that
> transitions into a non-migratable machine via a guest action, if I'm
> not mistaken. Without the new object, I don't see a way to block with
> --only-migratable; with it, we should be able to do that. Not sure what
> the desirable behaviour is here.

Hm, I'm not sure what the best option is here either.

>=20
> > +
> >      return 0;
> >  }
> > =20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SdvjNjn6lL3tIsv0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/a8PcACgkQbDjKyiDZ
s5J0JRAAm5k3JWI3ONab2QPJtkrHcY8gaAFoBdMG0O1TZ/qh6SQ99l6z2PNXbFac
ecp3nNOfHcIvVQgeaT5Q6WHIH8st2K+qXufTr1PIftiTH8I+X/tkjEp9WsPlz+y5
dSSlEQSbdjQ6v1RnD9b7NGHxf8eTAhuCBQosDGPjoSNM39q9WaM6xLT+PMnXVekh
dZwhpdQQWfP58oPRXuM3rgo4tnfB67PL44NxfqLrKHVQDxWqgGa4v+FMOvGrm6IT
stwtIKamuZDgtXpXVl3HS89WbikLYlnfCZpD+BXdj0Rm7UCDC6es8ZM2NhUe1QaQ
wtcwe4Uf2a64YTY/VJCjk1LVi4Fez1v4bMGTX23D+nbHupNoi+Llo/gi4+pqhc6H
Yb3+jWv1vc9nC9BWCK0OzyJGBc7FvW4Ur8Bxhm3hmy6WwBQ0rPdxs3xrlhY3lXLO
trOhBsA1Fue7O7DOxheEgRGuuMGugKCxcZKVuzh5LbRugLkHmu2e+yXhgxyveLtn
l4Ypb2qRcClZuGT+fRbdWsRCaKwCZtc4c4obKNMiT/gDl2E/YsMrNDMkpX1cFgyL
ijcgFCS7l/SELvrkjNt74TpBj55fzAnyb/mhLztlYWNanfPUherIFc7BhZ26sa7t
Wx6w/6XPm0fozCzj9BvPg9svZPIr0ql+QtfiMa4CoriY+T6jIqU=
=diPo
-----END PGP SIGNATURE-----

--SdvjNjn6lL3tIsv0--

