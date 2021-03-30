Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F61534F548
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 02:07:08 +0200 (CEST)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lROO2-0005cP-Ss
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 20:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lROLK-0004F8-Id; Tue, 30 Mar 2021 20:04:18 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lROLH-0002ut-1I; Tue, 30 Mar 2021 20:04:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F96486lqRz9sXV; Wed, 31 Mar 2021 11:04:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617149048;
 bh=SkfQm7fz/LII+f4/3Nsdx4I3klgREj5HqQD7IjlASuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RlZDl2fzKLSCfCi1svlcZpXnur8fzrObD0Q8hqqLTfmqYZ/cKSCHn/YqOWx+wjaAa
 WT8F+0dKEMJ/2VrKEGFuTr5uioc/etV/fGgbN0c1l+hdEe4etoDKe3M53vEU9qUSdr
 AANzsODH2zJyel0qb7uTvjK6t6ksOYTGpH1/bba8=
Date: Wed, 31 Mar 2021 10:46:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
Message-ID: <YGO4aXzC6uEC3e/U@yekko.fritz.box>
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <YFlAheldkqCkZytI@yekko.fritz.box>
 <b8d96ab9-61e5-b941-6405-5beff5fe0df5@gmail.com>
 <YFqYkuBSD3xPgLVi@yekko.fritz.box>
 <ba20de28-d65b-6da4-5bff-92b637cf7a56@gmail.com>
 <20210330012831.2ce0514c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2tfGw/gQSxyxBh1z"
Content-Disposition: inline
In-Reply-To: <20210330012831.2ce0514c@redhat.com>
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
Cc: groug@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2tfGw/gQSxyxBh1z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 01:28:31AM +0200, Igor Mammedov wrote:
> On Wed, 24 Mar 2021 16:09:59 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>=20
> > On 3/23/21 10:40 PM, David Gibson wrote:
> > > On Tue, Mar 23, 2021 at 02:10:22PM -0300, Daniel Henrique Barboza wro=
te: =20
> > >>
> > >>
> > >> On 3/22/21 10:12 PM, David Gibson wrote: =20
> > >>> On Fri, Mar 12, 2021 at 05:07:36PM -0300, Daniel Henrique Barboza w=
rote: =20
> > >>>> Hi,
> > >>>>
> > >>>> This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
> > >>>> DEVICE_UNPLUG_ERROR. They were (and are still being) discussed in =
[1].
> > >>>>
> > >>>> Patches 1 and 3 are independent of the ppc patches and can be appl=
ied
> > >>>> separately. Patches 2 and 4 are based on David's ppc-for-6.0 branc=
h and
> > >>>> are dependent on the QAPI patches. =20
> > >>>
> > >>> Implementation looks fine, but I think there's a bit more to discuss
> > >>> before we can apply.
> > >>>
> > >>> I think it would make sense to re-order this and put UNPLUG_ERROR
> > >>> first.  Its semantics are clearer, and I think there's a stronger c=
ase
> > >>> for it. =20
> > >>
> > >> Alright
> > >> =20
> > >>>
> > >>> I'm a bit less sold on DEVICE_NOT_DELETED, after consideration.  Do=
es
> > >>> it really tell the user/management anything useful beyond what
> > >>> receiving neither a DEVICE_DELETED nor a DEVICE_UNPLUG_ERROR does? =
=20
> > >>
> > >>
> > >> It informs that the hotunplug operation exceed the timeout that QEMU
> > >> internals considers adequate, but QEMU can't assert that it was caus=
ed
> > >> by an error or an unexpected delay. The end result is that the device
> > >> is not going to be deleted from QMP, so DEVICE_NOT_DELETED. =20
> > >=20
> > > Is it, though?  I mean, it is with this implementation for papr:
> > > because we clear the unplug_requested flag, even if the guest later
> > > tries to complete the unplug, it will fail.
> > >=20
> > > But if I understand what Markus was saying correctly, that might not
> > > be possible for all hotplug systems.  I believe Markus was suggesting
> > > that DEVICE_NOT_DELETED could just mean that we haven't deleted the
> > > device yet, but it could still happen later.
> > >=20
> > > And in that case, I'm not yet sold on the value of a message that
> > > essentially just means "Ayup, still dunno what's happening, sorry".
> > >  =20
> > >> Perhaps we should just be straightforward and create a DEVICE_UNPLUG=
_TIMEOUT
> > >> event. =20
> > >=20
> > > Hm... what if we added a "reason" field to UNPLUG_ERROR.  That could
> > > be "guest rejected hotplug", or something more specific, in the rare
> > > case that the guest has a way of signalling something more specific,
> > > or "timeout" - but the later *only* to be sent in cases where on the
> > > timeout we're able to block any later completion of the unplug (as we
> > > can on papr).
>=20
> Is canceling unplug on timeout documented somewhere (like some spec)?

