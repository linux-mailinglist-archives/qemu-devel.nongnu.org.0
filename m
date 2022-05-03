Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2A51921B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:03:22 +0200 (CEST)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1Y9-0006OM-4a
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nlzNZ-0004MB-Ur
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:44:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nlzNY-0002MG-2i
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651610624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UWV95eny0zCGd2gmwM+xyFPn2fsEac21FDnxoayXnn8=;
 b=TbyTHByb282451upgwaVDgRn3EiycfLXW0HolZ1oW3y7DKP7LSP+YHn3kLzu0pFe1EtlWd
 ol7hpkyKY6WM2chzGjhFfFaeTROCVeCfqRoG7OKDBRPXaQKqobhT8jqkqCQQhT/lh8H50k
 5AdCfDHk5INcwv+bkkvdnIm4zFCxxww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-iyvUULxQP76Bh8kONk5Mtw-1; Tue, 03 May 2022 12:07:24 -0400
X-MC-Unique: iyvUULxQP76Bh8kONk5Mtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 684E218F4397;
 Tue,  3 May 2022 12:17:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A5DBC28100;
 Tue,  3 May 2022 12:17:26 +0000 (UTC)
Date: Tue, 3 May 2022 12:04:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YnEMT6K5/7vLEmTM@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <8f01c640-f876-568a-d6ff-bbb112e5154f@redhat.com>
 <YmpwRKUW5e3P/hhd@stefanha-x1.localdomain>
 <3b156b87-11d5-3eb7-f58a-94939f65ea8f@redhat.com>
 <YmzGV8Evmet8RXUh@stefanha-x1.localdomain>
 <06af1ad7-b069-72f0-d8a2-82f0ae573256@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lGDsJOjsxkVT85XH"
Content-Disposition: inline
In-Reply-To: <06af1ad7-b069-72f0-d8a2-82f0ae573256@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lGDsJOjsxkVT85XH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 10:02:14AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 30/04/2022 um 07:17 schrieb Stefan Hajnoczi:
> > On Thu, Apr 28, 2022 at 11:56:09PM +0200, Emanuele Giuseppe Esposito wr=
ote:
> >>
> >>
> >> Am 28/04/2022 um 12:45 schrieb Stefan Hajnoczi:
> >>> On Wed, Apr 27, 2022 at 08:55:35AM +0200, Emanuele Giuseppe Esposito =
wrote:
> >>>>
> >>>>
> >>>> Am 26/04/2022 um 10:51 schrieb Emanuele Giuseppe Esposito:
> >>>>> Luckly, most of the cases where we recursively go through a graph a=
re
> >>>>> the BlockDriverState callback functions in block_int-common.h
> >>>>> In order to understand what to protect, I categorized the callbacks=
 in
> >>>>> block_int-common.h depending on the type of function that calls the=
m:
> >>>>>
> >>>>> 1) If the caller is a generated_co_wrapper, this function must be
> >>>>>    protected by rdlock. The reason is that generated_co_wrapper cre=
ate
> >>>>>    coroutines that run in the given bs AioContext, so it doesn't ma=
tter
> >>>>>    if we are running in the main loop or not, the coroutine might r=
un
> >>>>>    in an iothread.
> >>>>> 2) If the caller calls it directly, and has the GLOBAL_STATE_CODE()=
 macro,
> >>>>>    then the function is safe. The main loop is the writer and thus =
won't
> >>>>>    read and write at the same time.
> >>>>> 3) If the caller calls it directly, but has not the GLOBAL_STATE_CO=
DE()
> >>>>>    macro, then we need to check the callers and see case-by-case if=
 the
