Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD7B5BA7E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 13:21:58 +0200 (CEST)
Received: from localhost ([::1]:57256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhuNi-0008SS-5F
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 07:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hhuKA-0006Yj-9I
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:18:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hhuK8-0000vd-5A
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:18:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42522)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hhuK3-0000Dt-Le; Mon, 01 Jul 2019 07:18:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8C82E58E42;
 Mon,  1 Jul 2019 11:17:28 +0000 (UTC)
Received: from localhost (ovpn-117-220.ams2.redhat.com [10.36.117.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AFC066617;
 Mon,  1 Jul 2019 11:17:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  1 Jul 2019 13:17:16 +0200
Message-Id: <20190701111722.32068-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 01 Jul 2019 11:17:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/6] final s390x patches for 4.1 softfreeze
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeac=
de:

  Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-=
2019' into staging (2019-06-21 15:40:50 +0100)

are available in the Git repository at:

  https://github.com/cohuck/qemu tags/s390x-20190701

for you to fetch changes up to 8b3410deb2a496866468ab949c666a21c6a7239e:

  s390x: add cpu feature/model files to KVM section (2019-07-01 12:44:35 =
+0200)

----------------------------------------------------------------
- cleanup/refactoring in the cpu feature code
- fix for a tcg test case
- halt/clear support for vfio-ccw, and use a new helper

----------------------------------------------------------------
Cornelia Huck (4):
      vfio-ccw: use vfio_set_irq_signaling
      vfio-ccw: support async command subregion
      Merge tag 's390x-tcg-2019-06-21' into s390-next-staging
      s390x: add cpu feature/model files to KVM section

David Hildenbrand (2):
      s390x/cpumodel: Rework CPU feature definition
      s390x/cpumodel: Prepend KDSA features with "KDSA"

Richard Henderson (1):
      tests/tcg/s390x: Fix alignment of csst parameter list

 MAINTAINERS                         |   2 +
 hw/s390x/css.c                      |  27 ++-
 hw/s390x/s390-ccw.c                 |  20 ++
 hw/vfio/ccw.c                       | 162 ++++++++++++----
 include/hw/s390x/css.h              |   3 +
 include/hw/s390x/s390-ccw.h         |   2 +
 target/s390x/cpu_features.c         | 352 ++----------------------------=
----
 target/s390x/cpu_features_def.h     | 352 +-----------------------------=
----
 target/s390x/cpu_features_def.inc.h | 369 ++++++++++++++++++++++++++++++=
++++++
 target/s390x/gen-features.c         |  30 +--
 tests/tcg/s390x/csst.c              |   2 +-
 11 files changed, 575 insertions(+), 746 deletions(-)
 create mode 100644 target/s390x/cpu_features_def.inc.h

--=20
2.20.1


