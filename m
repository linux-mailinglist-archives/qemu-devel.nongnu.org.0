Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC3E3979B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 23:19:20 +0200 (CEST)
Received: from localhost ([::1]:53316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZMGd-0008WE-3N
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 17:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hZMDN-0006pT-C9
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 17:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hZMDM-0002DM-BH
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 17:15:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38774)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hZMDM-00029S-54
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 17:15:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5D995AFF8;
 Fri,  7 Jun 2019 21:15:46 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C974600C1;
 Fri,  7 Jun 2019 21:15:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Date: Fri,  7 Jun 2019 18:15:36 -0300
Message-Id: <20190607211544.7964-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 07 Jun 2019 21:15:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/8] Python queue, 2019-06-07
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 185b7ccc11354cbd69b6d53bf8d831dd964f6c=
88:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20190607-2' int=
o staging (2019-06-07 15:24:13 +0100)

are available in the Git repository at:

  git://github.com/ehabkost/qemu.git tags/python-next-pull-request

for you to fetch changes up to 8297719709f1339506d6da93ec69e6118ace8676:

  travis: Make check-acceptance job more verbose (2019-06-07 18:11:02 -03=
00)

----------------------------------------------------------------
Python queue, 2019-06-07

* New boot_linux_console test cases (Philippe Mathieu-Daud=C3=A9)
* Deprecate Python 2 support (Eduardo Habkost)
* Require python3 >=3D 3.5 (Eduardo Habkost)
* Make check-acceptance Travis job more verbose (Eduardo Habkost)

----------------------------------------------------------------

Eduardo Habkost (3):
  Deprecate Python 2 support
  configure: Require python3 >=3D 3.5
  travis: Make check-acceptance job more verbose

Philippe Mathieu-Daud=C3=A9 (5):
  tests/boot_linux_console: Let extract_from_deb handle various
    compressions
  BootLinuxConsoleTest: Do not log empty lines
  BootLinuxConsoleTest: Test the SmartFusion2 board
  BootLinuxConsoleTest: Test nanoMIPS kernels on the I7200 CPU
  BootLinuxConsoleTest: Run kerneltests BusyBox on Malta

 configure                              |  13 ++-
 .travis.yml                            |   4 +-
 qemu-deprecated.texi                   |   8 ++
 tests/acceptance/boot_linux_console.py | 145 ++++++++++++++++++++++++-
 4 files changed, 162 insertions(+), 8 deletions(-)

--=20
2.18.0.rc1.1.g3f1ff2140


