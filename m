Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C552DD2C5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:19:01 +0100 (CET)
Received: from localhost ([::1]:44350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpu7Q-0002bY-5R
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kpu4P-00019U-Ab; Thu, 17 Dec 2020 09:15:54 -0500
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:36751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kpu4L-0000mT-PK; Thu, 17 Dec 2020 09:15:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.102])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 5C1002496CD;
 Thu, 17 Dec 2020 15:15:37 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 17 Dec
 2020 15:15:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002eb1eb60c-f1ce-4f5a-a695-035b055ce97f,
 D250AAD16230E071DBA8D0F8473359178B71E032) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Thu, 17 Dec 2020 15:15:30 +0100
From: Greg Kurz <groug@kaod.org>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
Message-ID: <20201217151530.54431f0e@bahia.lan>
In-Reply-To: <20201217123842.51063918.cohuck@redhat.com>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-12-david@gibson.dropbear.id.au>
 <20201214182240.2abd85eb.cohuck@redhat.com>
 <20201217054736.GH310465@yekko.fritz.box>
 <20201217123842.51063918.cohuck@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q5z.CNi9D8q2e6l2k8nde8k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 70f337f8-bdb8-4bf1-8a81-ebe8f5481bfe
X-Ovh-Tracer-Id: 7495115682604226969
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepvghhrggskhhoshhtsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=groug@kaod.org;
 helo=2.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, david@redhat.com, mdroth@linux.vnet.ibm.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 qemu-s390x@nongnu.org, rth@twiddle.net, berrange@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/q5z.CNi9D8q2e6l2k8nde8k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Dec 2020 12:38:42 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Thu, 17 Dec 2020 16:47:36 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Dec 14, 2020 at 06:22:40PM +0100, Cornelia Huck wrote:
> > > On Fri,  4 Dec 2020 16:44:13 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > We haven't yet implemented the fairly involved handshaking that wil=
l be
> > > > needed to migrate PEF protected guests.  For now, just use a migrat=
ion
> > > > blocker so we get a meaningful error if someone attempts this (this=
 is the
> > > > same approach used by AMD SEV).
> > > >=20
> > > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > > ---
> > > >  hw/ppc/pef.c | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >=20
> > > > diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
> > > > index 3ae3059cfe..edc3e744ba 100644
> > > > --- a/hw/ppc/pef.c
> > > > +++ b/hw/ppc/pef.c
> > > > @@ -38,7 +38,11 @@ struct PefGuestState {
> > > >  };
> > > > =20
> > > >  #ifdef CONFIG_KVM
> > > > +static Error *pef_mig_blocker;
> > > > +
> > > >  static int kvmppc_svm_init(Error **errp) =20
> > >=20
> > > This looks weird? =20
> >=20
> > Oops.  Not sure how that made it past even my rudimentary compile
> > testing.
> >=20
> > > > +
> > > > +int kvmppc_svm_init(SecurableGuestMemory *sgm, Error **errp)
> > > >  {
> > > >      if (!kvm_check_extension(kvm_state, KVM_CAP_PPC_SECURABLE_GUES=
T)) {
> > > >          error_setg(errp,
> > > > @@ -54,6 +58,11 @@ static int kvmppc_svm_init(Error **errp)
> > > >          }
> > > >      }
> > > > =20
> > > > +    /* add migration blocker */
> > > > +    error_setg(&pef_mig_blocker, "PEF: Migration is not implemente=
d");
> > > > +    /* NB: This can fail if --only-migratable is used */
> > > > +    migrate_add_blocker(pef_mig_blocker, &error_fatal); =20
> > >=20
> > > Just so that I understand: is PEF something that is enabled by the ho=
st
> > > (and the guest is either secured or doesn't start), or is it using a
> > > model like s390x PV where the guest initiates the transition into
> > > secured mode? =20
> >=20
> > Like s390x PV it's initiated by the guest.
> >=20
> > > Asking because s390x adds the migration blocker only when the
> > > transition is actually happening (i.e. guests that do not transition
> > > into secure mode remain migratable.) This has the side effect that you
> > > might be able to start a machine with --only-migratable that
> > > transitions into a non-migratable machine via a guest action, if I'm
> > > not mistaken. Without the new object, I don't see a way to block with
> > > --only-migratable; with it, we should be able to do that. Not sure wh=
at
> > > the desirable behaviour is here. =20
> >=20

The purpose of --only-migratable is specifically to prevent the machine
to transition to a non-migrate state IIUC. The guest transition to
secure mode should be nacked in this case.

> > Hm, I'm not sure what the best option is here either.
>=20
> If we agree on anything, it should be as consistent across
> architectures as possible :)
>=20
> If we want to add the migration blocker to s390x even before the guest
> transitions, it needs to be tied to the new object; if we'd make it
> dependent on the cpu feature bit, we'd block migration of all machines
> on hardware with SE and a recent kernel.
>=20
> Is there a convenient point in time when PEF guests transition where
> QEMU can add a blocker?
>=20
> >=20
> > >  =20
> > > > +
> > > >      return 0;
> > > >  }
> > > >   =20
> > >  =20
> >=20
>=20


--Sig_/q5z.CNi9D8q2e6l2k8nde8k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl/baAIACgkQcdTV5YIv
c9b/tQ/9EY1sZYjVLPCl4rDkpINniFQpBYvmoIj5KjiVi5cp8g/LWvK/XvvXgoDX
gz3aKzE7cOGJo2BN6BjitohZxgOWWz1wTdqaPP29rzvNAd7iCeByM47tvJ1WBDey
6vBgmdaJZraYX+lcDE6sC7T4dRohZd5Jb0lh+ova937iT5gc8bhdP+AcOgYc/plo
sSB7wHBGUyT2Ror812RXPTns58hmVf/+gPK0eaAb/hE8h/rxieEH8zZJJ0c86ZSU
q+NYb6w4Ylu927EPPnyiaJsZV327GgLnBTRAdG7yi3ndaYDZZi07+ydxazbH6R5U
sP2PXPnxhFUjFc05S7ljcgj3xE9eijLf1Wa7MSH649dXXNNm/tojkXGWrqDi9Lul
HhtmaNUgfal1ufhq7BIiUUr5CNsoaeH5iiIxdcrwqInZaA0pTAdVra375QvRY9ZW
xWTZyEX0+UOQToMqYvyeFp1TvEzPtFy6tmTL48Tnoxjm/jLawgtad2X5pY+HjbnV
HcD1mzwu/7IBX0f+L6KMaYLoOHNPa9O385sgb5kbnEqmCYfiu/h++zP6pgntW9G2
7yAvkaMhOMA4egNHh8iShtxAFLYMFXv99qKSj9MrPWEq14oKeYmD+mzwEQz8UNHl
obBwnSDFFncLrOUbxgVtOPZ2lPF/0o/dNoGcvhpPYWco72TwFQk=
=gjRQ
-----END PGP SIGNATURE-----

--Sig_/q5z.CNi9D8q2e6l2k8nde8k--

