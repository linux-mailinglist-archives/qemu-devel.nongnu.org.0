Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4B32F40F8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 02:09:39 +0100 (CET)
Received: from localhost ([::1]:34714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzUf8-0000JX-7Q
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 20:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUXD-0003Ed-8N; Tue, 12 Jan 2021 20:01:15 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:58315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUX9-00086W-QX; Tue, 12 Jan 2021 20:01:15 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFpz61Clgz9sj5; Wed, 13 Jan 2021 12:00:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610499650;
 bh=iN/1tBP7XcnEnLSGX4Z2fu1vc1PYRuAZwRjtQ+j+2C8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QkcvbYWGUJnkeJogctx6aoZIzy8MTNjmP/wL3xYIa+HQCTpYyhAa98D157bbj3EuH
 Wm0TROZVqOQnUtsWC9LZPV2/vCJ1/STkrOwbjAY2of/YjWJdGZUwFCxUCqU9URDJuG
 mz+j+taQlmTWKtM1hu3nbO0+Qsiv/xeHhSUsKgGo=
Date: Wed, 13 Jan 2021 11:57:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v6 13/13] s390: Recognize confidential-guest-support option
Message-ID: <20210113005748.GD435587@yekko.fritz.box>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
 <20210112044508.427338-14-david@gibson.dropbear.id.au>
 <fcafba03-3701-93af-8eb7-17bd0d14d167@de.ibm.com>
 <20210112123607.39597e3d.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Content-Disposition: inline
In-Reply-To: <20210112123607.39597e3d.cohuck@redhat.com>
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 david@redhat.com, qemu-devel@nongnu.org, frankja@linux.ibm.com,
 pragyansri.pathi@intel.com, mst@redhat.com, mdroth@linux.vnet.ibm.com,
 pasic@linux.ibm.com, Christian Borntraeger <borntraeger@de.ibm.com>,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 richard.henderson@linaro.org, dgilbert@redhat.com, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 12:36:07PM +0100, Cornelia Huck wrote:
65;6201;1c> On Tue, 12 Jan 2021 09:15:26 +0100
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>=20
> > On 12.01.21 05:45, David Gibson wrote:
> > > At least some s390 cpu models support "Protected Virtualization" (PV),
> > > a mechanism to protect guests from eavesdropping by a compromised
> > > hypervisor.
> > >=20
> > > This is similar in function to other mechanisms like AMD's SEV and
> > > POWER's PEF, which are controlled by the "confidential-guest-support"
> > > machine option.  s390 is a slightly special case, because we already
> > > supported PV, simply by using a CPU model with the required feature
> > > (S390_FEAT_UNPACK).
> > >=20
> > > To integrate this with the option used by other platforms, we
> > > implement the following compromise:
> > >=20
> > >  - When the confidential-guest-support option is set, s390 will
> > >    recognize it, verify that the CPU can support PV (failing if not)
> > >    and set virtio default options necessary for encrypted or protected
> > >    guests, as on other platforms.  i.e. if confidential-guest-support
> > >    is set, we will either create a guest capable of entering PV mode,
> > >    or fail outright.
> > >=20
> > >  - If confidential-guest-support is not set, guests might still be
> > >    able to enter PV mode, if the CPU has the right model.  This may be
> > >    a little surprising, but shouldn't actually be harmful.
> > >=20
> > > To start a guest supporting Protected Virtualization using the new
> > > option use the command line arguments:
> > >     -object s390-pv-guest,id=3Dpv0 -machine confidential-guest-suppor=
t=3Dpv0 =20
> >=20
> >=20
> > This results in
> >=20
> > [cborntra@t35lp61 qemu]$ qemu-system-s390x -enable-kvm -nographic -m 2G=
 -kernel ~/full.normal=20
> > **
> > ERROR:../qom/object.c:317:type_initialize: assertion failed: (parent->i=
nstance_size <=3D ti->instance_size)
> > Bail out! ERROR:../qom/object.c:317:type_initialize: assertion failed: =
(parent->instance_size <=3D ti->instance_size)
> > Aborted (core dumped)
> >=20
>=20
> > > +static const TypeInfo s390_pv_guest_info =3D {
> > > +    .parent =3D TYPE_CONFIDENTIAL_GUEST_SUPPORT,
> > > +    .name =3D TYPE_S390_PV_GUEST,
> > > +    .instance_size =3D sizeof(S390PVGuestState),
> > > +    .interfaces =3D (InterfaceInfo[]) {
> > > +        { TYPE_USER_CREATABLE },
> > > +        { }
> > > +    }
> > > +};
>=20
> I think this needs TYPE_OBJECT in .parent and
> TYPE_CONFIDENTIAL_GUEST_SUPPORT as an interface to fix the crash.

No, that was true of an earlier revision, but parent is correct in the
current version.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/+RYwACgkQbDjKyiDZ
s5KbWA/+M3AIG++0nTrqi4hWo4jTQx4KE9/yIGXlbfcN/MH/ziivMWcKrCIFPbiP
Pk9pzdVDKy4sg5Mxw0zYPlo/iAiUuOge8tSYSyQSwsCLOVB7VYG9ArBBsd957sF4
7kFnq8joiiTza9RHbrzCms3xFJmy4kJEqq0ucrA39Httb+IgaOJfusRG/POjLfEa
WHB74CHfO0L/V47VLmV2yC+l2lRgZm04uCABlZ7MNQq87wIdzEUHco6YA89dhPTm
4zjQl4K6P+/WrZ+6a5SSDgpcDe1qAd9IY+atnANo2XkYcUQEVMWnJMiVzD15Zy9L
FdYK+f8e28j3LJIoDPLXHca9gpKyY02CTtDS55OhWrfUloRjapMQbct72f1bPsMy
JxHTGKY8sKEFnecma3Tlc+qjovODHav4KgRr29KPHPrjAqNvZFAMK2tR2ge976Ld
7nvqiznT4kwbJLRJ1w9V64+FC1z22o2OEkxeVjOvwtx0PpE9WJqQNInfmPfS2YVL
4IAVyillo5stvE/SOcNzD3XpyZ/RaTd8A/ue8F84DZWsaJF4Q7NlL2sRPLkrFDt3
mH9+x8ul+HoNrz+ynK0dykr4H2R0YvsILuny+imnPc5q2Sc7lUKKpnWMofwloIYY
sM0h9vdXnAVhMa6vQm/avOC0M8on1GW0fJMf4Cymv+a/zsi7SK0=
=+4Rz
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--

