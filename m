Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8976D4B9C9A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:57:59 +0100 (CET)
Received: from localhost ([::1]:53662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdXy-0003Fp-0O
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:57:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKd6P-0005Bn-Ia
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:29:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKd65-0002fh-1d
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645090147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v4u1OWFP22wNL4Ke4QOuzFIKF4tN0U34SDrE7znazR0=;
 b=cHCv0NYURcDzFXKZpUsvkQkpc4KyMDTWjPULI/LV/zDrmMwxLTHO0AVP0aLMZoJs75nXfo
 9lAGdrmwNEhmEESyiH5t9oqq8pWTX4YlJKF9m0KbupQQiZg4QPZ5jJwir05fD0rkbDu869
 eSKhKAAABTUGN5J34sPrmikrqrTI7kI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-Wzo-_gv7O3m8N0wjrSHf8A-1; Thu, 17 Feb 2022 04:29:03 -0500
X-MC-Unique: Wzo-_gv7O3m8N0wjrSHf8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE801801ADA;
 Thu, 17 Feb 2022 09:29:02 +0000 (UTC)
Received: from localhost (unknown [10.39.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F19110694EA;
 Thu, 17 Feb 2022 09:28:56 +0000 (UTC)
Date: Thu, 17 Feb 2022 09:28:55 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: Portable inline asm to get address of TLS variable
Message-ID: <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain>
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <877d9uzgsd.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TNgSONlQIPlw+CbZ"
Content-Disposition: inline
In-Reply-To: <877d9uzgsd.fsf@oldenburg.str.redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TNgSONlQIPlw+CbZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 09:40:34PM +0100, Florian Weimer wrote:
> * Stefan Hajnoczi:
>=20
> > On Wed, 16 Feb 2022 at 18:14, Florian Weimer <fweimer@redhat.com> wrote:
> >>
> >> * Stefan Hajnoczi:
> >>
> >> > I've been trying to make the inline asm that gets the address of a T=
LS
> >> > variable for QEMU coroutines pass QEMU's GitLab CI.
> >> > https://gitlab.com/stefanha/qemu/-/blob/coroutine-tls-fix/include/qe=
mu/coroutine-tls.h#L89
> >> >
> >> > The code isn't -fPIC-friendly (R_X86_64_TPOFF32 relocations aren't
> >> > allowed in -fPIC shared libraries) so builds fail with ./configure
> >> > --enable-modules. While I was tackling this I stumbled on this:
> >> >
> >> >   void *dst_ptr;
> >> >   asm volatile("" : "=3Dr"(dst_ptr) : "0"(&tls_var))
> >> >
> >> > What's nice about it:
> >> > - It's portable, there are no arch-specific assembly instructions.
> >> > - It works for both -fPIC and non-PIC.
> >> >
> >> > However, I wonder if the compiler might reuse a register that already
> >> > contains the address. Then we'd have the coroutine problem again when
> >> > qemu_coroutine_yield() is called between the earlier address calcula=
tion
> >> > and the asm volatile statement.
> >> >
> >> > Thoughts?
> >>
> >> Sorry, I don't see why this isn't equivalent to a plain &tls_var.
> >> What exactly are you trying to achieve?
> >
> > &tls_var, except forcing the compiler to calculate the address from scr=
atch.
>=20
> I think you can compute
>=20
>   (void *) &tls_var - __builtin_thread_pointer ();
>=20
> to get the offset.  On many targets, GCC folds away the thread pointer
> load, but that doesn't change the outcome.  Then it boils down to
> getting access to the thread pointer, and you can get that behind a
> compiler barrier (in a separate function).

Interesting, this is something we haven't tried yet. It sounds like it
can be implemented in C without architecture- or ELF-specific inline
assembly.

> But going against ABI and toolchain in this way is really no long-term
> solution.  You need to switch to stackless co-routines, or we need to
> provide proper ABI-level support for this.  Today it's the thread
> pointer, tomorrow it's the shadow stack pointer, and the day after that,
> it's the SafeStack pointer.  And further down the road, it's some thread
> state for garbage collection support.  Or something like that.

Yes, understood :(. This does feel like solving an undefined behavior
problem by adding more undefined behavior on top!

Stackless coroutines have been tried in the past using Continuation
Passing C (https://github.com/kerneis/cpc). Ideally we'd use a solution
built into the compiler though. I'm concerned that CPC might not be
supported or available everywhere QEMU needs to run now and in the
future.

I took a quick look at C++20 coroutines since they are available in
compilers but the primitives look hard to use even from C++, let alone
=66rom C.

If you have any suggestions for stackless coroutine implementations,
please let me know!

Stefan

--TNgSONlQIPlw+CbZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIOFVcACgkQnKSrs4Gr
c8hCUgf9FfPgV0D3XJD1vkeO+99m9NOjOU62SEBpttli/X/r3WLXDvnhzT0HzVSg
5+6pCmzRK4IG8BGgL/nvd7flo7gs2OpzODGuSnOBrFck6QObG2643UkAbI+ig1UT
y/XUFWNDHJFDdJGWzBxC6IeZwHlliqFIz15oxwd1OMRQWNk90BkFR3G1J5Msa905
UGaBuDb++VykjxYAVJKR7Ivp2BXXEuBh4HSbA6RCO0xGGdgC6btAtBbssezI4L00
NpWRsva53/4oPsPPZd64+YcCjNd9pI6CYm4rGPHRfjyAjpdH5o7LNT8wFfa1MZXZ
M1whzkpNTSU3bftyNRM2jWnCtEb/yw==
=y93M
-----END PGP SIGNATURE-----

--TNgSONlQIPlw+CbZ--


