Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7C8BC90B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 15:41:45 +0200 (CEST)
Received: from localhost ([::1]:45786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCl4a-0001pJ-7Z
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 09:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51473)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iCk6U-00061u-5T
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:39:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iCk6S-0001sr-Te
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:39:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42740)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iCk6S-0001rk-Lj
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:39:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AAAF810DCC92
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 12:39:35 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76CE360C5D
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 12:39:35 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] NBD patches for 2019-09-24
Date: Tue, 24 Sep 2019 07:39:29 -0500
Message-Id: <20190924123933.10607-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Tue, 24 Sep 2019 12:39:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2f93a3ecdd3bb060bd04f698ccafe66efd9856=
3a:

  Merge remote-tracking branch 'remotes/davidhildenbrand/tags/s390x-tcg-2=
019-09-23' into staging (2019-09-23 15:44:52 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2019-09-24

for you to fetch changes up to 506902c6fa80210b002e30ff33794bfc718b15c6:

  tests: Use iothreads during iotest 223 (2019-09-24 07:30:19 -0500)

----------------------------------------------------------------
nbd patches for 2019-09-05

- Improved error message for plaintext client of encrypted server
- Fix various assertions when -object iothread is in use

----------------------------------------------------------------
Eric Blake (3):
      nbd/client: Add hint when TLS is missing
      nbd: Grab aio context lock in more places
      tests: Use iothreads during iotest 223

Sergio Lopez (1):
      nbd/server: attach client channel to the export's AioContext

 include/block/nbd.h        |  1 +
 blockdev-nbd.c             | 14 ++++++++++++--
 nbd/client.c               |  1 +
 nbd/server.c               | 27 +++++++++++++++++++++++----
 tests/qemu-iotests/223     |  6 ++++--
 tests/qemu-iotests/223.out |  1 +
 tests/qemu-iotests/233.out |  2 ++
 7 files changed, 44 insertions(+), 8 deletions(-)

--=20
2.21.0


