Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CEC4D86F1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:28:55 +0100 (CET)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlgs-0002VZ-EO
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:28:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nTlLv-0001Hp-Jr
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:07:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nTlLo-0007Gr-2y
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647266827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lmq+Ph1SmiSb9FyYxIHaU++8NBhyCLbEVgQzc9R4N8s=;
 b=VUeiAjHjNUxcphiIiXP2RLfm723qbsJvEFAnJODLckiJLnCuQOj9BAkmlUn4C/3OylwfJi
 QOta68atwk1fufAOOL0DPJjK40ShGOsGlh9P58MYfeCPvzeY5P4wJ8b8eqVLSL+ySh0N9i
 vJMDEzbMmgMqni53mQFRWIVcPEV05JA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-hdsiWYuLNk6WUFu99-wEug-1; Mon, 14 Mar 2022 10:07:03 -0400
X-MC-Unique: hdsiWYuLNk6WUFu99-wEug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8854118E0044;
 Mon, 14 Mar 2022 14:07:03 +0000 (UTC)
Received: from localhost (unknown [10.39.195.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 464EA5E939F;
 Mon, 14 Mar 2022 14:07:03 +0000 (UTC)
Date: Mon, 14 Mar 2022 14:07:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+qq5IgQB+6sM2iX5"
Content-Disposition: inline
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--+qq5IgQB+6sM2iX5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 10:31:47AM +0100, Paolo Bonzini wrote:
> However, there  are no ramifications to actual coroutine code, except
> for the template syntax "CoroutineFn<return_type>" for the function and
> the mandatory co_await/co_return keywords... both of which are an
> improvement, really: the fact that a single function cannot run either
> inside or outside coroutines is checked by the compiler now, because
> qemu_coroutine_create accepts a function that returns CoroutineFn<void>.

Yeah, these are nice.

> One important difference is that C++ coroutines allocate frames on the
> heap, and that explains why performance is better in /perf/nesting,
> which has to do many large memory allocations for the stack in the other
> two backends (and also a makecontext/swapcontext in the ucontext case).
> C++ coroutines hardly benefit from the coroutine pool; OTOH that also
> means the coroutine pool could be removed if we went this way.

Removing the pool would be nice.

> Overall this was ~twice the amount of work of the C experiment, but
> that's because the two are very different ways to achieve the same goal:
>=20
> - the design work was substantially smaller in the C experiment, where
> all the backend does is allocate stack frames and do a loop that invokes
> a function pointer.  Here the backend has to map between the C++ concepts
> and the QEMU API.  In the C case, most of the work was really in the
> manual conversion which I had to do one function at a time.
>=20
> - the remaining work is also completely different: a source-to-source
> translator (and only build system work in QEMU) for the C experiment;
> making ~100 files compile in C++ for this one (and relatively little
> work as far as coroutines are concerned).
>=20
> This was compiled with GCC 11 only.  Coroutine support was added in
> GCC 10, released in 2020, which IIRC is much newer than the most recent
> release we support.

Using C++ coroutines is likely to be lower risk than maintaining our own
C coroutine source-to-source translator. On the other hand, it exposes
QEMU developers to C++ whether they like it or not so it may not be
popular.

If we can reach a consensus about C++ language usage in QEMU then I'm in
favor of using C++ coroutines. It's probably not realistic to think we
can limit C++ language usage to just coroutines forever. Someone finds
another C++ feature they absolutely need and over time the codebase
becomes C++ - with both its advantages and disadvantages. I'm not sure
what the best solution is but this sounds like a recipe for an identity
crisis with the potential to cause friction for years. From that
perspective I feel it's better to allow C++ and get over it although
what I'd really like is just C++ coroutines and nothing else :P.

To add some more detail, although you can write C in C++, it's not
idiomatic modern C++. The language lends itself to a different style of
programming that some will embrace while others will not. It will be a
bigger impedance mismatch than anything currently in the codebase (e.g.
glib vs non-glib code).

On the other hand, a number of projects have already gone through a
transition like this (gcc, gdb, ...). Maybe we can learn from their
mistakes?

Stefan

--+qq5IgQB+6sM2iX5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIvTAQACgkQnKSrs4Gr
c8ik0Qf+KWvt6QKLfa38/IjeSVPd/KhDZHLJEaX6W9tcpPWR+m8CNkjwUcYiYLxz
xzbjgPxumQO52xAr128jpDH8jLRe9PK7SqM3pfby7Fn3gIjrCU/3DeEyco7OZyWn
63iWKBrJHyAU17xbt1acL+wnSvOis3yOQhRVlhPB/cw/rFxCxpXoN6HV1nHcEu8+
ey7b09L3AZsDbxDvSprVYOWrYvgh7HBJRI+VcI2zogVZPojr+oosw0fBqtqDORdl
CutVyCLAT08upOIALts5TxhvNMd2B62sX2t7gy4Kuz1sNlWzTZEfMwWLLCSLznhU
C67gUvacB+Ks+PEVa6QjUJXe6B9W6Q==
=BErU
-----END PGP SIGNATURE-----

--+qq5IgQB+6sM2iX5--


