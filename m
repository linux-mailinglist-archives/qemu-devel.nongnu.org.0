Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065F7E7D61
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 01:00:56 +0100 (CET)
Received: from localhost ([::1]:45724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPEwQ-0006B3-IB
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 20:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iPEn8-00030D-0W
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:51:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iPEmD-0003ps-8W
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:50:22 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22134
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iPEmD-0003pa-55
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572306620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=evki2+LIwMIfbh6FJal6w1iIajDVQHzxsGx7W7eMlTQ=;
 b=Y7weCE22/HBtvgi7KiTSO50xaG59c82yjT5bCxIMpUnG4nfq8Aq4DyoXRhYR7GijAdSPiy
 QY8QnPWdHnhoKWxTXFJqlc4znA003SuFPNiO0e0gn3ZprUBo+7ARPDoeIgqEUQA3DxDF2r
 zcK5OcePMxPGoFWAr7CRowY0O7k/uns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-CBlD05JBN2iA2jzm89TBig-1; Mon, 28 Oct 2019 19:50:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC7238017DD;
 Mon, 28 Oct 2019 23:50:14 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE1F5C1B2;
 Mon, 28 Oct 2019 23:50:04 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 0/16] Python (acceptance tests) queue, 2019-10-28
Date: Mon, 28 Oct 2019 19:49:46 -0400
Message-Id: <20191028235002.17691-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: CBlD05JBN2iA2jzm89TBig-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit aaffb853359829a37daaf883c773e8320b55c723=
:

  Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2019-10-28=
' into staging (2019-10-28 14:40:01 +0000)

are available in the Git repository at:

  git://github.com/clebergnu/qemu.git tags/python-next-pull-request

for you to fetch changes up to efdb45bfd72745038909dfd1e970a827cb8d5d7e:

  tests/boot_linux_console: Run BusyBox on 5KEc 64-bit cpu (2019-10-28 19:0=
4:04 -0400)

----------------------------------------------------------------

Cleber Rosa (4):
  MAINTAINERS: update location of Python libraries
  Acceptance tests: work around socket dir
  Python libs: close console sockets before shutting down the VMs
  Acceptance tests: refactor wait_for_console_pattern

Philippe Mathieu-Daud=C3=A9 (12):
  tests/acceptance: Fix wait_for_console_pattern() hangs
  tests/acceptance: Send <carriage return> on serial lines
  tests/acceptance: Refactor exec_command_and_wait_for_pattern()
  tests/acceptance: Add test that boots the HelenOS microkernel on Leon3
  .travis.yml: Let the avocado job run the Leon3 test
  tests/acceptance: Add test that runs NetBSD 4.0 installer on PRep/40p
  tests/acceptance: Test OpenBIOS on the PReP/40p
  .travis.yml: Let the avocado job run the 40p tests
  tests/boot_linux_console: Use Avocado archive::gzip_uncompress()
  tests/boot_linux_console: Add a test for the Raspberry Pi 2
  tests/boot_linux_console: Add initrd test for the Exynos4210
  tests/boot_linux_console: Run BusyBox on 5KEc 64-bit cpu

 .travis.yml                               |   2 +-
 MAINTAINERS                               |   4 +-
 python/qemu/machine.py                    |  11 +-
 tests/acceptance/avocado_qemu/__init__.py |  48 ++++++-
 tests/acceptance/boot_linux_console.py    | 167 +++++++++++++++++-----
 tests/acceptance/linux_ssh_mips_malta.py  |  18 +--
 tests/acceptance/machine_sparc_leon3.py   |  34 +++++
 tests/acceptance/ppc_prep_40p.py          |  82 +++++++++++
 8 files changed, 308 insertions(+), 58 deletions(-)
 create mode 100644 tests/acceptance/machine_sparc_leon3.py
 create mode 100644 tests/acceptance/ppc_prep_40p.py

--=20
2.21.0


