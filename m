Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A8B6452
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 15:24:57 +0200 (CEST)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAZx2-0002bY-7A
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 09:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60336)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iAZta-000877-FV
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 09:21:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iAZtZ-0002Qv-AI
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 09:21:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53198)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iAZtV-0002P7-VU; Wed, 18 Sep 2019 09:21:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B728B3061213;
 Wed, 18 Sep 2019 13:21:16 +0000 (UTC)
Received: from localhost (unknown [10.36.118.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1E085D9DC;
 Wed, 18 Sep 2019 13:21:13 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 18 Sep 2019 14:21:09 +0100
Message-Id: <20190918132112.10418-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 18 Sep 2019 13:21:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/3] Tracing patches
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f8c3db33a5e863291182f8862ddf81618a7c61=
94:

  target/sparc: Switch to do_transaction_failed() hook (2019-09-17 12:01:=
00 +0100)

are available in the Git repository at:

  https://github.com/stefanha/qemu.git tags/tracing-pull-request

for you to fetch changes up to 9f7ad79c16ede0da01902b18fb32929cfbd20f87:

  trace: Forbid event format ending with newline character (2019-09-18 10=
:20:15 +0100)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Alexey Kardashevskiy (1):
  loader: Trace loaded images

Philippe Mathieu-Daud=C3=A9 (2):
  trace: Remove trailing newline in events
  trace: Forbid event format ending with newline character

 docs/devel/tracing.txt        |  2 ++
 Makefile.objs                 |  1 +
 hw/core/loader.c              |  3 +++
 hw/core/trace-events          |  2 ++
 hw/misc/trace-events          | 10 +++++-----
 hw/scsi/trace-events          |  2 +-
 hw/sd/trace-events            |  2 +-
 nbd/trace-events              |  4 ++--
 net/trace-events              |  6 +++---
 scripts/tracetool/__init__.py |  3 +++
 10 files changed, 23 insertions(+), 12 deletions(-)
 create mode 100644 hw/core/trace-events

--=20
2.21.0


