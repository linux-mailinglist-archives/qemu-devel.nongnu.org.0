Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C464B2499
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:41:17 +0100 (CET)
Received: from localhost ([::1]:42830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIUIe-0002XT-65
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:41:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIUB1-0003Ut-OH
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:33:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIUAy-0003rp-HK
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644579199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/VDmHnDJdGKtyZdb6G4r1rkMHsqIzRpKeaRiSXf0cUw=;
 b=E7ZR+uxbAQyMEkYSlD+RP3XkOqtpwQhKjygI8Sw9356+DEJca2DJRb5uwnpop27w31O6n1
 J6wl0v6zpwEXglCEKjo1nJPHiclXFM82AGefO42DUhkaw6DkMKk6j9nbQ0BtzsAsl5JzIY
 rSWb2UZB6BEchv/HKfKbpJuMEMetPdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-RV6x7hwVNf-F3M8lgRm6BA-1; Fri, 11 Feb 2022 06:33:16 -0500
X-MC-Unique: RV6x7hwVNf-F3M8lgRm6BA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91BB285B6F5;
 Fri, 11 Feb 2022 11:33:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCDA46F167;
 Fri, 11 Feb 2022 11:32:59 +0000 (UTC)
Date: Fri, 11 Feb 2022 12:32:57 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC] thread-pool: Add option to fix the pool size
Message-ID: <YgZJaTtoHN8hzrvk@redhat.com>
References: <20220202175234.656711-1-nsaenzju@redhat.com>
 <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain>
 <Yfu08bAJKnRC3eFD@redhat.com>
 <Yfvkf1cBPGc4TR49@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1rcxSEDwgsiNY/Ar"
Content-Disposition: inline
In-Reply-To: <Yfvkf1cBPGc4TR49@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 qemu-block@nongnu.org, mtosatti@redhat.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1rcxSEDwgsiNY/Ar
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 03.02.2022 um 15:19 hat Stefan Hajnoczi geschrieben:
> On Thu, Feb 03, 2022 at 10:56:49AM +0000, Daniel P. Berrang=E9 wrote:
> > On Thu, Feb 03, 2022 at 10:53:07AM +0000, Stefan Hajnoczi wrote:
> > > On Wed, Feb 02, 2022 at 06:52:34PM +0100, Nicolas Saenz Julienne wrot=
e:
> > > > The thread pool regulates itself: when idle, it kills threads until
> > > > empty, when in demand, it creates new threads until full. This beha=
viour
> > > > doesn't play well with latency sensitive workloads where the price =
of
> > > > creating a new thread is too high. For example, when paired with qe=
mu's
> > > > '-mlock', or using safety features like SafeStack, creating a new t=
hread
> > > > has been measured take multiple milliseconds.
> > > >=20
> > > > In order to mitigate this let's introduce a new option to set a fix=
ed
> > > > pool size. The threads will be created during the pool's initializa=
tion,
> > > > remain available during its lifetime regardless of demand, and dest=
royed
> > > > upon freeing it. A properly characterized workload will then be abl=
e to
> > > > configure the pool to avoid any latency spike.
> > > >=20
> > > > Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> > > >=20
> > > > ---
> > > >=20
> > > > The fix I propose here works for my specific use-case, but I'm pret=
ty
> > > > sure it'll need to be a bit more versatile to accommodate other
> > > > use-cases.
> > > >=20
> > > > Some questions:
> > > >=20
> > > > - Is unanimously setting these parameters for any pool instance too
> > > >   limiting? It'd make sense to move the options into the AioContext=
 the
> > > >   pool belongs to. IIUC, for the general block use-case, this would=
 be
