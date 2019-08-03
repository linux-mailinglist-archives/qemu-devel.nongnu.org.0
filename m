Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9C80546
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Aug 2019 10:26:37 +0200 (CEST)
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htpN6-0000Dr-EX
	for lists+qemu-devel@lfdr.de; Sat, 03 Aug 2019 04:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41083)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1htpLz-0007pF-VY
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 04:25:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1htpLy-0006qr-2j
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 04:25:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47592)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1htpLw-0006pb-5S
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 04:25:26 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1810E315C003
 for <qemu-devel@nongnu.org>; Sat,  3 Aug 2019 08:25:23 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FF1A60BF4;
 Sat,  3 Aug 2019 08:25:19 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat,  3 Aug 2019 10:25:16 +0200
Message-Id: <20190803082517.15035-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Sat, 03 Aug 2019 08:25:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/1] EDK2 firmware patches
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9bcf2dfa163f67b0fec6ee0fe88ad5dc5d69dc=
59:

  Merge remote-tracking branch 'remotes/elmarco/tags/slirp-CVE-2019-14378=
-pull-request' into staging (2019-08-02 13:06:03 +0100)

are available in the Git repository at:

  https://gitlab.com/philmd/qemu.git tags/edk2-next-20190803

for you to fetch changes up to 177cd674d6203d3c1a98e170ea56c5a904ac4ce8:

  Makefile: remove DESTDIR from firmware file content (2019-08-03 09:52:3=
2 +0200)

----------------------------------------------------------------
A harmless build-sys patch that fixes a regression affecting Linux
distributions packaging QEMU.

----------------------------------------------------------------

Olaf Hering (1):
  Makefile: remove DESTDIR from firmware file content

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.20.1


