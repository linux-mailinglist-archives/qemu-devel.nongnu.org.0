Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BD4D9F14
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 16:47:49 +0100 (CET)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9Om-0001wB-DK
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 11:47:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU9Cl-0004wz-Ff
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:35:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU9Ci-0001qQ-Ax
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647358519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T+of0lAEZm4F8oYTkxASm1iXhQ+huR4kgfBPP0a8qx4=;
 b=bE4X+07Z7tndTCuw4fGmdXMcWfK+byTRTatMidXk08FkkWcTb2+OTaY+pAA/QpzgQHV80V
 FCSpdLpeLxeGm2B/Z8W+JcX6wC9n1IKs759YMfTmK88Bgneft4AOdDb380TkXcFYy8fQTt
 jXKjhLuqIDuRhFbcw5cta+isiNafCqg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-mSjvBvSUP-6PHH6Hnje6TQ-1; Tue, 15 Mar 2022 11:35:16 -0400
X-MC-Unique: mSjvBvSUP-6PHH6Hnje6TQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 548A41C05AF7;
 Tue, 15 Mar 2022 15:35:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A3EE141DC5F;
 Tue, 15 Mar 2022 15:35:15 +0000 (UTC)
Date: Tue, 15 Mar 2022 15:35:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjCyMjmK6wJwc6jN@stefanha-x1.localdomain>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <YjCnss5W5MhZK1Hw@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v2XpyMh8UVT3L2gr"
Content-Disposition: inline
In-Reply-To: <YjCnss5W5MhZK1Hw@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, hreitz@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--v2XpyMh8UVT3L2gr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2022 at 03:50:26PM +0100, Kevin Wolf wrote:
> Am 15.03.2022 um 15:05 hat Stefan Hajnoczi geschrieben:
> > On Mon, Mar 14, 2022 at 05:21:22PM +0100, Paolo Bonzini wrote:
> > > On 3/14/22 15:07, Stefan Hajnoczi wrote:
> > > > If we can reach a consensus about C++ language usage in QEMU then I=
'm in
> > > > favor of using C++ coroutines. It's probably not realistic to think=
 we
> > > > can limit C++ language usage to just coroutines forever. Someone fi=
nds
> > > > another C++ feature they absolutely need and over time the codebase
> > > > becomes C++ - with both its advantages and disadvantages.
> > > >=20
> > > > [...] although you can write C in C++, it's not idiomatic modern C+=
+.
> > > > The language lends itself to a different style of programming that
> > > > some will embrace while others will not.
> > >=20
> > > Yes, this is an important aspect to discuss.  I think coroutines prov=
ide a
> > > good blueprint for how QEMU might use C++.
> > >=20
> > > I totally agree that, if we go this way, the genie is out of the bott=
le and
> > > other uses of C++ will pop up with 100% probability.  But the importa=
nt
> > > thing to note is that our dialect of C is already not standard C, and=
 that
> > > some of our or GLib's "innovations" are actually based on experience =
with
> > > C++.  We can keep on writing "QEMU's C" if we think of C++ as a super=
charged
> > > way of writing these quality-of-life improvements that we already wri=
te.  In
> > > some sense coroutines are an extreme example of this idea.
> > >=20
> > > In fact, a C API would have to remain unless all source files are cha=
nged to
> > > C++, so QEMU would remain mostly a C project with C idioms, but that =
doesn't
> > > prevent _abstracting_ the use of C++ features (written in modern, idi=
omatic
> > > C++) behind an API that C programmers have no problems learning.  Aga=
in,
> > > coroutines are an example of this of keeping the familiar create/ente=
r/yield
> > > API and hiding the "magic" of C++ coroutines (and when they don't, th=
at had
> > > better be an improvement).
> > >=20
> > > In the end, C++ is a tool that you can use if it leads to better code=
=2E For
> > > example, I don't see much use of C++ for devices for example, and the
> > > storage devices in particular do not even need coroutines because the=
y use
> > > the callback-based interface.  But perhaps someone will try to use te=
mplates
> > > to replace repeated inclusion (which is common in hw/display) and oth=
ers
> > > will follow suit.  Or perhaps not.
> > >=20
> > > One example that was brought up on IRC is type-safe operations on thi=
ngs
> > > such as hwaddr (i.e. hwaddr+int is allowed but hwaddr-hwaddr gives ba=
ck an
> > > int64_t and might even check for overflow).  These would be opt in (y=
ou get
> > > them just by changing a file from .c to .cc), but the actual C++ code=
 would
> > > still look very much like C code that uses hwaddr with no type checki=
ng.
> > > All the operator overloading gunk would be in include/.
> > >=20
> > > A different topic is what would happen if all of QEMU could be compil=
ed as
> > > C++, and could inform our selection of C++ idioms even long before we=
 get
> > > there.  For example, I'm fine with GLib and our type-safe intrusive l=
ists,
> > > so I don't have much interest in STL containers and I would prefer _n=
ot_ to
> > > use STL containers even in .cc files[1].  However, perhaps QEMU's hom=
e-grown
> > > lock guard might be replaced by something that uses C++ destructors i=
nstead
> > > of g_autoptr, so perhaps we should consider using std::lock_guard<>, =
or
> > > something like that, instead of QEMU_LOCK_GUARD.  It may be interesti=
ng to
> > > pass down lock_guards as arguments to enforce "this lock is taken"
> > > invariants.
> > >=20
> > > But really, coroutines would be enough work so my dish would be full =
for
> > > some time and I wouldn't really have time to look at any of this. :)
> >=20
> > I think it will be necessary to compile QEMU with a C++ compiler quite
> > soon. It is possible to provide C APIs like in the case of coroutines,
> > but sometimes C++ features need to be exposed to the caller (like the
> > lock guards you mentioned).
>=20
> I'm not sure what the C++ lock guards offer that our current lock guards
> don't? Passing down lock guards makes sense to me, but why can't you do
> that with QemuLockable? (Hm, or can the C++ version somehow check at
> compile time that it's the _right_ lock that is held rather than just
> any lock? It didn't look like it at the first sight.)
>=20
> But I do see the benefit of a compiler checked CoroutineFn<> return type
> compared to the coroutine_fn markers we have today. On the other hand...

Sorry, I made a mistake: the C++ coroutines implementation does not hide
everything behind a C API. Coroutine functions need to be defined in C++
source units.

Stefan

--v2XpyMh8UVT3L2gr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIwsjIACgkQnKSrs4Gr
c8gIJgf/Z7iIH2v8389wMcxzAfGk6KIvk71GGT1lDLvQWzz0p0NJ6zMEXtS4FRdG
1O16ChUDezkShjP9lQ95jYIqC8KFdzPN+HaeQhUG4r3/0+y7c2t0GJmvtfeKbgFQ
kU+/3XHDlinK31dTip7P3NxisY5uEXH9z5sNaSTHuWW/OgbDsAtBDXz3HMniAeTq
yw1wb5ZaVaG+wkphVXcOf/RwPVDau93iHBJiWDSIRIXuvhlY1EvWj0h7PAYwQ+Lr
1PUrktUyEA2HENn6eWwrLfxVtYqIjuFCoUdqPTj5HG1ZN/2meqUHmdDNJxkql+qj
gcjyA3FnlGscTm9a5JXSjze9AaEeFw==
=ObVE
-----END PGP SIGNATURE-----

--v2XpyMh8UVT3L2gr--


