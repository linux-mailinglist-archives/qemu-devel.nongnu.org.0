Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661D54DB692
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 17:46:22 +0100 (CET)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUWmz-0007ej-1O
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 12:46:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUWla-0006nh-RB
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUWlZ-0005jU-5E
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647449090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RiQncZdixJnohzt2IHVGirs9BX23PqDSPD0EvjXlWUY=;
 b=SmAElgpA/AUBJqtd/OJ3vLHRrAbIO7E47Wj3hCqfFpDzeUdyK9J6UD6Td6Szt7yIgY0J0r
 grpKb6B1OkkoUghSWuBRTSEmJtoWa56KBh8efUXpyuCevUQPfpX5Rk4KdPYq28DhIksJ1A
 8dgNDx0WPvVB2r8LHBUpkk1MwB2b77Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-fKlb10b3MvuY0d_79-BjEw-1; Wed, 16 Mar 2022 12:44:46 -0400
X-MC-Unique: fKlb10b3MvuY0d_79-BjEw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34E1729DD9AC;
 Wed, 16 Mar 2022 16:44:46 +0000 (UTC)
Received: from localhost (unknown [10.39.193.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68C81441E2B;
 Wed, 16 Mar 2022 16:44:45 +0000 (UTC)
Date: Wed, 16 Mar 2022 16:44:44 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjIT/LsL8hluJTCn@stefanha-x1.localdomain>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <CAFEAcA8zongmSfDAgorr=RfKK6Qsgyi1xNz5KBzdB0RGeSBSWA@mail.gmail.com>
 <dca7d15b-2f24-cfb2-9a31-47b5ffd9c3d5@redhat.com>
 <YjHY8GA52MzjBxLK@stefanha-x1.localdomain>
 <YjHgugc8rBKaCjur@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4+TbnzVIr2oHacKq"
Content-Disposition: inline
In-Reply-To: <YjHgugc8rBKaCjur@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4+TbnzVIr2oHacKq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 01:06:02PM +0000, Daniel P. Berrang=E9 wrote:
> On Wed, Mar 16, 2022 at 12:32:48PM +0000, Stefan Hajnoczi wrote:
> > On Tue, Mar 15, 2022 at 06:29:50PM +0100, Paolo Bonzini wrote:
> > > On 3/15/22 15:24, Peter Maydell wrote:
> > > > On Tue, 15 Mar 2022 at 14:09, Stefan Hajnoczi <stefanha@redhat.com>=
 wrote:
> > > > > Also, once C++ is available people will
> > > > > start submitting C++ patches simply because they are more comfort=
able
> > > > > with C++ (especially one-time/infrequent contributors).
> > > >=20
> > > > This to my mind is the major argument against using C++
> > > > for coroutines...
> > >=20
> > > I agree on the need for a policy, but _what_ C++ are they going to be
> > > contributing that we should be scared of?  We're talking about:
> > >=20
> > > * major features contributed by one-time/infrequent participants (whi=
ch is
> > > already a once-in-a-year thing or so, at least for me)
> > >=20
> > > * ... in an area where there are no examples of using C++ in the tree=
 (or
> > > presumably the maintainer would be comfortable reviewing it)
> > >=20
> > > * ... but yet C++ offer killer features (right now there's only C++
> > > coroutines and fpu/)
> >=20
> > You are assuming people only choose C++ only when it offers features not
> > available in C. I think they might simply be more comfortable in C++.
> >=20
> > In other words, if an existing file is compiled using a C++ compiler or
> > they are adding a new file, they don't need a reason to use C++, they
> > can just use it.
> >=20
> > You can define rules and a way to enforce a subset of C++, but I think
> > over time the code will be C++. A policy that is complicated discourages
> > contributors.
> >=20
> > For these reasons I think that if code runs through a C++ compiler we
> > should just allow C++. Either way, it will take time but that way no one
> > will feel betrayed when C++ creeps in.
> >=20
> > That said, I hope we find an option that doesn't involve C++.
>=20
> The real show stopper with our current coroutine impl IIUC, is the
> undefined behaviour when we yield and restore across different threads.
>=20
> Is there any relastic hope that we can change QEMU's usage, such that
> each coroutine is confined to a single thread, to avoid the undefined
> behaviour ?

I don't think so. At the point where a coroutine stops executing in the
vCPU thread the call stack is too deep. The benefit of coroutines would
be lost because it would be necessary to use callback functions (BHs).

Fixes that paper over the undefined behavior have been merged so the
bugs should be kept at bay for a while. In theory we can continue with
stack-based coroutines but we're likely to hit issues again in the
future.

Paolo also prototyped C stackless coroutines. That would require a
source-to-source translation that converts a coroutine_fn into a Duff's
device state machine. That solution doesn't require C++ but it would be
necessary to develop the source-to-source translator and maintain it.

Finally it may be possible to get coroutine in C from clang/gcc. They
have the machinery to do it for C++ so maybe they could also offer it in
C compiler mode. It would be great to have coroutines available in the
toolchain - more reliable and supported than if we roll our own.

Stefan

--4+TbnzVIr2oHacKq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIyE/wACgkQnKSrs4Gr
c8i0zAf/UrfJMgRgLgaULelDnHc6yMLz/3aSwOcqIyH+97CE/g2beIpKeub4lWhL
yunCbbu6s6tAHakMnS6lZSTg5ZN0qs/bQqCaKxDSUS1QlziCAMoB6B8zbOYx59Ei
92kpI1JVNVRS/ei6dEkncLZmoo4qqEX6ye6Hn4tVPtAFgCoYi4Fh6/OSQzayqREQ
lwyD5Ixy7ujyCM8DUmoRiIlx51Zal37j5JLPLUj38c/qbNBRFSbNNaJZ9h3pUOKg
XqHr0ZAers8nOdwP8hDYbnf2cuZTmbAU1TeEi2vr6TS5h6U6lTODPtF2BkHuaoY9
Ll976wiZzh9qHoKYQ6mYFBVur7MDpA==
=g/y9
-----END PGP SIGNATURE-----

--4+TbnzVIr2oHacKq--


