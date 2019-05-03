Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA2A125AC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 02:43:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMMIm-0004ZU-Fa
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 20:43:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hMMGg-0003QD-1C
	for qemu-devel@nongnu.org; Thu, 02 May 2019 20:41:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hMMGe-0006fH-Vi
	for qemu-devel@nongnu.org; Thu, 02 May 2019 20:41:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57360)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hMMGc-0006e6-Uu
	for qemu-devel@nongnu.org; Thu, 02 May 2019 20:41:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D54783F4C;
	Fri,  3 May 2019 00:41:32 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20A1F5D9C4;
	Fri,  3 May 2019 00:41:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Cleber Rosa <crosa@redhat.com>
Date: Thu,  2 May 2019 21:41:11 -0300
Message-Id: <20190503004130.8285-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 03 May 2019 00:41:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 00/19] Python queue, 2019-05-02
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8482ff2eb3bb95020eb2f370a9b3ea26511e41=
df:

  Merge remote-tracking branch 'remotes/jnsnow/tags/bitmaps-pull-request'=
 into staging (2019-05-02 12:04:51 +0100)

are available in the Git repository at:

  git://github.com/ehabkost/qemu.git tags/python-next-pull-request

for you to fetch changes up to faf441429adfe5767be52c5dcdb8bc03161d064f:

  configure: automatically pick python3 is available (2019-05-02 21:33:27=
 -0300)

----------------------------------------------------------------
Python queue, 2019-05-02

* configure: automatically pick python3 is available
  (Daniel P. Berrang=C3=A9)

* tests/acceptance (Cleber Rosa, Philippe Mathieu-Daud=C3=A9):
  * Multi-architecture test support
  * Multiple arch-specific boot_linux_console test cases
  * Increase verbosity of avocado by default
  * docstring improvements

----------------------------------------------------------------

Cleber Rosa (17):
  tests/acceptance: show avocado test execution by default
  tests/acceptance: improve docstring on pick_default_qemu_bin()
  tests/acceptance: fix doc reference to avocado_qemu directory
  tests/acceptance: introduce arch parameter and attribute
  tests/acceptance: use "arch:" tag to filter target specific tests
  tests/acceptance: look for target architecture in test tags first
  tests/boot_linux_console: rename the x86_64 after the arch and machine
  tests/boot_linux_console: update the x86_64 kernel
  tests/boot_linux_console: add common kernel command line options
  tests/boot_linux_console: increase timeout
  tests/boot_linux_console: refactor the console watcher into utility
    method
  scripts/qemu.py: support adding a console with the default serial
    device
  tests/boot_linux_console: add a test for mips64el + malta
  tests/boot_linux_console: add a test for aarch64 + virt
  tests/boot_linux_console: add a test for arm + virt
  tests/boot_linux_console: add a test for s390x + s390-ccw-virtio
  tests/boot_linux_console: add a test for alpha + clipper

Daniel P. Berrang=C3=A9 (1):
  configure: automatically pick python3 is available

Philippe Mathieu-Daud=C3=A9 (1):
  tests/boot_linux_console: add a test for mips + malta

 docs/devel/testing.rst                    |  35 +++-
 configure                                 |  18 +-
 .travis.yml                               |   4 +-
 python/qemu/__init__.py                   |  50 ++---
 tests/Makefile.include                    |   5 +-
 tests/acceptance/avocado_qemu/__init__.py |  23 ++-
 tests/acceptance/boot_linux_console.py    | 211 ++++++++++++++++++++--
 tests/acceptance/linux_initrd.py          |   2 +-
 tests/acceptance/virtio_version.py        |   2 +-
 9 files changed, 285 insertions(+), 65 deletions(-)

--=20
2.18.0.rc1.1.g3f1ff2140


