Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535886E8E84
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:48:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQtp-0006gX-In; Thu, 20 Apr 2023 05:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtS-0006V8-FD
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:47:59 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtP-0007wx-P6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984070; i=lukasstraub2@web.de;
 bh=7rkTCnon4TAm4aVFnIcw+W3S3dJz0aoWTJd8jl0J/3A=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=niQVFNy17gZpLAYhZoGf2fIpdfoqBFRNw2RBU/entAy6Pum24ZlrTtjfUwSSLTwmN
 xhc2ZSdu1HRwt5MglYW3KiZdmxwd+xX8nL0nRCz/Iq+DFOVc8aaYh570YBH8SEVyXZ
 QdHtKGnL7jnHIyPL1V5QkDbo7DBJ58CMUdO0y39h77yMDLjimdNru5VL5WPZHiRwG2
 NQTwJlrNr7QR45jvlteuaA/QRP6BYtoq1K5uh7uo5G9eJPGvBRBVwSltIUMjMR5PcY
 a2Tz1rmwDIonfYPNtXOHQL2QXmu+c417g2h+hZYYu8yITAbNwToS9YKXQvoNYGpNsD
 4ykz2Za/ECfMA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mt8kX-1q99hf2vrV-00tREz; Thu, 20
 Apr 2023 11:47:50 +0200
Date: Thu, 20 Apr 2023 11:47:32 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 00/13] migration/ram.c: Refactor compress code
Message-ID: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6h_XV67qBvqjbx88AjWz23/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:FKFNdyJViPByMgRYPirvTFbj7VVN8AOzju3ufTDuxAU0SwDUQ4x
 fk2lcJogmR/pAvjSY8Kfr/zCol4s4wIerLtCTJKLVsF6PsbiHyHOHzY6V1VsasRq0qqqs5b
 SgRpBP9Fm20YDYY7URPjOQAX05owDDWpjbxAQTyVs9Lyo/kpaziMJYkWnTbAyhcawqIzJEr
 VfwdnSPYQcq999VekzHOQ==
UI-OutboundReport: notjunk:1;M01:P0:BpH+MkTP9MM=;PLNWygu1GKpXOH/r/KGq2uKwGK4
 3QLqr5D8PLavEq5DJt80QNotPgD926iFsMvFdCJQi6MS3swpiluENI5N9+CW5gZ6cVxYoP5Vf
 djFaFIhTnixmc47MswmjIcO9EujLl1nQHKxPlP2qEOsY9f6fhyYp4tNEtHevRa7nlJWJ3zW7N
 AmAY5Nputdy9ihtPY3iiQTQgciza302WUrPGR54i+wVOyoFVrKn9nuz4IB9wOobtxysvMxMzZ
 w9eK9CUzU6HRKKPFQmANvu8VJEVE7LLLlRN6XQGG1uK11EN+YjzCDPnDfq0vrrdxTq9EnF3gV
 Cx3VGJkDnQFosiwEba505bszdwSDtJsm9rABGxQ1Ry4n3v72xiIYzvoflfV6GsSVW2kPswwKY
 Bpkprl/kIbd/8Mdudx7XksMDEVypE7FIHw9R8nIZzhKh5Q+pVDqeaZueErnUBPMheksbIyTV8
 5Pnt6DSKQuG3bvvNt2mlFXzMQN4AQ0hkZ7Pxcer5ODkqUYrIRxeD1mJRj8EfRoXQ+q0qUXwio
 Pi6ndCF/A+1EIRP87/1Ka6VJLBnCzdgyF3FwfEL6am53FAVFCfKsxEg51HgZs3DPl8yTY68IL
 hGQHtHLIVs3530M24YdTeW1d13UpTbSyG/b/+6kfAcmWjlcbwOOVK8MsnuFWBItTtJeJyARGI
 E87lA0H0QrCdO2K8mO2XFnxHqkkWRQhKYAxycLVqnNIadVJ5qUpQho6byAMCjzng83z501Z3+
 Pjs9nz/97xRk9MRiQona2P78TtzfI7IutyXqWt2RuPRizSn05gsdY64+KVi8ic1OQWdqX/prT
 MuH/3o/J4ikTyIfT2hQw61iTgAaU/P9G7nTwD4iuZa6OzrWxNRdwNZcfOKTbwP8mTFJ7g+eZI
 6obRUxK27GOPGOKSSTmaL9cwX58f/sjaSztRoY0DZHUGhNEDDCufM1sz0sdKcndBJRZ0dZRfT
 msBCW8L/Yf3mkFBdy1emLqtnjxI=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/6h_XV67qBvqjbx88AjWz23/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This series refactors the ram compress code.

