Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D9D5DED
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 10:53:54 +0200 (CEST)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJw6z-0007pr-MD
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 04:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iJw5Z-0006Kd-2j
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 04:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iJw5X-0004yG-Tc
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 04:52:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55730)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iJw5U-0004tv-DB; Mon, 14 Oct 2019 04:52:20 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DDB5030860A5;
 Mon, 14 Oct 2019 08:52:18 +0000 (UTC)
Received: from localhost (unknown [10.36.118.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9EFD3DAD;
 Mon, 14 Oct 2019 08:52:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Block patches
Date: Mon, 14 Oct 2019 09:52:10 +0100
Message-Id: <20191014085211.25800-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 14 Oct 2019 08:52:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 98b2e3c9ab3abfe476a2b02f8f51813edb90e7=
2d:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request'=
 into staging (2019-10-08 16:08:35 +0100)

are available in the Git repository at:

  https://github.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 69de48445a0d6169f1e2a6c5bfab994e1c810e33:

  test-bdrv-drain: fix iothread_join() hang (2019-10-14 09:48:01 +0100)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Stefan Hajnoczi (1):
  test-bdrv-drain: fix iothread_join() hang

 tests/iothread.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

--=20
2.21.0


