Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589764E2482
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 11:41:29 +0100 (CET)
Received: from localhost ([::1]:54600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWFTc-0007KL-18
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 06:41:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWFSR-0006Ea-Lh
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 06:40:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWFSM-000576-8D
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 06:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647859209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SYCjIhCDxtw5dYh0Iezo5rH72cP1+c7WUNC3UVCUU6A=;
 b=F3VHTsiFMGiEPLpwBqpVYp64e2iUmKW8WhY4wh5ZuNr6RccB6B7hx6MlHQLRAF+f56bD2K
 pzFgFj6loIl9aLD9WyLgwwqJsO43uCQaNbReJfSEFboDeslJyipNpOZzintC4nmVORJWS6
 uPPockOb/kyMV/AyapdrtgilwnQc9PE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-1FaflM1-NhyIJAn4dHW_eQ-1; Mon, 21 Mar 2022 06:40:06 -0400
X-MC-Unique: 1FaflM1-NhyIJAn4dHW_eQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B53382A59559;
 Mon, 21 Mar 2022 10:40:05 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C314492C14;
 Mon, 21 Mar 2022 10:40:05 +0000 (UTC)
Date: Mon, 21 Mar 2022 10:40:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: comparison of coroutine backends
Message-ID: <YjhWBDm6jHVI6H0F@stefanha-x1.localdomain>
References: <8e98ff69-2f35-72c1-9b68-2a6a19ed716b@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ooyzxNQMnx2nKJga"
Content-Disposition: inline
In-Reply-To: <8e98ff69-2f35-72c1-9b68-2a6a19ed716b@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ooyzxNQMnx2nKJga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 09:48:37AM +0100, Paolo Bonzini wrote:
> Hi all,
>=20
> based on the previous discussions here is a comparison of the various
> possibilities for implementing coroutine backends in QEMU and the
> respective advantages and disadvantages.
>=20
> I'm adding a third possibility for stackless coroutines, which is to
> use the LLVM/clang builtins.  I believe that would still require a
> source-to-source translator, but it would offload to the compiler the
> complicated bits such as liveness analysis.
>=20
> 1) Stackful coroutines:
> Advantages:
> - no changes to current code
>=20
> Disadvantages:
> - portability issues regarding shadow stacks (SafeStack, CET)
> - portability/nonconformance issues regarding TLS
>=20
> Another possible advantage is that it allows using the same function for
> both coroutine and non-coroutine context.  I'm listing this separately
> because I'm not sure that's desirable, as it prevents compile-time
> checking of calls to coroutine_fn.  Compile-time checking would be
> possible using clang -fthread-safety if we forgo the ability to use the
> same function in both scenarios.
>=20
>=20
> 2) "Duff's device" stackless coroutines
> Advantages:

- Supports gcc and clang

> - no portability issues regarding both shadow stacks and TLS
> - compiles to good old C code
> - compile-time checking of "coroutine-only" but not awaitable functions
> - debuggability: stack frames should be easy to inspect

The user needs to understand how the coroutine runtime works in order to
get a backtrace of a suspended coroutine. More likely a GDB Python
script will be needed for this.

> Disadvantages:
> - complex source-to-source translator
> - more complex build process
>=20
>=20
> 3) C++20 stackless coroutines
> Advantages:
> - no portability issues regarding both shadow stacks and TLS
> - no code to write outside QEMU
> - simpler build process
>=20
> Disadvantages:
> - requires a new compiler
> - it's C++

- raises questions about C++ usage in QEMU, which seem to be
  controversial

> - no compile-time checking of "coroutine-only" but not awaitable functions
>=20
>=20
> 4) LLVM stackless coroutines
> Advantages:
> - no portability issues regarding both shadow stacks and TLS
> - no code to write outside QEMU
>=20
> Disadvantages:
> - relatively simple source-to-source translator
> - more complex build process
> - requires a new compiler and doesn't support GCC
>=20
>=20
> Note that (2) would still have a build dependency on libclang.
> However the code generation could still be done with GCC and with
> any compiler version.
>=20
> I'll also put it in a table, though I understand that some choices
> here might be debatable:
>=20
>                          stackful      Duff's device            C++20    =
          LLVM
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Code to write/maintain    ++ [1]             ---                   +++   =
           - [2]
> Changes to existing code  ++ [3]             -                     --    =
           -
> Community acceptance      ++                 ++                    --    =
           ?
> Code or PoC exists        ++                 +                     -     =
           --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Portability               --                 ++                    +     =
           -
> Debuggability             -                  ++                    ?     =
           ?
> Performance               -                  ++ [4]                ++    =
           ++
>=20
> [1] I'm penalizing stackful coroutines here because the worse portability
> has an impact on future maintainability too.
>=20
> [2] This is an educated guess.
>=20
> [3] If we decide to remove the possibility of using the same function for
> both coroutine and non-coroutine context, the changes to existing code
> would be the same as for Duff's device and LLVM coroutines.
>=20
> [4] Slightly worse than C++20 coroutines for the PoC, but that is mostly =
due
> to implementation choices that are easy to change.
>=20
>=20
> Stackful coroutines are obviously pretty good, or we wouldn't have used t=
hem.
> They might be a local optimum though, as shown by the negative points in =
terms
> of portability, debuggability and performance.
>=20
> Both Duff's device and LLVM would be more or less transparent to the part=
 of
> the community that doesn't care about the coroutines.  The translator wou=
ld
> probably be write-and-forget (though I'm not sure about the API stability=
 of
> libclang, which would be a major factor), but it would still be a substan=
tial
> amount of work to commit to.

I don't see a clear winner but here is my order of preference:
1. Stackful - the devil we know
2. Duff's device - a temporary (wasteful) step before native compiler suppo=
rt?
3. LLVM - actually not bad but requires dropping gcc support
4. C++20 - I worry adding C++ into the codebase will cause friction

Ideally gcc and clang would support C coroutines natively, making the
choice simple. Is it worth treating this as a long term project and
working with LLVM/clang and gcc to add native C coroutine support to
compilers? We still have stackful coroutines in the short term.

Stefan

--ooyzxNQMnx2nKJga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmI4VgQACgkQnKSrs4Gr
c8guyQgAlf0jzEl8xRLqvEG08JBOdvOThGt3euLeGiY7vQmshofUaXd4xcsO8ZSy
oJNkP1Laj0oLPbTL1s8a01UPuRy7puzwUbmlye2tM3Qhl4JRwWtmPP8xw0TI8ZiH
PDfec1ViHtVwyPDPU5IlukGR0fHtEJVYDXfIFBk1Jo+0G/8/Gclo08Ta4W00bgw7
VeUTaVS24HOPKALhGZ9aWlFrUolgx3iyBpodgHAIpjfWy21GjUiQZLvCzeNeJoos
MQjuwca4lw5wh7ZtBLjmJZI3azZ9jn5mRGSF0FXX3wecFRiaJJ9HCDt3irGF7l8L
gxmA3w1NIiyRbsm9s4VgPtQnRECdFg==
=t+of
-----END PGP SIGNATURE-----

--ooyzxNQMnx2nKJga--


