Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A42DD0B0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:46:01 +0100 (CET)
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprjM-0007ro-2X
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kprcq-0001Oq-9L
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:39:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kprco-0007W9-Ib
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608205152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MgOj6EuRPRhgc87E1eKvG+ZcwKY4KgeCGuqpCKprihs=;
 b=hkCyy7VLVQrMcFW8YIq1R6+3YqSx35B9guwNkDODbH6VlF+laTUPt9pRwNe7y/arZGaLoI
 /yXrQm1NzIXgvSYr75wcWzwGszsSO81n1ocpjJJPbZqBjuRaMk1eeEmGMSripW8Tt8oiwD
 3tguQDzgQBdQUZ/2rE6V1M/uAqfNluQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-KUnFFOc5NUOpCTQHrf2Jbw-1; Thu, 17 Dec 2020 06:39:10 -0500
X-MC-Unique: KUnFFOc5NUOpCTQHrf2Jbw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CB4A59;
 Thu, 17 Dec 2020 11:39:08 +0000 (UTC)
Received: from gondolin (ovpn-113-176.ams2.redhat.com [10.36.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1E4F2C314;
 Thu, 17 Dec 2020 11:38:57 +0000 (UTC)
Date: Thu, 17 Dec 2020 12:38:42 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
Message-ID: <20201217123842.51063918.cohuck@redhat.com>
In-Reply-To: <20201217054736.GH310465@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-12-david@gibson.dropbear.id.au>
 <20201214182240.2abd85eb.cohuck@redhat.com>
 <20201217054736.GH310465@yekko.fritz.box>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ukk4S5nSA=gXo.pxm5suYdZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/ukk4S5nSA=gXo.pxm5suYdZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Dec 2020 16:47:36 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Dec 14, 2020 at 06:22:40PM +0100, Cornelia Huck wrote:
> > On Fri,  4 Dec 2020 16:44:13 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >  =20
> > > We haven't yet implemented the fairly involved handshaking that will =
be
> > > needed to migrate PEF protected guests.  For now, just use a migration
> > > blocker so we get a meaningful error if someone attempts this (this i=
s the
> > > same approach used by AMD SEV).
> > >=20
> > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  hw/ppc/pef.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
> > > index 3ae3059cfe..edc3e744ba 100644
> > > --- a/hw/ppc/pef.c
> > > +++ b/hw/ppc/pef.c
> > > @@ -38,7 +38,11 @@ struct PefGuestState {
> > >  };
> > > =20
> > >  #ifdef CONFIG_KVM
> > > +static Error *pef_mig_blocker;
> > > +
> > >  static int kvmppc_svm_init(Error **errp) =20
> >=20
> > This looks weird? =20
>=20
> Oops.  Not sure how that made it past even my rudimentary compile
> testing.
>=20
> > > +
> > > +int kvmppc_svm_init(SecurableGuestMemory *sgm, Error **errp)
> > >  {
> > >      if (!kvm_check_extension(kvm_state, KVM_CAP_PPC_SECURABLE_GUEST)=
) {
> > >          error_setg(errp,
> > > @@ -54,6 +58,11 @@ static int kvmppc_svm_init(Error **errp)
> > >          }
> > >      }
> > > =20
> > > +    /* add migration blocker */
> > > +    error_setg(&pef_mig_blocker, "PEF: Migration is not implemented"=
);
> > > +    /* NB: This can fail if --only-migratable is used */
> > > +    migrate_add_blocker(pef_mig_blocker, &error_fatal); =20
> >=20
> > Just so that I understand: is PEF something that is enabled by the host
> > (and the guest is either secured or doesn't start), or is it using a
> > model like s390x PV where the guest initiates the transition into
> > secured mode? =20
>=20
> Like s390x PV it's initiated by the guest.
>=20
> > Asking because s390x adds the migration blocker only when the
> > transition is actually happening (i.e. guests that do not transition
> > into secure mode remain migratable.) This has the side effect that you
> > might be able to start a machine with --only-migratable that
> > transitions into a non-migratable machine via a guest action, if I'm
> > not mistaken. Without the new object, I don't see a way to block with
> > --only-migratable; with it, we should be able to do that. Not sure what
> > the desirable behaviour is here. =20
>=20
> Hm, I'm not sure what the best option is here either.

If we agree on anything, it should be as consistent across
architectures as possible :)

If we want to add the migration blocker to s390x even before the guest
transitions, it needs to be tied to the new object; if we'd make it
dependent on the cpu feature bit, we'd block migration of all machines
on hardware with SE and a recent kernel.

Is there a convenient point in time when PEF guests transition where
QEMU can add a blocker?

>=20
> >  =20
> > > +
> > >      return 0;
> > >  }
> > >   =20
> >  =20
>=20


--Sig_/ukk4S5nSA=gXo.pxm5suYdZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAl/bQ0IACgkQ3s9rk8bw
L6+AFA/4tEcBhNhYOgLqWDrIgP/QxylFpcbIrcxUr5u3yx5AdGqesDKqSgOiMcQX
zNhP4JKbdrIPrgvWiGkknQnbXPy0Z4Ge1OUJ3eGMz+h3/L8cD7Kq51WMwTXK+NUB
hySnI3x7LbNUhAkTFr3jN7OC2GTn+x/c/tSx6kAOGJHWLgN0Mk6cdKvgEHwTRm/I
EW7GCEkpvQKS1ePdYaRHEjNtqFvP45PRg5Li/0hMEuQPkCGE1Wp0MV6kneQ8Z0cw
eY1e6BjBblCJV9ZInWKstJSQGDityJ6ln0xlmF/bhQrmGszs0Jyka/wPyVZdEb73
ypgU51dP6JDU9scKJSNNy/+oOpTDRHw50FrrS7NxF/AXd65QlOkRAveWtc+fWO4b
FH0XlxnAsDLrae8AcGSUtQZzXXebtVtqXQKjV+CtIrR0uEObCLgPRozEQ7bLVqzZ
AwzIOWRFHww/ILvnBxqK76HYfZW3Lc/goTPrpFctwiUvxzPuPau//H6ZgKwhDN+E
QspwFSgRS1hw/PqM/837nlAJcJJsW/9kZpXVeJt4vjyNJxvpysn8pJq/7QGCuolW
A1GvRARCQY/i+chjjobrrkGbN0n6Rro+2V/Mv2HAGR3CUo0uqRsd7nlhb+WHCLBI
wUk8dOlzAsBFNlGBywqOQTxPd9JRoPz7gJGyx6YiNCGS5P96Xg==
=07GC
-----END PGP SIGNATURE-----

--Sig_/ukk4S5nSA=gXo.pxm5suYdZ--


