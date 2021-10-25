Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9445443936C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:12:38 +0200 (CEST)
Received: from localhost ([::1]:54684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mewy5-0005ts-8B
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mewvu-0004xH-JU
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mewvo-0008Ck-OO
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635156616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2KR93qfandAE2Cbp0DBpm8g+YgsxBNFEiJSabhNkoTo=;
 b=C8T5AtrFslMF+8VnNwc37bsv1+U7P3VF/HLhvjdfc81d9LEyHXu5XMJQGZ22u5IQ+jQy8+
 fe898VNwwSsstkhCz5SD0iZD7zSizpQu44AccQr3PmQsrj1AQd9KTFLIu7Bv+6nwA24Sfo
 ccA9TazK4QwjUbj8Xu8Obt2jQ9PX0Us=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-H1-wvKv_PxmYbpRu3KK0yg-1; Mon, 25 Oct 2021 06:10:10 -0400
X-MC-Unique: H1-wvKv_PxmYbpRu3KK0yg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77C40101B4A2;
 Mon, 25 Oct 2021 10:10:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE06019724;
 Mon, 25 Oct 2021 10:10:08 +0000 (UTC)
Date: Mon, 25 Oct 2021 11:10:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 0/1] Block patches
Message-ID: <YXaCf1Vopjmpbri5@stefanha-x1.localdomain>
References: <20211021174104.52826-1-stefanha@redhat.com>
 <54613b7d-8362-380c-f7d8-1a21e83b706d@linaro.org>
MIME-Version: 1.0
In-Reply-To: <54613b7d-8362-380c-f7d8-1a21e83b706d@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gJpLBZpVpY5Aetvk"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gJpLBZpVpY5Aetvk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 03:08:56PM -0700, Richard Henderson wrote:
> On 10/21/21 10:41 AM, Stefan Hajnoczi wrote:
> > The following changes since commit afc9fcde55296b83f659de9da3cdf044812a=
6eeb:
> >=20
> >    Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into st=
aging (2021-10-20 06:10:51 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >=20
> > for you to fetch changes up to 4b2b3d2653f255ef4259a7689af1956536565901=
:
> >=20
> >    coroutine: resize pool periodically instead of limiting size (2021-1=
0-21 18:40:07 +0100)
> >=20
> > ----------------------------------------------------------------
> > Pull request
> >=20
> > Performance optimization when guest applications submit a lot of parall=
el I/O.
> > This has also been found to improve clang SafeStack performance.
> >=20
> > ----------------------------------------------------------------
> >=20
> > Stefan Hajnoczi (1):
> >    coroutine: resize pool periodically instead of limiting size
> >=20
> >   include/qemu/coroutine-pool-timer.h | 36 ++++++++++++++++
> >   include/qemu/coroutine.h            |  7 ++++
> >   iothread.c                          |  6 +++
> >   util/coroutine-pool-timer.c         | 35 ++++++++++++++++
> >   util/main-loop.c                    |  5 +++
> >   util/qemu-coroutine.c               | 64 ++++++++++++++++------------=
-
> >   util/meson.build                    |  1 +
> >   7 files changed, 125 insertions(+), 29 deletions(-)
> >   create mode 100644 include/qemu/coroutine-pool-timer.h
> >   create mode 100644 util/coroutine-pool-timer.c
>=20
> This is causing
>=20
>  (001/170) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_t=
cg:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
> reached\nOriginal status: ERROR\n{'name':
> '001-tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg',
> 'logdir':
> '/home/richard.henderson/qemu/bld/tests/results/job-2021-10-21T20.58-ae0f=
6...
> (900.15 s)
>  (002/170) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_k=
vm:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
> reached\nOriginal status: ERROR\n{'name':
> '002-tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_kvm',
> 'logdir':
> '/home/richard.henderson/qemu/bld/tests/results/job-2021-10-21T20.58-ae0f=
6...
> (900.23 s)
>=20
> I initially though this was just gitlab, but it reliably happens on my lo=
cal machine as well.

Thanks, the coroutine pool timer commit in this pull request is broken.
Coroutines are created in one thread and then destroyed in another, so
the thread-local book keeping that assumed coroutines live in a single
thread was getting out of sync.

I will drop this pull request for now.

Stefan

--gJpLBZpVpY5Aetvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF2gn8ACgkQnKSrs4Gr
c8jkgwgAiNqMd3/TBX6GE/FABqDXiZQ2o3qORlhM4/Da5wVwcROKOOIe1pywbMt0
vKMYeNPXFYaL54jIknteNs3IM54AqofIUYX/5ZVV9MtaUXiJfgXc73zOoqAsQ7hI
l2PZF9yjsKiSvggF+IlUm8uWAzzO5Z3XTOtv26sES8lqxO5SJ9o+vj93w3Q6qxld
UkdgG2RhG7OpfNjq5t9ZS2/2Z9JZGfDRCMx2oH3ZcJgsj3rowgg5EDhs8wJc4PkJ
ytS+dasoVfP2+ZnBHw9vKh4+/CgyXu7+gh8qrw+wbQBwAj5LaVASs4tMvquTb2NQ
P2Hi+L3gadtveyg+KlR8RyOK/asSzQ==
=2D9K
-----END PGP SIGNATURE-----

--gJpLBZpVpY5Aetvk--


