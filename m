Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B312F6F64
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 01:22:09 +0100 (CET)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0CsS-0000sK-6b
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 19:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0Cq4-00004t-F5; Thu, 14 Jan 2021 19:19:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55607 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0Cq1-0003Pv-1F; Thu, 14 Jan 2021 19:19:40 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DH1yV5Pblz9sSs; Fri, 15 Jan 2021 11:19:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610669970;
 bh=wcy9LPpFUMZ9gzA/ytL/D68EWk8OlzQliGIpe+KcrvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L2zdbUE0G9bDudtydYhL64mVS+oPklq4KR7l0GUTv8rSKW4urpLoiYYA5wjnddvpM
 Qpedk98R8mTt5UGfRy+nS6+R2DxyUvX0xAji7dKGB/rzmJm25IAzE6/TlvwaGahm6i
 lQwiEzD4noPcNATzCUqtb2txCxG7c7MmIv5DNY+0=
Date: Fri, 15 Jan 2021 10:51:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
Message-ID: <20210114235125.GO435587@yekko.fritz.box>
References: <20201217151530.54431f0e@bahia.lan>
 <20201218124111.4957eb50.cohuck@redhat.com>
 <20210104071550.GA22585@ram-ibm-com.ibm.com>
 <20210104134629.49997b53.pasic@linux.ibm.com>
 <20210104184026.GD4102@ram-ibm-com.ibm.com>
 <20210105115614.7daaadd6.pasic@linux.ibm.com>
 <20210105204125.GE4102@ram-ibm-com.ibm.com>
 <20210111175914.13adfa2e.cohuck@redhat.com>
 <20210113124226.GH2938@work-vm>
 <20210114112517.GE1643043@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MmQIYbZiCoQ2kDro"
Content-Disposition: inline
In-Reply-To: <20210114112517.GE1643043@redhat.com>
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
Cc: pair@us.ibm.com, Cornelia Huck <cohuck@redhat.com>, brijesh.singh@amd.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, qemu-devel@nongnu.org, frankja@linux.ibm.com,
 david@redhat.com, mdroth@linux.vnet.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 borntraeger@de.ibm.com, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, rth@twiddle.net, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MmQIYbZiCoQ2kDro
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 11:25:17AM +0000, Daniel P. Berrang=E9 wrote:
> On Wed, Jan 13, 2021 at 12:42:26PM +0000, Dr. David Alan Gilbert wrote:
> > * Cornelia Huck (cohuck@redhat.com) wrote:
> > > On Tue, 5 Jan 2021 12:41:25 -0800
> > > Ram Pai <linuxram@us.ibm.com> wrote:
> > >=20
> > > > On Tue, Jan 05, 2021 at 11:56:14AM +0100, Halil Pasic wrote:
> > > > > On Mon, 4 Jan 2021 10:40:26 -0800
> > > > > Ram Pai <linuxram@us.ibm.com> wrote:
> > >=20
> > > > > > The main difference between my proposal and the other proposal =
is...
> > > > > >=20
> > > > > >   In my proposal the guest makes the compatibility decision and=
 acts
