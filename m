Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FAA7CF21
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 22:53:28 +0200 (CEST)
Received: from localhost ([::1]:44522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsvbD-0003YG-Bx
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 16:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34005)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hsvQJ-0003bR-R3
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 16:42:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hsvQI-0005lC-TJ
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 16:42:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38274)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hsvQG-0005ij-Mz; Wed, 31 Jul 2019 16:42:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4AF8B30C585C;
 Wed, 31 Jul 2019 20:42:07 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-122.ams2.redhat.com
 [10.36.116.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40B4F5C207;
 Wed, 31 Jul 2019 20:42:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 31 Jul 2019 22:42:00 +0200
Message-Id: <20190731204203.10732-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 31 Jul 2019 20:42:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/3] iotests: More media change tests
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is motivated by the bug fixed in commit 7cef3d1290
('scsi-cd: Fix inserting read-only media in empty drive'). After the
series is applied, media change is tested for all combinations of
floppy/ide-cd/scsi-cd with -drive/-blockdev and initially empty
drive/inserted media.

Kevin Wolf (3):
  iotests/118: Test media change for scsi-cd
  iotests/118: Create test classes dynamically
  iotests/118: Add -blockdev based tests

 tests/qemu-iotests/118     | 84 +++++++++++++++++++++-----------------
 tests/qemu-iotests/118.out |  4 +-
 2 files changed, 49 insertions(+), 39 deletions(-)

--=20
2.20.1