> >>>>>    caller is in the main loop, if it needs to take the lock, or del=
egate
> >>>>>    this duty to its caller (to reduce the places where to take it).
> >>>>>
> >>>>> I used the vrc script (https://github.com/bonzini/vrc) to get help =
finding
> >>>>> all the callers of a callback. Using its filter function, I can
> >>>>> omit all functions protected by the added lock to avoid having dupl=
icates
> >>>>> when querying for new callbacks.
> >>>>
> >>>> I was wondering, if a function is in category (3) and runs in an
> >>>> Iothread but the function itself is not (currently) recursive, meani=
ng
> >>>> it doesn't really traverse the graph or calls someone that traverses=
 it,
> >>>> should I add the rdlock anyways or not?
> >>>>
> >>>> Example: bdrv_co_drain_end
> >>>>
> >>>> Pros:
> >>>>    + Covers if in future a new recursive callback for a new/existing
> >>>>      BlockDriver is implemented.
> >>>>    + Covers also the case where I or someone missed the recursive pa=
rt.
> >>>>
> >>>> Cons:
> >>>>    - Potentially introducing an unnecessary critical section.
> >>>>
> >>>> What do you think?
> >>>
> >>> ->bdrv_co_drain_end() is a callback function. Do you mean whether its
> >>> caller, bdrv_drain_invoke_entry(), should take the rdlock around
> >>> ->bdrv_co_drain_end()?
> >>
> >> Yes. The problem is that the coroutine is created in bs AioContext, so
> >> it might be in an iothread.
> >>
> >>>
> >>> Going up further in the call chain (and maybe switching threads),
> >>> bdrv_do_drained_end() has QLIST_FOREACH(child, &bs->children, next) so
> >>> it needs protection. If the caller of bdrv_do_drained_end() holds then
> >>> rdlock then I think none of the child functions (including
> >>> ->bdrv_co_drain_end()) need to take it explicitly.
> >>
> >> Regarding bdrv_do_drained_end and similar, they are either running in
> >> the main loop (or they will be, if coming from a coroutine) or in the
> >> iothread running the AioContext of the bs involved.
> >>
> >> I think that most of the drains except for mirror.c are coming from ma=
in
> >> loop. I protected mirror.c in patch 8, even though right now I am not
> >> really sure that what I did is necessary, since the bh will be schedul=
ed
> >> in the main loop.
> >>
> >> Therefore we don't really need locks around drains.
> >=20
> > Are you saying rdlock isn't necessary in the main loop because nothing
> > can take the wrlock while our code is executing in the main loop?
>=20
> Yes, that's the idea.
> If I am not mistaken (and I hope I am not), only the main loop currently
> modifies/is allowed to modify the graph.
>=20
> The only case where currently we need to take the rdlock in main loop is
> when we have the case
>=20
> simplified_flush_callback(bs) {
> 	for (child in bs)
> 		bdrv_flush(child->bs);
> }
>=20
> some_function() {
> 	GLOBAL_STATE_CODE();
> 	/* assume bdrv_get_aio_context(bs) !=3D qemu_in_main_thread() */
>=20
> 	bdrv_flush(bs);
> 		co =3D coroutine_create(bdrv_get_aio_context(bs))
> 		qemu_coroutine_enter(co, simplified_flush_callback)
> }

Why does the main loop need to take rdlock in this case? Only the
coroutine that runs in the non-main loop AioContext iterates over
children.

Also, there are a bunch of other functions in build/block/block-gen.c
that seem to follow the same pattern, so I'm not sure why bdrv_flush()
would be the only case?

In general I'm having a hard time following this patch series and the
discussion because you aren't giving a chain of reasoning. I can make
guesses myself but some of them will be incorrect. It's better to have a
full explanation so reviewers understand your perspective and the logic
behind it.

Stefan

--lGDsJOjsxkVT85XH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJxDE4ACgkQnKSrs4Gr
c8h0owgAq8ZBQ9oawNpB1a6FnH/3Ym2GpCPEHya9kewrYqD/B9N7Lij4ML0wV9X/
TUtwDcYyR1B5MiVVlXWVaJPHtG0C63UBXrVnUv0vxqSaN2Fdy062IpkY3H6/3kL3
b6OV5ekCUGF9J3ULdShUCzzSjhARj/zn6czemmSyAjwKJKifWgnYkEpLfHWOlHxU
DcBJ7qfcAWUAobQherDwuyMwch2bh16OjpQOhGqGFMzz37KWtn8OZ8v1uAYzjiWs
QnGCq94CfxsRKpG2IuBt7z5enndAMiLwtfTcrPvUecBl6B+hZcf57GZB0a8PC1yS
H3wlAZueG4RGRaDF3IOFFkJ2vOX6+A==
=H0S3
-----END PGP SIGNATURE-----

--lGDsJOjsxkVT85XH--


