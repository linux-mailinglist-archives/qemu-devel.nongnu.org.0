Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B4EA0EC8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 03:07:09 +0200 (CEST)
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i38u4-0004CT-2g
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 21:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1i38rD-0002hc-1j
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 21:04:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1i38rA-0004bp-V8
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 21:04:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58094)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1i38rA-0004Yu-QH
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 21:04:08 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 52F5D3064FD1;
 Thu, 29 Aug 2019 01:04:07 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-242.rdu2.redhat.com
 [10.10.123.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01E5060CC0;
 Thu, 29 Aug 2019 01:03:41 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Date: Wed, 28 Aug 2019 21:03:35 -0400
Message-Id: <20190829010340.28873-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 29 Aug 2019 01:04:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/5] Python (acceptance tests) queue, 2019-08-28
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 23919ddfd56135cad3cb468a8f54d5a595f024=
f4:

  Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20190827' i=
nto staging (2019-08-27 15:52:36 +0100)

are available in the Git repository at:

  git://github.com/clebergnu/qemu.git tags/python-next-pull-request

for you to fetch changes up to d19818e50e5286f878a76a286b76d29e57140dd4:

  VNC Acceptance test: simplify test names (2019-08-28 20:42:16 -0400)

----------------------------------------------------------------

Cleber Rosa (4):
  tests/requirements.txt: pin paramiko version requirement
  Acceptance tests: drop left over usage of ":avocado: enable"
  Boot Linux Console Test: add a test for ppc64 + pseries
  VNC Acceptance test: simplify test names

Satheesh Rajendran (1):
  tests.acceptance.avocado_qemu: Add support for powerpc

 .travis.yml                               |  2 +-
 tests/acceptance/avocado_qemu/__init__.py |  3 +++
 tests/acceptance/boot_linux_console.py    | 19 +++++++++++++++++++
 tests/acceptance/migration.py             |  3 ---
 tests/acceptance/vnc.py                   |  4 ++--
 tests/requirements.txt                    |  2 +-
 6 files changed, 26 insertions(+), 7 deletions(-)

--=20
2.21.0


