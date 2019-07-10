Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E7563899
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 17:26:43 +0200 (CEST)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hks0w-0006f9-F6
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 11:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43552)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkrwQ-0002oh-0v
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 11:22:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkrwO-0007hf-PW
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 11:22:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50510)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkrwJ-0007cn-UE; Tue, 09 Jul 2019 11:21:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 350823001473;
 Tue,  9 Jul 2019 15:21:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-166.brq.redhat.com [10.40.204.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21EED8491B;
 Tue,  9 Jul 2019 15:21:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 17:21:44 +0200
Message-Id: <20190709152145.21308-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 09 Jul 2019 15:21:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/1] pflash-next patches for hard features freeze
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

The following changes since commit a538626aff7c8934ec47bc6ed41cac5bd1b772=
3c:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20190709' into =
staging (2019-07-09 11:49:26 +0100)

are available in the Git repository at:

  https://gitlab.com/philmd/qemu.git tags/pflash-next-20190709

for you to fetch changes up to 51500d37700904a0ee1ef775a585d871b36f7060:

  Revert "hw/block/pflash_cfi02: Reduce I/O accesses to 16-bit" (2019-07-=
09 17:14:39 +0200)

----------------------------------------------------------------
Restore 32-bit I/O accesses on AMD flashes
(precautionary revert).

----------------------------------------------------------------

Philippe Mathieu-Daud=C3=A9 (1):
  Revert "hw/block/pflash_cfi02: Reduce I/O accesses to 16-bit"

 hw/block/pflash_cfi02.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--=20
2.20.1


