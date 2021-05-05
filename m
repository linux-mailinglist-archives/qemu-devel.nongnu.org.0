Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F63037432B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:57:37 +0200 (CEST)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKq8-0001GO-KG
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leKgH-000318-GR
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:47:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leKg7-0004qe-P9
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620233233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sjbu0QwBrYJv3riAhlQyjG9Ryta0sXJ7sCKGJu7mhNc=;
 b=T1xNBuw51nRhPowJ1i2IzX4beRaNK34P6517xOojXHyyjDTc6UfQdmBVTFRytBkkrbIDq5
 413O/Yx5yRyWxr71TvYs6ZAaLSJogdR9rAcmqs48f9zxt+X/PvhemCNp5q3BKcPFYMPJ8q
 sUEv638Sq+XmZrxbVYezVglaB0AYCxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-lUIT3G-vPX2fkp4H3aijXQ-1; Wed, 05 May 2021 12:46:49 -0400
X-MC-Unique: lUIT3G-vPX2fkp4H3aijXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D70356D5C5;
 Wed,  5 May 2021 16:46:47 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-138.ams2.redhat.com [10.36.115.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CB0E19C46;
 Wed,  5 May 2021 16:46:37 +0000 (UTC)
Date: Wed, 5 May 2021 18:46:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YJLL7B249hN6wJTd@merkur.fritz.box>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <YIrV9MqlqwUhJR+B@merkur.fritz.box>
 <YIwnI0ML0BEkQ1iE@stefanha-x1.localdomain>
 <YJFPt5BmHXmM5+WE@merkur.fritz.box>
 <YJLFjY9BuOd9/KJx@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJLFjY9BuOd9/KJx@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ztUnWm08Ll4XASug"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pkrempa@redhat.com, Alberto Garcia <berto@igalia.com>, slp@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, rjones@redhat.com,
 mreitz@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Klaus Jensen <its@irrelevant.dk>, philmd@redhat.com,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ztUnWm08Ll4XASug
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 05.05.2021 um 18:19 hat Stefan Hajnoczi geschrieben:
> On Tue, May 04, 2021 at 03:44:23PM +0200, Kevin Wolf wrote:
> > Am 30.04.2021 um 17:49 hat Stefan Hajnoczi geschrieben:
> > > On Thu, Apr 29, 2021 at 05:51:16PM +0200, Kevin Wolf wrote:
> > > > Am 29.04.2021 um 16:05 hat Stefan Hajnoczi geschrieben:
> > There is one more thing I'm wondering right now: Why do we have separat=
e
> > states for connecting to the backend (created) and configuring it
> > (initialized)? The property setters check for the right state, but they
> > don't really do anything that wouldn't be possible in the other state.
> > A state machine exposed as two boolean rather than a tristate enum feel=
s
> > a bit awkward, too, but even more so if two states could possibly be
> > enough.
> >=20
> > The reason why I'm asking is that in order to address my points, it
> > would be best to have separate property accessors for each state, and
> > two pairs of accessors would make property declarations more managable
> > than three pairs.
>=20
> There is no need to have separate boolean properties, it's just how I
> implemented it. There could be a single state property. For example, a
> string that is "uninitialized", "initialized", and "started".

Right. I think this would make the way the API works a bit more obvious,
though it's really only a small detail.

However, my real question was why we even need those three distinct
states. From what I could see so far in the io_uring implemtation,
"uninitialized" and "started" would be enough. Everything that can be
configured in "initialized", could just as well be configured in
"uninitialized" and the state transition would both open the image file
and apply the configuration in a single step.

Do you have intentions to add features in the future where the three
separate states are actually needed because the user needs to be able to
do something while the image file is already opened, but queue
processing hasn't started yet?

> > > > Alternatives in QEMU are qdev properties (which are internally QOM
> > > > properties, but provide default implementations and are at least
> > > > automatically read-only after realize, avoiding that whole class of
> > > > bugs) and QAPI.
> > > > If this was QEMU code, I would of course go for QAPI, but a library=
 is
> > > > something different and adding the code generator would probably be=
 a
> > > > bit too much anyway. But the idea in the resulting code would be de=
aling
> > > > with native structs instead of a bunch of function calls. This woul=
d
> > > > probably be the least error prone way for the implementation, but o=
f
> > > > course, it would make binary compatibility a bit harder when adding=
 new
> > > > properties.
> > >=20
> > > An alternative I considered was the typestate and builder patterns:
> > >=20
> > >   /* Create a new io_uring driver in the uninitialized state */
> > >   struct blkio_iou_uninit *blkio_new_io_uring(void);
> > >=20
> > >   /* Uninitialized state property setters */
> > >   int blkio_iou_uninit_set_path(struct blkio_iou_uninit *u,
> > >                                 const char *path);
> > >   int blkio_iou_uninit_set_direct(struct blkio_iou_uninit *u,
> > >                                   bool o_direct);
> > >   ...
> > >=20
> > >   /* Transition to initialized state. Frees u on success. */
> > >   struct blkio_iou_init *blkio_iou_init(struct blkio_iou_uninit *u);
> > >=20
> > >   /* Initialized state property setters/getters */
> > >   int blkio_iou_init_get_capacity(struct blkio_iou_init *i,
> > >                                   uint64_t *capacity);
> > >   ...
> > >=20
> > >   /* Transition to started state. Frees i on success. */
> > >   struct blkio_iou_started *blkio_iou_start(struct blkio_iou_init *i)=
;
> > >=20
> > >   ...
> > >=20
> > >   /* Transition back to initialized state. Frees s on success. */
> > >   struct blkio_iou_init *blkio_iou_stop(struct blkio_iou_started *s);
> > >=20
> > > On the plus side:
> > >=20
> > > - No state checks are needed because an API won't even exist if it's
> > >   unavailable in a given state (uninitialized/initialized/started).
> > >=20
> > > - State structs come with pre-initialized default values, so the call=
er
> > >   only needs to set non-default values. For example O_DIRECT is false=
 by
> > >   default and callers happy with that don't need to set the property.
> > >=20
> > > - ABI compatibility is easy since the state structs are opaque (their
> > >   size is not defined) and new properties can be added at any time.
> > >=20
> > > On the minus side:
> > >=20
> > > - Completely static. Hard to introspect and requires a dedicated call
> > >   site for each property (applications cannot simply assign a propert=
y
> > >   string given to them on the command-line). This means every single
> > >   property must be explicitly coded into every application :(.
> >=20
> > How are you going to deal with this for QEMU integration, by the way?
> > Put all the properties that we know into the QAPI schema and then some
> > way of passing key/value pairs for the rest?
>=20
> In QEMU's case let's define each property explicitly instead of passing
> them through. That's due to QAPI's philosophy rather than libblkio.

Okay, so new features in libblkio would simply be unaccessible until we
update the QAPI schema. Given the overlap in developers, this shouldn't
be a problem in the foreseeable future, so this is fine with me.

> > > - So many functions! This makes understanding the API harder.
> > >=20
> > > - Very verbose. The function and type names get long and there is a l=
ot
> > >   of repetition in the API.
> >=20
> > I think it wouldn't be too bad if all drivers exposed the same
> > properties, but you're explicitly expecting driver-specific properties.
> > If drivers add an external APIs that just fail for other drivers, it
> > would indeed make understanding the API much harder.
> >=20
> > We could consider a mix where you would first create a configuration
> > object, then use the generic property functions to set options for it
> > and finally have a separate blkio_initialize() function where you turn
> > that config into a struct blkio that is needed to actually do I/O (and
> > also supports generic property functions for runtime option updates).
> >=20
> > I'm not sure it provides much except making the state machine more
> > prominent than just two random bool properties.
>=20
> I prefer to keep the configuration public API as it is. We can change
> the properties.rs implementation however we want though.
>=20
> Do you think the public API should be a typestate API instead with
> struct blkio_init_info, struct blkio_start_info, and struct blkio
> expressing the 3 states instead?

I just mentioned it as a theoretical option for a middle ground. I'm not
sure if it's a good idea, and probably not worth the effort to change
it.

Maybe I would give the state transitions a separate function instead of
making them look like normal properties (then they could also use enums
instead of strings or two bools). But that's not a hard preference
either.

Kevin

--ztUnWm08Ll4XASug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmCSy+wACgkQfwmycsiP
L9ZC9A/+MluKB/wpDl/M4RTXusn4gaLLLnniVKEWJSuroZSkjZmaacnDvpRfnKnY
DkYrEjQ9eLzNJhJlEZrXQmRWzAA2SHbcd5kB9JY478+hQKrzA0xgeJy/6DDt0tAh
j9f6uS0qrSdIz7KmeaEjtYo17Qlp6ChCNtue94shyYMC+3c9uv8dsX3A8FhpK7lB
1tgx/K68xwX2kMyc9LyPD6Usi0wS8g3qb06UO34vwBcMjYq2Zde2KhgYpiD/cOL0
+Qa4D1r7r8MZIX98VAAY3rdN99L/k0/JgAv8la3XnjsLA4NOA7Gh7fymH/38a8wZ
rrdL6y25aDrDwEy/xTjQJXfNGP0puAjdcC7l2OgMinsHwI5YHW7nLpERqyci5e6C
TU/AYlo8kPkij2lAdqq4ZeMsSgHVdNl6STQqlRWcif8rqigR72kj5HNeeB2Uzedm
MEY527ncfYslOPiTnfsjebRy+IVqemFS2SmjuIHOzbX6ineP1u1QlDXcO1tuX4qR
y7LmlcMQsa0CK/TGicUQpZ6BvNlYyNM7TZJgeSbW3OFctmlUJENY2i4IC+xcAy0i
bn8cVMahufvusILFIBHZtGE+jaF0QY3g2BXDfjb017dTFNgRYBJk137J7VYrUb0e
Zyh2FjIsu0tZN/cfqNQ50KlPk2jlrmz1031PMaETGeXsUcfVzFM=
=1S1p
-----END PGP SIGNATURE-----

--ztUnWm08Ll4XASug--


