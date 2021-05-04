Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC3372B54
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 15:47:18 +0200 (CEST)
Received: from localhost ([::1]:44788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvOP-0005Br-AK
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 09:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldvM7-0004Mt-33
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldvLw-0000Ec-Ir
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620135883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NYel1+SQhFmwZGMQpCCoiBgaU9cf8/HCx5E/b6cBp5s=;
 b=Gx9TsH3wfp/tZpOpwNP21QxjDHckRzse5uidaN5FxsKuYoyo2LM/gDqQZldPY3FdJWIoKe
 VYCig0um8VvjENi4qX/CeerIsZ8Aay4OLzBVRUd8OnJfdBcn+CUlgynlB8R0UXQ+3pzovu
 /iotcvwtcQLkrKHROzBRVwdzliMY8RA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-ZEptYHytNzOLgFLWoVGWUg-1; Tue, 04 May 2021 09:44:38 -0400
X-MC-Unique: ZEptYHytNzOLgFLWoVGWUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73235835DEE;
 Tue,  4 May 2021 13:44:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-48.ams2.redhat.com [10.36.114.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBBE2421F;
 Tue,  4 May 2021 13:44:24 +0000 (UTC)
Date: Tue, 4 May 2021 15:44:23 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YJFPt5BmHXmM5+WE@merkur.fritz.box>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <YIrV9MqlqwUhJR+B@merkur.fritz.box>
 <YIwnI0ML0BEkQ1iE@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YIwnI0ML0BEkQ1iE@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ae2bpONtDVGHgMu4"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pkrempa@redhat.com, Alberto Garcia <berto@igalia.com>, slp@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, rjones@redhat.com,
 mreitz@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Klaus Jensen <its@irrelevant.dk>, philmd@redhat.com,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Ae2bpONtDVGHgMu4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 30.04.2021 um 17:49 hat Stefan Hajnoczi geschrieben:
> On Thu, Apr 29, 2021 at 05:51:16PM +0200, Kevin Wolf wrote:
> > Am 29.04.2021 um 16:05 hat Stefan Hajnoczi geschrieben:
> > > Hi,
> > > A preview release of libblkio, a library for high-performance block I=
/O,
> > > is now available:
> > >=20
> > >   https://gitlab.com/libblkio/libblkio/-/tree/v0.1.0
> > >=20
> > > Applications are increasingly integrating high-performance I/O
> > > interfaces such as Linux io_uring, userspace device drivers, and
> > > vhost-user device support. The effort required to add each of these
> > > low-level interfaces into an application is relatively high. libblkio
> > > provides a single API for efficiently accessing block devices and
> > > eliminates the need to write custom code for each one.
> > >=20
> > > The library is not yet ready to use and currently lacks many features=
.
> > > In fact, I hope this news doesn't spread too far yet because libblkio=
 is
> > > at a very early stage, but feedback from the QEMU community is necess=
ary
> > > at this time.
> >=20
> > I'm a bit worried about the configuration interface. This looks an awfu=
l
> > lot like plain QOM properties, which have proven to result in both very
> > verbose (not to say messy) and rather error prone implementations.
> >=20
> > You have to write setters/getters for every property, even if it usuall=
y
> > ends up doing the same thing, storing the value somewhere. Worse, these
> > getters and setters have to work in very different circumstances, namel=
y
> > initialisation where you usually have to store the value away so that i=
t
> > can be checked for consistency with other properties in .realize() or
> > .complete(), and property updates during runtime. Often enough, we
> > forget the latter and create bugs. If we don't create bugs, we usually
> > start with 'if (realized)' and have two completely different code paths=
.
> > Another common bug in QOM objects is forgetting to check if mandatory
> > properties were actually set.
> >
> > Did you already consider these problems and decided to go this way
> > anyway, or is this more of an accidental design? And if the former, wha=
t
> > were the reasons that made it appealing?
>=20
> That's true. Here is the code to reject accesses when the instance is
> not initialized:
>=20
>   self.must_be_initialized()?;
>=20
> It's very concise but you still need to remember to add it.

Yes, I think the problem isn't the length (in QOM it's commonly four
lines because we don't inline it like that, but same complexity really),
but remembering to have it there.

> The overall reasons for choosing the properties API were:
>=20
> 1. It keeps the library's API very minimal (just generic getters/setters
>    for primitive types). It minimizes ABI compatibility issues because
>    there are no configuration structs or functions exported by the
>    library.
>=20
> 2. It's trivial to have a string setter/getter that automatically
>    converts to the primitive type representation, so application config
>    file or command-line values can easily be set.
>=20
>    This is kind of the inverse of what you're saying. If the library
>    offers dedicated interfaces for each configuration value then the
>    library doesn't need getters/setters for each one but all
>    applications need special-purpose code for each configuration value.
>=20
> That said, this is exactly why I published the preview release. If
> someone has a better way to do this or the feedback is just that this is
> bad style, then I'm happy to change it.

I can see the advantages in this. Maybe the problem that I'm seeing is
more about implementing drivers in the Rust code rather than the
external interface in C.

I've been playing a bit with this and maybe a good part of it can be
abstracted away (maybe a bit like qdev properties abstract the
complexity of QOM properties away). If I get somewhere with this, I can
send patches.

There is one more thing I'm wondering right now: Why do we have separate
states for connecting to the backend (created) and configuring it
(initialized)? The property setters check for the right state, but they
don't really do anything that wouldn't be possible in the other state.
A state machine exposed as two boolean rather than a tristate enum feels
a bit awkward, too, but even more so if two states could possibly be
enough.

The reason why I'm asking is that in order to address my points, it
would be best to have separate property accessors for each state, and
two pairs of accessors would make property declarations more managable
than three pairs.

> > Alternatives in QEMU are qdev properties (which are internally QOM
> > properties, but provide default implementations and are at least
> > automatically read-only after realize, avoiding that whole class of
> > bugs) and QAPI.
> > If this was QEMU code, I would of course go for QAPI, but a library is
> > something different and adding the code generator would probably be a
> > bit too much anyway. But the idea in the resulting code would be dealin=
g
> > with native structs instead of a bunch of function calls. This would
> > probably be the least error prone way for the implementation, but of
> > course, it would make binary compatibility a bit harder when adding new
> > properties.
>=20
> An alternative I considered was the typestate and builder patterns:
>=20
>   /* Create a new io_uring driver in the uninitialized state */
>   struct blkio_iou_uninit *blkio_new_io_uring(void);
>=20
>   /* Uninitialized state property setters */
>   int blkio_iou_uninit_set_path(struct blkio_iou_uninit *u,
>                                 const char *path);
>   int blkio_iou_uninit_set_direct(struct blkio_iou_uninit *u,
>                                   bool o_direct);
>   ...
>=20
>   /* Transition to initialized state. Frees u on success. */
>   struct blkio_iou_init *blkio_iou_init(struct blkio_iou_uninit *u);
>=20
>   /* Initialized state property setters/getters */
>   int blkio_iou_init_get_capacity(struct blkio_iou_init *i,
>                                   uint64_t *capacity);
>   ...
>=20
>   /* Transition to started state. Frees i on success. */
>   struct blkio_iou_started *blkio_iou_start(struct blkio_iou_init *i);
>=20
>   ...
>=20
>   /* Transition back to initialized state. Frees s on success. */
>   struct blkio_iou_init *blkio_iou_stop(struct blkio_iou_started *s);
>=20
> On the plus side:
>=20
> - No state checks are needed because an API won't even exist if it's
>   unavailable in a given state (uninitialized/initialized/started).
>=20
> - State structs come with pre-initialized default values, so the caller
>   only needs to set non-default values. For example O_DIRECT is false by
>   default and callers happy with that don't need to set the property.
>=20
> - ABI compatibility is easy since the state structs are opaque (their
>   size is not defined) and new properties can be added at any time.
>=20
> On the minus side:
>=20
> - Completely static. Hard to introspect and requires a dedicated call
>   site for each property (applications cannot simply assign a property
>   string given to them on the command-line). This means every single
>   property must be explicitly coded into every application :(.

How are you going to deal with this for QEMU integration, by the way?
Put all the properties that we know into the QAPI schema and then some
way of passing key/value pairs for the rest?

> - So many functions! This makes understanding the API harder.
>=20
> - Very verbose. The function and type names get long and there is a lot
>   of repetition in the API.

I think it wouldn't be too bad if all drivers exposed the same
properties, but you're explicitly expecting driver-specific properties.
If drivers add an external APIs that just fail for other drivers, it
would indeed make understanding the API much harder.

We could consider a mix where you would first create a configuration
object, then use the generic property functions to set options for it
and finally have a separate blkio_initialize() function where you turn
that config into a struct blkio that is needed to actually do I/O (and
also supports generic property functions for runtime option updates).

I'm not sure it provides much except making the state machine more
prominent than just two random bool properties.

Kevin

--Ae2bpONtDVGHgMu4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmCRT7cACgkQfwmycsiP
L9ZVxA/7B6Caa59KZo8FzatXGwEefDrkA3ROIdPcdrwHCrHIn6mfiNBHz2vhC15p
j1JQxhoZ8HTCghaO4l9NzwXeET+if6EFvVOd/AN4FKBI79x2Y3/wQDKopcmaKJ3f
a7c4Wc25k/ENeNxiqf97yBM1PCws0FQi2V09j5XwvII3fP1iYutNv912vk6EYo/w
XVsYdtFgM0MznDpT15/Iaklg9OcR9HCIuKXFE0Mds4JKznjRkP+Y6j60J0yTcLUp
weH+oenV1RQ4T2ng90voTIQIydO/OCuWzk+dZRuTBG9gvF9G25FJWqZz+IxQjTZD
Cmpdq2h7G3EC90j35qB1FW5whzhXyIEONoWuJ0JziYrjAzPQLqBoHawRHQHW5S3C
z1iMylRRwU0vpeOEPNmgGL2Q7SkVpH0RnlNSpHph2ef8+Funv1iCzHkyQnoYgd6a
pVsl9beAfofpUF7f8UgPz0JzCtTYRqlsGBvZ2OUyWx1FMPjAIIrEWu+mZg3CgfRz
yVHLpvpPL9Ex+rlZi7ubg3QNsjOBjcdwqCsB+C3n6Tfo69vQKoS/uJGtNq+IzNp0
1oI4eIc9hgucZBv5e+BPIgbla6S9/kcjzvZMvYesRarnvmABh4/ilmaiyqP0sYOQ
4Qx89LrnWExSFStSMZJg1Np4E4OTUiDbaFRSiu/zdH2RauQdyKI=
=7iui
-----END PGP SIGNATURE-----

--Ae2bpONtDVGHgMu4--


