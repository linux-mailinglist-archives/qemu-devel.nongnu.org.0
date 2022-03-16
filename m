Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3064DB5D3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 17:18:12 +0100 (CET)
Received: from localhost ([::1]:33888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUWLj-0005vK-6T
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 12:18:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nUWJV-0003Tk-SN
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nUWJQ-00010D-G3
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647447347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RLytpFatneFjUtXWTn5SyxZbpKSH9KYS5+X95uwRqH4=;
 b=F1aDgxhjNlQQ6dqpVNt75x9V/J0IUX1b9RKDeUaoKyyVnUHYwa61DqW0ggk47Bv3BMq9tc
 4T9r+TBbizy83PcQfPX6fGyJbOlh4mpdf/Y3zesZPBTIk77hhj8jR0Kr/Gqz6HxWY6i6aG
 Fodcm1AHBzvJgUXrltiVAWyagkYUqIs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-j6RIusOuPP6Rk7LQMuNz-g-1; Wed, 16 Mar 2022 12:15:43 -0400
X-MC-Unique: j6RIusOuPP6Rk7LQMuNz-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 020C73835B85;
 Wed, 16 Mar 2022 16:15:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06A97C531E0;
 Wed, 16 Mar 2022 16:15:41 +0000 (UTC)
Date: Wed, 16 Mar 2022 17:15:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjINLHMDP1l19ARu@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <YjCnss5W5MhZK1Hw@redhat.com> <YjC2+F2SkNEDOXTe@redhat.com>
 <7b634dc9-cca5-c9d0-e392-21a594851b0c@redhat.com>
 <YjHazSWJEM3lU8j6@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JOfSJS+i2H1eO03Y"
Content-Disposition: inline
In-Reply-To: <YjHazSWJEM3lU8j6@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, hreitz@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JOfSJS+i2H1eO03Y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 16.03.2022 um 13:40 hat Stefan Hajnoczi geschrieben:
> On Wed, Mar 16, 2022 at 12:08:33AM +0100, Paolo Bonzini wrote:
> > On 3/15/22 16:55, Daniel P. Berrang=E9 wrote:
> > > Expecting maintainers to enforce a subset during code review feels
> > > like it would be a tedious burden, that will inevitably let stuff
> > > through because humans are fallible, especially when presented
> > > with uninspiring, tedious, repetitive tasks.
> > >=20
> > > Restricting ourselves to a subset is only viable if we have
> > > an automated tool that can reliably enforce that subset. I'm not
> > > sure that any such tool exists, and not convinced our time is
> > > best served by trying to write & maintainer one either.
> >=20
> > We don't need to have a policy on which features are used.  We need to =
have
> > goals for what to use C++ for.  I won't go into further details here,
> > because I had already posted "When and how to use C++"[1] about an hour
> > before your reply.
> >=20
> > > IOW, I fear one we allow C++ in any level, it won't be practical
> > > to constrain it as much we desire. I fear us turning QEMU into
> > > even more of a monster like other big C++ apps I see which take
> > > all hours to compile while using all available RAM in Fedora RPM
> > > build hosts.
> >=20
> > Sorry but this is FUD.  There's plenty of C++ apps and libraries that d=
o not
> > "take hours to compile while using all available RAM".  You're probably
> > thinking of the Chromium/Firefox/Libreoffice triplet but those are an o=
rder
> > of magnitude larger than QEMU.  And in fact, QEMU is *already* a monster
> > that takes longer to compile than most other packages, no matter the
> > language they're written in.
> >=20
> > Most of KDE and everything that uses Qt is written in C++, and so is
> > Inkscape in GTK+ land.  LLVM and Clang are written in C++.  Hotspot and=
 V8
> > are written in C++.  Kodi, MAME and DolphinEmu are written in C++. GCC =
and
> > GDB have migrated to C++ and their compile times have not exploded.
> >=20
> > > My other question is whether adoption of C++ would complicate any
> > > desire to make more use of Rust in QEMU ? I know Rust came out of
> > > work by the Mozilla Firefox crew, and Firefox was C++, but I don't
> > > have any idea how they integrated use of Rust with Firefox, so
> > > whether there are any gotcha's for us or not ?
> >=20
> > Any Rust integration would go through C APIs.  Using Rust in the block =
layer
> > would certainly be much harder, though perhaps not impossible, if the b=
lock
> > layer uses C++ coroutines.  Rust supports something similar, but
> > two-direction interoperability would be hard.
>=20
> I haven't looked at this in depth but there is a solution for Rust-C++
> interop: https://cxx.rs/

"Direct FFI of async functions is absolutely in scope for CXX (on C++20
and up) but is not implemented yet in the current release."

With the current QEMU coroutines, calling Rust async fns from C is
relatively easy, and calling C coroutine_fns from a Rust async fn is
trivial when the Rust async fn is already called from a C coroutine
(because qemu_coroutine_yield() just works, we still have a coroutine
stack from the original C caller).

I suppose calling Rust async fns from C++ could actually have the same
implementation as with C when using Paolo's wrappers, but the other
direction might be a bit harder - to be honest, I can't tell because
I've never checked how C++ coroutines work internally. Could as well be
that a Rust wrapper for them isn't that hard after all.

Kevin

--JOfSJS+i2H1eO03Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmIyDSwACgkQfwmycsiP
L9YcrQ/+NeNbshvTsVXRzlFhxuPY66NCETut+VgACqFYvZUbQUpK5GjGsR0NU2BA
OvvUO+ylEEJxtcIM85F9aPwkqBS1HG46EDccjjsYz/g6ejFiXljZMicPxiTnUaLy
qu8RHCuCdzRTsHWgZwOAJV3olFtmJQYdtWeq7KNmBn2TyAhkD3vTfZ7app3C4S4x
2JqBzVpkU7KKSw40872w3DKXsace/GzwcaacCi3h2ZLuOq7ylnqcLpTNdP+5KVE9
slsMxcvLL7RQsGFGSt4iFPn9uU0f+74KDFAlaFzWcVrkWqicC/Lur8dQQK7o32eR
N7MOHj3X13Vh5Gl8gWCg17lwIn3A+TAwSRRGT/ANyvWFa2Ph09iBf0/InHKbq0O1
cBDSPg6VZTKoeOu9vwrnmlu4IVRqVJuQ2p9lzfbBk1vLDsgMkRF2MpAjN3dJx33d
nAOYUzJ+hgYdh+fGLfJvEcOQM+WUy+0Qt9jQJxPu9zAKNce5mkST3swJyGRbVS3o
DVes1QA5PFf8NIEKp5Xu0UN8SeJM4Rw9mI1NKvxbg+WCjxuCsYXBds4ud8W5zeUo
3O6TQ6bG+yidFmwx02JHaP9EaDcs/WkWGQhoTDTgG2FHKtPZv5xNR9OgFCtpqddp
fDreObbCpT97SyfZpdM/mXv24kHdwcDaE1Ri7tcBHQm32vL5J+Y=
=oSAm
-----END PGP SIGNATURE-----

--JOfSJS+i2H1eO03Y--