It first removes ram.c dependencies from the core compress code, then
moves it out to its own file. Finally, on the migration destination side
the initialisation and cleanup of compress threads is moved out of ram.c
to migration.c. This allows using COLO with compress enabled.

Changes since v1:
- Add postcopy tests with compress enabled
- Use page_size variable in "ram-compress.c: Make target independent"
- Squash "ram.c: Remove unused include after moving out code"
  with "ram.c: Move core compression code into its own file"
- Add Reviewed-by: Tags

Lukas Straub (13):
  qtest/migration-test.c: Add postcopy tests with compress enabled
  ram.c: Let the compress threads return a CompressResult enum
  ram.c: Dont change param->block in the compress thread
  ram.c: Reset result after sending queued data
  ram.c: Do not call save_page_header() from compress threads
  ram.c: Call update_compress_thread_counts from
    compress_send_queued_data
  ram.c: Remove last ram.c dependency from the core compress code
  ram.c: Introduce whitespace (squash with next patch)
  ram.c: Move core compression code into its own file
  ram.c: Remove whitespace (squash with previous patch)
  ram.c: Move core decompression code into its own file
  ram compress: Assert that the file buffer matches the result
  ram-compress.c: Make target independent

 migration/meson.build        |   5 +-
 migration/qemu-file.c        |  11 +
 migration/qemu-file.h        |   1 +
 migration/ram-compress.c     | 484 ++++++++++++++++++++++++++++++++++
 migration/ram-compress.h     |  70 +++++
 migration/ram.c              | 485 +++--------------------------------
 tests/qtest/migration-test.c |  83 +++---
 7 files changed, 660 insertions(+), 479 deletions(-)
 create mode 100644 migration/ram-compress.c
 create mode 100644 migration/ram-compress.h

--
2.40.0

--Sig_/6h_XV67qBvqjbx88AjWz23/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCjQACgkQNasLKJxd
slim1A//cnlqY5iJ063s2RUQPIKuAuGZ8dUTZesapsIvPQ/BiTh6bNiXWxTr8Tu1
7+tycJ/+UDbG4vKq9+e87LH8n+Zlq2nU6nBbbMCvcNWqUVunMiDCpMEfsv8NcGhi
JX06pjkusm5B7Rsfmte4oVenkoOWa3iHW0pVdF6dZ2xBY+vkovQxmnd3JyN3hy4q
fmJOcTTmZ1dIny9pqGI7pdKJYQz51trsi7D2iwc7hTLfqp3+YFBe8bUL2luIPH75
Jx3R0i1bssjMQnEXVW45oJbBe8y2qzfMUJ/Emdo+0Bwuu+2gL0tZL0r/5kxC6XfF
T671TTuvS2GMYmpXdO8B4kHtCxRd3SBC93ocXBWzK6Kufgsl+iUm+VTFUwmU2RSH
2jIAvA9EEc7C2wX5mDrrxHo8LiOLELYvSAWh7upTvlbYUDba+gvmNOAUREM5w4cb
tzm0W1nnVlAAk9r7AwlepifZHPZcWtgq3bxP0uuipKN2rffg0GYCz4nv+n8UAYOw
tN4WlZiF2q45vHH8bNQ657JOkBMyVfw5xnxualrNSdeV19MdRGGiAjEcIq9XEEZT
cTY8GDZovgT3NjfLMBlsxGrSwyGQ+0Rxc9GgPGOuH0vy06QyQMGdXTAws/qjhu8h
Cg9+7npgzg32fMYmfzdk8gSheokg7WfK3oeXRL4eHZF6C79uOZ4=
=swYm
-----END PGP SIGNATURE-----

--Sig_/6h_XV67qBvqjbx88AjWz23/--

