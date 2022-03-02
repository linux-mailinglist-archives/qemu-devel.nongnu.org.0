Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20394CA7C5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:18:21 +0100 (CET)
Received: from localhost ([::1]:49996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPo3-0007ee-VN
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:18:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPPmO-0005QU-5p
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 09:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPPmM-0007Da-Kd
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 09:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646230593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7EHR8ccSbKwVrkWQO65W0i2Pc91w+H4//to7sIR5JmI=;
 b=SxfTImv7sY5y43f07MMUHoEjuh+RoyWVvjWmS3vGdURGicQImMwcefFvy10o/e+jXFVbj1
 iVL4kG3vO+Vnxx6IZLBqbPSkULIEac0Z1t1Uxxp2TQdutcoEeNwgx7eH6ntsybyGhvfOpV
 5URqVg45/pWKWq2+vwblcZT+78AZ69o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-WaJZCNnrMAaEytjos0Ow-w-1; Wed, 02 Mar 2022 09:16:30 -0500
X-MC-Unique: WaJZCNnrMAaEytjos0Ow-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D561091DA2;
 Wed,  2 Mar 2022 14:16:29 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 156318495F;
 Wed,  2 Mar 2022 14:16:28 +0000 (UTC)
Date: Wed, 2 Mar 2022 14:16:27 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 0/4] tls: add macros for coroutine-safe TLS variables
Message-ID: <Yh98O0L7HauhS46Z@stefanha-x1.localdomain>
References: <20220222140150.27240-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7yYVUqA9jp/pxARN"
Content-Disposition: inline
In-Reply-To: <20220222140150.27240-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Florian Weimer <fweimer@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7yYVUqA9jp/pxARN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 02:01:46PM +0000, Stefan Hajnoczi wrote:
> v5:
> - Added explicit "#include "qemu/coroutine-tls.h" in patch 4 [Philippe]
> - Updated patch 1 commit description and comments to describe the current
>   noinline plus asm volatile approach [Peter]
> v4:
> - Dropped '[RFC]'.
> - Dropped inline asm for now. -fPIC versions of the code are missing and I
>   hit several issues including a clang LTO bug where thread local variabl=
es are
>   incorrectly discarded because inline asm is not analyzed to find symbol
>   dependencies (Serge Guelton is aware).
> - Fixed CI failures.
> v3:
> - Added __attribute__((weak)) to get_ptr_*() [Florian]
> - Replace rdfsbase with mov %%fs:0,%0 [Florian]
>=20
> This patch series solves the coroutines TLS problem. Coroutines re-entere=
d from
> another thread sometimes see stale TLS values. This happens because compi=
lers
> may cache values across yield points, so a value from the previous thread=
 will
> be used when the coroutine is re-entered in another thread.
>=20
> Serge Guelton developed a portable technique, see the first patch for det=
ails.
>=20
> I have audited all __thread variables in QEMU and converted those that ca=
n be
> used from coroutines. Most actually look safe to me.
>=20
> Stefan Hajnoczi (4):
>   tls: add macros for coroutine-safe TLS variables
>   util/async: replace __thread with QEMU TLS macros
>   rcu: use coroutine TLS macros
>   cpus: use coroutine TLS macros for iothread_locked
>=20
>  include/qemu/coroutine-tls.h | 165 +++++++++++++++++++++++++++++++++++
>  include/qemu/rcu.h           |   7 +-
>  softmmu/cpus.c               |   9 +-
>  tests/unit/rcutorture.c      |  10 +--
>  tests/unit/test-rcu-list.c   |   4 +-
>  util/async.c                 |  12 +--
>  util/rcu.c                   |  10 +--
>  7 files changed, 193 insertions(+), 24 deletions(-)
>  create mode 100644 include/qemu/coroutine-tls.h

Ping.

Stefan

--7yYVUqA9jp/pxARN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIffDsACgkQnKSrs4Gr
c8iM3wf+LByMy5zE4RAvpx2puQiiArm1EHd4KXLAskeeCoW0vIPsXHnAbR4AR1X0
5Eds43dQhCW+ZGMQOnNyjILUthESTtUQhSGURP15/8Ub2NbD0yIUY1hkFe4T25Ii
rTb+5i16E2XQHkKF8UdJFSvgOSAYQ1Z42xl8WfT16LwXWSq2GO8tXZaWfnXfaw2V
wHu6jS8C1v/01T8dlR1iM2Gn/8qZ2125ikzRIdngm9jD34pJhcdM6wYwHLTAnz++
FIZVjm3jOtPUAu1ne7vggLXPamDdTN/5Th9tTmm0n8kcouEa7WOESvFYZL+jRW9m
hCIf/uCKYWkYP1m6sVF1aWcAy5HuFQ==
=vl1/
-----END PGP SIGNATURE-----

--7yYVUqA9jp/pxARN--


