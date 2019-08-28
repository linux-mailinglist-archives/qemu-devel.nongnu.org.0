Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C8DA0B8C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 22:31:35 +0200 (CEST)
Received: from localhost ([::1]:42420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i34bN-0006u4-Nx
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 16:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i33Xk-0004YM-Bz
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i33Xj-0002It-8r
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:23:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46630)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1i33Xj-0002IO-3f
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:23:43 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 37BAC308FB9A;
 Wed, 28 Aug 2019 19:23:42 +0000 (UTC)
Received: from localhost (ovpn-116-60.gru2.redhat.com [10.97.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEBC55C21E;
 Wed, 28 Aug 2019 19:23:41 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Date: Wed, 28 Aug 2019 16:23:38 -0300
Message-Id: <20190828192340.14025-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 28 Aug 2019 19:23:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/2] Python queue, 2019-08-28
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

The following changes since commit 23919ddfd56135cad3cb468a8f54d5a595f024=
f4:

  Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20190827' i=
nto staging (2019-08-27 15:52:36 +0100)

are available in the Git repository at:

  git://github.com/ehabkost/qemu.git tags/python-next-pull-request

for you to fetch changes up to 406ab2f331555cfcf320fe2a77949d7f8af7ab32:

  configure: more resilient Python version capture (2019-08-27 16:57:24 -=
0300)

----------------------------------------------------------------
Python queue, 2019-08-28

Bug fix:
* configure: more resilient Python version capture (Cleber Rosa)

Cleanup:
* BootLinuxSshTest: Only use 'test' for unittest.TestCase method
  names (Philippe Mathieu-Daud=C3=A9)

----------------------------------------------------------------

Cleber Rosa (1):
  configure: more resilient Python version capture

Philippe Mathieu-Daud=C3=A9 (1):
  BootLinuxSshTest: Only use 'test' for unittest.TestCase method names

 configure                                |  5 +++--
 tests/Makefile.include                   |  2 +-
 tests/acceptance/linux_ssh_mips_malta.py | 10 +++++-----
 3 files changed, 9 insertions(+), 8 deletions(-)

--=20
2.21.0


