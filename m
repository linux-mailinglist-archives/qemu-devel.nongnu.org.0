Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CF0181C97
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:44:36 +0100 (CET)
Received: from localhost ([::1]:54482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3X9-0004yy-KC
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3V7-0002YJ-OB
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3V6-0001v8-F2
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42474
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3V6-0001rx-Bv
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0MkJ1Yj9OBvxItEmOxUuS12Tu0HZYGKbUVTbsEwA8gQ=;
 b=T411IovKqc0stavhLWWpedRbAc6/n+5g3sprKO5nRLK4IciPJYoblBxImarTI5vHzLVtn/
 aDfWuhbl0LgsMRAlKUEcMRkzB+aMkBYUoEgMJxYb8ALEIcI2jmCQade3x5WtSe566N/Pbj
 nkczQ8pKrHtQBYqsmeSfqrbRmug1jzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-MWFdNC12PSSG1aelH64kQQ-1; Wed, 11 Mar 2020 11:42:24 -0400
X-MC-Unique: MWFdNC12PSSG1aelH64kQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0DC08017CC;
 Wed, 11 Mar 2020 15:42:22 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04B8C91D74;
 Wed, 11 Mar 2020 15:42:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/13] Block layer patches
Date: Wed, 11 Mar 2020 16:42:05 +0100
Message-Id: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ba29883206d92a29ad5a466e679ccfc2ee6132ef=
:

  Merge remote-tracking branch 'remotes/borntraeger/tags/s390x-20200310' in=
to staging (2020-03-10 16:50:28 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 8bb3b023f2055054ee119cb45b42d2b14be7fc8a:

  qemu-iotests: adding LUKS cleanup for non-UTF8 secret error (2020-03-11 1=
5:54:38 +0100)

----------------------------------------------------------------
Block layer patches:

- Relax restrictions for blockdev-snapshot (allows libvirt to do live
  storage migration with blockdev-mirror)
- luks: Delete created files when block_crypto_co_create_opts_luks fails
- Fix memleaks in qmp_object_add

----------------------------------------------------------------
Daniel Henrique Barboza (4):
      block: introducing 'bdrv_co_delete_file' interface
      block.c: adding bdrv_co_delete_file
      crypto.c: cleanup created file when block_crypto_co_create_opts_luks =
fails
      qemu-iotests: adding LUKS cleanup for non-UTF8 secret error

Kevin Wolf (6):
      block: Make bdrv_get_cumulative_perm() public
      block: Relax restrictions for blockdev-snapshot
      iotests: Fix run_job() with use_log=3DFalse
      iotests: Test mirror with temporarily disabled target backing file
      block: Fix cross-AioContext blockdev-snapshot
      iotests: Add iothread cases to 155

Pan Nengyuan (1):
      qom-qmp-cmds: fix two memleaks in qmp_object_add

Peter Krempa (1):
      qapi: Add '@allow-write-only-overlay' feature for 'blockdev-snapshot'

Philippe Mathieu-Daud=C3=A9 (1):
      tests/qemu-iotests: Fix socket_scm_helper build path

 qapi/block-core.json          |  9 ++++-
 include/block/block.h         |  1 +
 include/block/block_int.h     |  7 ++++
 block.c                       | 33 ++++++++++++++--
 block/crypto.c                | 18 +++++++++
 block/file-posix.c            | 23 +++++++++++
 blockdev.c                    | 30 ++++-----------
 qom/qom-qmp-cmds.c            | 16 +++-----
 tests/qemu-iotests/iotests.py |  5 ++-
 tests/Makefile.include        |  1 +
 tests/qemu-iotests/085.out    |  4 +-
 tests/qemu-iotests/155        | 88 ++++++++++++++++++++++++++++++++++++---=
----
 tests/qemu-iotests/155.out    |  4 +-
 tests/qemu-iotests/282        | 67 ++++++++++++++++++++++++++++++++
 tests/qemu-iotests/282.out    | 11 ++++++
 tests/qemu-iotests/group      |  1 +
 tests/qtest/Makefile.include  |  1 -
 17 files changed, 262 insertions(+), 57 deletions(-)
 create mode 100755 tests/qemu-iotests/282
 create mode 100644 tests/qemu-iotests/282.out


