Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0720A4E06C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 08:14:36 +0200 (CEST)
Received: from localhost ([::1]:54966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heCok-0008Lf-SO
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 02:14:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47109)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <crosa@redhat.com>) id 1heCku-0005C7-Ez
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 02:10:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1heCkZ-00048I-8Q
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 02:10:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55104)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1heCkY-0003G6-Uc
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 02:10:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BEE1DC05A1D8;
 Fri, 21 Jun 2019 06:09:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-204.rdu2.redhat.com
 [10.10.120.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C2DB5D739;
 Fri, 21 Jun 2019 06:09:27 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 02:09:23 -0400
Message-Id: <20190621060925.16214-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 21 Jun 2019 06:09:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] Acceptance tests: exclude "flaky" tests
 and introduce SPICE test
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two seemingly unrelated topics have been added together
in the same patch series because both deal with Avocado tags,
and how their use is expand here to exclude tests.

For tests which sometimes can fail or hang, this adds the "flaky"
tag, and doesn't run them as part of "make check-acceptance".

For the SPICE test, it depends on QEMU being configured with it,
and if not, it will exclude it from the set of tests.

Cleber Rosa (2):
  Acceptance tests: exclude "flaky" tests
  Acceptance tests: add SPICE protocol check

 .travis.yml                              |  5 ++-
 docs/devel/testing.rst                   | 17 ++++++++
 tests/Makefile.include                   | 12 +++++-
 tests/acceptance/boot_linux_console.py   |  2 +
 tests/acceptance/linux_ssh_mips_malta.py |  2 +
 tests/acceptance/spice.py                | 54 ++++++++++++++++++++++++
 tests/requirements.txt                   |  2 +-
 7 files changed, 91 insertions(+), 3 deletions(-)
 create mode 100644 tests/acceptance/spice.py

--=20
2.21.0


