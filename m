Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0804D9CFE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:09:16 +0100 (CET)
Received: from localhost ([::1]:55888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7rP-0000Di-2S
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:09:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU7nt-0004xR-GN
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU7nr-0003qv-TN
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647353134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jSU1p4IuKJsUelbGvKFQoId5peWkRrgCHptDvZtST4U=;
 b=KQoMIP4pnWHLIXdfxlOfo9Gv+OUgo4IPlGkhct3GZuYCQ4y6PoydXLMaxvInynLEVrMmGc
 oYCLTC8oXrHf6wmQ/98Cuxd2oHvchlIn8ZFNUsv9pWzi/J0GrDe9fCIe0OUZrU4gv8NDt5
 UcwYQQwS2CKQaR7AOwoXwVNw/PEDaec=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-wcP6bdG5M2uRWSjuaAQKmQ-1; Tue, 15 Mar 2022 10:05:31 -0400
X-MC-Unique: wcP6bdG5M2uRWSjuaAQKmQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E94138025E0;
 Tue, 15 Mar 2022 14:05:31 +0000 (UTC)
Received: from localhost (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C143B401E2A;
 Tue, 15 Mar 2022 14:05:30 +0000 (UTC)
Date: Tue, 15 Mar 2022 14:05:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m+ylgoGWcp/zwiOo"
Content-Disposition: inline
In-Reply-To: <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--m+ylgoGWcp/zwiOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 05:21:22PM +0100, Paolo Bonzini wrote:
> On 3/14/22 15:07, Stefan Hajnoczi wrote:
> > If we can reach a consensus about C++ language usage in QEMU then I'm in
> > favor of using C++ coroutines. It's probably not realistic to think we
> > can limit C++ language usage to just coroutines forever. Someone finds
> > another C++ feature they absolutely need and over time the codebase
> > becomes C++ - with both its advantages and disadvantages.
> >=20
> > [...] although you can write C in C++, it's not idiomatic modern C++.
> > The language lends itself to a different style of programming that
> > some will embrace while others will not.
>=20
> Yes, this is an important aspect to discuss.  I think coroutines provide a
> good blueprint for how QEMU might use C++.
>=20
> I totally agree that, if we go this way, the genie is out of the bottle a=
nd
> other uses of C++ will pop up with 100% probability.  But the important
> thing to note is that our dialect of C is already not standard C, and that
> some of our or GLib's "innovations" are actually based on experience with
> C++.  We can keep on writing "QEMU's C" if we think of C++ as a superchar=
ged
> way of writing these quality-of-life improvements that we already write. =
 In
> some sense coroutines are an extreme example of this idea.
>=20
> In fact, a C API would have to remain unless all source files are changed=
 to
> C++, so QEMU would remain mostly a C project with C idioms, but that does=
n't
> prevent _abstracting_ the use of C++ features (written in modern, idiomat=
ic
> C++) behind an API that C programmers have no problems learning.  Again,
> coroutines are an example of this of keeping the familiar create/enter/yi=
eld
> API and hiding the "magic" of C++ coroutines (and when they don't, that h=
ad
> better be an improvement).
>=20
> In the end, C++ is a tool that you can use if it leads to better code. For
> example, I don't see much use of C++ for devices for example, and the
> storage devices in particular do not even need coroutines because they use
> the callback-based interface.  But perhaps someone will try to use templa=
tes
> to replace repeated inclusion (which is common in hw/display) and others
> will follow suit.  Or perhaps not.
>=20
> One example that was brought up on IRC is type-safe operations on things
> such as hwaddr (i.e. hwaddr+int is allowed but hwaddr-hwaddr gives back an
> int64_t and might even check for overflow).  These would be opt in (you g=
et
> them just by changing a file from .c to .cc), but the actual C++ code wou=
ld
> still look very much like C code that uses hwaddr with no type checking.
> All the operator overloading gunk would be in include/.
>=20
> A different topic is what would happen if all of QEMU could be compiled as
> C++, and could inform our selection of C++ idioms even long before we get
> there.  For example, I'm fine with GLib and our type-safe intrusive lists,
> so I don't have much interest in STL containers and I would prefer _not_ =
to
> use STL containers even in .cc files[1].  However, perhaps QEMU's home-gr=
own
> lock guard might be replaced by something that uses C++ destructors inste=
ad
> of g_autoptr, so perhaps we should consider using std::lock_guard<>, or
> something like that, instead of QEMU_LOCK_GUARD.  It may be interesting to
> pass down lock_guards as arguments to enforce "this lock is taken"
> invariants.
>=20
> But really, coroutines would be enough work so my dish would be full for
> some time and I wouldn't really have time to look at any of this. :)

I think it will be necessary to compile QEMU with a C++ compiler quite
soon. It is possible to provide C APIs like in the case of coroutines,
but sometimes C++ features need to be exposed to the caller (like the
lock guards you mentioned). Also, once C++ is available people will
start submitting C++ patches simply because they are more comfortable
with C++ (especially one-time/infrequent contributors).

We need to agree on a policy so that people know how and when they can
use C++.

The policy needs to be simple so it doesn't create hurdles for new
contributors.

Does anyone have experience with C projects that introduced C++ and what
worked/didn't work?

Stefan

--m+ylgoGWcp/zwiOo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIwnSkACgkQnKSrs4Gr
c8jZ2gf+KeGczNlfejZ7x+AsTaSXFMqsEs71T5wKisGRMxN1Ry920hBmolnn8dGq
miJpXzu0npy+eTuuPA0omDqcEWxeayVroK3LXCGDwXkYNyc7QqN4G323q7Hl0H1s
TsPVs8jIzyMNUwTCRa3uK8pz1k15MmHw6o0L3Up0vciMnl6yF6a9V3ZVudbRPIHw
hLmG6359dlaaXSurEAT0/bgbcUT+L55b1xHGAzq1Rn/G2frysGj+4ZEGbdFyZLYl
qrpknIdzPSZ1o/HBOKWQRUAaydnxuAUe1R5w/h6DXc+yFbsmad0j+xKIOrQ0FGqh
oL/79IWtuor7hgMXjjCz3MZnHc+t1Q==
=kTaO
-----END PGP SIGNATURE-----

--m+ylgoGWcp/zwiOo--


