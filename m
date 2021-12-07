Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD7146BD03
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 14:55:10 +0100 (CET)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muaw1-0006Vm-49
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 08:55:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muauD-0005Gf-Hl
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:53:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muau7-00021x-V1
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638885188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z0IWIQsp0xUaMSjk+2JNWoDgWrTxAr18iNO+rcQnKQo=;
 b=Jnn8ZumAsHzP6rbzWij9Z9bLIkmuAQmsW8JFSFxLhkkwgEExGri3fSkHM63njLdrg2F9TV
 yZADwAgu4SpySkKbvYPc6m9eDBuw++YgYrcE2wX7tOZAySOF3z7ox67hUlFfgSqWjYBHdl
 wQ7wiHBcrCwsxqXoW77uArdJovjQicY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-GH5-a6VnO8yk2F4fj6_Thw-1; Tue, 07 Dec 2021 08:53:06 -0500
X-MC-Unique: GH5-a6VnO8yk2F4fj6_Thw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 115278710F1;
 Tue,  7 Dec 2021 13:53:05 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9906760843;
 Tue,  7 Dec 2021 13:53:04 +0000 (UTC)
Date: Tue, 7 Dec 2021 13:53:03 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC v3 0/4] tls: add macros for coroutine-safe TLS variables
Message-ID: <Ya9nP63gwsk80POC@stefanha-x1.localdomain>
References: <20211206142632.116925-1-stefanha@redhat.com>
 <CAFEAcA9=T-2AxzN1fhrtnu5U_5k7D8TPVjFXOLS_MeOCvR8FNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=T-2AxzN1fhrtnu5U_5k7D8TPVjFXOLS_MeOCvR8FNA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DywgZOoE+2kyEKs1"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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

--DywgZOoE+2kyEKs1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 02:34:45PM +0000, Peter Maydell wrote:
> On Mon, 6 Dec 2021 at 14:33, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > v3:
> > - Added __attribute__((weak)) to get_ptr_*() [Florian]
>=20
> Do we really need it *only* on get_ptr_*() ? If we need to
> noinline the other two we probably also should use the same
> attribute weak to force no optimizations at all.

The weak attribute can't be used on static functions, so I think we need
a different approach:

In file included from ../util/async.c:35:
/builds/stefanha/qemu/include/qemu/coroutine-tls.h:201:11: error: weak decl=
aration of 'get_ptr_my_aiocontext' must be public
     type *get_ptr_##var(void)                                             =
   \
           ^~~~~~~~
../util/async.c:673:1: note: in expansion of macro 'QEMU_DEFINE_STATIC_CO_T=
LS'
 QEMU_DEFINE_STATIC_CO_TLS(AioContext *, my_aiocontext)
 ^~~~~~~~~~~~~~~~~~~~~~~~~

Adding asm volatile("") seems to work though:
https://godbolt.org/z/3hn8Gh41d

The GCC documentation mentions combining noinline with asm(""):
https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-no=
inline-function-attribute

Stefan

--DywgZOoE+2kyEKs1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGvZz8ACgkQnKSrs4Gr
c8iGCgf+L2b+ZeDITct6IMiisXVyiDdAezzKcvqqROcrKOANkIfDkUIpKigMKd3V
1+FUDmQPvjoj7dAtbTBoEuhTXzmw2clx9/O2l4wwXeoiE50tvbfUcdNBFj/fTfy0
hWN2AOG9TTwcKvV7jYghIl2thufXANNV6xXL0JEOwixUkbU90m2ZWm3JZwcUv1Uz
36btzmJxEEt9yIsbIO5kKOdc4faQfn34TP6BTBeP9mH+Ry3rLU6KgfWdOhDj/0ju
a+6fHwJLTRQg0Acl8hbBS8ERVfDWyapm28nDtiueO54GDLG6UDrJ3e1OGtWuCU20
1LPEQQbOyQPa94nK+3aiiz8Vms5qsQ==
=8tOe
-----END PGP SIGNATURE-----

--DywgZOoE+2kyEKs1--