Uh.. not as such.  In the PAPR model, hotplugs and unplugs are mostly
guest directed, so the question doesn't really arise.

> If not it might (theoretically) confuse guest when it tries to unplug
> after timeout and leave guest in some unexpected state.

Possible, but probably not that likely.  The mechanism we use to
"cancel" the hotplugs is that we just fail the hypercalls that the
guest will need to call to actually complete the hotplug.  We also
fail those in some other situations, and that seems to work.

That said, I no longer think this cancelling on timeout is a good
idea, since it mismatches what happens on other platforms more than I
think we need to.

My now preferred approach is to revert the timeout changes, but
instead allow retries of unplugs to be issued.  I think that's just a
matter of resending the unplug message to the guest, while making it
otherwise a no-op on the qemu side.

> > I believe that's already covered by the existing API:
> >=20
> >=20
> > +# @DEVICE_UNPLUG_ERROR:
> > +#
> > +# Emitted when a device hot unplug error occurs.
> > +#
> > +# @device: device name
> > +#
> > +# @msg: Informative message
> >=20
> > The 'informative message' would be the reason the event occurred. In pa=
tch
> > 4/4, for the memory hotunplug refused by the guest, it is being set as:
> >=20
> >       qapi_error =3D g_strdup_printf("Memory hotunplug rejected by the =
guest "
> >                                    "for device %s", dev->id);
> >       qapi_event_send_device_unplug_error(dev->id, qapi_error);
> >=20
> >=20
> >=20
> > We could use the same DEVICE_UNPLUG_ERROR event in the CPU hotunplug ti=
meout
> > case (currently on patch 2/4) by just changing 'msg', e.g.:
> >=20
> >=20
> >       qapi_error =3D g_strdup_printf("CPU hotunplug timeout for device =
%s", dev->id);
> >       qapi_event_send_device_unplug_error(dev->id, qapi_error);
> >=20
>=20
> lets make everything support ACPI (just kidding).

Heh.  If nothing else, doesn't help us with existing guests.

> maybe we can reuse already existing ACPI_DEVICE_OST instead of DEVICE_UNP=
LUG_ERROR
> which sort of does the same thing (and more) but instead of strings uses =
status codes
> defined by spec.

Hmm.  I'm a bit dubious about issuing ACPI messages for a non ACPI
guest, but maybe that could work.

> Idea similar to DEVICE_UNPLUG_ERROR was considered back then, but instead=
 of QEMU being
> a poor translator of status codes to non machine-readable strings we went=
 with
> exposing well documented status codes to user. This way user can implement
> specific reactions to particular errors just looking at JSON + spec.
>=20
> > Thanks,
> >=20
> > DHB
> >=20
> >=20
> > >=20
> > > Thoughs, Markus?
> > >  =20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2tfGw/gQSxyxBh1z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBjuGkACgkQbDjKyiDZ
s5JE5Q//WKn6fM1QfaqQmWh6bH7GNhV91cCEIGdjxDxj1lx4/Pf4dhT7lu7jGvR0
iBFH7K4ydosvMEziLcfz+3YomfMPP/MJA5tCckmdf9wZaoSJ7xhX6A/I3g2Cekmk
XTU5PHdKrCbYJLkFpPImQXS2ixJ6azCcd7NM09uei8kSlo/QfcKuOXMhoS/tuQkD
m1UUV0Cni2ARQwZ8vzhRwqnLJ2/NTqohqICXxZvTy7PL14jZhxxSI4hjJIgpF875
2O6aFaRUWGrnW/iJe9IxyqvzOXo+I4F3BvPX64GwuMuGN528jTZmxQAiYf+prbCN
CfouX8yfAA+8cri5Lz+k5Sk612cEZmKCwQOHi9BF+jgDQfXbFH2WrCYCKSGUIlxe
/FpzlSrxB/xfJukhw+2PA3N9oHDn32RAZhRevlMQ37heZvo6q8ZoQ5aMuA8UinPN
h9jZw7ep9XkPR+5RaIpAyq0SnOQLyEW/1NJboO6usDcsfnK6MwIzXn+8gk37WlGd
WfyKg2D2cyX6EcyEGice+TLdGCX/O8HKqwpfa88EnOX6vMLwipKNe4u/vw8yKPQ+
y+B4SQ9SCVEtFJVfgjejYKzDdsKETnUYvCFVL5qcinOVUF5ctIWwKy8RuL3wZ/0E
FZkvA0yJkj1ZskSwZ6O3qbS2vLBbTh8sNJug6x34BZ7ZBr8JoJU=
=ulax
-----END PGP SIGNATURE-----

--2tfGw/gQSxyxBh1z--

