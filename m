Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC264D9E30
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:55:46 +0100 (CET)
Received: from localhost ([::1]:59540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU8aP-0001Sw-DT
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:55:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nU8VP-0001yt-97
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nU8VN-0002hl-EK
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647355832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pB3nDXF1Ck/KsyClE5rIUJEubJH4GIE06JM/7a0oOGQ=;
 b=eUij8hP3lf2Khqpkmr1ylEFb3uvTVxOIBnwdK0Ec9FhJ6otkkLZ6fzNUyDHFTNz6fHpHqo
 c4R3lxokS7565DIbxGmaIa+PEGXg7s5A5Icg+HIUIgibv1ch2ZdaXpaEIKVIkzJ/aZyQ+l
 1Hlq4PvSoudGWgqxZPfOEMqXQ3PHI6o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-A0xliIhFNfq_3mgKknvCwA-1; Tue, 15 Mar 2022 10:50:29 -0400
X-MC-Unique: A0xliIhFNfq_3mgKknvCwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09D851044560;
 Tue, 15 Mar 2022 14:50:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12F60C15D40;
 Tue, 15 Mar 2022 14:50:27 +0000 (UTC)
Date: Tue, 15 Mar 2022 15:50:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjCnss5W5MhZK1Hw@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6OXLxKPGHASe5Jqa"
Content-Disposition: inline
In-Reply-To: <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, hreitz@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6OXLxKPGHASe5Jqa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 15.03.2022 um 15:05 hat Stefan Hajnoczi geschrieben:
> On Mon, Mar 14, 2022 at 05:21:22PM +0100, Paolo Bonzini wrote:
> > On 3/14/22 15:07, Stefan Hajnoczi wrote:
> > > If we can reach a consensus about C++ language usage in QEMU then I'm=
 in
> > > favor of using C++ coroutines. It's probably not realistic to think we
> > > can limit C++ language usage to just coroutines forever. Someone finds
> > > another C++ feature they absolutely need and over time the codebase
> > > becomes C++ - with both its advantages and disadvantages.
> > >=20
> > > [...] although you can write C in C++, it's not idiomatic modern C++.
> > > The language lends itself to a different style of programming that
> > > some will embrace while others will not.
> >=20
> > Yes, this is an important aspect to discuss.  I think coroutines provid=
e a
> > good blueprint for how QEMU might use C++.
> >=20
> > I totally agree that, if we go this way, the genie is out of the bottle=
 and
> > other uses of C++ will pop up with 100% probability.  But the important
> > thing to note is that our dialect of C is already not standard C, and t=
hat
> > some of our or GLib's "innovations" are actually based on experience wi=
th
> > C++.  We can keep on writing "QEMU's C" if we think of C++ as a superch=
arged
> > way of writing these quality-of-life improvements that we already write=
=2E  In
> > some sense coroutines are an extreme example of this idea.
> >=20
> > In fact, a C API would have to remain unless all source files are chang=
ed to
> > C++, so QEMU would remain mostly a C project with C idioms, but that do=
esn't
> > prevent _abstracting_ the use of C++ features (written in modern, idiom=
atic
> > C++) behind an API that C programmers have no problems learning.  Again,
> > coroutines are an example of this of keeping the familiar create/enter/=
yield
> > API and hiding the "magic" of C++ coroutines (and when they don't, that=
 had
> > better be an improvement).
> >=20
> > In the end, C++ is a tool that you can use if it leads to better code. =
For
> > example, I don't see much use of C++ for devices for example, and the
> > storage devices in particular do not even need coroutines because they =
use
> > the callback-based interface.  But perhaps someone will try to use temp=
lates
> > to replace repeated inclusion (which is common in hw/display) and others
> > will follow suit.  Or perhaps not.
> >=20
> > One example that was brought up on IRC is type-safe operations on things
> > such as hwaddr (i.e. hwaddr+int is allowed but hwaddr-hwaddr gives back=
 an
> > int64_t and might even check for overflow).  These would be opt in (you=
 get
> > them just by changing a file from .c to .cc), but the actual C++ code w=
ould
> > still look very much like C code that uses hwaddr with no type checking.
> > All the operator overloading gunk would be in include/.
> >=20
> > A different topic is what would happen if all of QEMU could be compiled=
 as
> > C++, and could inform our selection of C++ idioms even long before we g=
et
> > there.  For example, I'm fine with GLib and our type-safe intrusive lis=
ts,
> > so I don't have much interest in STL containers and I would prefer _not=
_ to
> > use STL containers even in .cc files[1].  However, perhaps QEMU's home-=
grown
> > lock guard might be replaced by something that uses C++ destructors ins=
tead
> > of g_autoptr, so perhaps we should consider using std::lock_guard<>, or
> > something like that, instead of QEMU_LOCK_GUARD.  It may be interesting=
 to
> > pass down lock_guards as arguments to enforce "this lock is taken"
> > invariants.
> >=20
> > But really, coroutines would be enough work so my dish would be full for
> > some time and I wouldn't really have time to look at any of this. :)
>=20
> I think it will be necessary to compile QEMU with a C++ compiler quite
> soon. It is possible to provide C APIs like in the case of coroutines,
> but sometimes C++ features need to be exposed to the caller (like the
> lock guards you mentioned).

I'm not sure what the C++ lock guards offer that our current lock guards
don't? Passing down lock guards makes sense to me, but why can't you do
that with QemuLockable? (Hm, or can the C++ version somehow check at
compile time that it's the _right_ lock that is held rather than just
any lock? It didn't look like it at the first sight.)

But I do see the benefit of a compiler checked CoroutineFn<> return type
compared to the coroutine_fn markers we have today. On the other hand...

> Also, once C++ is available people will start submitting C++ patches
> simply because they are more comfortable with C++ (especially
> one-time/infrequent contributors).

=2E..using C++ in coroutine code means that all of the block layer would
suddenly become C++ and would be most affected by this effect. I'm not
sure if that's something I would like to see, at least until there is a
clear tree-wide policy (that preferably limits it to a subset that I
understand).

Kevin

--6OXLxKPGHASe5Jqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmIwp7IACgkQfwmycsiP
L9bIaQ/+OfroFt0CbnSjnJakCURWusX/ngdYX8wpOqJ9uTkKnzWgzRGi6J7CFTFN
izGYUZiFbUZBS0kHpjPSuFfyYfYYfETwmomJFyJkx4u6C3vl+ZWulL9SEdbEeFdl
xC3EDjRy5/S4iWOV8F+W/vI7BW1DVSFeNLiIPH+/rADCiDl5Whd8n5wYo5zDY3E9
MssT6vNgLamkWeORGgPLIPsTDuYd/AUECYdfxuoKmbb2thjCkAQPAH7AScW9Uyp3
Va9OS2IEml0f/ex/OBjGIESf46F4bEUWWYeIiX/etuJcneG348Aq13PtibQMtqmH
DHIVsaael1suY4VS4wK2Jm0atG5bvQpy9vgakpFglN6clr3Q1UDsqLct+c9pwSdQ
9NXdBre5Vjow/gYqnkGwT3pqjB9yy6zR0zSBvAy3lY4YubJjLXXjMEKgD8xXNbYl
kGMqJ1ai7+rlIRS87HoqpdHA3sYuD4e6EclRxZ4HesvVeBw028yefd2LyN2O+4Go
RyoJTPh05iXjLDlkwvrQEfu7blmZ/88iqzldzUJRfxvbv1xQEOPKgfksUCFEe9rH
34N9FygIIRUKl21XhBB/cmrIjvNWL3mcTQSj4k/JvwwIIk6SAYjEbt4nWOLxXKGq
7dPUSP+MX1K59Q6PPyc+6kvCFtNvoWXMv+ET+BZnwrdGhOwYjc4=
=+UxY
-----END PGP SIGNATURE-----

--6OXLxKPGHASe5Jqa--


