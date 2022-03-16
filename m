Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F054DB219
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:01:30 +0100 (CET)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUDR-0005Oa-Ka
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:01:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUTi4-0005iL-Sr
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:29:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUTi3-0004uX-Eh
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647437343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e8Oh8Vfun5KJGt5N6E63MuVxyN+oqOaSPWwN0galyyo=;
 b=fsiGXr4zoSDseLcpIOWcsPqetJei+7O6K0KT3ibsxPmnZbgvC4sqJFOqJsg13kXWljXof/
 mAxqbvZ3hAm+XjrYKIn5F66WMZuN3/kBn8P52mvN5wWdzedrMFs466Afmsl8SfGci2Hta3
 T0ExnjSOjHMnmTnuTpRayoZbeFQWNtU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-15hRo5aLPs-cSIWoiDpgWQ-1; Wed, 16 Mar 2022 09:28:59 -0400
X-MC-Unique: 15hRo5aLPs-cSIWoiDpgWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02F2E811E76;
 Wed, 16 Mar 2022 13:28:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E496401E6F;
 Wed, 16 Mar 2022 13:28:58 +0000 (UTC)
Date: Wed, 16 Mar 2022 13:28:57 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] coroutine: use QEMU_DEFINE_STATIC_CO_TLS()
Message-ID: <YjHmGQ3J4Q0bERaw@stefanha-x1.localdomain>
References: <20220307153853.602859-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r/dw6KDpXZt94ISq"
Content-Disposition: inline
In-Reply-To: <20220307153853.602859-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Cc: kwolf@redhat.com, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--r/dw6KDpXZt94ISq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 03:38:50PM +0000, Stefan Hajnoczi wrote:
> The coroutine implementation uses __thread variables internally. Compiler
> optimizations may cache Thread-Local Storage values across
> qemu_coroutine_yield(), leading to stale values being used after the coro=
utine
> is re-entered from another thread.
>=20
> Kevin pointed out that the coroutine implementation itself is vulnerable =
to
> this problem. As a follow-up to my coroutine TLS patch series I'm sending=
 these
> patches to convert __thread variables to the new "qemu/coroutine-tls.h" m=
acros
> so they are safe.
>=20
> Stefan Hajnoczi (3):
>   coroutine-ucontext: use QEMU_DEFINE_STATIC_CO_TLS()
>   coroutine: use QEMU_DEFINE_STATIC_CO_TLS()
>   coroutine-win32: use QEMU_DEFINE_STATIC_CO_TLS()
>=20
>  util/coroutine-ucontext.c | 38 +++++++++++++++++++++++-------------
>  util/coroutine-win32.c    | 18 ++++++++++++-----
>  util/qemu-coroutine.c     | 41 +++++++++++++++++++++++----------------
>  3 files changed, 61 insertions(+), 36 deletions(-)

Kevin: Is this what you had in mind?

--r/dw6KDpXZt94ISq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIx5hkACgkQnKSrs4Gr
c8jo+QgAgZVSh8JDrPgLc2fXGuUEIn05BsgUR2xjrGSrHjMMhlzGXUG5VPxvjyel
KdPNX7IDZ0oTudiUzGdqPZwYpM5SVJc4hMvfK+UxVQ7VVrJemGvounsqApx3laGv
FQKFpCvbRxIp28l5ItC3sfkXSw3WTqhUcZDYGi8x413pPfTLSm7SIZLCfPvTNLMp
LYDK3A87B5/jty+S4+K5ARMaGWheC9jucszjsWgjg+ZmIHpX/RRkitSMTQSz2XS1
5lUYz06H7KrKRCu/Qp9A/CjqEHrttN6JOEeQunfh61klCaiNvvBZXvnXb1/aAkXA
qyXOwgYE6aVj0yUN/18DypMAYF6WbA==
=krqa
-----END PGP SIGNATURE-----

--r/dw6KDpXZt94ISq--


