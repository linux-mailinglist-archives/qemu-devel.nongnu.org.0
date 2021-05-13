Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6883D37F50A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 11:50:55 +0200 (CEST)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh7za-0000rr-Ej
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 05:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lh7wO-00053G-NA
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:47:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lh7wM-0001V7-7I
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:47:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620899253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vwSfZhDL1X9Kqyj8js0PzzI/M+wvbG9w5dbrh4lcAw0=;
 b=N1ZQZ7e2/Bgmh2dij/l0YXw/dfn1KLO7oV3JTOCXKC8pD0bT8mhxV40i0YmQND7Jg8p1mp
 up90PLXQPm4vlxPpw0Y9WY9HToZizR0IapQt6rWvP+pA4ldHON2FD0B7XNaadIoEcjB/u+
 DXOtYLUu3R+gg8H5ZDmHGKpzKNGBBR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-yOTIXRUxMl-zZkiVY81Bjg-1; Thu, 13 May 2021 05:47:29 -0400
X-MC-Unique: yOTIXRUxMl-zZkiVY81Bjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7087A8005AD;
 Thu, 13 May 2021 09:47:28 +0000 (UTC)
Received: from localhost (ovpn-113-21.ams2.redhat.com [10.36.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A7C66267D;
 Thu, 13 May 2021 09:47:24 +0000 (UTC)
Date: Thu, 13 May 2021 10:47:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YJz1qqXI8z1PQYkM@stefanha-x1.localdomain>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <YIrV9MqlqwUhJR+B@merkur.fritz.box>
 <YIwnI0ML0BEkQ1iE@stefanha-x1.localdomain>
 <YJFPt5BmHXmM5+WE@merkur.fritz.box>
 <YJLFjY9BuOd9/KJx@stefanha-x1.localdomain>
 <YJLL7B249hN6wJTd@merkur.fritz.box>
 <YJOs8JTGyfAb4wXO@stefanha-x1.localdomain>
 <YJPF9KhUWm3tGX9b@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YJPF9KhUWm3tGX9b@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/tDQ44NClz7J3FoM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

--/tDQ44NClz7J3FoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 12:33:24PM +0200, Kevin Wolf wrote:
> Am 06.05.2021 um 10:46 hat Stefan Hajnoczi geschrieben:
> > On Wed, May 05, 2021 at 06:46:36PM +0200, Kevin Wolf wrote:
> > > Am 05.05.2021 um 18:19 hat Stefan Hajnoczi geschrieben:
> > > > On Tue, May 04, 2021 at 03:44:23PM +0200, Kevin Wolf wrote:
> > > > > Am 30.04.2021 um 17:49 hat Stefan Hajnoczi geschrieben:
> > > > > > On Thu, Apr 29, 2021 at 05:51:16PM +0200, Kevin Wolf wrote:
> > > > > > > Am 29.04.2021 um 16:05 hat Stefan Hajnoczi geschrieben:
> > > > > There is one more thing I'm wondering right now: Why do we have s=
eparate
> > > > > states for connecting to the backend (created) and configuring it
> > > > > (initialized)? The property setters check for the right state, bu=
t they
> > > > > don't really do anything that wouldn't be possible in the other s=
tate.
> > > > > A state machine exposed as two boolean rather than a tristate enu=
m feels
> > > > > a bit awkward, too, but even more so if two states could possibly=
 be
> > > > > enough.
> > > > >=20
> > > > > The reason why I'm asking is that in order to address my points, =
it
> > > > > would be best to have separate property accessors for each state,=
 and
> > > > > two pairs of accessors would make property declarations more mana=
gable
> > > > > than three pairs.
> > > >=20
> > > > There is no need to have separate boolean properties, it's just how=
 I
> > > > implemented it. There could be a single state property. For example=
, a
> > > > string that is "uninitialized", "initialized", and "started".
> > >=20
> > > Right. I think this would make the way the API works a bit more obvio=
us,
> > > though it's really only a small detail.
> > >=20
> > > However, my real question was why we even need those three distinct
> > > states. From what I could see so far in the io_uring implemtation,
> > > "uninitialized" and "started" would be enough. Everything that can be
> > > configured in "initialized", could just as well be configured in
> > > "uninitialized" and the state transition would both open the image fi=
le
> > > and apply the configuration in a single step.
> > >=20
> > > Do you have intentions to add features in the future where the three
> > > separate states are actually needed because the user needs to be able=
 to
> > > do something while the image file is already opened, but queue
> > > processing hasn't started yet?
> >=20
> > Yes, three states will be needed. Think of a virtio-blk driver where a
> > VFIO PCI bus address or a vhost-user-blk UNIX domain socket path are
> > needed to connect to the device. After connection completes you then
> > have access to the block queue limits, the number of queues, etc. Once
> > those things are configured the device can be started.
>=20
> You mean, the user of the library would first query some limits before
> deciding on the right values to use for some properties?
>=20
> When the values come directly from the command line, this won't be the
> case anyway, but I agree there may be cases where not the user, but the
> application decides and then the separation would be helpful.
>=20
> > > > > > > Alternatives in QEMU are qdev properties (which are internall=
y QOM
> > > > > > > properties, but provide default implementations and are at le=
ast
> > > > > > > automatically read-only after realize, avoiding that whole cl=
ass of
> > > > > > > bugs) and QAPI.
> > > > > > > If this was QEMU code, I would of course go for QAPI, but a l=
ibrary is
> > > > > > > something different and adding the code generator would proba=
bly be a
> > > > > > > bit too much anyway. But the idea in the resulting code would=
 be dealing
> > > > > > > with native structs instead of a bunch of function calls. Thi=
s would
> > > > > > > probably be the least error prone way for the implementation,=
 but of
> > > > > > > course, it would make binary compatibility a bit harder when =
adding new
> > > > > > > properties.
> > > > > >=20
> > > > > > An alternative I considered was the typestate and builder patte=
rns:
> > > > > >=20
> > > > > >   /* Create a new io_uring driver in the uninitialized state */
> > > > > >   struct blkio_iou_uninit *blkio_new_io_uring(void);
> > > > > >=20
> > > > > >   /* Uninitialized state property setters */
> > > > > >   int blkio_iou_uninit_set_path(struct blkio_iou_uninit *u,
> > > > > >                                 const char *path);
> > > > > >   int blkio_iou_uninit_set_direct(struct blkio_iou_uninit *u,
> > > > > >                                   bool o_direct);
> > > > > >   ...
> > > > > >=20
> > > > > >   /* Transition to initialized state. Frees u on success. */
> > > > > >   struct blkio_iou_init *blkio_iou_init(struct blkio_iou_uninit=
 *u);
> > > > > >=20
> > > > > >   /* Initialized state property setters/getters */
> > > > > >   int blkio_iou_init_get_capacity(struct blkio_iou_init *i,
> > > > > >                                   uint64_t *capacity);
> > > > > >   ...
> > > > > >=20
> > > > > >   /* Transition to started state. Frees i on success. */
> > > > > >   struct blkio_iou_started *blkio_iou_start(struct blkio_iou_in=
it *i);
> > > > > >=20
> > > > > >   ...
> > > > > >=20
> > > > > >   /* Transition back to initialized state. Frees s on success. =
*/
> > > > > >   struct blkio_iou_init *blkio_iou_stop(struct blkio_iou_starte=
d *s);
> > > > > >=20
> > > > > > On the plus side:
> > > > > >=20
> > > > > > - No state checks are needed because an API won't even exist if=
 it's
> > > > > >   unavailable in a given state (uninitialized/initialized/start=
ed).
> > > > > >=20
> > > > > > - State structs come with pre-initialized default values, so th=
e caller
> > > > > >   only needs to set non-default values. For example O_DIRECT is=
 false by
> > > > > >   default and callers happy with that don't need to set the pro=
perty.
> > > > > >=20
> > > > > > - ABI compatibility is easy since the state structs are opaque =
(their
> > > > > >   size is not defined) and new properties can be added at any t=
ime.
> > > > > >=20
> > > > > > On the minus side:
> > > > > >=20
> > > > > > - Completely static. Hard to introspect and requires a dedicate=
d call
> > > > > >   site for each property (applications cannot simply assign a p=
roperty
> > > > > >   string given to them on the command-line). This means every s=
ingle
> > > > > >   property must be explicitly coded into every application :(.
> > > > >=20
> > > > > How are you going to deal with this for QEMU integration, by the =
way?
> > > > > Put all the properties that we know into the QAPI schema and then=
 some
> > > > > way of passing key/value pairs for the rest?
> > > >=20
> > > > In QEMU's case let's define each property explicitly instead of pas=
sing
> > > > them through. That's due to QAPI's philosophy rather than libblkio.
> > >=20
> > > Okay, so new features in libblkio would simply be unaccessible until =
we
> > > update the QAPI schema. Given the overlap in developers, this shouldn=
't
> > > be a problem in the foreseeable future, so this is fine with me.
> >=20
> > Great.
> >=20
> > > > > > - So many functions! This makes understanding the API harder.
> > > > > >=20
> > > > > > - Very verbose. The function and type names get long and there =
is a lot
> > > > > >   of repetition in the API.
> > > > >=20
> > > > > I think it wouldn't be too bad if all drivers exposed the same
> > > > > properties, but you're explicitly expecting driver-specific prope=
rties.
> > > > > If drivers add an external APIs that just fail for other drivers,=
 it
> > > > > would indeed make understanding the API much harder.
> > > > >=20
> > > > > We could consider a mix where you would first create a configurat=
ion
> > > > > object, then use the generic property functions to set options fo=
r it
> > > > > and finally have a separate blkio_initialize() function where you=
 turn
> > > > > that config into a struct blkio that is needed to actually do I/O=
 (and
> > > > > also supports generic property functions for runtime option updat=
es).
> > > > >=20
> > > > > I'm not sure it provides much except making the state machine mor=
e
> > > > > prominent than just two random bool properties.
> > > >=20
> > > > I prefer to keep the configuration public API as it is. We can chan=
ge
> > > > the properties.rs implementation however we want though.
> > > >=20
> > > > Do you think the public API should be a typestate API instead with
> > > > struct blkio_init_info, struct blkio_start_info, and struct blkio
> > > > expressing the 3 states instead?
> > >=20
> > > I just mentioned it as a theoretical option for a middle ground. I'm =
not
> > > sure if it's a good idea, and probably not worth the effort to change
> > > it.
> > >=20
> > > Maybe I would give the state transitions a separate function instead =
of
> > > making them look like normal properties (then they could also use enu=
ms
> > > instead of strings or two bools). But that's not a hard preference
> > > either.
> >=20
> > What do you think about this:
> >=20
> > The blkio instance states are:
> >=20
> >   created -> attached -> started -> destroyed
> >=20
> > It is not possible to go backwards anymore, which simplifies driver
> > implementations and it probably won't be needed by applications.
> >=20
> > The "initialized" state is renamed to "attached" to make it clearer tha=
t
> > this means the block device has been connected/opened. Also
> > "initialized" can be confused with "created".
> >=20
> > The corresponding APIs are:
> >=20
> > int blkio_create(const char *driver, struct blkio **bp, char **errmsg);
> > int blkio_attach(struct blkio *bp, char **errmsg);
> > int blkio_start(struct blkio *bp, char **errmsg);
> > void blkio_destroy(struct blkio **bp);
> >=20
> > There is no way to query the state here, but that probably isn't
> > necessary since an application setting up the blkio instance must
> > already be aware of the state in order to configure it in the first
> > place.
> >=20
> > One advantage of this approach is that it can support network drivers
> > where the attach and start operations can take a long time while regula=
r
> > property accesses do not block.
>=20
> I like this.
>=20
> For properties, I think, each property will have a first state in which
> it becomes available and then it will be available in all later states,
> too.
>=20
> Currently, apart from properties that are always read-only, we only have
> properties that are rw only in their first state and become read-only in
> later states. It might be reasonable to assume that properties will
> exist that can be rw in all later states, too.
>=20
> In their first state, most properties only store the value into the
> config and it's the next state transition that actually makes use of
> them. Similarly, reading usually only reads the value from the config.
> So these parts can be automatically covered. Usually you would then only
> need a custom implementation for property updates after the fact. I
> think this could simplify the driver implementations a lot. I'll play
> with this a bit more.

Hi Kevin,
I posted a patch that introduces blkio_connect() and blkio_start():
https://gitlab.com/libblkio/libblkio/-/merge_requests/4

Stefan

--/tDQ44NClz7J3FoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCc9aoACgkQnKSrs4Gr
c8gisAf/YCIWhcJdD/dZkbpY+qyPgXoIfe4rSStJn2XVtC07l9Yd9p/qfclHwS2r
EZzxySgTiMR8C/SM05fnELKYGLT8k59AkHisN7nspmnjezO+px3QrcAFcrhLLuJr
Z3MS8eOzdo54pQzTpT14kzDrWYmlNwaoaGROvu3bzHVmwZJOZyB5Fb/losEIeSpd
KSBRoc7adogGiRHl9CVBwYa0c3lqK+r8iGKjnvvRkuxU0KxLRoLD08915OjhvmEz
JvKyZFc90me2t3uE/Zx6UM38ovOdqQVkgxIhdBpHYLwwVimawRIB2JeJbtFZDxah
fHInN+qgF03sk+k+89PE0VCCbOHIgg==
=mLDU
-----END PGP SIGNATURE-----

--/tDQ44NClz7J3FoM--


