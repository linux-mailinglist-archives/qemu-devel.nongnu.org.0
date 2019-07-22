Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDA97066E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 19:08:41 +0200 (CEST)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpbnj-0002Us-PA
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 13:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46420)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hpbnP-0001va-6k
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 13:08:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hpbnO-00015s-70
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 13:08:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52062)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hpbnM-00013z-2H; Mon, 22 Jul 2019 13:08:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 52A333092640;
 Mon, 22 Jul 2019 17:08:15 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-56.brq.redhat.com [10.40.204.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4F2360BE2;
 Mon, 22 Jul 2019 17:08:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 19:08:07 +0200
Message-Id: <20190722170809.10993-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 22 Jul 2019 17:08:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/2] pflash-next patches for v4.1.0-rc2
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9d2e1fcd14c2bae5be1992214a03c0ddff714c=
80:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into s=
taging (2019-07-22 13:20:49 +0100)

are available in the Git repository at:

  https://gitlab.com/philmd/qemu.git tags/pflash-next-20190722

for you to fetch changes up to 5ef209c777a1a1eacea30e267640b029b6bd0bc0:

  hw/block/pflash_cfi02: Rewrite a fall through comment (2019-07-22 19:02=
:09 +0200)

----------------------------------------------------------------
This pull request contains a bugfix and silent a fallthru warning.

----------------------------------------------------------------

Philippe Mathieu-Daud=C3=A9 (2):
  hw/block/pflash_cfi01: Add missing DeviceReset() handler
  hw/block/pflash_cfi02: Rewrite a fall through comment

 hw/block/pflash_cfi01.c | 19 +++++++++++++++++++
 hw/block/pflash_cfi02.c |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)

--=20
2.20.1


