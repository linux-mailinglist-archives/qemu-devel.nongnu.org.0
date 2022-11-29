Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DE663CADB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 23:00:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p08cd-0002ZN-9P; Tue, 29 Nov 2022 16:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p08ca-0002Z6-Vd
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 16:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p08cZ-00072m-2m
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 16:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669759108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=JIKqhwgRPh63CG4/zIMELGM3C7+D1rrj0aqsWVNHGPQ=;
 b=QkdB5dlcqePxQtKcR9kNc2O7A5IqsyliXKqSTm6aDN0AwPlQX0KIp73CH/p+HgpWWz4kl9
 4aC2Jai7qp+rWgjw9p2EDykh8MShdwPGlotTzpcEvFEfRvlyIny3twkjp0rBcjAOgRn6AI
 v2klKapQP9lptAgmsP/jL1C+w5brkgw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-qNcnJn-MOgKLYzNvq8NrPA-1; Tue, 29 Nov 2022 16:58:26 -0500
X-MC-Unique: qNcnJn-MOgKLYzNvq8NrPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3E2E800B23
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 21:58:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 567F640C83AA;
 Tue, 29 Nov 2022 21:58:25 +0000 (UTC)
Date: Tue, 29 Nov 2022 16:58:21 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: quintela@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: QEMU 7.2 non-deterministic migration-test CI failure
Message-ID: <Y4aAfdzTqY3mHUUH@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nmZFKH17S/4LhFR6"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--nmZFKH17S/4LhFR6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,
The following cross-i386-tci migration-test failure was triggered by CI:

>>> MALLOC_PERTURB_=3D133 G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/te=
sts/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=3D./qemu-system-i386 /builds/q=
emu-project/qemu/build/tests/qtest/migration-test --tap -k
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
qemu-system-i386: Unknown savevm section type 126
=2E./tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from signa=
l 11 (Segmentation fault) (core dumped)
TAP parsing error: Too few tests run (expected 14, got 2)
(test program exited with status code -6)
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95

https://gitlab.com/qemu-project/qemu/-/jobs/3397205431

When I retried the test succeeded. I haven't managed to reproduce it
locally yet either.

Any ideas?

Stefan

--nmZFKH17S/4LhFR6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOGgH0ACgkQnKSrs4Gr
c8jXyQgAm8gO8HBpU9/IZyaNiLp+cBr4Ozjy/NhW05ZeiYOUkbV6RD8JD5ioT6nz
b/E5nf0hjoWopiSff/YeWdE3ua2fBy5sei/tZt2G87AJGlAQ+yOe5R4Xy8X8zQ7S
opwlx8EwRJ+wbIp7wD3OJmn0k++r49eLhxhGmTZNZCfFSnv89dM/CiM7TOOxqZKN
8gBpgNCeCoWry565uR3ybADMQcCpP4DvXAQBTztRM5aDDEVWYPdKgrzBs7V0jujn
71cACz23vZIZ+Ju/3Og7BrZ2sVdgHdi+h0vYn6dwOhJhDzLqvU0d5izKY1S5L0SN
rXyaBbpOySCRuSnxBFmOnVdu1pHcGQ==
=c4Nj
-----END PGP SIGNATURE-----

--nmZFKH17S/4LhFR6--


