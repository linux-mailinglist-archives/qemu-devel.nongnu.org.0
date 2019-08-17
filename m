Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8390F91
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 10:56:17 +0200 (CEST)
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyuVV-0002Gl-1V
	for lists+qemu-devel@lfdr.de; Sat, 17 Aug 2019 04:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49083)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hyuUA-0001Bk-G0
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 04:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hyuU9-0006rJ-70
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 04:54:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54444)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hyuU6-0006pL-GJ; Sat, 17 Aug 2019 04:54:50 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B1917308FC4D;
 Sat, 17 Aug 2019 08:54:48 +0000 (UTC)
Received: from thuth.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77A1C51C3A;
 Sat, 17 Aug 2019 08:54:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sat, 17 Aug 2019 10:54:40 +0200
Message-Id: <20190817085443.11471-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Sat, 17 Aug 2019 08:54:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/3] Run iotests during "make check"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter,

the following changes since commit afd760539308a5524accf964107cdb1d54a059=
e3:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-201=
90816' into staging (2019-08-16 17:21:40 +0100)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2019-08-17

for you to fetch changes up to 72e031f3b80a421b309ce0d1759b26e428f944db:

  gitlab-ci: Remove qcow2 tests that are handled by "make check" already =
(2019-08-17 09:06:17 +0200)

----------------------------------------------------------------
- Run the iotest during "make check"
----------------------------------------------------------------

Paolo Bonzini (1):
      block: fix NetBSD qemu-iotests failure

Thomas Huth (2):
      tests: Run the iotests during "make check" again
      gitlab-ci: Remove qcow2 tests that are handled by "make check" alre=
ady

 .gitlab-ci.yml              | 13 ++++---------
 block/file-posix.c          |  4 ++--
 tests/Makefile.include      | 10 ++++++----
 tests/check-block.sh        | 44 ++++++++++++++++++++++++++++++++++-----=
-----
 tests/qemu-iotests-quick.sh |  8 --------
 5 files changed, 46 insertions(+), 33 deletions(-)
 delete mode 100755 tests/qemu-iotests-quick.sh

