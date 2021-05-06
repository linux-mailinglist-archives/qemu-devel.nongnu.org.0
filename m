Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEED375113
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:48:53 +0200 (CEST)
Received: from localhost ([::1]:48950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZgh-0005tN-TU
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leZew-0004pw-Eq
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:47:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leZer-0006uS-RF
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620290816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dFdp20eemR4xrFrkAH+O+ZXz8cDfF+3//ZYDdKM7uOY=;
 b=BbgXASYyOBpUA3rt8qRqqnX07KxasfeYTrhh0HHT4rNEWDo+bzi++4YinL/dtjWSJKN6wf
 gYvxA1YX9sv6f0QRX7dKaMD6V2WJ0Mg/v63r+PJoUcrTKqOly/jWu4RBpAcu17nCeMJfRN
 k2nRCP0T37zUf0bD3Sph4/2ELhaW9/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-B88p_OWPPOyGk-MaCtutSg-1; Thu, 06 May 2021 04:46:52 -0400
X-MC-Unique: B88p_OWPPOyGk-MaCtutSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74C2210066E9;
 Thu,  6 May 2021 08:46:50 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE2B05D765;
 Thu,  6 May 2021 08:46:41 +0000 (UTC)
Date: Thu, 6 May 2021 09:46:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YJOs8JTGyfAb4wXO@stefanha-x1.localdomain>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <YIrV9MqlqwUhJR+B@merkur.fritz.box>
 <YIwnI0ML0BEkQ1iE@stefanha-x1.localdomain>
 <YJFPt5BmHXmM5+WE@merkur.fritz.box>
 <YJLFjY9BuOd9/KJx@stefanha-x1.localdomain>
 <YJLL7B249hN6wJTd@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YJLL7B249hN6wJTd@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JOjhy3TdhburXG4R"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

--JOjhy3TdhburXG4R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 06:46:36PM +0200, Kevin Wolf wrote:
> Am 05.05.2021 um 18:19 hat Stefan Hajnoczi geschrieben:
> > On Tue, May 04, 2021 at 03:44:23PM +0200, Kevin Wolf wrote:
> > > Am 30.04.2021 um 17:49 hat Stefan Hajnoczi geschrieben:
> > > > On Thu, Apr 29, 2021 at 05:51:16PM +0200, Kevin Wolf wrote:
> > > > > Am 29.04.2021 um 16:05 hat Stefan Hajnoczi geschrieben:
> > > There is one more thing I'm wondering right now: Why do we have separ=
ate
> > > states for connecting to the backend (created) and configuring it
> > > (initialized)? The property setters check for the right state, but th=
ey
> > > don't really do anything that wouldn't be possible in the other state=
.
> > > A state machine exposed as two boolean rather than a tristate enum fe=
els
> > > a bit awkward, too, but even more so if two states could possibly be
> > > enough.
> > >=20
> > > The reason why I'm asking is that in order to address my points, it
> > > would be best to have separate property accessors for each state, and
> > > two pairs of accessors would make property declarations more managabl=
e
> > > than three pairs.
> >=20
> > There is no need to have separate boolean properties, it's just how I
> > implemented it. There could be a single state property. For example, a
> > string that is "uninitialized", "initialized", and "started".
>=20
> Right. I think this would make the way the API works a bit more obvious,
> though it's really only a small detail.
>=20
> However, my real question was why we even need those three distinct
> states. From what I could see so far in the io_uring implemtation,
> "uninitialized" and "started" would be enough. Everything that can be
> configured in "initialized", could just as well be configured in
> "uninitialized" and the state transition would both open the image file
> and apply the configuration in a single step.
>=20
> Do you have intentions to add features in the future where the three
> separate states are actually needed because the user needs to be able to
> do something while the image file is already opened, but queue
> processing hasn't started yet?

Yes, three states will be needed. Think of a virtio-blk driver where a
VFIO PCI bus address or a vhost-user-blk UNIX domain socket path are
needed to connect to the device. After connection completes you then
have access to the block queue limits, the number of queues, etc. Once
those things are configured the device can be started.

> > > > > Alternatives in QEMU are qdev properties (which are internally QO=
M
> > > > > properties, but provide default implementations and are at least
> > > > > automatically read-only after realize, avoiding that whole class =
of
> > > > > bugs) and QAPI.
> > > > > If this was QEMU code, I would of course go for QAPI, but a libra=
ry is
> > > > > something different and adding the code generator would probably =
be a
> > > > > bit too much anyway. But the idea in the resulting code would be =
dealing
> > > > > with native structs instead of a bunch of function calls. This wo=
uld
> > > > > probably be the least error prone way for the implementation, but=
 of
> > > > > course, it would make binary compatibility a bit harder when addi=
ng new
> > > > > properties.
> > > >=20
> > > > An alternative I considered was the typestate and builder patterns:
> > > >=20
> > > >   /* Create a new io_uring driver in the uninitialized state */
> > > >   struct blkio_iou_uninit *blkio_new_io_uring(void);
> > > >=20
> > > >   /* Uninitialized state property setters */
> > > >   int blkio_iou_uninit_set_path(struct blkio_iou_uninit *u,
> > > >                                 const char *path);
> > > >   int blkio_iou_uninit_set_direct(struct blkio_iou_uninit *u,
> > > >                                   bool o_direct);
> > > >   ...
> > > >=20
> > > >   /* Transition to initialized state. Frees u on success. */
> > > >   struct blkio_iou_init *blkio_iou_init(struct blkio_iou_uninit *u)=
;
> > > >=20
> > > >   /* Initialized state property setters/getters */
> > > >   int blkio_iou_init_get_capacity(struct blkio_iou_init *i,
> > > >                                   uint64_t *capacity);
> > > >   ...
> > > >=20
> > > >   /* Transition to started state. Frees i on success. */
> > > >   struct blkio_iou_started *blkio_iou_start(struct blkio_iou_init *=
i);
> > > >=20
> > > >   ...
> > > >=20
> > > >   /* Transition back to initialized state. Frees s on success. */
> > > >   struct blkio_iou_init *blkio_iou_stop(struct blkio_iou_started *s=
);
> > > >=20
> > > > On the plus side:
> > > >=20
> > > > - No state checks are needed because an API won't even exist if it'=
s
> > > >   unavailable in a given state (uninitialized/initialized/started).
> > > >=20
> > > > - State structs come with pre-initialized default values, so the ca=
ller
> > > >   only needs to set non-default values. For example O_DIRECT is fal=
se by
> > > >   default and callers happy with that don't need to set the propert=
y.
> > > >=20
> > > > - ABI compatibility is easy since the state structs are opaque (the=
ir
> > > >   size is not defined) and new properties can be added at any time.
> > > >=20
> > > > On the minus side:
> > > >=20
> > > > - Completely static. Hard to introspect and requires a dedicated ca=
ll
> > > >   site for each property (applications cannot simply assign a prope=
rty
> > > >   string given to them on the command-line). This means every singl=
e
> > > >   property must be explicitly coded into every application :(.
> > >=20
> > > How are you going to deal with this for QEMU integration, by the way?
> > > Put all the properties that we know into the QAPI schema and then som=
e
> > > way of passing key/value pairs for the rest?
> >=20
> > In QEMU's case let's define each property explicitly instead of passing
> > them through. That's due to QAPI's philosophy rather than libblkio.
>=20
> Okay, so new features in libblkio would simply be unaccessible until we
> update the QAPI schema. Given the overlap in developers, this shouldn't
> be a problem in the foreseeable future, so this is fine with me.

Great.

> > > > - So many functions! This makes understanding the API harder.
> > > >=20
> > > > - Very verbose. The function and type names get long and there is a=
 lot
> > > >   of repetition in the API.
> > >=20
> > > I think it wouldn't be too bad if all drivers exposed the same
> > > properties, but you're explicitly expecting driver-specific propertie=
s.
> > > If drivers add an external APIs that just fail for other drivers, it
> > > would indeed make understanding the API much harder.
> > >=20
> > > We could consider a mix where you would first create a configuration
> > > object, then use the generic property functions to set options for it
> > > and finally have a separate blkio_initialize() function where you tur=
n
> > > that config into a struct blkio that is needed to actually do I/O (an=
d
> > > also supports generic property functions for runtime option updates).
> > >=20
> > > I'm not sure it provides much except making the state machine more
> > > prominent than just two random bool properties.
> >=20
> > I prefer to keep the configuration public API as it is. We can change
> > the properties.rs implementation however we want though.
> >=20
> > Do you think the public API should be a typestate API instead with
> > struct blkio_init_info, struct blkio_start_info, and struct blkio
> > expressing the 3 states instead?
>=20
> I just mentioned it as a theoretical option for a middle ground. I'm not
> sure if it's a good idea, and probably not worth the effort to change
> it.
>=20
> Maybe I would give the state transitions a separate function instead of
> making them look like normal properties (then they could also use enums
> instead of strings or two bools). But that's not a hard preference
> either.

What do you think about this:

The blkio instance states are:

  created -> attached -> started -> destroyed

It is not possible to go backwards anymore, which simplifies driver
implementations and it probably won't be needed by applications.

The "initialized" state is renamed to "attached" to make it clearer that
this means the block device has been connected/opened. Also
"initialized" can be confused with "created".

The corresponding APIs are:

int blkio_create(const char *driver, struct blkio **bp, char **errmsg);
int blkio_attach(struct blkio *bp, char **errmsg);
int blkio_start(struct blkio *bp, char **errmsg);
void blkio_destroy(struct blkio **bp);

There is no way to query the state here, but that probably isn't
necessary since an application setting up the blkio instance must
already be aware of the state in order to configure it in the first
place.

One advantage of this approach is that it can support network drivers
where the attach and start operations can take a long time while regular
property accesses do not block.

Stefan

--JOjhy3TdhburXG4R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCTrPAACgkQnKSrs4Gr
c8g1FQgAn7/VLfR7975aI5UPFNAIwNqUGKM7J4LaxLo7mCbq8SHZd0cgmMYMEb8e
MK4dugq4nwYI+fYf7dEe5Uz2Nn3TBg4p3Ui7k4bauPsXkQZX9DgUneRjzN/TjeLt
c/m/MWoyFMQYgQOKNMSyp225/YBz2eyt+vuR0XYHkCvson1LJnc78jbIyT1jY09t
uSY9GFh5XuEPdzzHzSVkSkS5iR0cD6fUYbiHFm7KhCz0LHhF0IE+SaXWYt/lDEMM
eIC/vYUZa2XdlTxDf33/FxW3y0lT9sqS05CGc5+9a4YOhrTiXMEk8q6zYtftSqlU
KXTjGxPEXyWcopI8KM2rtlA8svHD7A==
=Hn5v
-----END PGP SIGNATURE-----

--JOjhy3TdhburXG4R--


