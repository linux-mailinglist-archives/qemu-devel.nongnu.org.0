Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C60402172
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 01:48:54 +0200 (CEST)
Received: from localhost ([::1]:49254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNOM9-00021P-5J
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 19:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNOHz-00012W-5f; Mon, 06 Sep 2021 19:44:35 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45009 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNOHu-0003Gq-5S; Mon, 06 Sep 2021 19:44:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630971861;
 bh=DV4lrVOZKimkmV5SG3VEodRqN88dZWosvhDRUFWOs98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=httFMzl9ayg9UWpj6zDqIHqvSws4rnJuSx5ZnUl4JjjFfwnjOS2AY5s7DWutkU5W3
 vZIJ2TDLbMydkW+PKQUvzDTuc7X2E3hGjbvO7L5kkJe/5QdgiUMfe/lFZocdf0gBBN
 C4WUFRC57fPLeKCKZ0RX3agb0SH+J6L9u/lu7+ZI=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3Q3T4xwYz9shn; Tue,  7 Sep 2021 09:44:21 +1000 (AEST)
Date: Tue, 7 Sep 2021 09:24:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 5/7] qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR
 QAPI event
Message-ID: <YTajR1sxqg8APAfJ@yekko>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-6-danielhb413@gmail.com>
 <87tuj4a0wx.fsf@dusky.pond.sub.org> <YTLtvn5ywJce0iqE@yekko>
 <874kb0pnlq.fsf@dusky.pond.sub.org>
 <3dad103a-0019-2643-815a-ac9fb08b743e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="20oJoPVHEmZvm+/O"
Content-Disposition: inline
In-Reply-To: <3dad103a-0019-2643-815a-ac9fb08b743e@gmail.com>
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--20oJoPVHEmZvm+/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 09:40:47AM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 9/4/21 8:49 AM, Markus Armbruster wrote:
> > David Gibson <david@gibson.dropbear.id.au> writes:
> >=20
> > > On Wed, Sep 01, 2021 at 03:19:26PM +0200, Markus Armbruster wrote:
> > > > Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> > > >=20
> > > > > At this moment we only provide one event to report a hotunplug er=
ror,
> > > > > MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pse=
ries
> > > > > machine is now able to report unplug errors for other device type=
s, such
> > > > > as CPUs.
> > > > >=20
> > > > > Instead of creating a (device_type)_UNPLUG_ERROR for each new dev=
ice,
> > > > > create a generic DEVICE_UNPLUG_GUEST_ERROR event that can be used=
 by all
> > > > > guest side unplug errors in the future. This event has a similar =
API as
> > > > > the existing DEVICE_DELETED event, always providing the QOM path =
of the
> > > > > device and dev->id if there's any.
> > > > >=20
> > > > > With this new generic event, MEM_UNPLUG_ERROR is now marked as de=
precated.
> > > > >=20
> > > > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > > > ---
> > > >=20
> > > > [...]
> > > >=20
> > > > > diff --git a/qapi/qdev.json b/qapi/qdev.json
> > > > > index 0e9cb2ae88..8b1a1dd43b 100644
> > > > > --- a/qapi/qdev.json
> > > > > +++ b/qapi/qdev.json
> > > > > @@ -84,7 +84,9 @@
> > > > >   #        This command merely requests that the guest begin the =
hot removal
> > > > >   #        process.  Completion of the device removal process is =
signaled with a
> > > > >   #        DEVICE_DELETED event. Guest reset will automatically c=
omplete removal
> > > > > -#        for all devices.
> > > > > +#        for all devices.  If a guest-side error in the hot remo=
val process is
> > > > > +#        detected, the device will not be removed and a DEVICE_U=
NPLUG_GUEST_ERROR
> > > > > +#        event is sent.  Some errors cannot be detected.
> > > > >   #
> > > > >   # Since: 0.14
> > > > >   #
> > > > > @@ -124,3 +126,27 @@
> > > > >   ##
> > > > >   { 'event': 'DEVICE_DELETED',
> > > > >     'data': { '*device': 'str', 'path': 'str' } }
> > > > > +
> > > > > +##
> > > > > +# @DEVICE_UNPLUG_GUEST_ERROR:
> > > > > +#
> > > > > +# Emitted when a device hot unplug fails due to an internal guest
> > > > > +# error.
> > > >=20
> > > > Suggest to scratch "internal".
> > >=20
> > > I'd suggest s/internal guest/guest reported/.  "guest error" is a bit
> > > vague, this doesn't neccessarily indicate a bug in the guest.  The key
> > > point is that we're reporting this event because the guest performed
> > > some explicit action to tell us something went wrong with the plug
> > > attempt.
> >=20
> > Yes, that's better.
>=20
>=20
> I agree.  David, let me know if you need another spin with this
> change.

Yes please.  I'm afraid I kind of lost track of the last posting.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--20oJoPVHEmZvm+/O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2o0UACgkQbDjKyiDZ
s5L6vRAAylf/b4LldWuz2SKZswpFB/OGfGsE9KkpsyCVVOTl3JLnOQxpDdsisXSr
BCqU6K0RyqdDnSnRKpsAyxM8ChyCynCW1xuPyvXGYajtGVZ47/L0hlJ/Qj/jG3tv
ajgLia+A5PaiJxVlTrZTM85PN8evwxBTnw4PhLoCSwHw/mjK/ZwHCy+oo7W72GV4
AY+ZM869KBx7EzL2aLHYn9m/zHKK/K8oN8dotCjYbFzMiIKJlIkpGnoInIsorsfH
KYnjCmn9UmY8M946Iv1lUbvedlJY0+OPj6KqTqwnz5k/iWja4PKD8LG4txZJkEUm
DVC4oAQLZCWwawjfrQ2XM7zlUmoyShvX9c+uh4dAXowAnLuI51DOcMzpV9uAUnnY
2rS0LdPk7FUpv8sJwSr3a9QKklMJukEhJn1qJoKXqHKjpssjsFtVPE+4Y1q8NbCW
MBSN/3GG3qkdBLio7Ow1l+xzPYpUTdKjhRanfWU1+2NOSIsomC3EHiGa2zmAN2/6
SK8gGdICCjB2EGgy9+KwowgiewobeFgK4H4oqP7wjJqmdCkllANXU29yIgjp18Qd
/Y75dalvoZ2ESaBaZz6sGzh+mh+nIP4fzEUHbJ6DM+Y58M7BTPSbjiN5S9krC+NH
ykiQYhC+Wxx9d0DGuke/F4YPhOdDuSlh1x21EJxnrncQA4gJECg=
=hQce
-----END PGP SIGNATURE-----

--20oJoPVHEmZvm+/O--

