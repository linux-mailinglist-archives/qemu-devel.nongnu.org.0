Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6413B375273
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 12:35:34 +0200 (CEST)
Received: from localhost ([::1]:37732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lebLx-00042M-6g
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 06:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lebKL-0003Pr-Ef
 for qemu-devel@nongnu.org; Thu, 06 May 2021 06:33:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lebKH-0005Zd-Ky
 for qemu-devel@nongnu.org; Thu, 06 May 2021 06:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620297229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ooIE9Sq/tvJatVbY81ktVJQA1bfRqfUtuv2wLJ970nQ=;
 b=FB/U6bxt5anHk7eHqkjPkPVXtbqHtWidZQLALhcMyMt75JGnToBLN0yFYTpzd949dv55Jo
 Vd0chCZUqaTF7I77EtA7NIlQt0JaqepDgfNKtsGu/kJCnLbmoFpw/ZjqvTagPj8e7ztlRY
 9nOlaygBrreUAPMRVlXQBSnT0ng0PTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-9TqMK-6DPombUbAAKThVmg-1; Thu, 06 May 2021 06:33:36 -0400
X-MC-Unique: 9TqMK-6DPombUbAAKThVmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C2766D241;
 Thu,  6 May 2021 10:33:35 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-167.ams2.redhat.com [10.36.115.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6E8D10016FC;
 Thu,  6 May 2021 10:33:25 +0000 (UTC)
Date: Thu, 6 May 2021 12:33:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YJPF9KhUWm3tGX9b@merkur.fritz.box>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <YIrV9MqlqwUhJR+B@merkur.fritz.box>
 <YIwnI0ML0BEkQ1iE@stefanha-x1.localdomain>
 <YJFPt5BmHXmM5+WE@merkur.fritz.box>
 <YJLFjY9BuOd9/KJx@stefanha-x1.localdomain>
 <YJLL7B249hN6wJTd@merkur.fritz.box>
 <YJOs8JTGyfAb4wXO@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJOs8JTGyfAb4wXO@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JpYZQTFiyJO+DoRV"
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

--JpYZQTFiyJO+DoRV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 06.05.2021 um 10:46 hat Stefan Hajnoczi geschrieben:
> On Wed, May 05, 2021 at 06:46:36PM +0200, Kevin Wolf wrote:
> > Am 05.05.2021 um 18:19 hat Stefan Hajnoczi geschrieben:
> > > On Tue, May 04, 2021 at 03:44:23PM +0200, Kevin Wolf wrote:
> > > > Am 30.04.2021 um 17:49 hat Stefan Hajnoczi geschrieben:
> > > > > On Thu, Apr 29, 2021 at 05:51:16PM +0200, Kevin Wolf wrote:
> > > > > > Am 29.04.2021 um 16:05 hat Stefan Hajnoczi geschrieben:
> > > > There is one more thing I'm wondering right now: Why do we have sep=
arate
> > > > states for connecting to the backend (created) and configuring it
> > > > (initialized)? The property setters check for the right state, but =
they
> > > > don't really do anything that wouldn't be possible in the other sta=
te.
> > > > A state machine exposed as two boolean rather than a tristate enum =
feels
> > > > a bit awkward, too, but even more so if two states could possibly b=
e
> > > > enough.
> > > >=20
> > > > The reason why I'm asking is that in order to address my points, it
> > > > would be best to have separate property accessors for each state, a=
nd
> > > > two pairs of accessors would make property declarations more managa=
ble
> > > > than three pairs.
> > >=20
> > > There is no need to have separate boolean properties, it's just how I
> > > implemented it. There could be a single state property. For example, =
a
> > > string that is "uninitialized", "initialized", and "started".
> >=20
> > Right. I think this would make the way the API works a bit more obvious=
,
> > though it's really only a small detail.
> >=20
> > However, my real question was why we even need those three distinct
> > states. From what I could see so far in the io_uring implemtation,
> > "uninitialized" and "started" would be enough. Everything that can be
> > configured in "initialized", could just as well be configured in
> > "uninitialized" and the state transition would both open the image file
> > and apply the configuration in a single step.
> >=20
> > Do you have intentions to add features in the future where the three
> > separate states are actually needed because the user needs to be able t=
o
> > do something while the image file is already opened, but queue
> > processing hasn't started yet?
>=20
> Yes, three states will be needed. Think of a virtio-blk driver where a
> VFIO PCI bus address or a vhost-user-blk UNIX domain socket path are
> needed to connect to the device. After connection completes you then
> have access to the block queue limits, the number of queues, etc. Once
> those things are configured the device can be started.

You mean, the user of the library would first query some limits before
deciding on the right values to use for some properties?

When the values come directly from the command line, this won't be the
case anyway, but I agree there may be cases where not the user, but the
application decides and then the separation would be helpful.

> > > > > > Alternatives in QEMU are qdev properties (which are internally =
QOM
> > > > > > properties, but provide default implementations and are at leas=
t
> > > > > > automatically read-only after realize, avoiding that whole clas=
s of
> > > > > > bugs) and QAPI.
> > > > > > If this was QEMU code, I would of course go for QAPI, but a lib=
rary is
> > > > > > something different and adding the code generator would probabl=
y be a
> > > > > > bit too much anyway. But the idea in the resulting code would b=
e dealing
> > > > > > with native structs instead of a bunch of function calls. This =
would
> > > > > > probably be the least error prone way for the implementation, b=
ut of
> > > > > > course, it would make binary compatibility a bit harder when ad=
ding new
> > > > > > properties.
> > > > >=20
> > > > > An alternative I considered was the typestate and builder pattern=
s:
> > > > >=20
> > > > >   /* Create a new io_uring driver in the uninitialized state */
> > > > >   struct blkio_iou_uninit *blkio_new_io_uring(void);
> > > > >=20
> > > > >   /* Uninitialized state property setters */
> > > > >   int blkio_iou_uninit_set_path(struct blkio_iou_uninit *u,
> > > > >                                 const char *path);
> > > > >   int blkio_iou_uninit_set_direct(struct blkio_iou_uninit *u,
> > > > >                                   bool o_direct);
> > > > >   ...
> > > > >=20
> > > > >   /* Transition to initialized state. Frees u on success. */
> > > > >   struct blkio_iou_init *blkio_iou_init(struct blkio_iou_uninit *=
u);
> > > > >=20
> > > > >   /* Initialized state property setters/getters */
> > > > >   int blkio_iou_init_get_capacity(struct blkio_iou_init *i,
> > > > >                                   uint64_t *capacity);
> > > > >   ...
> > > > >=20
> > > > >   /* Transition to started state. Frees i on success. */
> > > > >   struct blkio_iou_started *blkio_iou_start(struct blkio_iou_init=
 *i);
> > > > >=20
> > > > >   ...
> > > > >=20
> > > > >   /* Transition back to initialized state. Frees s on success. */
> > > > >   struct blkio_iou_init *blkio_iou_stop(struct blkio_iou_started =
*s);
> > > > >=20
> > > > > On the plus side:
> > > > >=20
> > > > > - No state checks are needed because an API won't even exist if i=
t's
> > > > >   unavailable in a given state (uninitialized/initialized/started=
).
> > > > >=20
> > > > > - State structs come with pre-initialized default values, so the =
caller
> > > > >   only needs to set non-default values. For example O_DIRECT is f=
alse by
> > > > >   default and callers happy with that don't need to set the prope=
rty.
> > > > >=20
> > > > > - ABI compatibility is easy since the state structs are opaque (t=
heir
> > > > >   size is not defined) and new properties can be added at any tim=
e.
> > > > >=20
> > > > > On the minus side:
> > > > >=20
> > > > > - Completely static. Hard to introspect and requires a dedicated =
call
> > > > >   site for each property (applications cannot simply assign a pro=
perty
> > > > >   string given to them on the command-line). This means every sin=
gle
> > > > >   property must be explicitly coded into every application :(.
> > > >=20
> > > > How are you going to deal with this for QEMU integration, by the wa=
y?
> > > > Put all the properties that we know into the QAPI schema and then s=
ome
> > > > way of passing key/value pairs for the rest?
> > >=20
> > > In QEMU's case let's define each property explicitly instead of passi=
ng
> > > them through. That's due to QAPI's philosophy rather than libblkio.
> >=20
> > Okay, so new features in libblkio would simply be unaccessible until we
> > update the QAPI schema. Given the overlap in developers, this shouldn't
> > be a problem in the foreseeable future, so this is fine with me.
>=20
> Great.
>=20
> > > > > - So many functions! This makes understanding the API harder.
> > > > >=20
> > > > > - Very verbose. The function and type names get long and there is=
 a lot
> > > > >   of repetition in the API.
> > > >=20
> > > > I think it wouldn't be too bad if all drivers exposed the same
> > > > properties, but you're explicitly expecting driver-specific propert=
ies.
> > > > If drivers add an external APIs that just fail for other drivers, i=
t
> > > > would indeed make understanding the API much harder.
> > > >=20
> > > > We could consider a mix where you would first create a configuratio=
n
> > > > object, then use the generic property functions to set options for =
it
> > > > and finally have a separate blkio_initialize() function where you t=
urn
> > > > that config into a struct blkio that is needed to actually do I/O (=
and
> > > > also supports generic property functions for runtime option updates=
).
> > > >=20
> > > > I'm not sure it provides much except making the state machine more
> > > > prominent than just two random bool properties.
> > >=20
> > > I prefer to keep the configuration public API as it is. We can change
> > > the properties.rs implementation however we want though.
> > >=20
> > > Do you think the public API should be a typestate API instead with
> > > struct blkio_init_info, struct blkio_start_info, and struct blkio
> > > expressing the 3 states instead?
> >=20
> > I just mentioned it as a theoretical option for a middle ground. I'm no=
t
> > sure if it's a good idea, and probably not worth the effort to change
> > it.
> >=20
> > Maybe I would give the state transitions a separate function instead of
> > making them look like normal properties (then they could also use enums
> > instead of strings or two bools). But that's not a hard preference
> > either.
>=20
> What do you think about this:
>=20
> The blkio instance states are:
>=20
>   created -> attached -> started -> destroyed
>=20
> It is not possible to go backwards anymore, which simplifies driver
> implementations and it probably won't be needed by applications.
>=20
> The "initialized" state is renamed to "attached" to make it clearer that
> this means the block device has been connected/opened. Also
> "initialized" can be confused with "created".
>=20
> The corresponding APIs are:
>=20
> int blkio_create(const char *driver, struct blkio **bp, char **errmsg);
> int blkio_attach(struct blkio *bp, char **errmsg);
> int blkio_start(struct blkio *bp, char **errmsg);
> void blkio_destroy(struct blkio **bp);
>=20
> There is no way to query the state here, but that probably isn't
> necessary since an application setting up the blkio instance must
> already be aware of the state in order to configure it in the first
> place.
>=20
> One advantage of this approach is that it can support network drivers
> where the attach and start operations can take a long time while regular
> property accesses do not block.

I like this.

For properties, I think, each property will have a first state in which
it becomes available and then it will be available in all later states,
too.

Currently, apart from properties that are always read-only, we only have
properties that are rw only in their first state and become read-only in
later states. It might be reasonable to assume that properties will
exist that can be rw in all later states, too.

In their first state, most properties only store the value into the
config and it's the next state transition that actually makes use of
them. Similarly, reading usually only reads the value from the config.
So these parts can be automatically covered. Usually you would then only
need a custom implementation for property updates after the fact. I
think this could simplify the driver implementations a lot. I'll play
with this a bit more.

Kevin

--JpYZQTFiyJO+DoRV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmCTxfQACgkQfwmycsiP
L9Yl4A//Z/Cuk3VAH3kqRBpoqcohFHzE1FtNbwzKnmqSd8SRfbud23aRbJC+Ax6S
1Y2P/oZnjEHHt4JbfYehmzglCjStel6mVxLcGTJ5PsQB/yxeRyv4Fvgjs2MILwuA
eHUT3H34iFBBTPghCsZr7WoN0DT7rr3c1FSiuKVqLlvHN4rBwMa0as5qO7zwCiUw
KI0WAV6PqLRIb49zSCskls2jCBjfFaUD1vycaXMv348iEB4w+6y3zlRWRrtEVnqm
2ppxExy3ucZiaBq82lJ3bPHcdCMIUMTQF/B74xIwHiiPvyfAGfOYdp/dMX8pziea
TsMLlYumXrM7zmHeb0grv8TFVxkjojxL1cmXXiqFly2iI9BdsrZMTW7SR80wmEhj
q7uwXo50pc22U6OmDGHEnmDsjHguSbgmXure63UIR5j4hEQTCa1s33P/A3/4bH7A
wg0UhhGp2iSYxc2/IIVttf3SMq5Hi5Er5yIUfloA2AadGk/SMUfwwlpqBEL/shGD
c9dpJC+KSO/xU88A4FGEd7Y32MjOtfaOlmo2vswEh5pFQeKbCYeZxENI+6jXxoK0
0IuyaO7dmc7/MViaGnCeAyQsxPkS2/wStpVeN8//xkDzvpVsRnH7RgDzy0Ka0hsw
d3Vw45vTLaC910YOq5BkI0GpL/yfucvUYLRmBOht1z7EMEIHh3c=
=0TWl
-----END PGP SIGNATURE-----

--JpYZQTFiyJO+DoRV--


