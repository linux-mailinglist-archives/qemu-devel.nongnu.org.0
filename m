Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E33B7A917
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 15:00:22 +0200 (CEST)
Received: from localhost ([::1]:60838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsRjp-0003xH-HK
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 09:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40779)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hsRim-0002uD-O5
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:59:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hsRil-0000pl-JM
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:59:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hsRij-0000nv-AY; Tue, 30 Jul 2019 08:59:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8C25930C1336;
 Tue, 30 Jul 2019 12:59:12 +0000 (UTC)
Received: from localhost (ovpn-116-164.ams2.redhat.com [10.36.116.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2481619C65;
 Tue, 30 Jul 2019 12:59:11 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 14:59:09 +0200
Message-Id: <20190730125910.32060-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 30 Jul 2019 12:59:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/1] Block patches for 4.1.0-rc3
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6e9a6cbe7d56107f5e0d7711905dc19bb4d7e3=
f0:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into sta=
ging (2019-07-30 12:25:35 +0100)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2019-07-30

for you to fetch changes up to 1120407bdf70a2c4681464ae08bdb7c615566200:

  nvme: Limit blkshift to 12 (for 4 kB blocks) (2019-07-30 14:49:24 +0200=
)

----------------------------------------------------------------
Block patch for 4.1.0-rc3:
- Fix CID 1403771 in block/nvme.c

----------------------------------------------------------------
Max Reitz (1):
  nvme: Limit blkshift to 12 (for 4 kB blocks)

 block/nvme.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

--=20
2.21.0


