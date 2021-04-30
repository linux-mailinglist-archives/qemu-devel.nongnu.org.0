Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111CF36FE26
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:56:15 +0200 (CEST)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVV0-0002QV-47
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lcVP8-0007jo-Dk
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:50:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lcVP5-0000n2-2j
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619797806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eI7HZy+Qyeh7zH+vFaAShb/g0kluDK75k5NY8F+ir7s=;
 b=IugztAxLSTL34A1FfzvGaIONRV1jTfnSRh15wbRbTrXHDqNClb3gGdfWPak1xrlr8RNPWy
 i6lxB7KQsrGphrrDIByL5/+P/RPBsTlpk7D643xCGnRwja6G90Y/Wszyh5pUkOz/CWIPxq
 3QXQDIPPIzTi9WDl0fFs+kKuMnc/stE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-Mq2PYjhVOgWiFZbF8GbVaQ-1; Fri, 30 Apr 2021 11:50:03 -0400
X-MC-Unique: Mq2PYjhVOgWiFZbF8GbVaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F351801106;
 Fri, 30 Apr 2021 15:50:01 +0000 (UTC)
Received: from localhost (ovpn-112-107.ams2.redhat.com [10.36.112.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B14AD5D9E2;
 Fri, 30 Apr 2021 15:49:56 +0000 (UTC)
Date: Fri, 30 Apr 2021 16:49:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YIwnI0ML0BEkQ1iE@stefanha-x1.localdomain>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <YIrV9MqlqwUhJR+B@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YIrV9MqlqwUhJR+B@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S/EdYP1ionSX9wMr"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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

--S/EdYP1ionSX9wMr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 05:51:16PM +0200, Kevin Wolf wrote:
> Am 29.04.2021 um 16:05 hat Stefan Hajnoczi geschrieben:
> > Hi,
> > A preview release of libblkio, a library for high-performance block I/O=
,
> > is now available:
> >=20
> >   https://gitlab.com/libblkio/libblkio/-/tree/v0.1.0
> >=20
> > Applications are increasingly integrating high-performance I/O
> > interfaces such as Linux io_uring, userspace device drivers, and
> > vhost-user device support. The effort required to add each of these
> > low-level interfaces into an application is relatively high. libblkio
> > provides a single API for efficiently accessing block devices and
> > eliminates the need to write custom code for each one.
> >=20
> > The library is not yet ready to use and currently lacks many features.
> > In fact, I hope this news doesn't spread too far yet because libblkio i=
s
> > at a very early stage, but feedback from the QEMU community is necessar=
y
> > at this time.
>=20
> I'm a bit worried about the configuration interface. This looks an awful
> lot like plain QOM properties, which have proven to result in both very
> verbose (not to say messy) and rather error prone implementations.
>=20
> You have to write setters/getters for every property, even if it usually
> ends up doing the same thing, storing the value somewhere. Worse, these
> getters and setters have to work in very different circumstances, namely
> initialisation where you usually have to store the value away so that it
> can be checked for consistency with other properties in .realize() or
> .complete(), and property updates during runtime. Often enough, we
> forget the latter and create bugs. If we don't create bugs, we usually
> start with 'if (realized)' and have two completely different code paths.
> Another common bug in QOM objects is forgetting to check if mandatory
> properties were actually set.
>
> Did you already consider these problems and decided to go this way
> anyway, or is this more of an accidental design? And if the former, what
> were the reasons that made it appealing?

That's true. Here is the code to reject accesses when the instance is
not initialized:

  self.must_be_initialized()?;

It's very concise but you still need to remember to add it.

The overall reasons for choosing the properties API were:

1. It keeps the library's API very minimal (just generic getters/setters
   for primitive types). It minimizes ABI compatibility issues because
   there are no configuration structs or functions exported by the
   library.

2. It's trivial to have a string setter/getter that automatically
   converts to the primitive type representation, so application config
   file or command-line values can easily be set.

   This is kind of the inverse of what you're saying. If the library
   offers dedicated interfaces for each configuration value then the
   library doesn't need getters/setters for each one but all
   applications need special-purpose code for each configuration value.

That said, this is exactly why I published the preview release. If
someone has a better way to do this or the feedback is just that this is
bad style, then I'm happy to change it.

> Alternatives in QEMU are qdev properties (which are internally QOM
> properties, but provide default implementations and are at least
> automatically read-only after realize, avoiding that whole class of
> bugs) and QAPI.
> If this was QEMU code, I would of course go for QAPI, but a library is
> something different and adding the code generator would probably be a
> bit too much anyway. But the idea in the resulting code would be dealing
> with native structs instead of a bunch of function calls. This would
> probably be the least error prone way for the implementation, but of
> course, it would make binary compatibility a bit harder when adding new
> properties.

An alternative I considered was the typestate and builder patterns:

  /* Create a new io_uring driver in the uninitialized state */
  struct blkio_iou_uninit *blkio_new_io_uring(void);

  /* Uninitialized state property setters */
  int blkio_iou_uninit_set_path(struct blkio_iou_uninit *u,
                                const char *path);
  int blkio_iou_uninit_set_direct(struct blkio_iou_uninit *u,
                                  bool o_direct);
  ...

  /* Transition to initialized state. Frees u on success. */
  struct blkio_iou_init *blkio_iou_init(struct blkio_iou_uninit *u);

  /* Initialized state property setters/getters */
  int blkio_iou_init_get_capacity(struct blkio_iou_init *i,
                                  uint64_t *capacity);
  ...

  /* Transition to started state. Frees i on success. */
  struct blkio_iou_started *blkio_iou_start(struct blkio_iou_init *i);

  ...

  /* Transition back to initialized state. Frees s on success. */
  struct blkio_iou_init *blkio_iou_stop(struct blkio_iou_started *s);

On the plus side:

- No state checks are needed because an API won't even exist if it's
  unavailable in a given state (uninitialized/initialized/started).

- State structs come with pre-initialized default values, so the caller
  only needs to set non-default values. For example O_DIRECT is false by
  default and callers happy with that don't need to set the property.

- ABI compatibility is easy since the state structs are opaque (their
  size is not defined) and new properties can be added at any time.

On the minus side:

- Completely static. Hard to introspect and requires a dedicated call
  site for each property (applications cannot simply assign a property
  string given to them on the command-line). This means every single
  property must be explicitly coded into every application :(.

- So many functions! This makes understanding the API harder.

- Very verbose. The function and type names get long and there is a lot
  of repetition in the API.

> Thinking a bit further, we'll likely get the same problems as with QOM
> in other places, too, e.g. how do you introspect which properties exist
> in a given build?

Right, there is no introspection although probing individual properties
is possible (-ENOENT). Adding introspection wouldn't be hard but the
library API just doesn't exist today.

Stefan

--S/EdYP1ionSX9wMr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCMJyMACgkQnKSrs4Gr
c8jU4Qf/ZpcgLw7cKp52Idfg8ezNGPUaaC+OrGSdiaOKKKeMxzYNwZnhyaKk0AYO
9w2vaiO3b3KQNwdbyyqcxz107Eo3jh7yqPlBVykLrYZUMSKrnvrjyw3MFN5Vsxp9
DlQwr/k0P3MEYTfn9fVGZBbbQ8VyLY9aG2oIEIB+/ZuRCzVowNmfPzzpf2+d0Des
veI+E5ZdT3bFFIVy50SYgrnP45UwgkCO93xFqCf4V7k587hoZ7BlzL7EacOmakqu
TcloFy9evXdyxpOlj4oHDt3EyPn6RjOpxszT9vd47Y3+g/4hlMXV/HGEEdHT+dQd
oo31JaKA1KhRrrVvYjOvSlmZc7KNvQ==
=brnu
-----END PGP SIGNATURE-----

--S/EdYP1ionSX9wMr--