> > > > > >   accordingly.  In the other proposal QEMU makes the compatibil=
ity
> > > > > >   decision and acts accordingly. I argue that QEMU cannot make =
a good
> > > > > >   compatibility decision, because it wont know in advance, if t=
he guest
> > > > > >   will or will-not switch-to-secure.
> > > > > >  =20
> > > > >=20
> > > > > You have a point there when you say that QEMU does not know in ad=
vance,
> > > > > if the guest will or will-not switch-to-secure. I made that argum=
ent
> > > > > regarding VIRTIO_F_ACCESS_PLATFORM (iommu_platform) myself. My id=
ea
> > > > > was to flip that property on demand when the conversion occurs. D=
avid
> > > > > explained to me that this is not possible for ppc, and that havin=
g the
> > > > > "securable-guest-memory" property (or whatever the name will be)
> > > > > specified is a strong indication, that the VM is intended to be u=
sed as
> > > > > a secure VM (thus it is OK to hurt the case where the guest does =
not
> > > > > try to transition). That argument applies here as well. =20
> > > >=20
> > > > As suggested by Cornelia Huck, what if QEMU disabled the
> > > > "securable-guest-memory" property if 'must-support-migrate' is enab=
led?
> > > > Offcourse; this has to be done with a big fat warning stating
> > > > "secure-guest-memory" feature is disabled on the machine.
> > > > Doing so, will continue to support guest that do not try to transit=
ion.
> > > > Guest that try to transition will fail and terminate themselves.
> > >=20
> > > Just to recap the s390x situation:
> > >=20
> > > - We currently offer a cpu feature that indicates secure execution to
> > >   be available to the guest if the host supports it.
> > > - When we introduce the secure object, we still need to support
> > >   previous configurations and continue to offer the cpu feature, even
> > >   if the secure object is not specified.
> > > - As migration is currently not supported for secured guests, we add a
> > >   blocker once the guest actually transitions. That means that
> > >   transition fails if --only-migratable was specified on the command
> > >   line. (Guests not transitioning will obviously not notice anything.)
> > > - With the secure object, we will already fail starting QEMU if
> > >   --only-migratable was specified.
> > >=20
> > > My suggestion is now that we don't even offer the cpu feature if
> > > --only-migratable has been specified. For a guest that does not want =
to
> > > transition to secure mode, nothing changes; a guest that wants to
> > > transition to secure mode will notice that the feature is not availab=
le
> > > and fail appropriately (or ultimately, when the ultravisor call fails=
).
> > > We'd still fail starting QEMU for the secure object + --only-migratab=
le
> > > combination.
> > >=20
> > > Does that make sense?
> >=20
> > It's a little unusual; I don't think we have any other cases where
> > --only-migratable changes the behaviour; I think it normally only stops
> > you doing something that would have made it unmigratable or causes
> > an operation that would make it unmigratable to fail.
>=20
> I agree,  --only-migratable is supposed to be a *behavioural* toggle
> for QEMU. It must /not/ have any impact on the guest ABI.
>=20
> A management application needs to be able to add/remove --only-migratable
> at will without changing the exposing guest ABI.

At the qemu level, it sounds like the right thing to do is to fail
outright if all of the below are true:
 1. --only-migratable is specified
 2. -cpu host is specified
 3. unpack isn't explicitly disabled
 4. the host CPU actually does have the unpack facility

That can be changed if & when migration support is added for PV.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MmQIYbZiCoQ2kDro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAA2PoACgkQbDjKyiDZ
s5LPNQ//ZwtUgMLH6n2praK8ukCTBF7OmWisADC3WU+C4HDdA3uegtF/R+btR4RK
eklRS2KUCYHBvXJ2r0W/3bBgz93em7FEgxQS5k9osOk9KX82t+dmruYAImaWrF/f
mMlyS3dcoi41goe0k45rn9E4zAbaW+NWs3bVfyvupHjjiIZFgsZzCGBicnXeWJcW
/rV/bbQpyxUmX6CY9Xv+GsOpENjSHP24K8k1EadZgoj1+MIskL4sSKs+uU7XQ2cE
jq8CyCkPZo85UPQlubdhRwF9aOGAojidXxpO0Fs1eI6rmRaZ+8F9+A65Tn8w1Wsy
YJze4aGyW4QH4L25M6dZXrBd7fnSYNwsEZtZnT0sIBYewZmGeBFx3l7IcKp5engY
lCXTHJNFZM9wbH1Hcp119aZrF0/RBR5lsxB2K9OY5QxEW+a53HNXXBGaxf+avlqN
TGE9rR4bbv10GhGI+TeUEjRu974Da270gPc2+0HSEbfXgIfrta5K8jMnLcuyJzNe
rORil0ypdrh8/NtJDX/GOwkHui1fwrdDznjA/F8E1E9ejrFhgL/QE7+H6sObPEMZ
OypJnP4tQArfXROzYsyJ8pQUdrsn+uL+w2OvNMjbidqnIffd03V7T0LazmS066BD
D/K/WTEUfk29J3mGKgYes3GScVQHH74Kb0dADNtCNrQpMU5jfVk=
=Rei0
-----END PGP SIGNATURE-----

--MmQIYbZiCoQ2kDro--

