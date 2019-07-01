Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C7235C1C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 13:56:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYUWZ-0004qw-EJ
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 07:56:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hYUU7-0003l4-JS
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 07:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hYUU6-0002Vj-Cz
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 07:53:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35744)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hYUU6-0002Ux-7l
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 07:53:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D67D8CAA6D;
	Wed,  5 Jun 2019 11:53:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-241.ams2.redhat.com
	[10.36.116.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9567C5D6A9;
	Wed,  5 Jun 2019 11:53:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 13:53:13 +0200
Message-Id: <20190605115318.9972-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 05 Jun 2019 11:53:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/5] Migration patches
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 47fbad45d47af8af784bb12a5719489edcd89b=
4c:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into sta=
ging (2019-06-04 17:22:42 +0100)

are available in the Git repository at:

  https://github.com/juanquintela/qemu.git tags/migration-pull-request

for you to fetch changes up to 03158519384f15890d587937bd1b3ea699898e55:

  migratioin/ram: leave RAMBlock->bmap blank on allocating (2019-06-05 12=
:44:03 +0200)

----------------------------------------------------------------
Migration Pull request

- Fd fixes and test (yuri)
- several fixes (wei)

----------------------------------------------------------------

Wei Yang (3):
  migration/ram.c: MultiFDSendParams.sem_sync is not really used
  migration/ram.c: multifd_send_state->count is not really used
  migratioin/ram: leave RAMBlock->bmap blank on allocating

Yury Kotov (2):
  migration: Fix fd protocol for incoming defer
  migration-test: Add a test for fd protocol

 migration/fd.c         |   8 ++--
 migration/fd.h         |   2 +-
 migration/ram.c        |  27 ++++++-----
 tests/libqtest.c       |  80 ++++++++++++++++++++++++++++++--
 tests/libqtest.h       |  51 ++++++++++++++++++++-
 tests/migration-test.c | 101 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 246 insertions(+), 23 deletions(-)

--=20
2.21.0


