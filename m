Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B869683B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:38:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxNo-0006vT-1T; Tue, 14 Feb 2023 10:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pRxNl-0006vA-LR
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:38:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pRxNj-0006VS-A3
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676389089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jH8ibBY7EwYDdr4O90l+3cCTqHOjNo5E4L42vWMtHVo=;
 b=DtTVYvQMgNJRIFsdNilr0FiV3dyugWmVX8cjYZEg62srPo/qMFdH5x9eq8zdDdoUa4hHWY
 aTNc/j8iVrRCaFNLxeqLyNOZoyJCDWoyJ7Lom4I0uFQAP4TNjuBdotjlB09LXZV4EcJKrs
 n109+zVh6ocih71ylJ5DtteqioSGTXk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-FcOWPrDyNhCwMHW84WHYag-1; Tue, 14 Feb 2023 10:38:06 -0500
X-MC-Unique: FcOWPrDyNhCwMHW84WHYag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2AD8183B3C0;
 Tue, 14 Feb 2023 15:38:05 +0000 (UTC)
Received: from localhost (unknown [10.39.193.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58CF51415108;
 Tue, 14 Feb 2023 15:38:05 +0000 (UTC)
Date: Tue, 14 Feb 2023 10:38:03 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/10] Retire Fork-Based Fuzzing
Message-ID: <Y+uq234pKMdKpPyT@fedora>
References: <20230205042951.3570008-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JVGNv35tzSsjydBl"
Content-Disposition: inline
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--JVGNv35tzSsjydBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 04, 2023 at 11:29:41PM -0500, Alexander Bulekov wrote:
> Hello,
> This series removes fork-based fuzzing.
> How does fork-based fuzzing work?
>  * A single parent process initializes QEMU
>  * We identify the devices we wish to fuzz (fuzzer-dependent)
>  * Use QTest to PCI enumerate the devices
>  * After that we start a fork-server which forks the process and executes
>    fuzzer inputs inside the disposable children.
>=20
> In a normal fuzzing process, everything happens in a single process.
>=20
> Pros of fork-based fuzzing:
>  * We only need to do common configuration once (e.g. PCI enumeration).
>  * Fork provides a strong guarantee that fuzzer inputs will not interfere=
 with
>    each-other
>  * The fuzzing process can continue even after a child-process crashes
>  * We can apply our-own timers to child-processes to exit slow inputs, ea=
rly
>=20
> Cons of fork-based fuzzing:
>  * Fork-based fuzzing is not supported by libfuzzer. We had to build our =
own
>    fork-server and rely on tricks using linker-scripts and shared-memory =
to
>    support fuzzing. ( https://physics.bu.edu/~alxndr/libfuzzer-forkserver=
/ )
>  * Fork-based fuzzing is currently the main blocker preventing us from en=
abling
>    other fuzzers such as AFL++ on OSS-Fuzz
>  * Fork-based fuzzing may be a reason why coverage-builds are failing on
>    OSS-Fuzz. Coverage is an important fuzzing metric which would allow us=
 to
>    find parts of the code that are not well-covered.
>  * Fork-based fuzzing has high overhead. fork() is an expensive system-ca=
ll,
>    especially for processes running ASAN (with large/complex) VMA layouts.
>  * Fork prevents us from effectively fuzzing devices that rely on
>    threads (e.g. qxl).
>=20
> These patches remove fork-based fuzzing and replace it with reboot-based
> fuzzing for most cases. Misc notes about this change:
>  * libfuzzer appears to be no longer in active development. As such, the
>    current implementation of fork-based fuzzing (while having some nice
>    advantages) is likely to hold us back in the future. If these changes
>    are approved and appear to run successfully on OSS-Fuzz, we should be
>    able to easily experiment with other fuzzing engines (AFL++).
>  * Some device do not completely reset their state. This can lead to
>    non-reproducible crashes. However, in my local tests, most crashes
>    were reproducible. OSS-Fuzz shouldn't send us reports unless it can
>    consistently reproduce a crash.
>  * In theory, the corpus-format should not change, so the existing
>    corpus-inputs on OSS-Fuzz will transfer to the new reset()-able
>    fuzzers.
>  * Each fuzzing process will now exit after a single crash is found. To
>    continue the fuzzing process, use libfuzzer flags such as -jobs=3D-1
>  * We no long control input-timeouts (those are handled by libfuzzer).
>    Since timeouts on oss-fuzz can be many seconds long, I added a limit
>    on the number of DMA bytes written.
> =20
>=20
> Alexander Bulekov (10):
>   hw/sparse-mem: clear memory on reset
>   fuzz: add fuzz_reboot API
>   fuzz/generic-fuzz: use reboots instead of forks to reset state
>   fuzz/generic-fuzz: add a limit on DMA bytes written
>   fuzz/virtio-scsi: remove fork-based fuzzer
>   fuzz/virtio-net: remove fork-based fuzzer
>   fuzz/virtio-blk: remove fork-based fuzzer
>   fuzz/i440fx: remove fork-based fuzzer
>   fuzz: remove fork-fuzzing scaffolding
>   docs/fuzz: remove mentions of fork-based fuzzing
>=20
>  docs/devel/fuzzing.rst              |  22 +-----
>  hw/mem/sparse-mem.c                 |  13 +++-
>  meson.build                         |   4 -
>  tests/qtest/fuzz/fork_fuzz.c        |  41 ----------
>  tests/qtest/fuzz/fork_fuzz.h        |  23 ------
>  tests/qtest/fuzz/fork_fuzz.ld       |  56 --------------
>  tests/qtest/fuzz/fuzz.c             |   6 ++
>  tests/qtest/fuzz/fuzz.h             |   2 +-
>  tests/qtest/fuzz/generic_fuzz.c     | 111 +++++++---------------------
>  tests/qtest/fuzz/i440fx_fuzz.c      |  27 +------
>  tests/qtest/fuzz/meson.build        |   6 +-
>  tests/qtest/fuzz/virtio_blk_fuzz.c  |  51 ++-----------
>  tests/qtest/fuzz/virtio_net_fuzz.c  |  54 ++------------
>  tests/qtest/fuzz/virtio_scsi_fuzz.c |  51 ++-----------
>  14 files changed, 72 insertions(+), 395 deletions(-)
>  delete mode 100644 tests/qtest/fuzz/fork_fuzz.c
>  delete mode 100644 tests/qtest/fuzz/fork_fuzz.h
>  delete mode 100644 tests/qtest/fuzz/fork_fuzz.ld
>=20
> --=20
> 2.39.0
>=20

Whose tree should this go through? Laurent's qtest tree?

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--JVGNv35tzSsjydBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPrqtsACgkQnKSrs4Gr
c8jVSQgAsdfmN3M6y1i+aLIUWBOcxAvoO8DAA7G9xeiMPkw0KQqLWr3znF/TNpgJ
QRBpZVUTVOiIEiKGEN3qfNF8ETAOHMvZU44ygkujAnTDLpx5P9Omi/uhn0YbBnEY
dzdxeqtK7cgu0o5vYVkodVXnIKwLx1ee7jkxsC0WqZHSiz1VmjsBt/wsauT9l/Cw
wkcIVYXVdvU2OzFCt8VM0rMi6pTQLv8ypkJ6brnqEq3VkGlrgWl12cXSLCScEmn7
WS4g3js2q0211B0tUDbIqp0O6LL5JwMClDo1J70A46zQJ+xzs+UXAn6OGli/dBM1
hG5xKZIDolF1YbQB4rqBKWWG3Pm4Mw==
=7cXq
-----END PGP SIGNATURE-----

--JVGNv35tzSsjydBl--


