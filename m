Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E42B350C67
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 04:11:44 +0200 (CEST)
Received: from localhost ([::1]:59864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRmoB-00067S-2I
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 22:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRmko-0004ci-Au; Wed, 31 Mar 2021 22:08:14 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:56869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRmkm-0003H1-14; Wed, 31 Mar 2021 22:08:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9mml1DmLz9sWw; Thu,  1 Apr 2021 13:08:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617242887;
 bh=uimYFeg8tfROgkDe8c2UcRwKeHIYOzuGahA/7H0MExY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=armnbMSVYp5oistihOkj9nqMGlCmZN9nxbaWJkQSYqpKjiJTDZi1RUA5kxrnh523I
 MvaCB7n+E2pfoxI2uVArmv3pyzJnn5cQLJe4jszmJY70CaZy1vf8+DbnDm1XLfguQc
 TtI1vw3TpleYldbzbRlD9SyFYhPkyiIcupuY6voo=
Date: Thu, 1 Apr 2021 12:31:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
Message-ID: <YGUibyjrO+HTFSbR@yekko.fritz.box>
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <YFlAheldkqCkZytI@yekko.fritz.box>
 <b8d96ab9-61e5-b941-6405-5beff5fe0df5@gmail.com>
 <YFqYkuBSD3xPgLVi@yekko.fritz.box>
 <ba20de28-d65b-6da4-5bff-92b637cf7a56@gmail.com>
 <20210330012831.2ce0514c@redhat.com>
 <YGO4aXzC6uEC3e/U@yekko.fritz.box>
 <20210331114914.50950465@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yzog+coloFKoWSMx"
Content-Disposition: inline
In-Reply-To: <20210331114914.50950465@redhat.com>
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 groug@kaod.org, armbru@redhat.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yzog+coloFKoWSMx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 11:49:14AM +0200, Igor Mammedov wrote:
> On Wed, 31 Mar 2021 10:46:49 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Tue, Mar 30, 2021 at 01:28:31AM +0200, Igor Mammedov wrote:
> > > On Wed, 24 Mar 2021 16:09:59 -0300
> > > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> > >  =20
> > > > On 3/23/21 10:40 PM, David Gibson wrote: =20
> > > > > On Tue, Mar 23, 2021 at 02:10:22PM -0300, Daniel Henrique Barboza=
 wrote:   =20
> > > > >>
> > > > >>
> > > > >> On 3/22/21 10:12 PM, David Gibson wrote:   =20
> > > > >>> On Fri, Mar 12, 2021 at 05:07:36PM -0300, Daniel Henrique Barbo=
za wrote:   =20
> > > > >>>> Hi,
> > > > >>>>
> > > > >>>> This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
> > > > >>>> DEVICE_UNPLUG_ERROR. They were (and are still being) discussed=
 in [1].
> > > > >>>>
> > > > >>>> Patches 1 and 3 are independent of the ppc patches and can be =
applied
> > > > >>>> separately. Patches 2 and 4 are based on David's ppc-for-6.0 b=
ranch and
> > > > >>>> are dependent on the QAPI patches.   =20
> > > > >>>
> > > > >>> Implementation looks fine, but I think there's a bit more to di=
scuss
> > > > >>> before we can apply.
> > > > >>>
> > > > >>> I think it would make sense to re-order this and put UNPLUG_ERR=
OR
> > > > >>> first.  Its semantics are clearer, and I think there's a strong=
er case
> > > > >>> for it.   =20
> > > > >>
> > > > >> Alright
> > > > >>   =20
> > > > >>>
> > > > >>> I'm a bit less sold on DEVICE_NOT_DELETED, after consideration.=
  Does
> > > > >>> it really tell the user/management anything useful beyond what
> > > > >>> receiving neither a DEVICE_DELETED nor a DEVICE_UNPLUG_ERROR do=
es?   =20
> > > > >>
> > > > >>
> > > > >> It informs that the hotunplug operation exceed the timeout that =
QEMU
> > > > >> internals considers adequate, but QEMU can't assert that it was =
caused
> > > > >> by an error or an unexpected delay. The end result is that the d=
evice
> > > > >> is not going to be deleted from QMP, so DEVICE_NOT_DELETED.   =
=20
> > > > >=20
> > > > > Is it, though?  I mean, it is with this implementation for papr:
> > > > > because we clear the unplug_requested flag, even if the guest lat=
er
> > > > > tries to complete the unplug, it will fail.
> > > > >=20
> > > > > But if I understand what Markus was saying correctly, that might =
not
> > > > > be possible for all hotplug systems.  I believe Markus was sugges=
ting
> > > > > that DEVICE_NOT_DELETED could just mean that we haven't deleted t=
he
> > > > > device yet, but it could still happen later.
> > > > >=20
> > > > > And in that case, I'm not yet sold on the value of a message that
> > > > > essentially just means "Ayup, still dunno what's happening, sorry=
".
> > > > >    =20
> > > > >> Perhaps we should just be straightforward and create a DEVICE_UN=
PLUG_TIMEOUT
> > > > >> event.   =20
> > > > >=20
> > > > > Hm... what if we added a "reason" field to UNPLUG_ERROR.  That co=
uld
> > > > > be "guest rejected hotplug", or something more specific, in the r=
are
> > > > > case that the guest has a way of signalling something more specif=
ic,
> > > > > or "timeout" - but the later *only* to be sent in cases where on =
the
> > > > > timeout we're able to block any later completion of the unplug (a=
s we
> > > > > can on papr). =20
> > >=20
> > > Is canceling unplug on timeout documented somewhere (like some spec)?=
 =20
