Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292742D2A4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 02:00:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVm1K-0007H2-Gp
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 20:00:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hVlzW-0006Gg-A7
	for qemu-devel@nongnu.org; Tue, 28 May 2019 19:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hVlzV-0001Dr-E6
	for qemu-devel@nongnu.org; Tue, 28 May 2019 19:58:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59972)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1hVlzT-0001CR-5e; Tue, 28 May 2019 19:58:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E112E30C1AE8;
	Tue, 28 May 2019 23:58:45 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3BC75F9D5;
	Tue, 28 May 2019 23:58:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 28 May 2019 19:58:39 -0400
Message-Id: <20190528235842.29453-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 28 May 2019 23:58:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/3] Bitmaps patches
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
Cc: peter.maydell@linaro.org, jsnow@redhat.com, qemu-stable@nongnu.org,
	qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8c1ecb590497b0349c550607db923972b37f69=
63:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-next-28=
0519-2' into staging (2019-05-28 17:38:32 +0100)

are available in the Git repository at:

  https://github.com/jnsnow/qemu.git tags/bitmaps-pull-request

for you to fetch changes up to 403bb8185ec18267fe47a0e304d26a17263572dc:

  iotests: test external snapshot with bitmap copying (2019-05-28 19:33:3=
1 -0400)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

John Snow (1):
  migration/dirty-bitmaps: change bitmap enumeration method

Vladimir Sementsov-Ogievskiy (2):
  qapi: support external bitmaps in block-dirty-bitmap-merge
  iotests: test external snapshot with bitmap copying

 qapi/block-core.json           | 22 ++++++++++++--
 block/dirty-bitmap.c           |  9 ++++--
 blockdev.c                     | 50 +++++++++++++++++++++-----------
 migration/block-dirty-bitmap.c | 14 +++------
 tests/qemu-iotests/254         | 52 ++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/254.out     | 52 ++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/group       |  1 +
 7 files changed, 167 insertions(+), 33 deletions(-)
 create mode 100755 tests/qemu-iotests/254
 create mode 100644 tests/qemu-iotests/254.out

--=20
2.20.1