> > > >   'qemu_aio_context' as initialized in qemu_init_main_loop().
> > >=20
> > > Yes, qemu_aio_context is the main loop's AioContext. It's used unless
> > > IOThreads are configured.
> > >=20
> > > It's nice to have global settings that affect all AioContexts, so I
> > > think this patch is fine for now.
> > >=20
> > > In the future IOThread-specific parameters could be added if individu=
al
> > > IOThread AioContexts need tuning (similar to how poll-max-ns works
> > > today).
> > >=20
> > > > - Currently I'm setting two pool properties through a single qemu
> > > >   option. The pool's size and dynamic behaviour, or lack thereof. I
> > > >   think it'd be better to split them into separate options. I thoug=
ht of
> > > >   different ways of expressing this (min/max-size where static happ=
ens
> > > >   when min-size=3Dmax-size, size and static/dynamic, etc..), but yo=
u might
> > > >   have ideas on what could be useful to other use-cases.
> > >=20
> > > Yes, "min" and "max" is more flexible than fixed-size=3Dn. fixed-size=
=3Dn is
> > > equivalent to min=3Dn,max=3Dn. The current default policy is min=3D0,=
max=3D64.
> > > If you want more threads you could do min=3D0,max=3D128. If you want =
to
> > > reserve 1 thread all the time use min=3D1,max=3D64.
> > >=20
> > > I would go with min and max.
> >=20
> > This commit also exposes this as a new top level command line
> > argument. Given our aim to eliminate QemuOpts and use QAPI/QOM
> > properties for everything I think we need a different approach.
> >=20
> > I'm not sure which exisiting QAPI/QOM option it most appropriate
> > to graft these tunables onto ?  -machine ?  -accel ?  Or is there
> > no good fit yet ?

I would agree that it should be QAPI, but just like QemuOpts doesn't
require that you shoehorn it into an existing option, QAPI doesn't
necessarily either if that's the interface that we want. You could just
create a new QAPI struct for it and parse the new option into that. This
would already be an improvement over this RFC.

Now, whether we actually want a new top-level option is a different
question (we usually try to avoid it), but it's not related to QAPI vs.
QemuOpts.

> Yep, I didn't comment on this because I don't have a good suggestion.
>=20
> In terms of semantics I think we should have:
>=20
> 1. A global default value that all new AioContext take. The QEMU main
>    loop's qemu_aio_context will use this and all IOThread AioContext
>    will use it (unless they have been overridden).
>=20
>    I would define it on --machine because that's the "global" object for
>    a guest, but that's not very satisfying.

Semantically, -machine is about the virtual hardware where as iothreads
are about the backend, so I agree it's not a good fit.

For the main thread, you may want to configure all the same options that
you can configure for an iothread. So to me that sounds like we would
want to allow using an iothread object for the main thread, too.

That would still require us to tell QEMU which iothread object should be
used for the main thread, though.

> 2. (Future patch) --object iothread,thread-pool-min=3DN,thread-pool-max=
=3DM
>    just like poll-max-ns and friends. This allows the values to be set
>    on a per-IOThread basis.

And to be updated with qom-set. (Which is again something that you'll
want for the main thread, too.)

Kevin

--1rcxSEDwgsiNY/Ar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmIGSWkACgkQfwmycsiP
L9bqKQ/9EMkboR+codwHiSdmWWFsZS9gGQhq8oaGeGLEuGGNuJfRe7KLXjiO/76H
X1X25BMS9D2LksNgBXRCy1Ye+9OnT1Ce2/x1JHrILSXGuukOyX7FDAIHVBj8Y+Hq
6JsqF2icKvQlT9Xm6Mq/9XNIr4D7A69XVC1MUrp4wdjBS394A3rN0NgpVm98YFdG
uM8+ZvoCt4bvsB2tDAUktFCOa2VQCCP9GVHy6k2kH0n3Hmw4lOMQFjJObYnpNTI4
5KWJD89ptcGOb3HMp34nEPdeQv2jJF1fU25wQsTXHb4JbgTPMRQJAm/grxHyJmOZ
zcwoeOh0sGem5Mj8WICQJdSagaZGfmtaek3jlaHdLokn33iJrv0Oe42NXFBGRhOJ
NRzxqIZvOP6+P7zqPpOr7PWtgCc9Bfrg/I/GJg3zLZAkC33nIiRtf/GoB1UW90xD
XOH/xrusNeu1KYjiv82iev+Tjg4kEUcOyKJfJaTkC9EnT5FKqku10x5ZxaeG6EXg
d9ontQfllWqfbA1WFUopL+YRVSSl77+MuvQCcdOLbk1Ao9iCht6n6+j+VWoDo5r0
Ck1EGbqNAtSvha33gMJxTk/srHDFcZTlj6BUdhf7jj1OwqLNoGLlDWc56lAdoG2S
vL/KZ0UceRxZVA5JG8QOxpoOAXLnW0xPek/PkQ9BGqVxt1OUbDY=
=pqOb
-----END PGP SIGNATURE-----

--1rcxSEDwgsiNY/Ar--