> >=20
> > Uh.. not as such.  In the PAPR model, hotplugs and unplugs are mostly
> > guest directed, so the question doesn't really arise.
> >=20
> > > If not it might (theoretically) confuse guest when it tries to unplug
> > > after timeout and leave guest in some unexpected state. =20
> >=20
> > Possible, but probably not that likely.  The mechanism we use to
> > "cancel" the hotplugs is that we just fail the hypercalls that the
> > guest will need to call to actually complete the hotplug.  We also
> > fail those in some other situations, and that seems to work.
> >=20
> > That said, I no longer think this cancelling on timeout is a good
> > idea, since it mismatches what happens on other platforms more than I
> > think we need to.
> >=20
> > My now preferred approach is to revert the timeout changes, but
> > instead allow retries of unplugs to be issued.  I think that's just a
> > matter of resending the unplug message to the guest, while making it
> > otherwise a no-op on the qemu side.
>=20
> Yep, all we need to do is notify QEMU user, so it knows that unplug
> has failed. Then It can decide on it's own what to do with it and also wh=
en.

I'm not sure even that makes sense.  I mean in the cases that the
guest specifically signals failure, then yes, we should definitely
notify the user.  But for the cases the timeout was covering, I'm not
convinced a notification is useful: we *don't* know the unplug has
failed, we only suspect it, and I don't see that qemu really has any
more information than the user about what the expected time for an
unplug should be.

> > > > I believe that's already covered by the existing API:
> > > >=20
> > > >=20
> > > > +# @DEVICE_UNPLUG_ERROR:
> > > > +#
> > > > +# Emitted when a device hot unplug error occurs.
> > > > +#
> > > > +# @device: device name
> > > > +#
> > > > +# @msg: Informative message
> > > >=20
> > > > The 'informative message' would be the reason the event occurred. I=
n patch
> > > > 4/4, for the memory hotunplug refused by the guest, it is being set=
 as:
> > > >=20
> > > >       qapi_error =3D g_strdup_printf("Memory hotunplug rejected by =
the guest "
> > > >                                    "for device %s", dev->id);
> > > >       qapi_event_send_device_unplug_error(dev->id, qapi_error);
> > > >=20
> > > >=20
> > > >=20
> > > > We could use the same DEVICE_UNPLUG_ERROR event in the CPU hotunplu=
g timeout
> > > > case (currently on patch 2/4) by just changing 'msg', e.g.:
> > > >=20
> > > >=20
> > > >       qapi_error =3D g_strdup_printf("CPU hotunplug timeout for dev=
ice %s", dev->id);
> > > >       qapi_event_send_device_unplug_error(dev->id, qapi_error);
> > > >  =20
> > >=20
> > > lets make everything support ACPI (just kidding). =20
> >=20
> > Heh.  If nothing else, doesn't help us with existing guests.
> >=20
> > > maybe we can reuse already existing ACPI_DEVICE_OST instead of DEVICE=
_UNPLUG_ERROR
> > > which sort of does the same thing (and more) but instead of strings u=
ses status codes
> > > defined by spec. =20
> >=20
> > Hmm.  I'm a bit dubious about issuing ACPI messages for a non ACPI
> > guest, but maybe that could work.
>=20
> May be we can rename it to be ACPI agnostic (though I'm not sure how rena=
ming
> QAPI interfaces should be done (it might upset libvirt for example)).
>=20
> (My point was that ACPI spec had already gone through all the trouble def=
ining
> status of completion and documenting it. Also libvirt supports this notif=
ication.
> It looks like worthwhile thing to consider if can somehow reuse it outsid=
e of
> x86 world)

Yeah, that's a fair point.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yzog+coloFKoWSMx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBlIm0ACgkQbDjKyiDZ
s5LZCA/+Ijsvp1dFWk0Viv+DulEPTawJVhvf2n6Oao6HW1Gc97TvlVsEnx0k8zaD
JZUfhTZv9kTy2+iCgIzjgTrQSfIeCeYjQJtoYoRNmaqjklgxo5+8znvKpcCPky1J
X2dldrpwGHICiPu8h3AzHd4gkhKto03dSH/TH3stIMUCmK2oYjq05FMcjMEAm+v4
5iKLN/EstbuYz07Wk4nz4c1CR0VyVcoJDzbno7OIeF1MgZHSA56b5zCd0ktTj282
EXye0d3OlTqoNdjIwyjsy93YEV6uyels2Rxv1LJuiCrRf+wYHteNMoZNHQ7wVsbf
OQzeh7pRoA+ZEOJa8vWR9Oxpxg05ri680R+9NRHCama7jDD47YTeio0OtoVSA3gG
uZZWEofrwNNsJ4qVq7LPcm5dRLUnWbXR7rukM6ahgV874CcdTd7eXpQsssX5/KUJ
fh679jt2VbVLo+jkxwrNphjTWypSKtGTxj0jTAVYy4WVEtxUspo68EAiwE28jxM9
Fv1Is9bRwuXoPWDJuTq9grEJ9envNX8GqTTOx64Na426cgz2c7J7/2Y3JUtYn3YT
9mrKHZCgOukA7lFiP9qL9vHsJTNcPCDpRqQUkNjlYv0dms53t2jk+EirbU57N9eG
LoBNPWaDQGtQetnJFmKjdaXyl3zuQqmZAaABIwJ7D1X6CHl5Pfs=
=Pm8l
-----END PGP SIGNATURE-----

--yzog+coloFKoWSMx--

