Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4CD472E9D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:12:30 +0100 (CET)
Received: from localhost ([::1]:50050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwm43-0003A6-Md
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:12:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwm1F-0001Tx-H6
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwm1D-0000Jx-7Q
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639404570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IZ/4gmd772ZlCt7fwN3expiRFKmfKx7zxV1utyJtkfk=;
 b=NMWwhlR6mU6ZSJYXyZUd8aesVRt3w7+gp3NdfOcP4RW5P5/jt9UXXeKQ9jimuQ1R/YD6ES
 U4qjAaxzMZKJbHLDZynKeKvnG+CKjM5FtLqAfmdoqsJbHR0M7NUmyzvi4jHC330CyTOBV/
 2gc1TXkIR+TW4se0mFfmX15GSejpqus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-llFilUHzPBaQUViZltOQVA-1; Mon, 13 Dec 2021 09:09:22 -0500
X-MC-Unique: llFilUHzPBaQUViZltOQVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FAEB102CB76;
 Mon, 13 Dec 2021 14:09:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7021860C9F;
 Mon, 13 Dec 2021 14:09:19 +0000 (UTC)
Date: Mon, 13 Dec 2021 14:09:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC v3 0/4] tls: add macros for coroutine-safe TLS variables
Message-ID: <YbdUDkTkt5srNdW+@stefanha-x1.localdomain>
References: <20211206142632.116925-1-stefanha@redhat.com>
 <CAFEAcA9=T-2AxzN1fhrtnu5U_5k7D8TPVjFXOLS_MeOCvR8FNA@mail.gmail.com>
 <Ya9nP63gwsk80POC@stefanha-x1.localdomain>
 <CAFEAcA_PfjwqS=4c=LCzZWbJBiELeBsdQ4QZur5wMtrtu1BFuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_PfjwqS=4c=LCzZWbJBiELeBsdQ4QZur5wMtrtu1BFuQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3tMPZRx+5j9Ef7YM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3tMPZRx+5j9Ef7YM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 01:55:34PM +0000, Peter Maydell wrote:
> On Tue, 7 Dec 2021 at 13:53, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > On Mon, Dec 06, 2021 at 02:34:45PM +0000, Peter Maydell wrote:
> > > On Mon, 6 Dec 2021 at 14:33, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> > > >
> > > > v3:
> > > > - Added __attribute__((weak)) to get_ptr_*() [Florian]
> > >
> > > Do we really need it *only* on get_ptr_*() ? If we need to
> > > noinline the other two we probably also should use the same
> > > attribute weak to force no optimizations at all.
> >
> > The weak attribute can't be used on static functions, so I think we nee=
d
> > a different approach:
> >
> > In file included from ../util/async.c:35:
> > /builds/stefanha/qemu/include/qemu/coroutine-tls.h:201:11: error: weak =
declaration of 'get_ptr_my_aiocontext' must be public
> >      type *get_ptr_##var(void)                                         =
       \
> >            ^~~~~~~~
> > ../util/async.c:673:1: note: in expansion of macro 'QEMU_DEFINE_STATIC_=
CO_TLS'
> >  QEMU_DEFINE_STATIC_CO_TLS(AioContext *, my_aiocontext)
> >  ^~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Adding asm volatile("") seems to work though:
> > https://godbolt.org/z/3hn8Gh41d
>=20
> You can see in the clang disassembly there that this isn't
> sufficient. The compiler puts in both calls, but it ignores
> the return results and always returns "true" from the function.

Specifying a input operand forces the compiler to evaluate the return
value of get_ptr_i():

  static __attribute__((noinline)) long get_ptr_i()
  {
    long l =3D (long)&i;
    asm volatile("" : "+rm" (l));
    return l;
  }

https://godbolt.org/z/e6ddGdPMv

Stefan

--3tMPZRx+5j9Ef7YM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3VA4ACgkQnKSrs4Gr
c8jaKQgAlvL9PW0hbxR3czh96/X35Umlu3mNVrwwpO8qOrSytPQ1/Jy5VRa7G+FI
z8kq4Dm/TJRuOg/oOsKlwo2StjJ4Yh8XsjaGk7+Uy3m9r1ZiY016IFgycxLPJWrZ
Mts0liE5IxQqlAs2VPX8DvartvnHd16Wc5ikng/2C5KAFgPjUCm9Dif1Ul+oFy5D
+bowOqyM+vLQszja2e3Od3R4vOLjkxuG0UUvUej5Su7eR02mQB4CbCFAI+xKyUe8
z2DzgiuqmNlM2JMK1v/OiYTviorDnRvn9dH5aYULdA6Xyf/Fv5a4IgnKI116cmIx
VhioFUqZYDR0Vmgf6OypVgiUyNt4lw==
=LKdR
-----END PGP SIGNATURE-----

--3tMPZRx+5j9Ef7YM--


